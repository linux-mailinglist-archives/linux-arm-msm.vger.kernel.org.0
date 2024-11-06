Return-Path: <linux-arm-msm+bounces-37095-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E26D9BDAAF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 01:55:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52CBA28355B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Nov 2024 00:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 058131862BB;
	Wed,  6 Nov 2024 00:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iXYLtFmp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB648185B5B;
	Wed,  6 Nov 2024 00:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730854436; cv=none; b=hhjjvY1w319Z/t/oB5va4evbOWQvdNm1onQnlH9hBssoG1bTTMgvf/ga0fZ25DXAoP0u/6KVazjnYcj/xriGEmx9CXeHzpr44KQYYh5U0PNgRxRFnteXp1W0GgH5bt4wviIrQBgKdMccyg8beD8J6jgF21CMX7B/lLHgMdZLxRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730854436; c=relaxed/simple;
	bh=WtVjp90b+f4eRyCOgI8RT+q6WRJIKRAcTJvgonY0iuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s9UbAvPCDBGQiw9R4BOW9unMFk7g2XU90Zzn7xNYJ+qStmVScHdlkEI5RhIuvHloC/u9YpIYd2U58PexBWl1ukw+aTgtdv2uOxGXVFGUJrSzYCK4bSktU1CxAKBuQHx6Eju8lWV+pXvqzx5xsmW1TFbWgJFvddNHADJVpqqfvyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iXYLtFmp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 133BFC4CED7;
	Wed,  6 Nov 2024 00:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730854436;
	bh=WtVjp90b+f4eRyCOgI8RT+q6WRJIKRAcTJvgonY0iuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iXYLtFmpCK2eTk3/p18jnv0h0Pk38WEJX+kprJbGVpcDpxL3LmwEvzWowQOpkH+7f
	 SNedlabBV2v6TKHJxNTdd9XAuqHpLDqhlYYnW2Y79u6Wf208r2kZkXFOtRt0rME2/I
	 HqKumw6kNsbyaUgA9Edk+ONR5HqHCKe0D2Ox52/wvspD1C75oKvCYqcnzvwrbLr8lP
	 1DLu5u/2EG5gRwt8AfWQyurvGVVrMwR5uT9z8eJYSXbH9yjwMavbjg1sv8/8B6A2Ns
	 Di0KkcsPq0GMt3tyG3WAF5ouy4jvWqZ9TqPXf1JPS7yR2HozsdBZF32ZvpSYfnXz5C
	 gdBbWtDOwL/Rg==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	krzk+dt@kernel.org,
	robh+dt@kernel.org,
	dmitry.baryshkov@linaro.org,
	Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	conor+dt@kernel.org,
	abel.vesa@linaro.org,
	srinivas.kandagatla@linaro.org,
	quic_jjohnson@quicinc.com,
	maz@kernel.org,
	jens.glathe@oldschoolsolutions.biz
Subject: Re: (subset) [PATCH V3 0/3] X1E001DE Snapdragon Devkit for Windows
Date: Tue,  5 Nov 2024 16:53:48 -0800
Message-ID: <173085441663.26510.11025364605092025731.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025123227.3527720-1-quic_sibis@quicinc.com>
References: <20241025123227.3527720-1-quic_sibis@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Fri, 25 Oct 2024 18:02:24 +0530, Sibi Sankar wrote:
> Add initial support for X1E001DE Snapdragon Devkit for Windows. X1E001DE
> is the speed binned variant of X1E80100 that supports turbo boost up to
> 4.3 Ghz. The initial support includes the following:
> 
> -DSPs
> -Ethernet (RTL8125BG) over the pcie 5 instance.
> -NVme
> -Wifi
> -USB-C ports
> 
> [...]

Applied, thanks!

[2/3] firmware: qcom: uefisecapp: Allow X1E Devkit devices
      commit: 75837f0b2bc61c62c8326fe3a1eb9a100714cfd7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

