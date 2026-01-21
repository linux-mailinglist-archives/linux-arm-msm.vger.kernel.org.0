Return-Path: <linux-arm-msm+bounces-90010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIrWG6XGcGkNZwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90010-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:29:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E11B456C5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:29:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9A5189C4A6E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 12:23:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1754B48032D;
	Wed, 21 Jan 2026 12:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b="FDjSf5/9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from box.trvn.ru (box.trvn.ru [45.141.101.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6789A3ACA6B;
	Wed, 21 Jan 2026 12:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.141.101.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768998167; cv=none; b=hUMwI76Iz7EdDsppeOFBi3LD2BlKY4eqJ2e05AkMmhYktKQJASvPz7PgnEZM6/eCVKIMw+bBKckjqWlfyBOmHr3g2glFnmNJWJpS08zMznDTWVR1Wd4AzwXUfJEku/QDRkIvDlLWJlw7w9hYZdTgU515pG9gfXC6KdF9PB90nag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768998167; c=relaxed/simple;
	bh=B64XqHb0oVPQWEXKYQIWHeIvouUQHv7heMgcEaAUGmQ=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=iar/JRoUSjD4iSwhMtg+z2r3U38Dbvm3NSvFhRFf0lRqVqijvnw9YSns41Zh/vF5tnyaIIIO2i8OsRpqpu0V8uCGLLvomSRNasLDTE/wVtIq8bdMZG7Fn0KWy+vkrHawGSgpDuBhlXwfeY2YpXMFqLjxDhOd2HEX+ugO4IwDYHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru; spf=pass smtp.mailfrom=trvn.ru; dkim=pass (2048-bit key) header.d=trvn.ru header.i=@trvn.ru header.b=FDjSf5/9; arc=none smtp.client-ip=45.141.101.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trvn.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trvn.ru
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=trvn.ru; s=mail;
	t=1768997761; bh=B64XqHb0oVPQWEXKYQIWHeIvouUQHv7heMgcEaAUGmQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=FDjSf5/9ZudvSKdXmpn87FAerZd6LulSBkQGqz89ibvdKrAwGE2GykP8lLDxHifRc
	 1ljVr7btqN2xP5Fo5N+Wezm6Nw1ZvAHxczJcLJ6cNim0dJpehQfXr9P2allEsbPKm8
	 DcQD5msufBqq5FW7exIUBk1YZwgfndEFvrIoQ3ni58T8LWAxMsq3Q3QY2qWlRy5Mbu
	 xpFgGYdgrbDJfXp1Uw1lY/raQMUve2+RF7+u0TzEk3QWDIqe288B8UGg3+lVMP2BxN
	 J1IR1em8DJecPtvKCxNTMM9Eu1s+G3AUAE8FN19os/E7fxjJe7pCSHRXt20i5ydBpX
	 LiPefQ0mJDGwQ==
Received: from authenticated-user (box.trvn.ru [45.141.101.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by box.trvn.ru (Postfix) with ESMTPSA id 7FADB69760;
	Wed, 21 Jan 2026 17:16:01 +0500 (+05)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Wed, 21 Jan 2026 17:16:01 +0500
From: Nikita Travkin <nikita@trvn.ru>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Val Packett <val@packett.cool>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org, Dmitry Baryshkov
 <dmitry.baryshkov@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: Add support for ECS LIVA QC710
In-Reply-To: <c706c227-6f3c-42a5-95bd-9ac739d2fa16@oss.qualcomm.com>
References: <20260120234029.419825-2-val@packett.cool>
 <20260120234029.419825-10-val@packett.cool>
 <c706c227-6f3c-42a5-95bd-9ac739d2fa16@oss.qualcomm.com>
Message-ID: <376b932a192d0070b4435542fae62178@trvn.ru>
X-Sender: nikita@trvn.ru
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[trvn.ru:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90010-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[trvn.ru,quarantine];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[trvn.ru:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nikita@trvn.ru,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,trvn.ru:mid,trvn.ru:dkim]
X-Rspamd-Queue-Id: E11B456C5C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Konrad Dybcio писал(а) 21.01.2026 16:20:
> On 1/21/26 12:30 AM, Val Packett wrote:
>> Add a device tree for the ECS LIVA QC710 (Snapdragon 7c) mini PC/devkit.
>> 
>> Working:
>> - Wi-Fi (wcn3990 hw1.0)
>> - Bluetooth
>> - USB Type-A (USB3 and USB2)
>> - Ethernet (over USB2)
>> - HDMI Display
>> - eMMC
>> - SDHC (microSD slot)
>> 
>> Not included:
>> - HDMI Audio
>> - EC (IT8987)
>> 
>> Signed-off-by: Val Packett <val@packett.cool>
>> ---
> 
> [...]
>> +&tlmm {
>> +	/*
>> +	 * The TZ seem to protect those because some boards can have
>> +	 * fingerprint sensor connected to this range. Not connected
>> +	 * on this board
>> +	 */
>> +	gpio-reserved-ranges = <58 5>;
> 
> Would it still work with <59 4>? 58 seems to not be related to a QUP,
> rather as an audio MCLK output (would that be why +Nikita couldn't get
> some sort of audio working on his aspire1? That DT has it reserved too)
> 

FWIW according to aspire1 schematic GPIO 57 is codec mclk (which is
implemented and works perfectly, only DMIC connected to the soc
instead of said codec is broken); GPIO 58~62 are NC with a note
"Finger Printer" [sic] near them. There is no bracket annotation to
associate the note to specific pin range, but it's smack in the
middle of 58~62 range and from the fact that 63 (speaker amp bclk)
and pretty much every other pin later is also used, I guessed all 5
are actually reserved. It's possible that one of them is not
actually reserved by the firmware but probably not the source of
aspire1 issues (the dmic is connected to lpass tlmm anyway) or
perhaps they reserved 58 to be an interrupt input for the fp, or
something like that...

Nikita

> [...]
> 
>> +		data-pins {
>> +			pins = "sdc1_data";
>> +			drive-strength = <2>;
>> +			bias-pull-up;
> 
> here you do:
> 
> drive-strength
> bias-
> 
> [...]
> 
>> +	sdc2_default: sdc2-default-state {
>> +		clk-pins {
>> +			pins = "sdc2_clk";
>> +			bias-disable;
>> +			drive-strength = <16>;
>> +		};
> 
> here you do the inverse
> 
> (the former is preferred/more common)
> 
> otherwise
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Konrad

