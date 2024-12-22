Return-Path: <linux-arm-msm+bounces-43054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6031D9FA3D6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 05:55:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A71D7A1E09
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Dec 2024 04:55:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C91282AD25;
	Sun, 22 Dec 2024 04:55:35 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m60104.netease.com (mail-m60104.netease.com [210.79.60.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4787A2F24;
	Sun, 22 Dec 2024 04:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.79.60.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734843335; cv=none; b=fTmuj0aPEDvtF4WAtUa4xHhIzmq63s5vhBsU8dIPE1WbqlvJ8ymlzyuDtRapnAPAzrZCKI8rNmuwM9qf33+Q8WqzjHKwESmroV1e1uPzOwMfIvpHzkJoQV/r5AvDF18rh+HeIHY+R2VDMl+0k2ravuSOx65oUd/GMhJjHmmIRVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734843335; c=relaxed/simple;
	bh=qrvrRESqVRURt5DYbvM1oDi4VNM6kOLnhaE6Ds0zjKU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=E+sdkIbA6L1DGtJYvjTjTTgBTZJ5JqMkIZp3P4LTYGs9OgSYr1AuELXlCKRqMeZ6zHzweEUpIVF0z7+eH8KVOXNN7QHzn8s27W1YrsFrWak2/NwynRB7GkXFIlCutobaDCAri/lZYhCk4CagYUU0tS6Jh+PYUYK5TJxXHnkTXqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=210.79.60.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:2500::1])
	by smtp.qiye.163.com (Hmail) with ESMTP id 66ff13aa;
	Sun, 22 Dec 2024 12:40:04 +0800 (GMT+08:00)
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
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: ipq6018: add LDOA2 regulator
Date: Sun, 22 Dec 2024 12:40:01 +0800
Message-Id: <20241222044001.266999-1-amadeus@jmu.edu.cn>
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
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZQ0lJVhgaSxoZSB9OHR1KT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQUlOS0tBQUpZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	tVSktLVUtZBg++
X-HM-Tid: 0a93ecaa4ce103a2kunm66ff13aa
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Mwg6HBw*NjIJSQ00CkkcFAkX
	Mj4KCTpVSlVKTEhPQ09JT0tPTE9JVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
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


