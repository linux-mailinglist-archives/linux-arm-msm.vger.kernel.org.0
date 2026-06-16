Return-Path: <linux-arm-msm+bounces-113381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BS45FIguMWq/dQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:07:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C23968EA4F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:07:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=MSTtf2jJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Amu7wNX0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113381-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113381-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 41992307071D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E75BA42982C;
	Tue, 16 Jun 2026 11:04:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5C942981C
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:04:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781607864; cv=none; b=XOIiLQ8rIU9YJvB60fjpoMTzXaWXIj0CwAEmxsLX/aUC538pYX9hfAqGMYHnghq0nIjLUiBVf/oxqSTnSVxn2pd7tBnvsKCvBNcP15iOioRVZ2IiwhCequfnRPhxrzp2SSKUnqZ21VOOFXu7xou5auqpazIjBjkfxa2MPfj60UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781607864; c=relaxed/simple;
	bh=vIEZ1m1WpXM09pbOXin+8s65/YNE5Q6ZCrNcP1lErZA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GynxymVRxe2qExHVyM1XE77SLlA7VcGVrsjK3VOZpWIHCmLCX2b7LavaMqRMb8+hc6LLoqkkSdYJdlItzRkZUEV+zU1SJTvybs5B3//zdpLl3WoA82N9epymg7VgOBIPyvflejwN43+lYCXAP/A0MrHCeXfqsqhIcJSh5OAAP0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MSTtf2jJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Amu7wNX0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9KoV2914553
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iqQLFMtWSIeZyJFVxSss6uF9qGy9NdDKnU2xllSx0Wg=; b=MSTtf2jJqGmJ0Ukx
	Ftpajts/fnajSBz2s6syg5yldd/kLiOjRXq/Q02I/E7qzqlMIutN4L8pldwoPjhU
	17eQiyUwhChLF3pF5VfzroY/1immOrNOHteXBrDMw/OjZ5lTYRNuxIYAB3Ob1l6o
	6zJ8++Oy7K7beyRaW6E9E96E+7zT1xgphL+1detKEltqjb3iTvNKWSnIvhEkzPad
	cYqeC86XszgKhRfyLDnPf659BtsrnYnT/4WPtD73UFbqVp+M2zXmpuP2WrL8w6WM
	kK+e6L9+lIM46dJEpe52k20J6z8ch1oSRbDnnfLmRdasfo/PJZnu3+QrhGPlg3Rr
	CuLUcg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu17614tu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:04:22 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ccd9683350so16594096d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 04:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781607862; x=1782212662; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iqQLFMtWSIeZyJFVxSss6uF9qGy9NdDKnU2xllSx0Wg=;
        b=Amu7wNX0oMXs0b9WgC3Sjv1ASYX+EZ5X1UmNZEcQvA8qdj3kKe/TNzUc53s5fiGRb0
         IitSObA3VHpai+IJy5pVw9Iw90C9jy+cc1iE5uov6J4XdUeJqFpQUDBWB8TwGgevttAd
         O29CLGH4nNPdk8QcOLuYW/nNprsQPXTCgkmG5HsP6G2lgtsXZmZNhltGYaN2fl47YRaj
         uprMawoSHzaTQsvsEBHqn/4NVcQZg2O6CwmmctcspqhoeRNjHU4SgjMV9FtMYzv1qDJq
         VPHRM9eNUM+J7iIkNkwA/RJ2iRM6zEsmXqjWSxpsImwBxU5szD4UXv5r6oEnrwV4OGp6
         pRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781607862; x=1782212662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iqQLFMtWSIeZyJFVxSss6uF9qGy9NdDKnU2xllSx0Wg=;
        b=W2HZe+vGxao0z838BEnmXoirq6QSEXyASvhaDrcR1aFfwxas/7w4CEGJlnPNw4CAOr
         iJzEixYF/J0MI9ureEBIDS5D1R+tTjkQrqQHqtHH2+4gvRSRHm39Pa5hknqZLQb2BcyV
         kuewJ+DAijlk2NAyhuyzDDL7z8eI0vk3tSDbO8KXIOHhFSvZflcyiZGECE4gVF3YojeY
         J0V6guY5iPMrG2LKKVeimwIHYmPH5zW3p6C1eka6P9ADdaqv+ptsYAjQhe/0uAnL2fhd
         evRSA/vf9P76nN4eCCKXWqILXMFWGzzVEWiZM6vgXRKvdP10y1u0XyPFw3yeUbSQT3LF
         1+1A==
X-Forwarded-Encrypted: i=1; AFNElJ8FE9I8ddK4+K2gBoS2JKrp/H9hEx9eCVNBxQGvpJNXf/tDCc2bDK6hEJrmUOPfiaDbKEbOtO8C4mxFaNVD@vger.kernel.org
X-Gm-Message-State: AOJu0YygeToSFYtan2PjRJx2hTIp7jaDtzqnNT+tquD5QsGjxY02jgjR
	c4Bw2V3mwYyjetlBE8VbDd/msKUXCWz3BHz7/guJt5QjC4yi1PhiHpbTxcRcPgh4dNIznKPoJJi
	2LR5hKlAkY45Ylpo727yRsfhX6R3r5CIaf8vnWzr3j5+xzLNXw4sNBbGjZgDszxUZytvlExvd/K
	SK
X-Gm-Gg: Acq92OFSiVv3Z45MfdiMlKKaVktue5JBQE7nrrCMr30hsANOyBbI+wLHcPQxWAjOGHK
	nODMb7Oy7h+tam6VQWMuEJV9oo/yAdYteumq9zQh8VDhF72Sd8AiZ1Qt+S3NktKZu5z2rjvTrai
	Dt/ApSower/N+OKyGTftdSyovptEMrVyttTxnE3thdPVqVq1jNG8942bnbh5bsL+CDLOMz69YvV
	ZYB2UNnsL0Ifh7JDA91NNkn0L8fySvR+3uhAJe/3EyLjQoO/fra1WFsF2t8PiCSIveMRmfUcgNF
	eHBaxytAM6QY/RNSXHjLsbjNIpC0eFyeO8g4+y8w51gvu8YQwmmUXQbMSU2cCIdnAhFlGWl74RF
	SfWaW9Bcc+R5X28/Q/PjmwyFyVx9Ej/8RJ5NlpeJJTkpzMg==
X-Received: by 2002:a05:620a:2714:b0:90f:7ce2:3019 with SMTP id af79cd13be357-9161bd622a1mr1628988885a.7.1781607861844;
        Tue, 16 Jun 2026 04:04:21 -0700 (PDT)
X-Received: by 2002:a05:620a:2714:b0:90f:7ce2:3019 with SMTP id af79cd13be357-9161bd622a1mr1628984585a.7.1781607861139;
        Tue, 16 Jun 2026 04:04:21 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693c43a6d9csm4226714a12.13.2026.06.16.04.04.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:04:20 -0700 (PDT)
Message-ID: <21a97c4b-293f-435c-91fe-ca7394b5a2b0@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:04:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa: Fix xbl_tmp_buffer_mem size
To: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
 <20260525114749.5939-2-johannes.goede@oss.qualcomm.com>
 <7d2aedb2-4bcd-4453-80be-5c7ca6bdff95@oss.qualcomm.com>
 <7ebbddb0-175b-4023-91ee-93d23e5162ba@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <7ebbddb0-175b-4023-91ee-93d23e5162ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1p8e8mhg2HLW6VZlSI2pEhCmHNkq0cSa
X-Proofpoint-ORIG-GUID: 1p8e8mhg2HLW6VZlSI2pEhCmHNkq0cSa
X-Authority-Analysis: v=2.4 cv=I4RVgtgg c=1 sm=1 tr=0 ts=6a312db6 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=iFyFSK6nKW8e_JCYEZ8A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExMSBTYWx0ZWRfX0yoaCPhn/j8j
 ljc8yOrPH/bVCSIdFuS6j9vkCOgiogKt5hCAkwr/tQNyGTdhW/od1szfI7u3zR+/xzAgJCJtJtr
 SjAU9bDvSS1SKpck2m3wuVvcnh+zeGA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExMSBTYWx0ZWRfX/a9fRwxGaNPU
 qvXSe+sK33tMJeuVQn5eM/bjq7hnkQ+uJ9ecSz+g7/iz45fVL5c6Iv9MvZESPPEuhc45z2dvWbc
 /mxS2wUBSxBP1SzGZkCv39OkMSNM5F6+zGdkGO6QDZaa98jdLDp2B2zT7YubSbbuKIqZXOQonQc
 BYwmxodMdnMLELTQAuVyyxbGET0rGd36xSjtaGbJgCRsW0u92elbnXuG3eiJ3ENiBvXSLfR8+zf
 K5EACn4h13Ng3OjVxjGnF6bZb/TffwxH1yZ60qMkONvf87dOGIBoHDhzJXiyG5zLgwlSrx6tw6W
 Se8mNsM1tc5JWZ/5F9dGyyoATbGEnyhZSu6KEZm0GMWLE4z31vzfd9xbrNVlm2pTlyVBlYkB1nQ
 /h1dRF7N5A6hKaaSJ+0DMTo+iHFgtJBS1G6kQgCISCJT2Wpq1hi7B5WF/aEVoMLxM0QskBvWD1L
 lJEQSFvGxX85n8VUy8A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113381-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:johannes.goede@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0C23968EA4F

On 5/25/26 2:46 PM, Hans de Goede wrote:
> Hi,
> 
> On 25-May-26 14:29, Konrad Dybcio wrote:
>> On 5/25/26 1:47 PM, Hans de Goede wrote:
>>> The EFI memtable (shown when booting with efi=debug) shows that the
>>> xbl_tmp_buffer_mem region size is 0x1c0000 bytes large not 0xc00000 bytes:
>>>
>>> efi:   0x000082800000-0x0000829bffff [Reserved    |
>>> efi:   0x0000829c0000-0x000083efffff [Conventional|
>>>
>>> This fix aligns the size with the EFI reported size and makes /proc/iomem
>>> correctly show mem blocks matching the EFI memmap:
>>>
>>> 82800000-829bffff : reserved
>>> 829c0000-83efffff : System RAM
>>>
>>> Instead of:
>>>
>>> 82800000-833fffff : reserved
>>> 83400000-83efffff : System RAM
>>>
>>> before this change
>>>
>>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>>> ---
>>>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> index de0f2346cb38..5a2e84365901 100644
>>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>>> @@ -582,7 +582,7 @@ tz_stat_mem: tz-stat@82700000 {
>>>  		};
>>>  
>>>  		xbl_tmp_buffer_mem: xbl-tmp-buffer@82800000 {
>>> -			reg = <0x0 0x82800000 0x0 0xc00000>;
>>> +			reg = <0x0 0x82800000 0x0 0x1c0000>;
>>
>> FWIW the reference memory map shows a contiguous block of:
>>
>> 0x8280_0000 -> "no reclaim XBL scratch_buffer2"
>> 0x829c_0000 -> "reclaimable XBL scratch_buffer"
>> 0x83f0_0000-0x8400_0000 -> "no reclaim xbl scratch_buffer1"
> 
> Thanks, so the first part here 0x8280_0000 - 0x829c_0000
> aligns with the EFI reservation and with the dts reservation
> after my patch.
> 
> 0x829c_0000 - 0x83f0_0000 being reclaimable matches with
> both EFI + the dts (old and new with a different start)
> having this as usable RAM.
> 
> The 0x83f0_0000-0x8400_0000 area seems to be marked as
> reserved by neither EFI nor the current dts...
> 
> With the first part of the reference memory map aligning
> with what EFI shows, I think this patch is correct.
> 
> I wonder if we should do anything about the 0x83f0_0000-0x8400_0000
> range though ?

The logs in your commit message suggest the UEFI ahd already taken care
of reserving that bit

Could you post the full output of `memmap` in uefi shell on your device?

Konrad

