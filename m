Return-Path: <linux-arm-msm+bounces-97572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6D+IO442tGnTiwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97572-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:08:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 897B9286B06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 17:08:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 52BDE3065736
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 16:03:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CC9B3B47FE;
	Fri, 13 Mar 2026 16:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Bbkliy2r";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hzga9zL+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D99793BED7F
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773417809; cv=none; b=o1mHI60CvjSu7UflcWI4GTnCiYmXULVPsfopiqB8cjNn1f1maCeTl9jNCf4l37QxO1nR7HiQ11pkOVIpkD/hp9JKpx9/cIkXXmcSN4KIYdOxufhALjCgo13IY0nQuqgFPGGInRNn76nyN3RXAktS3O3RvsdW0ahppGSzI7c6XkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773417809; c=relaxed/simple;
	bh=D2e7UuXJcT1ID5HskXA6pUPVIuj3DeXLnwXH6kslg+c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cl4WBYg6Kxm4dqCrHHM3UgrT+yYnkrKADLxYFRZqm+VDTz63KgaRv10ewjDEOQCXfGRs8F1Rv8+XAlgzlNOjQdQuHn6mBf0Zd13NIBo8Eme85CHUIDQassMBrfkxCXpgQnlyIhmZssARNEMtCmO+CoFufCVij/p138FCcAzFGQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Bbkliy2r; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hzga9zL+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D8v6h6481304
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vG8vHIVw5E1d8YHQ6tZL9MZA6D+qNp4QgZj7n0z6ZyE=; b=Bbkliy2reHEeLIkA
	qo8e2sMKpL8VTLK21YdIEBkK7CRGypKtQr1xOIHBZtWugY3kPeQ2zoBt6c9nqxP2
	TvnErH4hWlDLnvbXgSD9KgxwLuJX4ZlFyd5yQAxvN9YxX+tjzsNQopn0yeTIvW42
	T/BDMXYZbBIl2HWyu1v00XixP6BObzHjs0Rnwd5CWkbYoYPy8Q6bOlKcGj+MxwIf
	SMs47E9RlWcGxEnSGwyDMAK/PQuhjmaj2Y7TXNN4vKorXJsvurLXwYpg8Bs6/CNd
	Zqx2YHIy80AMFenuqAoHBy7PfvJaEd+KzkJdcsygkt5NcvReCI9QfkETv8ZxzZ5K
	DEGGeQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvfh7sf76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 16:03:26 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82988b04c5cso7279780b3a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 09:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773417806; x=1774022606; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vG8vHIVw5E1d8YHQ6tZL9MZA6D+qNp4QgZj7n0z6ZyE=;
        b=hzga9zL+l0iPDKeDM87RBx6XG9sE9XcpTtjzW+TwADI0vD/PNsV91zSmDbNZ5IvRJG
         Uotc0yMYBwwiaCsa2DhXa2Sni/JDlGWVOhREiS+1ty0cLi5Ygr+Cbf9Jt8s945DEVxgP
         rMqGC0oZjZ0x7WSerp9VOZzWWXq4FP68EddfhkD9039zAhY9rIpeJbGYvNmJzYm3eh5F
         QfuQg8JQ0mrC8psTdxJWMaGJrPw7mrTJPFtswBB+40NQks+yW1OLsoGb/TrseSAjDSIO
         V0Ky+tf9UT8wnrtmpC4j/hUy1Ea6fVVr+0IxSZvN8awdXnwiR61cacbG6XrnDFxcXqKY
         bjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773417806; x=1774022606;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vG8vHIVw5E1d8YHQ6tZL9MZA6D+qNp4QgZj7n0z6ZyE=;
        b=batmA9HR8HTpMJMT/B5CH2BO2nWOu5UMtSevMj4AsvdxsIdPfAazBwmuH08DLAShzP
         Z16Js937jXlA7ZvdNKi/f2jtthTz6dG+b6LTqh4UsfQFtgLktc1DaV4oudGLl57xhuXH
         cP/smTF/J+538Yr23TsxKKlDbjXOHx9EBQ1+6sxzaeQJfEC07hlsxXFj8U8TA1+rEvBK
         anBZvr8vgDT/TaGv434yM/NFyXiZjMejJP8tSC9Y73rV3VJcfBnh63fM3jU2W0IVDD6u
         1v9aBxzmQgHxjFu5HPEKTNw8Ff73sNWM/CVpyS2MnGgTRD6unzS1Q38YF815jhr3oipT
         DFfw==
X-Gm-Message-State: AOJu0YxeoJ+CIE801KwIuuU5igcnQYccanE43yk4wRo2mfu9JTxB6jEk
	wMqQA+cmD1h2uXHH3LZRzROwuwT3paGRE76IyHlN+CItuepwVzQAzttecDASpy3VAdPl8VOVJ25
	Atzcp0pce8Q1pl4h3iUupAZDoFHfL3pAKOH3ZiabcScsG9hZrnipTTvuimHZg034Ulew6
X-Gm-Gg: ATEYQzxOzmb2HBkvfJmAAAQu1uyZGFCbPFYXni7bURPwzUuqBM50vyqaLI2IP28+9X3
	helLe6guCHkI7p9wR69WLIrQsLV/dETcAAkOSEN2g3+ocUtZ9yA06zJkFILJBfmKIhBpAIxiN73
	x7jGnH93piOl5ZFOSItjbJRurcInB6d3BhLd+cI6hkb8zF24dBHWMteKjv0ntPPM6UOnOpHexts
	QtlFtZ2MdgQBTD8N5OLQvy4MAaCGvN9mKPUxm7osqVKi7dayTbkREYv1EqsivZSC3LO4QJdpDwO
	Ty8ot7Mx/NmrIrdQq1Dii9IHKZusYPkuFPpfAnuefbfEjwZNqREeneqGoBuEOAVZVZmw0bYLt7C
	azwFuGUlVTp2MxlsAKODiiNDWeqXjr9peBautYhdO/zaDMdMW/EbqovUhkSVJHf/HYEggPhhfbD
	3rTX+EoWeZpIpok8sVu13d/MIWuFU9BLOBH5Ti/EoKAgqqNcaZCu8pxOPa
X-Received: by 2002:a05:6a00:a04:b0:829:8bb4:1030 with SMTP id d2e1a72fcca58-82a19896b1bmr3164444b3a.42.1773417805747;
        Fri, 13 Mar 2026 09:03:25 -0700 (PDT)
X-Received: by 2002:a05:6a00:a04:b0:829:8bb4:1030 with SMTP id d2e1a72fcca58-82a19896b1bmr3164396b3a.42.1773417805185;
        Fri, 13 Mar 2026 09:03:25 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a13a2f2d6sm7617470b3a.9.2026.03.13.09.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 09:03:24 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 21:32:56 +0530
Subject: [PATCH 1/2] dt-bindings: arm: qcom,ids: add SOC IDs for IPQ5210
 family
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-b4-ipq5210_soc_ids-v1-1-97faae3fef95@oss.qualcomm.com>
References: <20260313-b4-ipq5210_soc_ids-v1-0-97faae3fef95@oss.qualcomm.com>
In-Reply-To: <20260313-b4-ipq5210_soc_ids-v1-0-97faae3fef95@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773417798; l=1077;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=D2e7UuXJcT1ID5HskXA6pUPVIuj3DeXLnwXH6kslg+c=;
 b=PT2BGW3FEetZ1LvpeTafSrUlj3wVGT+V1KMkZR2F8FofLoM4nM3QqEJDxA49v74pReJDJ63Zd
 LmtOpi4Q9xmDxo9Os/B9kdIKEt7bwush4AsbJWOQOXaDUBBsbhLpHVc
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: 7zStWf4aE5yBGCJY-as6OvDkKgfgBdPG
X-Proofpoint-GUID: 7zStWf4aE5yBGCJY-as6OvDkKgfgBdPG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEyOCBTYWx0ZWRfX1KfiEDu29hX1
 5EnHbRCLhh9ly7/AO5KmdFF3U6m64ygj4ZPE5XchOZzbgmKJsbvDMKC5wKW4dymp5sYCXUz6ghr
 1AP3CKbMfpyz+gIuQk4pxLjf4UyxXNncZL2BCl4kkQJ/uUZq1TY7kFLOkwKupAJc1VlCO+yqlQ6
 ZzPK+/Q507yt/T5fcMWnBMbBA3DN3zn6S7PsfDfgm89oRXHzpY8tY6pr34WgvOC7TB0a4Jsw3bb
 dTbw8EKG/gu7e9gA+Ft4e/p59BN6eCN8Vqd7NG99IbBAce3r3rsrWUpIFvcv3X1OTfItiZ4gGm7
 DpAjsvzvdnjvjy7krvCTmuTrzOiFEt2liS9ftAkw0XmAn/9JzrxnAywz0ERlmqzjxR3AweipzPM
 scKuFOJ5uatPWKQ3m0p1I2E3b2zm5fo9StQa3bAOPZ2Xz1Rk60dAWpabjNKjvugQZpYLEnmj38x
 2uPTDtIrRNXpKPu1n/A==
X-Authority-Analysis: v=2.4 cv=BpiQAIX5 c=1 sm=1 tr=0 ts=69b4354e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=Fu2THIaEtsgb9gtVlWYA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130128
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97572-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 897B9286B06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SoCs based on IPQ5210 is shipped under two different naming schemes namely
IPQ52xx and QCF2xxx/QCF3xxx. In the later variants Passive Optical Network
(PON) interface acts as the backhaul where as in the former it is
ethernet backhaul. Document the same.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 include/dt-bindings/arm/qcom,ids.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
index febb69b0438f1ca377933196045c5bbdc93e1d8d..4e8cd0b5eaa7bf9c0f072cb86f6232e3341fcfaa 100644
--- a/include/dt-bindings/arm/qcom,ids.h
+++ b/include/dt-bindings/arm/qcom,ids.h
@@ -296,6 +296,11 @@
 #define QCOM_ID_QCS615			680
 #define QCOM_ID_CQ7790M			731
 #define QCOM_ID_CQ7790S			732
+#define QCOM_ID_IPQ5200			765
+#define QCOM_ID_IPQ5210			766
+#define QCOM_ID_QCF2200			767
+#define QCOM_ID_QCF3200			768
+#define QCOM_ID_QCF3210			769
 
 /*
  * The board type and revision information, used by Qualcomm bootloaders and

-- 
2.34.1


