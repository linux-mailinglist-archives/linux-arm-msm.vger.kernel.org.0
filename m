Return-Path: <linux-arm-msm+bounces-93045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aAOQCRYBlGnH+QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 06:48:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D016C148DDB
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 06:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 67E4E30098B4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 05:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36ED72882AA;
	Tue, 17 Feb 2026 05:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZvoQW4CQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="folc8mpL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5184E2C0296
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771307270; cv=none; b=nnpiVOMF5Xp6wWl4KfdymHywrd8CStTwCXhXYZOKYLgbBRjg7jtDNYtOpwDCLkyo7gCvKOj7VGCmISLgLQZp1ZuQrpF+5hJEu08qPaXvxVR/CoGHlGuIYlZ3EhDP2OSSpAygOkcB8DDQIiz9yAmagvep/7W2hfD1XMtcszxuM0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771307270; c=relaxed/simple;
	bh=CGxDn2wQGy831CaAEyhJM4BBDVYLMNZTKDTlem8uIQg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=LAykAhY29s3ouoJFgbpoAHsy8je/RscLIha3NBldoO8APqJryKETJ93YAQWeHEfcgIsc2/gpvfUmFIEorV+2HCTikXSEWs9WkIze/+KG3Q1y6jxdjPVNUbXI7UY5QDFlFhuJ7QSj6a6VV7lSUDZ/qwoOok9rZHSDaLkDsluacZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZvoQW4CQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=folc8mpL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GL7xTE911039
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=t4LI1Fry9CJ
	vHO5MYeXpEHSkT1JzvPFcJjjRx2mFKr0=; b=ZvoQW4CQRgtdrlnRyB/xnQRzjJM
	np+0nH0tNzzBFaskO3XHCaLrAVdZlq6OpZzTGbSAS07Pvq3F9q5zSlA8qsCDtSoK
	hQaR4RguTEzgece33lyG4NUw6g3EwdiqGkKbbgq9qPzLOULImh7sqIyVP9EgLHaU
	xdv5JI0od60v1Hf2Vl28Xz3NOBSxt/9hKYne78oB1Tx//MwDe2ctnx8Do9v9jAUJ
	kEUGUsYqRGwN24rO0efZygcbf8r4g9DE1wZ6sZqn+RDfXjNdgZf4ZMy9+PHmB8ed
	D9D9zh5bhw3x4UIV8q+rHI+lVjmUjVxGbHvv0+61FrZpqikeNR7P56XMFDw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6a9sb2j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Feb 2026 05:47:47 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c7a38429so4387489a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Feb 2026 21:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771307266; x=1771912066; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t4LI1Fry9CJvHO5MYeXpEHSkT1JzvPFcJjjRx2mFKr0=;
        b=folc8mpL5hBVE6ZZzgBVkj1jqkrWT2rZVKulTy9k2OfXRAcu6/G+erCNFln2bj0M1o
         sQCJcJSONnU2kPC4NlGJwk15LE4Wy283ubmdPcDRpyMnu9gAZLDM6EhzAwaW73MO8Jtw
         CP/vdx4jCVwd+m0kE27ERnCCiTLzuQDPbELYtY9CDaf8aXT+UDQIBsd18Kd/uFGrKDby
         PZTh+0GzinT5muGaltbU8M+vE/knb/91OTaaVf18T/4/P6se8xZk2IkY4D8MUPanm8EH
         miKbLes8590OC95e2SnN6wmBN/GHUT4lKKjJnjU8nVjgcpBqXRV+ptaUuiUa0FDOpPkZ
         uEFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771307266; x=1771912066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t4LI1Fry9CJvHO5MYeXpEHSkT1JzvPFcJjjRx2mFKr0=;
        b=hhlWWOW3dx9+jqzocK3H2rChxpwKqbvBopbb2K0gUZSN4co4ct6P0P3hszEbX74yDx
         NlGD5/7l15TR4uv46nBee9GktgotFocSUDQ42npm//loGn9HwYYKTe1gVDTRDI/8AIuT
         MrvyZhlCH4Zu6Cp9hvZSU9YYCLUUfuReOoqdgtsWbhI37Ka6GSYYSRPpVIbPdN4CtUxq
         jl76Kz+1Fjc0YVFAAYprVWrEeP3uXjzCi6aHewIfOd6V8pUkhS/ce7YX5nmEYqxc8yHK
         cLWFZoDwB36YzVdwM4AgCQ6EVqXagttmY1LIYw7BJeDKMwWlvME+fJ/0WNwnsS9ymggN
         mxHg==
X-Forwarded-Encrypted: i=1; AJvYcCWQUTkmQozA/1XBYpTkhajfZ/ogchSJ+lQ87xwRuCeY1z5x0+7vA4+QLGbBVYb58Ezqtes5W1nbitC2O66M@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8+qkqEE++389bEWdPoL5r7c1Gp4d0GVIEHaNqA7rSRDd/GnKX
	u0W84tRgzbAhCt6t2UvT4DtVbXceCIvkMc8luM751xddA0KkEYTA6HSJN0h8CtrQR6BECdSduWY
	ePvQH8gvZiwhwoU59mVNWQk3Ktfk2PmIpB4Un5EpgIU4Kz4OL4ZFgj/oVLSuhxTMRPvL8
X-Gm-Gg: AZuq6aL+MST8OwW9yMKqF7mNGgI9mPw9vd/RRpaGyB+LZDMotT4tCN4zZqzZNA8EYIc
	cc93AU4DkhC01NQx9BgYvMboQqzb61sU0uh/YopYhzEp2EdY6Sl7hBewovEwI+IeMkSzuWj3JrK
	x4cNCTm4uS9J9a5NCHF39U7FDMJcfTBahRWYZC98f4Ot/chRsg7uGZHuDiNFq2CyJiOvXCF40E7
	Llb2MhyaAUcBseVESSJSIuCspVHo2kJun2YxIky2k0EMBO7mWpzpnJG+oNs/b01BHUy3e/1Fy6o
	ENELSmgygRBAnyB73qG8T9WKjvMzchPLEsd7bcGB41ELTGAMz1jce0uHByKL+nDPKQ5EhaIX7bT
	574NOE3DXF1o/NEE19IWuyC8yEhuHkbfOgQVxzUNdpmrdXtaUFIo=
X-Received: by 2002:a17:90b:3e48:b0:353:2972:74a4 with SMTP id 98e67ed59e1d1-357b51ad1c2mr9070755a91.13.1771307266213;
        Mon, 16 Feb 2026 21:47:46 -0800 (PST)
X-Received: by 2002:a17:90b:3e48:b0:353:2972:74a4 with SMTP id 98e67ed59e1d1-357b51ad1c2mr9070742a91.13.1771307265762;
        Mon, 16 Feb 2026 21:47:45 -0800 (PST)
Received: from hu-vivesahu-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35662fac3c1sm21429775a91.17.2026.02.16.21.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 21:47:45 -0800 (PST)
From: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Vivek Sahu <vivek.sahu@oss.qualcomm.com>
Cc: quic_mohamull@quicinc.com, quic_hbandi@quicinc.com,
        janaki.thota@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/2] dt-bindings: bluetooth: qcom,qcc2072-bt: Split to separate schema
Date: Tue, 17 Feb 2026 11:17:30 +0530
Message-Id: <20260217054731.3058567-2-vivek.sahu@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217054731.3058567-1-vivek.sahu@oss.qualcomm.com>
References: <20260217054731.3058567-1-vivek.sahu@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA0NiBTYWx0ZWRfXxOw/UXQMGUrd
 /MVqEGpGTpU+YXZE8TreDPBDy3d45z17kkGAUyuy3ZivghoKVT5M9VUTLpXuEHKbMvrYoVwM70R
 moJYTlIU3FAr0378WNmoOrtxOBJxeFQDQ8aDYTfvyPCK0Yd45U56A5324Fja2I5+Wz5AHVhVnKJ
 Gq2LNurW73gVivUgVChk54SPmO05zf7TaX2mVcTLICMhEW/AeaZhEZrXSsgE4BIohAPXfTYe9nQ
 ImoWxXBpNARZq4PPbENFsypb/ej8O/UQiWCwvFPukfRi0PyE+KK3AtgNjrPGyI6J6vCMY8x4TV+
 9GFec39KSmGHorsmUvzt7nTMziVQxG3BDBqmrNGFQXOy3qAHQv2OCTI0IboZaeqdaeyk28s3S/c
 nQUwFs2mM8TPdFDgqZX2u+czmD7PfJqsSyrR7MlTC6bzyssdlu8CQ7PbpvXj0YPypPK0oPKdzhk
 E0sKAOltfGBNqnRnA0Q==
X-Proofpoint-GUID: C9fkveasVBML1OHAMyhD33SAIK-sgCpl
X-Proofpoint-ORIG-GUID: C9fkveasVBML1OHAMyhD33SAIK-sgCpl
X-Authority-Analysis: v=2.4 cv=TPNIilla c=1 sm=1 tr=0 ts=69940103 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=gEfo2CItAAAA:8
 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=n3wo9_ZgQVSFQRmRku0A:9
 a=iS9zxrgQBfv6-_F4QbHw:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-16_08,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170046
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-93045-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vivek.sahu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,devicetree.org:url];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D016C148DDB
X-Rspamd-Action: no action

One big Qualcomm Bluetooth schema is hardly manageable: it lists all
possible properties (19 supplies).  Split qcom,qcc2072-bt to separate
bindings, so device schema will be easier to read/maintain and list only
relevant properties.

Signed-off-by: Vivek Sahu <vivek.sahu@oss.qualcomm.com>
---
 .../net/bluetooth/qcom,qcc2072-bt.yaml        | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml

diff --git a/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
new file mode 100644
index 000000000000..48936bb8e91c
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/bluetooth/qcom,qcc2072-bt.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/bluetooth/qcom,qcc2072-bt.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm QCC2072 Bluetooth
+
+maintainers:
+  - Balakrishna Godavarthi <quic_bgodavar@quicinc.com>
+  - Rocky Liao <quic_rjliao@quicinc.com>
+  - Vivek Sahu <vivek.sahu@oss.qualcomm.com>
+
+description:
+  Qualcomm QCC2072 is a UART-based Bluetooth controller.
+
+properties:
+  compatible:
+    enum:
+      - qcom,qcc2072-bt
+
+  enable-gpios:
+    maxItems: 1
+    description: GPIO specifier for the chip interrupt.
+
+required:
+  - compatible
+  - enable-gpios
+
+allOf:
+  - $ref: bluetooth-controller.yaml#
+  - $ref: qcom,bluetooth-common.yaml
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    serial {
+        bluetooth {
+            compatible = "qcom,qcc2072-bt";
+            enable-gpios = <&tlmm 19 IRQ_TYPE_EDGE_FALLING>;
+            max-speed = <3200000>;
+        };
+    };
-- 
2.34.1


