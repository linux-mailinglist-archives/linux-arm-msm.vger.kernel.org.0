Return-Path: <linux-arm-msm+bounces-105373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JBQM/dg82lT1wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:02:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDC04A3CE0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 16:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C00C301BA67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Apr 2026 14:02:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA84C42DFF0;
	Thu, 30 Apr 2026 14:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L5ozEa43";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B0c3LH3L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE4640F8C3
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777557724; cv=none; b=avAYTdoSiVoOgs9oF2TdQ+Nk+KJFW+MoI+1/bQMzDMFpkiBViLLXpyaCGVozf7YGWxeanz/MKuuWi7NrV+ByqdTpjkjxXGlQLhz3xTN9Qne5YWjFtQx21ym6OLV/SZ/7RXqp+Y5rPRCxaig3zKc7GSlaJSvQocl34BNEREBL13s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777557724; c=relaxed/simple;
	bh=iRqdUt0yocz/+7auDO3oR6q8zPntvhLalwYqwpTPTUE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OcNCEcoV4y1KL0Yg74yeWrGJDu7bR/ZPwg+j04WOjnEsO6G4PfWCMQXuTnU7YA0UhApObkf1W1TGhNKFEXAKsUxt/6NvulC4iLZqQTlQrFozwGRW27ifFRFUeEuhnRjCmQ6HK6doCjLHZRR5+svFtV3+yw4nFdLECWqWKF5VDQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L5ozEa43; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B0c3LH3L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63UBk6bT1820434
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:01:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UZKQwael60tdVgSNo4KVfI2yt0jn4K+0eYN
	AvuvmDlk=; b=L5ozEa43L4tvU/Zje5gH07kE24miikviYHWDUdJZgsDDvI8PagF
	C0glsopCbpnikButh1qzLG05TdDVPhctG6IqixiBZRdtLdJWlzwwSygIld5/OH6T
	0KWxqZeOWGPnxLuiceyORyIGw0gKdCohkko8bk8FF3OYq25f3k1CmtJKRU/VCrvA
	tJUKWZ3LSr8xKRyC5xHnYZLApgzX8UJ3Pf83gevqcHbmLOgcE3MOAk9agg5IZez4
	7ecO28a3qJARLWT1il9WxunxvzNNSakmn9EMZA38SpXKi0HI4EB408r0KdLoQy/P
	xVzHbsDlCMjwHW4Dvx+Id6/f6Ott2dINlFQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv6gern57-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 14:01:58 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82cf8dcd079so705686b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Apr 2026 07:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777557718; x=1778162518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UZKQwael60tdVgSNo4KVfI2yt0jn4K+0eYNAvuvmDlk=;
        b=B0c3LH3LNJtF+8Hem7AN04Nctq92ZlwpPvRm3FsHRm8ircuGsJLZ6yeGGW605EuWzZ
         OAYmi73sAXczXSzgsNm/fu4AJ4OHErgLmfBstmY6wLG2FHYZ/DyQDqzj+sBEsQ7ztbI2
         1g6pNTbj0S+GrSX5gvRNB0napCh1CTmbN/rU4sarcNAkP2QZU/l6Q7iw0pQVjZr+8M7x
         LqnEl9Cl8sVQGytmyhqKGX1i7R/6I85J05a/NFPqQm5cM3ZXA6a1RDjlwkcVvPwjYJCZ
         pLdoFK1DckZfo4OuTPeZcv1IZ9N22/0xS9vyBomGQijT30HgTCyP9loWduXqgxmWQDi+
         QKbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777557718; x=1778162518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UZKQwael60tdVgSNo4KVfI2yt0jn4K+0eYNAvuvmDlk=;
        b=X79z/ILYre2YV+/XUXwCdNbs2bNiRlgNT7VFTYBUjMLguL8twZvy/gV0sSJ41W75Kh
         7zeNzqsjAJ+r5YsmTrWB/U4XGKXFuPWCwx4qGpzGa+Q7rfwPUx5YubtaHiSwSiybQaao
         BGjm6gE1Gv8IjtdNeAVKnMJ/g4FWlX4512LEWSApmjiN2lf2/1yV57ETBQyBxcCWW1Xv
         OtqOCbsboZNMX/MRm5C+kl4xUgj9rZIfmfPUGAXjWWqTIZX5cfbq4CsJFvZp7Lfn41rF
         kTC18NrnJ5dqRwnZcWrAXMIAHDwUNpNstDwbL3LhFYt3uH1sgOcP9Fm/fmf6vmnirpiI
         KRrw==
X-Gm-Message-State: AOJu0YwgoV/nzW5i/ppb4nyCc5krRmwVJq742qGXxoLkPI4fEe5S9+t0
	/1ejnxrdHYWJEw1ymAFLZ0ckSZmxwU7Wwzh7TvDjWINZBmsLqJKHTZ/+v22WaGkYAoBwh68ezIx
	bvrzPaZHLhJx+W6CvC3L/kwqUhsCzoAeznW7HB1J3B532ioIoZx+s8RgjDSvFZJmoGzEj
X-Gm-Gg: AeBDievKE/TU0NI0LUxxvyqA8tfMDJzVXZTdP6NhPzMUUYXq+z0eJurIEmqn8BraTIG
	pz5Pld1z1NMbWeQqMGzKdxWdohQStIcXIbRtDst264cRedyFm33dvnwnuYFQteKHpbjcRigp0fh
	hGaeQYbLlrDsiCsPrpWp3WfBiJpAIeWd5MzsWGXbObkkq+TnUx4BX+bmiAUS7ooTvNAkLx2HePH
	Y/cOLmBb/YId4Xv17nJtAvhZkWl3MKOLXOHvjEiVePIrw3TT7ZCujTkrk6HbYnaI2PxJhCGfRVS
	omOkfzymU6plSN2uF18Bo33FiyYO5SjFOW0LKw8LFUDuaXpZYLSG/KVOmgLZ837q1nrXBlivLiA
	7YgeI9ZxRNaDkNWgNGhReDpQ7L/cWLcaNh4qR3UacGVes7uvUwPf9YfiNhQ5TrzvRcA==
X-Received: by 2002:a05:6a00:4f82:b0:82c:e670:7691 with SMTP id d2e1a72fcca58-834fdccead2mr3424573b3a.48.1777557716097;
        Thu, 30 Apr 2026 07:01:56 -0700 (PDT)
X-Received: by 2002:a05:6a00:4f82:b0:82c:e670:7691 with SMTP id d2e1a72fcca58-834fdccead2mr3424508b3a.48.1777557715330;
        Thu, 30 Apr 2026 07:01:55 -0700 (PDT)
Received: from hu-swatagar-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7ecf57sm5314312b3a.50.2026.04.30.07.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 07:01:54 -0700 (PDT)
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: pinctrl: qcom: move gpio-hog schema to tlmm-common
Date: Thu, 30 Apr 2026 19:31:18 +0530
Message-Id: <20260430140118.3684018-1-swati.agarwal@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=f6V4wuyM c=1 sm=1 tr=0 ts=69f360d6 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=uk8a1l6paNbkfHKRL0QA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: yty0q-pzXRgEnZFHxl5a7_K7u56H43KS
X-Proofpoint-ORIG-GUID: yty0q-pzXRgEnZFHxl5a7_K7u56H43KS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDE0NCBTYWx0ZWRfX0d9S2zejV+08
 ZaGl+GLIPb71UfN4OW+1aDOghtFr70+J/I9XGIQPlJ2XsDu+kcyCzez4Gu+GLu1XevAFrk4yHC3
 L+X83ZpqXobF12dVp/5vYYfLCBDeHySXwpDDv6i8ulIXI5ObrZj0HDkoqsCR/Y44L7jqbteHUZ8
 poiy0fr8OheQeppLaPs9/i7KfQ659uXv26CTYdNZVgA6+W5SiaqRu8ldpkCTKgML2JKneNmwvZa
 Old3ATJTM57D/qETkKgTWDNhmfpUhzyUmoqht6kN7T+ZBTnAUpNDz8+q9n8SNj/nzMyCoAr260x
 G0Yq6vzG238Wbx8UWsa7Tn/vKg+LtBUHc0KHW2eZNChUnelaW6rcjumM1gJIaW4mpp5d+b6L6a1
 OF6KG6vmd/GISkIdtxHq+4yesW0khLwZDPxrHS1WUXqo/Ls9vliJyxmQUknYZDaWcROEUWUjpTN
 Tn0qxrxewacT5STSwHg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300144
X-Rspamd-Queue-Id: 6DDC04A3CE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105373-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RSPAMD_URIBL_FAIL(0.00)[qualcomm.com:query timed out];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Qualcomm TLMM-based pin controllers share the same gpio-hog binding
semantics across multiple SoCs. The gpio-hog pattern currently defined in
qcom,sdm845-pinctrl.yaml is not specific to SDM845 and applies to all TLMM
controllers.

Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml so
that it can be reused by other Qualcomm TLMM pinctrl bindings and avoid
duplication.

Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
---
Changes in v2:
Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml

Link to v1:
https://lore.kernel.org/all/20260417152014.3000797-1-swati.agarwal@oss.qualcomm.com/
---
 .../devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml    | 5 -----
 .../devicetree/bindings/pinctrl/qcom,tlmm-common.yaml       | 6 ++++++
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
index 4fcac2e55b55..3b33daedc018 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,sdm845-pinctrl.yaml
@@ -42,11 +42,6 @@ patternProperties:
             $ref: "#/$defs/qcom-sdm845-tlmm-state"
         additionalProperties: false
 
-  "-hog(-[0-9]+)?$":
-    type: object
-    required:
-      - gpio-hog
-
 $defs:
   qcom-sdm845-tlmm-state:
     type: object
diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
index aae3dcf6cac8..aec72e8c0621 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,tlmm-common.yaml
@@ -51,6 +51,12 @@ properties:
       should not be accessed by the OS. Please see the ../gpio/gpio.txt for more
       information.
 
+patternProperties:
+  "-hog(-[0-9]+)?$":
+    type: object
+    required:
+      - gpio-hog
+
 allOf:
   - $ref: pinctrl.yaml#
 
-- 
2.34.1


