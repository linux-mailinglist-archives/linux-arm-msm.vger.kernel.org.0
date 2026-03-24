Return-Path: <linux-arm-msm+bounces-99458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mM8NEm7XwWkaXQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99458-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:14:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CFB2FF6CB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 01:14:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D841305B4A7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 00:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 520CA1AAE17;
	Tue, 24 Mar 2026 00:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ThwdjKXB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XCJp2ijR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 004FF1A3166
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311071; cv=none; b=Yju4IhK8SxSWEEeRI6euilKLAefVuwXZIeOLTTO7xvr7ufN5RsVaL2wnK1pLEaCTrNGFFgc5QDvQEHgMGHAYTc9CMROGhP3G+rwXc7IHruGT5EGwX8H8lRzVj7d9ACZzkFXPNFtGdhGi7NAMEG1jQpJWypsR8+z/M6cc7oeDI/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311071; c=relaxed/simple;
	bh=ozckWw8+tIOW7mP4eABTKY6sc1w7ANmcnxLtEjsHZKg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u3DJZ65YMo1zva0uRZ3mtS8S4jxNyGvXLviOFXQ8jrzjCcHrWj0ZqnjLFsL++XLLGqFjQ4h3JEWmtF2w5w6eDbYCDmRP5QKNyVcHDzuq0UbbmYHmasOp2klXDgmNfYeeHuOHBtaRJ3JwCDhLLw5Cph8MY85lwN++FR1Yqye5AZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ThwdjKXB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XCJp2ijR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NHqk2e3934878
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BQNTikIJkmJ6qFsbEmCD83zmmN8XeAHJf1MCNwZkoic=; b=ThwdjKXBIH/GM6v2
	+C4NShoWWmvh9MpwK8l4xrvr7GK3xfW00Ygs1ZcTXEB2g+/k+zeWyoao7lAUcxgq
	nlNBa2QlAZSAZnyiBp0rEd23/SaCBlwUjYOgcGIXZHdve2KBCvJZ/irnLtod9e4R
	op5xPPxkOHgfBN97JvvhQEfEG+89PxT7pXzKyS7X4omDTThhF0MB9XukfeRVUngS
	VkQFBg8fEfqh5PJHv87shVBDIzHx/r5FDJgdaY8zKB9hpxzsL7xr5vMfW1+eTzdM
	BK1Un54UdRnSu7vhv/PXxSAlh3xCthKYf/vcl+ZWOPOXXzcsX5dtcOtGHPuu2SZZ
	qY6djQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d37a0htx7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 00:11:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5091327215dso194378161cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 17:11:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774311068; x=1774915868; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BQNTikIJkmJ6qFsbEmCD83zmmN8XeAHJf1MCNwZkoic=;
        b=XCJp2ijRDYBvEr+BG2Hp88dY5SerPrH/IjL0E/aaLCWa7X1juCfuBqd9dHWsB/Kr4d
         dIOx/8LMz75ivNLq5PI+bJS2As50wbTvtxojTsm8kDbxj1MvNwnF5LREDBmxlyi8K4gF
         paypQlwHloPCu5WaqLt6mLvD1oLCySgXS2jjFgKc2Ca5n+W91EXjQTbKk3mPLYtB4y5Q
         uJJqaB5xHNz1VGDMwnW/LuZl65S8ET4taPaXKe42bbibfGoNmsV+a36uxFfnjdYg5FHC
         uASlPsVY+yqHTIghxA6TqqFg+3OBsFD5CyOVkmwvxolG67D4tucVgOacBDTH0PB7+muy
         m31g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774311068; x=1774915868;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BQNTikIJkmJ6qFsbEmCD83zmmN8XeAHJf1MCNwZkoic=;
        b=YfeyFwPGaDkd83EwjdQ+CQftfgMK3PCLptwPbUWAunxQAD51KJRcm5Mpq+cJJaQB8F
         tCG7f4gUuHFumHrhxqRnQfDk5AHSCNAth35ax7WwwJYzo8ssKYsv7w9kzlh4K1L3n+a5
         gnkBnLZVSSrLMLV1y43OZcXnn6UPp9BfOPi6sNIzGGokRKFlHmjcxwe9mnVs2zCH4QsG
         jHS/lmVsx2T3DIOjWsRXF9noekTlNb+SMqzwxFQlqjGEGCipIRty9ez20VUXE2KlRxpq
         kcNunShTeAkIuf9hc5ccsQbE7hKJZNpeEn+wGj/YyluYnT6RXxGSlXvDFTyopJqIJsKM
         h/dg==
X-Gm-Message-State: AOJu0YyvQLN+Su2qg6RnI8YPk5pBKoRI9VmMix4MEKCCBJwPIc4x1cXD
	0eR02PGW0U4/qVOyeTHNyDJa08dlKEO9pmCOEEtZoCDHm/33YOIalnr/kcpFtrFDVhyZujZCvEY
	USJ9fkqJO1u76qCP4A4O5apLn5iiL85J7aDSdwbik4O8DI/sHWbL8X0LYy4Lwn+uMxdQz
X-Gm-Gg: ATEYQzyMGA55q4VOKD2tcNvRrN5AapjYouMALPiLYvQ7+Fr6Jz+L+yDhgxNeXSTTlkT
	doSAoqbgS8ko/RF6g6YA1Cg6umjS0ShPwu9906FH+TgsECZUR2+gLlsgcXjdue2+uwkOM4XUU5W
	QDaQ/rbjjLu10BTxgnHusZMyl+SAq2zKKtphcQCfxeTIXiaDX8TfO09OLFWdOPW52DfVvFXH1qJ
	TdUJMSR7xwl4pM3cLLCUu4r16RR0pmWcp87CZgyCLNWZrhIAJ8NimPZAYS/9uV2xC7pUwErPWaq
	lqu/cyNc4KCir+/4q2G2qP+CyH8TBk3ar7UCNTCTUOwBL479wVyd4mI+AmQp/wt96AFYyKq5iZX
	Ub8mySz7tLBLVHRWxQVL6tyeKOzqGjY9E1ffZinHaKtQv74xSoqcijsc/FDxCguDsElVPHuOrFy
	Fmff1VORHnNr8Yv2VcByKlhG/tKgw4rjIZG44=
X-Received: by 2002:a05:622a:52:b0:50b:37d5:67a4 with SMTP id d75a77b69052e-50b37d57012mr217685061cf.27.1774311068118;
        Mon, 23 Mar 2026 17:11:08 -0700 (PDT)
X-Received: by 2002:a05:622a:52:b0:50b:37d5:67a4 with SMTP id d75a77b69052e-50b37d57012mr217684641cf.27.1774311067603;
        Mon, 23 Mar 2026 17:11:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf99820f6sm30339021fa.19.2026.03.23.17.11.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:11:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Mar 2026 02:10:40 +0200
Subject: [PATCH v2 4/9] interconnect: qcom: icc-rpm: allow overwriting
 get_bw callback
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-msm8974-icc-v2-4-527280043ad8@oss.qualcomm.com>
References: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
In-Reply-To: <20260324-msm8974-icc-v2-0-527280043ad8@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ozckWw8+tIOW7mP4eABTKY6sc1w7ANmcnxLtEjsHZKg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpwdaH77+a++fkvnb2TtgevMk5sQdGw4+5k7KMF
 Nc4XWzaAOiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCacHWhwAKCRCLPIo+Aiko
 1WJHB/9wSxBxhVz1fPRLOcC/xcSgPP5OUjSpZNUqcIoNgsFYJJVUpapM9V9tq81MBYE78b70QkO
 zAntNoKcp9Sykwx/wZx2LxbFM0uOlk2nIRsqreqTZgkcR4Q+ODtym8bdR7l2E98eLT/c5Ahpiql
 sBubAL6kzWhVxDd66Hs4zeaEfv5Hi4jPgLyXiXLCaHkFBhpNfg39vhat44hcV0O1peBL1r/6EIo
 VDQvlJveKlkr8GcS7U7pthywqWS2k9XEe95+6QGj4nLTqwfTX9aejWB4BIktOdbuadA5VTB8NyI
 b4eyt75resKVvjidTc2MedmJLjaz6tIIBxhYQZOutPWFFYox
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=GIIF0+NK c=1 sm=1 tr=0 ts=69c1d69d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=6pvQaZlX7ZpTHHZizXIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAwMCBTYWx0ZWRfXxLkZd2Ddx0lr
 hCdE7TTHzjXCItRlZaj0gMAz8oV9+0r9qAc1ip/UYi5GXZTTIV1EvG7cEHIgeXUaJa3eApVeq8d
 0hIXjG5Y/6rfY0bfbf3YANLo7sv9RGfu0pRR2FJFjIDSd6p3hlq3ioQIG00IKQZe9wYYIa3bTfb
 M2YYbkp8ZO2ACNsbJ7/IL1ViAfyB8jGwGiRrqXlOMeFGflfUPrN+s0F7mZVmMgqjK+CCuoHWFgd
 uDb/B5uCmtk7dc1sixgilTNnfFSb/Rmp5s6XR2vN81Zlmf+vXu/bt/e2fN+kLHHW+aPN71Mifwg
 HASpHuX/14EeM4rrUlGcah+1vfsabOdW9YIod1HmwngvveNJWeIH1NyeBVBv85lmbhdVqQmYrfF
 UtuUOy3vYFxfQBPC0FxXALMu1oJSZ5NGV0o5FEbxfzOQuQY7iZK1oSKG+m6bmKpjjZbdRhCwNpW
 0LYDSDlsIfkM06uVkqg==
X-Proofpoint-GUID: qIXSmhltXnNXwVUccGg_NqKGcSyoJbFS
X-Proofpoint-ORIG-GUID: qIXSmhltXnNXwVUccGg_NqKGcSyoJbFS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_07,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240000
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99458-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B4CFB2FF6CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

MSM8974 requires a separate get_bw callback, since on that platform
increasing the clock rate for some of the NoCs during boot may lead to
hangs. For the details see commit 9caf2d956cfa ("interconnect: qcom:
msm8974: Don't boost the NoC rate during boot").

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/interconnect/qcom/icc-rpm.c | 1 +
 drivers/interconnect/qcom/icc-rpm.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/interconnect/qcom/icc-rpm.c b/drivers/interconnect/qcom/icc-rpm.c
index ea1042d38128..aec2f84cd56f 100644
--- a/drivers/interconnect/qcom/icc-rpm.c
+++ b/drivers/interconnect/qcom/icc-rpm.c
@@ -553,6 +553,7 @@ int qnoc_probe(struct platform_device *pdev)
 	provider->aggregate = qcom_icc_bw_aggregate;
 	provider->xlate_extended = qcom_icc_xlate_extended;
 	provider->data = data;
+	provider->get_bw = desc->get_bw;
 
 	icc_provider_init(provider);
 
diff --git a/drivers/interconnect/qcom/icc-rpm.h b/drivers/interconnect/qcom/icc-rpm.h
index 3366531f66fc..cbf0a365839d 100644
--- a/drivers/interconnect/qcom/icc-rpm.h
+++ b/drivers/interconnect/qcom/icc-rpm.h
@@ -135,6 +135,7 @@ struct qcom_icc_desc {
 	unsigned int qos_offset;
 	u16 ab_coeff;
 	u16 ib_coeff;
+	int (*get_bw)(struct icc_node *node, u32 *avg, u32 *peak);
 };
 
 /* Valid for all bus types */

-- 
2.47.3


