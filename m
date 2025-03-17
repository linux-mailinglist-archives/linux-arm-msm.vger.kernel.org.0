Return-Path: <linux-arm-msm+bounces-51654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB57DA65F46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 21:37:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B7DD37A3C4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 20:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FB621F5852;
	Mon, 17 Mar 2025 20:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fNK+qsZM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4369E1F5842;
	Mon, 17 Mar 2025 20:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742243863; cv=none; b=i8poimgl1Tksj3HDwxnYY4QD1wQ5UrnybmprnNQiWi33divYfhpbcw8slFc3KWqxLYO59rmRLgiHQzfyOQcbXq6jaoJEdJzXxIMZTDE4XkfyURJU1q7O1BxnkOHNYvr+rQaAlMxVBilumGWXf5qqg8SkXi99zbX4yk3s5h8trqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742243863; c=relaxed/simple;
	bh=EAH6DiCttghSq5ONxKx1j8unsQnFPM5gcsSzH37iVwk=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=lJUXlL9RDnzpqhvqlCNplMGechZ0lznj3qiRt+MKLLvLGhpywBO9jCwtYo6krGFa3VGaIvnYIa3fjdDHKejhHrelz880dX5OrMCGxPFWy15xjNiDHFhYhIt+aEeG3KCJO98pVp88goY+kqxmv73XvgUWA/rGn7uM47SgNEUwv7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fNK+qsZM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2036C4CEF3;
	Mon, 17 Mar 2025 20:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742243863;
	bh=EAH6DiCttghSq5ONxKx1j8unsQnFPM5gcsSzH37iVwk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=fNK+qsZMETCsE4vmpMKLZl6mMxKbZdsm1Ao1mDGWMjmPYCVkQXEsVH09rfa1QEZCx
	 TXKDmiRQLmQufOImGnEtGDP7Mulf2Rnm4WsbooLztBQdCpHtNPwc1Q6NB9RxZ47fO3
	 ZwojOst6zp4Gj5Y2HczDnx1KkC6PVg+0nHIfHM/NG2IpNJkBkIwIpiydFBaU/kJhDd
	 5+23T/UpyHw9HRtOO5TqmfrL+7fCf+AsMgNpYaYQXQ3lgiHRWuaTjQPH1gK2reI7aJ
	 V0/tCr4gKU5y88UahVcaADEzP8z9wXgLlkpquCy/p2G3ck6oMT8ePuUc21Fl717hWQ
	 7SDdACX9nDedQ==
Date: Mon, 17 Mar 2025 15:37:41 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Lee Jones <lee@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org, 
 Kumar Gala <galak@codeaurora.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Simona Vetter <simona@ffwll.ch>, 
 Sean Paul <sean@poorly.run>, "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, 
 David Heidelberg <david@ixit.cz>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 James Clark <james.clark@linaro.org>, David Airlie <airlied@gmail.com>, 
 Georgi Djakov <djakov@kernel.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Andy Gross <andy.gross@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Andy Gross <agross@codeaurora.org>, Leo Yan <leo.yan@linux.dev>, 
 dri-devel@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
Message-Id: <174224352766.683604.12560729798577306237.robh@kernel.org>
Subject: Re: [PATCH 0/9] ARM: qcom: fix APQ8064 schema warnings


On Mon, 17 Mar 2025 19:44:35 +0200, Dmitry Baryshkov wrote:
> Rob's bot has reported [1] several warnings for Nexus 4 submisson,
> however none of those warnings are specific to that device. Fix all
> those warnings for all APQ8064 platforms by extending existing schemas,
> adding missing schemas and making APQ8064 DT follow all the schema
> files.
> 
> [1]: https://lore.kernel.org/linux-arm-msm/174221818190.3957236.3364090534153729086.robh@kernel.org/
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> Dmitry Baryshkov (9):
>       dt-bindings: soc: qcom,rpm: add missing clock-controller node
>       dt-bindings: display/msm: describe SFPB device
>       dt-bindings: soc: qcom: add Smart Peripheral System Interrupt Controller
>       dt-bindings: arm: qcom,coresight-static-replicator: add optional clocks
>       ARM: dts: qcom-apq8064: add missing clocks to the timer node
>       ARM: dts: qcom: apq8064 merge hw splinlock into corresponding syscon device
>       ARM: dts: qcom: apq8064: use new compatible for SFPB device
>       ARM: dts: qcom: apq8064: use new compatible for SPS SIC device
>       ARM: dts: qcom: apq8064: move replicator out of soc node
> 
>  .../arm/arm,coresight-static-replicator.yaml       | 10 +++
>  .../devicetree/bindings/display/msm/qcom,sfpb.yaml | 39 ++++++++++
>  .../devicetree/bindings/soc/qcom/qcom,rpm.yaml     |  8 ++
>  .../devicetree/bindings/soc/qcom/qcom,sps-sic.yaml | 38 ++++++++++
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi           | 85 +++++++++++-----------
>  5 files changed, 136 insertions(+), 44 deletions(-)
> ---
> base-commit: 2bb3cf7805af73af62ebfcbb55e350549b6a0912
> change-id: 20250317-fix-nexus-4-dd0fe3bca987
> 
> Best regards,
> --
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/qcom/' for 20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com:

arch/arm/boot/dts/qcom/qcom-ipq8064-ap148.dtb: rpm@108000: 'clock-names', 'clocks' do not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
arch/arm/boot/dts/qcom/qcom-ipq8064-rb3011.dtb: rpm@108000: 'clock-names', 'clocks' do not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
arch/arm/boot/dts/qcom/qcom-apq8060-dragonboard.dtb: rpm@104000: 'clock-names', 'clocks' do not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
arch/arm/boot/dts/qcom/qcom-msm8660-surf.dtb: rpm@104000: 'clock-names', 'clocks' do not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#






