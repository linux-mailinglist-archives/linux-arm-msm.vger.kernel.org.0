Return-Path: <linux-arm-msm+bounces-91398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iCmRA70wf2k8lQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Feb 2026 11:53:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A32C5B10
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Feb 2026 11:53:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 528153073406
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Feb 2026 10:50:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 196A6339863;
	Sun,  1 Feb 2026 10:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aa23tBV7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a//g5Xam"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC5632937D
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Feb 2026 10:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769942970; cv=none; b=AcsnY1r+XiqwyuOYAia1JUaQ0kNu0hNpWpjQGSJiZs12oDfCKI42Yywc6LldKRLLvmD+gM/Qa9W7eW1TjuBrMZTOcT00LlQJqNDaoKK+6+7qDhxVDa2vUPp/596OOxDqnnWjekXY1oy7+f3k3sheUdrgo3JRaX8Rgg4uoicdNus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769942970; c=relaxed/simple;
	bh=rOtATlSUdBEg1H0iWW1mR8swNg1N1WiPDt1QTwWw37Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QPRucx7aUBIcZrNWsu38arQ3aamtkdvUZcZWMnyUwaaEU7r4Bszb8iRQXajhTxKnx6I2krkC9KFCZesSmBwbqq2OZLHadQ9CeKyjlSdl8FwTb7bm2gcwT3Lp6g4Ur/lJl9FZe9HJW4GoYMl0dcOFzAoAauELGY0nOheA+qTTJJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aa23tBV7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a//g5Xam; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6117SN0V2968777
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Feb 2026 10:49:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FAPtvj1aaT/4nS3PbQJ8vu2dWXMqUi3SGtAzQD4qK7c=; b=aa23tBV7ONrBIQXf
	HkaUgvvVAUtiwydR0UX1F/GOAy0MPW3PNYf+i6yotyR/DY2beQEpOmi4oy3JRTCu
	WXwi9JBc6224Apt69Z3TFfyr+Sg9a3BSVc03y77TxxmiIEqITXnjEagJRuraEO+A
	evK/GRhDiB2wcxu7bfcaDIkSPzEROt+E4wjKO34vV019LI7nNHe5TzTI+M2oFP6d
	z9mkE53LL+38PQLG79wTv/Mv1geS/H3OYdfVR8vGxKr+tmmIxXnwgnv8e2E8M1v4
	gutw3VBeMMdO/DPAq8wP1uSpjRy1iqlZrzNT3e3DO8N2HKgTeRrTTpr0DKMFPBsi
	3yDlTQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1areaeat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 10:49:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-503915b0a88so57255141cf.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 02:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769942964; x=1770547764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FAPtvj1aaT/4nS3PbQJ8vu2dWXMqUi3SGtAzQD4qK7c=;
        b=a//g5XamJQkvZj/is8HbT6D4aetlSZS9pvnRW4sB6Z3TBCLFyuVPDunt8zhsbvf5DO
         KSRL9uSllaSYxMmvLsCZwe/vTVOdyWtN2ibGm/ScOQUzTWE+X3I/12muREQOtZQcymao
         oo5s5os06Q83LjadQM44gSe1GuY9BpsX/6LYO4ealHOrWkYjAqd8hJz6RKGMYDCv4dj5
         iV6fzxaZrwg27cN79jdZetEKi1kHhLQsDwoJi6gkkqflXeVk50l29e9Yz3YS2uifdVkM
         gX3hQVMP5OLv+ElLfPEI/UyyMgx4O5J65R91tEB/4OZDjookWv4kYNF9gFq5AfIXC3jX
         sXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769942964; x=1770547764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FAPtvj1aaT/4nS3PbQJ8vu2dWXMqUi3SGtAzQD4qK7c=;
        b=T8MYFqGjnYTAdIfCKBx2NkTqGC5xqOvH2D5P7urGlpUZV7bfZqP3fatGsLuLsP9xnB
         IlVFbPg8cxty2C0Y13Ttl8arjKBen3v1oIH9raaE/plFaBXZYsDNxJG+Ycv6JaGHsWN0
         hkvOLln15v8R0KkCVVv7JjmCKvg6J5fh8UI84ecxi6XF8dpBRAA7ttb2wFKVGuHh2bcO
         /rrVEcfekcSaaJLxbMP+BbZjq/+7I2vosWxB3NlZ3AggAfLsioYpDuBnaZzYGsDrYaBa
         kgNaT7FVkklfe7rW13uTajvxQerCvIFM6noGsi0OQBLey/0o0St6MV2eQFnjf8u4lTu5
         xvKw==
X-Gm-Message-State: AOJu0YyY4mhSvXqsLpAXWSpHUyvHdFXMhdEnW+gUFDIGkA0D0ZoY+uOh
	l2g5X73moAeCCvFoYyiDrrJTh7hr8EYKxl6kEM0kE6XnVBAeHXDeqWq8NKx3a62FClBYq8HSqSz
	V0EiuvU0xRFADiMhqlb5RodD6StfKZqeG4gzoSqpPxxTRhN6nZJ0zJRaUiEeiFGm0nqan
X-Gm-Gg: AZuq6aLSoLwZk6pgYMMZS8/dr2iP0HRVL7AWKT/uR5hKGHCM3AarQM5l9YNgn5U9QvG
	qGX+gDMW4jJa0B7QLkJI+qBUJzAeORV/0xdBckRvPZdeHeVUoaxfTP4xNv3LgDmcfk5LpPs+OtS
	w3AgjV8Zey0n6xKiV8aEx3x8x2GtQCQVxPQ9aUy06GiKnldAFGWLKX0DVIo/Ntp5IW4huD4DtRL
	KTByjuNXLA6HHM6+s6kayO1ndmAMdHVEuDr6+B0LC5xyMDfCaz8qaMDmySGDoMhk4IpLSlXLMFM
	teLs4y6EOhOEGpAMZuJoZM/0vKwxD9OrS6T4KOwo19VXkGcIB4rG3sRCs5WItGH+TrZQYKCmSlW
	8rXF/oTWuFE8rQkOGT7qC02SUldaYXVmndI0GKe4aItthDwiUDFWpHOQid7mrzchjYTv/Ht4Hb+
	QxWV2tKfLhWeiKckhFlRyL/cY=
X-Received: by 2002:a05:622a:1186:b0:4ee:1301:ebb3 with SMTP id d75a77b69052e-505d226c899mr92131431cf.54.1769942964429;
        Sun, 01 Feb 2026 02:49:24 -0800 (PST)
X-Received: by 2002:a05:622a:1186:b0:4ee:1301:ebb3 with SMTP id d75a77b69052e-505d226c899mr92131241cf.54.1769942964085;
        Sun, 01 Feb 2026 02:49:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b7a8csm2835006e87.77.2026.02.01.02.49.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 02:49:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 01 Feb 2026 12:49:05 +0200
Subject: [PATCH v2 8/8] arm64: dts: qcom: sm8250: correct frequencies in
 the Iris OPP table
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-iris-venus-fix-sm8250-v2-8-6f40d2605c89@oss.qualcomm.com>
References: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
In-Reply-To: <20260201-iris-venus-fix-sm8250-v2-0-6f40d2605c89@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1819;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rOtATlSUdBEg1H0iWW1mR8swNg1N1WiPDt1QTwWw37Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfy+mrexJvxvRxvLaDB/4xTWsitXwKRuyapAos
 wg/sBPcXI+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX8vpgAKCRCLPIo+Aiko
 1eE9CACeDHGYlons6fPMaRboS7Ni6okVtQVdnWfL12L81cp/aVNkJSn8SC5yV1oTFjQLoo8PFNN
 isOA74pcXcDEcKxmDKGKK0Ukcg6y5aezORHTjfw2eBYENAqFz18givnM45c2feDkHhDOtA3X8WO
 xyDB9oT5EU1HTv5vwRcw+kC7cpue14qKM4AD0T/R4FInatsE29mwajYRBTDSlU+49ku4JTbLVQH
 wsox9HD/rbKxlyWWrcchYEYlKxsIRdcMvd/Ik9JgAB09gVotPHLzNfVnsmPXoRfH8eASGGXuquK
 /gnW+qiBIJgQoIx4dz77KWzj6BsUEclyh/ByBnOgW2UCFd+J
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=NNfYOk6g c=1 sm=1 tr=0 ts=697f2fb5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=jxPhmlQz5o5YGUuCidoA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: cOmzkOpVn7_BUtjHshhvVSWuw2W_Bw-C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDA5NCBTYWx0ZWRfX7a7Rqb3KyLNO
 SyW/uMqTcMFxBQfe6kKFaMu5ASyVwL8i5b7u2EhZ6rkQxZKro0VECQXZA0n/kvz9u8PPznfFDu4
 M2NEloVaK6dfjEylOxU49eljzVxcyA7WfXEejlgErRu27p824uL5AOUgy1/jjJF73Wq9ZpPEC0n
 dqGm1D6sR3UqEXIePp3zGaoefHsaQj+aKdODmLaEoN2ZDUtPKfBNXX0Yt83FZioyXVoYzzCFTpb
 nqKlP9hATF2ZlcwcEypGRSJoa9QvHhN1vfbqdvRHY0V8LdJBGBNsxBfFeDi4W9o+kikjH2jXmPz
 vwFnfW05zjQIwyO1xhhHnVcw4DJpwDlV/4J2lWjii+TYYbAOLVdFhYQfiptBuDsf6Q3IW8nPBK+
 eEJyoQ5NoRnq7nr55143IbPmhhtMlS8iZeKhwXlczZSStav2y3BszdO2ftZd7Rm/af9Kp6Ouo2U
 btoTs/MKviG7Ziyyy9Q==
X-Proofpoint-ORIG-GUID: cOmzkOpVn7_BUtjHshhvVSWuw2W_Bw-C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602010094
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
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91398-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A0A32C5B10
X-Rspamd-Action: no action

The OPP table for the Iris core is wrong, it copies the VDD table from
the downstream kernel, but that table is written for the
video_cc_mvs0_clk_src, while the upstream uses video_cc_mvs0_clk for OPP
rate setting (which is clk_src divided by 3). Specify correct
frequencies in the OPP table.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 531470506809..21a186e199a5 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4350,26 +4350,26 @@ venus: video-codec@aa00000 {
 			venus_opp_table: opp-table {
 				compatible = "operating-points-v2";
 
-				opp-720000000 {
-					opp-hz = /bits/ 64 <720000000>;
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
 					required-opps = <&rpmhpd_opp_low_svs>,
 							<&rpmhpd_opp_low_svs>;
 				};
 
-				opp-1014000000 {
-					opp-hz = /bits/ 64 <1014000000>;
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
 					required-opps = <&rpmhpd_opp_low_svs>,
 							<&rpmhpd_opp_svs>;
 				};
 
-				opp-1098000000 {
-					opp-hz = /bits/ 64 <1098000000>;
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_svs_l1>;
 				};
 
-				opp-1332000000 {
-					opp-hz = /bits/ 64 <1332000000>;
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
 					required-opps = <&rpmhpd_opp_svs>,
 							<&rpmhpd_opp_nom>;
 				};

-- 
2.47.3


