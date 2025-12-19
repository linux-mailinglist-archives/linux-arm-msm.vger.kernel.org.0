Return-Path: <linux-arm-msm+bounces-85937-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFA1CD0F98
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 17:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A857F3040197
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Dec 2025 16:49:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E233366DAB;
	Fri, 19 Dec 2025 16:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qr//oIr5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 700F636657E;
	Fri, 19 Dec 2025 16:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766162950; cv=none; b=XoqI97ytqDqZyPO46CqrAGKdKM04y5gF+yhrRjXAVhbL6uWwBw6UNt2YWnJ/3W56LnEC8k0wJAWFlWoIZDCfP9Q3+za/D0wo49uD1rQlRTiomaommGTLqz5/+JS29YBi/jOGZ8sJd5Wcvu3rdWtr63eaS0QltOv0RB0Yhd7lukE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766162950; c=relaxed/simple;
	bh=8OOidh8j/WNjputt5lVwQsxZCg3kjra8hNH1KbKw198=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=XyuIWs05vnEAetfklRaNz+K09md186Yyrrlz2okeBhF9Ds/3TcckcwLjHR3lo80WSPnybHbr629C25iGQ8D6SNrZK0TK+AM1cup/JdV505QzpFRsSJeWpF97lXi6HWRD4L79+ISnHivlWl16L2UI0SknLcfkUWp4O6grWfsM6cA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qr//oIr5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA421C4CEF1;
	Fri, 19 Dec 2025 16:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766162949;
	bh=8OOidh8j/WNjputt5lVwQsxZCg3kjra8hNH1KbKw198=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=qr//oIr5aN41TSnXsMaaZ2xZQ3n0alBGG3tqRqGLSy5/lahNc9lQc0WOSy2xJW7Zy
	 Duch5l7uJH0l+AjeIZI2unYIMxmTbOLnr291ukseI33JoSnkwXdQOzxPQIkcg+ZeTJ
	 ervEVTTCxAUZSvBlzrU35fBBAHFycZ1CPoE41vWhiuFr2KYebAs1431otshHsASNEx
	 GiQgUJ0UIlhO0M2BBfJqGFHWYWFe4Mt7AS+JeYW9IAnJn4m5wPxCbT//h6Fm/ZItCO
	 Gotd68IMRclFL8zOluL0AtJ8s048KR7RBBbmaR4+xu6vgiaV+8gxBqSBoV5qGaD7xS
	 demnoLKtiylOA==
From: Rob Herring <robh@kernel.org>
Date: Fri, 19 Dec 2025 10:49:08 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: krzk+dt@kernel.org, devicetree@vger.kernel.org, 
 mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 andersson@kernel.org, linux-arm-msm@vger.kernel.org
To: Alexandru Gagniuc <mr.nuke.me@gmail.com>
In-Reply-To: <20251219043425.888585-1-mr.nuke.me@gmail.com>
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
Message-Id: <176616243343.3584214.2540779290356918872.robh@kernel.org>
Subject: Re: [PATCH 1/9] dt-bindings: remoteproc: qcom,ipq8074-wcss-pil:
 convert to DT schema


On Thu, 18 Dec 2025 22:34:09 -0600, Alexandru Gagniuc wrote:
> Convert the QCS404 and IPQ WCSS Peripheral Image Loader bindings to DT
> schema. The text bindngs incorrectly implied that IPQ8074 needs only
> one qcom,smem-states entry. This is only true for QCS404. IPQ8074
> requires both "stop" and "shutdown".
> 
> The example is to be added in a subsequent commit that adds the
> IPQ9574 binding.
> 
> Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
> 
> ---
> Changes since RFC
>  - rename binding from ipq9574 to ipq8074
>  - use a real person instead of placeholder as maintainer
>  - drop redundant minItems and descriptions
>  - merge if: clauses as suggested by Krzysztof
>  - various other fixes suggested by Krzysztof
> 
> I used my name as a placeholder for the "maintainer" field. Krzysztof
> mentioned to get the "SOC maintainer" using get_maintainer. I don't
> know how to do that, and I don't see anyone listed for QCS404,
> IPQ8074, or IPQ9574. The bindings apply to any of those SOCs.
> ---
>  .../remoteproc/qcom,ipq8074-wcss-pil.yaml     | 156 ++++++++++++++++++
>  .../bindings/remoteproc/qcom,q6v5.txt         | 102 ------------
>  2 files changed, 156 insertions(+), 102 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,ipq8074-wcss-pil.yaml
>  delete mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt
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


This patch series was applied (using b4) to base:
 Base: attempting to guess base-commit...
 Base: tags/v6.19-rc1-9-g98675bc92a9e (exact match)
 Base: tags/v6.19-rc1-9-g98675bc92a9e (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251219043425.888585-1-mr.nuke.me@gmail.com:

arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: smp2p-wcss (qcom,smp2p): master-kernel: 'qcom,smp2p-feature-ssr-ack' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:1: 'wcss_ahb_s' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:2: 'wcss_ecahb' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:3: 'wcss_acmt' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:4: 'wcss_axi_m' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:5: 'q6_axim' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:6: 'q6_axim2' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:7: 'q6_ahb' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:8: 'q6_ahb_s' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:9: 'q6ss_boot' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:10: 'mem_noc_q6_axi' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:11: 'wcss_q6_tbu' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp454.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:12: 'sys_noc_wcss_ahb' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: smp2p-wcss (qcom,smp2p): master-kernel: 'qcom,smp2p-feature-ssr-ack' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:1: 'wcss_ahb_s' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:2: 'wcss_ecahb' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:3: 'wcss_acmt' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:4: 'wcss_axi_m' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:5: 'q6_axim' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:6: 'q6_axim2' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:7: 'q6_ahb' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:8: 'q6_ahb_s' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:9: 'q6ss_boot' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:10: 'mem_noc_q6_axi' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:11: 'wcss_q6_tbu' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp433.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:12: 'sys_noc_wcss_ahb' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: smp2p-wcss (qcom,smp2p): master-kernel: 'qcom,smp2p-feature-ssr-ack' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:1: 'wcss_ahb_s' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:2: 'wcss_ecahb' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:3: 'wcss_acmt' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:4: 'wcss_axi_m' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:5: 'q6_axim' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:6: 'q6_axim2' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:7: 'q6_ahb' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:8: 'q6_ahb_s' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:9: 'q6ss_boot' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:10: 'mem_noc_q6_axi' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:11: 'wcss_q6_tbu' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp453.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:12: 'sys_noc_wcss_ahb' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: smp2p-wcss (qcom,smp2p): master-kernel: 'qcom,smp2p-feature-ssr-ack' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:1: 'wcss_ahb_s' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:2: 'wcss_ecahb' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:3: 'wcss_acmt' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:4: 'wcss_axi_m' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:5: 'q6_axim' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:6: 'q6_axim2' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:7: 'q6_ahb' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:8: 'q6_ahb_s' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:9: 'q6ss_boot' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:10: 'mem_noc_q6_axi' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:11: 'wcss_q6_tbu' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp449.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:12: 'sys_noc_wcss_ahb' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: smp2p-wcss (qcom,smp2p): master-kernel: 'qcom,smp2p-feature-ssr-ack' does not match any of the regexes: '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,smp2p.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:1: 'wcss_ahb_s' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:2: 'wcss_ecahb' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:3: 'wcss_acmt' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:4: 'wcss_axi_m' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:5: 'q6_axim' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:6: 'q6_axim2' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:7: 'q6_ahb' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:8: 'q6_ahb_s' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:9: 'q6ss_boot' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:10: 'mem_noc_q6_axi' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:11: 'wcss_q6_tbu' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml
arch/arm64/boot/dts/qcom/ipq9574-rdp418.dtb: remoteproc@cd00000 (qcom,ipq9574-wcss-pil): clock-names:12: 'sys_noc_wcss_ahb' was expected
	from schema $id: http://devicetree.org/schemas/remoteproc/qcom,ipq8074-wcss-pil.yaml






