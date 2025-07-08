Return-Path: <linux-arm-msm+bounces-64087-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A87BAFD51F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 19:18:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A9FA317810D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jul 2025 17:18:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 339FD2DD5EF;
	Tue,  8 Jul 2025 17:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bNPqVxOO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07D36F9E8;
	Tue,  8 Jul 2025 17:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751995116; cv=none; b=nHFRByHeWvVnhLQZaSLiqESJEfxCmy8RwCnssofQKuhs4t3/y+vPikJr6ZmlyNM2YzISDMyVvTIS+NmnKkDrHjYK4WccO3v9zEDReBYpBrOP9+9afuwobXLND52oDcNv6j+VNUJxdfZFD+1cbaKACNKVn97PjMf9p3hOxwMxk5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751995116; c=relaxed/simple;
	bh=KKG1AAQueVdFPM/vfsxIw0NhkEpOgwE0gYOAigJgiP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=owHSpQi5Yw27J8WpMECyVrFxNZ2zMerKDQontsVQqKr7g7TVnQmA9klGgymHsUbhU4nZaYr3Joc078wRIain0eZMGXMTlNI2M+NELHm35W9Ett39au5Ffj17wYkvKCmXnvHyXvH2u+X+E2gk1bocQaHjQWdlgj9h65CX3Co0Jrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bNPqVxOO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A547CC4CEED;
	Tue,  8 Jul 2025 17:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751995115;
	bh=KKG1AAQueVdFPM/vfsxIw0NhkEpOgwE0gYOAigJgiP4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bNPqVxOOTnStBW+zjuA89urtUqIvJs8KzORFdcYAZ5XQsmhnt+Dfp3DgmWlgq6qJi
	 pVNJt1TUDCCgh2YhLT9zcdN+FNYJSfBX296/jmWi803oZBzy8OzpLAumKK46q5+d2Q
	 cW7JYzboS0kT41hSpFo8D5gQReBQZBbO0TCB3dniOZS1RN5poS1ZmSUkZ4F9BrfH7q
	 iMOKzGW4sn5vuMD/0oY+gdkCEXXIL/shNJpuqY51YO6NQcwlAEhypCDFbOTliXgy9D
	 sNZwWbEw2nxNM07UTJRmUS3LFLuGQ7RVUv+l30Dor/ICSlL/V7cXszqMEnyQfCMTdz
	 GF5e1cJwzlVgA==
Date: Tue, 8 Jul 2025 12:18:34 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	David Airlie <airlied@gmail.com>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	devicetree@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	freedreno@lists.freedesktop.org,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Bjorn Andersson <andersson@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>, dri-devel@lists.freedesktop.org,
	Marijn Suijten <marijn.suijten@somainline.org>
Subject: Re: [PATCH 3/4] dt-bindings: display/msm: describe MDSS on SC8180X
Message-ID: <175199511415.652005.7265579408818540562.robh@kernel.org>
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
 <20250704-mdss-schema-v1-3-e978e4e73e14@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704-mdss-schema-v1-3-e978e4e73e14@oss.qualcomm.com>


On Fri, 04 Jul 2025 19:31:55 +0300, Dmitry Baryshkov wrote:
> Describe the Mobile Display SubSystem (MDSS) unit as present on the
> SC8180X platform.
> 
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/qcom,sc8180x-mdss.yaml    | 359 +++++++++++++++++++++
>  1 file changed, 359 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


