Return-Path: <linux-arm-msm+bounces-111316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fwsgF1RkImptWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 07:53:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B946454FA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 07:53:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GOqQGO2v;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WqMb2XCg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111316-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111316-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6A41C3090014
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 05:46:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BB883FFACC;
	Fri,  5 Jun 2026 05:45:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04F7C3FE67B
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Jun 2026 05:45:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780638356; cv=none; b=UhfDdnUCsAhlOY5Cy6FoLxv6O4v8qmgfLK9KGJEoR01o/6LTgSd/8ZU6Z1EmpmjqPeoBm7coVhLgImK/6QJx251MTtG1isl5XvH5TWVHecz6d4bYnLJDmYy7iFYa2h/nKlSRlGBJ0ecvnlUKrRWWOH/BpuXZyqxtekKsbcTbCJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780638356; c=relaxed/simple;
	bh=gv0Y9MyUS+ZAL4uhHrLN51la10ovmLjoY2+Agz1LIaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LLKjyvfyL9TIVjUwX9U1v1E4mZm+zp9rm7qML1sSsZILLmzCOZhoqR6LaPyLH9rlThkp9joT+RsvpDheC6D9cwSTr9/6gNqBph17Oo1kB52yPISnT4Fvm620nUYCv1vjSf3JtlNGhkKniJV8zQB1t8KzxeXesZiWSaoF2/QFqZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GOqQGO2v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WqMb2XCg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6553BpkL944656
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Jun 2026 05:45:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W3pGinGeW1bQ1ebKAUhXMhB1L9iSucHuKDFvqamx6eg=; b=GOqQGO2vXGIll/WD
	VgnQ1qruMWla29YHLgjfTJxSbHsd9ymvefJC460jLrTY0u//MrS4Kk74LsD2DBhN
	UWduA+fQFuTGPMazy9cZIa0fKg0Bx5kipVuETZ4Lna34pUax+kZ6DGc8WHktiaht
	fX2BW4D5DC7vehTUSeBW6yBlyT6Eem9ROhymmBGkrfUuYlkEYftcput453jCF5qr
	EoeMcbUZoJ7gMRYDjFoUr2qsEsUNiyEWFvDi2GxCVHI5X1yO7VTpiZUowEZ8aTdv
	kuX6SqiE6UMii1vDwigh5jn6J/avdU4gAIwIGijP6+0Czteq3hGDGhdsz12tGfH/
	kz1Paw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek8d54aaw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Jun 2026 05:45:54 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-304e7fc90b1so1372254eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jun 2026 22:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780638354; x=1781243154; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W3pGinGeW1bQ1ebKAUhXMhB1L9iSucHuKDFvqamx6eg=;
        b=WqMb2XCgBJO8tuEeGpnNbW1cY+xwFYHJi8Co6X+OH6qm3hNitNLp5a91x4Kgvgpkm+
         6FqrrrZH8Xv+y73kifJ2hl16wm3y9JcTctaCo0t/rv8RcI4VmkdyAs8ZrC3l9tN4VFkk
         ti01hSgh3E/f1SZYWk+/cxuuUaM2ZyMGGjuJJYmv1PwdYyg5X6uKfVvyeKLtlrKRe4+G
         zLDrgCa2ma0L02AiyeLDgOz8x5nv937ImwbD3BXLt7fcuAEf7zpiId1fWZLH+UK/O+YO
         turVGJBMVUfOSj4S9YT9TXmSlCXzT6XD3WB7syFQ+9qJ91ZOJP5CsLL8TMa9yXryhkDP
         ZzgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780638354; x=1781243154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W3pGinGeW1bQ1ebKAUhXMhB1L9iSucHuKDFvqamx6eg=;
        b=hWM+Qhw3k2lDpzWQwJhgaLuD2HwTMvYeDBhT06YdFhzToTwggMxDpysJ0Hytv9yVaP
         JUfqPJgtdaGwAHzRmVIXu1ExFfNU+ItDyDpg8noegss5v9XHt6k7/kSGu2Prvhtco7AU
         bwsC3B2sxrvZ3JoDah1C4hD0fDloLDhE3rrVDp2Vi0TCV5zsSrkeyTH18XUToW/rCRVr
         M6eGDnExTM0rfZ9XwRXuH2J2NeIH0NndAEw5CGxJMwQk7D+p6enuVhy3ota46PcXhVw5
         mm46zNmymaMNWeFGZZR8o/i9xJgsCQat0dpNNvR7l7LWj2+RrP0Ivq0+LbcgcaaPGTW/
         ynKQ==
X-Forwarded-Encrypted: i=1; AFNElJ9Ronne/JSi8iztXcgZrkfFqakUzG65H+5WDoEvkfaa2N3h8y8BDhOofcw9nsKVeyJBKYnZdKLq0nRmvJ+T@vger.kernel.org
X-Gm-Message-State: AOJu0YywN7lCLPDBE6xBBiBaPDFhFTuFCa3dpOM00KTJwdb24+D+npwg
	4gLCoyoKZ8/dylINDbLvkt9X1ntIPSxDLznkPv6DKqABrTjzd3h43ES4cy/nPjLY27Y3E+TLS9N
	qMBGn20gH5QrqXLWbpWVp7A4/nosya2rFEaCaDDSlRixGxmlG2StLfCl1elfUD9f5uMZn
X-Gm-Gg: Acq92OEJodqbGkUFT2Rciv2X2uaazpmvGLvTNoty4ecyjmsj3MXKMJXhF3+DONAadRc
	Oen0xMxi1BAbgQPR5GlVi9Iw5nT2zLu7d6EhMXDSWNKiE4KQLFtlKR9TmQvdgP5akWiSyKZzKGx
	pQwEqd2LJ+1oAgEP1yTWNeQ+aKmIBJX5sjOwsVHQMtXYmodasvFsh26YpG54MDSqlXTPWulohjK
	EZxoTWE2M19rRqP7lDVlTu3ST0pJOQexQIJNz7+rKMDXVB1u8RpF+m1JbSbl/lHCKSfjGP5eYF7
	727+ArddN759uw5G4mUUyMAeJJuVNrRzav5l1gwZor4YB7m5zSlvtbKhvo9aPcNaC7eJ/s7mw+M
	NtizXtFPkcM962cls9f7qFD83X98esTutDubkSq/DPeDs2yepFPrdpNj41NVUa13Thrcy65P+o6
	q9Xab9umk=
X-Received: by 2002:a05:7301:e2c:b0:304:e59a:e3d1 with SMTP id 5a478bee46e88-3077b2d5182mr809790eec.24.1780638353681;
        Thu, 04 Jun 2026 22:45:53 -0700 (PDT)
X-Received: by 2002:a05:7301:e2c:b0:304:e59a:e3d1 with SMTP id 5a478bee46e88-3077b2d5182mr809772eec.24.1780638353199;
        Thu, 04 Jun 2026 22:45:53 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074db560d7sm9480955eec.5.2026.06.04.22.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 22:45:52 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Date: Thu, 04 Jun 2026 22:45:46 -0700
Subject: [PATCH v2 3/3] dt-bindings: soc: qcom,aoss-qmp: Document the Maili
 AOSS side channel
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260604-maili-soc-binding-v2-3-21b5e9bd1aa5@oss.qualcomm.com>
References: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
In-Reply-To: <20260604-maili-soc-binding-v2-0-21b5e9bd1aa5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Chunkai Deng <chunkai.deng@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780638348; l=912;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=CVljbqe5SWj1mK1ZsXqlF5s7x32zAr8qQtASafj7RVw=;
 b=jMGYOKI7IuKuxl7rFv+vy9EOfiu9n0LSqDRKLAM+Vu6R164rGHILsHDPfZKkElHc1Xq3giSPd
 o9WRHjZ95hPD/8EHXVwR7FrSWdiIu0MWfc84uB5g5ifxlMXmb+7aUkL
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: PLE8eFvrmBgEWFExNosG4bQOicpkNk2u
X-Authority-Analysis: v=2.4 cv=IZG3n2qa c=1 sm=1 tr=0 ts=6a226292 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=Jk4Rp6uFe9xYLVmVXOEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA1MiBTYWx0ZWRfXzZgeja24MZx8
 n8TTh2GJ1OzLfsv8Yh9CIq50MgxXaOUd0FDuCG57P+GSIUJ0lU19iXzuNoingNRFKPNdG0LPQhF
 Yobp+vRfvWvsCL1bzkVZ7C/kd+z9OS6dDZ7BrOinjqx0jWI+r4qdTFwRAc5nBuOuL1crEJVXIIJ
 yBtwj6JJs/rsOWn2Nr0dhGLPDGnt4oziOCpz9jDiFtf4Nkvpki5u3y8OfIy71mI8V22FijkmfL4
 kAnbmtk6NbpfR4a3qO/G/vAhaQD0VyFbkie82eSM6ZCPfxLCq+y7U1tPDtUiacuutuNZVjy05Su
 rhY6eIgqbyB6IRVbLXLRRQGJ0JqriuIkJg8TGk7bB4+e3HWPwBrmu2gnEYQ7e/vE9W+vLyLuI+z
 Z/EHUGkuo4sAfVOh30111cj2lo4sOdnQH9+tzN8FhdxffZu+nvndSyTEAKbUKXdbtRqRQzjrQQ/
 WEemJgrwJpeFifpmdeQ==
X-Proofpoint-GUID: PLE8eFvrmBgEWFExNosG4bQOicpkNk2u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050052
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-111316-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,gurudas.dev];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:aiqun.yu@oss.qualcomm.com,m:tingwei.zhang@oss.qualcomm.com,m:trilok.soni@oss.qualcomm.com,m:yijie.yang@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jingyi.wang@oss.qualcomm.com,m:chunkai.deng@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jingyi.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15B946454FA

From: Chunkai Deng <chunkai.deng@oss.qualcomm.com>

Document the Always-on Subsystem side channel on Qualcomm Maili SoC.

Signed-off-by: Chunkai Deng <chunkai.deng@oss.qualcomm.com>
Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
index 8eaa04431d74..9f9d9bcb66c4 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -29,6 +29,7 @@ properties:
           - qcom,glymur-aoss-qmp
           - qcom,hawi-aoss-qmp
           - qcom,kaanapali-aoss-qmp
+          - qcom,maili-aoss-qmp
           - qcom,milos-aoss-qmp
           - qcom,qcs615-aoss-qmp
           - qcom,qcs8300-aoss-qmp

-- 
2.34.1


