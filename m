Return-Path: <linux-arm-msm+bounces-37325-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 926789C1613
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 06:46:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4A56C1F24408
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2024 05:46:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45C81CF7C2;
	Fri,  8 Nov 2024 05:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YOnLHEz8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B471B1CF7B6;
	Fri,  8 Nov 2024 05:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731044789; cv=none; b=KZANxO0rxG4uCxC6hWsEwfGbfqR29fEzwr0ZQ3R5/B77N9QhTLWfGRIztIucESsdqQES1iB6gjzk+q2SjOBgJhpZ4naDJ2dMxKDue04kIj5Oji6CSEEF/7ByC03JkUObuZUnvGJKuPT/mJ+7fvItWmabN06jGlNil7YzyY9OJBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731044789; c=relaxed/simple;
	bh=6u7zYbrAlLcUu4TPaRAQYC6BKeTYc8sRV0Uk7+kUYTc=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=KWnonrgjP9lHPc8/zY4RHUJYz/a7w03pUI97gH1F61LoQ3Qm8XPa02pZRZuR0rl/MKkVIRSXB1s/ty9RCz/VZ11oc2lit/Bkur7v3Bj8BcOLmjzx4hMb/lgV6CxIrdoUG5+54y9tbqtXQmSA4u4sQ1xszhQ0G+DiuT9caYFm5gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YOnLHEz8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E1AAC4CECF;
	Fri,  8 Nov 2024 05:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731044789;
	bh=6u7zYbrAlLcUu4TPaRAQYC6BKeTYc8sRV0Uk7+kUYTc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=YOnLHEz81UGzTfJHQIJ1is5tTfsf31A2+VNwMVNjQonhRzZdM2801VuBR6QfrP1/n
	 dqBen7B50wz2LECTYoKIZSPip5SApTzzziOQLCyz2hbSFc3phBv2Wkl2MN3uHdZAM4
	 +O0+R5LORMT4ZhuaBqNO6vLIMWOtLow1oqb5f6+H6muVt3SvuhRj/G6xeDHpMKCnep
	 niKLy4bid+JdGGtCQLHwdb9CjUvAdr5zwdnYOwH21+htSQwMY9WhMn54Ndi7LA9hbg
	 IDjVipBA+ZgZJBHDLseD3BY8AK6vXZuGxlm+sBBqvKjip+VnOnTJ0EEAqbKJcclJ8a
	 GbDqQQ+a+NbIA==
Date: Thu, 07 Nov 2024 23:46:28 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Abhishek Sahu <absahu@codeaurora.org>, 
 Ajit Pandey <quic_ajipan@quicinc.com>, 
 Imran Shaik <quic_imrashai@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 linux-clk@vger.kernel.org, Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org
In-Reply-To: <20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com>
References: <20241108-qcs615-mm-clockcontroller-v3-0-7d3b2d235fdf@quicinc.com>
 <20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com>
Message-Id: <173104478542.565094.6615829686201582887.robh@kernel.org>
Subject: Re: [PATCH v3 07/11] dt-bindings: clock: Add Qualcomm QCS615
 Graphics clock controller


On Fri, 08 Nov 2024 09:39:24 +0530, Taniya Das wrote:
> Add DT bindings for the Graphics clock on QCS615 platforms. Add the
> relevant DT include definitions as well.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  .../bindings/clock/qcom,qcs615-gpucc.yaml          | 66 ++++++++++++++++++++++
>  include/dt-bindings/clock/qcom,qcs615-gpucc.h      | 39 +++++++++++++
>  2 files changed, 105 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241108-qcs615-mm-clockcontroller-v3-7-7d3b2d235fdf@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


