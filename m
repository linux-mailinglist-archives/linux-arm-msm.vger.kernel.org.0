Return-Path: <linux-arm-msm+bounces-99550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OBRyLQMJwmliZAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:46:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC15301CF8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:46:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9CEDF301BABC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:46:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3A43A1A5C;
	Tue, 24 Mar 2026 03:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AXOcCt+5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFB41459FA;
	Tue, 24 Mar 2026 03:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323966; cv=none; b=j+XEjl4YN0yM1R/8akV+GW7Qxp63WyXBIoydMplAuNgH/mSaQuuDhmbwLVYnOLZKu6/sp5sNKa5GF6eEuG/fdDgoFtFtlrwrXv0snOaTSTsp4jrUVcQyW8PcYT0jG0jitIVRk61yynB3Ber1mwAvUhozXHuj6TDl6cmYbgHiHYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323966; c=relaxed/simple;
	bh=Q3QJs+Y+iu4ToxJAYkvQKBefuiR+iwODa4P0n7YoXKs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kEsAfReacda5tWCsUaW8BPcYXQ6KDjp7koOcbFvaeqwKsJ7syq1u+xybRBKrsYFJZcqYQGOm3D1+KnmcqMhEcHK91lpMPgIoqUGfh+X2St52ncSvG/oRGIaPFco+1Z1t/y9yzcCIX+2Ph3Fiby+cuiJIERm6X6MV2mnZ8BjHIXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AXOcCt+5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01F9CC19424;
	Tue, 24 Mar 2026 03:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774323966;
	bh=Q3QJs+Y+iu4ToxJAYkvQKBefuiR+iwODa4P0n7YoXKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AXOcCt+5Vpk2YX0np7goO+WF09MjHNjFgrTEqjowY74CzNyqNCrShKq+/gH4yGAYv
	 hLavYxlDAt6dxF7qZLEsO65A7oCJDTOEOV7kkVC2LMoq0KYXuvLtV95C/Eurn8G9JL
	 TITkl3N9ZPwWjw7KtJaQ0kia8D6FhNvnafnTpKyY8YXLvyJsQfWaiG/ewwZytllN6W
	 ICpCjJI8DUD+7psYuPGkliogjF/m078YgPCEO/CpOTBOZ1n3cFDSStxuM45aHW+83X
	 XKPpMmfy7MZZEpNxUePsG5k5fjaATBpxCCaNoFu9RSMDgYjvgJTSF+mN9+hpOFTHOa
	 f1oEc6kLEPemA==
Date: Mon, 23 Mar 2026 22:46:02 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, Rocky Liao <quic_rjliao@quicinc.com>, 
	Bartosz Golaszewski <brgl@kernel.org>, Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, 
	linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v3 01/10] dt-bindings: net: bluetooth: qualcomm: Fix
 WCN6855 regulator names
Message-ID: <acIIwsJhNVOKPziT@baldur>
References: <20260225-topic-wcn6855_pmu_dtbdings-v3-0-576ec5c4e631@oss.qualcomm.com>
 <20260225-topic-wcn6855_pmu_dtbdings-v3-1-576ec5c4e631@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225-topic-wcn6855_pmu_dtbdings-v3-1-576ec5c4e631@oss.qualcomm.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99550-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[21];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,bgdev.pl,holtmann.org,gmail.com,kernel.org,quicinc.com,intel.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andersson@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5CC15301CF8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Feb 25, 2026 at 01:23:21PM +0100, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Commit 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description
> closer to reality for wcn6855") changed the vddrfa1p7-supply to 1p8
> for whatever reason.
> 
> The schematics footprint for this chip definitely says 7 on the input
> leg and the driver still expects 1p7. Bring it back.
> 

@Marcel, can you merge this binding, or would you prefer that I do it
together with the dts changes?

Regards,
Bjorn

> Fixes: 5f4f954bba12 ("dt-bindings: bluetooth: bring the HW description closer to reality for wcn6855")
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml         | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
> index 45630067d3c8..0beda26ae8bb 100644
> --- a/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
> +++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,wcn6855-bt.yaml
> @@ -50,9 +50,6 @@ properties:
>      description: VDD_RFA_1P7 supply regulator handle
>      deprecated: true
>  
> -  vddrfa1p8-supply:
> -    description: VDD_RFA_1P8 supply regulator handle
> -
>    vddrfacmn-supply:
>      description: VDD_RFA_CMN supply regulator handle
>  
> @@ -68,7 +65,7 @@ required:
>    - vddbtcmx-supply
>    - vddrfa0p8-supply
>    - vddrfa1p2-supply
> -  - vddrfa1p8-supply
> +  - vddrfa1p7-supply
>    - vddrfacmn-supply
>    - vddwlcx-supply
>    - vddwlmx-supply
> @@ -91,7 +88,7 @@ examples:
>              vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
>              vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
>              vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> -            vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
> +            vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
>              vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
>              vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
>              vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
> 
> -- 
> 2.53.0
> 

