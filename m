Return-Path: <linux-arm-msm+bounces-55531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 246C8A9BB76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 01:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A731924134
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 23:45:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE075221FC8;
	Thu, 24 Apr 2025 23:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ksov6oMn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0541D7FBA1
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 23:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745538350; cv=none; b=YTq4wiHJtpP77sJU55iYvhCTG170SZEWn1DhjFHs3SUEzYSk4m0ZlDcYSQEeOSnwf/YXGdE3T/oYzjZS0wkBN9bsCRDkOlcX8OW0/gKJd5tB5zIfmCtRZpmmWjvsB0SU7EK7IcSpzxt+P7GU9TfKzLjIZtFRNJGRyF1vAJ2saX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745538350; c=relaxed/simple;
	bh=ofmEoSMhKo06h+U5NhGAMej5n5ubYDTAlHp5FYY78RQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X/RmA8Sie52NfUIqiGzjqwGJFUUcVq1sOxK4jab7oyXVpdkDZhu7m2HIngoQRII2snwC4jxmHL24s+kLp9GvRr26GTgY1ECth9q2lhdE/xT7qdCI+KJFR+YUXRg6LC0BPCfSXsnMZGi55TQNtu9XO6je4GiXyGyrMv/MUSFSQlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ksov6oMn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53OJn5DC013692
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 23:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KyqYKtxradzfRqDlkOHzNZ
	aH2YGpNBHk4kCUBoruzdw=; b=Ksov6oMngp7mBuyBNIetidXOKmDHlIIrl/seov
	W6UfRrVwAbnoKMacer9pPdcdi3RxjMrhuz8X6BdO6EAqNN1N/2vDt7jjfs8dT2VJ
	JHj9Ptxgv9Ui2TO7CoDQWxUgO2P0w6VV8NA+3p4EK8KmAIrtM1l0v5OJ9OCHp35r
	RxOZIiq+kRmnqY/BDKhLEoTH0i8efMOiBxNi99PAviRwqFPGlMsIDdneVT/2TLET
	Vu2Zvk5OFjbwI9ltAeJmpDedncfA4K/qOTIAC83Yd0mKbaJ2ZJjCvsiubk7ibVlg
	yKB61doEnopb44RUrQxgJCTpl1Zb9MD/sOxphWRFa4PQ8hMg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5f6de-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 23:45:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff53a4754aso2110442a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 16:45:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745538346; x=1746143146;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KyqYKtxradzfRqDlkOHzNZaH2YGpNBHk4kCUBoruzdw=;
        b=fQlUZ0g6AihVrSVqasbisQ91gcXCXurFYlRZENfYWlyYgBiGQ3uyOGdTWIzlpD8FHQ
         3F3q0ocaodgyJ9aoJqfWX0K6Um0/xzVX39bIgbuGKA8tgNj8SM9DYI1Xsi0vk6Tbd8YM
         two0sz899WtsJAXHh7mhDZWCj8M2NxHpfnxaXklp6ELg2bUdPHJUj6JJl5xzjk1ppk2b
         Mx8wIk07bCrM0T3YLVFQbKZb0KiLAu1ZIzce/jNuT2k46FYiFAsFvlqDEUn16QGPcCt1
         kAO1VvdDunTSIDLDDsE3b/ar4gnAUJ5yyvtkBBjY7X1oke5nvGoRZQlITFruFkjObNLa
         AYcA==
X-Forwarded-Encrypted: i=1; AJvYcCXyNJbL6WIf89V51FmmNQo0bhbeQp9O0TekPay8b2UnZQHSwTYUMwsuOi47mp9LzAEMxW0Z6pB3Gn2f0NgL@vger.kernel.org
X-Gm-Message-State: AOJu0Ywaga//VxLHi28K4z0TBPULgP/5UpT+sxU1kZFcMS7dJGK9W5ss
	b2lNSlocVciSs6mPkJmWsIBdBZQjTUN0D8FnWQF9g15sC3NbaF9/0ozakC0neDNrUmFM348jkAf
	zKdZlAgQ1GOPbywGkAinPEnS3MgUB4DH50vVBDm0MxCovBfQ1fI3Agvcs0UO6qPSf
X-Gm-Gg: ASbGnctf71kiJpQBw9GdIYZaJu5wAkPDwjaFnJOUSIqQeBI9JN2hi7I0NmQycHAOAI2
	zJ/AoPBc1OM0btR58xqJDWqhutFTCltAeUu19kVm6g/c2xXFO8d5qgWBmcxj/MIzwvS0JntG8+z
	d86qDtGyXIJXql7colGLRKkl/Okze/ZkRhTBGGZR4WqSGwBcvU3eN1zBUVLgFSeooFa2rRl/NVa
	GoV0jc9eoN6ulQBs2AIa1v4Ys/gLR/uC63fgdCCFabUHygI9R5ky2MHzq1IngMUD7t3tG4TrSof
	49ZsMfknW8N6342UB07szp8b58qVjNDZ9xvVIi4tOt7pw75R0kBT4q6ISezaq2hYD/l/yqIQfR1
	AKxg=
X-Received: by 2002:a17:902:e404:b0:225:ac99:ae0f with SMTP id d9443c01a7336-22dbf5d8b00mr3086415ad.1.1745538346477;
        Thu, 24 Apr 2025 16:45:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3rWDrNgerPAeRbJmrwpa//JpdMGGhQSUPOjFG5CY6PYdzl4ek838Z0IyiHzO8Hat64ueuYA==
X-Received: by 2002:a17:902:e404:b0:225:ac99:ae0f with SMTP id d9443c01a7336-22dbf5d8b00mr3086185ad.1.1745538346087;
        Thu, 24 Apr 2025 16:45:46 -0700 (PDT)
Received: from hu-uchalich-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f774e4ffsm225078a91.12.2025.04.24.16.45.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 16:45:45 -0700 (PDT)
From: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 16:45:41 -0700
Subject: [PATCH] soc: qcom: smem: Update max processor count
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-smem_count-v1-1-931cf68f71a8@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIACTNCmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyMT3eLc1Nz45PzSvBLdRAtToxQLy7Q04+QUJaCGgqLUtMwKsGHRsbW
 1AGokHK5cAAAA
X-Change-ID: 20250424-smem_count-a852d89ff3cd
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Jingyi Wang <quic_jingyw@quicinc.com>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Aiqun Yu <quic_aiquny@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745538344; l=916;
 i=unnathi.chalicheemala@oss.qualcomm.com; s=20240514;
 h=from:subject:message-id; bh=ofmEoSMhKo06h+U5NhGAMej5n5ubYDTAlHp5FYY78RQ=;
 b=L6Org0dMHoH66e4fXaSqOfQAEKmeC+VHumQGQrTITeKxuIaYIbGh7nsyPxclzzls3z5S4shL6
 acgflenu2gRDq+5W72D53/by81Ul5Bs3AfBR1XKNAOWC28YK5Vn2vVj
X-Developer-Key: i=unnathi.chalicheemala@oss.qualcomm.com; a=ed25519;
 pk=o+hVng49r5k2Gc/f9xiwzvR3y1q4kwLOASwo+cFowXI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDE2OSBTYWx0ZWRfXztvML47sg+m9 dQ7BQBPa9EzDpex2E6iZpvSpb3TboVAgdiaadlXwevSfh0QeYuG0TQe7C8QleghURBP66hyUe72 omnvIzyyGcF1lAAlErzaoQ4gTozZzqDDU8W3ISliH3yyztNXA/fqjP6oj0LAnT8XnFKSX39E1Vv
 ypFLErEDagRYjIj/OzhPXjUYxUpjAldR9WcObNBKABj4S5opRpDrfNfLrACfCcDWYQfmqysO/JP x/s4maDQNl+nSFLGGbtBZjvgkwuUDUaIZszm0jxH7z2gGA1n6lfTJvTd/cSOofbn6ltQKSMdogY wCwgdM5hrlfEkxtdshm/yAgLf/S/PY9FLKGQXbL9IaagvV87AKqzjYdS4xkA3x5KP8O85cw6JlK
 +8yVGrcwnEhKD8s9Mg3v8nwLzuz1Vy9mK3wgzj2dgT8msKxHLJq2ECDH/FtWEuktV1YSlNab
X-Proofpoint-GUID: MaGUV2LW15l09ZHuHyd2s6m62b4t2luH
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680acd2b cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=dluG079SF-FDyRJlmAYA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: MaGUV2LW15l09ZHuHyd2s6m62b4t2luH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-24_09,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=777
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240169

Update max processor count to reflect the number of co-processors on
upcoming SoC.

Signed-off-by: Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>
---
 drivers/soc/qcom/smem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/smem.c b/drivers/soc/qcom/smem.c
index 59281970180921b76312fd5020828edced739344..cf425930539e406fb81307a17803955371545f32 100644
--- a/drivers/soc/qcom/smem.c
+++ b/drivers/soc/qcom/smem.c
@@ -86,7 +86,7 @@
 #define SMEM_GLOBAL_HOST	0xfffe
 
 /* Max number of processors/hosts in a system */
-#define SMEM_HOST_COUNT		20
+#define SMEM_HOST_COUNT		25
 
 /**
   * struct smem_proc_comm - proc_comm communication struct (legacy)

---
base-commit: 02ddfb981de88a2c15621115dd7be2431252c568
change-id: 20250424-smem_count-a852d89ff3cd

Best regards,
-- 
Unnathi Chalicheemala <unnathi.chalicheemala@oss.qualcomm.com>


