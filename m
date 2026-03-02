Return-Path: <linux-arm-msm+bounces-94779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yJ/TAG0HpWmpzQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94779-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 04:43:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 80FC21D2BBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 04:43:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AD77F300899E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 03:43:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF9F242D72;
	Mon,  2 Mar 2026 03:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="PebFJw9S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-43103.protonmail.ch (mail-43103.protonmail.ch [185.70.43.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5879E19C553
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 03:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772423016; cv=none; b=CwKDBBjLxkppjQFH9tEL+LxYPyMt4h4+rsj5PdwGZFhO+pjO8pGvCMG5dhj0rtiMzRmPheqkiXL8RsrAucHc4agtO4DURkRQTTjHsVAgZh1QBkQ6MwwIzAvnebZR8jeZA8yO1AYxRVV7kwY9oRC5ySS35T4Y25oQ/PspFy7HZjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772423016; c=relaxed/simple;
	bh=CZBZIWM9LDRFlCKd1WXgxbvrUZglu7NQZpqWoweeEZY=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=T/IwEup/j1ZbCKWqWoWGEPyirUZ/V5NTZzozMdPsUtk7ZhorD9kN+o07ASQGpjC5ZsMKcdoPipANg2doE2/z1j1AkCNayGUcL8NtwdDUe2q1kIpZsrBWFrxWFKvOUB8yHPfkt6bBxb1GwrlHQYzOskz8NemujMaAoArFWggjHMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=PebFJw9S; arc=none smtp.client-ip=185.70.43.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1772423009; x=1772682209;
	bh=CZBZIWM9LDRFlCKd1WXgxbvrUZglu7NQZpqWoweeEZY=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=PebFJw9SS9+5B2f058wd8xwf5PsW03V8/3VvGBu0xzOm/DrGmpZmMOvxZfvpOToAw
	 bMDUajbH/j/scCPu2RSxtJNwZGq46/BVLML1tO8eN9xu8M+nl0OsE07fMppWpzFxbq
	 jIDJPwbK1nm3SFaf901psMFYeMXJDUOgS26rg5bRz3mopuqT5qrjfSJWtNdTiz1ZeU
	 bxazM98zxiCA8MvXuTGvauqUl8MpkWcVydFBVKTB/HWlhaLR3Wvga8HI07nwJu2nWe
	 BV0+VD9Y9w5A+rXr/YCQ9GQL4My2vm5DGTMTlJrU6UD6+ye/UCybmx9VeCrRSRmEyZ
	 n+5x7Jr8dTe4Q==
Date: Mon, 02 Mar 2026 03:43:24 +0000
To: konradybcio@kernel.org
From: Tj <tj.iam.tj@proton.me>
Cc: linux-arm-msm@vger.kernel.org
Subject: qcom_scm: page dumped because: nonzero _refcount
Message-ID: <cb59c06a-b0bb-4061-9db6-30b0b350661d@proton.me>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: 46c7c1b69d65ad95efe5b181b781b04e78b220d0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[proton.me,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64];
	R_DKIM_ALLOW(-0.20)[proton.me:s=protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[proton.me:+];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94779-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tj.iam.tj@proton.me,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MIME_TRACE(0.00)[0:+]
X-Rspamd-Queue-Id: 80FC21D2BBA
X-Rspamd-Action: no action

Trying to fix problems booting Samsung Galaxy Book2 W737 with v7.0.0-rc1=20
arm64 and hitting this. Due to its nature the only way to capture logs=20
is a photo of the screen. I've transcribed it as best as I can here:

BUG: Bad page state in process kworker/u32:2=C2=A0 pfn:f4b01
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xf4b01
flags: 0x1ffff00000000000(node=3D0|zone=3D0|lastcpuid=3D0x1ffff)
raw: 01ffff00000000000 fffffdffc1d2c088 fffffdffc1d2c008 0000000000000000
raw: 0000000000000000 0000000000000000 000000001fffffffff 0000000000000000
page dumped because: nonzero _refcount
Modules linked in: aux_bridge drm_kms_helper qcom_spmi_pmic ufs_qcom(+)=20
ghash_cd videobuf2_common gf128mul qcom_stats{+) ufshcd_pltfrm cfg80211=20
...qcom_tsens(+) crc16 reset_qcom_pdc(+)
spcc_sdm845 camcc_sdm845 ... videocc_sdm845 ufshcd_core qcom_q6v5_mss=20
slim_qcom_ngd_ctrl(+) qcom_rpmh_regulator ... phy_qcom_qmp_usb slimbus=20
ipa nvmem_qfprom i2c_qcom_geni qcom_q6v5_pas ...phy_qcom_qusb2 ...=20
gpucc_sdm845 pdr_interface qcom_rng phy_qcom_qmp_ufs qcom_pil_info=20
qcom_pdr_msg ... qcom_q6v5 qcom_hwspinlock qcom_apcs_ipc_mailbox ...=20
qcom_wdt qcom_cpufreq_hw qcom_sysmon bam_dma
icc_osm_l3 mdt_loader qcom_common qcom_glink_smem ... qcom_glink=20
icc_bwmon soundcore qcom_smd smp2p qmi_helpers rpmsg_core smen rmtfs_mem=20
efi_pstore netconsole configfs
CPU: 7 UID: 0 PID: 57 Comm: kworker/u32:2 Tainted: G=C2=A0 =C2=A0 B 7.0.0-r=
c1 #15=20
PREEMPTLAZY
Tainted: [B]=3DBAD_PAGE
Hardware name: SAMSUNG ELECTRONICS CO., LTD. Galaxy=20
Book2/SM-W737YZSBTEL, BIOS P02AHG.005.190624.WY.1359 06/24/2019
Workqueue: events_unbound deferred_probe_work_func
Call trace:
 =C2=A0show_stack+0x20/0x38 (C)
 =C2=A0dump_stacj_lvl+0x78/0x90
 =C2=A0dump_stack+0x18/0x28
 =C2=A0bad_page+0x8c/0x138
 =C2=A0__free_frozen_pages+0x4dc/0x778
 =C2=A0free_contig_frozen_range+0xd8/0x128
 =C2=A0cma_release+0xf8/0x378
 =C2=A0dma_free_contiguous+0x34/0x88
 =C2=A0dma_direct_free+0x100/0x188
 =C2=A0dma_free_attrs+0x90/0x248
 =C2=A0qcom_scm_pas_init_image+0x14c/0x1d0
 =C2=A0__qcom_mdt_pas_init_0x130/0x228 [mdt_loader]
 =C2=A0qcom_mdt_load+0x4c/0x98 [ mdt_loader]
 =C2=A0ipa_probe+0xe34/0x1378 [ipa]
 =C2=A0platform_probe+0x64/0xa8
 =C2=A0really_probe+0xc8/0x3f0
 =C2=A0__driver_probe_device+0x88/0x190
 =C2=A0driver_probe_device+0x44/0x120
 =C2=A0__device_attach_driver+0xc4/0c178
 =C2=A0bus_for_each_drv+0x8c/0xf0
 =C2=A0__device_attach+0xa4/0x1d0
 =C2=A0device_initial_probe+0x58/0x68
 =C2=A0bus_probe_device+0x40/0xb8
 =C2=A0deferred_probe_work_func+0xc0/0x128
 =C2=A0process_one_work+0x17c/0x4e8
 =C2=A0worker_thread+0x198/0x330
 =C2=A0kthread_0x13c/0x150
 =C2=A0ret_from_fork+0x10/0x20
ipa 1e40000.ipa: IPA driver setup completed successfully

I've applied one change to disable qcrypto since it causes an SError.

arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts

&crypto {
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIXME: qce_start triggers an SError */
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 status =3D "disabled";
};

I tried v7.0 after v6.18.15 and v6.12.73 fail in slightly different=20
ways. Currently v5.17 is the only kernel I have that can boot to=20
userspace correctly.



