Return-Path: <linux-arm-msm+bounces-86777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5F5CE5F58
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 06:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 813AF30245E4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Dec 2025 05:06:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E0C29A32D;
	Mon, 29 Dec 2025 04:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fs1FFbJg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJScILJv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A68F292B2E
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766984174; cv=none; b=jisoUVHmUBXVZMJcTeMbNY+cqyHUKYh48eFMtjAAkv7MHAlhL8+LBnli00IizzgSqBXE4UjDwJFCwzUqQxSk1eNZT1GxyhOz7TvmQ+SGqV5DRpyO2YwBinri5E09OtMBpAbkRnCaZ2d3+/WvN/WPzgNxqfT6n+CJaa9Vr1ZHDkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766984174; c=relaxed/simple;
	bh=dd9jcM7VhtLSe01qVKxg4cqsefq6fIxIf68B+OdANWo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C2/bLdzfLl4O1uCUMsRpmQsaCiEJb/1s52FPimjWs0gxYw45nYiku7P/4WsU+DqStxIQ7Dwm0s+/k7YCD4tOjQFWZs9f1ZUS/XeVtuUNoQ5rYXEnIJoTcJvQx1OfHbV/Gb/Bufl4KjClS4bFeHKb9qW/e7VNoI6bCVv0VBNilK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fs1FFbJg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJScILJv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSMIW3p3647987
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:56:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6DIBNmtegJx
	j/sp5FwSU/fdzZauMmtoR986IcxrENk0=; b=fs1FFbJghCYmmqmmhZq0mGC67mi
	JycZwI2vrl64SdhvOG1vWGw3ZbkchnhXmRY49fJmPoouHURZYxTchUpSmvdMIApj
	27eLTrs4kuDZN4oHvFwN1JHspQLBJfOrxGzB68upTFYGsJyMGBhsvUad9g/vCgzD
	QBSyJx5B9m1O2IPAM/hVPO+S/7sJc8Ru6t760DWlaFHZg6ptE/59VxRNnyl96Od7
	75SnMGkPeYQ+t72LRMIcPfotk1duJAJB/TX1rxacTeNDEteKNczvYFtbqYXXdCYr
	9Zv85Np9lC1PNMzbDBcqFJzzZED9VE2kKI3ob0kGFmaeknLeJ5bH2XtWaxQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba6sg3d84-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Dec 2025 04:56:09 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7aa9f595688so13595167b3a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 20:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766984169; x=1767588969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6DIBNmtegJxj/sp5FwSU/fdzZauMmtoR986IcxrENk0=;
        b=BJScILJvzWKrrF9RjND62tzPn9QUkZtkykuep6tyLXgjO6wc4wnrO7NT65qW24cvrY
         IccMqEhVeC5bFr8SITKvdYNobnDI+YMu4etXspcLTj9bS14+1YOLSVee0Dth67+t22Cc
         RU+t1hfiwp+LP3ccnsW5h5JSnXW0adkqgBwT4DIeE4HPzFW7S9/xEFc67q7bHpyPsD/W
         xWkIB0Ozrk4r6LZiTKY6KlA2mcfN0M0zQ4qDpCmae6hRFq72W/LukUmXO6f9gZC7vKzc
         mt6KUkO3M3NTpOcgCokro0QyDKWuljorQ43fk+x3iYRzDHA2HzRPPHF3Weoia7HNYgZK
         e6HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766984169; x=1767588969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6DIBNmtegJxj/sp5FwSU/fdzZauMmtoR986IcxrENk0=;
        b=Hs1TdsdT2VxGumwEGRbIXoEbpyHHBuipLKB9GzAAMBqCR9KSoS2N15YGfuhpM0RoyH
         bgsoGAF5gIHWHclTXzy+qJU9Cb1yYnrByYizUoSNEzogKtBRWXW1zGXkvIzCuIMQ38sU
         I9slt8WENfDuwsoQcY0ORB6L9Ho24mnX0Lvh2sxn9BUKUBdAbIakDzHbwbDHpo1CJgyP
         sSmiiHEOSk8dRQNVeT9GUnKKr4QmA1niGgNKEZdbFg0mnCXZWzPI/1YtbddcDhLhAHD4
         PKDpxCrNUV8qL1OwNCIWDzG9Y4MW9swlFw65pSRUnHfhOZ/Lh9OXccx74TFUrd3wVcZ9
         2FGg==
X-Forwarded-Encrypted: i=1; AJvYcCX9KhSJ5aJe81kCMLwCCM6bg3fwAr1GGyV9GAxmx6uPEcAAk/QTE3a8xX9dTnKwQVs+hx+YIEKyzwqbuWGL@vger.kernel.org
X-Gm-Message-State: AOJu0Yxi5heESxiEE5ajqNEqQjZEFNcwAmYX2Q/PI8NG5b1xMWv4tSEr
	ACdQkFt1AKaasJpq24v8J8dXsIoIGLSn07CRbE0zv3clVD2/6fsPZXxJkt3QJYuATcV9Nx5zy2k
	0O99QvPpketetgaBCaYKSHMTCo+3udxw8/Q8YORZtaeoYFstvmhm/RKT1s7PZYJYWPNKj
X-Gm-Gg: AY/fxX4sjhhhDPHU2/r/uYS+5nhvhDug+QWYixpw+bkBBm2ZZE3xNEaVaVgTVTlxAqM
	TfSGc4ZvXdPDwr5Cf+32MCeqft3GHVWXSGRbwOYXnO98cT5ss3GTfItqn/ky6TBIEhqdAOaH7j6
	ZRl4W6aMPvkrZh9PRJoN5M6ngEUFbrn0Idg83ecN5iFFaWokNjzeVgzEJBb9N0wtMUMBrD/jqoU
	fdKvNWYQrQ3Zig6h/3aAqdMNZwFxfCnW0LJUA5Uosn51h4V9Ha32pZtZyQNNLBCegB1bYtkLIsP
	j08KU6SmYxM3ancmF1r53hkqSRzISr2GQ8jjXhkyCKna4T+BlhuVBrfk/R7+TD1pBKcPxAplEBQ
	x6bZnNkZbo0SFAitg/3s43vce31X7O7QPjgr23XVuxqo=
X-Received: by 2002:a05:6a00:3386:b0:7f2:1951:c130 with SMTP id d2e1a72fcca58-7ff66d5ff66mr27353177b3a.68.1766984169003;
        Sun, 28 Dec 2025 20:56:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHR7M1yhRS750JdicCCmdoq4t+9wBUNIGOHfOwPohqIVn6OoIL6o7IqcuPL0ykrZIuELU6Xjw==
X-Received: by 2002:a05:6a00:3386:b0:7f2:1951:c130 with SMTP id d2e1a72fcca58-7ff66d5ff66mr27353156b3a.68.1766984168483;
        Sun, 28 Dec 2025 20:56:08 -0800 (PST)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm27902080b3a.39.2025.12.28.20.56.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 20:56:08 -0800 (PST)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Praveen Talari <praveen.talari@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        alexey.klimov@linaro.org, krzk@kernel.org, bryan.odonoghue@linaro.org,
        jorge.ramirez@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com
Cc: psodagud@quicinc.com, djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
Subject: [PATCH v2 10/12] i2c: qcom-geni: Use resources helper APIs in runtime PM functions
Date: Mon, 29 Dec 2025 10:24:44 +0530
Message-Id: <20251229045446.3227667-11-praveen.talari@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
References: <20251229045446.3227667-1-praveen.talari@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: guH93yL8kfUe_SoCBBtQEngACdMycJ2W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI5MDA0MiBTYWx0ZWRfX3ycC7PDEZuiH
 uZRKpmn0cFpnXeyjjaDxaYoo1BIDjffvczhFdhIXUUMkOEI4qfYeP3voVdpzyn6E6gEr7ZbslCp
 gS6GlFwi/xJn/uNQRszUK2mP6tJ+WdifpBOmozaJgsxXBEaawQ5O/EZaaOQQxHjRYaHNZmau8uG
 MUNSv5B2J5LghIP5dHFQQV8tqwA0ROVSzTGIfYSUdT0bBClCtvPZn7OmvKV+DE1h5SUVW571Afs
 QDN1PSrZURxgylvJzwr4or3DC2vTfNvlSSBg2K7/NQVA8oDf/8XVjfCt/aLZ4VxmPl/NB7ypRKQ
 GQTBA9NHY+vbqsy/7vxqzStg9p95VG7EVJRIzao38aUVuXkd9OT9oSQB64a1XnfrMETj93djInR
 T9L/HCPOwAgeVTaulPW9hRGobpJNrwWRzjkqLMUZ75NCP2N6ySuTqrzWbl4fU6IyXLhND0by5bU
 8xZLQA3mNNygVqzYnog==
X-Proofpoint-ORIG-GUID: guH93yL8kfUe_SoCBBtQEngACdMycJ2W
X-Authority-Analysis: v=2.4 cv=Y+L1cxeN c=1 sm=1 tr=0 ts=695209e9 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=3PeDo36KSfG0vlEF63sA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-29_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512290042

To manage GENI serial engine resources during runtime power management,
drivers currently need to call functions for ICC, clock, and
SE resource operations in both suspend and resume paths, resulting in
code duplication across drivers.

The new geni_se_resources_activate() and geni_se_resources_deactivate()
helper APIs addresses this issue by providing a streamlined method to
enable or disable all resources based, thereby eliminating redundancy
across drivers.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
v1->v2:
Bjorn:
- Remove geni_se_resources_state() API.
- Used geni_se_resources_activate() and geni_se_resources_deactivate()
  to enable/disable resources.
---
 drivers/i2c/busses/i2c-qcom-geni.c | 28 +++++-----------------------
 1 file changed, 5 insertions(+), 23 deletions(-)

diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
index a4b13022e508..b0a18e3d57d9 100644
--- a/drivers/i2c/busses/i2c-qcom-geni.c
+++ b/drivers/i2c/busses/i2c-qcom-geni.c
@@ -1160,18 +1160,15 @@ static int __maybe_unused geni_i2c_runtime_suspend(struct device *dev)
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
 	disable_irq(gi2c->irq);
-	ret = geni_se_resources_off(&gi2c->se);
+
+	ret = geni_se_resources_deactivate(&gi2c->se);
 	if (ret) {
 		enable_irq(gi2c->irq);
 		return ret;
-
-	} else {
-		gi2c->suspended = 1;
 	}
 
-	clk_disable_unprepare(gi2c->core_clk);
-
-	return geni_icc_disable(&gi2c->se);
+	gi2c->suspended = 1;
+	return ret;
 }
 
 static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
@@ -1179,28 +1176,13 @@ static int __maybe_unused geni_i2c_runtime_resume(struct device *dev)
 	int ret;
 	struct geni_i2c_dev *gi2c = dev_get_drvdata(dev);
 
-	ret = geni_icc_enable(&gi2c->se);
+	ret = geni_se_resources_activate(&gi2c->se);
 	if (ret)
 		return ret;
 
-	ret = clk_prepare_enable(gi2c->core_clk);
-	if (ret)
-		goto out_icc_disable;
-
-	ret = geni_se_resources_on(&gi2c->se);
-	if (ret)
-		goto out_clk_disable;
-
 	enable_irq(gi2c->irq);
 	gi2c->suspended = 0;
 
-	return 0;
-
-out_clk_disable:
-	clk_disable_unprepare(gi2c->core_clk);
-out_icc_disable:
-	geni_icc_disable(&gi2c->se);
-
 	return ret;
 }
 
-- 
2.34.1


