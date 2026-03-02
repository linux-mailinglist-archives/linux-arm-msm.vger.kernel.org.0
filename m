Return-Path: <linux-arm-msm+bounces-94900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNvLAOt9pWm6CAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:09:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C431D817B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:09:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C93BA300BC42
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F32C331A41;
	Mon,  2 Mar 2026 12:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T/pr9typ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Tk+m2R6g"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64885283FCF
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772453348; cv=none; b=jsSRuZW8T3oy2WBCezR1Swsy57gu4UE36o8jlk2MPGnw4WgOVZdDJacipndV85vSVNcWtn4+2Uo+tPAjHQp+hwCam5C/qPbXhNF+KCY/jfFaCeCq48srims79otYssTeXhF4kYwTjRVkrYSo0PLnjctt1zhguhiS57vdyYRjiWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772453348; c=relaxed/simple;
	bh=BlHmZ9PFBEUjig/S1sbQNFGZguXgBPCP5+F4NWdh+GE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PUOXAfYU2N9vqg/jK2ef49hmOAG/kM5VPv0gnahVWVi8TekC/08JWIO9Hyfejqj/Hw1UxVXDWxppP/WfFnyO26vXBRpRF+NDJ15JP11S1tUyeHi+l2oXMjfXzrVcueKuUbwxYbVz9ccRU1Rg9xCGkxHf5T9tEyciMJGcrgVZ3dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T/pr9typ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Tk+m2R6g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229Jc4T3742181
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 12:09:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J9osQUYbJBXGJYIYSwB1UwRMzgazxPOiKWJljdi7pfw=; b=T/pr9typdClIOq7H
	y0CfHDSXHOJn6CTbaJO9IiyK3tzrX5pTcU1TbJq4cJjeziovuKMRZPM2YWmfuORF
	Qb/3FNelnv6ipqI8ddT3bfjK6mphXatM2pjEj6qLlNUM5sYbszric+2aEQpcBZ7E
	+kcg/lo2RxiECw9sQ024jOCX3HKW1q3x6y8upv80ouxjYlOaRR5WcGIjyiRDnpGf
	vPUIk1K/4iqIeIpH0f6G28jWBSFVGYkKMihp/CgB5qyLDxtaJ3tByeuMLdmqrs57
	ls2WG0lEjh4z+BIaqtkXTH/mvkow+rX5cBNRg3MEhEwzP85CuDrYtlHFSmdT+KId
	m7HLxA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7trgjca-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 12:09:06 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb456d53a5so428972485a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772453345; x=1773058145; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J9osQUYbJBXGJYIYSwB1UwRMzgazxPOiKWJljdi7pfw=;
        b=Tk+m2R6griOh0XWtRF6d429KFQewC1KE0EVM7IOPVAH+fQdesegJhZzp9mxMw+VWuf
         k6ikgZ1sm00/g8wlFUMRuyOON5xCAuYb6iWw639zVfyImYqFSkgPCs75bvd/rDMCJm2w
         NIPpeUJRMp31JeBUgOmM+SCWCLOyqiaV3aFMtqTIJdZZ9b7U2DiAJAA2bpQD0Pr2aYRy
         /UKZD5rY0j+hrysEH+I71ntdTKdBwqdIYWyo6/djuExauL4IGxr/RV7lg8fhKPJy6K0F
         Tcsy9FqyMcgOmsvcDK/ecg9wiOdooKfNVtN+C4OFCzynZreriasi+v+1KTgY3/VkKaNf
         KQ+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772453345; x=1773058145;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J9osQUYbJBXGJYIYSwB1UwRMzgazxPOiKWJljdi7pfw=;
        b=IbZp3spvRs3jeZXSCn6Zu5OxWYEdyEA56MXvbNKxsvot3dkPgB0D+XS98sDt0fBBa5
         HO+gmX7igNA8zfWwtlwPlc2LjTi07zYTKtct0WFeCi2iok7uyQazpAYqtemquOzjEGWQ
         /lNgCof+cJ5UhMcbV3cU4SXOLCBOs1T0avU5AqGVvKrCVScxZZmNA/cuVpJWz8vGz1y7
         eTqxWid1FeNatzVREKclIZaqUI9OLiCHbQ0eICxz9xF5YeHqogARzghRdfOTZOv2XOy0
         pE6gGmmz7vLW5XLtzR7yViQxj91Xm3m2ITWUg3dYcOn+5m33Do2IuLnPMU1xNBRtxpQi
         Jlfw==
X-Gm-Message-State: AOJu0YyUvL5RD8EGMoIBMhcb+SgGAJBdI19Uz52yKVeTx6DI3KbmRngE
	3+wYJOtu69j8g+6zMJHBKB6odSgvHQRsZAlg4h3Q+1bbawSaLfcAtU0Xd/Gj3M5GeuzwVMziS4Z
	qsRqO96rt5D2YPRVQbFZZod1MOkB/TXzG88ivVFzdrirediY2A26dawZGaoAwyIYMQ/m8
X-Gm-Gg: ATEYQzzjgKLOGSF2NX9pla5O8sN6RkCumpTKvyEkjY0d12KGdu4H9RMBCJCXKrnR3kE
	OgpIf7q1NjrmvK7lLinpFYs0qdBG0kgriQ6XqEmvSrWxvmHlJjryznE9qy5xHwzJL7eUlqelKLa
	GmpZbqgWORwnyRvwi9h1e9usjwfQPDGVhR243l6KfGYVFHn2+kLMGUStaDxw0m0wwA2LTDDvWn2
	gB1xqZNs6IGNY1Uu/9qCKlQALLZjtY3fgEi42M8it+dzpEVTjUHLI57MDHSxELoLJ4DfE2nxQ7r
	n4Lf1rvRsdpyO+LIyF8D9pto0LAywvPTRfSe80bdEFd/f9dFQtTX73j4lPU7HUCDiAQ19Wh4Tu6
	+i/IXatbuN7gnpe7tg3bydG5XWyy6ffhde/8uZiLOVfaKIh+bFwsPIdzn21tL+SLIA86PitOBgA
	0B4UU=
X-Received: by 2002:a05:620a:4155:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cbc8f2348bmr1193772485a.7.1772453345351;
        Mon, 02 Mar 2026 04:09:05 -0800 (PST)
X-Received: by 2002:a05:620a:4155:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8cbc8f2348bmr1193768885a.7.1772453344884;
        Mon, 02 Mar 2026 04:09:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabbd98bcsm3588549a12.0.2026.03.02.04.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:09:03 -0800 (PST)
Message-ID: <25c4608b-c447-42eb-a5b3-8d58bd93ebc7@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:09:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom_scm: page dumped because: nonzero _refcount
To: Tj <tj.iam.tj@proton.me>, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <cb59c06a-b0bb-4061-9db6-30b0b350661d@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cb59c06a-b0bb-4061-9db6-30b0b350661d@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwMSBTYWx0ZWRfX56yqdKSqQcr+
 hBLB0RhIq9jvONkRykkW3HflSoO+OvTYoW6RtJMFUJgeQ1nzzwVSndlIJT68OtSzTX7PD6D4msC
 NUXBUhlp23Qwv8UTh9K53UtaHyxCZHazs86sF/DAYUBGRcJDaJLHbErxijhkB8jCCr5Azv1bKaC
 YE0V6Zff+Jz2aKJs3KkLPdAuWi4TPHaRMYIxZyz1z29XpEv7n76XXoxasq+R3oO5OQzqDH5w57I
 1XjsnmLuBB/zmGSrsIegtzslc4z429Q72XowAMVrGKrwRyoSgNAXpt8ISVELKmWvp/85k/xyLEh
 Vet/CYkxcuBLBjqPCQGfdoAtf5vJVXv/TLhpXpx0stCbToJhV8cXH4zOAb/hX3A5losZSw2Ro0a
 xavck3QKUQxkdjlUlddaM/uERVlOZFt5Y6OOC+H1kNWiJCVdrN0NPmlGujqcteioAIuLIO6tvvE
 Yxry9+Wans1sIQJ8eaQ==
X-Authority-Analysis: v=2.4 cv=TNhIilla c=1 sm=1 tr=0 ts=69a57de2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=ubCPIDBWWyIwCIGinOUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 0hE7F_SIv7pDaJ1I910KlxTLBbDOPvag
X-Proofpoint-GUID: 0hE7F_SIv7pDaJ1I910KlxTLBbDOPvag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-94900-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 02C431D817B
X-Rspamd-Action: no action

On 3/2/26 4:43 AM, Tj wrote:
> Trying to fix problems booting Samsung Galaxy Book2 W737 with v7.0.0-rc1 
> arm64 and hitting this. Due to its nature the only way to capture logs 
> is a photo of the screen. I've transcribed it as best as I can here:
> 
> BUG: Bad page state in process kworker/u32:2  pfn:f4b01
> page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xf4b01
> flags: 0x1ffff00000000000(node=0|zone=0|lastcpuid=0x1ffff)
> raw: 01ffff00000000000 fffffdffc1d2c088 fffffdffc1d2c008 0000000000000000
> raw: 0000000000000000 0000000000000000 000000001fffffffff 0000000000000000
> page dumped because: nonzero _refcount
> Modules linked in: aux_bridge drm_kms_helper qcom_spmi_pmic ufs_qcom(+) 
> ghash_cd videobuf2_common gf128mul qcom_stats{+) ufshcd_pltfrm cfg80211 
> ...qcom_tsens(+) crc16 reset_qcom_pdc(+)
> spcc_sdm845 camcc_sdm845 ... videocc_sdm845 ufshcd_core qcom_q6v5_mss 
> slim_qcom_ngd_ctrl(+) qcom_rpmh_regulator ... phy_qcom_qmp_usb slimbus 
> ipa nvmem_qfprom i2c_qcom_geni qcom_q6v5_pas ...phy_qcom_qusb2 ... 
> gpucc_sdm845 pdr_interface qcom_rng phy_qcom_qmp_ufs qcom_pil_info 
> qcom_pdr_msg ... qcom_q6v5 qcom_hwspinlock qcom_apcs_ipc_mailbox ... 
> qcom_wdt qcom_cpufreq_hw qcom_sysmon bam_dma
> icc_osm_l3 mdt_loader qcom_common qcom_glink_smem ... qcom_glink 
> icc_bwmon soundcore qcom_smd smp2p qmi_helpers rpmsg_core smen rmtfs_mem 
> efi_pstore netconsole configfs
> CPU: 7 UID: 0 PID: 57 Comm: kworker/u32:2 Tainted: G    B 7.0.0-rc1 #15 
> PREEMPTLAZY
> Tainted: [B]=BAD_PAGE
> Hardware name: SAMSUNG ELECTRONICS CO., LTD. Galaxy 
> Book2/SM-W737YZSBTEL, BIOS P02AHG.005.190624.WY.1359 06/24/2019
> Workqueue: events_unbound deferred_probe_work_func
> Call trace:
>   show_stack+0x20/0x38 (C)
>   dump_stacj_lvl+0x78/0x90
>   dump_stack+0x18/0x28
>   bad_page+0x8c/0x138
>   __free_frozen_pages+0x4dc/0x778
>   free_contig_frozen_range+0xd8/0x128
>   cma_release+0xf8/0x378
>   dma_free_contiguous+0x34/0x88
>   dma_direct_free+0x100/0x188
>   dma_free_attrs+0x90/0x248
>   qcom_scm_pas_init_image+0x14c/0x1d0

It seems like this calls __qcom_scm_pas_init_image() for IPA which then fails.

Is your laptop LTE-enabled, or Wi-Fi only?

Are you sure you're using the correct, model-specific IPA firmware? Are you
sure the related reserved memory region in the DT is correct?

Konrad

