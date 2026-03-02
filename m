Return-Path: <linux-arm-msm+bounces-94969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gNLTMymjpWngCwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:48:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7149E1DB20C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 15:48:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8F4453008D57
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 14:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9775B3B8BBE;
	Mon,  2 Mar 2026 14:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BygCyaR7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UkBqJOa8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EDE440149A
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 14:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772462887; cv=none; b=dLTdTwoz1/wCQ7N7d5uInkadGZVasOqc/QGZtLU0sPdaSPPn/a3ytRvUsOiO4/spYKim+/T/yBZncabB4cL9J8Map95kLv7OmvdiqxLmIx7SlNucQEOzohNOfgdsWJNcdPrzIHRHpLc47QDOHomLlmrRRGfpWpwJjBKSkp6BJA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772462887; c=relaxed/simple;
	bh=lI32XefUqapdONI9JPFZ3pWOOLzdCalWhim+ixZmhOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mjPO/5r+fOPn2ERVMQKO2dzJaaw0J3Pf/3G59OhRky3Nj9uf+s081bCac91ytVKQ4U1F8FaPaus/AAH7uVs36UaxsaEEOPyYPlgdtyNXiet8/Y54EN05FOiOBd909P1gQavkii4Tjkm1rpTZMB6md84aG2BI4fe3zKDgc9Sj4jg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BygCyaR7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UkBqJOa8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 622B4Mnq3561517
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 14:48:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0F/oCKlL7U3lkkMuuhVGmxO8Sor7Ddx92Ruim/0v22I=; b=BygCyaR7Hf4Y/IHx
	SCdrhbThCQJ7RVsrBNqPB6e5UYzH9ZdURdGthhFBrOFZcGDkkXpdpHqXSSWKBeme
	CoDZ/5lSD+t3nO2YjFvJvreyZWAJa+iYXNCkbWk4av7KfUMcHYn+al78qZcEkt4S
	qHNECE2NoMnjn1MNlBjkZ926+JCMb8U7Bw1Y3xIN+Vvgi50NtoY3+ma/0SHbwlBS
	c2gzLycgw53Bqx4dh9mHtaQwDkeyx7sbGZIK6/o20pEildneOc3WR3fs2nOfpCoS
	DJ5d5nRf1wngduIFPKhzKflwWQJ4HnSogUIkrmvN4+FEyNRjnwdxd2lg4F4HYqsG
	8YR8Gw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn9bv8ns2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 14:48:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb45a6b860so327610385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 06:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772462883; x=1773067683; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0F/oCKlL7U3lkkMuuhVGmxO8Sor7Ddx92Ruim/0v22I=;
        b=UkBqJOa82c+IUkpxbGi1StG7kBbGPUcX48tYYqL+S98QP79XymDcavYzcv/TpozyT1
         CSJOaPZ9tCK7udojF6cY1e04FUiouEuhy0E+eVpQ/+K9lyMHllnH+ML7Ulxz5Ck4HcXr
         TSJvPPuC6jkzTdL9rPrg5kJeCH5xj4DGdeRCX0nqbxVksMhEz63Wbceq/DdemtSZ35Ro
         Gyu52eGjksinW/0FveDjkNnlzWxGVOzlmnmZfBVYRJKo8cDaRZwDOGkXJGx6zXrRGON7
         Njpa7qEvu36VPMAFYfTKPcsu7eaFgqLbOIXIwoAOBNLn8QBh8baUAmIO2zzPQhnptpdJ
         xTFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772462883; x=1773067683;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0F/oCKlL7U3lkkMuuhVGmxO8Sor7Ddx92Ruim/0v22I=;
        b=uXcWVsZTiTfS5ognDmKjGtl1sESvBUJTNJJnaTV4vJWCsPl8iM7gBOjlr97toxkhC5
         D2m0aN9tnJ+YSjeGhJFTcLeytGIx3+g07mYfbxd7yZmg94Hbbq/JFARgeyb9F+JCbO/j
         xXKaIfWy+45oq9key9insT4jD8KZbIyXFgbcoP0F0W6f+rVAVXZpSRs7FQo92smm/KU8
         9ea0eEOeCLfFL1suEEwcDa1asLfYZwRD5oBkGWmt+m9txOeab9zk8u/gnMLuUlKeMvrv
         o+FWEyvnPzYVN6WX2jFK6WG6968eGSzMFWfy3FFm5/ZBb0tAduiIpI6hhFF3HfIym37E
         WU1A==
X-Gm-Message-State: AOJu0YwP5btJZZCF0WlBZUjP1F1PO3Ukkq3fAfXsVEuDMvKx05Vie1b8
	dTxRhskQHknAtRkFh/l8GiVIjXbF8mTqwFkfnexeeGQbQ5sJHLR1B+FMDo1kVBosx2kapEZBaks
	nxLhj2yiay0wTsZ7WDPj+4iOsp80Oq4Gi00DK0DGO+VeVmyk0e4VHeYNzY3EtMFYV0vH7
X-Gm-Gg: ATEYQzzSjkVprbx7Z+3gRCqiJTXGZVvXKfujBnv+2W5u0P+VodJEnGbGafah5HT/QWt
	91eiWJb0EEl6J9wBU9py33TmN0FGWKHBPVuqzKul7kuKjrSVZ/k9t5Eh0wnxtbWDNImZ0qukilM
	YGHal1XFc3midvaojw3TGVIVYo68y46S9/jsgKP0AbL3BC/nOD53NKA5VqLjo3oHFVte/Va8hYa
	adM9pmOAqLhL5jTqCXD75YG+aScKuKYPUISl0goGhGxyXdMyV0kBuVpG+l3C5lhSYLBPLoVqLHu
	PQ+Zop8vd8Idxr0AkqMDnyYrFk0oTTEMxr5UWulnFW9rMatAQCsenNUK269z0gUIduf5l9EHT98
	Pl95KO8wgny1Rssctx/cgbtpXn6XBhKGkJTYZdhnivUwavkUajKDfbgG8WyogVgybS0HcHYs5el
	EihH4=
X-Received: by 2002:a05:620a:3945:b0:896:ead2:a657 with SMTP id af79cd13be357-8cbc8d9542amr1134641285a.0.1772462883006;
        Mon, 02 Mar 2026 06:48:03 -0800 (PST)
X-Received: by 2002:a05:620a:3945:b0:896:ead2:a657 with SMTP id af79cd13be357-8cbc8d9542amr1134638285a.0.1772462882455;
        Mon, 02 Mar 2026 06:48:02 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabf6d1c6sm3349990a12.17.2026.03.02.06.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 06:48:01 -0800 (PST)
Message-ID: <06ddefe3-2048-4e79-80a2-8d998b2c6a51@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 15:47:59 +0100
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
 <cc10cef2-f032-460c-bbc3-2ec9b5c922c0@oss.qualcomm.com>
 <8cf12905-8221-4f4c-9158-42984d26b0df@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8cf12905-8221-4f4c-9158-42984d26b0df@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: pCvQVXSAkaqFjqxanpzedPTnQCDW3QW1
X-Authority-Analysis: v=2.4 cv=S83UAYsP c=1 sm=1 tr=0 ts=69a5a323 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=GmRZfpRwJRRQWNTf0P8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: pCvQVXSAkaqFjqxanpzedPTnQCDW3QW1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEyNCBTYWx0ZWRfX8vTgDO92/3oU
 tvbQtdixNfuDNEMypNGBF1faKS2+qdb10ft8KKDOOv+4hk/qjDeKREgzkihAy+vcUAvWEUekV01
 oHn6Nv6J4uZ/XuevOvsPbyLGlSZ+DSQDDVYpd0MANEfyjfSCDwxfNLsmk8VuG3XdbTFQgqfVORT
 Aeko+d+ktDIJjvCCMyBdu89xtlfX5x4avoMcY0gnSPM+qqeykgbLYn4EuFRVaxA8DZntD5dDh1o
 x8eD0e97yR9I/tZrzGedFWXMDJVsZpxm/5UtW5HOrFNjnZ6nSEqxZSECOJlYvOzSNlNpCQ5p+J6
 7ytWgmReI4hCM+bIV3YdqmPISnsUP0xrSN5gEpLHc3oCWAPRzkZBHSaMe4dnKgL1kX2zu8eSK5y
 EyUS9qavLW+MY23KA+4I2Pt7QUui3f7v22BhbKNdCpIbumc9FOJnE2boOaZ4FIrPcUo11oH6nuy
 jOKyBj4aCCLTAc2+jdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-03-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 adultscore=0
 phishscore=0 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020124
X-Rspamd-Queue-Id: 7149E1DB20C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-94969-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/2/26 3:36 PM, Tj wrote:
> On 02/03/2026 14:22, Konrad Dybcio wrote:
>> On 3/2/26 3:04 PM, Tj wrote:
>>> On 02/03/2026 12:09, Konrad Dybcio wrote:
>>>> On 3/2/26 4:43 AM, Tj wrote:
>>>>> Trying to fix problems booting Samsung Galaxy Book2 W737 with v7.0.0-rc1
>>>>> arm64 and hitting this. Due to its nature the only way to capture logs
>>>>> is a photo of the screen. I've transcribed it as best as I can here:
>>>>>
>>>>> BUG: Bad page state in process kworker/u32:2  pfn:f4b01
>>>>> page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xf4b01
>>>>> flags: 0x1ffff00000000000(node=0|zone=0|lastcpuid=0x1ffff)
>>>>> raw: 01ffff00000000000 fffffdffc1d2c088 fffffdffc1d2c008 0000000000000000
>>>>> raw: 0000000000000000 0000000000000000 000000001fffffffff 0000000000000000
>>>>> page dumped because: nonzero _refcount
>>>>> Modules linked in: aux_bridge drm_kms_helper qcom_spmi_pmic ufs_qcom(+)
>>>>> ghash_cd videobuf2_common gf128mul qcom_stats{+) ufshcd_pltfrm cfg80211
>>>>> ...qcom_tsens(+) crc16 reset_qcom_pdc(+)
>>>>> spcc_sdm845 camcc_sdm845 ... videocc_sdm845 ufshcd_core qcom_q6v5_mss
>>>>> slim_qcom_ngd_ctrl(+) qcom_rpmh_regulator ... phy_qcom_qmp_usb slimbus
>>>>> ipa nvmem_qfprom i2c_qcom_geni qcom_q6v5_pas ...phy_qcom_qusb2 ...
>>>>> gpucc_sdm845 pdr_interface qcom_rng phy_qcom_qmp_ufs qcom_pil_info
>>>>> qcom_pdr_msg ... qcom_q6v5 qcom_hwspinlock qcom_apcs_ipc_mailbox ...
>>>>> qcom_wdt qcom_cpufreq_hw qcom_sysmon bam_dma
>>>>> icc_osm_l3 mdt_loader qcom_common qcom_glink_smem ... qcom_glink
>>>>> icc_bwmon soundcore qcom_smd smp2p qmi_helpers rpmsg_core smen rmtfs_mem
>>>>> efi_pstore netconsole configfs
>>>>> CPU: 7 UID: 0 PID: 57 Comm: kworker/u32:2 Tainted: G    B 7.0.0-rc1 #15
>>>>> PREEMPTLAZY
>>>>> Tainted: [B]=BAD_PAGE
>>>>> Hardware name: SAMSUNG ELECTRONICS CO., LTD. Galaxy
>>>>> Book2/SM-W737YZSBTEL, BIOS P02AHG.005.190624.WY.1359 06/24/2019
>>>>> Workqueue: events_unbound deferred_probe_work_func
>>>>> Call trace:
>>>>>     show_stack+0x20/0x38 (C)
>>>>>     dump_stacj_lvl+0x78/0x90
>>>>>     dump_stack+0x18/0x28
>>>>>     bad_page+0x8c/0x138
>>>>>     __free_frozen_pages+0x4dc/0x778
>>>>>     free_contig_frozen_range+0xd8/0x128
>>>>>     cma_release+0xf8/0x378
>>>>>     dma_free_contiguous+0x34/0x88
>>>>>     dma_direct_free+0x100/0x188
>>>>>     dma_free_attrs+0x90/0x248
>>>>>     qcom_scm_pas_init_image+0x14c/0x1d0
>>>> It seems like this calls __qcom_scm_pas_init_image() for IPA which then fails.
>>>>
>>>> Is your laptop LTE-enabled, or Wi-Fi only?
>>> It has both SIM slot (unpopulated) and Wifi.
>>>> Are you sure you're using the correct, model-specific IPA firmware? Are you
>>>> sure the related reserved memory region in the DT is correct?
>>> Firmware was copied from the MS Windows 10 Home S installation (that
>>> works correctly). I've checked shasums match.
>>>
>>> Not sure about the DT (not familiar enough with reading DT at present)
>>> but it is the mainline kernel's DTS (with qcrypt disabled as mentioned).
>>>
>>> arch/arm64/boot/dts/qcom/sdm850-samsung-w737.dts
>> until you find a uefiplat.cfg file. You can then `cat uefiplat.cfg` to
>> read it. It'll have a section with a lot of long hex numbers representing
>> the various reserved memory regions.
> I'm attaching  uefiplat.cfg

We have this line:

0x8BF00000, 0x0D600000, "PIL_REGION",

which is a big region for all the remote processor firmwares. This
unfortunately doesn't tell us where (and whether) the IPA FW specifically
must reside, but we can take the conclusion that it's at least not fatally
wrong.

Please try just disabling IPA (change status = "okay" to status = "fail"
in the DT file) for the time being.

Konrad

