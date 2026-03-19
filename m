Return-Path: <linux-arm-msm+bounces-98729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YIn7Bv7iu2njpQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98729-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:50:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9902F2CA9CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 12:50:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5F0773021975
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Mar 2026 11:50:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E95F3CAE8B;
	Thu, 19 Mar 2026 11:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fySKbQoQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EkswDEzL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9073B5843
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773921008; cv=none; b=rhPQDRIzWciXQjOu61IxV2HzEWV3JLMExA9DAZvdlSIOzQoF6OdUKKE88/2AKTIOeLdFiHpAJs+P+HDxjA0G7FbZN0tQzpIszcRBYVyqRYtE8iY9HOZtQcdhXubX6XmdQZudK4UHEP4j63tqxGp+n132x2UPymklm6wDQ6Ecn/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773921008; c=relaxed/simple;
	bh=kUbZ9dcJpCBm8LNy6lv93okg/giV3v+g52Xhyqlg/aQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rdA097HNPfIEC8ZKLUlCNxPWmwbJ+SLy53LFJPrJJdfs/bpY31ZdWteuKxMUhZBXxS7ZixAUYYi/J/sYkyteXAhgKCOT+S7INXPVxL0pw14xn11e7mkrZ3dz9rYD3T5dqeG+vVqTQJFbderctneqF7xj/al7AwBgcaSGyIkZubU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fySKbQoQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EkswDEzL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62J74BQQ2667266
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:50:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W8goUPqYgZwZuq1DitNWak0dNvB+tZ1RH7j8j2+02qo=; b=fySKbQoQGJKg4w/k
	+DgJpYgVr+xHkFc08O8PoNa2nMfJ/Fpnb2+XNNuIccNAnAKKaxNEjX/EKiiYE2jY
	gY+aIiUAmafbB/VcEa+rSumCygG1h1uXJnifDO6L489Qd0tgPgIbJuMjVv0xnDar
	GxY33iCgeMGRSICcmHXMZhqrSto96Hc3qfTHB448JqBsXMLMNUKNGStv8UrfN6QJ
	rIr+AqKY33JoGU2HeEosbxyO/ZBziUjp+yH32bl3cCtFPlkAKOFxIEl1jeyKQRTv
	MX9bwr/R07Gpo6kQz9Zm5+LLS2RA5MWPeX6cTIL/8izUi6XDho33pruL9jHGA1Nl
	mmXyjA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cytj54j66-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 11:50:05 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b323c43fdso10043111cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Mar 2026 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773921005; x=1774525805; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W8goUPqYgZwZuq1DitNWak0dNvB+tZ1RH7j8j2+02qo=;
        b=EkswDEzLOcS6mJwT5l20zQgMbi6NyJsGnscuScEiK1bVy8neaxtDjddmBqeq3Q6GvT
         Wj19r41FQcwLGZcGppn+xMOhQKtb8aRoODevoI6QGyI0vW/z3WStQyKSIjAb6Jpivn0L
         3cUUY0Qnf8tFeu9fbcM/QRGblpw80mssxAa4/EvNjUO7PgdVzHDNwIaevWChB2ZCMu8i
         yucqKzpCTBNPGijRmVbLXzSrx6psvABH/Ziri9W4TosP+J9231XS1N6RVghoMrM4lZVu
         kSCMaH8QZ23RwlDy+qLp6KFyucLcxBH2Hh/Yu8e+/vD4GDF4q1PDqk7WznFvJZBueThM
         YO2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773921005; x=1774525805;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W8goUPqYgZwZuq1DitNWak0dNvB+tZ1RH7j8j2+02qo=;
        b=C2pLgt7jStKZ6bwi92j997LimJq/Bi5wHXovrS2bb1/Xo8z5F0/lq4HTDEaNMxzRf5
         feB+jdnjt3ATua+RND7rNxieg/I8ntyKI3FvyHMs2v93MfDvpzCWD7H00V3G/WgtsrHh
         uv/4Cvbk9zxtgx/WFdQGwbwVRE37zWT6HsTDQZqhee4Yz5fzBlQknKa2BPNVaxvVn/Pu
         YDf0XK1/v1ScZAWR+n1dnZHl03GBBPfDhrZXQotpKB/slR9Zr04zB1gxtRz1ibI3AP1z
         MjDvjnULkIjFeR28Zk8UUHC5DGzacSnbG+Eqvn3zaPef2mV0oK8jwYebp5mYcDzi5jbc
         NGAw==
X-Forwarded-Encrypted: i=1; AJvYcCVRoelsgGSbnmqPVCPfX0MgE7V8ZAG5GPb1JaJdpzjo9W7OxYgYahTbPhcCRs6JT+IpxEebiBZjJlqm6pcY@vger.kernel.org
X-Gm-Message-State: AOJu0YwKbhULSVTr0IeXyPyI/tJYyYW/OqDJbnGGiwp0iW3iMN8AryhG
	iRPCbRoJ6L8mEpkgzEQx1KTiuvi0UtaX3CO/cFR/nuRFdTN1py6itMfyfhodnGMKfR8w0/r73al
	/D7JOoPZsorGGWqTb7F8lZqlgq3HjdkyyEyUlYZsKLWxIT+odgXd9+h5NjP+vqSgRCh2p
X-Gm-Gg: ATEYQzx6CDpVrJpjNLLNG/hUAh7fI9mgCmFAEu+k56Z8nn8sWhsW60balWXhpBCA5tC
	rH5fT5KMVLjjln5Udduo2IyuWbndBrRAMXkG4CR+4Vr3Q3XXySXOhqv9hvNKhBwLto6e/kxgD16
	4X7jkaIwYxGzzzJMUKOnl2IFwna4wda7aRvBrpKyHXoHDUKcY6w7bAQCI71UUWMT8KG9P9PiY7H
	o/iV1cajz+NhXWcOfwv180sDVMO4bVAObFkBP5WUhgm4IvaoicZF6xJxze4hVWa9vTHW4eIth98
	YzWp+FIDnbdOEXruDPqEn2xz5GQYupwbDz14Wh8BmAhFZo/cF+4EbZ5djViRGkOyGQb7gNc1Ecf
	w2GC0EjQB91tLBbXbu8YzTm4s4gEaDTEGfzUbPCRYalaE
X-Received: by 2002:a05:622a:1a81:b0:509:1226:83e0 with SMTP id d75a77b69052e-50b14752d37mr89790611cf.5.1773921003975;
        Thu, 19 Mar 2026 04:50:03 -0700 (PDT)
X-Received: by 2002:a05:622a:1a81:b0:509:1226:83e0 with SMTP id d75a77b69052e-50b14752d37mr89790171cf.5.1773921003453;
        Thu, 19 Mar 2026 04:50:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8b0b9fdsm66384605e9.2.2026.03.19.04.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 04:50:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 12:49:42 +0100
Subject: [PATCH v3 1/3] dt-bindings: clock: qcom,eliza-dispcc: Add Eliza
 SoC display CC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-clk-qcom-dispcc-eliza-v3-1-d1f2b19a6e6b@oss.qualcomm.com>
References: <20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com>
In-Reply-To: <20260319-clk-qcom-dispcc-eliza-v3-0-d1f2b19a6e6b@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8809;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kUbZ9dcJpCBm8LNy6lv93okg/giV3v+g52Xhyqlg/aQ=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpu+Ll8eeD2hiHNv28DTIQiAjOZEoHAwrrMcc8v
 44mHoNYI0mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCabvi5QAKCRDBN2bmhouD
 16CLD/43myv8RIseB1P4+h6iW1H6ZYPyPFZ+J0JbO5SGziUVOKHEuZ736MckDCDxGejqy5xD6AC
 wMWpBx45JoN12s+1wteAY56abl1fXIg29SC2FjlQF1uYP6FTDnVUWkFfdyWHNEkpy33xBCBxQwz
 Gr9ungpt6oJwvLJ5SPTQkzjEIwpG8uOL4vIul3lfLO+loZNVFKWEMbYv4G+7W8YkYsgRnHTlg4X
 FTp7r6BPQpvipLYje9PRxts9B4xWD6cE5sxQlXarDi/RBvnb0tJwdskz74+ea1DrqpHiN1MRPQO
 kWhNryT6Kb66nJa/L6cW2XwBuH+A9MwhE0f5kinQw83KwSGRfu5y/2/rnmQwIcNC8+nzX4w67uJ
 RfuKFIqvKtB0PfKJMwBD1kg7d/ihOfrYoKEIVXQeal5CPl6Y4FIs0W0WHytG6z7k3RQ90xKz0cM
 2YQCqjITKlMsSJiTYorcodyn4PlXqqrp7ea+dOr3gzHouQot4xOHnDPvZGg37cohNJmep3CPCCL
 upWT7UjFdVOwwkoaAfkP7GeSwMBKzkqZykn1I55lar7T/4LwspldrZxc7p9PXZHyC2F14407PN/
 Q1f+Lov7HpDDHxjc5LUrIqO/+bkmJOSEgbGfCnxiZfAZm3xvXJ0kid2yxTLZP+ZscJhjPcM+DUe
 s7cow+DiZB3H4FA==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDA5NSBTYWx0ZWRfXxwRj+HRstnBL
 NpoHhaUeY90L8xfmG6cH1sdsvI36xY70xOhS2dR499CoYFHE2qrX9xiq7KWN11cWPB48RE3UlHJ
 3tj1fn/YdqW1qIEmjuilt0ciLJWmOqOrR31Kx0oVs5IvkU82ijBPdFvjyU/N1o+IAHMjacu3UuU
 6LTISIXR7tY67Q1b+Z/aLgEYKfnfSlxyYEGVWCadcHXXgc4paigmm1UgTBtFlF/Ngk+M/IOxrRH
 fH25YItZb7kvA+TwKIJqSeCkktBwXX4oMnceucBfiLeKOcsT6YeqCrnKtMEc73Ez1qQ0bKtD6Hg
 eurhAOoMXsiNcvzmkM9rqLWxBVCujUmdhtAm5O/IM6p7n9BRnniF15voCgrkLSIlMKYF8wl57Xq
 jrlRuLD5eLMeiq4fLlaia1bi/Pazp//u3XPF+2ejXJbrkDADpcL9rfF/XOxoWBKB2kgCaroIG1A
 tB83UUyeuYkG7133CPg==
X-Proofpoint-ORIG-GUID: RQT0M17bozqFLsqlkzzs4ZGkVyltpI-d
X-Proofpoint-GUID: RQT0M17bozqFLsqlkzzs4ZGkVyltpI-d
X-Authority-Analysis: v=2.4 cv=dM+rWeZb c=1 sm=1 tr=0 ts=69bbe2ed cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=I8plYztaKvtxx8zCzTMA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_01,2026-03-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603190095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-98729-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,devicetree.org:url,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,af00000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9902F2CA9CB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add bindings for Qualcomm Eliza SoC display clock controller (dispcc),
which is very similar to one in SM8750, except new HDMI-related clocks
and additional clock input from HDMI PHY PLL.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../bindings/clock/qcom,eliza-dispcc.yaml          |  96 +++++++++++++++++
 include/dt-bindings/clock/qcom,eliza-dispcc.h      | 118 +++++++++++++++++++++
 2 files changed, 214 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,eliza-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,eliza-dispcc.yaml
new file mode 100644
index 000000000000..0935ec185dde
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,eliza-dispcc.yaml
@@ -0,0 +1,96 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,eliza-dispcc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Display Clock & Reset Controller for Qualcomm Eliza SoC
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Konrad Dybcio <konradybcio@kernel.org>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
+
+description: |
+  Display clock control module provides the clocks, resets and power
+  domains on Qualcomm Eliza SoC platform.
+
+  See also:
+  - include/dt-bindings/clock/qcom,eliza-dispcc.h
+
+properties:
+  compatible:
+    enum:
+      - qcom,eliza-dispcc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Board Always On XO source
+      - description: Display's AHB clock
+      - description: sleep clock
+      - description: Byte clock from DSI PHY0
+      - description: Pixel clock from DSI PHY0
+      - description: Byte clock from DSI PHY1
+      - description: Pixel clock from DSI PHY1
+      - description: Link clock from DP PHY0
+      - description: VCO DIV clock from DP PHY0
+      - description: Link clock from DP PHY1
+      - description: VCO DIV clock from DP PHY1
+      - description: Link clock from DP PHY2
+      - description: VCO DIV clock from DP PHY2
+      - description: Link clock from DP PHY3
+      - description: VCO DIV clock from DP PHY3
+      - description: HDMI link clock from HDMI PHY
+
+  power-domains:
+    maxItems: 1
+
+  required-opps:
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - '#power-domain-cells'
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,dsi-phy-28nm.h>
+    #include <dt-bindings/clock/qcom,eliza-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    clock-controller@af00000 {
+        compatible = "qcom,eliza-dispcc";
+        reg = <0x0af00000 0x20000>;
+        clocks = <&bi_tcxo_div2>,
+                 <&bi_tcxo_ao_div2>,
+                 <&gcc GCC_DISP_AHB_CLK>,
+                 <&sleep_clk>,
+                 <&dsi0_phy DSI_BYTE_PLL_CLK>,
+                 <&dsi0_phy DSI_PIXEL_PLL_CLK>,
+                 <&dsi1_phy DSI_BYTE_PLL_CLK>,
+                 <&dsi1_phy DSI_PIXEL_PLL_CLK>,
+                 <&dp0_phy 0>,
+                 <&dp0_phy 1>,
+                 <&dp1_phy 0>,
+                 <&dp1_phy 1>,
+                 <&dp2_phy 0>,
+                 <&dp2_phy 1>,
+                 <&dp3_phy 0>,
+                 <&dp3_phy 1>,
+                 <&hdmi_phy>;
+
+        #clock-cells = <1>;
+        #power-domain-cells = <1>;
+        #reset-cells = <1>;
+
+        power-domains = <&rpmhpd RPMHPD_MMCX>;
+        required-opps = <&rpmhpd_opp_low_svs>;
+    };
+...
diff --git a/include/dt-bindings/clock/qcom,eliza-dispcc.h b/include/dt-bindings/clock/qcom,eliza-dispcc.h
new file mode 100644
index 000000000000..30c6d856fa98
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-dispcc.h
@@ -0,0 +1,118 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_ELIZA_DISP_CC_H
+#define _DT_BINDINGS_CLK_QCOM_ELIZA_DISP_CC_H
+
+/* DISP_CC clocks */
+#define DISP_CC_PLL0						0
+#define DISP_CC_PLL1						1
+#define DISP_CC_PLL2						2
+#define DISP_CC_ESYNC0_CLK					3
+#define DISP_CC_ESYNC0_CLK_SRC					4
+#define DISP_CC_ESYNC1_CLK					5
+#define DISP_CC_ESYNC1_CLK_SRC					6
+#define DISP_CC_MDSS_ACCU_SHIFT_CLK				7
+#define DISP_CC_MDSS_AHB1_CLK					8
+#define DISP_CC_MDSS_AHB_CLK					9
+#define DISP_CC_MDSS_AHB_CLK_SRC				10
+#define DISP_CC_MDSS_BYTE0_CLK					11
+#define DISP_CC_MDSS_BYTE0_CLK_SRC				12
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC				13
+#define DISP_CC_MDSS_BYTE0_INTF_CLK				14
+#define DISP_CC_MDSS_BYTE1_CLK					15
+#define DISP_CC_MDSS_BYTE1_CLK_SRC				16
+#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC				17
+#define DISP_CC_MDSS_BYTE1_INTF_CLK				18
+#define DISP_CC_MDSS_DPTX0_AUX_CLK				19
+#define DISP_CC_MDSS_DPTX0_AUX_CLK_SRC				20
+#define DISP_CC_MDSS_DPTX0_CRYPTO_CLK				21
+#define DISP_CC_MDSS_DPTX0_LINK_CLK				22
+#define DISP_CC_MDSS_DPTX0_LINK_CLK_SRC				23
+#define DISP_CC_MDSS_DPTX0_LINK_DIV_CLK_SRC			24
+#define DISP_CC_MDSS_DPTX0_LINK_INTF_CLK			25
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK				26
+#define DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC			27
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK				28
+#define DISP_CC_MDSS_DPTX0_PIXEL1_CLK_SRC			29
+#define DISP_CC_MDSS_DPTX0_USB_ROUTER_LINK_INTF_CLK		30
+#define DISP_CC_MDSS_DPTX1_AUX_CLK				31
+#define DISP_CC_MDSS_DPTX1_AUX_CLK_SRC				32
+#define DISP_CC_MDSS_DPTX1_CRYPTO_CLK				33
+#define DISP_CC_MDSS_DPTX1_LINK_CLK				34
+#define DISP_CC_MDSS_DPTX1_LINK_CLK_SRC				35
+#define DISP_CC_MDSS_DPTX1_LINK_DIV_CLK_SRC			36
+#define DISP_CC_MDSS_DPTX1_LINK_INTF_CLK			37
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK				38
+#define DISP_CC_MDSS_DPTX1_PIXEL0_CLK_SRC			39
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK				40
+#define DISP_CC_MDSS_DPTX1_PIXEL1_CLK_SRC			41
+#define DISP_CC_MDSS_DPTX1_USB_ROUTER_LINK_INTF_CLK		42
+#define DISP_CC_MDSS_DPTX2_AUX_CLK				43
+#define DISP_CC_MDSS_DPTX2_AUX_CLK_SRC				44
+#define DISP_CC_MDSS_DPTX2_CRYPTO_CLK				45
+#define DISP_CC_MDSS_DPTX2_LINK_CLK				46
+#define DISP_CC_MDSS_DPTX2_LINK_CLK_SRC				47
+#define DISP_CC_MDSS_DPTX2_LINK_DIV_CLK_SRC			48
+#define DISP_CC_MDSS_DPTX2_LINK_INTF_CLK			49
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK				50
+#define DISP_CC_MDSS_DPTX2_PIXEL0_CLK_SRC			51
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK				52
+#define DISP_CC_MDSS_DPTX2_PIXEL1_CLK_SRC			53
+#define DISP_CC_MDSS_DPTX3_AUX_CLK				54
+#define DISP_CC_MDSS_DPTX3_AUX_CLK_SRC				55
+#define DISP_CC_MDSS_DPTX3_CRYPTO_CLK				56
+#define DISP_CC_MDSS_DPTX3_LINK_CLK				57
+#define DISP_CC_MDSS_DPTX3_LINK_CLK_SRC				58
+#define DISP_CC_MDSS_DPTX3_LINK_DIV_CLK_SRC			59
+#define DISP_CC_MDSS_DPTX3_LINK_INTF_CLK			60
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK				61
+#define DISP_CC_MDSS_DPTX3_PIXEL0_CLK_SRC			62
+#define DISP_CC_MDSS_ESC0_CLK					63
+#define DISP_CC_MDSS_ESC0_CLK_SRC				64
+#define DISP_CC_MDSS_ESC1_CLK					65
+#define DISP_CC_MDSS_ESC1_CLK_SRC				66
+#define DISP_CC_MDSS_HDMI_AHBM_CLK				67
+#define DISP_CC_MDSS_HDMI_APP_CLK				68
+#define DISP_CC_MDSS_HDMI_APP_CLK_SRC				69
+#define DISP_CC_MDSS_HDMI_CRYPTO_CLK				70
+#define DISP_CC_MDSS_HDMI_INTF_CLK				71
+#define DISP_CC_MDSS_HDMI_PCLK_CLK				72
+#define DISP_CC_MDSS_HDMI_PCLK_CLK_SRC				73
+#define DISP_CC_MDSS_HDMI_PCLK_DIV_CLK_SRC			74
+#define DISP_CC_MDSS_MDP1_CLK					75
+#define DISP_CC_MDSS_MDP_CLK					76
+#define DISP_CC_MDSS_MDP_CLK_SRC				77
+#define DISP_CC_MDSS_MDP_LUT1_CLK				78
+#define DISP_CC_MDSS_MDP_LUT_CLK				79
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK				80
+#define DISP_CC_MDSS_PCLK0_CLK					81
+#define DISP_CC_MDSS_PCLK0_CLK_SRC				82
+#define DISP_CC_MDSS_PCLK1_CLK					83
+#define DISP_CC_MDSS_PCLK1_CLK_SRC				84
+#define DISP_CC_MDSS_PCLK2_CLK					85
+#define DISP_CC_MDSS_PCLK2_CLK_SRC				86
+#define DISP_CC_MDSS_RSCC_AHB_CLK				87
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK				88
+#define DISP_CC_MDSS_VSYNC1_CLK					89
+#define DISP_CC_MDSS_VSYNC_CLK					90
+#define DISP_CC_MDSS_VSYNC_CLK_SRC				91
+#define DISP_CC_OSC_CLK						92
+#define DISP_CC_OSC_CLK_SRC					93
+#define DISP_CC_SLEEP_CLK					94
+#define DISP_CC_SLEEP_CLK_SRC					95
+#define DISP_CC_XO_CLK						96
+#define DISP_CC_XO_CLK_SRC					97
+
+/* DISP_CC resets */
+#define DISP_CC_MDSS_CORE_BCR					0
+#define DISP_CC_MDSS_CORE_INT2_BCR				1
+#define DISP_CC_MDSS_RSCC_BCR					2
+
+/* DISP_CC GDSCR */
+#define MDSS_GDSC						0
+#define MDSS_INT2_GDSC						1
+
+#endif

-- 
2.51.0


