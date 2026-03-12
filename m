Return-Path: <linux-arm-msm+bounces-97245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMvmCMPBsmmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:38:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5E6272BA8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:38:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C4FE6303D0EA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D533C7DE1;
	Thu, 12 Mar 2026 13:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vgzz65OX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MppEJUAz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 941843CEBB6
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773322217; cv=none; b=X2w31kFd4JBt8gOiQwRhgYubiBBuuD6iKsQxS526pWh8EWxvuM8BUZxuK1x/KfPfetSvrjwymCyDKtms0z9J6BiUxw2hzOHeng/tO3Df8ZAInj4sYd/zMy9wN7R2NLqE5cPOJlzl5tsdVGWjkt6R5p+unOQ1DwKFwwkx8z2KNHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773322217; c=relaxed/simple;
	bh=Qu7SCbd08U0FxPNSARkgsOS6vFM+FAyy6vsMyoASvXA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HSy7BYKPlnj6wsPx70pLg214CKEQS9HU7Nre+IA9vq10TjgcnXGnyDMuxZbyEvMODA2a0hzXvCMQbETo3qhc1q0QWFIv8xqJNGw0PkXCddkRsLpBqqfn8MOCtbRi+jJ5bEtSJdwRHpZauvb1RbMxFkI/42futeCh0EPDuecWuqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vgzz65OX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MppEJUAz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62CA0rgs4132496
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4kJnWK+0X3yWbB1kK40cUekEe/em44tg5c3VSKIz4Wo=; b=Vgzz65OX9KYFnj8M
	SWl4zaP6YGD4JgHFyi+ToE2EFY0Y4WCF2ZdlYH26WhN0hBb05ZIvWlIO7QzykSO5
	I8gqaPb9MaPl2lwezKjVwd6C/83TsViCQX+vF9EcVAKiW4RnmWkBxsd16A4fbMyP
	MjTWh8/nRXDBAQccdrUltzsaug3XLomq/hStoaW5ejQ40Q7lGNNmNcZwFBaQn29D
	BwiBjk34oALQQAItvThGe3/Mnbny+oz4KwX+TLyEPpjSPluuD/HFTTyJzlndttia
	RxFH2hYmCbIuK8xZvWaaqqO1HVZ5X22MHuzkmsUzjeWZiIRXAI7Nq4RR1LmkJPw4
	7/5Y3w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w26kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:30:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd85e08fddso1027879785a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773322215; x=1773927015; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4kJnWK+0X3yWbB1kK40cUekEe/em44tg5c3VSKIz4Wo=;
        b=MppEJUAzLlQHMLtTONhgevY/hcZE3Qoag0lSw2fyLuMusgD8+Qfx0AhzFPxYeBIfUW
         Olv6mWBLPEKWV5NHuHIv9sBf2Da180DlL7auD6hNGtdpl2i3iA2/4pxQGNyMKFhLQ+JI
         5TQVzCjV5ufYCK3ABXNdvTobSgVqWs/EuP6zUDoG/btyYT6TWMkHfXKgNsGT8wiLw4TH
         3uGDNjADTy2V6XbaINQYRn+8bcXxcc245tTB5PC7fDwxqqynAPf2N5u5bPI9tq207+3P
         3ExziLCNZuT89C7x0vm6kEG7eax+w5AyHQ6eyDJJxHgaKW8Y6xgZ9//yQF0hdxhmOuS9
         Basg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773322215; x=1773927015;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4kJnWK+0X3yWbB1kK40cUekEe/em44tg5c3VSKIz4Wo=;
        b=l3EnNGEsxOmmhAZDMuhXejefuBsZBJbACplHfzRelQ5dYinlzkkUijrbixRK9++mYN
         ZNLQxApMQ05vOLB83U+5gfEzacdA/QgKIKy4FFcZBw9vIKGIWWMeqwtx/lm7SAUl0PC6
         s4e44b27qKIbnqdjAO/RDnWNtAfGYMZKVeND3rmPjc4nLf756g43QnobUe6s6MAVwZmq
         txBSdgejz7trv4G9lIHDak0nnpo1iV+8NF1QiYlhRDjhrfpVtiXTJelJ4dSDaYyzWXBj
         so2jpfFe1Dx8MEUJit8q4vruFxUL6PLf7xdROxSK3LqRHgoFUfxibB9V1sPJBpdu6Sgh
         P93g==
X-Gm-Message-State: AOJu0Yzg6bS9SADoa9zkrpz0C3zEKujqKynVFMPd+FtPfyNhzICXmi5e
	2E3bZknoPvcteOnxHixtNCJmKT3td3FbD3KmXWIzU0lmmkh7oWKPpZ/0reAnJ3YgLovWp+gSFz7
	IjV0zehE/pksUs9RLfBtcT9N98y1boH1b3oSqq4EdGF4VE7MIaEItd1fkaP4zIj+KCtXa
X-Gm-Gg: ATEYQzxQ4HePSXGDzq8C7QmouY6bJSqzaeuE2kYVxvetPHlmpU4gm8Y5+BlTDOHJkcS
	aZrEuo2eWwiFawRR4uXAEkHRLsEp+vdxYzLhwR/MYz0tVO88+4ucZiRGjRvky59Fy7uZ/K3+CAM
	t1UNXbXG0w0/M1j6pi+ovAlVsF5w/4SOtR9Xqi2W0RV4EjSNilOFfUuSfONLZBHr4oNOmdo2UxM
	uVd53dk66l07LM/OSA1CRmGGUe666S4Tu3kyRmJVb0BE4QCvcBrqzZZAAkdJ0OFiMm/WQokjlDR
	ZDcJXLl6apPu+pE5xgBc91ZR/em8K0qqLPE+memvc9JpPe6S2z2rV+oNNS2gYDmrTtU4SshmM7V
	Nd/qyw2tofusQsz3cp4XXNSzbTO+otShq5W1AuI6p7M2hhXPqCd+AtAHNmWIxwPAjDPd38/b3Sw
	Ly9RehWAxej5Vs0c1Zv8tNJTojxq/6x603K4Y=
X-Received: by 2002:a05:620a:7112:b0:8cd:96e5:f7c8 with SMTP id af79cd13be357-8cda1a559cdmr766514685a.57.1773322214096;
        Thu, 12 Mar 2026 06:30:14 -0700 (PDT)
X-Received: by 2002:a05:620a:7112:b0:8cd:96e5:f7c8 with SMTP id af79cd13be357-8cda1a559cdmr766502585a.57.1773322213412;
        Thu, 12 Mar 2026 06:30:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38a67d617e1sm8646671fa.9.2026.03.12.06.30.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:30:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 12 Mar 2026 15:29:46 +0200
Subject: [PATCH v3 25/27] soc: qcom: ubwc: use fixed values for UBWC
 swizzle for UBWC < 4.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-ubwc-rework-v3-25-b7e8f800176a@oss.qualcomm.com>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
In-Reply-To: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6082;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qu7SCbd08U0FxPNSARkgsOS6vFM+FAyy6vsMyoASvXA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpsr+4mKKhz4P253cyaZOGYWl46uL+Qn4OOtS8h
 lh2uw5D9NeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCabK/uAAKCRCLPIo+Aiko
 1RWRCACJ7gDjMdRfrJBykdoGT9vzRU982M9SLzPBR1PaPDZ0Jnn7Aoriafu7jdgUdgUPCD+XK3n
 XO5EdIDxSWiSGKwhTa/AawvYsjEAmAI/9ec7TOlTxOw4ODf/i/Ooh45lRmhGvCbQFJAbVb0XfLs
 2mY2+s1c0N2SdFzQ5CzpsvjpnZu4EM/sMjKFtBoyzm7rcmffl2pceUMts4eDJyc/ab9ajJxO0Vq
 IgSsYPspLbX8RETu2YtsvzPJAm3OT2SwKvEtTxiovg6xi5CsB+2QdZyi9ijTGH6LNW96Bas3KQi
 4BSkPXWJT31aI4PkObeGcM0q+3QEQQLbUQju9fzJAwCEik7Q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 4ZGusm7HaBMcgGjSuIaWxJkAWZzIjt3S
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b2bfe7 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=8a_ODPMxA7UucN5sxwIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 4ZGusm7HaBMcgGjSuIaWxJkAWZzIjt3S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNyBTYWx0ZWRfX0rSBEdRO16zC
 Lf6hdvcpvQ6/Rmktq0xYLnO4lmFEn1U7D2cE35S59OvhbzCAawIb/8z9b2J55x5XMVD2V7B/pHz
 X9fZ4nC01FRCExHDtxGdzS7CiwmPEx01cJv7+pcczdbJKz/rYzfT+WCDmnuO9372W11RfpYm5NF
 sOP57eZ+dm37BaSsmTtgqY21zgSQnBo9NypZE3p0ao5EX1fXYyipDmCzN6Km4KEHVk51yqZB9r0
 /preE19tavTUVK6Z7EpNzjfWEr3jj8ajJ71iltVs/SE7wk27DKJ/LKnYjwQlzNs0lCj+6hC5eH7
 6Z4a2TX1gWsipkuZ3wXt3UeW8s4ZuYSbiGa+7I7toei1VN07Sww2vyuW10Xk1kSjVdJKWGyas8P
 Ligi0oYusIW+NsNLA/0Y9mwf5UxCMz8hUdnsCpXGSy4G+sqllLhyLOPBAtLJsa7OpSUrXRLyqOy
 lz7DD1Goj4VWu6RZfrQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120107
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97245-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4B5E6272BA8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

UBWC devices before 4.0 use standard UBWC swizzle levels. As all the
drivers now use the qcom_ubwc_swizzle() helper, move those values to the
helper, leaving UBWC 4.0+ intact for now.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/ubwc_config.c | 34 ----------------------------------
 include/linux/soc/qcom/ubwc.h  | 33 ++++++++++++++++++++++++---------
 2 files changed, 24 insertions(+), 43 deletions(-)

diff --git a/drivers/soc/qcom/ubwc_config.c b/drivers/soc/qcom/ubwc_config.c
index 51de36f5f40b..49edfabb5e18 100644
--- a/drivers/soc/qcom/ubwc_config.c
+++ b/drivers/soc/qcom/ubwc_config.c
@@ -25,17 +25,11 @@ static const struct qcom_ubwc_cfg_data kaanapali_data = {
 
 static const struct qcom_ubwc_cfg_data msm8937_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data msm8998_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 
@@ -52,94 +46,66 @@ static const struct qcom_ubwc_cfg_data sa8775p_data = {
 
 static const struct qcom_ubwc_cfg_data sar2130p_data = {
 	.ubwc_enc_version = UBWC_3_1,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 13,
 };
 
 static const struct qcom_ubwc_cfg_data sc7180_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sc7280_data = {
 	.ubwc_enc_version = UBWC_3_1,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sc8180x_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sc8280xp_data = {
 	.ubwc_enc_version = UBWC_4_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 16,
 };
 
 static const struct qcom_ubwc_cfg_data sdm670_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sdm845_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 
 static const struct qcom_ubwc_cfg_data sm6115_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm6125_data = {
 	.ubwc_enc_version = UBWC_1_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL1 |
-			UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm6150_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm6350_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm7150_data = {
 	.ubwc_enc_version = UBWC_2_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 14,
 };
 
 static const struct qcom_ubwc_cfg_data sm8150_data = {
 	.ubwc_enc_version = UBWC_3_0,
-	.ubwc_swizzle = UBWC_SWIZZLE_ENABLE_LVL2 |
-			UBWC_SWIZZLE_ENABLE_LVL3,
 	.highest_bank_bit = 15,
 };
 
diff --git a/include/linux/soc/qcom/ubwc.h b/include/linux/soc/qcom/ubwc.h
index fee778360ac2..7c9506741001 100644
--- a/include/linux/soc/qcom/ubwc.h
+++ b/include/linux/soc/qcom/ubwc.h
@@ -22,9 +22,6 @@ struct qcom_ubwc_cfg_data {
 	 * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
 	 */
 	u32 ubwc_swizzle;
-#define UBWC_SWIZZLE_ENABLE_LVL1	BIT(0)
-#define UBWC_SWIZZLE_ENABLE_LVL2	BIT(1)
-#define UBWC_SWIZZLE_ENABLE_LVL3	BIT(2)
 
 	/**
 	 * @highest_bank_bit: Highest Bank Bit
@@ -55,12 +52,7 @@ static inline const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
 
 static inline bool qcom_ubwc_get_ubwc_mode(const struct qcom_ubwc_cfg_data *cfg)
 {
-	bool ret = cfg->ubwc_enc_version == UBWC_1_0;
-
-	if (ret && !(cfg->ubwc_swizzle & UBWC_SWIZZLE_ENABLE_LVL1))
-		pr_err("UBWC config discrepancy - level 1 swizzling disabled on UBWC 1.0\n");
-
-	return ret;
+	return cfg->ubwc_enc_version == UBWC_1_0;
 }
 
 static inline bool qcom_ubwc_min_acc_length_64b(const struct qcom_ubwc_cfg_data *cfg)
@@ -85,8 +77,31 @@ static inline bool qcom_ubwc_bank_spread(const struct qcom_ubwc_cfg_data *cfg)
 	return true;
 }
 
+#define UBWC_SWIZZLE_ENABLE_LVL1	BIT(0)
+#define UBWC_SWIZZLE_ENABLE_LVL2	BIT(1)
+#define UBWC_SWIZZLE_ENABLE_LVL3	BIT(2)
+
+/**
+ * @qcom_ubwc_swizzle: Whether to enable level 1, 2 & 3 bank swizzling.
+ *
+ * UBWC 1.0 always enables all three levels.
+ * UBWC 2.0 removes level 1 bank swizzling, leaving levels 2 & 3.
+ * UBWC 4.0 adds the optional ability to disable levels 2 & 3.
+ */
 static inline u32 qcom_ubwc_swizzle(const struct qcom_ubwc_cfg_data *cfg)
 {
+	if (cfg->ubwc_enc_version == 0)
+		return 0;
+
+	if (cfg->ubwc_enc_version == UBWC_1_0)
+		return UBWC_SWIZZLE_ENABLE_LVL1 |
+		       UBWC_SWIZZLE_ENABLE_LVL2 |
+		       UBWC_SWIZZLE_ENABLE_LVL3;
+
+	if (cfg->ubwc_enc_version < UBWC_4_0)
+		return UBWC_SWIZZLE_ENABLE_LVL2 |
+		       UBWC_SWIZZLE_ENABLE_LVL3;
+
 	return cfg->ubwc_swizzle;
 }
 

-- 
2.47.3


