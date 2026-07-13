Return-Path: <linux-arm-msm+bounces-118762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id aQxuJGXYVGr8fgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:21:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC9974AE28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 14:21:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Log/pXES";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VactPLZu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118762-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118762-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B3D513042425
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 12:16:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD23440B373;
	Mon, 13 Jul 2026 12:16:02 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E81E340929C
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:15:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783944961; cv=none; b=N0tP59OMZ7EEJxqYmfjYEa3yTriGGd4/kIcC1SE8goh/NFWUV9bCHSvO1gSHvfhT9+8bdOvdQWzAuS3REvHDx42UVG+lNWf8PK3tHHGK7e+e6E6nZ3vqJFjEn3+oZRE1k+WlH31xpgtfXAtF25wNqNQiKlkE8oPwdlqqlHoj5+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783944961; c=relaxed/simple;
	bh=ATDTQm/UciDupErPXbLk2PXIysxu2045xUz/FTQHuFA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eXVGrPS9TJ6hE33BXwm06DGcuKOEI5XWwiz5peGsIZiSOEga4yXlW/bq0Si5KzlQDFcfHfrdBvOjLvZlDqzx51Pw1rTAA42JKlYXyWCFWUNBV3ZkaDDtnrB5gCUGCaoAYEeVs43PKsiWpQJScOO2tBanPiYOP7zZdyFhZegf5pQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Log/pXES; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VactPLZu; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DCDvXA1494374
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=MzYXLnYT5ku
	894dEiDm0f+KTYSxqZgOOFQaKri3Z3Co=; b=Log/pXESPSqp/g/HBd2hP7Kd06b
	3rAjkTQvScrB6ON+OfEgsuk4u6GwVSUBvlH2Q6g/050UDDcqUD2PIcDavKB2Pxcv
	aFiyfG0CqpDsjzNOuCZ7gBseBDKZtaW9AWXAW4RUvyLL67skvpX9woo0WwONUnFM
	jV/IPuqbkhg1BH+tHGqSwt+iPW6iMO78GemNTeB/HDqzk2vfRsJuitOR1RTxsurQ
	xVdPZhFJOb6sBMe7MGCAz21Gv2lXGIOsTB58qQsLFP4yS9RCDdTaybuPVzFAzeNv
	2ibS3D5VJgua7mLJzC5kEw2q5a+zXTpFlpQ2SjmQqa1wwxi+ZfkERJNMYFQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm2f7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 12:15:45 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c96b4f58ddcso3168703a12.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 05:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783944945; x=1784549745; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MzYXLnYT5ku894dEiDm0f+KTYSxqZgOOFQaKri3Z3Co=;
        b=VactPLZuUO8hNXlQv9nRkHSWM7bA8YB59w+lSkl2A3aXoIsLJYdd67odtTz86uIGlO
         VHPIge5LI7iIVKThuDp+3kyzrYM22mYAkk42TTsWVDtDMUWf0RKseH31Th+zhYAeQvDo
         zU0T4vJjxoH94CRetfBa5iIfzbYo8+gT5q1+k5JJ21Rghwsa/1lDiCqFeZb4sQTR2/ty
         JmTDhbSM6wd/cGBuDaGx+7fVZswnS1xX1ZtSXlpNwEN4V/t5zs7pVgv9Er1ksCpG3DoW
         0YN1MpLOCrLLRSI1j3sro4rmwyTciqRGE/yIJ2mkEPzBeuy5GyL0y23aDTpf/T4VsDe8
         zaGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783944945; x=1784549745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MzYXLnYT5ku894dEiDm0f+KTYSxqZgOOFQaKri3Z3Co=;
        b=aAtJ2ey0rrglXVZ/Le0jn6+SIR9eMGdkmVCrTotuQqIKC2jAtFiOUw5IA+arAkbgJ7
         TcHJwFDP9OcMtScXJsINqLhqSm6b6olyLN2sqg6gEJCdfLyX1IKXuquwK2D1o1ZKwoV4
         PAPwOvenz8Ckv6iG2KU7i1MkKveFhNVpsguOKk9DhzBIAQZmbSnlMBS1iGQ8zhGlraoT
         FuT+zeNAvxToEAoSvSsI7xD+9kwszV8qsPIUrDCyJ/lY5CQhM0nVN8wP5Z/TJAM3BcMq
         jsyX7W4yLvl5+rf86rd/ND0OInx/vXiWIz1xrLbFDnnEosbxDoT/2LFT0fvtXFDlbpCO
         Xc+Q==
X-Gm-Message-State: AOJu0YyAalMM8fzqFSa1QvjoZhAfGOP+H7XJ4ni1Y0yCcH6V0qwzYOHM
	hQO5HD6ieMMiX+avJsnGzs89D9XIuOGiRw483bEK8HhMcs9vnSNJpOgTAo2075qEaj35KYN/yhd
	YACxNuIP3hqWRf8zRcHCCUeXuaCsPtdxbQUPL/4+GSoGEV8N+lDpVDKkjU4twk3I+9g1b
X-Gm-Gg: AfdE7ckhcwMVReQ4dEbLSaoAQW8Us+ZX1zU7mcuECDhB4Vwwpuc4/0yWEwIQCAfeAUJ
	Z//zWLiABG6yhY3icD7d4UKXsD5h5geyV5DLQsMf2UjSBXnMgdhUAGkhN2MYLcsZtxr+0Cw85zM
	Rfgg7vCuytjaVD7hLXg6975XfwXSOzqVG3dJrI9GwK/s/veJMVUSFjMMMh3RegugMm9r5ZLmlZO
	yPisM7LHhS3jnyr+cQz9wI4Wjm9m3N3tOIpIHVRZN3gSipQen1R8los1phOdlaZoFNKuQEmFrMP
	WY/KVBjT0gSmxpnhySFnsp2ZCzeqIlax8PMB7qT42jCW1CYPN6nXTD/z/rPrtsjYUrLeNuJf6Xz
	rPXmuus6XRLz6RpPdpi/0XU3hzDotrB7jbUMpdneH
X-Received: by 2002:a17:90b:5830:b0:38c:cf7a:5fec with SMTP id 98e67ed59e1d1-38dc78489camr8927965a91.13.1783944944938;
        Mon, 13 Jul 2026 05:15:44 -0700 (PDT)
X-Received: by 2002:a17:90b:5830:b0:38c:cf7a:5fec with SMTP id 98e67ed59e1d1-38dc78489camr8927941a91.13.1783944944502;
        Mon, 13 Jul 2026 05:15:44 -0700 (PDT)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm28069425eec.23.2026.07.13.05.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 05:15:44 -0700 (PDT)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom,milos-lpass-lpi-pinctrl: Add Eliza pinctrl
Date: Mon, 13 Jul 2026 17:45:17 +0530
Message-Id: <20260713121518.2724474-2-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713121518.2724474-1-ravi.hothi@oss.qualcomm.com>
References: <20260713121518.2724474-1-ravi.hothi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AkVNw1QJo2u4JLjyOtKomaSW-udmx19G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX+HNbSiNYJFjy
 6D1SSCKKNOez/Aqzzrfz7F++yn8EwrMWD+0VGqIET9uvZdxIA2KDA2GaVd8zT+9QvClwN5S7Rgf
 6gv9ZSs+CkhBdaIMg3UTHB/GJp9Yx7Se9uW1S7X/AjFqSopekJmvqG2PYassMoQt3doFOK+aLQG
 YXjmF9y0KMYwiArzc5mglERhQmiTTaCYc+24I6YUVCWrWC2drRPyOf/TAKiPLahTWkIig0GKs2P
 XkpAgFuoE2GRfWpREdZs8lZlCxdRMfGuDpWt8u6x8gx6DJfypUAJZvoT90FyHPherk+qhC9y7XP
 nuKeQ9vByfavDhuMh0XbfZjbRE7x6gqa6oJlnU3/Y5OaiV2J3FK7WxHoMZHcaPuCkBMXKg8WrCM
 DvdMCc/v/C4YEZVgbBI4LLG2supvNRx/HhU5cWiYhchBuxe1emHs72UzDSK8Ke+uo20RA+41yWs
 PGNqplQ8X4UjBViCCsw==
X-Proofpoint-GUID: AkVNw1QJo2u4JLjyOtKomaSW-udmx19G
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a54d6f1 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=AILnUmMEF99VWB6qR_8A:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyOCBTYWx0ZWRfX3azJmWIC2ITG
 KSZry/6mUt0E1yUM42ZGryGKkhdz+NY+Ixj7zyl0e/6QSo1A0Fp+v+7es3NmAs5jTZcH1iOwjwA
 KkB8F2OL0FI+2G41daNU9nlDW6rrbOA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-118762-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:brgl@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:luca.weiss@fairphone.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mohammad.rafi.shaik@oss.qualcomm.com,m:ajay.nandam@oss.qualcomm.com,m:lkp@intel.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,intel.com:email];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EDC9974AE28

Document compatible for Qualcomm Eliza SoC LPASS LPI pin controller.
Eliza has the same pin mux functions as Milos but uses a different
slew rate register layout where the slew rate field is in the same
GPIO config register rather than a separate dedicated register. As a
result, Eliza only has a single reg entry instead of two.

Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202607032107.RMly13RH-lkp@intel.com/
---
 .../pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml  | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
index 73e84f188591..c81cac1a9740 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,milos-lpass-lpi-pinctrl.yaml
@@ -15,9 +15,12 @@ description:
 
 properties:
   compatible:
-    const: qcom,milos-lpass-lpi-pinctrl
+    enum:
+      - qcom,milos-lpass-lpi-pinctrl
+      - qcom,eliza-lpass-lpi-pinctrl
 
   reg:
+    minItems: 1
     items:
       - description: LPASS LPI TLMM Control and Status registers
       - description: LPASS LPI MCC registers
@@ -74,6 +77,19 @@ $defs:
 allOf:
   - $ref: qcom,lpass-lpi-common.yaml#
 
+  - if:
+      properties:
+        compatible:
+          const: qcom,eliza-lpass-lpi-pinctrl
+    then:
+      properties:
+        reg:
+          maxItems: 1
+    else:
+      properties:
+        reg:
+          minItems: 2
+
 required:
   - compatible
   - reg
-- 
2.34.1


