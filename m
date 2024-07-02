Return-Path: <linux-arm-msm+bounces-24878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CE8923C5E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 13:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58652B22163
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jul 2024 11:28:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03FC815B10B;
	Tue,  2 Jul 2024 11:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ed3Ssusn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D2115218A;
	Tue,  2 Jul 2024 11:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719919715; cv=none; b=NPvmqGd8AZ03gZrsrECatWLIV/qA4z44ppOH2JYyUF3gvMNUQehWOjGnvvLI/4UHvDilY6SKdOHn3WMZPLtyONaKYjFQvTooCeach5DFCyaD+qd+JjvV5F1z7Kuw+GCpIKlvoJL5UtLzkUX4COj0LMJbu4du7ZWmuaS/vPFeH/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719919715; c=relaxed/simple;
	bh=R8+rZJ4UpBPZnN3SumMPWq4w3upOof4xgExoUpvjPIo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p0NGPv3n2mEXb2J42Qaa5ygvnp/CdexyDlPb1bC2xu5WFcmb6Y/KLyyWXeIT9JWR+9y8Du9MeP2HeinWZyzAGzMhdOsNACm7iYAFO1jCd5ZVKDJzHvHAtki6xAnFMEinQwlXnmvYMv1iWKTfL1BuQ9NtTBqDb8s499TpazU10wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ed3Ssusn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA159C116B1;
	Tue,  2 Jul 2024 11:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719919715;
	bh=R8+rZJ4UpBPZnN3SumMPWq4w3upOof4xgExoUpvjPIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ed3SsusnbPQFrOkXNsNT53jAZHRwWGEkjbXL8uLNX4imPdtdA0A7rAZOs/bXabqPr
	 /2aJ1SEJ0RWsG8GuAX2EYKimbbgrPo9k/KtK+YGqs4IIGvGFscQ7VH5H/KJRQg6j69
	 8XUBQe+ebABqr5ZTUAwWHYu44DV130KYFurTdcq48yYMFMWwsNXZbsMD2Jxw6G8hxV
	 Ck45x85p8c4QlgXTQ9GYhdXvizNI9lRrveBiyLsQCr5pc0LoXbHOl8C3gPkDSaG6sX
	 67/HQIH8ndX+UoDiWPpxO+aHH3fc7Ku/rsEx9wT15qCU9qDPcQE36Q97/Im+0xgvd9
	 7kzuiKwSaRlqw==
Date: Tue, 2 Jul 2024 16:58:31 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Marc Gonzalez <mgonzalez@freebox.fr>
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org, Arnaud Vrac <avrac@freebox.fr>,
	Pierre-Hugues Husson <phhusson@freebox.fr>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: phy: add qcom,hdmi-phy-8998
Message-ID: <ZoPkX0lE82Lkab6R@matsya>
References: <20240627-hdmi-tx-v5-0-355d5c1fbc3c@freebox.fr>
 <20240627-hdmi-tx-v5-1-355d5c1fbc3c@freebox.fr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240627-hdmi-tx-v5-1-355d5c1fbc3c@freebox.fr>

On 27-06-24, 17:53, Marc Gonzalez wrote:
> HDMI PHY block embedded in the APQ8098.
> 

Acked-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod

