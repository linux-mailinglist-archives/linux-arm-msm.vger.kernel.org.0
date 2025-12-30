Return-Path: <linux-arm-msm+bounces-86895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88070CE882A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 02:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F6E530109A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Dec 2025 01:54:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3633F2DD5E2;
	Tue, 30 Dec 2025 01:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IVfzR89D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09EE928505E;
	Tue, 30 Dec 2025 01:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767059641; cv=none; b=ZxbOf/4GVSqQiIgutJP2NKP0uoTL1G4CRNI1GJvoDB/ieETMbQ2lPVxucRTnnckUeh0M+j+NnGaTKe8L5nnGyjZxMfZG3ryQV0/DqU6RUUOb7RLK3H7n7llm7SP3wz1uek4I7F1ZqOVOyfuVsRH46oD0jkio8C8CPB7Bk2fnWkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767059641; c=relaxed/simple;
	bh=CKjr67pNdP9FP3s3q4y0uZntOZ/ZSmOWBaQJXLaNoPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cau4bbVzdBH+PsbTrJXe3C824pPryZiv0xNXgTSJLtSFWtLqjXXDuisErf/+2Aj62oD27nJ9W9gO9sSTuPPA1T1YGLl7NfkC0kc5zV1RfP+a62k6YsLzPiRHlgIiRwLJ8nNBSjQ5n0IsZj/IaTk8dJ+Lk2XSe8T5ZQemCLtSCfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IVfzR89D; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 999E4C4CEF7;
	Tue, 30 Dec 2025 01:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767059640;
	bh=CKjr67pNdP9FP3s3q4y0uZntOZ/ZSmOWBaQJXLaNoPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IVfzR89D1zKINnkmG/fYk2anvWdfmN2BA8pncIm/7gVXoeGfHuQo5qCS/MSkW0GaR
	 5eA+bAgfrW2lab/PLgH7O5ceCwBB3+5bqlz4F5tM5zjWxU3yjNpebjAcvhP0ZNkLU9
	 /9sR6vwPJp7frxPmQVLI6b2i1Z91y3kfGTEcPFW+HoVhyKcgzZwttFNdh4Ilvl5ocQ
	 U4T4e+2JO5VBdL111rBhVbxFbc83kGqcWbYVnQ/gGEFyvxdm6Xw4tK8Ib60vUtX43g
	 ObBwHQhC+/44/5Gta63AJTjuck6ZM//GzU0KtBN5EBgRjLf9h0T4yylOwNzN+dYM4R
	 ZKsT2cO2S6A3w==
Date: Mon, 29 Dec 2025 19:53:59 -0600
From: Rob Herring <robh@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Jessica Zhang <jesszhan0024@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Casey Connolly <casey.connolly@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
	Martin Botka <martin.botka@somainline.org>,
	Jami Kettunen <jami.kettunen@somainline.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v2 06/11] dt-bindings: display: panel: Describe Samsung
 SOFEF03-M DDIC
Message-ID: <20251230015359.GB3066456-robh@kernel.org>
References: <20251222-drm-panels-sony-v2-0-82a87465d163@somainline.org>
 <20251222-drm-panels-sony-v2-6-82a87465d163@somainline.org>
 <20251222-godlike-mongoose-of-valor-3eeee0@quoll>
 <f72fed1c-968e-4570-8cde-841bf109bf5d@kernel.org>
 <aVGvtJ0NekR1ch-k@SoMainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aVGvtJ0NekR1ch-k@SoMainline.org>

On Sun, Dec 28, 2025 at 11:49:13PM +0100, Marijn Suijten wrote:
> On 2025-12-22 09:36:23, Krzysztof Kozlowski wrote:
> > On 22/12/2025 09:33, Krzysztof Kozlowski wrote:
> > >> +  - |
> > >> +    #include <dt-bindings/gpio/gpio.h>
> > >> +
> > >> +    dsi {
> > >> +        #address-cells = <1>;
> > >> +        #size-cells = <0>;
> > >> +        panel@0 {
> > >> +            compatible = "samsung,sofef03-m-amb609vp01";
> > >> +            reg = <0>;
> > >> +
> > >> +            reset-gpios = <&tlmm 75 GPIO_ACTIVE_LOW>;
> > >> +
> > >> +            vci-supply = <&vreg_l11c_3p0>;
> > >> +            vddio-supply = <&vreg_l14a_1p8>;
> > >> +
> > >> +            port {
> > > 
> > > Not tested :/
> > 
> > Ah no, this one is correct. It's the other patch with similar compatible
> > which was not tested.
> 
> I think you mean:
> 
> 	.output/Documentation/devicetree/bindings/display/panel/samsung,ana6707.example.dtb: panel@0 (samsung,ana6707-amb650yl01): 'ports' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 		from schema $id: http://devicetree.org/schemas/display/panel/samsung,ana6707.yaml
> 	.output/Documentation/devicetree/bindings/display/panel/samsung,ana6707.example.dtb: panel@0 (samsung,ana6707-amb650yl01): 'port' is a required property
> 		from schema $id: http://devicetree.org/schemas/display/panel/samsung,ana6707.yaml
> 
> Which looks to be fixed by including panel-common-dual.yaml and changing `port`
> to `ports` in the properties and required table?  At least the errors are gone,
> just asking if that is acceptable.

Considering it's a dual interface panel, yes, that's the right change.

Rob

