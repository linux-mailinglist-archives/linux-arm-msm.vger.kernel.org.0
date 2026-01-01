Return-Path: <linux-arm-msm+bounces-87152-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B073CED2DB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 01 Jan 2026 17:52:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C6E23004BBA
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Jan 2026 16:52:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7BE023A9B3;
	Thu,  1 Jan 2026 16:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bn3Cy0rR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vtx/AqBi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C327405F7
	for <linux-arm-msm@vger.kernel.org>; Thu,  1 Jan 2026 16:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767286339; cv=none; b=mO6bKgVmgS811nPphOwrEOdERtyW//41nJOc7B0ltQJkCZWrCtdX3kjib3B1aQr3yN/emDzjt3vcY0wVeULdlEYQzzKgg28qsmMzvuXJTtbNJ5wPocSw+PbZhN+OKnfDCZkApUnGXiyKnqFy0+J+0/2Zry6xfedvsg5WBqHLKA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767286339; c=relaxed/simple;
	bh=a5JWEFUUoEctU1Tq6YTrfCwGOZIbFOnWjoPdlGu36+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Pls5pzkpkkBoOUh+S0LcpliNXwbOOKdANd+WSGIAXpMI39Iis6zVaESAmK1CnGpMi41s8YCe4q6MM8BL2z8s3CJEJR9QPjvmEDSjmpqrkEEGMozBmVUAMxv0ukPZlL9g7+DTu027BIgA+9YhDtgg/KR/OZUUSE99G6UEHkU2yN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bn3Cy0rR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vtx/AqBi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 601Cud0R4062673
	for <linux-arm-msm@vger.kernel.org>; Thu, 1 Jan 2026 16:52:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=biRSQRGOPEccSXQjGp3R5E9MVuO6L5CXkX6
	bUT3Vd14=; b=bn3Cy0rRuygZ0YVnu9DE71p9+FdFTlv7vnatn64ifHqqBqHOa7m
	yyJacMlyzNsJE68IFnqaY11gvfJ0+yJHnxm2fxhFlLYft/6+/Bc0OTXfecvHyYwM
	KX4VYM3WS7YSSMpuq09vzpM5c5NthYLxvMT49k+q7Bea8anhTtWzH67d+OkR9PNf
	NCGYYysM+HZX/CfjwapB1CW/FT1X19G63BE0B9v3tmg8XSRruWtz1KlLS7m++RvO
	Y8c0oGxitgomX6sovSObx3suGhvhazrSgYYWz1zB1xa3aNKWKl7Bp2W12G50Nm5x
	4cR7WzIxXEO2Umg0sbcArtxX/+B/OfezDhQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bdsc9ra32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 16:52:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f1f79d6afso163023035ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 01 Jan 2026 08:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767286330; x=1767891130; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=biRSQRGOPEccSXQjGp3R5E9MVuO6L5CXkX6bUT3Vd14=;
        b=Vtx/AqBi0FIA3UQ+3cxekrXeJD+AN5/x3XiubLnTNP07QqIBXHkpDEAVre2c2qtpzx
         TNctu9Dsdf2KIeAOsZNedp8ujNqCgUuNjNb+9amYy21uV/s1Hmmm5eJOIe98EHjyvinx
         Ebktw08QVla6BFqIG5PUd0qqK0ec0S6+8D3o6g5Ooo7LLaHHqQVoVPRbrZ4FQ07XGGxH
         ByizRmYdyfMX2uYhlb/8AGBSo3RjvRNIwgF8N6Nkiz3nnOlsAVnC0HdmXESGeOC5bm2m
         +xyFTzlK2TuXXqDxFAI7A44kDXhewsgEKE4BufAYx2E/PYQrdo+KMv/CkdF3XReys7Sc
         OgFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767286330; x=1767891130;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biRSQRGOPEccSXQjGp3R5E9MVuO6L5CXkX6bUT3Vd14=;
        b=IcSO8IH/1S7bDP2fwE5OWNCs2zfGKaak3asnIB/YXqi6p/gWEzJPuvgZiSYbqePoeL
         FIUiMSBDoiAOsloFiWKQC4yZV/uZGo5sWgWvRFrMjTOeB71I81Q4FIzRy/ywINk+/Ra/
         0S4wwcPKuj7vDimM5zKjs7pghnDV1Y2WXfrsjzkHLTSX/fNvI1+KPn2X1ab9PWl9l7HB
         KOvp4Jt+r963dZ2m7XPBWPOIIIUJ3QxwYUtdp2SuZR0W5/R4Yw6D0drVaU2B4Eq3rblg
         BqAQbgJCBf2LiuDGG/GL6No/v4NGzava33Y/gazYbHokStiK2YnXKWOVP4y+aZzjSi9p
         YWKg==
X-Gm-Message-State: AOJu0Yz4BeRvaNfukLi2hyFJG0tisOgFtOdasYRBn6+DbtVGskurGdLW
	H1NbSpCYiO6kl3G5l/v0I+I3HfKhYER/d8D9M5wV75KY8i6Vk3H/kSRyk+Xg7FRz9ymdrNVr+1L
	kSjo+N2o14VzRx4vCfifJ62j4no3bC6kRGhP/fP9qrZ7/EV3AA0FdD7J/hg3QpEhkZxBp
X-Gm-Gg: AY/fxX5CHEl1jPhkEhWurE6FhoZXuQ+R8cv8HWzg1BbuE39rFd+k9jFX3HhVYET3UYa
	WshkwgQMWOx6nQWxuOTRH5uLBjlqbqood+kkvEPncYeCo4cmYJrlRv5iNWSosO1B5+pOWzMrg3g
	sS06WktRXCYlWZs5XPpjEBZZ353ekc7Kq/NRjm7QvBFSeox9vm9w4EUGsJUHzIs22vpDEHJMIF8
	iLYYDxM1SMT/7ePaorU6BNE5rwWJ0BQYkj8uDGvWLTn29WGpsyC6pv2N+qxOpV/9EfUH9Uo0xeC
	W6LB3PLh0Z6LEGJVY3awm9L5yOKVJGSJEzD5YdfBODb/tlCFjMhTAZ30CjF0AOYSRvjOD6moDiG
	ZT/ixqDquSNc44eVyI55Om/uABg==
X-Received: by 2002:a17:902:cf0b:b0:29e:c2dd:85ea with SMTP id d9443c01a7336-2a2f22049b9mr409899255ad.11.1767286330243;
        Thu, 01 Jan 2026 08:52:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGE25CeuvXnbYvTrpb+hOTUI/tqZ2wBDuitXDTkwjK60iSwEVRdeh7WKVLy6eQxbvkkKI3f7g==
X-Received: by 2002:a17:902:cf0b:b0:29e:c2dd:85ea with SMTP id d9443c01a7336-2a2f22049b9mr409899085ad.11.1767286329683;
        Thu, 01 Jan 2026 08:52:09 -0800 (PST)
Received: from work.. ([120.60.56.77])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c9c0acsm353854135ad.44.2026.01.01.08.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 08:52:09 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mani@kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [RFC PATCH 0/1] soc: qcom: rpmh-rsc: Register s2idle_ops to indicate s2ram behavior in s2idle
Date: Thu,  1 Jan 2026 22:21:57 +0530
Message-ID: <20260101165158.7251-1-manivannan.sadhasivam@oss.qualcomm.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: r06fg8rjZxYoiQgIFRI5naEcp23UZTDh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDE1MiBTYWx0ZWRfX273wNsrRhFdE
 11vfYxvbNd931RNa1wpwvDye25ElhindXt5863TGl/zKyuz0Sjm3ZtPZbH6XHqZ/ZtRIf9hnKYG
 MzjT11LmDZi9HQtPsNe5ZuVFtuYdQxp8VmTRjtYqwPOn/qW7zDGg3J6PGbsAb0RvqEhJSkeaAQY
 KtVBAD/QpdSQ7Wxw8q9a+8bDdJPgMUS4BOLteXs3R45Yp/NRoDvHwEG2xLtZw5xDi3ZggGmrWVR
 kLq10AZa4mTLVofhA3CZwRiPpoQ5h4DQfoAHSAF3I8DguygDOKaKCulap8+MfvBwnoTDX9xuc91
 ssxyhAXkwquDO1rqnvLj4LV7SZaLVgMr52TDoWry93mKFX9x0JeE7LXkDI5VMRQgXYAr+fKYmkO
 ltuTZ2qJbukrMtJ8McBA3LR/roJzsjbnTRlPWEr0uz9Sfd1983629AQDmSBxNM2iGE/2j3BqMIv
 BzUYwiOcFVKvSQ4kNeA==
X-Proofpoint-GUID: r06fg8rjZxYoiQgIFRI5naEcp23UZTDh
X-Authority-Analysis: v=2.4 cv=Hq972kTS c=1 sm=1 tr=0 ts=6956a63b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=8IDmrAvK+qXhUoYjRFLHtA==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Gj2oDkuAWiprFtXQNwUA:9
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_06,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601010152

Hi,

This is just an attempt to let the device drivers know of the quirky platform
behavior of mimicking s2ram in s2idle for older Qcom SoCs (pre-Hamoa and
non-chromebooks) using RPMh. This information is important for the device
drivers as they need to prepare for the possible power loss during system
suspend by shutting down or resetting the devices.

For implementation, s2idle_ops is registered during the boot of the rpmh-rsc
driver based on the machine compatible limited to Makena (SC8280XP) as a
proof-of-concept. If this approach gets consensus, I plan to have a helper
that lists the compatibles of all SoCs exhibiting this behavior. Since there is
no reliable way to find out whether s2idle is the only low power state supported
or not during boot, I resorted to compatible based matching.

One could argue that this s2idle_ops should be registered in the PSCI driver
similar to s2ram [1]. But I didn't prefer that since from PSCI point of view,
only CPUs should be parked in low power states during s2idle (CPU_SUSPEND) and
the peripherals should not be affected. Though in the past, an argument [2] was
raised citing the PSCI spec wording that allows the vendors to implement system
level low power states during CPU_SUSPEND. But that argument was not well
received by the PSCI maintainers.

Moreover, RPMh is the entity that implements the s2ram like deeper low power
state during system suspend. So it made sense to add the ops in this driver.

Note: This series is compile tested only. If one tests this series on Makena
platform, NVMe should get shutdown during suspend as confirmed by the dmesg log
similar to below after resume:

	nvme nvme0: 12/0/0 default/read/poll queues

This series, together with the upcoming PCIe D3Cold support should allow Makena
(and other similar SoCs once added) to enter the deep low power mode a.k.a CXPC.

[1] https://lore.kernel.org/all/20251231162126.7728-1-manivannan.sadhasivam@oss.qualcomm.com
[2] https://lore.kernel.org/all/54cc4221-ba5f-4741-9033-20874265ca01@oss.qualcomm.com

Manivannan Sadhasivam (1):
  soc: qcom: rpmh-rsc: Register s2idle_ops to indicate s2ram behavior in
    s2idle

 drivers/soc/qcom/rpmh-rsc.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

-- 
2.48.1


