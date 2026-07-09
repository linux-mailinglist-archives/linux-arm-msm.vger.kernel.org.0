Return-Path: <linux-arm-msm+bounces-117919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hA+DKKpjT2ocfwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:02:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 252AE72E9FF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 11:02:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="JU/0lVtc";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=C9s+sE00;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117919-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117919-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 678D5315D7D4
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 833BE403B0C;
	Thu,  9 Jul 2026 08:52:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50EF3FCB2A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:52:31 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587153; cv=none; b=SikFWbKK+RZwK91mR6XPusdWrone3SxGCYufUcm5rZHSC5jGtVnu6eItCrgcIZbvJuBkV+LU0e82NtWCGGssl/ppj/fsgHF3Ec08V+c6IkzbbHB1rke/R+qopX/E68/e7DuaOebEu5sMlZcf8mL9r2xFv23ipkSARJXgsYirlOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587153; c=relaxed/simple;
	bh=WvHbqwZ2lRODAE5+DdTi23lJSw5LzBm+wBkh9BZfEdo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJX+vvbkUFZ5Z4f0Wy+Vzd2+3vGaENgwUBaNvEUM0caszXttNNR5UGXC0jP71wvqgfpGVdOhr4tWvKG+LjhP4Xz78YF0xwn8FGs5aJxTa0skz3vKXP42anM6SdJ3I5cLYUUSy0CWJtwHDwpzoaJyrVFHk9PQLnIA+TwyT2lyjUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JU/0lVtc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9s+sE00; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960MOF972872
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:52:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=fYwk8uIYjWB
	nFdb07czllCar5lvRm5VO1Cep6JxlikQ=; b=JU/0lVtcp6d7dLLzJT4yLY6GuG2
	+OUjV/TTzx9J1hOHFs3qkHuCQl4u912YF3vsyQ/PAmkXtF62vl6QLrZbHHf6FXxh
	BxyKEQ3tOYWTwecebVzGzO3sUt6rZO1fssY4vGBqmFStf+6O/C/z2C59wK5BzXB2
	MckipeoH3jRlAIu5NDtj/y+Giu58cbEWZLi9ckkuYC3F88dd1ulUFK/SbQ7FIYYG
	CnWAwoaLYITE3Vq3HWpFLkEVBcERFhZNFCtn2WSoDvrCbDZ3vlfUnLB0wtuEmUWV
	ffo6ERuvHMH7surogU8g6mlew03K6w+y03AFQdgNcuUSpoS1+e87LEpVMhQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9v4vtsxv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:52:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca8aee88725so666461a12.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783587150; x=1784191950; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fYwk8uIYjWBnFdb07czllCar5lvRm5VO1Cep6JxlikQ=;
        b=C9s+sE00OXKMVRIVgnu1hy46MOBwhHi36O+vpiks2+x5pQMlvPjwiJ/hKB05ONr4PE
         31kB+dRXJ5/aRFdx6OixQZMElz3/TE+11sy71FSjC6qgL7OLJbMiL1iNeKUywhATRTKp
         hMiqYQWgdTy3gYO9UrIjXuMvOCeCHvp1PEte6UPbRx4ROZQkV1jRoiet2FeAuXb0EjrM
         unVywrvSYtA2sLDEJ78QHzj7kaY+vcvh2j59UIE6+wumtHuOevjZzDoFjrD3DuLM7QFi
         uxt1gonMYq+nQXJZ2ZloKzrgu3xWJPY8SC6vZfZ+/4Tjy/63zvMvQo6ebf/OYma4IWWl
         vpkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783587150; x=1784191950;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fYwk8uIYjWBnFdb07czllCar5lvRm5VO1Cep6JxlikQ=;
        b=EIJKhpLMnBHGG8Cm/xeyjJOgo+qT0SMDoNiGObLXf1EbcZ+RenXAHAoRU5+DahIs7j
         u+Y1pp33DvV70N2LSlYPglPC0OP6BS5jRra9uKGfsXL+RA0PDGQw2YG85dQ2eM2vYqUz
         GzocvpsVO9o6xC6x4uei/yZwyYf7gWNpNxbkoGNNu+L7PKJoifXDHCLjweHxVfNkFrty
         xDqqWAbogogU8MaaxHfc/WA9E1oqCchVlwGkSbW+UDCOBMFFcqpA1t/7VT5fS/5PFLZ8
         9O7EwZbWtH5oo7FDa4NlvBHIv+HQIYvBIbxxOE6N58Ktgn9X/FZpSwnGd6nEEDZRVly0
         2Z/w==
X-Forwarded-Encrypted: i=1; AHgh+RrGEnvV9eAPqL+cE0kAcQAkDRl0q1Ja0bQ/D/yHrixx5KutIn4ByOphQZx83VKT3EevR6C4R1kTQlezG1h/@vger.kernel.org
X-Gm-Message-State: AOJu0YzGjr4NEAzq5mXkacmrnCG6otXOWCJyCqChWjRlf/lewLWSm573
	s9TafAbH27yqVyNNnKEXjXtYCqLUJ/R1UiQZBIP+8T886MDNpRwVIMB+IMH5yBTuxvZmBWCX/Pz
	/1FGluVIPdcfC0WegsINlhmEJXFVKV2MJgkJxDKIUWmqH/sjR40cNIVeJo3UO/HxTnQNq
X-Gm-Gg: AfdE7clMD5vUPUQAWmwTKwHKNWeqRB8eEQ4quIo/7I2O+ElnavxAjf2rHQXVxX9E8kP
	oCIMAqftiL0zRBoq+u9oiXXnUyR3hbiRNSlRrzpaCV8RhLr8oTDF5TEYDD8QP3Ah2duvufL6LQI
	PxqeC6FUO6hV14mieS7tpF+SdaN4LVaK+5NjJXleDXgbUE4/FUKTOi6V4y8TyPEkjd+H9JRQrRY
	82ILTeYhXE/4aGkO2WfH0SwL9yLUFwELC1/OD1vSiBNtUSxzYY/KicIFMJNT6Cl1CdOs31VZ1hx
	pTPIkKm87DfdQp0npWi78wZePYQw9RuNXPOHTXUcVls7gweD/mZ4/DDNsOlzEkwGCb9oGtf3WV+
	qWyLqEBzuksxZ3y/QUrdo/TmJB9nlhck8scYgCCBYnjnIIV1L00GRjI7fxrOqd+OmOq6Avws=
X-Received: by 2002:a05:6a21:a96:b0:3bf:99fb:db96 with SMTP id adf61e73a8af0-3c0bcbbfabamr7635607637.49.1783587149920;
        Thu, 09 Jul 2026 01:52:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:a96:b0:3bf:99fb:db96 with SMTP id adf61e73a8af0-3c0bcbbfabamr7635578637.49.1783587149489;
        Thu, 09 Jul 2026 01:52:29 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3b25204sm3460027a12.28.2026.07.09.01.52.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:52:29 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH 2/3] dt-bindings: remoteproc: qcom,sm8550-pas: Document Nord ADSP
Date: Thu,  9 Jul 2026 16:51:48 +0800
Message-ID: <20260709085149.4072181-3-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
References: <20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fsZdzaRBh6lZh_2mMUHmQ1CBUEYqW2K7
X-Proofpoint-ORIG-GUID: fsZdzaRBh6lZh_2mMUHmQ1CBUEYqW2K7
X-Authority-Analysis: v=2.4 cv=GIg41ONK c=1 sm=1 tr=0 ts=6a4f614f cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=aBsbI-zWOsqIVKrz_5QA:9 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfX5ezHE93iyrR7
 rah0TDMAe/Ldz5FRyH+yPH0AEkPyKmuLb69dkcYsWTfIqAbbiD1H5NiA17+ZpdLO+xqksh9c9oM
 wv557xA3YoU2U275i6X3vG1297ZBBvnbwF1fW6VLMmhqUbxGJBGrUuZSZRWsQyFQlvrBJEL29F7
 czYetwR5pGwvD37tWeIjlZNTQEPQim37Yk5HLIL93U3ZoTEW72d4vrdhC2VUJqA3W9OCcNG3NI4
 OSGAFkw1ijgE0tHo6jsFjsSUmyLqNvPnhiezCHQ3I4waq6oMtCnAX8+77+hm2MgObiuQMP0Bj00
 Oblo2TQ1m9op9AkqjwtSTaGWBSNDdQ6c5Y3cfZo1zTtlcUIKFgQVhoWgmNnfzHhYv90Rc82hzxo
 ZXW7idCQZBOVc9B8aqgjh0MRRptsKLJifX1H8PO/5NPktuBmWjulluHO5fGnXbh1LvYZnCeKBtr
 AS40qwgjRfVdpKslnZQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA4MyBTYWx0ZWRfXwyFSKi3QQe4W
 qUWuufbdiJIKQapudwJ/vimqj0BevVoCyoLFTIqN9PmgVKemnjMOIqbcxPuRtGrc+GS/vO/EKMj
 i5ZVuauuzd7oFU/fAuSvBuCHsmb3GxI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607090083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-117919-lists,linux-arm-msm=lfdr.de];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.b.d.0.0.1.0.0.e.a.0.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:shengchao.guo@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_COUNT_SEVEN(0.00)[7];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shengchao.guo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 252AE72E9FF

Document ADSP (HPASS DSP) for Nord SoC.

The Nord ADSP use CX and MX power domains, so add a new conditional
block to enforce the correct power-domain-names for it.

It also uses IPCC-based GLINK signalling (shared with Glymur, Kaanapali
and SM8750), so add it to the existing IPCC interrupt-names constraint.

Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,sm8550-pas.yaml  | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
index faf7b2890de8..1a8539d6b788 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,sm8550-pas.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     oneOf:
       - enum:
+          - qcom,nord-adsp-pas
           - qcom,sdx75-mpss-pas
           - qcom,sm8550-adsp-pas
           - qcom,sm8550-cdsp-pas
@@ -138,6 +139,7 @@ allOf:
               - qcom,hawi-cdsp-pas
               - qcom,kaanapali-adsp-pas
               - qcom,kaanapali-cdsp-pas
+              - qcom,nord-adsp-pas
               - qcom,sm8750-adsp-pas
     then:
       properties:
@@ -242,6 +244,23 @@ allOf:
             - const: lcx
             - const: lmx
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,nord-adsp-pas
+    then:
+      properties:
+        power-domains:
+          items:
+            - description: CX power domain
+            - description: MX power domain
+        power-domain-names:
+          items:
+            - const: cx
+            - const: mx
+
   - if:
       properties:
         compatible:
-- 
2.43.0


