Return-Path: <linux-arm-msm+bounces-43069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B759FA474
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 08:00:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1B2AA188625F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 07:00:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E669143888;
	Sun, 22 Dec 2024 07:00:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6032F4A;
	Sun, 22 Dec 2024 07:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734850851; cv=none; b=AhVLY/ONQ7dNkUTYlar8LLTlTRYEqQsa3Y8+pbok7hEckdlxDc5oHNoWrgwpG5qgOOPB122ounnVezIMcm9dqV8x77Fpp0F/KOPtDxSjl8f0/oDXgIDNG3NYdQD+9oc5poTcbIA72SFYPediqjuHdSN6QHvD75BPsp8tKvsXgLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734850851; c=relaxed/simple;
	bh=qrvrRESqVRURt5DYbvM1oDi4VNM6kOLnhaE6Ds0zjKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ltfOhxUoQ3ATguFdpRlW/1ufG2VYSS+JdBzdCnNWrRdt/fTs/7LMV0vSK/Sq+uoSvnZvt4PDiTl3j+g9VWVsIrowbGUKNxORt1B0jUiAaVrUpqlP2GtICNbNqQd722aLisTN+x4NokmpK6t4NjGY8vPZnpiU9z4sknfaCLK2RVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:2500::1])
	by smtp.qiye.163.com (Hmail) with ESMTP id 66ff136b;
	Sun, 22 Dec 2024 12:38:22 +0800 (GMT+08:00)
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
	robimarko@gmail.com
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: default to host mode for USB on Radxa E25
Date: Sun, 22 Dec 2024 12:38:18 +0800
Message-Id: <20241222043818.266759-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <206e1dd4-7e71-4e84-af80-19a0d448b469@oss.qualcomm.com>
References: <206e1dd4-7e71-4e84-af80-19a0d448b469@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZSx8ZVhgZTUlMGEsaTE8fTVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQUlOS0tBQUpZV1kWGg8SFR0UWUFZT0tIVUpLSUhCSE
	JVSktLVUpCS0tZBg++
X-HM-Tid: 0a93eca8c00b03a2kunm66ff136b
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PCo6Vhw*ATINFA1CCkgIFBRR
	PTYKFElVSlVKTEhPQ09JSEtISElDVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBSU5LS0FBSllXWQgBWUFJT0g3Bg++

Hi,
>> @@ -31,5 +31,14 @@ ipq6018_s2: s2 {
>>  			regulator-max-microvolt = <1062500>;
>>  			regulator-always-on;
>>  		};
>> +
>> +		ipq6018_l2: l2 {
>
> s/ipq6018/mp5496

Does ipq6018_s2 also need to be changed?

-- 
2.25.1


