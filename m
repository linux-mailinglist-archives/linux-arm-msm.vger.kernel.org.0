Return-Path: <linux-arm-msm+bounces-32238-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC3E9840CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:43:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D8F0BB207C8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 08:43:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E84AD14F124;
	Tue, 24 Sep 2024 08:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rA/vjWKD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC95514EC4A;
	Tue, 24 Sep 2024 08:43:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727167386; cv=none; b=dHA4BJ6xI3/uGvFKWmrmpN63arii+2w10bR/h08z6rZeGzUMHciXMPRjSP3KMKM7K1nqiSJE7LXyrzsHu5RWIeOqMI15Fwn2vGyZP6vJXQJmWUG2xkDXzpsVN0XHJl7h1T6FOcrrRwKt7bcfBJe3AS3ogZPZ+c9mRmxGR3JdD00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727167386; c=relaxed/simple;
	bh=G03an4s/BBkbiR5sfEuBnlun4tbtlIlIOPYVWkYcMPU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edJeokv7v3mgeu2ChsTd2TYk9o8qgMPPB2+LarTGN3MEpuwPbgqjAIbjvUZ7DQpP2ZJI+5Fy+Zt3mRM9nvOsHZ8eXdIDpJi8bOvzrnsQZNb7xnvvwBSbmlQ388RuCptF9AaopGu1ngf0GtTEWxDIcqyZSByLlgmUBvCR8OdySZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rA/vjWKD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37D5CC4CEC4;
	Tue, 24 Sep 2024 08:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727167386;
	bh=G03an4s/BBkbiR5sfEuBnlun4tbtlIlIOPYVWkYcMPU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rA/vjWKDVg4XoXhqoSRyPjmQaRYSrI00ThmOhO6SGl2/h5PKG6/x3/P0wNZBNuzTd
	 RPf93PE9q5moiD/R2ga0mGP8Xt2FsRdWYqXsbGQIW/pNpwCNcB0qE5yFBeZBOnKU4l
	 ZwCDP8YzK2IsCMsQgKxZm6MO7/qRlC1UkxkHZ4rN4u3iSiwfVedq4WOuYc/P0pAu6I
	 A6DrFV/ZIRYh0MdV8Qo3oLJyOQiPQSl+tE6sf6LtgfXybwvl4eL6wVVQpBEPfTI5/R
	 D5V5SKA8lNmCEVKaJ8+6xOB2VeyzOGZtnjCznHcJBR/G/SfIKCgJqXmV/EYESqEZAB
	 8pQhucrdjqyxA==
Date: Tue, 24 Sep 2024 10:43:02 +0200
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
Subject: Re: [PATCH v3 4/5] dt-bindings: display: msm: dp-controller:
 document SA8775P compatible
Message-ID: <6v3wtdxcooi6qfolj5bfbgeru4uyawj6bsbfcnxu3lspuuhsi6@ysmb435njcul>
References: <20240923113150.24711-1-quic_mukhopad@quicinc.com>
 <20240923113150.24711-5-quic_mukhopad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240923113150.24711-5-quic_mukhopad@quicinc.com>

On Mon, Sep 23, 2024 at 05:01:49PM +0530, Soutrik Mukhopadhyay wrote:
> Add compatible string for the DisplayPort controller found on the
> Qualcomm SA8775P platform.
> 
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: No change
> 
> v3: No change

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof


