Return-Path: <linux-arm-msm+bounces-99445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GYfDuDIwWlUWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99445-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:12:32 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 919D12FEC90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:12:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B1F430D2EDD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 23:07:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 080F83845A1;
	Mon, 23 Mar 2026 23:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pew7xf7y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mo4sPdgb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19DE2BE02A
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774307274; cv=none; b=Vc0CIQ96AP90WhD+Z4a3on4vQ6midUB/9m5NWhYMbAiTxPJIOMgdVzRfPWnZnMVPLyMBOHz13PV64UzTBFmEyvC2iJN/u/fiAOEHBMjx/VMwLmMTGWmoDiNB2xNwklebqdO5Yo80Cp9Bzj/39NxZ3vygoy3lMa0hl5CirOJtQXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774307274; c=relaxed/simple;
	bh=rYhmBnCL80hR43VrOD1k6OOsJpkO6UbjaHN/5Hcx560=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K7CNNoJFVhi6TuO5vXUq6adHg4mSLfg6d1rTBHl2ulUHwZBHmopMzg6Fkxjf5hrZYtTRYKDMAQg33AZBfCTve0njGOOmUrtMGlvtk5xacUnU4FSl7Kg+5blmuV0HwhQjXxH4DpUGNqz7q473DgxqTq7LlK9STHwNPqad6Fs52bo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pew7xf7y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mo4sPdgb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqZ2i943558
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:07:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uTVRTSHlBsnX9NRgcT5jrXzREICtu3JkY3amuvfrncw=; b=pew7xf7ybPRD8ZQA
	m45oqPDCfU8s6JcHYG8+WcCtvZLThhZkA77E4IhTXhCr8H6ZC4DK8CdeFCJVAmlm
	JveBwVDpBG5tF4jxsZZop4tKpfinra0B9UgTwRl8fW9D+Lt+KpqQJt4DgkJ28skf
	j3/f6r/ohpDWYtFwuJaHOuN+N9dVU53Hd51hdKUKnfR2Ow7vXl+4DjAjdVDmPfIB
	ZtCuR/FcLZ/00eeBa3KesjQBGjuMTU0KeWBfnpmwHnbHstiDKuffK2HDWxv+xxPv
	noO0yVUzZdBRD2jNKcoQ0vizqgYovgyrem+bWWhvIr5bNGyTBKUb9zAxx5ZY+PUA
	wMmNjw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d34vkt7ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 23:07:52 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5091782ab06so161657751cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 16:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774307272; x=1774912072; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uTVRTSHlBsnX9NRgcT5jrXzREICtu3JkY3amuvfrncw=;
        b=Mo4sPdgbihszEQEH03dotMq5XeT9uOOYn697fkElsL16Cp9W+T1bhaMWDW/sLJc1II
         fgv5pm6MXazNK0Vniq0SLvBhmxMD1HhGVhDmQmcpEMT9WsS3Bj04kn0mTOcsUJf6U37j
         EM8qOOu6JGm48Oob57n4ZoROxL0rpCc6BNAl5OiDlpjbmbrAVAfl9+2ygoeVnGU3lqGJ
         sZFW7XmI8JDTmeu0+OFzIuWna3F69VCW/bN6lG5Dk2wojKjWjouPrNo6DLGyTWUk4NT5
         JJGjj0YNsNM5s02NIcYtRGBMG+TDtO/DI2hiLjPfRmE3g30TJRSnko9frOqHP9zW6rzM
         4rOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774307272; x=1774912072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uTVRTSHlBsnX9NRgcT5jrXzREICtu3JkY3amuvfrncw=;
        b=DtdAi+GMl6yBmZkFqMnkgEl4yyEdl7MbZkcBsNQtlL6aeD9rIhhRF7QUyFVI6QIkgm
         GOI+OeV+GmFp9U9CRAHyd3W/WzKHVpHaVsGojXTdJNPgmbO8YolZrqYcCsVKobqmXby9
         dibAG+BNCb+CGyH2zM0RxO9UMstmvEccDN+jRI6xb9xNSwa/5TctKLwkDghdt9HR25mH
         YJZt9J5r0dG0a3ciy2zGcs0J/Nf62MUUdZo5amIGyJ7C2wW1h/pWE5yN3nALrjJ9Aggt
         FjuqeeWHiLB+5mMX56z699XRXGKT/YrWcYR2I4CzRUCXV1fhQLS7dhnVi6pA6Iaov35M
         4otg==
X-Gm-Message-State: AOJu0Yz1d0wfiRTDC8u9rcheBSg7CJbwWja1S14WrCcOx4mawO2K+EMt
	h71DfMfC38UzQonKYkZaJwkaYrcXm80/Ov1yt9uWPk98Tkj2m++8Uo4QpN/qrfdBuYEx18nKTJc
	T6PbXVEoWTsT9kyEjKH+sY0jdmxdIQOSZr2d/snJiLw5AIrNIdzqzDR2wpNYmBeyU8CY9ZaY4B4
	Ab
X-Gm-Gg: ATEYQzyQGheqvT9N2wyTYDaxVd6ENTyc/bL++WRQAH/oB+cmPFun9fjoUc8tygAYkGg
	G56YfuQgS1Wlmm9qsctwJMqBCd1NWJoGD/TfxG8F2UNtbqlQOK1oORxR/63pfSyTLfptieGFW1R
	s+pgCFjWWFB2k8pLfWF6XHnU86FCjrV2rCUaKOhsPudyG2Vt5FTiszUanva8YCRTq2iTLDltbYE
	0D3BeY7s2D+BUBcs1HD39iJc5AlJ7OewdgA2BWV2ZhQ9eLOKedNI3mKHVVnKi9/57mhz1WbHqzf
	EJ2LKOYdzARJVNKKTqKIjdW6vTBj/iFsHMu5NWwjMmuPim8mmVsw+CsyU8v+gk5YJrtlmKV5HkE
	+Tn+m0YU0XoU+MODCJcb1HVlv8cmBpBOtrcEQWdkZccwhouFTzL7NTI0rPQW8ovg8XMbJMNNKTz
	u9y1vLbRpknMN2FcuN31lZ1Rp30fUcFw7UoiQ=
X-Received: by 2002:a05:622a:305:b0:50b:51bc:fc5d with SMTP id d75a77b69052e-50b51bcff76mr127755951cf.60.1774307271985;
        Mon, 23 Mar 2026 16:07:51 -0700 (PDT)
X-Received: by 2002:a05:622a:305:b0:50b:51bc:fc5d with SMTP id d75a77b69052e-50b51bcff76mr127755651cf.60.1774307271610;
        Mon, 23 Mar 2026 16:07:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2851ae39dsm2777970e87.36.2026.03.23.16.07.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 16:07:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 01:07:38 +0200
Subject: [PATCH v2 3/3] soc: qcom: ocmem: return -EPROBE_DEFER is ocmem is
 not available
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-ocmem-v2-3-a9daf5bce036@oss.qualcomm.com>
References: <20260324-ocmem-v2-0-a9daf5bce036@oss.qualcomm.com>
In-Reply-To: <20260324-ocmem-v2-0-a9daf5bce036@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1117;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rYhmBnCL80hR43VrOD1k6OOsJpkO6UbjaHN/5Hcx560=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ+bB47tCxc89Xpf4+kHTlKikEut3qyWfXNqcu2r72iXfx
 PlNuLn5OhmNWRgYuRhkxRRZfApapsZsSg77sGNqPcwgViaQKQxcnAIwkReS7P+rr+78s7edP+dk
 2d1+5xOnr98JcTrfUH0qy3cT12vmBWfT3JNaplo1Lw/9nSM3u7fnQdhMZ52P3rtS+39v1Cqplr7
 8m1frt9WcNXEMeh4WbD0h8zmqD3qdSGddqrdtqUYdz3lB9sWpWXfusojvXscaqVtddN+XyaFlh1
 62i6ppbuj3Z/UMh/T9CloilJ2sg7L8zXt0mDs6Wv8Kdf9hznvUvMhbq/rZf/vVnFVhPMF5EuvYZ
 3u+t3BSqvA7VK/rsWtnzM6Pesce/nFafahNvrVj5p8jK9borTAznLCzsbQt5umF1SUSUm6OqUeb
 A8ybLSQnL/MR2vT/1+ysBma/+eEp4ZbpIdKnvb5w2/UCAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDE3MSBTYWx0ZWRfXzHFsPplmUhPT
 4xL8wSEV3p0oV3xl1M7GVlGSfIN+ixxf/L/QpzxpdKMeVi3cKuHaXQibPZzuFnmzzk2OlGXIZAz
 p5mpvCSPPTAHYDMnkNBDL9G82bArEbzkyU13Ovg+e+eAnd3fh/R18vHTJMHk0vUzd5L0qO1hZT9
 ZhIJOo0vBld4dt0+NW1m8QFqUMjGxCBVruLlwJXttGuD9U/dJ98g4sO0N3T2S6xvic2N8JkL8EK
 kYXBIfCmPgHY+t4vf82BG5kzkGfZMJE6bDW1n8lI+Q9samslkR5yxssLZL/DAkaTD69Quod4PJv
 GPAISsMhmobRigj8SQc0fs8fJoQhf+mVcG8aqLZDGS2hWbVYl/5bIpDSw798Mqcgv8J+bGkys/h
 HX/VkJbfR629zn7Brxh9KNVUAgv9Zgs44c771Pml5k+Q0htzsUwMrjX+wB1BPbVqmXXn5xTdsDI
 /u8+/q2xuz611RXAGIQ==
X-Authority-Analysis: v=2.4 cv=eMoeTXp1 c=1 sm=1 tr=0 ts=69c1c7c8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=jF35gebAb0dmRqIMnzgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: sSoTLJzePQ32e47ErfYsrnno0CyZHw52
X-Proofpoint-ORIG-GUID: sSoTLJzePQ32e47ErfYsrnno0CyZHw52
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_06,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230171
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99445-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 919D12FEC90
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

If OCMEM is declared in DT, it is expected that it is present and
handled by the driver. The GPU driver will ignore -ENODEV error, which
typically means that OCMEM isn't defined in DT. Let ocmem return
-EPROBE_DEFER if it supposed to be used, but it is not probed (yet).

Fixes: 88c1e9404f1d ("soc: qcom: add OCMEM driver")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ocmem.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/soc/qcom/ocmem.c b/drivers/soc/qcom/ocmem.c
index d47ce5707fd8..96ca0b87bfc4 100644
--- a/drivers/soc/qcom/ocmem.c
+++ b/drivers/soc/qcom/ocmem.c
@@ -203,10 +203,9 @@ struct ocmem *of_get_ocmem(struct device *dev)
 
 	ocmem = platform_get_drvdata(pdev);
 	put_device(&pdev->dev);
-	if (!ocmem) {
-		dev_err(dev, "Cannot get ocmem\n");
-		return ERR_PTR(-ENODEV);
-	}
+	if (!ocmem)
+		return dev_err_ptr_probe(dev, -EPROBE_DEFER, "Cannot get ocmem\n");
+
 	return ocmem;
 }
 EXPORT_SYMBOL_GPL(of_get_ocmem);

-- 
2.47.3


