Return-Path: <linux-arm-msm+bounces-21625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDBB8FB739
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 17:30:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EB7CB21C40
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jun 2024 15:29:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22BD7146013;
	Tue,  4 Jun 2024 15:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jitkRJLt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBD3A145FF7;
	Tue,  4 Jun 2024 15:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717514929; cv=none; b=rKElRgL7hqWfZy4JMlMuKZuF0muQWjgGbGdyBpqjchTkitvTY71pOJVQqyTKwXDcWHIIvJBJ1zkPvPVya2ZqWNDsjdTtDfbEinEleBYvrrckgvYOR8bqCTyFgOFexCknmZqOKQaPLRaENuvBYKcH+XcfjBkMT5VoOqhH4GT+Bhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717514929; c=relaxed/simple;
	bh=o+LKMoQg+BD00GptogVOAWI/kqHjBuP+esUUM0f7upw=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=S/CitH5KWJ4AG+HHYOIcRAsV3lT3EHuoM5KDoLOp3M3cWV3atqyIdX4wZcSiZIEIF34JkehMWdqEMpdxUa/zlPsa4Wr/S6EMCo9/C3vYZD3m8IMBb62+lJH7q9HkMqGfKs8zngRITg0dU70/wg61fVO5YqVES+ox07bfOZniLJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jitkRJLt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F10C4AF08;
	Tue,  4 Jun 2024 15:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717514928;
	bh=o+LKMoQg+BD00GptogVOAWI/kqHjBuP+esUUM0f7upw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=jitkRJLtdkudwxZ7YSUT9WHM+9EwAfqhKzivP0oJepCojL9SBtzrF3qnAnLtbU2FD
	 RECTk4WHsxHjVg8lcsHsqppI7GzJowUfNOY8VW1b30fLBEi9nlo+l7AOKr2lpGwYka
	 SvPthxKcmYmiYALtvXRo+P5zoxRD5311vTedcVKKQ86YTmPhV9HxQ3QtQakJ4VYAuO
	 bzMusYzOPDvoQXGoHYuH4Wu9ykQw3IfWmqLJzD3RbyaL3SV/fwruZPudSLXNEEy5cN
	 /TLujHm6QeNVt0Y2Uc5pj3IbnV+mr8jp1YeRoV/fAhrm98gRI7AP4PjAwQ4rQnzVMT
	 jJmQryFDyYQ2A==
Date: Tue, 04 Jun 2024 10:28:46 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Rajendra Nayak <quic_rjendra@quicinc.com>, 
 Sibi Sankar <quic_sibis@quicinc.com>, devicetree@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>
In-Reply-To: <20240530-x1e80100-dts-pcie6a-v1-0-ee17a9939ba5@linaro.org>
References: <20240530-x1e80100-dts-pcie6a-v1-0-ee17a9939ba5@linaro.org>
Message-Id: <171751454535.785265.18156799252281879515.robh@kernel.org>
Subject: Re: [PATCH 0/3] arm64: dts: qcom: x1e80100: Add proper support for
 NVMe (PCIe 6a)


On Thu, 30 May 2024 18:43:38 +0300, Abel Vesa wrote:
> With this, the NVMe is fully functional and stable on both CRD and QCP.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
> Abel Vesa (3):
>       arm64: dts: qcom: x1e80100-crd: Fix the PHY regulator for PCIe 6a
>       arm64: dts: qcom: x1e80100-qcp: Fix the PHY regulator for PCIe 6a
>       arm64: dts: qcom: x1e80100: Describe the PCIe 6a resources
> 
>  arch/arm64/boot/dts/qcom/x1e80100-crd.dts | 54 ++++++++++++++++++++++++++++++-
>  arch/arm64/boot/dts/qcom/x1e80100-qcp.dts | 54 ++++++++++++++++++++++++++++++-
>  2 files changed, 106 insertions(+), 2 deletions(-)
> ---
> base-commit: 9d99040b1bc8dbf385a8aa535e9efcdf94466e19
> change-id: 20240521-x1e80100-dts-pcie6a-46e3d8220d6e
> 
> Best regards,
> --
> Abel Vesa <abel.vesa@linaro.org>
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


New warnings running 'make CHECK_DTBS=y qcom/x1e80100-crd.dtb qcom/x1e80100-qcp.dtb' for 20240530-x1e80100-dts-pcie6a-v1-0-ee17a9939ba5@linaro.org:

arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: pci@1bf8000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: pci@1bf8000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#






