Return-Path: <linux-arm-msm+bounces-116099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 49y+GmSvRmpHbgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116099-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:35:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D358E6FC1CB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 20:35:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=evGfyPBv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Tg772cVf;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116099-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116099-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2548630BCFAC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 18:33:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FECA36923F;
	Thu,  2 Jul 2026 18:33:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28B834EF05
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 18:33:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783017203; cv=none; b=G4Js59crGTzXWHtASTjbQCRC80zBoXX7SKL7xT8vpKgYewQecKyiVBCW5DJ6PQ869F2RF3Zs+uyMulOOLdij1zIEfjgKnj65r+tMOioD25bE/4Dp7azHoTgv6k69+Iy959OMDOVRxv1+XvSo4UH//Y6RsBtTy6QpzquIpUUIWW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783017203; c=relaxed/simple;
	bh=19mmEckBUJGeN9DN5ffYBqQt6ULi+z66mXHOJ2yQjMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IgSwNMb2lm+yGfa8TRqJM5aN6xnXJwY/5A0l22APvtR8F+JLAVbgTIbOuOxE/NMOYmuuNAPTlmmvOFQ4eNGQsA6zv7eq1LdSORsCa09K0iX3xfYBmbdmZmdyXW3MiUSfEWPMuDZUdlo1pvE3oP7ATe2mQocVVL7Ro6tYHWHB5mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=evGfyPBv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tg772cVf; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 662E3epV560435
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 18:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J5D6hk80ySWEIZRtu89Dl4syOBTuObuXvvf5lY5zwZ4=; b=evGfyPBvZJxQtmcG
	/T3aXRHKhAuN4xE3yJgxPLAic6M72JazO0smK1EgO9klTPwTSJq5XhWhKYgeRKJv
	FMUNEsdO474K6dyxnR8GTuvni3dIYjGMfslJSda2vsuYQcwN8PY7O8sYyyFEPySP
	eMwTmt4QyCOJFlRRsIWMAJ7uLHKpM00Ia17970raXiNC2DIrOuLUu9ofPcZFu4ej
	To6fb2GEnGt1Pz4yqYCFaZ0J6ZR+pBKDZmhHSJsY7JVAl5z/NtEJVZFIFnjIOZbu
	+qok9DHXZDJDQg9AOLMVhobzgnKIOBt4YcAMiLJ6EBs1FaA/cNabBEtva4zHRFLS
	FYXecA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n9bjbja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 18:33:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c889d1eebafso4037259a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 11:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783017201; x=1783622001; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J5D6hk80ySWEIZRtu89Dl4syOBTuObuXvvf5lY5zwZ4=;
        b=Tg772cVfjIcZxu1PGyHxbyRb24R5QjBDVffYRfa5zplYn+RLa1TonkIasolPipMGrj
         G72N0476V7gQ4tlL6yl5HpQCUhd5xKBjvyAND34nWqyh5E1N/BhUuucfmSBfX271Pdji
         nrYuTUDI1NIvsSvx4g00ZAef0uktowkg3VzOp8nLl00RGZjmMIx9pxMGCAq0MDGgz2pM
         YzvqSR36GuPfhj/sybpQ+sexPAUfezW72W+TzfCcDSmYLEWOkhUNWoxE5X6qQE8q6Q8D
         avL7qHK/xVpTYsXjQmReA/PocyL8cTac2j5Ud73sD5vptiu6VfOKgf0U/NpUKMPJDzzZ
         zg6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783017201; x=1783622001;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J5D6hk80ySWEIZRtu89Dl4syOBTuObuXvvf5lY5zwZ4=;
        b=AkzPo3X8EhbCcQ9UP/ys6zq80jNEzoUP4J0ywIQCC6adUo35DmTzGgjJ3gXjTHn+ja
         RMFkYKH3e06MrKI64I1S5rtJ8h1Uv7i7coUoIE1PJr9OboxHt+rm6wvVU5hTVkXW3yaS
         k0096IncLXIMahKEplCy0B6O2VMJIWXJVSSA9HP06Co9KBuuh9IhgNLn8q3DBZEscpOj
         JmfonbQxz0wiEo/mmOCX6+QEdRykylGz9lwmxPfSkLuK1uSYXYns1qNTyVQlnBsMtnPJ
         ki9nQacPbPnoP/GFNIaOVFvNcHgxbBDAcM9IJ8KdnW3L2tWTIXNdO2uqAaLw9HFwyJCi
         1iDw==
X-Forwarded-Encrypted: i=1; AFNElJ+KMU0xFy5sUTx894PJ+1Y/xQ4p8GJXxEEKgvAjjUqpgz8hyPlVA9xoW3z3zLAgcxe+DfBvqLBFPtC3jz9G@vger.kernel.org
X-Gm-Message-State: AOJu0Ywmr9AX2j3T/5R2mPHAIsjM18G+KLUow7+2VMKm3/E5dWNqUVuT
	j0RYmHcU+8saVla2CF/Kr5/BPCKLzqlL9LHDI2I++hvMYemutEvikd4WNDL4b6KtGKhJPhBSMBP
	p9uosGuDgD3h+1v9XH36D4cr5l805sHTYdvOldX1q2jxVUzkGP0csoc8LtWyUqNw8viIa
X-Gm-Gg: AfdE7ckDkAydwcbA+2xQH2aXnvyIJ4LFfFhi03l59kfA2T7YhUjNSmpf6F+9m7xpM0N
	jnEedEQUHAeH5L9Bm3vOydK5hmtU00KJ4Wx89+LD34nxpcjCY5Nszp4Omwy3zZHCkYlIwYYl7hu
	mAq7PDmcQELRbWFuj1rJmz2o+IIO6CnbwG5oOSJA7EDKodZUMmF8oSWvmfbF5qupOj8RGyefYyd
	erRMvNQQUjIbaVm+5mPgk1g9Iz2eU2MPTTpY6hW6Kp93dRuO7KTcjE2DqrziNVQ9AF5vUD7FZAD
	k/KkpPebQpWB9O/m5NA5ZIMQjA1I7iRyaSDazo1JFquYCu5CWjaJxbF8LTXL7NIB00+ymTsDoOA
	ZG5L26p+ZTIFUfPl9IUC5U9PkVBvjmJ/Cz3SRFWe3mQ==
X-Received: by 2002:a05:6a20:b786:b0:3bf:d0c8:2a8b with SMTP id adf61e73a8af0-3bff40c71ffmr7618603637.20.1783017201413;
        Thu, 02 Jul 2026 11:33:21 -0700 (PDT)
X-Received: by 2002:a05:6a20:b786:b0:3bf:d0c8:2a8b with SMTP id adf61e73a8af0-3bff40c71ffmr7618581637.20.1783017200953;
        Thu, 02 Jul 2026 11:33:20 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c7ef5b3sm15704735c88.1.2026.07.02.11.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 11:33:20 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Fri, 03 Jul 2026 00:01:27 +0530
Subject: [PATCH v5 05/19] dt-bindings: clock: qcom: Add Qualcomm Shikra GPU
 clock controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260703-shikra-dispcc-gpucc-v5-5-cc13826d4d5a@oss.qualcomm.com>
References: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
In-Reply-To: <20260703-shikra-dispcc-gpucc-v5-0-cc13826d4d5a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 8vhm0FEg3_Vvn_Q20hUJvhnsJDM5Rcnr
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfXyG7+7SHuORu+
 9Ud1o+qmPOrPBXl040iiHMYoNJu7kygRIvAZddvQlbGTtOacJ5f5v0U+v6TrVfQBl+q7dC93IG9
 YgkS9B6dDodqSRc650seiMDM/zj91nQ=
X-Proofpoint-GUID: 8vhm0FEg3_Vvn_Q20hUJvhnsJDM5Rcnr
X-Authority-Analysis: v=2.4 cv=bOom5v+Z c=1 sm=1 tr=0 ts=6a46aef2 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QCmBRgXzxa-qq5PbeBQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDE5NSBTYWx0ZWRfX84n2hBcfBoE9
 F/gzCy6t8SxI2gtMya/IIJ7P2zb0FZPIsUpbbeWMeRCOhJnZVqpKFHfyNXmxodOh9ODJr6VTgQK
 nRwelqjCCf47ayx2+lLZH7icj3OJahwO4aPszdZVEwDMFR9VWn6dEllc+p+vAQNZSWCBWl9vMx6
 mrcc3qMYWGjWsACD8bfCcGb6ZlsTQWbHabsi5UDpM9VxWK9nNvQevo+AlRWvTbI5ncis/EhMg+T
 pzqXZTulITSPs0AMCMr+yEH57pH8uaTNMpFtMlR+Yml8+ReAT9Bf/GEByoheO1pv3Z8RhPw4TTP
 GAr3TggtSo3/UcgrRnl0Umb6+PQLSlDtJMF2WnCyUjxSqUxS7nu+tChMy2LecIoUVBjqsOYJQAy
 LjC9/KYXovM5kikE3gwFIQA2325CIuKRttVcnUvqG3uuS/cwh7tBtOvryJDzeeGKjIp1J89qCfd
 taYkGjluufeBu1CP4FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020195
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116099-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:loic.poulain@oss.qualcomm.com,m:bmasney@redhat.com,m:lumag@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:imran.shaik@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[imran.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D358E6FC1CB

The Qualcomm Shikra GPU clock controller is similar to QCM2290 GPUCC
hardware block, with same set of clocks and minor other differences.
Hence reuse the QCM2290 header file for Shikra and document the
Qualcomm Shikra GPUCC compatible.

Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
index bedbdabef67286afb6ce0a1ac53d1a9a15a01a92..ad2386190346cc10f53763e7c3b9fcb35fca8ed5 100644
--- a/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,qcm2290-gpucc.yaml
@@ -18,7 +18,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,qcm2290-gpucc
+    enum:
+      - qcom,qcm2290-gpucc
+      - qcom,shikra-gpucc
 
   reg:
     maxItems: 1

-- 
2.34.1


