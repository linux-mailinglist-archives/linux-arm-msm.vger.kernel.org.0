Return-Path: <linux-arm-msm+bounces-104812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CEbjGXSr72kCDwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:31:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C52894789BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:31:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8B8E7308EEA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:26:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BB362EC0A7;
	Mon, 27 Apr 2026 18:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PvkQSO6p";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dk08k0QQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D199B3EBF06
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:26:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777314391; cv=none; b=b/hpw9uYkAa+5kwIam/An31PGk8WaBz/M6uBLo2JYr3KZnZJ/mOg7MpB9h2FLr8Zm3+Bini8Wl4gan8dSd8orLbWykeS7L1fjIvBBEXxskR3UveiOsYI3rsZ2ckkgybVel/ce44Ib5tCvIAAeI6qqrrhv9B97eN38WTvrUNtk64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777314391; c=relaxed/simple;
	bh=U8lIKbZx9rXbsiG1JAId7FXtYIm1NV+WqS353EQ039w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zg8uXK5jEz9ByJwyc/XoLL/PCVs5JqdRymQQdDXjUKsld4cLX234ho5joVy+Q6dJ56pjY/+rWxE2WSsJdPuHLe5ImAXRSQ6qkZB/oxvHJqfKa9Up0biLsPcsWXUATBFljKhf6cp8va4UpbGI5GuK8HEhkPltdvvJ8t83flkwq5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PvkQSO6p; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dk08k0QQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDtqS5241654
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:26:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=qLO33O2Nqm0HSpowb/QjqZZDW/BfNbnAsen
	khXkycPk=; b=PvkQSO6ppcDBRoA8LW1GXHhbMwV/GjPjshFBwnVeHhkPceUdUsG
	HLgvHFkygcvVAPOxjObhlDGxuOGZXDT7V23+1eo3jqFxyUo3d5j7MJsBOmt6wH89
	/K/ZbuM8j7Ctk8JehTy9/8yVLC2oDXX7rr4Wu3eQFjuYRPFSdw0oaEIB7U5TkQYa
	kc42n0SV7G0KTl1FE+rc0JiYR4hTuAp11j6GoJqh0hUpMI+kZfGNJsOG1P+uvWaw
	NMDqDq+AERJafbxB/FOFEO3rYV9EofgaiOh27yBZH+B21Z0i1YXK5jL/9phZaQL7
	f5HKhYUIG7pi5GAtg2Yw4n1hgGFEK4rGzYw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946s24h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:26:28 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3568090851aso25048604a91.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777314388; x=1777919188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qLO33O2Nqm0HSpowb/QjqZZDW/BfNbnAsenkhXkycPk=;
        b=dk08k0QQd8LEWNbBHgx+cYpPhEOYha4GwL22J3zHsXhv90T3DuAqQpNn5afS6PlikG
         Y08c752MuKXRrFj5K2xEcJ9egQsHDwTtgegwtgNfsMS6GcqKBkAzehdd65MPBETo4SK2
         lzskn3gYjhu4HCARrCyfDjk4HEPy0qfRnVQuMJHt3GyZgSP71ekqI7waemGT12EUAWxa
         Bevuy5/nFZjsKjwXzplXMxGY5VNHnMWVU0aD8pnvBHHj3ZXUbCVXWsnMJx6OcegQ79TI
         qUBJwX6FRpD8zInC0L7gFyupCqg7+eZ4CZ/ZRzQUotYc7ecsGHCjAgcYKdDX+swbPIgu
         aEmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777314388; x=1777919188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLO33O2Nqm0HSpowb/QjqZZDW/BfNbnAsenkhXkycPk=;
        b=qVtrJjxLncvUMbwuAK20BkkD2w/0TB+8DJjkHBaW2fDGm36thC3yS75Vn8ojN7m6jO
         nd0jcJ3akn8bhs4ZTA5DbmsJJpLAWYpd94OJIyJVFp/5yTb3LZLGuqwkqMn6pC7mYSWb
         6dZuoCew4PrSmxiq35Etll382C2a2aFXNBzADMX+14TAPkUxx5YKuXVYqb+UgkorWslm
         hy+lRkEhp232haeO8lBwQvzHPFa9VOjMFEpiimP/511nmFTNjBaf8MV/g8xGt9rIZJmt
         YByjYEQoX7OU+6n3GO3FEBmvZnktxZyTeEdGm9HNk7t0gelxveO4YzvDNgE3+zDYKbqH
         EQvw==
X-Gm-Message-State: AOJu0YwfRzCZxwNoB+Kf1EDWnM1dZYLsP0JLYmC8Dz0OLtI+OSjXogxm
	hx56Uu3+cIqsbXjW4u9N+fahX91gMRqKTWt4LDBfSjCZ/Y7Zx1Yc5vPzc5UAyK/FL9P3NUBFkmj
	pCeUsOg4DWBNxDLECXGhirRCXP+fWxlKw+aSXpOOGVAkh0n8MXR4doOb14OD1218K5+KU
X-Gm-Gg: AeBDietzwXbfRTCQglVGeNR1Hv+BskjKXUSO6raEzRLsG054Fb74TS45PBZ/oZ5/DHg
	csWT8Wb5yTC6v27RD0bY65MUwOs3g3xTNVwz8U+AQoPBJwH6fBmRhfhgur123Zxdm45gxI93uis
	rwAx8g8yibLT7puSlDXQ+N/JJ6rQicD3wzxCdMUZ19LLKN7BhPKy7P+cc6AMM7fmQUEueZ1uvzr
	fCHtkgFkpPOin+Tbdj+2FnQYvuMtQySfWbJcom3DBc7iOsRu4w1OZMCVXS6HRBAqLKN/NJ0tIw7
	N4PQyH+7VISiWXUds+iiaWiyMGP00LkmESHKU/P7tL1uULrQFGCKLCkUY4jagQ1/Tl1zv+vPmvL
	7yphIaqYD/I5amYo0GSzwJ1TEKSPjwAa1pj9o9cBPYArUaqQ9gFcKsqkH55I=
X-Received: by 2002:a17:90b:4e88:b0:35f:bb33:d728 with SMTP id 98e67ed59e1d1-36490c431e2mr231700a91.11.1777314387696;
        Mon, 27 Apr 2026 11:26:27 -0700 (PDT)
X-Received: by 2002:a17:90b:4e88:b0:35f:bb33:d728 with SMTP id 98e67ed59e1d1-36490c431e2mr231656a91.11.1777314387119;
        Mon, 27 Apr 2026 11:26:27 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364902e7debsm286231a91.15.2026.04.27.11.26.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:26:26 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: nvmem: qfprom: qcom: Add Hawi compatible
Date: Mon, 27 Apr 2026 23:56:18 +0530
Message-ID: <20260427182618.3667963-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69efaa54 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=nVr9L0G5amw80CinYOgA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: _ctPCVN0xbSpDmRIrP_oGGeOJdeDAp-B
X-Proofpoint-ORIG-GUID: _ctPCVN0xbSpDmRIrP_oGGeOJdeDAp-B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE5NyBTYWx0ZWRfX2foTsR0aaRyP
 N5G1Z0iFj+nlKP2eMRuEx+umd3ZDFD1WXLwXtVqnZqAxVSSd0z9+Br51IAgRPSIRGsLajwYpbM1
 a/46ez0Q8wbcv1QMeGd3jvLhW1Ad5DM6jhcBhSKPp6Sysx60jEfv5RQ4w1R6RbkHk+VqDNI8qSs
 LqJE9RU/Cxw6cAS1Oz03byyr7HsFpLnOt8MKqlSrhnDWiZy7SJirTkh2w1BBrQzFGhWI4bzCKma
 gMOeL/WtXCGVIwU976cq6nSK1isHH4PMuSvFkIG5+d6ddDrh6f/t46AZf7p8snsC26+nf0lI3Lx
 Q+fhcWNc3URgIMs/hW4/sj/01z2xRnjmKalNvdS7w+WpTQ+YlKIqfE1bqrYqta0eVd+CaO5dF0z
 /xMNXTQz2V1ZYy2iZiFdDSf+WcBV42Zwi9pvRuAy3AkeiDTWYmlNUTcxE0DMXP04knVNa1BUgHR
 CPh5euBZNhLh6KNn2pg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270197
X-Rspamd-Queue-Id: C52894789BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104812-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]

Document compatible string for the QFPROM on Hawi platform.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 2ab047f2bb69..6117dd1d24d3 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -19,6 +19,7 @@ properties:
       - enum:
           - qcom,apq8064-qfprom
           - qcom,apq8084-qfprom
+          - qcom,hawi-qfprom
           - qcom,ipq5018-qfprom
           - qcom,ipq5332-qfprom
           - qcom,ipq5424-qfprom
-- 
2.53.0


