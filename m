Return-Path: <linux-arm-msm+bounces-118484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zyBuHjN5UmowQQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:11:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B92367425D5
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 19:11:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BuM8S0Fj;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Mte+4u0L;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118484-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118484-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 96EE030238DD
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Jul 2026 17:10:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CED403C872B;
	Sat, 11 Jul 2026 17:10:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13B8C3CBE8F
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 17:10:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783789810; cv=none; b=btT4HYmlK8YQLkmW9EO/itmYXzJxv8Bc/TonVYA+3QgtdvmOT8CqZR5hK+FYT+AFAtrabLT7djOCdJkmCvZMEyil3jLqtaNNh/Dwah8d5hziQDZMUAYVzQQdJ2MDn1+54fC1wz6bEe0I0BzuEjBXZs2TOw8qs+tGTiZMzEJ3ntU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783789810; c=relaxed/simple;
	bh=8lGlCWqfdYi7aiY1rxiuhydlcqTNR1Zj5JRjcwDR5mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hfcoEBnh+fKHF9IYA4BrM+EFUMgMtfpFyOyt/zlcq6i4T1VEu76jtCjXKK7joiZcduUbuq6TBsylCl3QovBK1Se7LLE2ihDLucm3hmb4UcTrBN5a3zpkWW4QPBuGLloC1j+A36k49L5S5zGu2x4a67U4OxHJZxjcaYqb1UZJbZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BuM8S0Fj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mte+4u0L; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66BEOJck4163289
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 17:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J92HCrkNQWDeiJATR+uKaGVLbk3Fakz4sww9g3DnQyY=; b=BuM8S0FjBz/er5aW
	BgGl3nzdootNhU4ESd+1yiLFfngtyblalz0HcVK7QXroZTczRKYvxZaJopZxoeNA
	8eRUSqxcZ5XBJxY6SRThjLX041492AEra+1Zaj65JfeSx1I/OIvMQaaI1ASbDQ7d
	MCdlpffAM0hIsmn7p/A7mEdAK4Fz/bbkeqXQlnNai0GL0CJuVzcQSjI+pfVMwSBk
	hQGW8bWWp6K3BJ+zRBwT6o2WE/B+fU+o76opx6Xy8gfCzHxLCLpeMXJRBZfEYaj8
	Ecy0S+okY0povkZPALnHHWG+ZSzFWnkvVYwqoIV8x7iE2lj8nn4/kData4ZCnr2A
	ROFvbw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbeaf98ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 17:10:08 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-388b404eaa4so2338405a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Jul 2026 10:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783789808; x=1784394608; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J92HCrkNQWDeiJATR+uKaGVLbk3Fakz4sww9g3DnQyY=;
        b=Mte+4u0Lm5YDMjYqWgE5sbKwL4QoMhZtEqiViGAtvZg/UQ5gCMpcWC9Hki2yQ4JRNA
         oAndOcLR8swDWkqA84mKTGlTSHyCyhu6h3ukNq9AiAAbI5N32VXWcs5rK8WbeuclDX5F
         l6YZe98V/3NN30D3gPW8Br7orBo1l5lZ2LvButile6aBmE3oHWqjf61lJxnFqiSDt7aT
         ARx9vMinlCA4ET5AI86gXGGIs1xvP+fQBEO26zUFtFE+KP0fIgrMNizu+dM77ztjGm09
         FD9G6jkM1vBcv66q7r8zBoE4pTGosWW4N6o4Iff7A+xxqPs24NHUH05acZMlL9tNCoqG
         7nyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783789808; x=1784394608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J92HCrkNQWDeiJATR+uKaGVLbk3Fakz4sww9g3DnQyY=;
        b=L6IuWn8ULos4gPpkThhEwTeNgqCnXOL4qbIyIVZcLpd6rzyE3RNGLX24jL2O3jAn42
         7YQyTrmatZWXZcYz3mkPuktevwJDN2o/aULI1aZIn6To++PfScMsaZvWh95UL1X0ktUS
         DqI7MwR+UjDIqHHNCANBvbRHyshyWRwRQ8PGnjIUKK46UhRL0LbpaaCtJgcCkARPuIQ+
         L62Z1pufF2j07WY2Lx5SbcdtTb/3CO2Ct1+ljyY3mXN/WL0saLNRLKSYByezw5VF1UTR
         0QyHxycaE3co2jkjusuS2NToLZEYYY10U9Py7IYM+XXZOoIGaY0YuH8lyNopIEbsOIJE
         iASg==
X-Gm-Message-State: AOJu0YxTMtjIauSRmXRSpuvMkn6eW7Uq+RiH7xvMgJr8ls9B2j9COwek
	jtWntDzzH386tE/dq1xeBtKEjrzjSj5AZkgNMFX0LwgOgBHirb2vd3O6g9c2g3Hipd0ft6kA5ej
	MxJ0pL7fTbwTCVqiOooQSrTv0iPE61SlxAjgQ7I5sK0yaxaf+4vs0h0P83SWPhhFnyC60
X-Gm-Gg: AfdE7cnviZ1bYEkpqVomMVSdiQQUIVg4j30130SxC0s1WfK4ARSOoRrCSJ/Bnmp8t+9
	5pYtOVqg0vm1KWxiYoQ0ws8OaLuG0grxfEwTwymH0S9vZzmd9mP0vL85DTj+oojpz3e4eSMR4qN
	McfKXcjuxCna/EW3+VY31O7P/O2E2p2gbl5qzjjidLPziLduSh8YiPCjyUBoN6FfIJPAaiG8a1J
	3ByDc0ub5d3A+z0Srh0QmeN7OCfwKXLbVcwLKkNKJwip6VLjxMm1KjCTDQJmYVVI5Fzlt3AbD+d
	9lIn2/jdfW/Ze4Sefzg5fMt68I3VtftE+95/5LBZZWla2U/LZPb3AkZCN5VI+0a/+cZLwt4X/HJ
	bXjPfdxN1KhBBoLtwAjxJnpy221tAlBWe+anhCmcskn0DHE4rG6t8j14nH5h5s/EPU4k9HCbAQe
	Z9Ljlo
X-Received: by 2002:a17:90b:4b83:b0:387:e0db:3d8b with SMTP id 98e67ed59e1d1-38dc77c6073mr3311376a91.38.1783789807623;
        Sat, 11 Jul 2026 10:10:07 -0700 (PDT)
X-Received: by 2002:a17:90b:4b83:b0:387:e0db:3d8b with SMTP id 98e67ed59e1d1-38dc77c6073mr3311342a91.38.1783789807089;
        Sat, 11 Jul 2026 10:10:07 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313b9ca880fsm12943635eec.23.2026.07.11.10.10.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 10:10:06 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 11 Jul 2026 22:39:51 +0530
Subject: [PATCH v5 2/4] dt-bindings: phy: qcs615-qmp-usb3dp: Add support
 for Shikra SoC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-shikra-usbphy-v5-v5-2-229ba3602737@oss.qualcomm.com>
References: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
In-Reply-To: <20260711-shikra-usbphy-v5-v5-0-229ba3602737@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783789793; l=2846;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=8lGlCWqfdYi7aiY1rxiuhydlcqTNR1Zj5JRjcwDR5mg=;
 b=Fd/W894Lcl3jrwJbSLo58sU+4+bu9bQmx6S6YbXilQIaXGLD/ndZnTh/OZjzQNHb+kiEg0PaQ
 f8heR2iGcRbCcb515j2v4c7ZWJxEz8ex0o9UkOdIdZfh3Tq4cqTusnM
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-ORIG-GUID: X9x6p-tEae0APpwENvXqGMQwtATm5DZ9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfX8NhJxRaPJGrI
 PoxcMduRS1ab4GFuuayzoUAohEZl4dJDje8Rt9OFdog1tjq59j9/ib+vDbpCKPPJETKbVpRHoJ1
 /CG5hcERc1M9rmhiZmXutpSE2DEO3q7FaU/xPJVhHggAtxikLqCeySYIfWeuQUGVdPhL+LCP8Bc
 E+o5xwhC6jhBY++dE2X7X24y7Tnn9cQwcvC7TQ43WfYG7RYQCp4zeMIXhtVSLO9fwJ/bHh0hOMb
 sHVo8FiEICBAgoFk3zQDmzT7W/+31dgI9c75ciDOxJlfgkwH1n/DsfrnR0bZjBU1yYuVyEO4vfk
 22ArBkAQzKe8aWyVDpxUuCdPKgcMP448u3qnZFWFaI/jeHwEKV32fQVD/r2CnMb1K7CN9yLN2FS
 NqGDXLnqT607tdTjuYvx4+f6HegVm1VXrwP8yA94FRcWgXT7BJcj6C8KhGUV3WLTccbO7OM6Ijx
 jYsnBwBObiAt2vcPMYg==
X-Authority-Analysis: v=2.4 cv=O5MJeh9W c=1 sm=1 tr=0 ts=6a5278f0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ufZ60yBX7R2ALNXMlhoA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: X9x6p-tEae0APpwENvXqGMQwtATm5DZ9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzExMDE3MyBTYWx0ZWRfX/+cZV+/fofMY
 f26S6/WUEkvQJUmKZvfCoe4klLwCApQ0yg+CULGmlLwkSFJF3dHwhc5o0TsnKY/1ODjJBM3Vqjw
 3wjZjFo09HSL9OB6MeTcbCvfySSmM7E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-11_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607110173
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
	TAGGED_FROM(0.00)[bounces-118484-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:xiangxu.yin@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.kurapati@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krishna.kurapati@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B92367425D5

Declare the USB-C QMP PHY present on the Qualcomm Shikra SoC. Shikra uses
3 resets to be programmed before initialising the phy. As per the hardware
documentation, the third reset is PHY_PRIM_SP0_BCR, hence naming it "phy".

Also, add remote endpoints and orientation switch support for getting
Type-C orientation information.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   | 54 +++++++++++++++++++++-
 1 file changed, 53 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
index efb465c71c1b..908c0f199c01 100644
--- a/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml
@@ -18,6 +18,7 @@ properties:
   compatible:
     enum:
       - qcom,qcs615-qmp-usb3-dp-phy
+      - qcom,shikra-qmp-usb3-dp-phy
 
   reg:
     maxItems: 1
@@ -33,12 +34,15 @@ properties:
       - const: pipe
 
   resets:
-    maxItems: 2
+    minItems: 2
+    maxItems: 3
 
   reset-names:
+    minItems: 2
     items:
       - const: phy_phy
       - const: dp_phy
+      - const: phy
 
   vdda-phy-supply: true
 
@@ -63,6 +67,22 @@ properties:
           - description: offset of the PHY mode register
     description: Clamp and PHY mode register present in the TCSR
 
+  orientation-switch:
+    description:
+      Flag the PHY as possible handler of USB Type-C orientation switching
+    type: boolean
+
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+    properties:
+      port@0:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Output endpoint of the PHY
+
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Incoming endpoint from the USB controller
+
 required:
   - compatible
   - reg
@@ -78,6 +98,38 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,shikra-qmp-usb3-dp-phy
+    then:
+      properties:
+        resets:
+          minItems: 3
+        reset-names:
+          items:
+            - const: phy_phy
+            - const: dp_phy
+            - const: phy
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - qcom,qcs615-qmp-usb3-dp-phy
+    then:
+      properties:
+        resets:
+          maxItems: 2
+        reset-names:
+          items:
+            - const: phy_phy
+            - const: dp_phy
+
 examples:
   - |
     #include <dt-bindings/clock/qcom,qcs615-gcc.h>

-- 
2.34.1


