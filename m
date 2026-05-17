Return-Path: <linux-arm-msm+bounces-108042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLs2AMrXCWossQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108042-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 16:59:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 46604561CF1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 16:59:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 47D513038C50
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 14:56:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A5E83BB68B;
	Sun, 17 May 2026 14:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S75Drj6x";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L55UPUv4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8351F38F927
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779029795; cv=none; b=qyRefIn7tdXff7LTHwPd+RH6KDn8SiMPMpwJGqXq0vO98GdP8J7JYf3Gu4TFrnSdwmhD9D/ZuREwI9C3AyYRiik3sBEC6gNPBd65ebTPpF0p6RMEzPJ36PC1ndxIvC2pmLMirf+IOB8x3UkptvMoIQmYgEO4egwGFHZUg97uNKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779029795; c=relaxed/simple;
	bh=PZvjo6kwb8gukBk8Qt21liCK6ZiRRKVnfKpO5rJeB5w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qpomHB8OB/VXh4ICASrsNFOSu+cHDbOH3pNKmBM95nLsJqP/BKuW2lvAP7NNffi50FIQCNC+WwcVAOxz/39gHfN54pHQWdVKdoFvNdYcy8D4GgrCFvKGfQcxv6G7DoGs4+qejHR9nMEqmvLX7plgG45hysFR3QAg9nUFJtySneE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S75Drj6x; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L55UPUv4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64HEkvn12419841
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ocqDJuL+p2EGTcf7fuS/tX8QNWqZgAnaSZICCzZ6PM=; b=S75Drj6xexpstJmg
	Tm5bUI9BKV4Jt1598TqECzX68D+yuByVIfWYmhf4C7Ab16N1Sb4hec4/PquXSsRh
	41ZzdKK7HIHheVvvCA2Vpx2ZqmoWqyUqxZk5rwCeSo9jBx3IyYqUlqhOYCWnP8R0
	QTSKQg/Zg00811xwZ3Tu3BCBPHW7+3TbLXJuF9vqo+bRL8MoRbod1uWelwxWrrKT
	f7SQiakF7LGC7L7X9uK1hGxpJ5eNR23mcI3QSR8Z1ZQJEdK9xFkh7uLxV0XluZYh
	FzWhl+bFhasx4Rjfrb0wSUIQkLvWo1BVPT/55+vqOeixWewg8r3cHq23yaS6+67z
	hk8BPg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gwmb21c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 14:56:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-515224a8aa0so72841731cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 07:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779029790; x=1779634590; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ocqDJuL+p2EGTcf7fuS/tX8QNWqZgAnaSZICCzZ6PM=;
        b=L55UPUv4l2VVyk1MsbUE/DgwbFN84y6PBov5bwA9/FBNTD88dtBfGM9mLFLcVk2C5O
         nx05hUZ1Bocz2OslX/z5JuxdKsSNxuWGXybzsZB1r5uTxnvqjrYhwOvUUol1npnBV2nr
         D2eQ5qNSLyqOV3xpae1T0Z1bcWDBnMi1aqg1deGf42UFJnC/RwxSukF48CIzQtHHKQab
         SZq80Ct48hEA0HZk9A2JIOGJkmUvxAKWbNi+A1qCi5/8O3kIvY5sOFChF5XyPWuh9LnW
         DfERqIbAOUSsWLY0opFyu3rlLLf4erX8NBYNZns3iAYOUBUzkN/zekAMyq+QjIiVy/NP
         QM9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779029790; x=1779634590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9ocqDJuL+p2EGTcf7fuS/tX8QNWqZgAnaSZICCzZ6PM=;
        b=fIiz6IBfX4qquAi+N47kdlKIkv2isqZ1OPDfbVZY/Yxiji9mCQcTM9k7BuS3TIKwgT
         iX0Fen3C5bKMvIYX4EdjxStNoN6BtuoLnC/YUOcnJtoMj9hIYcpKgJCb0N3CAR9mYJU0
         H/KbtLAPiSNJWeq9szQUHty9YTBsCOoP0k73jpaxOzi1qRgdTrVhGRZBkAOC1+arjUWn
         +C7lwn4Q0dii9QXXKGqgaEZGqWIfY0Sbvba/UNFFpMvCg0XYvQcgxjaUt97LMLy8NV0w
         OQav3eFaxhapfNnqRRxmHU43ZJNvTvZDKd8uy2L2ICMEBugiN030umdQ3iuLnrIcr4ut
         o2Vg==
X-Gm-Message-State: AOJu0YwskQn8J/cqIfr8HnYyCjbZ0obo4UK0213GLuZ+TPozWnwge0kq
	jdTyqsEu4COt/G0zDqObVtya0NMWS/BD3wFy6J0Pn2RiQigedSkcbY0kZzj3DWRB/XML5b16LgJ
	5oEO+MNvjTMAs2GkdBUb55XNp/ikvMlgA3JS3aHLL44SC/xfqY6rSHzcyH2YlYU4LnI0F
X-Gm-Gg: Acq92OEStLFp7CYcpzUxjHmj1XWn3m6jdrjLE7XKn4uwWk+x+uEgPR/BEcBDUHwi4oI
	khqrdbqN/NCbZ2u8dMIKiq947eAHXn92yughScP41n7HYy41VvOeMmnfC6LotsFQ5BSU2IfWVL7
	CnRvvXd/HS5P4I+4DOffEhjlV/gUfPw3Kl2E4M2Gh+ZqHveIGzC0jzM7SawVUE5xyB1szcisfjl
	lR5pAeznnkzuU/6uOqwU2Ehb2QQI5+1wYlhpIgB5Qd17idIK9MqY1oxMMiabjBBwewzpoc9pw/j
	Fdjk03857AZE33hWQzOFBKRSM7JnpaWFavVNa5B4OSJ16n1GukuW0DRfN/7oJpi24JzmpLsje7U
	TSEk0ezC1sF1gghcb9QVR+aQD9TXuau4nGhQ7wF4HOxArV/5Y5wcTPnDe91QSn8fRqhsgZ66xAM
	pfK0mGySK6GScnWIeMSjZfBjyItP14QHjFeFQ=
X-Received: by 2002:a05:622a:590c:b0:509:1dc8:e9e5 with SMTP id d75a77b69052e-5165a0a179emr159536291cf.34.1779029789900;
        Sun, 17 May 2026 07:56:29 -0700 (PDT)
X-Received: by 2002:a05:622a:590c:b0:509:1dc8:e9e5 with SMTP id d75a77b69052e-5165a0a179emr159536011cf.34.1779029789499;
        Sun, 17 May 2026 07:56:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f118991sm2733339e87.18.2026.05.17.07.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 07:56:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 17 May 2026 17:56:12 +0300
Subject: [PATCH 6/7] arm64: dts: qcom: kodiak: consolidate IPA properties
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260517-ipa-loader-v1-6-3c3764c1b4a3@oss.qualcomm.com>
References: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
In-Reply-To: <20260517-ipa-loader-v1-0-3c3764c1b4a3@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Alex Elder <elder@riscstar.com>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Stanislav Zaikin <zstaseg@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6139;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PZvjo6kwb8gukBk8Qt21liCK6ZiRRKVnfKpO5rJeB5w=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqCdcNv0T9O+xRyoLUOsK7njhtDIDpXsz1i0soG
 a7A3aF5SgCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagnXDQAKCRCLPIo+Aiko
 1UbcB/9NuxRti02NbAp7yN5y1+Gya+DxpKEDW9I5GT/IGzuRrx210uW/3H+9jyCnJFTbCfQVQbe
 hwe1G9Fq3idAetBx81wolplcr8baJDs3+vLa2yGBgXTVGQcyxVWujxoq3ub5c+ueskgF23vOjbJ
 VRLbn2QF15ae947wvhvbSvnkneDISHphn/vamiTVvWv5BaLd1vr0BgrVlzLDdrYZD86Q7T2J0Ng
 3gKPT372cr1eO5MYcv7d+/5e+e1ZpHKx4IwuLOIhzXsNs3ZybW+xEcfwf9HgPjb+ZdyaV/2/fqC
 217o7B9iANsDhFP/8P8iaH5d8qtu/3NKDH9DlCphmCHhw+Ah
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: rNhJB76g169w-sC9cJyzp4oBqouAPS2w
X-Proofpoint-GUID: rNhJB76g169w-sC9cJyzp4oBqouAPS2w
X-Authority-Analysis: v=2.4 cv=W/AIkxWk c=1 sm=1 tr=0 ts=6a09d71e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=Af2afE4DUFKw3H6MaKMA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2MCBTYWx0ZWRfXxRqa8dLffCRJ
 lG+p3oxZNDXOPslr93tnNR2qLcg8C/1OYLn7Zcujqls7sOets8U8Z1q0nr5gmgI+6GQRmlZhOL/
 B0zVnjGOOVxZoFNBMe5POfNIbN7byZIXJYb43U3BMJ/KTKazgTPRR5ws01UqPaRYOfCzgz9crCc
 I0p2vgvibuRCkhv+X1guyyw/QdADDC8Zy1ADq4NagORvVf3AjeEo8bcpK/oE+36gMt/OhHDE/eD
 /yXFcikqnEkmRs7BgeKC/wdK7uT+Ia84tRd7CYV8EhyCvKSgHLdxUCPgVPJmftKs2DVOi7f/8XV
 LuBoN74+B+wIfltOGcp0wScwV9oh9/xBh4xJwBxS+GAyaFoo0AdX1gAr95z1Fia8b/dN1U5xDpj
 +SPCosLmyRZ1NHlzxi3mxqhRJCSNWim436/f3KgcFLuQB0u+LfNBjLo2u/xHRcYCcyRUwTi3kos
 c+V+8Uc7tR7niBe0gvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170160
X-Rspamd-Queue-Id: 46604561CF1
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
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108042-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Move generic IPA-related properties to the base DTSI file. The herobrine
has special software configuration, so delete the memory-region property
which wasn't set for it beforehand. Also delete the property for several
IoT devices, which don't enable IPA memory at this point (and don't
seem to have IPA supported by the modem firmware).

Co-developed-by: Stanislav Zaikin <zstaseg@gmail.com>
Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi                          | 3 +++
 arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts            | 3 +--
 arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts         | 2 --
 arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts              | 3 +--
 arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts         | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts | 4 ++++
 arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts     | 4 ++++
 arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi        | 2 ++
 arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts            | 3 ---
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts          | 2 --
 10 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index c51beada8c7d..51a0ca3bbe6b 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -2642,6 +2642,9 @@ ipa: ipa@1e40000 {
 			qcom,smem-state-names = "ipa-clock-enabled-valid",
 						"ipa-clock-enabled";
 
+			qcom,gsi-loader = "self";
+			memory-region = <&ipa_fw_mem>;
+
 			sram = <&ipa_modem_tables>;
 
 			status = "disabled";
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
index 04cb9230d29f..aa7c525237b9 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dts
@@ -913,9 +913,8 @@ &i2c9 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/qcm6490/fairphone5/ipa_fws.mbn";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
index bf18c4852081..fef9fb51642d 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-particle-tachyon.dts
@@ -501,8 +501,6 @@ &i2c1 {
 
 &ipa {
 	firmware-name = "qcom/qcm6490/particle/tachyon/ipa_fws.mbn";
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
index 797f37596bf1..1398a4dfb037 100644
--- a/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
+++ b/arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts
@@ -553,9 +553,8 @@ &i2c13 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/qcm6490/SHIFT/otter/ipa_fws.mbn";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
index bb5a42b038f1..6c1a73f18ec1 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
@@ -504,6 +504,10 @@ &i2c13 {
 	status = "okay";
 };
 
+&ipa {
+	/delete-property/ memory-region;
+};
+
 &lpass_audiocc {
 	compatible = "qcom,qcm6490-lpassaudiocc";
 	/delete-property/ power-domains;
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
index a5ad796cb65d..7de63ee37a84 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-minipc-g1iot.dts
@@ -653,6 +653,10 @@ redriver_usb_con_sbu: endpoint {
 	};
 };
 
+&ipa {
+	/delete-property/ memory-region;
+};
+
 &mdss {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
index f47efca42d48..e701cc39210f 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-thundercomm-rubikpi3.dts
@@ -774,6 +774,10 @@ lt9611_out: endpoint {
 	};
 };
 
+&ipa {
+	/delete-property/ memory-region;
+};
+
 &lpass_audiocc {
 	compatible = "qcom,qcm6490-lpassaudiocc";
 	/delete-property/ power-domains;
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
index b721a8546800..ac89724ee099 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-lte-sku.dtsi
@@ -22,7 +22,9 @@ mdata_mem: mpss-metadata {
 };
 
 &ipa {
+	/delete-property/ memory-region;
 	qcom,gsi-loader = "modem";
+
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
index 3c836e196b19..d94571c05a59 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-motorola-dubai.dts
@@ -727,9 +727,6 @@ fsa4480_sbu_mux: endpoint {
 
 &ipa {
 	firmware-name = "qcom/sm7325/motorola/dubai/yupik_ipa_fws.mbn";
-	memory-region = <&ipa_fw_mem>;
-
-	qcom,gsi-loader = "self";
 
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
index cb59c122f6f6..7db9ae1c3cef 100644
--- a/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
+++ b/arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts
@@ -971,8 +971,6 @@ nfc@28 {
 };
 
 &ipa {
-	qcom,gsi-loader = "self";
-	memory-region = <&ipa_fw_mem>;
 	firmware-name = "qcom/sm7325/nothing/spacewar/ipa_fws.mbn";
 
 	status = "okay";

-- 
2.47.3


