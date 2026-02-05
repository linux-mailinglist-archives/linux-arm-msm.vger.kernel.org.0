Return-Path: <linux-arm-msm+bounces-91949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOrHGV7QhGk45QMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91949-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:16:14 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7F9F5C25
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Feb 2026 18:16:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 206F2304567D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Feb 2026 17:14:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9658143CEC7;
	Thu,  5 Feb 2026 17:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FnAFNpA7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y6uINJCv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6365643CEC1
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Feb 2026 17:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770311658; cv=none; b=QUd725ejOUEw17T7z7TFz6V/prpWns7p55I7njCAE0vjJvn0B7z6HcFs+VwiaVh/pqqrfINw1duTurz38E03yMn1t9nxrqtgXf9VIYLSehRfKYy8I370+sUA/Aox8kyTQDvTpc3Yfh70/58GlLSW/dat9eqrSPq8I2l817yECB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770311658; c=relaxed/simple;
	bh=hpmfNzSCIC5ApGBDTE0elE5AkmLDZ9OmsstHpD/oKEk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gtfu+7jIEFbBzkq5pqHKJhfT6KIb2qBS2KE3lQBQx4e6VDlEMEPzlA3AOsBNWmBFUr/545k6cogSlCHzkkbZwQeqJ2gjPmpyGobV6Z3X3jV4SJRbAQqcw7wu/sH2COikv6NCjDqCSZ2lcriivpBZJcNkFGEYNxuklsP13oMRQC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FnAFNpA7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y6uINJCv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 615FriYr872496
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Feb 2026 17:14:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=K6uxAlpDaZ6
	EBOUxGU3VxAdAbWdRRiS7if5bxpU1zcw=; b=FnAFNpA7+DcHitGvUXjDDHYr6NA
	aF9O7SilomV2gGQE7liag2QkVCRDQv++knj0DWjAdS0uNKDlLHt+qsdb4NiSR4WS
	nDZZRtVlBHvTeg/ri4gFz3W9JKqwXF8UJrZ59PJ+ovlnSL/OR+locMQ+qLwhm+lm
	Yu3voBdLWpAxQK+MvoYIETH9fAezKLrPkwatdWeFomzYIqAr95GxyvDrzD2Z8BsQ
	EvXDsJaVDcC38dLwemuU0aHmtCejwxJVEDp90tpcaX5W6MLDMxjYNpwodRlC/04W
	oJrQB9dgzWMs+EeO4d/nIbKXXHBNXSw/Gz1XcNUu7NpHgl9/7AWuB2gQl2A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c4x8bg92e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 17:14:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6ad709d8fso301829285a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Feb 2026 09:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770311657; x=1770916457; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K6uxAlpDaZ6EBOUxGU3VxAdAbWdRRiS7if5bxpU1zcw=;
        b=Y6uINJCvEvTft0AI0ovJr0uRGmK8rh1NuAKI6hHfCmRhB2YodN7qzrIvm53N9UrrDP
         n2XTWU5K+ZI902LlI1l1TdEq92EqLlx1x13jsxDu3jFhOoEI/zJs11ECA8TALGV0nwWq
         zEFTgXItP5IXzyodbqRUt7hiQE3ZxZmmDc7oBS0cZaWSrmKM3qSPEELf6R/NjDXBCezG
         GuZXbOUUsUom0ZZrxagcOF5/mP4je0ATsDKcRRiZc6jzDLWn4Jua1klMmuRGwheHBPxp
         6AwENNRsPmQUAoULQh90npkgFSahNEvWuk+rtrMFkmoYX3gacXur+88fY74Srs9rcGjz
         DmNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770311657; x=1770916457;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K6uxAlpDaZ6EBOUxGU3VxAdAbWdRRiS7if5bxpU1zcw=;
        b=B6Wt3WGMAigPJwzYF6cvl0Flz4O66MbUPvXMDHIWjBj7aj5DetLWPNyQm4RYQKO2WK
         b5I1R+U2fVFcYNCZHo4tQQuWhXMzFKBxOemngCzRrrDoZxS1Lg+V4HatimfCkmslF/MG
         8ILnI0v7vOfMfblpnEocUpeHaC871S7QfKr9a6Adl2ZKzzvCFVQLZsSIbctaCeooXKK7
         EyztsNJO2htCULBI1pFKXEQalyMOK/ciEocgt/n8pQBAfbJ8kwOwCBfK/jBjcKY/StFk
         TiVWGJJVEKhSvgEWdo+o8lh7KQ34ytYGkGny330bGoMeEXHLYsvRCcZc7QsZN42wXNXj
         dXcw==
X-Forwarded-Encrypted: i=1; AJvYcCWokqVvQPAs65GuP7SsayreDpxDmG2AA1WeCpI/qEtepK02xab5JaASB6R/w3zYvrRa923hRVzuC0UhodRs@vger.kernel.org
X-Gm-Message-State: AOJu0YyPkZn1LDc6XoEepF2uBHyBVoun1iROYG09T0+jNXnQqgi4dS9S
	tYWHKLT4llz5kwDbOTDqfA3kbTM5F8hoXpulpn4XrhstutR+oOSfIrRt7x4TVm6TD1yiZlRmcDy
	ZjqJw438DORp/1WelivG2gTCEDeb60a+fjMQbgO9ZriCMmTuDM26ULKGUAnjqeLXdfrsE
X-Gm-Gg: AZuq6aJcl34vWxLYedFV/Tu7u0cPg6EwdKrScH6bB/WuT9PPBEgSCsOMKNKvcTeqf5Y
	av7kz98gVPCWp4y095RQnTuT23PRR/T06SFdnv2CZEiRBj52OiIan4Xf6AF+GidPGK6XknKpHTg
	3N17EKPXqv9ixqqN69ReoPedVoCsreZcpu2s7KnTWp79pTHlRM57Hka7VFAqg8j+k+qeHgKcIqL
	e+b8TPXHrDKEpsvtBdtDOTNqkeMuuK4/xQNOaMvaA8JkyzALmyHi1wxqt5EgBWlVjUTS85fWk9/
	/dS/RG9/napEk7plvs9TvE8x7GN6tMki6WdRfG+F/stc9nWX2RgP67x0xxX0dWRoJMh4gFh2N4r
	S2j9T0u496MkaC9eDatY17TL9mwZOL3TJ0bB0wfp83Bg=
X-Received: by 2002:a05:620a:440a:b0:8c6:b16c:a56 with SMTP id af79cd13be357-8ca40c5c033mr475106385a.38.1770311656769;
        Thu, 05 Feb 2026 09:14:16 -0800 (PST)
X-Received: by 2002:a05:620a:440a:b0:8c6:b16c:a56 with SMTP id af79cd13be357-8ca40c5c033mr475100885a.38.1770311656230;
        Thu, 05 Feb 2026 09:14:16 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43618057f87sm14802849f8f.21.2026.02.05.09.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 09:14:15 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        cnor+dt@kernel.org, srini@kernel.org, perex@perex.cz, tiwai@suse.com,
        alexey.klimov@linaro.org, mohammad.rafi.shaik@oss.qualcomm.com,
        quic_wcheng@quicinc.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org
Subject: [PATCH 01/10] ASoC: qcom: q6apm: fix array out of bounds on lpass ports
Date: Thu,  5 Feb 2026 12:14:02 -0500
Message-ID: <20260205171411.34908-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=GaoaXAXL c=1 sm=1 tr=0 ts=6984cfe9 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=MyalSr31lt99Fa30PzAA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: nc6hKcM0De9bJpgqAaq_J_KnwWL-Rf5q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA1MDEzMCBTYWx0ZWRfX8TYnwLoJDdck
 hk4Lg6kpYfm3LbYtHj7QuaQqVnwxa8nF3cunS4uTQAU7BmF/8gfDtKFLcCJ9hSNvNblr01QMsYP
 S6JFqG83AvnxNgY2lczX2VGlUK5f+XClyK8ksbCsytwEF8B4eU8/25gz8fbJ8Is1QYmvw6N3nA8
 m8/rd/B/UCEKlIAVZ/ZDxj6I46Bf4CDx9qmW3jEFgVwbM/GYwCgPPSZX/BPMMva5i+q5oBsJ9nN
 yLz5KMnXT0lSZDOKFWIfufWo1IajE11oEWcZ/DGPi5AikrIni07mAGwAbHJcdSAjABHNnAGnkKd
 RH9JxTB4YJewKNAN39bBxQwAZ9ShdPcnIzjsILMZwY8ozdCKAAqRCMrzTd+3HM8WiK+O0L44POZ
 b7NuKrqKTQfhSHif+sRjNj0WWDvhP0SpxISVONmgXZBC5l7TtOh+slBuzpRVJDAM1FdUNSDJNwQ
 A1vCrwZKc864ICIxElw==
X-Proofpoint-GUID: nc6hKcM0De9bJpgqAaq_J_KnwWL-Rf5q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-05_04,2026-02-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602050130
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,linaro.org,oss.qualcomm.com,quicinc.com,vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-91949-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BF7F9F5C25
X-Rspamd-Action: no action

lpass ports numbers have been added but the apm driver never got updated
with new max port value that it uses to store dai specific data.

This will result in array out of bounds and weird driver behaviour.
Fix this by adding a new LPASS_MAX_PORT which is can be used by driver
instead of using number and any new port additional can only be done in
one place, which should avoid these type of mistakes in future.

Also update the driver to use this LPASS_MAX_PORT.

Fixes: 55b5fb369c02 ("ASoC: dt-bindings: qcom,q6dsp-lpass-ports: Add USB_RX port")
Cc: Stable@vger.kernel.org
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h | 1 +
 sound/soc/qcom/lpass.h                             | 2 +-
 sound/soc/qcom/qdsp6/q6afe.h                       | 3 ++-
 sound/soc/qcom/qdsp6/q6apm.h                       | 2 +-
 4 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 6d1ce7f5da51..609bc278f726 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -140,6 +140,7 @@
 #define DISPLAY_PORT_RX_6	134
 #define DISPLAY_PORT_RX_7	135
 #define USB_RX			136
+#define LPASS_MAX_PORT		(USB_RX + 1)
 
 #define LPASS_CLK_ID_PRI_MI2S_IBIT	1
 #define LPASS_CLK_ID_PRI_MI2S_EBIT	2
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index de3ec6f594c1..99b0b6651fad 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -17,7 +17,7 @@
 #include "lpass-hdmi.h"
 
 #define LPASS_AHBIX_CLOCK_FREQUENCY		131072000
-#define LPASS_MAX_PORTS			(DISPLAY_PORT_RX_7 + 1)
+#define LPASS_MAX_PORTS			(LPASS_MAX_PORT)
 #define LPASS_MAX_MI2S_PORTS			(8)
 #define LPASS_MAX_DMA_CHANNELS			(8)
 #define LPASS_MAX_HDMI_DMA_CHANNELS		(4)
diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
index a29abe4ce436..ce4b04da1730 100644
--- a/sound/soc/qcom/qdsp6/q6afe.h
+++ b/sound/soc/qcom/qdsp6/q6afe.h
@@ -2,8 +2,9 @@
 
 #ifndef __Q6AFE_H__
 #define __Q6AFE_H__
+#include <dt-bindings/sound/qcom,q6afe.h>
 
-#define AFE_PORT_MAX		137
+#define AFE_PORT_MAX		LPASS_MAX_PORT
 
 #define MSM_AFE_PORT_TYPE_RX 0
 #define MSM_AFE_PORT_TYPE_TX 1
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 7ce08b401e31..189ed8a1a60d 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -16,7 +16,7 @@
 #include <linux/soc/qcom/apr.h>
 #include "audioreach.h"
 
-#define APM_PORT_MAX		127
+#define APM_PORT_MAX		LPASS_MAX_PORT
 #define APM_PORT_MAX_AUDIO_CHAN_CNT 8
 #define PCM_CHANNEL_NULL 0
 #define PCM_CHANNEL_FL    1	/* Front left channel. */
-- 
2.47.3


