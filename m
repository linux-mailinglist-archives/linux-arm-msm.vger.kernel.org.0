Return-Path: <linux-arm-msm+bounces-72641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 13796B499FD
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 21:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 05961444809
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 19:30:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC55A29BD87;
	Mon,  8 Sep 2025 19:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eoiXwSBy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3E8A29A307
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 19:30:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757359837; cv=none; b=i2cxAQLb70gg87AQOz5QBGWEOvBmH5m2eNYjV6f5Hswe6c9w7jyseneiFnwkEk5UsbCPidC2DmPbdD6xyXf6KyiOz09SFuIZg6y2sApa4VBaAKag97aTCcf266OiUEwdO4+6nJk11/heZ5AdAfIMSzRjSOJk102WFKQqEQJJhPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757359837; c=relaxed/simple;
	bh=yLpgIfUCleO8WU1MNGXDek/R6mdQBiOB7DG+PLzA05E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WjIsqpIKYcpLYM5gmsACyCXJFFG0WHNXgIwqr1yGXbkcZlcSbE1vwIpEJ1hMCNu5UPlhWwd5VDf2N7lHYkQPnzMmscCI8nNGYexieyMUaZWy9T0hTy/iT7EG8VLfegqlFBd1kwrH0hU4NOJoFMsLZDBUuY63YV9qXfdAhrOu3UU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eoiXwSBy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588HW8CL010653
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 19:30:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4+SCGg2uZG2
	0kx2fs+zMpfdIiS1DqISeX8L2+3UuUCs=; b=eoiXwSByhib5wNqaZSdqnw0BhdJ
	xxEQBZ5ZWbpXcujPHIT0VYGYRrQ1w1KlMlCv8dstEZCMtqxcmlgds+QKhyuVgg8Q
	qcrbZiBW2wqXaoP8J8wkcuILaiC+29QhpUAvL1kp8t6IpXucjO5C+i2rt6A3HicV
	rfJigDss3/oMs1NZKos8jv+Kx5WRacisPu1Vg1xh8/L/f8JSH0Bz78+r+jf+24Cr
	ZYxVtbRfNY64Z7DC1bDujHBrNbEXaMZJyY+JFoxwiX1MLCPZ4IzbYMbrUd9nh/id
	y8eSAnRaURK7MN8cH2We/ZWMg4C0qeT6l5IDkl7CJ89hrt1ftJYQ4RxHCig==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e4kwmns-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 19:30:34 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7727edb9d3cso4103920b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 12:30:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757359834; x=1757964634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+SCGg2uZG20kx2fs+zMpfdIiS1DqISeX8L2+3UuUCs=;
        b=BVO8dQdrvd0z+DMGYT+d+xJJwT9v4kEbDxAEwO+1ecCHgseYXIIpQXkazv4kboj4fy
         fgB17QKl2EaHZxf+AqyFiD+FShXDoWWYIno2jNt4+yzyX+Hoq5ilwSUdlFRnB+4wlB6z
         YlOrAruTd3/8/cyR+xg2twOUS/i8CPiYf88yExFsLs1eJSHV2dYQwTAEO5HrA9Px2Md6
         K6JcOm8EuHd5qubPvFg0H+Wx1eaVRrCmo5/2P7+WN25WGBo4qqKAnymbr/1nen3mAQrt
         ocGxs+fbp/uNpR+sClqG6sGNgvUVA4uwadG+B1SqvPF6a8sO/9u9/1RkEFlhHBoQ91Jt
         LsEw==
X-Forwarded-Encrypted: i=1; AJvYcCX/gaHxo2LZcUwH/pHJcDUt6QKNDalzjY5G0Llwcy/X8t1PKTsOonS+y9wD6AHLyd03/tHM9YL+/yu/IQG3@vger.kernel.org
X-Gm-Message-State: AOJu0YweAAiY2YcgIDTS9eyP+8Mb6VCJZHViDIh6HkzVl+1hw99qq4JZ
	DzPHToFsbnumqTtF4XSqBIFFkqtZJCMBzZiIw8nKc890UaalctArKe3zMBEpw7K7Avlut/LloVp
	gXSip4JMCm4tIudBpifpHcUH3oPD7zcoJYy9JJeySUGXg3CkwxNrHKjgtWAB85NA/usEpwcoTCs
	VF
X-Gm-Gg: ASbGncuotE3IW8kSsCpqd+UlV2baAw0h+Yhl+cJ6T4RKx8pG9FVtyXjsrt09dK+eCgW
	620eCITSD8poRRl2/BUQSseoBRth45ganmC73oGAxibodTraxeuFWe2WaeArHQ/MunWqZdyW5EH
	1cSw0pyXyADWd5a3Z5tHpokUSKjMAYGNwoog+fxqXwjNs2c7qTc/Cyr5tqTFpYNWKlTAMCnda4A
	Prnt0ri6IYCCSa5R2TqRoyFpoeeyortgQT/nM2uvZ5+DDmcjh7lnLp7vrTZ4IBildV9v1jiWYXj
	zz6vO3OjbFMN2g6lF+ABEgwkaKokD+m1kniPMJyWGb9e+y7TRJk=
X-Received: by 2002:a05:6a00:2e07:b0:771:e06b:7edf with SMTP id d2e1a72fcca58-7742de14879mr12074336b3a.24.1757359833497;
        Mon, 08 Sep 2025 12:30:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhdcJscj+Nn9YJ18fqNOHlXe86gSyqOPdIsweAgzahuM9po/XXuGDoJB6W2hoLYBVXrOqPog==
X-Received: by 2002:a05:6a00:2e07:b0:771:e06b:7edf with SMTP id d2e1a72fcca58-7742de14879mr12074302b3a.24.1757359832988;
        Mon, 08 Sep 2025 12:30:32 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7725f0c4008sm22231699b3a.35.2025.09.08.12.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 12:30:32 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/5] drm/msm/registers: Sync gen_header.py from mesa
Date: Mon,  8 Sep 2025 12:30:05 -0700
Message-ID: <20250908193021.605012-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOCBTYWx0ZWRfX2RqbtfPc60E5
 LwXMnA3SbnmJnvDzvGx6A0OgiFdHEJs1wx1HFMHuhaBZ+8xL0Vs9jqxdskbqP4dgh7ACqr3zBIl
 i9mW5ocMl2oRnlIlbbTWqbZiXTBGkRlm5pP5x0n04OLAtR7E+DYis8wnv0plqgbx2/vvzwJh9Bo
 Tw4dekrqG8A4uH+tWK9O6/gAQ/AmQ333lBw1LCM0fBcH6WXfSi14fTsWrewqTDb6BlbeTcc0q6s
 bZk0Gzu7i1s5MCZahNYWwxgsSfUXp0Y7epYIpOyTxS6COUtuPjVAsFp3xUuDtHvVANe6XdhXql+
 LkkdGeGspUp8aezMEYS61zYC3VNDM+l0qt3RUfIrIkbW9QjNVdI9nNGxUX9R8R6qIzCA1FYwD2V
 z0/MzrAb
X-Authority-Analysis: v=2.4 cv=J66q7BnS c=1 sm=1 tr=0 ts=68bf2eda cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=GifcLulCTFgA3kaJcUoA:9 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: -a-JjE7oX6sefCONaEBSR5JVW73-rsMY
X-Proofpoint-ORIG-GUID: -a-JjE7oX6sefCONaEBSR5JVW73-rsMY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060038

Sync from mesa commit 04e2140d8be7 ("freedreno/registers: remove python
3.9 dependency for compiling msm").

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/registers/gen_header.py | 157 +++++++++++++-------
 1 file changed, 107 insertions(+), 50 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index 56273a810c1d..16239b754804 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -11,7 +11,6 @@ import collections
 import argparse
 import time
 import datetime
-import re
 
 class Error(Exception):
 	def __init__(self, message):
@@ -31,7 +30,7 @@ class Enum(object):
 	def names(self):
 		return [n for (n, value) in self.values]
 
-	def dump(self):
+	def dump(self, is_deprecated):
 		use_hex = False
 		for (name, value) in self.values:
 			if value > 0x1000:
@@ -45,7 +44,7 @@ class Enum(object):
 				print("\t%s = %d," % (name, value))
 		print("};\n")
 
-	def dump_pack_struct(self):
+	def dump_pack_struct(self, is_deprecated):
 		pass
 
 class Field(object):
@@ -70,11 +69,11 @@ class Field(object):
 			raise parser.error("booleans should be 1 bit fields")
 		elif self.type == "float" and not (high - low == 31 or high - low == 15):
 			raise parser.error("floats should be 16 or 32 bit fields")
-		elif not self.type in builtin_types and not self.type in parser.enums:
+		elif self.type not in builtin_types and self.type not in parser.enums:
 			raise parser.error("unknown type '%s'" % self.type)
 
 	def ctype(self, var_name):
-		if self.type == None:
+		if self.type is None:
 			type = "uint32_t"
 			val = var_name
 		elif self.type == "boolean":
@@ -124,7 +123,7 @@ def field_name(reg, f):
 		name = f.name.lower()
 	else:
 		# We hit this path when a reg is defined with no bitset fields, ie.
-		# 	<reg32 offset="0x88db" name="RB_BLIT_DST_ARRAY_PITCH" low="0" high="28" shr="6" type="uint"/>
+		# 	<reg32 offset="0x88db" name="RB_RESOLVE_SYSTEM_BUFFER_ARRAY_PITCH" low="0" high="28" shr="6" type="uint"/>
 		name = reg.name.lower()
 
 	if (name in [ "double", "float", "int" ]) or not (name[0].isalpha()):
@@ -146,6 +145,18 @@ def indices_strides(indices):
 					"%s(i%d)" % (offset, idx)
 			for (idx, (ctype, stride, offset)) in  enumerate(indices)])
 
+def is_number(str):
+	try:
+		int(str)
+		return True
+	except ValueError:
+		return False
+
+def sanitize_variant(variant):
+	if variant and "-" in variant:
+		return variant[:variant.index("-")]
+	return variant
+
 class Bitset(object):
 	def __init__(self, name, template):
 		self.name = name
@@ -175,11 +186,7 @@ class Bitset(object):
 		print("#endif\n")
 
 		print("    return (struct fd_reg_pair) {")
-		if reg.array:
-			print("        .reg = REG_%s(__i)," % reg.full_name)
-		else:
-			print("        .reg = REG_%s," % reg.full_name)
-
+		print("        .reg = (uint32_t)%s," % reg.reg_offset())
 		print("        .value =")
 		for f in self.fields:
 			if f.type in [ "address", "waddress" ]:
@@ -204,7 +211,7 @@ class Bitset(object):
 
 		print("    };")
 
-	def dump_pack_struct(self, reg=None):
+	def dump_pack_struct(self, is_deprecated, reg=None):
 		if not reg:
 			return
 
@@ -229,12 +236,15 @@ class Bitset(object):
 			tab_to("    uint32_t", "dword;")
 		print("};\n")
 
+		depcrstr = ""
+		if is_deprecated:
+			depcrstr = " FD_DEPRECATED"
 		if reg.array:
-			print("static inline struct fd_reg_pair\npack_%s(uint32_t __i, struct %s fields)\n{" %
-				  (prefix, prefix))
+			print("static inline%s struct fd_reg_pair\npack_%s(uint32_t __i, struct %s fields)\n{" %
+				  (depcrstr, prefix, prefix))
 		else:
-			print("static inline struct fd_reg_pair\npack_%s(struct %s fields)\n{" %
-				  (prefix, prefix))
+			print("static inline%s struct fd_reg_pair\npack_%s(struct %s fields)\n{" %
+				  (depcrstr, prefix, prefix))
 
 		self.dump_regpair_builder(reg)
 
@@ -253,8 +263,8 @@ class Bitset(object):
 				  (prefix, prefix, prefix, skip))
 
 
-	def dump(self, prefix=None):
-		if prefix == None:
+	def dump(self, is_deprecated, prefix=None):
+		if prefix is None:
 			prefix = self.name
 		for f in self.fields:
 			if f.name:
@@ -262,9 +272,9 @@ class Bitset(object):
 			else:
 				name = prefix
 
-			if not f.name and f.low == 0 and f.shr == 0 and not f.type in ["float", "fixed", "ufixed"]:
+			if not f.name and f.low == 0 and f.shr == 0 and f.type not in ["float", "fixed", "ufixed"]:
 				pass
-			elif f.type == "boolean" or (f.type == None and f.low == f.high):
+			elif f.type == "boolean" or (f.type is None and f.low == f.high):
 				tab_to("#define %s" % name, "0x%08x" % (1 << f.low))
 			else:
 				tab_to("#define %s__MASK" % name, "0x%08x" % mask(f.low, f.high))
@@ -286,6 +296,7 @@ class Array(object):
 		self.domain = domain
 		self.variant = variant
 		self.parent = parent
+		self.children = []
 		if self.parent:
 			self.name = self.parent.name + "_" + self.local_name
 		else:
@@ -337,12 +348,15 @@ class Array(object):
 			offset += self.parent.total_offset()
 		return offset
 
-	def dump(self):
+	def dump(self, is_deprecated):
+		depcrstr = ""
+		if is_deprecated:
+			depcrstr = " FD_DEPRECATED"
 		proto = indices_varlist(self.indices())
 		strides = indices_strides(self.indices())
 		array_offset = self.total_offset()
 		if self.fixed_offsets:
-			print("static inline uint32_t __offset_%s(%s idx)" % (self.local_name, self.index_ctype()))
+			print("static inline%s uint32_t __offset_%s(%s idx)" % (depcrstr, self.local_name, self.index_ctype()))
 			print("{\n\tswitch (idx) {")
 			if self.index_type:
 				for val, offset in zip(self.index_type.names(), self.offsets):
@@ -357,7 +371,7 @@ class Array(object):
 		else:
 			tab_to("#define REG_%s_%s(%s)" % (self.domain, self.name, proto), "(0x%08x + %s )\n" % (array_offset, strides))
 
-	def dump_pack_struct(self):
+	def dump_pack_struct(self, is_deprecated):
 		pass
 
 	def dump_regpair_builder(self):
@@ -373,6 +387,7 @@ class Reg(object):
 		self.bit_size = bit_size
 		if array:
 			self.name = array.name + "_" + self.name
+			array.children.append(self)
 		self.full_name = self.domain + "_" + self.name
 		if "stride" in attrs:
 			self.stride = int(attrs["stride"], 0)
@@ -397,25 +412,34 @@ class Reg(object):
 		else:
 			return self.offset
 
-	def dump(self):
+	def reg_offset(self):
+		if self.array:
+			offset = self.array.offset + self.offset
+			return "(0x%08x + 0x%x*__i)" % (offset, self.array.stride)
+		return "0x%08x" % self.offset
+
+	def dump(self, is_deprecated):
+		depcrstr = ""
+		if is_deprecated:
+			depcrstr = " FD_DEPRECATED "
 		proto = indices_prototype(self.indices())
 		strides = indices_strides(self.indices())
 		offset = self.total_offset()
 		if proto == '':
 			tab_to("#define REG_%s" % self.full_name, "0x%08x" % offset)
 		else:
-			print("static inline uint32_t REG_%s(%s) { return 0x%08x + %s; }" % (self.full_name, proto, offset, strides))
+			print("static inline%s uint32_t REG_%s(%s) { return 0x%08x + %s; }" % (depcrstr, self.full_name, proto, offset, strides))
 
 		if self.bitset.inline:
-			self.bitset.dump(self.full_name)
+			self.bitset.dump(is_deprecated, self.full_name)
+		print("")
 
-	def dump_pack_struct(self):
+	def dump_pack_struct(self, is_deprecated):
 		if self.bitset.inline:
-			self.bitset.dump_pack_struct(self)
+			self.bitset.dump_pack_struct(is_deprecated, self)
 
 	def dump_regpair_builder(self):
-		if self.bitset.inline:
-			self.bitset.dump_regpair_builder(self)
+		self.bitset.dump_regpair_builder(self)
 
 	def dump_py(self):
 		print("\tREG_%s = 0x%08x" % (self.full_name, self.offset))
@@ -451,7 +475,7 @@ class Parser(object):
 
 	def prefix(self, variant=None):
 		if self.current_prefix_type == "variant" and variant:
-			return variant
+			return sanitize_variant(variant)
 		elif self.current_stripe:
 			return self.current_stripe + "_" + self.current_domain
 		elif self.current_prefix:
@@ -497,15 +521,22 @@ class Parser(object):
 		return varset
 
 	def parse_variants(self, attrs):
-		if not "variants" in attrs:
+		if "variants" not in attrs:
 				return None
-		variant = attrs["variants"].split(",")[0]
-		if "-" in variant:
-			variant = variant[:variant.index("-")]
 
+		variant = attrs["variants"].split(",")[0]
 		varset = self.parse_varset(attrs)
 
-		assert varset.has_name(variant)
+		if "-" in variant:
+			# if we have a range, validate that both the start and end
+			# of the range are valid enums:
+			start = variant[:variant.index("-")]
+			end = variant[variant.index("-") + 1:]
+			assert varset.has_name(start)
+			if end != "":
+				assert varset.has_name(end)
+		else:
+			assert varset.has_name(variant)
 
 		return variant
 
@@ -569,9 +600,6 @@ class Parser(object):
 				error_str = str(xmlschema.error_log.filter_from_errors()[0])
 				raise self.error("Schema validation failed for: " + filename + "\n" + error_str)
 		except ImportError as e:
-			if self.validate:
-				raise e
-
 			print("lxml not found, skipping validation", file=sys.stderr)
 
 	def do_parse(self, filename):
@@ -640,7 +668,7 @@ class Parser(object):
 		elif name == "domain":
 			self.current_domain = attrs["name"]
 			if "prefix" in attrs:
-				self.current_prefix = self.parse_variants(attrs)
+				self.current_prefix = sanitize_variant(self.parse_variants(attrs))
 				self.current_prefix_type = attrs["prefix"]
 			else:
 				self.current_prefix = None
@@ -648,7 +676,7 @@ class Parser(object):
 			if "varset" in attrs:
 				self.current_varset = self.enums[attrs["varset"]]
 		elif name == "stripe":
-			self.current_stripe = self.parse_variants(attrs)
+			self.current_stripe = sanitize_variant(self.parse_variants(attrs))
 		elif name == "enum":
 			self.current_enum_value = 0
 			self.current_enum = Enum(attrs["name"])
@@ -696,6 +724,13 @@ class Parser(object):
 		elif name == "reg32":
 			self.current_reg = None
 		elif name == "array":
+			# if the array has no Reg children, push an implicit reg32:
+			if len(self.current_array.children) == 0:
+				attrs = {
+					"name": "REG",
+					"offset": "0",
+				}
+				self.parse_reg(attrs, 32)
 			self.current_array = self.current_array.parent
 		elif name == "enum":
 			self.current_enum = None
@@ -711,10 +746,10 @@ class Parser(object):
 				if variants:
 					for variant, vreg in variants.items():
 						if reg == vreg:
-							d[(usage, variant)].append(reg)
+							d[(usage, sanitize_variant(variant))].append(reg)
 				else:
 					for variant in self.variants:
-						d[(usage, variant)].append(reg)
+						d[(usage, sanitize_variant(variant))].append(reg)
 
 		print("#ifdef __cplusplus")
 
@@ -744,6 +779,9 @@ class Parser(object):
 
 		print("#endif")
 
+	def has_variants(self, reg):
+		return reg.name in self.variant_regs and not is_number(reg.name) and not is_number(reg.name[1:])
+
 	def dump(self):
 		enums = []
 		bitsets = []
@@ -757,7 +795,7 @@ class Parser(object):
 				regs.append(e)
 
 		for e in enums + bitsets + regs:
-			e.dump()
+			e.dump(self.has_variants(e))
 
 		self.dump_reg_usages()
 
@@ -773,8 +811,7 @@ class Parser(object):
 
 
 	def dump_reg_variants(self, regname, variants):
-		# Don't bother for things that only have a single variant:
-		if len(variants) == 1:
+		if is_number(regname) or is_number(regname[1:]):
 			return
 		print("#ifdef __cplusplus")
 		print("struct __%s {" % regname)
@@ -825,11 +862,20 @@ class Parser(object):
 			xtravar = "__i, "
 		print("__%s(%sstruct __%s fields) {" % (regname, xtra, regname))
 		for variant in variants.keys():
-			print("  if (%s == %s) {" % (varenum.upper(), variant))
+			if "-" in variant:
+				start = variant[:variant.index("-")]
+				end = variant[variant.index("-") + 1:]
+				if end != "":
+					print("  if ((%s >= %s) && (%s <= %s)) {" % (varenum.upper(), start, varenum.upper(), end))
+				else:
+					print("  if (%s >= %s) {" % (varenum.upper(), start))
+			else:
+				print("  if (%s == %s) {" % (varenum.upper(), variant))
 			reg = variants[variant]
 			reg.dump_regpair_builder()
 			print("  } else")
 		print("    assert(!\"invalid variant\");")
+		print("  return (struct fd_reg_pair){};")
 		print("}")
 
 		if bit_size == 64:
@@ -842,7 +888,7 @@ class Parser(object):
 
 	def dump_structs(self):
 		for e in self.file:
-			e.dump_pack_struct()
+			e.dump_pack_struct(self.has_variants(e))
 
 		for regname in self.variant_regs:
 			self.dump_reg_variants(regname, self.variant_regs[regname])
@@ -877,9 +923,20 @@ def dump_c(args, guard, func):
 	print("#endif")
 	print()
 
+	print("#ifndef FD_NO_DEPRECATED_PACK")
+	print("#define FD_DEPRECATED __attribute__((deprecated))")
+	print("#else")
+	print("#define FD_DEPRECATED")
+	print("#endif")
+	print()
+
 	func(p)
 
-	print("\n#endif /* %s */" % guard)
+	print()
+	print("#undef FD_DEPRECATED")
+	print()
+
+	print("#endif /* %s */" % guard)
 
 
 def dump_c_defines(args):
@@ -896,7 +953,7 @@ def dump_py_defines(args):
 	p = Parser()
 
 	try:
-		p.parse(args.rnn, args.xml)
+		p.parse(args.rnn, args.xml, args.validate)
 	except Error as e:
 		print(e, file=sys.stderr)
 		exit(1)
-- 
2.51.0


