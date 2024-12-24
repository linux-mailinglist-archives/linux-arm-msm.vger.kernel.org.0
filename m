Return-Path: <linux-arm-msm+bounces-43194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 21EBE9FBA10
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 08:06:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8359418844CA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Dec 2024 07:06:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F301170A26;
	Tue, 24 Dec 2024 07:06:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E2614A0B3;
	Tue, 24 Dec 2024 07:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735023978; cv=none; b=RaxLga/tcDkqAEdEvgWWuFPWn0nz48WHiHpt4ryIMrSEf5OjcUqQJAiV2Mbf5tCdp7Wak6UOjma7iwdFAX72xrtMQyv2Y99MjSvfFlHm2xIUaE7P4wN5o5TOq5HFrSjio/XnBCgguq6cDlOcFboqOL4pOeLg+HrWVl1yk2xXSsI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735023978; c=relaxed/simple;
	bh=5jfrlQdEPhGRsb3Q5EU0VNBVm5yQTuYIotV7vkAk8t8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NfTI7B32STd69WYcafFSw+XhLGxxpHPcffbo4Hd5WrSydC3Bw0Xlt62z+9uFuTrJgFP4iM88cjHdp25c/aWCcI8NJEwquaXTL4H8okkGn5Pu8grcMayFl3FfGpSJtvveJvFjJ0FH+Fk194BG+gFS+QQDCaAuyyhjcDSALT6gKAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:2500::1])
	by smtp.qiye.163.com (Hmail) with ESMTP id 6a480367;
	Tue, 24 Dec 2024 15:01:01 +0800 (GMT+08:00)
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
Date: Tue, 24 Dec 2024 15:00:18 +0800
Message-Id: <20241224070018.2264908-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <88cf612d-cc3d-4cfd-b6ba-49739d598e69@oss.qualcomm.com>
References: <88cf612d-cc3d-4cfd-b6ba-49739d598e69@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHUwYVkoZSUodS0oZT0IfGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQUlOS0tBQUpZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	tVSktLVUtZBg++
X-HM-Tid: 0a93f778134503a2kunm6a480367
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6OE06TRw4EDIQNks0Fx8BVhVN
	GS9PCUpVSlVKTEhOS0lITU1JQktJVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBSU5LS0FBSllXWQgBWUFPTko3Bg++

Hi,
> I think Kathiravan only wanted to make sure you have the latest bootloader.
>
> Looking at the documentation, I don't see a 1.2 GHz frequency level for
> this platform.

But from the merchant's publicity, ipq6000 is 1.2GHz:

https://wikidevi.wi-cat.ru/Qualcomm/IPQ6000
https://www.gl-inet.com/products/gl-ax1800 (CPU Part)
https://www.alldatasheet.com/datasheet-pdf/pdf/1246071/COMPEX/AP.CP03.html

Thanks,
Chukun

-- 
2.25.1


