Return-Path: <linux-arm-msm+bounces-31589-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4802D97647D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 10:30:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0CF6A282756
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Sep 2024 08:30:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 372121922E3;
	Thu, 12 Sep 2024 08:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DMQSB9fP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FC0191F9C;
	Thu, 12 Sep 2024 08:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726129792; cv=none; b=IbIAH1E4SM/qigvjOR35vSSqy1G3axrW7UU+S8b9RHTK0kY5F0SHYv9MbwKweOEjRjPLg0nQsmcWvgUuU8Q30eoCNevUonqxaBzDlbSqSyxCuDuY6JwtjBaO8KcgMplddU7OexiulytK8R+evVt/Ly3cRi2rI48iz+5l9xD926M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726129792; c=relaxed/simple;
	bh=eAUIlyp5qcM+w+YA1LphnKTG2D4G9lYzmAurJarHO5M=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=hb7hB8DvWXzSU0Qd2INGugXQKCMbwurS5gZIyB8MMXKdzTFkv+Pu844IGF0zsqjzI3itYly0vTZ3+dFuoCXKVwfY5v86ywD0y/UId7c1EGnExyk2TjSUzS+BcfPS57LeUKhH/JqNk334e+ExIRn9wl32txCi4r2tYvKt5W3a07Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DMQSB9fP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE8FC4CECC;
	Thu, 12 Sep 2024 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726129791;
	bh=eAUIlyp5qcM+w+YA1LphnKTG2D4G9lYzmAurJarHO5M=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=DMQSB9fPLxf8PIfjzcs5vllUIlSpcMxGXXdNF8+gVAg00HzoFWR4/hthDP9n3U5t6
	 C8N1feL+6JScojQrfFgN2dWzs9ZeaH9GoMlwHJI0TZXoAzj3uC8xQOE5oklCscNEyt
	 JHMX/HmDqnCI249/4+vM74YjnvhvUK3hITa1AAS0RqWmV6GXJTBQaKYy1ScSOPiFL5
	 IDweBsuotpYbDhhrGJSATuaIfbes33+6OYJT+Dk6Mf0Uzxa2jj25e9jsIh7C9K9Pou
	 K3sYUyjCfk2bTnq74Y4TarAobEoj0BTsrKDGSPhHfG2Q7yrvWXzVM3FcWV8BGI8Zkm
	 sVjAC1K5S44ng==
Date: Thu, 12 Sep 2024 03:29:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Mahadevan <quic_mahap@quicinc.com>
Cc: quic_abhinavk@quicinc.com, linux-arm-msm@vger.kernel.org, 
 conor+dt@kernel.org, swboyd@chromium.org, bigfoot@classfun.cn, 
 devicetree@vger.kernel.org, airlied@gmail.com, konrad.dybcio@linaro.org, 
 neil.armstrong@linaro.org, mailingradian@gmail.com, 
 freedreno@lists.freedesktop.org, quic_jmadiset@quicinc.com, 
 quic_vpolimer@quicinc.com, quic_jesszhan@quicinc.com, 
 dri-devel@lists.freedesktop.org, quic_kalyant@quicinc.com, sean@poorly.run, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, andersson@kernel.org, 
 danila@jiaxyga.com, daniel@ffwll.ch, robdclark@gmail.com, 
 dmitry.baryshkov@linaro.org, maarten.lankhorst@linux.intel.com, 
 marijn.suijten@somainline.org, mripard@kernel.org, tzimmermann@suse.de
In-Reply-To: <20240912071437.1708969-3-quic_mahap@quicinc.com>
References: <20240912071437.1708969-1-quic_mahap@quicinc.com>
 <20240912071437.1708969-3-quic_mahap@quicinc.com>
Message-Id: <172612978829.2592275.5038712419296813855.robh@kernel.org>
Subject: Re: [PATCH 2/5] dt-bindings: display/msm: Document the DPU for
 SA8775P


On Thu, 12 Sep 2024 12:44:34 +0530, Mahadevan wrote:
> Document the DPU for Qualcomm SA8775P platform.
> 
> Signed-off-by: Mahadevan <quic_mahap@quicinc.com>
> ---
>  .../display/msm/qcom,sa8775p-dpu.yaml         | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sa8775p-dpu.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240912071437.1708969-3-quic_mahap@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


