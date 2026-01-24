Return-Path: <linux-arm-msm+bounces-90392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP8KGG4XdGmQ2AAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 01:50:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 420057BCE0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 01:50:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 5D6F63002F6A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 00:50:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F7A0823DD;
	Sat, 24 Jan 2026 00:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n2oYD9I6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J7gzoRD/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556A84AEE2
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 00:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769215848; cv=pass; b=V1rCX15Dm/ZnaxEKC9hd4Btd7U5fwKabqefrjYeMR9WWRRXGwMQyQbiHemBdt4na1UmV+nlt22S1cNMvhFb6d77aHZxtcd2NyOI74CMSWb3HmaKyKj23oLU63mgHqsWgjuUeKZfuPBDExU1ng60i6Pn+hRNzgeLh16wV2AqtB4Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769215848; c=relaxed/simple;
	bh=6ia/3Mf2qlp7G9bj7oefQHyLsjJQXxoRbCKoEMYYaSA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=S6KhVMOG3rMpumLxdkfmJ/vcW9NEVCSyJ6i+AXYGokbBoMmd3y3dhUL6AIGOa3H9l3tO1weMXwTB+JqzqgvQ2pxokF/xQacj1XiLnSbM6FnUcCvybKUMHHrRxcwn6A2U+SImM3ejvt0lTjunSiuJ1zWr8O/NCgSmou1NZEiPKJU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n2oYD9I6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J7gzoRD/; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60NKCpAH3593101
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 00:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:message-id:mime-version:reply-to
	:subject:to; s=qcppdkim1; bh=E1+ZSn1cNBpOl6A16P9deXIlpfWrf/mBKSm
	0Z7my9Xs=; b=n2oYD9I6D5s5ov1UktADzE9rvuqA3O/usfjhpGe+mp4n1TPP0QV
	EDyha2MRjAmsXL+v1FCOPfOFP+BN13mT2zPWW+QzLRiFHYgpibwv0d1s+Hk2B0/B
	yG0ayswjJ88zds1z0lTXgnOBhi4ZP712sYxoV0v95+hJ4G0uLTE2WeszfogYKocn
	4Gg2VCOR5FAZmol/lfUZjzpkrfAHY9xwQ63QWti3XnVgz+zPet/eGtkPVGNrn61F
	cho0wIKuDnXNxZHzHwkBnDPFc9oOuCEQmviJjTxN0GMZhhJV0tC4K2/1XWIYDPev
	8zxCRgCjUba1z40EUoB/F5gMtuYmvE8EFgw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvftyrh3u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jan 2026 00:50:45 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-11b94abc09dso4258512c88.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Jan 2026 16:50:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769215844; cv=none;
        d=google.com; s=arc-20240605;
        b=g+dLzYXpDYs99A+tHWUBsU3pZCGuWErMbnDe8v9zCmM3BRxEE9SDUih5pmGB75G+i8
         IBa1sFKj7CIh6UcPQxyc8J8f9/S8m++GLczWnng2WsQ3LTuyFzQbfBthzwfstq2GSiYz
         Jwb0oT4TL4/Ykb5siFAy9b1T1APm7HoGXISqeTgmpCXHuoTMw8b5H42nxJs7PqUXlACN
         269YaDBiXUSfLHzcJZuZu7pDohiGzY7LwG2iGLQ4wKO0s9TPhLt2s5ahhVWAiNktPD+/
         9mvxu5Zr/BNSCQxdNRxh9YPECMkCYIvikMZ1AOmaf7dqBsolt+hr0NOa3az0RJsFCm3E
         8i7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version
         :dkim-signature;
        bh=E1+ZSn1cNBpOl6A16P9deXIlpfWrf/mBKSm0Z7my9Xs=;
        fh=O4TBloUfr07wHnDQgkorgg/EDq3AxNEgyPEsptTBN74=;
        b=CEbuH1EL0C2BfRnKnDv9PUJSspduJUUAXD2Yx497oKIGRt4krf2KVYDuF8ZhOSpDeo
         8O8/I8oU75NYkr+EiVWnTet3Xa3g74Uwcg23gNIb9r14v8N+McU7zbt5XR2UMtrV1PZL
         a92Fi6g5GjUpMJDS4cd43n1v7JuUGFF7KI+F41bhAiu3potCxXvMSKkyf71sEiz3Wsx2
         eNPh2fiQ5wEo3E0O9nH9XqzC4SIYUnwpOtBH01QkAVE5oe9bukze1Fbb0Ee8C0S48A54
         GVzJ39IuxlWGSsx8bvbuoe01IsxDr0O1/oFA9gsKSbGEG6ybj1yubWAAjopK0jnYaRrS
         Ed5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769215844; x=1769820644; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E1+ZSn1cNBpOl6A16P9deXIlpfWrf/mBKSm0Z7my9Xs=;
        b=J7gzoRD/fs4o6r2Nxp79Bh3lwLMDA8LuVF8qjfIyv18d5lHoRBqytoAKjYOcBwm+6v
         cTva5qxW0/x0Q933jGdvleVQfLyQWyD1DJp1M3eV7kZWq8G5P6R8OijyvxK/iNcbtU1j
         fQB+6cQsulfvUaLoTSYhHPW4LiWj85zrmiUqkxd8G2h7Ek2JIY7mMJSLQLirP+ZbpO3z
         pnJ7eJzEwaPsUJgHGLPOOV2OKkBwzDOS0+Ti7l80AJZkdNsGPxVW6qlE5eEVXQ3JkiPp
         eUGHI9+AxW7/pO3w1fbZYY4hlVUtXhfoD6DT7VKcRwtkL1HLri4WcshsIh/0BpAg9h3j
         HaUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769215844; x=1769820644;
        h=cc:to:subject:message-id:date:from:reply-to:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=E1+ZSn1cNBpOl6A16P9deXIlpfWrf/mBKSm0Z7my9Xs=;
        b=KZTw4BYdcBH/CtzgHiL8eYCOVr1HWLQstmoNuOPrLfTm+enkTri+vK8CQE6Vt9S6OF
         zEl5c7QR20Gjg1anaoPW3Ytq135gNY4gjgmVL8QEIiWKiztnQyCkJe69ChQyB4vjQ5XM
         UCLSF0wHfLQfzKo8lvn519dAl5UBJyGUby+SOuM0cBN231Hqq2+hpQourojqCP8DSOud
         EQQPlg7KE0CO7u3LL0wkwPFaLbAgZyzn6O6ACiWwRs+PtdmDHCcVr8x8ZBeH5h5VqwFP
         I2uCgE23KJVz2yP69fBHjqRqK/vdIGcfTNHLjJcaYFbX7DOHZgShbeX8i1jgnkbCkqN6
         p64Q==
X-Forwarded-Encrypted: i=1; AJvYcCUxgOvYMd+J+dQsQyA5TX5bW/1mH9vdZ8w9gFlNEnb9vhacvEL3rTfOfa4V4ccw7jG5w945G92oR7KEia3W@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlw7Ma6UmRuGHzHeg9S7qG9/gL/IU3X6SYbNqKrLb4sHbXa2L1
	D2/e3c7EP5XB4Ck6Ha410SQW2qAeTVINTrQkkaX+kWd4v0xH9BZCOA2ZJpWWc8kbzRkibtlwF4r
	FxpoMdN9B7viMdIn4+T1M2wmCzKvauBd5ExpLMYsuUcsAIjQcKqRquXMf4KpL++wZKURdtaThgs
	z2apbZlrN/48jsWXc7RLaAe8JVT3wpCN2Ztnt+0SQ9zSI=
X-Gm-Gg: AZuq6aKW5neAIgIDbQBJ8Q0FFYkC5k9oF31lAwRtTRBS4z9XiNSQh4YHKeJkMz1oOP2
	Ev1Eq2Z8wI0SOUjsoKlX/HaaKJQRRCUxQOiHPCjaZK149lvSjuLJyiXdu8L2mFxVJAmlGY26Jxc
	Hz4I0f3EJmDrhxCnDBcycHQD/fPydLx7ApaizSHCx4JUFSgwYBkaDxMoqUjfygrWSLGWFmqJp1i
	E6aeZcSisvwjNcJj1xGq1Wumg==
X-Received: by 2002:a05:7022:1e05:b0:123:3461:99a4 with SMTP id a92af1059eb24-1247dbaf969mr2236329c88.17.1769215844058;
        Fri, 23 Jan 2026 16:50:44 -0800 (PST)
X-Received: by 2002:a05:7022:1e05:b0:123:3461:99a4 with SMTP id
 a92af1059eb24-1247dbaf969mr2236311c88.17.1769215843483; Fri, 23 Jan 2026
 16:50:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 16:50:32 -0800
X-Gm-Features: AZwV_QhIn6cEGANv6cxLIYIViPvlMi8qso2Zl5jGvvZ3pkrPDHs1ieK9JRyVMmQ
Message-ID: <CACSVV03Sbeca93A+gGh-TKpzFYVabbkWVgPCCicG0_NQG+5Y2A@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2026-01-23 for v6.20
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: "open list:DRM DRIVER for Qualcomm Adreno GPUs" <freedreno@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER for Qualcomm Adreno GPUs" <linux-arm-msm@vger.kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Authority-Analysis: v=2.4 cv=KJxXzVFo c=1 sm=1 tr=0 ts=69741765 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=e5mUnYsNAAAA:8
 a=gUizIwldGzazjyWfi0kA:9 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: H4wPHx5v2KP86tKH_dpwR74btI2BUO0w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDAwNCBTYWx0ZWRfXzUkqEQpXltBu
 3ejiayInXgg9yFRGnsSCq6bM5NivYSKyka6pbMUg8dEfU/FUNygM9KiUpV+GyTx8GgdKW8a1I8N
 epfo0k878zUMZZUU4lTyV/Wf4nBSFHsqpjPMDN7fNEo79Xi5xi6KsLwn2U/5GnQIOyUicjNOTXH
 fQyLewBfj0D12KC4qqgFHBvS+TQik64JN1KmtpvaYwx2yBN/GlBWRkAxoHJ/dLpFbAEn90/i+ql
 5BdLwD98E8w0KP5yWkXoimrc+QZuDq/pxSfKYmG/eI5nZsc70qlo5oTDOytwuBFgrhS9DR08iIc
 lSH34kc02ld9EbWNWxOBPMuWc1pDeY0TBo+IKE2UEiqa/dOVh8U3ol1zKitHWSHamx1qtp+Lj/B
 LE30RPhw2tgkO9gWn9LkJ1u8xRAsWM/A/f3qMRjc1w/WOK+1nAMK/2bFtWLKkr31JeAnio0EVEZ
 x+gqugdAkjw1DVuvqlQ==
X-Proofpoint-GUID: H4wPHx5v2KP86tKH_dpwR74btI2BUO0w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_04,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0
 spamscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240004
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90392-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gitlab.freedesktop.org:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,oss.qualcomm.com:replyto,oss.qualcomm.com:dkim,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 420057BCE0
X-Rspamd-Action: no action

Hi Dave, Simona,

Pull for v6.20, as described below.

Includes display support for Kaanapali (Snapdragon 8 Elite Gen 5),
Gamma support, UBWC updates for a840, and various fixes.  And also
a225 support for those who like very old hardware :-)

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2026-01-23

for you to fetch changes up to 50c4a49f7292b33b454ea1a16c4f77d6965405dc:

  drm/msm/a8xx: Add UBWC v6 support (2026-01-22 01:23:22 +0200)

----------------------------------------------------------------
Changes for v6.20

GPU:
- Document a612/RGMU dt bindings
- UBWC 6.0 support (for A840 / Kaanapali)
- a225 support
- Fixes

DPU:
- Switched to use virtual planes by default
- Fixed DSI CMD panels on DPU 3.x
- Rewrote format handling to remove intermediate representation
- Fixed watchdog on DPU 8.x+
- Fixed TE / Vsync source setting on DPU 8.x+
- Added 3D_Mux on SC7280
- Kaanapali platform support
- Fixed UBWC register programming
- Made RM reserve DSPP-enabled mixers for CRTCs with LMs.
- Gamma correction support

DP:
- Enabled support for eDP 1.4+ link rate tables
- Fixed MDSS1 DP indices on SA8775P, making them to work
- Fixed msm_dp_ctrl_config_msa() to work with LLVM 20

DSI:
- Documented QCS8300 as compatible with SA8775P
- Kaanapali platform support

DSI PHY:
- switched to divider_determine_rate()

MDP5:
- Dropped support for MSM8998, SDM660 and SDM630 (switched over
  to DPU)

MDSS:
- Kaanapali platform support
- Fixed UBWC register programming

----------------------------------------------------------------
Abel Vesa (2):
      Revert "drm/msm/dpu: support plane splitting in quad-pipe case"
      Revert "drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case"

Akhil P Oommen (4):
      drm/msm/a6xx: Retrieve gmu core range by index
      dt-bindings: display/msm: gpu: Simplify conditional schema logic
      dt-bindings: display/msm: gpu: Document A612 GPU
      drm/msm/a8xx: Add UBWC v6 support

Alok Tiwari (1):
      drm/msm/a6xx: move preempt_prepare_postamble after error check

Anna Maniscalco (2):
      drm/msm: add PERFCTR_CNTL to ifpc_reglist
      drm/msm: Fix a7xx per pipe register programming

Ayushi Makhija (3):
      dt-bindings: display: msm-dsi-phy-7nm: document the QCS8300 DSI PHY
      dt-bindings: msm: dsi-controller-main: document the QCS8300 DSI CTRL
      dt-bindings: display: msm: document DSI controller and phy on QCS8300

Brian Masney (1):
      drm/msm/dsi_phy_14nm: convert from divider_round_rate() to
divider_determine_rate()

Dale Whinham (1):
      drm/msm/dp: Enable support for eDP v1.4+ link rates table

Dan Carpenter (1):
      drm/msm: remove some dead code

Dmitry Baryshkov (26):
      drm/msm/dpu: fix WD timer handling on DPU 8.x
      drm/msm/disp: set num_planes to 1 for interleaved YUV formats
      drm/msm/disp: set num_planes and fetch_mode in INTERLEAVED_RGB_FMT
      drm/msm/disp: set num_planes, fetch_mode and tile_height in
INTERLEAVED_RGB_FMT_TILED
      drm/msm/disp: simplify RGB{,A,X} formats definitions
      drm/msm/disp: simplify tiled RGB{,A,X} formats definitions
      drm/msm/disp: pull in common YUV format parameters
      drm/msm/disp: pull in common tiled YUV format parameters
      drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
      drm/msm/dpu: simplify _dpu_format_populate_plane_sizes_*
      drm/msm/dpu: drop redundant num_planes assignment in
_dpu_format_populate_plane_sizes*()
      drm/msm/dpu: rewrite _dpu_format_populate_plane_sizes_ubwc()
      drm/msm/dpu: use standard functions in
_dpu_format_populate_plane_sizes_ubwc()
      drm/msm/dpu: drop intr_start from DPU 3.x catalog files
      drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
      drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
      drm/msm/a2xx: fix pixel shader start on A225
      drm/msm/a2xx: add A225 entry to catalog
      Merge tag 'v6.19-rc1' into msm-next
      drm/msm/mdss: correct HBB programmed on UBWC 5.x and 6.x devices
      drm/msm/dpu: offset HBB values written to DPU by -13
      drm/msm/dpu: program correct register for UBWC config on DPU 8.x+
      drm/msm/dpu: fix SSPP_UBWC_STATIC_CTRL programming on UBWC 5.x+
      drm/msm/dpu: correct error messages in RM
      drm/msm/dpu: try reserving the DSPP-less LM first
      drm/ci: ignore Gamma test failures on Qualcomm SC7180

Evan Lambert (1):
      drm/msm: Replace unsafe snprintf usage with scnprintf

Federico Amedeo Izzo (1):
      drm/msm/dpu: Add DSPP GC driver to provide GAMMA_LUT DRM property

Jie Zhang (1):
      dt-bindings: display/msm/rgmu: Document A612 RGMU

Johan Hovold (1):
      drm/msm/a6xx: fix bogus hwcg register updates

Konrad Dybcio (1):
      dt-bindings: display/msm/gpu: Straighten out reg-names on A619L/610/702

Mahadevan P (1):
      drm/msm/disp/dpu: add merge3d support for sc7280

Mani Chandana Ballary Kuntumalla (1):
      drm/msm/dp: Update msm_dp_controller IDs for sa8775p

Nathan Chancellor (1):
      drm/msm/dp: Avoid division by zero in msm_dp_ctrl_config_msa()

Neil Armstrong (1):
      drm/msm: adreno: fix deferencing ifpc_reglist when not declared

Nikolay Kuratov (1):
      drm/msm/dpu: Add missing NULL pointer check for pingpong interface

Randy Dunlap (19):
      drm/msm/disp: mdp_format: fix all kernel-doc warnings
      drm/msm/dp: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_cdm.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_ctl.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_cwb.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_dsc.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_dspp.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_intf.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_lm.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_merge3d.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_pingpong.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_sspp.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_top.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_vbif.h: fix all kernel-doc warnings
      drm/msm/dpu: dpu_hw_wb.h: fix all kernel-doc warnings
      drm/msm: msm_fence.h: fix all kernel-doc warnings
      drm/msm: msm_gem_vma.c: fix all kernel-doc warnings
      drm/msm: msm_gpu.h: fix all kernel-doc warnings
      drm/msm: msm_iommu.c: fix all kernel-doc warnings

Rob Clark (2):
      drm/msm: Fix x2-85 TPL1_DBG_ECO_CNTL1
      drm/msm: Fix GMEM_BASE for gen8

Swaraj Gaikwad (1):
      drm/msm: Replace custom dumb_map_offset with generic helper

Teguh Sobirin (1):
      drm/msm/dpu: Set vsync source irrespective of mdp top support

Yuanjie Yang (12):
      dt-bindings: display/msm: qcom, kaanapali-dpu: Add Kaanapali
      dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
      dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
      dt-bindings: display/msm: qcom, kaanapali-mdss: Add Kaanapali
      drm/msm/mdss: Add support for Kaanapali
      drm/msm/dsi/phy: Add support for Kaanapali
      drm/msm/dsi: Add support for Kaanapali
      drm/msm/dpu: Add interrupt registers for DPU 13.0.0
      drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
      drm/msm/dpu: Add Kaanapali SSPP sub-block support
      drm/msm/dpu: Add Kaanapali WB support
      drm/msm/dpu: Add support for Kaanapali DPU

 .../bindings/display/msm/dsi-controller-main.yaml  |    7 +
 .../bindings/display/msm/dsi-phy-7nm.yaml          |   31 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |   85 +-
 .../bindings/display/msm/qcom,adreno-rgmu.yaml     |  126 +++
 .../bindings/display/msm/qcom,kaanapali-mdss.yaml  |  297 +++++
 .../bindings/display/msm/qcom,qcs8300-mdss.yaml    |  102 +-
 .../bindings/display/msm/qcom,sm8650-dpu.yaml      |    1 +
 MAINTAINERS                                        |    1 +
 .../xfails/msm-sc7180-trogdor-kingoftown-fails.txt |    4 +
 .../msm-sc7180-trogdor-lazor-limozeen-fails.txt    |    4 +
 drivers/gpu/drm/msm/Makefile                       |    1 +
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c          |   12 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |    5 +-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |   17 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |   14 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   52 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |    1 +
 drivers/gpu/drm/msm/adreno/a6xx_preempt.c          |    4 +-
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |    4 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |    3 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   13 +
 .../drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h |  492 +++++++++
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |    5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |    5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |    5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  124 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |    8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   47 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |    2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |    7 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |  174 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   45 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cdm.h         |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |    3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   84 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_cwb.h         |    3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |   54 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h        |   32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |   89 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   49 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h     |    1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |  180 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  103 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c    |  321 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |    7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |   21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |   18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |   10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h        |   16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  137 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   72 +-
 drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h     | 1155 --------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |  314 ------
 drivers/gpu/drm/msm/disp/mdp_format.c              |  614 ++++++-----
 drivers/gpu/drm/msm/disp/mdp_format.h              |    6 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   80 +-
 drivers/gpu/drm/msm/dp/dp_debug.h                  |    2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |    4 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |    1 +
 drivers/gpu/drm/msm/dp/dp_link.h                   |   12 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   93 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |    8 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   13 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |    2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |    7 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          |   23 +
 drivers/gpu/drm/msm/msm_drv.c                      |   24 +-
 drivers/gpu/drm/msm/msm_fence.h                    |   36 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   49 -
 drivers/gpu/drm/msm/msm_gem.h                      |    3 -
 drivers/gpu/drm/msm/msm_gem_vma.c                  |   13 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |   68 +-
 drivers/gpu/drm/msm/msm_iommu.c                    |    4 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |   12 +-
 drivers/gpu/drm/msm/msm_perf.c                     |   10 +-
 88 files changed, 3051 insertions(+), 2551 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,adreno-rgmu.yaml
 create mode 100644
Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/msm_media_info.h

