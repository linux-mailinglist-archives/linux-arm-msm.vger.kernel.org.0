Return-Path: <linux-arm-msm+bounces-89822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GMBEndycGktYAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 07:30:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CB1A52126
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 07:30:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E6D5F821404
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 11:45:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEC0423A71;
	Tue, 20 Jan 2026 11:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="oexglfcU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC73A40B6C5
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 11:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768909449; cv=none; b=C+HjgrGVPla07g2uMawNUIyv3435yqO21EYgUu6Grk1r4nH0J6Qdv6tre0S/AFKljkrfwB4N2CBz8A44pkj0zPpPmFNFdLhy8NwB9jcw5c63C1lMSz44PEBkpmrbyn1gdScOOA4jHEoUXWtMmpnGO/2O+yOFJeNWVKC3QSQQOJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768909449; c=relaxed/simple;
	bh=TBJAFEXB7pUqai6KjvPDlvSX7uwXO1rTYHITS5eD3hw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XmR0vS1px1DI5C4UJfRGaB9ZJYTCe7xwU3W4gxOOcWJpHFCtB3WfTI13kJvM32yve+CYUX9eeNY69xZgpbDPrxiowV7ccOdVbfKP7DkJgzBN93E0gr/1XRnX7QBtEHIKKJDJfhVh29hAuikivcxGKD4DTZku14bCPAfT1C+vWEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=oexglfcU; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Message-ID: <2b532215-e530-4b9e-900a-e67c70d5e19e@packett.cool>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1768909433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bDuc7hpOHRtcWQi6aDzHf441wxFw1bVpR1pKewUL+B4=;
	b=oexglfcUQJ8rzRrPCaBIilEBWD7mxtWFrEZE4BVemsL9LrKn+bwz1ggMRRfzlVp/9JKkfm
	cpQTe0/p74VpijdQmMp49PAQSsST7Uyj9eyHp2+yR1cChLsXEbXvaoxurIFi05dUvP8FzG
	scw93zDGGAf99aqxfhq4UQ4ekcfM07XemA+yyZahW/6VQdo4Sj+V0O16Zb4a8Ql+ThTu2O
	2xW1MrBzuuFDRFDF6CSv76ILCEzxiG9ScNiC3GjSwRV6XY4oIXR4QcPTeaLxFUQnKzErEQ
	DPvj6SZqO9zRpVN06kZ7aBegrPbkdNey/tow5KlnmufS49a08HnIoHTdR4nUFg==
Date: Tue, 20 Jan 2026 08:43:42 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH 0/3] SC7180 MDSS core reset
To: Konrad Dybcio <konradybcio@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
 cros-qcom-dts-watchers@chromium.org, Kalyan Thota
 <quic_kalyant@quicinc.com>, Douglas Anderson <dianders@chromium.org>,
 Harigovindan P <harigovi@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Val Packett <val@packett.cool>
In-Reply-To: <20260120-topic-7180_dispcc_bcr-v1-0-0b1b442156c3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[packett.cool:s=key1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89822-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[packett.cool,quarantine];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[packett.cool:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[val@packett.cool,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,packett.cool:email,packett.cool:dkim,packett.cool:mid]
X-Rspamd-Queue-Id: 5CB1A52126
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 1/20/26 8:19 AM, Konrad Dybcio wrote:
> Add the missing reset for the display subsystem and wire it up, so that
> drivers can consume it.
>
> Compile-tested only.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

Thanks!

Tested-by: Val Packett <val@packett.cool> # sc7180-ecs-liva-qc710

Might be worth noting in the commit message that the real world issue 
this solves is that after probing the driver, the DPU would keep trying 
to access the physical address that belonged to the EFI framebuffer, 
causing constant IOMMU faults and visual glitches on the display output.

~val

P.S. what a coincidence that just a week ago this was discussed for 
sdm845 
https://lore.kernel.org/all/bfe55d1b-1b45-4187-84fe-9475cb90b00a@linaro.org/


