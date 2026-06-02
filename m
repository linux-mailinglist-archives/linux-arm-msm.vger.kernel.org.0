Return-Path: <linux-arm-msm+bounces-110792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFmPJ8qiHmq3IwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110792-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:30:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 225C462B988
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 11:30:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D885230E0CD5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 09:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C829E3CB8E9;
	Tue,  2 Jun 2026 09:22:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AW6imkDD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XcH983Li"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7874F3CC7EA
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 09:22:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780392132; cv=none; b=noKeF8vAsufHRfPYTRNQ4lqQz0ZtdFWecrXQyDoD4DaFwOqvAYpPPTI9SZ5kZdINv3PBRG043gddEjCnBRMz9WTMvN76F8Cd20Zwu1rroXFTCad8vB/gKmWL5+FXS5OsWaPdGlictkxPlEuyd3Kg3rzlIPjZ3aJo2YAf7Xry9/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780392132; c=relaxed/simple;
	bh=tJlShdbumFRNUNuWAJFM3tKrMWOngt5fm4kXwp3JGks=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UIx+iHFIlZn/7GlFI9DbgGCqQE4e9PJ0ABBGIjE8WIU1XKgaavuBtx6z/7OaZQce3WdL5lUQ3C8FWqIXoET0gU4oMgs5tPOZk2U6W+YVon56azvF8J8/Qr5VxarsPYjkAuLjLDmaxD5nEooqSfObbTj+I8Hi+giM4u5O3YYx+zA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AW6imkDD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XcH983Li; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6528Orl33430929
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 09:22:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4afBpKCHguRLWF6qmYAwFjXJL2LZxHraIR/uPgmNLCc=; b=AW6imkDDwrRZmj43
	yZ6ZEauqto41+32DGMhBbNKoAESf8YnVBmYTa0kezv5xW+ZvznfTC2QKHBjuInFJ
	Z9MNBPJKod7CKtF7sAm2F1niwcKDML/pYS7YEYGrRiPDNnl9+oKzduCvggZf79O2
	YMqFU6GV64VFB+X0A/+k0SZVSFHTJMkhL7sryxO/TNheHELcvMtJbY1QNcLjAEpK
	8fDaCsfFu5l+c/kxOXOnL8Vifr7AmgxCi46cd+ihuHVGF3Z1JwiiG8wf1HXPpe+T
	o41X3nkTPdpXI9v3+h2yzpki9JU9EDBPSA5ZqiAM0EdpDaLqOOUcIXIRx03bxgV6
	DQ8BIQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehn8mhrj5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 09:22:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36bd4146cb2so4188266a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 02:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780392130; x=1780996930; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4afBpKCHguRLWF6qmYAwFjXJL2LZxHraIR/uPgmNLCc=;
        b=XcH983LiDj1eJ8+qkp8bV1TtIwPCHHaU+EIvTV53QI9iMgYp+5N/hSJlI+6X83s8bp
         yH0VobF6WtDVhJGYtAhfZl8Z+TFl9cj7c+czZp7KwvE9vL71Mc511ZR1q8zcXBkrXaGS
         lDotb7hZZY7/t0yB7fz7JIk+OLZVkO8bpUqvmlhjuekrvZyVRb7+dHRHx5ccCzfxEbmy
         4UOsToi26RixrDLmddSpoWqH9Au+47z34XOUf4e4eIJ6QuVhlfF7rMHitMPqyWsfxFmy
         ReVl0Ti/Rg8llhMH/L+8h/h+2Kng6EK5+aP+vfr6GNQZNG/a9iQmcWQ3nfpTZqpurt/E
         GYPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780392130; x=1780996930;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4afBpKCHguRLWF6qmYAwFjXJL2LZxHraIR/uPgmNLCc=;
        b=UJ2+CSoTEucxxFmyPhbHsxZoKC3LbCr5DCLPizFUTgeu8gMTOcuhwSx96eJo47wcSJ
         kArOpUWJ5O0llsvkvREDZyiHSgJVvRdjxK9UGejzjsx8Q0L3vadDEsYRfefTr87PCgJg
         uZL1mX9Pa7c6bRnYvHZgSoNeKVz3zjNmw0wQqj3eG8m/tcfOXgkxDzcGu9QhtVV71uGg
         OixR5mKGejBhXK3+9/5VAN6zTEBT9pmooGixRe8iLywUya9gEqA5W09jsLtozpohLDlJ
         UD7kJTL2i4nHuGdlKRXFL0sHqDDUP6+ye546wyrdbgb126k4ghts8Be+Su5zZcuZAnFX
         miAA==
X-Gm-Message-State: AOJu0YxCOOB3RWh9koGS8ZfPsYmM/Ycg8E4mlmM1VtnwIikc8up91W+X
	v/0jn7SNtkMzXzJgj90eI5YcSBG8VCjE8iEEiSmd/OrfuUu40vsgh9n3/lABFURqRVOk8F6ARTy
	JcksqAFlNoUg/eZT8eABb0kCjICr2o33ielBVEF6IEJxXYlz06MBzdFrLDL/CHqgy2jjt
X-Gm-Gg: Acq92OE7rQMyY59Bz+bco3F5FIGvCNjBwaNAsqWbvGmL2IA+zzIuMpZb1H9/THDCaRV
	ITVHKwe4BLMPsB11rL0Cz1oc9o7Y+od2YO/o1qiEiRmvYJ9KksnRl6VyhpCibjO5qImeYspZQSz
	O51YBCvdgoI5nIIX4IZXHt5ZTtPE3HBUfatX5IuOBSH9LchPYXjRIvaFN5CZcxwtnXB7IZYLBhL
	rXDXoVWu1h2Uy051yoQSQO8FBoejIX3JrHt5r84zvC6PLrqk4VWum6qGyPP/a7eR5LSCJ0xrn1Y
	JG5cBhU0yv9Wmc3jW8Lom6TQmmfMqDcDUtFWCI31lxiV3MkJKIjABB0CUbPs6HV+n/uXcpESdaY
	7GjnLV+AZEwEqc47jLXEfz43wX9U6vZiGuplb8v0mSzlfVXaLlEJSd3pIXf6Zup9w9nwNPGLITg
	B5GZzCozsc55jzb7kLhSWp2rV4Ltkxxqg5Ry7qxn4mMh+vbpwJGTqgV68p9cGpo9gBgQw=
X-Received: by 2002:a17:90b:4a89:b0:36b:d40e:2cf9 with SMTP id 98e67ed59e1d1-36dd95082bemr2396338a91.7.1780392130081;
        Tue, 02 Jun 2026 02:22:10 -0700 (PDT)
X-Received: by 2002:a17:90b:4a89:b0:36b:d40e:2cf9 with SMTP id 98e67ed59e1d1-36dd95082bemr2396325a91.7.1780392129588;
        Tue, 02 Jun 2026 02:22:09 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd91f1affsm2154028a91.11.2026.06.02.02.22.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 02:22:09 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 02 Jun 2026 14:51:59 +0530
Subject: [PATCH 1/2] regulator: dt-bindings: qcom,sdm845-refgen-regulator:
 Document IPQ9650
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-ipq9650_refgen-v1-1-55e2afa5ff64@oss.qualcomm.com>
References: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
In-Reply-To: <20260602-ipq9650_refgen-v1-0-55e2afa5ff64@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDA4NyBTYWx0ZWRfX4jvts4dRO0YY
 IcDZZhhDvtp4tkW309fD/jAb20D0IdjDEfjPi//EULVUbIWs8or04zTVBSuzyWii2gpeSTt5J35
 bFZcJaWZJgE0eNBDMOgZIjTziY0HWxvEApXTMA1bsyVzsizbGc3s3oIhVY9lQ4v0hwYLC6QjBWQ
 Wu5JczNSebMsOvgleSNW4oHOBXLCftabqLtyYca7xZegyVTnSSYtl9X+CabNnMKueqdq3zTUWmp
 ar06s/TzmcQG4MGoq5g28uIw7z9yHJUIiBY9RMFbwwrT8A7b4q21WC665QS1BOmJETZ4EoiAOkJ
 P64wkC0ICvfvP4OPresEm6YkDiLjLHcD8jXed/zflyaddBee2JzEvsggMtHTCOJq11WZpPli4d4
 PtfdnCMFbgRfUaemcyPKbcLN2t1DLvjuxXKS0lNNxb5f/ELoDwv4TMf61pJMW1Q6Ocy4kjrHBHp
 bvb9BSypxEl4JrkwFBw==
X-Authority-Analysis: v=2.4 cv=d5nFDxjE c=1 sm=1 tr=0 ts=6a1ea0c2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=VjL3xhqMjkKYvgIonoEA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: bsidKgzO4xmXGsGMMCWxe6SbF3RTkpwX
X-Proofpoint-GUID: bsidKgzO4xmXGsGMMCWxe6SbF3RTkpwX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020087
X-Rspamd-Queue-Id: 225C462B988
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-110792-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

IPQ9650 has two REFGEN blocks which provide reference current to the PCIe,
USB and UNIPHY PHYs. Unlike other supported platforms, IPQ9650 requires the
REFGEN clocks to be enabled explicitly.

Document the IPQ9650 compatible and the required clocks for it.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 .../regulator/qcom,sdm845-refgen-regulator.yaml     | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
index 40f9223d4c27..2686569ca060 100644
--- a/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/qcom,sdm845-refgen-regulator.yaml
@@ -16,6 +16,16 @@ description:
 allOf:
   - $ref: regulator.yaml#
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,ipq9650-refgen-regulator
+    then:
+      required:
+        - clocks
+        - clock-names
+
 properties:
   compatible:
     oneOf:
@@ -29,6 +39,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,ipq9650-refgen-regulator
               - qcom,qcs8300-refgen-regulator
               - qcom,sa8775p-refgen-regulator
               - qcom,sc7280-refgen-regulator
@@ -45,6 +56,16 @@ properties:
   reg:
     maxItems: 1
 
+  clocks:
+    items:
+      - description: Core reference clock
+      - description: AHB interface clock
+
+  clock-names:
+    items:
+      - const: core
+      - const: hclk
+
 required:
   - compatible
   - reg

-- 
2.34.1


