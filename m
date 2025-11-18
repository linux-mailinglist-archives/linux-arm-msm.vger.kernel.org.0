Return-Path: <linux-arm-msm+bounces-82360-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D44CC6A4F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 16:30:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 281C0344DA3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79CB9364030;
	Tue, 18 Nov 2025 15:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GsciJI+e";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZfJmeKB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C041331770F
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763479801; cv=none; b=kfH2ldpaC+qyYJ+8kz6dNaiJdErN3p/SFssHlMpfSaZFReoC9qhIuvGoYPkbihXf6L7Zr8mxhWBWsPPkGncyonlmYQsXhg6pGTd3s8N00GelynkabxArtp5L4Aa2rMdsfhbshkSOZLMB2gC8H56QZ/aqcsScdoqsF6u7aVgW56k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763479801; c=relaxed/simple;
	bh=h8Wy8BJTgTAWjvrbRWFecxoijX7E/X0NFjBj8Sl81/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GAtywoxRxL+HyZYwIJ3Sr7PaB4jH10mDsww+f1oldMu5gtSlZvg8jaTu4dCJMemd9VVtXzR6YLW6xiD6z8YSQs+R/CQO9rZ6JoKwrhjmrBE/FcY1P1RQBSrl7ukSLXEfj1kKM6kXyQp6mOxpB65FhTtaeF+52A4W3fV7QVHHZ0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GsciJI+e; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZfJmeKB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI9rrwF2665538
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=I+VDmgEGyB6TgQRIfvWH0W0zNDau9SODpdv
	whVSLYSM=; b=GsciJI+eubbH2Zmbgge245eKjnyy1XkJFZ116YUk6WP9LAt4OV5
	chSnlm/0lB2NYYL5CAeSzv/WDruvnDN8rmlEYZg2J5gHafySfRbC+4LpEeX/ctqh
	ZYlwpK7AoME1ijgGfm92JuoPWq9+mYBeeZKZK9CKofoT12BKRksywKrzwrN7fbz/
	pzODjAdPZtmg37xmbOqaTBmlMrlVBU55fA+tmV4K/RvOT+1WrhJ6AcB2dueFiYiN
	pJKKN/5ZQIzBFwLl82W09vE/M3hdBAzylhO6mBHzUs/QLRwK78/ayMJb7BxDHdUF
	BAYRgkcQ7cZRU/P+cOcGR5zqwWA4HQlrdgw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agpjk8vs9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:29:58 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b993eb2701bso5566838a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763479797; x=1764084597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I+VDmgEGyB6TgQRIfvWH0W0zNDau9SODpdvwhVSLYSM=;
        b=BZfJmeKBDUTR7EO/0qxulwX1gWI+kjTEvvfWjXF9A9E6ms3cXV6X0o+xONcLJMw+rZ
         Hv9eVEiiO3Uk9QgsqfH5vZ1Bn0v5McjP/MHulvW+m36c30RdzaWlRGqZctMC0cs51hT4
         EfabSw41U+179R5NUP64JP8+Dz07krK5BfUiit8X2Yj42Sw1OejJzCHoYuWYKxbHYRbx
         Fp35U+DG2LjJXQsLtJyszfkdskafXlxm8cbhR6Jll2zf7dHixl/0xyDODAZ4sxfrjdmd
         zpifJVUXPqIckGcbvnrM5hBgB26pCXUUL8E4ia8YwqeoFEiiSgBadt73BioN2UmWxwm0
         Nkmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763479797; x=1764084597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I+VDmgEGyB6TgQRIfvWH0W0zNDau9SODpdvwhVSLYSM=;
        b=hu1Anpb7PLBqdgPB5rhYXT0fLO1T+Ks3mrYq+pjoA7och0NQdezrKyPjEZuoJME3z9
         MMW7U231sbBHfbxvQTiMXYwZnMY/U1/iSlNdmuZIQf6W5h8NQKtNRzMNKQsaBZKB8AnP
         SICu5Wk0v5O4s8n8HOef4wRHaE4gUbwzsmhX+3KF5S7cOwZwZcHxY3bfEOXSriPTQ8kv
         LB1fN5S4qpCWwxNUza420+jrVtTTEUzIJxhm63xH9oghuYzVYL9U01nR2JCAINrxVOQL
         fHgZV2pASD9dNkoWB+lXj9IsOG4YXyFYYV2PfNy5OXx0OCosKzOCnFfjdqw08FzczJ1v
         mA5Q==
X-Gm-Message-State: AOJu0YxAH6wprh+zV4CgvA808VSFShyu6GPaYIUwZo9vNZ26rSe8hmwj
	xe7K0AlZiqo8fSiYJ445acALQzrcRuCaL7lZj8noYLV1ck6+9o20FvM+GGu6zRNr1zVoR+4LB9e
	3WNwvUDvU9KRo6/9wr8YnIxCAvnOqZ1EERVPC8mL5zcLd5tEiDjaus5XrLTBBsXH29yfu
X-Gm-Gg: ASbGncuY64/waJTueqQdY4ETZdCH1hAYyfT3e9Royx2aRtBqYUFFvD9zBjDvVVaTGzX
	tTrHmNpvVKb4fI+S8iulIPdW7ZhUgwLG3o3SU4n4fVUxHYu5X6UrIfjG4b6ojkx8jj5ayEvQ/lN
	jow8WlEso917mlOFUovG2WLm8g8JM7LXjdvpMq+xPXySA/N4ti1BkTnLXQaJMeSx0D781RJ57vo
	GjGTOpXIyQ+Yx2e0ah6YN8jqJfDu1Ms0qGUTAvQ48P6nUtqcEe248haSpxgFJgl/kE18BnAERdn
	Nuw+NjbLdHysR0Q9jJfvP/477aIK5y8W71RBdYFeH04gAmINfIg5YcG5gLIkZYkYA8HLhWly4l0
	6YHyt6Wi+LDt5K9RGlmfaX+HXmnOVOVx5PlKE10dEfcixJETs/o8yXhnb
X-Received: by 2002:a05:6a20:3952:b0:341:84ee:7597 with SMTP id adf61e73a8af0-35ba228b7c4mr18420528637.47.1763479797459;
        Tue, 18 Nov 2025 07:29:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEe4mHSbCZax4MAs1NmPegRHOtwX0Q3zmqbi4opsIbcLXwrTwyddGfmcrdprr0gXjZZ4jZQ0g==
X-Received: by 2002:a05:6a20:3952:b0:341:84ee:7597 with SMTP id adf61e73a8af0-35ba228b7c4mr18420492637.47.1763479796936;
        Tue, 18 Nov 2025 07:29:56 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc375081bf8sm15591289a12.24.2025.11.18.07.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 07:29:56 -0800 (PST)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] drm/msm/registers: Fix encoding fields in 64b registers
Date: Tue, 18 Nov 2025 07:29:49 -0800
Message-ID: <20251118152952.226510-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: AcZeajLpTKVW3-uMcgHPz7HsNyLFcYvM
X-Proofpoint-GUID: AcZeajLpTKVW3-uMcgHPz7HsNyLFcYvM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEyNCBTYWx0ZWRfX/vTutEIaSFN2
 u1/RTeBAT8qQxqohdZqgS5taKRkp9MnRwYoUlY/cpaHhFsrSTz7BDbcpQdy247FCE+dY3HIIUXc
 /MFE6deYE3lY1IV1MQ7fL/DlYYf28x4tnnNQUzIzy64VZdgxFCVLiBERKTd9fD3dBvd9raQn5M2
 wFk0fO7xsb0hIteFEyDLCPSqgjRYKVRWK71iskPSFhrxbI3haYLPn3VRz3NDYWInYnv6Jjl6QKH
 CtWMOgKe5Lnj+QLsWS/ZSs70MXqFvbf5z4xhGgXzdE1tkaSwlrT8IM/iT/9vTqSuWr0Atz5IC1Q
 kBL9+z0y9Nto59Vme8+egWU29UFpsN5Ov8+s4fe78i6NHpoXbV7QOKJwIdjLBNt+/6TluA9aewl
 hszO7cEl1YpBbkkNbwr5AWW2jaO+wQ==
X-Authority-Analysis: v=2.4 cv=N/Yk1m9B c=1 sm=1 tr=0 ts=691c90f6 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=OSLXHSMv42BtIwkUFNYA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180124

Based on mesa commit 3f70b0578402 ("freedreno/registers: Fix encoding
fields in 64b registers"), but with some fixes to not skip emitting
interrupt enum values.

v2: Don't append "ull" to 32b reg MASK defines, to avoid printf format
    conversion warnings all over the place

Co-developed-by: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/registers/gen_header.py | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index 1d603dadfabd..2acad951f1e2 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -189,12 +189,13 @@ class Bitset(object):
 		print("    return (struct fd_reg_pair) {")
 		print("        .reg = (uint32_t)%s," % reg.reg_offset())
 		print("        .value =")
+		cast = "(uint64_t)" if reg.bit_size == 64 else ""
 		for f in self.fields:
 			if f.type in [ "address", "waddress" ]:
 				continue
 			else:
 				type, val = f.ctype("fields.%s" % field_name(reg, f))
-				print("            (%-40s << %2d) |" % (val, f.low))
+				print("            (%s%-40s << %2d) |" % (cast, val, f.low))
 		value_name = "dword"
 		if reg.bit_size == 64:
 			value_name = "qword"
@@ -264,10 +265,11 @@ class Bitset(object):
 				  (prefix, prefix, prefix, skip))
 
 
-	def dump(self, is_deprecated, prefix=None):
+	def dump(self, is_deprecated, prefix=None, reg=None):
 		if prefix is None:
 			prefix = self.name
-		if self.reg and self.reg.bit_size == 64:
+		reg64 = reg and self.reg and self.reg.bit_size == 64
+		if reg64:
 			print("static inline uint32_t %s_LO(uint32_t val)\n{" % prefix)
 			print("\treturn val;\n}")
 			print("static inline uint32_t %s_HI(uint32_t val)\n{" % prefix)
@@ -283,14 +285,17 @@ class Bitset(object):
 			elif f.type == "boolean" or (f.type is None and f.low == f.high):
 				tab_to("#define %s" % name, "0x%08x" % (1 << f.low))
 			else:
-				tab_to("#define %s__MASK" % name, "0x%08x" % mask(f.low, f.high))
+				typespec = "ull" if reg64 else "u"
+				tab_to("#define %s__MASK" % name, "0x%08x%s" % (mask(f.low, f.high), typespec))
 				tab_to("#define %s__SHIFT" % name, "%d" % f.low)
 				type, val = f.ctype("val")
+				ret_type = "uint64_t" if reg64 else "uint32_t"
+				cast = "(uint64_t)" if reg64 else ""
 
-				print("static inline uint32_t %s(%s val)\n{" % (name, type))
+				print("static inline %s %s(%s val)\n{" % (ret_type, name, type))
 				if f.shr > 0:
 					print("\tassert(!(val & 0x%x));" % mask(0, f.shr - 1))
-				print("\treturn ((%s) << %s__SHIFT) & %s__MASK;\n}" % (val, name, name))
+				print("\treturn (%s(%s) << %s__SHIFT) & %s__MASK;\n}" % (cast, val, name, name))
 		print()
 
 class Array(object):
@@ -437,7 +442,7 @@ class Reg(object):
 			print("static inline%s uint32_t REG_%s(%s) { return 0x%08x + %s; }" % (depcrstr, self.full_name, proto, offset, strides))
 
 		if self.bitset.inline:
-			self.bitset.dump(is_deprecated, self.full_name)
+			self.bitset.dump(is_deprecated, self.full_name, self)
 		print("")
 
 	def dump_pack_struct(self, is_deprecated):
-- 
2.51.1


