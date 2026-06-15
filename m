Return-Path: <linux-arm-msm+bounces-113094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +Pt6EeyhL2oSDwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:55:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE7D2683F5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:55:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=g0gmnyGs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=UQxCrQz1;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113094-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113094-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4822C3005A80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 06:55:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9FEB3B42E6;
	Mon, 15 Jun 2026 06:55:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9903D3B388E
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:55:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781506538; cv=none; b=Kgp6njyc4AiX1g+gij99vKWqMi6S+Tdedr0eVGI0yui56667ckHwhOQb80MJ9e1reYHwaIsVukog36rgfsDVSzWOszlA2d873fxRPuwgi5vuiIOyjtAzApmVBjRYGAAcx/iUFXfMGQRQb3PfNNM96t2I6+ZNTCslqGxztuaE8LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781506538; c=relaxed/simple;
	bh=a7DZ+9+4fIbwpZO2uG3g+W5R1OjcQ9AkslG3kjBbpc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LOfVXjvmsSXXs5IJY+3YTSpYXM62a8RIx9fgNf9vT09uiP1LyxTR9tss2HKAyB7yZnwRLjXGyyVBXUAzc+3DMWE7EqLPodsC0lp8ybL03Ieu8zE5QzbSy8Yz/szbaFDV121B/Hv6jkz/U+R/gRuuCLEYyCuFziMNWbcDogba/pg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g0gmnyGs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UQxCrQz1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F6LSDB3889547
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RCtOIVtWRXG8+knNFwjLUUhkwN8I2zj9KCq3Wg6nM5I=; b=g0gmnyGsBZ/Fy5P6
	NNoxNC7a98nacGEzFckt7Ro1m04gxcxWCg4c9mD3IrpMKjXhambFRXXjtnDsXbCa
	A5noWSePC68j25EHEluzH1sksp4lJVBzT/uTmkFTl9O6ErvU+w9n7QKfv/0U+V4y
	L1iBGZbRbybxMoaWTI7jrwkJRlTMOSPxaF5rVykUVPa6S0bCoTHWDOxwos19N0r3
	ck2BxMPo2ron/KjzVhYxrmV3UxHNoDDbzsirvLZ7n/0E6KmPW5a5qj+xsN4QSUTn
	5fEpyolVDCgb2DsS4GzC0CFGF0EcHpGhWHAeKnIuk5kXHujilWToadJadhTNDfdP
	UnkOyw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wx2jj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 06:55:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304d0d0b28eso3980462eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 23:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781506535; x=1782111335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RCtOIVtWRXG8+knNFwjLUUhkwN8I2zj9KCq3Wg6nM5I=;
        b=UQxCrQz1s7D3WPE1ngENWKce5nPn2wOXZTffj63U/CvYCml9se8XliZy/sDv320/xv
         ODBjInNY4gN3Lx4//nY1fREBrP60lXOYrevHm4VnDxXmoSR+FgwPuaDNE4EJqA7O3M3t
         QNJe/DdK08n084kE+gXRUvFtl7bI2IQnpz4pbx6km8/5gKczGmmxHZrpEHNKEuCeMUh3
         qdEPuz8WtEDwqU8X+ULYQnrRSIgdiZnKaz1Y9Csq/zt+cIzmw7O5RplTlKypXeUdZubL
         YeyuXLZ7hDx6GrqlUpH+bqfw12KtoBLltBXmTHJ0V5b/Q7zWqCc7god3FShHyhrfB/OO
         tq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781506535; x=1782111335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RCtOIVtWRXG8+knNFwjLUUhkwN8I2zj9KCq3Wg6nM5I=;
        b=aFa5dl6P6dxCyWqY2BR8IFipQw58yH+ZZxvO+TCRsXFmIW0LkCnnpl7/9xJdgDe+A7
         6vWuw8vc//SQeiBuvpYnPsRTcTr0ttEZIxOyG39efDK7QCKq5FWjY/c9P6vA3pq7TFwx
         F1ZAO7kWKz/v4eMMI9JGBnMjalo0zI75ODEvgbe8MFKtJ749grtysIrxjrVvsH+PqLNw
         hpXfxhfc7aT479lK0L519CKhu2CdCFkdp5Zn5x9dNMhG7IGOaWzdlK4kSYzgnmjaFj2q
         T6MR9Yyx+EWYVV2gjPn8r8bBCQ337rlP4BquzHmVTro58+FVHcXWj3j/cb1+eoTisqEU
         RQ8w==
X-Forwarded-Encrypted: i=1; AFNElJ9ug6Q5Zpq5HyyfZkWtcVt2u8lPgTJ7+YKr3l+pvaeRAVJKWwFmo+XhFWOFqCsoFVDx+YMXxE+6/TMVBVNO@vger.kernel.org
X-Gm-Message-State: AOJu0YyxLakRBc9feuO2ck6k3qLsSz6yYqc14KmEB3bnQKcR1OLBQTTS
	KEIBN0Q+mqY2yA1YnJKjmEs7ZstgVLOCVhx0jJZTSzgMn0qS5c8aIUcCTUoD9ueMTH3kNi+Cf5e
	ZhmvMMrUYoSvTpZtvT8vAdakIEV4obSLWjRo5xbm4tLNPZo6LcNFscY40ovZ5zM6OWSCj
X-Gm-Gg: Acq92OHzWw1OmrHNiI5nf+CMa8SxX289l/DrdUu+vp95tfOOyKnY+3JaJN8yOnD13jg
	BvdLMuvq8hMQVv+z2Kq3X53UV70sDvnSPJAX73Jg/lt6JfIXqwsIIm7Avkax+fTwakk7yUkQkkA
	ojIKmzMwyVJPQAf6obMw2VhNX6aJruFAjjo5ag3/AQsRSBFJ3dN4Gsr8Sft9o78hUip88EhRiIy
	x3cbwjPBW0k5BbB79q15mku/cxNTENUTfBu7N43iFpJdenBwDga9E6l+o2QvhhtG3rUy19YeZKQ
	gBbMS0XcVyWNs7txzrhFtaEgwpMdHFyQhjAbZ8d2kt/Ujz7brULoGZrJzc6gFKxkx2x65XMXbTx
	4Q5qCngRkZSKyy+wi65ZO7HtKx/FpZa7C4rB7L9AHB6ee0+NFteXc3K6OArs/FkqpCHvdHMp1
X-Received: by 2002:a05:7301:618:b0:2ed:e15:c923 with SMTP id 5a478bee46e88-309419794c7mr4978212eec.31.1781506534593;
        Sun, 14 Jun 2026 23:55:34 -0700 (PDT)
X-Received: by 2002:a05:7301:618:b0:2ed:e15:c923 with SMTP id 5a478bee46e88-309419794c7mr4978192eec.31.1781506534054;
        Sun, 14 Jun 2026 23:55:34 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5cea89sm14915174eec.8.2026.06.14.23.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jun 2026 23:55:33 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Sun, 14 Jun 2026 23:55:03 -0700
Subject: [PATCH v2 1/2] dt-bindings: pinctrl: qcom: Describe Maili TLMM
 block
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260614-maili-pinctrl-v2-1-0db5bfc23d64@oss.qualcomm.com>
References: <20260614-maili-pinctrl-v2-0-0db5bfc23d64@oss.qualcomm.com>
In-Reply-To: <20260614-maili-pinctrl-v2-0-0db5bfc23d64@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781506532; l=4956;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=a7DZ+9+4fIbwpZO2uG3g+W5R1OjcQ9AkslG3kjBbpc4=;
 b=exJmJQrqGiHlrum4kyS1dkhSxTIOAHbX6sBKvpcDQrnmeU5hb+YLFIEtBIsqMtdittmJpDvg6
 ZwD8HKJ8TKnDrB4+qQo1b+kEpeifn2DwMYLeTaYcBkvdMwmnI4cdval
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: Z0WS71ksxr3CbIzaIh2TwP4LaYBK2hrQ
X-Proofpoint-GUID: Z0WS71ksxr3CbIzaIh2TwP4LaYBK2hrQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA3MCBTYWx0ZWRfX+XLFI0tbbDl9
 jpP7KcZs0ZqSxY0agjTVc0dvVvsdeNK/TTihJUMlMPuxgvfqeKqLNWkc44GWCK1l+yWBCwq6Pgs
 qUIAn80T5JhvS8pr53yPC/U5q0w2mGA=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2fa1e7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=bT5XQOCXPleopHcqzpYA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA3MCBTYWx0ZWRfXzThT7+Pm1L08
 qoQY654mhstRdRDPLm54d8jm+34ogcOzx34yQ+3CiuNLst1630baxWmoy2bVM0DSEQFyuFwp7Jf
 RyqZc9HmSnDuWk4IJQBepZqfk9nbOuxqy7xNNYYAdtD+72tNmOd6AlOy8X0h3tpiCdHjN1nG1KD
 cFz+WZMQaWTe21MZwT/OKVRTM4P5+O1E7Ca/3ZDhMt7MxuZQzVVXktRfM8PkJ+LVq7sMV6Nexh1
 T3rciA0vhKBoq8RWs0HPjoLEULDzhBgYq6tUHspqS7iHYQhP1qE8W1/nRH9RM5JUIp+5Xvk0oC8
 omxcZUWRt63VXsQDomEdDHiHus12r4bVv349yaBFM/CLeOuQR5+hM9VSIw9P5fwO3on8UHcOSNl
 0JA4wdQlGxoL+W1QFaW987PSBW6b81zWWESV1kogC9zSerCr7dv28bPtqk8Y4QoxvuepG1wVFIn
 /zPMgkJvk9U9RXBPv5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150070
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113094-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:linusw@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[devicetree.org:url,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CE7D2683F5E

The Top Level Mode Multiplexer (TLMM) in the Qualcomm Maili SoC provides
GPIO and pinctrl functionality for UFS, SDC and 226 GPIO pins.

Add a DeviceTree binding to describe the TLMM block on Qualcomm's Maili
SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,maili-tlmm.yaml          | 120 +++++++++++++++++++++
 1 file changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
new file mode 100644
index 000000000000..64fe90b2391b
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,maili-tlmm.yaml
@@ -0,0 +1,120 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,maili-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Maili TLMM block
+
+maintainers:
+  - Jingyi Wang <jingyi.wang@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Maili SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,maili-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 113
+
+  gpio-line-names:
+    maxItems: 226
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-maili-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-maili-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-maili-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          oneOf:
+            - pattern: "^gpio([0-9]|[1-9][0-9]|1[0-9][0-9]|20[0-9]|21[0-9]|22[0-5])$"
+            - enum: [ ufs_reset, sdc2_clk, sdc2_cmd, sdc2_data ]
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, aoss_cti, atest_char, atest_usb, audio_ext_mclk,
+                audio_ref_clk, cam_mclk, cci_async_in, cci_i2c0, cci_i2c1,
+                cci_i2c2, cci_i2c3, cci_timer, coex_espmi, coex_uart1_rx,
+                coex_uart1_tx, dbg_out_clk, ddr_bist, ddr_pxi, dp_hot, egpio,
+                gcc_gp, gnss_adc, host2wlan_sol, host_rst, i2chub0_se0,
+                i2chub0_se1, i2chub0_se2, i2chub0_se3, i2chub0_se4, i2s0, i2s1,
+                ibi_i3c, ibi_i3c_qup5_se0, jitter_bist, mdp_esync0, mdp_esync1,
+                mdp_esync2, mdp_vsync, mdp_vsync_e, mdp_vsync_p, mdp_vsync0_out,
+                mdp_vsync1_out, mdp_vsync2_out, mdp_vsync3_out, mdp_vsync5_out,
+                modem_pps_in, modem_pps_out, nav_gpio, nav_gpio0, nav_gpio3,
+                nav_rffe, pcie0_clk_req_n, pcie1_clk_req_n, pcie1_rst_n,
+                phase_flag, pll_bist_sync, pll_clk_aux, qdss_cti, qlink, qspi,
+                qspi_clk, qspi_cs, qup1_se0, qup1_se1, qup1_se2, qup1_se3,
+                qup1_se4, qup1_se5, qup1_se6, qup1_se7, qup2_se0, qup2_se1,
+                qup2_se2, qup2_se3, qup2_se4_01, qup2_se4_23, qup3_se0,
+                qup3_se1, qup3_se2, qup3_se3, qup3_se4, qup3_se5, qup4_se0,
+                qup4_se1, qup4_se2, qup4_se3_01, qup4_se3_23, qup4_se3_l3,
+                qup4_se4_01, qup4_se4_23, qup4_se4_l3, qup5_se0, rng_rosc,
+                sd_write_protect, sdc2_clk, sdc2_cmd, sdc2_data, sdc2_rclk,
+                sdc4_clk, sdc4_cmd, sdc4_data, sys_throttle, tb_trig_sdc,
+                tmess_rng, tsense_clm, tsense_pwm, uim0, uim1, usb0_hs, usb_phy,
+                vfr, vsense_trigger_mirnat, wcn_sw ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@f100000 {
+        compatible = "qcom,maili-tlmm";
+        reg = <0x0f100000 0x300000>;
+        interrupts = <GIC_ESPI 272 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 227>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        qup-uart7-state {
+          pins = "gpio62", "gpio63";
+          function = "qup1_se7";
+        };
+    };
+...

-- 
2.34.1


