Return-Path: <linux-arm-msm+bounces-94497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKvJBvvMoWn3wQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:57:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AEDFD1BB176
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 17:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DE74F303289E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 16:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3C1134EEEC;
	Fri, 27 Feb 2026 16:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FxkH39tu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02AD348452;
	Fri, 27 Feb 2026 16:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772211446; cv=none; b=NWVFjxi/mk+A9X9Uq7UZASuWvz1BUHn18gLpGL3TGyzpCsGgryAY/7ZyOi/UB+ZcMzixK1IMxM9gNf4Ny6SkywlFlLG1pNgi0iGl9ZtH0/ma6P5TSI93fHU1T+tmqecPz/WLJr10Vy/VEm8nQ5YekUfPok7ywTUWV48MVcWwzlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772211446; c=relaxed/simple;
	bh=YaAGaUWYb4yFijxgt+6ck3PmrcCbR3kRSfqJVEaGCuQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=tyHS1TUWGfwgURlR1hzJa2Oix9H1EZcZmkwP3N4EwmeJt5nAjeX962LUmPGR8zmSSvIECtRGJa4KOXiEBtg4tB9HJdCVobGAaPswml/lAsRyOcdx9C/Cg7b/0gir7IrWgyNnW4XxiVY6FXiqXi0n3qplxtjExQNtFqT2exC3gcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FxkH39tu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D4CFC116C6;
	Fri, 27 Feb 2026 16:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772211446;
	bh=YaAGaUWYb4yFijxgt+6ck3PmrcCbR3kRSfqJVEaGCuQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=FxkH39tuG5VpcSKWV0HyWM7ZzZZk6wNfJeN447Ssrpq6XReCkqMOj9f/2SBnAtFvi
	 oXOWjo8Drnny+jTFklpXwOyV2QnbFJ4RVV71iXopL2mDifysDc85DgTVV94sPAiAoZ
	 B/Cs+kECZ1GXQ9clGPv/ANf7zRq6mV5wdKkhWzRzrgv+Q6gb0bFYlR0nN00i9XrWMM
	 W/wugxJXRiiQLtozYNZoLXJ2ivXZknN8JFGRbxzxi1Ze/kAAbOcXiNMgm/CC7deiJ2
	 ubYf9zGPVaE9Kej8l1LaNxif16cO3hsQ3kyoF28+ekD5OHphNTVHE4H3AzKMpK1qdr
	 o471mq5LErfsw==
Date: Fri, 27 Feb 2026 10:57:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: David Airlie <airlied@gmail.com>, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, stable@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jessica Zhang <jesszhan0024@gmail.com>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Abel Vesa <abelvesa@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Sean Paul <sean@poorly.run>, 
 linux-arm-msm@vger.kernel.org, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
In-Reply-To: <20260227-glymur-fix-dp-bindings-reg-clocks-v1-1-99f7b42b43aa@oss.qualcomm.com>
References: <20260227-glymur-fix-dp-bindings-reg-clocks-v1-1-99f7b42b43aa@oss.qualcomm.com>
Message-Id: <177221144530.237949.10314173375793939491.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: msm: Fix reg ranges and clocks
 on Glymur
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,lists.freedesktop.org,somainline.org,kernel.org,quicinc.com,oss.qualcomm.com,linux.dev,suse.de,poorly.run,ffwll.ch,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-94497-lists,linux-arm-msm=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email]
X-Rspamd-Queue-Id: AEDFD1BB176
X-Rspamd-Action: no action


On Fri, 27 Feb 2026 16:23:00 +0200, Abel Vesa wrote:
> The Glymur platform has four DisplayPort controllers. All the
> controllers support four streams (MST). However, the first three only
> have two streams wired up physically to the display subsystem, while the
> fourth controller has only one stream (SST).
> 
> So add a dedicated clause for Glymur compatible to enforce reg ranges to
> describing all four streams while allowing either one pixel clock, for the
> third DP controller, or two pixel clocks, for the rest of them.
> 
> Cc: stable@vger.kernel.org # v6.19
> Fixes: 8f63bf908213 ("dt-bindings: display: msm: Document the Glymur DiplayPort controller")
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml         | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,glymur-mdss.example.dtb: displayport-controller@ae90000 (qcom,glymur-dp): reg: [[183042048, 512], [183042560, 512], [183043072, 1536], [183046144, 1024], [183047168, 1024]] is too short
	from schema $id: http://devicetree.org/schemas/display/msm/dp-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260227-glymur-fix-dp-bindings-reg-clocks-v1-1-99f7b42b43aa@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


