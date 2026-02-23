Return-Path: <linux-arm-msm+bounces-93706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0L9kBgVpnGlnGAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93706-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:49:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 701B51783FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 15:49:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 49355300B05B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:47:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 538261EFFA1;
	Mon, 23 Feb 2026 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0SktaM7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307AC1C5D5E;
	Mon, 23 Feb 2026 14:47:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771858042; cv=none; b=a9tD8v5O7RBLQZMDCU2qcHaa45XPmeWMPOPVlkItUbObrOZmvfTZjMsBFuP/VLRCVwKZLDI5gV6shGU/B2MHJ4ueLTPeq2YGgAk2PEfGtUs9uFhuKHV/+M5TTMtm2rSPca1fJdg3OgokMI9dqGN89stR2mIImkWXeZiGpeYCEak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771858042; c=relaxed/simple;
	bh=icV9iyo+h9GaMN5lmtCZ6OdHP8LFkhi8/85F34Tqhzo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t06rd7qb0aZIiEHmGxPifEkEgWxFRlPwz+7Z+/GH3zQ1fa66t+kMDfCYUqT3RLKnHfMh7+5NNk6nk914zgcEl04EY6TPn/kER68esWKNO5NQDXHOlBdNX4lRFc5m+++0pJG9Qglx+x4DcNMoV1yN1bOBP9Ad0nZd3mq52/fAzAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0SktaM7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D936C116C6;
	Mon, 23 Feb 2026 14:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771858042;
	bh=icV9iyo+h9GaMN5lmtCZ6OdHP8LFkhi8/85F34Tqhzo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P0SktaM7k9qCcZICfH7dRkRf37YQTCXaPyqZjP86xsCFcMdyWt3kNR4dMdflrkSXy
	 TXbKd4jd8Ky6hBfsZJk2zV2+Uif05jPqj34qbmwuyvaRRulG3BM5BhiT72IMLGadNd
	 7uCKZ4aALeagR7+wMb3VB/Awsb6U/A9jSe+NO2GuKNlD8F49VniZQ17/C6ZCJcVEnK
	 7Sp0sp0UnyeFzLos3j/YPkgGShMhWjWN1ZPupLocOFTSdIJZO7nPYjzdhaGP5ymTSf
	 awuHVwVS3JOOd5PlJR3uvXdelzngoBFGWbaGGYgZBAd+ja2qvB4oPZnYqPGKLB8+hC
	 5UHv0TeRpIvIQ==
Date: Mon, 23 Feb 2026 20:17:09 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] scsi: ufs: qcom: dt-bindings: Document the Eliza UFS
 controller
Message-ID: <qroy3qzudcgtme4xxo2dy63ay7ojd674ski3njwew5ky7rjw3m@iagzzywq3we2>
References: <20260223-eliza-bindings-ufs-v1-1-c4059596337f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260223-eliza-bindings-ufs-v1-1-c4059596337f@oss.qualcomm.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93706-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 701B51783FE
X-Rspamd-Action: no action

On Mon, Feb 23, 2026 at 04:32:35PM +0200, Abel Vesa wrote:
> Document the UFS Controller on the Eliza Platform.
> 

Could you please include some info about the IP revision, compatibility etc...?

- Mani

> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
> index cea84ab2204f..80550144f932 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
> @@ -15,6 +15,7 @@ select:
>      compatible:
>        contains:
>          enum:
> +          - qcom,eliza-ufshc
>            - qcom,kaanapali-ufshc
>            - qcom,sm8650-ufshc
>            - qcom,sm8750-ufshc
> @@ -25,6 +26,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - qcom,eliza-ufshc
>            - qcom,kaanapali-ufshc
>            - qcom,sm8650-ufshc
>            - qcom,sm8750-ufshc
> 
> ---
> base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
> change-id: 20260221-eliza-bindings-ufs-2aa269f9c72f
> 
> Best regards,
> --  
> Abel Vesa <abel.vesa@oss.qualcomm.com>
> 

-- 
மணிவண்ணன் சதாசிவம்

