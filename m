Return-Path: <linux-arm-msm+bounces-104567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNFxKXmv7mnxwgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:36:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38EBB46BB24
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 02:36:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D7903018BE6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 00:35:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14161212564;
	Mon, 27 Apr 2026 00:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ihFWowV5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P6UFsn6X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C684E40DFAB
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777250147; cv=none; b=RXX3mmnUnIVDeDngNIBqDimlTWcIwNbIPt2UhJEDLk7aoAxVxTkPngbr5Sxdnzxemm6n2Q4TxE6PT1ylDVYkBNpAfFhBhHK0SG24jVJGAB9am0aGYTsHrS5RzEw2jWqer4r5hXhMogqp47ObcZjPDLa5zKnd7sJXNz6Y4zZBniY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777250147; c=relaxed/simple;
	bh=zTgtyyIrynHeifIk9MyaS4R1JAaWT6P0jUM1pXyZZKw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=emovMfTTyuc8A+sRmBJFgrXAF9xC7FVzH7Mq4kuHpq4awF8IBMLoTyLwgg4jLfUpjbWq2dX9VZZS34msCuFi8ZwPXXXprYFH23q+YKCt9QjmdHNQjuGerYSHQpL7AG3XiuA8Q/L3ILffMXUH7AdXyFxHLTGf3yQ743z95v+OQ3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ihFWowV5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P6UFsn6X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63QGdH7x2878398
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:35:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=PhFizofyBtI
	tMc9uyHKH2biJrKAHWnjnPNByrZeBZMM=; b=ihFWowV5s3I1LQdm8Ixby2QOLQu
	NsBhWG36pGx+UDtwA7O3Ij2vx9Y56MjDX1HA6hHjDVEDguqOgdh9C2ovwaMpToOR
	mEbfFdvtYzlLUe+raNcrWiEOe05c+7XpV5jz4kzRZVx8MJ5hKAh+HPp2+O+L83Lk
	M5XD1QrnNIMyP1mCKT3/Dho60qChkOowZLeBnmOPdZmToppVgASfwAieLvcYJgJC
	+pyXkIPxioJN6tHmqBylXRnsfgvP9/O9CoZ36swacrCf/z375GlAqhOnaeT2SSmS
	W8Jb6/6/UXbJkN/fXEUqlShyikM+TSqS8/1y0HeD7srqwSOBHDv0916nJ9w==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drpcdksfx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 00:35:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2eaed3d96d7so1501970eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Apr 2026 17:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777250144; x=1777854944; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PhFizofyBtItMc9uyHKH2biJrKAHWnjnPNByrZeBZMM=;
        b=P6UFsn6XqpMbkJMIal600Mbt74bsFbcK5ztwyj+4qs1T0NOd0+sEoP7NztSFKefDFf
         skpFhj5UzMOiOmdAasnFYz0roFdLy1eVgdBRwUebuQQDsMppCpvG3MJswoH6JddvEHvQ
         6ll7Bp2eVy6YKleZyRugx97xr6gQfVVb8XmAMySwUpziDpiXYAra6KsfKnPpQKR1a11V
         GU6ILrQ7YejuiNetD7Jz3J7pTY9TmE4DmfNKyTxZih4UyEqe/V2eCZ7MxyjkW0e9IZrk
         SZRBVNBEgj24EHoWo/VIl+1djaH94Vw43ORDsDuSg1XJiqObSXlqu6/zA4qprtvyWrre
         a/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777250144; x=1777854944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PhFizofyBtItMc9uyHKH2biJrKAHWnjnPNByrZeBZMM=;
        b=VqJ3TJcSyXGkKzdaR4/q1b+5QngcxLgrbOgitwOyKOHMPyEJbw1GaHuKmcyz23srY9
         ApbNg2iEqDl6pN0+Hr6lsTa9hErt9aWAp53bL7bsMg+AKRipSEWvjESlgwPGMmEB5XSI
         nXlPGYLhtC65qIAIEAswqx5T2vueOJdoAyOY6M9777R/oaB4RlSUEbbYDrvdsDEfiiba
         83dvsEERBgvZY5V4MN45FFLuVBxjVU7HleO+dGuJIGEqxDQCLA0oGkkmZPYo+Oay1v+f
         Ec657dK8cFXJxxO3EhD9+P+jgb9A86gGB5nkL17WW261NAfXZkS4yYiZvx3UK80glSIy
         YgDQ==
X-Forwarded-Encrypted: i=1; AFNElJ/3ruC4yKDbOY7jSVUdz4QulVpbRHhU9t0J9Swtrt4qe7UDIdPGeMYRKGCexi/VSugccvvYoekjwL4foNrZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxoUH7tOFr04TD6S3UEWh7Vg8davlen3rVhD3n79Z51uzGNjxhk
	fZs68/kaDBaPkQ7bhNwdQzq2lJ3aRihNBrV106ZVTbatdpudrOSbdIJLFJynX3bP37DI1bFr+to
	VZacAM+MAhOylgquizWOMSRNtzCjWeHCyuU2MO/7CKc50nKGYsjvsI4e9ahirIs3zhPeQd+RFB6
	JO
X-Gm-Gg: AeBDiesYGHZfwxqb5fDMIWFjZ2P1Vd6tw2wmEuJKD8pcL3IgZNxe4WJVmzxwtqAiw1e
	0AWbC6YcY9adv9b1KTrZcOCnz7YXwXJjumF+31EGr5Op0OOq2K5YrWfJXfd2XPiyjNDuOQnmYMQ
	FpEw7SXoXBoKJDbxuS4Ozh5xq/OGkHtRfWa5UcP0nkTeQCXlmpGpUig7ASOkXLSLBARKwYafbgx
	oRHX3urT8Gks2zQ0HyOSFNSL21Qy1/pojQ/9Bgqz8mKgtfP5HppdUqC90ma+afT1f0GQWICe97C
	CYA5UmewVrku1e2FsUBcqOdbVFFDNwQVOP/EdBHOCxRGZJvpUhW6Vxspb8VuiVFUYVPGObJb0Y3
	13xv40RBuOugyy3FUZE1fTYQvhgpe7+NGgJDh8rx1vPZAMWlZi+JrDlTV+A3Sa9fuD6iyOWzt4n
	X0OmyKcJjpRKsk53nV
X-Received: by 2002:a05:7300:2d15:b0:2c9:ee15:a0d6 with SMTP id 5a478bee46e88-2e47901662fmr24768178eec.29.1777250144148;
        Sun, 26 Apr 2026 17:35:44 -0700 (PDT)
X-Received: by 2002:a05:7300:2d15:b0:2c9:ee15:a0d6 with SMTP id 5a478bee46e88-2e47901662fmr24768153eec.29.1777250143645;
        Sun, 26 Apr 2026 17:35:43 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53d2ce98csm40010879eec.20.2026.04.26.17.35.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 17:35:43 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: arm: qcom,ids: Add SoC ID for Nord SA8797P
Date: Mon, 27 Apr 2026 08:35:30 +0800
Message-ID: <20260427003531.229671-2-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427003531.229671-1-shengchao.guo@oss.qualcomm.com>
References: <20260427003531.229671-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDAwNCBTYWx0ZWRfX4CfEWn1R0Yze
 aDKV3uzoMAg7RkygK0TXe00VUry8z+/ts/QqqeEgjde8XThgKpn3LUntYq8c8SA67dxHqCjxd2p
 6oTg8CDYU8pGqDaBe5Tf59UgI2JiYs7c/YgnMqGrINNh6HKRe/n11Gr+g3wg8zzMC2bC+6OUVB0
 9hYWuH2m/YqSAytWKte9Sy3yWhTsRZJg+KMxvymhsofWoRQnTOiokQa2X9e/alCspLLElDzPn8Z
 LklCTLc9373zcVMJd0WUhEhFXoraDB1qAy0qMoSMNZeDZM8yRiDBnR4v6dwBnRO/wB+DTz5SFyw
 f49vLf4D8mz5NGdVRcmO23hEScx8QEGnprsZ2PMX7wE9yOi5FsPOWm3BTmy/DjATi+LHS5NysTO
 RpLj0ssT00ecR5p/O5U+qiJFCUxMOMVFr4Ri2cEaeSu8qT3IJiczW9tMYSCCPgtzf1iKJWFFIaH
 Rth2LyI1XupxiJ8zDkw==
X-Authority-Analysis: v=2.4 cv=N5IZ0W9B c=1 sm=1 tr=0 ts=69eeaf61 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=v3ITllUuhb3Bg83hOPoA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: jxWfEgPRsd536E8rzMw4dU3LxDmd454G
X-Proofpoint-GUID: jxWfEgPRsd536E8rzMw4dU3LxDmd454G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-26_07,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270004
X-Rspamd-Queue-Id: 38EBB46BB24
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104567-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Nord is a SoC family from Qualcomm designed as the next generation of
Lemans series. SA8797P is the automotive variant of Nord, where platform
resources such as clocks, regulators, interconnects, etc. are managed
by firmware through SCMI.

Add SoC ID for Nord SA8797P.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index 336f7bb7188a..be4657417192 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -297,6 +297,7 @@
 #define QCOM_ID_QCS8275			675
 #define QCOM_ID_QCS9075			676
 #define QCOM_ID_QCS615			680
+#define QCOM_ID_SA8797P			690
 #define QCOM_ID_CQ7790M			731
 #define QCOM_ID_CQ7790S			732
 #define QCOM_ID_IPQ5200			765
-- 
2.43.0


