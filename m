Return-Path: <linux-arm-msm+bounces-43811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDD3A002EC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 04:00:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C1A563A351F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jan 2025 03:00:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A96819CC0A;
	Fri,  3 Jan 2025 03:00:26 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4FC1B07AE;
	Fri,  3 Jan 2025 03:00:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735873226; cv=none; b=FeHNgX+pQnyknDJgOsb86eEmwfAbyIIunv7lXJL9ZCbwANAx0/4GpJQInyeUzvt92+Bkk/QCJw7pYgRNrj1pA45BNT1WCzakj+gqyE9ai1uY1z/7AGhcY3Df5hYSyEYizaqbcB59twgjBScECEyRdQHA9YZgopNFboTDkhITE6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735873226; c=relaxed/simple;
	bh=PC6f6IKpRPokW3Q1dNJ83lu4eSQ/USz8FsZK3789fjw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U+awasirNI9U4aTkm4HmpHhTo99CS/aroU2Hk4CIiZ4PbA3WRDCqHAJiSGd503CEENeDNSEWxigRuTwsEZGyyEc061A2UP3qiB87kflV8BK+K0ryP98Mp8+dFRdilYg6+Q1SaCIetdHOy48gAZqhIL0Q/lzGjibecEFojuu+FvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:6270::1])
	by smtp.qiye.163.com (Hmail) with ESMTP id 790bd879;
	Fri, 3 Jan 2025 11:00:10 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: konrad.dybcio@oss.qualcomm.com
Cc: amadeus@jmu.edu.cn,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: ipq6018: add 1.2GHz CPU Frequency
Date: Fri,  3 Jan 2025 11:00:05 +0800
Message-Id: <20250103030005.30784-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cb90fd75-60de-4df7-bef1-e5c832601a75@oss.qualcomm.com>
References: <cb90fd75-60de-4df7-bef1-e5c832601a75@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQksZVkJCSUxJT0MZSUtKGlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQU1JTEtBQUpZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
X-HM-Tid: 0a942a1b271c03a2kunm790bd879
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PRw6Aww6EjITFy03OTk3ITg3
	PzkwCQ9VSlVKTEhOQ0xISUpLQ0JCVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBTUlMS0FBSllXWQgBWUFPQ0k3Bg++

Hi,
> Could you try to boot the BSP software and read out the related
> registers to determine the real CPU frequency?
>
> Or perhaps, if there's a cpufreq driver (I don't know), check syfs

1. The CPU frequency on OEM firmware is 1.2GHz.
2. The CPU frequency on the BSP kernel is 1.2GHz.

Related commit on the BSP kernel:
https://git.codelinaro.org/clo/qsdk/oss/kernel/linux-ipq-5.4/-/commit/7336e62905941d8137176b911410d1cea25d6336

Thanks,
Chukun

-- 
2.25.1


