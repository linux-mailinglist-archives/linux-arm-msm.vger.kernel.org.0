Return-Path: <linux-arm-msm+bounces-108575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Hs3MsKaDGqUjwUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108575-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:15:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B4963582E5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 19:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 948E63044E1E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2026 17:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E979311C2F;
	Tue, 19 May 2026 17:15:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dR+zsZAI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LYvdO943"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B1D305667
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779210939; cv=none; b=SkVC45uSJ1M02poZOumtGY8BBkajOA3tnINvMfY7bPwWyDppxc40AgDc58BRkKBrsGpvsljhdeH2xKllOexa+nea3WJ0o2zASj7WKiOAOUwdZGGub6kC1RLhfqZ7YdVce8+2U5Rb0BJtOB8fVlN1fPFWVngZTQPJ4Y0NjHs3eeU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779210939; c=relaxed/simple;
	bh=Q8wHeL91TSb3urvpRCuxQfEFd1CujUhU0rk1XYHwsiQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rDooYaLgtLe91+vy8oacxOqeBbe6TW/dWyLsBD1Qum26isn0l/thOYxOjKngveaNXYGGjO9SbcXrlWmC88sXg+U9IUscs6bcYL41WK6Yv5SK7eSr4d8JR5V+oFfqSZXAVyu48H9NBUMfuHMFtSH2sXwz3HQfdZVsrMQxaZndLFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dR+zsZAI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LYvdO943; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEwpfP1637044
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:15:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tOITleWCuvp
	i0+dYRoQBpEMVHrSEpgzzTWuCd/gwHCw=; b=dR+zsZAIJF3UFECu5KsfUSmTEZS
	JzIMwkClVRN6LtkUA2JYnGSR6Qd1a/b1rtXlu/RcREa3+Df1hN4fxYhDY5HmXfhS
	qhQCPCjr1RB0yk65qBUiKzEQKziMwgzRarx8oVOKvC+sZ+YcaFkBSl7h+yB+/AvW
	n6gbKLIOx6l3MGI3CS7VfLdmPiUs5wLecXyl1WfIeep55wNhs+cAVFuTFrp7tmNs
	E7vIzY+G7cC3R0suVoGAG6NlYvHNc6tvKoDlKxdbWrpsD2afxdomVd4g7jFNdDCP
	TaZKc/MszB4voeIf2Wl40LVkDS89dWAeOQUicoSPqINO+5n3eFByNM+CETw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3s8ns9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 17:15:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c8292a9605aso1863002a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 May 2026 10:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779210935; x=1779815735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tOITleWCuvpi0+dYRoQBpEMVHrSEpgzzTWuCd/gwHCw=;
        b=LYvdO943H4zRUYBvtu17kIYpE2BSWCWwesHJjAUhNibnq8mpoB7RZSSLlYfRPG7dnP
         Dxy9xy10g65Z2jiz2/2tOTHtXKvP+fjggiwMTEzSjwYaq8kM2ZuWXntc2Ou0BNKhidPl
         /upYtCJGMneI8GDQieEUcy0t2/UVSBWM9buExP24XcyTMxO2OQcrik2Da/zz4Ee/PHCu
         mH+sl4gPxj8VN7gr1+djpRRr665WsMxsznIH8vbPXcY+kUUtYZgqUzSQIRlpV8qmh6iE
         1pwb3YCI+1f/KB7OAkkJpCAsCcGj0cslatbq13jvOJV/WCuouJTk4X6hauNiBcnUz8X+
         fbGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779210935; x=1779815735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tOITleWCuvpi0+dYRoQBpEMVHrSEpgzzTWuCd/gwHCw=;
        b=WQqTWODpJWoIy1ju7kgdQTaeY3Xq3Gi8SqqiLIqOoUmbfzHbeYhkh1fAgQuA38eOiG
         IR55jTnxNBFYjaszQrinjo2LISOi2U9BQetgsO2/Zz1V/S5/HYTpnpWiLSrNXcllK7R6
         Yi4eIIkeu6R4n9+cwSDD/jReD/Gk0+weu4Tw6ocIreT0a536AwYMFv7AMzz9RrQM2gqM
         O8pwdRMvLYV9biH9Hzjxb32u9S1tCVLRwg8peUPhs5W5L9lTMgOyTaACD3eJhhDxaPXj
         zC5fkcU7ihGoHmWLi5ip4vRm/4oqN8ytVpVfN/2rvMP2wmZAvIzrmSvGY4mX/DNQl1GY
         zTlw==
X-Gm-Message-State: AOJu0Yze0v4mYTS2APR/I9JzPzEGdsuvHiSqgIVqZDqZ2uq0GivAQXuL
	YCazfCOc3Yht42ty/6OGLVVlYjVxfb/20b5Xtga6VfIH6zUBY1qYJ0kUTBGX4JhWPJXLui/PP6B
	/++gm+Xa/BekpXr7vNUU4f9heu2KMMI+phVs6sExNq0JQoVPPPnyoHcZSkJt/noZoiHSl
X-Gm-Gg: Acq92OFXISeodrq7/N0AHzfQZyVFsULw4W3q0x/loJe2mzPiVKwGpC79PHahm3fBJCD
	zpnR6AgVaKqEyDUCCWmhhtRhQ2GvKG2rd/Za9y6sRqs5aEvLT8u77pOSVqPAsQnP1unZjrn7GXB
	7KXYpGqUEOoCNYh93PorHc5byg6SYfMYzcfFa3vp7V6U5w4ie+y6u+W5a/QnIkOjEQYJ21VbE8X
	Du1CNQHwssabS10ztID/g+4N3xl9kuRl4dWzdRZKK/eg7MD451uXwtnJIwmxKeLxB3rY1peHpPc
	bPb0MrR2wLMbG95354XRe0gNAzcQXUWKm6x1SBZqYgh9mK25+rpearVukg5N+wuHSorniuM8ZFP
	7RUaadWB4EOn0c0p0Uc7cSYYKEGrls8+Z66MnXO3BE/mqhjXK
X-Received: by 2002:a05:6a00:6c9d:b0:82f:3828:a01d with SMTP id d2e1a72fcca58-83f33cf0bd2mr20263875b3a.29.1779210935039;
        Tue, 19 May 2026 10:15:35 -0700 (PDT)
X-Received: by 2002:a05:6a00:6c9d:b0:82f:3828:a01d with SMTP id d2e1a72fcca58-83f33cf0bd2mr20263832b3a.29.1779210934470;
        Tue, 19 May 2026 10:15:34 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c77822sm18634720b3a.41.2026.05.19.10.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 10:15:33 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH v2 1/4] dt-bindings: firmware: qcom,scm: Add minidump SRAM property
Date: Tue, 19 May 2026 22:44:39 +0530
Message-ID: <20260519171442.1582987-2-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
References: <20260519171442.1582987-1-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE3MiBTYWx0ZWRfXzz9+jxrxGvAJ
 pxwXcs5cdcsGxOG3jkB0QBYVFbzdZFQJpANC43KMYFoQmWprX2c7Dl0HBdytCh7QuSvnT9kSgV2
 NK+H8hJ0k2jQP0cqVkoeWlGuHaVWAprQZ4B9lfNrpwCIfVHckAK5r50EKndkwf4HhDHpr82BW7l
 W5QwDHlK5IURpLkRFfaF35uqq4HAzIBVLKJAwqhGq+NPXAM9iuQBdK0HOFLh3d76NBQdR81aTC/
 64S7ezvPKgIBs2YPFi470TfDa2CTV2t62WxrZHHh76sCBr95J3z+BgaFQ3kVF7Wi6Y5FWCsNibx
 x9+1IyUB8wHjAi1UTB75hYhniAD87Z7s3YLEptIjQjdLHj9y+4zFhSXzlg28un5dTLUHWTDzQKn
 KNf7sCqvAcXAB65KJ/ujeG1MHU/N9CF4lfHEwlZZE05WhTPt35+MIPo66P8NOqFrzSLCmIrRbTF
 VtUHDRQdp0c8ukaf0TA==
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6a0c9ab8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=Uf9RHLb8GrDHKnSoJrcA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: xNcYSUTyf_s24c6DyuluGShciZnK_nv8
X-Proofpoint-ORIG-GUID: xNcYSUTyf_s24c6DyuluGShciZnK_nv8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_04,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190172
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	TAGGED_FROM(0.00)[bounces-108575-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B4963582E5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On most Qualcomm SoCs where minidump is supported, a word in always-on
SRAM is shared between the kernel and boot firmware. Before DDR is
initialised on the warm reset following a crash, firmware reads this
word to decide if minidump is enabled and collect a minidump and where
 to deliver it (USB upload to a host, or save to local storage).

Add a 'sram' property to the SCM binding to describe a region in
always-on SRAM where the minidump download destination value could be
written. Boot firmware reads it before DDR is initialised on a warm
reset to decide where to store the minidump either to host PC or to
on device storage.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 .../devicetree/bindings/firmware/qcom,scm.yaml   | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
index 25f62bacbc91..27422d00b8fc 100644
--- a/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
+++ b/Documentation/devicetree/bindings/firmware/qcom,scm.yaml
@@ -129,6 +129,13 @@ properties:
           - description: offset of the download mode control register
     description: TCSR hardware block
 
+  sram:
+    description:
+      Phandle to a region in always-on SRAM used to store the download
+      mode value for boot firmware to read before DDR is initialised on
+      the next warm reset.
+    maxItems: 1
+
 allOf:
   # Clocks
   - if:
@@ -250,3 +257,12 @@ examples:
             clock-names = "core", "bus", "iface";
         };
     };
+
+  - |
+    firmware {
+        scm {
+            compatible = "qcom,scm-kaanapali", "qcom,scm";
+            sram = <&minidump_config>;
+            #reset-cells = <1>;
+        };
+    };
-- 
2.53.0


