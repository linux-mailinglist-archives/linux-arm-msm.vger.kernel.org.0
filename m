Return-Path: <linux-arm-msm+bounces-112303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id emOBLTcFKWq3OwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:33:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5367A666469
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:33:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=bn2ozLG2;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KspwDX5S;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112303-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112303-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 46E8F3070EBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 06:30:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA77376481;
	Wed, 10 Jun 2026 06:30:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D952B376A11
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:30:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781073028; cv=none; b=RLRQuvcOIXf1cSFqbT2s6I8K2B+IjBX5NrHeuFcWHASzEcwznfxl7uwViDfbexveVEfbbMYmTJ4sBbB7l00xx/Gj7IwmuOA3/D5SDM3owEfJ5W4Ixb1NXuynPyn0l9fjgaXGhChEiRS/IffUS3KRmKiqEdO73CVDX0rSS25yrQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781073028; c=relaxed/simple;
	bh=uXvxBqV29dnRWJEGEW3qlSEg81UU7hjiwTjaC3X/PPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t+Ko+XeX2p1ma6hPMcFx0ABSoeiJ+3b+IyxBkSOOENYYxIGbhsa8NpI8oy9ca2Zm1zqmgbravTRCv5z1OWXwECBRICPxeBBpbcbLuVrprQKRuaeqFqOFuI41sjyaEyWykEkdwKf5tHK3jPs8f9Xf6rCSjJAFggXeUFORqRIOyPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bn2ozLG2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KspwDX5S; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A5TADx689979
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FTAIALqBJRf66dVYSvKWnyN0r7BVNV/Albq1Zho5l84=; b=bn2ozLG2Q0OZwFOS
	44BQQmAZoR/awXUtfuJvAFjE3ueINXC5wTUaWgQ7zsLhnBjVetZp1cjXe0PnGmmj
	BZnfGerdibrPKRfUvKrlzfGsqZhB9368UEIT7dOqDsbv2JW0GRYua9nu2iJEUB2K
	6wBZQkGgSnGaZjvVlHEUpRkugWmuOIwPrUNhMX1B5O+cD73b9BAbNpbi98CyrVRm
	Jbq2uWXyB9Da26vtDWV2PvyM6y5cItXVpu8Yv5qQuZjr2rjNYHZ3mcIuA5eP2P8a
	7QK0LO6neJHPghiSaoE6//VjUS5FqCJalWNEcmHrJX3LJ5VrT5DL2n+YgPnLEHZQ
	RNIPlg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg070c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:30:23 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36b7c55406bso4581261a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 23:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781073022; x=1781677822; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FTAIALqBJRf66dVYSvKWnyN0r7BVNV/Albq1Zho5l84=;
        b=KspwDX5SflwY0jtUgXzgp2v5jtU4AXDw+K8KQvN5N4elfl/fewilpeOkMBW0MgqdwI
         17g88Jrp1ntCY6j6+4jOEkycjTpKf0M/bP2mLBFeXltXPqPp6TUoktgYUlaYiKRbxnjf
         Mj0BJodexGAsUynN+p/99vU5cKBBpQpMJ6IZxILDqDfMuOFtV/GIP6woIyFNa3JKXRru
         tQH3N3YEjyMGMj8QzsCfizFHLSPazm0VXBIKO1qRkiLZM1mA147elImIlnXyc55xz1nt
         9B52aGzONBVLVRj4vkkpSnZZE1KRm1NZVsDnO0j/uujZA07zmo+Uy/mK8XMg50fe8B4Q
         CNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781073022; x=1781677822;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FTAIALqBJRf66dVYSvKWnyN0r7BVNV/Albq1Zho5l84=;
        b=MbLOE5PpTGB+jNhb4QgdytzqT+xOHq45xLE7icBv8LlP5qNJAoc1fN5UhLCWeSy42z
         cHJ9ABdKSWOCEsnivPi5hg1qMTJ+LpisVGWWstXaLEPy65wysJ2q3k0lmMXvUL8gFcAu
         suD52AlnhlH+Ev7jggeKfR6KqfZKxrm5LMF8814CBSziqQpvwHXRAtqZnA7ngHlSzzHj
         5E9FRNR7vk7IOgc5Hd4LxaC+lcOqXAsx5AtRWgskcW+y4Yx0ytC6suHIAHYx8ViY1g4m
         YyWhv7LPD6+9E6zRjd+RnKOUCQZbljHSwNbOsFOZMVHszUGH4Yyb+uh7jUm2qx7SWiDi
         U6vQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nDzRiW/K5v3U05OFk95Q6ptdJjnbDE4Asp+JOvmKuAcGfpZfZCpF1HfMkKcmb1YI4gQgIRCtlqXD78jzM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz14BqQQMehXw7m0qUCXuJ+XgmYRpVSDkWrcEo28Eacvdk/iSbY
	6DD+Ksfdq9RJCdtHw20WCjV+3MtQhVFv/fnguo/7VvRt+c/Z2mLsszZP722VrGIaeqTm6JFVUxP
	qV0MnICARSw+OgxaqsgzcvHNP92j+ezyfp9SQ8hsWlyFd4db8XwdXtgBpOhpZxBvCFJ3t
X-Gm-Gg: Acq92OFPwR1AAMwL+KkhyoEKPAYLr/9qM6gWx56+PDKzw9RYA4k1AasYbxKVYYwj37o
	oCBA7FOEvN3EA0aqhcMPlonZiiSRQP7AGbd84mPWl4zFO27ytgJ200cyfk795anhSZ65vzJYINc
	AVoUcvyf9EyK8/ngeucBTRgQzr5wVO6ZXZ8F3LKC1f0WhVj6jEQMZ0aWCe0/Z3gjLw0nuuH4bM2
	gksEgGVoxrZJ5icK/0oqVjqTKByBYNLfHRgHNAcrUKT7gmesZ5gDiIJ6Cb4JwPiuhv23NiKs1Oe
	y64sJl5DbkeIc2R5AA4MNvRoJ9hKVt9VxBwL0G+OguEM80odvwi0RRnLiBD10xYadu/SnuHCzJU
	/xUTPDVIrWCT1ZxUxZxtIPNlFH4ppfI34vpb+93861ThDU5DhMYZUHx8ssy2iV6/8fw==
X-Received: by 2002:a17:90b:390e:b0:368:1064:62f7 with SMTP id 98e67ed59e1d1-370ee33cfabmr25153438a91.6.1781073022550;
        Tue, 09 Jun 2026 23:30:22 -0700 (PDT)
X-Received: by 2002:a17:90b:390e:b0:368:1064:62f7 with SMTP id 98e67ed59e1d1-370ee33cfabmr25153401a91.6.1781073022095;
        Tue, 09 Jun 2026 23:30:22 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f70a2892esm21580420a91.10.2026.06.09.23.30.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 23:30:21 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 11:59:38 +0530
Subject: [PATCH v8 02/12] iommu: Add iris-vpu-bus to iommu_buses
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-glymur-v8-2-1c79b9d51fc0@oss.qualcomm.com>
References: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
In-Reply-To: <20260610-glymur-v8-0-1c79b9d51fc0@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781073002; l=1090;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=dJOak676jq9xOdkTjWpAc2d8f8wOtUNP7aR0VoiKGvo=;
 b=S9EKZEnlUVudfAeNMawwOgx3xZjxEe4Uly9qIotiCiFYLgCm2Xd0BitDRJblxarJ/scgDi4/b
 kltOGKh//x7B2Wl7ZpC/saFu4AKaXr0cCGtMJwTbOZRxNu8agdyHKIG
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: 7nxOHszxCbk8gXu07vIPFXEgiXHPz9at
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a29047f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ZGoT60Gb6PEvP4nDRaMA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA1OSBTYWx0ZWRfX3A4zDff5z24N
 fS8UI4IIsf5KsE8dJnVhInz6uWX8jcVDboMqzg4CvzLF9mZD3zt3a7it9a2fWtAng1Zr1Pql9LT
 WBIc/lDLpjk11HC9olqKb1cfQeX7akDntEctfu7vJ3N57xGMQ2Oh5V/WjCqs8FE6xAm3YdUiPGw
 qxcRG3n45xob0cXgiSLaLrgjKok4iw4lMwUVRDscMauDErsOZ9E2uNGI2nGfKkDWO4dXZ+CZ4iX
 q7PYB7qWEqQtEQQ7Hnpprj52ukggvYkeyC8CXyoZvHw1QQdREcHNCVMKZ9gU2Khdp0GVq8opa+H
 D5A7tDFMYUkFdVyI4qeFfW1Cbl9mUgIu8187ckW4QD7/Eiqnali9NAI6Rjhfs3JSZFON6HJ0LW3
 u61FOoQYtojYdfD8HpbHJJVughpEYIvSolauXTm7Kfmz8hGLUyzaeQVsv67nhvdVUewZ3YHxLT1
 ikLzV2DbWWUl6nzM7mw==
X-Proofpoint-ORIG-GUID: 7nxOHszxCbk8gXu07vIPFXEgiXHPz9at
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100059
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
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-112303-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,linux.dev,kernel.org,8bytes.org,arm.com,gmail.com];
	FORGED_RECIPIENTS(0.00)[m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:abhinav.kumar@linux.dev,m:bod@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mchehab@kernel.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:stanimir.k.varbanov@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:devicetree@vger.kernel.org,m:busanna.reddy@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,m:stanimirkvarbanov@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 5367A666469

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

Add iris_vpu_bus_type to the iommu_buses array in the core IOMMU
subsystem so that the bus notifier callbacks are registered for
device addition and removal events.

Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/iommu/iommu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index e8f13dcebbde..fe51600953ce 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -13,6 +13,7 @@
 #include <linux/bug.h>
 #include <linux/types.h>
 #include <linux/init.h>
+#include <linux/iris_vpu_bus.h>
 #include <linux/export.h>
 #include <linux/slab.h>
 #include <linux/errno.h>
@@ -200,6 +201,9 @@ static const struct bus_type * const iommu_buses[] = {
 #ifdef CONFIG_CDX_BUS
 	&cdx_bus_type,
 #endif
+#ifdef CONFIG_QCOM_IRIS_VPU_BUS
+	&iris_vpu_bus_type,
+#endif
 };
 
 /*

-- 
2.34.1


