Return-Path: <linux-arm-msm+bounces-104339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OhmKJP0e6mn/ugIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 15:30:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F6E0452ED6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 15:30:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7AA07301CE46
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:30:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14179265CC2;
	Thu, 23 Apr 2026 13:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W83kJCb9";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HnsKjtIQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE95250BEC
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 13:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776951018; cv=none; b=oG84NGsK61CVK7B7DHQoaZ9m+PhO6cWsXOOSorQKTCUixy6546Wfk0CXwWWlfNP5UO3q5sArux0SeFzKUU+ku4K90IvB+soXE3XFQ/Dmwf6JYYici1kd+5EQheyLUGgBO32InC9PJ30zVezfm1hN3Aa6bgdbE/R9/Gn8zMVHVfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776951018; c=relaxed/simple;
	bh=IQk9tf8jtI734WVYY1gXH96FiyZAYSnp0pjs1ZGk6Dw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ABDa0hc9ZRNvBXe5d/KY62+CS4lnv1h/dCZwyCGpkhVzsGcx/dLXdth3P9bL+FkStM43eNZol3H/E11PyPSzUFxRvS1zlRB+hLtE3L3GCm0Uv1YVfcZ5+TijAeY3LxK859e2abmygkcNIYZDdekjArvqEp1uYZ3hklYugPL2j8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W83kJCb9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HnsKjtIQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N94fu22319291
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 13:30:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oFs1RbQ0XkUdAOvZ3WrAthRL+JhVyLKMhXKejRMG50Q=; b=W83kJCb90RXTWXsv
	+N4MsWO5j3J1l018/9HTuTnXyck6N5sO3sEEcmhS6D/J1UM/Numbte+0JLmFIG7Y
	fDB8QyPCUSsSLwS8LDR933AUrLI7bmggaJMItyAr9c89SwvCR68I0DTo74N1nMPR
	mUyAUDvVEp8wWry2YPw3McZb9pj9zoLi+oijVtIH/sCL4RxmiT9PSj5zHM7B96YU
	8Wk+xoeVo6mf5vdmbRsDNU1TM8zC+h2Q0oj+OnIVF4Tb1JyUEKvEI3BRvZWV+Ajz
	1atvVcHB4z+RISev0c0n14GFqxUk7VkRYeozQfZ2qqh1VZnXh5sZqMLtyfM5Peup
	5+72rQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqgfss17n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 13:30:15 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2b2ead99f5dso84212875ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 06:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776951015; x=1777555815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFs1RbQ0XkUdAOvZ3WrAthRL+JhVyLKMhXKejRMG50Q=;
        b=HnsKjtIQp1p0pIkHzGrUR8cXxpLeaEE93TYXK+1K0N7hnVuKIu4UBYjtKCONCRilLy
         pJV0SwGAwRU0kTvEl+Vps3rlVQO27EQ1b7mUzEZygji60mHO8/1crVs2y6DYDEIWJzPt
         dNEbGLWBgssBbFtVU7RF2hwqNDr89FANxN9Yw1wg2sUbf9EvLZs44FVnktDSmGhw1NNH
         MNYGeRTLZlA5i22ohQo5Xe/qPVN9YtgInibaiLh3Upsj0oOjTUdfdqgf62hBjyv9K2CI
         ks3+D5UbGq5v144CZXN4RkzXHCCd3T0YQ4V8nhGanZQ8DGeMN3yTLttZfZcEptqgd5Nm
         qqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776951015; x=1777555815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oFs1RbQ0XkUdAOvZ3WrAthRL+JhVyLKMhXKejRMG50Q=;
        b=cGTZtUoFX+w/BDiZUFPPA5Li4pTOB5/tPMz9Ewr8UJT3lLmMa7xe+BztVzH0sePxd4
         u8dFoNOAM8Pjc9WuOLxuXfep6s+FlMNSh7FYOQ+AdbQdX6kkR4IpurTakQ15eH7yH1OI
         OWqxTKhzccVEyVNv34lGRHDAsJNTBnhSl/iYyFgia65WI4ZSUiV7dld2s5syRqsEQ+dR
         Ls3H05Vo/Wm3F03scuKvXs8bSuUGl2x+29EL+R5dkPH97zUxDb+3FDbHAQy89wpPJ5Wu
         m1yajfNpAwpSkqOXJwENx483CwNjjF+w09q/IDGGDwJw8Y0U5Cg+WfJApIpJe13XK8X3
         NXIA==
X-Forwarded-Encrypted: i=1; AFNElJ9uZZh6KQGj5PF4f7fkRNmz/lKE2ns1GVJ1jNrOiRszJ3vEkoZHuydI7TI5GoVYifP13NThyU2Gxz2GFSQ1@vger.kernel.org
X-Gm-Message-State: AOJu0YxhJnmpuSZgAYsGfKTa2FHYRhsxEuc55dL/cU1T3AnV5S8syauS
	jAPOWvEaxYgyI5rb/bz4sEPcPopS4Vtb/ro554ZbrB1yrlg7IK+/BlxMmNNzrPNtRDcgD18FtJo
	S8wGsYa1+NIXzuZrY07eVFiEf472UNDt3KXPcM0gbbGlYfS9vDws29nlTcSk485sPAVbW
X-Gm-Gg: AeBDievtWZbdeKeT8wRLOnoCmxoGgvOK9XaJpxoI3uTZft/dNu28qif4WJ8hoHd5IIG
	fOYMbAFr7ZKdLy2evSAba64PyjADbe511hhwrHJBysduas/HhmZ7eY7c6ejrSXZ08wK5SAM9p2T
	CsnOn4YCZEhMZsTN/in36VQLoIhsTMKiArOyUEEMvDhzJJxmfDeXVPZIWQLPkfJS5TUOx6r3fLD
	m/QBluUcLYFjkwsjzmlzlq1m1Ich0vA+7ZVdEnv7swhLQKIgvy2+uUbcvD9dCLv0A36Mi+Ya7EK
	M/AIPrOJNeO64Jj8GHCrMJ/80mtr1hexqW3fsaJl1Mthbl4LXSzmWwb/Vf6tdZUHukMoUJ+msFu
	ezqBcARoDRrRL3V3RYj9sZN2zGyDnc6Lr8DDRN3/K1IWHX+xvqsWXYDjrUgxmIdzFjA==
X-Received: by 2002:a17:903:1104:b0:2b4:6529:7b9f with SMTP id d9443c01a7336-2b5f9f37032mr302686815ad.26.1776951014843;
        Thu, 23 Apr 2026 06:30:14 -0700 (PDT)
X-Received: by 2002:a17:903:1104:b0:2b4:6529:7b9f with SMTP id d9443c01a7336-2b5f9f37032mr302686055ad.26.1776951014097;
        Thu, 23 Apr 2026 06:30:14 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cbaasm198795635ad.54.2026.04.23.06.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 06:30:13 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 18:59:31 +0530
Subject: [PATCH v2 02/13] drivers: base: Add generic dma context bus
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-glymur-v2-2-0296bccb9f4e@oss.qualcomm.com>
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
In-Reply-To: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776950985; l=5182;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=m9Ev3cg1dRS/apkqmuIWrlLItkWfgL3nCRaQ+GTJ4d8=;
 b=a0MO/i8o4a8De0o+pVmxc5nct6busfcAWycf0+sRmWbw7J9/KUDBhEJPpZ7lySVphzTFDiOk0
 lCbAAc8uQyBCNukA9WgkyrwbsxQ7npM3UxMTlbG7g7ze+2dYMgz8VVH
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: FrTOaMej_BDxJ_8czUIS7NAyF_Ud_iTR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEzNCBTYWx0ZWRfX3SeDombifa99
 ZMAtmBn9M36apaOrH4BM94GyAYKaUEgzOrxGlYk42tUQGegxmftIIrTMFmqA9U5A7RDWqdkHV9Z
 1qN0hE/Tq4fkbHaqQ84rZkRW/wCqZqlx7CRPVK+pGBYWdk08Zf8cyQARcNoZSfqBqJy628LKA0V
 XDURbuosmYvgWk4U1sMrCZisHr2Ii+Exj9J+/f29U+aBm6Ytsgn1WThoGISdMekyzk05IsMMJ3m
 suoazgPctoEdFayRHVrYJVwLhHir43uYenAWSOmmhAmAnwjbX/VunQ/hINsmcuGwu/eOTrtkc9D
 RwUSyba69+sY8jYXiES+VPTBMnnf3wNdV5RW7E0L4KEyVapOUkNx0GD2DhT/B/nxe64C9lYB2YC
 GeK0zscZ3VQETU0M0LxEz5WjYbMVDpLSIS260/FzfdvDp/7bEVENF19F0I1MbXyrPXw3Aq7ukdI
 Mpc8VmNLIKq5Na0TAxA==
X-Authority-Analysis: v=2.4 cv=AvbeGu9P c=1 sm=1 tr=0 ts=69ea1ee7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=nxtABoNUPiTGfhWLCFsA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: FrTOaMej_BDxJ_8czUIS7NAyF_Ud_iTR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230134
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-104339-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,oss.qualcomm.com,linux.dev,8bytes.org,arm.com,linaro.org,linuxfoundation.org,nvidia.com,gmail.com,ffwll.ch];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MAILSPIKE_FAIL(0.00)[172.232.135.74:server fail];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F6E0452ED6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

When a driver needs to create virtual device at runtime and map it to
an IOMMU context for memory isolation, there is no common bus available
for this purpose. Each driver ends up implementing its own bus type,
leading to duplicated logic across multiple drivers.

host1x driver implemented its own bus type to attach an IOMMU context to
a dynamically created device. The Iris VPU driver now has the same
requirement. Rather than duplicating the same bus logic again, a shared
bus type is introduced under drivers/base that multiple drivers can use
directly.

The bus takes care of creating a device and attaching the IOMMU context
to it based on the client inputs.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/base/Kconfig            |  3 ++
 drivers/base/Makefile           |  1 +
 drivers/base/dma_context_bus.c  | 77 +++++++++++++++++++++++++++++++++++++++++
 include/linux/dma_context_bus.h | 26 ++++++++++++++
 4 files changed, 107 insertions(+)

diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index f7d385cbd3ba..499ea92dd88f 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -4,6 +4,9 @@ menu "Generic Driver Options"
 config AUXILIARY_BUS
 	bool
 
+config DMA_CONTEXT_BUS
+	bool
+
 config UEVENT_HELPER
 	bool "Support for uevent helper"
 	help
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index 8074a10183dc..348e69695e55 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -8,6 +8,7 @@ obj-y			:= component.o core.o bus.o dd.o syscore.o \
 			   topology.o container.o property.o cacheinfo.o \
 			   swnode.o faux.o
 obj-$(CONFIG_AUXILIARY_BUS) += auxiliary.o
+obj-$(CONFIG_DMA_CONTEXT_BUS) += dma_context_bus.o
 obj-$(CONFIG_DEVTMPFS)	+= devtmpfs.o
 obj-y			+= power/
 obj-$(CONFIG_ISA_BUS_API)	+= isa.o
diff --git a/drivers/base/dma_context_bus.c b/drivers/base/dma_context_bus.c
new file mode 100644
index 000000000000..c2ac189ce08d
--- /dev/null
+++ b/drivers/base/dma_context_bus.c
@@ -0,0 +1,77 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/dma_context_bus.h>
+#include <linux/of_device.h>
+
+static atomic_t dma_context_bus_device_id = ATOMIC_INIT(0);
+
+static int dma_context_bus_device_configure(struct device *dev)
+{
+	const u32 *iommu_fid = dev_get_drvdata(dev);
+	struct device_node *of_node = dev->of_node;
+
+	if (!of_node)
+		of_node = dev->parent->of_node;
+
+	return of_dma_configure_id(dev, of_node, true, iommu_fid);
+}
+
+const struct bus_type dma_context_bus_type = {
+	.name = "dma-context-bus",
+	.dma_configure = dma_context_bus_device_configure,
+};
+EXPORT_SYMBOL_GPL(dma_context_bus_type);
+
+static void release_dma_context_bus_device(struct device *dev)
+{
+	kfree(dev);
+}
+
+struct device *create_dma_context_bus_device(struct device *parent_device,
+					     struct device_node *of_node,
+					     u64 dma_mask, const u32 *iommu_fid)
+{
+	struct device *dev;
+	int dev_id, ret;
+
+	dev = kzalloc_obj(*dev);
+	if (!dev)
+		return ERR_PTR(-ENOMEM);
+
+	dev->release = release_dma_context_bus_device;
+	dev->bus = &dma_context_bus_type;
+	dev->parent = parent_device;
+	dev->coherent_dma_mask = dma_mask;
+	dev->dma_mask = &dev->coherent_dma_mask;
+	dev->of_node = of_node;
+
+	dev_id = atomic_inc_return(&dma_context_bus_device_id);
+	dev_set_name(dev, "dma-context-bus-%d", dev_id);
+	dev_set_drvdata(dev, (void *)iommu_fid);
+
+	ret = device_register(dev);
+	if (ret) {
+		put_device(dev);
+		return ERR_PTR(ret);
+	}
+
+	return dev;
+}
+EXPORT_SYMBOL_GPL(create_dma_context_bus_device);
+
+static int __init dma_context_bus_init(void)
+{
+	int err;
+
+	err = bus_register(&dma_context_bus_type);
+	if (err) {
+		pr_err("dma-context-bus registration failed: %d\n", err);
+		return err;
+	}
+
+	return 0;
+}
+postcore_initcall(dma_context_bus_init);
diff --git a/include/linux/dma_context_bus.h b/include/linux/dma_context_bus.h
new file mode 100644
index 000000000000..3d89594fbce4
--- /dev/null
+++ b/include/linux/dma_context_bus.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _LINUX_DMA_CONTEXT_BUS_H
+#define _LINUX_DMA_CONTEXT_BUS_H
+
+#include <linux/device.h>
+
+#ifdef CONFIG_DMA_CONTEXT_BUS
+extern const struct bus_type dma_context_bus_type;
+
+struct device *create_dma_context_bus_device(struct device *parent_device,
+					     struct device_node *of_node,
+					     u64 dma_mask, const u32 *iommu_f_id);
+#else
+static inline struct device *create_dma_context_bus_device(struct device *parent_device,
+							   struct device_node *of_node,
+							   u64 dma_mask, const u32 *iommu_f_id)
+{
+	return NULL;
+}
+#endif
+
+#endif /* _LINUX_DMA_CONTEXT_BUS_H */

-- 
2.34.1


