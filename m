Return-Path: <linux-arm-msm+bounces-91954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YA2pJQrRhGk45QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:19:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F051EF5CE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:19:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 463AA309C8C0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 17:14:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF85143CEF7;
	Thu,  5 Feb 2026 17:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dO7xpI1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PcRw5R1M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD2243CEF3
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 17:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311665; cv=none; b=i/T1fpsx4xJWYCYC0HUAM6qIyq7Ke6OyxZaa5jaJH52M+vwM6afR9PpMsthhmKmQxrqwfP8Mpu96m5k/jm9UQyOYSdPlpVvvsoLiq0Va/6JdjtmHqPV3UUhXBsISOJfC79xRCl1XoSuAKnLgvg6+um2QnjTkb3Vpi/zPbMjUwgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311665; c=relaxed/simple;
	bh=OpBfp5jqslbORQSzmdK3zOW77Ndk5UkWCXVD4HYaUd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RdwkonesY/urS4CcEwbD84FFg2bAFNyMo9wGJjh16Iw49t7r+WAjgMyHRZ47HCuZtDvfqKVSlpOmf5F4RPPsChIOUWNYZdPzl+5xbEGfYXkStndjDZj7srYzOWqBUmkIU3AnoErBNeBYtOd4vf1RQ5tp1LHj6nHy0N1L1ROqDD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dO7xpI1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PcRw5R1M; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615AvWE13246047
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 17:14:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=I8kPziSHEPC
	7tP4o1IoV56rLMTkjFafRmWxkdzxubVY=; b=dO7xpI1J+lqX593XNrV0Diur7xT
	L7ZUseOm+AOjfsgDQP9Qdz+SYhrFZAm0JTXq/x/nqZxoxWrWOYZ2EE1Ck29mYQzl
	HmJ+GkCzcQSqQH45/SdHgmSXzqfIUr8nHBWB/D7tZa+zq2C3DGxzswBguLO/7rqZ
	K7qR59S7DBTyjTXXaEVa7z+SLH/HvAhKMGKWQHbprvSMEhULF5O4OntTWbDRk3MF
	baJrULQP/epFDFPtfWF+dOJ6WkWgg1Jx7DIFHyMTjWmxWtlk5lbWXI2H3N4gIyRZ
	e9pX/8A8imOqlw8pn4iUmO1MC7a0n+o6CZaS2qHMnM9QXdpbh2S3kbdf58Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4cp53h9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 17:14:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70d16d5a9so298165585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770311664; x=1770916464; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I8kPziSHEPC7tP4o1IoV56rLMTkjFafRmWxkdzxubVY=;
        b=PcRw5R1M69RP4MIOJTeYQzOVuOA3H3hhQMPUjotTCu4ZdyCnyU6m5pG/4LSS/QCdVt
         /QvCgDxYlaPsJn6MgJiaOUmvxBW1qQxWFdlyRJQN+WLz70lM26ytp8YR7iyZ1uz3apGE
         K8liwiMREtrtc7Stl5xg3hd74JqsJoSbf4HsYueVRD00fyDsM731b8xKj4v4KpqOiDg+
         rQDxu8GONW4sHqe1uqKPiz6BE+w58DnXDgtQvSqYyaiRSWu2aba2YdqdhfVaVYCvzIAd
         Ukk5t5KPwcBp98AX8UYFNkg2u7BCF43Q7lOTH65HS84iMj5+xqEN9bbsgBpXIaBW32Ia
         QhIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311664; x=1770916464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=I8kPziSHEPC7tP4o1IoV56rLMTkjFafRmWxkdzxubVY=;
        b=LcWxaHIFymoHYm3Ojdxbd/3RG9cUKtBVS03jPH2ARWnuye14j4Js/e8OOPAmsqf7dN
         BXmRRFueQ9xkvRPMVVdBFFLpFV71d74cCzhnAnrayc9zXWe2WhHrcCE/68szQW82N6e+
         Wt3EPolk/RMZf3s3n+Ha6MA4KPuvcORVt7jCSdf03OY8xy599gPU5uRIcVtf98gkikAR
         X1KDkRthuH8p+tkGOUUZlkmB0bH+bgK+ewHSuHs6x2r1wWkyYRucRqHU9g/moJRFa+zf
         71BAlvBHtT81aqua+XsQt3AsgDQW8b+VUUyFmnKICa0tepZobcrlcJtdea/TQmT9jBOD
         gjBw==
X-Forwarded-Encrypted: i=1; AJvYcCVl/WtfkT2NooKOd3FBQDuLdEGltrUvp0uO8/y6Jc5a6FOSTy6tn0ozFGNGMp5gb/AQ4NZKmOwlvbXZwQzA@vger.kernel.org
X-Gm-Message-State: AOJu0YzLmYeYNem0a47AqhAP6O4bQ1LKGlInuUmNuwVrALAix+Jvrp2K
	CvjUJCsSk3SX5/ONvvMdN60wx13OWalh5O7goONlX1kVMfJCxLL9VAxzU8zmXnE3Eji2yTlqfml
	YO96D+UrPne3SHjrqY5J+kgZBF3WBL/P5K6bY8yh8PSFv44S7rGa++No5k9lg5AjpJ4Iq
X-Gm-Gg: AZuq6aKPw+bxgg2diuH+DZPr7ceosf+9lZOzPYBQOVTC/b2gn8UibhGMZ/EN8UqyvQv
	ecZe9541/Eme1ih3yj21zt6DJu94vb7Dbr5oXSnnY18vWqBDMw2iQ0G49xst/oM0mNMDZBkqcPk
	13Sb1gTMNMw2cWZ80wAHiqdURWOMi02IpPGk47yEkhc4pDtj91JLd4s4KyRy7XHWPji7JyrTZ2D
	zegAKIJylpej+K+NhLhNtFM98rfOpNuoA1X01o+EHRmbIliooxYrGIQqrdmNE6hMKIlsg7ibfoi
	nge/zAdGKn5D+b9OToQPYXuAB9RHijeSq40WgdvczYbkX6bqkpnsK1a6mX4wsOB7q4JumfII/Q3
	7G/1z2YF+WYuHJWSh7MMye2flzd7+MR1mhy/sFdWp5ZA=
X-Received: by 2002:a05:620a:2a15:b0:8c6:253d:5187 with SMTP id af79cd13be357-8ca2f83bc03mr899695985a.11.1770311664123;
        Thu, 05 Feb 2026 09:14:24 -0800 (PST)
X-Received: by 2002:a05:620a:2a15:b0:8c6:253d:5187 with SMTP id af79cd13be357-8ca2f83bc03mr899690885a.11.1770311663650;
        Thu, 05 Feb 2026 09:14:23 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f87sm14802849f8f.21.2026.02.05.09.14.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:14:22 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        cnor+dt@kernel.org, srini@kernel.org, perex@perex.cz, tiwai@suse.com,
        alexey.klimov@linaro.org, mohammad.rafi.shaik@oss.qualcomm.com,
        quic_wcheng@quicinc.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 06/10] ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add Senary MI2S port
Date: Thu,  5 Feb 2026 12:14:07 -0500
Message-ID: <20260205171411.34908-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Oc2VzxTY c=1 sm=1 tr=0 ts=6984cff1 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=S1r85Wze4wKqmHhc2Z8A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: -R2JX02XR19wuI7Xsks4pylOEWUsn4m-
X-Proofpoint-GUID: -R2JX02XR19wuI7Xsks4pylOEWUsn4m-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEzMCBTYWx0ZWRfXxOr/rTZoegjO
 rxsyDA/rvhobbwyt2heNBVkf57g1mat9o37rhObH2jC+BbZMPg9u3Zl6KX9V1hQAOmO/8DrccQy
 6gBT6w9S82pzLxo1YG4v7USlu4fGdObNL9KLR2tkGeHuaYTls5wNRCgHG1RTWU9oiq86x7ry0Sm
 rrWqWNpUIHi9G1DFErLC4562ZmBRi0sWxcrN8FiMr15SxNAwCt6S/2dh01ACJUJDiTr2iBgJus6
 B1Nzt80EUquf94WBbEsYeLhbT2ADkQhoTVhKYuSCxYwvhj5W+8nrGnm3jG4fIfW18Lvo0rVSajr
 mgBCedWf+/8RB6tt/hBP7iR26bgQo0uJ+yEZ7MxvclFe4v21xw/AWQ86mgq2wOUdrqRokBHdaD1
 Tw2ryhtZEz6yotLBotP9GU4xT8WEBweCSsL1eqTBTlcCYcbtaEclbBH942Rn7Azc+4RIgSvp/wy
 vqH+T8G3xABKBu2E3sw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_04,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602050130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,linaro.org,oss.qualcomm.com,quicinc.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91954-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: F051EF5CE8
X-Rspamd-Action: no action

From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>

Qualcomm platforms support the Senary MI2S interface for audio playback
and capture. Add a new definitions for the Senary MI2S RX and TX ports,
which are required for boards that utilize the Senary MI2S interface
for audio routing.

Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 0febc641f351..715bcf1bccdd 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -150,7 +150,9 @@
 #define	LPI_MI2S_TX_3		144
 #define	LPI_MI2S_RX_4		145
 #define	LPI_MI2S_TX_4		146
-#define	LPASS_MAX_PORT		(LPI_MI2S_TX_4 + 1)
+#define	SENARY_MI2S_RX		147
+#define	SENARY_MI2S_TX		148
+#define	LPASS_MAX_PORT		(SENARY_MI2S_TX + 1)
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
-- 
2.47.3


