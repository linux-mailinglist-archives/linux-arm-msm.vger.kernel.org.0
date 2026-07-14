Return-Path: <linux-arm-msm+bounces-118934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id JrCKM73HVWqtswAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:23:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 239D1751182
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:23:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AdAmDrxO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WuY+BWV2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118934-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118934-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CF0643052B54
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:23:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BED13264F4;
	Tue, 14 Jul 2026 05:23:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B079931F9AB
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:23:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784006583; cv=none; b=VXrqYfVwKedAJ6C9EFUHCDvcVYBBGS+GDIsD8jJYzYwgCe6BR84eBf7okkrCPCyh+mRErX7hTl+YUfyZin07xJ8IwGLtng6R7rmOuHEiWJvRwUtCKLqH6SzPKGOST5TutAJBLfYQdhHVwqlUGzjQbVw0PoeiZCr+7FS5PCe5b9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784006583; c=relaxed/simple;
	bh=rS3MvqNewoAeiT3D77tq2VCGJ+QrQtS/FkD4B+sxN9I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N2L4hbip2e47wTDru4ZTwovKqNSF8twG0HQjf5G4/3dIZFLwX/OJNq5bfUNHK7YcDTLzOy3uw5Yr3B7Fbx0xQlpoKVdbqceG3l8eb3a4Rd4Ps8e3m59JKpM7T2wiAbzpbxBWb4u3EBV12C0hBBfWRJrznbPecSqsE7lHscz7a6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AdAmDrxO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WuY+BWV2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E382fl3556536
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:23:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YoYKvpOYfu25fIHCUybwPxL2RxGRDTZpOhbX1PIoW7o=; b=AdAmDrxOYPYwBkAl
	DYOsmuIkXaKEzlSPltl4vOZgzq6zee6nETHpdQ/UcqgcwJX3MEGZdQ7wuAM9Kdui
	ZVB77wRzKZ92+1u0Pvxmtarb40xU5PCWGEQXjE8socchIX2HzpKvW9WMnJOYUasf
	x+bJ15pXY+kkOms56ACwhgL75p4SRNNRmr39UHTDbZGKBfiUT3bmxO2KnK4ObnDs
	SJloBq4mP/90TN/A0jI/9uWv19icThpA4Ri5c6VCQD4f6VFDhHX/aDYgXgD7DTIN
	kr6FjzGZ4oiTEU5VwQCj/dQf7TsXNMJVJcskPa1QWKP6M7c5lpwdo/9rJVCb5PAD
	+H2l5A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44ct3e0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:23:00 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so598590a12.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 22:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784006580; x=1784611380; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YoYKvpOYfu25fIHCUybwPxL2RxGRDTZpOhbX1PIoW7o=;
        b=WuY+BWV2E/dZrMSphV/toIHDttxEVh5Mcbb+C2twnHiu6UMVRfkkg2Gdtyf66pjyUm
         oQBYn+oxp0FVEjdfnLPww4q049Tpdf0Z8W4RzDn824FlX8p8nEYEBecv1GRdQSIJ5X11
         s8hi/6vxRa7DcwcSaupwtix9yai6XSrIh6rjkgwL+8UkhEn/k+JpgkW6odMOpUh3m2eE
         wgJ7iM212UfQcU6yZPw3nKzxqkiLCNg6rUp+rdmWkxn7nw05vXU8Yb251y1lBc8kgxmo
         ncdOZKog1Wr3qljpwdEFIg0ZfhE3LJvBGllfo19EVpp9kaKaSejt+hmoL+XIK4iSv2h8
         QwKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784006580; x=1784611380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YoYKvpOYfu25fIHCUybwPxL2RxGRDTZpOhbX1PIoW7o=;
        b=bf3ateygQUT/FU0Ia9x/xDq+DAopf7EBpIB0n9ZtFpQV+laolwPqH0v7z7LhoMnE4B
         GjXIldEwcve28Ccxwxfm7ZuEsztsNqyO8cIPVPqS192zPuXmj2obp1vBNOKoxADePFo/
         Wv6N4B8GdMKmX9o5wnQnwlpAU8MIMxmLTFeAtX/cR9Tqf4gB4Uyldb707dBwYGBOZL4+
         8tDag+1q6EnmBL6zgjmwLcy0Kljx9txEauts5qEnMTS+TcqxxwT12ge4vTww56W5XMHG
         h/+Uzz1uZewgqs/cnk+FvSuKynt/gip9jq3YXhw5+viXeobeDubH9MKH+UcAJzljQZub
         6rGQ==
X-Gm-Message-State: AOJu0YzeLmo4rMavyZswQciShM+EXBUb0QtmlJ6d2u7WYLFj7dorWbxT
	hyenzZsO22LijYQP7veYrWJo0GOF0iJz7lnOTQmPFafB2puAOSBACwaaSvxrLmazf6mjMtYp7v4
	95W5bweQEUiKp8ZGhch53iDjBDkm8w8j8KRYQTnQSgdL0XfdRVbCwBq/zceSNJHABdUTOx8oONp
	1+B1I=
X-Gm-Gg: AfdE7ck+cGrRWp2P5D6Hc9UMzKw8y0TpMrQT0u8x55Y8v2Lev2tZAIJax31Uhs9vFQU
	ap43HPRacSHYGGzkMkRTeUW4111KqgviAi5f7MYC7sfgPpZvtpsVQo5h9Tibj4fBVgi7cZBsRy6
	T1X+TAx7YguzYjnm8fhTrM59oTekgoyStkw39VUTMphTo9yBHnI64KxyEBQ08xK/HXMEwMJd3LS
	dU+7YANidD/0peCrmc1ryTXJATzjDrU3NfaGIkNAEff0U+aN5oD6N59+QwON9kl2kt2JEC3mB8q
	O7yTI7blurjSIr6V7RVMk4Wla+MsgNper4vP4yJNSKLe2wO+17TpNvDyeQk0A8/spSAyKjHzc6J
	z/YdqQdZ+4SSnosAuQgxCPR7t3I3RJm0OyOgptZDoiZJhxGq1AHLyCv3M62k+w5A=
X-Received: by 2002:a05:6a21:7701:b0:3c0:9c1a:8951 with SMTP id adf61e73a8af0-3c110b34ff1mr12051429637.73.1784006579991;
        Mon, 13 Jul 2026 22:22:59 -0700 (PDT)
X-Received: by 2002:a05:6a21:7701:b0:3c0:9c1a:8951 with SMTP id adf61e73a8af0-3c110b34ff1mr12051375637.73.1784006579407;
        Mon, 13 Jul 2026 22:22:59 -0700 (PDT)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174accb0esm78609864eec.30.2026.07.13.22.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 22:22:58 -0700 (PDT)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 22:22:54 -0700
Subject: [PATCH v3 1/3] dt-bindings: input: Add Qualcomm SPMI PMIC haptics
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-qcom-spmi-haptics-v3-1-c931bb7cb94f@oss.qualcomm.com>
References: <20260713-qcom-spmi-haptics-v3-0-c931bb7cb94f@oss.qualcomm.com>
In-Reply-To: <20260713-qcom-spmi-haptics-v3-0-c931bb7cb94f@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>, kernel@oss.qualcomm.com,
        linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784006577; l=6254;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=rS3MvqNewoAeiT3D77tq2VCGJ+QrQtS/FkD4B+sxN9I=;
 b=u73MK8Ri6wtOpWB4iDqyHgoiRhLmRGa1q80W7ytYqJo4GJBPiEFg+SRvpE7ZIO1SWvDeOPKsR
 zHWvMWG2NLrC7BhlR8DmSFM0/x2FoWJz0jX6+gqVNIDIUxvEFO+WsSw
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-GUID: EZfm2MnvoYQd4JQGFkdwKXWgYDUDCDB9
X-Proofpoint-ORIG-GUID: EZfm2MnvoYQd4JQGFkdwKXWgYDUDCDB9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA1MyBTYWx0ZWRfXwuE11gZnGw5r
 WZkK81X6/x3Pgottc8QjyvuGqhbf8fKQk9gFwTrPICJibT0qw2WQ1bG4VVvDZPz/ykfwUS5lvM3
 iVKYzP3/WUZDjq0w4B6Ezx3fRwPKXgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA1MyBTYWx0ZWRfXxtWzmKlCFTs1
 +FqAnKxHC5DDRihQKGjroLP8xnhlf3bOLgSxqnTz1Oy7V3NQCnmi3wfadDuOt5x8YQMNSkVshgQ
 TfuV6H//To6PgLYAdQfLViDgyL/NngBS0uG0p4PNg1QE4gQ/vuJgCS95tSxD3asBMxkoryEBgfq
 rwl+6ypntt2fh3fJMP72wBw2WiAlTl5ZkM2R2PU3wpUYHcWKU8jM5sQdrMVziqufYZd7sUaUI+t
 u+89uZVoRhGLp97dPOZ0LKGc+eBmq7nYMRMImepDei0k/WtJ1QkMR2RhDjZe32BTxGkRUd8TtgQ
 d8/aJIPxjuEcij4/COTb0cMZ+zKf5a/VzVwr5H/IjxC57IHNmfJglc7HF2oZVn4bujK765SG7Gl
 V9dePDxP7Ds05eD2nSk+mXr9aL8KR6plUfVO5uxvMi2u/cv9J6A3OvVb+B2fVMHrkHNbTyBIpVH
 0Q+wYKzu86B4FnFCN7g==
X-Authority-Analysis: v=2.4 cv=P84KQCAu c=1 sm=1 tr=0 ts=6a55c7b4 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bI6yuv9Qsz7HNVLwNVgA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607140053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118934-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-arm-msm@vger.kernel.org,m:dmitry.torokhov@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lee@kernel.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:david.collins@oss.qualcomm.com,m:subbaraman.narayanamurthy@oss.qualcomm.com,m:kamal.wadhwa@oss.qualcomm.com,m:kernel@oss.qualcomm.com,m:linux-input@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:fenglin.wu@oss.qualcomm.com,m:dmitrytorokhov@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url,vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FREEMAIL_TO(0.00)[vger.kernel.org,gmail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fenglin.wu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 239D1751182

Add binding document for the haptics module inside Qualcomm PMIC
PMIH0108.

Assisted-by: Claude:claude-4-8-opus
Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
 .../bindings/input/qcom,spmi-haptics.yaml          | 136 +++++++++++++++++++++
 1 file changed, 136 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
new file mode 100644
index 000000000000..b1a69e9886ee
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/qcom,spmi-haptics.yaml
@@ -0,0 +1,136 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/qcom,spmi-haptics.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Haptics device inside Qualcomm Technologies, Inc. PMIC
+
+maintainers:
+  - Fenglin Wu <fenglin.wu@oss.qualcomm.com>
+
+description: |
+  Certain Qualcomm PMICs integrate a haptics module, such as the HAP530_HV haptics
+  module in the PMIH0108 PMIC, which drives an LRA (Linear Resonant Actuator) with
+  an output voltage up to 10 V. Several play modes are supported in HAP530_HV:
+
+    DIRECT_PLAY: The hardware outputs sinusoidal waveforms whose period is
+      defined by qcom,lra-period-us and whose peak voltage is defined by
+      qcom,vmax-microvolt. The driving amplitude can be scaled in the range
+      [0, 255] via a single register byte.  Hardware-based LRA auto-resonance
+      tracking is enabled by default in this mode, allowing the haptics engine
+      to follow the actual resonant frequency of the LRA and update the driving
+      period accordingly to achieve stronger vibration magnitude.
+
+    FIFO: The hardware can play an arbitrary waveform composed of a sequence
+      of 8-bit samples at a configurable play rate.  Samples are pre-filled
+      into the internal FIFO memory of the haptics module and continuously
+      replenished via the FIFO-empty IRQ until all samples have been played.
+      An 8K-byte FIFO memory bank is available in the HAP530_HV haptics module,
+      shared between the FIFO and PAT_MEM play modes. The memory partition
+      between the two modes is configurable via registers, and FIFO mode always
+      uses the 1st partition starting from offset 0.
+
+    PAT_MEM: This mode is very similar to FIFO streaming mode but without the
+      data refilling capability. It is designed mainly for short, latency-critical
+      vibrations. The memory space for PAT_MEM mode must be reserved for dedicated
+      usage, and the waveform data should be preloaded and remain unchanged
+      thereafter. The haptics module can play the waveform data from the memory
+      region specified by the PAT_MEM play start address and length registers.
+
+    In either FIFO mode or PAT_MEM mode, the following play rates are supported:
+      -- 0(T_LRA): each FIFO byte drives one full sinusoidal cycle with the
+        period defined in qcom,lra-period-us.
+      -- 1/2/3(T_LRA_DIV_2/4/8): each FIFO byte drives a half/quarter/eighth
+        sinusoidal cycle with the period defined in qcom,lra-period-us.
+      -- 4/5/6(T_LRA_X_2/4/8): each FIFO byte drives 2/4/8 sinusoidal cycles
+        with the period defined in qcom,lra-period-us.
+      -- 8/9/10/11/12/13(8KHz/16KHz/24KHz/32KHz/44.1KHz/48KHz): the FIFO
+        data is treated as PCM samples and drives the output with an
+        arbitrarily shaped waveform.  This mode is typically used to define
+        custom driving waveforms for specific vibration effects such as fast
+        attack, crisp brake, etc.
+
+    The drive voltage in FIFO or PAT_MEM mode can exceed the value defined in
+    qcom,vmax-microvolt to achieve a special vibration effect, but the waveform
+    must be short enough to prevent the LRA from being damaged by operating at
+    an overvoltage.
+
+    Also, hardware-based LRA auto-resonance tracking is normally disabled in
+    FIFO or PAT_MEM mode, as these modes are intended to drive arbitrary
+    waveforms that may not follow the resonant frequency; autonomous hardware
+    resonance correction would interfere with the intended output.
+
+properties:
+  compatible:
+    items:
+      - const: qcom,pmih0108-haptics
+      - const: qcom,spmi-haptics
+
+  reg:
+    items:
+      - description: HAP_CFG module base address
+      - description: HAP_PTN module base address
+
+  reg-names:
+    items:
+      - const: cfg
+      - const: ptn
+
+  interrupts:
+    maxItems: 1
+
+  interrupt-names:
+    items:
+      - const: fifo-empty
+
+  qcom,vmax-microvolt:
+    description:
+      Maximum allowed output driving voltage in microvolts, must be a multiple
+      of 50,000 uV. This is the peak driving voltage in DIRECT_PLAY mode,
+      which outputs sinusoidal waveforms. The value should be equal to the
+      square root of 2 times the Vrms voltage of the LRA.
+    minimum: 50000
+    maximum: 10000000
+    multipleOf: 50000
+
+  qcom,lra-period-us:
+    description:
+      LRA actuator initial resonance period in microseconds
+      (1,000,000 / resonant_freq_hz).  Used to configure T_LRA-based play
+      rates and the auto-resonance zero-crossing window. It could be also used
+      as the initial period if the LRA wants to be driven off resonance.
+    minimum: 5
+    maximum: 20475
+    multipleOf: 5
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - qcom,vmax-microvolt
+  - qcom,lra-period-us
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        haptics@f000 {
+            compatible = "qcom,pmih0108-haptics", "qcom,spmi-haptics";
+            reg = <0xf000>, <0xf100>;
+            reg-names = "cfg", "ptn";
+            interrupts = <0x7 0xf0 0x1 IRQ_TYPE_EDGE_RISING>;
+            interrupt-names = "fifo-empty";
+
+            qcom,vmax-microvolt = <1300000>;
+            qcom,lra-period-us = <5880>;
+        };
+    };

-- 
2.43.0


