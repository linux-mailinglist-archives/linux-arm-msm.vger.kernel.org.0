Return-Path: <linux-arm-msm+bounces-100395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ORjIvnDxmm8OQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:52:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 316FF348A9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 18:52:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6069C3055FDE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 17:52:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E46583FF891;
	Fri, 27 Mar 2026 17:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EcByUmB/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF236371CFE;
	Fri, 27 Mar 2026 17:52:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633920; cv=none; b=uBCJSqcthDFLmjIaRmPsznOjtkg5scuoX9N8op05nTbw6HpTq44t5bo/ykgzlfe1LXW4Pqeqpk0WHYPvBGYIw2RujNmpNKeTDydK4I+Dl9Rgb8FxrjAyDp6ntbYitJ8cxDHvifCGuSGaQ0ttaHUapfxMj1qO5cvCN+WuHInh96Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633920; c=relaxed/simple;
	bh=zRvA02n55H6F0ORN5r8qynowYTw/58ttft03ZFRvRRY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=j+1PltPrmk+R3u9fMLQB1Wwr5eLkmXI9lmuCe6NMY5CgqRT2FZxxI97YPwdmp4gGQ6tToLDC0RwB/pNB6U1JNI1+5CU8uDer4t93vzmtNoLrutyhIXpvkmJGbmnw+5nqXvbDKMucxjyk6bLvHV3lfBnck/I3DSUcMULyvaz5lgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EcByUmB/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7103C19423;
	Fri, 27 Mar 2026 17:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774633920;
	bh=zRvA02n55H6F0ORN5r8qynowYTw/58ttft03ZFRvRRY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=EcByUmB/fhOaTUDVp1b/zq+k+LRyAaNVR6S4h9vSV8N/eofFsVaZC/p4h1A+jJNP3
	 9rEIsTsYK+kG24THax9IbEikcfE3m5NRFmdwk6T8NP03bthRsa4BivZIuRjA2w8HGC
	 cpBkb9abwr1Gxl6Wq0l2GFOxGRV39Z38P8Kew4q4FfPiuIvQK4eix5y07qCdOTZwTi
	 lV4jmMWLqLErykoYKx78LUDOR7m3IxaBklGXU4Ej6Oeqwky7u2vdxYuTSqraAwgtpu
	 6bXPg7JymaoTujsQjn2Zlg9PlLyOKbXSMSYxnxxsJvbNCL9LwQ5qIXzLPNBDR2RSQP
	 Ov6vM4Kz7prBQ==
Date: Fri, 27 Mar 2026 12:51:57 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Jonathan Marek <jonathan@marek.ca>, Konrad Dybcio <konradybcio@kernel.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, devicetree@vger.kernel.org, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Conor Dooley <conor+dt@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Alexander Koskovich <akoskovich@pm.me>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Luca Weiss <luca.weiss@fairphone.com>
In-Reply-To: <20260327-milos-mdss-v2-4-bc586683f5ca@fairphone.com>
References: <20260327-milos-mdss-v2-0-bc586683f5ca@fairphone.com>
 <20260327-milos-mdss-v2-4-bc586683f5ca@fairphone.com>
Message-Id: <177463391769.3232558.4643402365403400713.robh@kernel.org>
Subject: Re: [PATCH v2 4/9] dt-bindings: display: msm: document the Milos
 Mobile Display Subsystem
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[ffwll.ch,vger.kernel.org,kernel.org,somainline.org,marek.ca,quicinc.com,lists.sr.ht,poorly.run,linux.dev,gmail.com,linaro.org,linux.intel.com,oss.qualcomm.com,lists.freedesktop.org,pm.me,suse.de];
	TAGGED_FROM(0.00)[bounces-100395-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robh@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 316FF348A9F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On Fri, 27 Mar 2026 17:12:23 +0100, Luca Weiss wrote:
> Document the Mobile Display Subsystem (MDSS) on the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  .../bindings/display/msm/qcom,milos-mdss.yaml      | 283 +++++++++++++++++++++
>  1 file changed, 283 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:36.31-51 Unexpected 'DISP_CC_MDSS_AHB_CLK'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:37.28-47 Unexpected 'GCC_DISP_HF_AXI_CLK'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:38.31-51 Unexpected 'DISP_CC_MDSS_MDP_CLK'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:40.31-52 Unexpected 'DISP_CC_MDSS_CORE_BCR'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:42.42-61 Unexpected 'QCOM_ICC_TAG_ALWAYS'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:43.41-60 Unexpected 'QCOM_ICC_TAG_ALWAYS'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:44.41-65 Unexpected 'QCOM_ICC_TAG_ACTIVE_ONLY'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:45.43-67 Unexpected 'QCOM_ICC_TAG_ACTIVE_ONLY'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:49.38-60 Unexpected 'DISP_CC_MDSS_CORE_GDSC'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:69.32-51 Unexpected 'GCC_DISP_HF_AXI_CLK'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:70.35-55 Unexpected 'DISP_CC_MDSS_AHB_CLK'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:71.35-59 Unexpected 'DISP_CC_MDSS_MDP_LUT_CLK'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:72.35-55 Unexpected 'DISP_CC_MDSS_MDP_CLK'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:73.35-57 Unexpected 'DISP_CC_MDSS_VSYNC_CLK'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:80.44-66 Unexpected 'DISP_CC_MDSS_VSYNC_CLK'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:142.35-57 Unexpected 'DISP_CC_MDSS_BYTE0_CLK'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:143.35-62 Unexpected 'DISP_CC_MDSS_BYTE0_INTF_CLK'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:144.35-57 Unexpected 'DISP_CC_MDSS_PCLK0_CLK'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:145.35-56 Unexpected 'DISP_CC_MDSS_ESC0_CLK'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:146.35-55 Unexpected 'DISP_CC_MDSS_AHB_CLK'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:147.32-51 Unexpected 'GCC_DISP_HF_AXI_CLK'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:155.44-70 Unexpected 'DISP_CC_MDSS_BYTE0_CLK_SRC'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:156.44-70 Unexpected 'DISP_CC_MDSS_PCLK0_CLK_SRC'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:157.58-74 Unexpected 'DSI_BYTE_PLL_CLK'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:158.58-75 Unexpected 'DSI_PIXEL_PLL_CLK'
Lexical error: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dts:219.35-55 Unexpected 'DISP_CC_MDSS_AHB_CLK'
FATAL ERROR: Syntax error parsing input tree
make[2]: *** [scripts/Makefile.dtbs:140: Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1614: dt_binding_check] Error 2
make: *** [Makefile:248: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260327-milos-mdss-v2-4-bc586683f5ca@fairphone.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


