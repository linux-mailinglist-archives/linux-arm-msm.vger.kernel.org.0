Return-Path: <linux-arm-msm+bounces-116305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 50XwKX+nR2oddAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:13:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD7E702408
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Jul 2026 14:13:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=okwbLleI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DdTix0RD;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116305-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116305-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6FE19309A086
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Jul 2026 12:08:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3541E3CF20D;
	Fri,  3 Jul 2026 12:08:58 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DFF33CF201
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Jul 2026 12:08:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783080538; cv=none; b=ANPi1YdRfgkvdP1f5I7BO7eqrgvCE0ihs5iQv588DgMVeXZmUfV7vTVqDAqe7rmEOOyHlaV4X27yrQgNV9JjtFbGtlhTV7/HAaZSWPqrlfO18AzZqJh0lwAKLR4ELT+L5XfYSTxlBVBCZD8xhivhxauZdbLMVF9+UX2JH0Z4Odg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783080538; c=relaxed/simple;
	bh=5V7HWccyjDE1PHzPXsSESrD0TYABSrEnhJQ1xPdGWYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZsFX7q4In0CyoTI3a94EAvU5nN8i+bor25HdV+bh4H+GGJxnmQudBACWy218FAt0+cU1E0Km4Oeezo0/ahMAWqm3A39pUocH457tzGhoRiBuVkJCTum5DvPZy83pGXdSQLgU+jZIICwjd7dw9EfYJECQVnsnGRKKoeoCZk9rQ3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=okwbLleI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DdTix0RD; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 663BHTwd3110488
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Jul 2026 12:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u8d2V1J0QbYdhiQA9M9vo6lfgb+kQCAkNzZdrKE10Kg=; b=okwbLleIILn08seE
	iseaDqo9uGQ14EEp5eg63/lUn6m9EzBaz0Upd7SuVI84STt/xCR+tE/MJU/ZE4i5
	CvQUTa0iuSxmeGlBnFLP4k6emqLDeDFEgLCjYsbN07njEzLceIEYrSavppzW0317
	XT43Yc7rVqnIqFPnvRYL/B/UnIKhtfquSAaK1/U/rVBwNkYzgkxWfjyqjLWtomV7
	ImMiSTKpHzYGwgnYDIPUuEuQh3+tsQmurUXpN+PdCyYwHesrtTsrhVIAquey3Uqe
	j9xcV+Fld1RI5UltHW0QP4oQ3pQAtC4xYIYzxK1yunmJh30TVw5m9rn8o6b6/4eg
	mQ4tVg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f60eyay9m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 12:08:55 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c9c26587e67so704088a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Jul 2026 05:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783080535; x=1783685335; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u8d2V1J0QbYdhiQA9M9vo6lfgb+kQCAkNzZdrKE10Kg=;
        b=DdTix0RDKqCL+qdpxWzgjJtYs7loULc3w/t28syzAIhDn1W1R0wQgHQaA8nC/ooQtk
         S7tFCXcCVURV7hxuUzvSXNRHR05J6KWjWgVgUupSkk+PPYlCJ7lAdsOsozNAOs4KnGKM
         kZmgCdKPgQNTLoV7I2uWX+iNVBP+2/diLhz0hE1J9LRumlm3xfID7THyDuM8AqhgwAXo
         T53FBnSPYhH/GArUmbmTpsy8Hz573tBv33DA1bzfQtLufW23qCgVUIwaf7bW/uTIajSh
         w6b+vNIZFOwZMdg8bzT4PGbG+UdqBlk4tWX+f6SxSXmo4kwVZq2r/L4eWNITH/xzkygY
         yqSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783080535; x=1783685335;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=u8d2V1J0QbYdhiQA9M9vo6lfgb+kQCAkNzZdrKE10Kg=;
        b=qE2gAMq8IETKAOhoaA+fPmVq8bBBCfGvEeD+V6Z1vc+VqOhdRjrj6qohThf7d1WKHx
         WHs6XEbrbVFUYYuNvAyZfxwN5Yi76xUSvxySX1WkZG5LYMi1A61bu+WBDdcQYzS+GqXW
         nZrlmSEB+yx6oMDADc+BIwFz/jv5LzNKHkcPvL9gpUHSnz/3qYxC4FyRVQ/xkN7Bg/wk
         GiFlq/7kEeoPybCPBvsqzcL75gOlHxnKPwGKAZMxtN3nqIi8/Bywf8MlKKKoNHzZ1sAN
         l2MUYgMk4OOfcs1yxKtc1TVe2J1uuvhXFJg3jyOxbSUb5K2Zpeb/LiGU4p++HGs9yRRp
         vcxw==
X-Gm-Message-State: AOJu0YzdEnqPm9nfg++URrFQqnBzGtS4AgJ0AmQIBf7GaQr72yIc40/Q
	Q/0/NjEKa2YGfv8ehewM3dHgpijM6MmSGHfVm7saJSBUURW2mei8cppusT8UWBUGQBHg4LbPLv2
	LXVY6VNv2jSCd/waFovEQ6z7hUL7fyMTAR871wze/l6R6zG3CnRXfw6sppA69Z3zqqBuM
X-Gm-Gg: AfdE7cle3SpyGmBGci7nY3I4g3JS6UbWs6G16rW93vRve8lN4AJvCU96DYQ/3apIbU1
	Sx736CWvKjD2YRQ4dvrinCiO6LG60WnO8X9NhAIvQxRmDYd3qhARzxfVmvDhDlEvor3TOjAMQkE
	FiFsCbYjbgwpqPmFfGyw7aO/Xhd3+CC/NWXMRU8oQqaaZgn0NeCw1aYfKPdfcnjza3OkvjFKsJA
	lP73KOPbJtvcr7k+74hdVLK38FnSPgdIEcp2dEDhhxd58ut4QRKqIZrxagjL3RrkEJJzKLoi8SL
	IzSc9Z4n7VSyVwmWfCqoIaDFtfdPLKrAZplDKVInwVYOQ+1QbBrOqppUV3Zi1D7hi/DTrfayGZT
	NcJ4KxSw+9yMGSjcu+QHSjVrCja6PsduM6ls+GfHc9U8ef0Nj
X-Received: by 2002:a05:6a20:7489:b0:3a2:ed4a:5d7e with SMTP id adf61e73a8af0-3c01caaccf8mr4338106637.22.1783080534557;
        Fri, 03 Jul 2026 05:08:54 -0700 (PDT)
X-Received: by 2002:a05:6a20:7489:b0:3a2:ed4a:5d7e with SMTP id adf61e73a8af0-3c01caaccf8mr4338059637.22.1783080533846;
        Fri, 03 Jul 2026 05:08:53 -0700 (PDT)
Received: from hu-vpernami-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb10638sm2530779a12.2.2026.07.03.05.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 05:08:53 -0700 (PDT)
From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 17:38:40 +0530
Subject: [PATCH 1/2] dt-bindings: pci: qcom,hawi-pcie: Add Maili PCIe
 compatible
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-vdev_maili_dt_bindings-v1-1-c9df0916cd5e@oss.qualcomm.com>
References: <20260703-vdev_maili_dt_bindings-v1-0-c9df0916cd5e@oss.qualcomm.com>
In-Reply-To: <20260703-vdev_maili_dt_bindings-v1-0-c9df0916cd5e@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org,
        Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783080523; l=1283;
 i=vivek.pernamitta@oss.qualcomm.com; s=20241114; h=from:subject:message-id;
 bh=5V7HWccyjDE1PHzPXsSESrD0TYABSrEnhJQ1xPdGWYU=;
 b=J4GGGQ7hcYdgtXJBassBT6Xw5rLDeYRwM7rV0JCtvJzey5nqajrHDYeUihNHUapO7wgdAt5e+
 Lq3SS+5iq//AWGUj8V/QkT/kRdmF+LWBJVxg/h6qhD3F6X7gH6bK8VX
X-Developer-Key: i=vivek.pernamitta@oss.qualcomm.com; a=ed25519;
 pk=HDwn8xReb8K52LA6/CJc6S9Zik8gDCZ5LO4Cypff71Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDExOCBTYWx0ZWRfX1TcIuTm/2plz
 1vRP1MBvr72JOz07Y0fP06QWf0929eS9QEQQ7iFuVVyzaqKYv1DlcXDX6VZ1izYgZwEd08iJ/pn
 BwIzXTrdAIsOvk6xauDWZn/6e37wgB6YTapGlscmPQ1CU9WjYSaT0amQo02tIHGVI9Tfpo4Qh1o
 rd0AMNe0R0ziGCjBr3ChY76B8et06HM+IV+zau0HkvDv08NH4Ei+x3dNE1mjcK1d3aZSsOo3lAD
 PSzfw2W7j3FwBDLAIZdxTO/Be4LIyi4DivApAVyTl0xa8OJYujMWwOLbGxGAXtLvIRqoNEHMML+
 iEoQcfipn9dTK+pA5aylVxbwoBh/hI6S+ahzeWz3/vD5J7W4vi/jcgTCXKasNHuzGAVyMh66EKK
 T6VzKSkFZSpS4FV/U4Ky+eikW0EHNfMXSqiMtAZR+9NiKwjUiQVtrB3b6nbxZ7oaprwu1XcPlcZ
 Flg1AqM7ec6ryvh1vpQ==
X-Proofpoint-GUID: uZ0GzeNg4ufbUARW438vNyAaEBxmJay5
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDExOCBTYWx0ZWRfX6WMbhUoQT14K
 L3yDbjhVVnYDxhEtgbXOleWbpvHze9KB5Iwhqh9KdWNZCjPIl+mLmCboJ9ZlMKK6OsMzc18/MvM
 jpLNxVase7zjGFn5BZxF5V3Z86baZB8=
X-Authority-Analysis: v=2.4 cv=SPRykuvH c=1 sm=1 tr=0 ts=6a47a657 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ELRmBhIVfrytVPIx1VcA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: uZ0GzeNg4ufbUARW438vNyAaEBxmJay5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607030118
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116305-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[vivek.pernamitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:lpieralisi@kernel.org,m:kwilczynski@kernel.org,m:mani@kernel.org,m:robh@kernel.org,m:bhelgaas@google.com,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-pci@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-phy@lists.infradead.org,m:vivek.pernamitta@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.pernamitta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ECD7E702408

Add qcom,maili-pcie as a compatible string that falls back to
qcom,hawi-pcie, as the Maili SoC reuses the Hawi PCIe controller IP.

The Maili SoC is a derivative of Hawi and shares the same PCIe
controller architecture, allowing reuse of the existing Hawi PCIe
DT bindings.

Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
---
Dependencies:
- PCI: qcom: Add PCIe support for upcoming Hawi SoC
  https://lore.kernel.org/all/20260625-hawi-pcie-v4-0-1a578603cd86@oss.qualcomm.com/
---
 Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
index 2c999ca6b2052760a192e9c464d86b73e86d3a88..aba89b59915528ef112e74982bfffc79ad6f93e0 100644
--- a/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
+++ b/Documentation/devicetree/bindings/pci/qcom,hawi-pcie.yaml
@@ -16,7 +16,12 @@ description:
 
 properties:
   compatible:
-    const: qcom,hawi-pcie
+    oneOf:
+      - const: qcom,hawi-pcie
+      - items:
+          - enum:
+              - qcom,maili-pcie
+          - const: qcom,hawi-pcie
 
   reg:
     items:

-- 
2.34.1


