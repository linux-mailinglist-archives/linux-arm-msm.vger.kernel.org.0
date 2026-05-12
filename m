Return-Path: <linux-arm-msm+bounces-107102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SB4KEm8oA2qw1AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107102-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 15:17:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E1457520F6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 15:17:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BF4883041F0B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 13:16:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0CF113A05C0;
	Tue, 12 May 2026 13:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lVGrs6O4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ffwz6iqR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AD139E9BF
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778591393; cv=none; b=itxG36UmOHFavTRP9qpDLLh/8jJtMbppbCI+y88D7o/PYAj76VV4sBtMToLk5toLOZkGxGCBL+u4W8L0Fa6JxlRxPb2YCbRAAZDjR5qHoU7+bcN3IxS0jHay/dqau1dBpPkVf/ptOzFDLrC2W2Hi53n8JHMPIzX1vZXe81cAk9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778591393; c=relaxed/simple;
	bh=isfBhfEp6QevbEHukDTBoydJGn4P48zEXe+HfbEpA30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AT8w9UYr4xBkZIy39tXT7j6QtuTQY8Wwf5Qu86UEXKKxJ/ta21PSi02hhfFWF2tFchWOJWVabWJM9Ajyv1z5lFQ2qshC51rb50D6tFsdwtJVIcUxmJ0dVzEzoqcO9gp/MfGUrSLw0FJva0qLlP97VUbl25RBbBbrUie5dlwHtFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVGrs6O4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ffwz6iqR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CC4QkG3320952
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KegRFBGT1pBt1ApHiSqwgKsmJTlvvqZbW7UqK2j89mc=; b=lVGrs6O4rdM4yME8
	B6CpdE7cQP0Qdyc6Hs03HXCdPYouaAkK2PZqDsMY4B3qmzVkiLEj11zHbpGSf/cO
	t96uM/48YxP/mSNzL1mipRwLySLzUl7NUC4yt25uSFf8HuAc4U+NvQb+XDPeC8tS
	5bZt6W2q/V++QmGjyF2i3V8/j0hs5V0F62JNICW8UJchZtC0o86CSeVqvrgLDsRs
	0l1D6IxvN8CC3vrkLwRof7n6q5eofuNJKqk4qX9jLnwVc6XsLQcn58CRqwVPeOdG
	4OZX6MBLA2l1NvQtNgcj78mkwImmyA7uJ7z9QwsTww+MDEaHAQvUiqlPtsGO9bXY
	0QDY2Q==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43w1r6nf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:09:51 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7dce437f1a1so12143906a34.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 06:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778591391; x=1779196191; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KegRFBGT1pBt1ApHiSqwgKsmJTlvvqZbW7UqK2j89mc=;
        b=Ffwz6iqRUYwHyG6bs78QT/sU2tlDQ8F6QzOOuJ1Xp8aQJMV1MofIhhODgOBA1/+oxS
         i/YwvwJ9SnHAC+SFcWGn74PraSc4TpG4NdKYKRyEVPQ54YRWKdOGThd0+dbELL7GHZsO
         eVYDOWbXoul9FrAcYEdmZ07wzfabVgXFIyiJE6rgOl7gjJlRbhZzEhJHNo+I5IyznvUj
         Uu4M3e4NhrQSzLT1w2KYmRlmPBiDQVNtg5wEv95be8Nr5h4ZPF9KgFEWHSqFxXl8jaKn
         c8O9H9PEFnn69+xk7T44+YNR06ZZZXbBzaleEipPU2Uxl+dxdvEcACsSv7c0BKlQ/09U
         5A9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778591391; x=1779196191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KegRFBGT1pBt1ApHiSqwgKsmJTlvvqZbW7UqK2j89mc=;
        b=YvjTicYPTGXOChvQCZqt3mqdA4v0cJFZWiTPc4q113nbH1JQ5yNrGZh4qjF2MEe5+b
         +AzxD2JBnzJElrE+5dIHybov3aQHiHfeWlHY6/G2Nk7MxfjJwKf6f76D/OOiyd69SIYI
         4psMcgONwniuoE1AwiFAu+iytX2xXp3ZjkOw0BPobb/fxCpxPEvj5vfTvXu2ePQCXs3L
         1mzlDk1+gSuHsMTC85ElwUcSBDqNrzd6ozfM3efByzgWcjTrr+gkTw/DBVr5QROzDFy/
         gwC11u/+sMn0y0DzcjhL28gqlriOWOANNjwjhPAvnh6Fg2Rm7gaoLRrrzqchn9H8UV1z
         6ZQw==
X-Forwarded-Encrypted: i=1; AFNElJ+a4SImGqbPRBT/8cLODYlnT/3Pt7ZG+H7aCwOVxT76lELMG1G98rXbo8OFOCTIF1VGFeb1SdaE2mG1/Wl8@vger.kernel.org
X-Gm-Message-State: AOJu0YxRVcK+b7yjTnrG9CprX9BSwWQcIqsFL5g+C5lAAAldoXdwVZjc
	aedmTmmy90UX+6ZOiZpPBHHSMwht03jEwYoRkoWe80+sDQL1eAVYo/ijFf4oPkb4AywWWN507Gv
	Im0w8NCx5wV3jZxASAZbfAxo18EkAB773C8EQpiE/cGIAikc5pnhsbBmFHJ2OpJlVo2WO
X-Gm-Gg: Acq92OG/ZObifH7Kfj7pTB5PYoyFSrnby/SM0xAKJiTON8qYuoM2IyefErQa89vL0OM
	bQ9vGIl4vYWCjpaM5wppyLhXuTl/d/c2nRjqM5vsvGRZoD2M7rnLWUxTDbHRDfVR8YR6mlYLwo2
	cV6A4wICJ8+65mfv7M0u5+Ene8lPGFew47dC9SHYTGjZ6v1wer9F5nXvIdM7NTnC7RIQMqsqJ9u
	WRT8zzXX03wrVCNcUXzc5DmeKFnr5c5Rb8oj3SCUZNp3/PVf2IH3zEQBrKTzw/IA9zbTYGr4CM0
	eLknR9agUhAgzwVh0/PZv1jv3Ur9rWcLo08l23PgZ0wxSk8UV80rtrgqA9wPfaE58zqfq0+nm9e
	Rvdzx5Od0aPHxQXHKjwnuI/XJPsUiDBYs8JMXzuSOYQdk/o23fhPXOKkcfyTFeCQJ1CGjOVod79
	sOo7s1JQQXEnQ7JVxVMsgOIvqlVNGLjAkbsn4=
X-Received: by 2002:a05:6820:c3d5:b0:69b:408a:4b18 with SMTP id 006d021491bc7-69b408a4c0dmr3959819eaf.9.1778591390666;
        Tue, 12 May 2026 06:09:50 -0700 (PDT)
X-Received: by 2002:a05:6820:c3d5:b0:69b:408a:4b18 with SMTP id 006d021491bc7-69b408a4c0dmr3959808eaf.9.1778591390223;
        Tue, 12 May 2026 06:09:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f3a8e1sm33739451fa.15.2026.05.12.06.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 06:09:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 12 May 2026 16:09:33 +0300
Subject: [PATCH v5 5/6] arm64: dts: qcom: sm8350: add Iris device
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-iris-sc8280xp-v5-5-8cc251e83b58@oss.qualcomm.com>
References: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
In-Reply-To: <20260512-iris-sc8280xp-v5-0-8cc251e83b58@oss.qualcomm.com>
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
        David Heidelberg <david@ixit.cz>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3708;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=isfBhfEp6QevbEHukDTBoydJGn4P48zEXe+HfbEpA30=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqAyaUayUy1Na6mfYm5/iVNPmuO8uXfmqK1ZKT7
 cVMDLdw/lqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCagMmlAAKCRCLPIo+Aiko
 1Q1xB/98DVfGo6ZOcaw63yO7drvd6cmWIIa9mfyYREkAWufG/HFa6eh07Oq5Ccbi39wY310UMx5
 5j1WX5EncTnUq/EaLd2/1zNoK+ynpuNa9vudLbxS6u7mO0UFnbNQdx7NuvBxvRsfJG4wMSVDBtn
 zbbhtqd6inUDzq9HzFYW1u/ndmBCm8Cass2SZrXNgPzryuiReZ8dOXevwSx52c/70cFBpq3Pt0v
 ykfVnaRciMZPS8k1DVMZkGOUn8YMIWM8pMl1rysitr9t37Q+3n4ZUdVqJ8tOrQodYhnJSQ/V1V8
 3rMr+ZyK2ZXM1DXqb73r/tZMU5I02ZhJjmmSOBHQHu2CiR4r
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: fb5LSO7DrF4t2RBFHVFNJ0cKXqJyTHwE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEzNiBTYWx0ZWRfX36a8n8jOXEHc
 Ht3FM+9z6mRIkD+1Lz5VTWsmHYtxLicODKJEnHL5Y1vUmIj4epwpH2b2aQjaomrOJ7HskUU/vru
 +TJiza0I3NFDrdInLxBLPIHQGU4unzrUwtvHt2E6rDLJRHrTIqahtj1jcVOx25Ex0axlIL5opyy
 tMisF1vMkxoiNv1BAQ8+WQ83jxChjLdGHpKXep1rkuXx4kWPU/kVRwBUiQ7jbwB6TUeMKokkyLJ
 K9XaZhaccYxfB0q2OkQYz3mbpkSbLK/ojuW0NfqDYdJlnm1gkfm3DsWiQPno3OS5loMAS04Ueif
 YhZFQpkFWPGljjCVobDnZdJwn4sXUJ/GcPAsovMxXq2E3qIOM12kqy6Q96ql76hycP2Lq3/XHzd
 a0h2sVuL0JM1A60OY47EX8ePkkyo52g+f9cAc/jMpPUlIq5ZkHsIM8XNwQe6RINacHD+z8M5FTZ
 34igKl+97Rw1dvsoP/A==
X-Proofpoint-ORIG-GUID: fb5LSO7DrF4t2RBFHVFNJ0cKXqJyTHwE
X-Authority-Analysis: v=2.4 cv=BoGtB4X5 c=1 sm=1 tr=0 ts=6a03269f cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=zXEy-fkF16KV5FEPuqEA:9 a=kSuwpvhy9FmzT4U0:21 a=QEXdDO2ut3YA:10
 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120136
X-Rspamd-Queue-Id: E1457520F6D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107102-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,ae00000:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,abf0000:email,a800000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,linaro];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add Iris and video clock controller devices, describing the Iris2 core
present on this platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8350.dtsi | 81 ++++++++++++++++++++++++++++++++++++
 1 file changed, 81 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8350.dtsi b/arch/arm64/boot/dts/qcom/sm8350.dtsi
index c830953156ec..2148a140f162 100644
--- a/arch/arm64/boot/dts/qcom/sm8350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8350.dtsi
@@ -10,6 +10,7 @@
 #include <dt-bindings/clock/qcom,gcc-sm8350.h>
 #include <dt-bindings/clock/qcom,gpucc-sm8350.h>
 #include <dt-bindings/clock/qcom,rpmh.h>
+#include <dt-bindings/clock/qcom,sm8350-videocc.h>
 #include <dt-bindings/dma/qcom-gpi.h>
 #include <dt-bindings/firmware/qcom,scm.h>
 #include <dt-bindings/gpio/gpio.h>
@@ -19,6 +20,7 @@
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
 #include <dt-bindings/power/qcom,rpmhpd.h>
+#include <dt-bindings/reset/qcom,sm8350-videocc.h>
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
@@ -2747,6 +2749,85 @@ usb_2_dwc3: usb@a800000 {
 			};
 		};
 
+		iris: video-codec@aa00000 {
+			compatible = "qcom,sm8350-iris", "qcom,sm8250-venus";
+			reg = <0x0 0x0aa00000 0x0 0x100000>;
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
+					<&rpmhpd RPMHPD_MX>,
+					<&rpmhpd RPMHPD_MMCX>;
+			power-domain-names = "venus",
+					     "vcodec0",
+					     "mx",
+					     "mmcx";
+
+			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
+				 <&videocc VIDEO_CC_MVS0C_CLK_ARES>;
+			reset-names = "bus", "core";
+
+			interconnects = <&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
+					<&mmss_noc MASTER_VIDEO_P0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "cpu-cfg",
+					     "video-mem";
+
+			operating-points-v2 = <&iris_opp_table>;
+			iommus = <&apps_smmu 0x2100 0x400>;
+			memory-region = <&pil_video_mem>;
+
+			status = "disabled";
+
+			iris_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-240000000 {
+					opp-hz = /bits/ 64 <240000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_low_svs>;
+				};
+
+				opp-338000000 {
+					opp-hz = /bits/ 64 <338000000>;
+					required-opps = <&rpmhpd_opp_svs>,
+							<&rpmhpd_opp_svs>;
+				};
+
+				opp-366000000 {
+					opp-hz = /bits/ 64 <366000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-444000000 {
+					opp-hz = /bits/ 64 <444000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>,
+							<&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
+		videocc: clock-controller@abf0000 {
+			compatible = "qcom,sm8350-videocc";
+			reg = <0 0x0abf0000 0 0x10000>;
+			clocks = <&rpmhcc RPMH_CXO_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK_A>,
+				 <&sleep_clk>;
+			power-domains = <&rpmhpd RPMHPD_MMCX>;
+			required-opps = <&rpmhpd_opp_low_svs>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+			#power-domain-cells = <1>;
+		};
+
 		mdss: display-subsystem@ae00000 {
 			compatible = "qcom,sm8350-mdss";
 			reg = <0 0x0ae00000 0 0x1000>;

-- 
2.47.3


