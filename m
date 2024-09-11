Return-Path: <linux-arm-msm+bounces-31443-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8A997482B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 04:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C8EDB1C21444
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 02:17:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1836A27462;
	Wed, 11 Sep 2024 02:17:47 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m155101.qiye.163.com (mail-m155101.qiye.163.com [101.71.155.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B6329422;
	Wed, 11 Sep 2024 02:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=101.71.155.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726021067; cv=none; b=gaCKW4uLH0nozpCC/MkgBHDK0cNzjrUZ1wC7fmB1tt4ZHVHl8o/KF5VWnYM0muvLY0jxePhwoLwzWK2YbNoFmJieeQFvf7iFLc/tiyTnE0SvnM35u8/s6ApxfEm/hUOEVSEobkgLyYhrmpg4mitUbiuBuvQtNpi5j8/H8UzxKYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726021067; c=relaxed/simple;
	bh=0x/nYsvJB5SusdTXecLpy6Cie3u1cVXOtJvPmzCGgW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=cFVDJ0Rl5LsjKuDEf63AQf+YTTutGSP3gC3PMyNX2gW8NyaTwG8/K69nmYA6xzZnTocqxzPo3dfMH1lq1ljhbZkn45SLw8FfPR/M1yPbhhKHmIPE2uLgA5l74K6m2yWJkmkMmNqNGFduGvCLG633lbROylWk9HbLtJLdTYq67CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=101.71.155.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [58.61.141.10])
	by smtp.qiye.163.com (Hmail) with ESMTPA id 8C78F7E0126;
	Wed, 11 Sep 2024 10:10:28 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: dmitry.baryshkov@linaro.org
Cc: amadeus@jmu.edu.cn,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: Re: [PATCH v3 1/4] arm64: dts: qcom: ipq6018: add 1.2GHz CPU Frequency
Date: Wed, 11 Sep 2024 10:10:25 +0800
Message-Id: <20240911021025.17283-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <f3g2tvddqyt5vjt6x7h6oirtm2ighnesu2pmtn2br6jpbxf5zr@tprelogpljuh>
References: <f3g2tvddqyt5vjt6x7h6oirtm2ighnesu2pmtn2br6jpbxf5zr@tprelogpljuh>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTR9MVhpISEpPQkIdGhhLTFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlOQ1VNSlVKT0pVSktZV1kWGg8SFR0UWUFZT0tIVUpLSUJNSEpVSktLVUtZBg
	++
X-HM-Tid: 0a91ded8b14d03a2kunm8c78f7e0126
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PAw6Eww*SjI5PykUPiw0KEIY
	Mz8aCh9VSlVKTElNS0lLTUlCT0JIVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWU5D
	VU1KVUpPSlVKS1lXWQgBWUFKTk1ONwY+

> opp-supported-hw is selected for all IPQ6000. Please add more details
> here. Is 1.2 GHz really to be enabled for all IPQ6000?

The 1.2GHz frequency is available only if the fuse is IPQ6000.
I will try to add more details.

Thanks,
Chukun

-- 
2.25.1


