Return-Path: <linux-arm-msm+bounces-99057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aOPzFS4UwGnMDQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 17:09:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FD62E9EE7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 17:09:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 268ED30182A2
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Mar 2026 16:08:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B17A2369996;
	Sun, 22 Mar 2026 16:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OuCwMtv6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZzX9Jese"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687DB36921B
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 16:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774195719; cv=none; b=DJLti/LxMylJdXyX2bdlvLO61zDBYL0vGLTT2Lsrde2lxDuhpI8rfwGCxvVDQ18W2ZFFGjVbZQFtCgHb2gtwhcb3kWZ9Deyb23FHwYjXOFoRisicU/e/YaWzk9srtSeGpo+J32burCT0R5CBds9ucBf6A9A+WlAz6eLMuL3fEUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774195719; c=relaxed/simple;
	bh=MWKYUpvYdw2OF1ghyk63JJ4cIjAO6kQ7rkYGkKMoz8E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AeB8KftDZfFDW1K+ZylNnx24T5EmRhOxniDL+hRnUbgihi5BMqB6kxOxFAcS1iFQbKKC3Kh/SY01vs1M8B53w5NJWlCyAgVqp7pPqJ7eCC3XXcxAC/raOhywvJdZ+rnfi2PxYlCnxAHzmePJq0l8lhlR0gA3EFRs9psrblxihkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OuCwMtv6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZzX9Jese; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62MDmaaH3769023
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 16:08:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IYDW5AnySHMFnEHi1fw99uUO+hBP5ybPg/fnZXTfyK0=; b=OuCwMtv6SHtxFR1d
	+mg3WCVaEQWawYe3IMZW3+CWm9UDFUDEN6UYvf/BIZjbpcT0RXVCbZmE4p4YU8Mr
	l+OwZyiPbxps+w2plESQ6ml9ig48kYtjw8ie5qRSZJEe16CBW7Ek9u3SKyjyPYg/
	QwKw3y3R3noojlXI3vDgM8u1bouDfR0n8PCr0fYwE8mSOSZbSmD48rb1PS0kZvKt
	tMQvQzxKsZ0HndQtDVDRF71+XBf4NLTeQw6LYeLTjfQV+/5dPgJXusZZrIQMVsoD
	aiSTBVRBKp5T7gelOZu//D2bfcxLCiI0bXl1u6LOhLu1NyyiCa5ow/JStQ4ePouR
	nEddLA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jwvjnhr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 16:08:37 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5093025ffecso224671011cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 09:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774195717; x=1774800517; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IYDW5AnySHMFnEHi1fw99uUO+hBP5ybPg/fnZXTfyK0=;
        b=ZzX9JeselQZrpok5KPwAyX+Abca3fws2IjgHCwRwa+TwyyKJLLPAq/lZRqpXGaICa9
         mBh3EdWNGFrPLW0CGdkC1pQrdWRavSTH7JKDJQJq0yoWEoRIODYf2Jwk7qPnxWO2y2/N
         rbgCzV82xEqpWgmezws62Q2HBtQQLr0IGVsI2pzNl1xKfY+5OU2iM/RNYiRF+s3AnCCC
         oxC3jb2B6xk++VcWVCIO8WDVDB/LYc8/SeNJ78+WDDuru+KRBxKMyCaa6S7LJIBBXhX3
         C0xUIhNP6gdMCP4SxjA6ct0V0+olE2h6EsCxuSuCvP8NrKB2dpFj5VA94b5bH3xKfV6+
         btIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774195717; x=1774800517;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IYDW5AnySHMFnEHi1fw99uUO+hBP5ybPg/fnZXTfyK0=;
        b=ofjWnoab1gYh5eZ/no3NCU1yjXNHSDA28p+ehOEk21XaoFGOBli45Y2VZymzPP0Mx2
         9GBO6JT/A6aBZcz7sYOxWV8psSjhMpeA4lnThGdDv03mzLssAh8zvkd3VG/UHcbQ02j+
         6SwFFYg7Lyib6W84+Vd3jpj5FWAy/2Ez1SaMZ65fXwON+WtcoRTz/HDFgqmsCe3LnnXu
         tUM7GzzpCehCIu04eB20W+O58A6BwuKXBZJXtxijynOZgUnKdZJSRTATBCVxxmMt+lly
         UcUaPzFmVzPbPOGRTID0nqMzVsI1T4jEt2Wo4OBrzIt5HHEVA3voTLiA2EpMmYqR8S/T
         jCxg==
X-Forwarded-Encrypted: i=1; AJvYcCXk3bEqlQ7TpNDw8dLpIeJqHqS9jPSdh4/1+jyeNHtaZ5CIoh9rFHykMS96vYmE4bWL9L7OEm8Vo6tQ69A9@vger.kernel.org
X-Gm-Message-State: AOJu0YymvI4WlAg0+DiY7135IHGl4SE+JHAIAYPVEFIgdsWarCtV0reo
	D2B9LdiiBvQuwbJlMMpu17hGg/ngB+v+057M4Vtn0l0CJr8vIw83ggpR5zJP7lMmmpeGNyUQgG3
	bPFT0SBMTGlfsk6TFuDrxHXCqt9RMmcyJWpKXrjKo8uBifSU4VrI1nkBbCtfk8jv79fRz
X-Gm-Gg: ATEYQzyIVeEG577RDBCCoNXMNBS50mdeQl4tDAfs/w70szDuFLc8+F88nk1WOW+nzJu
	W4TbgK6fD4B8Jcs5X7R9OqyI57ZWHXAc4Ah+bmjaEWTuksekx9mijcX+eIuWTi+XG2MhHUQmDc6
	OZccHDdkrp9jsqJeZ8UPFyWUJUGlDCtjmK7PBTTal2xR+UTL3hdTyxwZS0yrnbqZyRVFzY2qEiy
	ObVi+hzcoGrge3IId+YJmd42Qlm7ssUofq1Pdd1+QdwPTd9P0OsNMJ6TBwKBDnNXT/i/NXDpIsx
	VbevHAlKw+DJgHYgHXxafkglY/SeLoX/Y0E19nrWpT9JLl9kiCOh83/NurCaVvCQecfEGAXgjYR
	8ok0lp63x0GTQ98377jplTplV4MY=
X-Received: by 2002:a05:622a:4ccd:b0:50b:4be1:7c95 with SMTP id d75a77b69052e-50b4be18fc0mr71360421cf.30.1774195716642;
        Sun, 22 Mar 2026 09:08:36 -0700 (PDT)
X-Received: by 2002:a05:622a:4ccd:b0:50b:4be1:7c95 with SMTP id d75a77b69052e-50b4be18fc0mr71359821cf.30.1774195716068;
        Sun, 22 Mar 2026 09:08:36 -0700 (PDT)
Received: from hackbox.lan ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe8159dcsm79087155e9.0.2026.03.22.09.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 09:08:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Sun, 22 Mar 2026 18:08:20 +0200
Subject: [PATCH 2/3] arm64: dts: qcom: eliza: Add CX power domain to GCC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260322-eliza-base-dt-fixes-v1-2-c633a6064a24@oss.qualcomm.com>
References: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
In-Reply-To: <20260322-eliza-base-dt-fixes-v1-0-c633a6064a24@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=MWKYUpvYdw2OF1ghyk63JJ4cIjAO6kQ7rkYGkKMoz8E=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBpwBP61eLt6gZ0FWqcgkYYcEb/A3f8bEvv2g2as
 WeQgwrntWKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCacAT+gAKCRAbX0TJAJUV
 Vg15D/9T8n8werLPsmGcfZcUDqnjl9MrVGsE09/p+XgnOJwLQbNNtqfhPkxosUTg+WUdh1LPCVX
 stk8zEI+Jt9RjrkXTkPNQvLG8kfHEoJJJw5d7it0tyaCjWuZ4dbD6sJ3dO7GeAnGvgnDRdKjZJM
 01H/T/nnxyzGW8mOA2PJN1zDY948/PXhigT0pZMbkr4lfaX6Yl1axah60Qt/THTO4hvsr5ICx04
 0gbUDhuQDiXJHq1QNIO0pbyilX/+BFCWmoYm25DWgK2q72lLHG5+2U6xvWv7OTM4bO4s4FiQQvh
 mBAC1hqZDoMcO2YNFtbFx5JWUAEt0RPiljCT5mF2bmlKGER0REeMx03Jn1gXLHMIo2UvCxhdcYo
 jocM0fQTjvZYMpiLt+lslIOEIlbJ7y/hJ/Yi3aC/Zl7g/+DrTmJfIUfqYPFAC/fS/5g/SUU9GZW
 ICrWkJhUD3nWlKuZ69x21ueuy0LbhpoukhRgQQLjtBRhtVQWJSLPVQote/bJcbiv3qGhiXKVZT2
 xXBH/lTs4R58GQ9dd87bu6wsPci0vW5NFoxc0zOYGkpypwDZzSkq8S5zq277pQDcU5zYo86jDWW
 tkfh3SY4dkaXmsZ+vQw8hyehsNvBu+uc172rbjLAX9X0Z6ZEHGb17Hu/KknAsN2kl03lxIwPOQP
 zhiq15OTVxCPhiA==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIyMDE0MSBTYWx0ZWRfXybu3HELoWtNM
 jJ27RQYkYVYAIj77fm8BobQy4jeH7CpRbMAVsepIYEBp/WLAaT9IlwCfEzFgwMxNipMC7xrcNdE
 f4hyi6RCjKPOvY28GwrmSmNn5TiDAfYPNsRHHp667jhcMimTRDXTqyTgnsGCl0pwGpwnUjUONoJ
 1iH9BQMsSCdwCTsLTEvQ5xzhNAdU20KmayLxkzeKynE59de2NYvEOIhxnUtvZh9KiMVpL/2jqGV
 7tOf9F7I2eVEBTbKKv/S8+FrbEgyzvpyQZfv6aoCQTMjv71+H/laiVAJVsvcS9Kdqlzru1SoOyr
 Cgk72Q17MoKk+x3jhvqhYnRSm1LGYfd0iIc0ysXUz+y9GbK+bTvQ7qBrpRqUwfs3w6BOzcpbncs
 UukDpJQY/eE0/b4dw9tmu9eh4uRp7c15UmO4HO6u4+9AjI0bXTU4On0KdKM7yOcXgieaIhnZEtn
 gYAhReDcae7un5wMrpg==
X-Authority-Analysis: v=2.4 cv=bcdmkePB c=1 sm=1 tr=0 ts=69c01405 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=yTESgr66MHD1aPHvgagA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: mR7SbdovAVHLpcAwr3UmRG4N3x23DLKQ
X-Proofpoint-GUID: mR7SbdovAVHLpcAwr3UmRG4N3x23DLKQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-22_05,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603220141
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-99057-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 16FD62E9EE7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Recent discussions off-list highlighted that the GCC should vote for the
RPMh CX power domain on Qualcomm platforms. Without this, RPMh may not
aggregate the correct load for the CX rail, potentially leading to voltage
drops and system instability.

Add the missing power-domains property to associate GCC with RPMHPD_CX.

Fixes: db7fe6963466 ("arm64: dts: qcom: Introduce Eliza Soc base dtsi")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/eliza.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/eliza.dtsi b/arch/arm64/boot/dts/qcom/eliza.dtsi
index 5dc3aede6842..fab603cd8e42 100644
--- a/arch/arm64/boot/dts/qcom/eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/eliza.dtsi
@@ -617,6 +617,8 @@ gcc: clock-controller@100000 {
 				 <&ufs_mem_phy 2>,
 				 <0>;
 
+			power-domains = <&rpmhpd RPMHPD_CX>;
+
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;

-- 
2.48.1


