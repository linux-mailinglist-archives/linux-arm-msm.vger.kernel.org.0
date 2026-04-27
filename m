Return-Path: <linux-arm-msm+bounces-104810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SOc9OAyr72kCDwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:29:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7BC47896F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 20:29:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB4953041A94
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 18:24:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 254813E929C;
	Mon, 27 Apr 2026 18:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fbiF6LHA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HmDUvxIl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2E53E9F8C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777314263; cv=none; b=n9gUueT3PSo+XtRkDqqJyss9xiTFIejUCWu/UNm3Ydj9VJqSntjwxAZL4OD5TmHhbH8IPPAB4dAZpqUyHiwegeOqFBdnsXgriJAUTxkMyPt/yGh7G7sFr6/dfR7Y0Ovl75zS4+fL9iUZshXM+lyydq3o/moYEAJPLu8KHwhFCZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777314263; c=relaxed/simple;
	bh=jIECr9FRaVu57KbuvYt3TlCekOQQ8yPcnRI61ta4ad8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OsK5MTcBiP0CwFyuYnZ22WRpKeHx0LMHsCc9T+JOrk4/UNedCVrRwJQjVxYIN7rJiTapxQMgEOOp6oBVYjMsRkH1MhBjwTf7NJKg/TltK7yFzJrUVfG8y1YisjtO2G2BOczXG09ECfV+/eETRtORSBcbl2OTuyo5vbXjxFfADf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fbiF6LHA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HmDUvxIl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RDte1G241124
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:24:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4xCZEaTrqVgdHm7nGx4Fm4cHciJDfE1deL6
	gWETpCwA=; b=fbiF6LHAawntygaEVyT35coUxxr9Ml3MWI2eevZyW3YCMV1svpL
	82m1Yk6eWx6Cq6GpQ2qlVn0U//ZzPO5gjJMjNXjARNDyfbHnHzd63RgEVA1SxkYo
	R32o7fGjjYWuxIyInhpe1ylB5zumuDKjPGzMmUxExG8PHmGbr/MxHSrwqLZksb+M
	EX3TeLo4ohWuTDsJdXmjq8Si/w79X5sUXIB+A6GEcCPFcO2ZAS9n1n0OEVrXfhhw
	UYAj/1cKfz08J2B4qKEul5EfwHnTzNjVJsfv7WKn1rJU4udEvZwv9cjGFhp2L5od
	VS0yz+XakWS1IZPQK2+h2TPTkz1AA6CCTqQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt946s1v7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 18:24:20 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35fbb5779e8so11240957a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 11:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777314260; x=1777919060; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4xCZEaTrqVgdHm7nGx4Fm4cHciJDfE1deL6gWETpCwA=;
        b=HmDUvxIlt0pXj8BpXtnmUwNujFJc5c8fQTJysKfnH+Bexx4jdFixbC3PR9kGAIQNxt
         FHrJI4WnG21uuBqnM+RZh37TSQmOjalzMBWegwlY5y/VNFfeb3b1/hZQsPB3DQPO4M/P
         SDqUOlELSKivOLnY+ciPkVUkWUCYV1uQltcxkQKKZFc3cSatMDx2h4cV78C2CscKPSGK
         4W4KjO2q7XyYzD4Rv6glr69qUg4dYSm/iqseoeKmSF2ewVL97GKOqCoe39ZZrER1WkT6
         SNeVDomSnLXqxFYqHASPG8IV2j+ROxx/EEmPuaygGYTlbSj8RXv2a/1RS8m6TAzke+QO
         y+1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777314260; x=1777919060;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4xCZEaTrqVgdHm7nGx4Fm4cHciJDfE1deL6gWETpCwA=;
        b=TSCjcAKRTK0LpUuzmt+SADPCGr9RxJHtKUu4fIY516+PJE1IH1KoQIZI+pcVER/jBP
         KdINJOixbd3KbU9b/gWesPJxFh1q1m2IU+mNSLTav/6IDQpD7WPCjyaQgvbKfOPr8LaJ
         eV3o2eDfYGKhkAA0ll515AbJna5eXWM4jFb/KfBnB8El6Xi2OAD5LvrsFS1WR21P0L2+
         Yf+r5WK4e3n3fw6yIky5gkJr5qo8zO+KWxb3Illb3HebSDf+FhqCCaHdXryChSFinftz
         lgiP1vSot8kBIfQAyM8KWjon4f7CLWZAKWLJc4ZKDu0fuY3ARoprsBb0VZevEBOKY5R/
         YKxw==
X-Gm-Message-State: AOJu0YzmTH1rmLy3SpkMcfqGuykWHOpTcRNw2x5kfhsLOylhxwTPunRb
	fgE2l0b77OskefEvaXnyqTEH5F2A1N4Pi1koDC2T4aWl+Cp5EFrlCNothD/NaDDLvJKQDnwFR/e
	+11Mmt1BCvdZfEscmfMs2NlD/5+XirAWnB0NDu0/h+9zaHDDyVlb5hUBDGEZedkrQov7T
X-Gm-Gg: AeBDiet7ZaCgizCz7E2F3DyYWCZUXiq0DfNp3KnlXKPqNXASSxuflp+utvk2QMzX5dF
	jRrm8vN2c0mWavgbdxwZDAYo6/S55vtqMYzxgXdNuC6+2wrz/RKL5pHWFXtP7SM238HkJ/Bu1Cm
	BOe8tF7zoYQQUA6GrmXessFnUR6X64/1M1b+rzyF/wOhLQj8B0ptqW2GJglw73qicO/BHE7e0CL
	m/wYxkfUS4ybAqbzkj/SnBZh9rNKsRg9SMYmBEQSfbY/J8V+SaXsImJxpztsVIH13XKpF4D/5fe
	khGT8dsfk5D4VQZcG1k4q+XD1N0WUkcu6OoxIrtlZaNtH3leaG6QwhRO/aPClbm6Bp+hjcS241o
	yxT2isdwnm2pO7bTbgCJM6JjaXOrkLCEZBVa9bxfwSmDAG5PzIadBUrTZ7lA=
X-Received: by 2002:a17:90b:44:b0:35b:e553:9cc2 with SMTP id 98e67ed59e1d1-36490cd3a9fmr172369a91.26.1777314259588;
        Mon, 27 Apr 2026 11:24:19 -0700 (PDT)
X-Received: by 2002:a17:90b:44:b0:35b:e553:9cc2 with SMTP id 98e67ed59e1d1-36490cd3a9fmr172345a91.26.1777314259040;
        Mon, 27 Apr 2026 11:24:19 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3648fd6f625sm326528a91.0.2026.04.27.11.24.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 11:24:18 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: mailbox: qcom,cpucp-mbox: Add Hawi compatible
Date: Mon, 27 Apr 2026 23:54:12 +0530
Message-ID: <20260427182412.3666971-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YcWNIQRf c=1 sm=1 tr=0 ts=69efa9d4 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=I9E_dBgcrS10KifyaIEA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: PoNhsQ_76cLUgFAqMleB1NpiKbORNVt3
X-Proofpoint-ORIG-GUID: PoNhsQ_76cLUgFAqMleB1NpiKbORNVt3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDE5NiBTYWx0ZWRfX0tPKLX8Ve4xK
 cfzs8wp+oV3ehYA7H9XQzYIWe0Qbi3Nnm5KTwzfnKmv0r3M2pl284i+hBgHmg8IutCg9jgolk7q
 NkSBT8+ocVuM63dhrlO+r6rNBbAqqE4nqvDtFuqqrx9KkypPrdQ53BfWndaw+2ofH1eigBCvGfN
 cP5F/OZ4tyvlnJpSJhdZgSpdzjr/5JZIB8jx5hkHx1NSq1VelOX2dPTKU3J7/Zp7+15ZCtYJPzC
 aklaHHKdPxLfeEkUyNFMkX5BLpL9NOc5qNtULmCUaG8PGGsZ4pGlmeWHoD1u26T5OuDI/JThkc+
 6qtrxRBt2z9i1REO/l3iEr7FZ8T6f5fzXoTo23PTG1oIe8gQsnQzmJEVmEqXBzc98HSFLg6RNji
 ZCs/+QFEzMsLRGrXko7JgbqCbrFxjKVkpQmfEN39ZSD6ja/PrL2kMtuNZWkI2axqXajbsZz0ydS
 5uEd6X1auz0/vpQyYVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270196
X-Rspamd-Queue-Id: 8E7BC47896F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104810-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

Document CPU Control Processor (CPUCP) mailbox controller for Qualcomm
Hawi SoCs. It is software compatible with X1E80100 CPUCP mailbox
controller hence fallback to it.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
index 90bfde66cc4a..167ee222a163 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,cpucp-mbox.yaml
@@ -19,6 +19,7 @@ properties:
       - items:
           - enum:
               - qcom,glymur-cpucp-mbox
+              - qcom,hawi-cpucp-mbox
               - qcom,kaanapali-cpucp-mbox
               - qcom,sm8750-cpucp-mbox
           - const: qcom,x1e80100-cpucp-mbox
-- 
2.53.0


