Return-Path: <linux-arm-msm+bounces-80341-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46C85C3227B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 17:54:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9BC3A4204C0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 16:53:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3246433710D;
	Tue,  4 Nov 2025 16:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="g9eRI008";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q2fSv7xh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B660232F746
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 16:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762275212; cv=none; b=MYrsGOCXoscHChitmO2EA8Ipugr79lszT4YhYUfFylKstm0X86gpLXiZqHXOTSw8cQQAtXcGJ0mwd74J1hBFJe46ZPY1b0flDZBB2Dxba28kq9XN2SHjBbuk8MjD+wEEr9qsvbnpHrr7w6N0esIdETLZopaWT+w9d1Dw83kmg3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762275212; c=relaxed/simple;
	bh=7P7W731zeNvxsQqEWXDnrHlI5KkVRc5xJVwTpnzTHCE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rLNwufgaI8APFmdlpAE4U/gl3GBveTld9DADoDOcv3v9nIQFsia4aJnqqq8rqWIp9KpKQ/ES3G0rppdl0/rNVu/dsnRTsqlH+vkRlCRUEJT1IavHenMcUbSDNmLtZQ4rOFblbWxvVOduPEYDycVK08xRrxReg++L3lMv6lk/mf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=g9eRI008; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q2fSv7xh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4GgWpw2441918
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 16:53:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R+O3Oa1E8J1GUWFxBhezCIckqOm9wrjtwYcxUezuXF0=; b=g9eRI008jL4pPcOE
	+46sWq0PdagmgdVM9YjFa+cqeq/LIPFKqs/Kz5Nr3yFGW5YteUwtQ+cPdaeibsAF
	MAjpSC9C+BS0vVDp4rfCzLQ5HHkcIT/RNDQugcdPR2R8i4cQOMANnm2WlfPArnh9
	AcpO8b8zvqBDbp6BQ0ekadUFwvPnnCChB1oHc1EQHRlFolx1LF6f/Uk/cuMZeGcd
	SE7oRdrl63ICzzXcPtR+1yZwrJJoEjZeNQNxch3XGuoIkDro4vloWI98D6v6NFyM
	fDjIw8i13OQpF4BJ+uzqLQIHYNAIUTSb5wO/SdWBNZi07o5QeQQqrwekb4b/re6K
	Btp3tQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7me5r7b3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 16:53:30 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ecf82440dcso7239181cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 08:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762275209; x=1762880009; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+O3Oa1E8J1GUWFxBhezCIckqOm9wrjtwYcxUezuXF0=;
        b=Q2fSv7xhdgE2nHrAX/FuRVq0vW1wVQHoZYA5mzXRrsl9xaokWb/kiZZ5vOzSqUt7V4
         PHQJNqZL6DtapGIa46s4FlZIKp2rN+rKX4HraBHixypABkHQA0gkOBgtS2bAQhgjzZZG
         NgWt5Jb+uymR/PSZru0RDFx+wvrljbwwQ/Un5BGa3++DPrfZfe+GCJ+tieaqtc2/6/r1
         DyYQxwT8/tyV6FlZbJvp82RWXDN34BvWnlwjTzTikYgLdAgXUGQD9njIEXyl3xEkf1mE
         Gmc3kuwHyKOSmtjiZuMw+m+EU1wGbQ9yvFloeE251E8VmGTHo80BI+wICPiAmb5PZlNO
         J1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762275209; x=1762880009;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+O3Oa1E8J1GUWFxBhezCIckqOm9wrjtwYcxUezuXF0=;
        b=B5RiYnkoQjVDDQuqhGlUZXbNSGhnA2IC3fk7PxlNzenTpR57m2pXtrRKuUYs+2ZRVk
         pnx69LxPUAX85vW9CihQ6DeP6HzbPsCw6oaYT01JWnWmi9kr233feQPyZ1RwoEV/Z7r5
         waXQf1xPi/mMteoLqswkL2EuhbjhqW6OH9kJGBc5ZwhVo7hmS264kQfYCHKrpoS4NnGA
         hK+b1z16sZCw89p2dJ32hstBQBBHptycAdpmh3Ef5ZnngNL34w0tQy93/2EHqMjaTS7i
         xoBSZIkGPvfDOSl2t7wrZhDmA3tOyCmqLzh7lLgIHHl0n55Xa1GLGvHUiRPEXpuWxzTy
         jlVg==
X-Forwarded-Encrypted: i=1; AJvYcCVOYF80TVl2BBLImqjD274LgsBJwHuf5YjBABngyZ+VqT7MIMJ1zIGmZKxQWtk9fa5g9rs8odxg9IO4QEhx@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn97vqU0YYRT7cGBNj7dcgDjd//ktpJp7DDFt27XaKc8+5WbqU
	cJoWMJwmcchMqbjj8MRpkl+FF+f6R/aPlG5d3fYfB4pLWuVY3ksVB9vPNLk4a9nYJANrBHxx9l3
	5kmEvI68EF6QrC/bCcEGlh9MibtAO+E/Kc+n1Ur/1JJX5AIhYuvSf/faZ2QXZXQu2d6Lm
X-Gm-Gg: ASbGncv7U2SflsrEHgmQWvAUiPaMHdbI6p+0ZxbqOow2l1CSz3CkB3ZOhCJj+yQ/UVg
	gbONjERzGa+ElDs7DWgzAqY/5yzQwJbJ2G45W0fiw7gt3W1aJ6kypq9wrs/XF7cqx2Akhe1qJaW
	L1RAn6+u3ubsfszvul2uSSZnLsqEG0U1kwvIGhdJFXdeWrnHMbi8hP2425i+/dl5+0bD1+H2DOs
	PFnEmkQPOZrTcOxRKxR2wo6gUPFL5puwuOLtuy4Rz+Sowi3OjlTSjx/MFsVpnJWy+ZpjtwJ5jxW
	6zaWRFA+R3MwoRgUB5FBijgWxKdj+ueCjyfwWPdtU4VeTTdsEY0tMpN9BN9OL2ZyFxRCoCGREdm
	w0plRuGoj7HnGADbGxcDMiFEL37jzsA7s8Pga/caIIiJnEYTUiiuNvOSB
X-Received: by 2002:ac8:7dc5:0:b0:4b5:eaee:1c04 with SMTP id d75a77b69052e-4ed719178fbmr2058831cf.0.1762275209205;
        Tue, 04 Nov 2025 08:53:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEN2skvlMhiQhF0AzCAsR1RRCaYjN6hvzSRCOly3Dh32Qg2SQPxamGM3AJTpIbTuiUQBYBplg==
X-Received: by 2002:ac8:7dc5:0:b0:4b5:eaee:1c04 with SMTP id d75a77b69052e-4ed719178fbmr2058521cf.0.1762275208621;
        Tue, 04 Nov 2025 08:53:28 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640e6a71559sm2413634a12.31.2025.11.04.08.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 08:53:28 -0800 (PST)
Message-ID: <89aae84a-f779-4b89-81ca-ab42a595d196@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 17:53:26 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: monaco-evk: Add firmware-name to
 QUPv3 nodes
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: mukesh.savaliya@oss.qualcomm.com, anup.kulkarni@oss.qualcomm.com
References: <20250925042605.1388951-1-viken.dadhaniya@oss.qualcomm.com>
 <9b887bc5-eaa4-4271-8770-3458efb528bf@oss.qualcomm.com>
 <f016d47f-919c-2944-ab8f-68e450e5836a@oss.qualcomm.com>
 <be816a6d-c4e6-4cf1-b5dd-fd59515a42ef@oss.qualcomm.com>
 <f2ea3da2-4582-a2d7-9a90-8050b3e8a27f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f2ea3da2-4582-a2d7-9a90-8050b3e8a27f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 2U6x0i1VQqr28SwG0esES5tm79ZmfF_H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDE0MSBTYWx0ZWRfX12kqAZNaSXn9
 gKWsZDoD7mbjdA51v3pjPE/Ylqm4/d07lN08EiEjxvX/5a5VvlxGOsmDRgsPxhW63Re9woJEySo
 c2g+3sqM3CQWsbCJ1t6VGyfA1lO3JhiNK2Yuwo2UniBUQWpogmbfU7Oksz40Lcgh3+jkue7+Xsn
 FYY8zCEsEmU4dUAQBk2snGlbE3BtEAQmhRbb4tm7wNmCR5nTxnPDkAWb2iNhCJkm55PkWK3+kzC
 gvLhnLzZmTgDzRQsvS3sop28oPucAvWcTdf6N8xXbG+iMFG8iIEYqgSq9meZXTgzYSIIRO9RsZb
 gRqhIVcwaWvI2xfGt32azGiMKpl0uKL9WicyIRn8KyPVOsf8hEVExHA5nITBHu84NYsJEBe8JOL
 wzz1nNw8Frucslmi+1lsxKN/TI/A+w==
X-Proofpoint-ORIG-GUID: 2U6x0i1VQqr28SwG0esES5tm79ZmfF_H
X-Authority-Analysis: v=2.4 cv=IpsTsb/g c=1 sm=1 tr=0 ts=690a2f8a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=kXeBfYxH--zQBEzzCVoA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-04_02,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511040141

On 10/24/25 1:37 PM, Viken Dadhaniya wrote:
> 
> 
> On 10/22/2025 10:30 PM, Konrad Dybcio wrote:
>> On 9/26/25 8:43 AM, Viken Dadhaniya wrote:
>>>
>>>
>>> On 9/25/2025 2:22 PM, Konrad Dybcio wrote:
>>>> On 9/25/25 6:26 AM, Viken Dadhaniya wrote:
>>>>> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
>>>>> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
>>>>> ensures secure SE assignment and access control, it limits flexibility for
>>>>> developers who need to enable various protocols on different SEs.
>>>>>
>>>>> Add the firmware-name property to QUPv3 nodes in the device tree to enable
>>>>> firmware loading from the Linux environment. Handle SE assignments and
>>>>> access control permissions directly within Linux, removing the dependency
>>>>> on TrustZone.
>>>>>
>>>>> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>>>>> ---
>>>>
>>>> Viken, you've posted a lot of patches like these lately for
>>>> specific boards.
>>>>
>>>> Should we instead push this to the SoC DTSI, to limit the boilerplate?
>>>
>>> The firmware load from Linux feature is applicable only to devkit boards
>>> (RB3 Gen2 and EVK), and therefore, it is being added exclusively to the
>>> board-specific device tree files.
>>
>> Do we expect GENI_SE_INVALID_PROTO to ever show up on hardware that
>> can't make use of fw loading though?
> 
> If TZ (TrustZone) does not load firmware for any SE, the SE protocol status will
> remain GENI_SE_INVALID_PROTO. In such cases, Linux can load the firmware to
> initialize the SE and set the required protocol.

So.. where is the problem?

Konrad

