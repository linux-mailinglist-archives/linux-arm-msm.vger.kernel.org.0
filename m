Return-Path: <linux-arm-msm+bounces-94468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YORUByyuoWk3vgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 15:46:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B18ED1B92C8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 15:46:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E86C83012522
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 14:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B807428475;
	Fri, 27 Feb 2026 14:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="InrNlf/H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCwgPD0x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94789428482
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772203560; cv=none; b=YUurcahuzSpEs4gXWY/77rrnf/lvpcvQwqzESbk8sX6mx+Az+/qqm7fV4KAJ/0OMeB0YT1SHbXybfTj3nhXT46lf6wuBRdQx2gxFsyTf0hxPUh6pXNM3DdAwX1zO96nucdUWk0d+t2EgSHCC2lsNjqxuYoE7cTb1H7cs/AWe3qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772203560; c=relaxed/simple;
	bh=YDWz9jB1FI6KeBCMCSeoXI0nSgY1wfreJnp73RIt0Bs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P1zgh0oON131OVOmabLYfBlll93f8nZy39F1NgCjLoKwANZE3WLvYG9DaiCsUWOHRrbtsVul/YK+nDmLrht4SPgPsItFsmAZmZ3Te+KmxpTJRtfFPsjjstMwOwNoVBDv1I4UQPkELg5SVaMnoVorBEFM6VQcn06/EPchygEtEAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=InrNlf/H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCwgPD0x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61REaSn74011947
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=j5r+JvKBntcYpndiGkA6YNl9DgG04kM5mo2
	y8/Nhf7Q=; b=InrNlf/HenFHaKU1QAF04p01TzAsfyImFRNBv6tva0rMK6eVNRI
	eIYXAooZtWcIznqH4e+bGBn/WZBG2ytqmJ2Vf+E+tesw0/WJ8Iz545C5eb+i/87c
	5f03v70ouBIDQI9w2AQEl6szU+fLWvJ2AtFjiZBvIev816Tc27F6mV0u/SUk9Jhk
	53kDf93ZWlok5KWD2XTWUouqYvPxNmMvfxNOqYM86Imc7+kYkJv55whxMs6m9FF5
	WebrjS35G1PQbwY6GY3Y9a88B9YXbX0wKr2RPboHxB3/2a/e2v0vhAZnX65dclCM
	7xOZ50uwBzUxDE55jMTkv4ikY7V0h+kLAUA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ck43r9wr5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 14:45:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2aaeafeadbcso23025365ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 06:45:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772203558; x=1772808358; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j5r+JvKBntcYpndiGkA6YNl9DgG04kM5mo2y8/Nhf7Q=;
        b=UCwgPD0x5/09P7HA2p88hoH2ogaDrBEwJlkIID2CzKTHsNxd3f3H31s05g9Muq/oQG
         CVOq0Lop7i4zBhpz3NgstBbHoXNqwHq3MUE5fM7NS012HICMA5jDomT8+779h1SzKJV/
         bAyQAP9+tIHg4/Gc2ATpDMWXHzyoYrzYs4BU2fOCIVgcYV9gYzjdK2o172TgN/8quBkv
         hPXqVRX+wBoI8Rm1rlxtlEImmAYADSgdiUz8DnaktQUXNHFtWRKBYab7wNyUNZLxQICA
         OAoECgAp1OiTG+x/nXbXktnDFN8T6SIiHvWH/tkVfAA1a8Iivl+XHxXPWFTkbq25eOZu
         B7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772203558; x=1772808358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j5r+JvKBntcYpndiGkA6YNl9DgG04kM5mo2y8/Nhf7Q=;
        b=vFWIqFcoGk50ZWWevFBbrbcsDZQzpQPG0wEw4wqmL3qy7hSWnZ4Ax/edAegC/VzdoZ
         0EuJn4LwmJS4laVO/Bs/fhuFLcyGmHQ2NENJ8BKDWunJRClojID35wDBEr3BNOM9XA+M
         e175UXtlxbjqCtpRhZzAQ2wV0awEVbpnet4dZXAarVP5UD3nailwj5OItLXpuJTZarSE
         qPMn1riQT1kwP5jlRZZV0mbhQ0gVopG2vkD4iXKH4DeFXoWBmqwKO6vHHOxhSANrYKJz
         ObzK1UZsVqbGv/NdxcDxiy5MbtFYbkNW5KN1JCL9Mzpm/sye7mXPf+2oItaK6PTA/8Hx
         3p4A==
X-Forwarded-Encrypted: i=1; AJvYcCXfsoksm/9ltjoIeATEyc+eUJUAjcOAR2sBXsPb43Ub/MdpYvdpFz0JaoOc1FwNeDkpU4XC/6yo+VKWvgdi@vger.kernel.org
X-Gm-Message-State: AOJu0YwnscBNZLw2u61QKIa/RqfgTi1vp+xcIDwQkAG6ZBI9nM/lR8YH
	Wp0TfjPLFhSJbeHmqfk/iv+HmIJ3swC+68U6GTitTcSfxQHjHwb6mxbQ6E7qtvK/QDfR74O59Td
	7kAT4ih9QBqQNVpCFy8XG1NJfdy9maLK4H/NrtCWWYjKYV0q7kCh9YLDcoKHTPcIA0zms
X-Gm-Gg: ATEYQzxoy9K8t8CgwaXhtrMzySFsgn3QFZkHlMa/BTk6q1wKegX7bjgE6I7upN7U/8B
	6c1+Eoor0M0v5isusZ3tUdReM0J4MFHUE+HFN9toc1uIf9hkLa6a4B13LfoJGFG6PQGtmSDMwvj
	qGYoOSM2Btt/w3YQrEd9Uglj/jgGdB4fSna8MhTvjSxwBR+GbvH5tg/zjG76H5GMyMwU3J4wpXf
	vesyF4G2DMLWMG6hL5cLXc9M+LdwqaASclnR/m2PPYIsDrhCUY2qBaEpMuqALX4mKhXUjSbEPrd
	ndRiR4/HTuJt92PkcEeVx21MO8sGus0fCwkQl4uJSg95BU+bSxVjeqwpVLYaz7TvvThbu7zYkq8
	SL8UYRNM/XUgipMh2HSXmRM77/uSAoreUdGWz6fVBN8ScnW8e7qo=
X-Received: by 2002:a17:903:4b07:b0:2aa:dad4:d34f with SMTP id d9443c01a7336-2ae2e4b0b7bmr25063785ad.27.1772203557877;
        Fri, 27 Feb 2026 06:45:57 -0800 (PST)
X-Received: by 2002:a17:903:4b07:b0:2aa:dad4:d34f with SMTP id d9443c01a7336-2ae2e4b0b7bmr25063505ad.27.1772203557203;
        Fri, 27 Feb 2026 06:45:57 -0800 (PST)
Received: from hu-raviravi-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb757a8dsm81917535ad.40.2026.02.27.06.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 06:45:56 -0800 (PST)
From: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com, stable@vger.kernel.org
Subject: [PATCH v1] ASoC: qcom: qdsp6: Fix q6apm remove ordering during ADSP stop and start
Date: Fri, 27 Feb 2026 20:15:34 +0530
Message-Id: <20260227144534.278568-1-ravi.hothi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: P2ZJOT2Q-HoG1EZPYtr3PrkUY7fLXW7N
X-Proofpoint-GUID: P2ZJOT2Q-HoG1EZPYtr3PrkUY7fLXW7N
X-Authority-Analysis: v=2.4 cv=DOqCIiNb c=1 sm=1 tr=0 ts=69a1ae26 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=rf00gIwgXPVrdr1aJ6AA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEzMSBTYWx0ZWRfX+OGdkb+lbMgc
 yk1sxuJkLOZugNB7L7lz2dqbgwxztkrDUc0M/T3zTf2KruzvcXUMaVdWwfRf3PMw6XKC9/unxgm
 gQv81kPMyqwm/lJEOQux1Dej+nBohtOfn/2TaFWlMOZNzX4BT8sntLZXm2eZDai4dAOMSPl82Tl
 J4GSP8rjJIU+CjA6Pb4+oMyztR9d37T8rJjWpIq+ck+cU6Zlioo7VGotmCPhvhooRBfbH3G3wjB
 dkAnsp/Vb25eGwbDzdOwfgW96/IUhZ6TbNxiovKl2HDnWltVz74umCD3pvb4somWgszS5RezWcF
 +ar101Ks0OYMJ//dokihmqPH4fCXJs8mkg8B7o+VgRjdw90hjYIr3IzYxIVDCtunvHDSM9KmeTD
 HjOoyf1+b9yxX9Ivsh13q5V1cRFO9qqZhGsTYwqAU129hMAZW+z1wpPGtWjxgpFXO+E+Ky1DxxD
 R0p1dCxhF417lyAWlDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270131
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-94468-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com,linux.dev];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ravi.hothi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B18ED1B92C8
X-Rspamd-Action: no action

During ADSP stop and start, the kernel crashes due to the order in which
ASoC components are removed.

On ADSP stop, the q6apm-audio .remove callback unloads topology and removes
PCM runtimes during ASoC teardown. This deletes the RTDs that contain the
q6apm DAI components before their removal pass runs, leaving those
components still linked to the card and causing crashes on the next rebind.

Fix this by ensuring that all dependent (child) components are removed
first, and the q6apm component is removed last.

[   48.105720] Unable to handle kernel NULL pointer dereference at virtual =
address 00000000000000d0
[   48.114763] Mem abort info:
[   48.117650]   ESR =3D 0x0000000096000004
[   48.121526]   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
[   48.127010]   SET =3D 0, FnV =3D 0
[   48.130172]   EA =3D 0, S1PTW =3D 0
[   48.133415]   FSC =3D 0x04: level 0 translation fault
[   48.138446] Data abort info:
[   48.141422]   ISV =3D 0, ISS =3D 0x00000004, ISS2 =3D 0x00000000
[   48.147079]   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
[   48.152354]   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0, Xs =3D 0
[   48.157859] user pgtable: 4k pages, 48-bit VAs, pgdp=3D00000001173cf000
[   48.164517] [00000000000000d0] pgd=3D0000000000000000, p4d=3D00000000000=
00000
[   48.171530] Internal error: Oops: 0000000096000004 [#1]  SMP
[   48.177348] Modules linked in: q6prm_clocks q6apm_lpass_dais q6apm_dai s=
nd_q6dsp_common q6prm snd_q6apm 8021q garp mrp stp llc snd_soc_hdmi_codec a=
pr pdr_interface phy_qcom_edp fastrpc qcom_pd_mapper rpmsg_ctrl qrtr_smd rp=
msg_char qcom_pdr_msg qcom_iris v4l2_mem2mem videobuf2_dma_contig ath11k_pc=
i msm ubwc_config at24 ath11k videobuf2_memops mac80211 ocmem videobuf2_v4l=
2 libarc4 drm_gpuvm mhi qrtr videodev drm_exec snd_soc_sc8280xp gpu_sched v=
ideobuf2_common nvmem_qcom_spmi_sdam snd_soc_qcom_sdw drm_dp_aux_bus qcom_q=
6v5_pas qcom_spmi_temp_alarm snd_soc_qcom_common rtc_pm8xxx qcom_pon drm_di=
splay_helper cec qcom_pil_info qcom_stats soundwire_bus drm_client_lib mc d=
ispcc0_sa8775p videocc_sa8775p qcom_q6v5 camcc_sa8775p snd_soc_dmic phy_qco=
m_sgmii_eth snd_soc_max98357a i2c_qcom_geni snd_soc_core dwmac_qcom_ethqos =
llcc_qcom icc_bwmon qcom_sysmon snd_compress qcom_refgen_regulator coresigh=
t_stm stmmac_platform snd_pcm_dmaengine qcom_common coresight_tmc stmmac co=
resight_replicator qcom_glink_smem coresight_cti stm_core
[   48.177444]  coresight_funnel snd_pcm ufs_qcom phy_qcom_qmp_usb gpi phy_=
qcom_snps_femto_v2 coresight phy_qcom_qmp_ufs qcom_wdt gpucc_sa8775p pcs_xp=
cs mdt_loader qcom_ice icc_osm_l3 qmi_helpers snd_timer snd soundcore displ=
ay_connector qcom_rng nvmem_reboot_mode drm_kms_helper phy_qcom_qmp_pcie sh=
a256 cfg80211 rfkill socinfo fuse drm backlight ipv6
[   48.301059] CPU: 2 UID: 0 PID: 293 Comm: kworker/u32:2 Not tainted 6.19.=
0-rc6-dirty #10 PREEMPT
[   48.310081] Hardware name: Qualcomm Technologies, Inc. Lemans EVK (DT)
[   48.316782] Workqueue: pdr_notifier_wq pdr_notifier_work [pdr_interface]
[   48.323672] pstate: 20400005 (nzCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=
=3D--)
[   48.330825] pc : mutex_lock+0xc/0x54
[   48.334514] lr : soc_dapm_shutdown_dapm+0x44/0x174 [snd_soc_core]
[   48.340794] sp : ffff800084ddb7b0
[   48.344207] x29: ffff800084ddb7b0 x28: ffff00009cd9cf30 x27: ffff00009cd=
9cc00
[   48.351544] x26: ffff000099610190 x25: ffffa31d2f19c810 x24: ffffa31d2f1=
85098
[   48.358869] x23: ffff800084ddb7f8 x22: 0000000000000000 x21: 00000000000=
000d0
[   48.366198] x20: ffff00009ba6c338 x19: ffff00009ba6c338 x18: 00000000fff=
fffff
[   48.373528] x17: 000000040044ffff x16: ffffa31d4ae6dca8 x15: 07200774077=
5076f
[   48.380853] x14: 0765076d07690774 x13: 00313a323a656369 x12: 767265733a6=
37673
[   48.388182] x11: 00000000000003f9 x10: ffffa31d4c7dea98 x9 : 00000000000=
00001
[   48.395519] x8 : ffff00009a2aadc0 x7 : 0000000000000003 x6 : 00000000000=
00000
[   48.402854] x5 : 0000000000000000 x4 : 0000000000000028 x3 : ffff000ef39=
7a698
[   48.410180] x2 : ffff00009a2aadc0 x1 : 0000000000000000 x0 : 00000000000=
000d0
[   48.417506] Call trace:
[   48.420025]  mutex_lock+0xc/0x54 (P)
[   48.423712]  snd_soc_dapm_shutdown+0x44/0xbc [snd_soc_core]
[   48.429447]  soc_cleanup_card_resources+0x30/0x2c0 [snd_soc_core]
[   48.435719]  snd_soc_bind_card+0x4dc/0xcc0 [snd_soc_core]
[   48.441278]  snd_soc_add_component+0x27c/0x2c8 [snd_soc_core]
[   48.447192]  snd_soc_register_component+0x9c/0xf4 [snd_soc_core]
[   48.453371]  devm_snd_soc_register_component+0x64/0xc4 [snd_soc_core]
[   48.459994]  apm_probe+0xb4/0x110 [snd_q6apm]
[   48.464479]  apr_device_probe+0x24/0x40 [apr]
[   48.468964]  really_probe+0xbc/0x298
[   48.472651]  __driver_probe_device+0x78/0x12c
[   48.477132]  driver_probe_device+0x40/0x160
[   48.481435]  __device_attach_driver+0xb8/0x134
[   48.486011]  bus_for_each_drv+0x80/0xdc
[   48.489964]  __device_attach+0xa8/0x1b0
[   48.493916]  device_initial_probe+0x50/0x54
[   48.498219]  bus_probe_device+0x38/0xa0
[   48.502170]  device_add+0x590/0x760
[   48.505761]  device_register+0x20/0x30
[   48.509623]  of_register_apr_devices+0x1d8/0x318 [apr]
[   48.514905]  apr_pd_status+0x2c/0x54 [apr]
[   48.519114]  pdr_notifier_work+0x8c/0xe0 [pdr_interface]
[   48.524570]  process_one_work+0x150/0x294
[   48.528692]  worker_thread+0x2d8/0x3d8
[   48.532551]  kthread+0x130/0x204
[   48.535874]  ret_from_fork+0x10/0x20
[   48.539559] Code: d65f03c0 d5384102 d503201f d2800001 (c8e17c02)
[   48.545823] ---[ end trace 0000000000000000 ]---

Fixes: 5477518b8a0e ("ASoC: qdsp6: audioreach: add q6apm support")
Cc: stable@vger.kernel.org
Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c        | 1 +
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 1 +
 sound/soc/qcom/qdsp6/q6apm.c            | 1 +
 3 files changed, 3 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-=
dai.c
index de3bdac3e791..168c166c960d 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -838,6 +838,7 @@ static const struct snd_soc_component_driver q6apm_fe_d=
ai_component =3D {
 	.ack		=3D q6apm_dai_ack,
 	.compress_ops	=3D &q6apm_dai_compress_ops,
 	.use_dai_pcm_id =3D true,
+	.remove_order   =3D SND_SOC_COMP_ORDER_EARLY,
 };
=20
 static int q6apm_dai_probe(struct platform_device *pdev)
diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6=
/q6apm-lpass-dais.c
index 528756f1332b..5be37eeea329 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -278,6 +278,7 @@ static const struct snd_soc_component_driver q6apm_lpas=
s_dai_component =3D {
 	.of_xlate_dai_name =3D q6dsp_audio_ports_of_xlate_dai_name,
 	.be_pcm_base =3D AUDIOREACH_BE_PCM_BASE,
 	.use_dai_pcm_id =3D true,
+	.remove_order   =3D SND_SOC_COMP_ORDER_FIRST,
 };
=20
 static int q6apm_lpass_dai_dev_probe(struct platform_device *pdev)
diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 44841fde3856..970b08c89bb3 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -715,6 +715,7 @@ static const struct snd_soc_component_driver q6apm_audi=
o_component =3D {
 	.name		=3D APM_AUDIO_DRV_NAME,
 	.probe		=3D q6apm_audio_probe,
 	.remove		=3D q6apm_audio_remove,
+	.remove_order   =3D SND_SOC_COMP_ORDER_LAST,
 };
=20
 static int apm_probe(gpr_device_t *gdev)
--=20
2.34.1


