Return-Path: <linux-arm-msm+bounces-107536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2NPBFMVwBWoTXAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 08:50:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F11C353E859
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 08:50:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 65AE6301F34C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 06:50:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993DB3ACA5C;
	Thu, 14 May 2026 06:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZHy54+hk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j7Go09ZQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498143AB480
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:50:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778741443; cv=none; b=nQf2jgBZ2F4t+FFiOAzuQ2PTXzEf1jB1QU6nBZZkSgdSvogYXjEA1RoWb7uclwVCq7O4HAzkqPWYRFtcxkp5U8KM07vx1D/F/Hr5AufV/sdtJYVh9l6miMq3PIIYFKfRG6kfxfSUcKqS5tqhXIxUoee4GVzMo90jaraqAiHLO6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778741443; c=relaxed/simple;
	bh=3TLOQXX5xKiM2sGIzt1EUEymlZ7tO3evZhBnWPIL1Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ulwty1p0Wym3+KxFkeQrNaO9iTPsh8uNFF11OQz4mSOTcenAZP5uyu0VLiYuUOh/cwLSdpu9WucTHEHc27VWek6kkm88qICIycee0vptqG8/a4slo0jbLibxtKF8hZkoqHehtmjqsuSLKLa74E3dO4IkXpz0Kn28HhkPL9YmJhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZHy54+hk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j7Go09ZQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E2AqUp2524633
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:50:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1Bz191QtM3OT7TlZvkr4oqTeTL59KBQ6RMy
	9k++fGU4=; b=ZHy54+hkJxbwZo1XUdhhhFjHXSoJJwPjfIo5MEbYrqvBbk6qjL8
	1iYydyvUnJtPGYzXkVeB/a6BuA1SazqANU+SnAi5sZbXswAqW8/3SWq1Q1wAlnVl
	sWn+gBfaln4WpT1ItVnekAY6/H/Yg9Z5Sux7Ly7evrMfuP5z0jV9vWbPI/LBrvAR
	Gm9sa6/KhMm32jAQ5sV23+cRbIphr29rGgSlwAcFox+UanLk8wcZZKp7O7S3noZF
	VCGXVydV0Hk9A+D6zexF455Ad/WlO35mwZ2BsoQ5PByuAHTpRa2KUeqrs6BGLY98
	TxSc1CDb/7O4y+z9rT6S6p9FL5cUQWUD61A==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4vkjjpjp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:50:41 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3662668b825so1254417a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 23:50:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778741440; x=1779346240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Bz191QtM3OT7TlZvkr4oqTeTL59KBQ6RMy9k++fGU4=;
        b=j7Go09ZQdYRYQmDy8wj/ZzwsCWYMxKm9p6TLazSugt0iAWbDPUUjMVj51Mw/NWmgSb
         8bVKYxvGf8eWDl9j2jaVMc2Hdm24JWdbHHtIY+iSRwJpPvhX/q0bR0t6Myw0Dk2otP2o
         KpRN1CmPN4Z7WYwih+HmT0jpoKgDAr6LGBvdun8ekFYhU3jr3NlM/pIOnWDmg/CQxS5l
         6tisuX7chh4ppIApTM/zbXpkczyK1D7XcVNQz6emsB+4D90NrAFFWB4/scli0yHzNe41
         +Zxb+gAfsofyedN5qTsAZraFEqHzuR/KIQ6NtTVkvrZhSKSSTwpY9rtDXK3lanm+4xv1
         9Kzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778741440; x=1779346240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Bz191QtM3OT7TlZvkr4oqTeTL59KBQ6RMy9k++fGU4=;
        b=MzKr9Qcf68Ov23Pn82HOsYmNXBUJa6p6Bfah2n5T0bRAjpLGcL3BQJos4pxthskXi0
         PZkeppQs5VwZRpXjM94GdBnJ2HGcyLBqlyb1XvNMSbIhqhFp5brJxHw4nGk79Z1MyCd8
         UKbS9FcYyVjXdrYt3o850BLKO/tH0w+9A1ypM1LAab4SbJUb0P5Oov7BuhR2EoHlVDAM
         GZTTWuzeomNVaPji5SwSSKQnry6Aj89TqDD8PuCqHb0xL1dAMXe0LNInj72wayxacgdJ
         KD0ZTOtLbpg841AxTXK85dQKviph0eNgbHrzycCKDw/1OR3NYzlPoPTxEPyy1bNoVjg0
         CX0w==
X-Forwarded-Encrypted: i=1; AFNElJ8EcobuKGzW/a+f32vn89C5G6bJEyTY1PG1t8S88iyz9WBiJRrv78+nLmPgOejAh1AFIBdDwmt82HEvCcZl@vger.kernel.org
X-Gm-Message-State: AOJu0YzduprEeOpsF94sQAgY0arnSv+iW3wJdTaRuMyXvlJrx6fZ3jE6
	8o4pvAscM6ClsB1YTimCHR5+CbkBD3Vc6bcx4pytRSNxCh71jIiZFe7quF7kWy2KVSk7z8Y/dcm
	7tiq+fuZKx4iMfpJk4trg9JqDeg6CV1WcJsDNpEoU7OugWl50CAZ/ZxxXroFn6i850q+A
X-Gm-Gg: Acq92OG0NI4rCndEJujahwRRHi6YmnXENLjNw0o5haMwhptCHZpWcnRy/YPSdYLry4c
	iAuubD634515yJarvwWCbasSfK6NL7bp9LuMllP3jcHpi6kjf8Eom/7/rzr0tWXu+UShYcPQPp5
	pv1JkPCceiH4SV/h9eH4vJOoB21Zxy8n4rQn3FQM9UZ2ik3sTSr/gsHC9mliGzoKqii9cl1DwfF
	3saoJRn3p0+E5EWNtHg7EaeESBodmRaBt9HA3oXJDJfOXfB1tDxbaQhta7MIrJAmfX4unBH9/k/
	074G2eLXHauk2qKrVpGF4eyQ/tvU5qmSi+9EHnZ5fcgDJA81UEkJXauo3WE5Qn09PUMqU0JJua3
	GD2u8+82hkHBiERBPgdczVGgIFQ8RYB6G9gSC
X-Received: by 2002:a17:90b:554d:b0:368:a297:bd3a with SMTP id 98e67ed59e1d1-368f780eb3bmr6656765a91.8.1778741440110;
        Wed, 13 May 2026 23:50:40 -0700 (PDT)
X-Received: by 2002:a17:90b:554d:b0:368:a297:bd3a with SMTP id 98e67ed59e1d1-368f780eb3bmr6656732a91.8.1778741439587;
        Wed, 13 May 2026 23:50:39 -0700 (PDT)
Received: from work ([120.56.195.42])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-368ede20a50sm5400043a91.3.2026.05.13.23.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 23:50:39 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: soc@lists.linux.dev
Cc: bjorn.andersson@oss.qualcomm.com, konradybcio@kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, wenst@chromium.org, arnd@arndb.de,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v3] arm64: defconfig: Enable PCI M.2 power sequencing driver
Date: Thu, 14 May 2026 12:20:17 +0530
Message-ID: <20260514065017.11305-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oRHGLgrKYbzranHrVEkFsCZc5bwH3gMt
X-Proofpoint-ORIG-GUID: oRHGLgrKYbzranHrVEkFsCZc5bwH3gMt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDA2NiBTYWx0ZWRfXzccZG25aYdiQ
 IClxjE0FUyQP8XssTnzTAzilXfQ5KhbFGmut2w5Ve5NqDfKnmww3ejZWqSVhVBDvTwgnery764V
 b4XdWSV6miVIdoeLgdDWF4ZJ5VzOh8neq5tv+eUWP2wjV9iC2Nf2IxkcQ0OiMwUAyO2LfgneS1Z
 MeQvZyhQmRyDInV7EJzc7U5o+h8kOATIyf3K0cGOW79eitKBRlj+utQ38zkTCKJ4+nkzj8haURP
 Jvn4J0KQVfIVtWt8+BTtaO8hGBFfP2jBvsKGOqpGVF4FJeMw/RNcgEaJXRAsGEpTbizP6TPzIc8
 OQt9uoePjJleUCCcXbXcn4zG3ZRMX6K4mhuZg+d33XQLxPys7gcvyedkjwqusZYuKtIcnf9kZT5
 YmJjOsEJj83XfhaXJshgOwVh0gPwC1FuI/C93o+Ryx1f8SZWMOMcQi6S1kcasawwLPdv/kov7Os
 sdBEGo2Q617ANBQIe+A==
X-Authority-Analysis: v=2.4 cv=PbDPQChd c=1 sm=1 tr=0 ts=6a0570c1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=QkUiPtlOeBxfVnO1KVo74A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Mt3aZHS-KmEbwue0ZEsA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140066
X-Rspamd-Queue-Id: F11C353E859
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107536-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_NEQ_ENVFROM(0.00)[manivannan.sadhasivam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

POWER_SEQUENCING_PCIE_M2 driver handles power supply to the PCIe M.2
connectors and is required on wide variety of ARM64 platforms such as
Qcom Snapdragon X Elite laptops and Mediatek Dojo Chromebooks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---

Changes in v3:

* Picked the reviewed-by tag
* Sending it to SoC list as Krzysztof suggested

Changes in v2:

 * Dropped PCI_PWRCTRL_GENERIC change since it was already applied
 * Reworded commit message to include ARM64 platforms making use of this driver
 * Added R-b tag

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f93..96ce783f24e7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -260,6 +260,7 @@ CONFIG_PCI_ENDPOINT=y
 CONFIG_PCI_ENDPOINT_CONFIGFS=y
 CONFIG_PCI_EPF_TEST=m
 CONFIG_PCI_PWRCTRL_GENERIC=m
+CONFIG_POWER_SEQUENCING_PCIE_M2=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_FW_LOADER_USER_HELPER=y
-- 
2.51.0


