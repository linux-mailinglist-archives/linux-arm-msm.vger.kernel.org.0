Return-Path: <linux-arm-msm+bounces-93691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOQ/BDxZnGmzEgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93691-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:42:20 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDC617724B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 14:42:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A49BC30ACF22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Feb 2026 13:40:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297FD2405EB;
	Mon, 23 Feb 2026 13:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p7VP2/Qk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aa1wfFyu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D0A235063
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771854010; cv=none; b=g8lMnkkT5eGNITKRUBh3s9z/3lGc1Z5DD6NV9EAeLaU0rj2TryCP7QLazjaUlrt6k7uK32VFPzEV+Vo56ze+xjcanMaxixT4372IDBStlTIU+MjMdvCrHB77OSExpvo77Y37juhP3DlbCJOdUkwc5zDpJF4Zczt425+D+2mve7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771854010; c=relaxed/simple;
	bh=hLiF1b8prPkPiGJ8kiF4IUx+OKOzHblZ1mAFmeUkioM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n+sey6Vdh71hGpaWUP4u1SlOfCF5ktPl7CMEbwsP5uaF/mDeNSRfZ0z4Jjw7jaHj0Wb+xQaQGzOiLmAjYdRAvU5CqOqvPkbfakTx7UUzc0CDGw5/VGA/Nn61h8ltSbWTQNal5qHuti4GkPBm3gbJFF2DXHU00XdqeeVUYoHa1R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p7VP2/Qk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aa1wfFyu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NAYSww3409202
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uswX/JMJsgt
	uS2xI3Xq3c5KhkZXJG5Uv/ItRAzLFyTE=; b=p7VP2/QkCxcvFOvoApEyvx/2Eyo
	9pFF18i/yn78RMAiVc9xFLQp1vB0ULZ3ZzFkJJs6r/evYMKhnTYhqXtrJS1fHmfn
	uz7659mTnuPdpyNu+O7vfghLWjPm46tSW7tnCHWOFO82Rj9h0r1tiZBtKql/xru9
	JGqmDnInP3GwXZeswZUKLoqIU9FCAkWItn7gEc/tnZN2PfEZnWUP7oK4SyiLiFeM
	jXf4LUO1I1qsxOVqAfQU7oGmvA+M48sD+kf/RGuj4MYnpri32IWQTCdCZXyTk48K
	FjFNeI6IJ++18MXyoHqq6ZZi3z0EPV3mAzLkNHPAwUWxfQsO/u4mkd52MfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgn8trfvs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 13:40:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70d16d5a9so3816089685a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 05:40:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771854007; x=1772458807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uswX/JMJsgtuS2xI3Xq3c5KhkZXJG5Uv/ItRAzLFyTE=;
        b=aa1wfFyuCaveEPI9DeUu7uq7MJmx874v0PhLtZE5oqQ1fZO3CjGt7VWORy+mEklMAX
         ze3HCTKT3IafJN8Q6JlgbDcBMZKPvnH5d9Fn1XU2t5/DeO3OzOQiJAhS2P/H0iDrZMfc
         6ASHKZlMd4mLh/iqKZoTnWmMhNN0/gFJCPACT+imIs1I+0uX8fGi0rsXcZjInuoAYMU7
         G7KnpBg5Qix5j6lL1DD5bjRvEVA/Sw1S20WrN1pkk+59Tr0Zyg44tgjMIcC9Z6Hou6KM
         sB4R3HyT0+qEpqp3QznOZXcu0bmSKpDEXeC/yJ8Gl3F8Mz1gcaYw/Qy/IMhTJHtFBwIb
         JAqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771854007; x=1772458807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uswX/JMJsgtuS2xI3Xq3c5KhkZXJG5Uv/ItRAzLFyTE=;
        b=O+q14e3qGx7cdkj0J3s9PtmYUGiDGH/wan9ZCXcp0eZh4Yd47sdMbYMb0rdhtNEBJh
         aUyukXCGOOo1jkDLRnsFkDS06PRE9AkqB6vAJk/JdK37uww98D5R2RK3Fe7OPCTRAtta
         mWIKTCAtNVFiU/Tytab0wH0z2I2+vdvl23kNTOqle38gLZqie8afGL5jYQok0ZXuobrV
         CB4KxQr45ZH5ksd9qncKW+wp/b+jMXDoWQRLWZAIOe9uQGR76wJsmT3hXdDZnhmj3Z5s
         VGYVD1h0s+t4WOwJlq4TO5W2R/AYuM8ymcD66ZN5OaVh2tPsygGbd1vsuu1rzmhyk3GY
         b3Dg==
X-Gm-Message-State: AOJu0Yzn8cfHp1a7r1POURPllYW35S6Vak6041hmhn1uVbYGdaT6uti1
	3kjfDb9kk0/uDofMQm95kv3O94fFjqzmBf5+2bzF9b0/60ZlcO4jf5qoUHPTCmAq8INjgrRFixK
	EGlBdsHQKAT11kBIcXVqu2FDLmkmAJwt9rHrntP4w+xcp4Q7u8x0Xsf6/3Iu2Il0eH32+
X-Gm-Gg: AZuq6aIiwk6IWMYLrxGR/ox1xh0h4KkDwmlzVjpi0XyeVFCwLRDPV0oCxRCjCaO9TP9
	IGKSnC4/BYgm2qfCQWy3/riym7N2YeMTHCC3shUneLhSNwlLZ1HWPyeQmvyVEBdnANkL3L/BPTl
	BJQbotKzRRkTFQD16kO0gpbGW2ofddX9i5OSgOeI/9YqXXTVd74bRN/pzPo30yIwlQtnSflBQyc
	FVdZIejIwH9LHjEKU6KxbNsnSr/GmCAv86tsbZ3OXMkNsPUxKB4MbEwIbWzOG3xylOf0NYX92j2
	GIkGbhMmzBJIjztFGu3+WgckoY2NYf93FzyGnERmCvlVqEff+GwRvxH0xRvxHuw1m+dzxkYqr38
	S0BOPOtcxU7jqFMdDKoHHJXqKZ1VA92odDuTHE4IrGhxVQFinUEuEZm0=
X-Received: by 2002:a05:620a:d93:b0:8c7:b5b:cea7 with SMTP id af79cd13be357-8cb8c9d1f31mr963923585a.12.1771854006996;
        Mon, 23 Feb 2026 05:40:06 -0800 (PST)
X-Received: by 2002:a05:620a:d93:b0:8c7:b5b:cea7 with SMTP id af79cd13be357-8cb8c9d1f31mr963920385a.12.1771854006593;
        Mon, 23 Feb 2026 05:40:06 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c626sm21323985f8f.28.2026.02.23.05.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:40:06 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        r.mereu@arduino.cc, srini@kenrel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 2/5] dt-bindings: mfd: qcom,spmi-pmic: add compatibles for pm4124-codec
Date: Mon, 23 Feb 2026 13:39:47 +0000
Message-ID: <20260223133950.221234-3-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260223133950.221234-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=X7Jf6WTe c=1 sm=1 tr=0 ts=699c58b7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1S9TnuZ4X9D0nYt2MHYA:9 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: KLcZx3XJgrhYaqXUKVKCwqKCp6Vlde4w
X-Proofpoint-GUID: KLcZx3XJgrhYaqXUKVKCwqKCp6Vlde4w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX27uP+M2ewdgq
 gKJPeHdKKSLiBUEZWKgkwKBHXgwfg4PdO48yM59t4M4gZYhsSska394hXtz4lAPqSquvynz09WL
 8/NKolbTs22PwKmdMcJJHC4U5kjeRL5/z9m/dd0N4ManhspOryK8T7LHVvXVYRGYm9qPW+AzvQZ
 WhLtK0MxwkpBCUvVJdI0lcSNe6jGxxbjSUDbj/+BeB/NfiiboOw5FaAWSgOPq4fmVLCu870Gx1A
 qrTr9B3XqVJ+ND0WmUmr1ePWOdYBqxw40CiWDxGmiFwT0qhZ1n2/Kzxq/gfDCy9LMmpjV5RbzbO
 xi+gxKmXOAs2JTbu908JCfXPZRuCw4o+QN6ZBww1MWDTzDDKd9PjEnefnF0Nbg5t7OYBiiGDZQY
 dkh86bgJ2/Ejv35A9lDsCiys53SznRi+/p3YtFgOhIzA3p8Lhcg+tXryLq1RwZaQ5mBPu5BkGCW
 5RHfHzpVFUK94+OgUpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 adultscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117
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
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93691-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6FDC617724B
X-Rspamd-Action: no action

From: Alexey Klimov <alexey.klimov@linaro.org>

Qualcomm Agatti SoC has PM4125 PMIC, which includes audio codec.
Audio codec has TX and RX soundwire slave devices to connect to on-chip
soundwire master.

Add missing qcom,pm4125-codec compatible to pattern of audio-codec node
properties in mfd qcom,spmi-pmic schema to complete the audio codec support.

Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
[Srini: reworked the patch]
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
index e5931d18d998..f58a85562c26 100644
--- a/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
+++ b/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
@@ -145,7 +145,11 @@ patternProperties:
 
   "^audio-codec@[0-9a-f]+$":
     type: object
-    $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+    oneOf:
+      - $ref: /schemas/sound/qcom,pm8916-wcd-analog-codec.yaml#
+      - properties:
+          compatible:
+            const: qcom,pm4125-codec
 
   "^battery@[0-9a-f]+$":
     type: object
-- 
2.47.3


