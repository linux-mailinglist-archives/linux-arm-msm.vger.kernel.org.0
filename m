Return-Path: <linux-arm-msm+bounces-43066-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1429FA45F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 07:36:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B31D17A1A64
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 06:36:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5406E1552E3;
	Sun, 22 Dec 2024 06:36:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DB91CF8B;
	Sun, 22 Dec 2024 06:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734849366; cv=none; b=l/YClCOunANmvyASp2EX9SrpR87f/8KrXa2Q38dthpxtukmh709MQh5qDq4w6EB2tPExvcN2lnOC2EhBU2sWHeh83Nbx7npTw3+roeZlmXD3b7G2y8+GCFzd4u6OLCYKNjyTktuGpeKh37P60H76IpDqEThJ/6MI2Vi6KxpMGyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734849366; c=relaxed/simple;
	bh=8I2C760+ubF7pxPZNP+7G5wecTJUX4aPwjRL3A9jHKc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UzP3g+rAV+WVIed0IsBrCT2oKYo5NKpmDCG7dWv18kLTmw0PTpr6tzXr/LS/W/Q6ebqVrvY/V4tC0zX/dwHJfAlBHoHFpd6cbANhWrFkntb2NHG8wodzMZTmkkWmwHFMGfzwzIm6SCPIBowx1Bec8FWr3MyDnAxK5LRWtfpg46c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:2500::1])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6702fc81;
	Sun, 22 Dec 2024 13:20:23 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: konrad.dybcio@oss.qualcomm.com
Cc: amadeus@jmu.edu.cn,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_srichara@quicinc.com
Subject: Re: [PATCH v4 1/4] arm64: dts: qcom: ipq6018: add 1.2GHz CPU Frequency
Date: Sun, 22 Dec 2024 13:20:18 +0800
Message-Id: <20241222052018.270053-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <9957783a-3066-4dba-ae9e-d52618fef964@oss.qualcomm.com>
References: <9957783a-3066-4dba-ae9e-d52618fef964@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSUsaVkkYTB5CTR9CSh4aGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQUlOS0tBQUpZV1kWGg8SFR0UWUFZT0tIVUpLSEpOTE
	5VSktLVUpCS0tZBg++
X-HM-Tid: 0a93eccf368703a2kunm6702fc81
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PzY6EBw6HTITGA1INygMCg0P
	OCkaCwlVSlVKTEhPQ09PQ0lIQkpJVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBSU5LS0FBSllXWQgBWUFJQ0I3Bg++

Hi,
> I can't find anything to support that.
>
> Maybe Sricharan can help out here.

https://lore.kernel.org/lkml/4a11d946-3c32-42fd-959b-32e61cc61ab5@quicinc.com/
Based on the instructions in the link above, is there anything else I need to do?

Thanks,
Chukun

-- 
2.25.1


