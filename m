Return-Path: <linux-arm-msm+bounces-107211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJjDLEaTA2qP7gEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:53:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B02529A01
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 22:53:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 503EE306FE55
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2026 20:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DFF8B3559DF;
	Tue, 12 May 2026 20:53:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0+8gt3U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Nig3SD3m"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB1C3C6A56
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 20:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778619202; cv=none; b=WzKgKFdOZ/jYbXklF+d9G/EoPCFtgrgDundxfzHaPBOElMbt1erfCytX52sClxT0JrL7kDMyXDLCY5Tz+/uHbUPYSREyy7jsSiaTMflJQqyCvicJ63DRTNRK2aFxr1Hfnu2qjnGHiSAPVzFQLqPn1v9Nl9dzZrEPFClzWU0YGE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778619202; c=relaxed/simple;
	bh=VJiP2CNPDm1TaYo847nT6IUtsKmpkr+gErSHMnh5B2w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FCFCsHOv6x+2sl5XqQ7yIGSdRg2VFrVCLHQ30yYxbxaNCAGdxc1JxNmRAJhzCxOYgMtEBnDylqeeZzFp1bN8EzHicZNhr9xfEbRQUrDSzwhgeiU4AaRx3okU9OaToTD2zbglornVQs1hNuu8i1dbVrgP5dlpjXsXCZeP/uv1aI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0+8gt3U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nig3SD3m; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CJJwpT545386
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 20:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=pX6fCL5guQPN0jqgASeMVy
	DoZuNVVH6rixmCIUGHZUo=; b=D0+8gt3U74S5D3ZmyTSp3g20IWNWm7AN8Tfjgr
	k8Zhu1FSrHuHw/F3kvwnNSxvDyq0nYQgCrbjajBH0/6BHpukLzQMiHTtunChQIeQ
	Lkojs3qQW0Qr0GaMqm64il3AahpBzue5gLV/vZGuBUij3NsjZFJlhEQeZvsXsNli
	qflv1MF1TJQH7gXEe28IQ1SCbDIi4FB8ylVGNRrYxUG5KBJDmnUsakeC113VQ+/0
	sgqaDUFJtYZeTMLl9k0vIvpOMjAP/0h6lbiYxeqf8UHkIluKuXF5mt09L+QzHKQl
	zGf80M3XTenGb/y9wVZb47dqJKsvF94XGQ920CG372JQ2ynQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e444sswf5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 20:53:18 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-82f6b984b3aso3106039b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 May 2026 13:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778619198; x=1779223998; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pX6fCL5guQPN0jqgASeMVyDoZuNVVH6rixmCIUGHZUo=;
        b=Nig3SD3m3jcnzJ/VKHLsULIzlG+DqNztVACcPpLMTCDSb//Q78m7jWrwzijOlhXkIW
         UW6Gv93RaqK+um05sr4ot/7VXBAxUbTeCWqkran7yaMkhKGpvO3QaejHsHkHTJjQepdu
         v6BfhnfCJsIO0iR326OxrtZ0iWQ3QxGZOURUsrRcR1YZWrw+eeE7wDCzsWk8EuMDNrij
         Dl1/YOe1G03RX3NbBsGPsvKES9bp3cPTHL5h4il4JrrH7y0TrepzLbl8FfPYBRAjpFXk
         AH9J7ZNTPRh2Zn6ozjjnLFTjoBiH6zg5UuuMFk6zz2Uwz2bmhmo+TkVLC6dt6+Dc7Tkp
         cifw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778619198; x=1779223998;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pX6fCL5guQPN0jqgASeMVyDoZuNVVH6rixmCIUGHZUo=;
        b=m4rfDXVkdpK1wAZtF859F/Au932VOgJXzLXNRj4Q1Q4XFEHpaDmOFk8+VkeQfCT6zO
         O97Pw2yx1kQ4oiasX54zFP92rz9pYbcD+ISaWiDG0djsbND9bumTkNVF9UnxzZaBqjAF
         i0pOip62yuPp0hYnhIrmQchqzOQWIcYIF4+hsFBTU1i8kMo9yxgI2Sa5AFlaASj4AW6P
         Ff/8EyhqrzecBQzouhJCdz9INLrkyXGArc4B5+EOMaVAXusb/wPKQuS45jINr/lttatn
         orgB1NGoXpV8u6FF6zI+sTe+5ldKQjoXlMlgdIC1RTGAZPw4ej3vgOgy3AfuJrqCClYd
         kQtg==
X-Gm-Message-State: AOJu0Yy6sUFZ9LYPxzZ1IsHIIUXkCrGR0QtkVtc7ydvqObo5aDq89Ybx
	Kggl1iwrczaCkoTLe8b2n29Rw2EupiwTFrj+SI4KFsH+OVOImnwBUcbqOyOooLrEzmf7g9MOecy
	wMuL8nOq4gkKIi8oa6/CnqgHXK3pZoOAjb0oM1Iw4UnRfzOLEE0PkZxk1yhhdF8WJCsMG
X-Gm-Gg: Acq92OHzM7yQtVMvWLqNEx0cS7vcZ/p2L0YHbGQqaWlcpnXSgk738dYWMfwuNW3U6v9
	OHxOA+xpLzBQbcRlrZBl8YLfUFC9BaY9CfllpHXqc9XSk+8E4xP2hfuRlHooS2fVkj5FXAMe2PV
	eMiAVSpfBEXN/mZElqwLGxqqUJHd5VZHrtEOCm90f9TbFV8n4OL5opi2uff0MgOBurh/LB5KOnm
	Tzd4I1nwU/u0gouBmwric6hUq+iVl07XV+NjBECRr4Fl4v044DddGReTCghPmA5PaJJw4LbqaJ6
	GyexpkDc07yFX0mpojZSXcL+1UzaewUbIxc8v/3vMVXyj3JdKu/0v0p70/Xpj3Bqhxs4l0pUQHt
	HRWvjwziuUQkY7iTPJGs68T7MUGQEAOFyZJ46U3ON6kJkJw==
X-Received: by 2002:a05:6a00:f90:b0:837:e9cc:d46e with SMTP id d2e1a72fcca58-83f041e5b9bmr273553b3a.21.1778619198251;
        Tue, 12 May 2026 13:53:18 -0700 (PDT)
X-Received: by 2002:a05:6a00:f90:b0:837:e9cc:d46e with SMTP id d2e1a72fcca58-83f041e5b9bmr273530b3a.21.1778619197683;
        Tue, 12 May 2026 13:53:17 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965945c1bsm25453004b3a.15.2026.05.12.13.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:53:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH RFT 0/5] drm/msm: Attach a driver to GMU
Date: Wed, 13 May 2026 02:22:55 +0530
Message-Id: <20260513-gmu-sync-state-fix-v1-0-6e33e6aa9b4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACeTA2oC/y2NQQ7CIBBFr0Jm7RigsdUewAMYd6YLoGOdBbQCb
 TRN7y5Rl+/9/P9XSBSZErRihUgLJx5DAbUT4B4mDITcFwYtdS0PSuHgZ0zv4DBlkwnv/ELraqv
 7ozxVjYJSnCIV/R29weV8he4nIz3ncpD/iTWJ0I3ec27F0uwVRldBt20fugwd85UAAAA=
X-Change-ID: 20260511-gmu-sync-state-fix-bc6b2d809371
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778619192; l=1825;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=VJiP2CNPDm1TaYo847nT6IUtsKmpkr+gErSHMnh5B2w=;
 b=MECga4Q6THIomAzH9r9ubVYJCCSCrw0IBKkCRIDjI/8rWMrorZ5LEuCfoFANEwRYHdsWFRcGz
 vU4k2WpDoZGB0geMjJM94Gb6yVuFz30DhSr1YGhmH/aaKQbaBhuIfsw
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: mvKsno301z3YS3bqwZ-yiHYAHWgCeg-f
X-Authority-Analysis: v=2.4 cv=OcKoyBTY c=1 sm=1 tr=0 ts=6a03933e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=vWiRZQarLoIxHqTZeDoA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: mvKsno301z3YS3bqwZ-yiHYAHWgCeg-f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDIxNCBTYWx0ZWRfX08hAgB5mzl7g
 /sUS0pwavP5yhD2ecIo+ggVXDb+uSfLVAf81d2lrr6ChWVlFFcM1ulia2Tz9YJGxll6B8+gOW3q
 RDydJRW22sCk/TsYoWhyjE52vg1X2gMAiodQgZX9RIAqRcUIXj3F2pqsmROi6CY6j2zmHOONh+n
 w//TIqpFES71aZfJWx4awfhSnCpTeg6a9DStgCYzm7AHbPhuMSENh0WO9W3oJC26rZ/QtGhFgoQ
 ZIcu4e/Yod3pzr6WMjIlHVo6GM7N4b5DW+UG9UJnNU6p0APBU6L0kx/np88eiJO5a8neNsJ9pbh
 HDhArEc3JvVva6VbaUtnxO9coPWVZOfnUzfRkyU/8FFZz3cK+P+z8mdOBVOHJCZeG3e2SCF4W2d
 ZNvldjnv8G5jPapMiaDfoPqL4IYMRwfkMIOkNIdD+NIcSi/vD9XNJShovL3kNGuloC4YUW7H89J
 qoGPRatv36EUnm7FsOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605120214
X-Rspamd-Queue-Id: 75B02529A01
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107211-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

With the introduction of sync_state in the genpd framework, any consumer
device of GCC and GPUCC which is not bound to a driver will result in
bootup warnings like below:

[   24.362666] gcc-kaanapali 100000.clock-controller: sync_state() pending due to 3d37000.gmu
[   24.371210] gxclkctl-kaanapali 3d64000.clock-controller: sync_state() pending due to 3d37000.gmu
[   24.380268] gpucc-kaanapali 3d90000.clock-controller: sync_state() pending due to 3d37000.gmu

To silence these warnings and also to have a proper state in driver core,
attach a driver to the GMU and set it up as a component device for the drm
master device.

The first few patches are preparatory fixes and refactorings. And the
final patch introduces a driver for GMU devices.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (5):
      drm/msm/adreno/a6xx: Mark cxpd device_link as stateless
      drm/msm: Centralize the standalone drm device check for GPU
      drm/msm/adreno: Fix invalid drvdata typecast in adreno_remove()
      drm/msm: Always use component model for standalone GPU
      drm/msm: Attach a driver to the GMU

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 76 ++++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 30 +++++-------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |  3 --
 drivers/gpu/drm/msm/adreno/adreno_device.c | 27 +++++++----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  3 +-
 drivers/gpu/drm/msm/msm_drv.c              | 49 ++++++++++++++-----
 drivers/gpu/drm/msm/msm_drv.h              |  8 ++--
 7 files changed, 143 insertions(+), 53 deletions(-)
---
base-commit: bb1459368dd795c43380057523f571d5eb0ddded
change-id: 20260511-gmu-sync-state-fix-bc6b2d809371

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


