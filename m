Return-Path: <linux-arm-msm+bounces-7232-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EC7782D008
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jan 2024 09:49:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AA1E51C20C6A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 14 Jan 2024 08:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD3B51878;
	Sun, 14 Jan 2024 08:49:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m25481.xmail.ntesmail.com (mail-m25481.xmail.ntesmail.com [103.129.254.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B68186B;
	Sun, 14 Jan 2024 08:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=jmu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jmu.edu.cn
Received: from amadeus-Vostro-3710.lan (unknown [113.118.191.185])
	by mail-m121145.qiye.163.com (Hmail) with ESMTPA id C8CCE800080;
	Sun, 14 Jan 2024 16:30:38 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: konrad.dybcio@linaro.org
Cc: amadeus@jmu.edu.cn,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robimarko@gmail.com
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: ipq6018: add LDOA2 regulator
Date: Sun, 14 Jan 2024 16:30:35 +0800
Message-Id: <20240114083035.10410-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <b64a5650-6152-4a66-81c1-22df2abfe359@linaro.org>
References: <b64a5650-6152-4a66-81c1-22df2abfe359@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDQ0xOVkhLTE9KT05DTEpDHVUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKSFVKSkNVSkJKVUpDTllXWRYaDxIVHRRZQVlPS0hVSkpLSEpDVUpLS1VLWQY+
X-HM-Tid: 0a8d071823e9b03akuuuc8cce800080
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pgg6PBw4NzwpKiIUCxFPLBg5
	Ai0aCyNVSlVKTEtOSUlKS0hCTUtLVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	SFVKSkNVSkJKVUpDTllXWQgBWUFKSEpONwY+

> Why is is always-on?

No need, I will remove it in the next patch.

Thanks,
Chukun

-- 
2.25.1


