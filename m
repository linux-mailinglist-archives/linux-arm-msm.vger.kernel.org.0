Return-Path: <linux-arm-msm+bounces-73912-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FF4B7E35D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:44:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EACEC468019
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 12:43:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AACF81F09A5;
	Wed, 17 Sep 2025 12:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nP6pojE/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF741E489
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 12:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758113000; cv=none; b=BdPEvQUOuZheGNuj076tQ2AI+joP5O4mJMV8OOd57OmEmdI7+29gb8kneN8JfTiwOMvJ3ojXZEDw1DN+eYJnuWMgQcDH80/mFNCwThaSeRWMwZ7VobLgLhSnCrOyXjEEYgXS68LvkZf0KaTjCbBYVHnhOVGW0JyrBSTIMkVcz1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758113000; c=relaxed/simple;
	bh=oOZ/7kAmUDMub6ey+4hK6Sglu0Yb5mr5rXFQCUqGmPs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fr3RqFbqtUJLIgbZI9831blwNdHYzmWgcFWaZR4HBoYYSA8cjTlJnt7MpZX/KeEFesR+osDuZXFEvfFLLPhkJd9TyO1Z+C2bMSfBdKM/L0qK3B83cIIvQXSLBklTxAjiR2m05WXqwrKwmQZrKlSWKy6iGhROH2zp/nlj3TO1XEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nP6pojE/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58H8XhpA018300
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 12:43:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=k9z+tLwy73tIEM76xmcjOm76wTNihCeFsBC
	dMYZqszw=; b=nP6pojE/v7li6XNVjOY9F37t5DSUV4Tmd9UbpQK7ki3QETLnCLq
	PWsU6YHEJcJLROH3hMW9cvGhzvSt4qrI9s7DZc5cDHDGG0Z+rPPrTMrt+FnNftG0
	MhTk5l7q8DVJG9wbY7E8IBXHNqj3Li4dVrFaXuTMBlEpMh9VJWC59wtPtjH8gZNk
	u4VKgwjgi70YR5KkCZHwvc+QYuch1LDkck11R1mXk6luhpAqbq3FgjeOvCrrHV4Z
	aVQtZsIw22TlxXGfjTcKT4g4ygXkE+bRHIvoIvN3NqHRvCzke6eTa5Y511zW2Jt1
	1rztMDsNdZ9t8dsLyaanv3wViSXh1k63lQw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fxwac5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 12:43:18 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-783f069a122so79117736d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Sep 2025 05:43:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758112997; x=1758717797;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k9z+tLwy73tIEM76xmcjOm76wTNihCeFsBCdMYZqszw=;
        b=uJwkHbuzmotp+I1vtMpNDYQyOQjc4EHm0asNY1gDr8dEJMDk+fpf3sR8L/PaD68/jf
         VWTwIOerLZASYs+6n59TwKbjuwntnv5IVxQ6PztW0Wg+p3V4ppm3hvOUKl5fJoXKSNvb
         o5JCTvhJO2p13iKYnpZJgtTHc2351rPMuP/cteck2vgQ+k81rJNmQcAprEE26vwi6jQe
         wAJiwU5IDqk/JpGCpOduOP8QYdVBg13IT7GClPmnlQWjFZpVeVozP5BNZyAjCMiX+W15
         8axVnYT+oKPOcF/VkVP/p/f6A0sS6xUg73fI6lpBBG2ef2hhZEvCVET1rpcemmaw0dY/
         f/nw==
X-Forwarded-Encrypted: i=1; AJvYcCXGq5lazKpcIWdOG+Fajc5C3h7AM5X9E5/sEFQQZ8z5S6OEpwYXnDx1c4MJ66XVfGlQGBNVVyvo56hqcoMh@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaz0LNl4Zcu5sYnm6/2FsJUCpbrIMp2qaqtwHRJtbrBCcgOzBY
	GQCZ/ozeY/3IPrQ+052xPBIY4X1a66GSa6cpFqCYPfA00nLv49mdxAZzWHWBTUfCuSbuFlPE4mF
	dWElRfT8oV8DnJWh6nUaWqVvo2mMbzn68ymPHzSJ0IgzDDZhEzFgxhAOAoeY6i52B5c7R
X-Gm-Gg: ASbGncunWdpjAsft69bqOt0LXc+irYkrmLrblGs04Udg+vjySXBN9Ms8pmFmxtoA75t
	vA1X6m6R1WKK0O22dncYjW0LdxgbPfLDkRnRx8XEf0RVNNu9fkewNjnxnm1vsqGOhnrAoxkVwGi
	XkgPYpNfLUja+y64MlNqJfuMz943MqlMZ4fGpNqmngTFKUPR+rJ6Go+FGBQBwR/GSaUbcB1tKXF
	mCXDPQlD7pzz/1ihNcqlLzEuS841z9m5y8RuAwWHz0hxQbyNnfFxTEnoCKdxOAf8CyW0NhRZHqq
	cN/fVkRK6za5j60v0Vl30RepE5ZBTloTEAsJBMsYVlEmxN94YARAxXAWhQsMrs04nSF2zfgDkwM
	=
X-Received: by 2002:a05:6214:4e01:b0:78e:f843:e946 with SMTP id 6a1803df08f44-78ef843f609mr13785196d6.18.1758112996538;
        Wed, 17 Sep 2025 05:43:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELljfmECKu32zNDPwj9ZBwm7G4s6/ARtKvGww6liQ0R5vbGuh0ED7c/QnHn3Y9lXKYu42Icg==
X-Received: by 2002:a05:6214:4e01:b0:78e:f843:e946 with SMTP id 6a1803df08f44-78ef843f609mr13784786d6.18.1758112995894;
        Wed, 17 Sep 2025 05:43:15 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.qualcomm.com ([2a01:e0a:82c:5f0:81ce:8337:616d:c2d5])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46137930274sm35251035e9.6.2025.09.17.05.43.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 05:43:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: bryan.odonoghue@linaro.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        vladimir.zapolskiy@linaro.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH] media: qcom: camss: vfe: Fix BPL alignment for QCM2290
Date: Wed, 17 Sep 2025 14:43:12 +0200
Message-Id: <20250917124312.675996-1-loic.poulain@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=HbIUTjE8 c=1 sm=1 tr=0 ts=68caace6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=gZ4aIBoJpEVIEF-KsNAA:9 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX9YK+ra6KxoO3
 yDkWS3mXWpRMiVFn8qXXIRqTYg90gCFGfabH54zmOaD9SAMP5RStr75ClrpoBzPnRu4GtGVZ8qD
 VQcQEO+A6vjjIh0z0AeAnb7jlT2cXoGN1Wk6OHp8Z4UIka6zZ1PXWG58VpEKffedSOGuAb/J8jS
 VCuL0NFfGnhl7PMJAYnjSTbkZMAA0kKQNf4Pmu3r1b420d2p5KECdhPjM6W1jhL7n3YcupJUesT
 6erk1SwYWmdwZvWCAQae+Fb5O32IaeWiZIAE0h55+zuj6UfkvxqjYE0no/wdCv0i225SSRqJK9E
 UQmpZ+dBkyLIac5c34EUXxG/h4j5mRDAJUZv3RdU+/vJDx8RisBZGultnNkxPaMbuv7ZhnXvZPG
 LvwRC29I
X-Proofpoint-GUID: W0g5M0tSUsYKtTq9WlYMIB6kBABsEPlV
X-Proofpoint-ORIG-GUID: W0g5M0tSUsYKtTq9WlYMIB6kBABsEPlV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202

VFE-340 requires 8-byte alignment instead of 16-byte. This adjustment
prevents image corruption/misaligment when padding is needed.

Example: For SRGGB10_1X10/3280x2464, aligned BPL was 4112 instead of 4104

Fixes: 9e89149a19ed ("media: qcom: camss: add support for QCM2290 camss")
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index ee08dbbddf88..dff8d0a1e8c2 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1989,7 +1989,6 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	int ret = 8;
 
 	switch (vfe->camss->res->version) {
-	case CAMSS_2290:
 	case CAMSS_7280:
 	case CAMSS_8250:
 	case CAMSS_8280XP:
-- 
2.34.1


