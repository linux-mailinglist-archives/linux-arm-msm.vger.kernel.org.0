Return-Path: <linux-arm-msm+bounces-84150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5792AC9DCA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Dec 2025 06:18:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 077F33A6B9F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Dec 2025 05:18:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCA22773D8;
	Wed,  3 Dec 2025 05:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmDV85Jm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HHAZ77bp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 135B01A285
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Dec 2025 05:18:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764739104; cv=none; b=UOlLC6BrD68VRjErotualop8+pu93R7wfl0up0QEBA54vTjuLW+H0FlgEPKkKkU568IMKrPsHEcEr4BhU9R6aG8uAIbly35zCrWZOvqJJNg2pZ3dczKHxqtTyaAybU+vM8pAAJAplXg7XJPPPZzG+jH2cqDnHTJ5gRJJ7BlZ/J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764739104; c=relaxed/simple;
	bh=62uw9xQPaBAhojob+3L4BHIADnVLvsg5vzaBGegjqxE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KVykMEGLg8td9iC6Ge0bXT/kAHjh85Heqo5kk7cSOsuRjg/M8OTXclO7kfoRDgLpiYgE3JT9M007WZGmGp//9fjwqkohRYdmG12kYzhicNXkytCzzcdNdIfNF/0D8fXVlEIfiXDR63fkYglfrtUNUIFZHyo37Vyt07YMtoQZbBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmDV85Jm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HHAZ77bp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B31W3pI805850
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Dec 2025 05:18:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MH+8YJ6UjfWQ0lWGbrnx86pqNABPbah03d60J0p42WY=; b=cmDV85JmKcriq2lH
	QNCTJlHTytWd5/hS/ujbAvVm3lKvOoQH0KaW6gfxKyT8//dSDvFtjaaTG15/7Qge
	HzIFMVa8wfTdQB9nOUolVGEBCXgw3p5+XTR1gqiPFMq+bHCsPw8Y4TaAJ2s6JS8U
	Id8lRuUVcUSpALMev1KOGo2PzoFPW/ZtubFA8+SEOWHoOj0FMLyw+drWIs+OC2RD
	F0lnWRB9YyA8dRcwT7mC3uoAvo6vKOOnKblbGUEgsszyfwgOuEbDcDwDBs9ff8FQ
	sJwuemR6qfMWwve7JfZjHcnd+PFuYADNaGHyxrFumpMnS8veRaqnIeokaaPWqGhz
	D7aU7w==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4atbmmgm76-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Dec 2025 05:18:22 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2955555f73dso73120675ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 21:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764739101; x=1765343901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MH+8YJ6UjfWQ0lWGbrnx86pqNABPbah03d60J0p42WY=;
        b=HHAZ77bpkD2VPQD/We0oPc5P95hUb9sKLFsvnBJnjlpLnfUvAgqZ0/BgONvT9YBCCN
         FMa1EG/67tb80+2kE3GBFIAfVxNPqLKmmAsGbtEy0gTVG4010lZuKJNGkI4vCIRpN0TI
         kczsCpX3e8Dk072oDmHqwsR9TCCGe7DQsQrzFvV7YwxEi8N+CansSlZDzKTyI0Ypr62i
         kk3DUEtDHq40jpP5/5FMA2RYO6nCA+TPCy8TJCqdkOfhE6eRQCAwxZzcjkidmiQAuoiJ
         EFIezV+My7lF5x0WIHHPgKo4y6wznXZydGigMtPdifDLOubWhapyivd9q/e9PKoU6OL9
         6ZgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764739101; x=1765343901;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MH+8YJ6UjfWQ0lWGbrnx86pqNABPbah03d60J0p42WY=;
        b=YV/GGXMAW8SkRB7ViparUKA5Ju9NpWs+i+Un4P6G9GKgyV0A0m1jq4JMHurKlXM5Br
         pVlassF8u6Xw9N3OD5T2gGCZ6CX2BaEFbwZbXy0hjl9kZgAEjfmWb0HN/PRbC1cC9bGp
         46fCsaMubZ8sFL2NpqUEnP3Hqzg/pwFPrdarRwdSHTdK/z8qSAl/ZdMuNfXxa+rtGlTm
         936ToSq4aycKpbhOYmlBDrP4QevD6ojbieweKrM4yvMcEWf++FtMkVv63bQJmU+xyrMO
         EP4I3sDImSzSV4u5RsQHti0kkeIsHVb9IZctwaQTdeJZ3nzSfpoyiwnkt37ORf1JX/M5
         zblA==
X-Forwarded-Encrypted: i=1; AJvYcCWVdkdXcqRU7JSbGbQTXTMACRgxt+S9sJXWxfOzR0A5PsaUfBTUB6d3lLZBPMSrfKwkMPWijU30hl2EPpwH@vger.kernel.org
X-Gm-Message-State: AOJu0YzItP/P4wvu+a3egpoWrZcKV60k+2ydZhRa/C59Ym1B8MJpaYT7
	1TljzALvuUmiEGl+Adwl/KZd5pHNX+bBEscev12iQCiigKwL2vzK52tOxcrZ55LXdCUdSfu7f3N
	84XQQxgvTEUjzoRdprhbpSQCGEdPja0xK9W32G8iC7bfuWndsVn+QilyeuEUXTcJKs5Dj
X-Gm-Gg: ASbGncvmUFT/b+U2lyzL7sGeCacyW4Sg2NX3R8acXcDnjqu0duOrNbpULNo6c1FNb9n
	yi+bFORcKZSLHhhHxr6qRdx/QJR3HzdURX6d7wuqUSXAGN85D6yGRKiiqFwDT28hDXvN+my2Hci
	AfeHAQgF+T7I4orTPSHxhi4rXruoHOZ7+YcM3s2FY+f6Q6rZPl17ww9NBJ2wTIGj2Vk1tS03c9g
	77XUn9xbn5Ue5QYSxaVV7++veV6ROdP3X8Ly3qroaNPsHjb3MfetYufVCsUG3FjGoLTS68gBN23
	XGhptGnRzqJEYjivddW9v1AKq0Zk8moySSRfnUSjqZfFS0eopGpFMC0JJlDil3mzfXmM09u7Wnk
	ciohPzekkdJuRcq6ixkzm7wNMhhnwGJw8UsJiUOBiSWe6
X-Received: by 2002:a17:903:384f:b0:269:8f0c:4d86 with SMTP id d9443c01a7336-29d683e1661mr14152315ad.53.1764739101472;
        Tue, 02 Dec 2025 21:18:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQdVExq1PEZYnRLG/KsslWcIb4lne6uC9XORnSf8c9nPEUYZW23KLRKhEqufaoglxWn20B7w==
X-Received: by 2002:a17:903:384f:b0:269:8f0c:4d86 with SMTP id d9443c01a7336-29d683e1661mr14151995ad.53.1764739100975;
        Tue, 02 Dec 2025 21:18:20 -0800 (PST)
Received: from [192.168.0.171] ([49.205.248.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29bce442744sm170246895ad.23.2025.12.02.21.18.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 21:18:20 -0800 (PST)
Message-ID: <64dbe824-a94c-4394-8cbe-ebdb7a3c42fd@oss.qualcomm.com>
Date: Wed, 3 Dec 2025 10:48:14 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 00/14] Peripheral Image Loader support for Qualcomm
 SoCs running Linux host at EL2
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251121-kvm_rproc_v8-v8-0-8e8e9fb0eca0@oss.qualcomm.com>
 <0156c327-b867-481e-af24-679f037bfa56@linaro.org>
 <Ux4KioDAyhqgZYleT-eeeFKzuT_qadCIpP3RgyB40apZPX4I9_JwcfY9mebop4gmFcyh4LPw0KQvFzL4zzysJQ==@protonmail.internalid>
 <20251121113751.tnqw5abm5sd2rgr7@hu-mojha-hyd.qualcomm.com>
 <9dfe5343-824d-42c2-aab8-8389602601e9@kernel.org>
 <20251202083650.luk2jpcquq2pcf2r@hu-mojha-hyd.qualcomm.com>
 <623225c2-166a-49a1-9856-d02ed55f1e47@oss.qualcomm.com>
 <bds552pvggsf6jgfyghyigp2fb6zb6hucwqirwye5puctnrhdi@tqw4b2nc3mkg>
Content-Language: en-US
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
In-Reply-To: <bds552pvggsf6jgfyghyigp2fb6zb6hucwqirwye5puctnrhdi@tqw4b2nc3mkg>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: OqTxiP4HRK7ThRhrxcX6Nsw_7dxEKUwg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAzMDAzOSBTYWx0ZWRfX2U6YXXVlWUQY
 DVxWadL8tZ/W9stCSX4OSlAk3WyQGRg5uNw20+hiU4hyxYSgEvUDfYj/Ckg7piFi0AthGrjfWXW
 VL5O4Ugwx57rZDgiJUY/Ml+FjLtq2WVNhBWx0xJznch4AuC8jS0q6pPfiB8fnfCm19JjSdPHtpp
 z3yXgWtPvpIL6h34ubxosleQZEayNWdrxoK5TH4+f0jG43MC4Pv8UsT8FuPHkpYpDv6M/wNhzbp
 M17YbVrS7jtylOBeXPoLpRFjldcyBDa0qdlX0qAbCe2bJfdVkkq+TRN+7+Svb+ZXZHC8ams+0I7
 205taiHMBIDjXw399mtp6OvmRczb4v6iNOFgNy1tHB5vspUQQKPQcRVbFVgUSotIzOFLfOfsBdB
 DYiUtOT9PG5x/yILYYY8PR8ma5+TLg==
X-Proofpoint-ORIG-GUID: OqTxiP4HRK7ThRhrxcX6Nsw_7dxEKUwg
X-Authority-Analysis: v=2.4 cv=ApjjHe9P c=1 sm=1 tr=0 ts=692fc81e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=pLmqbgbNwPlZRhRGoa80dQ==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=7mi0SIUTFu-qshqJEZQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512030039


On 12/3/2025 2:54 AM, Bjorn Andersson wrote:
> On Tue, Dec 02, 2025 at 03:43:17PM +0530, Vikash Garodia wrote:
>>
>> On 12/2/2025 2:06 PM, Mukesh Ojha wrote:
>>> On Thu, Nov 27, 2025 at 10:25:23AM +0000, Bryan O'Donoghue wrote:
>>>> On 21/11/2025 11:37, Mukesh Ojha wrote:
>>>>>> Sorry.
>>>>>>
>>>>>> Did we actually come up with a cogent reason to omit the video firmware
>>>>>> loading here ?
>>>>>>
>>>>>> AFAIU it is required for Lemans and Glymur - leaving it out is blocking
>>>>>> getting video stuff done and storing up trouble.
>>>>>>
>>>>>> What exactly is the blockage - is it something you want help with ?
>>>>> I replied to you here[1] and given my reason..till something concluded on
>>>>> "multi-cell IOMMU[2]", I can not add video and block what is working
>>>>> already.
>>>>>
>>>>> [1]
>>>>> https://lore.kernel.org/lkml/20251105081421.f6j7ks5bd4dfgr67@hu-mojha-
>>>>> hyd.qualcomm.com/
>>>>
>>>> Why though ?
>>>>
>>>> You are mixing together the issue of multiple SIDs and the original loading
>>>> of firmware which could easily reuse the venus method of
>>>>
>>>> &iris {
>>>> 	video-firmware {
>>>> 		iommus = <&apss_smmu hex>;
>>>> 	};
>>>> };
>>>
>>> I completely understand what you are saying, and it would be very easy
>>> for me to do that if it gets accepted. However, I doubt that the people
>>> who raised this concern would agree with the approach.
>>>
>>> I’m not sure if the video team would like to pursue pixel/non-pixel/firmware context
>>> banks separately. I’ll leave this to @Vikas to answer.
>>
>> Not exactly as a separate sub-node, but i do like the idea of introducing a
>> simple iommu property, something like this, which Stephan proposed earlier
>> in the discussion [1]
>>
>> firmware-iommus = <&apps_smmu ...>;
>>
>> I understand that we are doing the iommu-map thing, but a property
>> exclusively for firmware like above look much simpler to me.
>>
> 
> "We know we need to find a generic solution to this very problem, but
> while we work on that let's add this quick hack to the ABI"?

I would not call that as hack, rather a simpler solution instead of 
packing everything into the generic iommu-map.

"firmware-iommus" is much more readable to interpret something running 
in el2 mode, than digging into function ids inside iommu-map and then 
matching it up with specific SIDs to confirm.

>> Dmitry/ Bryan/ Krzysztof if you are good with this, we can bring back video
>> in this series. Please share your thoughts on this.
>>
> 
> Please let's keep these concerns separate, so that we don't hold this
> series up further. Even if we choose to go by the subnode approach, in
> the same time frame, it's better to discuss it separately.
> 

ACK.

> Regards,
> Bjorn
> 
>> Regards,
>> Vikash
>>
>> [1] https://lore.kernel.org/lkml/aKooCFoV3ZYwOMRx@linaro.org/
>>
>>>
>>> Also, I do not want the video PIL discussion to be part of this series, as it could
>>> unnecessarily give the impression that this series depends on it.
>>>
>>>>
>>>> That binding got dropped because it was unused in Iris.
>>>>
>>>> https://lore.kernel.org/lkml/05d40a3b-cc13-b704-cac7-0ecbeea0e59d@quicinc.com/
>>>>
>>>> I still fail to see why we are waiting for multi-cell IOMMU to land, when it
>>>> is expected to and what the VPU enablement story is upstream in the
>>>> meantime.
>>>>
>>>> Blocked it seems.
>>>
>>> No, it is ongoing, there will be next version coming.
>>>
>>>>
>>>> ---
>>>> bod
>>>
>>


