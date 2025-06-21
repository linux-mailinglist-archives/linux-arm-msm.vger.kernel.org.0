Return-Path: <linux-arm-msm+bounces-61946-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D57AE2B13
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 20:15:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 370B91898840
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Jun 2025 18:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B8E7270EDF;
	Sat, 21 Jun 2025 18:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aRDdACQs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46EB270571
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750529664; cv=none; b=ddcs/m+sDd+JHrsPeC4CrdoK1LLh9+GChrbM6JELeoLB71SQGZxUHcwmc0kcwQpFYErtujcUlerPevg8ixdNizhkakumvDNZ/RhKjmc5tfo+T89+lASYKxRyoJ+hR4MZRkwVsmVqXHDVPnhzrFIk+MNIFCUDwZleYkg34P7IL0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750529664; c=relaxed/simple;
	bh=JNYxpLLFOBRtvMlzQKm/ZNif0iwVlobtKiwFXihfikY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCRolvd+1v0HIZyOweXfj/vdj1kHvVqnk3u6wtBoS9xsb3pmPZJvdNqQhBqmvBktd9YwewGyFa2GqpcY44maBZE1YoK7nFdbqIwN+F80dxxE6XVrIwiumlNTS/Vl1xgL4MYPODv0o/psk4om7Edo/BgD3iUC4+jEXIz80Uauua4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aRDdACQs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55L6S1dc023478
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oirU1+a/+8yORbmhMEzS0Sl226rFq5hViGnYuTM/r30=; b=aRDdACQsnsIKaPsC
	6EZNmwi6rj2coudCih1V8klJVqj86soO3SEdo7N3QcThVWq9zCL/Ok0AgjQDprBZ
	wLa7VQ8+Ma61A45+ZrN2kim6u6Z5FocCufIEQ6NlgBlRU5i1M474Pd23FQuEpKWc
	bkS4OyaX04vTHy+BG6xwGfowwQvtecDUoXQtjzcHVLjB45ltYY6mvf8nKjgSoSQp
	00JloOXa6c5e+SL9s0MpbWgdjpe3cn536etUE3XcsS+ZQMK/nxYvnvIHWZWNq3rr
	YcX85/P/hMtn8VfPT7J72i6elHDHBK+Xyg4RmwDEoklbueL+dCQDDbp/y+7jD1N8
	OUtz9Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dpqtrugq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 18:14:21 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d400a4d4f2so238271385a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Jun 2025 11:14:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750529660; x=1751134460;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oirU1+a/+8yORbmhMEzS0Sl226rFq5hViGnYuTM/r30=;
        b=AYrSDM1ugWmXSFFSabdxpzpqOaYxSD1FzyR/Y9b2+64sf08hkrotn5nl9Q2sVkrc0R
         iPKQOf/8vhis2VqGTDiuVJ4WuUvx9IzNBgzjmb9UfbpP7T8SZUoUHKp+mbIl/zocDJ79
         bd1LoSon0U474/mxfaZ2k9WxsiNLd71kZZeNiDmh/vcJKeAOE/SjI3Fw1J/L2uqukMkU
         Y8apLFRr7sm9ED87yt4xpHwBf2MpZERt4YgOy7jsRkIZhwEb1VPZ+GBn4IGxO+qKJgCS
         y+/KlVoZL8VMp6CbP9Tg2pvJhxn2VUFUlYBKOvHiNJcH7V5WfpA4AP2VYhfkXQ+fG2w1
         aUNw==
X-Forwarded-Encrypted: i=1; AJvYcCXqplg7X1zO26j4580MeXKPEXJb91VjBEPsczF1uKp3JUxiAYYqOSiv761j1oHPiYxdEU3dJzEo+Nn6sxn3@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd7+9A92xwZmhcmVHGBNQJ3vsUVYXEsGy+kPFoCvO9ceW8m95Z
	jnU+cJRXjPi7xvizI6JEZ7y+i34N43XMk07bObQd6meywmx+zY0yQx0NwKSpexJCTElw1DrtNgG
	EJ1bCrFlC5PqcNEy697TPEVrhpL7H2MjTW0RUaGOGq0/gWo531BxMay5ch2GhbY28p/wM
X-Gm-Gg: ASbGncveNdFQD0DmQ4OCvKflKOp/ELeqHPElZLwpT7OUBSbLHnIicy8WFIYqKdTrtgs
	HXOEmb0ympbZthXgVoLTkXGBxoamGCAVAgi2tdM2JT3gNgV3DpO99LPkB3ApsukPl5IJ+vHBDrD
	i4sBO4dN+8VAolwViIcct0S3rLzQOc6wpwDHVhtLMq/2aAOES40GuoMXX4LQa/JsvlIrFi1Q7/b
	Rb6EI3Zr05N0mXOvd+Esp2W5OVUF7I+LF4ZmyknlPBFeQ0MdIUeAqdZVWiIfWKqA4i94+JYP5Dd
	nt1163Xi1JEPFxADLhPSwambyAvPpiawwb7RgJQmoL5RitDFCSbPEfxscSAWxGkeUPWr60MupKB
	wYwd/fphskXBRS/v7zC9XBJUg1jxaYleGQX0=
X-Received: by 2002:a05:620a:8087:b0:7d3:a7a7:27ad with SMTP id af79cd13be357-7d3f9923f29mr1085888785a.37.1750529659590;
        Sat, 21 Jun 2025 11:14:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBm728IxfVCsHScLqUKxUSwnu6QjuV90MNM2egI9dUzP6ktUhVo2klu+wAiUSpjtngW1id+A==
X-Received: by 2002:a05:620a:8087:b0:7d3:a7a7:27ad with SMTP id af79cd13be357-7d3f9923f29mr1085885285a.37.1750529659186;
        Sat, 21 Jun 2025 11:14:19 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414cf36sm752336e87.86.2025.06.21.11.14.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 11:14:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 21:12:59 +0300
Subject: [PATCH 4/8] usb: typec: ucsi: yoga-c630: remove extra AltModes for
 port 1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-c630-ucsi-v1-4-a86de5e11361@oss.qualcomm.com>
References: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
In-Reply-To: <20250621-c630-ucsi-v1-0-a86de5e11361@oss.qualcomm.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2166;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JNYxpLLFOBRtvMlzQKm/ZNif0iwVlobtKiwFXihfikY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVvZzb6rUS5eMMljhrS0Q+E/0bKqx4EhaapoTC
 S/gAg8Wn3mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFb2cwAKCRCLPIo+Aiko
 1cxcB/9Cy6IVelfifZerWEZXrYultMWDVJdyoWiBy6c0sL9bdpy6ECtRtiIw5OaGPpz0F6cwEYE
 x44jPn8Lz3vuShxXYwFwp1mFWQIJeidrdEKh5elCZDfvRVdXZqMCvQL6zFkUtuXP/wkBIAIZgIL
 Ipo3XzsKrczew5P7JvHGrYWtPIE3+pr6VZY4KNym4wxbjxXYlZkxeTzSRpc2SzG2NyxpNSIAf6T
 UMU9j+jmu3iacNjuVkjTrJJDuvurdsBq1rVYzH9mK0yBK8r3/JAWUES/Bc1q9bbBgXd28dpRdm/
 tRNp6uTiYNnpB3SWqkgUMhk01YUo3xCInk21AWqsJ5CAqimA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDExNCBTYWx0ZWRfX/X6NyGXOTO1C
 jk1CF+k3WCGj2AALRfS1kSDyQahfa5tzkCZFDNkS3FKKtfQHtcn6ahhmPfPX33N64CXTpS1POJn
 QFygdAGCQb/Sm4Fk0UGzb4+2ajrHjJRKDa7eBxSjhlwUJ6ZmqQc5vl6UFDN701EOrLoOZ1nrn98
 zd7e1LBRSFJGTkZiTqrGApVDu4lykOCjGiuBGpQux/kJbzS4GImN3gOFdxr6/9zjAqF+UPk/L+K
 J/pcMQ6HEzIe2TliTl4bkob4UqP8RvaDI4Br7P3yepKOnv909U0kaNqERYnUH9nC9z0kzSf6yga
 2OxLkEwzZO9xkQnUhQvKkvMsopWEtisxf9UCHp656cUw0+HNgsQ3RO9ZxFrwW77BLIqMTvWVSR9
 9qjVAXL8s/Dj/B89Rfbm+kVy1E/O7tn65tX6C73ZAKs6AyWi3rMMzYygZprywgQ4loX5kWZJ
X-Proofpoint-ORIG-GUID: DNjHWX3UOLk1-D9zuBYLF-BpiVz5GoPG
X-Authority-Analysis: v=2.4 cv=cbPSrmDM c=1 sm=1 tr=0 ts=6856f67d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=L9Ihpj2tn0joOnW3KS4A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: DNjHWX3UOLk1-D9zuBYLF-BpiVz5GoPG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210114

On Lenovo Yoga C630 the EC firmware is buggy and it cat return altmodes
for a device pushed into the port 0 (right) when the driver asks for
altmodes for port 1 (left). Since the left Type-C port doesn't support
DP anyway, ignore all UCSI_GET_ALTERNATE_MODES commands destined to the
port 1.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_yoga_c630.c | 23 ++++++++++++++++++++++-
 1 file changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
index 7cc1342d6e2f1d2c6f5b95caa48a711a280b91d3..2005f64ebfe43ca2bcada2231ff99c578fdce877 100644
--- a/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
+++ b/drivers/usb/typec/ucsi/ucsi_yoga_c630.c
@@ -71,6 +71,27 @@ static int yoga_c630_ucsi_async_control(struct ucsi *ucsi, u64 command)
 	return yoga_c630_ec_ucsi_write(uec->ec, (u8*)&command);
 }
 
+static int yoga_c630_ucsi_sync_control(struct ucsi *ucsi,
+				       u64 command,
+				       u32 *cci,
+				       void *data, size_t size)
+{
+	/*
+	 * EC can return AltModes present on CON1 (port0, right) for CON2
+	 * (port1, left) too. Ignore all requests going to CON2 (it doesn't
+	 * support DP anyway).
+	 */
+	if (UCSI_COMMAND(command) == UCSI_GET_ALTERNATE_MODES &&
+	    UCSI_GET_ALTMODE_GET_CONNECTOR_NUMBER(command) == 2) {
+		dev_dbg(ucsi->dev, "ignoring altmodes for con2\n");
+		memset(data, 0, size);
+		*cci = UCSI_CCI_COMMAND_COMPLETE;
+		return 0;
+	}
+
+	return ucsi_sync_control_common(ucsi, command, cci, data, size);
+}
+
 static bool yoga_c630_ucsi_update_altmodes(struct ucsi *ucsi,
 					   u8 recipient,
 					   struct ucsi_altmode *orig,
@@ -98,7 +119,7 @@ static const struct ucsi_operations yoga_c630_ucsi_ops = {
 	.read_cci = yoga_c630_ucsi_read_cci,
 	.poll_cci = yoga_c630_ucsi_read_cci,
 	.read_message_in = yoga_c630_ucsi_read_message_in,
-	.sync_control = ucsi_sync_control_common,
+	.sync_control = yoga_c630_ucsi_sync_control,
 	.async_control = yoga_c630_ucsi_async_control,
 	.update_altmodes = yoga_c630_ucsi_update_altmodes,
 };

-- 
2.39.5


