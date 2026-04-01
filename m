Return-Path: <linux-arm-msm+bounces-101348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGWjKOQUzWmMZwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101348-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 14:51:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C1C37AC1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 14:51:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5D35F311CC2F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 12:44:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3F92405ACD;
	Wed,  1 Apr 2026 12:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNAVBXLw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WmTy5wJV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 081EF3DA5C6
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 12:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775047492; cv=none; b=lZmKclrp3qslMLtarSCBlSp9Gx0H273NDk0TGqteSQCCIcd/yXr3/NS8oER8oRoCzfsTjEX9xe57T6amx02cw8UBaMBF4/fel8XW8903mfLUzmeqRBAguNjKSipVdCUjgguB5vi1Nu3fuunGNDwGU6trExwoJuDD45CY2PnHqc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775047492; c=relaxed/simple;
	bh=PplLofoYYsOeTtzwZzQTOtldU9PgupckQ8Lu+UN/3AY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZoZmDGopXYLvoVVKxE3qZEWZhJ7zGB3hT9jwNXcAUj7C1V4sm9JHkY3pnQjclI+e63yvKsVUIHaN6SOLcEiIZC7VqnI8pBCqFEbqpmcUOkov9PilvLj+Fu10weD6EjlLwIHr8oEkOq26U45GMUD/UOf38trwD4wV6SmdI/tMYzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PNAVBXLw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WmTy5wJV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631C4wvT4106675
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 12:44:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=T/q0fvuVukjPQtBCoPPqM8cPQUhT5omziWM
	9+pyh7R4=; b=PNAVBXLwqcS/lnb2Xh18rDThwqhXYpAAK7bmL/154e9p3TazRJf
	Hactla2CTJZV7cUoD+HmXVC4xvY19rJJkVw1wBNleak6TrtNePKU5M1v3CHC4/aW
	vE5IWbAlChqbYlj6jUeKUCcvMZ8XwC8woUeHmX3kbm4FVqH7eCDw9no6HasyxHL2
	GOXjqboxEeqAaz7Rbu1vuhyISPhdYc7OJ9RnuxzB/1snmtv8P6135TvauHtVFtGG
	3v87FzB49VA2YZv5RKzsQd31lp6VxbX/sxZhbVpJiTs09V5SLCwYMSSpo0ndBbAp
	zbKOVHKVqcUygZGRJaTuFonrWfALJ6RsVCQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8xt91cxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 12:44:50 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35678f99c6eso4999479a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 05:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775047490; x=1775652290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T/q0fvuVukjPQtBCoPPqM8cPQUhT5omziWM9+pyh7R4=;
        b=WmTy5wJVZ7dRkJMrrZaCtrdEP4cDUlpDbQwr4n8NDT3rpwgYJuB8d1/8uaBQHhl+l5
         PMy2cX4JdShOoNSs41+NcJcFfCgRjXWkXDipyTOA4zn4yCwcv+7IyAkISLiPSTUho9Mc
         +r+kC4gI9lImwMBCJ4i/GEp4BbmOAKc6z8y+SR/U4I7K+kK5smnnsEGPqaedK81nJmjY
         ioCRwEdQFX/X8fJmoItwI5B+YW/JIN/L4FvZDPLVllOOcRGfNlt53FbnqRHAzMQp5r5T
         NepMDW/+PTzw/WkmZtnRDoXojJgntgiHCW3cOXLt8ih8veQKk6rYU1mNve3bg3LljqvZ
         8KdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775047490; x=1775652290;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T/q0fvuVukjPQtBCoPPqM8cPQUhT5omziWM9+pyh7R4=;
        b=OrMS11PpONQBvRI+/n9b9HDOyqYP6CBll32VfRJN9FOLvM6y28qK+k7Lb5+KCz38rD
         SUeUvHC7Ix6ytPcV14AHWrPG7e7knZnoZSCSkyeT20WzzVowH6rS9+GzvEAIb4RkpNts
         CbJQXk+RRtRL6CwmoIAWCBwvBH1W4C+4CHQtDWJGfnZ2ARVQ48cmqFUXwfyxyQkVIer4
         jzxpa3QOAC2BIYCjOdr8NTEK30wNd9xjJTBPjla30ZYAvecggpDxro7qnxpUAqQOQ3HT
         w1mFFGzc/vChfepcg8tXm4VKTGNLtvMHSHMSlIZZIvMWo0/m+wJdwnzcsjD7wWGennDx
         i9dg==
X-Gm-Message-State: AOJu0YzegkFEBi9tZLYihF4FpUDG3NliXUZeUP1rjptwi8fcul999oCp
	6k6VR5CNc1P3N+2X8UJCCB1ywm1DInoESLR7Is/apFaLxgvLD9bSCLA63weTFLMkFl6LiRQ9oL9
	5tq+T1PciMx7qXCeMVc3o0nF2+4Y2LsakpSy4BVdOe47Pkn15pmw2kJLPlCw1Yph19JZg
X-Gm-Gg: ATEYQzyIUb3WG2nBZMsQ7qGCaDz2hTAxGOp+I4xg/eCfHzr8KcSuILSkAXJtgaO4FIp
	t3Ley/FqJXLFTp50UpkTJmTz4IQ+r2CCsJcjBQU44mB0ayvh4PiTy+/xJtEImgMjzVa1CSYJ8vn
	Ij/K+XyxRcP9f8oIYOS9s9e3y92cdtOJpXRlEMeyLry40KdG+TwqZrSQ7rLDJ5dZFhc+Z0JU9Oz
	RnIiUD/ft9p2fNBu6UlXDh4K3xwi8tVmpcUrM4rb2xU202y0O1S4mfH59XJ5hqqZHasJQPCDkrd
	RYETmcHReJLLU1x9pTjMPyyv+Dmohi2WeISJgdpV6gcQl/V5H4SAjo+TQyYBnN9TfheVP1itXvL
	sby356r/kNheSDrNtaGLOnlY6zOw7ZmI31DK1p3lipZA0Udld
X-Received: by 2002:a17:90b:3f8b:b0:35d:a2d3:5c2f with SMTP id 98e67ed59e1d1-35dc701f81amr2917695a91.24.1775047489557;
        Wed, 01 Apr 2026 05:44:49 -0700 (PDT)
X-Received: by 2002:a17:90b:3f8b:b0:35d:a2d3:5c2f with SMTP id 98e67ed59e1d1-35dc701f81amr2917669a91.24.1775047489003;
        Wed, 01 Apr 2026 05:44:49 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dbe668b24sm4982180a91.8.2026.04.01.05.44.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 05:44:48 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: watchdog: qcom-wdt: Document Hawi watchdog compatible
Date: Wed,  1 Apr 2026 18:14:42 +0530
Message-ID: <20260401124442.591803-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: nY4-F9EB7ebnMvTAfF724tg92s74Hup1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDExNyBTYWx0ZWRfX8B/z1vrbtjFA
 iMZ9ryokMVLLsIkCO+Bc8l4BDlZsWuJ9UakP+qIJjoHRUenVeDx/wYHimcToz9LdDY7J5a5ITjU
 6qzcOOIMO+Er3gXAnHF2OY7nS4Wu9up77RtKWnPRojmiBu1xYd3FG2Gxas6lPI3ujldNipf31yn
 gWdDTFeG1YGjWJI/3FwPTy13tESN4BIwYN08nLEMsgv1nCAIS3URDGypKcbRX4lNH5/j7e54lgZ
 orHetNGRNdffQT33fdCftO109j0VUbKRJhrg7XBtRa1PIl3YRjAIzZoNVUTlhxAQ1APh2Uy48HM
 dgpb8w5mU5dCCBCO7SdUqQZQP1NQhclLyoOFTK75ZZOWe7Nc9Y6jf+8W+vcC9DrhT192ROf4oJU
 npoxbvA2ZM6zKhaN7ePP1a4RDfMQAjnYKDT+uV9VPcH52k47nacQjVzHIJeMnGtb7Zgt2cFxztQ
 D/jfDk8wQIEEJgJp/Mw==
X-Proofpoint-ORIG-GUID: nY4-F9EB7ebnMvTAfF724tg92s74Hup1
X-Authority-Analysis: v=2.4 cv=PoGergM3 c=1 sm=1 tr=0 ts=69cd1342 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=2XUB28OwWTyWtXMZ7lUA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_04,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604010117
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-101348-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 15C1C37AC1D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add devicetree binding for watchdog present on Qualcomm Hawi SoC.

Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
index 9f861045b71e..a8b914d4c06b 100644
--- a/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/qcom-wdt.yaml
@@ -18,6 +18,7 @@ properties:
       - items:
           - enum:
               - qcom,apss-wdt-glymur
+              - qcom,apss-wdt-hawi
               - qcom,kpss-wdt-ipq4019
               - qcom,apss-wdt-ipq5018
               - qcom,apss-wdt-ipq5332
-- 
2.53.0


