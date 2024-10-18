Return-Path: <linux-arm-msm+bounces-35048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4001E9A4825
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 22:34:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 668511C21E22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Oct 2024 20:34:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FCD20F5B1;
	Fri, 18 Oct 2024 20:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KU6dzeQq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B3D20E03C;
	Fri, 18 Oct 2024 20:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729283609; cv=none; b=Gm+Nfacr4bHEPlau3rAvD0KtIs/vbHAdG5ybwY0S4Ogcc2IkX+xSXZFNKeZtporTqWXs0qs9u8xUXcjSoxXQUQw2tcIDZE7fpEUyMb2F2OZMrvdsLDrt75s2R/mP01Tf3lgrbxJjzRua+rssqKF1TZB6G+Wwhgh81W2FiScPexo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729283609; c=relaxed/simple;
	bh=GmYGaGd4lM5rFyar665ZXLx16eOsQ7dG1WFJ+8kllzc=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=lAc/F5pAGbloN8QkrSosbTwrlJb5zRztwyzYUqhg5CcXUINOgmqLRMbSVG2cwNbYaPo1HM5+nqNykwt6RdcVIZB/SH2e079R9bhnnA2kDsKaCS3Nlno8vc/S/DPgIi4up49vlgR8/AxBb7uWkAAayGD8se5d/YdCPMOqezE0NPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KU6dzeQq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82424C4CEC7;
	Fri, 18 Oct 2024 20:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729283608;
	bh=GmYGaGd4lM5rFyar665ZXLx16eOsQ7dG1WFJ+8kllzc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=KU6dzeQqnsK7rm19S2jAQeaEmPRqP7xcN2NPw1jG6eVSbSJ30xte2PnnKeXrhf3+B
	 z4wRY7ziErh2q5ga37PNA0diG8169G1I5rluaDhI3OA5YiomStKhOwkkCpWHuO3vgc
	 Muy5S9QRnCo4NbD9dufdTwIQ+yzSjkILn/w6KN8waeh61qq+ygrZ8l9zosPKD4rW1K
	 140lAwf5h/QZE+mnkzF7SJVmE4SHY4+nvDjqpLiBCcIF3BmEPE0u6QZ5+Iz5rEwSc3
	 sBCdVt6QLboRzQQ3x87sdHoJuFNtPFu/J/WAaM0i3Or5U8S+ubwJbqwKxyWT+0nxXS
	 nCcT/WSDuTMsQ==
Date: Fri, 18 Oct 2024 15:33:27 -0500
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
Cc: Bjorn Andersson <andersson@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Ajit Pandey <quic_ajipan@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Imran Shaik <quic_imrashai@quicinc.com>, 
 Jagadeesh Kona <quic_jkona@quicinc.com>, 
 Abhishek Sahu <absahu@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
In-Reply-To: <20241019-qcs615-mm-clockcontroller-v1-7-4cfb96d779ae@quicinc.com>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-7-4cfb96d779ae@quicinc.com>
Message-Id: <172928360442.1569391.12744783548227561089.robh@kernel.org>
Subject: Re: [PATCH 07/11] dt-bindings: clock: Add Qualcomm QCS615 Graphics
 clock controller


On Sat, 19 Oct 2024 00:45:43 +0530, Taniya Das wrote:
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

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241019-qcs615-mm-clockcontroller-v1-7-4cfb96d779ae@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


