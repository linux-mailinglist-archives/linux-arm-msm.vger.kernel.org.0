Return-Path: <linux-arm-msm+bounces-108048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCDOD9rjCWo6twQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 17:50:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 866A1562254
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 17:50:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2131B3081AA6
	for <lists+linux-arm-msm@lfdr.de>; Sun, 17 May 2026 15:41:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335D23BD65D;
	Sun, 17 May 2026 15:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I+V9eap6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V7OFEi7y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFEF3C1F57
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 15:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779032412; cv=pass; b=rO6nsbmaNWu2qT0KlIVveosgpqXri6ea/MH5NVlqlq7AXfDUcaNRDqOAu6tR5JtBQciNQucJS2fMSYRThMVBR5R4sC0Xmn5zgfXLKzv28DO3H/KmUJsl6x42+q4zn7bRNWFB+tbiwgAT5rUAtJtQ0cd4iQshMW1f6Na5k+UlGR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779032412; c=relaxed/simple;
	bh=7Rhpuxmxpd0H0fCbmu2ImkrahXGNwJQwF9JObEdxISg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=pxv2prHx4gmltdyuzARNI9cmBlq2dskmkY8VpmgLLZz8+QCalftaKH1Bn6KlMt3+3o0ftgBZ3ryrpnNTmooMLqeTb21rL0KL5DxeakbRtGEv/+V7wmBd0npjD7SnbX2vWNHulG28IE205Xfn+qhZhr2UIesmaeRVSAF44g8i1SI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I+V9eap6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V7OFEi7y; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64H2PjMp2614932
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 15:40:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:reply-to:subject:to; s=qcppdkim1; bh=va65SuP/Ts7eb
	FnyIBmXToIeGwDGd6hztFKbfgaGro8=; b=I+V9eap6BamJ73VRDteMQzQmpcLp1
	SqIJgLbXn7PQfd2cWOkwkRZJ8bhC7QAANAIAKgKHR9evj1uz+HCa5kFJn1ZOfLbH
	oZKylctdFD+oulHNDiXFaih8pcog5J7iaP3vCi4eLhNZ15WFtq6QZblh/MijsBc2
	khkrrz12QukN0k30HJtYeZjTpFFDs01XFNMb75JiIN3zzt/vqtb52LVKA/mGVUri
	idOs9cMZ+flF/LezZ099kULMYtFXxlKloPHF2kW9unurrJM22Nd1cvuM4QPpfKFV
	ocAQux5/FW/UyHqVCNySkGoTqMcQcxHiOIGBioLLhezEQPkd1q3A/wAbA==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvchyxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 15:40:09 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7dbe0e914adso2785932a34.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 17 May 2026 08:40:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779032409; cv=none;
        d=google.com; s=arc-20240605;
        b=CmcNE2GtkpP+wj5315Slk+UgFRD3/TrVFaXDlp4LGpapYJx5Z1s1a0LjoEzdMvURHc
         0iA8O1lUZrM8EuzMCzI0pM+ohFnPZ89H5O3nrHTMRbNS0AMyYLYGiKo6R9R/9t6strbS
         /sz59X5tLp4n/renqDJyVohGQ1tTjfS/YpdAOA9NKQFcblYgZaI9doOL/02+O/6A8Upd
         roY32GDlTRs9/4LCFdgKPpVUQyhsjS5ym6wh8+xxrwCicNGyyUDydY1GhvhDtE4twhT2
         DVbtz8mgDTdLXsJbKYPZhFVrGqgwh6DYtV0lGdeQOd952dgqre21xrNBZuebFVJWnB4j
         w/Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:dkim-signature;
        bh=va65SuP/Ts7ebFnyIBmXToIeGwDGd6hztFKbfgaGro8=;
        fh=PYZ3Dxo+S2C3nXS0F4gtvUNO2y0koQ58RpA5sr3OR/4=;
        b=EARlgxqwUdRRhXqC63HZZSTXejX/RJAU9ZpGIoGusIMA7Kmyxq+g+Y43VHwTu9YDYk
         v/6/apv94hJ+ZUAFhm04hKaITjX9/Y9YMxIHlz1pVfDy4P2lghpB3ZLY9TMEKd73v/Ds
         +29pWEz5dlf2uiXPvFQnzYOfpTW9GqPU465hbrF6V6ftH1xVGjmYlSpbqMTWpx4aFhbP
         jRT4ygtZGxTFVuFvvdB4XavhIBfyjBTZJMzP9vdX9doOl01Vr7Q/nxbQZr2MF5rtlNgN
         CNDsKRAbJV2iq2cgb1GnIG4uC6CZLmS/7mah9xHf66+F5A/TeIN7FF8731s/wVb5keHD
         e8Fw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779032409; x=1779637209; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=va65SuP/Ts7ebFnyIBmXToIeGwDGd6hztFKbfgaGro8=;
        b=V7OFEi7yHdvWb/NuGQUnAL4EpnYvv9SD0fmgBzbrWIll7kl8RExcftAbcmRhfw22MJ
         3fVAJjkkxa0ZhMHd6NDGr+NqDlVwqAJUbEZcZ09N+Fr96PT7MYIqScMvdXsUHifa9dN1
         xFby5UsTa4WARzi740JdFA0/N7j7cACx7MTyDELCku+EWRDVN7Io/RfP30KcLEUZZifX
         m2VBmGJyyImPQUbAE+zYD8x9vDBJbutf5Xf7E/tAW5XcofzdDwCHiNiHmgXB7nb0sisN
         xXpXV6We/y46No8rCk48rxAEPPuFIvxI65Pby8Vs7EArsnlKPH2N9vxhKS1PpZUVFMWM
         TNHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779032409; x=1779637209;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=va65SuP/Ts7ebFnyIBmXToIeGwDGd6hztFKbfgaGro8=;
        b=hUg64moDAEvZ1P8qB+DfeJd2dxiWvu86YI2vhzYsQAF+N3uKhAvOvvdDtPPM/Yq1yK
         8Vhf3bQ64DpacJBNn3UQeTPr30QA8zQq7hE0Uu5PkbcWbOg/jdqIIHa5LH2S3NcBz6M6
         uVEuuoa+IgLlj8BjEIEhMgZKHkG0sAfDwhq6rTtWVAsTtqvUoeOk0c0bshPawjAqLI5f
         40JmcY+29VpZZ9AGVO1bnQUabJG+4LseU1YqHku9j2OjlHOoxWbEjrAJio7IC4Kka+1y
         0iR8t30ul/JQfiqbaw6yMVqHFu5ujm2o4m35PGountWhMtHwrty2H7i23IS4CsiUyo67
         9D7Q==
X-Forwarded-Encrypted: i=1; AFNElJ+0raEzLe/lr5BUXsCfe+kqdTE2z7LJibVmcRMYcxdcd5Eljj/UE8EXkm++OZW9NGj9/+ewc0wNXOn8h8zO@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7ooqCr9SjwKErXP/sD5T1+stnppLxoAIw6u6lI6gZDnvtTonW
	6j3dXfikHRhz8mYxHGiobJmSdP8WnFE47qTGT2M7VvL5DxG6BhpwsRTnyl0HwCTGhzcUt7PdQbe
	6qn9l1PtavFOlkepq0qGnEhWWTEoOID9LgRvvDeI395eT+sCYXBce8mqJKq8BfXSpqca+zQulZb
	EzBvNC1RMAAnz1F+YRwczIS8XwJKw2YtBSb7B1NV4uhw0=
X-Gm-Gg: Acq92OEtpXm6nm3ccVQFwoDCrPeRnfsEDh4m7bEwPy6DKt1ylQf9zMCit9wv418NOTG
	Jd/HOMgo46VEW+F3cJfcIIDevoJNqvKdUHw1TEFc4vwvt8FWO2gXeQJCOeVY1gMCfc2/meay1L9
	s2AiziMgRRguuQQ7VmMw9dJkfNGyasfcm+4NO9fBjkvIj035Ox2CvxliK4TZIkzkqTU2RsRUys/
	BNGG4eUfTSLHbG1ozIW/g+KYNkorIMgRUNGIw==
X-Received: by 2002:a05:6820:290a:b0:686:d107:2856 with SMTP id 006d021491bc7-69c9bfb3b85mr7715044eaf.51.1779032408857;
        Sun, 17 May 2026 08:40:08 -0700 (PDT)
X-Received: by 2002:a05:6820:290a:b0:686:d107:2856 with SMTP id
 006d021491bc7-69c9bfb3b85mr7715028eaf.51.1779032408425; Sun, 17 May 2026
 08:40:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 17 May 2026 08:39:57 -0700
X-Gm-Features: AVHnY4IGMrZqSU_DFTpi4UJULi-CaOTmv8vCqzs3Y-3ZjuVuAOmqPDpr2_BSarA
Message-ID: <CACSVV02cTK7h=d0uqanRE-cj35THDqFjqsTB_2zQV1Mcw77aNw@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2026-05-17 for v7.1-rc5
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <freedreno@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <linux-arm-msm@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: WwPo1y0RBzTY0ZINOZ36a2IQEncF6fLG
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a09e159 cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=e5mUnYsNAAAA:8 a=W0Bhe94nciMH-WOqbJAA:9
 a=QEXdDO2ut3YA:10 a=EyFUmsFV_t8cxB2kMr4A:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: WwPo1y0RBzTY0ZINOZ36a2IQEncF6fLG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE3MDE2OCBTYWx0ZWRfX+bMskFW4suF5
 gNTZqGd18DWxg6HaIERzR86AZBhdcpFxTyMRH6b5mb3ESWtStLCbSGaz0XS1kqDeYeLy4rE8qcB
 dRq2s0zcrh9V061JmZjmwqpEohcC4qip2yMcf9MapqpH/LBSHsIHIDgn8XWCwx/WiuE7FsHbQMo
 eA18VyTFZNgPyX9+avOD0q5CjU+gmc/a/0TFFzIKxmsw9aXCaHrc69qreQ8PPPqkpljydoQg2T8
 NCz4/9PKNUgW8vFlCdc3qB5zXI+L6WtjFgSzwqfXVQn17p6PHpfoc+Zgjyu8uLoVrPHVC1lv5Gk
 mGLhTsve4Qm7jOsF9C3bYEq1tJvcsLXKFq3Svs6c0wvue+/J1DEnU16dE8IBuW1GuvwoBvOylU7
 RQeNyvUOgvm9AKrwzEf4KeCyUUJFWsKKVlIOmTTHqp93yo/cQLQGyZKjAu+HLNEEsM2x+tO89q4
 6/huqUPp8DKn1Cz/bng==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-17_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605170168
X-Rspamd-Queue-Id: 866A1562254
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108048-lists,linux-arm-msm=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,ffwll.ch];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim]
X-Rspamd-Action: no action

Hi Dave, Simona,

Fixes for v7.1 as described below.

The following changes since commit a972d1b864e8efcfda0b387debac8ea2875a182c=
:

  drm/msm: Use of_get_available_child_by_name() (2026-04-01 18:05:05 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2026-05-17

for you to fetch changes up to db339b6bc9f234b4883eb02946ea01d8d9faa11c:

  dt-bindings: display/msm: Fix typo in clock-names property
(2026-05-17 06:33:28 -0700)

----------------------------------------------------------------
Fixes for v7.1:

Core:
- Fixed bindings for SM8650, SM8750 and Eliza
- Don't use UTS_RELEASE directly
- Fix typo in clock-names property

DPU:
- Fixed CWB description on Kaanapali
- Fixed scanline strides for YUV UBWC formats
- Stopped DSI register dumping to access past the end of region

DSI:
- Fix dumping unaligned regions

GPU:
- Fix GMEM_BASE for a6xx gen3
- Fix userspace reachable crash on a2xx-a4xx
- Fix sysprof_active for counter collection with IFPC enabled GPUs
- Fix shrinker lockdep

----------------------------------------------------------------
Alexander Koskovich (1):
      drm/msm: Fix GMEM_BASE for A650

Chen Ni (1):
      drm/msm/a6xx: Check kzalloc return in a8xx_hfi_send_perf_table

Daniel J Blueman (1):
      drm/msm: Fix shrinker deadlock

Dmitry Baryshkov (4):
      drm/msm/dsi: don't dump registers past the mapped region
      drm/msm/dpu: don't mix devm and drmm functions
      drm/msm/adreno: fix userspace-triggered crash on a2xx-a4xx
      drm/msm/snapshot: fix dumping of the unaligned regions

Felix Gu (1):
      drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()

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

Mahadevan P (1):
      drm/msm/dpu: Fix Kaanapali CWB register configuration

Mikko Perttunen (1):
      drm/msm: Fix iommu_map_sgtable() return value check and avoid WARN

Neil Armstrong (1):
      drm/msm/dpu: fix UV scanlines calculation for YUV UBWC formats

Rob Clark (2):
      drm/msm/a6xx: Restore sysprof_active
      drm/msm: Correct modparam description

Uwe Kleine-K=C3=B6nig (The Capable Hub) (1):
      drm/msm: Don't use UTS_RELEASE directly

 .../bindings/display/msm/dp-controller.yaml        | 28 ++++++++++++---
 .../bindings/display/msm/qcom,eliza-mdss.yaml      | 20 ++++++-----
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |  2 +-
 .../bindings/display/msm/qcom,sm8650-mdss.yaml     |  2 +-
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     | 16 +++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  7 ++--
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  2 ++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  8 ++++-
 .../drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        | 12 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  3 +-
 drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c  | 28 ++++++++++-----
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  1 +
 drivers/gpu/drm/msm/msm_gem_shrinker.c             | 40 +++++++++---------=
----
 drivers/gpu/drm/msm/msm_gpu.c                      |  4 +--
 drivers/gpu/drm/msm/msm_iommu.c                    |  5 +--
 17 files changed, 113 insertions(+), 69 deletions(-)

