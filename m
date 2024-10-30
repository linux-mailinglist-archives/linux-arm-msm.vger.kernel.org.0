Return-Path: <linux-arm-msm+bounces-36456-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E113A9B643D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 14:35:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A5CAF280EF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 13:35:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 130BC1EBA1B;
	Wed, 30 Oct 2024 13:35:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127253FB31;
	Wed, 30 Oct 2024 13:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730295340; cv=none; b=GDDgI0EgeNMvaM5boBIWyZmFpdcs4xvHJ5FZ6QfARCOrkGtxC9Vw/5KXJ8HEC8Ro6ZIAqU48QTamNVNB0LDVNBE3BCmuTdW4uXoyeqZUPtH6w4dbxQdwqg3KXVe6NUW56lKZAjuBRvt/ORxm+eToM5iUh+xEECEg5B2CGumgLV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730295340; c=relaxed/simple;
	bh=2bRRoStRcxTL3xVH545sz64x9ShvC5EiYQ0AmGxIfzc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Uovfh8keqjJtod56oCHE11z5v10A4nkpujKhwC8gp4BKWy+9eNij1wozL3JH8WbDPVoESgZX1gCDH0c8VtzwMrSktYRxVwAOw4PBOUHdGj4q8zr7jnVUNvdPBgpnWlru6Zb4al49EQq3hlkAPY8k1V/yFCu8KKXutDcEtuQtbPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn; spf=pass smtp.mailfrom=jmu.edu.cn; arc=none smtp.client-ip=45.254.49.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [116.25.95.211])
	by smtp.qiye.163.com (Hmail) with ESMTP id 150888e4;
	Wed, 30 Oct 2024 21:30:19 +0800 (GMT+08:00)
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
Date: Wed, 30 Oct 2024 21:30:15 +0800
Message-Id: <20241030133015.487183-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <xmqyp2rgd3nozuiqu44iwidjnnwsidls3mxaqhmy3sshd4nok5@n552fd5tkjoc>
References: <xmqyp2rgd3nozuiqu44iwidjnnwsidls3mxaqhmy3sshd4nok5@n552fd5tkjoc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkZGUkfVkkaTEIZGklCGUMaSlYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk5VSUpKWVdZFhoPEhUdFFlBWU9LSFVKS0hJTEJLVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a92dd9eb68b03a2kunm150888e4
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NE06EQw5ETIaEwEyCjoaL0I2
	DQEKCzJVSlVKTEhLSUJOS0pCQ0lJVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	TVVJTlVCTlVJSkpZV1kIAVlBSkpMSTcG

Hi,
> You can respond here and post new iteration once we settle on something.

Sorry for the late reply. There are two versions of ipq6000 SoCs:
(1) Earlier version: soc_id: IPQ6018; fuse: BIT(1); SBL version: BOOT.XF.0.3-00077-IPQ60xxLZB-2
(2) Final   version: soc_id: IPQ6000; fuse: BIT(1); SBL version: BOOT.XF.0.3-00086-IPQ60xxLZB-1

The soc_id is related to the sbl version, but it is written by the
manufacturer. On the qsdk kernel, early version could reach 1.5GHz,
while the final version was limited to 1.2GHz.

So I think the commit message can be written like below:

    arm64: dts: qcom: ipq6018: add 1.2GHz CPU Frequency

        The final version of IPQ6000 (soc id: IPQ6000, SBL version:
        BOOT.XF.0.3-00086-IPQ60xxLZB-1) has a max design frequency
        of 1.2GHz, so add this CPU frequency.


    arm64: dts: qcom: ipq6018: add 1.5GHz CPU Frequency

        The early version of IPQ6000 (soc id: IPQ6018, SBL version:
        BOOT.XF.0.3-00086-IPQ60xxLZB-1) and IPQ6005 SoCs can reach
        a max frequency of 1.5GHz, so add this CPU frequency.

Do you think this is appropriate?

Thanks,
Chukun

-- 
2.25.1


