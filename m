Return-Path: <linux-arm-msm+bounces-53375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0351A7DFA5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 15:41:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF21418916AF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Apr 2025 13:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C36613A86C;
	Mon,  7 Apr 2025 13:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CAOTyETx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD2F0537F8;
	Mon,  7 Apr 2025 13:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744033023; cv=none; b=Kke0rnokAob/L6npINWrNZwPpWv2XXOXW5VlkdZhHLwLxlXAMJ6h5CrhJOs8xvjfEUtdbiTS2pwQWnh4Kk1+0QUj3TZ9B1JxVJ7h8DO6MgkenOYFx3TYpmMNms93rybrO2YxQmx3CCFrmMaTgwcDfuelhrUxAci0mBk0hzCYMSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744033023; c=relaxed/simple;
	bh=z2YPPx/huYycm4RmyXI94B1UPAuAdtuMmpycOF2eNfE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OuJNYXiwHkto7j2hKFF7HiElkTi67DFqHDsxImQ3R1rux7cTXR/lwwYPyOnlUItH+itVwe9lbTDiZRWHehxxjBbvg+Vj4QcsO2QCshVPG1RbyrgGnWglek5ED5t5h44KT1p5IfXb5fkXM25cheQo6lxd1k83ls8sG6508ZpUx70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CAOTyETx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 103DEC4CEDD;
	Mon,  7 Apr 2025 13:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744033022;
	bh=z2YPPx/huYycm4RmyXI94B1UPAuAdtuMmpycOF2eNfE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CAOTyETxd6/g/MkX2N0+SDWbWzuP8ChrEt+8pQsd8Z1UN96yLAPX3mrm6rJKWgLc/
	 GP3x7AwaHvtA0Jtsx74qQL2k+hZvMWDteDH/YB3GoICpZh4luvFSChhFJHTH/lrV20
	 b+hXqyVtsiPwIggNMD8GmUD89BGniYLY3gCSsYq2n5lrrqmhhmW7ymG9qjFjP9yL3G
	 /21cC3rQ6NjDx16wg2OaOfTpM7WbaY3YLdy1K6ptgw2JG8eYkTxWxNzd7W8wntLB0W
	 4Tfy8s1qXT8M64MxdC+TayfHbH8QdysTiNhdTtVqqRFlGfQW4YpwRQqzBksqUAloUU
	 COfTxc/kQ16Aw==
Date: Mon, 7 Apr 2025 08:37:01 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Luca Weiss <luca@lucaweiss.eu>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	David Airlie <airlied@gmail.com>,
	Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Vladimir Lypak <vladimir.lypak@gmail.com>,
	dri-devel@lists.freedesktop.org, Simona Vetter <simona@ffwll.ch>,
	Conor Dooley <conor+dt@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
	Rob Clark <robdclark@gmail.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	freedreno@lists.freedesktop.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: msm: qcom,mdss: Document interconnect
 paths
Message-ID: <174403302028.2068916.9679649068590207721.robh@kernel.org>
References: <20250406-msm8953-interconnect-v1-0-a23e22e236e0@lucaweiss.eu>
 <20250406-msm8953-interconnect-v1-1-a23e22e236e0@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250406-msm8953-interconnect-v1-1-a23e22e236e0@lucaweiss.eu>


On Sun, 06 Apr 2025 22:55:03 +0200, Luca Weiss wrote:
> Document two interconnect paths found on the MDSS on MSM8953.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---
> There's also some interconnect paths defined in the mdp5 schema, both
> drivers accept it. Newer mdss schemas seem to prefer mdp0-mem + cpu-cfg
> in the mdss schema instead of in the dpu subnode. Since there's no
> cpu-cfg defined with mdp5, I've added these paths here.
> ---
>  Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


