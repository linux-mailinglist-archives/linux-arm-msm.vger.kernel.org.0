Return-Path: <linux-arm-msm+bounces-90465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EIM8K0I4dmmTNgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90465-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 16:35:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC2A8141F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 16:35:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63D4A3039ECE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 15:33:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3827C326953;
	Sun, 25 Jan 2026 15:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EWOujBcx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cx6AYnBO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B25326924
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 15:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769355194; cv=none; b=c22mSisg8Va4zlRMM81zK098F/C8iJFxtNTgFdjz+FqdFgkQwUsnXrL9mrpt1d58PuPPbxtVVWnRB0svTN87OOqjOp2FHNNgUgUhjqPfLlIsOUmKZpG1xJI315+KLhiol+g24grJfWfm0WA/YxQtXq2WIaR3IW543MELz0+MZ6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769355194; c=relaxed/simple;
	bh=tlqsbZH3GVSIvVRdmUychoa8E6W2HNGx8SV90Y2uqks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ohoCBND3ENc0t815AoZmYvjs8iRUzKDzPhDfDcZmeuJhufGkQpCAAu6Xfid3KhWQ2EDyJXXkBbFE1xt7Ga3F5IcrYq5T5eSAgXwY4xZ7jYoPgYjGD+G+T4hOEfQKO3K6ad4h95ajNQgw8wHR59s87K7872JeuT8XTals5G/9rlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EWOujBcx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cx6AYnBO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60PCQEDP3610197
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 15:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/P7AMnIG7+WRju9MQzPkvgMl+bPhQN9IN8sOlv+VN1Q=; b=EWOujBcxxxUM/l2G
	80C8krhJ0c8IH4gGcKz83vnLnuIelQJiBvfbM4my+JqYRelTiDw3tOe9IueObE+9
	SmJ1Ob6sxjv3d7Mt4Sejz39AOeYQf3mvxjEoQRQaZc6UrxrWZy1+tU2NRDqG+OnE
	5BsGhVzfS1km5zxkcvSVpMK+wBFI0ydhE80Ee3ERNHcpvv69Ad/L8WC6ZmfOdNqY
	iqNvl6L0Hs9sodZky+9BdTRxfRh0r0Ot3ziEIOWViSolp8ojEhyA8R5VmdDDuSYM
	G+LxCPzuRBj0/s7qPdhfgP3ANUCyrxIK8a6FKjr6s9MPYBpJtFvgnBOtZEvLEcgo
	RubLoA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvq9qj9vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 15:33:11 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6cfd52556so1017909385a.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 07:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769355190; x=1769959990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/P7AMnIG7+WRju9MQzPkvgMl+bPhQN9IN8sOlv+VN1Q=;
        b=cx6AYnBO5Mtr0tgFxwvI76VXWd7dC8JIo8xRsUvtzS21LR5IlHTeFs2EXXQufVxNWy
         RQcGDz7FaS1LFl91KAnW/bcr9QVTthSeJmucJ8YtezPreJEHWkRFydM7BflnWBEep80h
         EmOANz5hNBP+POaFVEMXBGBUXH3bNJK7cXws4pBCbCXbAxWNT0A2o2BcX4LRa//yRH9y
         DjNvnJ+1H2BYehLyV48qKcwUrhE0cBUsewMYUgXyXYW1PL8AG5JJJaThg9GZef76D6jo
         P2T3UnwYIh92qxM2lDbdiE7gl75j14iQT5U2n5igi+HfbUY2/0idCpC5yU02pywXoSvS
         e69A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769355190; x=1769959990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/P7AMnIG7+WRju9MQzPkvgMl+bPhQN9IN8sOlv+VN1Q=;
        b=CyHnlLGCDtp+h0xRFDuerFNt7JTciHKD1TOAT7RzP2jr5baGMyQVO/Lq/WXPy7wEbL
         4VLjEzyQdFUMu401DYLL/v7p/o03pPFZn6mc8rdsRAV1gMvy9YJaLBgNKLH32dxADM2j
         gui1nFV4oyORz9iFNkUhPbqs5ekvySsaKXbXiszHn0mOhjeXizDirySr1CzjcacGbXhJ
         EPcLoMAaBg3D+KnJhTErVb41ahNc2Zzkt96bexjrIOpaLyNV/kpP4LNqrGMXGpSo0Bxa
         Qaxnusfg2eVK31VFnYD8hyu6eaQkVF3jIw571DXtam0xdqPnCn7Y+XikkDa9a2qiPRRF
         MlxA==
X-Forwarded-Encrypted: i=1; AJvYcCUzQ7DTz+nFjoJMNCLupzWCITNSu2vZmt9grbxgZP9HA0cq+4PhhUtsuPUMiBAAn73PSGV1XPnBKAus7zTF@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/ZAjhZSr+xtE+DQ7B16A9C2bRRj5nAdEiBLVgWlBi9uH3+aYF
	EUJ7Cttk6HiMIAtMz7QbR+z8s7AXZFw0VQNQmTo2hEqNwuKmDl14Tf7fYZ4/OqQt70rIFGERl9B
	ESYCZ89X+20UrN6jLRKMH63BRv/BlCYTzG5tLEIQ6eVDEd3vZQ03fHe2Rt6Ovz9dzrRI3hTr7lJ
	mi
X-Gm-Gg: AZuq6aKuk4uHZk2u2ppUfUbMp6xCFhzl9wViHDHE8pFOhrGgIvCAhR3xytrQGdgvlbp
	X6uWvU/iWRWSYPwrbwidhrg/md5T0VjKQQAd6TZDIU2gGtmH8Q0Eebu8BoQpfksz7xV2XYp5kn8
	zuFWfrJGddFTOQW0+1Zk1UzguFh7XRCdKm1gVvyFwIDtn31gqLcLISmkyT4ASqXy+Ad8kEfoigt
	he3dUeLSIJhOwLZAj3Swa20CgwR2FA16l9xG5dNs8i2yxItil647L8EWg1Q6TW6as2bJamEeixp
	w+X/Fj+C++hCqm5C/ZdkVDtuX9hlauA+3esTyEkSyskG8MmZC0Sdamy0pXU9JAi/qj7DyE53mBB
	/V7gF8y1t/Lg9UXGsvh2crsRynoiiIBjsyxpSzOMJGj52D5ZlWrZ0HXDk/g6yHmrILVx034C0ny
	KgOUw/tRKgo4yGc0GZg/lb9uA=
X-Received: by 2002:a05:620a:4110:b0:8b2:ea3f:2fa4 with SMTP id af79cd13be357-8c6f97be394mr176145885a.6.1769355190133;
        Sun, 25 Jan 2026 07:33:10 -0800 (PST)
X-Received: by 2002:a05:620a:4110:b0:8b2:ea3f:2fa4 with SMTP id af79cd13be357-8c6f97be394mr176141985a.6.1769355189656;
        Sun, 25 Jan 2026 07:33:09 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-385da1a0a45sm19154661fa.34.2026.01.25.07.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 07:33:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 25 Jan 2026 17:33:01 +0200
Subject: [PATCH v3 4/7] arm64: dts: qcom: sc8280xp: Add Venus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260125-iris-sc8280xp-v3-4-d21861a9ea33@oss.qualcomm.com>
References: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
In-Reply-To: <20260125-iris-sc8280xp-v3-0-d21861a9ea33@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        David Heidelberg <david@ixit.cz>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4083;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=uwzGdj/l2lleZsXaaz7tMKvHRtkCMWu9yBtOm4qdOx0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpdjesewkgeBJNKqzgR6TqjFPWmlFPkmDy3FLiz
 gSLKtKkeluJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaXY3rAAKCRCLPIo+Aiko
 1aT/B/0RBcRodfj+texszWUs7wdimS7QMLazpxfKguIK0LbGijYgs/MjzY7mIwyvEx5o63oP8fK
 HG74r1TDkfjvQUliOLpV7vIwUoRdtU+xxlyQelRtXZTZixNSQd5jS0LR39b2RpZGpIxH0I+8qkn
 9Nmw+1sMCSQGh8fAeJzEVd2Ps3sRNiCVazG/FznlOeVTMxI1ylxt5kEJ3FFPpjwjrw7SrO8Npe1
 TRHhY9P+rQaJuTHJIJQBnywrp5H9uAOoDVhACVCrTWYefGwP+SUHmInM+jdWN8l57NCcQ3GEQyP
 DhdFDYetABGzohIU+wA+afdSLM4w4MM8FU9eM+QGkeH4g6SJ
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: -XXW_M4ngCRac9Qt0eDYtu6hhv0gnD5L
X-Proofpoint-GUID: -XXW_M4ngCRac9Qt0eDYtu6hhv0gnD5L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI1MDEzMCBTYWx0ZWRfX70UTr00pLh7m
 UAU1B/aKsWsssldInyXN8+DHfT/G8fexugsxJLIdw31Nkhb4m+R9bLbmKChnBdcqVm1/g2xXWMV
 nRiklwSI+2UlT3D8c/4NLU+LBcJ7Ykqt/8T6cb7I2yueMfFbNXNNrBJgqAy1swsKV1cyPasZbDU
 B//dasCoKDTKDGxNg5Q2ToHVAtjlZw1+VeUKnEvrS5jr/5US6k4uQ6blkjRl0YwAJjzIajsPXQ+
 FZjju3nJ6G44eXa5PxmshyyCj/Yk+/eOTgcjy5U8PL5oj/Z4/soi/esTBRvgchpoQvVDpjWf+S7
 1zmMm++z+k14DeHHrJ5nOqO27A/hpw1HNidAPCagMZAQEBjtJtBWboEM3YCh0YSvfQNwvcd5or4
 jyJXsYDM9Nxav3GNqEYkFBLYatDXLRfBn2rUyBN4A+KnUpixaJ1e1oeshlbZAZy9Yj8EI32HrPK
 cVwU6EGJ1ACvV3Gw9sA==
X-Authority-Analysis: v=2.4 cv=TsTrRTXh c=1 sm=1 tr=0 ts=697637b7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=GiR9guPQU3y8euSElqAA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-25_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601250130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90465-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[85b00000:email,qualcomm.com:email,qualcomm.com:dkim,abf0000:email,5.42.239.224:email,linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,aa00000:email,86c00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0BC2A8141F
X-Rspamd-Action: no action

From: Konrad Dybcio <konradybcio@kernel.org>

Add the required nodes to enable Venus on sc8280xp.

[ bod: added interconnect tags ]

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
[ johan: use sm8350 videocc defines ]
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
[ bod: dropped video encoder/decoder declarations ]
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
[ db: dropped llcc icc, switched to sc8280xp compat, added more freqs ]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi | 89 ++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 41c57e7dc433..66a65ae50f00 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -10,7 +10,9 @@
 #include <dt-bindings/clock/qcom,rpmh.h>
 #include <dt-bindings/clock/qcom,sc8280xp-camcc.h>
 #include <dt-bindings/clock/qcom,sc8280xp-lpasscc.h>
+#include <dt-bindings/clock/qcom,sm8350-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,osm-l3.h>
 #include <dt-bindings/interconnect/qcom,sc8280xp.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
@@ -691,6 +693,11 @@ reserved-region@85b00000 {
 			no-map;
 		};
 
+		pil_video_mem: pil_video_region@86700000 {
+			reg = <0 0x86700000 0 0x500000>;
+			no-map;
+		};
+
 		pil_adsp_mem: adsp-region@86c00000 {
 			reg = <0 0x86c00000 0 0x2000000>;
 			no-map;
@@ -4181,6 +4188,88 @@ usb_1_dwc3_ss: endpoint {
 			};
 		};
 
+		venus: video-codec@aa00000 {
+			compatible = "qcom,sc8280xp-venus";
+			reg = <0 0x0aa00000 0 0x100000>;
+			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
+
+			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
+				 <&videocc VIDEO_CC_MVS0C_CLK>,
+				 <&videocc VIDEO_CC_MVS0_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "vcodec0_core";
+			power-domains = <&videocc MVS0C_GDSC>,
+					<&videocc MVS0_GDSC>,
+					<&rpmhpd SC8280XP_MX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
+			reset-names = "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			operating-points-v2 = <&venus_opp_table>;
+			iommus = <&apps_smmu 0x2e00 0x400>;
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			venus_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-720000000 {
+					opp-hz = /bits/ 64 <720000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-1014000000 {
+					opp-hz = /bits/ 64 <1014000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-1098000000 {
+					opp-hz = /bits/ 64 <1098000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-1332000000 {
+					opp-hz = /bits/ 64 <1332000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+
+				opp-1599000000 {
+					opp-hz = /bits/ 64 <1599000000>;
+					required-opps = <&rpmhpd_opp_turbo>;
+				};
+
+				opp-1680000000 {
+					opp-hz = /bits/ 64 <1680000000>;
+					required-opps = <&rpmhpd_opp_turbo_l1>;
+				};
+			};
+		};
+
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sc8280xp-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd SC8280XP_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		cci0: cci@ac4a000 {
 			compatible = "qcom,sc8280xp-cci", "qcom,msm8996-cci";
 			reg = <0 0x0ac4a000 0 0x1000>;

-- 
2.47.3


