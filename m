Return-Path: <linux-arm-msm+bounces-85220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 571D4CBD306
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 10:36:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4F15D301D5BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Dec 2025 09:36:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ADC9532ABC6;
	Mon, 15 Dec 2025 09:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WQ4nhYsj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D318314D24;
	Mon, 15 Dec 2025 09:36:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791376; cv=none; b=NaSnv6zVQjNOgWiUKRc8HbcZYuXaKcPf8jtrQAkVwjCszLNux4DhY73wj3K7FUx/Xk7EDOKMtqFTDR+p/vuuL8RpOLaV9MS5gH9eL3D4qgO868PMnTSUpCnb9yVKmKbVhtF3Fh1qO8BovS73WZTAH4Hglhs9kbthTmcrmcd5Ecg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791376; c=relaxed/simple;
	bh=dSLpxiL1aXMnJwyx4tEHeVx1Cgit3eOzv1//IzQcCEo=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=CFwv/MqJ7afQ/IQM/6W7t+YM0WuTWMKTSga3UGvrcYfe3DWjAkRZ8rud1BUiOI5MQUfM7BW/fLvI0Z2oBnevUYSTVB9WxcEkjT6Yw2jlqAbEN7cJCsnZNMLol9qQQ8uwYfcD5gEDMIniz1XCV41Bluvq3avxbvTyRcb+4iyHclA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WQ4nhYsj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9A5DC19421;
	Mon, 15 Dec 2025 09:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765791376;
	bh=dSLpxiL1aXMnJwyx4tEHeVx1Cgit3eOzv1//IzQcCEo=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=WQ4nhYsj07UiogayY1jqqrBEbH7UuNW59gy5cWwaztlK6hn98biG/rx5bkL+/75G2
	 t9Nd+CTzUxIIxaqgxI/8rdH1eJXhVRPpYQkWgbhl/xy265GTmXYNhl6PzoDQfxurtY
	 HAbI/i3D53b0ft8ZBFNJ2UiSHTFDA1/fK7jT6LQHlJSsgAuv4avBXaBEeQqnzmLhN6
	 aEa+2HNUYrDCObqeGGNcPtOGt5x5iAaf1n0bDbMyyacETlZP/B324g6bB1K5FiKTwb
	 nm7xKVHKpmKks6f28H1RQyayZEVLZPmruxzIwyuH9vYiLGpcrp850fCYM6j3euztUI
	 7c+Sw4wMtHvVQ==
Date: Mon, 15 Dec 2025 03:36:13 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: yongxing.mou@oss.qualcomm.com, robin.clark@oss.qualcomm.com, 
 tzimmermann@suse.de, dri-devel@lists.freedesktop.org, conor+dt@kernel.org, 
 devicetree@vger.kernel.org, konrad.dybcio@oss.qualcomm.com, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 krzk+dt@kernel.org, neil.armstrong@linaro.org, jesszhan0024@gmail.com, 
 airlied@gmail.com, maarten.lankhorst@linux.intel.com, 
 linux-arm-msm@vger.kernel.org, lumag@kernel.org, simona@ffwll.ch, 
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com, sean@poorly.run, 
 marijn.suijten@somainline.org, abhinav.kumar@linux.dev, mripard@kernel.org
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
In-Reply-To: <20251215083854.577-5-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
 <20251215083854.577-5-yuanjie.yang@oss.qualcomm.com>
Message-Id: <176579137354.1486530.823295322686100207.robh@kernel.org>
Subject: Re: [PATCH v3 04/11] dt-bindings: display/msm:
 qcom,kaanapali-mdss: Add Kaanapali


On Mon, 15 Dec 2025 16:38:47 +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Kaanapali introduces DPU 13.0.0 and DSI 2.10. Compared to SM8750,
> Kaanapali has significant register changes, making it incompatible
> with SM8750. So add MDSS/MDP display subsystem for Qualcomm Kaanapali.
> 
> Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> ---
>  .../display/msm/qcom,kaanapali-mdss.yaml      | 297 ++++++++++++++++++
>  1 file changed, 297 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.example.dtb: phy@9ac1000 (qcom,kaanapali-dsi-phy-3nm): reg: [[0, 162271232], [0, 460], [0, 162271744], [0, 128], [0, 162272512], [0, 1024]] is too long
	from schema $id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251215083854.577-5-yuanjie.yang@oss.qualcomm.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


