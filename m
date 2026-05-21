Return-Path: <linux-arm-msm+bounces-108907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +L+VJUlcDmo4+AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 03:13:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 013ED59D91C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 03:13:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D151D30E1D62
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 01:10:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE1A62C21E6;
	Thu, 21 May 2026 01:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JfS5aHGz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qe2ShC6L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462172BE7AC
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779325806; cv=none; b=UbOGsvgFWbMlF62u1TUnu9eUNKD6zeuxZkHICCRvmKeYHa/hR7KyaNDpXIjwLR4EOrpVJV+eXM1kxVyhIma7D1iHWte5+xIlBDoB5Fteg5/kLjl+ZDw/GX6KRGhi99l/vOCKp81uRhBf4xGpbMYXmk/B/aWw4P0m808CvT/6XwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779325806; c=relaxed/simple;
	bh=fmNJ3KT/7b+xTlpyQgi+5oa7xWoQzjNFF8X5QjQDuXM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p22/kR7Zw1NCqPnQtLX3Hw4vZk7djQXZq0M/Hn5tu7P2hd+cgc/0ry26fFGTLUP2Yqd7q66jPl7dT58D+jJuqNPJbEmNQGFMJWh1GdEbzpfAW/20WDm6yGWXKUiIu2aLRFdiFodvQP4Vf/p9Tjngk+zeTlCR2JhGVXHE2oWn8aQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JfS5aHGz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qe2ShC6L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KJ2Xid3085008
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+hhG8da4DumoUI+vB6A92v5ZtZlBaXWB9NrZWaYMTPc=; b=JfS5aHGz4pyIXxHX
	/A9TPu5pRAWtc692FLEgyrlNO8H4/b/FptWcud+TaT3DPIEYWxg8GKcGTcWIuxQn
	+WhT7NvDDhZK3YgjAY9m6BYMLZzBgI/kvC48cXV3j4wvmKnu7wN9vb8QIuu1I9mJ
	j9x99HG7c3YaK5smLqCI4hIRUfqb3VkA6aSt9ntxGO8m+cIn2VkDPhfwuwGPIA/n
	8pxDL4gpetoQqB4SBDS9w72gg8EEtZZx1QZe8NAkXlqd5FsxF3BOc3nlw3CiO6pz
	0v0JQ79Pt26OPsGD/6ZIRpJNExPpHbARv4zXlUB1UfepvzllLtTBD+itqB2v/Wzn
	luOaSg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9c7f2xfp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 01:10:03 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7cb345d0b29so122331197b3.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 18:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779325803; x=1779930603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hhG8da4DumoUI+vB6A92v5ZtZlBaXWB9NrZWaYMTPc=;
        b=Qe2ShC6LTDT3lk1oiFi1ZODknNlIrOeieDuE2vdSuaPL6EG65LGqWqFw27pj3vwvk7
         luZPdwM+UDLTUYA5+3N20OI9JPgsBW3KNOaI+Z9GORXA3xW8gKQ3k2JmBPSXiPT5w4mP
         zvKSjEIO/iDnaKlUiRfCZIdUf/wRn6WPwaHwR/5Fia6kUAfF91EbKCT8YWL73L+rEy93
         ZB+RmOSTxuFbM+8W1nTq7Tr0JoQmPH2vvD5xxV6ajOVFqBxJtiefz2cc2pkb72Nc/nln
         3aBrl2ZAKpR27TVD+FNrJP9s/M6s8bfeAkKxP/IJNqVq2D/+SodUi2+1GCFQmcAVY/Gm
         GyIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779325803; x=1779930603;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+hhG8da4DumoUI+vB6A92v5ZtZlBaXWB9NrZWaYMTPc=;
        b=XTN+HE7UTBKcMVo5qfG124feHmqYxc3hkWrKZ/SrhbaHPF9ZEZGEMtdB9d/yRYEzzc
         zjTU5Qg+60r7RvwA57nCgkfpMeQw67SGSQWHUOuqZjtRv8K0SkrcaIfPPpAbxaZy9G5j
         vMVPpp9kF9SAHVu+01IT0e12XIttqVYPOnLVoHFJKLJmEvyFNjh5ZKVeTcSMWD7KPfsM
         Ef9npZ2xvdeEUwDOZZoppHeqhzBCZphIemy4EszFxvFCPDKiJneS81NziI335TJ/RJwf
         G/VzIo8OtTZlIEen43PbfCUVVm7DvJabd7pTVzijxwK/630baDapGc3BcPOoejwG2iOU
         gqZA==
X-Gm-Message-State: AOJu0YzYFpc0qmmK7MzimDWQMLxQgXWGEMXlr+FwC7s3Dz2dy8inUrMm
	h/2MOYFPLAvGlTjL+spJioNmxVQ2YAv8cPLT9ws59AJU/foceeng+6I6Ryvz+TmjMd5/B1WPLx8
	dXKqNEX/AW0Euh9/4RzF49T5txyKIX9qimOWqu9c/qxKKP2uACLUNfmPWCBf1QiDatq+GMxuU5H
	Nj
X-Gm-Gg: Acq92OEQpOSvRlKB4NaFMdqlaCldIgD9UBCyMYDd+QsDYLx+Mcxm9HVjMA/+AUuEHpL
	95NhIxsiPmBU+1Nyr8YIAoGWSxfv9ektiwr5G/q3ZklQRu8IGVkfX3SAjRthLgBgdZ/QUscfQV3
	rMws+EwCti1T3btLsCWSp/I/kas+5yRIZW8Sb97/YseV3tcz4GUJ7+sl/+CVd2R7YzagmSv1woP
	OYYHZnRSRr7D2Rqjl3ACesOfE/jA9myQWxPn5aBcKGpmFLTKvwbfMEtiadmg7iKWWW4BrDapA1E
	XFc/ZJzwCg/I5dY7eOYO4CJ7aJ2UiLAhfIwpWGy+o6FY1fjxIx+u6fA++TjC3ktmXmh/BJ5YGIB
	fdc4OCKNor0n5CQlrRe4weCtS6PfB96PMYwmSJ+KUDW8sTtZBPD17HWj/YcSM2JZz0gBFoT42CD
	33wFv/twnsPPZOziM=
X-Received: by 2002:a05:690c:25c9:b0:7b4:3d82:bf6 with SMTP id 00721157ae682-7d20ab9e281mr9263707b3.11.1779325803502;
        Wed, 20 May 2026 18:10:03 -0700 (PDT)
X-Received: by 2002:a05:690c:25c9:b0:7b4:3d82:bf6 with SMTP id 00721157ae682-7d20ab9e281mr9263337b3.11.1779325803021;
        Wed, 20 May 2026 18:10:03 -0700 (PDT)
Received: from scottml-Latitude-7455 (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c98d9sm60851307b3.10.2026.05.20.18.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 18:10:02 -0700 (PDT)
From: Michael Scott <mike.scott@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org
Cc: vkoul@kernel.org, neil.armstrong@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, wesley.cheng@oss.qualcomm.com,
        abelvesa@kernel.org, faisal.hassan@oss.qualcomm.com,
        linux-phy@lists.infradead.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, devicetree@vger.kernel.org, val@packett.cool,
        bryan.odonoghue@linaro.org, laurentiu.tudor1@dell.com,
        alex.vinarskis@gmail.com, linux-kernel@vger.kernel.org,
        Michael Scott <mike.scott@oss.qualcomm.com>
Subject: [PATCH v2 4/4] arm64: dts: qcom: x1-dell-thena: bump linux,cma to 256 MiB
Date: Wed, 20 May 2026 18:09:35 -0700
Message-ID: <20260521010935.1333494-5-mike.scott@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
References: <20260521010935.1333494-1-mike.scott@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=c/ibhx9l c=1 sm=1 tr=0 ts=6a0e5b6c cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=GRacV1d55YfRzDIv3pQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: ImUK49rRioD7fqri3FTYxiAUmgaDJw3S
X-Proofpoint-ORIG-GUID: ImUK49rRioD7fqri3FTYxiAUmgaDJw3S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAwOCBTYWx0ZWRfX8ASssehj84tQ
 J3noSOOSAgOb5pFk0uTU2JFQV+ydBeUdaFMRlpSyK5Yt7TT5ExaVB7PxPjmucOGv3byhVcAXNCi
 NPi59wu0++Ae10QlDnCe1mRGisdPWvg/jdgG6gYKyzK82i89MF1xj7I35Qhx7VmPA2MgpBD2/pn
 m7jFnAERg9r3sUrt1pgjX3QC5Qdb9B1kkDOSB9nZ5jfGt19YkqI7zqT4eZGMC0dbCGK9GFr7tMZ
 DXLyWyGKkCLEtJVgpCw0Ab/td+tWkdutrwVQsv2e5aRt0dGIFGwOEJPFKsufvMEZ0rjxNfRYVex
 B8TWD8jR4cHFjCyq8Ns+sGiwcEJwnTX8xjS9j1iPZiQH3QBd7RV/1APFZxNM6s4/NM+DWf9/EOD
 ObsEXRrSr3v2iKZmyJ1QGYnJAHD6RHFRYITqLD9I/V4ALp3ozhDpIJ9Js/SLvBDCyNPntucLGKU
 b95xQrJZCgLkw6TgWGg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0
 clxscore=1015 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210008
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,packett.cool,dell.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108907-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.scott@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_PROHIBIT(0.00)[0.0.0.10:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 013ED59D91C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The 128 MiB linux,cma reserved-memory pool on dell-thena is too small
to support the camera pipeline in parallel with the normal Linux
desktop. On a freshly-booted system with GNOME running, the typical
runtime consumers — msm DRM framebuffers (Wayland triple buffering on
the eDP panel), qcom_iris video codec buffers, qcom_camss VFE
pre-allocated buffers — already occupy ~100 MiB of the pool, leaving
only ~25 MiB free.

The libcamera "simple" pipeline handler used by /dev/media0 on
dell-thena allocates four ABGR8888 frames at 1920×1088 = 32 MiB total.
That request fails on the fourth frame:

    ERROR DmaBufAllocator: dma-heap allocation failure for frame-3
    ERROR Allocator: Stream is not part of /base/.../camera@10 active configuration
    Can't allocate buffers
    Failed to start camera session

resulting in gnome-snapshot's "Could not play camera stream" and any
other libcamera-mediated app being unable to actually stream.

Bumping linux,cma to 256 MiB (a 0.9% reservation on these laptops'
typical 27 GiB RAM) leaves ~150 MiB free at runtime — sufficient for
the libcamera buffer set plus headroom for video playback or other
CMA-hungry workloads in parallel.

Tested on Dell Latitude 7455: with the 256 MiB pool, CmaFree at
GNOME-desktop idle is ~150 MiB, gnome-snapshot streams the OV02E10
camera cleanly, and `cam -c 1 --capture=2` succeeds.

The companion board files dell-inspiron-14-plus-7441 and the upstream
.dts variants inherit from x1-dell-thena.dtsi, so this changes the
pool size for every dell-thena-based laptop in one place.

Signed-off-by: Michael Scott <mike.scott@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
index d6de4da02dcd..714988a81384 100644
--- a/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-dell-thena.dtsi
@@ -167,7 +167,7 @@ led-camera-indicator {
 	reserved-memory {
 		linux,cma {
 			compatible = "shared-dma-pool";
-			size = <0x0 0x8000000>;
+			size = <0x0 0x10000000>;
 			reusable;
 			linux,cma-default;
 		};
-- 
2.53.0


