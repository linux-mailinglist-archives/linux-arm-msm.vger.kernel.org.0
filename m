Return-Path: <linux-arm-msm+bounces-113679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WVdoDvzbMmr66AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 19:40:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D29469BBE5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 19:40:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=n2LA5y1o;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=bv0lX4HT;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113679-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113679-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ED23630A7412
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 17:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8347B375F81;
	Wed, 17 Jun 2026 17:39:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13599377559
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 17:39:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781717949; cv=none; b=u4/giP6XoJ8S6tC3i9mUa7vI3GUQ3mmfgineO/5hqkslm1o0Zs2+DqvfCvwa/uCJ0Vxbqrl4KgdXFh5QR6p7BrN8JffY0GioEgh2xo/s++7DgGkoCeXgf27VlJitcpjAu0rgLKCk+0Zc/dpOSpGD6PSwfuvGLzhXf9xZmw6XnD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781717949; c=relaxed/simple;
	bh=VdeyKwp31SkXwUky2ZmUzSNGxlgUFbHtWCnnQJQPNqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b/USjKq5wIv9NSFiIl0LLGW5/vx9xUv1iZb/R6GOl2hsWRWRsxps5pP7gF2EEQW9NgDJYSWplC2lLc9rcgCQxoQzGJVbz9DQfqpn9s9Qj6vT+b/VLVp9/7i86NvNsVdXCfRCrnpf+cActnmOm3WG0nuuaDKgqJHcJ35w8ccB6VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n2LA5y1o; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bv0lX4HT; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65HHd7Y12976613
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 17:39:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	680+Yl6okt3675HUysJcgfxeYSokKelrviBWT8/HYkg=; b=n2LA5y1oSHhc5LcO
	znso0OIABX0d47gJXom0EdA09HNITtiX0YiqfD2ok14qH3tvQKUz4SPPbEMnOTxM
	L1ZEuYMW2b72Ro3l63pB9syNBkHxzg/sxHuxG1NEj3OIPE72eRxfcp6YtZSj1WPE
	d3eL0pK+puOjRpOZRIbfkGfOYYAbFNjgKoIA0CdK7CxpX9e2tEvuzrczYEGq36Nv
	Gsvd1tvt6fMv7thd2lhI7GNZOe2fkPuTDw+axnmKeEfdB9NR71I9i3ik0PFY45a1
	9iG6IM7u1R4pigyQvyQcM+rpXQmkgZTh9HMeP5d9sGUB5OmF+MYf0NxqsDXynZzR
	5TrAQQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eux2c8tdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 17:39:07 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c2da7fa311so637005ad.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 10:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781717946; x=1782322746; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=680+Yl6okt3675HUysJcgfxeYSokKelrviBWT8/HYkg=;
        b=bv0lX4HTMX3ga9isCEepVzRWaj1FoKO5Eh2A8IvX3PXQxhgVfOadctypn0tBY9DIiP
         nGNWqipyRMNAzSZwC5JaTlAsPghrnKvpvePlk/Fy2gOLTliQD38xmnFgFQBUA0F7OXIz
         V7ctYx3eqGuxzIoxOAhdMu02a085eo81o4Pe2uVnZV9uR9qAu7C4qBbC86PODPe6TBiD
         af2Xn47wqFY/CXriNXR62CIhD7QNccnOMsukU80TqrExaVKknFicC0fjoAeT11becZVM
         aNabiHvuwbRIzg9R2LV45LcVWcydTvAaC7oGX5eOg1rcf80lnCJxge8850UyAH+oUgc1
         RatQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781717946; x=1782322746;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=680+Yl6okt3675HUysJcgfxeYSokKelrviBWT8/HYkg=;
        b=sJvwunYRcTs+yEvw5G5OYgw4LNhPFLPYBFIoeyG2N8fRdO0bJgz8pN6HPQpVCSJfrq
         NbvuUwFDyyRWdxowGtk5mA6aBMDcS3TbgBl95YaWjh0UQ5esc2zZ4EYNPAKYnrSMRbFE
         04x/buWK4M+fMs96zIDKBdv1yzQvdDSSEmCTwuop/cgSEusv72HRIvQnBQG6Lz+6/+BV
         e9jioiqYKCW22a1bRyAsd7RyoUKdiQoL2jDng2cqcZqDat52t2SkDQ0GSQ+9ZMYEYNG0
         7olQQ+WppG0K9UUtV+eE6x0/gGcgdoxUBeASysEahTwX0jyRIrnc8zy2OoXfkoxswtEj
         4EMA==
X-Gm-Message-State: AOJu0YwbWR5J8Ffual30wq/GKCwECtvJ8jSU4aD3+aAyR0mXWuqTeQ9M
	hJTVbvoORMYcJLO6BUKu53PXBcuydN63A6hcLKmGdvbbtkYMilKaCezTqSFqo4BkGHYyFHOxKN3
	ZPV5kFebGa1owljKL38j8fj9032FqeoRT1stVn3pqKKoZw7q3CNvdBUS/4aZ78z9hJx/C
X-Gm-Gg: AfdE7clna6Yb/b5tfbjn31BxQxuAhqMOcfIstQEFazfWOTMaJoCGcwfg3hBn7q4jhtC
	n2JHnKzDapY3nusxX7orytYTu4t5tKhyR904A65xLI1/rZN5/FuUnwnHmJjYHABc+fV570E9rwQ
	GIRVoUVFef6+RMzXc2CYvX0sdoPjQvq0y/O0grPo9OeLLllMo8u1Lnrez/bbvyEdQLcAx69/k2a
	ZRwjHslsIxsui7Q+/o+wHv+gagCc7a04VdlPdhva7CnOkrx53XONca1vcPYoSVrxfe8xVXGcr2+
	duHJysL/QuWf4cak1RY3IPzMt9+TR7Tl8kcJF/06UAB7l0P/rnpQNI/3t7PaM/d3OD6fS+p//so
	bNCcAB/5G7D7ODFWwqRo1EU1/WKYzHjdQcffbWWB63d1hQThCvuCuaKYR2M84/LrMK8krDOXbel
	FBSpPimKFaB+CuIyKR5Z3zydM2EBIgXvuwwUu+qIQR/+QmBg==
X-Received: by 2002:a17:903:249:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2c6bbc93959mr49101325ad.0.1781717946503;
        Wed, 17 Jun 2026 10:39:06 -0700 (PDT)
X-Received: by 2002:a17:903:249:b0:2b2:4d36:7ba with SMTP id d9443c01a7336-2c6bbc93959mr49100995ad.0.1781717946018;
        Wed, 17 Jun 2026 10:39:06 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433369c8asm173973215ad.73.2026.06.17.10.39.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 10:39:05 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 23:08:45 +0530
Subject: [PATCH v4 3/3] regulator: qcom-refgen: add support for the IPQ9650
 SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260617-ipq9650_refgen-v4-3-c505ea6c6661@oss.qualcomm.com>
References: <20260617-ipq9650_refgen-v4-0-c505ea6c6661@oss.qualcomm.com>
In-Reply-To: <20260617-ipq9650_refgen-v4-0-c505ea6c6661@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDE3MCBTYWx0ZWRfX4Zn8zGKkHWA7
 0i8cnmMDQ+lwIHxTj5lgHdPqADNQ9jto834s0t4+VNCuyqDa05rw1Wd+N0GMrqWeUm+OuE7ukPn
 8q3IKyAxtac0A4xiRQB2Ee9G3epF54Hmoz4PDJWag8HLY/8JFsZ2Ki/x9MN2cUVwlN08FI2IBM4
 eR6/bBCZdrBntHyIg998r6Kc6kbvlYQN9JPC+clw7suBVklJHqcTvMUSTPLadPlZy/W67wrjLNk
 jcZ+BUNNhkQF9pFnUT9/Xw3gMZO0kiGlQ/iiMQHKuhSY6/YDPtDhZV5EkOG1Kbd4ZJ1KDw+KcKs
 p7f9vCBxo23sm0Ok1C3th73hgbdYybehIG4F/0bo7TGm10rMFYbVgyO85yUvCH+TXXujJ3nmCTm
 tILCGdaIMU6Mb8MnVdp21WLKclei8TlR+z1aoA75Vd5rySGOrc/mIJh8RlHVQSUT0vf2rhEFuM4
 bpcnYG+9xPcVUPBOUvA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDE3MCBTYWx0ZWRfX6IziwzHiNMbf
 UiyGwKdtHZ37RecBR8rYbfSt7ZZYszwkVfn0xo89yCYaT6u2ytajim44vrpP+vY7M90Ekrz3rai
 WHs0+XvzAYBG0PvRT2YSKu7y0q90iMw=
X-Proofpoint-GUID: Qg2wFiTVIXN90B4RzwC_tT6fSlw0uo11
X-Proofpoint-ORIG-GUID: Qg2wFiTVIXN90B4RzwC_tT6fSlw0uo11
X-Authority-Analysis: v=2.4 cv=WN1PmHsR c=1 sm=1 tr=0 ts=6a32dbbb cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=LWuR3IfAbWH38ddlVOMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_02,2026-06-17_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170170
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113679-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9D29469BBE5

IPQ9650 SoC has 2 REFGEN blocks providing the reference current to the
PCIe and USB, UNIPHY PHYs. For the other SoCs, clock for this block is
enabled on power up but that's not the case for IPQ9650 and we have to
enable those clocks explicitly to bring up the PHYs properly.

Also, add the get_status() callback to report the regulator status to
the userspace.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/regulator/qcom-refgen-regulator.c | 109 ++++++++++++++++++++++++++++--
 1 file changed, 105 insertions(+), 4 deletions(-)

diff --git a/drivers/regulator/qcom-refgen-regulator.c b/drivers/regulator/qcom-refgen-regulator.c
index 6a3795469927..cc72e5a43ba6 100644
--- a/drivers/regulator/qcom-refgen-regulator.c
+++ b/drivers/regulator/qcom-refgen-regulator.c
@@ -3,6 +3,7 @@
 // Copyright (c) 2023, Linaro Limited
 
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
@@ -16,6 +17,9 @@
  #define REFGEN_BIAS_EN_ENABLE		0x7
  #define REFGEN_BIAS_EN_DISABLE		0x6
 
+#define REFGEN_REG_REFGEN_STATUS	0xc
+#define REFGEN_STATUS_OUT_MASK		BIT(3)
+
 #define REFGEN_REG_BG_CTRL		0x14
 #define REFGEN_BG_CTRL_MASK		GENMASK(2, 1)
  #define REFGEN_BG_CTRL_ENABLE		0x3
@@ -25,6 +29,17 @@
 #define REFGEN_PWRDWN_CTRL5_MASK	BIT(0)
  #define REFGEN_PWRDWN_CTRL5_ENABLE	0x1
 
+struct qcom_refgen_regulator_data {
+	const struct regulator_desc *rdesc;
+	bool has_clocks;
+};
+
+struct qcom_refgen_drvdata {
+	struct clk_bulk_data *clks;
+	int num_clks;
+	bool is_enabled;
+};
+
 static int qcom_sdm845_refgen_enable(struct regulator_dev *rdev)
 {
 	regmap_update_bits(rdev->regmap, REFGEN_REG_BG_CTRL, REFGEN_BG_CTRL_MASK,
@@ -62,6 +77,62 @@ static int qcom_sdm845_refgen_is_enabled(struct regulator_dev *rdev)
 	return 1;
 }
 
+static int qcom_ipq9650_refgen_enable(struct regulator_dev *rdev)
+{
+	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
+	int ret;
+
+	ret = clk_bulk_prepare_enable(drvdata->num_clks, drvdata->clks);
+	if (ret)
+		return ret;
+
+	drvdata->is_enabled = true;
+
+	return 0;
+}
+
+static int qcom_ipq9650_refgen_disable(struct regulator_dev *rdev)
+{
+	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
+
+	clk_bulk_disable_unprepare(drvdata->num_clks, drvdata->clks);
+
+	drvdata->is_enabled = false;
+
+	return 0;
+}
+
+static int qcom_ipq9650_refgen_is_enabled(struct regulator_dev *rdev)
+{
+	struct qcom_refgen_drvdata *drvdata = rdev_get_drvdata(rdev);
+
+	return drvdata->is_enabled;
+}
+
+static int qcom_ipq9650_refgen_get_status(struct regulator_dev *rdev)
+{
+	u32 val;
+
+	regmap_read(rdev->regmap, REFGEN_REG_REFGEN_STATUS, &val);
+	if (FIELD_GET(REFGEN_STATUS_OUT_MASK, val))
+		return REGULATOR_STATUS_ON;
+
+	return REGULATOR_STATUS_OFF;
+}
+
+static const struct regulator_desc ipq9650_refgen_desc = {
+	.enable_time = 5,
+	.name = "refgen",
+	.owner = THIS_MODULE,
+	.type = REGULATOR_CURRENT,
+	.ops = &(const struct regulator_ops) {
+		.enable		= qcom_ipq9650_refgen_enable,
+		.disable	= qcom_ipq9650_refgen_disable,
+		.is_enabled	= qcom_ipq9650_refgen_is_enabled,
+		.get_status	= qcom_ipq9650_refgen_get_status,
+	},
+};
+
 static const struct regulator_desc sdm845_refgen_desc = {
 	.enable_time = 5,
 	.name = "refgen",
@@ -90,6 +161,19 @@ static const struct regulator_desc sm8250_refgen_desc = {
 	},
 };
 
+static const struct qcom_refgen_regulator_data ipq9650_data = {
+	.rdesc = &ipq9650_refgen_desc,
+	.has_clocks = true,
+};
+
+static const struct qcom_refgen_regulator_data sdm845_data = {
+	.rdesc = &sdm845_refgen_desc,
+};
+
+static const struct qcom_refgen_regulator_data sm8250_data = {
+	.rdesc = &sm8250_refgen_desc,
+};
+
 static const struct regmap_config qcom_refgen_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
@@ -98,6 +182,8 @@ static const struct regmap_config qcom_refgen_regmap_config = {
 
 static int qcom_refgen_probe(struct platform_device *pdev)
 {
+	const struct qcom_refgen_regulator_data *data;
+	struct qcom_refgen_drvdata *drvdata = NULL;
 	struct regulator_init_data *init_data;
 	struct regulator_config config = {};
 	const struct regulator_desc *rdesc;
@@ -106,10 +192,23 @@ static int qcom_refgen_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 	void __iomem *base;
 
-	rdesc = of_device_get_match_data(dev);
-	if (!rdesc)
+	data = of_device_get_match_data(dev);
+	if (!data)
 		return -ENODATA;
 
+	if (data->has_clocks) {
+		drvdata = devm_kzalloc(dev, sizeof(*drvdata), GFP_KERNEL);
+		if (!drvdata)
+			return -ENOMEM;
+
+		drvdata->num_clks = devm_clk_bulk_get_all(dev, &drvdata->clks);
+		if (drvdata->num_clks < 0)
+			return dev_err_probe(dev, drvdata->num_clks,
+					     "failed to get clocks\n");
+	}
+
+	rdesc = data->rdesc;
+
 	base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(base))
 		return PTR_ERR(base);
@@ -126,6 +225,7 @@ static int qcom_refgen_probe(struct platform_device *pdev)
 	config.init_data = init_data;
 	config.of_node = dev->of_node;
 	config.regmap = regmap;
+	config.driver_data = drvdata;
 
 	rdev = devm_regulator_register(dev, rdesc, &config);
 	if (IS_ERR(rdev))
@@ -135,8 +235,9 @@ static int qcom_refgen_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id qcom_refgen_match_table[] = {
-	{ .compatible = "qcom,sdm845-refgen-regulator", .data = &sdm845_refgen_desc },
-	{ .compatible = "qcom,sm8250-refgen-regulator", .data = &sm8250_refgen_desc },
+	{ .compatible = "qcom,ipq9650-refgen-regulator", .data = &ipq9650_data },
+	{ .compatible = "qcom,sdm845-refgen-regulator", .data = &sdm845_data },
+	{ .compatible = "qcom,sm8250-refgen-regulator", .data = &sm8250_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, qcom_refgen_match_table);

-- 
2.34.1


