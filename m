Return-Path: <linux-arm-msm+bounces-89477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8AFD389CA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 00:23:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CD8F30EDFDB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 23:21:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBACE322B8C;
	Fri, 16 Jan 2026 23:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjrCbHT9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WHQfUpUW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9955B317702
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768605679; cv=none; b=S1ObmkCeBuC8eu68Hz/os4MTI2oyvIGzObN7Qs/Iw4PbbuZv1ewc5IQO4FRsme8unIDSkX5VY9NE6ZfviYPYgl4ePo87aWbulwADymIydJvBxb7QzNFpE1YTdsWVbas765cRoi1psxuY22ojwhD5jM27sntV8nGkbrUr5RX1fys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768605679; c=relaxed/simple;
	bh=9B1FnLaHALjYfJ8RPCg5eOxKik1XLzUO5cKu4vZ+ZZw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C6YY1R4b42E+CNA2QTpK+s8Apd+pV7jI+rzcnCei2UHq0t+9L1x1He+iot2tMaEjsJKYttu+mZhiVyOe2oGrnG7SNgkPLOKtaFjhOTcaVR4ekzijZYDMD9Ows+3PZzVgfNb8yEWcj6mFok4HM9hH00VjLn/VDXJUEqoMJsyZlvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jjrCbHT9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WHQfUpUW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60GNEL7h2192173
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1qylKAN4jaI
	gqx7JT64dI6YQstiaPDg+rYzw4T90x1I=; b=jjrCbHT9ad7FMPlIIlaPJ/C0/BM
	1AFKriWmjUFqj8IAXFfDlJ10BpXqzgzVn0RruFWXNtwlku1CyvhMuJgzRVC6/271
	plk4aJE1pOO06jIEmInlKZ682VWu01dZHtAwVkJsMsoROXeGHCkcyKr578YLeBnE
	6dtBUgnMapH/gKopOTdhTC+TiuXX3W2/7FRDL0HQ7+LSok8ugNIkmZwfoaXY63RO
	JBzwGBiSIJCmo1LSq8jUQ2dJq9MuOifcp+PS4jNqZ8phB1xXvLAiAAFNZqoNEvRP
	e16YNkzyBjzKWQp2UTNW69iSURciaBEunHkFxNoKQNAQn2gSuC8cr4nmsSQ==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bqvga0b2r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 23:21:12 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1233b91de6bso4727713c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jan 2026 15:21:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768605672; x=1769210472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1qylKAN4jaIgqx7JT64dI6YQstiaPDg+rYzw4T90x1I=;
        b=WHQfUpUWxIdb22saXBmXZw4MzbPDOsuxZzHtvpievIPTwcCyqgXxgE/Xxi0qsD2piJ
         //Sf3UsK6OIxoFG8pjbcc/AS5ZB3asWQhTG9RZQrB8i/BjEstIuzDB1WMbe1ZGl4Lb+Z
         kTsVVUVBLvIogvlhLCi/N1yx+jlSkIQ2m7T177BIHe+SPm3XcQT9DrU2cYmS9YSZrMdd
         Iwa8jciQOtWyECwbUvH7dmyFCokyz0JfjEeeMgJ62pFO3XeU2fgD/Tc0mLla3VbvOq4t
         rNppMopCIrzjfFl2hH+hs/GDySiq7MmVb03gCpZGu3Z+qs5uTirhgQGXLNkf4HIo65Zm
         0r9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768605672; x=1769210472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1qylKAN4jaIgqx7JT64dI6YQstiaPDg+rYzw4T90x1I=;
        b=Hda4BYabNu8o1AJe4GJKA4dqVr0fPlMvbz4P4rnQXm4pwgTIHIW4fT5hcPUyIlFWz4
         B1IttFqZYOYhyEhHl8aMqRz/D39gMSuowh6Z/5QEYz1v23Ze1NOl7gLfwvKYBOEha5jx
         mSflUeHmv1y9Hns6vdn566nTAvvrq7PvJNAAWGDeH+as6RKJ4/TpCgJ27isCrnkgYNht
         0/CemHPJ90RHiyF4a7lKe+swscaxMEHxuok8HEkwci8/rrLDzBXggGqpEhBi+ug/XIzK
         f/E+JU1HKugjxWmmxXvZI3GQV/DEI87qHr3O6zzEP1/LbqUJUyblvKsUoFyONo+TfV6z
         sfIA==
X-Gm-Message-State: AOJu0Yz0igKCQnA0sa3VMlizsHr9zrF0dVNVWpKyDc/E2DUqmSkyHiI7
	8LFGy+YqaHiwsVdctwmJnJE23/rlNdbqRpGj1WOaQ98DxCQOEJ9/8AU7R722sKkBbq2YcnGp3b7
	xHCPc8+2b8OpsTEhvxpcMPRd2+o4xCTUyZHiOt2BSWlqi/uUtcU1Bv+3812Vbv7HcrLty
X-Gm-Gg: AY/fxX7vdSa49Ue1ZZbV+k7/aYBNQCLPerh8Yl9ff2BKLJkvoMVFq0r0Hn8MTGX3J0x
	4YOzNUtgsNr5HNrMhbvyJfbY4UTjrMqSmgDYr5lSP5jmbkRn0C7hEdCYHMQAdPPUS7+N4a1FRvb
	4MYs9fJOsA7HlOYxo+uEJbxhJkUEc2kyaJdiq/OkapWeGG5Dz+LHiMIEAkZxp5WBrbKFM6jUl6T
	FVWzShR7LRvd/j2hG/WCgDqNiE3ma5JaFNhQw2VQWm/0gIqfL1nMIecjmZyJgPa2JHupST28rYv
	j/GvfO1dF0ab033+bLdzJkPCJ2gqqRXTBaBPGz+mB8yy6ZOKwVToCdiUHS3X9mNZkmv0On9i9Eh
	Dlmb5UCZD+HnJz1jPYCFwguf6IuJDhFQJBqTcHoT+nm+p3zDklXWr0efETOd4gdU=
X-Received: by 2002:a05:7022:6081:b0:11b:c1fb:89a with SMTP id a92af1059eb24-1244b35f486mr3286733c88.32.1768605671983;
        Fri, 16 Jan 2026 15:21:11 -0800 (PST)
X-Received: by 2002:a05:7022:6081:b0:11b:c1fb:89a with SMTP id a92af1059eb24-1244b35f486mr3286723c88.32.1768605671499;
        Fri, 16 Jan 2026 15:21:11 -0800 (PST)
Received: from hu-eserrao-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af10e21sm4611267c88.16.2026.01.16.15.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 15:21:11 -0800 (PST)
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] usb: misc: qcom_eud: improve enable_store API
Date: Fri, 16 Jan 2026 15:21:02 -0800
Message-Id: <20260116232106.2234978-6-elson.serrao@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
References: <20260116232106.2234978-1-elson.serrao@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDE3NSBTYWx0ZWRfX97HzCyCoqn9K
 RRQ76e31lK8dVqYv9oUkFu5fVny+pveNUzXxezmakhXt4OSJIWCwN+DdSR/2yDC9EGoG6VQMkLg
 SW6lkmagFRodN8J5ihXZ7sAS/F5whXqm79o4ZZWmP2tHu73+6aKrVZoxUJwaCaUR7cQq6bMk/x1
 TatpG4iW7T5Bl18ikMRTlAYYfVm7DiyLP6liSoPj4M1sC1Lsdzxq9kh3n7R1Y5PG8NX6qiESEzM
 LH/o/ZYFy2BCcq4m3BZLO6+eZASveba1/AUQQT+GHeyMcbaEweunjZhwLp8reIh8UCx/1hwBX7u
 4WuTf4AeTEZYiSF4dp8ZCSNK1wEyaGMoC5KHmhZcxBE1efBE6PUITBWJzUWrGKn3jrdKMZCGU2k
 m0ES7hw+JftwbvKDqP4VoTP7lIonSQuhHJZN/1HbZqKYJenTwjS/Om7e8cyZ5UXeBoM+XOUOnNt
 zIJ/0TvdY42wWkG/xFw==
X-Proofpoint-GUID: pF9fT2zpXYmhhMikGBySWgyz4y6QLqpY
X-Authority-Analysis: v=2.4 cv=Kf3fcAYD c=1 sm=1 tr=0 ts=696ac7e8 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iEam2xx7WbKG8qDqzoQA:9 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-ORIG-GUID: pF9fT2zpXYmhhMikGBySWgyz4y6QLqpY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_08,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 clxscore=1015 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601160175

Currently enable_store() allows operations irrespective of the EUD state,
which can result in redundant operations. Avoid this by adding duplicate
state checks to skip requests when EUD is already in the desired state.
Additionally, improve error handling with explicit logging to provide
better feedback.

Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
---
 drivers/usb/misc/qcom_eud.c | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/misc/qcom_eud.c b/drivers/usb/misc/qcom_eud.c
index a58022f50484..0ea6491f963c 100644
--- a/drivers/usb/misc/qcom_eud.c
+++ b/drivers/usb/misc/qcom_eud.c
@@ -168,18 +168,27 @@ static ssize_t enable_store(struct device *dev,
 	if (kstrtobool(buf, &enable))
 		return -EINVAL;
 
+	/* Skip operation if already in desired state */
+	if (chip->enabled == enable)
+		return count;
+
 	if (enable) {
 		ret = enable_eud(chip);
-		if (!ret)
-			chip->enabled = enable;
-		else
-			disable_eud(chip);
-
+		if (ret) {
+			dev_err(chip->dev, "failed to enable eud\n");
+			return ret;
+		}
 	} else {
 		ret = disable_eud(chip);
+		if (ret) {
+			dev_err(chip->dev, "failed to disable eud\n");
+			return ret;
+		}
 	}
 
-	return ret < 0 ? ret : count;
+	chip->enabled = enable;
+
+	return count;
 }
 
 static DEVICE_ATTR_RW(enable);
-- 
2.34.1


