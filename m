Return-Path: <linux-arm-msm+bounces-70459-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE22BB32376
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 22:17:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B0AC71C86638
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 20:17:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BA762741D1;
	Fri, 22 Aug 2025 20:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cV0HntKF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E8C1DED5B;
	Fri, 22 Aug 2025 20:17:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755893821; cv=none; b=noXEha4+cOqcIa/wtw8bL5cSFGodD/YB9sIFUHvR2rNOG+KgIvSAP/RFIDAU7ebc+x2l1wPxKtZmmspWZOTLuKOCha8zPncCfYZgukZKUdm+L4FUtV2WhyybIV5ROasRe8jysa4CkpC2V4b/21c7rXdjmBYq1oT/K2pbqvFFGOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755893821; c=relaxed/simple;
	bh=wIYuWac5rvOFeFhtYm3LKR+xWat7IkTzT9sWyqDVH7g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JFbYUcp+prJPXvfrUpHuF8lu6OjBAfz3rPsi/hWXAmE7fhdkf/EmVyUc712SOWXcZPoQ9oxfsZr2T8lV1xku4xIAqzsOrwdTyo7V9oaJrZNmu5PRSDqwIQtIprz09hU1HrXTVGMDXGUnfMWscr/DSNwaqSfhou0MDsrXdR7OEqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cV0HntKF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B24E1C4CEED;
	Fri, 22 Aug 2025 20:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755893820;
	bh=wIYuWac5rvOFeFhtYm3LKR+xWat7IkTzT9sWyqDVH7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cV0HntKFCdxp1G5Oj8gEHfcgeiei2Kh8gmYiKV3Q4SmoMX2Yu4SgEAov/+IIMvUOu
	 +gR86FRoHPdrZiPktHIS32bsmYzH/lv30MNHjm2/owzSbqgiDZ7xeH6ndOWa13bxAX
	 vsZbmeGhh5mq2QOi96UeWpUHXZ6GiXilOF5T/fISelgK+Rgrduw0MPaIVFmAf/h3lH
	 XbNlBiksI4KD5pAqo3TGs4Dnr4nOa14NFuT9/dZrQF2PLSVXKqoH9tyy3cVEyA5H7u
	 duWPQNscmVzdlJVDxTb6GLWyFHcd0QodTQDGrbq7fiv1PHah7nPKsRW19mlrDIcoUb
	 z7Z00+tJAO+iQ==
Date: Fri, 22 Aug 2025 15:16:59 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Gaurav Kohli <quic_gkohli@quicinc.com>
Cc: andersson@kernel.org, lukasz.luba@arm.com, konradybcio@kernel.org,
	linux-kernel@vger.kernel.org, amitk@kernel.org,
	daniel.lezcano@linaro.org, krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org, quic_manafm@quicinc.com,
	devicetree@vger.kernel.org, rui.zhang@intel.com
Subject: Re: [PATCH v1 1/2] dt-bindings: thermal: tsens: Add QCS8300
 compatible
Message-ID: <175589381943.296767.18017487857574330455.robh@kernel.org>
References: <20250822042316.1762153-1-quic_gkohli@quicinc.com>
 <20250822042316.1762153-2-quic_gkohli@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250822042316.1762153-2-quic_gkohli@quicinc.com>


On Fri, 22 Aug 2025 09:53:15 +0530, Gaurav Kohli wrote:
> Add compatibility string for the thermal sensors on QCS8300 platform.
> 
> Signed-off-by: Gaurav Kohli <quic_gkohli@quicinc.com>
> ---
>  Documentation/devicetree/bindings/thermal/qcom-tsens.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


