Return-Path: <linux-arm-msm+bounces-55681-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A35A9CDD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 18:11:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6F95D3B6A15
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 16:11:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBDAE18DB02;
	Fri, 25 Apr 2025 16:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCWTFiao"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D433418C02E
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 16:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745597508; cv=none; b=enNwAGIbO7Vl4V7lmVS8bMQUMDvL8q1/OebXxOysEYTDkgXDnYFA7w8PJWG7jJRaJBbDxDkaziQMqIJEWkkCt+uMONdIAXtBPx9VCUOiOIY1nd+xolg106fXloq4KOdTGtbh+E3ap0HsjXdnfvoHgHo0TLlokdDV0GTD55Xu7kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745597508; c=relaxed/simple;
	bh=+/8Yh07lfUl5DKdieZ9w0ZXCqxUF7G/lRWkdCw2p67A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lm6/9ROfVkU9uXnZhugGvkUpZnsMCcUbnMH0e/1jVWw4opq3SYBBnFFTjf8SAKsMxXFWCnUTGFnc96pXDwOLiPCb3vEjU1Dhl5APSTVQMb89dVL0uvKoBx8Bq77mq8OGt7Mbp3ufCazrOOGWbdaoUVJJj/4rcZuV7H0tBMI7g9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCWTFiao; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53P8T69S022918
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 16:11:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SnNzERhcGyh2Owv/6eKknOObqZSSYklEr5mmljO5Zr4=; b=XCWTFiaoWSVHm+Bl
	Ui6Z+JzH9aMlK7ZSdsC6PbdCIiy/U5w3kGXUc5KDi9x0tpVYnq11s3APEYa3pVyp
	tGiHWSH77uKVhUQfZXDoHCiPTzy8p65pafB8FQZiKUwL3XXqwI6OoD/X1ipnpR/f
	5SyhiNBpcgIFQqzcQLA63YhMvt8dg9Hnnhr5xDaPae62J4fh1Qhwx3tL+mp9jIuR
	5aDShS+3cI0buGfMXZfADt6DQ3jkvaMs+ic5SR/vHON+ryAApJCx0PV5JfhJWB2q
	3OhIOeYtmQwaEYulZ+Jw/GYSf47/+bp/PQtxt17+WlF7LLm9UciRsdn/CeJTleVx
	SMZgYw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0hsc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 16:11:45 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22aa75e6653so21337795ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 09:11:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745597505; x=1746202305;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SnNzERhcGyh2Owv/6eKknOObqZSSYklEr5mmljO5Zr4=;
        b=f8YmCefzfD72FX/1nwlsnpd21jWEasb5nvGD72OBpODlx4Q+RcybySTs7GuhNFIazp
         G/4J5NpsST17B0pYqA11CCKcRn8DU4UEY/3+Ne36KNiHA0CpAv2Uv5a/O0TTXQXBLWTw
         z5AkQU5kUMzuXcJAJy5bP/5MjohNtWJf3L2E1BPGReA90r6XnBzBMeykVgvdgj8eQxaA
         Py/kWEfAwdIPZRGLOZ021Indc6Xt+ITEaGxlNekKWDKxwBDeoJ8Kisk6OcYlmzt0/DMb
         e0rAF6jJdV/NMOvSsEoRLBdwdBbvp2DAY9pTKA6GaOB+r+JRamSQRSo60+WbyYBWGwI9
         X+ww==
X-Forwarded-Encrypted: i=1; AJvYcCU4VV2t5pI57Vu8RJlesFYqbzuNf6urvxOFPtowpDkD/HjjORyFhxW6No5y6mNM0mmtiSBm2xpma3wgaIQP@vger.kernel.org
X-Gm-Message-State: AOJu0YzdiWhN+ZOPrqVUz6jORzvKFQuIqlekiBQhmqRVdAa0gQbGfgxC
	ot/Ui4KihQb1sIqiBVLnTTCmc58ObIbLnbRVPJuKcBKXdt5hI5QJKrD63jojh1M1i9LrZBEZWhy
	ZhnLaqAEuMSesgplEONJ/+qWQfue89fHrCQungcgQmVVY0oz2zUYQTuy1klYd2wiF5Q9MMkLg
X-Gm-Gg: ASbGncuARD//yJxSB9o2NCucob2Mialb0YDT/5nN6EPSXKHARsqjL2kUMp7GZ9w9ob1
	TZ7qpYn3Wm7/5Dwcvkmt/SQDWO6+gcns2rSzQse6rJqeMkJZxMkhXlSBeFcZ++VKS7944eRChLE
	qP14SmQ5/jpJ/JOTrbj9CGkAj8Df9QnxLrkjimpGQirV8ut4LaLpHPCK9rz1wVRWemVoxcb5vI4
	tYn6+Hf+OTJ7l/3YYPmCoIlYjPYWzkjMJw3rA5MwngNslx0bK/a61hwwOZuwLIKTnz4+v5Zi9lS
	OHrtdgCYq0I7M1R8+sV8M12D8LFbR8/deAVjBwM1n+K6SFsS3ClvbXli4z9NZw==
X-Received: by 2002:a17:902:ec92:b0:223:5c33:56a2 with SMTP id d9443c01a7336-22dbf5faca9mr44837255ad.28.1745597504748;
        Fri, 25 Apr 2025 09:11:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFekcn97IqHwbOVfQF3TlCh7LHX8WL4IUgEpGEAWbusPOs4xYrJuyblfITWXSM0yZls1RRZUQ==
X-Received: by 2002:a17:902:ec92:b0:223:5c33:56a2 with SMTP id d9443c01a7336-22dbf5faca9mr44836865ad.28.1745597504340;
        Fri, 25 Apr 2025 09:11:44 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52168b9sm34212775ad.226.2025.04.25.09.11.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 09:11:43 -0700 (PDT)
Message-ID: <62f86d8d-e196-4d3a-b432-33da98bc5db7@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 10:11:42 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Allocate entire MHI control config once
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev,
        linux-arm-msm@vger.kernel.org,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
References: <20250328165913.3380933-1-jeff.hugo@oss.qualcomm.com>
 <qjgzfuzb57etwsblgsdnek6pmw4c5ickt2yaiprqzskhjwr2zb@vwstguwle4m4>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <qjgzfuzb57etwsblgsdnek6pmw4c5ickt2yaiprqzskhjwr2zb@vwstguwle4m4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Zdux_uMamjACFZzgr81XVjYf02pSaNGY
X-Proofpoint-ORIG-GUID: Zdux_uMamjACFZzgr81XVjYf02pSaNGY
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=680bb441 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=IKrzTq33Tt_Lt-Vb28wA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDExNSBTYWx0ZWRfX7Hv7Diq7D3OY BjhZpwkJMgYFNBQa4tRx3O2tZRsBI3VmAN2Arvaz7HLhH12LJPVfzwgC9iA2elEAN5Xx+jMobr+ 238vwKeEmDJA7IB7TFO10+FSsxZmuGMmxQY2H7Pa19JIpGE474lRYvqVbn7fqiN84xHfe1a0heF
 DjZxvY8d9GEBMEn5eNrLRWQvKk/6Vo/eRAV/rk2bjy/PXKBh0vlyd0eyKBJil9iYRwh4N+7kcM4 lNtlxmAZ5DzCUjCLvtyML2TvrhGTVs6n5vHWtP3mIK7D0dBOBnmeCwIiJvZaUBef7b65aCZeDAz l6FJGBTT5G6DdyqUKyunzFnrsf9JSNgrVLtSdXKzrnSQ/TF+jyVAdcTRihx0vZCKVrMlp1GWqAJ
 C+tccgmulCg/R47RU1DfvdmxElz/ukG5s13VV6lBeWWAdd/zeaISIqj8Jc7uLwU8flRRThhR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250115

On 4/24/2025 11:40 PM, Manivannan Sadhasivam wrote:
> On Fri, Mar 28, 2025 at 10:59:13AM -0600, Jeff Hugo wrote:
>> From: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>>
>> MHI control configurations such as channel context, event context, command
>> context and rings, are currently allocated individually. During MHI
>> initialization MHI bus driver needs to configure the address space in
>> which this control configuration resides. Since different component of the
>> config is being allocated separately, only logical solution is to give the
>> entire RAM address space, as they could be anywhere.
>>
>> As per MHI specification the MHI control configuration address space should
>> not be more them 4GB.
> 
> Could you please add the spec limitation here as you described in your reply?

Will do.

> 
>>
>> Since the current implementation is in violation of MHI specification.
> 
> Here too.
> 
>> Allocate a single giant DMA buffer for MHI control configurations and
>> limit the configuration address space to that buffer.
>>
>> Signed-off-by: Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>
>> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> 
> Other than that, patch looks good to me.
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> - Mani

