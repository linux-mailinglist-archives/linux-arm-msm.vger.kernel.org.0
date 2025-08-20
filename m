Return-Path: <linux-arm-msm+bounces-70023-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 874F4B2E8DD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Aug 2025 01:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEDF57B6741
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Aug 2025 23:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B59342E764C;
	Wed, 20 Aug 2025 23:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PCWZUO4a"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53812E54B5
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 23:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755733154; cv=none; b=AInLCEE25kaAu8GNowyVOQlWIpmxzVXurBGsfAOfV925Sw8BMwo6U8RWRUqDEIz99tKQogqy40xcZJHTH1F42wMjf94yImkIQVOS7Q8CwXRRtIWieNCAn3Wxswg4y7PEmhiT5htdD1tZ/YRWXrI1ePSipHhjlSraCdUZ6yOf4Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755733154; c=relaxed/simple;
	bh=nhZDUeOuEBpe4gtZaFsCxHLG2a7kWizgihFMSQLXv+o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CBDNXKBPO5knZD9IfWqd3AQuwACHiDzaOZ9yzfa1lC7+cdvO9q+H0AF0KXckjBXH026qG2SnEz2oMpSAgBtVIKAxCvNFMRGKGX9TgdS3iBqlCGRvBp9yUdY0clbq5UNBEjKKg2Oh6eW8Z4ziHxsVghW6v52f6Pm0YnT0T4B7HO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PCWZUO4a; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57KJJUSO024833
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 23:39:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pvcGflOb4oHfrwRpsgfYu+5cxv3Vb3K+8uRpTdLXgHU=; b=PCWZUO4aCsixtpoF
	ZFGaRiI/6mzDtjoEH40urxBiBbP6+XNt3WvN4/qYQsr0fqBATlGs6cJR1+romPz0
	ZSHD9uWkf8dQeqx7lef6lfm4tn/VqwZPFqnoHAr2zjvtMmN0srjxjmxQDwW1rK2M
	YfsXkmo2edya5VKqK90hmv3Ews9/uixj7AguCvnrt3k+Y9Zi+MyHZbZo+CiuS6Q2
	NwIfZ80OyNi3rOn3CnM+IOLEGoeXD5fceAWlDqohdSvOTCMo1M2Zdfg5ALM+RwKU
	zfCtSOwoEcVuUQitrXscftqWHOkiBOK6s8PZMHZiq/o3/oSRfXybseTb02YY4wBM
	aATMBg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n5293ct5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 23:39:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2445806eab4so4165785ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 Aug 2025 16:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755733151; x=1756337951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pvcGflOb4oHfrwRpsgfYu+5cxv3Vb3K+8uRpTdLXgHU=;
        b=izhIEHnc42vO0fQdk5cyJQZGXZi7L3WKT3vPcpR7vtUPI8NT/xAcMVUfAnjMR4+sdF
         VFu+A+anX+EpJ9NupAY4bIjW0/+QOwmzymPet/1zDig4yS3+YbIf64LS/j/LWMn+Na3y
         jtnoEWr41M+lRPyrsl+s/1eMhVS5RRBnhz3h4UP5jaIQEa8KI25UVUyesu70QQuamB7H
         3VQPgcFW8baZH3SUZrfHBUsDORm5ISmqoPR3Ejbyjo+dYTPi7QhHRiVZvFHzyXFjdVzg
         EO5BXcp5c71Y1zRRbcZsTrqHzdcfDfFdhJilfzEGa6JIZ1cXatjz6Pp4RfP0WooD3FV4
         FwPw==
X-Forwarded-Encrypted: i=1; AJvYcCUw8xb2gMxy8Ur5sYVoBOaZhFTx/rdxYJAnWtHItHQEDMH/IwBwfblwle5mLTbNIY9Uw3WDMMiB/AGOk6yT@vger.kernel.org
X-Gm-Message-State: AOJu0YytvzrPVpMSfb8cjzN/pZQ1FtAa3x20mOlwV7P82rWt0MNEQ7S+
	ipD4CS/Fr3vB6S+0f3I0+bFgGFGP3bAvVjZuSExd2/Onr7ZtEQYk6WEIOyv+gIVOxlvIf8YDlKg
	lp0gNub2Pfw2ia2aYIHcKKjLa0RhC3jJaSuwPKrpa5dkV7SShWSEMn+v3kVLyMRTRs2o=
X-Gm-Gg: ASbGncu3j1WlK7EmpDmj5OA3XFDdZGbLdrMAwDptl3ZG+rjV6sapzN3yEGbviWWgO+r
	OMbke4vc7Pf7dal+hvMZqOHOtBWfHRFIr4w2m/4VyaMS2T+Wouoq/FnjPCUozaX2XvVC6PivYI+
	jwN3mFHczOa6bKSIb58GniGVv/iOx1IttUTpJwE8xARC7L7OA2GOYNhwXz2EJRngPIhQwBGPkjD
	6XzViOYRnmPSxz8Ky2/sIpaqrAfR42I/RTwOB3CAaONeVofHf3xTJx/oOHQPVNSPvs9gCI8/x2j
	SEky9S3OZ6a2Y5h6U0esRUVp0Z3Yr4R51v98CT2Zk470FR9nRYkRjKDEPaiT7UAwuf4FcQk1Dwt
	CV5V2sBTYHX15Qc8GsfI2siM=
X-Received: by 2002:a17:902:db0a:b0:242:c66f:9f87 with SMTP id d9443c01a7336-245ff87a0acmr5982635ad.51.1755733150824;
        Wed, 20 Aug 2025 16:39:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJciBVPvgUAISLnaeCIDM3TBinhx3jI5VVAs1yjKKv+IWNyYEVSSEyv5G7WBqrbl04hMo4gQ==
X-Received: by 2002:a17:902:db0a:b0:242:c66f:9f87 with SMTP id d9443c01a7336-245ff87a0acmr5982475ad.51.1755733150316;
        Wed, 20 Aug 2025 16:39:10 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b4763fbc711sm3233028a12.2.2025.08.20.16.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 16:39:09 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 20 Aug 2025 16:38:52 -0700
Subject: [PATCH v8 05/11] tee: increase TEE_MAX_ARG_SIZE to 4096
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-5-7066680f138a@oss.qualcomm.com>
References: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
In-Reply-To: <20250820-qcom-tee-using-tee-ss-without-mem-obj-v8-0-7066680f138a@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=ZJKOWX7b c=1 sm=1 tr=0 ts=68a65c9f cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=JCP0Puskdh6qvuzBaLcA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: aUBBUrneYsvvSYH7zXdOYIsoikB2vpsB
X-Proofpoint-GUID: aUBBUrneYsvvSYH7zXdOYIsoikB2vpsB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDAxMyBTYWx0ZWRfX8EhtU0731i9h
 3Y7A9QR6ppYr10NeHq9lvz/fL7pQnJMyCTEsCY//yh2aeyVeW5aHCwu7EKJO9+tabh+9/mmwoQr
 5Bl8bp621dPS0nCLIlYSehtiSRQu5NxpOWvJNCCS7vFF0VTZahoD9Br2tNbQVDwLRar4FmcxljT
 Jj0bAk0v1yx5UX8luxEfHI35mr3npbUIRBXe0VKczr2qfKEACjiM8UvED6TorkuoONCCRBXWZj2
 lfgnRdnjouuCjSMsEvfaCFzcqxPEzHa7lKC/ljDSS60EcVRuRqP+NwS3KVVScItVujAN0+O+SLQ
 XvnVyrwfVJPtkCUsg5MPqnYic1LL5OfB45YwM7gqtOWOJAHIhhRhc9BZTRO8b8xPjGbV1rfnsIL
 5+nO24Hdn0K5d46ylGjQZPFNS86t0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200013

Increase TEE_MAX_ARG_SIZE to accommodate worst-case scenarios where
additional buffer space is required to pass all arguments to TEE.
This change is necessary for upcoming support for Qualcomm TEE, which
requires a larger buffer for argument marshaling.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Tested-by: Harshal Dev <quic_hdev@quicinc.com>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 include/uapi/linux/tee.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/tee.h b/include/uapi/linux/tee.h
index 441d97add53f..71a365afb89b 100644
--- a/include/uapi/linux/tee.h
+++ b/include/uapi/linux/tee.h
@@ -42,7 +42,7 @@
 #define TEE_IOC_MAGIC	0xa4
 #define TEE_IOC_BASE	0
 
-#define TEE_MAX_ARG_SIZE	1024
+#define TEE_MAX_ARG_SIZE	4096
 
 #define TEE_GEN_CAP_GP		(1 << 0)/* GlobalPlatform compliant TEE */
 #define TEE_GEN_CAP_PRIVILEGED	(1 << 1)/* Privileged device (for supplicant) */

-- 
2.34.1


