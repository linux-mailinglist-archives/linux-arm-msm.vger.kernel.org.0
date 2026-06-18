Return-Path: <linux-arm-msm+bounces-113795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id hFo/EkwpNGorQQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113795-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 19:22:20 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BBC6A1E67
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 19:22:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=am5Spfla;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Xu6+fbqb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113795-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113795-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CA122303F3C4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 17:21:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24329347503;
	Thu, 18 Jun 2026 17:21:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29962EAB6F
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 17:21:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781803300; cv=none; b=Grm8hHhwoZPodMGizAW/AO0vwgdNJQB7WuDAqqA2jUHigbf50Z40hvF9e/R6SijKfJolV+cf6JT5DDJZLk96m6O61wJTQHvNvnC6ZanVtK+ZMjNFi0Ls2s+bfZHPSC4ubLqzidjgHRZ6DXZs0UGCNfqzucCsrz+tTvNIXaCux0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781803300; c=relaxed/simple;
	bh=ZdwesjBbdggy9htszoxKAzqcAWFg1nb4JcdGqwjhpoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PlhBaRmgUv+hXoRVbXFl9UljMDpLOlporpU2x1YMH+FoPdhBU1SxI2zc7wTFWOXyjSId1iHSf0Cz55rEq3t4AfVTDQT030lKgUSMlaJlM4pBSjWHItmW8FYHxtY7C7mJP5572mIbMe+6b4MK0ztXj5BJEBqmg9traWXZ7Hrttk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=am5Spfla; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xu6+fbqb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65IGGFB52254014
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 17:21:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GJxGq6d333OmiaxdBrGQvKKedF2ij9m3JZovFGWTPcw=; b=am5SpflaIB5xaJ80
	kCrmcSBLq6UG0WGye8gSAJwkYB7EeUgff6Q7cuOhFsJ93kqz2Yp5B93o/Z3c3LsT
	EBFJzytftKuvBp7Eldm3QYEZ4fGksh4hDTCLc+nR+R8AiM5ubWRfYds1q5dLrVrh
	INo8BM9IaS+oCZWT3dQyaf62/qoxVDYLSx8W1nOH/JNijo82LvXblgqnuxD09vcG
	C2fsWt4lJt4oIW4ke9CBtf2TeN5yxYDBqFlxhIsF25iH9D9VVzrunc0x+pBQRXSF
	A/p0b4rTWMnkTGBJJIXwRTjPRz0YDoeKBCpDT25WaiTyY7DgW9AxIwQamCTHlCXY
	XuytJg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4evm20gaqn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 17:21:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c89956023dbso522623a12.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 10:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781803297; x=1782408097; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GJxGq6d333OmiaxdBrGQvKKedF2ij9m3JZovFGWTPcw=;
        b=Xu6+fbqbAL826t7ziOntkAZD+r4VCVMaG6ImMPxy97loJkdGsEZbAzKxlYhmHRSHNP
         ioCHGzJ2b9F0efVzJaa7+Ch9RmpKA1CJ03PnSXNO1fya8AYkji8si/e56r9m/v6jCgvF
         9Qw1sM4RxMtRPZ2IC6t+ThYhcaf0VfuXx+MRUr0jJci2v76h8vhWDO+6hejbBGKq4Ud4
         6ZeyF1QykBQy1BFDtXXrNysu4alG1KFCR3yv1d+Gg+BUPLiJm5ahfWf0uOB/XjnMrFxB
         AIv3l/Fh2Z4UI0iM9hbhGShXDfY54nyLw8kXWqxbdJD7UzafX6P1fcfyXxG1HAqLiF5J
         AHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781803297; x=1782408097;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GJxGq6d333OmiaxdBrGQvKKedF2ij9m3JZovFGWTPcw=;
        b=Ha1VtK4mCllX2tGpe9Gt/3q6bCiK3+XNOuPfs/h4/GBri6dqK7bOc+tTCIhuUF1r69
         Y/1IpN+JyiUNJf1FhYJX5O15nAmPLzjjC08kc3+ukCEVthKXmNuYX49m7I257jGPXfaR
         1iTexKYVdhzLunc+K5RlzEmfpPe+p0rmVynTBqW+B3Jzts5285JssRqLgpftLpDNJD9w
         JJRlnsSAbqBXEf2F5EDgkt4D11+LIQlPohepD/2Uy3MMTd28tmeN4o3WHbwZSFDomKcd
         RJ/YCskJE/edAJMmqZWzbJTg+N0ukbJQtAmpZMc3twqjTj3G9sWRmZVY2gAhRY36NfIi
         q0Pw==
X-Forwarded-Encrypted: i=1; AFNElJ8w8Uql9LyJZLJq6eySod5hzoTTylbNqI91c6rq4LXVeVy5T16L2UBH8fpFwr6tsfcBo0Sx4+Wao/y4/p6s@vger.kernel.org
X-Gm-Message-State: AOJu0YyJfaTgCe3Eih/U7dvy+Lq2cZyQnJSdkxVRHgOZRbVnjXiiqSng
	YYWdKmHmISWIHO/HM9y0BGb84HVgmoXB/vRIOlmEiSzsFUUA65NxjR+3v6V88sewFhFbOMAtpR3
	hS5YydMlXcUT+Dx8PR71gbXi2diIkGs05/Ol6dPkXAtsLtVUhD4fx5+o9T8wJSA9K5vG3
X-Gm-Gg: AfdE7cn4VcqFjHsEVwqa8Glh/AZIDEn0AiJnlYnzUmf5Qo0NbjWlYeYO3EXAWps4+J+
	pY9uoxxWxWwunyQYqyd8t29JTdFq23SX4Vqq1065W19Bv4k7ZMjdnV2XL0GalUMU+mztLj0Y5ez
	Cd9BxF3yZGj9Da6BQliv5WxbVndeHqzCT8lOh5n7KZLzmsOnzLOmizj5SA9fBLyhSnaCisKAVpJ
	mLFc+KOH6p6q/UXqIdC1mSBRwLZue2blNgK/VLt65KrkztEzOrT9dohUhpvfvZMdoBj9xW+Yw0R
	jR7hOzLZW6dzWPRiZw0Q7Bddu6nznf9MmeMDZ4jA9+Y6cymkmhtGEnHDu05wWB1z4p7ZMPn+Kiq
	giwL8U5ICT853fJXcRzbeOcmjqYVv1mlySLg=
X-Received: by 2002:a17:90b:270e:b0:368:3d3e:efa6 with SMTP id 98e67ed59e1d1-37d15ea3858mr383804a91.20.1781803296935;
        Thu, 18 Jun 2026 10:21:36 -0700 (PDT)
X-Received: by 2002:a17:90b:270e:b0:368:3d3e:efa6 with SMTP id 98e67ed59e1d1-37d15ea3858mr383772a91.20.1781803296534;
        Thu, 18 Jun 2026 10:21:36 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d15df8b8esm187129a91.16.2026.06.18.10.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 10:21:36 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 22:51:17 +0530
Subject: [PATCH 2/5] dt-bindings: clock: qcom: Add Maili TCSR clock
 controller
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260618-maili_initial_clock-v1-2-d6ede0352113@oss.qualcomm.com>
References: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
In-Reply-To: <20260618-maili_initial_clock-v1-0-d6ede0352113@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfX2DxjLVw2rZ2g
 rp+bziJR2dOlcfIlxdMNlwkPvjNn8hdZZJOn8MnzI9cS02hGgRsnodHHyIXDdukASeLUpG1M4TL
 oc3rxCUqyqf4B1MpSd2x7QZPHDSXHgW8VuIJcOI7xs9H7ZDESCQ5Q8EkQPR5/kHweUGrJHYUwQX
 fFB8NU2X5Xl2yoW6cDsHliYaV8AwmhKV1RW6vhVTvVZ0JnBe+e5pmoC4Ip7ckQ0zUL3vpDiFp69
 fsJ+qerduWkKGA9Xo4dKoRYnPr7aZmtSBjRyfmRw6BeFn8qJXgt7EoJQjPI/GOcnl0W1aJF3GXt
 fBDOoqyTaTxgCt5++lhIQwqGrBFX5CjIIfOiqSKQ9P2oESmKtq6ExSad0YHymrFIvLkS38SxlAH
 JsLL/vn8euGOYNGV6zC3/23jxbsZU0+mEoc1ysikjkNX8oqSAWzOhwSD2ehXPfhAbZ/IJ2SqzgO
 D/yUPBeKCwqsliewbIw==
X-Authority-Analysis: v=2.4 cv=GKw41ONK c=1 sm=1 tr=0 ts=6a342921 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=e1wQWcbTFuPEDoJv1qQA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDE2MSBTYWx0ZWRfX8NcDdFPJKCyH
 ozPZLFRDB6v5PHkShqshmRerN0Nx7Nv5CAnlhtRkE9cn+TZuYfezcdDQ+rLBREHFNzrZddsPCS4
 McFylgwNQEaCSNSrkXjxlLpMpH1i0vs=
X-Proofpoint-GUID: RqidrgdgIpgqTR5QeWYmhcKJIGCKsce9
X-Proofpoint-ORIG-GUID: RqidrgdgIpgqTR5QeWYmhcKJIGCKsce9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606180161
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113795-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:vivek.aknurwar@oss.qualcomm.com,m:ajit.pandey@oss.qualcomm.com,m:imran.shaik@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D6BBC6A1E67

Add bindings documentation for TCSR clock controller on the
Qualcomm Maili SoC.

Maili is a derivative of the Hawi SoC and the tcsr clock controller
is identical to that of Hawi. Therefore Maili uses the fallback
compatible to reuse the Hawi tcsrcc driver.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml           | 34 +++++++++++++---------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
index 08824f84897358f2f7eac58e282a507c0489b5bd..15bdf055db3c012ea98217a0e7ca729ef41071a3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -25,20 +25,26 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - qcom,eliza-tcsr
-          - qcom,glymur-tcsr
-          - qcom,hawi-tcsrcc
-          - qcom,kaanapali-tcsr
-          - qcom,milos-tcsr
-          - qcom,nord-tcsrcc
-          - qcom,sar2130p-tcsr
-          - qcom,sm8550-tcsr
-          - qcom,sm8650-tcsr
-          - qcom,sm8750-tcsr
-          - qcom,x1e80100-tcsr
-      - const: syscon
+    oneOf:
+      - items:
+          - enum:
+              - qcom,eliza-tcsr
+              - qcom,glymur-tcsr
+              - qcom,hawi-tcsrcc
+              - qcom,kaanapali-tcsr
+              - qcom,milos-tcsr
+              - qcom,nord-tcsrcc
+              - qcom,sar2130p-tcsr
+              - qcom,sm8550-tcsr
+              - qcom,sm8650-tcsr
+              - qcom,sm8750-tcsr
+              - qcom,x1e80100-tcsr
+          - const: syscon
+      - items:
+          - enum:
+              - qcom,maili-tcsrcc
+          - const: qcom,hawi-tcsrcc
+          - const: syscon
 
   clocks:
     items:

-- 
2.34.1


