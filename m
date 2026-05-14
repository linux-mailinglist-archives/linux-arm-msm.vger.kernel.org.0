Return-Path: <linux-arm-msm+bounces-107603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMXULinQBWoPbwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:37:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FBE542656
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 15:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF4E83046F87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 13:36:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF98342CB2;
	Thu, 14 May 2026 13:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dmqJx1Tq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CsxDOp/Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2B23E3144
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778765802; cv=none; b=oDHTMsyPrwtQSh+LXKzmz9CLbHT/z5Ayqv5GkyKrIppg6AuakzqfjU8u/Td2VYDd91TC6PLWpt0PO/P2J5utH1Wpb92yMqy5DQC5oONmhTr+EH3T6hwsNUS7tWqrZpigjt3zHdsckDoPcwrUoTWu+6wIZHbMs7/Eqt9xjdwMHZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778765802; c=relaxed/simple;
	bh=yL3azGaR1EG+jke4+Oh/J0WuVZ/IphsbmycMKWmVH4M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WWFfxECX+RYy5X03jzUXhvUGA2H9eoenBwHsS+aaR3+RXRgclcuegFMokHDoucU5LBP/5/+uMXg4QYu1OjIt1IHWrn+YT2kuxOKc3v9e8hITLJlfLoTtcNkNpvlLUFaKUuQlC9cBV+bjxLZ6a44V5rI5uGRmFp216Uyvr5Ju/CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dmqJx1Tq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CsxDOp/Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64EBeUYl2241709
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:36:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yDcc5y61Vn2jGS2w4NPPGoXf+bnUp6m4zNxFe/LeMDI=; b=dmqJx1TqiEwNLOSt
	hmvxY5oqGf+0f/bHjnYV/JKIg+cEtJuxZumC35xNC27B6a4eWluV1xO8jLfaFqo5
	iXg2aCArSPerB5HG2B8j3KlD8qJ2m091VGN+jpIBRXF5OV8ul0eQCqz45g6Vi52K
	CQ2cB5lEQNwTeodm10uSvSNF/oMfo45dpoS1hiO9ih/lO150Yh3aE0UxRVHPuA+1
	Dy6lpdMINkdz8/fu/4Iv4j2Yu8k6Nbmel1ueEFWJTnzU9aBcD5np3cn5PmX+EfMl
	J5BBkCbrQKqDm9cc6ZwLNhHu/VG0Mi7aWUFqQqqumYKMy8lYyczU52u9CAnC0jv0
	GV710g==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e513gatyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 13:36:39 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-636fce7dc8dso1975341137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 06:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778765798; x=1779370598; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDcc5y61Vn2jGS2w4NPPGoXf+bnUp6m4zNxFe/LeMDI=;
        b=CsxDOp/Z8kt8fA7sTUyyJX+ROjO7JuFKUjD9OyEDmfxaxJZ/gvOzyPY96EhOld8dul
         xuHv5r5lL9NPEs2/xDMYCDxb+o3RsmO7XkmbSUU8lhGpYzo4HavCZX8FgbO6UH5En/EG
         ryWoDeJmOWscsT/Gxf444Ev5jQQs6JEWzvM9zXV9mrGwYKAOUxKUxsF3JCb/8/FF9K0R
         biBEsptlOOPkKIfUDJVkAlpNvspHsjs9+McR7I8aGQ/JZP+G98qTQFy1iBY4M1CWahNB
         wOwMXOOMBJbnXwnlQASgnqJUDaUhb9hyczFbGorVfFnCW8fvZmfCGvXTu3aIUjzKb98g
         mrfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778765798; x=1779370598;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yDcc5y61Vn2jGS2w4NPPGoXf+bnUp6m4zNxFe/LeMDI=;
        b=CLV4uhImrBOvN6oMfAWvw7wxWFvuOUdY6KD2RMy7MuyotkDazVKTr26Ml0/1RJvVPG
         TpmX0cGi9deRZ3rKo8X5qLFnFLLb2FIqYFtCqFaQOpVBr6CDibKCClE6vWEt1jp9nd7E
         IEHtVPbRdMTwskyT6pA3Q44hoWePDpB28gScgO04rFhsLypuVePHkr4Uo0SEurPnwoP5
         GiG/SSOyxlvFdwwamUspDJaE9R56yKWw7+7k7YH5Rm/mpjHka4l4nI6nIOvN3WxLohay
         Lc8KtKgo/IGnC9xML1TRzSG+vUX7WUdbWlrdb48vvrW7dcAvWzNrEcRvBoCxa1E108bR
         txCw==
X-Forwarded-Encrypted: i=1; AFNElJ/TRwrqnfGtORgNumzstMIAp9DQlxd/jMx4zRjMeBrBnTUvoDmI4GnKGRoVqgtyGZMLhKwHR1/t3mrXbN8V@vger.kernel.org
X-Gm-Message-State: AOJu0YyDr+0wC83JLsH2Z5px1M5jkfXnSCo3K8LqWl+LC1Xpx66tgb/U
	zUyz1WKQRdczXTk3FzM8W64b2Kq0oaYfEUfzis8xbT3rUa0aAYUcYZn73tDGi7p+bmnZdoMFwYi
	n39OKM3wNKiL7AXCjDWVzHPiwdh6ofjHsmRmYgcjWllF/Z6TEXOqcN2aRfeM2PRB0KzOedyZz2r
	8J
X-Gm-Gg: Acq92OGDuLjWmmWv+ctYQLJa+fIWn+IO7+GXGGRcMii3wKBoU++HsdvOEXNSBoEkx+b
	XKi+7+lG8/nNC+zyY2uunjgMXsI+eXo7cWBGmNppXCm2+kkxYRxKmbs0K28geh6rDmHOYCzClDl
	44vtzIxwI/DhL5hvRzHJsElttGiENlywqiXTEjy32LTpsfzPb3jz1W0/ptyjAXjtEddW1qX8GYY
	R0lxr3sSV1UpTJ5wFVlcydFUo/IZPcfZOBiRzyNHCP2HcQP4exCUzZV5tTysdfxyQY0nM2nY7br
	H/fvPteB98WgnXBjsbXMikMKiBhuA3hDFo0oSbl0UYEYSoCM/dg4z0/sLVzPS57GSZnyXfDw8jU
	6WoruNOHKYirDuTFDA+RmXUG34dlR+w==
X-Received: by 2002:a05:6102:5a99:b0:611:61d3:819c with SMTP id ada2fe7eead31-63771d8ea40mr4324034137.10.1778765798262;
        Thu, 14 May 2026 06:36:38 -0700 (PDT)
X-Received: by 2002:a05:6102:5a99:b0:611:61d3:819c with SMTP id ada2fe7eead31-63771d8ea40mr4323887137.10.1778765796521;
        Thu, 14 May 2026 06:36:36 -0700 (PDT)
Received: from hackbox.lan ([86.121.170.241])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec39ff1sm7382462f8f.10.2026.05.14.06.36.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 06:36:35 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Thu, 14 May 2026 16:36:23 +0300
Subject: [PATCH v2 1/2] dt-bindings: interconnect: qcom,eliza-rpmh: Add
 SDCC1 slave
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-eliza-interconnect-add-missing-sdcc1-slave-node-v2-1-13c03bc890cb@oss.qualcomm.com>
References: <20260514-eliza-interconnect-add-missing-sdcc1-slave-node-v2-0-13c03bc890cb@oss.qualcomm.com>
In-Reply-To: <20260514-eliza-interconnect-add-missing-sdcc1-slave-node-v2-0-13c03bc890cb@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=873;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=yL3azGaR1EG+jke4+Oh/J0WuVZ/IphsbmycMKWmVH4M=;
 b=kA0DAAoBG19EyQCVFVYByyZiAGoFz96g8/5+8KpDojp9w7WQjxhmxuFBPEaPQLAFHaVXnK3NO
 okCMwQAAQoAHRYhBE7z7hFOeo8qyqfRuBtfRMkAlRVWBQJqBc/eAAoJEBtfRMkAlRVWXOYP/0Tg
 sKIEnuYCq0v2K9HaquzXFu1KeGRMOvDFpKad2VqUImy5BW3J8GxheLTTIboptkEFym5qE0u8+aZ
 mRfSfdKkK+r+/8kybJZ+IjOOYht2yQo2ljiGHUc4hQYaaM+mpWkgoUzTHuakQr/lWi1EhXoydtL
 nQPf3cDxqHP21lcnFnAWUJNY81CmXKAgXTg5DCGoP/qU5yCKjnX1dgM7dG84FGGThzBNBj1QCtR
 kQns7raiab2Pji1gc9RNvvj2pW7e4JyK7GmulqDFQy/wb7qansC+LhP2Cj87vrdNa8uDlWKJBod
 1eDBgqBhg0g7k840Sx+ZlEN+Xz4bPFhTUpl9q1V4p4l6izxu8pT2XijUcB5wcjdHP/sjRmXjETA
 R3mF4igR+3ndbc9bAPmgFXKNeAhvb30KPby3VwvM7/KCsCswXrWZR/wFw4oW734A3O2sQ52cnG5
 I7WVaSbkuCqvSRHg2kJofQLkB+sRTN2HUfWH/i0UzXC8d5pUSAvLGR5+17Rs4z+TBMD3SNQVZTg
 OfBwTpCTGPGPIdGJsKa/v4z0Fle58eoBkonbXoDzZPdflGOs5ouIeMDGqCXKxWFkO2qLaZtaq/7
 Dfh5AY7TEvmJfTH3pq8rE6UBKs//4kxVyZtVDuBLq47KA5BXVJs6jjC5AjKsFTz2IhKl7EA4B6o
 oRFE5
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDEzNyBTYWx0ZWRfX0w150kLZryF4
 GEMgDo0mv/hE6DmD23mnK8kh8f7r4HEcswaFnl4Omk/hKrn12SX/plIeg1RV1pP2Dz1MHd6B67Q
 Ts5emCRlKMRPL0B/bWIFt6WDFAG2p9lh8kMlfOgerSVtoXII4CLwFssMsju4KXB1CSRcc94YfNh
 8LoOJOOKBZtcmdfpJN9/b5ZfDKBep541bNh716kjySJ2dP3DpS2SG/VeYRvGCTpvP7vtwuUE5N6
 x+gWehN2G6qVyA3PEsa8ppK/X21IpRELBfYHNSy9U0ATs1CIZopW+1I7ZkFeCNAnx4TUbB7f0Qx
 5jIfIvlmYE1Gf+iTMdoFGBz4TKTEOuM4lPlw4bM9nwzrVLAII+gtUzHnGezwnNK0ctb2oIR4zZ9
 HItqGO2truc6Zk6Eao8COP6ObSSP03y2TFtiz2nFprJX3DT0zBSduGNh6Xf9+5mn0dvlNOm6G7x
 gfpqSKs6BaFme63ul7g==
X-Proofpoint-ORIG-GUID: omX5DnX9loAo1iJ8V_flwO76-1K8iEXt
X-Authority-Analysis: v=2.4 cv=Iba3n2qa c=1 sm=1 tr=0 ts=6a05cfe7 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=NtgjAHhJo3Q0P2g9Zl9R/g==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=GI54HwGG6_AAUWcoLvwA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: omX5DnX9loAo1iJ8V_flwO76-1K8iEXt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-14_03,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1015 spamscore=0
 adultscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605140137
X-Rspamd-Queue-Id: 57FBE542656
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-107603-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

The Eliza RPMh interconnect binding is missing the SDCC1 CNOC CFG
slave ID. Add it so SDCC1 consumer can describe the corresponding
interconnect path.

Append the new ID to preserve the existing ABI values.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 include/dt-bindings/interconnect/qcom,eliza-rpmh.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/interconnect/qcom,eliza-rpmh.h b/include/dt-bindings/interconnect/qcom,eliza-rpmh.h
index 95db2fe647de..dfe99feefb27 100644
--- a/include/dt-bindings/interconnect/qcom,eliza-rpmh.h
+++ b/include/dt-bindings/interconnect/qcom,eliza-rpmh.h
@@ -57,6 +57,7 @@
 #define SLAVE_PCIE_ANOC_CFG			27
 #define SLAVE_QDSS_STM				28
 #define SLAVE_TCU				29
+#define SLAVE_SDCC_1				30
 
 #define MASTER_GEM_NOC_CNOC			0
 #define MASTER_GEM_NOC_PCIE_SNOC		1

-- 
2.54.0


