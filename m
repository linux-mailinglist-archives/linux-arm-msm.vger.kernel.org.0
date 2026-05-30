Return-Path: <linux-arm-msm+bounces-110398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mDRNHY/0Gmpf+AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:30:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2AE60D787
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 16:30:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5B702300B8F7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 May 2026 14:30:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 993BA18B0F;
	Sat, 30 May 2026 14:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="apDGgKFg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LgmgPAFv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 109B0C15C
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 14:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780151433; cv=pass; b=Jq3fKaCiux1ZXNRKJSyHzwn9SENSulapKTmNPOVRDE1ApDUsLVz+BU3tMa358S5TZNnfHSXMd3a5ePWj73dnr6mu8Yd+48irOW4YpIJ1WyVTRAeFT5m1ZKnNSXRluJGDQhBvNmsj4e5a8P28HNfUNicvaL2W2XycYIQB1g+2O40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780151433; c=relaxed/simple;
	bh=KUc6E4aBOJfBkb6tq/C3BH9aeaEtbfbAAmqq31c8FwQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WN+7P3uDJ6ak9yREgXRhkB3ArOLi+i6sfd7HpH/ZMNLSd7ltWPKS4prUB7ZBN1+uO7ahgyM1uBFldJK7SI9e4zguaauC9OSS/rZb/b2R9vFeyWhpZXVOKOf7M8Iici7RXbFITAsuRfgFv05SFUdMBnxjOJExlw3FIYWo/Uvl84o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=apDGgKFg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LgmgPAFv; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64UEP1H93121403
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 14:30:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:reply-to:subject:to; s=qcppdkim1; bh=94b4SABWIooMk
	oPG6h1xSaYZTz0yIkKTaXGuZQGnqrU=; b=apDGgKFgmgIcdad8LN3uFv7xgc+GR
	MvCBtRQ0UdziUiVKqKQzG0lHC0ewV5GMNrMU9Sq2lDNU5zl/PA/2I3hUwXta6e4v
	as4aPzsusQxY3zTM3K9SQROCfKCptLpEcoe5K66sOhv48gUgloXIbOW4o12ZqGdt
	GLFOtgz3/AuHPhUPYunTC7W0XN7RpVymu23SX7vJB0ygFY8n1eJGVrWEbozqDFjh
	5XYFb45IxRvpZ9sVZIWNxVsebkgCYlPvGEF3Z6qyeOeRRuXdAhrCKcX0UsDA7fFQ
	tZdsp72SP0qDWYaQnbBFfIB1ZgUFov7QFzKkJ9N9F/WNZRR9se8Wp3bLA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4efxy7r9vm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 14:30:31 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-43b5c0e6ff6so9257825fac.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 May 2026 07:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780151430; cv=none;
        d=google.com; s=arc-20240605;
        b=LRytPLLRpETPf3VTZkK6teXFgk3sqFO3SUuZw5AciYP8leKhbTqBhQY2CPlKpNLdVR
         f6Ovc9heu1Ds+cG4EkZz45wy6ZKQ+nDnrieAN3khQhYU5tvLi2z2iXCAs2c6XSjfCfgE
         MI7dVijNmUqbC9HPJ4ydmEc883XxuCfjovP41Ot1LaLQhcgSSkusx9XjwubKhFwOvMUz
         zTqJszoeC89emzs7hnKLOWn+umJVk6DWsUXGtrX4eiIRpJFNVq+smsPh8RUdB9UnOrFh
         EsbPLpeJ+mK5ZLk+DWx5TaCldvSYd/I6dU2lmUgS2uRvTAhNQZrj/p+DWxxG0hF3clmY
         OhMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:dkim-signature;
        bh=94b4SABWIooMkoPG6h1xSaYZTz0yIkKTaXGuZQGnqrU=;
        fh=D7e5Yqf3giMrgd0/vigYKesL2NWenWLuHFkejkEcI9o=;
        b=Q0nBynMPhzuhSDULcJNEjNZaD0yxsx45TUbhWngoKVR9hRGxMA3HpsVYefTpZJWQnQ
         mJSSZPPtWteHqCXxFWbPF4kcwZ5/VcrH6P+pwDCK31fno50nPVkma/qCTerALX/cB3Th
         28Mtz49euGDun0sjkk2jlh25vR0nJNbompKyRFa3k3W3gVJsh3OM0bafmh6ur3rUbU+t
         iLSouggCxvVTbE+/4D7PIdnqVfEs2ibJhvWLzPeXmYfYirjLMpwHu/1DmDPXo9N48Fj8
         XJ29kCUYPWa7SgpsLJlkRZgxQrydQkZD8/joUCAxqa4QKb8ukQOSo3Wn3oS08vBptXIF
         sioA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780151430; x=1780756230; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=94b4SABWIooMkoPG6h1xSaYZTz0yIkKTaXGuZQGnqrU=;
        b=LgmgPAFvNd/2t3OIa4Oh2QHjD33zWnadmQHw8VMXTeK0Hhk3Oecmlor1z5TZMPGnxN
         NqAYoFT2QhaoSMADIFh5HnCwN/n7gMR6iLbQAp6oefbRaxRAzY8GxpbyEkLuLxZHhW5E
         /1yqGKmuW4zPP9Ml4hx45diq4iRHdMxh1ApT3K4jYGINe3tZBu1Il9i+efszGJwkhqVi
         2sgr5b6MVfyavSSvnjR3mXuo+wgjhd+y9jsZLUzKai73OtVbRD2zD/w4KJyxnHhw8ViT
         ORsn0QzQY34mKGiVgPe/3T0v0YmxqOoXeBHUoFiUwMUSk4SVQdo4DvE4vRQ0O6uwiJnJ
         Y0DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780151430; x=1780756230;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=94b4SABWIooMkoPG6h1xSaYZTz0yIkKTaXGuZQGnqrU=;
        b=stxlxWHlAT1Tpivm65vYkWU9LTx9C4WQ4RaY1sht7PKXneZY95WpsQMf0N+2lJY58s
         K14xA15KcIMyd1yGx5t+d04+eQqbD3LHXibzLBXIT+MoQUg3K7OvbF3j10AmM+477u4C
         gvaD6Qt7ktAHang8MFM1N412Iinpl67FisaVO5WPzuT+ogIo+8MtuKZRt8aVavcyca/q
         RU6KZxmc7Aj3kjTLbcg9lotLgm1vF99wY6pGmc5jiVQyhS7iZBlo3JKnerstSSTvV4Eq
         8Es0V+yxvhL/BQ1LrPdOJIAX4UMGRS3hGrLZKOKzN6Ye5AmVgNw3yJV+nmArkc1JO3rW
         ZRyA==
X-Forwarded-Encrypted: i=1; AFNElJ8rYmoTXTxPCQNrqJa1Wt/t+we3veqG2KuEbvLdGgcCBWiYQwEEYxJFAYkC9PSnvtSLaWLo0y7/CGKsuclU@vger.kernel.org
X-Gm-Message-State: AOJu0YxSH9S3yTU8ZNsQ+kHf9KYRX7cJiBRQ9nV8HgM4C96gxjVBMMP9
	5fAKQIIqs30Qf4ZZeyW4yiJHYkFg76D0vQVLHLMbng/Zaj2FAdkSWpDCkDqhsZ6v24IoxQ2UHIo
	5okNub3loDsVCUr57txFznf6skHpADDT/Bj7u6Osy9/1y4wu4NduubHflLbnjT+nDUu2M/BL8Zg
	UspFKZ4tP410DvJ17n9yNI3/i7qMEIYohxHnG2dnaNuAE=
X-Gm-Gg: Acq92OF/w/G/KLt6HXwzL7n4qmcH8ookiHIrrXE5a0tPGT18Nqd59bgJvAmDolRfK68
	DYOeni/ggJMj288ThcdiuI/cJ6FC/39u3TkeGBlQBpu+tj1/etvsXlo0hr3OHxP+JzMLsfATHIG
	pZ7l9PX9nKeslybRmvKWiHzsVrC+1z2rQW7WlIRDlJ5Prr2NoLonBM4uC1uYNmxSWeHjifHenWI
	+GBkWvqp8eHISa4jOm37yTnDbcdBVRGOyXKzJXljz7nyULS
X-Received: by 2002:a05:6820:1621:b0:69d:e72b:6e11 with SMTP id 006d021491bc7-69e10563f35mr1741773eaf.28.1780151430038;
        Sat, 30 May 2026 07:30:30 -0700 (PDT)
X-Received: by 2002:a05:6820:1621:b0:69d:e72b:6e11 with SMTP id
 006d021491bc7-69e10563f35mr1741766eaf.28.1780151429528; Sat, 30 May 2026
 07:30:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 30 May 2026 07:30:18 -0700
X-Gm-Features: AVHnY4I69VxBE6ImxeNb_L-JHy74X4T7NUKevkyadIKj1fkuh1bi7M6PQGlaGW4
Message-ID: <CACSVV00DXZcvFH2-C3fouve5DGs0DGa-vvsJPuaRmUZZVNKOfg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2026-05-30 for v7.2
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <freedreno@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <linux-arm-msm@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=POg/P/qC c=1 sm=1 tr=0 ts=6a1af487 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Nj4kNrkhgOgHlvf3R2wA:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTMwMDE1NiBTYWx0ZWRfX0QxmpzShltP4
 FElG8/npmjcLNiysMObWHB3Q/8Ojv8QbSwZ6nSJBK1Hbxt38wV8wEcFG/vHOyRBjA4tBKq1kJVd
 9E6DkO0FEE6BUlyZNV4ws8+hCvD3PQhrotcsZEzW7eM3qdFgGrBw0PRSi0Mvahz5mjUAFw4pEBa
 Lhd8YoNrUGtUaEtPQ1638auCbNGu852jrxEiAH6UHzf1StnBSL+jwW+6gJU8Y+yE+9X9VSKKy+o
 gK2LghPbajqN8CM10c5vIt9zcsiHnmQsQco5cRbS2Pzjvf3Woo3auPk8k9cpidjQnIXbU2kEHSz
 dG+yHA0X4d/iqma8NquQm+COxsq1QGNW38k76GRcC2QUzLd/LchALcm/SZhmtItD4W7X4eVrvnm
 RKs0Bvb2In3NwL9i6naaC8XUXHrcGAu994gIWu27HdzYkqcEcePxOTDkNTDaxY8FZn58BsdF1hq
 0Qrf+BY6qv4Eam4WSuQ==
X-Proofpoint-ORIG-GUID: 6OkAtvC135lnBEGb2137kcqmuSbWJZXv
X-Proofpoint-GUID: 6OkAtvC135lnBEGb2137kcqmuSbWJZXv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-30_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605300156
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110398-lists,linux-arm-msm=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,mail.gmail.com:mid,gen_header.py:url]
X-Rspamd-Queue-Id: 7A2AE60D787
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dave, Simona,

Pull for v7.2, as described below.

There is a new ioctl for perfcntr support.  Corresponding mesa MR for that =
is:

  https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/41158

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2026-05-30

for you to fetch changes up to 9a967125427e03c7ebc24d7ad26e9307e8403d4e:

  drm/msm/adreno: add Adreno 810 GPU support (2026-05-29 07:07:31 -0700)

----------------------------------------------------------------
Changes for v7.2

Core:
- Fixed documentation for msm_gem_shrinker functions
- IFPC related enablement/fixes for gen8
- PERFCNTR_CONFIG ioctl support

GPU
- Reworked handling of UBWC configuration
- a810 suppport

MDSS:
- Added Milos platform support
- Reworked handling of UBWC configuration

DisplayPort:
- Reworked HPD handling, preparing for the MST support

DPU:
- Added Milos platform support
- Reworked handling of UBWC configuration

DSI:
- Added Milos platform support

----------------------------------------------------------------
Akhil P Oommen (4):
      drm/msm/a8xx: Make a8xx_recover IFPC safe
      drm/msm/a6xx: Limit GXPD votes to recovery in A8x
      drm/msm/a8xx: Fix RSCC offset
      dt-bindings: display/msm: gpu: Document Adreno X2-185

Alexander Koskovich (7):
      drm/msm: Fix GMEM_BASE for A650
      dt-bindings: display/msm/gmu: Document Adreno 810 GMU
      dt-bindings: display/msm/gpu: Document Adreno 810 GPU
      drm/msm/adreno: rename llc_mmio to cx_misc_mmio
      drm/msm/adreno: set cx_misc_mmio regardless of if platform has LLCC
      drm/msm/a8xx: use pipe protect slot 15 for last-span-unbound feature
      drm/msm/adreno: add Adreno 810 GPU support

Chen Ni (1):
      drm/msm/a6xx: Check kzalloc return in a8xx_hfi_send_perf_table

Daniel J Blueman (1):
      drm/msm: Fix shrinker deadlock

Dmitry Baryshkov (30):
      drm/msm/dsi: don't dump registers past the mapped region
      drm/msm/dpu: don't mix devm and drmm functions
      drm/msm/adreno: fix userspace-triggered crash on a2xx-a4xx
      drm/msm/snapshot: fix dumping of the unaligned regions
      soc: qcom: ubwc: define UBWC 3.1
      soc: qcom: ubwc: define helper for MDSS and Adreno drivers
      soc: qcom: ubwc: add helper controlling AMSBC enablement
      Merge branch
'20260507-ubwc-rework-v4-4-c19593d20c1d@oss.qualcomm.com' of
https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into HEAD
      drm/ci: disable mr-label-maker-test
      drm/msm/mdss: correct UBWC programming sequences
      drm/msm/adreno: use qcom_ubwc_version_tag() helper
      drm/msm/mdss: use qcom_ubwc_version_tag() helper
      drm/msm/adreno: use new helper to set min_acc length
      drm/msm/mdss: use new helper to set min_acc length
      drm/msm/adreno: use new helper to set macrotile_mode
      drm/msm/mdss: use new helper to set macrotile_mode
      drm/msm/mdss: use new helper to set UBWC bank spreading
      drm/msm/adreno: use new helper to set ubwc_swizzle
      drm/msm/dpu: use new helper to set ubwc_swizzle
      drm/msm/mdss: use new helper to set ubwc_swizzle
      drm/msm/adreno: write reserved UBWC-related bits
      drm/msm/adreno: set fp16compoptdis for UBWC 3.0 formats
      drm/msm/adreno: use new helper to set amsbc
      drm/msm/adreno: use version ranges in A8xx UBWC code
      drm/msm/mdss: use new helper to set amsbc
      drm/msm/dpu: drop ubwc_dec_version
      drm/msm/dpu: invert the order of UBWC checks
      drm/msm/dp: drop event data
      drm/msm/dp: turn link_ready into plugged
      drm/msm/dp: clear EDID on display unplug

Felix Gu (1):
      drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()

Jessica Zhang (7):
      drm/msm/dp: fix HPD state status bit shift value
      drm/msm/dp: Fix the ISR_* enum values
      drm/msm/dp: Read DPCD and sink count in bridge detect()
      drm/msm/dp: Move link training to atomic_enable()
      drm/msm/dp: Drop EV_USER_NOTIFICATION
      drm/msm/dp: rework HPD handling
      drm/msm/dp: Add sink_count to debug logs

Konrad Dybcio (1):
      drm/msm/adreno: Trust the SSoT UBWC config

Krzysztof Kozlowski (5):
      dt-bindings: display/msm: dp-controller: Correct SM8650 IO range
      dt-bindings: display/msm: dp-controller: Allow DAI on SM8650 and othe=
rs
      dt-bindings: display/msm: sm8650: Correct VBIF range in example
      dt-bindings: display/msm: sm8750-mdss: Correct DPU and DP ranges
in example
      dt-bindings: display/msm: qcom,eliza-mdss: Correct DPU and DP
ranges in example

Lad Prabhakar (1):
      dt-bindings: display/msm: Fix typo in clock-names property

Luca Weiss (7):
      dt-bindings: display: msm-dsi-phy-7nm: document the Milos DSI PHY
      dt-bindings: display: msm-dsi-controller-main: document the
Milos DSI Controller
      dt-bindings: display: msm: document the Milos DPU
      dt-bindings: display: msm: document the Milos Mobile Display Subsyste=
m
      drm/msm/dsi: add support for DSI-PHY on Milos
      drm/msm: mdss: Add Milos support
      drm/msm/dpu: Add Milos support

Mahadevan P (1):
      drm/msm/dpu: Fix Kaanapali CWB register configuration

Mikko Perttunen (1):
      drm/msm: Fix iommu_map_sgtable() return value check and avoid WARN

Nathan Chancellor (1):
      drm/msm: Restore second parameter name in purge() and evict()

Neil Armstrong (1):
      drm/msm/dpu: fix UV scanlines calculation for YUV UBWC formats

Rob Clark (18):
      drm/msm/a6xx: Restore sysprof_active
      drm/msm: Correct modparam description
      drm/msm: Remove obsolete perf infrastructure
      drm/msm: Allow CAP_PERFMON for setting SYSPROF
      drm/msm/adreno: Sync registers from mesa
      drm/msm/registers: Sync gen_header.py from mesa
      drm/msm/registers: Add perfcntr json
      drm/msm: Add a6xx+ perfcntr tables
      drm/msm: Add sysprof accessors
      drm/msm/a6xx: Add yield & flush helper
      drm/msm: Add per-context perfcntr state
      drm/msm: Add basic perfcntr infrastructure
      drm/msm/a6xx+: Add support to configure perfcntrs
      drm/msm/a8xx: Add perfcntr flush sequence
      drm/msm: Add PERFCNTR_CONFIG ioctl
      drm/msm/a6xx: Increase pwrup_reglist size
      drm/msm/a6xx: Append SEL regs to dyn pwrup reglist
      drm/msm/a6xx: Allow IFPC with perfcntr stream

Uwe Kleine-K=C3=B6nig (The Capable Hub) (1):
      drm/msm: Don't use UTS_RELEASE directly

 .../bindings/display/msm/dp-controller.yaml        |   28 +-
 .../bindings/display/msm/dsi-controller-main.yaml  |    2 +
 .../devicetree/bindings/display/msm/gmu.yaml       |   30 +
 .../devicetree/bindings/display/msm/gpu.yaml       |   19 +
 .../bindings/display/msm/qcom,eliza-mdss.yaml      |   20 +-
 .../bindings/display/msm/qcom,milos-mdss.yaml      |  286 +++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |    3 +-
 .../bindings/display/msm/qcom,sm8650-mdss.yaml     |    2 +-
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     |   16 +-
 .../devicetree/bindings/phy/qcom,dsi-phy-7nm.yaml  |    1 +
 drivers/gpu/drm/ci/gitlab-ci.yml                   |    4 +
 drivers/gpu/drm/msm/Makefile                       |   29 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |    7 -
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   16 -
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |    3 -
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   27 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  298 +++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   89 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  363 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   30 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |    2 +
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          |    2 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |  104 +-
 drivers/gpu/drm/msm/adreno/a8xx_preempt.c          |    2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |   10 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   19 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   10 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h |  279 +++
 .../drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |   12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   29 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |    1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   39 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |    3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |    3 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  |   28 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   16 -
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |    1 -
 drivers/gpu/drm/msm/dp/dp_display.c                |  722 +++----
 drivers/gpu/drm/msm/dp/dp_display.h                |    3 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |   63 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |    2 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |    8 +
 drivers/gpu/drm/msm/dp/dp_panel.h                  |    2 +
 drivers/gpu/drm/msm/dp/dp_reg.h                    |    4 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |    2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |   23 +
 drivers/gpu/drm/msm/msm_debugfs.c                  |    6 -
 drivers/gpu/drm/msm/msm_drv.c                      |    2 +-
 drivers/gpu/drm/msm/msm_drv.h                      |   13 +-
 drivers/gpu/drm/msm/msm_gem_shrinker.c             |   40 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |  123 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |  104 +-
 drivers/gpu/drm/msm/msm_iommu.c                    |    5 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |  125 +-
 drivers/gpu/drm/msm/msm_perf.c                     |  235 ---
 drivers/gpu/drm/msm/msm_perfcntr.c                 |  670 +++++++
 drivers/gpu/drm/msm/msm_perfcntr.h                 |  155 ++
 drivers/gpu/drm/msm/msm_ringbuffer.h               |    2 +
 drivers/gpu/drm/msm/msm_submitqueue.c              |    3 +-
 .../drm/msm/registers/adreno/a2xx_perfcntrs.json   |  109 +
 drivers/gpu/drm/msm/registers/adreno/a3xx.xml      |    8 +-
 drivers/gpu/drm/msm/registers/adreno/a5xx.xml      |  141 +-
 .../drm/msm/registers/adreno/a5xx_perfcntrs.json   |  128 ++
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 1300 ++++++------
 .../drm/msm/registers/adreno/a6xx_descriptors.xml  |   71 +-
 .../gpu/drm/msm/registers/adreno/a6xx_enums.xml    |    3 +
 .../drm/msm/registers/adreno/a6xx_perfcntrs.json   |  112 ++
 .../drm/msm/registers/adreno/a7xx_perfcntrs.json   |  228 +++
 .../drm/msm/registers/adreno/a8xx_descriptors.xml  |   96 +-
 .../drm/msm/registers/adreno/a8xx_perfcntrs.json   |  241 +++
 .../drm/msm/registers/adreno/a8xx_perfcntrs.xml    | 1929 ++++++++++++++++=
++
 .../gpu/drm/msm/registers/adreno/adreno_common.xml |   42 +
 .../gpu/drm/msm/registers/adreno/adreno_pm4.xml    |   50 +-
 drivers/gpu/drm/msm/registers/gen_header.py        | 2079 +++++++++++-----=
----
 include/linux/soc/qcom/ubwc.h                      |   22 +
 include/uapi/drm/msm_drm.h                         |   48 +
 80 files changed, 7624 insertions(+), 3133 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,milos-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_2_milos.h
 delete mode 100644 drivers/gpu/drm/msm/msm_perf.c
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.c
 create mode 100644 drivers/gpu/drm/msm/msm_perfcntr.h
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a2xx_perfcntrs.jso=
n
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a5xx_perfcntrs.jso=
n
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a6xx_perfcntrs.jso=
n
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a7xx_perfcntrs.jso=
n
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.jso=
n
 create mode 100644 drivers/gpu/drm/msm/registers/adreno/a8xx_perfcntrs.xml

