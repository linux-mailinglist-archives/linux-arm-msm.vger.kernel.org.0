Return-Path: <linux-arm-msm+bounces-521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEC77E8E51
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Nov 2023 05:22:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DE10F1C208C8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Nov 2023 04:22:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1A81FBE;
	Sun, 12 Nov 2023 04:22:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343835220;
	Sun, 12 Nov 2023 04:22:10 +0000 (UTC)
Received: from mail-m17237.xmail.ntesmail.com (mail-m17237.xmail.ntesmail.com [45.195.17.237])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6842D30D5;
	Sat, 11 Nov 2023 20:22:07 -0800 (PST)
Received: from debian.lan (unknown [14.117.241.250])
	by mail-m121145.qiye.163.com (Hmail) with ESMTPA id E5B5D800059;
	Sun, 12 Nov 2023 12:21:45 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: krzysztof.kozlowski@linaro.org
Cc: agross@kernel.org,
	amadeus@jmu.edu.cn,
	andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konrad.dybcio@linaro.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-msm@vger.kernel.org,
	robh+dt@kernel.org
Subject: Re: [PATCH 1/1] arm64: dts: qcom: ipq6018: Add remaining QUP UART node
Date: Sun, 12 Nov 2023 12:21:17 +0800
Message-Id: <20231112042117.3751674-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <543871a3-cd35-4ff3-8f42-105cdff77ed5@linaro.org>
References: <543871a3-cd35-4ff3-8f42-105cdff77ed5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaS0wfVk9MS0pKHhhIGhhNSFUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpPVUpKTFVJT0pVSU5LWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVSktLVUtZBg++
X-HM-Tid: 0a8bc1c3a45fb03akuuue5b5d800059
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PUk6Mzo6TDw1KVEfOBkzCxgy
	HTlPCzpVSlVKTUJCTE1JQktNTEpJVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpP
	VUpKTFVJT0pVSU5LWVdZCAFZQUpNTEk3Bg++

> Three patches linked to each other in a thread and each of them called
> 1/1. I don't understand if they are related or depend on each other.
> Please use proper threading and patch generation (format-patch -3 &&
> send-email; or b4).

Sorry for my mistake. These three patches are unrelated to each other.
Should I send them separately or use 'format-patch -n3'?

Thanks,
Chukun

-- 
2.30.2


