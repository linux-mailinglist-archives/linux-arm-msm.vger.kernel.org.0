Return-Path: <linux-arm-msm+bounces-34762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F489A26F2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 17:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BDB81B23CC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 15:38:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E6621DFE05;
	Thu, 17 Oct 2024 15:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MNF8iDpY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF4DC1DEFEB;
	Thu, 17 Oct 2024 15:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729179363; cv=none; b=izyatvCL78Y3LeE24mTb0zUiboWZbAlZT88eqD4QsWHp08tWdVct/0xZrWXd+VPawiNKLh+Jr7oi+zoNArjQYJsTv4BNc2mVBGOWoLrfYZZmivbrxZQK/tL+l8qOukWW2q0ERgXe17iRfQik5/YfGpM8MOVVwwVxGBQL/uMMrsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729179363; c=relaxed/simple;
	bh=UaHTT/HCPSCBmEoLaaHxWZ8kYjvp79Mh62xxOcsCz3g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QKlLqePuDbcT+baLQ3s9w7usSKTMuppTO0CFmbY82BtvbmclNsb6nVJHHWHK7Wzzkx0UF0w9MklCqFE2GLBlBnFQ+82+oqoheSQSUZB+5V68dj458oJLitBDvpggHudyvx3GX1wtKshnIWR8NYtFRUpe7o9ABn93Dvv0YgPKRuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MNF8iDpY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A788C4CECD;
	Thu, 17 Oct 2024 15:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729179362;
	bh=UaHTT/HCPSCBmEoLaaHxWZ8kYjvp79Mh62xxOcsCz3g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=MNF8iDpYfzr/MllJDBEf+0OjI4ejKzCH1MnIlFSj3P4DjmRkcLc722QW6DzmCk7tb
	 1S7ib2J0Xvb1jpNMs8ytpfN5Qi0/0k0pt4cipphk4NUuSUB4jpl+Y1EAWfHf7rWRSa
	 icZ9z1Sos4ktrwFWtVXMOXGqVnRCJT7cozsoxHWVqQjuFcQCqdVA1QI/844GH/yd+V
	 8f1YDsifxmjrF6l1etNSasGvuP36bIXEnpVed/mSWTUqgTIctM5YWgegG1aYN1k/zp
	 NKKkPLdfEjFrblCxAvJk0uBYR/PTRNXWlWhcg//OcuuGVzTLc7rR+XrqyJIu7cjE7z
	 wdHyVJ1tpTIVg==
From: Vinod Koul <vkoul@kernel.org>
To: kishon@kernel.org, konradybcio@kernel.org, andersson@kernel.org, 
 simona@ffwll.ch, dmitry.baryshkov@linaro.org, abel.vesa@linaro.org, 
 robdclark@gmail.com, quic_abhinavk@quicinc.com, sean@poorly.run, 
 marijn.suijten@somainline.org, airlied@gmail.com, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 quic_khsieh@quicinc.com, quic_parellan@quicinc.com, 
 quic_bjorande@quicinc.com, Simona Vetter <simona.vetter@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Soutrik Mukhopadhyay <quic_mukhopad@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 quic_riteshk@quicinc.com, quic_vproddut@quicinc.com
In-Reply-To: <20241004103046.22209-1-quic_mukhopad@quicinc.com>
References: <20241004103046.22209-1-quic_mukhopad@quicinc.com>
Subject: Re: (subset) [PATCH v4 0/5] Add support for DisplayPort on SA8775P
 platform
Message-Id: <172917935474.288841.13832533870290794704.b4-ty@kernel.org>
Date: Thu, 17 Oct 2024 21:05:54 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Fri, 04 Oct 2024 16:00:41 +0530, Soutrik Mukhopadhyay wrote:
> This series adds support for the DisplayPort controller
> and eDP PHY v5 found on the Qualcomm SA8775P platform.
> 

Applied, thanks!

[1/5] dt-bindings: phy: Add eDP PHY compatible for sa8775p
      commit: 7adb3d221a4d6a4f5e0793c3bd35f1168934035c
[2/5] phy: qcom: edp: Introduce aux_cfg array for version specific aux settings
      commit: 913463587d528d766a8e12c7790995e273ec84fb
[3/5] phy: qcom: edp: Add support for eDP PHY on SA8775P
      commit: 3f12bf16213c30d8e645027efd94a19c13ee0253

Best regards,
-- 
~Vinod



