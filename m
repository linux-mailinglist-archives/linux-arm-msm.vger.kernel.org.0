Return-Path: <linux-arm-msm+bounces-113919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id weI2IjPEOGoqhwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:12:19 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F162D6ACAD2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 07:12:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kgCCY84M;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=atbSmE56;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113919-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113919-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CF1813023A4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 05:11:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 757F6359A6D;
	Mon, 22 Jun 2026 05:11:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13E0357CF9
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782105098; cv=none; b=b6nt9UYjqGAqW3jGdUa37b48K+UjCkfNuoN72HcVbMUr4wPaMa/doMBf4iF/yBAyrdEaiRCCGMuRttbztUmZ8CgHMzDonpiUE0PgPcXX4hKMfcGc2pNiMc7tPR87Pr+PziG0/PmfwH2/DgdkgEsFAEGvOd/epvJgEy+aewD86GM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782105098; c=relaxed/simple;
	bh=WPj6hOdlH8hNWqKJPYnfFON5wMzrQYhCrOHse+tcr0I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NrojgcGUC8A5fSnVsCz7HbYqnUDWDcUBVDkLOtP23Ie96/krhbvFMTd9QeXpEV+i6lRAJrd+KX7f0ShG8NWjIU5TsqU8f6J2yaE1PAmiUGN2OQUK2dsIJCkWDtsCfw8acWFOZOodWYD8OebbxDTEH++W/OE/zmufgTbCkOL9UyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kgCCY84M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=atbSmE56; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5BZHb4183506
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kbws4QKzuBZUU0YtrsuDrZfGpTcxxSjUqwqwe6Km7UM=; b=kgCCY84MFTT4ySK3
	msdptfxsKjxZPJsPzYmy/xHmOwoJa0pTUDvT1o7hHbTktbpi1qpjvHiSNd+t5y4U
	8DDkiWCLNAHLZEmHUDAxa4c8HzoH0YAjTQVSzwQYPqVkXfN/z+0sLqusg6IshDoo
	TghU21Lr3ZVMXZAGb6F7GH8LbUHc1h9WlNYNQui//hXqjvojQC/AsDPrSvkXMKba
	OFCZyIxp8PJGb10sUhBUk/sXawxr8EsuHZpXR6S0LfksOcDb75a6irLlWvdrdfOB
	ZD9CxHOt/UJWPSYSFHBgjUpAPGIj93H3sfI0DLMwxIGoBTPjmS7w5qCJHyJxwpT+
	WOKxGg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewj6h4w5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 05:11:35 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-137f3465368so3295669c88.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Jun 2026 22:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782105095; x=1782709895; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kbws4QKzuBZUU0YtrsuDrZfGpTcxxSjUqwqwe6Km7UM=;
        b=atbSmE56/ULJ8HRtO1jI60V7fKa0FA75CwLYYsoHKOponVNfJP/7fY9OgdvJ7/s1Lu
         3l6jcFfKme85zPvhZPLtFe+cTAHeR2+AYs7DBDdxLf6jjXu6R6/OUdCNMqqV90bsk/+z
         eDAYonYAu+1qS2NhmYGMUobM0xdrww3zU78ICc6NaHjgMUj5KHliBpymJuyVTkxhQ9lU
         H2ux/mTQhRmFXd7e6Ipsv/E1wrVf2JGPvj9ADMLjP6+0VIUeInv/jrth/BLs02ckt4zY
         1i5raKsEyrcUMA914fWGkInSDV6gBkYTbh80v6rE1MxNK4br6y+sVtpt9LCqbHEAWHJU
         P4VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782105095; x=1782709895;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Kbws4QKzuBZUU0YtrsuDrZfGpTcxxSjUqwqwe6Km7UM=;
        b=o/P9zZjuVhGdb71DsX57gKiKsWT+MZdlJg1tY1UAYdPUKQTUsy211QNAd0zg7IXiss
         /OYc3tHYDYmlc6TtU0pgqHGhIo3Lhej95Cy24uT325cqHrr5E8jKoflViHcqUnbHNjiW
         JuHrfqWtSojcUW8OqjbaBC4+6DV5iiKHmEAVPt8kYXbs6SylbD5qxcGP4QSN2koBBDbN
         sYIGsKB9yRW9WQtyJ+H9IE1mZjup7vJAuMgg0/M13VWLBG7t76Y1fRrfZZyEE/dx3XyA
         NO48VjVDklfYi7ZpqksITGOlJAXmauX1LvzfYr4UKUx0a8L/C+ZQu4C6qgYl0BPR1VkX
         kJgw==
X-Gm-Message-State: AOJu0YwY8fOBPm3HQVaNGDBV1l66dX7Fok7Oxurbn5XHdnZppGcvrcXJ
	YwvIQvrxSCL6n6V8Pau9C2KIEdnvip5HMXZMCaijQ7uQ4A/nNRgT+7f3mq22YNtmeO/ynpwx717
	XqT/b0gnkLAAz8/B/cRWoVZMM2lSqqvlDCPatBfS8A6oJ4auX/BOB2bWKib397yq5fH5T
X-Gm-Gg: AfdE7cnrFqXwYNyB/SiXdiyS71mAreKKmbrieFdfQiyZ/+wiE2JZAh8iURSAZAGz2bb
	aDFCkF+iXXvRwlnml+3aLkP8qViZ7HfaCmojCeDfQFgu280ojZUYwyFkr0cp8KcgAbi3BA2se+w
	4tnbLFbJphOM4XTvytP4vwZGDK8PADmS5AfHhGT8QO+mZH20p2f4uEYJ4QLEI/qNjYJEIl8Y9O6
	NLu/3UKotmCX1x34VRWdHXhjlWbf5mlQ7laFvKqKh5d21uLNFBmVUZLffsT5kszYhNE3uxgvWVB
	5o2rf7BtIfZO4Ay8DS/F3XFF7Kaj+ptbxP5lfj1kYZF4Lt2OY5sTGTKEMGorMmo8NDmKjkL1DGG
	9VgguNyHf1S+0LGc8xy0GOjOyEpoQNxDJwrDD17ZktDLzaZTGXA7R7/kDfQ==
X-Received: by 2002:a05:7022:2509:b0:136:6883:c4bf with SMTP id a92af1059eb24-139a2052b97mr8703959c88.15.1782105094593;
        Sun, 21 Jun 2026 22:11:34 -0700 (PDT)
X-Received: by 2002:a05:7022:2509:b0:136:6883:c4bf with SMTP id a92af1059eb24-139a2052b97mr8703938c88.15.1782105094066;
        Sun, 21 Jun 2026 22:11:34 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c1bd8d779sm8947716eec.17.2026.06.21.22.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jun 2026 22:11:33 -0700 (PDT)
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
Date: Sun, 21 Jun 2026 22:11:24 -0700
Subject: [PATCH v6 1/8] dt-bindings: clock: qcom: Move glymur TCSR to own
 binding
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260621-tcsr_qref_0622-v6-1-c939c22ded0c@oss.qualcomm.com>
References: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
In-Reply-To: <20260621-tcsr_qref_0622-v6-0-c939c22ded0c@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Qiang Yu <qiang.yu@oss.qualcomm.com>, krishna.chundru@oss.qualcomm.com
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782105091; l=5188;
 i=qiang.yu@oss.qualcomm.com; s=20250513; h=from:subject:message-id;
 bh=WPj6hOdlH8hNWqKJPYnfFON5wMzrQYhCrOHse+tcr0I=;
 b=wOBHb65uijYQULWH8kJtmqA4AK2ArjifRgOqrQcEOc9oOyuYcAO8rjQRFYnpc7RlBAvq0T90f
 k1KGYvRyEdJB4l2ibLI37KEwZ/LRpu/8BvRVKb+2LnoxYnga9iwRltY
X-Developer-Key: i=qiang.yu@oss.qualcomm.com; a=ed25519;
 pk=Rr94t+fykoieF1ngg/bXxEfr5KoQxeXPtYxM8fBQTAI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfXz0nDmp7XeWZC
 NrCH/LmJoi5uzq1wrbQv1pZpTlb4AOpiJ9JlXFQcyRo3BQF3ou4JttTB7MuE5QZh2eCxzD9gMCC
 L1y2ht2WcRa2b+dbMQryxTN4mheXRO4MlWPtKlK+7xuUOJPA0lYGPaSlgGOD/guRNWTRL+4e7cH
 ZdB4xd5Kg8NzuObDUEtKIkyGuzu8RJwGgwl8eybEh80f+aUeS/Ff/sywQYKYE+23eckmks3hQvQ
 89/5l0MJN8sZ9F22U1v40gv6xOv9e0qnuC21Y3Sqh2ZqmkTWYZ7AdvjBMYRierZw9bAXkJr1lat
 AX34HYuDv0DCpFFW2UxyVsDsF+/BwBeLAV8+86g6BnIxnBUl7stbHYw+DpIB4yIpleCgoK9LZzE
 vpzK4RpLfIdhjG+S2zzuba0bYGRrPDB/1tym7M7mP6ydUCVE4e03weHeYxc5GdvtyyXeGw/z8N1
 wpEqRbbNYeTbXYCZqZQ==
X-Proofpoint-ORIG-GUID: iw05zy1cF5sk-_YwysihbM5mIiznoulu
X-Authority-Analysis: v=2.4 cv=E7P9Y6dl c=1 sm=1 tr=0 ts=6a38c407 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=12nZpKSYVJl7DlM_WUUA:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA0NyBTYWx0ZWRfX6yNaeCpMCPi5
 RV8krctpWu68tFZCoZV8svZ5A1sOlrUVmk5cumH1uCPx4v40cMQK3CaDFQWnwhi/2I3JDRvOUpy
 q2//5m7em8t1Bca7vfaf6QTQa8UFjuU=
X-Proofpoint-GUID: iw05zy1cF5sk-_YwysihbM5mIiznoulu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0 adultscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606220047
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113919-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,devicetree.org:url,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:qiang.yu@oss.qualcomm.com,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F162D6ACAD2

The QREF block supplies reference clocks to PCIe PHYs and requires
dedicated LDO supplies to operate. The digital control interface for QREF
(clkref_en registers) resides in TCSR on glymur. Since QREF has no
dedicated DT node of its own, these supply properties are placed in the
TCSR node which acts as the control interface for QREF.

Add a dedicated binding file for qcom,glymur-tcsr and document the supply
properties.

Mark the relevant supplies as required per compatible using allOf/if/then
conditionals.

Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
---
 .../bindings/clock/qcom,glymur-tcsr.yaml           | 114 +++++++++++++++++++++
 .../bindings/clock/qcom,sm8550-tcsr.yaml           |   2 -
 2 files changed, 114 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
new file mode 100644
index 000000000000..16fc6ab87f9b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,glymur-tcsr.yaml
@@ -0,0 +1,114 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,glymur-tcsr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TCSR Clock Controller on Glymur
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm TCSR clock control module provides the clocks, resets and
+  power domains on Glymur
+
+  See also:
+  - include/dt-bindings/clock/qcom,glymur-tcsr.h
+
+properties:
+  compatible:
+    items:
+      - const: qcom,glymur-tcsr
+      - const: syscon
+
+  clocks:
+    items:
+      - description: TCXO pad clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  vdda-qrefrpt0-0p9-supply: true
+  vdda-qrefrpt1-0p9-supply: true
+  vdda-qrefrpt2-0p9-supply: true
+  vdda-qrefrpt3-0p9-supply: true
+  vdda-qrefrpt4-0p9-supply: true
+  vdda-qrefrx0-0p9-supply: true
+  vdda-qrefrx1-0p9-supply: true
+  vdda-qrefrx2-0p9-supply: true
+  vdda-qrefrx4-0p9-supply: true
+  vdda-qrefrx5-0p9-supply: true
+  vdda-qreftx0-0p9-supply: true
+  vdda-qreftx0-1p2-supply: true
+  vdda-qreftx1-0p9-supply: true
+  vdda-refgen3-0p9-supply: true
+  vdda-refgen3-1p2-supply: true
+  vdda-refgen4-0p9-supply: true
+  vdda-refgen4-1p2-supply: true
+
+required:
+  - compatible
+  - clocks
+  - vdda-qrefrpt0-0p9-supply
+  - vdda-qrefrpt1-0p9-supply
+  - vdda-qrefrpt2-0p9-supply
+  - vdda-qrefrpt3-0p9-supply
+  - vdda-qrefrpt4-0p9-supply
+  - vdda-qrefrx0-0p9-supply
+  - vdda-qrefrx1-0p9-supply
+  - vdda-qrefrx2-0p9-supply
+  - vdda-qrefrx4-0p9-supply
+  - vdda-qrefrx5-0p9-supply
+  - vdda-qreftx0-0p9-supply
+  - vdda-qreftx0-1p2-supply
+  - vdda-qreftx1-0p9-supply
+  - vdda-refgen3-0p9-supply
+  - vdda-refgen3-1p2-supply
+  - vdda-refgen4-0p9-supply
+  - vdda-refgen4-1p2-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      clock-controller@1fd5000 {
+        compatible = "qcom,glymur-tcsr", "syscon";
+        reg = <0x0 0x1fd5000 0x0 0x21000>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        vdda-qrefrpt0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt3-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrpt4-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx0-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx1-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx2-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx4-0p9-supply = <&vreg_l1a>;
+        vdda-qrefrx5-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-0p9-supply = <&vreg_l1a>;
+        vdda-qreftx0-1p2-supply = <&vreg_l2a>;
+        vdda-qreftx1-0p9-supply = <&vreg_l1a>;
+        vdda-refgen3-0p9-supply = <&vreg_l1a>;
+        vdda-refgen3-1p2-supply = <&vreg_l2a>;
+        vdda-refgen4-0p9-supply = <&vreg_l1a>;
+        vdda-refgen4-1p2-supply = <&vreg_l2a>;
+      };
+    };
+
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 08824f848973..19ae0634b922 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -16,7 +16,6 @@ description: |
 
   See also:
   - include/dt-bindings/clock/qcom,eliza-tcsr.h
-  - include/dt-bindings/clock/qcom,glymur-tcsr.h
   - include/dt-bindings/clock/qcom,hawi-tcsrcc.h
   - include/dt-bindings/clock/qcom,nord-tcsrcc.h
   - include/dt-bindings/clock/qcom,sm8550-tcsr.h
@@ -28,7 +27,6 @@ properties:
     items:
       - enum:
           - qcom,eliza-tcsr
-          - qcom,glymur-tcsr
           - qcom,hawi-tcsrcc
           - qcom,kaanapali-tcsr
           - qcom,milos-tcsr

-- 
2.34.1


