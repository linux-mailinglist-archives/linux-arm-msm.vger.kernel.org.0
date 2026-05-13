Return-Path: <linux-arm-msm+bounces-107221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2IrzJmMGBGoHCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107221-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:04:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F219A52D6CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 07:04:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 74762308A691
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 05:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A85B23A984;
	Wed, 13 May 2026 05:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SmryBVl3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dKwCz+cW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD66397352
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:03:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778648610; cv=none; b=rfwyCCDNQhTD/GdYne4V+bAoXYqXppHzMhTSiWmlyN2wPpXaRW4/06gqJogglMGIzF1FAhRE7pWHOTK3uXjVkSIg2aTS7HtPVmUaG8o5hc1PJZOccliXqk5m1y4G91n7QRXJ4nhJh2V7zWDpRBY+RQjTyQvK+eB/Pg9mycfqY1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778648610; c=relaxed/simple;
	bh=7TsvUbjc4X268M/Hx6PDGtVg97A3grZlDo4nulrNFis=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jnIo1+fFDXut1LdWu2D2kgQELKIu6n4gKZ5Wl4gPbdS94/ArWz3SGu21cdt5MVwQ0sKZhv5JO6IUss1WGkgJ5Dh7IgoOb42UvbWFLtTlZX6CsjRZGEBZwTIa0DuAS2/1xun+D1rv1UkJO8SPvO19kLg0JEsfbi8jBJtDRPyLdxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SmryBVl3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dKwCz+cW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D4p9jw978152
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	I6TKCr8g37ugTtUVFFTI4XZN1+gbzLZmDNfSb367h78=; b=SmryBVl3pHKpHNik
	sTYpcZz+4pwYTX75bae8coPbOKKz/7ycGtQqirdQvlag7AgLfktS2Ot1fKo9F7lP
	Xcwk5Bf4ODQTiyMTwh8AIWAS6N2tb54MI8nNrNVMwhPy/O0lS0oWYsa46XDcw5dl
	el+KNYmxMORIhmIcpCV+am8PZQ9Ku1We2BtjTwgK4sRwi/SYzP38KbMdaKZVj1sp
	BEnTPIVDJi6X7vM0iDDLBhN7cEV8mDQbk1a6Od+hFoF28BxIG4ot4vjiGA1+BRAc
	eHHJUv06FjXIiu3o4egErgZsqugHxYApDcKWlfajAtEOtI6WPLTqe1rwy0AS+Ju7
	XjQ+YA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e46s9tkan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 05:03:27 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-837c4eb3bdfso4301381b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 22:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778648607; x=1779253407; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I6TKCr8g37ugTtUVFFTI4XZN1+gbzLZmDNfSb367h78=;
        b=dKwCz+cWDZVa4aPyh6emkWja9LyhJC/YIH+xCriVaFAsss0qAWffQRolY+NckD4gty
         GXSlnGl37Um0YeizERF1ciz1wref3kOPjtfps86Yh/XwQ0xZBMGzIk/EB7rdVG89QNPv
         QoXzPpWdqCDAoo1L8Oj8WALsSDFrN5kYHQp2WDL5VJp4l4UEVIyykhnlzEkLH/wHDS1w
         OjKKfQk/9cjmNzGdxHQV86JepM6ivk+l65fhg/derOEo3sm8VTBPK/bqt4H/uhdWorf9
         5XKc/lGIHmYmJsGzRqm+2fK0F9JUgeq08P0HFbezmFxIMJAb8R65mwEEJOispWicHyOM
         QLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778648607; x=1779253407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=I6TKCr8g37ugTtUVFFTI4XZN1+gbzLZmDNfSb367h78=;
        b=qVdfEQRmryY9DYUpEkhq/8bOQe9mxKeKoFMlOaKlSaJMswcrbfjwzt4k0i/ox5Cpe1
         XL+hKWu+Ps+OgyFqihyv6tsfDrdgWVBUFHCZGjQ+JJKfQcTusoPr3cdMp8KnZYoUU6DN
         /bZgdrVeHvnvtfewFn0M9lHCa1YDWezO9bUNkAq+ZdEDFxy9mdrhm9x71pO1rGMLEAPR
         8mMblC3nAzAOxeJk1Z+RbglJAu3/Fb+Zqyz28fcYwH9CwTAGArJujBEBiUn8Y5K6mgGM
         9rQ2m2tpTnEW/DcVJfqGnZVs5rI/aYDCHEef0Z98JBmQHMitH31dQF+aCGHFp2sXW6W2
         5Jtw==
X-Gm-Message-State: AOJu0YzLPqSdyC000V1ZJzC5Pq/E211GB1Uk5mu2ENNSdz4g6RWiGIaU
	d0BF1Fde2V5rLp5x4+zpLY2rfY3SxC8uPRw9Qhr2HG5V0Aznra6eqI3c+W6nFRNvvqOagpUgVMw
	AeoWB4sKCbSixiyeQRIOMv0Csxo5JHbisXqmzT+pGgsi9ESWchUSwkKzpiFXP2iexjueO
X-Gm-Gg: Acq92OHE38ATBNQVCrFvfNTQ6DNJxmAb3/f9UjPgwaBKTB/z59As1ITTXDrgMxvD7cS
	By8ZY9qfFgzqm50xCYABUltAVjr3nzb2kX0hI9X9d+MpYw9s5yv4SnmLLLo1mcbc3WOibTPVkZy
	nGyV51rgRNt4bWH5QUz3djKXOHbmoErN4W67K3v3NZ0utPP5U7lo8hMJhvDbbYII3jrCBD5XLeO
	tF9DykkhLFsvsVY8Pt1ub0hgAhxxy2jbQ7lrHVPG54sr6KNErZF4Rj2lF5THmTbmj5lQrNueF3C
	IRXMg6XhX45/r31zBoQjo/T9sHulnisZ2Uzqs3SBWsbxRs2KBzWENimthh77pBf6LughW1ejxq0
	TegPI2xO7HwOaGgfd7gkdGo/RVgHtphgXC5Oy2itpLDU03WfcOQHAjMRv5Ehi3jWEzh6ZgncP34
	3Dx8mbOGVv6Ae+J5XX4Su0XWSAK5AgEwZf1nSCdMOGxzejSsyhuhhfzst4
X-Received: by 2002:a05:6a00:1c88:b0:838:af72:fb2a with SMTP id d2e1a72fcca58-83f0547b22cmr1234248b3a.4.1778648606704;
        Tue, 12 May 2026 22:03:26 -0700 (PDT)
X-Received: by 2002:a05:6a00:1c88:b0:838:af72:fb2a with SMTP id d2e1a72fcca58-83f0547b22cmr1234216b3a.4.1778648606192;
        Tue, 12 May 2026 22:03:26 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945c1bsm26328020b3a.15.2026.05.12.22.03.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 22:03:25 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 13 May 2026 10:30:30 +0530
Subject: [PATCH v10 1/3] dt-bindings: sram: describe the IPQ5424 IMEM as
 mmio-sram
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260513-wdt_reset_reason-v10-1-cebda08ab1ef@oss.qualcomm.com>
References: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
In-Reply-To: <20260513-wdt_reset_reason-v10-0-cebda08ab1ef@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778648598; l=1655;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=7TsvUbjc4X268M/Hx6PDGtVg97A3grZlDo4nulrNFis=;
 b=VoBc+jN+wqFW7Ah7rZA8jSPQXgMD6USrTya6R0xhgnqM++UKrbPXBsmqxhJJsBHbC4eDVewqL
 BElQVJoqDLzD7qiB6UPGfr+o8Nngez5TgKXYHveS/a/h2UG0XmkU4LZ
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDA0OCBTYWx0ZWRfX0AZaDmlxGwSX
 EtZSrY8zh5wbnw/HpfZZ5NeYlIBkRXN0sr2wPv5mRqYU7ywlhmYdOQwaBC8cTBRrm3nH3jEZ62i
 L0/KVC8oXdeoADI1MA4dvv9wNH/SzYBfQj30dmcly3oPFN+zBWqXbllLwQAeZffxWBzQHuOLvDc
 Gcps58v99Mgn/SrxlQrA12CCYnLBBsZc38rp82sAjEAo4VmmXT5ESO8mnXKA+zdw/r+EVcbOQKb
 UFkBM7SCdWRPnAzQpnXKTz9jF5JCTgpzyUdy+R7q7Aft7Y7y8HWBYKfCtpM72NHkg2NA9odFFq8
 py+5roOFBOJ95H47mua1O+0w2sXoumvaBr7fitXVtf9X5lszAUsNsI66JRL+v6slPKcwZdxz1qr
 SVqx3Uq63oAgW763BPC63mYuS6Cild62Bn8irbtInuAs7OP/O3LuteG/gUWWMZzowuKGbrDg4cy
 SGnksF5uHUqDy6DDsug==
X-Proofpoint-GUID: KVhKxPsYI0L3qN-_lTI9hctvInux4qvm
X-Authority-Analysis: v=2.4 cv=L68theT8 c=1 sm=1 tr=0 ts=6a04061f cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=O_M3gYDVzo3QzbZqNbQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: KVhKxPsYI0L3qN-_lTI9hctvInux4qvm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130048
X-Rspamd-Queue-Id: F219A52D6CD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107221-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

IMEM shouldn’t be treated as a syscon or simple-mfd because it’s really
just on‑chip SRAM, not a block of control registers or a device with
multiple hardware functions.

Describing it as generic mmio‑sram keeps the model simple and closer to
what the hardware actually is.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 -
 Documentation/devicetree/bindings/sram/sram.yaml      | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index c63026904061..576e627fbc11 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -18,7 +18,6 @@ properties:
     items:
       - enum:
           - qcom,apq8064-imem
-          - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem
diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index eb695698a03e..2f594f60e1e6 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -36,6 +36,7 @@ properties:
         - nvidia,tegra234-sysram
         - qcom,eliza-imem
         - qcom,hawi-imem
+        - qcom,ipq5424-imem
         - qcom,kaanapali-imem
         - qcom,milos-imem
         - qcom,rpm-msg-ram

-- 
2.34.1


