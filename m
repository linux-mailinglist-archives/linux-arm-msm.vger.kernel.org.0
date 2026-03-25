Return-Path: <linux-arm-msm+bounces-99959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIG5Fh9jxGkuywQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99959-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 23:35:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 45CAF32D0FB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 23:35:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6AB7F3026322
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 22:35:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAA43491D0;
	Wed, 25 Mar 2026 22:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ku+XI97H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CeeMvO9m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B36DB372B31
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478105; cv=none; b=UV0/bTtki/3T2rR3Q6ssNjg8zpom6iFsTHKZhKDiRjqXQzystTyM/0C1M15OIMCH9vFxCtD0AGqA2nCH2xnrmJE43MPQJxcaepjAQKfupBPclLbVfI0A/Dj6N4HXzrFjeluAESPgstYC8P8IbIpEEr+ZAI3wCfZZ5ZxEB+WfETY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478105; c=relaxed/simple;
	bh=Vsu6yvOPj0Ebw9fWmhi6DvD27dNsT3H0Kr/1dRZe9G8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kIXKVAAS8MTPF12XzZMNBDrkFs+5lZoqx0LbcjQEzjodhcCP1L4MnzSmW/SMYaTPzPYj06XZpxkBHSwZrZsR+L7UOND9B6eOI8Br/WpM1brILN5TbhuUipcjo3qOHfXLsVKVnDOgyj0pGVvqBDvtBPd+tEhLC+DqMmAZVwnBr6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ku+XI97H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeeMvO9m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFHIwG779775
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cSsuaR2zlios1+Mhi3FYYdxcb1QOyHXrIYv5McWKyVk=; b=ku+XI97HO+O8wvbI
	0GAxSQoyHHh5QQ+hxFCw4TMWXfz8l53Y3TTMuz4MM8uVODAzHQmXGn4SWxfER7Q2
	lUbHgNlRue/g3q6LG798XAKJstgpi9bmcExUgXUIc6tJjdJpDUjQvv2OcJFsdRzF
	7VXo1ir3emv5xpTNukxowtNkbCvOqLyRr9PNksmqOL/0I+/7hLP/5Ku0y4sAD38P
	OELt3iysYK80xKJLJ+5XRCAWtFmRD+MyiRtv3CmYsDbE30solVN6+nZPCK1lcuQJ
	K1yuP7a2Sn6yBYEdFrKxbV/oj8BUh57hbbTagggh7nc23Sp+KKfYKVR5NXFrGNeV
	/hK56Q==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4cvp2sx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:35:02 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-463ee33f9b2so386617b6e.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478101; x=1775082901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSsuaR2zlios1+Mhi3FYYdxcb1QOyHXrIYv5McWKyVk=;
        b=CeeMvO9mHy/yWvY41WMP3AjF/znC0hj7bWI3Y8ZbWG/PDzpld209R75HudvHLSSoqB
         866pBigDgOIKnTDxYymNjrnd3eqNccHeOogaKW0Gcd1Ipmh6gqpo/H/GfaJ3EP1yexCL
         tBuszqsiiLEFmnGZ0/B4l37UvTeU/5/vpOFegMHTppTUHFhiOnZ1qE1LuxL9b6Y5VtY+
         Sgs2yP6qBXAjpDdk8qYL35o8Wy28OIHqbQGB0qHKLdoYuh0rmlBzyWNrJ5s/lkc8d4re
         C64d/HWPTO4PDem8S8qn2AIUc+3MdZKD/k8zbAVa7dJxVfd0N0XxZpWnqWPw9ICJol3T
         p2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478101; x=1775082901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cSsuaR2zlios1+Mhi3FYYdxcb1QOyHXrIYv5McWKyVk=;
        b=pDBFjkv8iql6Y3jh1WtL4Mb3VI09IA2LWkPOPsGFfhojkpHdT/k2zOQQkNKcXqerYW
         LQtnXgob9R1xf+r3bXrziYFumR8iijd/cDPorvfZXVaDEXkErUlb3ZWkXqFUZzvKgCxt
         bxobf+ZF4drTuid0V4pxCeeKjTjgRDDzU0nafjsTzr7O9nEpBvOztdu7g1uG+9FYFMCa
         Cp0y0BnZGF0jl79h3wMEm4V2NPDOxxB+tbxJDq9X9g6FXUK//hyrLrjIZvBOexVlj7KQ
         eVhVNWnS5WOaj4cr8Myg9tXMj5OyE2P0xjg+SJh4YkhuVqYX5kJkUS6MsJ6EjRTS7YYv
         mhpQ==
X-Gm-Message-State: AOJu0Yzkt8a3azV/0U7TDaE8VTQzD88am4mUNvy3u2ox+3xDPC2tmQbK
	CCeaCS//tZ2HSkRVBiUitneUJH/RaMWXt2Z1UdrJe6DBC8lD3vDopomh97ILg0rYGfOc6SBRilN
	eZdNmrXFrGWB+9RTrRf1Wab2Skc95HjH4zMvnazJMBv4gNaE036qEHWnBB1EeVxY1O2Rw
X-Gm-Gg: ATEYQzzX3LOBuVRBFc9ltoIb5G5uH2ZMDnhC69wy9SqDW50BgCsnizdhYXxW6Fzgclx
	8wHqc+IoPm91J/CG8UIA8D9Cx1xEduuBjE7zzfrHOKXszfP+6pqdOugVHGzRMbt7Bc5+0s96BjB
	lYqmMrAMtV1SV3GWJRgxFsunZUnyLp8xBHT5K44ciQtvn/NPWOMQ32okICQLEwHvwMtD5MF/v12
	SAQEqg3x1WbBhUJXhZ+sad9h6xsXM2WAu6qxQxVpjKXGN3FPaWazCCfll/fTHPjScMPiX3wC+wG
	VyEWfoYaII2lhCOUA/c8NsQUWBcRnBCXIMWtPJCV2ejoIXt8azvUF5F7BusukTLyqhkNG3qyqH0
	RzsYKCIS8eMenSz8tjXs5LCPE2Kjm28DNwyhdOFFEujA=
X-Received: by 2002:a05:6808:c1b0:b0:467:1e5:6764 with SMTP id 5614622812f47-46a5c7c06f8mr2524459b6e.54.1774478101578;
        Wed, 25 Mar 2026 15:35:01 -0700 (PDT)
X-Received: by 2002:a05:6808:c1b0:b0:467:1e5:6764 with SMTP id 5614622812f47-46a5c7c06f8mr2524435b6e.54.1774478101153;
        Wed, 25 Mar 2026 15:35:01 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46a70634941sm565790b6e.3.2026.03.25.15.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:35:00 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 17:34:48 -0500
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Document the Lenovo IdeaCentre
 Mini X
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ideacentre-v1-1-768b66aaef30@oss.qualcomm.com>
References: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
In-Reply-To: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vsu6yvOPj0Ebw9fWmhi6DvD27dNsT3H0Kr/1dRZe9G8=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpxGMSurcbSWpzV7iaIWqSij4EBag0RU6PFBqxW
 WRyUDc22NOJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCacRjEhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWOig/+KIZp2YZyEknnQ357s7+Tlq6hUgIFLN+WnHjtA8U
 jNzYSJdA7HRqpjk/gUUAA/vx+E7MLqQBE01i3CPCeIoieEmlshGmEc4OJgS/97o3YOKhSTpiRD7
 UeJJjxJ7XX1XrKCGOCdWxjNcdaZk7ARP+SYCHSKhqq7p+sSSJuFsqTzNb/j9mrkIiir1DnoX4Rz
 SThixOPPn8GrhoHw5Ud0bXiEKmhBI8nuNH2eibUrhpNUBL98ExVrkdF+Ik+G0juwaxxPftZ9u4x
 ai38Bkio2w2xVUIz21DPyK72RJZiehpTUPo23K1rreiCFyDYrm3PyP461Lc7yzzLuI9G4Cxt78H
 TAZIb6rU7EUdQmuuYBJs41w4FnfDrnJ6S1bcSVq9nvC9Fah+0TcB1CwB8W6jCzRwSQQsJ1of/hF
 tedesREW5tsk52spexN/dW/MmrL2ZyPSAUmZW4XiiQvc9IapZR+Dk5H6sifo7dgEck0rRed714c
 SfVaeDvybZD2CYsnLtNQYjYXS4ZHqxR9w+5P0wr1JTl5kGkgr507wMxtwb1KO2Znp7WpFE96bK7
 dPGUPI68azxMjsM6FQFjMI8XiRxDxV7YmJGY9+TwjmDiVu9VrdV8xxrxkuuExvAS9DDB2QR3UKv
 liYYzXv4eQOAyHmOL8Et1liTmW3PBNAYvKkCnikkZW7k=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-ORIG-GUID: XzHM4agXe5mqAvq56YYUmr8k0PM88fut
X-Proofpoint-GUID: XzHM4agXe5mqAvq56YYUmr8k0PM88fut
X-Authority-Analysis: v=2.4 cv=Q73fIo2a c=1 sm=1 tr=0 ts=69c46316 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=RTJPypKaMN8Ns2IMXk4A:9 a=QEXdDO2ut3YA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2NyBTYWx0ZWRfXySBKx07+klMU
 eRNc4MXw/lEJtRr6iz+J2LT3QNUJZycbiZo87mhjFm9V5BQCL4YfmwrBvZJMnOXWCgAbOfqsG09
 j4jXqRHwYVwEZ5eW7Yd0LKedNiLKDiKg2Drkw+82gcoViA8mtK3cJRyLUTihinGUcwgGQoGDKgU
 OvEk+NwvRt6EtfiLuU9GnXim3Rp1Sa9j6OJZthYmLsl2URd7j9Zk6ctZufcnDWm1eNk5sH5fy3f
 T/9Qj9c6yOB1P9+CGUKtUkwXuR41XIrBuIjBsySB4NrgMimIU7j5YKBgMf/Eo+abKav2P4vJfPB
 0vUuNuoaGhCsOIIwmxyZNu3CRsLHVMV0xDx0RXPsshDHePzUds6cfuTHyFPTMj+pH7vOF1inoaL
 hprgcOYOS+IQO8gqnK7Xg6G7xfK8/SJ5tULMh5xwJ6rBf/XWByAU6QvSRn1xLsaWd0sHS57eeMM
 maWvfFFN3KFZJwxxqTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250167
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99959-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[bjorn.andersson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 45CAF32D0FB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The Lenovo IdeaCentre Mini X (Snapdragon) Desktop is a Hamoa-based
ultracompact desktop PC. It provides HDMI, DisplayPort, USB Type-C
display outputs, 5 additional USB ports, Ethernet, dual NVME slots,
headphone jack, WiFi, and Bluetooth.

Document the compatible for this device.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9f9930fb9a5e9cb76f508c1f2e86da6ad9bb44e0..0ab18e9b97ac0c6df0f069dc5b985c3df48f09d5 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1142,6 +1142,7 @@ properties:
               - dell,xps13-9345
               - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
+              - lenovo,ideacentre-mini-01q8x10
               - lenovo,yoga-slim7x
               - microsoft,romulus13
               - microsoft,romulus15

-- 
2.51.0


