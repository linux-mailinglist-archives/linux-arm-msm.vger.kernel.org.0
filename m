Return-Path: <linux-arm-msm+bounces-106929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2C0RL/3VAWryjwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:13:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE8750EA63
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 15:13:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2310F30BB102
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 May 2026 13:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC9073D9DA5;
	Mon, 11 May 2026 13:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RuOMmwh/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JqnjPq94"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2AB3D9028
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504479; cv=none; b=Ikk+aQimfFxKAfS2S7YnH5gY1HY731NMoRlxrCfqVA5XIxUIbUGfCHA+QQBgyabOQU+uVxM/lTeCK2ZmYGI8nZOulCIEf149GEgpEyOfnruGXGGpQ21uGvOFZeGrvR13dgGi5N3qJKY4G69Cnks2RZDJUXDJSe2E9aTgehfy9T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504479; c=relaxed/simple;
	bh=ndlNVLASGiGOeBwVBBP/S7ukxX8RNAGVsQ2+l8dJuLo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fM9hpIP8hBN8w0qv4joaqRSPryXG9CBTbJPwhWuHj5/aT7T4CINVWrLoXg1tm2xj94cmVv9N5DybhxT7ns2qm7oQhTIhGk45Sg5hEO2et+W+CVXxu09UJlKKlka7PpMTKvV9IJHVbDy0KW8agj+ZJKhMdAgBJrGuSqlbDIf76EQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RuOMmwh/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JqnjPq94; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B7FSU93333585
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=UNm2dqv9lvo
	LdktkzL3ARVsd5wCqO04+dCxrjf4gXOk=; b=RuOMmwh/BmEemWollARbLjwu6Iq
	12WuyIWee2jtKys++PPHTCUTP7AASLnW4cVwkYIboimXtA6GNXQHQG1plqiyQXR6
	FBJoMmpu9f7JHTSY+6AVJ9hFnj3nHImRByw3fiXxaaXMKeM6GXXzkYDi34Ga8HbM
	mxhFdbnt2cuFb/MO+Gs/9XMxdFyHT4nQARcOQue3jmcuB09+C3LUCgCVGihmQ+cf
	kz2YFJ9Qa800D9cTtZDW7DZ3nMeMuoajPUj2QJVrz7u3ZiHYoDamd5zExP1ldz1A
	6J+g8Afe5/R2IQfl+MWJ2gWGYQ6Y7Y0wegRhBGi6a3d3CMaDH9ocKwz/jjg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3ajgs7ds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 13:01:14 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-365ff2ab7beso5145455a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 May 2026 06:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778504473; x=1779109273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UNm2dqv9lvoLdktkzL3ARVsd5wCqO04+dCxrjf4gXOk=;
        b=JqnjPq94ugk1/s7YwZc+HGR108hSB4xnmbJjHiALNNWVkfCrMlDikcirutFmnnDaVp
         qa1/Hc9xhC4Fz7M73UWsgLKOQWkU4gyz7ipC2cycmLwNLEbZIwkJNLt8n6d3mQbJt/EB
         9OOs3dI4CgaDI0sLrUolFLg6JDJqweXuVmznScBpW0QhbdZQC3GCItZ27biu1pkbYiJP
         RPBozrppFCqGRz4BA9RoXaaMsXU+IJ9kT++LRDQIslVb/sa/PO17VoYZyS8Pwc2ENZde
         JjEPsFVvIqsCey7PmW23/4RjaD6IigHUXXSJ+rOlk1q0f5tDxPQZRBo2yuZaMEeOn0nj
         sscQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778504474; x=1779109274;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UNm2dqv9lvoLdktkzL3ARVsd5wCqO04+dCxrjf4gXOk=;
        b=XCJMIHgt5I3fCWdzjLuW4htAJjyvVwFghno0fjFk6gOMJup6MUnp4IPhwZAQ5SlCtf
         UXZehQwI8xpDN3d5v8VyLM0NAxNT/2f1QRv8PR+uqVlcTWKzu4qeqGTNHLl43rOE9vv/
         oFZ2wmXiAOzB9d32kAdEjqIX3HhzveDoqDWlMeFgN62hbf4Wc4Tdx2Y7nMr18w1BBt/B
         QLdR7tk0KwsLJR5DLzMxA1MK5vAAy5I3g74dKXP6Y0EIrY3C6wEerNOAXY3zW4D3sJBE
         EuUE0BqROu/MXYDWstnjDck22Ed7rjFlV2DHRhm4NnIiU8RdA0KXH184IKJWBS8E6xJI
         XJJQ==
X-Gm-Message-State: AOJu0YzCioeLOaleZn3KLAxcmIFfAtkuownCMSXNZqqcmp2xwn4vmXxE
	ywKhpe8MWca47kJAqtYkIFQ1GCMcRv5tqhTtr1yxuNtFtO00ZlWGxlm4vCPl9IdPKB3jaoCvjgf
	/OcrqON5PNEY1NbVR5swK4HyfY6YdTrREFUVS2+lpvnrz2McgQQ3YCwWQZtsYCrcyhKqL
X-Gm-Gg: Acq92OFRr7ZEXyV7/KGlWSCbnF19NrdTgHodR7KjLCfDIsJYkNZLgf7kuYQ7hglJctx
	pZv0jlhW6sWJIi8DRtnA/s5jxVBCWzcei45Ng3YZWq4SBCGNsZI4RHsGQu1aNDeQDTC8NmPqjNf
	N3g+o34iC2cUnlbtDg+2SqMTmqJAXlbh9SYXrM1TrT2KLA8jXzYfYq0SEmMdZb2Ks0Jy5P/PQrJ
	X+aZyLOfWxfFaw2BI3XrX2nvUNwuLkhH63kFdpBOi5dxYwHiYYi6hnMyVTqFaaBaPgShsK7B2mU
	a8gxIjNStevEURYRwlVwT9LSMdOMjSTym/x2LKoNv1SYY9ORHiMTK10joyiWDoAUHYKyBbBNN63
	qtJktglyLqtQ+DxHHUWSFwdLceqL079oa
X-Received: by 2002:a17:90b:2d8a:b0:367:e13b:f52 with SMTP id 98e67ed59e1d1-367e13b11cemr6964436a91.0.1778504472865;
        Mon, 11 May 2026 06:01:12 -0700 (PDT)
X-Received: by 2002:a17:90b:2d8a:b0:367:e13b:f52 with SMTP id 98e67ed59e1d1-367e13b11cemr6964365a91.0.1778504472127;
        Mon, 11 May 2026 06:01:12 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d625f126sm8709521a91.3.2026.05.11.06.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 06:01:11 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v5 05/16] drm/msm/registers: Add perfcntr json
Date: Mon, 11 May 2026 05:59:18 -0700
Message-ID: <20260511130017.96867-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511130017.96867-1-robin.clark@oss.qualcomm.com>
References: <20260511130017.96867-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=GfgnWwXL c=1 sm=1 tr=0 ts=6a01d31a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=U2HPg71ik5UQ_0Zuz_MA:9
 a=PDmnkIS-fa9zh8kb:21 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: qWFN-78MFD9qYX-hb0_onkvxtw_XZwp6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDE0NCBTYWx0ZWRfXx0qdYgsyQzN7
 m5Z060lNCL9+/8ycMIIWiQVmj6qgVDy4PnxsRX/hrgxt1GCjPGxRPFS6nbHZZ0jK74VvIJxPM4o
 0sTa9nWdWCYGEj3n7gm8+FjADWBTfTcTiV3Kcnxg3M6h+AoVx0F0Kxlrae2In/JbKnCH2IDwgNE
 SfeuXfkYtDp2rh0/jEGg2/GZxGDf/68ACf/oe1QRx2QF6kGbVB6nx8Ce0jP2EvzPbdgsjeFwWbZ
 2s5tikk4a8VnSAnkz0yEC7Wxtbw4sySOpZmrCmWJPJomubfdIxa1vDboZ2C9GAdWY9AgBs7y6B4
 LcOBq7xfSl1m5QMtcwU/yfiQyUqTiVxLPEB34u9+WTdVXHnyfCWBKTUxsz0yDPf0BI4N+UVHs6J
 msJXJO0xuLZStn7DL7ZG4MrXEL68uDqmxVgGsMNE4GpHgWqDbPEEVgMJW12NBuQMZNDvptUw55r
 wajXEq5sZfRjVYLqaLg==
X-Proofpoint-ORIG-GUID: qWFN-78MFD9qYX-hb0_onkvxtw_XZwp6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_03,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110144
X-Rspamd-Queue-Id: 0FE8750EA63
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	TAGGED_FROM(0.00)[bounces-106929-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Pull in perfcntr json and wire up generation of perfcntr tables.

Sync from mesa commit d2c4653ee953 ("freedreno/registers: Add gen8 perfcntrs")

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/Makefile                  |  25 +-
 drivers/gpu/drm/msm/msm_perfcntr.h            |  48 ++++
 .../msm/registers/adreno/a2xx_perfcntrs.json  | 109 ++++++++
 .../msm/registers/adreno/a5xx_perfcntrs.json  | 128 ++++++++++
 .../msm/registers/adreno/a6xx_perfcntrs.json  | 105 ++++++++
 .../msm/registers/adreno/a7xx_perfcntrs.json  | 228 +++++++++++++++++
 .../msm/registers/adreno/a8xx_perfcntrs.json  | 240 ++++++++++++++++++
 7 files changed, 882 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.h
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a2xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a5xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index ce00cfb0a875..337634e7e247 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -176,6 +176,11 @@ quiet_cmd_headergen = GENHDR  $@
       cmd_headergen = mkdir -p $(obj)/generated && $(PYTHON3) $(src)/registers/gen_header.py \
 		      $(headergen-opts) --rnn $(src)/registers --xml $< c-defines > $@
 
+# TODO how to do this for a2xx/a5xx which have different .xml arg?
+quiet_cmd_headergen_json = GENHDRJSN  $@
+      cmd_headergen_json = mkdir -p $(obj)/generated && $(PYTHON3) $(src)/registers/gen_header.py \
+		      $(headergen-opts) --rnn $(src)/registers --xml $(filter %.xml,$^) perfcntrs --json $< > $@
+
 $(obj)/generated/%.xml.h: $(src)/registers/adreno/%.xml \
 		$(src)/registers/adreno/adreno_common.xml \
 		$(src)/registers/adreno/adreno_pm4.xml \
@@ -192,6 +197,24 @@ $(obj)/generated/%.xml.h: $(src)/registers/display/%.xml \
 		FORCE
 	$(call if_changed,headergen)
 
+ADRENO_PERFCNTRS =
+
+define adreno_perfcntrs
+ADRENO_PERFCNTRS += generated/$(1)_perfcntrs.json.c
+$$(obj)/generated/$(1)_perfcntrs.json.c: $$(src)/registers/adreno/$(1)_perfcntrs.json \
+		$$(src)/registers/adreno/$(2).xml \
+		FORCE
+	$$(call if_changed,headergen_json)
+endef
+
+$(eval $(call adreno_perfcntrs,a2xx,a2xx))
+$(eval $(call adreno_perfcntrs,a5xx,a5xx))
+$(eval $(call adreno_perfcntrs,a6xx,a6xx))
+$(eval $(call adreno_perfcntrs,a7xx,a6xx))
+$(eval $(call adreno_perfcntrs,a8xx,a6xx))
+
+adreno-y += $(ADRENO_PERFCNTRS:.c=.o)
+
 ADRENO_HEADERS = \
 	generated/a2xx.xml.h \
 	generated/a3xx.xml.h \
@@ -226,4 +249,4 @@ DISPLAY_HEADERS = \
 $(addprefix $(obj)/,$(adreno-y)): $(addprefix $(obj)/,$(ADRENO_HEADERS))
 $(addprefix $(obj)/,$(msm-display-y)): $(addprefix $(obj)/,$(DISPLAY_HEADERS))
 
-targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS)
+targets += $(ADRENO_HEADERS) $(DISPLAY_HEADERS) $(ADRENO_PERFCNTRS)
diff --git a/drivers/gpu/drm/msm/msm_perfcntr.h b/drivers/gpu/drm/msm/msm_perfcntr.h
new file mode 100644
index 000000000000..305dcde15c5e
--- /dev/null
+++ b/drivers/gpu/drm/msm/msm_perfcntr.h
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __MSM_PERFCNTR_H__
+#define __MSM_PERFCNTR_H__
+
+#include "linux/array_size.h"
+
+#include "adreno_common.xml.h"
+
+/*
+ * This is a subset of the tables used by mesa.  We don't need to
+ * enumerate the countables on the kernel side.
+ */
+
+/* Describes a single counter: */
+struct msm_perfcntr_counter {
+   /* offset of the SELect register to choose what to count: */
+   unsigned select_reg;
+   /* additional SEL regs to enable slice counters (gen8+) */
+   unsigned slice_select_regs[2];
+   /* offset of the lo/hi 32b to read current counter value: */
+   unsigned counter_reg_lo;
+   unsigned counter_reg_hi;
+   /* TODO some counters have enable/clear registers */
+};
+
+/* Describes an entire counter group: */
+struct msm_perfcntr_group {
+   const char *name;
+   enum adreno_pipe pipe;
+   unsigned num_counters;
+   const struct msm_perfcntr_counter *counters;
+};
+
+#define GROUP(_name, _pipe, _counters, _countables) {                          \
+      .name = _name,                                                           \
+      .pipe = _pipe,                                                           \
+      .num_counters = ARRAY_SIZE(_counters),                                   \
+      .counters = _counters,                                                   \
+   }
+
+#define fd_perfcntr_counter msm_perfcntr_counter
+#define fd_perfcntr_group   msm_perfcntr_group
+
+#endif /* __MSM_PERFCNTR_H__ */
diff --git a/drivers/gpu/drm/msm/registers/adreno/a2xx_perfcntrs.json b/drivers/gpu/drm/msm/registers/adreno/a2xx_perfcntrs.json
new file mode 100644
index 000000000000..8095345ffd8e
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/a2xx_perfcntrs.json
@@ -0,0 +1,109 @@
+{
+    "chip": "A2XX",
+    "groups": [
+        {
+            "name": "CP",
+            "num": 1,
+            "select": "CP_PERFCOUNTER_SELECT",
+            "counter_lo": "CP_PERFCOUNTER_LO",
+            "counter_hi": "CP_PERFCOUNTER_HI",
+            "countable_type": "a2xx_cp_perfcount_sel"
+        },
+        {
+            "name": "PA_SU",
+            "num": 4,
+            "select": "PA_SU_PERFCOUNTER{}_SELECT",
+            "counter_lo": "PA_SU_PERFCOUNTER{}_LOW",
+            "counter_hi": "PA_SU_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_su_perfcnt_select"
+        },
+        {
+            "name": "PA_SC",
+            "num": 1,
+            "select": "PA_SC_PERFCOUNTER{}_SELECT",
+            "counter_lo": "PA_SC_PERFCOUNTER{}_LOW",
+            "counter_hi": "PA_SC_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_sc_perfcnt_select"
+        },
+        {
+            "name": "VGT",
+            "num": 4,
+            "select": "VGT_PERFCOUNTER{}_SELECT",
+            "counter_lo": "VGT_PERFCOUNTER{}_LOW",
+            "counter_hi": "VGT_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_vgt_perfcount_select"
+        },
+        {
+            "name": "TCR",
+            "num": 2,
+            "select": "TCR_PERFCOUNTER{}_SELECT",
+            "counter_lo": "TCR_PERFCOUNTER{}_LOW",
+            "counter_hi": "TCR_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_tcr_perfcount_select"
+        },
+        {
+            "name": "TP0",
+            "num": 2,
+            "select": "TP0_PERFCOUNTER{}_SELECT",
+            "counter_lo": "TP0_PERFCOUNTER{}_LOW",
+            "counter_hi": "TP0_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_tp_perfcount_select"
+        },
+        {
+            "name": "TCM",
+            "num": 2,
+            "select": "TCM_PERFCOUNTER{}_SELECT",
+            "counter_lo": "TCM_PERFCOUNTER{}_LOW",
+            "counter_hi": "TCM_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_tcm_perfcount_select"
+        },
+        {
+            "name": "TCF",
+            "num": 12,
+            "select": "TCF_PERFCOUNTER{}_SELECT",
+            "counter_lo": "TCF_PERFCOUNTER{}_LOW",
+            "counter_hi": "TCF_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_tcf_perfcount_select"
+        },
+        {
+            "name": "SQ",
+            "num": 4,
+            "select": "SQ_PERFCOUNTER{}_SELECT",
+            "counter_lo": "SQ_PERFCOUNTER{}_LOW",
+            "counter_hi": "SQ_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_sq_perfcnt_select"
+        },
+        {
+            "name": "SX",
+            "num": 1,
+            "select": "SX_PERFCOUNTER{}_SELECT",
+            "counter_lo": "SX_PERFCOUNTER{}_LOW",
+            "counter_hi": "SX_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_sx_perfcnt_select"
+        },
+        {
+            "name": "MH",
+            "num": 2,
+            "select": "MH_PERFCOUNTER{}_SELECT",
+            "counter_lo": "MH_PERFCOUNTER{}_LOW",
+            "counter_hi": "MH_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_mh_perfcnt_select"
+        },
+        {
+            "name": "RBBM",
+            "num": 2,
+            "select": "RBBM_PERFCOUNTER{}_SELECT",
+            "counter_lo": "RBBM_PERFCOUNTER{}_LO",
+            "counter_hi": "RBBM_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_rbbm_perfcount1_sel"
+        },
+        {
+            "name": "RB",
+            "num": 4,
+            "select": "RB_PERFCOUNTER{}_SELECT",
+            "counter_lo": "RB_PERFCOUNTER{}_LOW",
+            "counter_hi": "RB_PERFCOUNTER{}_HI",
+            "countable_type": "a2xx_rb_perfcnt_select"
+        }
+    ]
+}
diff --git a/drivers/gpu/drm/msm/registers/adreno/a5xx_perfcntrs.json b/drivers/gpu/drm/msm/registers/adreno/a5xx_perfcntrs.json
new file mode 100644
index 000000000000..d95503543f94
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/a5xx_perfcntrs.json
@@ -0,0 +1,128 @@
+{
+    "chip": "A5XX",
+    "groups": [
+        {
+            "name": "CP",
+            "num": 8,
+            "reserved": [ 0 ],
+            "select": "CP_PERFCTR_CP_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_CP_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_CP_{}_HI",
+            "countable_type": "a5xx_cp_perfcounter_select"
+        },
+        {
+            "name": "CCU",
+            "num": 4,
+            "select": "RB_PERFCTR_CCU_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_CCU_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_CCU_{}_HI",
+            "countable_type": "a5xx_ccu_perfcounter_select"
+        },
+        {
+            "name": "TSE",
+            "num": 4,
+            "select": "GRAS_PERFCTR_TSE_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_TSE_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_TSE_{}_HI",
+            "countable_type": "a5xx_tse_perfcounter_select"
+        },
+        {
+            "name": "RAS",
+            "num": 4,
+            "select": "GRAS_PERFCTR_RAS_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_RAS_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_RAS_{}_HI",
+            "countable_type": "a5xx_ras_perfcounter_select"
+        },
+        {
+            "name": "LRZ",
+            "num": 4,
+            "select": "GRAS_PERFCTR_LRZ_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_LRZ_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_LRZ_{}_HI",
+            "countable_type": "a5xx_lrz_perfcounter_select"
+        },
+        {
+            "name": "HLSQ",
+            "num": 8,
+            "select": "HLSQ_PERFCTR_HLSQ_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_HLSQ_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_HLSQ_{}_HI",
+            "countable_type": "a5xx_hlsq_perfcounter_select"
+        },
+        {
+            "name": "PC",
+            "num": 8,
+            "select": "PC_PERFCTR_PC_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_PC_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_PC_{}_HI",
+            "countable_type": "a5xx_pc_perfcounter_select"
+        },
+        {
+            "name": "RB",
+            "num": 8,
+            "select": "RB_PERFCTR_RB_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_RB_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_RB_{}_HI",
+            "countable_type": "a5xx_rb_perfcounter_select"
+        },
+        {
+            "name": "RBBM",
+            "num": 4,
+            "reserved": [ 0 ],
+            "select": "RBBM_PERFCTR_RBBM_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_RBBM_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_RBBM_{}_HI",
+            "countable_type": "a5xx_rbbm_perfcounter_select"
+        },
+        {
+            "name": "SP",
+            "num": 12,
+            "reserved": [ 0 ],
+            "select": "SP_PERFCTR_SP_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_SP_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_SP_{}_HI",
+            "countable_type": "a5xx_sp_perfcounter_select"
+        },
+        {
+            "name": "TP",
+            "num": 8,
+            "select": "TPL1_PERFCTR_TP_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_TP_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_TP_{}_HI",
+            "countable_type": "a5xx_tp_perfcounter_select"
+        },
+        {
+            "name": "UCHE",
+            "num": 8,
+            "select": "UCHE_PERFCTR_UCHE_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_UCHE_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_UCHE_{}_HI",
+            "countable_type": "a5xx_uche_perfcounter_select"
+        },
+        {
+            "name": "VFD",
+            "num": 8,
+            "select": "VFD_PERFCTR_VFD_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_VFD_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_VFD_{}_HI",
+            "countable_type": "a5xx_vfd_perfcounter_select"
+        },
+        {
+            "name": "VPC",
+            "num": 4,
+            "select": "VPC_PERFCTR_VPC_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_VPC_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_VPC_{}_HI",
+            "countable_type": "a5xx_vpc_perfcounter_select"
+        },
+        {
+            "name": "VSC",
+            "num": 2,
+            "select": "VSC_PERFCTR_VSC_SEL_{}",
+            "counter_lo": "RBBM_PERFCTR_VSC_{}_LO",
+            "counter_hi": "RBBM_PERFCTR_VSC_{}_HI",
+            "countable_type": "a5xx_vsc_perfcounter_select"
+        }
+    ]
+}
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json b/drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
new file mode 100644
index 000000000000..8bb31820479e
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.json
@@ -0,0 +1,105 @@
+{
+    "chip": "A6XX",
+    "groups": [
+        {
+            "name": "CP",
+            "num": 14,
+            "reserved": [ 0 ],
+            "select": "CP_PERFCTR_CP_SEL",
+            "counter": "RBBM_PERFCTR_CP",
+            "countable_type": "a6xx_cp_perfcounter_select"
+        },
+        {
+            "name": "CCU",
+            "num": 5,
+            "select": "RB_PERFCTR_CCU_SEL",
+            "counter": "RBBM_PERFCTR_CCU",
+            "countable_type": "a6xx_ccu_perfcounter_select"
+        },
+        {
+            "name": "TSE",
+            "num": 4,
+            "select": "GRAS_PERFCTR_TSE_SEL",
+            "counter": "RBBM_PERFCTR_TSE",
+            "countable_type": "a6xx_tse_perfcounter_select"
+        },
+        {
+            "name": "RAS",
+            "num": 4,
+            "select": "GRAS_PERFCTR_RAS_SEL",
+            "counter": "RBBM_PERFCTR_RAS",
+            "countable_type": "a6xx_ras_perfcounter_select"
+        },
+        {
+            "name": "LRZ",
+            "num": 4,
+            "select": "GRAS_PERFCTR_LRZ_SEL",
+            "counter": "RBBM_PERFCTR_LRZ",
+            "countable_type": "a6xx_lrz_perfcounter_select"
+        },
+        {
+            "name": "HLSQ",
+            "num": 6,
+            "select": "HLSQ_PERFCTR_HLSQ_SEL",
+            "counter": "RBBM_PERFCTR_HLSQ",
+            "countable_type": "a6xx_hlsq_perfcounter_select"
+        },
+        {
+            "name": "PC",
+            "num": 8,
+            "select": "PC_PERFCTR_PC_SEL",
+            "counter": "RBBM_PERFCTR_PC",
+            "countable_type": "a6xx_pc_perfcounter_select"
+        },
+        {
+            "name": "RB",
+            "num": 8,
+            "select": "RB_PERFCTR_RB_SEL",
+            "counter": "RBBM_PERFCTR_RB",
+            "countable_type": "a6xx_rb_perfcounter_select"
+        },
+        {
+            "name": "SP",
+            "num": 24,
+            "reserved": [ 0 ],
+            "select": "SP_PERFCTR_SP_SEL",
+            "counter": "RBBM_PERFCTR_SP",
+            "countable_type": "a6xx_sp_perfcounter_select"
+        },
+        {
+            "name": "TP",
+            "num": 12,
+            "select": "TPL1_PERFCTR_TP_SEL",
+            "counter": "RBBM_PERFCTR_TP",
+            "countable_type": "a6xx_tp_perfcounter_select"
+        },
+        {
+            "name": "UCHE",
+            "num": 12,
+            "select": "UCHE_PERFCTR_UCHE_SEL",
+            "counter": "RBBM_PERFCTR_UCHE",
+            "countable_type": "a6xx_uche_perfcounter_select"
+        },
+        {
+            "name": "VFD",
+            "num": 8,
+            "select": "VFD_PERFCTR_VFD_SEL",
+            "counter": "RBBM_PERFCTR_VFD",
+            "countable_type": "a6xx_vfd_perfcounter_select"
+        },
+        {
+            "name": "VPC",
+            "num": 6,
+            "select": "VPC_PERFCTR_VPC_SEL",
+            "counter": "RBBM_PERFCTR_VPC",
+            "countable_type": "a6xx_vpc_perfcounter_select"
+        },
+        {
+            "name": "VSC",
+            "num": 2,
+            "select": "VSC_PERFCTR_VSC_SEL",
+            "counter": "RBBM_PERFCTR_VSC",
+            "countable_type": "a6xx_vsc_perfcounter_select"
+        }
+    ]
+}
diff --git a/drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json b/drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
new file mode 100644
index 000000000000..e60aab1862ec
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.json
@@ -0,0 +1,228 @@
+{
+    "chip": "A7XX",
+    "groups": [
+        {
+            "name": "CP",
+            "num": 14,
+            "reserved": [ 0 ],
+            "select": "CP_PERFCTR_CP_SEL",
+            "counter": "RBBM_PERFCTR_CP",
+            "countable_type": "a7xx_cp_perfcounter_select"
+        },
+        {
+            "name": "RBBM",
+            "num": 4,
+            "select": "RBBM_PERFCTR_RBBM_SEL",
+            "counter": "RBBM_PERFCTR_RBBM",
+            "countable_type": "a7xx_rbbm_perfcounter_select"
+        },
+        {
+            "name": "PC",
+            "pipe": "BR",
+            "num": 8,
+            "select": "PC_PERFCTR_PC_SEL",
+            "counter": "RBBM_PERFCTR_PC",
+            "countable_type": "a7xx_pc_perfcounter_select"
+        },
+        {
+            "name": "VFD",
+            "pipe": "BR",
+            "num": 8,
+            "select": "VFD_PERFCTR_VFD_SEL",
+            "counter": "RBBM_PERFCTR_VFD",
+            "countable_type": "a7xx_vfd_perfcounter_select"
+        },
+        {
+            "name": "HLSQ",
+            "pipe": "BR",
+            "num": 6,
+            "select": "SP_PERFCTR_HLSQ_SEL",
+            "counter": "RBBM_PERFCTR_HLSQ",
+            "countable_type": "a7xx_hlsq_perfcounter_select"
+        },
+        {
+            "name": "VPC",
+            "pipe": "BR",
+            "num": 6,
+            "select": "VPC_PERFCTR_VPC_SEL",
+            "counter": "RBBM_PERFCTR_VPC",
+            "countable_type": "a7xx_vpc_perfcounter_select"
+        },
+        {
+            "name": "TSE",
+            "pipe": "BR",
+            "num": 4,
+            "select": "GRAS_PERFCTR_TSE_SEL",
+            "counter": "RBBM_PERFCTR_TSE",
+            "countable_type": "a7xx_tse_perfcounter_select"
+        },
+        {
+            "name": "RAS",
+            "pipe": "BR",
+            "num": 4,
+            "select": "GRAS_PERFCTR_RAS_SEL",
+            "counter": "RBBM_PERFCTR_RAS",
+            "countable_type": "a7xx_ras_perfcounter_select"
+        },
+        {
+            "name": "UCHE",
+            "num": 12,
+            "select": "UCHE_PERFCTR_UCHE_SEL",
+            "counter": "RBBM_PERFCTR_UCHE",
+            "countable_type": "a7xx_uche_perfcounter_select"
+        },
+        {
+            "name": "TP",
+            "pipe": "BR",
+            "num": 12,
+            "select": "TPL1_PERFCTR_TP_SEL",
+            "counter": "RBBM_PERFCTR_TP",
+            "countable_type": "a7xx_tp_perfcounter_select"
+        },
+        {
+            "name": "SP",
+            "pipe": "BR",
+            "num": 24,
+            "select": "SP_PERFCTR_SP_SEL",
+            "counter": "RBBM_PERFCTR_SP",
+            "countable_type": "a7xx_sp_perfcounter_select"
+        },
+        {
+            "name": "RB",
+            "num": 8,
+            "select": "RB_PERFCTR_RB_SEL",
+            "counter": "RBBM_PERFCTR_RB",
+            "countable_type": "a7xx_rb_perfcounter_select"
+        },
+        {
+            "name": "VSC",
+            "num": 2,
+            "select": "VSC_PERFCTR_VSC_SEL",
+            "counter": "RBBM_PERFCTR_VSC",
+            "countable_type": "a7xx_vsc_perfcounter_select"
+        },
+        {
+            "name": "CCU",
+            "num": 5,
+            "select": "RB_PERFCTR_CCU_SEL",
+            "counter": "RBBM_PERFCTR_CCU",
+            "countable_type": "a7xx_ccu_perfcounter_select"
+        },
+        {
+            "name": "LRZ",
+            "pipe": "BR",
+            "num": 4,
+            "select": "GRAS_PERFCTR_LRZ_SEL",
+            "counter": "RBBM_PERFCTR_LRZ",
+            "countable_type": "a7xx_lrz_perfcounter_select"
+        },
+        {
+            "name": "CMP",
+            "num": 4,
+            "select": "RB_PERFCTR_CMP_SEL",
+            "counter": "RBBM_PERFCTR_CMP",
+            "countable_type": "a7xx_cmp_perfcounter_select"
+        },
+        {
+            "name": "UFC",
+            "pipe": "BR",
+            "num": 4,
+            "select": "RB_PERFCTR_UFC_SEL",
+            "counter": "RBBM_PERFCTR_UFC",
+            "countable_type": "a7xx_ufc_perfcounter_select"
+        },
+        {
+            "name": "BV_CP",
+            "num": 7,
+            "select": "CP_BV_PERFCTR_CP_SEL",
+            "counter": "RBBM_PERFCTR2_CP",
+            "countable_type": "a7xx_cp_perfcounter_select"
+        },
+        {
+            "name": "BV_PC",
+            "pipe": "BV",
+            "num": 8,
+            "select_offset": 8,
+            "select": "PC_PERFCTR_PC_SEL",
+            "counter": "RBBM_PERFCTR_BV_PC",
+            "countable_type": "a7xx_pc_perfcounter_select"
+        },
+        {
+            "name": "BV_VFD",
+            "pipe": "BV",
+            "num": 8,
+            "select_offset": 8,
+            "select": "VFD_PERFCTR_VFD_SEL",
+            "counter": "RBBM_PERFCTR_BV_VFD",
+            "countable_type": "a7xx_vfd_perfcounter_select"
+        },
+        {
+            "name": "BV_VPC",
+            "pipe": "BV",
+            "num": 6,
+            "select_offset": 6,
+            "select": "VPC_PERFCTR_VPC_SEL",
+            "counter": "RBBM_PERFCTR_BV_VPC",
+            "countable_type": "a7xx_vpc_perfcounter_select"
+        },
+        {
+            "name": "BV_TP",
+            "pipe": "BV",
+            "num": 6,
+            "select_offset": 12,
+            "select": "TPL1_PERFCTR_TP_SEL",
+            "counter": "RBBM_PERFCTR2_TP",
+            "countable_type": "a7xx_tp_perfcounter_select"
+        },
+        {
+            "name": "BV_SP",
+            "pipe": "BV",
+            "num": 12,
+            "select_offset": 24,
+            "select": "SP_PERFCTR_SP_SEL",
+            "counter": "RBBM_PERFCTR2_SP",
+            "countable_type": "a7xx_sp_perfcounter_select"
+        },
+        {
+            "name": "BV_UFC",
+            "pipe": "BV",
+            "num": 2,
+            "select_offset": 4,
+            "select": "RB_PERFCTR_UFC_SEL",
+            "counter": "RBBM_PERFCTR2_UFC",
+            "countable_type": "a7xx_ufc_perfcounter_select"
+        },
+        {
+            "name": "BV_TSE",
+            "pipe": "BV",
+            "num": 4,
+            "select": "GRAS_PERFCTR_TSE_SEL",
+            "counter": "RBBM_PERFCTR_BV_TSE",
+            "countable_type": "a7xx_tse_perfcounter_select"
+        },
+        {
+            "name": "BV_RAS",
+            "pipe": "BV",
+            "num": 4,
+            "select": "GRAS_PERFCTR_RAS_SEL",
+            "counter": "RBBM_PERFCTR_BV_RAS",
+            "countable_type": "a7xx_ras_perfcounter_select"
+        },
+        {
+            "name": "BV_LRZ",
+            "pipe": "BV",
+            "num": 4,
+            "select": "GRAS_PERFCTR_LRZ_SEL",
+            "counter": "RBBM_PERFCTR_BV_LRZ",
+            "countable_type": "a7xx_lrz_perfcounter_select"
+        },
+        {
+            "name": "BV_HLSQ",
+            "pipe": "BV",
+            "num": 6,
+            "select": "SP_PERFCTR_HLSQ_SEL",
+            "counter": "RBBM_PERFCTR2_HLSQ",
+            "countable_type": "a7xx_hlsq_perfcounter_select"
+        }
+    ]
+}
diff --git a/drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json b/drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
new file mode 100644
index 000000000000..503b113df397
--- /dev/null
+++ b/drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.json
@@ -0,0 +1,240 @@
+{
+    "chip": "A8XX",
+    "groups": [
+        {
+            "name": "CP",
+            "num": 14,
+            "reserved": [ 0 ],
+            "select": "CP_PERFCTR_CP_SEL",
+            "counter": "RBBM_PERFCTR_CP",
+            "countable_type": "a8xx_cp_perfcounter_select"
+        },
+        {
+            "name": "RBBM",
+            "num": 4,
+            "select": "RBBM_PERFCTR_RBBM_SEL",
+            "slice_select": [ "RBBM_SLICE_PERFCTR_RBBM_SEL" ],
+            "counter": "RBBM_PERFCTR_RBBM",
+            "countable_type": "a8xx_rbbm_perfcounter_select"
+        },
+        {
+            "name": "PC",
+            "pipe": "BR",
+            "num": 8,
+            "select": "PC_PERFCTR_PC_SEL",
+            "slice_select": [ "PC_SLICE_PERFCTR_PC_SEL" ],
+            "counter": "RBBM_PERFCTR_PC",
+            "countable_type": "a8xx_pc_perfcounter_select"
+        },
+        {
+            "name": "VFD",
+            "pipe": "BR",
+            "num": 8,
+            "select": "VFD_PERFCTR_VFD_SEL",
+            "counter": "RBBM_PERFCTR_VFD",
+            "countable_type": "a8xx_vfd_perfcounter_select"
+        },
+        {
+            "name": "HLSQ",
+            "pipe": "BR",
+            "num": 6,
+            "select": "SP_PERFCTR_HLSQ_SEL",
+            "slice_select": [ "SP_PERFCTR_HLSQ_SEL_2" ],
+            "counter": "RBBM_PERFCTR_HLSQ",
+            "countable_type": "a8xx_hlsq_perfcounter_select"
+        },
+        {
+            "name": "VPC",
+            "pipe": "BR",
+            "num": 6,
+            "select": "VPC_PERFCTR_VPC_SEL",
+            "slice_select": [ "VPC_PERFCTR_VPC_SEL_1", "VPC_PERFCTR_VPC_SEL_2" ],
+            "counter": "RBBM_PERFCTR_VPC",
+            "countable_type": "a8xx_vpc_perfcounter_select"
+        },
+        {
+            "name": "TSE",
+            "pipe": "BR",
+            "num": 4,
+            "select": "GRAS_PERFCTR_TSE_SEL",
+            "slice_select": [ "GRAS_PERFCTR_TSEFE_SEL" ],
+            "counter": "RBBM_PERFCTR_TSE",
+            "countable_type": "a8xx_tse_perfcounter_select"
+        },
+        {
+            "name": "RAS",
+            "pipe": "BR",
+            "num": 4,
+            "select": "GRAS_PERFCTR_RAS_SEL",
+            "counter": "RBBM_PERFCTR_RAS",
+            "countable_type": "a8xx_ras_perfcounter_select"
+        },
+        {
+            "name": "UCHE",
+            "num": 12,
+            "select": "UCHE_PERFCTR_UCHE_SEL",
+            "counter": "RBBM_PERFCTR_UCHE",
+            "countable_type": "a8xx_uche_perfcounter_select"
+        },
+        {
+            "name": "TP",
+            "pipe": "BR",
+            "num": 12,
+            "select": "TPL1_PERFCTR_TP_SEL",
+            "counter": "RBBM_PERFCTR_TP",
+            "countable_type": "a8xx_tp_perfcounter_select"
+        },
+        {
+            "name": "SP",
+            "pipe": "BR",
+            "num": 24,
+            "select": "SP_PERFCTR_SP_SEL",
+            "counter": "RBBM_PERFCTR_SP",
+            "countable_type": "a8xx_sp_perfcounter_select"
+        },
+        {
+            "name": "RB",
+            "pipe": "BR",
+            "num": 8,
+            "select": "RB_PERFCTR_RB_SEL",
+            "counter": "RBBM_PERFCTR_RB",
+            "countable_type": "a8xx_rb_perfcounter_select"
+        },
+        {
+            "name": "VSC",
+            "num": 2,
+            "select": "VSC_PERFCTR_VSC_SEL",
+            "counter": "RBBM_PERFCTR_VSC",
+            "countable_type": "a8xx_vsc_perfcounter_select"
+        },
+        {
+            "name": "CCU",
+            "pipe": "BR",
+            "num": 5,
+            "select": "RB_PERFCTR_CCU_SEL",
+            "counter": "RBBM_PERFCTR_CCU",
+            "countable_type": "a8xx_ccu_perfcounter_select"
+        },
+        {
+            "name": "LRZ",
+            "pipe": "BR",
+            "num": 4,
+            "select": "GRAS_PERFCTR_LRZ_SEL",
+            "counter": "RBBM_PERFCTR_LRZ",
+            "countable_type": "a8xx_lrz_perfcounter_select"
+        },
+        {
+            "name": "CMP",
+            "num": 4,
+            "select": "RB_PERFCTR_CMP_SEL",
+            "counter": "RBBM_PERFCTR_CMP",
+            "countable_type": "a8xx_cmp_perfcounter_select"
+        },
+        {
+            "name": "UFC",
+            "pipe": "BR",
+            "num": 4,
+            "select": "RB_PERFCTR_UFC_SEL",
+            "counter": "RBBM_PERFCTR_UFC",
+            "countable_type": "a8xx_ufc_perfcounter_select"
+        },
+        {
+            "name": "BV_CP",
+            "num": 7,
+            "select_offset": 14,
+            "select": "CP_PERFCTR_CP_SEL",
+            "counter": "RBBM_PERFCTR2_CP",
+            "countable_type": "a8xx_cp_perfcounter_select"
+        },
+        {
+            "name": "BV_PC",
+            "pipe": "BV",
+            "num": 8,
+            "select_offset": 8,
+            "select": "PC_PERFCTR_PC_SEL",
+            "slice_select": [ "PC_SLICE_PERFCTR_PC_SEL" ],
+            "counter": "RBBM_PERFCTR_BV_PC",
+            "countable_type": "a8xx_pc_perfcounter_select"
+        },
+        {
+            "name": "BV_VFD",
+            "pipe": "BV",
+            "num": 8,
+            "select_offset": 8,
+            "select": "VFD_PERFCTR_VFD_SEL",
+            "counter": "RBBM_PERFCTR_BV_VFD",
+            "countable_type": "a8xx_vfd_perfcounter_select"
+        },
+        {
+            "name": "BV_VPC",
+            "pipe": "BV",
+            "num": 6,
+            "select_offset": 6,
+            "select": "VPC_PERFCTR_VPC_SEL",
+            "slice_select": [ "VPC_PERFCTR_VPC_SEL_1", "VPC_PERFCTR_VPC_SEL_2" ],
+            "counter": "RBBM_PERFCTR_BV_VPC",
+            "countable_type": "a8xx_vpc_perfcounter_select"
+        },
+        {
+            "name": "BV_TP",
+            "pipe": "BV",
+            "num": 8,
+            "select_offset": 12,
+            "select": "TPL1_PERFCTR_TP_SEL",
+            "counter": "RBBM_PERFCTR2_TP",
+            "countable_type": "a8xx_tp_perfcounter_select"
+        },
+        {
+            "name": "BV_SP",
+            "pipe": "BV",
+            "num": 12,
+            "select_offset": 24,
+            "select": "SP_PERFCTR_SP_SEL",
+            "counter": "RBBM_PERFCTR2_SP",
+            "countable_type": "a8xx_sp_perfcounter_select"
+        },
+        {
+            "name": "BV_UFC",
+            "pipe": "BV",
+            "num": 2,
+            "select_offset": 4,
+            "select": "RB_PERFCTR_UFC_SEL",
+            "counter": "RBBM_PERFCTR2_UFC",
+            "countable_type": "a8xx_ufc_perfcounter_select"
+        },
+        {
+            "name": "BV_TSE",
+            "pipe": "BV",
+            "num": 4,
+            "select": "GRAS_PERFCTR_TSE_SEL",
+            "slice_select": [ "GRAS_PERFCTR_TSEFE_SEL" ],
+            "counter": "RBBM_PERFCTR_BV_TSE",
+            "countable_type": "a8xx_tse_perfcounter_select"
+        },
+        {
+            "name": "BV_RAS",
+            "pipe": "BV",
+            "num": 4,
+            "select": "GRAS_PERFCTR_RAS_SEL",
+            "counter": "RBBM_PERFCTR_BV_RAS",
+            "countable_type": "a8xx_ras_perfcounter_select"
+        },
+        {
+            "name": "BV_LRZ",
+            "pipe": "BV",
+            "num": 4,
+            "select": "GRAS_PERFCTR_LRZ_SEL",
+            "counter": "RBBM_PERFCTR_BV_LRZ",
+            "countable_type": "a8xx_lrz_perfcounter_select"
+        },
+        {
+            "name": "BV_HLSQ",
+            "pipe": "BV",
+            "num": 6,
+            "select": "SP_PERFCTR_HLSQ_SEL",
+            "slice_select": [ "SP_PERFCTR_HLSQ_SEL_2" ],
+            "counter": "RBBM_PERFCTR2_HLSQ",
+            "countable_type": "a8xx_hlsq_perfcounter_select"
+        }
+    ]
+}
-- 
2.54.0


