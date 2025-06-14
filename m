Return-Path: <linux-arm-msm+bounces-61309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D8872AD9F90
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 21:52:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D72E41896AC1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 19:52:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 126122E6D33;
	Sat, 14 Jun 2025 19:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fpn6SiSR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A012E3385
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749930721; cv=none; b=RzqbxSEnZuzi5Ka14lAsn8ibcxTJlZl4KkPT7LxlKqhkVO+Et/FVsPEB9TT7bjwb4Q24luTmjN2zb10HlVKJSkEnqy7Vi35USlsUJZezpcSxDHiU77HPwRI59AkqoYAVm7sQvIfmGXvrRu56nSD9COFhmHov0bqtY0Wx6nog5Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749930721; c=relaxed/simple;
	bh=1DPQvWsMzZMsoVpRpNnhl/AD5OgV/RVFULIUzD7BJ3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uc7cJbztsVdBXsDsoK6OE6IvT70ZS8rS0GbfBRB2SpLe6cll+d1xuCNVmicLetYtwa2AqQfA4SeoTdbSuEDafn71NigclQpXsF4a1opp0gCnojXA0tGXXWvxLA1+KCVAIJ25cKyE5UiradV8HcRQ6mFIxtgeOjdVdVprhfhpLYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fpn6SiSR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55E6lOK1013089
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:51:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZFSQodbNGA+hS7KOGAWPKvCuAsiSvwkzPnaELqxlmrc=; b=fpn6SiSRSzqa5HG3
	I3DMwRkFCN9/cdSMpQtPwFSlI24zrzhK2YM8qA5bwuEyYkudKr+1vcmQItmkNMgL
	vX4F0dRXvCW9BHZ0fyVqXpX/4YUdolMC0x62hfKSDEGQhNTzexF6eeYSQ0KC6jNW
	PYMg+cYT90VAFqtdvJhIK2Cegzm5lmOD6fLg9512Jw0Tp0GAoIJ2Cd1hj+9fJSI5
	QvNOiOReNOlv3qjxk7oMudH046UsffbnSbw3HbzD6tD1KAFQ+/qTYM8/HmBPjYzf
	wjuuoRkCKDNRk84nMj9yop8ccuVVui9HESKyuJkNTilEA0r5Zn/EyGUrk4DfAddJ
	sNDWcw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hc8yqu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:51:58 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a517ff0ebdso7589041cf.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 12:51:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749930717; x=1750535517;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZFSQodbNGA+hS7KOGAWPKvCuAsiSvwkzPnaELqxlmrc=;
        b=NYhx20/+iiYmeCZ9yLcAchakH+ltz+96ikEvtnNEmQlf05/ThXY09ly0VENvFU4p6S
         mdmgYDZA1pbByWQS2cKNZGYCgdBc5U5mzj95ZYQnu1aS76ptqgmNwEA4mIWMbv97WmCZ
         zNZZxHzrJM5lwy98sCAf63KJWUkFfZC4Cj6EjVc6BJjSSlDi9QU8tXCBqdjFti3yAar4
         mOD4mcJPjZ1X73fpm2FsZjk2gAUBuaJFrX9VwCqAByw2lWooiGUUIYhC+YTvVkScRIj9
         YiulK7vfING4OrL+cranATrERwNPiB3gd63/mD6Pb19F/EjtEKBVgDkchA+YyzmXIhm8
         x9EQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqE6m4zbSOTKFu8T+T6+Oe857zPZnPEpJOQqTR8F7cFDZlkA/3m5ZrATT434S4JINBmCuTProjRJQH7Qb8@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7cy9hxUiPQHsUidcwjZeRha3v7w4FBY4rRWv32f8LzzURasM3
	RnJvEg4NQOB28RBX4kVus6zcwT8NyaT1DYEkxNNmRMmct3ttf8XVS9/r5gwCqxY63tTym0FNmZ+
	eKSgxubI331tkbCnyKAPQMS2d/AJre8N382fTCOsI/pXrT1kUqWnC6fbmlaJV1JCYvL9V
X-Gm-Gg: ASbGncsTOUdOBdRSuPTG45MkZ5Tak/degQ1gM9Tf1COFGy0tujgflimYYkM9PQunagv
	PLWIqaaVBflBtzGEwe1YaJfh24UEzlJA8hksIzH1j7tel2mbriKuVT9m0P4+vAZkZOib4nopoVH
	ETuMUWmKIxt4cxqeAImwqUC9pruxu1s1xVx8g90BbBGTk3urxcpWyf9uPD5nCeW8wZOi2AZRdV3
	BU9Zl26uJTH9LSAIhjP+gLm/aB6GBoUNV3a12oWhEtSUKndihr4u9o4CB1Jb6Ibp1sTnMGsC3l9
	D8sRAxMwwrZwDOEiqwz5NN4QXvOxZyvFdMHsyfkZ+dczMvmEaaPEf+pXTmt07sTmgBdi09bw9YJ
	NbGI=
X-Received: by 2002:a05:622a:44e:b0:477:5f29:dbc9 with SMTP id d75a77b69052e-4a73c5be235mr22201831cf.13.1749930716947;
        Sat, 14 Jun 2025 12:51:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8/5nTV1Eomja+a3luMnwGAOTXK/vyr0EsJUjxatqccQiFxtOzgnrCciQl5LhpzVTPdUykxg==
X-Received: by 2002:a05:622a:44e:b0:477:5f29:dbc9 with SMTP id d75a77b69052e-4a73c5be235mr22201551cf.13.1749930716448;
        Sat, 14 Jun 2025 12:51:56 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81562d7sm352547966b.3.2025.06.14.12.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:51:55 -0700 (PDT)
Message-ID: <08bb609d-bba1-4256-bf4b-1bed9524d66d@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:51:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8750: Add adsp fastrpc support
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, konradybcio@kernel.org,
        srini@kernel.org, quic_ekangupt@quicinc.com
Cc: andersson@kernel.org, linux-arm-msm@vger.kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        "Bharath Kumar (QUIC)" <quic_bkumar@quicinc.com>,
        "Chenna Kesava Raju (QUIC)" <quic_chennak@quicinc.com>
References: <20250502011539.739937-1-alexey.klimov@linaro.org>
 <10f69da3-6f94-4249-a8f3-459dc48fa5e1@oss.qualcomm.com>
 <D9R4NCKH46WP.14C8F7W4M58ZQ@linaro.org>
 <3c0fea8d-0715-40e6-bed9-e0961bf034e0@oss.qualcomm.com>
 <bb68da04-ef52-4172-8b6e-f4027bcc2786@oss.qualcomm.com>
 <3f346bdc-81a4-4620-9a31-25c41d591c58@oss.qualcomm.com>
 <DALHL1IBO6TR.11KW7Z16V4SH1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DALHL1IBO6TR.11KW7Z16V4SH1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2NiBTYWx0ZWRfX5h9gw7ctlLWi
 YBJRuY0L6cu3/rzjDYzey3GAoJyo0vX5u8nPSINnt7mRLDAWcNpn//b4vOC4UMNc/YjR6wSOV3E
 IKofCHwEMefP/XlZBBik9MsQBicKKuNeNIGKF/pA12SF1YA/sXB57n9VNlqXqMoxZVXykdxBgQG
 2/f/p4kgeM/dxk0Cmcla7/6TuKDefS94B10QMcAYZrfAuVhqXSvaDL5Z2ggSarubJVvmsUK33he
 qlxk2ohGS7x0kDZHWfRf2J+KWPfam6+0uWPS/oKaz8dn48qws9iB0aFGwf2rKwsKWa223etHXFE
 AWV7EP2iFwtqv5pPALXQsA3XBT66q1N+o3Oi96YStFnRaJrLIF0xWbgUQKXIMlW2J/IINrShlH7
 7tg0ZvPRpEM/1Ng0GaW/TdYEv+51WrqnU70T8JaclF75vsEt5VgPtFFO+cb3B17iOgfgTL9t
X-Authority-Analysis: v=2.4 cv=CqK/cm4D c=1 sm=1 tr=0 ts=684dd2de cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=Il0LnrQAbVTfbyP1jTUA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 2IY6Jjautjp-OsEtbjaNk8S6-s_RiuF8
X-Proofpoint-GUID: 2IY6Jjautjp-OsEtbjaNk8S6-s_RiuF8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506140166

On 6/13/25 4:48 PM, Alexey Klimov wrote:
> On Tue May 13, 2025 at 2:09 PM BST, Konrad Dybcio wrote:
>> On 5/9/25 5:42 AM, Ekansh Gupta wrote:
>>>
>>> On 5/9/2025 4:27 AM, Konrad Dybcio wrote:
>>>> On 5/9/25 12:20 AM, Alexey Klimov wrote:
>>>>> On Fri May 2, 2025 at 10:38 AM BST, Konrad Dybcio wrote:
>>>>>> On 5/2/25 3:15 AM, Alexey Klimov wrote:
>>>>>>> While at this, also add required memory region for fastrpc.
>>>>>>>
>>>>>>> Tested on sm8750-mtp device with adsprpdcd.
>>>>>>>
>>>>>>> Cc: Ekansh Gupta <quic_ekangupt@quicinc.com>
>>>>>>> Cc: Srinivas Kandagatla <srini@kernel.org>
>>>>>>> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>>>>> Signed-off-by: Alexey Klimov <alexey.klimov@linaro.org>
>>>>>>> ---
>>>>>>>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 70 ++++++++++++++++++++++++++++
>>>>>>>  1 file changed, 70 insertions(+)
> 
> [...]
> 
>>>>>> IIUC the driver only considers this on the sensor DSP
>>>>> Memory region is required for audio protection domain + adsprpdcd as far as I know.
>>>> next-20250508
>>>>
>>>> rmem_node = of_parse_phandle(rdev->of_node, "memory-region", 0);
>>>> if (domain_id == SDSP_DOMAIN_ID && rmem_node) {
>>>> 	// ...
>>>> }
>>>>
>>>> maybe some driver changes are still pending?
>>>
>>> Would like to add some more details here:
>>>
>>> Memory region is required for audio PD for dynamic loading and remote heap memory
>>> requirements. Some initial memory(~2MB) is allocated initially when audio daemon
>>> is getting attached[1] and this memory is added to audio PD memory pool.
>>>
>>> Additionally, if there is some additional memory requirement from audio PD, the
>>> PD can request for more memory using remote heap request[2]
>>>
>>> The support for SDSP was added sometime back[3] to support SDSP usecases on some old
>>> platform as there were no dedicated context banks for SDSP there. On recent platforms,
>>> context banks are available wherever SDSP is supported. 
>>>
>>> [1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1273
>>> [2] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/drivers/misc/fastrpc.c#n1884
>>> [3] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/misc/fastrpc.c?id=c3c0363bc72d4d0907a6d446d7424b3f022ce82a
>>
>> Ok, this was mildly confusing given there's specific "normal" region
>> handling, but the DMA allocator takes care of this one
> 
> Konrad, Srini, Ekansh,
> what's left here -- I guess memory region is needed, 
> so do you want me to test with secure flag as the only required change at this point?

I think so, please give it a shot

Konrad

