Return-Path: <linux-arm-msm+bounces-108331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uOjMBST7C2r2SwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:54:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ADD3F577A0C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 07:54:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id F1E213024FB6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 05:54:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E602355F46;
	Tue, 19 May 2026 05:54:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uUM4jbxC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F8235BDB2;
	Tue, 19 May 2026 05:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779170077; cv=none; b=a2tn6XqEmvTPqAEJh1i4BWR4hftDYyQvFY6am5zxZYzrxQTgQh70GNC8Nj9gfd7wATX/sqnNSJxvFDMm78//y78G2nOWGkL99lANnfIuQSQFanrGDHPGQOv6sjddIgTqvqr/wTitS8jmGWtyI5Q0jFIajSkl2DDX1n0xrRdH+QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779170077; c=relaxed/simple;
	bh=9GXtTAUKjC8yFJM1OpFqMKYuZGvD2bBJJa3k5I/WQvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L3E3QJP1YwCpMWDnGJE8vwiL4gDIULYBbhIvRyIypNCShtZ0C6EbFx1gRucH5sRdqRnav/wSU6f95vOIpw/MeqdX3K+zsKthJU0oXsMAHNwUFcrMjhETH0iZMYrK723tbbMmI2Mkn2Da2L2AYyxmIZRdB3VoVjHwHrREHfsmCug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uUM4jbxC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4170BC2BCB3;
	Tue, 19 May 2026 05:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779170076;
	bh=9GXtTAUKjC8yFJM1OpFqMKYuZGvD2bBJJa3k5I/WQvA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uUM4jbxCjhY6UU6USI1M35xrK4r49GjEOuABe0w9zuIDJL7hrU0NLFTIgS8hnQJ3g
	 B7D9HeIpUNenL6UXDDcIqY3kaOjSBD2wf3d7ULeYYPViaA8dR7vc6RyYwNTDqlL0EE
	 G4+Qgrc8vVyofgDZ5BwaSK+x77YMSgh0+r/Jnb3JPIOE/VxnvCwYmEJ4pMmobtVdhB
	 7Z5drBdHfHPSNGNm83+VQdVZS78JaTTcMxlMss3ASYS56PQC8z4ZtoVqK7jxGaCTnx
	 rlOc+96msoapW8czxnYtZse09ZnPS0hLoywZiZ3TMPq0yXkEaBlLcQFyoaRNIA5rzy
	 IS+7XZlFNXBrw==
Date: Tue, 19 May 2026 11:24:27 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: palash.kambar@oss.qualcomm.com
Cc: vkoul@kernel.org, neil.armstrong@linaro.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com, 
	avri.altman@wdc.com, bvanassche@acm.org, andersson@kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, abel.vesa@oss.qualcomm.com, luca.weiss@fairphone.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH V1 2/3] dt-bindings: phy: qcom,sc8280xp-qmp-ufs-phy:
 Document the Hawi UFS controller
Message-ID: <yoh53w5anjjfb6d3zdsh54whlnhkw4lwg3v273qmj74u5k6sp2@vu33qv6dxyas>
References: <20260518165346.1732548-1-palash.kambar@oss.qualcomm.com>
 <20260518165346.1732548-3-palash.kambar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260518165346.1732548-3-palash.kambar@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108331-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: ADD3F577A0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, May 18, 2026 at 10:23:45PM +0530, palash.kambar@oss.qualcomm.com wrote:
> From: Palash Kambar <palash.kambar@oss.qualcomm.com>
> 

Subject is wrong. It should be:

scsi: ufs: qcom: dt-bindings:

- Mani

> Document the UFS Controller on the Hawi Platform.
> 
> Signed-off-by: Palash Kambar <palash.kambar@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
> index f28641c6e68f..3de00affa4c6 100644
> --- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
> +++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
> @@ -16,6 +16,7 @@ select:
>        contains:
>          enum:
>            - qcom,eliza-ufshc
> +          - qcom,hawi-ufshc
>            - qcom,kaanapali-ufshc
>            - qcom,sm8650-ufshc
>            - qcom,sm8750-ufshc
> @@ -27,6 +28,7 @@ properties:
>      items:
>        - enum:
>            - qcom,eliza-ufshc
> +          - qcom,hawi-ufshc
>            - qcom,kaanapali-ufshc
>            - qcom,sm8650-ufshc
>            - qcom,sm8750-ufshc
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

