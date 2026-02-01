Return-Path: <linux-arm-msm+bounces-91397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ICXrFZAwf2k8lQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91397-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Feb 2026 11:53:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7CDC5ACD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 01 Feb 2026 11:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 78F453038A6B
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Feb 2026 10:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCA5632C92A;
	Sun,  1 Feb 2026 10:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MyUaV3BQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Swdk4oo+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C16F33469C
	for <linux-arm-msm@vger.kernel.org>; Sun,  1 Feb 2026 10:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769942966; cv=none; b=KOmxR8K5WQvZy4Knj0YMPbFQfZ/+3B1HCFy/In1gdZ1jVdsQjtJyxcydG1GHOTb1H21VeR56wZ3b+SvBfG5I8hDhe5CVd39qlUX/7PuJdRa7mmHGF7Oime2nTOJiC0hvvMqcvEmEjSYBOeDnHc+jlmkFGYPdevkKTSxl6C+bRjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769942966; c=relaxed/simple;
	bh=MDNd56HziQpfdDNbX3xousM3G0a+/+wP6bT6aYLLnm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XexXpuGDrsM+QutSlHun6WRpPRwYzoP82LShCIM70Li97CtqhLu4tcF0Xnbw4ulvXcOC8aJ57/B91k9ioDbWP/3/d+xao8+rK01fxIZrtuW+6uGCTLbETCtZndbJRdQyytaMgzCTAwrBZiSmAjxBRtWKEWkdIihTh6bT1N9FAvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MyUaV3BQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Swdk4oo+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 611ATP0c4037630
	for <linux-arm-msm@vger.kernel.org>; Sun, 1 Feb 2026 10:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WwvFGoypMjbFfcuK0I6naYkVDqDhMxNZNLoSz66wsVs=; b=MyUaV3BQzLtTkM7n
	2dSuZR2L2XxT0GmrDsXbYtEZyz7LQHNXhp70Derze70zjY7Zjp2BL3aj1fdnJEDR
	fhwoDV+ZIJO6IKda7Qm+32TCsC02wDWZdTwCtCIxKVt+Jb1Z7ZFWrgvE/xhUzuoS
	5yU9W9KmmgH1CVl1AHRZOHV551LOOw9ORu3d3YbQHxY8rXmYw5whISxWRJailz6l
	rZgpuRwh+xZN9ouFqmJwairH32DKJqQRj2dKt2N0/fZYd8pgan4G6KZeawPVpBYF
	R9vcbEewDu7gVno3klGbkuSxR6Qi55VmLZhk0HvrNCGnEVts6C3P2BUa7vqwKzdp
	R5zxxw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arrte7w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 10:49:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5032e68560dso24116701cf.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 01 Feb 2026 02:49:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769942963; x=1770547763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WwvFGoypMjbFfcuK0I6naYkVDqDhMxNZNLoSz66wsVs=;
        b=Swdk4oo+qIqAIe2IFT7zguU3enQWUOUnlRsQorZhrhLs99VFPA1Oxi6o7KbTL87Zvn
         jC7CpAiVKFEIm74hBO8Bx3y6oh3RnKtu2XPA/lQ5oBE6fIRxsJNORTmgGAPpixjP0gK6
         4IIfAYc3WeCcgtFpgtlbmf3tWm6JPDxyNtaCgavWclCHfpQdPhC8HqEGHLcTMGLYMAuQ
         UKoYB8OLvo3fXvsR07LiELt4Y+znBIxKzyszWcMSrZ/OyLhLH2ujYgQGDB4JQ3kZgTXf
         7faWveCmDG0YZ7IWLju+f9pwx1ZPSSRqrjncx0vwqjYh2im8pIIZigKlIdqMXcaFEyZs
         YQyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769942963; x=1770547763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WwvFGoypMjbFfcuK0I6naYkVDqDhMxNZNLoSz66wsVs=;
        b=rzmGbtcl+Am5oqyXsXdnf4qZvZPIxhAfTJ/fheXoC6G6lpogs4tsIIHO6cEN4ZqRnQ
         /CLpJ7mrCNi8jzkXoHri0k69jykM3eQHUx4wfc1eH9SuUrIJLWBL8pMxaUDQMhqvPumO
         dJ1mmyafWv0fXfc3MClZs8sX0k7PfldMG09CUqRv0NL88564EZzZRCiCRvAEclle32Aq
         y9ClD/gVzyOZFvsdDcC2onHv5ZPbp3aID1KlINf9ipaNwRAKdbe3oD6jpZou21RJIYp7
         vhzfdZet7L5PCRudqAwmHNN1/6TADa0YueNGmuGh6zQNdhSAgLkeFVgwqnqwpRDqfqHF
         GizQ==
X-Gm-Message-State: AOJu0YwO6aw2mNQZfm9bU35HcGgf+fOd73TZS7/adVSqaslRNQ8uvjEM
	d07/GOgrhb9GQ48P+BNGjed1t1Xs+ZL5S8LGo6IW6Oouv6hT6pI1CWwdkK/4DY1ZAwAj7FKY4pn
	1T47WhVW2P/lKQuGlF9tBj2htWbo2Ccf2GTl7/NQ7BSWUJngLfWqAK9M5MmOdigg6C/MR
X-Gm-Gg: AZuq6aIbHoYPBB+2p4sWLOiwkEtG2TXCfGdH3JEU8I3as37nljdgDDfBd0Pq/I4TxEY
	Z8FnEaZqElMJefaIZQ1kcUfhLxxRhq8huZEIraS3u2gbremYkYwMIcMSzFyPsSQsZ8H3fnWIr2W
	axn577fEXoN4Le+7MxVqO4vYW9VcEUipw6Cc9+zQfCNWJ3SfwJ5INmSB9+ikcFdqiWsp6amyRVx
	eDjZpir9ThMHSbn1Iw9LLtJ1yrrYlNlMCv17+m1NYyWJFb+Fpp+lU4TE3bBGG5uB1Cqca2BFNvj
	Qsz2pPbwDSDIzK5BhOEaQMWUc6saePv9y8TRprpxJDiTVCMTJe1FOho0PkoocV+an89OHkYxU3g
	jnfSbJ5kj0nJVCxmfqSxYZaedrTaNPjTj05WLiH8KtQZeiyhacomKYzgoFocb3eezJOv1QapYYF
	3C6A5bg3vP08ZxgumPOrhjHLY=
X-Received: by 2002:ac8:5986:0:b0:503:426a:1474 with SMTP id d75a77b69052e-505d22a4b09mr124111791cf.57.1769942962648;
        Sun, 01 Feb 2026 02:49:22 -0800 (PST)
X-Received: by 2002:ac8:5986:0:b0:503:426a:1474 with SMTP id d75a77b69052e-505d22a4b09mr124111501cf.57.1769942961922;
        Sun, 01 Feb 2026 02:49:21 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e074b7a8csm2835006e87.77.2026.02.01.02.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 02:49:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 01 Feb 2026 12:49:04 +0200
Subject: [PATCH v2 7/8] arm64: dts: qcom: sort out Iris power domains
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260201-iris-venus-fix-sm8250-v2-7-6f40d2605c89@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2223;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MDNd56HziQpfdDNbX3xousM3G0a+/+wP6bT6aYLLnm0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpfy+m2PNrDaIL5kZI33VRgtQpqzQPtqYo9YLlw
 fJrNcYK8FWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaX8vpgAKCRCLPIo+Aiko
 1XhkB/4sApbQ0av7LltP/Y6E56Qa0P3c8HLuU+iocBfixerEmdaVhEusANHe9a/WsO7vdkI5VXJ
 5uABplv8qW68f7qCIlsaZ1UJ3OFzOTGC7XfYJIO+dGhjTBJrsGl/8ikz6mPFEEJnZds1r+c78/T
 f+q3xRcngKc3IFASXibji8q+CQmCN9ipzbUsZHbeCBmNqpjal5WaQ8oUwGeiovJtAyK6fg1R2nC
 wZG5BVXfV80az0z02q1vZ2UJAEeefjUO5juJqQRaWdnbA5tU0znmzMwcoxlKjgAxElAb5XaZR1e
 LDMaaTGKQyE006ffgW55WRtF03jE/yL2VsMRN/zkGMyf3LH3
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: uaf22cB4h6paj9sVPYkxUq4sV1au3SON
X-Authority-Analysis: v=2.4 cv=FNYWBuos c=1 sm=1 tr=0 ts=697f2fb3 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tBOqMctlXquWO7Kigf0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAxMDA5NCBTYWx0ZWRfX22LuwKTTNjj1
 rT8fVCZBF3Pt7rNHncwNfyNK/mnY7q/TtloaBl/Runofj5jernT8LqYeqLKvIwcAsf6imGRj+FZ
 W7fClRO+3xb3Rgs7yPWAPlbV/OH0V4nUkFOhEWyvC+5evrA5Z4FxRvdtWRSmxFVJD+gg6ZSP4o9
 HI0tB1XnzABFSyv1Pvt0eW4BoqA1zBAF27IhPLSeFcQHlShIMnO4vHWrZtVYv1t1/oNiHdt1+R7
 DWw/tLfGQ9f2AJz7CqRZpW9SfGeWgjOU4iiXqie/Im1qLUIW28tajrdYbsh2ZsA+MTq57+08RvM
 Bkcyork4GHJCcE7BCWdfnys2f6RaT1GyXSWA+LgOb+lfBHbVT5/9IrWyoQfyjZVQZFZ4qJWX5pS
 RziJAUrj06vsKTA7tzt7As7snMx/6sU4cQRSsNrnGh25KhDP/p3AYPl3McvPTCcNNpOzHesnq2J
 9ORvU8c1TucXjGRqGwQ==
X-Proofpoint-GUID: uaf22cB4h6paj9sVPYkxUq4sV1au3SON
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-01_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602010094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91397-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CB7CDC5ACD
X-Rspamd-Action: no action

On SM8250 Iris core requires two power rails to function, MX (for PLLs)
and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
qcom: sm8250: Add venus DT node") added only MX power rail, but,
strangely enough, using MMCX voltage levels.

Add MMCX domain together with the (more correct) MX OPP levels.

Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 980d6e894b9d..531470506809 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -4321,8 +4321,12 @@ venus: video-codec@aa00000 {
 			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
 			power-domains = <&videocc MVS0C_GDSC>,
 					<&videocc MVS0_GDSC>,
-					<&rpmhpd RPMHPD_MX>;
-			power-domain-names = "venus", "vcodec0", "mx";
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
 			operating-points-v2 = <&venus_opp_table>;
 
 			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
@@ -4348,22 +4352,26 @@ venus_opp_table: opp-table {
 
 				opp-720000000 {
 					opp-hz = /bits/ 64 <720000000>;
-					required-opps = <&rpmhpd_opp_low_svs>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_low_svs>;
 				};
 
 				opp-1014000000 {
 					opp-hz = /bits/ 64 <1014000000>;
-					required-opps = <&rpmhpd_opp_svs>;
+					required-opps = <&rpmhpd_opp_low_svs>,
+							<&rpmhpd_opp_svs>;
 				};
 
 				opp-1098000000 {
 					opp-hz = /bits/ 64 <1098000000>;
-					required-opps = <&rpmhpd_opp_svs_l1>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs_l1>;
 				};
 
 				opp-1332000000 {
 					opp-hz = /bits/ 64 <1332000000>;
-					required-opps = <&rpmhpd_opp_nom>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_nom>;
 				};
 			};
 		};

-- 
2.47.3


