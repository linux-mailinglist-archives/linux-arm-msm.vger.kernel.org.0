Return-Path: <linux-arm-msm+bounces-74469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CD1B93280
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 21:57:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9761D17BA67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Sep 2025 19:57:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F0E30DEBE;
	Mon, 22 Sep 2025 19:57:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TfFCwx/4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B9227B343;
	Mon, 22 Sep 2025 19:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758571040; cv=none; b=bffRBTtIyJzOiK5A9MgBLO9YhVwaodgyCgVoHlqgaEQ4sHzluvVJf+ePAhAbGP3ZHyuIY49JleDxl01MO7na/OjmtVOeibwbf++w/tEJog8ZnMpa4wFv/LcjKcWQcWUlCNUiLnQyRFs5rHqp4G/oMLBioU4hbJV8v6gsJdnbKQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758571040; c=relaxed/simple;
	bh=ATU22+eW9PFL7VBw73VUAiKeeHjomxrpBheEOpZuqKI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Mrd5a+ffxj97SNfddyo3l/5CRE8olVS0qkIYcZmVZ2OYw4oGmLo3cj0ZAkcLTr7TqJVZyVNL17LdeJRW2YrSn1s0Py4NBLD0SO6eXy35rtnwo4TXDiIt0bd61yrUPtM26rafL5c3BlD1zYY6OGkzSbZnWMHAI9oKnk0y3BOHSIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TfFCwx/4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B255C4CEF0;
	Mon, 22 Sep 2025 19:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758571039;
	bh=ATU22+eW9PFL7VBw73VUAiKeeHjomxrpBheEOpZuqKI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TfFCwx/41/T+d747EWTvvLu2aZoute+nq5SSBDuu1Z5+wsdXJHVw5jDTw2A/Z4e80
	 I0LXpr2oDOAIpU212nT/yGNimDke+sqOw6J71FLf5WcJOQlYX1Bo0xp/XsFdwVdFql
	 kYwkJ0YToF7jjY0MHqBHiusRScdyC3HCNlGI7r9T3PoM5JuEYDOa5ERBKHiDd/y9OA
	 PBDNaDN7NZxJ1uhUe9mVXNQgBxW9Vv6wzE1JDVEK6w8Kjrmdpz5VlrrinkxDCnrPvN
	 nlfC0U+UOjs06oKrx/4oitsj6ApTafLlJkUt6bzNhmOxrfBx00Ji70geklaVlpiu10
	 CodXdDEDHiv+g==
Date: Mon, 22 Sep 2025 14:57:18 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>, li.liu@oss.qualcomm.com,
	fange.zhang@oss.qualcomm.com,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Dmitry Baryshkov <lumag@kernel.org>, devicetree@vger.kernel.org,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	yongxing.mou@oss.qualcomm.com, Vinod Koul <vkoul@kernel.org>,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v5 01/14] dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
Message-ID: <175857103795.1112931.5315462738627006781.robh@kernel.org>
References: <20250919-add-displayport-support-for-qcs615-platform-v5-0-eae6681f4002@oss.qualcomm.com>
 <20250919-add-displayport-support-for-qcs615-platform-v5-1-eae6681f4002@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-add-displayport-support-for-qcs615-platform-v5-1-eae6681f4002@oss.qualcomm.com>


On Fri, 19 Sep 2025 22:24:18 +0800, Xiangxu Yin wrote:
> Add device tree binding documentation for the Qualcomm QMP USB3+DP PHY
> on QCS615 Platform. This PHY supports both USB3 and DP functionality
> over USB-C, with PHY mode switching capability. It does not support
> combo mode.
> 
> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
> ---
>  .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 111 +++++++++++++++++++++
>  1 file changed, 111 insertions(+)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


