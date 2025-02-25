Return-Path: <linux-arm-msm+bounces-49320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0E2A4429B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 15:26:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 106103A7AFF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 14:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01DD22698BB;
	Tue, 25 Feb 2025 14:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6c6N6Yn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C723626770B;
	Tue, 25 Feb 2025 14:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740493479; cv=none; b=jlNrmwO6zx991GEv4/2vQdfa/6469sWT/tHUEVCp1kvSi/N/vLjBbeIx0WEtrs9ugrRkoSQiaZK4ja4/vJRB8unIecjs+tsOevaRUngO8udrZcsp/jP0KTsUonZhLGthRRPi7q/iu16Cu6GV3SmZgbD6TkjoUX+SWrDFwZ4JyxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740493479; c=relaxed/simple;
	bh=Tc/+WyJ8Iu+Vv+jAgKujCKC+Po6J5sopxIY2TPW8Xjc=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=eImSM3EnTFbYeyijhUCsm3LWqV9+2jkTODO5iEzviaGPLFD1GWfRh7TmYXP/RLKNJ8TsDJf6y/0j56WZ/HqEU1kyTeC0xm9cQWd9ooOb1bacNqwtjkMOdx8/2wc7Vlt9modXDsCeEmLURKiD9m6ljLbRvcE1F+zGytEb2FQOKr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6c6N6Yn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C99CC4CEDD;
	Tue, 25 Feb 2025 14:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740493479;
	bh=Tc/+WyJ8Iu+Vv+jAgKujCKC+Po6J5sopxIY2TPW8Xjc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=A6c6N6Yn7j53oak37Og95xt1rMTVpfmjwcHxJfJ43MK8NIMZh5JwLQXaN8RnwLT3R
	 nzvYY6s5w9mfB1n7oypQDTYcdau2q6QVY97RcU57DQf5MAWDMjaBd4Z6noqZlVCzZg
	 IYTsbhIloDhv2JjfrlfncWupCp6K2tQvw5lGkZ7zCl1m1MlDLOspXXoZrOMXwwKEQq
	 v0GXdbNBY1vwedcQzhejheZB+adUQzneLBCVH3LOsjiPOj/SznCDjtj1R7+TZePlaa
	 upPZSNfu3RvPRVuj0g7EQwYYHuaixfpuCNGPiCM6BTiPHYNbay6Td1sbCF34aPENi7
	 9Vwq8goStZtpg==
Date: Tue, 25 Feb 2025 08:24:37 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, quic_jesszhan@quicinc.com, rfoss@kernel.org, 
 jernej.skrabec@gmail.com, conor+dt@kernel.org, robh+dt@kernel.org, 
 jonas@kwiboo.se, linux-arm-msm@vger.kernel.org, 
 Laurent.pinchart@ideasonboard.com, quic_vproddut@quicinc.com, 
 neil.armstrong@linaro.org, konradybcio@kernel.org, andrzej.hajda@intel.com, 
 linux-kernel@vger.kernel.org, quic_rajeevny@quicinc.com, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 marijn.suijten@somainline.org, andersson@kernel.org, 
 dmitry.baryshkov@linaro.org, robdclark@gmail.com, quic_abhinavk@quicinc.com, 
 sean@poorly.run, devicetree@vger.kernel.org
To: Ayushi Makhija <quic_amakhija@quicinc.com>
In-Reply-To: <20250225121824.3869719-4-quic_amakhija@quicinc.com>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
 <20250225121824.3869719-4-quic_amakhija@quicinc.com>
Message-Id: <174049347715.2313013.4695405671704163724.robh@kernel.org>
Subject: Re: [PATCH 03/11] dt-bindings: display: msm: document DSI
 controller and phy on SA8775P


On Tue, 25 Feb 2025 17:48:16 +0530, Ayushi Makhija wrote:
> Document DSI controller and phy on SA8775P platform.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> ---
>  .../display/msm/qcom,sa8775p-mdss.yaml        | 170 ++++++++++++++++++
>  1 file changed, 170 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml: ^dsi@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml: ^phy@[0-9a-f]+$: Missing additionalProperties/unevaluatedProperties constraint

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250225121824.3869719-4-quic_amakhija@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


