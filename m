Return-Path: <linux-arm-msm+bounces-116154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HbPKG2xGR2rEVAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:19:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 860EC6FEA5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 07:19:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=b2nQYXfU;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Zus1RwLY;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116154-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116154-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 19E5730717D8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 05:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56EA2346FDA;
	Fri,  3 Jul 2026 05:04:15 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF2B34DCE4
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 05:03:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055051; cv=none; b=L2T5m4fv4yPJrmWegAdCh+t4Pc0Eop0y2c8jYti8QHY2KHhS8KsgdM3QOysqO/y6uvX87tTrrErOPmgHpzFe2QRm+PI3hWPRu3SU8TBj9mnh1v9fny1wIze/T8FVdDvrTmW5GxGLLBb+2H9BajRnzkT108cR98n9xOJsdD4DIho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055051; c=relaxed/simple;
	bh=AHfQqxqvUWEpKg7THeGPiYVTmEIZJi6on0qcJOPK+0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f18HiMGx+lmFScQlQafZRKCmy2sKKXqq+xKQLodhmg6EpS2FKGvxXy3Cwo7lwrGLM1OmS2U2XhjuK0l8D2cr6AhBUfSnwJd82T/fdnhd58K3wn3q+m4lXWGMZnomK83Uf3IqXvwzfAP4aE0UPM+h3PY0HsE712xtlKRTx3Aj4+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b2nQYXfU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zus1RwLY; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66342d5E2801088
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 05:03:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mMrBdqNXSo2PZU6K/xNM4G+bRIzioC1tVR0BqX8fGXQ=; b=b2nQYXfUm2eGaYpi
	VZ8gZEPjRadBwTJIrJgb/q1hux53hTu6YV0UkHgy0+2XOdXiVxRrOM7Hlrun+0OT
	cYpBW62VsoI4QwlmGaIQLZbynAXl9cE3RNlfgfsMBlptECgHgldYCHSAPvWDvEdG
	sph6Aj+0ng3UfOXzIvrF8OMprBI5vGANv19ypXQpxMhd0oTJD+Nw3yvhFdWVhQ3G
	JNcWzR+ZY4u5/TQuZAlDjlhOzIlrDIjAUyNIBEZyYonX+/fDIwx2KQlNtU78vPkY
	Te2XDCzw9afm8PxJDdSUx57HF7OxiH7wzdSyBF+Lr+oSZ4L72Nvw06KC+OAhRNT5
	QLju+Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60ey97fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:03:56 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c88fc985a65so357124a12.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 22:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783055035; x=1783659835; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mMrBdqNXSo2PZU6K/xNM4G+bRIzioC1tVR0BqX8fGXQ=;
        b=Zus1RwLYPx1s9tviEY+z2iTPv9tz+rR93s8XXFG76xqpbd65qCqSsDQ25u9em9ecbc
         qirgFt3NEF07vEeNz+CVQ/IMb+CUBvDkPIBqQI6niyTJMDazwVIIigJGsrT06Idxs91c
         4mIqYyQQ1NzVmlfxSBWZMI5nf8nn+WQxmXh58WlTMxiT9nRuBSWk+/b+/msKXIr1+3Ka
         zvrz4TILqLGYdJt9sLhP13PuqfndPrFK0VndvO9RzQ++wiSu6gzQ0ccq9Xz1dSKSZ9PP
         HVNMYtP39s3rdcDq18lxnTl/BqU7c/jZVdjb87RB6jLIOaiCmhyTEOm9JO7V8V21sOs1
         yo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783055035; x=1783659835;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mMrBdqNXSo2PZU6K/xNM4G+bRIzioC1tVR0BqX8fGXQ=;
        b=JIUo7mbpAZx+1nZRgnbHeAD/9Lj9OH5BDkSf9OmMWqdjKGwxYSnPmUzVNLesnhW+/d
         FglQGFfWdOktrvDFRTM5AjR9iGHr3kArVrxyxwMq8Q0Hy6NvqV9NVbwBv9709iysgzpc
         5jZ7mI6sphe6PGFlas/D/7hE/I3e/CMW8Y51vmIFmpmAt90OlMlYug7o4JgjGftzxCVv
         oSh6BxMV/lgJHC9Gt0KqjzwUfhpkBMIeWhwz0sTQp6EhKJgEMNFesSXdaZ5Ouqm0fNKu
         CfUqLJCaFK0JHPgrd5xZQHQccH4kv+ktPQTtWjd4jt/xHc+gzFFZwtVaZ4NUVnlr955m
         jnxg==
X-Gm-Message-State: AOJu0YwtKYEOm//ISLPBjgLmi3UeMMC2pGTSlkCIke3QXuGIR0FFMIhe
	T9ZJU8K02g3ttKfSBQc2Eqn1MCRwGL9YV2YWmr0jmssJtuAJ1u/Zpp8XSaKNA1dSOgLNBqjEbxQ
	0ieMC7vay/rcAOUeqrzx6xbkrtazvmfIdFRRaG2ZruBTI4ueqsHY2F68PIwvRkXalDkLc
X-Gm-Gg: AfdE7cmklAYMXMLsijqvqUOiQosiOBAPL1UyXVlf5vgU9t4on1lMsXCRr6uhpJ6CT21
	J3IdaUbfJLuLcOkcaFkIBuIillIDMIIBXO8UuPluRHutYFr1L99CyyLqeTwJ4T00g5tBAw630o5
	n0cXzaGAVx3Gdupf6Z2WyK2uxcvlLG65IjteQOXM7IaaSeAsRrWO5oyBzICXukbz1nk/cauHBDr
	bfxnQBHcUHFz1rc63wBuuDDKYiBBmjEX35MYP5mo8pmN49AfxMVeB94o+cpbyTzi+6j+eiOSnfV
	j6woOgAOWrAeUqcfFMPAAf/PmgJvKxvwaGdz20G3IZ1fjEK0QS6jRC9U68WaiLgYut1Z/3sA3ol
	ukUuia9oO094uxTMzsETRTeamiDhpof9G8nCLMK3+
X-Received: by 2002:a05:6a20:7486:b0:3b4:65ac:e2e6 with SMTP id adf61e73a8af0-3bfed362212mr10430092637.36.1783055035287;
        Thu, 02 Jul 2026 22:03:55 -0700 (PDT)
X-Received: by 2002:a05:6a20:7486:b0:3b4:65ac:e2e6 with SMTP id adf61e73a8af0-3bfed362212mr10430053637.36.1783055034786;
        Thu, 02 Jul 2026 22:03:54 -0700 (PDT)
Received: from hu-gkohli-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f0bbd2362sm16771941eec.20.2026.07.02.22.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 22:03:54 -0700 (PDT)
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 10:33:05 +0530
Subject: [PATCH v4 02/10] dt-bindings: remoteproc: qcom,pas: add
 #cooling-cells property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-qmi-tmd-v4-2-3882189c1f83@oss.qualcomm.com>
References: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
In-Reply-To: <20260703-qmi-tmd-v4-0-3882189c1f83@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783055015; l=2326;
 i=gaurav.kohli@oss.qualcomm.com; s=20260302; h=from:subject:message-id;
 bh=AHfQqxqvUWEpKg7THeGPiYVTmEIZJi6on0qcJOPK+0M=;
 b=UImge96cIdZ4CYD7PRKR4dfZ7NsDhPZlNtKO/+BLXVmJD68rxmIrTitXhlHIyHyjcpNJYfrY0
 euRG1xFLIEdDTvmuyWrMOn/QY8QxhxkqjXlKR+tzdlPuLiDBY8vCCtr
X-Developer-Key: i=gaurav.kohli@oss.qualcomm.com; a=ed25519;
 pk=IdNsqe8rWsF6dbpGHfwPEH9zM0nbOdRH72HxUT9qPak=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX6CPhkwyvFyW0
 Ea4pMNIWNS4OjiLq7oqDz5MhRWgj3gHNtWWHaK4Oh4HHKQQRzXzhFTlX3jD7TVocFcLA31eyF0j
 A243mcj4XMHXls21AdLgZ7jnnc5962grZwBKPRtaRgZcj3Btwsn3MJDh8OD5BBQ0JxMWkqZIWYs
 ekHEIONlqFWJRg03dsmzFwczHUJx/siCw4JwBglCxSf+cHNUxn98KJNIxezYDkrfCNwUje/ep+m
 mLMPDicWvyxJZMhGGWPMMBxAA9vqURWwwZuyyiGb9VGO4y4lc0TPQzay16MGxqk2CrSfeuedDfu
 ziPc56xlPKCZLRJIHNWrEU8oRsryw7SUVxPcN4lswcht+imjUMLSml6U2PzOAmPv9hejSz0ts3k
 MIt67Tb6NPYpycS1XiC3f47mBm4fK1jRqth+ycLvg1QUSPc5+bsE6rRxVJiUazlYd5+UM66ShEj
 +tBnMjvF4mVLViQa3Cw==
X-Proofpoint-GUID: OavzEHuzlGwO7PJFC3w1_tGk5L5wQ7lg
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA0NSBTYWx0ZWRfX0O5uSgVJywkV
 DcO5jxIvz6LzX6kBkNDQtov/5hOXb6mcVT81PHYd2MAo+QK5ACN8jIn77QNHCCpzdNM0z1kbcB/
 hD2P26BkGNWNUsv1AZLEtXv3QM77zik=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a4742bc cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=glLd2v_-c-plxm5TIp8A:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: OavzEHuzlGwO7PJFC3w1_tGk5L5wQ7lg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116154-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORWARDED(0.00)[lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[104.64.211.4:from];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 860EC6FEA5D

Document the optional #cooling-cells property for Qualcomm PAS
remoteproc nodes so they can be used as thermal cooling devices via
the QMI Thermal Mitigation Device (TMD) interface.

Qualcomm remote processors expose TMD endpoints that support thermal
throttling through firmware. The cooling-device specifier uses 3 cells:

  <&phandle device_id min_state max_state>

where device_index selects the TMD endpoint (for example PA, modem,
or CDSP software mitigation), with constants defined in:
- dt-bindings/firmware/qcom,qmi-tmd.h

Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
---
 .../bindings/remoteproc/qcom,pas-common.yaml       | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
index 4607b459131b..ef11371058c4 100644
--- a/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pas-common.yaml
@@ -79,6 +79,14 @@ properties:
       channels and devices related to the ADSP.
     unevaluatedProperties: false
 
+  '#cooling-cells':
+    description: |
+      Cooling device with three cells:
+        Cell 0: Cooling device id
+        Cell 1: Minimum cooling state
+        Cell 2: Maximum cooling state
+    const: 3
+
   glink-edge:
     $ref: /schemas/remoteproc/qcom,glink-edge.yaml#
     description:
@@ -95,3 +103,34 @@ required:
   - qcom,smem-state-names
 
 additionalProperties: true
+
+examples:
+  - |
+    #include <dt-bindings/thermal/thermal.h>
+    #include <dt-bindings/firmware/qcom,qmi-tmd.h>
+
+    remoteproc: remoteproc {
+      #cooling-cells = <3>;
+    };
+
+    thermal-zones {
+      subsystem-thermal {
+        thermal-sensors = <&tsens 0>;
+
+        trips {
+          alert: alert {
+            temperature = <95000>;
+            hysteresis = <2000>;
+            type = "passive";
+          };
+        };
+
+        cooling-maps {
+          map0 {
+            trip = <&alert>;
+            cooling-device = <&remoteproc QCOM_CDSP_TMD_CDSP_SW
+                             THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
+          };
+        };
+      };
+    };

-- 
2.34.1


