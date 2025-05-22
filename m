Return-Path: <linux-arm-msm+bounces-59097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B4F5AC1356
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 20:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5EB6D7B816D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 18:26:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 346A91A9B32;
	Thu, 22 May 2025 18:27:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGB6YJYQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925C81A5B88
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747938467; cv=none; b=SCD6AKQfQuTPobfskbND3h3nU2HRpO1OMC2RzYjAWytjhE25WllolKYqbkTlH61COganTDkTEtUVUGJlD+jV2HTrJxxQ6pT0Hf3iO2lqofWmKsSO9XsWNGPk3uUsHqJ7whcFR91DJdlIcCZxDTsC+TjWDvVLShDfl0oTWCPHZg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747938467; c=relaxed/simple;
	bh=90ncrHPq0WkQH+mcKwnVhATPI6o7eYzzwEzKBc1Sy+0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=smjujS+LEK2ALjSJffC6Xl0sjRFfDcNmBo1AtPVDDeURc+r+j0xAwJtiEwxPDj6a5Jc/pNqu2pejC0/pkfF3L1bdiAHbu2hQVPn1wlK75b9KehvfXjwAyRV78LlLwbpwXh7KyQ/Ul/HuptPUiE+3AAMpcgavVFSgJBPJ+uP9ykc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pGB6YJYQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGFAqT016644
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hOrF9E8CNF5vlLwhBRViPzs4wkn4nhSUt6uMtZCC7vc=; b=pGB6YJYQJkP9fY2L
	zUY10/qSo0CVCT90WxzURcQt6+cOq9tOpl0/dsiXUNSQKKwCP3kT40Zj9SSvH61w
	BuWlQ5lAmIjEagvSt22BMM/qPIPLRrUlsiMI9GWaGbCiRDReWUSqA2KNgDpnoT9m
	bysdRs+r2L+E1bPIH3/P8TGoZk9Xg63rjwBqH+kOPVE6iqAcxMP03sccEaX+g62x
	r1lykroU2uxqIjDQlpK0y3ZxPMv5vfJm0mTxsp3xYHz6zc10G7XyqZRjrB2AhPUF
	6Da8dEZQ/iv/p+78ANCrhEJxV1ChrwAA1P7FCYGuyiWQEBaM5HUyTBleh7XB3ZDO
	M8cePg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf9yb6p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 18:27:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5466ca3e9so170909185a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 11:27:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747938463; x=1748543263;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hOrF9E8CNF5vlLwhBRViPzs4wkn4nhSUt6uMtZCC7vc=;
        b=Dxb8vQZF8gLzq8Gy8KOap5+PdJb6dA4iu6G3VMH4M7qLETE+IOFzXIHgfkpz0GEzjJ
         kk1bo8JUTG9KscJW7GIoRWhQxFosMkeBKGe79e6qWmgVvZRKLNYjBddpdkGwF0mej5LZ
         l4MMBAV33EMj1B6HlD4x5UL2ML2qD7AH07LzuDkbK25B4CgVmtGYKglhL3SGUNfF7m/A
         hAxPO6iOt60jow3Y6j359ko6YMzZ9JDF+1I3LVQ7gJ3g9TV4EsXCnx0QsqH+rg8+zOzj
         L/eZXJ91E6vkt/TEVBayrnZSAXHTp7RMXwTD0ytdWTiJIEivdhDrTyTboi4j3cILSMJ8
         gHCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkReNVa16drgJsG+nbYmgfZn5MepWIce8NA7G+RCyxTkQg+3C/Zz2VT8ddMmSdC6cB2J0NqfgRSeDmtCRp@vger.kernel.org
X-Gm-Message-State: AOJu0Yyovjq15HzDgjSqfKP47/OBKAs72rRrLnN92rvmIbn7btnKjil3
	ytsc9Y//ZLtFGzM5V33Z28pn+/plcGUJGVlSYGTtK/3NWDoUn6JxEGAISgUUTGMsYP29JJ4toNt
	Qovp4Eb6SrShKwkxqa8aS059l0vx1kKhZBFsE5w3tcL3dFV/lb6ngGy6g1YNO7wItCcV5
X-Gm-Gg: ASbGncuLix9NKoNrZyZI8k6XfDHWC+Sk8MpKmaQNorrPHoJ+lyfq2kdaDUhDPYmCfZO
	lZJ1hNcstKKcEX76jNK+jw7GrXIZlh+QaZFNMztHsANZQrQNauajpcnAV09b4D0uqLD6sGrrp8K
	jcUTOf8UN/Hgi9dCZuWNvUX6w/6OOTQLUCUZHnoRt78B/XLkkai5mEIwJMAjHHk/Hc6c/0oR4AN
	M2rEKiJ76XC9GeAmR9xRaZaj19eWOnbTCGShu1ixd3hwWhlgyVHBXMAvKoKxrcMcfqtVzLuemR/
	wZfzr7yZ70IHn9ooq/kkKMyShsgwV7ixCa67s1K2IpBpn5THRo28Mn7OeMad4qftmg==
X-Received: by 2002:a05:620a:4895:b0:7cd:14b:554b with SMTP id af79cd13be357-7cd467c0835mr1615266885a.10.1747938463339;
        Thu, 22 May 2025 11:27:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTe8t5T5NSz6dLcr0sJ8GGMWZ97eW+iTjSb5vi0a3UVu8a9oM0pBbOIdvvH24V3l33eMPuXg==
X-Received: by 2002:a05:620a:4895:b0:7cd:14b:554b with SMTP id af79cd13be357-7cd467c0835mr1615265485a.10.1747938462938;
        Thu, 22 May 2025 11:27:42 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac336d5sm10975351a12.54.2025.05.22.11.27.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 11:27:42 -0700 (PDT)
Message-ID: <76071cc9-b052-4628-9890-239b0acd260f@oss.qualcomm.com>
Date: Thu, 22 May 2025 20:27:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: sc7280: Add memory region for
 audiopd
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Ling Xu <quic_lxu5@quicinc.com>
Cc: cros-qcom-dts-watchers@chromium.org, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ekansh.gupta@oss.qualcomm.com
References: <20250516110029.1637270-1-quic_lxu5@quicinc.com>
 <20250516110029.1637270-2-quic_lxu5@quicinc.com>
 <uzyxagnmxz5tsjy32mfro2alwdpcq5kybwzcbsysul7u6adgdf@x7katw7eme6u>
 <b90ee18a-5e88-4c36-a623-ae9447c53a46@quicinc.com>
 <2mu3bncxoq57rxi22dyd6ys2wa5n3wmtadfvixozshxgenutai@dlkbqgplzrrd>
 <46caa88e-790b-4733-83bc-75ed6c7ca2d8@quicinc.com>
 <CAO9ioeVoqQhDhBW_fVU8kkt=3trV9YhEDUO0izdf8cuCDqU4Tw@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAO9ioeVoqQhDhBW_fVU8kkt=3trV9YhEDUO0izdf8cuCDqU4Tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=V9990fni c=1 sm=1 tr=0 ts=682f6ca0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=Tk2dPFrPTpK508hYUygA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: bvZViSKBUiu16WAO_RETGRMcZT9MOdI3
X-Proofpoint-GUID: bvZViSKBUiu16WAO_RETGRMcZT9MOdI3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE4NiBTYWx0ZWRfX83feXtuxF0i2
 l56/T0zRulpKsxsfDsdoJaFKt888sgDEEcATrvbgJvUt7DSPPDCViTdU+lhVVYFXeEF6NfhURxI
 DnTkwi9i+1ZcLBBWHpRaC0o0ZfitnJTmGWg/oPPK1a0Idp2vrE0vb524zovZmQIgTHdkUKlqvg5
 5VSvQEfiqdeepOq/67sysWRcb9BWdP4Dtm784WTfiV10svdQ3fWp/pqrlZHSWkVuUH+VH70en3L
 2Dfl6VaKimaTn3yb2tq3xXGpnmqyxndNNyo8dMXuOLA4FTrs9aNeZTx0k1gQ9jBIePQdTmjKAQT
 THWAMiyAlyAXHBwelF5UULZzOBsamLBA3TEKvDMDC3LBG1/q1xD/mP3yPcWYD8eTdheqJpyQmIF
 f9d0sfpSVOQxd4rk/++0k1YrrGEaaA5NVYpcpbr4+GrTh7xJVGiH8tRnT0beKszEZsT2R94d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_08,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=931 bulkscore=0 impostorscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 spamscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220186

On 5/22/25 2:16 PM, Dmitry Baryshkov wrote:
> On Thu, 22 May 2025 at 13:44, Ling Xu <quic_lxu5@quicinc.com> wrote:
>>
>> 在 5/20/2025 9:53 PM, Dmitry Baryshkov 写道:
>>> On Tue, May 20, 2025 at 02:41:22PM +0800, Ling Xu wrote:
>>>> 在 5/17/2025 5:47 AM, Dmitry Baryshkov 写道:
>>>>> On Fri, May 16, 2025 at 04:30:27PM +0530, Ling Xu wrote:
>>>>>> Add reserved memory region and VMIDs for audio PD dynamic loading and
>>>>>> remote heap memory requirements.
>>>>>
>>>>> Why? Was it not working without this heap?
>>>>
>>>> yes, it will not working without this heap.
>>>> Memory region is required for audio PD for dynamic loading and remote heap memory
>>>> requirements. For more info, please refer below patches, it has provided a more
>>>> detailed explanation.
>>>> https://lore.kernel.org/all/bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com/
>>>> https://lore.kernel.org/all/effea02f-6ffb-42e9-87df-081caafab728@oss.qualcomm.com/
>>>
>>> This triggers a bunch of questions:
>>>
>>> - What is audio PD?
>>>
>> Audio PD is a protection domain which is running on DSP for audio
>> specific processing.
>>> - Is it a required component?
>> yes. it is needed wherever there is some audio use cases where
>> DSP audio PD dynamic loading is needed.
> 
> Which use cases?
> 
>>> - For which platforms ?
>>>
>> For platforms that require dynamic loading of DSP audio PD.
> 
> Please be more specific, we are not playing a guessing game here.
> 
>>> - What happens if there is a memory region, but it is not used by the
>>>   driver (SM8650, SM8550).
>>>
>> It won't be used.
> 
> So, what happens? DSP crash? system reboot? blue smoke coming from the SoC?
> 
> I'm asking all those questions to understand:
> - whether this is applicable to previous SC7280 platforms or just RB3Gen2 / IDP
> - whether this needs to be backported or not
> - whether a similar fix should be applied to other platforms.

I wouldn't worry about FP5 too much (albeit it's apparently not easy
to test it out and even having spent some time trying to, I couldn't
figure out how these things connect), but the chromebooks may be
potentially problematic. That said, we can overwrite it in sc7280-chrome
if necessary

Konrad

