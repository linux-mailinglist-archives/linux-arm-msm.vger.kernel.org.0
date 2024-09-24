Return-Path: <linux-arm-msm+bounces-32235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44AB8984029
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 10:18:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 144D41F23D96
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Sep 2024 08:18:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E587143759;
	Tue, 24 Sep 2024 08:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rE7JzeZI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B351802B;
	Tue, 24 Sep 2024 08:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727165902; cv=none; b=ptF2on8bniaPx5TBeyadYBg+P8hmiiPxdCuhaV4JnRtlUqAvUSLCi+k4ItRziqknfxe7O6fw+CRzKwsXanXLGTNpEOrUj7SLpo7OFAczyMr4XIPVRh23FB/hLlGWFjJFtMnvzCFKJv3brYzUYz2TR6iVA0dgH2HhMT/+k42OAOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727165902; c=relaxed/simple;
	bh=71k19nXTK4VVFBoakaBb1kid4ielPiHfKS52/6eP+gY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XUMSOJc1xq3AqbGo3YIIs3Cm1xDGD/bAduIwEyKHpXCy41nJYHJJ/e8eNlfqkVSET+M0+bL4Z3QNc1AL+mHIY+QBGpAEFXl0pG0hwkJG7IcUYON7vbTBcGFNv+ByMBb1jdv4fuQhX/KGM4wqsTTVh5obX4vI0RyuiRQOkWpcbtw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rE7JzeZI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B26B8C4CEC4;
	Tue, 24 Sep 2024 08:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727165901;
	bh=71k19nXTK4VVFBoakaBb1kid4ielPiHfKS52/6eP+gY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rE7JzeZIXW9kWQ/3E0EMx6AbqqDwhdczKPUleEJndoZ7M1poY7ANVSHJDkLKhEl4J
	 EzCEmJWnPCpP4MFvlDpJIqFMQOAq+g9gKNAo0DZhL5BU60DpY6FHPvLMhPibyHam6C
	 bSw1YvSzNX+awAYbp+q1dZW2MPMGtkI8owBLEJo7rnDOuKuJ2ohlruH87SMtGQLj7U
	 2IV+fUljatlm1yrfND+ZesCfiH3hMrjkZMaNE03AVlySu3+ag+RgPJZB5qlGvRteZj
	 ROoQtRQdYR7cwVOpjZUfAIChXntyuGQ0Dlp36ogkIg4xgl1vZ1ZId+jEJgK1dn5xVm
	 58V8dr9YC4/JQ==
Date: Tue, 24 Sep 2024 10:18:17 +0200
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
Subject: Re: [PATCH v3 1/5] dt-bindings: phy: Add eDP PHY compatible for
 sa8775p
Message-ID: <vxyvyfab3m3yp4s6lraympgukmpxo2zjmh4irxu3lwxzve7mrn@jykursrajsrd>
References: <20240923113150.24711-1-quic_mukhopad@quicinc.com>
 <20240923113150.24711-2-quic_mukhopad@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240923113150.24711-2-quic_mukhopad@quicinc.com>

On Mon, Sep 23, 2024 at 05:01:46PM +0530, Soutrik Mukhopadhyay wrote:
> Add compatible string for the supported eDP PHY on sa8775p platform.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

As explained in reply to Konrad in v2, reviewed-by was given by mistake.
Please drop on next submit.

> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> Signed-off-by: Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
> ---
> v2: No change
> 
> v3: No change

Best regards,
Krzysztof


