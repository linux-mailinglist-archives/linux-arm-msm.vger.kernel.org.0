Return-Path: <linux-arm-msm+bounces-64085-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF975AFD515
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 19:17:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A1CAB1AA6D55
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 17:18:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C202E6123;
	Tue,  8 Jul 2025 17:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vHK9ixeB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3252BD590;
	Tue,  8 Jul 2025 17:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751995043; cv=none; b=cQAB/wuOA+y7mz11rhlDr03Pynfl6Rvq88ql2JOxpyBnj+gc4IE3DBSde2KPCyKSjLcNhG+eCzUnG9G2Q8YmJccFg1Crck6cPrvN/35/t3cfEu4jVlrMYI5qMPDH7C2YjaB6P3KIJQwhidNhStKWcq3x5QmaIQ+OddSVNk5PTWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751995043; c=relaxed/simple;
	bh=dSu5wIS6tm9QkrChGU5NIlGU7yzj01Kywd286nRJenE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WCd2MlEJobGb2yXkhj4QPPZZGEPrVDKy/ogBxfo1L0NcGWzQyT74+cA3eFfGUqOX4N2de87D76rx/NXYzsYTAmOKQ/V/KfE1fm4k0AzEpqAk2Hf2FMCl1lACI+i64TSqPleD7lYcwxlEObDW1r6qlYmDZruJVtWtHcD2tSdfchk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vHK9ixeB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C9CC4CEED;
	Tue,  8 Jul 2025 17:17:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751995042;
	bh=dSu5wIS6tm9QkrChGU5NIlGU7yzj01Kywd286nRJenE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vHK9ixeBKJBgnlRJB3/c8/1g049h9diOfGHLh/knNOQHY/jzGTT9v5eXHYdVa1wBw
	 Y+Ymw35IdCF+bZ+9TX2yUf3yOmBNzvQ4tp8zXbMD2OFRocpQJ84sNvzEyjlYmvMfIz
	 nfEbJLzqHyoW5DCaX9kXQSQUOLZGLVElFh5jGnlPcd+LzfKotIRtxOv8k2WmUl4mNG
	 rfMECk1PhXLw6D9tpj3ogWcKLzdLiKDEvOg63MbGdf4oRh9YlduHwcuPJ+JASYjSQ+
	 FJVDOHH6ZBp0WdiG9QVLDj/tusMaVbmSLUMKTXhh3irxJ+IIbRg635wTYXOdFH8YIi
	 ZHw1ZqSJu2T8g==
Date: Tue, 8 Jul 2025 12:17:21 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	David Airlie <airlied@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maxime Ripard <mripard@kernel.org>, Sean Paul <sean@poorly.run>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Simona Vetter <simona@ffwll.ch>,
	Konrad Dybcio <konradybcio@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: display/msm: describe DPU on SC8180X
Message-ID: <175199504085.650526.5518508910045730007.robh@kernel.org>
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
 <20250704-mdss-schema-v1-2-e978e4e73e14@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-mdss-schema-v1-2-e978e4e73e14@oss.qualcomm.com>


On Fri, 04 Jul 2025 19:31:54 +0300, Dmitry Baryshkov wrote:
> Describe the Display Processing Unit (DPU) as present on the SC8180X
> platform.
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,sc8180x-dpu.yaml     | 103 +++++++++++++++++++++
>  1 file changed, 103 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


