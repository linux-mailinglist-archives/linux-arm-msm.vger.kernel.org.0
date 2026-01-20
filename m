Return-Path: <linux-arm-msm+bounces-89863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id h50PH069b2lQMQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89863-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 18:37:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C82FE48B02
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 18:37:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6B5BC8A8D31
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 17:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E3883E9F70;
	Tue, 20 Jan 2026 17:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P1BaEcfx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RqXPd1DR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E4A3E8C68
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 17:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768929827; cv=none; b=Gov3250PqCTiHSl+OOokAEjTr4ZDF763Q7HTPYDDEV+Cyqw1Vd5ID5yPdEIyui2vbYPzQJV35qKJsQiIlshwd8rGkVo52C6J1B60RsSnxwaZmLEpgjeGolRTXQJBgRKiFDQJsnj1jJecrWCmB/cx/Ky84ICH8vqC4xo5D/6HDJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768929827; c=relaxed/simple;
	bh=U9guPNubp3pjZxkbwEiIBcV7mdq7QuDn1LJeqIkMOQ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qkRIT6tkVpDkXDO3ItWfMhVcXc6udtxicUpu/GvMqeoGJYPRWdjocOWJumx3JmxCawpC0VFLbUtqUeuq50DPCfI/Iv7nCf4DA6J3RsUsRtDWPy9I7Tk7A61u/E80G2eqeH7JqWsqUywdaAXxOrZ068i0Wuoc2tn/0gyIJ/UMFGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P1BaEcfx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RqXPd1DR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60KD1Mml384992
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 17:23:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s4aVBB4HkX2CrfOwttft2H+HRgIm5K4NSGBIMJ53yAY=; b=P1BaEcfxU9fAjIsB
	GixtlbWi9IzCUg+oYd8B3846um5QPdKFdsiLL0IjRQQHg9Lu2KTHIXzVICIpMl2N
	OnD3I9p/PsLFv5GoMQnm+d1quEeC/+iqi4Vgwrq3qFYDhXfl4QZBthciWu3KvQ3b
	Pc3tllZh9+SP+WfgPeHdIo5/KV0PMOPwMuFJHmW/eooIH5mv0/azm0tIuHiDoVuu
	4E3VNMQ7GNgDeJbclG1fL4KfLn44b7GQkWR7afLpe/0J5tD6q8CRR9noQbSAIXQd
	H4/Z3MWql3vspwA7+BAaeiAfvdzOCENPGkFfiMaTbEjOloXPkqGexiaauvHUZe6C
	C90BTQ==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bta7q8whb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 17:23:45 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-124627fc58dso4340474c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 09:23:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768929825; x=1769534625; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s4aVBB4HkX2CrfOwttft2H+HRgIm5K4NSGBIMJ53yAY=;
        b=RqXPd1DRcMPnOgPQX/QBAeIYUi+e5+3GZzh9dRsDdC5tG3LeXBydfb0T17nubLLsGt
         U06MapKIkATk1BLQx+01jGBuCjqsZId9ABHDQdHSXOHQv7wWGetThGHxowNJrZWcJFbi
         JH45Scjo0bkP18PPNeJ86rYWyxy0mmhHaptbvYOPHMt0oeOpbqe5N+MpKUb9VX8oOb2k
         o1cRXaosEXzlSp6xTva3IiWMRvMFO/R4c328oTP4Mtxykku6EzmX9Q2n8Va6zinPnxn8
         Dlw+1JDTetBqhkgs/S4sVESMyOiEfbAgPOpR2jMteXrGDusvrjXk/mG2K17Ynkx7enPv
         3YKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768929825; x=1769534625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s4aVBB4HkX2CrfOwttft2H+HRgIm5K4NSGBIMJ53yAY=;
        b=Kpp8GQVF6Fw8gXnOpYeRF7GkI0HOp9TdXIwqEkC+pgWxFrnbF/W14bnKVaM74WTJ0C
         ZB3hfo/ZIlgU4zM47+fP4JijR5cHFLtOpvZ+YWfWin0lJi8GXXhMJnomuAOOhQrgKubN
         kBLGwp8lflEjY9d/kwc4IlQ/1L2YvKsPVCppkXOzH3tLOc4SIXMcCGkSlyOQRzonMtZY
         GY27b3yuZpVPliJDjNqhHaRFlMbDEZX1MzYgkwW86dERwtuNV7rP824zYG91w92Rtp3d
         J/oszCQ25+XsIfSbcDbpClevyRzLbYm1grNY4nyIXQWDGKifr9KXuuR7oOMs3OSiKpaI
         RQOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXuVw1ibzOVnPF2SEpz0gDfeJvAV6ee/TOvn0tKnUgGOUWynGhAe7EihA3qAR9dQaZedxYeG2zHKLzfFV+P@vger.kernel.org
X-Gm-Message-State: AOJu0YzadlhdtvJ3LCCRfthYxnBqupE9rfpFaTdDbclSNBxy27Lsnha6
	mC4m9+nTK4m8niClaogx8Ufn+Hirt6k6UiHaYOrXVw1REUSGjWD59n2vf1szcUnjcGOBWk9rZix
	1j5EfaJw833bIBJJrRmfq7qTho1JoVPdpPJOVwMZRGx++gxJje/8EhQHwgoEUwL5ZkNcm
X-Gm-Gg: AY/fxX4+5L8OHtaWOt7ffOz0HK2vNtG3TCV0/QQ74gRj3NQjgZBrhcIoJfM+/H9mM/I
	/9juGSJc5oRC5T5cmekkQsTffZoaXONCtCR/9ewQSoVAaMFY88db13xfL772fSbGEL+NF+eZ5vY
	wXDHNpwC4pn7iyQorPOVoOTWBFz78qmgulOx5RLY6fIjtRoLh37n9fAtGBi+UaVUiMyD9F2M7Mf
	bMWprL50/orp5fo/I+/Vr8ttQJhDl6XK8krdmb0nchUHbM6MnrxwI2TEu+fQSWAr8HT5TsBbJ4H
	tLxmlUgk/upretMMfIg5bTcnk7HQrYpwGupal7wT3ljrWtl7ErTHizAi2WLAsesGGhMSl3hVAiC
	MRzb1nD4E0v/jTIaDD+wne6FvkxcAZHk2YcmLTwa5i7OmJp3pzHSo4GugA94eRpozucL3RG8AYg
	==
X-Received: by 2002:a05:7022:394:b0:11b:923d:7735 with SMTP id a92af1059eb24-1246a9583ecmr1721521c88.1.1768929824313;
        Tue, 20 Jan 2026 09:23:44 -0800 (PST)
X-Received: by 2002:a05:7022:394:b0:11b:923d:7735 with SMTP id a92af1059eb24-1246a9583ecmr1721480c88.1.1768929823571;
        Tue, 20 Jan 2026 09:23:43 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244af22aaasm18714842c88.17.2026.01.20.09.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 09:23:43 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 09:22:50 -0800
Subject: [PATCH v3 1/2] dt-bindings: pinctrl: qcom,glymur-tlmm: Document
 Mahua TLMM block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260120-pinctrl-qcom-mahua-tlmm-v3-1-8809a09dc628@oss.qualcomm.com>
References: <20260120-pinctrl-qcom-mahua-tlmm-v3-0-8809a09dc628@oss.qualcomm.com>
In-Reply-To: <20260120-pinctrl-qcom-mahua-tlmm-v3-0-8809a09dc628@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768929822; l=1230;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=U9guPNubp3pjZxkbwEiIBcV7mdq7QuDn1LJeqIkMOQ0=;
 b=3b3h+e0CRgHdu92gZr2IUdVPdpvviVcHJ1B1pOdlsKKRNAx0mhyGyYfxpPbUROrD9fY7gnXfs
 a+DdAv25YbZC/rQ8NQ6nAxGOtrjlQfyW0PIOd6qQQwMiQ6CunE52Aik
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Proofpoint-GUID: AN9wDeQlZ72DBx0Cq7yjOqpnGX5O5t8K
X-Proofpoint-ORIG-GUID: AN9wDeQlZ72DBx0Cq7yjOqpnGX5O5t8K
X-Authority-Analysis: v=2.4 cv=LPBrgZW9 c=1 sm=1 tr=0 ts=696fba21 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_GxIMNjxlj-suDvTKbUA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDE0NSBTYWx0ZWRfXzY135ne88PKc
 I+mCHUxrAjafN0yjPLaX4fw6NRw8E1KXUaKMFcrbPdi1NrGUtH0E/6G0eWCaLsDC4VIiBlhBeds
 5qbXfIQqu0+yxvyObSb4O85fCHdK8GGWee7biGUYXhpfHZd762pUPX3ds136wHP1yP0ZVil+Ckd
 VtuGqWdfe3uz3iM+96ueBgZH6Yxq82AbceqPoivHWq13YlGdQiqfDo5Gkkjdj/oclprKWc5CpTk
 xrudelY3epE3jUBpH56KIAcU8iE27HxmvKQNjABN102+tAF351ODWkVKvOzaGdVbs+NFJS3dMgf
 lbgMOQ++394zh+Qmqd1hFrtj1gcRU1/weqQBIgPS8hI2sSBvzermXMUAQIiG3yOVfcd11YzSGIf
 wLmoFBqg8M7g0SYNm6DS98ZiX8rd108u5pXzHfGKpgS4nWzjAiFF3XGN49WO+EXBOoodi/bRdJb
 7pZ4FRXNWvrKg8giVWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_04,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200145
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-89863-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gopikrishna.garmidi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C82FE48B02
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Document the pinctrl compatible for the Mahua SoC, a 12-core variant
of Glymur. The PDC wake IRQ map differs since PDC handles the interrupt
for GPIO 155 instead of GPIO 143 as seen on Glymur.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
index d2b0cfeffb50..2836a1a10579 100644
--- a/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,glymur-tlmm.yaml
@@ -10,14 +10,16 @@ maintainers:
   - Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
 
 description:
-  Top Level Mode Multiplexer pin controller in Qualcomm Glymur SoC.
+  Top Level Mode Multiplexer pin controller in Qualcomm Glymur and Mahua SoC.
 
 allOf:
   - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
 
 properties:
   compatible:
-    const: qcom,glymur-tlmm
+    enum:
+      - qcom,glymur-tlmm
+      - qcom,mahua-tlmm
 
   reg:
     maxItems: 1

-- 
2.34.1


