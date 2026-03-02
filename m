Return-Path: <linux-arm-msm+bounces-94954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6C5bARCZpWnxEgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:05:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E011DA565
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:05:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 771713026B42
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 14:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFB9A3FD129;
	Mon,  2 Mar 2026 14:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="ZLYW0tQd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0343F23DD
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 14:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772460275; cv=none; b=oU4HGjJipQUnObS0wHlLblTOavWnrQw3j8gZfhZEBhRUx6zRi4rA+4M5Y9TT0fK8mH838hz0WGjEKrM3HZp2+CVriUgRopQyznm+xREin3OIIHqavhO3uu21iMDsr+ETBGT3vjxrtlRI+bJAQdPAtfyQZE0GTJ9aUITc99Uzg9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772460275; c=relaxed/simple;
	bh=FJtWWy/aYk9cHF01VouXGdE7yyA1B38d9kc8r1e91bw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Wa5VefBxmT7SLo/S43lGroAacX7wcP4pDwLez+u/7/pMM6KJvM25lTx9dqp9ifuSZHo1lTm8vKMiuX8XFJZzsdRfca6qCTMp+PiC/ou1SEODDJt7HNZuBcCKWh3YzLtOaCj1B4jVpQBjQNSFYcCT4jhRc0Bab6n09BGdptsdZOM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=ZLYW0tQd; arc=none smtp.client-ip=79.135.106.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=667v7tn3njdnrlk4nk76mkkdte.protonmail; t=1772460263; x=1772719463;
	bh=JoOmDhv7vlT+T519Nmj4aAlDqenZ/uDJkdtkAr8/H6U=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ZLYW0tQd4jU99na9n/lB7J76L+CFtX6edFRPZMkxqhAgwS+NceWNyjYrqFd1Q/RdR
	 JcVnfEsJ1wWrYyvbcLiXm63a54HNTeWcWfVV7J3logROcLH2LylnArprpqzGqQmIKv
	 k5eB9YtlIBHTWfSd7LrjtsNUokJgX2keQ7Ljm6HFzFCJyRrWFu4N/AD3JbICn0yWzc
	 OzVX/Au2rClrka8PQBJo5D60BLhfSqx8jxwKF9qpSn3jqwrYbSTaFftadn7AYzQzdQ
	 yCEeQib7QBqGUfCOFExNdts0OT4Z3vIK3OTU63TXCwMP7/dwO1xvpw0ZHJ80OaoG+V
	 qLrA2bkRpmgNw==
Date: Mon, 02 Mar 2026 14:04:20 +0000
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, konradybcio@kernel.org
From: Tj <tj.iam.tj@proton.me>
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: qcom_scm: page dumped because: nonzero _refcount
Message-ID: <94629352-595b-46bb-9c11-505aa9db0a1a@proton.me>
In-Reply-To: <25c4608b-c447-42eb-a5b3-8d58bd93ebc7@oss.qualcomm.com>
References: <cb59c06a-b0bb-4061-9db6-30b0b350661d@proton.me> <25c4608b-c447-42eb-a5b3-8d58bd93ebc7@oss.qualcomm.com>
Feedback-ID: 113488376:user:proton
X-Pm-Message-ID: 26cd9fbc98049843e38e60dbb22ddce87c92a013
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[proton.me:s=667v7tn3njdnrlk4nk76mkkdte.protonmail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94954-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[proton.me:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tj.iam.tj@proton.me,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,proton.me:mid,proton.me:dkim]
X-Rspamd-Queue-Id: B8E011DA565
X-Rspamd-Action: no action

On 02/03/2026 12:09, Konrad Dybcio wrote:
> On 3/2/26 4:43 AM, Tj wrote:
>> Trying to fix problems booting Samsung Galaxy Book2 W737 with v7.0.0-rc1
>> arm64 and hitting this. Due to its nature the only way to capture logs
>> is a photo of the screen. I've transcribed it as best as I can here:
>>
>> BUG: Bad page state in process kworker/u32:2=C2=A0 pfn:f4b01
>> page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xf4b=
01
>> flags: 0x1ffff00000000000(node=3D0|zone=3D0|lastcpuid=3D0x1ffff)
>> raw: 01ffff00000000000 fffffdffc1d2c088 fffffdffc1d2c008 000000000000000=
0
>> raw: 0000000000000000 0000000000000000 000000001fffffffff 00000000000000=
00
>> page dumped because: nonzero _refcount
>> Modules linked in: aux_bridge drm_kms_helper qcom_spmi_pmic ufs_qcom(+)
>> ghash_cd videobuf2_common gf128mul qcom_stats{+) ufshcd_pltfrm cfg80211
>> ...qcom_tsens(+) crc16 reset_qcom_pdc(+)
>> spcc_sdm845 camcc_sdm845 ... videocc_sdm845 ufshcd_core qcom_q6v5_mss
>> slim_qcom_ngd_ctrl(+) qcom_rpmh_regulator ... phy_qcom_qmp_usb slimbus
>> ipa nvmem_qfprom i2c_qcom_geni qcom_q6v5_pas ...phy_qcom_qusb2 ...
>> gpucc_sdm845 pdr_interface qcom_rng phy_qcom_qmp_ufs qcom_pil_info
>> qcom_pdr_msg ... qcom_q6v5 qcom_hwspinlock qcom_apcs_ipc_mailbox ...
>> qcom_wdt qcom_cpufreq_hw qcom_sysmon bam_dma
>> icc_osm_l3 mdt_loader qcom_common qcom_glink_smem ... qcom_glink
>> icc_bwmon soundcore qcom_smd smp2p qmi_helpers rpmsg_core smen rmtfs_mem
>> efi_pstore netconsole configfs
>> CPU: 7 UID: 0 PID: 57 Comm: kworker/u32:2 Tainted: G=C2=A0 =C2=A0 B 7.0.=
0-rc1 #15
>> PREEMPTLAZY
>> Tainted: [B]=3DBAD_PAGE
>> Hardware name: SAMSUNG ELECTRONICS CO., LTD. Galaxy
>> Book2/SM-W737YZSBTEL, BIOS P02AHG.005.190624.WY.1359 06/24/2019
>> Workqueue: events_unbound deferred_probe_work_func
>> Call trace:
>>   =C2=A0show_stack+0x20/0x38 (C)
>>   =C2=A0dump_stacj_lvl+0x78/0x90
>>   =C2=A0dump_stack+0x18/0x28
>>   =C2=A0bad_page+0x8c/0x138
>>   =C2=A0__free_frozen_pages+0x4dc/0x778
>>   =C2=A0free_contig_frozen_range+0xd8/0x128
>>   =C2=A0cma_release+0xf8/0x378
>>   =C2=A0dma_free_contiguous+0x34/0x88
>>   =C2=A0dma_direct_free+0x100/0x188
>>   =C2=A0dma_free_attrs+0x90/0x248
>>   =C2=A0qcom_scm_pas_init_image+0x14c/0x1d0
> It seems like this calls __qcom_scm_pas_init_image() for IPA which then f=
ails.
>
> Is your laptop LTE-enabled, or Wi-Fi only?
It has both SIM slot (unpopulated) and Wifi.
> Are you sure you're using the correct, model-specific IPA firmware? Are y=
ou
> sure the related reserved memory region in the DT is correct?

Firmware was copied from the MS Windows 10 Home S installation (that=20
works correctly). I've checked shasums match.

Not sure about the DT (not familiar enough with reading DT at present)=20
but it is the mainline kernel's DTS (with qcrypt disabled as mentioned).

arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts




