Return-Path: <linux-arm-msm+bounces-108902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EPG4Nv5UDmrl9wUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 02:42:38 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F31859D5F7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 02:42:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F162303C4DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 00:37:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B79826E6E1;
	Thu, 21 May 2026 00:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZTAOCRBM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iwYb9qdd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A662727E2
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 00:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779323857; cv=none; b=Ta/ai9xeQDkUC+h3H0rvk4VmJgOTIUcQRVmEbMou6TnRm2WE5+rwwhGZHrh6TCpD/dToRwCVi9j3NG60SW7CEHdeTORej98wflpGrI+QTo392crLqQr4E5KcTkdqUF8e0o+R0IbUKq/LkJg+aP3DmJ4xU7POZSPPc0ACvXmXLEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779323857; c=relaxed/simple;
	bh=QzV+b76g2RwQyA2gVSUbPmh/ADCftQO+Jl1AkmifVoM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FxGGf5pT180OqI6iVYJj7DFsjVRlIY2an9ckrxK7BsLcRbATCCWSPOmou92tYIEXI7OSaw5wHh+2fqm3Nbf4/i/pJvwdGi1ULPIi0mkDHuHDBKNb7skkdzlXb6I3imG/Gd5+IJJwcg0+ySm+lOTcotygEavX15ImOlwwRnXjUgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZTAOCRBM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iwYb9qdd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64KGKRa41178134
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 00:37:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ndtMzgmuY+0pFl9mHos/KMSkAJpI2bJq6DS/PiSdLZw=; b=ZTAOCRBM27immPp6
	oJq01245epfnbyeN788qu8Pw7+bIZRkhdG3VvZj+4TZxjvdrM9yivnrYOEOaQzC0
	t+mBE35auXrggiyT7PigQBLIKotocgzzaMLOyIntUpLT+pKhxhkCT+xlTwHEm95i
	kIENQt9H8NkQURBZ9nz783rUnQMps/JnJRQEI/KM+sGCbal6WY2TmcbdYfWyZo9M
	fhCG3qgkjjtQOfckV0Yi9sMa15Grd9zkNBjmzl7jzBmKVOiveFgEBauTDC0ioVaE
	5x8yUvHrt0D8xrhEEOE8fhRRNPqQw2YMOQm8v0Td13cONUza0oAdqkyHOlc1csRN
	xoRMZA==
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com [74.125.224.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ap6u6kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 00:37:24 +0000 (GMT)
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-65c21049da9so10241017d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 17:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779323843; x=1779928643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ndtMzgmuY+0pFl9mHos/KMSkAJpI2bJq6DS/PiSdLZw=;
        b=iwYb9qddRm0/w4nVgN59Xyl61X207ywTm8fjP6dMbwU2l1CwMytMGGqMurEqlN+5ix
         lO0XYS/49sqLTGZMmT9BiwYIg/DvcWdX/pyChddhZ3VFAW+PBB2qAvB0MqVCexNBpK9w
         Uh7LbS5JMmVEwPUOTb7idM4cB0FWTASP30NxClrcWlfoTETvDm73ID/z/uLH4/ADcWY6
         KYYbXdypTTxFCd/LMh3qGjOA8sVX3Cukg/3Xmq3TP1Uxvf+864FwGbHgMKnxVESYFPGA
         iFvd88kPysvACYA70xINM35/Li6V1n+hjbWDOVvXc1djG4X3f8/Vp6m2YnfJVorKpO2d
         kF9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779323843; x=1779928643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ndtMzgmuY+0pFl9mHos/KMSkAJpI2bJq6DS/PiSdLZw=;
        b=U3Wgu54gkBs8agwkof4Q98PYsCYNsO99ADW/KJF9/rGBox5Y20mhyp6J0e9lHoELuV
         zwGsfHr02efTerogE5oUc8gjLXRqfcihwnwZ7A6/rIvMUJeJfPu6RefTlemhBIBLWi4m
         XDFHiJycGWM0MZbBjhKTnosepT5giV0wffXr22tp91KOgMiNXWPzd+67x5Vo0Dl4ryIz
         NR4EfVpMqhJvnhuxU9I1G24SqgA/r5AoBs9NPwN61uJtx82X1ghtlbCbz4QFAKeKJ9oN
         U8NAZ7411+ovCDMXn5TNpt/SMa3eecVl4TfHl9cw4RFiciLGTAFwNLI1xVp3oFTeG25x
         Xifw==
X-Gm-Message-State: AOJu0YwDr+Khapsca9UwnKVoPuWzbCmlUbmHUtrSF0+qZFyBJao9rRZ1
	dbHENpOVSRvizixD+5Tdrx5eAwLG9xH1nSQUUytwryzV7s/uIZRoxla0Z53w87ShEJhhXzbEGoZ
	UarWv4Wv6hnR+YL3H8eFqmb7Mda4twgJMoEC0GhuFKr1ngtxZ09YY7yLLD4O7wl6gII3Oh5U5TR
	i4
X-Gm-Gg: Acq92OE3JR9ZIdN7JN7w845d6itEjN1uZ5y5g3GoASkMtVkMc3vB1OEDe9PQvAMzLAa
	3VSqYoJiX2o2UDE+O6PxxXyi8zsgM7j7zKousD4j7Z8jAS0W80IY20U3g2dVjLumsjxdj5ORXjI
	QNj//NmsKMj2ukOwaezg3/SaarGMFbCbSjOxLnbMMsPxnZF5p65TGtRIw7XJJRZUkSU2s3zMCCo
	BkwZutSm0EkgqIXmFsfAN9kCUljImSsoO1dIhgVjBPuFfD7Of52JrYW0FonqIhs42E4dNEjVD8t
	ayZmqVQ1uIG4CRxOeZpjkkN/pAlEmdLKCDgRBM9eRoVFCdFcOpfvRxukirwYc95U8KM4GggJkeS
	ilyBgy+027xGFkeqNbQlAKLjkAEXMv5chGARHDUy7nJ+yRxrOOWG+a0JH69sVa74gzU3JUrguxG
	gPhgs3TZkI/GE61EQ=
X-Received: by 2002:a05:690c:6c07:b0:7d0:ef8:6898 with SMTP id 00721157ae682-7d20a6b0832mr8730177b3.14.1779323843240;
        Wed, 20 May 2026 17:37:23 -0700 (PDT)
X-Received: by 2002:a05:690c:6c07:b0:7d0:ef8:6898 with SMTP id 00721157ae682-7d20a6b0832mr8729907b3.14.1779323842866;
        Wed, 20 May 2026 17:37:22 -0700 (PDT)
Received: from scottml-Latitude-7455 (107-198-5-8.lightspeed.irvnca.sbcglobal.net. [107.198.5.8])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7cc991c98d9sm60545717b3.10.2026.05.20.17.37.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 17:37:22 -0700 (PDT)
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
Subject: [PATCH 4/4] arm64: dts: qcom: x1-dell-thena: bump linux,cma to 256 MiB
Date: Wed, 20 May 2026 17:36:15 -0700
Message-ID: <20260521003615.1260844-5-mike.scott@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260521003615.1260844-1-mike.scott@oss.qualcomm.com>
References: <20260521003615.1260844-1-mike.scott@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: KybokThvSckgXX3cZ19VPDUltxifFvAt
X-Proofpoint-ORIG-GUID: KybokThvSckgXX3cZ19VPDUltxifFvAt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDAwMyBTYWx0ZWRfX1fTeItGNAVCB
 +/Tv1d7bdVifu5xWMsVhJjuDH6udaMFt15Z79lWO2tl6G7baitUniUYY7WlKci88n8EVj9gKJG2
 0jiKsljXElvLCKkJ7TtjO4i5q8cPelgFJ/knbAL7vF39sbc5UL7A7/22YTC0fs+WHRq1zpoS1AX
 lDtcmU/pVX82+D6ockDs479IBtuiOGHCg5Vf/lCPoAqo79nl/CGVZeX7UhLrMaO8MfVmf4ugjdV
 pn5EGtsTXI6nzR4/ufkXyQ8XHqzDt20FzTdsDdwOukKHZXzFNF8pN3ZMDBoOsWvJgwfHZDd9cVo
 MMD/5GmWZSLSe4TqfCh7cN7jmh7eGkkgfkA7FPPS8joqYeHHPxObDN/xOqoFK22Fg4hiyeqr5zT
 +aD3y+VwpbIKRhFuB1572/1wzAy3CdpZBE43c++a8Qa69NoSUlJd0JjlSEgP60ijOsY++zhv+gF
 B8xNnlJzYnVqAmP3RPQ==
X-Authority-Analysis: v=2.4 cv=FesHAp+6 c=1 sm=1 tr=0 ts=6a0e53c4 cx=c_pps
 a=S/uc88zpIJVNbziUnJ6G4Q==:117 a=cdagev08qavQYXHyx3V8vg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GRacV1d55YfRzDIv3pQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=nd2WpGr1bMy9NW-iytEl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1011 priorityscore=1501 phishscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210003
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,linaro.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,packett.cool,dell.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-108902-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,0.0.0.10:email,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.scott@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3F31859D5F7
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
index d93b704872b5..7894d96d34ee 100644
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


