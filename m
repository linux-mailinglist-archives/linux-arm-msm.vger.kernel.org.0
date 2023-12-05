Return-Path: <linux-arm-msm+bounces-3388-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26527804552
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 03:49:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4882E1C20AD0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 02:49:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041D83FC7;
	Tue,  5 Dec 2023 02:49:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
X-Greylist: delayed 600 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 04 Dec 2023 18:49:15 PST
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3599CA;
	Mon,  4 Dec 2023 18:49:15 -0800 (PST)
Received: from Vostro-3710.lan (unknown [119.122.215.53])
	by mail-m121145.qiye.163.com (Hmail) with ESMTPA id C6ADD8000C4;
	Tue,  5 Dec 2023 10:30:06 +0800 (CST)
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
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: ipq6018: Add QUP5 SPI node
Date: Tue,  5 Dec 2023 10:30:03 +0800
Message-Id: <20231205023003.10278-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <67ecd9c3-40e3-40c6-b904-9898556af409@linaro.org>
References: <67ecd9c3-40e3-40c6-b904-9898556af409@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTB1CVk8fSE9PSksYSRlKT1UTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKQlVKSUlVSUpOVU5IWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVSktLVUtZBg++
X-HM-Tid: 0a8c37cfb037b03akuuuc6add8000c4
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PzY6ORw4EDwzQw0*FDMjCS8M
	NA1PC0NVSlVKTEtKTE9IT0tMTEtPVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVU5IWVdZCAFZQUpOS0k3Bg++

> Why are you sending this separately from the UART patch?

Because they are independent and have no dependencies.
Should I send these in the same thread?

Thanks,
Chukun

-- 
2.25.1


