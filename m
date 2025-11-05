Return-Path: <linux-arm-msm+bounces-80473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D92C5C36D61
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 17:56:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4B008188354B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 16:54:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8929133891F;
	Wed,  5 Nov 2025 16:53:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q7oZHYTg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40EF932936B;
	Wed,  5 Nov 2025 16:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762361615; cv=none; b=RNu31+gpcAxiaApVKscJOuGCNcYEfcu2kiUqG1LqiyeE9I+moHk/f7SzCtFhqbRaC/yRLluBwmZYbJOhzGHsQChvrJveHMBzT4qXV3zpsTcQumRHAv8L6HbDvL0qg30AeBH0ypoVjgXJLC1D47XdXAKSxqFazLjRcLn22LvpLLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762361615; c=relaxed/simple;
	bh=DUyB+B+LRdmSbh3dWzcC+TDqeeRozuT/fTVcVlRoLwA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=sPA3XnodfZSQklUDqO5R/CyrfTM/WXYU/19+k1n0cNYM4Ipc+GKUaVR8Rd2we1Y5FysnS73WXqzO2gYtHSxuYbo5m2dSu00eB2ru6XpUPRGhwHAO+xWBQyEVVxiN7z5IQOtDr1xIeiWBmHTQLQDQSWtYAQx28tk2Vgw5oiGmXCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q7oZHYTg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07744C4CEF8;
	Wed,  5 Nov 2025 16:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762361614;
	bh=DUyB+B+LRdmSbh3dWzcC+TDqeeRozuT/fTVcVlRoLwA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=Q7oZHYTg9wmwfGsdZTavf0N8zPTFvaUa2dJLRSBAL2PSUXV77MZppD+KvVagGvLc+
	 jz5q/AsMODLhoVEoOCu2LVU6rID75sMxJYYuPKbSJ5tlGyouotEQFNYpTAPFfzNiVn
	 AE8GnbFUfXtxO8o6/Dj8qad2mTuTV/VQQypKkxUAkV43Xj2kN+qxCbeelL3SXMhcwM
	 Nf9oDm19ts/A79WshWE3Y/R/WkI/XDS/sVPQogSjlvL4avmDh45RC+oz3bdIyP/mdz
	 uR5/8FTkqC/RCiYZVqzjfUzjzQ67QI8bKotYeEO6vJ+jimxh/dIrknLl/0JN4J8ZX5
	 tUd8ZkXITO5VQ==
From: Srinivas Kandagatla <srini@kernel.org>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Connor Abbott <cwabbott0@gmail.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
References: <20251105-a663-gpu-support-v7-0-1bcf7f151125@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v7 0/5] DRM/MSM: Support for Adreno 663 GPU
Message-Id: <176236160052.37047.12923795229672394506.b4-ty@kernel.org>
Date: Wed, 05 Nov 2025 16:53:20 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 05 Nov 2025 22:15:44 +0530, Akhil P Oommen wrote:
> This series adds support for Adreno 663 gpu found in SA8775P (Lemans)
> chipsets. The closest gpu which is currently supported in drm-msm is A660.
> Following are the major differences with that:
> 	1. gmu/zap firmwares
> 	2. Recommended to disable Level2 swizzling
> 
> Verified kmscube/weston/glmark2-es2. This series is rebased on top of
> v6.17-rc1.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: nvmem: qfprom: Add sa8775p compatible
      commit: 466b5ef60fa7619f638fe08201ed9b66d0737556

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


