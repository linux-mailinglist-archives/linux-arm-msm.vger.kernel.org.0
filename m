Return-Path: <linux-arm-msm+bounces-94958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yGBWIbSfpWl7CwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:33:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF121DAE60
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:33:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5330C3193347
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 14:22:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 299B03E0C74;
	Mon,  2 Mar 2026 14:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lp7VfNxZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f7Btp/U3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF393E0C68
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 14:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772461366; cv=none; b=u/cSHyujE1fdOIjD0RhVLz/lhtS9gYfKlQogJMo5YVsH0uERB+PsujIcmB1d5mPmk62MdscQTpWJO7F+7tzL6/SwdfnlTJYwWKgzz8QQ7Sb16NFgBTHxMJvERIuefNRNwxiVtuqZ6tdCcjYuvqMinM8BN0Zo45OqpGTb1OIZZ0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772461366; c=relaxed/simple;
	bh=47H96dEbRked7ethp0WknPQqgq36u2UmGCJda6dZSXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZyCGGGWNLGc6XM4Gatmd2Y+lmZrQg0jTyixxCia8zJenbEANnorEoLQmDnfckSSbpodt8/UNPteDgtNO43shwwm1cydyhDXo4jmRWujd4kViyaqFiIUit6Vl5kPGgXIbsDo76+yaruZJjf1PkiIKjdG05QqmIyXVGU+dTyva/5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lp7VfNxZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f7Btp/U3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622Cf0td2504592
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 14:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+PebVSY39pMNHYxeEI//Kbu5jJIk3Iv5G7ZWNTcYZIA=; b=lp7VfNxZJM8Rea3T
	s0EoFtz4ttDjnsVNVjAu2ql+ri4w8nyStvfJIudWJvezTKUkyPHB/+PVE471b+A/
	j8q41tAUqz7JJNW2o0DMiX2kY30DYpM3W0wf58Sr2JaTIMaWumOvhSBYnsigdfK4
	FhCCCTuwV8U9zffS7Ro+XhFTwK8YqasViYlhXQm+mfP4BkVprTVczUYhVAl9ASNh
	YcPUkygFp4oT6/rM3yrLJW4dvbYdKDtagaDiJKh/C5PaAMEYNmEc2hYnXIgkjY3n
	KbBsAbvQ7ur42mZFnRz8CvZE5iUZTkY7gx0bntr82FqICzBzgp325DL6N+CXOa8p
	ZchAjg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn5hesk6j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 14:22:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70cb31bcdso422041185a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 06:22:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772461363; x=1773066163; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+PebVSY39pMNHYxeEI//Kbu5jJIk3Iv5G7ZWNTcYZIA=;
        b=f7Btp/U3CnhCv2F+iGAdPoP+XG483lVo0eEdc4AzT+2LBIzKVm6pH5HwEHphqJa3QO
         T31sgg0MSQGHT2n46Oa64l3UqenJo1zbhG4g8kvapopdiS1h8GTNtc0ZEzVhvMk6SIca
         iOYt4e0h79X5kASDr0QC/G9Lbe55o+1GuoM4SXL02RZOKk8pk+yzFeWVmFYjwhNUAdOT
         jIJ8CoNQj+qsrxsOvVz4Ae6OTFoOat+XxL46XLkC8nXdJhDGktt/QlzptX1pprspIEif
         /dE58wBQoa1ipcVahYLarXhkzxGRSI1RatHnmqUwN6y4HWGYqi5YDI047g4RDnaQt824
         r0hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772461363; x=1773066163;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+PebVSY39pMNHYxeEI//Kbu5jJIk3Iv5G7ZWNTcYZIA=;
        b=aGPsMOvGeREN9Z/foweysUOQ6yZONHZjV6HFrJ8K0AwKe0FLcpLKMofXnt3c9zdSTH
         Dl6qR6TcvGoXK0AFKaAigedeF29nvRCimzFpt8dDd7rPVub6+SV43tjgiIkcVnWmvz/m
         fkM8X4p8NXHurmGfczyWKXCbFHH8zWDcni8wQfljFY82a3BE9CKq6iVLhyc+/sg9Vf6h
         VZQnw/wpSDEzRCDbhNU+wrt1eVXo0c4ynbjcvKXlWuAnNWR2Z2Bj61cGxQhTSAVa3Emt
         O2ecca4Hm/jFkIF70zC89jY0DToZcjw/qYoZcZdVYea8v9tufpkYN3fwgcGg1K12hkkB
         7c5w==
X-Gm-Message-State: AOJu0YxcsS6s+1VLMzfUeLyNx94ngNvRfZBazOUMj2g4xWQal7yH//D1
	7kj1bHDJZ9zpTXZ6bMclaUrZ1mlHL898tvWKKRbRBoAD6+qFH4TZCZfDeVdTMlbKsqHow/vzyrm
	nInTSiJYZBbEVFPb6QJ3pLzHyd9KyOr4KSLnjgMV3MPaPAeCO8uTVISIumVNVGXgdUmqj
X-Gm-Gg: ATEYQzzV0HHEfynG++KcJQ7/oNwPTYQR1i1yq/KG7i7SW5uvhWwGsPQY1AUsNrMBcH1
	JTB5H1xJGy2+x7t+JQbIJq9uZcKqbBxWzZZjG9vRQUaLL2L28eaK4mVXRIV/V07R2Lg8XrhxExk
	py0TIlg92NtdZeefoEHMuJPfd+kU6+Iv3PZKAjlsBg44wt86g6m8YwM5kFDFel2m6pa96hqs9vv
	wN7Ugu3fU3Psjh+pGQnUCdIXhfbWkL4EbE5Zwe2hOm5ftS7d1gmjtcydL6y+pTrHj2GtFlg6B94
	dp4jZSKSIzTvSzUSHeO1TB0t5+R0869dNFX76rQTVbij4E4+Ya2PqM5CCAdD+At2toZSdsdZCw+
	BDygBCCDxafEYaqg9/PQFLybAjm2n3w/Auo0Z4H1ADaL4FhoK7bAfmmbzi4/cGhHro9N8Vd5Wz6
	NtFzo=
X-Received: by 2002:a05:620a:7084:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cbc8e50f80mr1210051185a.1.1772461362967;
        Mon, 02 Mar 2026 06:22:42 -0800 (PST)
X-Received: by 2002:a05:620a:7084:b0:8b2:e346:de7b with SMTP id af79cd13be357-8cbc8e50f80mr1210047585a.1.1772461362452;
        Mon, 02 Mar 2026 06:22:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935ac70b01sm473646866b.23.2026.03.02.06.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 06:22:41 -0800 (PST)
Message-ID: <cc10cef2-f032-460c-bbc3-2ec9b5c922c0@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:22:39 +0100
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
 <25c4608b-c447-42eb-a5b3-8d58bd93ebc7@oss.qualcomm.com>
 <94629352-595b-46bb-9c11-505aa9db0a1a@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <94629352-595b-46bb-9c11-505aa9db0a1a@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BI++bVQG c=1 sm=1 tr=0 ts=69a59d34 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=_GKv7X2WUSUI2_0JmRwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: gn8B_2qN95R9-1Mmo3aGIBWD9ShfEq7x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyMCBTYWx0ZWRfX0vzDjEAl0nRa
 nHQENdf9WQWCE4kdY6WYxntZTyMLGEOMiK0UEx05Bxax7e6AJjUjQZ3UAethEZ7nAUu7U0wTTRV
 BtBFtuFNs7aZDnstRb1Shxn0XE2eh9iv8YPuR9lUZJEntFCnsCsySnrx+u6xqAwWQ4nS4QhneO0
 dvzRHCK+8WRUdqpZaSm1ApIEemVtM/5Lpazuwu8tnKMEN1D+bLWnbcvd6LGalNZ0XDr2Xs2ILaI
 yvfoq/8uSbyqAYB9ZmPQ+YzpGb1xud1Cbe6+Hp3oYuoSfT/KoZtuqBmPUS9tWIBz/Jfit7q1aFq
 Fu+d3yEv5SD58I60LL1AkWK9v6nV3DYQx9R38aaAixd25trjHf2ZlXLm6rC6MQQdfX5LMHCRs6s
 D1+HCKCRZDg/e2SxEUxZK5OAf1wKoeVuOpvAAmbgB/v5pxoQkvyrtWpSBm71Ao7Tmgu+eY2xokS
 KzADvIEwo1GqE3dgrKQ==
X-Proofpoint-ORIG-GUID: gn8B_2qN95R9-1Mmo3aGIBWD9ShfEq7x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 adultscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020120
X-Rspamd-Queue-Id: DAF121DAE60
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94958-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/2/26 3:04 PM, Tj wrote:
> On 02/03/2026 12:09, Konrad Dybcio wrote:
>> On 3/2/26 4:43 AM, Tj wrote:
>>> Trying to fix problems booting Samsung Galaxy Book2 W737 with v7.0.0-rc1
>>> arm64 and hitting this. Due to its nature the only way to capture logs
>>> is a photo of the screen. I've transcribed it as best as I can here:
>>>
>>> BUG: Bad page state in process kworker/u32:2  pfn:f4b01
>>> page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xf4b01
>>> flags: 0x1ffff00000000000(node=0|zone=0|lastcpuid=0x1ffff)
>>> raw: 01ffff00000000000 fffffdffc1d2c088 fffffdffc1d2c008 0000000000000000
>>> raw: 0000000000000000 0000000000000000 000000001fffffffff 0000000000000000
>>> page dumped because: nonzero _refcount
>>> Modules linked in: aux_bridge drm_kms_helper qcom_spmi_pmic ufs_qcom(+)
>>> ghash_cd videobuf2_common gf128mul qcom_stats{+) ufshcd_pltfrm cfg80211
>>> ...qcom_tsens(+) crc16 reset_qcom_pdc(+)
>>> spcc_sdm845 camcc_sdm845 ... videocc_sdm845 ufshcd_core qcom_q6v5_mss
>>> slim_qcom_ngd_ctrl(+) qcom_rpmh_regulator ... phy_qcom_qmp_usb slimbus
>>> ipa nvmem_qfprom i2c_qcom_geni qcom_q6v5_pas ...phy_qcom_qusb2 ...
>>> gpucc_sdm845 pdr_interface qcom_rng phy_qcom_qmp_ufs qcom_pil_info
>>> qcom_pdr_msg ... qcom_q6v5 qcom_hwspinlock qcom_apcs_ipc_mailbox ...
>>> qcom_wdt qcom_cpufreq_hw qcom_sysmon bam_dma
>>> icc_osm_l3 mdt_loader qcom_common qcom_glink_smem ... qcom_glink
>>> icc_bwmon soundcore qcom_smd smp2p qmi_helpers rpmsg_core smen rmtfs_mem
>>> efi_pstore netconsole configfs
>>> CPU: 7 UID: 0 PID: 57 Comm: kworker/u32:2 Tainted: G    B 7.0.0-rc1 #15
>>> PREEMPTLAZY
>>> Tainted: [B]=BAD_PAGE
>>> Hardware name: SAMSUNG ELECTRONICS CO., LTD. Galaxy
>>> Book2/SM-W737YZSBTEL, BIOS P02AHG.005.190624.WY.1359 06/24/2019
>>> Workqueue: events_unbound deferred_probe_work_func
>>> Call trace:
>>>    show_stack+0x20/0x38 (C)
>>>    dump_stacj_lvl+0x78/0x90
>>>    dump_stack+0x18/0x28
>>>    bad_page+0x8c/0x138
>>>    __free_frozen_pages+0x4dc/0x778
>>>    free_contig_frozen_range+0xd8/0x128
>>>    cma_release+0xf8/0x378
>>>    dma_free_contiguous+0x34/0x88
>>>    dma_direct_free+0x100/0x188
>>>    dma_free_attrs+0x90/0x248
>>>    qcom_scm_pas_init_image+0x14c/0x1d0
>> It seems like this calls __qcom_scm_pas_init_image() for IPA which then fails.
>>
>> Is your laptop LTE-enabled, or Wi-Fi only?
> It has both SIM slot (unpopulated) and Wifi.
>> Are you sure you're using the correct, model-specific IPA firmware? Are you
>> sure the related reserved memory region in the DT is correct?
> 
> Firmware was copied from the MS Windows 10 Home S installation (that 
> works correctly). I've checked shasums match.
> 
> Not sure about the DT (not familiar enough with reading DT at present) 
> but it is the mainline kernel's DTS (with qcrypt disabled as mentioned).
> 
> arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts

We need to know the actual memory map that corresponds to the vendor-modified
platform firmware on your laptop. I think the easiest way to get that is to
fire up EFI shell and go through the mounted flash volumes, via issuing:

fs0:<enter>
ls<enter>

until you find a uefiplat.cfg file. You can then `cat uefiplat.cfg` to
read it. It'll have a section with a lot of long hex numbers representing
the various reserved memory regions.

Don't write anything to these directories though (I don't know if it's even
possible but take care as if it was), as you may irrecoverably brick your
device.

Konrad

