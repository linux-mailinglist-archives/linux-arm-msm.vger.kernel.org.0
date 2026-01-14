Return-Path: <linux-arm-msm+bounces-89077-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5394BD214E4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 22:20:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A703530A5E96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 21:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 390CE361657;
	Wed, 14 Jan 2026 21:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bNzrZMno";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dQGBD8iU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6893836167F
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768425493; cv=none; b=L1FOn+eSeIpju0DC+K+Ksbxo4M8AOaFjthccTDJOnKb5w93hCSYiXREbRueKJF/4HxKmhyOV7k9CqTbUOwLff9EB2nEglxFidOeryI7R5LOIshqFBwUq9hJISQukwmb0L+5dTRBP1l2Sx8Ab/2d2Zgw49hAZ+HLEZyrkksYUpRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768425493; c=relaxed/simple;
	bh=EJ7d0Ndnig4nWkDLoi/NMmJhv2TXy74A0dReOD3DHy8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mYD7DYBgPsxXtqyF4TdX/ovLWBGa/H5vKLmQLEkKEMfesNpdrRO3tQy+cG+5I6nO36spuuyVpS7Xh/ShG2tgePY+5DkS0JiyA5yLbBLsyO9a7hzB4M/JNf2XBKKOHmpeXHwNKLuziWBy5h5GiQZMzN/ZyUuRPpKT02Wm5soi98Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bNzrZMno; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dQGBD8iU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60EKpovO1853489
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=u2SXNrGrEV0
	PRwQj2xTrKkbIj9XU3CjNd0NJo1lMkv0=; b=bNzrZMnorDBctsgoFoMlc+kMJlK
	XTErHty2hPBgKSPuRq1tZ/eiT5DWdZFJaGywVCL81gW2hfO+3E8U7akxO2g+ee+X
	UFwjLw6wy8fVblcMaWmDVtLPWgvda0h1kPw+3NQbD0I+AL3esTjFNrvHMYs5wlIM
	i1QAHFsONAt7ohS8UUSdF9uS/ZXn6WKQPYU1h5qP8dxRnO+nG/lCOXMGMJP8WLi3
	vWbIUgTlxWxkVe+DsK5qeKWj1FZEUuk+w5H7+mtvqDpKQ6BvW3JBfHW9PvXHuLvK
	ZfAVNLTETAcO1dqlgQmw2thP2jS3jlXW+EKNcNFqbxA0LL5FDTjIDeZ/+QQ==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj8821k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 21:18:05 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-11f4617e256so1416911c88.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 14 Jan 2026 13:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768425485; x=1769030285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2SXNrGrEV0PRwQj2xTrKkbIj9XU3CjNd0NJo1lMkv0=;
        b=dQGBD8iUNoDvkZWlbcyOaslvFLuzqIGOnfPPtTF1Sj+D0G2l9fyHZXKYnNvz3/E8qN
         QvllrndhpsNpBPPODKNNBM0mKt1SH8Z1BMia2VgeUi76FxkgsDNwdTtVZHSNTTRV8eqb
         Xshn436IqC+86uDizHeoRN5AnGRSxUTUa4wIYB6QboNe7aqe4pgZw3B6SwhPTd+3qLbU
         j/BZkUiCKwX9WwRxEg9X/MqQzMoHJ4qsmblQ9tO3AWlbc2omyjQqwr+lKaNyFDug2K2x
         M8nFC3iPsGWSl7gwkTKbElDTIy48TTJsFiOSQDtg7YyjQeFm8UMU8UEt07oJccBAzxEU
         g3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768425485; x=1769030285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u2SXNrGrEV0PRwQj2xTrKkbIj9XU3CjNd0NJo1lMkv0=;
        b=miEJ0KoIT4w2S+7LiJlIi19HdYacoOvPgHkPn1nRtfBMgGWdgQ8Nec/sXColdVo9ik
         sutAzap5tllWHyS6CYhwHOLrK9tuU3JzJolFywcsdjUCme2JgA2kqtZzq0E1MWJaVOSK
         /PUD5may6hrU5JBQZalsBp1Bg989opQaMkHTCRfdwYKnsvEjHF7VM0eyRoMl8Fe7cejS
         hX97jGQl5fTlzIBX0vS9FUQ0W3MTGzHz+gbu+VfyhtkTomHny8SMnxhVmBntJVmZINh0
         BrvscQ7mReMXPbidlWTshrxrbU+zzBJBfq7tORsD1n4ZlqKqA40J+avPlr26hebVdxLa
         o2XA==
X-Gm-Message-State: AOJu0YwJhts4YAmlI4H75U7l3HH+WCrFSZMeT8Viq9NK7JbUq0/uxS4h
	A9kyYQ+7BeJ1a97IW/IRsJ5HoxdCqOLSxJQkDwL3hQXPsxicxztU+y5Nea/TT+zQyxnCTf+OgAO
	Tg1XuUQp8gvQOwW5XTms0pUrfpKqxQPaZttsynkmEU5bdOWafGYIA29DxGkbUatRVpcGN
X-Gm-Gg: AY/fxX6fOknX4s50voOc+/LmcujEIiMqOXccKG50geXuwyGN+Cyuuq7E0y9QwQ0l0a9
	rxTo/AE6b4XP83LpxzlWBsZtBhmPUFsNSTuo8G9K5HvSsLKfdioB8rzF+cs6AUcC//Jo2BcahoX
	qid/tKzX6fhrYjTC8C+yi5C5pccQ3XYV5jyb5KW8OZBxVPi8qDRVko2BZolF0qnMWQY5X2VuIiX
	r35jUlUIGRST4n15G9+EZw/NyBAy6u/bGiyaBFV+qFjkFpAZksvGNeCxZGulge/yEi7kdL2VAf5
	uXUjjr+9jsmh3APhbwkMGDz3ygLK5IHhIwycjMc/NC2VpvWmnUjDJozCl0CqJIomw0tdu3BTXY0
	hzzGq++nKXEibPZPXegTYC63xfOzbP5OLv8/7Wt41IMjnvnqCYxvQ0x9ITAa3oSylTODGPPX0
X-Received: by 2002:a05:7023:88d:b0:11a:e426:911a with SMTP id a92af1059eb24-12336a5cbb3mr3795124c88.15.1768425484692;
        Wed, 14 Jan 2026 13:18:04 -0800 (PST)
X-Received: by 2002:a05:7023:88d:b0:11a:e426:911a with SMTP id a92af1059eb24-12336a5cbb3mr3795101c88.15.1768425484132;
        Wed, 14 Jan 2026 13:18:04 -0800 (PST)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121f243421esm32167118c88.2.2026.01.14.13.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 13:18:03 -0800 (PST)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        abel.vesa@linaro.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH v4 3/4] usb: typec: ucsi: ucsi_glink: Add support for X1E80100 compatible string
Date: Wed, 14 Jan 2026 13:17:58 -0800
Message-Id: <20260114211759.2740309-4-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
References: <20260114211759.2740309-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Wo-G1UDqDgLciXMThQBjJJ1Qnj1nEBS8
X-Proofpoint-ORIG-GUID: Wo-G1UDqDgLciXMThQBjJJ1Qnj1nEBS8
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=6968080d cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=5hyoARb301K5iUekGmwA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDE3NCBTYWx0ZWRfX+jlMp0c7qV5g
 fhs6eYgH+WJdZPdZdA9DfXwt/hdfDRqSnNXOg2WRgWpkWKQv/OLnFdBuNByNP0L5Du85jGtKo/m
 aQe8AICl9aIVoQZdbN6r8IGV9jOJaprobw4SkvhV1pKN5gleD1qvzwXwUmXLItVncPfzORB+P8R
 asfEynXYr8kllRX4ffRnG/HUXcj5hzDrTvCRQYOEMHR3gwlC4xmvaduMyyLchdWGYAg7fGdvdpK
 ElzaiEh49W2BhbBYU0dUGtTAR16GNts0mhlEmMjtTw0n5qSw6QtPoR/CzvoyFItps1EzdGBPBUe
 dMHp7WFwYCTwNQG0/8deFtY8FlwlvlY2EwLweWuLuy2a2O1Ur60V+7jic8XHTDGmBcttgILafwx
 ivD3ylWEdpUGNP0pLNjhIWLF+JS2lkd50vjVXfdMg9f7dTBx+xJOIleDsVpLmQHp2Q9sOy3clvS
 XFUg0Ur8clea68NjwJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_06,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1011 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601140174

Add support for the X1E80100 compatible string which needs UCSI_DELAY_DEVICE_PDOS quirk.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_glink.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_glink.c b/drivers/usb/typec/ucsi/ucsi_glink.c
index 11b3e24e34e2..e700c6a58a46 100644
--- a/drivers/usb/typec/ucsi/ucsi_glink.c
+++ b/drivers/usb/typec/ucsi/ucsi_glink.c
@@ -379,6 +379,7 @@ static const struct of_device_id pmic_glink_ucsi_of_quirks[] = {
 	{ .compatible = "qcom,sm8350-pmic-glink", .data = &quirk_sc8180x, },
 	{ .compatible = "qcom,sm8450-pmic-glink", .data = &quirk_sm8450, },
 	{ .compatible = "qcom,sm8550-pmic-glink", .data = &quirk_sm8450, },
+	{ .compatible = "qcom,x1e80100-pmic-glink", .data = &quirk_sm8450, },
 	{}
 };
 
-- 
2.34.1


