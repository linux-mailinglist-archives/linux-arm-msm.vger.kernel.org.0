Return-Path: <linux-arm-msm+bounces-33162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6307F9912CA
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Oct 2024 01:08:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D3C721F23635
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Oct 2024 23:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4A914C592;
	Fri,  4 Oct 2024 23:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjmY41rG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471B0231C9E
	for <linux-arm-msm@vger.kernel.org>; Fri,  4 Oct 2024 23:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728083290; cv=none; b=KWF9C9DHk3tORZ8sCF8SAoOhrc4eQZBuDsfhIKgC8opKN+BubWBtk6sKlIgoSrW6azqbUAqPVfI1Xd82VKgC3eMYCHfnZKiSU94L+jahl+ZjsS/esRIX+m7mXO/yMMMpclwxpRJn996L6eZpZMH5/KjPCcp6M+Lybio7a16Z77c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728083290; c=relaxed/simple;
	bh=wJqJFJ8R6IqcfU4pG5rA+ohiin9Qc+w0iAw0ASC77rU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=XJ9Ai5VLcNEAPYj3hEKzOFyDp5J0J4DUJLPdCS26+qoZZcOTP+/qJh6+BJDXS5kTNcpp2pIhLyf7W8K9u1umxxokfGSSBvEG7SlEYEKs7KC/KnTeOKdgM42ftmxViHVu9i5j8/Ge0TLNH16DSD8KkxwCLTJ28YbAvgt+8k+/BxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjmY41rG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 494AU6it014900
	for <linux-arm-msm@vger.kernel.org>; Fri, 4 Oct 2024 23:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QgRNJuvX9W8ebgWdny6pM/
	HsObzPBVg3A9+xZAi0uZE=; b=TjmY41rGHKzzyyoA8hsbVAKxUcA3L2clxj08sV
	NX98a3JuT5dtEzz/tw7ABhpa2sYgCi4Xt6x0lVs4IEscIEEKeHN+ib3lcy9XWLAq
	1U6n2yRXDpPN1vWJmIB4DG+V5WF5VBMCEAtyuOignmK247Tlk1Ec5xJsj87TwmHk
	UmMej2sT5OeCljp72SJ8RMVTLYI7WTHEF9uxNkgMesXG0J9OUrebOrYuzcR5lW5U
	4d4qgU0mTRL5Ftf9Od8tEC91NVhVoGYPJbSyzaxvYcHKEGFcgKUOu3HsJ8P0zc7X
	4fezQlENTUOXEvGvVILccDSt4b7TKsfCELkh/R+dRk4h/AlA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42205e3g3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2024 23:08:07 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-3e27a10adbfso2088051b6e.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Oct 2024 16:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728083286; x=1728688086;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QgRNJuvX9W8ebgWdny6pM/HsObzPBVg3A9+xZAi0uZE=;
        b=tuG70wOKNwodkCZlxBHh/V9szqW0NhDX60xdcK3WvHnT2QPBPJdQL0iwOjPoQiJdN8
         lDxy2aXM5UbumjTLavAqh8C+/3+HRikGEz6xqFL5+Z8BQcHxeFzD2a0oE+n+HbhGLV2P
         +ikYql/5kyhMVxnDbOUFZm2dAAvG6QQtTuWiUY+D/R3OJwPydL82t0uYlLa8qdMLLMLM
         Od6kc6lNBfJhuibcfsdJNUaVJuOGrQoiVytE/dRKcZpfq5uneDyh3q/3kUnBe3t+ugQO
         SQC+hpy8y2dLuw32T1WD+anKkc3ONZ29a8r3x0d91h5zqzWtRhQ6UI7NttGAADeDcgjb
         A45g==
X-Gm-Message-State: AOJu0YwE7ymFhmRxvyj+5f+HZyn9WQ+/2Sn4fIrEPA3LbreYAo2fD4tn
	FX8hhueUTTNpHeC3E8sTJz1sg+GVoBnb13d2BXx+xCkUyysp8+w9SqEkbzRZZJWcj4uUMGm7dHJ
	nrCUdtKqVK1WteEvzfGk7hU6pUJEdS8YPtQUMHXV3gfcc3Z0psjh3rAKYAQdjvLabtb7e99T2Qi
	I=
X-Received: by 2002:a05:6808:14cd:b0:3e0:7d9b:8599 with SMTP id 5614622812f47-3e3c132ae7cmr2995314b6e.16.1728083286077;
        Fri, 04 Oct 2024 16:08:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQHboL6lNu9Id583iyBcid8k4MKQs2+it+T2Gm5ghiZbKnX9Sukb1LDtAL892Ox5PFgFZnrw==
X-Received: by 2002:a05:6808:14cd:b0:3e0:7d9b:8599 with SMTP id 5614622812f47-3e3c132ae7cmr2995301b6e.16.1728083285676;
        Fri, 04 Oct 2024 16:08:05 -0700 (PDT)
Received: from [192.168.86.60] (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-715568653b9sm260093a34.65.2024.10.04.16.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Oct 2024 16:08:05 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Fri, 04 Oct 2024 16:11:01 -0700
Subject: [PATCH] iio: adc: qcom-spmi-adc5: Tidy up adc5_get_fw_data() error
 messages
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241004-spmi-adc5-no-channel-error-v1-1-1a43d13ae967@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAR2AGcC/x3M0QpAQBBA0V/RPJua3aXwK/KgNZhiV7MlJf9ue
 Tx1uzckVuEEXXGD8ilJYsgwZQF+HcPCKFM2WLKVIaowHbvgOPkaQ8QvCbwhq0bFxjtLzrXGkIM
 8OJRnuf55PzzPC5TZgThsAAAA
To: Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>
Cc: linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1593;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=wJqJFJ8R6IqcfU4pG5rA+ohiin9Qc+w0iAw0ASC77rU=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBnAHYRSEGES8IU5BYTBbQs+LOXLV76Jsnbz8tQ3
 T0LPgsUJt+JAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZwB2ERUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcU0Bw/+Ow3DtnfWzQFFwLWNCVsjv+s6W5Y+fjLTc+uhlMa
 0ud5CjFPKTbRvhoVy4O7G7RsUwTpXtmPhxM96JuzYDGsaG5s4kEa2/0gzG+CV2ihbo6qkSFYI9m
 Pk32NEoop+BV28+2/QPdnoKSbCCFq51twARCTb20NKUfwb1/7ZxEW+Pwlb3PvZ3IUVXUVLncMll
 NiM89kBXmU29BrCuU4NVrq9e4T2BKN9OvQqANU9N4chM9e+jlgGtC7w2Co/aGVz7kccNsD7CWic
 IQ68Itejiqt6WqOl27yyR5jzifk4Yv3drBEJTS7inEPBZPkjwb0jrs0xwZC+14o2BCzxcwkb2vV
 Hi0ZHCYi3zXcFRYyVqmEbmD+6XTiMguRGfGOvTpzYSnjxsyu0YtGAjUcn2rpQAeTOETJXpfWCUk
 VExuYrej57tgABMDwBY++AjWYORRLc2xUqyLwnR4dnM0s/ofeZJMj3rZm4Hkx3V9ry+U9NfJ4RG
 eL/mID1JMB5ggBkKyUkJCZum+vRZbyZtAFAGRzCDH6uMQj5nSv2AuQZVnAqLWGNSvP50nYpmjlq
 qDKnmm/tHpQtVsV+f8p6LX2LzKqZradQIleDoVBcyWNP/PiIAz0j503evI7yAISb9prfMlEseex
 tGowMZsjA7A9LeNoyKma9s2HVXpTMqoXWon7639B5eEo=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: IZ_7aTlwYdSUFmCD4NE4zp_Y3W_FOeuy
X-Proofpoint-ORIG-GUID: IZ_7aTlwYdSUFmCD4NE4zp_Y3W_FOeuy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 suspectscore=0 phishscore=0 mlxlogscore=999
 mlxscore=0 adultscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410040160

In the event that no channels (child nodes) are defined, the adc5 driver
will provide a generic error message indicating that adc5_get_fw_data()
returned -EINVAL. In all other error cases we get two error messages,
one helpful and the generic one.

Add a specific error message for the no channels case, and drop the
generic one, in order to improve the generates log prints in both cases.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 drivers/iio/adc/qcom-spmi-adc5.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/qcom-spmi-adc5.c b/drivers/iio/adc/qcom-spmi-adc5.c
index 9b69f40beed8..af3c2f659f5e 100644
--- a/drivers/iio/adc/qcom-spmi-adc5.c
+++ b/drivers/iio/adc/qcom-spmi-adc5.c
@@ -830,7 +830,7 @@ static int adc5_get_fw_data(struct adc5_chip *adc)
 
 	adc->nchannels = device_get_child_node_count(adc->dev);
 	if (!adc->nchannels)
-		return -EINVAL;
+		return dev_err_probe(adc->dev, -EINVAL, "no channels defined\n");
 
 	adc->iio_chans = devm_kcalloc(adc->dev, adc->nchannels,
 				       sizeof(*adc->iio_chans), GFP_KERNEL);
@@ -903,7 +903,7 @@ static int adc5_probe(struct platform_device *pdev)
 
 	ret = adc5_get_fw_data(adc);
 	if (ret)
-		return dev_err_probe(dev, ret, "adc get dt data failed\n");
+		return ret;
 
 	irq_eoc = platform_get_irq(pdev, 0);
 	if (irq_eoc < 0) {

---
base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
change-id: 20241004-spmi-adc5-no-channel-error-8c3203391103

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>


