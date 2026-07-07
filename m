Return-Path: <linux-arm-msm+bounces-117066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qplQNh5WTGowjQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:27:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7D8716928
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 03:27:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=I2qgSrNx;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117066-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117066-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0977E30342A1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 01:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA68030ACF6;
	Tue,  7 Jul 2026 01:27:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E5B2FFDE3;
	Tue,  7 Jul 2026 01:27:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783387657; cv=none; b=fSq1IMimmvctK/TXUrMzXfn3XtdsXTiJhTZnBCMa8TTAFDhSb1lruEmssWIifdTtOAM4/aDozAd5DIgG0lQFwztZcSx4dSMgjT2WFX2iCIUjw1bSzsebMFV6UCv+wWYv/7SeMH/BEzaeczZ72n98zi0eJlz72GYfvkJ0nfYHyp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783387657; c=relaxed/simple;
	bh=kni8+lO6N5E+laA2Hc7bOfG/j+KSwOIEn96kfYxITo0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AkQYPDClgLYnlBXH2ZfVOn2pmpdRfU8mirBl45gdlMspbNNc3QOtIxPpskF2LrUiFTrvuoRG59fVA8Fiq9vivbCjNrXJjw1almzRScX9Qou8qehXEyZbx3o8r+dIaOMfveEX9PoG8aFjcMkbH4HZk22yTdRhObNH2LNFEo50Fng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2qgSrNx; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61D501F00A3E;
	Tue,  7 Jul 2026 01:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783387656;
	bh=HCkOFf4noYW2Oi5lHGy48ez1wOQdlsBhJaJd+daqKMk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I2qgSrNxmAmxs5jjRrLocOuSldR/GJR5DwPDZzKF2RF/lpjp7VJcXAElLHi82IYfj
	 ruzruuIIHCo38VusAgn1MmnhL97FnlwHdMJfiX2wL1atyARDBAFllFCgP2+dVo6lAx
	 9pxSaFrCOU4pxljyVge1fxBfKFVlS8kM+7yR7+FnGJ71dXfRKwJWU+oCa4UINRwZlU
	 4E9Mu11XRQVUnyF1he9iMk9TWdVQ+f6gYrcT/P5V9Or4roPf7D6UqRdxOGQgK43xb2
	 ahuDto+QOPDQctFR57UWQxVaa96lfQ48RhGcsNXyXXWLJbMwcZPReSIvWJ7UiMpWTb
	 7i4+A4BuF1cxg==
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Jason A. Donenfeld" <Jason@zx2c4.com>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Vincent Huang <vincent.huang@tw.synaptics.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	phone-devel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/2] Introduce OnePlus 6/6T touchscreen compatible
Date: Mon,  6 Jul 2026 20:27:18 -0500
Message-ID: <178338764545.1558388.7968899731538373474.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260523-synaptics-rmi4-dt-v2-0-0645122babdc@ixit.cz>
References: <20260523-synaptics-rmi4-dt-v2-0-0645122babdc@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Jason@zx2c4.com,m:matthias.schiffer@ew.tq-group.com,m:vincent.huang@tw.synaptics.com,m:konradybcio@kernel.org,m:david@ixit.cz,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:phone-devel@vger.kernel.org,m:krzk@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,zx2c4.com,ew.tq-group.com,tw.synaptics.com,ixit.cz];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-117066-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[codeberg.org:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6B7D8716928


On Sat, 23 May 2026 11:45:33 +0200, David Heidelberg wrote:
> Mostly related to the
>   https://codeberg.org/sdm845/linux/commits/branch/b4/synaptics-rmi4
> series, but independent on other changes which I trying to upstream for
> more than one year.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: sdm845-oneplus: Update compatible to include model
      commit: cc8748ed4da16233d5b3f27e86a412a991645aed

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

