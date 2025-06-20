Return-Path: <linux-arm-msm+bounces-61900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8080FAE20E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 19:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 051CE3B612F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Jun 2025 17:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38EA22E8E16;
	Fri, 20 Jun 2025 17:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n5SQ1nhE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7535D28DF50
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 17:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750440430; cv=none; b=FAeRUbjvpZhYorTdIOstiBGOJZDXHvob45lSRuv6kwncVZ1430WVK5ppwa7IkjyWGPkagg836lNU0V+psPcHL6bBLRjvUYEshp62MZEZ4hwLgHmWOL+GmktduzL+lSl1bj3kOkaVlrmrJjFTBymMpo06nB40ohuHrDdOrmzwfVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750440430; c=relaxed/simple;
	bh=afDg9nn91haB9rfUtxnbz99YfZDDgCPP+SbrAya2c8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WCjTcfuwgUBHlDXcc9NcQxGY2dBmp1XtBJNJDA3oNtXKq46NbBmQjZgdcDr2+mALG6WVvcKF9NwHkWM2AsoFvDPOrpGY02l8dvffHcby156RBcXQmA+DSOgQWVq7W2ivM6ZOLO9yqJYSfYCiUIohoSeJGBDORnpb++6YnSd+tbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n5SQ1nhE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KFwl04004741
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 17:27:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WHVZwsBe2mPFE2r8rOIceTU1YN7PAHuBHgv7EehUdXs=; b=n5SQ1nhEBTEMloFm
	VecGOa3kVZ/WwP3+oNFMvLCmFalNvpv05iJSsytBi6wSVHHwNF4fuzS3ytdRbhyW
	7vmGCzMgq/51HDaAXUhLWh+uocTC0ETVCOVzHRZ+ELqIOHM2y+KoUiobMtH60SLL
	Y+9jD9mVsC3wjaSDzZbVRz5AhNkpS3BGRIy4BiGhq1RQaiSgFXTF6pxRP5rk5CQu
	TD0XUGaqRUBdOPPHCBhhhFk3x1ufbeovG/P1gj7Uy8N/6kDWJ/b1F8lhnVXSgqZA
	cRbbqUJwDo3VSFIq+swZmUcyUunuOz0rDm1IVHFg0YnZLpa+2xR69ye3jRDdyG3x
	JczjGw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47darvr71w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 17:27:07 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3eeb07a05so32251385a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Jun 2025 10:27:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750440426; x=1751045226;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WHVZwsBe2mPFE2r8rOIceTU1YN7PAHuBHgv7EehUdXs=;
        b=YekmvDLrs8pYW0qHe/dqhahPqj/EQruQsVEzxP3GtZiBJHCNJSbNcp5SwIgX27+tYf
         RpC9XayUcIjQ0ezF5mZazYrIKrg86eV8Q1eiPxJqHVo56y8AfzUPqswUjesttpYpiaUN
         408QBqdFLgPL9Xyi9NA+0kevF3tiOFw160/8WoJwL2gHRg1J+WHUSQoj7eUcpuMkcerF
         YqPtM0M3MAOpigZPB2drRr31ujBPlxQ5qnllR0xDknQ+ykW+jW5vKLqAe8es2WU0cNbv
         +H1DKzRWO4ghitA6TxDB/CSsI1zVMwni2sxL4Cr5YRyElBFkoa0gDHDajIu20IFUPw8L
         O49A==
X-Forwarded-Encrypted: i=1; AJvYcCWOKEMiXuJyEnDeoCSz4FwSZTpbuHpuCQXhUcjLT1Smtq+14lKMfHjO9WNYHF6myBxuJTlMcSZaHXi1AaMn@vger.kernel.org
X-Gm-Message-State: AOJu0YwHRNe/GpLx/Rz29Cv98wORM8a/tJ9b5gTllqvvCDyUKeJttmzd
	uH5WUb3/Y4g/4Xhsw0Ko9aqILR8w0LieM+wwrwt07yhRRQWNuCjkYNhCmssM6c02hNdSyxFtM2A
	5Bqrk1jEOdaBA//+/PiZ57JJmO4oTwkXKhkNxrNiA/v7/dmwQOvSL0gZaklavmipI1kPw
X-Gm-Gg: ASbGncvCdKdWxEKDE4Dx+GOc4KCARvek2/3zqtMTsSutYt1ungPbe5QMm0xn7748lMu
	ckvWNMPInQJc/pdCBU8L2xLY+sQCUc4R5fM7jZOp+UleQ/6uK8zI1KX0l9nAXAv5i7CcuLV+7X3
	wb1/j5qHP1rsORq5kQVO9BZfmCQynD4BcWOF8WGuYneothDL+l/b/tHVtv4zHpoCPuVMAoCc0qP
	D1fzqHbObw79zG5ufuyb3Vxcm43TOMojmFDc8Gg4ufTI0D3wcvdcAdExpC7Dwf3RksOq6GDY9w1
	JUoRjin43tz/+OcMduZ/h2RkhgjSm5SLh9+HTofkw9S4xi+XW6y1R8tPO/9xjsrG4u75gjfwT/A
	3UYM=
X-Received: by 2002:a05:620a:454d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d3f98e6631mr201593285a.6.1750440426271;
        Fri, 20 Jun 2025 10:27:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoHeoLi6ocQ6ShmQtPpO5w/YjYEMIJLujZ0mwcIBnaXy139EfNwGSJUB+wxzBmDAUpuuwnGQ==
X-Received: by 2002:a05:620a:454d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d3f98e6631mr201591985a.6.1750440425818;
        Fri, 20 Jun 2025 10:27:05 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18c996aasm1664679a12.39.2025.06.20.10.27.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 10:27:04 -0700 (PDT)
Message-ID: <2bd17ab5-950c-4260-ae7c-9ba9a6441496@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 19:27:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: media: qcom,sm8550-iris: add non_pixel
 and resv_region properties
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250620-video_cb-v1-0-9bcac1c8800c@quicinc.com>
 <20250620-video_cb-v1-1-9bcac1c8800c@quicinc.com>
 <a35d3928-8ac6-49ab-8689-16ba69afe197@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <a35d3928-8ac6-49ab-8689-16ba69afe197@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tpSyyjp04iMd0lVXwTvfBJnH-8diPHJG
X-Proofpoint-GUID: tpSyyjp04iMd0lVXwTvfBJnH-8diPHJG
X-Authority-Analysis: v=2.4 cv=YrgPR5YX c=1 sm=1 tr=0 ts=685599eb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=qbq4ObjMTheV2eX5J3QA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyMyBTYWx0ZWRfXyxwKfJwG23sA
 wfHJ6HFv7Kqw/SHCOgk9lqxVj1z9N7VTXCsohdyg5SOWDWRzQQWbxxp2ATEbx4wdQ1GOvu/gzOC
 +S7ERuqgiXxtofy79PJz5aIUyXWuM6UeE4OTvk66SjlqH1Ac2D9tpiWeQNXbxdezp3jckW5LtNL
 B8yNRoH16YPJ1+Z4ZCHrzlRpTJdTaGddfXJKWDki8N2ExxtVz6p6DESWR7nqFD6jXMihJld911u
 5MohOun2UG6hdS2aIzjNoxO1IUVO6AL1M2mvwevEvNnkbCpbkyT7Nlf2xicgOV5x+ynkmpDpeW0
 VsA4sVy3u5z8w+VDHqviMW5tQ7MTcVqZ8tQo5kHD9P4sceJ7VEuA5Q8fHtdiSKldOFmWF77dySC
 4GIyY7dFM5IAzTmTIJ7t8MfpxJpSRSl4mdSop9Mhoc2wg9zQ0yZ0+vidNS/55BvkE7c+d1Ru
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=937 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200123

On 6/20/25 8:39 AM, Krzysztof Kozlowski wrote:
> On 20/06/2025 08:20, Vikash Garodia wrote:
>> Existing definition limits the IOVA to an addressable range of 4GiB, and
>> even within that range, some of the space is used by IO registers,
>> thereby limiting the available IOVA to even lesser. Video hardware is
>> designed to emit different stream-ID for pixel and non_pixel buffers,
>> thereby introduce a non_pixel sub node to handle non_pixel stream-ID.
>>
>> With this, both iris and non_pixel device can have IOVA range of 0-4GiB
>> individually. Certain video usecases like higher video concurrency needs
>> IOVA higher than 4GiB.
>>
>> Add the "resv_region" property, which defines reserved IOVA regions that
>> are *excluded* from addressable range. Video hardware generates
>> different stream IDs based on the range of IOVA addresses. Thereby IOVA
>> addresses for firmware and data buffers need to be non overlapping. For
>> ex. 0x0-0x25800000 address range is reserved for firmware stream-ID,
>> while non_pixel (bitstream ) stream-ID can be generated by hardware only
>> when bitstream buffers IOVA address is from 0x25800000-0xe0000000.
>>
>> Signed-off-by: Vikash Garodia <quic_vgarodia@quicinc.com>
>> ---
>>  .../bindings/media/qcom,sm8550-iris.yaml           | 35 ++++++++++++++++++++++
>>  1 file changed, 35 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> index c79bf2101812d83b99704f38b7348a9f728dff44..a1e83bae3c36f3a4c58b212ef457905e38091b97 100644
>> --- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> +++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
>> @@ -65,10 +65,45 @@ properties:
>>        - const: core
>>  
>>    iommus:
>> +    minItems: 1
> 
> As discussed in other patchset, this needs clear explanation, so
> imperfect patch won't be used in future discussions as argument to take
> more of such things.
> 
>>      maxItems: 2
>>  
>>    dma-coherent: true
>>  
>> +  resv_region:
> 
> DTS coding style. Anyway, regions go with memory-region bindings. Use that.

On a tangent, FWIW this is a discussion related to this patchset that
never got much attention:

https://lore.kernel.org/linux-devicetree/9439182e-3338-4d57-aa02-b621bc9498a3@oss.qualcomm.com/

Konrad

