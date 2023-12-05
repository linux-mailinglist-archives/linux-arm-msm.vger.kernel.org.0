Return-Path: <linux-arm-msm+bounces-3389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 530DA804572
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 04:02:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 83C821C20C57
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Dec 2023 03:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DF079E3;
	Tue,  5 Dec 2023 03:02:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F33FFBF;
	Mon,  4 Dec 2023 19:02:17 -0800 (PST)
Received: from Vostro-3710.lan (unknown [119.122.215.53])
	by mail-m121145.qiye.163.com (Hmail) with ESMTPA id C6E6F8000A1;
	Tue,  5 Dec 2023 11:02:04 +0800 (CST)
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
Subject: Re: [PATCH v2 1/1] arm64: dts: qcom: ipq6018: fix clock rates for GCC_USB0_MOCK_UTMI_CLK
Date: Tue,  5 Dec 2023 11:02:01 +0800
Message-Id: <20231205030201.12694-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <6f4f7903-c112-428b-8082-a8eca7c5981d@linaro.org>
References: <6f4f7903-c112-428b-8082-a8eca7c5981d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaHkoaVh4dTx5MGE5NSUpMH1UTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKQlVKSUlVSUpOVU5IWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVSktLVUtZBg++
X-HM-Tid: 0a8c37ecf460b03akuuuc6e6f8000a1
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PUk6GCo5Czw4Eg0MMDNWSFYM
	DxowFBNVSlVKTEtKTE9OSElOQ0tNVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	QlVKSUlVSUpOVU5IWVdZCAFZQUpNTkg3Bg++

> That does not look like XO, but GCC_USB0_MOCK_UTMI_CLK

I don't have the datasheet, but the reference clock (XO) is 24MHz, 
and I receive the following warning:
clk: couldn't set gcc_usb0_mock_utmi_clk clk rate to 20000000 (-22), current rate: 24000000

Thanks,
Chukun

-- 
2.25.1


