Return-Path: <linux-arm-msm+bounces-106618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UH5lOriy/WkXhwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106618-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 11:54:00 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 518C14F4856
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 11:53:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B026307C564
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 09:51:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E71D23CFF60;
	Fri,  8 May 2026 09:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T8aXy8HS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OHfwwpYa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5FF3CB2E5
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 09:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233881; cv=none; b=Szm9SZNcqRdwNGryIJlfM79K4Bsov7MOH4lKChVQ1Cns/maO9eFyTeO98umC5Og9vESg7DlOFQPqaFo7ZZnVmudNXn3pwgquYKlR0vt4pZdQYfWW+YTL+Pdra3BBvQzSmQI6lq9+wjXMgVNl6Kw/exXrw5cVMLlFWEbSoFnzaMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233881; c=relaxed/simple;
	bh=Dc648QGSLXsVNwPPGN3ddMFHXiV0r6dAgQxIldMhdxA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rqyXhAVMaSTfTPLyO1bSxoIjg2Sdu2bBqKTvcaZdIxQMKvdTiM4BcfvJaCwtx/tpNxma3HcWz9KAOZOrZhS10ZmHI9iluv0ZKyGH8FYl/wCAyXEmC718FyZiVrQh6OR3asSS4V/6yWwB/YSSFD2SkOS2Ey0YoOOpKeaXSR0fVD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T8aXy8HS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OHfwwpYa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6484wrWv2182882
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 09:51:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PuXcW1071bYrN3j1a5YqAIIaWaO8lO4D+u1f2ErMbxY=; b=T8aXy8HSPmk47Xrh
	1gUvs90kKahXAB0MYOivXvD+/zgXSxbNzeQ21St2JWBWKjFueWsezvNIacqd/eys
	bZGjn5DCReuErueH3w+kLhJxYey6ZFPgroDEig8Ao9LgLVocK4kWj8G4TfD4Z6Tp
	rbuZdlWWhhYPFR9QDO6mZfbio0qWFo/KonLOstri5uHFxLnRKLv0plz+Lf7wyFtf
	oFuChhjnPAtJ2yijwjnPIA13+AOnraSnuDXVPtSHFRgqMCyFOSu1V83xV1oTfSkw
	CAEfkCd2LdGzpkIs0Hf81O2k72DUJ27iFWt4C6BB8wYgqu9RiwwqnG7iQXZ/BvbY
	WXOpyg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10pyasr1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 09:51:16 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2cc75e79b97so6690799eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 02:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778233876; x=1778838676; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PuXcW1071bYrN3j1a5YqAIIaWaO8lO4D+u1f2ErMbxY=;
        b=OHfwwpYaPEsCEUPzFEMQov6HKTsJSp+SSt+JnDFKRFilrkACOfZeubIzty0Hj2iVQL
         gyAuvQdA3g2UKCa5oLBxmh8ZOrInWp31g18GGbm0i8CjQrOhBApXOtnQIYiBeNUC8bv7
         kzq8Iql7N+7gF7KIcmv1ZM5YJki8ZMUTU2d9c+PpF39pdfZ8rWlIvtyOPA2DUHweVRL0
         16iCnWzw+rv2gLcsEnq+GJj7hmlrDUUE9km+AybqqtmD0wmM4Ey9GrhHk+RG8kgh+IMZ
         2C3Q+DcLDEl/JbRTp00DE+crOpWMuOvkhSNXvyG+tndXspE1WMKzFj6C9X69W3QaUaN1
         xNwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778233876; x=1778838676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PuXcW1071bYrN3j1a5YqAIIaWaO8lO4D+u1f2ErMbxY=;
        b=Vh2ddfcy/yeF3K2erIjX8wbXBocDA5r5MUR68Ftsg3q85VKivVT8sFZ6WMHU9xK0pt
         VhIKr+pzCs1xb4tKDw/1IN7T5DbuDSJO0idG8d0B/6rM5GGtSLseo0/B5e9A/TW+gXW9
         9BL7OXsDFdiN134XVeaah/4eMBLZG/0VBvIDHdqQou/ppKa6qhxrSQ5ciuw4ieEXt/6a
         Qaxpr4QAPMV3eQSlan9AFXoRCL21DCAuJvbZN2EuW+g4Jl76a24e4z3KPzwvRTvxK+MT
         /SrerKUPX8Y6XgKqVbBRHgo/gXW+lcjgRQ4H4XieoNL4kzQDiX8Mbwc05mfazMGUxgvh
         wFdQ==
X-Forwarded-Encrypted: i=1; AFNElJ/2DZI0/x6OOMb3BBeZcwYHmeXHKGFiD9DTqTBj9XHPtstLtOAOH/aGxbZQBgM7kznJgLCMccuELb0+tqqE@vger.kernel.org
X-Gm-Message-State: AOJu0YzQyK8QsAkGc9oa1uf43Q8RB29P8tK7GhIpcvGDZ2oQVmdWje37
	WP2UUxpN4mDa5i8kNtiM7msXXvtWWUrl0jQc0tyHCN68BdQbrnAjJlulxW73L7dhJPsYPJlc4/b
	PosP3mX5If/lDW/3VcGcgk9IxN5hRkyR7CuesqSCtd52wjlOIOTRZ9ThZZ1JpZ9uUrSDQ
X-Gm-Gg: Acq92OHuCypk/auivXf252DPIThAfB4HOIjfhyv0TrpzOjIF6JmH0H8OW3J+t6LGrbJ
	pEhIFBsFgulcem397OyDhFCrBy4AK/sB5NZdpo+gH43lhAcMQXlmAFShJojjWoqQLv4puR0XWDt
	Q345Ra6y/JYLwFIOijYtF7YriF7KR1vvmueeBe79Otqj8RwwnTZXQ+ymFAUZH/kZ4Q8fsVTSqa0
	05FQLuVhkkByK979ugEWBlHfzpSexfvdw5g3xHjl0v0c+YcUX3CuP9nZ88Ggpe8QVtp7RMDJOG0
	J//ikoya0oJDVtHdsfYLqVTQeoCs6lwxaRxmJgJO/MqgvoI/QZa0V3IOQqQ/qlAA4bd/7YwR53P
	uo3jFpZ018gHG9EsAzuvguLunWHZ8pDEae0bWJgj4ZVwSv5SRxYB2M58MzuuiZFk//Pb/Rz6Cp4
	Bp
X-Received: by 2002:a05:7300:3b08:b0:2c7:3a7:c7a7 with SMTP id 5a478bee46e88-2f54d15fe7amr5654892eec.25.1778233875865;
        Fri, 08 May 2026 02:51:15 -0700 (PDT)
X-Received: by 2002:a05:7300:3b08:b0:2c7:3a7:c7a7 with SMTP id 5a478bee46e88-2f54d15fe7amr5654873eec.25.1778233875333;
        Fri, 08 May 2026 02:51:15 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847502fsm1739323eec.14.2026.05.08.02.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 02:51:15 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Fri, 08 May 2026 02:51:07 -0700
Subject: [PATCH v3 5/5] media: qcom: camss: vfe: Add support for VFE 980
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-add-support-for-camss-on-sm8750-v3-5-fc6861a65c67@oss.qualcomm.com>
References: <20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com>
In-Reply-To: <20260508-add-support-for-camss-on-sm8750-v3-0-fc6861a65c67@oss.qualcomm.com>
To: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=DZUnbPtW c=1 sm=1 tr=0 ts=69fdb214 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=3rR15nC7HOTWOJgZU7UA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: iJxab3cPVTcOs3PKitVNuaVQIiN13477
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDEwMSBTYWx0ZWRfXyI2vU+8qcD1J
 bkh/rGyBXixzUA/He65mJHgf7ffXG74GjF8xoN9zCus+jQ0/1PvS/A7M3OPNYzc7T2RqUHVHoZg
 Zy3QaV1JWJyk1Fed6y4UxLsf1zcrkZAifv2JSvxyHbpNNQ/mLQfHjhXn2pyOOSTcLC4EhgCwDzg
 3C5AjLtdhBK6AIM6Gbsdqtku+Jo6W7Aydza2eRdYvoy7k/waNT7fZhE9+oOqXkXlqXNtJ/KIQe6
 5tIFDmwZofONEr8WFwbjc4Xx97fSK9rGhJNvPfAfNQodT6bklWE2S+Ryheik3XwIFsjt6oAD2r6
 3MLUTAeEEV0UTyQU9weCi0MAGAf+E2/XoGFKkwG857c0PTXQRGZ/Xnsz77f+eKb0em7eSysZnK2
 czixHW8JHvdRCc2z7Fxxn7tbfOVkzEcM7FxKAEze6cu+2v1NT9kop0YQfzNUZ0x4vMlhJc8zxNA
 SBhrnK1QoPqmDFIwYOA==
X-Proofpoint-ORIG-GUID: iJxab3cPVTcOs3PKitVNuaVQIiN13477
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080101
X-Rspamd-Queue-Id: 518C14F4856
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106618-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Add support for Video Front End (VFE) that is on the SM8750 SoCs. VFE
gen4 has support for VFE 980. This change limits SM8750 VFE output lines
to 3 for now as constrained by the CAMSS driver framework.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Co-developed-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-gen4.c |  10 +-
 drivers/media/platform/qcom/camss/camss-vfe.c      |   2 +
 drivers/media/platform/qcom/camss/camss.c          | 135 +++++++++++++++++++++
 3 files changed, 144 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
index d73d70898710..46d8e61b9bac 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-gen4.c
@@ -13,8 +13,12 @@
 #include "camss.h"
 #include "camss-vfe.h"
 
-/* VFE-gen4 Bus Register Base Addresses */
-#define BUS_REG_BASE				(vfe_is_lite(vfe) ? 0x800 : 0x1000)
+#define IS_VFE_980(vfe)		((vfe)->camss->res->version == CAMSS_8750)
+
+#define BUS_REG_BASE_980	(vfe_is_lite(vfe) ? 0x200 : 0x800)
+#define BUS_REG_BASE_1080	(vfe_is_lite(vfe) ? 0x800 : 0x1000)
+#define BUS_REG_BASE \
+	    (IS_VFE_980(vfe) ? BUS_REG_BASE_980 : BUS_REG_BASE_1080)
 
 #define VFE_BUS_WM_CGC_OVERRIDE			(BUS_REG_BASE + 0x08)
 #define		WM_CGC_OVERRIDE_ALL			(0x7FFFFFF)
@@ -55,7 +59,7 @@
  * DISPLAY_DS2_C		6
  * FD_Y				7
  * FD_C				8
- * PIXEL_RAW			9
+ * RAW_OUT(1080)/IR_OUT(980)	9
  * STATS_AEC_BG			10
  * STATS_AEC_BHIST		11
  * STATS_TINTLESS_BG		12
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 99630ffa1db5..fbde638db194 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -351,6 +351,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u32 sink_code,
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
@@ -2014,6 +2015,7 @@ static int vfe_bpl_align(struct vfe_device *vfe)
 	case CAMSS_845:
 	case CAMSS_8550:
 	case CAMSS_8650:
+	case CAMSS_8750:
 	case CAMSS_8775P:
 	case CAMSS_KAANAPALI:
 	case CAMSS_X1E80100:
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 015f511332b1..b35fa330e911 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4434,6 +4434,139 @@ static const struct camss_subdev_resources csid_res_8750[] = {
 	}
 };
 
+static const struct camss_subdev_resources vfe_res_8750[] = {
+	/* VFE0 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "vfe0_fast_ahb", "vfe0",
+			   "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe0" },
+		.interrupt = { "vfe0" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife0",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE1 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "vfe1_fast_ahb", "vfe1",
+			   "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe1" },
+		.interrupt = { "vfe1" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife1",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE2 - TFE Full */
+	{
+		.clock = { "gcc_axi_hf", "vfe2_fast_ahb", "vfe2",
+			   "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
+			   "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 360280000, 480000000, 630000000, 716000000,
+				  833000000 },
+				{ 0 },
+				{ 0 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe2" },
+		.interrupt = { "vfe2" },
+		.vfe = {
+			.line_num = 3,
+			.is_lite = false,
+			.reg_update_after_csid_config = true,
+			.has_pd = true,
+			.pd_name = "ife2",
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE0 */
+	{
+		.clock = { "gcc_axi_hf", "vfe_lite_ahb", "vfe_lite",
+			   "cpas_vfe_lite", "camnoc_rt_axi",
+			   "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite0" },
+		.interrupt = { "vfe_lite0" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	},
+	/* VFE_LITE1 */
+	{
+		.clock = { "gcc_axi_hf", "vfe_lite_ahb", "vfe_lite",
+			   "cpas_vfe_lite", "camnoc_rt_axi",
+			   "camnoc_nrt_axi", "qdss_debug_xo" },
+		.clock_rate = { { 0 },
+				{ 0 },
+				{ 266666667, 400000000, 480000000 },
+				{ 0 },
+				{ 200000000, 300000000, 400000000, 480000000 },
+				{ 0 },
+				{ 0 } },
+		.reg = { "vfe_lite1" },
+		.interrupt = { "vfe_lite1" },
+		.vfe = {
+			.line_num = 4,
+			.is_lite = true,
+			.reg_update_after_csid_config = true,
+			.hw_ops = &vfe_ops_gen4,
+			.formats_rdi = &vfe_formats_rdi_845,
+			.formats_pix = &vfe_formats_pix_845
+		}
+	}
+};
+
 static const struct resources_icc icc_res_sm8750[] = {
 	{
 		.name = "ahb",
@@ -5875,9 +6008,11 @@ static const struct camss_resources sm8750_resources = {
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_8750,
 	.csid_res = csid_res_8750,
+	.vfe_res = vfe_res_8750,
 	.icc_res = icc_res_sm8750,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8750),
 	.csid_num = ARRAY_SIZE(csid_res_8750),
+	.vfe_num = ARRAY_SIZE(vfe_res_8750),
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 };
 

-- 
2.34.1


