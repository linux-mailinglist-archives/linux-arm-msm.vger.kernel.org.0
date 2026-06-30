Return-Path: <linux-arm-msm+bounces-115520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AxoDEjUARGqRnAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115520-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:43:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CCB6E6FF2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 19:43:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=BEl7IIMu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115520-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115520-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1A192301464C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 17:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3F843DCD8F;
	Tue, 30 Jun 2026 17:41:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A402D29B78B;
	Tue, 30 Jun 2026 17:41:37 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782841298; cv=none; b=s72scZdnuWPb2xGT+6brY9XnDRZkNcy/0vjva5IGrBT2bViXFdcrWaBySC9nGMIXbiPefKA1SdPUcrZGTLx2M+8YZxqNOOb0Zp0QLydtxst1uEaK/jtwBjMuEXfpbjpQsMvFxxrPc0ZhSYJsWyasxYU8QJKWCYCNTrpPGzI/t3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782841298; c=relaxed/simple;
	bh=7etjsaTTGVz3MLkhX5I1xB14qcjJmoJHvrsKoUBG60M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=poEnMxz13RoJyxCBWPMhA8uRqZdxVpFh8Ta4/8W6aP/u1jBQPm0zon7pgPJScjYdnEC8cYiecczE4W2ETsJDnLl6hQk5+suNpiymDy8H+sP+e6G8Ps4BNr7TwEbuCH495FdMoTDHzygVnqSamKnfP+q4CqoCAFVXNtxUl008+/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BEl7IIMu; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25F001F000E9;
	Tue, 30 Jun 2026 17:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782841297;
	bh=9sqK9XNlmuYukWWEvxI9I5lAhBvud4djFlqzseQ6qsQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BEl7IIMuhuVsquoGPJb4qOjmiRFI/GjgT9TjWsmg7mdOODJZ4vHG5s6S3Cy1jgNTk
	 gH3ed75ZVI3GAe4XRJnxKiXBwFSP3QDfm5iJ/J3/9wb4aTV8EOErPI4Uv+pSIoFBHp
	 PpxeYDpPWl4OP/CFsfycrK9bZUFZww8YbGnqev76r62/87uUtxoi3xelrp/ScK2JDp
	 J4X1rBFCAk0G3w5waa2HHpmO2kMbqmJZmiTRj4IWAzax/W/ijEQ7Xgn+fGsBYuHh+R
	 kNcOFz2Bw9APCOSE/McAW4qRbh3+hNfNjifK1+HFE+ECRXHmEUg+tanOt9eni4kgJH
	 5A4fZtGjSThPg==
Date: Tue, 30 Jun 2026 12:41:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: aiqun.yu@oss.qualcomm.com, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	tingwei.zhang@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
	trilok.soni@oss.qualcomm.com,
	"David S. Miller" <davem@davemloft.net>,
	Vinod Koul <vkoul@kernel.org>, linux-crypto@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: crypto: qcom,inline-crypto-engine:
 Document Maili ICE
Message-ID: <178284129608.4118791.8314319261114374881.robh@kernel.org>
References: <20260628-maili-crypto-v2-0-f8ce760f71d6@oss.qualcomm.com>
 <20260628-maili-crypto-v2-2-f8ce760f71d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628-maili-crypto-v2-2-f8ce760f71d6@oss.qualcomm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115520-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jingyi.wang@oss.qualcomm.com,m:aiqun.yu@oss.qualcomm.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:davem@davemloft.net,m:vkoul@kernel.org,m:linux-crypto@vger.kernel.org,m:herbert@gondor.apana.org.au,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andersson@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C7CCB6E6FF2


On Sun, 28 Jun 2026 23:44:36 -0700, Jingyi Wang wrote:
> The Inline Crypto Engine found on Maili SoC is compatible with the common
> baseline IP 'qcom,inline-crypto-engine' and requires the UFS_PHY_GDSC
> power-domain and iface clock. Hence, document the compatible as such.
> 
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/crypto/qcom,inline-crypto-engine.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


