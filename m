Return-Path: <linux-arm-msm+bounces-72643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 105D1B49A00
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 21:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEDD34E1737
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 19:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75ABA2BD582;
	Mon,  8 Sep 2025 19:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eVqrTKRB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E572029D273
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 19:30:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757359840; cv=none; b=L0t5vGIgTxrWWkohmOPnyE8lahvwBsP2jFJT0z5q15NOFQzfX91Xbi6BrO6E3Bk6cUhuA141L62iidp4taMeav0xcBepHyitD2mGuSbsXQGInB0hdqCzxkt4C2EOo5eSxTOK2x+OwCp5/8MZ8olYeY/Vt2E5FxvTGrdOQTFqWrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757359840; c=relaxed/simple;
	bh=hFobZUJTfFE70jiuYLP6OG5lQ/kjNoAm0rPhN20c8JY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=K/qSXOJu5N0zA2InUN2POeRxQTMGgiwQFvvCYdrmx/c1uzRUETEZ2cCQAiWMk2m8iYI26+PnKu8KApVXS0+1xyW0k3qtrVv3tO1tyZoMOGHU9IBsnOjP53onz2I8qX+0w7Xerz4/Qw0G+NNShBAJDt4ZFCjC4cby6xnZS4hd1mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eVqrTKRB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588Djioh004745
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 19:30:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=WsTaj9aC5GD
	50Hh4uc9YImnv7c9qgszQr9EnvkcFHK0=; b=eVqrTKRBhlWdtP7W72Uxq6NoiIW
	YQ5p6nq/CK9yXaMQQlgEznwtyPAEChT3Cq7Nw+/roK0elBzPbJjkrzDp3xLZk989
	K++0VQvquJXc0CYtc7TXeZQPid3bLSHCXciECvI+EvDEiKyAOOiS0rD/XyThvD0n
	+sXG2RVyKjERFHJB0kzu9fvevv5aX1+qwf8g6LOdS3Eqb0ECxkOuGciKtae6S6EM
	DjDhwp/74ROdDDohVZXEpT7/N4KT7K4o8uWORMNsWH637gFyrpSg8SBfSXu1FKSb
	f423jRqAadm/zn+NpWpiFsZ7QHcz9uHSRU/lIJBjDC71v+sZh0kFohyEbLQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37t7tk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 19:30:38 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24b2b347073so63112925ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 12:30:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757359837; x=1757964637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WsTaj9aC5GD50Hh4uc9YImnv7c9qgszQr9EnvkcFHK0=;
        b=gDF2X4g3OkOy2UYdZ/7cwoQceVeicZGQ3TCPfgRB6AkCThPSeRinO/U0e87vFtKZX7
         +qkncfUgL4w0McaQ/3DW3WMzEWP3KYBdFjSfy53veGWOUNMCw+m9BNWaFACiTkBLEH6b
         +gTLBdCIWPV45nKJiQeyJ0PF0HeF+mJxAwXKuwNpcLHlHnnYRvazab1bKgw5CteVNMxp
         +1+ilvvpoZqcUUhPIZa/V+XVvWrRcjGdGu5HBURd0J0yW/st58vPr3XthmlUcxElbMZW
         fSsWp4iCP+jWDDaoOvGEx8736AZLYX2FrEab9cjMytV26LL4g1sHxRWEQH9k7cSFt9kc
         ewrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsnQ8Zg49w9C9oiQiXwI2UxmpHVPcqgOoQDFDQ9SuMBKyqx6zfOaUlAykRZm7/c9izrZPTME92Y+Tlm7Z6@vger.kernel.org
X-Gm-Message-State: AOJu0YywlTAo4lGkgErhM+OEonV1oUpyaOsqDZHd+9yEl1WuRE4iM8Dn
	CeagmHk4LB75MXuvXPzSWNRqis3jK2ijzSQeUIlH9hQsKZNp51Q8+XrAUifNaoxBZETdi+7rVJ2
	QrKN5z+w9Bxjxd54qBtxAbf70c9BJaD12POkc1TMZm1B0MFM98f3Ckcyc4SZo0gg5T3/q
X-Gm-Gg: ASbGnctgpoRFdfltIcMcU0uPRyMHAvfaoiWe+iSObT6Dsl3aFXsf/v1Pvrs8chisqzk
	porcj9qoN01F5Gl5VjHTyQAXWvkWWVohxU5KyqvIMBdlfJZcHlBXIIC67ocxDWrlgJ0eigQqIIA
	bRIQcN/4M5HkjsO4oHdo1NBXD+pTgpgtBcuz77ylNveB7ikbY0iy8lv6yUjlOGyprL3AAtsu7vc
	0h5xeiBPF7jOMl6nMbeaMyOjSN8wbHgcq8QChPdcqupzbLaDYBkN7QImSwHhDO9iMinTNx92cJH
	bUfkGmmqkhPAQBVX/pZJ6oQXx5oisU8XfzTTfCS538u26Ye67kA=
X-Received: by 2002:a17:903:19ee:b0:24c:bdf5:d74b with SMTP id d9443c01a7336-2516dfcd7c5mr124311875ad.19.1757359837111;
        Mon, 08 Sep 2025 12:30:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnE8HmdaJ0DQoZXF+EtTS9roT6QVEtH1gZOT81nijuJgDxG0dijPNgZrPVtA0NPjF7Ux7yew==
X-Received: by 2002:a17:903:19ee:b0:24c:bdf5:d74b with SMTP id d9443c01a7336-2516dfcd7c5mr124311505ad.19.1757359836629;
        Mon, 08 Sep 2025 12:30:36 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24cb28c3110sm134810835ad.120.2025.09.08.12.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 12:30:36 -0700 (PDT)
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
Subject: [PATCH 4/5] drm/msm/registers: Generate _HI/LO builders for reg64
Date: Mon,  8 Sep 2025 12:30:07 -0700
Message-ID: <20250908193021.605012-5-robin.clark@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: -5fNC26-dCPiwCU0-WhJAkRQ-hEJsWHT
X-Proofpoint-GUID: -5fNC26-dCPiwCU0-WhJAkRQ-hEJsWHT
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68bf2ede cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=QI1G1A81GPnZtfO3aA0A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX16/ASDL6uUik
 DOSiaQm1UR0a6RFiZQuRzrlZ5pDgKrlLZUwTYHFOxLpZVyg8QtgS6Dyx+qnz8r1uTOv3fgE+uaQ
 qsJuAkgwcENWzkA7mpsgl0+ooLtNJfMcf4MvPTLOI5HjP6wfv00FpuI/cHf0Y1TwSqXV6+21HMg
 CqRA2PoaRVDwc7tS0xAvPDTUmYQupVHZrHDVNHvEjC3HLPNUBVJyTSi6A6F7Vl+K0MjG17Q9NVV
 cbjfPi/LPg1sr4w/Yl+akEu61jLLmp9woY9wlRlU4Rw8J1BiFhGw+SsNGyfiOGCDaP07YSUw/CD
 Cz6IWhxAaR9N1fK/IAAEVILNeYwUI0SQ0i22t55BGO3lc6xwe5dJU2pi0ANFhBGdCMNXE2Lt4Y8
 BtLyogbF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066

The upstream mesa copy of the GPU regs has shifted more things to reg64
instead of seperate 32b HI/LO reg32's.  This works better with the "new-
style" c++ builders that mesa has been migrating to for a6xx+ (to better
handle register shuffling between gens), but it leaves the C builders
with missing _HI/LO builders.

So handle the special case of reg64, automatically generating the
missing _HI/LO builders.

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/registers/gen_header.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/registers/gen_header.py b/drivers/gpu/drm/msm/registers/gen_header.py
index 16239b754804..1d603dadfabd 100644
--- a/drivers/gpu/drm/msm/registers/gen_header.py
+++ b/drivers/gpu/drm/msm/registers/gen_header.py
@@ -161,6 +161,7 @@ class Bitset(object):
 	def __init__(self, name, template):
 		self.name = name
 		self.inline = False
+		self.reg = None
 		if template:
 			self.fields = template.fields[:]
 		else:
@@ -266,6 +267,11 @@ class Bitset(object):
 	def dump(self, is_deprecated, prefix=None):
 		if prefix is None:
 			prefix = self.name
+		if self.reg and self.reg.bit_size == 64:
+			print("static inline uint32_t %s_LO(uint32_t val)\n{" % prefix)
+			print("\treturn val;\n}")
+			print("static inline uint32_t %s_HI(uint32_t val)\n{" % prefix)
+			print("\treturn val;\n}")
 		for f in self.fields:
 			if f.name:
 				name = prefix + "_" + f.name
@@ -645,6 +651,7 @@ class Parser(object):
 
 		self.current_reg = Reg(attrs, self.prefix(variant), self.current_array, bit_size)
 		self.current_reg.bitset = self.current_bitset
+		self.current_bitset.reg = self.current_reg
 
 		if len(self.stack) == 1:
 			self.file.append(self.current_reg)
-- 
2.51.0


