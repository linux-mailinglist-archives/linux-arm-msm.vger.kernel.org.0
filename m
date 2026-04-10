Return-Path: <linux-arm-msm+bounces-102619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gJdTCFO72GmmhQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:56:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0B53D4647
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:56:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9003E3036089
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 08:56:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6973AF664;
	Fri, 10 Apr 2026 08:56:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l1lQV9aA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IieUhSIP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 931B23A3E96
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775811362; cv=none; b=JO51HZFbvSHuhMngvAYAA5iL1p7ELsnrCNu0fT5tY9pmj2g+tDAMEkvv89/baZvyC02Bk0X+sbTGahDPwPnpu5JoIjz3SemJNr9hhIg68MZe4NVta/kHUjqmJYK1FWWXLVrh3/ecARw4bD5WYW86KPsks3h2BupfF7Pd6X/Km28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775811362; c=relaxed/simple;
	bh=GWFjobN/z+q+q6VAzTn83X8tsx2TENHTLcoPabSCniM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d4EpNy3k9WenSuEOCRg8ZA97Iy1wRxsdLiVW80OmlGnRDJZKRTh+zSMdyZlDz2sehEAcSLxFXd7ZJwqko6k7hCqraZH0eYl8U2Dw2Eg5e3euTJIqaH9K2cV6x3eIY0uZOqfDMXPMnb4CF4tX8/907Rhyq357mmHGVHhrFr0jrP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l1lQV9aA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IieUhSIP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63A6Koj42867026
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:56:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wNlvcLiFn3EPDBnTEP3/OD9nrYq1rMilcUmKdwmcd2s=; b=l1lQV9aAAZB5IWPm
	XPASMvqTU24RYFa7av3+0/B4pKhbqKvF5EZ/80VStWKbf6Cc+mTM1qLGfzzseZMs
	j6p35k0fZSw8d+SBjB0+FMUqTDWMxPfAgEGLxyYkl0jMfbjKjCHNsAWj1i0k6N5g
	Bs06LR0v8PuvhTfo3RklyARL4gRSOaJHsBY4MTeAOQkNx4dTfZCEC1TOAnCdoDhE
	mn6dS9khgo2pdGqhw9eASbrtpw+Bp6CkQgpaiLr+9uisa6k/725ZcwWhUDE20itZ
	kY9zOerW+/gFLLg2DKHtqphkiv5oWITixNzVidn25dC758H12bAhxAgmsbABtZ0Z
	nSoFCQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decaykn21-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 08:55:59 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b33a19837so5559201cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 01:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775811358; x=1776416158; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wNlvcLiFn3EPDBnTEP3/OD9nrYq1rMilcUmKdwmcd2s=;
        b=IieUhSIPeHdUE3/NKoKFkUMr+cTrl73YBedtmy86PWwvqSdORmrWt476kEPVn3KJDl
         CbtcbM4zOYU5FHgHzW2NFbgn70jMf8xFJzhSNWnV/4zLsSsjtDBbn5C5684GtvQB0C2J
         T7xEI1kk2KwtmuIeAJxApSS3wSR/ekFxsCaxTS+HcxHmcHV37+yn0+mG2GZpBpFAKrjK
         jhXOEdv4eXQCnIqxIbXIagL0kFhkCNIyZKQ9fPhcKwIrFFDIzoFow2A6hWY5ljLwpmKV
         J3LaWrZPm9XiO8TOTKVUm77TE5iKkNyaNxHqeoxWzrIB0egvBpW4Buw7JHmrJc8BkCX/
         99uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775811358; x=1776416158;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wNlvcLiFn3EPDBnTEP3/OD9nrYq1rMilcUmKdwmcd2s=;
        b=ro1ZfVtXBXhnG52fhmNTXgfBFYQWURykAwM6huPDRomGD7GA/I7kN38Y96d4l6YqYJ
         L2mJEooHaVl62WMIhNZeC/EV9ZwKpjSU9GNU3z8aVMClShS/qxeYqAddDfx2XRlC8Kjb
         xvBPiRV15JIChGN5KfEy/1+lIgFXxAKJXV3bpP+WjK+1bdw0L7+F6UK3aM2MPUfqG5WJ
         rQcBxtbmdt8Gw3ixc7YYmK6ih9zDy7CqvyhyQt2jZlc8uxbmNjP+1POe/rQTi7g/aoug
         u85h/1wsIHLxfOqnFUH+vmW5kZ1Dqk1BywnldlHVgSumUkz9wBGpefw+nqM35KYgjr0h
         f+dw==
X-Forwarded-Encrypted: i=1; AJvYcCXdVcCiY9vaXIReIWaxrBl+620JYKV80DRE5upw1FdURnROH4ouDS8xKDxITSSrVOkuEFdFBJMkjQ0eNYXi@vger.kernel.org
X-Gm-Message-State: AOJu0YweqTxtrHiNJwrnpaA+a8iMeNw9GQIx5/eH93v4nhYaELcGGzjb
	kuT3kQPLa6RfJoJ0QVa8IIJXCqKFlsZHiZLXWuHq3Pv9eoW+cXxM89N/gTraDlzoVFj9JbzEJLn
	19thChouVrvFkFxJUM/g0tufbMA1zjiYnXJOsOqVDCcSllVt1+DdaxpAUlUbUMHR6Tj/Q
X-Gm-Gg: AeBDievck4k7dfK9N4CwblFcdfcJ5jdmTurLs/bc+6FE/N41j7aiJycUfo83m2nhrWT
	D++tktOMxnshLkVUtNROdZG+KiOnFeX8545aRaKFGv/MxBoM4utR5IarfVetEa6Tua7wsn0EMDS
	POhVhF0jNkumseguVexwXGP9EAZhSMCO118+SHMGdcpF0TnILWxmt7pt7i8wjz1fNuuXSMRpaSV
	2/2p3YhMh7/p3CcwHNpN1x5Pd2JCWuecBwYsbyo0cWUNtdlvbMf8hS6DSx+LI4RYk9I20J6VJ80
	HyjxEniiQnBGGuVa+CK9ecZRupp/vo6zT8jqU6YpGhE/akPBm8Fy5RXHqtG2JP8FszMpCYuRJ/e
	dGm1vxcEGDqQFRpQtQSD0Yvw/UtgEb/vypEFEiBxXgtvPzj3rYoOQDh/fQqHhN8D7X3XoX+Kco7
	MD8j0=
X-Received: by 2002:ac8:588a:0:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50dd5c4f080mr22735321cf.6.1775811358537;
        Fri, 10 Apr 2026 01:55:58 -0700 (PDT)
X-Received: by 2002:ac8:588a:0:b0:50b:2f83:b702 with SMTP id d75a77b69052e-50dd5c4f080mr22735201cf.6.1775811358089;
        Fri, 10 Apr 2026 01:55:58 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67070815a1dsm443649a12.22.2026.04.10.01.55.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 01:55:57 -0700 (PDT)
Message-ID: <5b45a40d-54a6-40b5-b4b6-eac344827dc9@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 10:55:53 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: sdm845: Add missing MDSS reset
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        David Heidelberg <david@ixit.cz>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260217-sdm845-hdk-v1-0-866f1965fef7@oss.qualcomm.com>
 <20260217-sdm845-hdk-v1-3-866f1965fef7@oss.qualcomm.com>
 <590f75c2-6418-4d39-ba7e-589acdf98786@oss.qualcomm.com>
 <e43d5bb2-bdbf-4439-933e-36591dcfd3c1@ixit.cz>
 <9405b67b-9e08-472d-a937-38c038fdf73a@oss.qualcomm.com>
 <ljser6u4fd5qc4lxxde77igtxz6ertbeucsg6s3zbwlykfowpj@yf7h6tqh6cik>
 <9b4cb352-d1ed-402d-a55d-cce2d2fe1eed@oss.qualcomm.com>
 <t5akkkyyv5yebjmowvqu3nnweu5hz47tagdzv3ifzqwlgib2v2@5jugyaiav5wn>
 <8cd9693d-9ec0-4173-bcca-786915b5c4cc@ixit.cz>
 <xbbaffnmi6z5ohzw3p4m6ox75gasgc3nw5cf6yo7h3td2bmsrb@px2mntm74rhb>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <xbbaffnmi6z5ohzw3p4m6ox75gasgc3nw5cf6yo7h3td2bmsrb@px2mntm74rhb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=XtnK/1F9 c=1 sm=1 tr=0 ts=69d8bb1f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=SXzkmgPmAAAA:8 a=VwQbUJbxAAAA:8 a=RZ-4Qy_TuwwZI4MMkMAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=EWLf6cg6Bh5aS0AxDgDu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA4MSBTYWx0ZWRfX/XRLLyWmHrIY
 57nD+uiLug3caYlZaKKSmXd49aLuTnMOWB23HP0ufXThZZL4053HadTlOPFbXB9Mg/CxuT95/dE
 hNJwLi8DpomFB+zYhtB85oh6X3nZ7W0JihX01wyG15knFpOH4hSa82SnizJ2EhSVjmeWjxix7WM
 bUivsjuEo9aUo/Ndc9QWgcsafvgf4V0QNx8ozjOz8xt8qqKx/CNqDdWUtYF3w6Zh68iSunkqZAn
 1zZ5+mk0MAnXqPljFJO11jdo1RcGELF2icAPFCiJhwCeR6np63o5N+OUK+5kUr4E8Xvkk3fS3Fc
 NIRhHEahn0yfr3hg1pmhZT7wQwuqlWdRXJxWw6Eklmtw5RZkz+X6T/Bj1kEXPdLaEBJDcZGuWVy
 cbMeMBgKDdP53CAFR0UssB9WMogJJ186npoqFZ9Jhno2VY0v3vSfpj5sqwj0ggdc5EccUh9bzy7
 nbXq084CC+7I3C7dNUg==
X-Proofpoint-GUID: _K2YbohZ3WKKycD57P6BPNGxiTVNZ4Od
X-Proofpoint-ORIG-GUID: _K2YbohZ3WKKycD57P6BPNGxiTVNZ4Od
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102619-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ixit.cz:email,codeberg.org:url];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8F0B53D4647
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/9/26 11:24 PM, Dmitry Baryshkov wrote:
> On Thu, Apr 09, 2026 at 10:38:15PM +0200, David Heidelberg wrote:
>> On 18/02/2026 16:59, Dmitry Baryshkov wrote:
>>> On Wed, Feb 18, 2026 at 03:28:01PM +0100, Konrad Dybcio wrote:
>>>>
>>>>
>>>> On 18-Feb-26 12:58, Dmitry Baryshkov wrote:
>>>>> On Wed, Feb 18, 2026 at 12:24:26PM +0100, Konrad Dybcio wrote:
>>>>>> On 2/18/26 12:18 PM, David Heidelberg wrote:
>>>>>>> On 18/02/2026 11:30, Konrad Dybcio wrote:
>>>>>>>> On 2/17/26 10:20 PM, Dmitry Baryshkov wrote:
>>>>>>>>> From: David Heidelberg <david@ixit.cz>
>>>>>>>>>
>>>>>>>>> If the OS does not support recovering the state left by the
>>>>>>>>> bootloader it needs a way to reset display hardware, so that it can
>>>>>>>>> start from a clean state. Add a reference to the relevant reset.
>>>>>>>>
>>>>>>>> This is not the relevant reset
>>>>>>>>
>>>>>>>> You want MDSS_CORE_BCR @ 0xaf0_2000
>>>>>>>
>>>>>>> Thanks, I prepared the fixes [1].
>>>>>>>
>>>>>>> I'll try to test it if it's not breaking anything for us and send as v2 of [2].
>>>>>>>
>>>>>>> David
>>>>>>>
>>>>>>> [1] https://codeberg.org/sdm845/linux/commits/branch/b4/mdss-reset
>>>>>>> [2] https://patchwork.kernel.org/project/linux-arm-msm/patch/20260112-mdss-reset-v1-1-af7c572204d3@ixit.cz/
>>>>>>
>>>>>> Please don't alter the contents of dt-bindings, it really doesn't matter
>>>>>> if on sdm845 it's reset0 or reset1, that's why we define them in the first
>>>>>> place
>>>>>
>>>>> I dpn't think that will pass. Current reset is defined as RSCC, we can't
>>>>> change that to CORE behind the scene. I'd prefer David's approach.
>>>>
>>>> Back when I replied, David had a patch that removed the current RSCC
>>>> reset definition in dt-bindings (at index 0) and re-used that index
>>>> for CORE, putting RSCC at index 1. Perhaps it's better to link to
>>>> specific commits when making comments, note to self :P
>>>
>>> Yes, I saw the commit having two resets. Anyway, as we saw, it doesn't
>>> work.
>>
>> So, finally I spent "so much effort" (read throwing it at LLM) looking at:
>>
>> arm-smmu 15000000.iommu: Unhandled context fault: fsr=0x402,
>> iova=0x9d4bb500, fsynr=0x170021, cbfrsynra=0xc88, cb=11
>> arm-smmu 15000000.iommu: FSR    = 00000402 [Format=2 TF], SID=0xc88
>> arm-smmu 15000000.iommu: FSYNR0 = 00170021 [S1CBNDX=23 PNU PLVL=1]
> 
> [...]
> 
>>
>> These (or very similar warnings) are around sdm845 definitely 6.19+ /
>> linux-next kernels for some time, but pretty harmless.
>>
>> LLM suggested multiple fixes, but when presenting possibility of
>> implementing mdss reset it found it as most preferable [1].
>>
>> Adding MDSS reset would most likely solve it. It's not critical, but not
>> nice to see many red lines in the dmesg.
>>
>> Is there something I could experiment with to get closer to have proper MDSS reset?
> 
> I don't have a sensible solution at this point. We tried using the MDSS
> reset on several SDM845 devices, but they just reset. So... I don't have
> any possible solution.

The older context talks about altering the existing dt-bindings values
and now we're at hardware (mis)behaving? What is the issue here?

Konrad

