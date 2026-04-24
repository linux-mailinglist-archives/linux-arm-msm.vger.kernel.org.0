Return-Path: <linux-arm-msm+bounces-104474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QLYYHkuI62lBNwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:12:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 090464608FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 17:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 21FF43006110
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 15:12:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 946C226C385;
	Fri, 24 Apr 2026 15:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hWeQ9PKq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KYaMj5sT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A19288C3D
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777043527; cv=none; b=JKcni2R2a5z7jsFAQGr/YpmgN8HJl/ap6AL6nDb2G9qm+a/kF2Gl+b9jwczxjqg9MqJ0G6UV4mfjtsad4FKmaBEJFNINoH2EmRvm5M3/hn5CPlr1iApnEy6RuuPYBBbO1hPEbUueTr3yQgbfeLmYTTG4etygDes/YTUR5rCaFbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777043527; c=relaxed/simple;
	bh=aTyuH8U0kUhFdvlD8ol6e/2cl7QCQMztiuoC3PGNSnA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RGXMBSi6a9o08IBVY4JCXZAzdc749eXDmubXLL3EaHQxTs3imEP0fzxl3/+9211iQolsAv9MuuyUEbV2qXnF35mBgohRKvozlCChXdu/BI/puE3HqbEUvJ20P2YLincAatdmEqWcuqjZiha5cdObCtDxEGU4MQuLyyW305SBksA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hWeQ9PKq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KYaMj5sT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63OF0T9D4012381
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QI16Fs2h2zd
	v8SE9AtXc7UhwYE6xxqWsAVah4Xwkwrc=; b=hWeQ9PKqG854XDq8YtpydEQrjxB
	raCFmvtcRrek2OaCs8EC1+K4B4mwnjqvrbfW5oWD8L2eHJ7KFRuvgDWhlYd1Kypn
	l0VapCfFmuz8b2YRBAj7Q2KPCMp6ZsW0UpWk+diFnNVPBlaAHL8IQc5V4TeP7kUf
	rZ9uhJ8BdBRTz8BYSh5ZoKcOlF0XOr+SxrStXd6BXPzCGJqOyxJSDMcRnULK2Fzl
	uKoXkHYUX4ncLZPlpKYkoXYxNSVr3jceNypRzlMLkrMpK/LHIRFYO3MG90bb+7TX
	EK148USmM/ZNAJtjpNF61DAClqu/l2Ih4ue8GhSG6KFtpn7NrdqNW1fpDCw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqpq9w01t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 15:12:02 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b7aba0af02so19588405ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777043521; x=1777648321; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QI16Fs2h2zdv8SE9AtXc7UhwYE6xxqWsAVah4Xwkwrc=;
        b=KYaMj5sT54NQ5P6L7xhWbWqx7i/QtUBDP7nVRdlso5Vr7r41OoF7Eki4J8rusnPXMH
         GWB6u5BJ1yht0ZisSW6KZrPhpCfPmPba+EWWVlHZelPcodIwEOhnPtjU9tglaMYpaGIG
         vqF6gPXPL2g0NHk6s6nZ/Qb3DzNeYR6m6PcJsWGUj2iDafYxKjjHerYf9K2Rw8St1gIG
         /NAZp861RK8rP7ff+IkwcXMaBiNn1YHHAbmORPDut4oEYR8rM7b9JYsX6E2e28CAGc7W
         oONbpnspC5gY73KGR0bCOBIORoZXXBZfTX404jpjXXSXSJBzFmRjqhD7a3tkcEVLbHEA
         xU0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777043521; x=1777648321;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QI16Fs2h2zdv8SE9AtXc7UhwYE6xxqWsAVah4Xwkwrc=;
        b=Fdx3sUiy3G7CXjAcuiOnpntmPefHsncU9h+iyhR2Pq/TFFpNupcPjDs0V8spWW90Y7
         1ph97KbUMAgpWobncbWFXTdZkwiiMcTXw6PG6Da8blwpLTF9V0b9vkaoc5xRUMxmDeIr
         usoEpJ/4oo/HBNyz6HBV4y/0QQBQyGmVcDQvq/tmtLKgF24+ZijfsZgeX92bhFOSkjt3
         SnfXvL3/R8bZ7aP4tbukKfRUjpCY6TkkzzYkJ0OhrJVfA/xPko938ymH08ShdHY0Ubhi
         GejWMgfM6i035k90S8OeheY6kpgJ1aRFd4X2NDJ6ckrl4b3n8V5EprQVTcsM/oWdc/1K
         nU4g==
X-Gm-Message-State: AOJu0Yx8VlnWIEnBmm4GE+ZGzuHEELHF8R1rK3Xu0/5OyZ0AJoZkZ6oy
	DE5hm/wFyyXWJBGB+uM45NV6lbN5narmmvc5Cv6rB2SsZx8QQdOhFIhRLO4WEbKNPqwTq7ze66d
	Mc+Xrdw3U1ez6TJuTWgP9Lzt7SGkKP1Y0LLGV5NKczD0XZsStpT/pgKQot5PyztLJsN8Q
X-Gm-Gg: AeBDievDOVEHygubEFyu0e3kBb0R32cazA2qFWxOEygwJQGjuHBmjT+timmwrMERisp
	XNw0ey5E6BK83rskj3EsXHF3SOWjGK+E0u910S6Lc0IVhDhfIRrDX6PQsyI6I/giOElprwTg7wT
	gP7lg11JgzTa7Nfb8ZRV8Fali5tjd7Rd0NCmjztRQilKZzayeqZYEu1GRV/ryfOANWSOmyWlykA
	WxERHyFgUOSjdYzCgHYkjHUqKl8vRPmZJ9dVjeibpis3QLk0H47c6virTBOtkXn66Y4YYS/hb6M
	uaUAXAWwo5JVZzILPk+8cEoQxFSsYdPilolvN5IvSUOC2ingWqPd4P2Irb6T+ll3aY/Gc/7MQbE
	EinvnEtGyTVhW8NSc63zoB3k0GXu1DaW6MUie3pN7IvA=
X-Received: by 2002:a17:902:f78d:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2b5f9d888e8mr321960675ad.0.1777043520202;
        Fri, 24 Apr 2026 08:12:00 -0700 (PDT)
X-Received: by 2002:a17:902:f78d:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2b5f9d888e8mr321960025ad.0.1777043519274;
        Fri, 24 Apr 2026 08:11:59 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:4ec8:83f5:8254:6891])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cc9asm227771505ad.39.2026.04.24.08.11.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 08:11:58 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>,
        linux-kernel@vger.kernel.org (open list),
        llvm@lists.linux.dev (open list:CLANG/LLVM BUILD SUPPORT:Keyword:\b(?i:clang|llvm)\b)
Subject: [PATCH v2 04/16] drm/msm/registers: Sync gen_header.py from mesa
Date: Fri, 24 Apr 2026 08:10:39 -0700
Message-ID: <20260424151140.104093-5-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
References: <20260424151140.104093-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDE0NyBTYWx0ZWRfX8UfDn44oMFJD
 zrnvzyPR9qMDMWKg983ZiaBo5yU4cQF5zlKjYeucZ0ZZEPXE3zChMmzWrNDG+4Pr7zNCYJbZN2w
 mUJgY+2fuRwXbq0wlWD7t31LE8xhnSILKmb4v8DB5E7wA/tPsYRrBEME9Z4eKjBLfUDqEHxPA35
 QV251HbhnT8iEXR0myuVz+VtE4gAhP7nXmwhlwSIi0H4pykwE4aPVj6HIYlYRGKNk1acZeEzXD6
 afQtbCUaUDRh7v7xK/i2C/lWbIILwl48F3yRFKqgF4wmpjXIyPuxcJNxlpk1EjzbX9eaNqwI7fa
 jMW69DtM6fiPzsSKDLy02vnjBAwapdXRbYjZWY6Vt3mCjkEju/1H/rN2j8DA0c+ETLi4GA2Tw48
 +cPCXjlGMxwSVQ3wUctj15cbcWTn+usZXNKv1Zsyti+4xNXSQGzzz2DvWgSKRaSN0PsLjdQUjnD
 EcSwxdkaB/CiKBG84IQ==
X-Authority-Analysis: v=2.4 cv=FPMrAeos c=1 sm=1 tr=0 ts=69eb8842 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8
 a=upIMGkliACeFOg2EZ_0A:9 a=3o6Nrjf1o8nA2Q1M:21 a=324X-CrmTo6CU4MGRt3R:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: XZAnqslQrvmzLwRwYdNks1JYHCgoqmNb
X-Proofpoint-ORIG-GUID: XZAnqslQrvmzLwRwYdNks1JYHCgoqmNb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-24_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240147
X-Rspamd-Queue-Id: 090464608FD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,google.com,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104474-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[robin.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,lkml];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

Update gen_header.py to bring in support for generating perfcntr tables.

Sync from https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/40522

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/registers/gen_header.py | 2079 ++++++++++---------
 1 file changed, 1146 insertions(+), 933 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index 2acad951f1e2..07e6f0cb4e66 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -11,997 +11,1210 @@ import collections
 import argparse
 import time
 import datetime
+import json
+
 
 class Error(Exception):
-	def __init__(self, message):
-		self.message = message
+    def __init__(self, message):
+        self.message = message
+
 
 class Enum(object):
-	def __init__(self, name):
-		self.name = name
-		self.values = []
-
-	def has_name(self, name):
-		for (n, value) in self.values:
-			if n == name:
-				return True
-		return False
-
-	def names(self):
-		return [n for (n, value) in self.values]
-
-	def dump(self, is_deprecated):
-		use_hex = False
-		for (name, value) in self.values:
-			if value > 0x1000:
-				use_hex = True
-
-		print("enum %s {" % self.name)
-		for (name, value) in self.values:
-			if use_hex:
-				print("\t%s = 0x%08x," % (name, value))
-			else:
-				print("\t%s = %d," % (name, value))
-		print("};\n")
-
-	def dump_pack_struct(self, is_deprecated):
-		pass
+    def __init__(self, name):
+        self.name = name
+        self.values = []
+
+    def has_name(self, name):
+        for (n, value) in self.values:
+            if n == name:
+                return True
+        return False
+
+    def names(self):
+        return [n for (n, value) in self.values]
+
+    def value(self, name):
+        for (n, v) in self.values:
+            if n == name:
+                return v
+
+    def dump(self, has_variants):
+        use_hex = False
+        for (name, value) in self.values:
+            if value > 0x1000:
+                use_hex = True
+
+        print("enum %s {" % self.name)
+        for (name, value) in self.values:
+            if use_hex:
+                print("\t%s = 0x%08x," % (name, value))
+            else:
+                print("\t%s = %d," % (name, value))
+        print("};\n")
+
+    def dump_pack_struct(self, has_variants):
+        pass
+
 
 class Field(object):
-	def __init__(self, name, low, high, shr, type, parser):
-		self.name = name
-		self.low = low
-		self.high = high
-		self.shr = shr
-		self.type = type
-
-		builtin_types = [ None, "a3xx_regid", "boolean", "uint", "hex", "int", "fixed", "ufixed", "float", "address", "waddress" ]
-
-		maxpos = parser.current_bitsize - 1
-
-		if low < 0 or low > maxpos:
-			raise parser.error("low attribute out of range: %d" % low)
-		if high < 0 or high > maxpos:
-			raise parser.error("high attribute out of range: %d" % high)
-		if high < low:
-			raise parser.error("low is greater than high: low=%d, high=%d" % (low, high))
-		if self.type == "boolean" and not low == high:
-			raise parser.error("booleans should be 1 bit fields")
-		elif self.type == "float" and not (high - low == 31 or high - low == 15):
-			raise parser.error("floats should be 16 or 32 bit fields")
-		elif self.type not in builtin_types and self.type not in parser.enums:
-			raise parser.error("unknown type '%s'" % self.type)
-
-	def ctype(self, var_name):
-		if self.type is None:
-			type = "uint32_t"
-			val = var_name
-		elif self.type == "boolean":
-			type = "bool"
-			val = var_name
-		elif self.type == "uint" or self.type == "hex" or self.type == "a3xx_regid":
-			type = "uint32_t"
-			val = var_name
-		elif self.type == "int":
-			type = "int32_t"
-			val = var_name
-		elif self.type == "fixed":
-			type = "float"
-			val = "((int32_t)(%s * %d.0))" % (var_name, 1 << self.radix)
-		elif self.type == "ufixed":
-			type = "float"
-			val = "((uint32_t)(%s * %d.0))" % (var_name, 1 << self.radix)
-		elif self.type == "float" and self.high - self.low == 31:
-			type = "float"
-			val = "fui(%s)" % var_name
-		elif self.type == "float" and self.high - self.low == 15:
-			type = "float"
-			val = "_mesa_float_to_half(%s)" % var_name
-		elif self.type in [ "address", "waddress" ]:
-			type = "uint64_t"
-			val = var_name
-		else:
-			type = "enum %s" % self.type
-			val = var_name
-
-		if self.shr > 0:
-			val = "(%s >> %d)" % (val, self.shr)
-
-		return (type, val)
+    def __init__(self, name, low, high, shr, type, parser):
+        self.name = name
+        self.low = low
+        self.high = high
+        self.shr = shr
+        self.type = type
+
+        builtin_types = [None, "a3xx_regid", "boolean", "uint", "hex",
+                         "int", "fixed", "ufixed", "float", "address", "waddress"]
+
+        maxpos = parser.current_bitsize - 1
+
+        if low < 0 or low > maxpos:
+            raise parser.error("low attribute out of range: %d" % low)
+        if high < 0 or high > maxpos:
+            raise parser.error("high attribute out of range: %d" % high)
+        if high < low:
+            raise parser.error(
+                "low is greater than high: low=%d, high=%d" % (low, high))
+        if self.type == "boolean" and not low == high:
+            raise parser.error("booleans should be 1 bit fields")
+        elif self.type == "float" and not (high - low == 31 or high - low == 15):
+            raise parser.error("floats should be 16 or 32 bit fields")
+        elif self.type not in builtin_types and self.type not in parser.enums:
+            raise parser.error("unknown type '%s'" % self.type)
+
+    def ctype(self, var_name):
+        if self.type is None:
+            type = "uint32_t"
+            val = var_name
+        elif self.type == "boolean":
+            type = "bool"
+            val = var_name
+        elif self.type == "uint" or self.type == "hex" or self.type == "a3xx_regid":
+            type = "uint32_t"
+            val = var_name
+        elif self.type == "int":
+            type = "int32_t"
+            val = var_name
+        elif self.type == "fixed":
+            type = "float"
+            val = "(uint32_t)((int32_t)(%s * %d.0))" % (var_name, 1 << self.radix)
+        elif self.type == "ufixed":
+            type = "float"
+            val = "((uint32_t)(%s * %d.0))" % (var_name, 1 << self.radix)
+        elif self.type == "float" and self.high - self.low == 31:
+            type = "float"
+            val = "fui(%s)" % var_name
+        elif self.type == "float" and self.high - self.low == 15:
+            type = "float"
+            val = "_mesa_float_to_half(%s)" % var_name
+        elif self.type in ["address", "waddress"]:
+            type = "uint64_t"
+            val = var_name
+        else:
+            type = "enum %s" % self.type
+            val = var_name
+
+        if self.shr > 0:
+            val = "(%s >> %d)" % (val, self.shr)
+
+        return (type, val)
+
 
 def tab_to(name, value):
-	tab_count = (68 - (len(name) & ~7)) // 8
-	if tab_count <= 0:
-		tab_count = 1
-	print(name + ('\t' * tab_count) + value)
+    tab_count = (68 - (len(name) & ~7)) // 8
+    if tab_count <= 0:
+        tab_count = 1
+    print(name + ('\t' * tab_count) + value)
+
+def define_macro(name, value, has_variants):
+    if has_variants:
+        value = "__FD_DEPRECATED " + value
+    tab_to(name, value)
 
 def mask(low, high):
-	return ((0xffffffffffffffff >> (64 - (high + 1 - low))) << low)
+    return ((0xffffffffffffffff >> (64 - (high + 1 - low))) << low)
+
 
 def field_name(reg, f):
-	if f.name:
-		name = f.name.lower()
-	else:
-		# We hit this path when a reg is defined with no bitset fields, ie.
-		# 	<reg32 offset="0x88db" name="RB_RESOLVE_SYSTEM_BUFFER_ARRAY_PITCH" low="0" high="28" shr="6" type="uint"/>
-		name = reg.name.lower()
+    if f.name:
+        name = f.name.lower()
+    else:
+        # We hit this path when a reg is defined with no bitset fields, ie.
+        # 	<reg32 offset="0x88db" name="RB_RESOLVE_SYSTEM_BUFFER_ARRAY_PITCH" low="0" high="28" shr="6" type="uint"/>
+        name = reg.name.lower()
 
-	if (name in [ "double", "float", "int" ]) or not (name[0].isalpha()):
-			name = "_" + name
+    if (name in ["double", "float", "int"]) or not (name[0].isalpha()):
+        name = "_" + name
 
-	return name
+    return name
 
 # indices - array of (ctype, stride, __offsets_NAME)
+
+
 def indices_varlist(indices):
-	return ", ".join(["i%d" % i for i in range(len(indices))])
+    return ", ".join(["i%d" % i for i in range(len(indices))])
+
 
 def indices_prototype(indices):
-	return ", ".join(["%s i%d" % (ctype, idx)
-			for (idx, (ctype, stride, offset)) in  enumerate(indices)])
+    return ", ".join(["%s i%d" % (ctype, idx)
+                      for (idx, (ctype, stride, offset)) in enumerate(indices)])
+
 
 def indices_strides(indices):
-	return " + ".join(["0x%x*i%d" % (stride, idx)
-					if stride else
-					"%s(i%d)" % (offset, idx)
-			for (idx, (ctype, stride, offset)) in  enumerate(indices)])
+    return " + ".join(["0x%x*i%d" % (stride, idx)
+                       if stride else
+                       "%s(i%d)" % (offset, idx)
+                       for (idx, (ctype, stride, offset)) in enumerate(indices)])
+
 
 def is_number(str):
-	try:
-		int(str)
-		return True
-	except ValueError:
-		return False
+    try:
+        int(str)
+        return True
+    except ValueError:
+        return False
+
 
 def sanitize_variant(variant):
-	if variant and "-" in variant:
-		return variant[:variant.index("-")]
-	return variant
+    if variant and "-" in variant:
+        return variant[:variant.index("-")]
+    return variant
+
 
 class Bitset(object):
-	def __init__(self, name, template):
-		self.name = name
-		self.inline = False
-		self.reg = None
-		if template:
-			self.fields = template.fields[:]
-		else:
-			self.fields = []
-
-	# Get address field if there is one in the bitset, else return None:
-	def get_address_field(self):
-		for f in self.fields:
-			if f.type in [ "address", "waddress" ]:
-				return f
-		return None
-
-	def dump_regpair_builder(self, reg):
-		print("#ifndef NDEBUG")
-		known_mask = 0
-		for f in self.fields:
-			known_mask |= mask(f.low, f.high)
-			if f.type in [ "boolean", "address", "waddress" ]:
-				continue
-			type, val = f.ctype("fields.%s" % field_name(reg, f))
-			print("    assert((%-40s & 0x%08x) == 0);" % (val, 0xffffffff ^ mask(0 , f.high - f.low)))
-		print("    assert((%-40s & 0x%08x) == 0);" % ("fields.unknown", known_mask))
-		print("#endif\n")
-
-		print("    return (struct fd_reg_pair) {")
-		print("        .reg = (uint32_t)%s," % reg.reg_offset())
-		print("        .value =")
-		cast = "(uint64_t)" if reg.bit_size == 64 else ""
-		for f in self.fields:
-			if f.type in [ "address", "waddress" ]:
-				continue
-			else:
-				type, val = f.ctype("fields.%s" % field_name(reg, f))
-				print("            (%s%-40s << %2d) |" % (cast, val, f.low))
-		value_name = "dword"
-		if reg.bit_size == 64:
-			value_name = "qword"
-		print("            fields.unknown | fields.%s," % (value_name,))
-
-		address = self.get_address_field()
-		if address:
-			print("        .bo = fields.bo,")
-			print("        .is_address = true,")
-			if f.type == "waddress":
-				print("        .bo_write = true,")
-			print("        .bo_offset = fields.bo_offset,")
-			print("        .bo_shift = %d," % address.shr)
-			print("        .bo_low = %d," % address.low)
-
-		print("    };")
-
-	def dump_pack_struct(self, is_deprecated, reg=None):
-		if not reg:
-			return
-
-		prefix = reg.full_name
-
-		print("struct %s {" % prefix)
-		for f in self.fields:
-			if f.type in [ "address", "waddress" ]:
-				tab_to("    __bo_type", "bo;")
-				tab_to("    uint32_t", "bo_offset;")
-				continue
-			name = field_name(reg, f)
-
-			type, val = f.ctype("var")
-
-			tab_to("    %s" % type, "%s;" % name)
-		if reg.bit_size == 64:
-			tab_to("    uint64_t", "unknown;")
-			tab_to("    uint64_t", "qword;")
-		else:
-			tab_to("    uint32_t", "unknown;")
-			tab_to("    uint32_t", "dword;")
-		print("};\n")
-
-		depcrstr = ""
-		if is_deprecated:
-			depcrstr = " FD_DEPRECATED"
-		if reg.array:
-			print("static inline%s struct fd_reg_pair\npack_%s(uint32_t __i, struct %s fields)\n{" %
-				  (depcrstr, prefix, prefix))
-		else:
-			print("static inline%s struct fd_reg_pair\npack_%s(struct %s fields)\n{" %
-				  (depcrstr, prefix, prefix))
-
-		self.dump_regpair_builder(reg)
-
-		print("\n}\n")
-
-		if self.get_address_field():
-			skip = ", { .reg = 0 }"
-		else:
-			skip = ""
-
-		if reg.array:
-			print("#define %s(__i, ...) pack_%s(__i, __struct_cast(%s) { __VA_ARGS__ })%s\n" %
-				  (prefix, prefix, prefix, skip))
-		else:
-			print("#define %s(...) pack_%s(__struct_cast(%s) { __VA_ARGS__ })%s\n" %
-				  (prefix, prefix, prefix, skip))
-
-
-	def dump(self, is_deprecated, prefix=None, reg=None):
-		if prefix is None:
-			prefix = self.name
-		reg64 = reg and self.reg and self.reg.bit_size == 64
-		if reg64:
-			print("static inline uint32_t %s_LO(uint32_t val)\n{" % prefix)
-			print("\treturn val;\n}")
-			print("static inline uint32_t %s_HI(uint32_t val)\n{" % prefix)
-			print("\treturn val;\n}")
-		for f in self.fields:
-			if f.name:
-				name = prefix + "_" + f.name
-			else:
-				name = prefix
-
-			if not f.name and f.low == 0 and f.shr == 0 and f.type not in ["float", "fixed", "ufixed"]:
-				pass
-			elif f.type == "boolean" or (f.type is None and f.low == f.high):
-				tab_to("#define %s" % name, "0x%08x" % (1 << f.low))
-			else:
-				typespec = "ull" if reg64 else "u"
-				tab_to("#define %s__MASK" % name, "0x%08x%s" % (mask(f.low, f.high), typespec))
-				tab_to("#define %s__SHIFT" % name, "%d" % f.low)
-				type, val = f.ctype("val")
-				ret_type = "uint64_t" if reg64 else "uint32_t"
-				cast = "(uint64_t)" if reg64 else ""
-
-				print("static inline %s %s(%s val)\n{" % (ret_type, name, type))
-				if f.shr > 0:
-					print("\tassert(!(val & 0x%x));" % mask(0, f.shr - 1))
-				print("\treturn (%s(%s) << %s__SHIFT) & %s__MASK;\n}" % (cast, val, name, name))
-		print()
+    def __init__(self, name, template):
+        self.name = name
+        self.inline = False
+        self.reg = None
+        if template:
+            self.fields = template.fields[:]
+        else:
+            self.fields = []
+
+    # Get address field if there is one in the bitset, else return None:
+    def get_address_field(self):
+        for f in self.fields:
+            if f.type in ["address", "waddress"]:
+                return f
+        return None
+
+    def dump_regpair_builder(self, reg):
+        print("#ifndef NDEBUG")
+        known_mask = 0
+        for f in self.fields:
+            known_mask |= mask(f.low, f.high)
+            if f.type in ["boolean", "address", "waddress"]:
+                continue
+            type, val = f.ctype("fields.%s" % field_name(reg, f))
+            print("    assert((%-40s & 0x%08x) == 0);" %
+                  (val, 0xffffffff ^ mask(0, f.high - f.low)))
+        print("    assert((%-40s & 0x%08x) == 0);" %
+              ("fields.unknown", known_mask))
+        print("#endif\n")
+
+        print("    return (struct fd_reg_pair) {")
+        print("        .reg = (uint32_t)%s," % reg.reg_offset())
+        print("        .value =")
+        cast = "(uint64_t)" if reg.bit_size == 64 else ""
+        for f in self.fields:
+            if f.type in ["address", "waddress"]:
+                continue
+            else:
+                type, val = f.ctype("fields.%s" % field_name(reg, f))
+                print("            (%s%-40s << %2d) |" % (cast, val, f.low))
+        value_name = "dword"
+        if reg.bit_size == 64:
+            value_name = "qword"
+        print("            fields.unknown | fields.%s," % (value_name,))
+
+        address = self.get_address_field()
+        if address:
+            print("#ifndef TU_CS_H")
+            print("        .bo = fields.bo,")
+            print("        .is_address = true,")
+            print("        .bo_offset = fields.bo_offset,")
+            print("        .bo_shift = %d," % address.shr)
+            print("        .bo_low = %d," % address.low)
+            print("#else")
+            print("        .is_address = true,")
+            print("#endif")
+
+        print("    };")
+
+    def dump_pack_struct(self, has_variants, reg=None):
+        if not reg:
+            return
+
+        prefix = reg.full_name
+
+        constexpr_mark = " CONSTEXPR"
+
+        print("struct %s {" % prefix)
+        for f in self.fields:
+            if f.type in ["address", "waddress"]:
+                print("#ifndef TU_CS_H")
+                tab_to("    __bo_type", "bo;")
+                tab_to("    uint32_t", "bo_offset;")
+                print("#endif\n")
+                continue
+            name = field_name(reg, f)
+
+            type, val = f.ctype("var")
+
+            tab_to("    %s" % type, "%s;" % name)
+
+            if f.type == "float":
+                # Requires using `fui()` or `_mesa_float_to_half()`
+                constexpr_mark = ""
+        if reg.bit_size == 64:
+            tab_to("    uint64_t", "qword;")
+            tab_to("    uint64_t", "unknown;")
+        else:
+            tab_to("    uint32_t", "dword;")
+            tab_to("    uint32_t", "unknown;")
+        print("};\n")
+
+        if not has_variants:
+            print("static%s inline struct fd_reg_pair" % constexpr_mark)
+            if reg.array:
+                print("pack_%s(uint32_t __i, struct %s fields)\n{" % (prefix, prefix))
+            else:
+                print("pack_%s(struct %s fields)\n{" % (prefix, prefix))
+
+            self.dump_regpair_builder(reg)
+
+            print("\n}\n")
+
+        if self.get_address_field():
+            skip = ", { .reg = 0 }"
+        else:
+            skip = ""
+
+        if reg.array:
+            print("#define %s(__i, ...) pack_%s(__i, __struct_cast(%s) { __VA_ARGS__ })%s\n" %
+                  (prefix, prefix, prefix, skip))
+        else:
+            print("#define %s(...) pack_%s(__struct_cast(%s) { __VA_ARGS__ })%s\n" %
+                  (prefix, prefix, prefix, skip))
+
+    def dump(self, has_variants, prefix=None, reg=None):
+        if prefix is None:
+            prefix = self.name
+        suffix = ""
+        if self.reg and self.reg.bit_size == 64:
+            print(
+                "static CONSTEXPR inline uint32_t %s_LO(uint32_t val)\n{" % prefix)
+            print("\treturn val;\n}")
+            print(
+                "static CONSTEXPR inline uint32_t %s_HI(uint32_t val)\n{" % prefix)
+            print("\treturn val;\n}")
+            suffix = "ull"
+
+        for f in self.fields:
+            if f.name:
+                name = prefix + "_" + f.name
+            else:
+                name = prefix
+
+            if not f.name and f.low == 0 and f.shr == 0 and f.type not in ["float", "fixed", "ufixed"]:
+                pass
+            elif f.type == "boolean" or (f.type is None and f.low == f.high):
+                tab_to("#define %s" % name, "0x%08x%s" % ((1 << f.low), suffix))
+            else:
+                tab_to("#define %s__MASK" %
+                       name, "0x%08x%s" % (mask(f.low, f.high), suffix))
+                tab_to("#define %s__SHIFT" % name, "%d" % f.low)
+                type, val = f.ctype("val")
+                ret_type = "uint64_t" if reg and reg.bit_size == 64 else "uint32_t"
+                cast = "(uint64_t)" if reg and reg.bit_size == 64 else ""
+
+                constexpr_mark = "" if type == "float" else " CONSTEXPR"
+                print("static%s inline %s %s(%s val)\n{" % (
+                    constexpr_mark, ret_type, name, type))
+                if f.shr > 0:
+                    print("\tassert(!(val & 0x%x));" % mask(0, f.shr - 1))
+                print("\treturn (%s(%s) << %s__SHIFT) & %s__MASK;\n}" %
+                      (cast, val, name, name))
+        print()
+
 
 class Array(object):
-	def __init__(self, attrs, domain, variant, parent, index_type):
-		if "name" in attrs:
-			self.local_name = attrs["name"]
-		else:
-			self.local_name = ""
-		self.domain = domain
-		self.variant = variant
-		self.parent = parent
-		self.children = []
-		if self.parent:
-			self.name = self.parent.name + "_" + self.local_name
-		else:
-			self.name = self.local_name
-		if "offsets" in attrs:
-			self.offsets = map(lambda i: "0x%08x" % int(i, 0), attrs["offsets"].split(","))
-			self.fixed_offsets = True
-		elif "doffsets" in attrs:
-			self.offsets = map(lambda s: "(%s)" % s , attrs["doffsets"].split(","))
-			self.fixed_offsets = True
-		else:
-			self.offset = int(attrs["offset"], 0)
-			self.stride = int(attrs["stride"], 0)
-			self.fixed_offsets = False
-		if "index" in attrs:
-			self.index_type = index_type
-		else:
-			self.index_type = None
-		self.length = int(attrs["length"], 0)
-		if "usage" in attrs:
-			self.usages = attrs["usage"].split(',')
-		else:
-			self.usages = None
-
-	def index_ctype(self):
-		if not self.index_type:
-			return "uint32_t"
-		else:
-			return "enum %s" % self.index_type.name
-
-	# Generate array of (ctype, stride, __offsets_NAME)
-	def indices(self):
-		if self.parent:
-			indices = self.parent.indices()
-		else:
-			indices = []
-		if self.length != 1:
-			if self.fixed_offsets:
-				indices.append((self.index_ctype(), None, "__offset_%s" % self.local_name))
-			else:
-				indices.append((self.index_ctype(), self.stride, None))
-		return indices
-
-	def total_offset(self):
-		offset = 0
-		if not self.fixed_offsets:
-			offset += self.offset
-		if self.parent:
-			offset += self.parent.total_offset()
-		return offset
-
-	def dump(self, is_deprecated):
-		depcrstr = ""
-		if is_deprecated:
-			depcrstr = " FD_DEPRECATED"
-		proto = indices_varlist(self.indices())
-		strides = indices_strides(self.indices())
-		array_offset = self.total_offset()
-		if self.fixed_offsets:
-			print("static inline%s uint32_t __offset_%s(%s idx)" % (depcrstr, self.local_name, self.index_ctype()))
-			print("{\n\tswitch (idx) {")
-			if self.index_type:
-				for val, offset in zip(self.index_type.names(), self.offsets):
-					print("\t\tcase %s: return %s;" % (val, offset))
-			else:
-				for idx, offset in enumerate(self.offsets):
-					print("\t\tcase %d: return %s;" % (idx, offset))
-			print("\t\tdefault: return INVALID_IDX(idx);")
-			print("\t}\n}")
-		if proto == '':
-			tab_to("#define REG_%s_%s" % (self.domain, self.name), "0x%08x\n" % array_offset)
-		else:
-			tab_to("#define REG_%s_%s(%s)" % (self.domain, self.name, proto), "(0x%08x + %s )\n" % (array_offset, strides))
-
-	def dump_pack_struct(self, is_deprecated):
-		pass
-
-	def dump_regpair_builder(self):
-		pass
+    def __init__(self, attrs, domain, variant, parent, index_type):
+        if "name" in attrs:
+            self.local_name = attrs["name"]
+        else:
+            self.local_name = ""
+        self.domain = domain
+        self.variant = variant
+        self.parent = parent
+        self.children = []
+        if self.parent:
+            self.name = self.parent.name + "_" + self.local_name
+        else:
+            self.name = self.local_name
+        if "offsets" in attrs:
+            self.offsets = map(lambda i: "0x%08x" %
+                               int(i, 0), attrs["offsets"].split(","))
+            self.fixed_offsets = True
+        elif "doffsets" in attrs:
+            self.offsets = map(lambda s: "(%s)" %
+                               s, attrs["doffsets"].split(","))
+            self.fixed_offsets = True
+        else:
+            self.offset = int(attrs["offset"], 0)
+            self.stride = int(attrs["stride"], 0)
+            self.fixed_offsets = False
+        if "index" in attrs:
+            self.index_type = index_type
+        else:
+            self.index_type = None
+        self.length = int(attrs["length"], 0)
+        if "usage" in attrs:
+            self.usages = attrs["usage"].split(',')
+        else:
+            self.usages = None
+
+    def index_ctype(self):
+        if not self.index_type:
+            return "uint32_t"
+        else:
+            return "enum %s" % self.index_type.name
+
+    # Generate array of (ctype, stride, __offsets_NAME)
+    def indices(self):
+        if self.parent:
+            indices = self.parent.indices()
+        else:
+            indices = []
+        if self.length != 1:
+            if self.fixed_offsets:
+                indices.append((self.index_ctype(), None,
+                               "__offset_%s" % self.local_name))
+            else:
+                indices.append((self.index_ctype(), self.stride, None))
+        return indices
+
+    def total_offset(self):
+        offset = 0
+        if not self.fixed_offsets:
+            offset += self.offset
+        if self.parent:
+            offset += self.parent.total_offset()
+        return offset
+
+    def dump(self, has_variants):
+        proto = indices_varlist(self.indices())
+        strides = indices_strides(self.indices())
+        array_offset = self.total_offset()
+        if self.fixed_offsets and not has_variants:
+            print("static CONSTEXPR inline uint32_t __offset_%s(%s idx)" %
+                  (self.local_name, self.index_ctype()))
+            print("{\n\tswitch (idx) {")
+            if self.index_type:
+                for val, offset in zip(self.index_type.names(), self.offsets):
+                    print("\t\tcase %s: return %s;" % (val, offset))
+            else:
+                for idx, offset in enumerate(self.offsets):
+                    print("\t\tcase %d: return %s;" % (idx, offset))
+            print("\t\tdefault: return INVALID_IDX(idx);")
+            print("\t}\n}")
+        if proto == '':
+            define_macro("#define REG_%s_%s" %
+                         (self.domain, self.name), "0x%08x\n" % array_offset,
+                         has_variants)
+        else:
+            define_macro("#define REG_%s_%s(%s)" % (self.domain, self.name,
+                         proto), "(0x%08x + %s )\n" % (array_offset, strides),
+                         has_variants)
+
+    def dump_pack_struct(self, has_variants):
+        pass
+
+    def dump_regpair_builder(self):
+        pass
+
 
 class Reg(object):
-	def __init__(self, attrs, domain, array, bit_size):
-		self.name = attrs["name"]
-		self.domain = domain
-		self.array = array
-		self.offset = int(attrs["offset"], 0)
-		self.type = None
-		self.bit_size = bit_size
-		if array:
-			self.name = array.name + "_" + self.name
-			array.children.append(self)
-		self.full_name = self.domain + "_" + self.name
-		if "stride" in attrs:
-			self.stride = int(attrs["stride"], 0)
-			self.length = int(attrs["length"], 0)
-		else:
-			self.stride = None
-			self.length = None
-
-	# Generate array of (ctype, stride, __offsets_NAME)
-	def indices(self):
-		if self.array:
-			indices = self.array.indices()
-		else:
-			indices = []
-		if self.stride:
-			indices.append(("uint32_t", self.stride, None))
-		return indices
-
-	def total_offset(self):
-		if self.array:
-			return self.array.total_offset() + self.offset
-		else:
-			return self.offset
-
-	def reg_offset(self):
-		if self.array:
-			offset = self.array.offset + self.offset
-			return "(0x%08x + 0x%x*__i)" % (offset, self.array.stride)
-		return "0x%08x" % self.offset
-
-	def dump(self, is_deprecated):
-		depcrstr = ""
-		if is_deprecated:
-			depcrstr = " FD_DEPRECATED "
-		proto = indices_prototype(self.indices())
-		strides = indices_strides(self.indices())
-		offset = self.total_offset()
-		if proto == '':
-			tab_to("#define REG_%s" % self.full_name, "0x%08x" % offset)
-		else:
-			print("static inline%s uint32_t REG_%s(%s) { return 0x%08x + %s; }" % (depcrstr, self.full_name, proto, offset, strides))
-
-		if self.bitset.inline:
-			self.bitset.dump(is_deprecated, self.full_name, self)
-		print("")
-
-	def dump_pack_struct(self, is_deprecated):
-		if self.bitset.inline:
-			self.bitset.dump_pack_struct(is_deprecated, self)
-
-	def dump_regpair_builder(self):
-		self.bitset.dump_regpair_builder(self)
-
-	def dump_py(self):
-		print("\tREG_%s = 0x%08x" % (self.full_name, self.offset))
+    def __init__(self, attrs, domain, array, bit_size):
+        self.name = attrs["name"]
+        self.domain = domain
+        self.array = array
+        self.offset = int(attrs["offset"], 0)
+        self.type = None
+        self.bit_size = bit_size
+        if array:
+            self.name = array.name + "_" + self.name
+            array.children.append(self)
+        self.full_name = self.domain + "_" + self.name
+        if "stride" in attrs:
+            self.stride = int(attrs["stride"], 0)
+            self.length = int(attrs["length"], 0)
+        else:
+            self.stride = None
+            self.length = None
+
+    # Generate array of (ctype, stride, __offsets_NAME)
+    def indices(self):
+        if self.array:
+            indices = self.array.indices()
+        else:
+            indices = []
+        if self.stride:
+            indices.append(("uint32_t", self.stride, None))
+        return indices
+
+    def total_offset(self):
+        if self.array:
+            return self.array.total_offset() + self.offset
+        else:
+            return self.offset
+
+    def reg_offset(self):
+        if self.array:
+            offset = self.array.offset + self.offset
+            return "(0x%08x + 0x%x*__i)" % (offset, self.array.stride)
+        return "0x%08x" % self.offset
+
+    def dump(self, has_variants):
+        proto = indices_prototype(self.indices())
+        strides = indices_strides(self.indices())
+        offset = self.total_offset()
+        if proto == '':
+            define_macro("#define REG_%s" % self.full_name, "0x%08x" % offset, has_variants)
+        elif not has_variants:
+            depcrstr = ""
+            if has_variants:
+                depcrstr = " __FD_DEPRECATED "
+            print("static CONSTEXPR inline%s uint32_t REG_%s(%s) { return 0x%08x + %s; }" % (
+                  depcrstr, self.full_name, proto, offset, strides))
+
+        if self.bitset.inline:
+            self.bitset.dump(has_variants, self.full_name, self)
+        print("")
+
+    def dump_pack_struct(self, has_variants):
+        if self.bitset.inline:
+            self.bitset.dump_pack_struct(has_variants, self)
+
+    def dump_regpair_builder(self):
+        self.bitset.dump_regpair_builder(self)
+
+    def dump_py(self):
+        offset = self.offset
+        if self.array:
+            offset += self.array.offset
+        print("\tREG_%s = 0x%08x" % (self.full_name, offset))
 
 
 class Parser(object):
-	def __init__(self):
-		self.current_array = None
-		self.current_domain = None
-		self.current_prefix = None
-		self.current_prefix_type = None
-		self.current_stripe = None
-		self.current_bitset = None
-		self.current_bitsize = 32
-		# The varset attribute on the domain specifies the enum which
-		# specifies all possible hw variants:
-		self.current_varset = None
-		# Regs that have multiple variants.. we only generated the C++
-		# template based struct-packers for these
-		self.variant_regs = {}
-		# Information in which contexts regs are used, to be used in
-		# debug options
-		self.usage_regs = collections.defaultdict(list)
-		self.bitsets = {}
-		self.enums = {}
-		self.variants = set()
-		self.file = []
-		self.xml_files = []
-
-	def error(self, message):
-		parser, filename = self.stack[-1]
-		return Error("%s:%d:%d: %s" % (filename, parser.CurrentLineNumber, parser.CurrentColumnNumber, message))
-
-	def prefix(self, variant=None):
-		if self.current_prefix_type == "variant" and variant:
-			return sanitize_variant(variant)
-		elif self.current_stripe:
-			return self.current_stripe + "_" + self.current_domain
-		elif self.current_prefix:
-			return self.current_prefix + "_" + self.current_domain
-		else:
-			return self.current_domain
-
-	def parse_field(self, name, attrs):
-		try:
-			if "pos" in attrs:
-				high = low = int(attrs["pos"], 0)
-			elif "high" in attrs and "low" in attrs:
-				high = int(attrs["high"], 0)
-				low = int(attrs["low"], 0)
-			else:
-				low = 0
-				high = self.current_bitsize - 1
-
-			if "type" in attrs:
-				type = attrs["type"]
-			else:
-				type = None
-
-			if "shr" in attrs:
-				shr = int(attrs["shr"], 0)
-			else:
-				shr = 0
-
-			b = Field(name, low, high, shr, type, self)
-
-			if type == "fixed" or type == "ufixed":
-				b.radix = int(attrs["radix"], 0)
-
-			self.current_bitset.fields.append(b)
-		except ValueError as e:
-			raise self.error(e)
-
-	def parse_varset(self, attrs):
-		# Inherit the varset from the enclosing domain if not overriden:
-		varset = self.current_varset
-		if "varset" in attrs:
-			varset = self.enums[attrs["varset"]]
-		return varset
-
-	def parse_variants(self, attrs):
-		if "variants" not in attrs:
-				return None
-
-		variant = attrs["variants"].split(",")[0]
-		varset = self.parse_varset(attrs)
-
-		if "-" in variant:
-			# if we have a range, validate that both the start and end
-			# of the range are valid enums:
-			start = variant[:variant.index("-")]
-			end = variant[variant.index("-") + 1:]
-			assert varset.has_name(start)
-			if end != "":
-				assert varset.has_name(end)
-		else:
-			assert varset.has_name(variant)
-
-		return variant
-
-	def add_all_variants(self, reg, attrs, parent_variant):
-		# TODO this should really handle *all* variants, including dealing
-		# with open ended ranges (ie. "A2XX,A4XX-") (we have the varset
-		# enum now to make that possible)
-		variant = self.parse_variants(attrs)
-		if not variant:
-			variant = parent_variant
-
-		if reg.name not in self.variant_regs:
-			self.variant_regs[reg.name] = {}
-		else:
-			# All variants must be same size:
-			v = next(iter(self.variant_regs[reg.name]))
-			assert self.variant_regs[reg.name][v].bit_size == reg.bit_size
-
-		self.variant_regs[reg.name][variant] = reg
-
-	def add_all_usages(self, reg, usages):
-		if not usages:
-			return
-
-		for usage in usages:
-			self.usage_regs[usage].append(reg)
-
-		self.variants.add(reg.domain)
-
-	def do_validate(self, schemafile):
-		if not self.validate:
-			return
-
-		try:
-			from lxml import etree
-
-			parser, filename = self.stack[-1]
-			dirname = os.path.dirname(filename)
-
-			# we expect this to look like <namespace url> schema.xsd.. I think
-			# technically it is supposed to be just a URL, but that doesn't
-			# quite match up to what we do.. Just skip over everything up to
-			# and including the first whitespace character:
-			schemafile = schemafile[schemafile.rindex(" ")+1:]
-
-			# this is a bit cheezy, but the xml file to validate could be
-			# in a child director, ie. we don't really know where the schema
-			# file is, the way the rnn C code does.  So if it doesn't exist
-			# just look one level up
-			if not os.path.exists(dirname + "/" + schemafile):
-				schemafile = "../" + schemafile
-
-			if not os.path.exists(dirname + "/" + schemafile):
-				raise self.error("Cannot find schema for: " + filename)
-
-			xmlschema_doc = etree.parse(dirname + "/" + schemafile)
-			xmlschema = etree.XMLSchema(xmlschema_doc)
-
-			xml_doc = etree.parse(filename)
-			if not xmlschema.validate(xml_doc):
-				error_str = str(xmlschema.error_log.filter_from_errors()[0])
-				raise self.error("Schema validation failed for: " + filename + "\n" + error_str)
-		except ImportError as e:
-			print("lxml not found, skipping validation", file=sys.stderr)
-
-	def do_parse(self, filename):
-		filepath = os.path.abspath(filename)
-		if filepath in self.xml_files:
-			return
-		self.xml_files.append(filepath)
-		file = open(filename, "rb")
-		parser = xml.parsers.expat.ParserCreate()
-		self.stack.append((parser, filename))
-		parser.StartElementHandler = self.start_element
-		parser.EndElementHandler = self.end_element
-		parser.CharacterDataHandler = self.character_data
-		parser.buffer_text = True
-		parser.ParseFile(file)
-		self.stack.pop()
-		file.close()
-
-	def parse(self, rnn_path, filename, validate):
-		self.path = rnn_path
-		self.stack = []
-		self.validate = validate
-		self.do_parse(filename)
-
-	def parse_reg(self, attrs, bit_size):
-		self.current_bitsize = bit_size
-		if "type" in attrs and attrs["type"] in self.bitsets:
-			bitset = self.bitsets[attrs["type"]]
-			if bitset.inline:
-				self.current_bitset = Bitset(attrs["name"], bitset)
-				self.current_bitset.inline = True
-			else:
-				self.current_bitset = bitset
-		else:
-			self.current_bitset = Bitset(attrs["name"], None)
-			self.current_bitset.inline = True
-			if "type" in attrs:
-				self.parse_field(None, attrs)
-
-		variant = self.parse_variants(attrs)
-		if not variant and self.current_array:
-			variant = self.current_array.variant
-
-		self.current_reg = Reg(attrs, self.prefix(variant), self.current_array, bit_size)
-		self.current_reg.bitset = self.current_bitset
-		self.current_bitset.reg = self.current_reg
-
-		if len(self.stack) == 1:
-			self.file.append(self.current_reg)
-
-		if variant is not None:
-			self.add_all_variants(self.current_reg, attrs, variant)
-
-		usages = None
-		if "usage" in attrs:
-			usages = attrs["usage"].split(',')
-		elif self.current_array:
-			usages = self.current_array.usages
-
-		self.add_all_usages(self.current_reg, usages)
-
-	def start_element(self, name, attrs):
-		self.cdata = ""
-		if name == "import":
-			filename = attrs["file"]
-			self.do_parse(os.path.join(self.path, filename))
-		elif name == "domain":
-			self.current_domain = attrs["name"]
-			if "prefix" in attrs:
-				self.current_prefix = sanitize_variant(self.parse_variants(attrs))
-				self.current_prefix_type = attrs["prefix"]
-			else:
-				self.current_prefix = None
-				self.current_prefix_type = None
-			if "varset" in attrs:
-				self.current_varset = self.enums[attrs["varset"]]
-		elif name == "stripe":
-			self.current_stripe = sanitize_variant(self.parse_variants(attrs))
-		elif name == "enum":
-			self.current_enum_value = 0
-			self.current_enum = Enum(attrs["name"])
-			self.enums[attrs["name"]] = self.current_enum
-			if len(self.stack) == 1:
-				self.file.append(self.current_enum)
-		elif name == "value":
-			if "value" in attrs:
-				value = int(attrs["value"], 0)
-			else:
-				value = self.current_enum_value
-			self.current_enum.values.append((attrs["name"], value))
-		elif name == "reg32":
-			self.parse_reg(attrs, 32)
-		elif name == "reg64":
-			self.parse_reg(attrs, 64)
-		elif name == "array":
-			self.current_bitsize = 32
-			variant = self.parse_variants(attrs)
-			index_type = self.enums[attrs["index"]] if "index" in attrs else None
-			self.current_array = Array(attrs, self.prefix(variant), variant, self.current_array, index_type)
-			if len(self.stack) == 1:
-				self.file.append(self.current_array)
-		elif name == "bitset":
-			self.current_bitset = Bitset(attrs["name"], None)
-			if "inline" in attrs and attrs["inline"] == "yes":
-				self.current_bitset.inline = True
-			self.bitsets[self.current_bitset.name] = self.current_bitset
-			if len(self.stack) == 1 and not self.current_bitset.inline:
-				self.file.append(self.current_bitset)
-		elif name == "bitfield" and self.current_bitset:
-			self.parse_field(attrs["name"], attrs)
-		elif name == "database":
-			self.do_validate(attrs["xsi:schemaLocation"])
-
-	def end_element(self, name):
-		if name == "domain":
-			self.current_domain = None
-			self.current_prefix = None
-			self.current_prefix_type = None
-		elif name == "stripe":
-			self.current_stripe = None
-		elif name == "bitset":
-			self.current_bitset = None
-		elif name == "reg32":
-			self.current_reg = None
-		elif name == "array":
-			# if the array has no Reg children, push an implicit reg32:
-			if len(self.current_array.children) == 0:
-				attrs = {
-					"name": "REG",
-					"offset": "0",
-				}
-				self.parse_reg(attrs, 32)
-			self.current_array = self.current_array.parent
-		elif name == "enum":
-			self.current_enum = None
-
-	def character_data(self, data):
-		self.cdata += data
-
-	def dump_reg_usages(self):
-		d = collections.defaultdict(list)
-		for usage, regs in self.usage_regs.items():
-			for reg in regs:
-				variants = self.variant_regs.get(reg.name)
-				if variants:
-					for variant, vreg in variants.items():
-						if reg == vreg:
-							d[(usage, sanitize_variant(variant))].append(reg)
-				else:
-					for variant in self.variants:
-						d[(usage, sanitize_variant(variant))].append(reg)
-
-		print("#ifdef __cplusplus")
-
-		for usage, regs in self.usage_regs.items():
-			print("template<chip CHIP> constexpr inline uint16_t %s_REGS[] = {};" % (usage.upper()))
-
-		for (usage, variant), regs in d.items():
-			offsets = []
-
-			for reg in regs:
-				if reg.array:
-					for i in range(reg.array.length):
-						offsets.append(reg.array.offset + reg.offset + i * reg.array.stride)
-						if reg.bit_size == 64:
-							offsets.append(offsets[-1] + 1)
-				else:
-					offsets.append(reg.offset)
-					if reg.bit_size == 64:
-						offsets.append(offsets[-1] + 1)
-
-			offsets.sort()
-
-			print("template<> constexpr inline uint16_t %s_REGS<%s>[] = {" % (usage.upper(), variant))
-			for offset in offsets:
-				print("\t%s," % hex(offset))
-			print("};")
-
-		print("#endif")
-
-	def has_variants(self, reg):
-		return reg.name in self.variant_regs and not is_number(reg.name) and not is_number(reg.name[1:])
-
-	def dump(self):
-		enums = []
-		bitsets = []
-		regs = []
-		for e in self.file:
-			if isinstance(e, Enum):
-				enums.append(e)
-			elif isinstance(e, Bitset):
-				bitsets.append(e)
-			else:
-				regs.append(e)
-
-		for e in enums + bitsets + regs:
-			e.dump(self.has_variants(e))
-
-		self.dump_reg_usages()
-
-
-	def dump_regs_py(self):
-		regs = []
-		for e in self.file:
-			if isinstance(e, Reg):
-				regs.append(e)
-
-		for e in regs:
-			e.dump_py()
-
-
-	def dump_reg_variants(self, regname, variants):
-		if is_number(regname) or is_number(regname[1:]):
-			return
-		print("#ifdef __cplusplus")
-		print("struct __%s {" % regname)
-		# TODO be more clever.. we should probably figure out which
-		# fields have the same type in all variants (in which they
-		# appear) and stuff everything else in a variant specific
-		# sub-structure.
-		seen_fields = []
-		bit_size = 32
-		array = False
-		address = None
-		for variant in variants.keys():
-			print("    /* %s fields: */" % variant)
-			reg = variants[variant]
-			bit_size = reg.bit_size
-			array = reg.array
-			for f in reg.bitset.fields:
-				fld_name = field_name(reg, f)
-				if fld_name in seen_fields:
-					continue
-				seen_fields.append(fld_name)
-				name = fld_name.lower()
-				if f.type in [ "address", "waddress" ]:
-					if address:
-						continue
-					address = f
-					tab_to("    __bo_type", "bo;")
-					tab_to("    uint32_t", "bo_offset;")
-					continue
-				type, val = f.ctype("var")
-				tab_to("    %s" %type, "%s;" %name)
-		print("    /* fallback fields: */")
-		if bit_size == 64:
-			tab_to("    uint64_t", "unknown;")
-			tab_to("    uint64_t", "qword;")
-		else:
-			tab_to("    uint32_t", "unknown;")
-			tab_to("    uint32_t", "dword;")
-		print("};")
-		# TODO don't hardcode the varset enum name
-		varenum = "chip"
-		print("template <%s %s>" % (varenum, varenum.upper()))
-		print("static inline struct fd_reg_pair")
-		xtra = ""
-		xtravar = ""
-		if array:
-			xtra = "int __i, "
-			xtravar = "__i, "
-		print("__%s(%sstruct __%s fields) {" % (regname, xtra, regname))
-		for variant in variants.keys():
-			if "-" in variant:
-				start = variant[:variant.index("-")]
-				end = variant[variant.index("-") + 1:]
-				if end != "":
-					print("  if ((%s >= %s) && (%s <= %s)) {" % (varenum.upper(), start, varenum.upper(), end))
-				else:
-					print("  if (%s >= %s) {" % (varenum.upper(), start))
-			else:
-				print("  if (%s == %s) {" % (varenum.upper(), variant))
-			reg = variants[variant]
-			reg.dump_regpair_builder()
-			print("  } else")
-		print("    assert(!\"invalid variant\");")
-		print("  return (struct fd_reg_pair){};")
-		print("}")
-
-		if bit_size == 64:
-			skip = ", { .reg = 0 }"
-		else:
-			skip = ""
-
-		print("#define %s(VARIANT, %s...) __%s<VARIANT>(%s{__VA_ARGS__})%s" % (regname, xtravar, regname, xtravar, skip))
-		print("#endif /* __cplusplus */")
-
-	def dump_structs(self):
-		for e in self.file:
-			e.dump_pack_struct(self.has_variants(e))
-
-		for regname in self.variant_regs:
-			self.dump_reg_variants(regname, self.variant_regs[regname])
+    def __init__(self):
+        self.current_array = None
+        self.current_domain = None
+        self.current_prefix = None
+        self.current_prefix_type = None
+        self.current_stripe = None
+        self.current_bitset = None
+        self.current_bitsize = 32
+        # The varset attribute on the domain specifies the enum which
+        # specifies all possible hw variants:
+        self.current_varset = None
+        # Regs that have multiple variants.. we only generated the C++
+        # template based struct-packers for these
+        self.variant_regs = {}
+        # Information in which contexts regs are used, to be used in
+        # debug options
+        self.usage_regs = collections.defaultdict(list)
+        self.bitsets = {}
+        self.enums = {}
+        self.variants = set()
+        self.file = []
+        self.xml_files = []
+
+    def error(self, message):
+        parser, filename = self.stack[-1]
+        return Error("%s:%d:%d: %s" % (filename, parser.CurrentLineNumber, parser.CurrentColumnNumber, message))
+
+    def prefix(self, variant=None):
+        if self.current_prefix_type == "variant" and variant:
+            return sanitize_variant(variant)
+        elif self.current_stripe:
+            return self.current_stripe + "_" + self.current_domain
+        elif self.current_prefix:
+            return self.current_prefix + "_" + self.current_domain
+        else:
+            return self.current_domain
+
+    def parse_field(self, name, attrs):
+        try:
+            if "pos" in attrs:
+                high = low = int(attrs["pos"], 0)
+            elif "high" in attrs and "low" in attrs:
+                high = int(attrs["high"], 0)
+                low = int(attrs["low"], 0)
+            else:
+                low = 0
+                high = self.current_bitsize - 1
+
+            if "type" in attrs:
+                type = attrs["type"]
+            else:
+                type = None
+
+            if "shr" in attrs:
+                shr = int(attrs["shr"], 0)
+            else:
+                shr = 0
+
+            b = Field(name, low, high, shr, type, self)
+
+            if type == "fixed" or type == "ufixed":
+                b.radix = int(attrs["radix"], 0)
+
+            self.current_bitset.fields.append(b)
+        except ValueError as e:
+            raise self.error(e)
+
+    def parse_varset(self, attrs):
+        # Inherit the varset from the enclosing domain if not overriden:
+        varset = self.current_varset
+        if "varset" in attrs:
+            varset = self.enums[attrs["varset"]]
+        return varset
+
+    def parse_variants(self, attrs):
+        if "variants" not in attrs:
+            return None
+
+        variant = attrs["variants"].split(",")[0]
+        varset = self.parse_varset(attrs)
+
+        if "-" in variant:
+            # if we have a range, validate that both the start and end
+            # of the range are valid enums:
+            start = variant[:variant.index("-")]
+            end = variant[variant.index("-") + 1:]
+            assert varset.has_name(start)
+            if end != "":
+                assert varset.has_name(end)
+        else:
+            assert varset.has_name(variant)
+
+        return variant
+
+    def add_all_variants(self, reg, attrs, parent_variant):
+        # TODO this should really handle *all* variants, including dealing
+        # with open ended ranges (ie. "A2XX,A4XX-") (we have the varset
+        # enum now to make that possible)
+        variant = self.parse_variants(attrs)
+        if not variant:
+            variant = parent_variant
+
+        if reg.name not in self.variant_regs:
+            self.variant_regs[reg.name] = {}
+        else:
+            # All variants must be same size:
+            v = next(iter(self.variant_regs[reg.name]))
+            assert self.variant_regs[reg.name][v].bit_size == reg.bit_size
+
+        self.variant_regs[reg.name][variant] = reg
+
+    def add_all_usages(self, reg, usages):
+        if not usages:
+            return
+
+        for usage in usages:
+            self.usage_regs[usage].append(reg)
+
+        self.variants.add(reg.domain)
+
+    def do_validate(self, schemafile):
+        if not self.validate:
+            return
+
+        try:
+            from lxml import etree
+
+            parser, filename = self.stack[-1]
+            dirname = os.path.dirname(filename)
+
+            # we expect this to look like <namespace url> schema.xsd.. I think
+            # technically it is supposed to be just a URL, but that doesn't
+            # quite match up to what we do.. Just skip over everything up to
+            # and including the first whitespace character:
+            schemafile = schemafile[schemafile.rindex(" ")+1:]
+
+            # this is a bit cheezy, but the xml file to validate could be
+            # in a child director, ie. we don't really know where the schema
+            # file is, the way the rnn C code does.  So if it doesn't exist
+            # just look one level up
+            if not os.path.exists(dirname + "/" + schemafile):
+                schemafile = "../" + schemafile
+
+            if not os.path.exists(dirname + "/" + schemafile):
+                raise self.error("Cannot find schema for: " + filename)
+
+            xmlschema_doc = etree.parse(dirname + "/" + schemafile)
+            xmlschema = etree.XMLSchema(xmlschema_doc)
+
+            xml_doc = etree.parse(filename)
+            if not xmlschema.validate(xml_doc):
+                error_str = str(xmlschema.error_log.filter_from_errors()[0])
+                raise self.error(
+                    "Schema validation failed for: " + filename + "\n" + error_str)
+        except ImportError as e:
+            print("lxml not found, skipping validation", file=sys.stderr)
+
+    def do_parse(self, filename):
+        filepath = os.path.abspath(filename)
+        if filepath in self.xml_files:
+            return
+        self.xml_files.append(filepath)
+        file = open(filename, "rb")
+        parser = xml.parsers.expat.ParserCreate()
+        self.stack.append((parser, filename))
+        parser.StartElementHandler = self.start_element
+        parser.EndElementHandler = self.end_element
+        parser.CharacterDataHandler = self.character_data
+        parser.buffer_text = True
+        parser.ParseFile(file)
+        self.stack.pop()
+        file.close()
+
+    def parse(self, rnn_path, filename, validate):
+        self.path = rnn_path
+        self.stack = []
+        self.validate = validate
+        self.do_parse(filename)
+
+    def parse_reg(self, attrs, bit_size):
+        self.current_bitsize = bit_size
+        if "type" in attrs and attrs["type"] in self.bitsets:
+            bitset = self.bitsets[attrs["type"]]
+            if bitset.inline:
+                self.current_bitset = Bitset(attrs["name"], bitset)
+                self.current_bitset.inline = True
+            else:
+                self.current_bitset = bitset
+        else:
+            self.current_bitset = Bitset(attrs["name"], None)
+            self.current_bitset.inline = True
+            if "type" in attrs:
+                self.parse_field(None, attrs)
+
+        variant = self.parse_variants(attrs)
+        if not variant and self.current_array:
+            variant = self.current_array.variant
+
+        self.current_reg = Reg(attrs, self.prefix(
+            variant), self.current_array, bit_size)
+        self.current_reg.bitset = self.current_bitset
+        self.current_bitset.reg = self.current_reg
+
+        if len(self.stack) == 1:
+            self.file.append(self.current_reg)
+
+        if variant is not None:
+            self.add_all_variants(self.current_reg, attrs, variant)
+
+        usages = None
+        if "usage" in attrs:
+            usages = attrs["usage"].split(',')
+        elif self.current_array:
+            usages = self.current_array.usages
+
+        self.add_all_usages(self.current_reg, usages)
+
+    def start_element(self, name, attrs):
+        self.cdata = ""
+        if name == "import":
+            filename = attrs["file"]
+            self.do_parse(os.path.join(self.path, filename))
+        elif name == "domain":
+            self.current_domain = attrs["name"]
+            if "prefix" in attrs:
+                self.current_prefix = sanitize_variant(
+                    self.parse_variants(attrs))
+                self.current_prefix_type = attrs["prefix"]
+            else:
+                self.current_prefix = None
+                self.current_prefix_type = None
+            if "varset" in attrs:
+                self.current_varset = self.enums[attrs["varset"]]
+        elif name == "stripe":
+            self.current_stripe = sanitize_variant(self.parse_variants(attrs))
+        elif name == "enum":
+            self.current_enum_value = 0
+            self.current_enum = Enum(attrs["name"])
+            self.enums[attrs["name"]] = self.current_enum
+            if len(self.stack) == 1:
+                self.file.append(self.current_enum)
+        elif name == "value":
+            if "value" in attrs:
+                value = int(attrs["value"], 0)
+            else:
+                value = self.current_enum_value
+            self.current_enum.values.append((attrs["name"], value))
+        elif name == "reg32":
+            self.parse_reg(attrs, 32)
+        elif name == "reg64":
+            self.parse_reg(attrs, 64)
+        elif name == "array":
+            self.current_bitsize = 32
+            variant = self.parse_variants(attrs)
+            index_type = self.enums[attrs["index"]
+                                    ] if "index" in attrs else None
+            self.current_array = Array(attrs, self.prefix(
+                variant), variant, self.current_array, index_type)
+            if len(self.stack) == 1:
+                self.file.append(self.current_array)
+        elif name == "bitset":
+            self.current_bitset = Bitset(attrs["name"], None)
+            if "inline" in attrs and attrs["inline"] == "yes":
+                self.current_bitset.inline = True
+            self.bitsets[self.current_bitset.name] = self.current_bitset
+            if len(self.stack) == 1 and not self.current_bitset.inline:
+                self.file.append(self.current_bitset)
+        elif name == "bitfield" and self.current_bitset:
+            self.parse_field(attrs["name"], attrs)
+        elif name == "database":
+            self.do_validate(attrs["xsi:schemaLocation"])
+
+    def end_element(self, name):
+        if name == "domain":
+            self.current_domain = None
+            self.current_prefix = None
+            self.current_prefix_type = None
+        elif name == "stripe":
+            self.current_stripe = None
+        elif name == "bitset":
+            self.current_bitset = None
+        elif name == "reg32":
+            self.current_reg = None
+        elif name == "array":
+            # if the array has no Reg children, push an implicit reg32:
+            if len(self.current_array.children) == 0:
+                attrs = {
+                    "name": "REG",
+                    "offset": "0",
+                }
+                self.parse_reg(attrs, 32)
+            self.current_array = self.current_array.parent
+        elif name == "enum":
+            self.current_enum = None
+
+    def character_data(self, data):
+        self.cdata += data
+
+    def dump_reg_usages(self):
+        d = collections.defaultdict(list)
+        for usage, regs in self.usage_regs.items():
+            for reg in regs:
+                variants = self.variant_regs.get(reg.name)
+                if variants:
+                    for variant, vreg in variants.items():
+                        if reg == vreg:
+                            d[(usage, sanitize_variant(variant))].append(reg)
+                else:
+                    for variant in self.variants:
+                        d[(usage, sanitize_variant(variant))].append(reg)
+
+        print("#ifdef __cplusplus")
+
+        for usage, regs in self.usage_regs.items():
+            print("template<chip CHIP> constexpr inline uint16_t %s_REGS[] = {};" % (
+                usage.upper()))
+
+        for (usage, variant), regs in d.items():
+            offsets = []
+
+            for reg in regs:
+                if reg.array:
+                    for i in range(reg.array.length):
+                        offsets.append(reg.array.offset +
+                                       reg.offset + i * reg.array.stride)
+                        if reg.bit_size == 64:
+                            offsets.append(offsets[-1] + 1)
+                else:
+                    offsets.append(reg.offset)
+                    if reg.bit_size == 64:
+                        offsets.append(offsets[-1] + 1)
+
+            offsets.sort()
+
+            print("template<> constexpr inline uint16_t %s_REGS<%s>[] = {" % (
+                usage.upper(), variant))
+            for offset in offsets:
+                print("\t%s," % hex(offset))
+            print("};")
+
+        print("#endif")
+
+    def has_variants(self, reg):
+        return reg.name in self.variant_regs and not is_number(reg.name) and not is_number(reg.name[1:])
+
+    def dump(self):
+        enums = []
+        bitsets = []
+        regs = []
+        for e in self.file:
+            if isinstance(e, Enum):
+                enums.append(e)
+            elif isinstance(e, Bitset):
+                bitsets.append(e)
+            else:
+                regs.append(e)
+
+        for e in enums + bitsets + regs:
+            e.dump(self.has_variants(e))
+
+        self.dump_reg_usages()
+
+    def dump_regs_py(self):
+        regs = []
+        for e in self.file:
+            if isinstance(e, Reg):
+                regs.append(e)
+
+        for e in regs:
+            e.dump_py()
+
+    def dump_reg_variants(self, regname, variants):
+        if is_number(regname) or is_number(regname[1:]):
+            return
+        print("#ifdef __cplusplus")
+        print("struct __%s {" % regname)
+        # TODO be more clever.. we should probably figure out which
+        # fields have the same type in all variants (in which they
+        # appear) and stuff everything else in a variant specific
+        # sub-structure.
+        seen_fields = []
+        bit_size = 32
+        array = False
+        address = None
+        constexpr_mark = " CONSTEXPR"
+        for variant in variants.keys():
+            print("    /* %s fields: */" % variant)
+            reg = variants[variant]
+            bit_size = reg.bit_size
+            array = reg.array
+            for f in reg.bitset.fields:
+                fld_name = field_name(reg, f)
+                if fld_name in seen_fields:
+                    continue
+                seen_fields.append(fld_name)
+                name = fld_name.lower()
+                if f.type in ["address", "waddress"]:
+                    if address:
+                        continue
+                    address = f
+                    print("#ifndef TU_CS_H")
+                    tab_to("    __bo_type", "bo;")
+                    tab_to("    uint32_t", "bo_offset;")
+                    print("#endif")
+                    continue
+                type, val = f.ctype("var")
+                tab_to("    %s" % type, "%s;" % name)
+                if f.type == "float":
+                    constexpr_mark = ""
+        print("    /* fallback fields: */")
+        if bit_size == 64:
+            tab_to("    uint64_t", "unknown;")
+            tab_to("    uint64_t", "qword;")
+        else:
+            tab_to("    uint32_t", "unknown;")
+            tab_to("    uint32_t", "dword;")
+        print("};")
+        # TODO don't hardcode the varset enum name
+        varenum = "chip"
+        print("template <%s %s>" % (varenum, varenum.upper()))
+        print("static%s inline struct fd_reg_pair" % (constexpr_mark))
+        xtra = ""
+        xtravar = ""
+        if array:
+            xtra = "int __i, "
+            xtravar = "__i, "
+        print("__%s(%sstruct __%s fields) {" % (regname, xtra, regname))
+        for variant in variants.keys():
+            if "-" in variant:
+                start = variant[:variant.index("-")]
+                end = variant[variant.index("-") + 1:]
+                if end != "":
+                    print("  if ((%s >= %s) && (%s <= %s)) {" % (
+                        varenum.upper(), start, varenum.upper(), end))
+                else:
+                    print("  if (%s >= %s) {" % (varenum.upper(), start))
+            else:
+                print("  if (%s == %s) {" % (varenum.upper(), variant))
+            reg = variants[variant]
+            reg.dump_regpair_builder()
+            print("  } else")
+        print("    assert(!\"invalid variant\");")
+        print("  return (struct fd_reg_pair){};")
+        print("}")
+
+        if bit_size == 64:
+            skip = ", { .reg = 0 }"
+        else:
+            skip = ""
+
+        print("#define %s(VARIANT, %s...) __%s<VARIANT>(%s{__VA_ARGS__})%s" % (
+            regname, xtravar, regname, xtravar, skip))
+        print("#endif /* __cplusplus */")
+
+    def dump_structs(self):
+        for e in self.file:
+            e.dump_pack_struct(self.has_variants(e))
+
+        for regname in self.variant_regs:
+            self.dump_reg_variants(regname, self.variant_regs[regname])
 
 
 def dump_c(args, guard, func):
-	p = Parser()
-
-	try:
-		p.parse(args.rnn, args.xml, args.validate)
-	except Error as e:
-		print(e, file=sys.stderr)
-		exit(1)
-
-	print("#ifndef %s\n#define %s\n" % (guard, guard))
-
-	print("/* Autogenerated file, DO NOT EDIT manually! */")
-
-	print()
-	print("#ifdef __KERNEL__")
-	print("#include <linux/bug.h>")
-	print("#define assert(x) BUG_ON(!(x))")
-	print("#else")
-	print("#include <assert.h>")
-	print("#endif")
-	print()
-
-	print("#ifdef __cplusplus")
-	print("#define __struct_cast(X)")
-	print("#else")
-	print("#define __struct_cast(X) (struct X)")
-	print("#endif")
-	print()
-
-	print("#ifndef FD_NO_DEPRECATED_PACK")
-	print("#define FD_DEPRECATED __attribute__((deprecated))")
-	print("#else")
-	print("#define FD_DEPRECATED")
-	print("#endif")
-	print()
-
-	func(p)
-
-	print()
-	print("#undef FD_DEPRECATED")
-	print()
-
-	print("#endif /* %s */" % guard)
+    p = Parser()
+
+    try:
+        p.parse(args.rnn, args.xml, args.validate)
+    except Error as e:
+        print(e, file=sys.stderr)
+        exit(1)
+
+    print("#ifndef %s\n#define %s\n" % (guard, guard))
+
+    print("/* Autogenerated file, DO NOT EDIT manually! */")
+
+    print()
+    print("#ifdef __KERNEL__")
+    print("#include <linux/bug.h>")
+    print("#define assert(x) BUG_ON(!(x))")
+    print("#else")
+    print("#include <assert.h>")
+    print("#endif")
+    print()
+
+    print("#ifdef __cplusplus")
+    print("#define __struct_cast(X)")
+    print("#define CONSTEXPR constexpr")
+    print("#else")
+    print("#define __struct_cast(X) (struct X)")
+    print("#define CONSTEXPR")
+    print("#endif")
+    print()
+
+    # TODO figure out what to do about fd_reg_stomp_allowed()
+    # vs gcc.. for now only enable the warnings with clang:
+    print("#if defined(__clang__) && !defined(FD_NO_DEPRECATED_PACK)")
+    print("#define __FD_DEPRECATED _Pragma (\"GCC warning \\\"Deprecated reg builder\\\"\")")
+    print("#else")
+    print("#define __FD_DEPRECATED")
+    print("#endif")
+    print()
+
+    func(p)
+
+    print("#endif /* %s */" % guard)
 
 
 def dump_c_defines(args):
-	guard = str.replace(os.path.basename(args.xml), '.', '_').upper()
-	dump_c(args, guard, lambda p: p.dump())
+    guard = str.replace(os.path.basename(args.xml), '.', '_').upper()
+    dump_c(args, guard, lambda p: p.dump())
 
 
 def dump_c_pack_structs(args):
-	guard = str.replace(os.path.basename(args.xml), '.', '_').upper() + '_STRUCTS'
-	dump_c(args, guard, lambda p: p.dump_structs())
-
+    guard = str.replace(os.path.basename(args.xml),
+                        '.', '_').upper() + '_STRUCTS'
+    dump_c(args, guard, lambda p: p.dump_structs())
+
+
+def dump_perfcntrs(args):
+    p = Parser()
+
+    try:
+        p.parse(args.rnn, args.xml, args.validate)
+    except Error as e:
+        print(e, file=sys.stderr)
+        exit(1)
+
+    perfcntrs = json.load(open(args.json, "r", encoding="utf-8"))
+
+    chip_type = p.enums['chip']
+    chip = perfcntrs['chip']
+    if not chip_type.has_name(chip):
+        raise Error("Invalid chip: " + chip)
+
+    groups = perfcntrs['groups']
+
+    guard = "__" + chip + "_PERFCNTRS_"
+    print("#ifndef %s\n#define %s\n" % (guard, guard))
+    print("/* Autogenerated file, DO NOT EDIT manually! */")
+    print()
+    print("#ifdef __KERNEL__")
+    print("#include \"msm_perfcntr.h\"")
+    print("#endif")
+    print()
+
+    def has_variant(variant):
+        if variant is None:
+            return True
+        if "-" in variant:
+            start = chip_type.value(variant[:variant.index("-")])
+            end = chip_type.value(variant[variant.index("-") + 1:])
+            chipn = chip_type.value(chip)
+
+            return (start is None or chipn >= start) and (end is None or chipn <= end)
+        return chip == variant
+
+    # Split out arrays and regs for later access:
+    arrays = {}
+    regs = {}
+    for e in p.file:
+        if isinstance(e, Array) and has_variant(e.variant):
+            arrays[e.local_name] = e
+        if isinstance(e, Reg):
+            regs[e.name] = e
+
+    # For variant regs, overwrite 'regs' entries with correct variant:
+    for regname in p.variant_regs:
+        for (variant, reg) in p.variant_regs[regname].items():
+            if has_variant(variant):
+                regs[regname] = reg
+                break
+
+    for group in groups:
+        name = group['name']
+        name_low = name.lower()
+        num = group['num']
+        countable_type_name = group['countable_type']
+
+        if not countable_type_name in p.enums:
+            raise Error("Invalid type: " + countable_type_name)
+
+        countable_type = p.enums[countable_type_name]
+
+        print("#ifndef __KERNEL__")
+        print("static const struct fd_perfcntr_countable " + name_low + "_countables[] = {")
+        for (name, value) in countable_type.values:
+            # if the countable is prefixed with the chip, strip that:
+            # (note: avoid py3.9 dependency for kernel)
+            if name.startswith(chip + "_"):
+                name = name[len(chip)+1:]
+            print("   { \"" + name + "\", " + str(value) + " },")
+        print("};")
+        print("#endif")
+
+        print("static const struct fd_perfcntr_counter " + name_low + "_counters[] = {")
+        for i in range(0, num):
+            if "reserved" in group and i in group["reserved"]:
+                continue
+            def get_reg(name):
+                # if reg has {} pattern, expand that first:
+                name = name.format(i)
+
+                if name in arrays:
+                    arr = arrays[name]
+                    return arr.offset + (i * arr.stride)
+
+                if not name in regs:
+                    raise Error("Invalid reg: " + name)
+
+                reg = regs[name]
+                return reg.offset
+
+            def get_counter():
+                # if the counter is <reg64> just a single "counter" value
+                # should be specified in the json, but for legacy separate
+                # hi/lo <reg32> pairs "counter_lo" and "counter_hi" should
+                # be specified
+                if "counter" in group:
+                    counter = get_reg(group["counter"])
+                    return [counter, counter+1]
+                counter_lo = get_reg(group["counter_lo"])
+                counter_hi = get_reg(group["counter_hi"])
+                return [counter_lo, counter_hi]
+
+            (counter_lo, counter_hi) = get_counter()
+            select = get_reg(group['select'])
+
+            select_offset = 0
+            if "select_offset" in group:
+                select_offset = int(group["select_offset"])
+                select = select + select_offset
+
+            slice_select_str = ""
+            if "slice_select" in group:
+                slice_select = group["slice_select"]
+                for reg in slice_select:
+                    val = get_reg(reg) + select_offset
+                    slice_select_str += "0x%04x, " % val
+
+            # TODO add support for things that need enable/clear regs
+
+            print("   { 0x%04x, {%s}, 0x%04x, 0x%04x }," % (select, slice_select_str, counter_lo, counter_hi))
+        print("};")
+
+        print()
+
+    print("const struct fd_perfcntr_group " + chip.lower() + "_perfcntr_groups[] = {")
+    for group in groups:
+        name = group['name']
+        name_low = name.lower()
+        pipe = 'NONE'
+        if 'pipe' in group:
+            pipe = group['pipe']
+
+        print("   GROUP(\"%s\", PIPE_%s, %s_counters, %s_countables)," % (name, pipe, name_low, name_low))
+
+    print("};")
+    print("const unsigned " + chip.lower() + "_num_perfcntr_groups = ARRAY_SIZE(" + chip.lower() + "_perfcntr_groups);")
+
+    print()
+    print("#endif /* %s */" % guard)
 
 def dump_py_defines(args):
-	p = Parser()
+    p = Parser()
 
-	try:
-		p.parse(args.rnn, args.xml, args.validate)
-	except Error as e:
-		print(e, file=sys.stderr)
-		exit(1)
+    try:
+        p.parse(args.rnn, args.xml, args.validate)
+    except Error as e:
+        print(e, file=sys.stderr)
+        exit(1)
 
-	file_name = os.path.splitext(os.path.basename(args.xml))[0]
+    file_name = os.path.splitext(os.path.basename(args.xml))[0]
 
-	print("from enum import IntEnum")
-	print("class %sRegs(IntEnum):" % file_name.upper())
+    print("from enum import IntEnum")
+    print("class %sRegs(IntEnum):" % file_name.upper())
 
-	os.path.basename(args.xml)
+    os.path.basename(args.xml)
 
-	p.dump_regs_py()
+    p.dump_regs_py()
 
 
 def main():
-	parser = argparse.ArgumentParser()
-	parser.add_argument('--rnn', type=str, required=True)
-	parser.add_argument('--xml', type=str, required=True)
-	parser.add_argument('--validate', default=False, action='store_true')
-	parser.add_argument('--no-validate', dest='validate', action='store_false')
+    parser = argparse.ArgumentParser()
+    parser.add_argument('--rnn', type=str, required=True)
+    parser.add_argument('--xml', type=str, required=True)
+    parser.add_argument('--validate', default=False, action='store_true')
+    parser.add_argument('--no-validate', dest='validate', action='store_false')
+
+    subparsers = parser.add_subparsers()
+    subparsers.required = True
 
-	subparsers = parser.add_subparsers()
-	subparsers.required = True
+    parser_c_defines = subparsers.add_parser('c-defines')
+    parser_c_defines.set_defaults(func=dump_c_defines)
 
-	parser_c_defines = subparsers.add_parser('c-defines')
-	parser_c_defines.set_defaults(func=dump_c_defines)
+    parser_c_pack_structs = subparsers.add_parser('c-pack-structs')
+    parser_c_pack_structs.set_defaults(func=dump_c_pack_structs)
 
-	parser_c_pack_structs = subparsers.add_parser('c-pack-structs')
-	parser_c_pack_structs.set_defaults(func=dump_c_pack_structs)
+    parser_perfcntrs = subparsers.add_parser('perfcntrs')
+    parser_perfcntrs.add_argument('--json', type=str, required=True)
+    parser_perfcntrs.set_defaults(func=dump_perfcntrs)
 
-	parser_py_defines = subparsers.add_parser('py-defines')
-	parser_py_defines.set_defaults(func=dump_py_defines)
+    parser_py_defines = subparsers.add_parser('py-defines')
+    parser_py_defines.set_defaults(func=dump_py_defines)
 
-	args = parser.parse_args()
-	args.func(args)
+    args = parser.parse_args()
+    args.func(args)
 
 
 if __name__ == '__main__':
-	main()
+    main()
-- 
2.53.0


