Return-Path: <linux-arm-msm+bounces-66347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B73B0FACA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 21:10:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BC2EB1CC3233
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 19:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0734D233727;
	Wed, 23 Jul 2025 19:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hfvOE8gd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A3AB230D1E
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 19:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753297741; cv=none; b=sYRrqP1PocPXHGfTlWF0oOGD0epGUKzqXNsUKWQr9eYUJJNoCfz/zg1Q1PFNH8SSaomQ5H8HLNI9H38V+lljGw0ndZcjTNEMbrha8Wj1eLdGvR8bNa0Lmh6cjCv/LwsxU1KGGoomY5HiPGoPUcX7pSudgyixBvCqQ7mf5IrjbW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753297741; c=relaxed/simple;
	bh=b/0hdwnIExOMVb085Qt8bnoZiQN/Vv7BIVCGqQZH8r4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HkSEnKWSb58SwxUXrdTou60FU8zptcdX0f1B4toe+lA+9jX+YhMv7plUW7ZbmTzbYI5RnkWaOe1MItszZES6c+Tqf4yK4mqDJI6cr5URNjx8U96y1NpMJF5DznQ/RHchJ6933hEbp0+8LCxb7dwRyQhXd1KwI+uS526KNFI3ZqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hfvOE8gd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHALuj005825
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 19:08:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NXrXegjKH9F
	ZEEv4Dl+TWuWDw89FsK2vfam13ri509Y=; b=hfvOE8gdG1duZvZ8UKYvlySI7lE
	Ndfuho0CV3rtLDIq0cAvbvEpw6e4dwj/JR1ac64ntB8/2vaQv/7+/g3ZoyXLALcy
	qGfNJFjIYWf7Zt+sKVJJkN49yNrOOhYTUxFTJA0e3bqSt4v3ia642TE071PlWm1q
	S6qH+hgF3DzafLUHcVNyTgRIjHQHRwpdTzm+wb6z7UeXoksbwR/wzNk+hBcRH5sA
	BJLnuq4mB8Ud9JC9r+vX6TWYB+e/DCuk/BfNuYnz/6DguI+Iw+smXhoBmpS5tvHI
	CrTmYc1NJsTkoqIl2ldMjdf4QxijXuhX/oMKqefiprZZZvT4Ee9XTPnZSew==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481t6w7f2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 19:08:59 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74ea5d9982cso183920b3a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 12:08:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753297738; x=1753902538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NXrXegjKH9FZEEv4Dl+TWuWDw89FsK2vfam13ri509Y=;
        b=Q0tNRb7UbFwcinVYy8kk8FXR5kpSes0Yzsd9Sz8u9HOvIgPE0z4IefEIeSS0EaOjRP
         +NmgUyQVB7GhULrON/utN6LntetVEt2E0mbUIeCEXbBYSAJxXYvFiw9Mwy+2ME4KiAmD
         9t0cKEZRZaMX5kghWn4b25zEwjvDDPKtPwqzmxoURafb/8Qu4SyraQpT1rNSe9m0Xh/4
         u5H/MfXuqv0VaV/AjV9FdKQBFr50jH71Qczl18YF4v5/gnVy76M1u9IgbG9cz4xrQjdI
         My49hp4ytlzqI+wwfIhrdNh2N+WjU3OJmRcLdIHCS6ixjMxsABNtfVzLBD+eTMaVdgmN
         us9Q==
X-Gm-Message-State: AOJu0YzPXb98c7x/IMvdppN96CLOxJTQPOnXWC9QbF4Rovy80khJIyEq
	Y0Z3h9+70d/TbJLuwGlVt8FsbTlLyxHI/T2Ex8m8ywguRL82rPu3ckiGdZ+qd+sDaWfFMU9r7Cn
	y6W8YfzBOINyPmIiYESiwc0W9CdJEbvcLUIVPL9keHji4U+3F2+x45msbeKYJur2uOSjE
X-Gm-Gg: ASbGncsyVrDBMqTVJA6qmSANXUvyayl10HQ2AsVlo3Z9ASmXT6JXNU3qp85b0nsDnb5
	4xmqs3cT6VUdsjesonApqeA/1NtS9TYojZ4zH4G77e4QMZUown3gg43cYyxdtUqhL+3CisHbY67
	rQbNQNdu4OducBrxx1BFF22s+VdyckqhWD3YxLXhn6kmy11GiLQpdcAjJvJaNufMg86TTTxK/Yt
	qS4u9TyF5QWOBpvMzOx9vGeh0yHRGT9VUc97ZOsJWiXqgdSTjdxpFt+JF4rDHXOTTLD5uzLzYt6
	A5/jretL4Nv/MqnC8zoWkEAeGXCp+1f5KGzzAtIfoMDi2AcT9qw=
X-Received: by 2002:a05:6a00:9281:b0:748:e150:ac5c with SMTP id d2e1a72fcca58-76035fe970cmr5837903b3a.23.1753297738383;
        Wed, 23 Jul 2025 12:08:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6rfYQZeb/JoYfO4ZK95X/OcOSoYrnuOfh+vEGrN+A4OlMvLtndbVepak4mr0nineouEWh+w==
X-Received: by 2002:a05:6a00:9281:b0:748:e150:ac5c with SMTP id d2e1a72fcca58-76035fe970cmr5837866b3a.23.1753297737800;
        Wed, 23 Jul 2025 12:08:57 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c89d5e73sm10158873b3a.59.2025.07.23.12.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 12:08:57 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: Fix submit error path cleanup
Date: Wed, 23 Jul 2025 12:08:50 -0700
Message-ID: <20250723190852.18394-3-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250723190852.18394-1-robin.clark@oss.qualcomm.com>
References: <20250723190852.18394-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SPpCVPvH c=1 sm=1 tr=0 ts=6881334b cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=l9nXAVJ8hsDFWAt1A-0A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2MiBTYWx0ZWRfXw1SbugMcyjak
 qdw51+A+WrEDZZqGJofM1gP0RzvQVwYxfkCZkReLlyeAqDOU0qYOaAZdTWTBK5Ky4vRGYbmnL+v
 4D+3vYZd1Lcu1j7ORUzYDXCV/VWXnwXlTG51f9oPf+2sPjXTWGH6rvhl4wlBV+vh6t7x/RD7jXt
 arwhTY2uc5VTtUCpekAQghZftwiCwXhpsBEcTojcNahgAlk3K3ZZDruzBdiuB5wNHa0T3MbISIg
 28yfUoR6+i3Rc5bYjgLbWpoG6ANiN0AvBpJfo8DrF10sNf/KZvDSw6D80c8l1YEsFPyt8pi72os
 qvmtdH6Xj5isvXicsAzW26R58pqlv4eMqPfoPBLrLWiNaCOV2VHre0MQzyH9i+MGwgb9B1YpuP/
 AarUzhvgPImhCCDZn7dAOlzFi75WYFXrtE6ru61Ak3UZ+w0JpgG748tjbbVOhuEZB3+BVXIK
X-Proofpoint-ORIG-GUID: cBcpFLr8l118dvBI9RtmbNAF3Xswy97X
X-Proofpoint-GUID: cBcpFLr8l118dvBI9RtmbNAF3Xswy97X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 mlxscore=0 bulkscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230162

submit_unpin_objects() should come before we unlock the objects.  This
fixes the splat:

   WARNING: CPU: 2 PID: 2171 at drivers/gpu/drm/msm/msm_gem.h:395 msm_gem_u=
npin_locked+0x8c/0xd8 [msm]
   Modules linked in: uinput snd_seq_dummy snd_hrtimer aes_ce_ccm snd_soc_w=
sa884x regmap_sdw q6prm_clocks q6apm_lpass_dais q6apm_dai snd_q6dsp_common =
q6prm snd_q6apm qcom_pd_mapper cdc_mbim cdc_wdm cdc_ncm r8153_ecm cdc_ether=
 usbnet sunrpc nls_ascii nls_cp437 vfat fat snd_soc_x1e80100 snd_soc_lpass_=
rx_macro snd_soc_lpass_tx_macro snd_soc_lpass_va_macro snd_soc_lpass_wsa_ma=
cro snd_soc_qcom_common soundwire_qcom snd_soc_lpass_macro_common snd_soc_h=
dmi_codec snd_soc_qcom_sdw ext4 snd_soc_core snd_compress soundwire_bus snd=
_pcm_dmaengine snd_seq mbcache jbd2 snd_seq_device snd_pcm pm8941_pwrkey sn=
d_timer r8152 qcom_spmi_temp_alarm industrialio snd lenovo_yoga_slim7x ath1=
2k mii arm_smccc_trng soundcore rng_core evdev loop panel_samsung_atna33xc2=
0 msm ubwc_config drm_client_lib drm_gpuvm drm_exec gpu_sched drm_display_h=
elper pmic_glink_altmode aux_hpd_bridge ucsi_glink qcom_battmgr phy_qcom_qm=
p_combo ps883x cec aux_bridge drm_dp_aux_bus i2c_hid_of aes_ce_blk drm_kms_=
helper aes_ce_cipher i2c_hid qcom_q6v5_pas
    ghash_ce qcom_pil_info drm sha1_ce qcom_common phy_snps_eusb2 qcom_geni=
_serial qcom_q6v5 qcom_sysmon pinctrl_sm8550_lpass_lpi lpasscc_sc8280xp sbs=
a_gwdt mdt_loader gpio_keys pmic_glink i2c_dev efivarfs autofs4
   CPU: 2 UID: 1000 PID: 2171 Comm: gnome-shell Not tainted 6.16.0-rc4-debu=
g+ #25 PREEMPT(voluntary)
   Hardware name: LENOVO 83ED/LNVNB161216, BIOS NHCN53WW 08/02/2024
   pstate: 61400005 (nZCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=3D--)
   pc : msm_gem_unpin_locked+0x8c/0xd8 [msm]
   lr : msm_gem_unpin_locked+0x88/0xd8 [msm]
   sp : ffff80009c963820
   x29: ffff80009c963820 x28: ffff80009c9639f8 x27: ffff00080552a830
   x26: 0000000000000000 x25: ffff0009d5655800 x24: 0000000000000000
   x23: 0000000000000000 x22: 0000000000000000 x21: 0000000000000000
   x20: ffff000831db5480 x19: ffff000816e74400 x18: 0000000000000000
   x17: 0000000000000000 x16: ffffc1396afdd720 x15: 0000000000000000
   x14: 0000000000000000 x13: 0000000000000000 x12: ffff0008c065bc00
   x11: ffff0008c065c000 x10: 0000000000000000 x9 : ffffc13945b19074
   x8 : 0000000000000000 x7 : 0000000000000209 x6 : 0000000000000002
   x5 : 0000000000019d01 x4 : ffff0008ba8db080 x3 : 000000000004093f
   x2 : ffff3ed5e727f000 x1 : 0000000000000000 x0 : 0000000000000000
   Call trace:
    msm_gem_unpin_locked+0x8c/0xd8 [msm] (P)
    msm_ioctl_gem_submit+0x32c/0x1760 [msm]
    drm_ioctl_kernel+0xc8/0x138 [drm]
    drm_ioctl+0x2c8/0x618 [drm]
    __arm64_sys_ioctl+0xac/0x108
    invoke_syscall.constprop.0+0x64/0xe8
    el0_svc_common.constprop.0+0x40/0xe8
    do_el0_svc+0x24/0x38
    el0_svc+0x54/0x1d8
    el0t_64_sync_handler+0x10c/0x138
    el0t_64_sync+0x19c/0x1a0
   irq event stamp: 2185036
   hardirqs last  enabled at (2185035): [<ffffc1396afeef9c>] _raw_spin_unlo=
ck_irqrestore+0x74/0x80
   hardirqs last disabled at (2185036): [<ffffc1396afd8164>] el1_dbg+0x24/0=
x90
   softirqs last  enabled at (2184778): [<ffffc13969675e44>] fpsimd_restore=
_current_state+0x3c/0x328
   softirqs last disabled at (2184776): [<ffffc13969675e14>] fpsimd_restore=
_current_state+0xc/0x328
   ---[ end trace 0000000000000000 ]---

Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm=
_gem_submit.c
index 5f8e939a5906..0ac4c199ec93 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -514,14 +514,15 @@ static int submit_reloc(struct msm_gem_submit *submit=
, struct drm_gem_object *ob
  */
 static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 {
+	if (error)
+		submit_unpin_objects(submit);
+
 	if (submit->exec.objects)
 		drm_exec_fini(&submit->exec);
=20
-	if (error) {
-		submit_unpin_objects(submit);
-		/* job wasn't enqueued to scheduler, so early retirement: */
+	/* if job wasn't enqueued to scheduler, early retirement: */
+	if (error)
 		msm_submit_retire(submit);
-	}
 }
=20
 void msm_submit_retire(struct msm_gem_submit *submit)
--=20
2.50.1


