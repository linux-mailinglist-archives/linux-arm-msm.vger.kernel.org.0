Return-Path: <linux-arm-msm+bounces-109654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CYy4BplEFGqhLgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:46:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8061F5CAAA3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 14:46:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4CA833010C09
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 12:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E6420FA81;
	Mon, 25 May 2026 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xr8rb4c1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QtmKK570"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4711BD9C9
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779713174; cv=none; b=Rae7ET4t2eGcKv/zSFkqq4WD5Epzuz3Xf16N31i3CHKT3V0Ex/9RBZVAAfw6nLPTQdYHmCRH9lv/jVyuUWF8L05aROQXRe32MVfzBlwvrtdrkRvKd+cPbx7PvTt42EVvE08iKr+SZmSfMCKnzeLhL4aceiidSGADliqiO1xdjWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779713174; c=relaxed/simple;
	bh=fJMpHs2EwhmN48GNX6EEyLv37kcjVhTZEXjlmv56/xM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=K+fkVlGSe9aSdjPO/Mffgkjxjr3rj8kQP96jh6Nc0c+BOfEzgS9DDnJdOh0b50Dd7xI6QQdqJal7F6cv739DSyDrqcXVT/PX3Exhm32XU05aHGbZB+EIFphkqEoo+Bj3+NkDpiH7NJyzHFHL9X5ILUhNsN4OUw7qaqdoALAxF0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xr8rb4c1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QtmKK570; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64P7c2ga1889308
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VBCPDixfoHRh6gGVlQsT4UlKdIWzU9rvYRNKn+zixbk=; b=Xr8rb4c1PFMaKPwx
	aVnNoy81tOrODJnIwOzgcaB4eVsj+sLf8ieFDUnol9HGfFhhTpdhNu7g9LyAcJ4A
	dTtrFNqucsSuFM6zawqZ5N7Poavd3IpMd5f2TrPa62dZXLmmLzHVgH4Y9F7Pc2AS
	mNkLnk0YImabg09WyjlKuXq2DRrDhvwqYazOJgsJJXzvqEPQBLmXUB6+zx3OFXHy
	IzCoO3d3ZOrzxkRxMoEny0a2ItttghPM60jCKRL8FKj6fmiH74qj0eGImXrGen9b
	e8aFLHkVNG4wiKEB8BgA/gbcbE0NcE9TW/VpmgmWCl/IzljpM/mN3yfrQgvz2Wy9
	1whWRg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ebba0wudt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:46:12 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-95fb6cc0b7cso2877602241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 05:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779713171; x=1780317971; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VBCPDixfoHRh6gGVlQsT4UlKdIWzU9rvYRNKn+zixbk=;
        b=QtmKK570oyUAqON37Y8s/CCr5dgJHObyGfOQu7pvgiTlJtFzMSTluIjKbv2gvMFkxF
         0nLTAxcbiTSX5gTDJvQnlutcMBFK525/MUIlxBaD+57EEGrnbzgvt22+++kiOAJe+UJt
         hvpcsKuwOIV3cv469rBj5XXdbwYJFRQQpuDCqc/f1hS9NDeXtjVnbCfOD2tI/89ksx7r
         4MAzWBS7MlGmPsLQOFlPfDBBbMuql1KI+1C2Y+pdIqP6mRvKQtcJyShcWGjhoirs4mYf
         9kAhqNqaQjV0DABbeUZXTRQ/zEi6jcFFYRKbmCL9MjDWIO1VWnUhcSwqkNQjVjri0i/X
         6faA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779713171; x=1780317971;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VBCPDixfoHRh6gGVlQsT4UlKdIWzU9rvYRNKn+zixbk=;
        b=LLJgL828HP3rYiXDeU5Atba3V8PZmEcjn6kuyyuZ+KLFB+WaqLUR2gBQ8lZNEfFOGV
         Eg1w6HXOL0x7qodeGNvIWuAPLHAiXVzwEEbaRU5ht48lRPujPg9kAN60i9cv8IDXbg7p
         5dN5M5gIuAHLBNgNQ1AWszt/zuAAAPj8dSDVRIEKFBjBkONxNfObMqMuJzsBY2ajF48h
         iGwnOxDZtKMzzoYMEavjG9NwbkK4WZmZqVDNLN6Tr/6VJlQbIYa5B5m/fqduens1dEJn
         dmk0gwTSZcInp03KRnbAaypxgFM/5uDfPPNXxxCmTtF7S+X53Wk77mBqO85ZX6ybHVz0
         9SDw==
X-Forwarded-Encrypted: i=1; AFNElJ9yqNOAXjftzI18Bcx0etkSTpsW2Q6/a6cNWMG1KFv49w9rShRC+Qx+hoZehkst6Wc144AFE3jV49yVHURS@vger.kernel.org
X-Gm-Message-State: AOJu0YxVGGrq+JKNHTOQoF3uJh4fO3yCvEi81+Y/Q/zmBPXj3QA1RPIh
	jTvYYs/HE82iZ6AOdfCjdvNMphQIfeCLB6Y8oEiiJfCYrpyFdpgMHRNfD3eNs6D9r+0HP7l0wxe
	x3fcdPmGHDW1BUEDZtDbf3bq5E//URLKxph7+VKGGPKVQ9lLv+tmOyOYzxQnyNBT6ZhYKstbqZM
	5f
X-Gm-Gg: Acq92OHVPIgvP6LnDtq5j26BnAChzeLdu44+b5mXkyRlAmNrDhCcDoaPqzLmc6Wesyq
	QTUbv9wSLI6vzL/fdhT9q/FBN+P6XrR9XZD+um/4WpQmnqiGvoLtsFgqrxVeuPl/Gi/vAP8nD75
	vFf2wp5RkDfQYf1PBLNcIoulzxg/9VLHNCgg65EDX6TFm2/2mIZbRCnBWkrsU7x9bQB5xBBt2lR
	1pYZ9eqwL2vUap03L0ShNRWEvfcPqLNVQkh697KSm36Kf0kP9QK72xrhnuWyc416Fye1YsptZg4
	gL2hmg9ODbCvZFK2/pMKrFWeFyyuzwHPOG6laLwdzB7rZ8tuLLQBEBOIAvUjcA4KPJiuSiZevnc
	9YJUDPfvahJP6gWfUJ5G5R1j/XXvFX3sWMfiWpCZtLlOJ/abvZTglEZ1+p84I4QmEV8ZL8P8qU/
	AJs2HQB6tdat42qyGieyUUknM9qc4jh/RTmWz7GCOwdt3N02XcQkt1LBPajUZxU2z02/mgKkvH3
	69XhG0OtmBOoVuL
X-Received: by 2002:a05:6122:247:b0:577:501b:a668 with SMTP id 71dfb90a1353d-586616414f1mr6079908e0c.10.1779713171512;
        Mon, 25 May 2026 05:46:11 -0700 (PDT)
X-Received: by 2002:a05:6122:247:b0:577:501b:a668 with SMTP id 71dfb90a1353d-586616414f1mr6079868e0c.10.1779713171083;
        Mon, 25 May 2026 05:46:11 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9f603desm3922656a12.12.2026.05.25.05.46.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 May 2026 05:46:09 -0700 (PDT)
Message-ID: <7ebbddb0-175b-4023-91ee-93d23e5162ba@oss.qualcomm.com>
Date: Mon, 25 May 2026 14:46:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH 1/2] arm64: dts: qcom: hamoa: Fix xbl_tmp_buffer_mem size
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260525114749.5939-1-johannes.goede@oss.qualcomm.com>
 <20260525114749.5939-2-johannes.goede@oss.qualcomm.com>
 <7d2aedb2-4bcd-4453-80be-5c7ca6bdff95@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <7d2aedb2-4bcd-4453-80be-5c7ca6bdff95@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tLKZ8WYou21aIZfnvG8ljNgyHCIj78d3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDEzMSBTYWx0ZWRfX1Tmajlst21BN
 +A08RpwyUyg3Ym4BOm/i1wq6zxGyKBxbfFtal2XrdhN4YMxgy7sBfpLVVCNjM5eNvPiUrGVO/cC
 qewcgmJDxRsYklfup7nkqH306mQSLbKQEXFu97/DsXHUulUHyjiWDavWB14lCS51tjmWmaHWUB3
 HWoEkxMlddjsbnwNQDPOQZYDuRRKmLvzQXW9rfaiOu6Xbqj6E4VfNhR6TsSb5EuKaNdaSz36VCv
 VBDA/gLBDfHlplismtgSCM5YQj79x8OthYPaaVHn/Ayd2bPNzeNpWUQW06XTel62pFRWWQ2h+jP
 MMmYC6ZF77090SxgUtIuv/JKfCh2otSzIcbCYN5e5KjZqg7iSgrkQCnzucZ/ooDTiDMsmHnmmZP
 RX1z7RcHlVHIHMqKc2cfAsBrDPgktH6dLo4YhzkXpSRyDJAJyD6X60tiIu/D4khMEzXPHtk5wtf
 +myh10jjdC1UU/CLUSQ==
X-Proofpoint-GUID: tLKZ8WYou21aIZfnvG8ljNgyHCIj78d3
X-Authority-Analysis: v=2.4 cv=Xca5Co55 c=1 sm=1 tr=0 ts=6a144494 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=kj36F7Rk1FwkeEXVhM8A:9 a=QEXdDO2ut3YA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605250131
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-109654-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim,4.239.109.128:email,4.237.230.224:email];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes.goede@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8061F5CAAA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi,

On 25-May-26 14:29, Konrad Dybcio wrote:
> On 5/25/26 1:47 PM, Hans de Goede wrote:
>> The EFI memtable (shown when booting with efi=debug) shows that the
>> xbl_tmp_buffer_mem region size is 0x1c0000 bytes large not 0xc00000 bytes:
>>
>> efi:   0x000082800000-0x0000829bffff [Reserved    |
>> efi:   0x0000829c0000-0x000083efffff [Conventional|
>>
>> This fix aligns the size with the EFI reported size and makes /proc/iomem
>> correctly show mem blocks matching the EFI memmap:
>>
>> 82800000-829bffff : reserved
>> 829c0000-83efffff : System RAM
>>
>> Instead of:
>>
>> 82800000-833fffff : reserved
>> 83400000-83efffff : System RAM
>>
>> before this change
>>
>> Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/hamoa.dtsi | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/hamoa.dtsi b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> index de0f2346cb38..5a2e84365901 100644
>> --- a/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/hamoa.dtsi
>> @@ -582,7 +582,7 @@ tz_stat_mem: tz-stat@82700000 {
>>  		};
>>  
>>  		xbl_tmp_buffer_mem: xbl-tmp-buffer@82800000 {
>> -			reg = <0x0 0x82800000 0x0 0xc00000>;
>> +			reg = <0x0 0x82800000 0x0 0x1c0000>;
> 
> FWIW the reference memory map shows a contiguous block of:
> 
> 0x8280_0000 -> "no reclaim XBL scratch_buffer2"
> 0x829c_0000 -> "reclaimable XBL scratch_buffer"
> 0x83f0_0000-0x8400_0000 -> "no reclaim xbl scratch_buffer1"

Thanks, so the first part here 0x8280_0000 - 0x829c_0000
aligns with the EFI reservation and with the dts reservation
after my patch.

0x829c_0000 - 0x83f0_0000 being reclaimable matches with
both EFI + the dts (old and new with a different start)
having this as usable RAM.

The 0x83f0_0000-0x8400_0000 area seems to be marked as
reserved by neither EFI nor the current dts...

With the first part of the reference memory map aligning
with what EFI shows, I think this patch is correct.

I wonder if we should do anything about the 0x83f0_0000-0x8400_0000
range though ?

Regards,

Hans




> 
> Konrad


