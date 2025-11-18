Return-Path: <linux-arm-msm+bounces-82356-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA50C6A43D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 16:16:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D59154F3A2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 15:07:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C24733596ED;
	Tue, 18 Nov 2025 15:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o1BE7OeW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MRys/AYp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABD2328619
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763478442; cv=none; b=EeZQiYFr7qJt6h8M+SSGIJub39PJfjcfZCXpGYaU/YKeOQLVGnUvFZHDsGniIg2IAyj3wrjfWfkeC4uDY/tVGY5cbJU1XLiXzGecrjNaRukLkYNxFm2rUj4uRrV8P2sk/35DePoEb/TV+DvhUxgeDaQHtScR1kEYY38tdt5U96s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763478442; c=relaxed/simple;
	bh=VXGbY1KhCuCPwRs8I3ovmJpc4pdc4DeTIUuoDHQosdg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m2SNwU+OXo+DuQvgswK/5n4EktFM7jppn4L1FzHxc7meiFENfWXkLAd84gp7jjaWAPns8YyfuHURV5xMtooBxr1T8O4o5FcvSJq3ECE4XTkr59JPmLwN74eCzlLJwrEyj0RtQhR6VU2i9pP3nlF+cCG4fjZkBFJejmlTlgtI1XE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o1BE7OeW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MRys/AYp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAPRE3027645
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:07:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=B8mN/GmjCsBG0594TCA5PjjHjg1VtzMRNYw
	pzS6EVWg=; b=o1BE7OeWrWuG5/+UmIahCqeT249CIiRgTZqGP/9UbC8XDo2aK11
	EPHXxoWfw+vM98ijbrfNKR4+jk7AKTiMIuJ89L8k1Qzru5xwUhwNbgIQpX0TQH0w
	ELAiG/Rqck0TbhoIGHF3x5+TyPudc7dgPrjGo8Imh4afgGfsgsE0KWoaMZppE8k3
	dnikibjEod+hLGj5cpaxJvsfFtSVz7QL5zFFDhMK6b3lC0n/hCf9bJo1zz57jUkW
	syTfwoMWuLvk5WD+GbuNPo/nv6vmW90xT6+wRT0MYwImop1U6Lk8m4lxk4/Y50vB
	jX+/uuTUBk8qLLUmevmTMG7hgOm4CAM0jCg==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ag77t3g1c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 15:07:20 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b895b520a2so5625190b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 07:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763478440; x=1764083240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B8mN/GmjCsBG0594TCA5PjjHjg1VtzMRNYwpzS6EVWg=;
        b=MRys/AYpUmKDCX79Vd/KyYOlS+OXb+hfZg+2wWUACvoKJdn91m/8vJE/hepUmZduhX
         AAPAFXllQUhOMh/AHWPLUXx8igPrK4wYttl0wog4+vkbu155YipuUjiDJlmTvIlVTm+B
         lb2nXid0uGiubjGhwI7TGVnFbKWYv43/hgqNrG/FoEeqndpY2Z8TYfN4+fmFpeAjGnFl
         Ygfj2jAVviAhLDARYNIwRi4Lal4TRh6QCeC98+TNlie4D2NpWfY7xySrKH15E/0ke+dg
         JMWBnGhxOg124uvXPM2GLueysFnUixFeJrtyjeuP9F4mMp3fJ0nNZ4FGQENfeexlOAit
         3x8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763478440; x=1764083240;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B8mN/GmjCsBG0594TCA5PjjHjg1VtzMRNYwpzS6EVWg=;
        b=qI0B5zogupCS3w7xBhf92reg9fa4hMSLFWJPCZ9C4NoU1ns7BF2tldxq415UoNkxxE
         hotVd5hLBT9bGqcgHV/ZOWuo09uOcqzOP9il4n0oK4fafMj8+F/PagN5TWJ8AFwyElFn
         yrG8hjTjWGcX5waY3d90aSyuw+gS4I/MnrM1SVd1cD4CIoOqsKeg/guUguMXYgcm/iqX
         2cqpHwUh8uvV00vgOP3a76cwpqfiQGoroj6XhGy1D+wHfQjHcyaf+OrEecLoAqJsU8Xc
         mogfepLVHHm8unZ17dda8COs0lFpE1nhT8fwQaZDdgBLO6e/X0LU4Ur8KFQJfqpvLFT/
         zuig==
X-Gm-Message-State: AOJu0YzEumHg212pL8T//RumxZcrMscXU0gM9xMXD1hfdwrjUOgslf7z
	fJYydxeUgTlpW1LpFN+hjrfcPmT7iVGvx3IBIfxNaPw8hrYuN/9BJkvhEpa0/qZkAEhSd8gVUXb
	gW8TYWCSgH3gs2S4sX4lmiK0WxA8OhpG9H3jaXwdrF7a7MduBlGYC2lt4sbFlGhAHq1Cb
X-Gm-Gg: ASbGncsjtTkXq4dHdDNhh9lhL5kw/oAwQj7E5kWqhDwZbr8jlMuz+hZreh+p5BzBkHP
	CFyDP3Sjm9r8T+mQvX6D3pGuKSYhdt5WJdyHmx27VnXCBiDkPE9HhKdlLjrwRtsYbHFYuSThLsp
	Z1olm0bHzCMYksXBKa2/hwVEq0s9PAvgq9Zj0TWqQWwOfSP5gwU3owgUwgoqXmKUeKl7VWFaCSK
	zNrBvAZ9kdb4xfh6rM/fHJqqUgQ6Vg5tQOJE9TfoKv/XXAzsSQcQ+6liE+xBVFaEFoqisaIwtbh
	cwOyYvQcxN/6OH+1c9jDKslAHzA8p58zStTJxmFD4pblbdZnWNkYvEDSHdeO6TwNFEqUckv1uAA
	ppWbJgh2VYEGpAHNI4hFDD2WShIW/mPKa/qzmDx4yxxtA2wSuKrrpFoe+
X-Received: by 2002:a05:6a00:1703:b0:772:4319:e7df with SMTP id d2e1a72fcca58-7ba3c66bd52mr18596383b3a.30.1763478439479;
        Tue, 18 Nov 2025 07:07:19 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEN8v25wkXWT1nNh0+Q/Q5NPaq5o0aKvp1i2kqJK/B168hXAA16+kV6/H29MM4NOga7YqBAhw==
X-Received: by 2002:a05:6a00:1703:b0:772:4319:e7df with SMTP id d2e1a72fcca58-7ba3c66bd52mr18596314b3a.30.1763478438733;
        Tue, 18 Nov 2025 07:07:18 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b921cb6f44sm16942993b3a.0.2025.11.18.07.07.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 07:07:18 -0800 (PST)
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
Subject: [PATCH] drm/msm/registers: Fix encoding fields in 64b registers
Date: Tue, 18 Nov 2025 07:07:12 -0800
Message-ID: <20251118150715.201623-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDEyMSBTYWx0ZWRfX0jQwg9U+aCuC
 18zg3wT7qNg1Ql1r04RddyuwZoan2X+z4wcveOX5Lo2lPJBLCUqMZ4ey5EvGu0266J7PsPTurhx
 OaoDupI/JToeIjkpnulc5/NEuHPjE8fUzks1YBBxZ+Ukf/bTEIroIyE2JSa7PoQtw6zKHtF8mNB
 IU5wen6yENPfgqdysA6jYhlq0jYpC/mDIMZhWZzFu9gXjWbjsWXQobWVJ1bler+zqzurRR/ZPZu
 mTzkdfWGh7rGQJDFoEghE1WMUtxp+vcVMTompsT5mFidwh54U+i7lumLX6gsvRAIU0exaqrKpiR
 hUd9KGv5rXHivJjYtVkEwzVptu+i5HSAowiYILH/dvxZIA7jaPTqgn+oiGJMgIcvLj+eAN9Fvoc
 /4RoLwyFsJs3GJZjMRoXnyrsPXtxCw==
X-Authority-Analysis: v=2.4 cv=EPoLElZC c=1 sm=1 tr=0 ts=691c8ba8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=19Wyn7e3V/0aNffMjNCMQw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=OSLXHSMv42BtIwkUFNYA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: i9NW2z-9jgvpoQ8n_kt8gey3UEoU7c5k
X-Proofpoint-GUID: i9NW2z-9jgvpoQ8n_kt8gey3UEoU7c5k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511180121

Based on mesa commit 3f70b0578402 ("freedreno/registers: Fix encoding
fields in 64b registers"), but with some fixes to not skip emitting
interrupt enum values.

Co-developed-by: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/registers/gen_header.py | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index 1d603dadfabd..54a08d4a0ae7 100644
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
@@ -264,10 +265,10 @@ class Bitset(object):
 				  (prefix, prefix, prefix, skip))
 
 
-	def dump(self, is_deprecated, prefix=None):
+	def dump(self, is_deprecated, prefix=None, reg=None):
 		if prefix is None:
 			prefix = self.name
-		if self.reg and self.reg.bit_size == 64:
+		if reg and self.reg and self.reg.bit_size == 64:
 			print("static inline uint32_t %s_LO(uint32_t val)\n{" % prefix)
 			print("\treturn val;\n}")
 			print("static inline uint32_t %s_HI(uint32_t val)\n{" % prefix)
@@ -283,14 +284,16 @@ class Bitset(object):
 			elif f.type == "boolean" or (f.type is None and f.low == f.high):
 				tab_to("#define %s" % name, "0x%08x" % (1 << f.low))
 			else:
-				tab_to("#define %s__MASK" % name, "0x%08x" % mask(f.low, f.high))
+				tab_to("#define %s__MASK" % name, "0x%08xull" % mask(f.low, f.high))
 				tab_to("#define %s__SHIFT" % name, "%d" % f.low)
 				type, val = f.ctype("val")
+				ret_type = "uint64_t" if reg and reg.bit_size == 64 else "uint32_t"
+				cast = "(uint64_t)" if reg and reg.bit_size == 64 else ""
 
-				print("static inline uint32_t %s(%s val)\n{" % (name, type))
+				print("static inline %s %s(%s val)\n{" % (ret_type, name, type))
 				if f.shr > 0:
 					print("\tassert(!(val & 0x%x));" % mask(0, f.shr - 1))
-				print("\treturn ((%s) << %s__SHIFT) & %s__MASK;\n}" % (val, name, name))
+				print("\treturn (%s(%s) << %s__SHIFT) & %s__MASK;\n}" % (cast, val, name, name))
 		print()
 
 class Array(object):
@@ -437,7 +440,7 @@ class Reg(object):
 			print("static inline%s uint32_t REG_%s(%s) { return 0x%08x + %s; }" % (depcrstr, self.full_name, proto, offset, strides))
 
 		if self.bitset.inline:
-			self.bitset.dump(is_deprecated, self.full_name)
+			self.bitset.dump(is_deprecated, self.full_name, self)
 		print("")
 
 	def dump_pack_struct(self, is_deprecated):
-- 
2.51.1


