Return-Path: <linux-arm-msm+bounces-36680-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B4FF39B8B56
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 07:47:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 629341F23085
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Nov 2024 06:47:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81C0814E2DA;
	Fri,  1 Nov 2024 06:46:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m10138.netease.com (mail-m10138.netease.com [154.81.10.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0260914F10F;
	Fri,  1 Nov 2024 06:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=154.81.10.138
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730443612; cv=none; b=EGWarR0nXeeoQx7roXUUkmm7P1MSgV9xDIRPmfb78CZts+46eWxBliM/BLpnHRRA2PV1VOrtfJIWLMco2TG2DShG1AndKf4nPmd+ozkWoDLcXu4hoWO9eYSf8B2tzEOlaq8C/OJY4sZTy0FEDQhQcVzjqWtt1CAcaX98Z3mzgw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730443612; c=relaxed/simple;
	bh=UmVFEV+4T93qKkPu6E9SGsK0BIZe8oLxXueVeqV+J0U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WrKF96wzpTQ0w0BqTFd42v7G8D0RaiiU6YZ8R18/NiCoYP2OicrD6HeoTfz6OBj3EP25qA1pxvn0M1pzeyoppxG3TRKhy0GAcEsMuofA3pNGhmBT2rq/JE1hnF3mjltmdJ/sSS0RxqLJCNr9/9mIUs8fQRdxvA36cTiAIwRuXjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=154.81.10.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c05:add0::1])
	by smtp.qiye.163.com (Hmail) with ESMTP id 17875144;
	Fri, 1 Nov 2024 10:10:43 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: konrad.dybcio@oss.qualcomm.com
Cc: amadeus@jmu.edu.cn,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dmitry.baryshkov@linaro.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 2/4] arm64: dts: qcom: ipq6018: add 1.5GHz CPU Frequency
Date: Fri,  1 Nov 2024 10:10:40 +0800
Message-Id: <20241101021040.12523-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <743ce426-3473-49db-92c3-45b9057ce0a6@oss.qualcomm.com>
References: <743ce426-3473-49db-92c3-45b9057ce0a6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaQx9LVkhJSk0eQkhKTBkaSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtOQRofH0tBQUpZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	tVSktLVUtZBg++
X-HM-Tid: 0a92e57d408403a2kunm17875144
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MQw6DAw*QzIaSElMDk9WDRQh
	KC4aCwFVSlVKTEhLT0lMS09PQ09JVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS05BGh8fS0FBSllXWQgBWUFJQkw3Bg++

Hi,
> Are these earlier versions valid SKUs, or are they something like
> engineering samples / early versions that were internal to Qualcomm?

These early versions are widely used in official products,
such as the Linksys MR7350 and Qihoo 360V6 routers.

Thanks,
Chukun

-- 
2.25.1


