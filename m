Return-Path: <linux-arm-msm+bounces-31848-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF02297A531
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 17:21:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1D3311C26991
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Sep 2024 15:21:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62EF715AD9C;
	Mon, 16 Sep 2024 15:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B5ITreaq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3588C149C4D;
	Mon, 16 Sep 2024 15:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726500076; cv=none; b=eE+kma2f2de2AAlQzErGb1z4pX195a7zQhh6DyRetExvccX0wT0jCmt9GD/z1Oc7AW2TcNaTv+3eGNrLM396jmxyX/bZyzNaja01wCTAAU60RcRvzjs3cbmSYczpzUj+mFvAF6HnLNFXD2kOD5l7Q4UBguOcOhJPHOW/8osxDAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726500076; c=relaxed/simple;
	bh=15KPeQUmUDmhfRZADjOpKO9OZuRW742vA+qq24d9DQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JVLDeQLEZR8x8E0dKW+5SHe0PADMpGr+HjBf70CSjjjWrTlQOEVKin2wht2rcOLpKNypo00pRJBy09/023jqbIL/sdx9uJbBCDYLJAG5abuXXLtfibE3YRVjMlMSueQo5+hSx8X8BEfinwdTQotwo+Oqor2bBESoWgq4d0Iw91g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B5ITreaq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4741C4CEC4;
	Mon, 16 Sep 2024 15:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726500075;
	bh=15KPeQUmUDmhfRZADjOpKO9OZuRW742vA+qq24d9DQo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B5ITreaqD66aCZn0ZnFRJQUnkcv9GGjMkBePgY00QODxUerihkKlQ/zgReoKJwE2Q
	 Cap3vUp5CkErTeHLvGn0fZa13YQzZxOCbR+88hd5sTElej40AgSEz+toE+/ngvMUZm
	 EGEtYX8jlXedfWk40Ep2CJOYrGNjS+8XUqV2K1kWZrw2P2vndv/Lw9zb9VL3pQPHkj
	 YoGmZkYSS0I/H58sA1yM0QCgNHLkjE8SSN+w1RelY8FwpUsdq2uBiKyEOb1rirrEHc
	 Z5C2xlsId/ivtorQ6nAOg7xPJ7QU550v4Z35ZhWnUq/g3VyAo/65+vr4nsezSW3mtV
	 0C29kzbyIC/YQ==
Date: Mon, 16 Sep 2024 17:21:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, konradybcio@kernel.org, 
	andersson@kernel.org, simona@ffwll.ch, dmitry.baryshkov@linaro.org, 
	abel.vesa@linaro.org, robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
	marijn.suijten@somainline.org, airlied@gmail.com, daniel@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, quic_khsieh@quicinc.com, 
	konrad.dybcio@linaro.org, quic_parellan@quicinc.com, quic_bjorande@quicinc.com, 
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
	quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: Add eDP PHY compatible for
 sa8775p
Message-ID: <qy4hizhsrz6nnfq4a5eremcc7b2gtw6czpav2j34nyj4i6fenv@p6vzlxanhmd5>
References: <20240913103755.7290-1-quic_mukhopad@quicinc.com>
 <20240913103755.7290-2-quic_mukhopad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240913103755.7290-2-quic_mukhopad@quicinc.com>

On Fri, Sep 13, 2024 at 04:07:51PM +0530, Soutrik Mukhopadhyay wrote:
> Add compatible string for the supported eDP PHY on sa8775p platform.
> 
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: No change
>  
> ---
>  Documentation/devicetree/bindings/phy/qcom,edp-phy.yaml | 1 +

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


