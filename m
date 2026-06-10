Return-Path: <linux-arm-msm+bounces-112339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fP+sL2ceKWrpQwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:20:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17270667166
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 10:20:55 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nnVo1AW9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cxLOkHFt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112339-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112339-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6C0D63031E8C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8021A3A900B;
	Wed, 10 Jun 2026 08:12:57 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E0D53A7826
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:12:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781079177; cv=none; b=FsqfARIjIXFEb18Q2Zg5A4FjECwJ/NnR0etFXvgJrNHF7+hb+10SypsPOuG9zWNHOrKshBq+hyZCGJRJhIno4uZ9YKvl+wve2quDOwntXWZOqv7hV2xwPUPGSPk/WNyob3HwOuYpI9PD/urhdfT0Tj7qLTu7ceuQOqbeOslhy2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781079177; c=relaxed/simple;
	bh=7DFnNTv28IGdngqta0O1QHu/B/uxIDqYYhl0XGm2Pb4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GJORND2r/eI+4bkGzoGYOvbX7ksgNcZ6uttcYUFe+3d3MQbxSsfVg4pK1NaIu9duo+c1JSp2+uAmNYRDqDat0ZZPK3JE7JlDvfzOOUHoj3GqnR1S8P1mpmSpkzYLdIdTMg6s8E0LM5LxYvVbYv55b5plSJfCdOMJwpbPbbvNRqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nnVo1AW9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cxLOkHFt; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7hr5h3151716
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZnAhfc9juLM
	6ofZhbvJAs+UfN8U7vmcczY7bB1K8lAI=; b=nnVo1AW92QHI1QBLZVnYiv5DFeU
	BUap/wJYPT3AOIOt1PIIX8Ze3aT/99m4x/QWPkiyuMnlJN1/Y/9tjtIwfXs6rWSQ
	QumP55HpsF1TQkA/Db8wLTHnO7CGtHMhHIUSSsdQFF+TFOTCNZ0t8s9J8/NkgJdt
	NRpJ3U804lCR16ztInjq+P3Jl+SWjoiTt4Pjaxj9aL3WCb44kRiyGwrcVpGMzwbE
	amBUO1cCpxYMb7V1CH7Lgcyu2NwAM/XdVuJtiTJaeHzN02+/CPbBrcd9WYrUTN/a
	nIdQCTBPdFKgAHYLFB5nYAGdRLAh0BPimrtn1q4A6vtOx5w61AvXBRJ+QKw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnesems-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:12:55 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c0a81c1738so38328065ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781079175; x=1781683975; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZnAhfc9juLM6ofZhbvJAs+UfN8U7vmcczY7bB1K8lAI=;
        b=cxLOkHFtp7iLYnDdUuvf0HtW9xj+qaHEouvzopRWZqC3YAge5MVYeuFpeCacamAE6W
         E/9lI03zHiYrssqYwFr8gX1K+8hunJIV8pGg4krsVCUecW+JgBFszmlHUazlcgbw5uV4
         lFTG24/OsrE7UzHl6tFqncfEdM9sY23PbDE+jXpODamTq35CxAlJS3rsBqZjxfVF+84C
         8Q2Y4DJ3IAYyWqYeyK709LJ5mdRpU3Qqdj1rzcSwNhdZqw/2+SglRVLHyHTRZKTN5rTf
         iAey4DESfE+uOPY4rGSgIzp2LwDdUJghU9hUBxxBbrtxKS6ZH2AgXJcZiLAKCTV8yuJd
         +VRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781079175; x=1781683975;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZnAhfc9juLM6ofZhbvJAs+UfN8U7vmcczY7bB1K8lAI=;
        b=kmEhvcXCe4DCD5lt9GVNqHnTK7//lnuPjh/UbhQg4jXsswEuTcIDPDGK2989P56xK/
         rf4psWr9ebMEgJJ0VkkfhI/8oiEkUiCnGhwPjNGEA0qeRG3JgNLj7KCUmYhtoob7GHSr
         EsJoDdipX5i9+uPGcTX2o9M3ifGYoGYkX77GpUBxmZpC/qUYTml+7dtqpH2RXCIXKJVR
         wQeWovqftYybN3x1IVQny6IrpzfobBQy2oZa5Ovqb+AVUl3X/ptV/h+Ixgg9vNYlmuCo
         VjX00h/RKzJ+n+VGA+NkBiQ1wExB21F7NmadPQxKuFzMfKQJYi7j8fCz5IW2JPQWRd5o
         vnDw==
X-Forwarded-Encrypted: i=1; AFNElJ/sh1WEk4TFobDIpnT/9Snw559cUmB7MebqQPZdu7o4NoNiCNoD+Bqu7DbDbu8rgWNtk1ah6tfI6hTBNuBB@vger.kernel.org
X-Gm-Message-State: AOJu0Yzap1AWBOUVnCD5egxJTnGlKvrJ+We6uPYERWggT8d+DoA0vGHg
	2gDnJgiegVDx44t1e5MIwHkTDcN1W1RQ5cWqKnvO66iw0HYQeQhOxXrdZ9IOCaiGY9w65T+zW+w
	kmV9CfYA29gylMRMuRKyzDgdmE4NmcglrXSv6hAfMf2AxH4KW6ASE49HJkkr0k4LE7ter
X-Gm-Gg: Acq92OGOlnYsEDxnSF1mwfPDfv/qPDaRtUc+sKeEiAjsMtirzqUl1pI/1MlIxFB4rVz
	278zpUdgRUYzI8KmJqu9QN3Jep/bbQKEO5v6S/mHcCd814PbCK2GT4VHxizhTtdRcF3ZWlBfU3K
	Diy7jopyGpsIT9s3FxOvYJALg9XnUhzWrZvpU6M2tVO+bza0QnVdja06CTwS1xlzgokXEaqsg7F
	6mOo+EI8MraqcnFBbFhzB/mC5ZIWAuScSV+S6CYW9zD1WAFJSp2Tgz78tQSpwt/phln5rofmn4B
	uM+UXL0U2LKttdBkQMrMNcJ5xEQFwr0oqRvjmV6BuFj9Q+sUCwyuK6M2jhr3viJUejbTFqyUs7i
	CtzZS2HF7O4InaXPcPQL95cH4X1VJgt3W1v+d4WZlo870NlaTAHkhShw3YlNq6OQEdadruyARV6
	5+4A0tOsUshcF6NpN5Tb3woPmehSQ+uZ/B+R7QMOyzrFT6s4VVW01cWoj2WvyT9g==
X-Received: by 2002:a17:903:3504:b0:2c0:ab82:6b9d with SMTP id d9443c01a7336-2c1e80edc43mr270505395ad.29.1781079174763;
        Wed, 10 Jun 2026 01:12:54 -0700 (PDT)
X-Received: by 2002:a17:903:3504:b0:2c0:ab82:6b9d with SMTP id d9443c01a7336-2c1e80edc43mr270505155ad.29.1781079174334;
        Wed, 10 Jun 2026 01:12:54 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f8679esm228858575ad.21.2026.06.10.01.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:12:54 -0700 (PDT)
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
Subject: [PATCH v2 1/2] dt-bindings: thermal: tsens: add ipq5210 & ipq9650 compatible
Date: Wed, 10 Jun 2026 13:42:40 +0530
Message-Id: <20260610081241.1468507-2-varadarajan.narayanan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610081241.1468507-1-varadarajan.narayanan@oss.qualcomm.com>
References: <20260610081241.1468507-1-varadarajan.narayanan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Y8ZloB7ogQShJQV5lXdVucthMUNfLlFi
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a291c87 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Cj70nMFs6DzugLwqs6cA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: Y8ZloB7ogQShJQV5lXdVucthMUNfLlFi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3NiBTYWx0ZWRfX6QKrq693L9Mk
 ydC1UKtgEAlJYGx9srZOWLd/L+MP+fEbjO6qsHDyOdwg3HkOthNTMrzCQpl1GiNibkoilW7s2II
 gY+A/rRbKXX7d9GNC7pV38vUGZb2NZE1MC4bBIz7LFiNbjSG2rYI66IeKCzxUGGMMY4NmuV+EJJ
 I1kyPOSZwci6QtYSv9u2oPyZemGHrO5dFa4gzMXwJyNYanCq8a/LEhvEPedRsx5SJZ5WPjPWxqV
 kYdetglIhAsrfzw01FbdIpRMKn2YtPYIrOp8thLiCbbtvAmm8nsjVW/3cWMJpR3eMU8dkDw/5rn
 pvZ0sbgpfUomwcJX0v4a5xavImoJxQtbLuHmSBLbQfftXAIEKClZpCLdlgiLi3ztsOSEpFbpJcs
 Dexvjd5DqMMVXOyN7E5gn3mIBwVjlsDY55HZkJLPakHCvT79xUGWlfIk3BIrhPerlN4ZkC7JOsC
 Zx91JZb+RoNKLkVuW5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100076
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112339-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-pm@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:varadarajan.narayanan@oss.qualcomm.com,m:tharagopinath@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 17270667166

Add the compatible for the thermal sensors on the ipq5210 and ipq9650. The
ipq5210 uses ipq5332-tsens as a fallback, while ipq9650 is added as a
standalone v2 TSENS compatible with combined interrupt.

Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
---
v2: Fix fallback definition
    Include ipq9650 to all applicable constraints
---
 .../devicetree/bindings/thermal/qcom-tsens.yaml          | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
index 7d34ba00e684..5d782c9952c6 100644
--- a/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
+++ b/Documentation/devicetree/bindings/thermal/qcom-tsens.yaml
@@ -92,6 +92,13 @@ properties:
           - qcom,ipq5332-tsens
           - qcom,ipq5424-tsens
           - qcom,ipq8074-tsens
+          - qcom,ipq9650-tsens
+
+      - description: v2 of TSENS with combined interrupt
+        items:
+          - enum:
+              - qcom,ipq5210-tsens
+          - const: qcom,ipq5332-tsens
 
       - description: v2 of TSENS with combined interrupt
         items:
@@ -303,6 +310,7 @@ allOf:
               - qcom,ipq5332-tsens
               - qcom,ipq5424-tsens
               - qcom,ipq8074-tsens
+              - qcom,ipq9650-tsens
     then:
       properties:
         interrupts:
@@ -320,6 +328,7 @@ allOf:
               - qcom,ipq5332-tsens
               - qcom,ipq5424-tsens
               - qcom,ipq8074-tsens
+              - qcom,ipq9650-tsens
               - qcom,tsens-v0_1
               - qcom,tsens-v1
               - qcom,tsens-v2
-- 
2.34.1


