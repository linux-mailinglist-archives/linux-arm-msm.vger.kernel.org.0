Return-Path: <linux-arm-msm+bounces-73048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB731B5273F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 05:43:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 812AB688469
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 03:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EF8723A994;
	Thu, 11 Sep 2025 03:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lD81zjBU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28342343B6
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757562099; cv=none; b=ZEkZ1ulYOvkx+gvY+10EbzQvAgH72ZqMbp7P4kbK2Kjc86mD0jcuNWCvuILz7rkqqg1wP7inMs/64wKJEbTKTGEwjx6rYbwanTI3XN5WUI9k6FPNNHm6sbOj3fqaMWleFFrQ6/8Pi9YMctQfvXaM4YRAOYvkWS1VNU22NxAkAkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757562099; c=relaxed/simple;
	bh=/lv6U+EjPMeafYia+qKbji5Tbq552Q5xbMPIUY9qAiA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rE/+TbrEjdqk0uBRDmm8lxVHP5lChF8Ugh0IjYXY7e9xYsyE8oDmh93lQmzJSpzKRWd3k+AR01jwGjOiY2l2BpdWbma57UthWzHXimosqr3FplKqi9uVxBSUei1XfYz6OLB2AkcRGK2vP2tPXFT1boZK4GHeqRuhbKymFhDojT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lD81zjBU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IYl8015131
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YP1F2mKERyMRZBFmEs3SVcCv9UXZBJL5UnDFWST/l1c=; b=lD81zjBUQ40u8W2l
	UmBOznX4JfGe5Uc8w5e1E5ljITBKS7BsvfJadjMBZVNwmuJjs3maPhCIm1VeKuP2
	Ao1EYPK75Vl1bjpsY8ngMmzHKZJMqg/kyUOs/mM1gVHTBPi5vPIv4/Paxkp1ZtxD
	erCgNiZIJKFbKYts0VENwvk1WpXjnCiIhIvm2W8cRSYKTHEOHhy2H6YbiYeorEPc
	mVWJlM2tuNDJD/dNAzbweTL2u4WH/A+eNML53zt6A93mQ/ODNh2m3dFV4BlIZXUV
	vUwZV8xUkxkTnof9CAQsHGV1o6qJFJVmtH1RPcOpFN4jaTpyQGbzTVipJ5SsgssL
	SIU22w==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4m61hb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 03:41:37 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-244581ce13aso4868285ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 20:41:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757562096; x=1758166896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YP1F2mKERyMRZBFmEs3SVcCv9UXZBJL5UnDFWST/l1c=;
        b=aq6+m2trmvhNiWcdMgna2duQwoU+5x5izntSWjECwCethSEHnKXyWDiUeiOjIF23SD
         Us9NFjkYcd8vyVjk4t6xBXMP3KOxvzjgVP11y56XMNb0xxJeJ2GOryx6uFf+qP1oGrkv
         KYmBDKkE7jXLxQyzF7QhmccDzdmhxpTOUXXmvQoJCVBBRZGSQe1Fsmj7Q4rfgwcaBbfh
         9Tvha0SJghIlHXNHwcRPf8nml+DK4f3yox+opy3Vy9upCG15Eh/KLWnXg0ReeDnAlMdV
         4IZeyrRwrgp0+7zPRP3vI7yGeONPw8l3xjMDWp/AjEZrosEMv+SIWkokn8bj5pyrZWev
         m4bg==
X-Forwarded-Encrypted: i=1; AJvYcCWIDvRNMNHLtpo+ehrJHqrItys105b1a8pydmUVeBqrQPgxr9Oy7UfsUnAsGHmFRabWxH05DNLbznKK/bEN@vger.kernel.org
X-Gm-Message-State: AOJu0YyFGFjmxf4WsV0nlDfAYQ0/rqc29G31UtbeU1n+8D5AFLjQVIvp
	sS3uO+6v67UjEBsc/QqbYIFUjWfVbUjeOG9qynUV2J8/wNxoyQxCmShrDB/eNMqTPJueT8dgJVG
	gvHb/eDyNGhMk4oZAjuDRFGo7E39f95uR2l3sYwTU2/R6D6zIX3LBksFvqMwaPbECCEk=
X-Gm-Gg: ASbGncv0rfswhKV3AUWSAGoYjaQiJrQ1x6zDNblun0OCqmrm2LcvdjMBwPVUpNZFvUW
	DWfCUP+1VTP50YpDLOj0HPpyZheJzsWGkgLmRYmcFAqx2bgjVk6OnTIcQEs8mQ0prSXLm8L9Aqe
	7jJgU9i5S8eLQUB6eusWeeIkETm3Y/K/StlV/RO4SnqvdktPqOONCS/KPCLrYbvCbUd4E5kW2UN
	gK80yA9ZsWi2zmkzYs3GgIMmXVehluNEgaMJganTyqJljn36mgYWHH71MZeFtusvxh5uGbKWdGt
	+ptbzqfQouCaMOO5kKrMu/DLoX8F0B+tg5kqGouPB0q/iK+zsrKsIwtLuOzrupYDLTKtF21fQfW
	wA93msuCzIPP4rz5JTVndWYI=
X-Received: by 2002:a17:903:2b05:b0:24c:ca55:6d90 with SMTP id d9443c01a7336-2517493a0bfmr195669875ad.61.1757562096060;
        Wed, 10 Sep 2025 20:41:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHvQDQ9uOhNwBYBH4VDpBdDwefv3e3oaJPc/CzBPBFYYZmFclBHQ1LdmEcszkXBkPyeDRPZhw==
X-Received: by 2002:a17:903:2b05:b0:24c:ca55:6d90 with SMTP id d9443c01a7336-2517493a0bfmr195669425ad.61.1757562095433;
        Wed, 10 Sep 2025 20:41:35 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3b304f76sm2962275ad.130.2025.09.10.20.41.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 20:41:34 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Wed, 10 Sep 2025 20:41:20 -0700
Subject: [PATCH v11 07/11] tee: increase TEE_MAX_ARG_SIZE to 4096
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-7-520e867b3d74@oss.qualcomm.com>
References: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
In-Reply-To: <20250910-qcom-tee-using-tee-ss-without-mem-obj-v11-0-520e867b3d74@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX+Rerv0ZEox4V
 tWVC3Fo6VE+XE42w7jwA8UDUVYOGpuHg51dV+ml3SQXHTTe3THdAHT0/6uJ4GqhE3HR2TfkYcXc
 pfwvvNZv3B6plNpwwDEfvucZ/b+psDKZPNnhJt3Ibk7gzzFO5d9kQrxwsvYQDyEgZ0ZRP+8+7Uz
 dKA9ckNPvwdFWxkVeHSHvI8lpDm2iJqwNQ/ecAaucJR2FfcLTEB70wRawtthmAHQ24ZGZguhlsS
 dDi72BORD/rPXzg5K4vBBKs7unGKuE4GFSFazYYH4QQGd8XQ/Lupiax4A+OsFHyNg0WHPDwZHrg
 1aE49QbFtlZJCXqsm0+YxyJ1v12bc377b6tQjq3GHF6YPDChE5ZpYAfeufWm5lqGNp7hvrsUf1D
 Yx0C66zE
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68c244f1 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=JCP0Puskdh6qvuzBaLcA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 8Qem6N8s_7E1M1cgu811xT73N9yib8wV
X-Proofpoint-ORIG-GUID: 8Qem6N8s_7E1M1cgu811xT73N9yib8wV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

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
index 9abb0f299549..a5466b503bfe 100644
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


