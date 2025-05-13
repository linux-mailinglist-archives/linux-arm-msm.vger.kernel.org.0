Return-Path: <linux-arm-msm+bounces-57774-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C621AB5F22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 00:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 356041B430A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 May 2025 22:12:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9ABE202983;
	Tue, 13 May 2025 22:11:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iG2fw2id"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE3520C49E
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 22:11:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747174304; cv=none; b=aMYEgo6A09DjIzuP+heebDrrwphvKaw9S2F919zVr9w99MzGMr6wxZ4Socro4SwwMKT/bZTFozHNtfPmirTeT8Sno5cNcRKNrUJSa3PnTQ++S20jdk2ynVZdmA28w5T+mG5EzUD/ka8tLzeoonrFSnw3okt4S1ljYJxZaAQnqHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747174304; c=relaxed/simple;
	bh=Wpmv5eJVz6HPoCUsxpJBBAmYWSBRCCJ0nPxwPZDwHSg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rP37RH21/+ND7hIs0dF0oBHGt4j9RFI169lY+cvvAJR7PB5f3ePS/cDrjPTOuwgqpQhS2WmTrDzMEgPpic02adb/j7LJx8gl63BGoVyaGm5heCLxmQEbdDdd4C++A80eAH4Ls2iCh1pEUcNrvgjNWReJUSHdDYQdI+3jZalqXyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iG2fw2id; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DIUnPx007812
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 22:11:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QuIBju/bfcvSH9aFOhrzW1870PZVgl8/kD81ju5wzh0=; b=iG2fw2id1IOkZA8h
	0hE7DbARmiWn1fxBv7lVsNAyIs2h4byXpCjOv4iY1EulQUx7Wag1PWcWvG+cOvGU
	c1dEP/iWCX+f0lWyRSXFIyU1pa42b8qDVUUACMtv4sWV73WSyGtjjcagZja9Twvd
	S72J/I8I7PDtnFoHrS3jDn4MKAgYpc+DLYiCU+K0JqrjvALXWi0FOrCcqi4xBUJH
	1naxbwIboeUDfr5c2tkdW1Xueb6AtDAfpNgD8QFXK7Zl2/5Kwdbdqk/jgKO1nofU
	tyreaLGfOU28Pztf4PSlDFJI+em2Kx8ehw76rOvlbpSPLx49CYuBvEBl48gRqY/1
	rm4nIQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcygjbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 22:11:41 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c7789335f7so39095385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 May 2025 15:11:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747174285; x=1747779085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QuIBju/bfcvSH9aFOhrzW1870PZVgl8/kD81ju5wzh0=;
        b=BL/qc/tS1HxCj5k9wNn2YR83KRf9SB+aUMms6OR100tSdICu38V6XklrePGJ9z0VGw
         Zw5ZqETaAOQtkQw7WXVDyYl7CnW64uGtfjq/wcpAhNwPuCStDsloiB61IVHsuP1bL3rR
         RzT6K2tSIMAQ0DOvYfSIOF168yJfwJQbCDusSU/6j1cUWhb1J0Lh3hmJm4OI4LI+URNt
         gVeOmJfR4Fnp2sYxrpysiGiNDqwRKrVcXGmDkeUASHFeDBcfubHfdSZ/6L+MVe1asUjX
         X8ceKvI45yyrBrSAeTQUhxWgOJOfhftWsYgH84mxJ4m0CspmnLaL1b7BZXo/j332AJ/4
         P0jg==
X-Forwarded-Encrypted: i=1; AJvYcCV+xL8Rhc+6/1P8d4PSFyYamE1UJflHyX8OP4+aUCm8sZIkraEO9m9PqVjUasCg0dI0OtZ95+KNQ9ffLiVt@vger.kernel.org
X-Gm-Message-State: AOJu0YzVRj8RMnAGQPiHKncuDiMWhfD8C9tLyWWB8rTeI96AqDW+1csk
	WrL5gHnM0CqCbcRbJ3iXEJfeDZGMPQhx/qoA2w65zWY3NgwYN4QFYJDdteryjC/xFOUf5TekjIH
	om0P4zJC7/cPwT/mbKPNugJ6XEnt5UNJxO+49q29KWW4Xll/llRAmWOmntKu3+iXQ
X-Gm-Gg: ASbGncttfRAJjkM55ZGafn4qgs1KTm0Eh2OiqDN7uURL330+RTOPeeKlweuJPsY4ibq
	hviaZRlwrvmlvtTRcVUsFUq4Vek68semYCVt89dB7ttZeV3jwng/L+hy8PBqIRHUbHNW5yC4Lfw
	HOkCRVi7wxGdJNPdu4jfeURmuZs38WLymYNCgN/5qXv7REirwCBMRq5PEBJ4x735055VF9Da1I2
	JWrBzztn1TaaYVtOc/UDZwjnAfYm2TKE8qArtgeDZOK5kOq1zLJ+Fj8ARs7yCiHw/NWSP/iyKM+
	Li6j6rsLB7Kvz0XfD47OBhZlJ+wJDsnZmA1xtpLlkY7wsEQ8vIt1Se39NrDEhjDvKQ==
X-Received: by 2002:a05:620a:4902:b0:7cd:2992:1fb7 with SMTP id af79cd13be357-7cd2992200fmr24749885a.1.1747174285169;
        Tue, 13 May 2025 15:11:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoxVDAJLBl9VwPhZr5BfNm1jaShPv13zbF6MvwOx2I5M4qz0J8tyiQARWXPmbeg+uDu4tdyQ==
X-Received: by 2002:a05:620a:4902:b0:7cd:2992:1fb7 with SMTP id af79cd13be357-7cd2992200fmr24747885a.1.1747174284714;
        Tue, 13 May 2025 15:11:24 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad24677c9e1sm511489866b.88.2025.05.13.15.11.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 15:11:24 -0700 (PDT)
Message-ID: <fd7747c5-1e16-400c-95c5-e1209f58352b@oss.qualcomm.com>
Date: Wed, 14 May 2025 00:11:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFT 04/14] drm/msm/a6xx: Get a handle to the common UBWC
 config
To: Rob Clark <robdclark@gmail.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
 <20250508-topic-ubwc_central-v1-4-035c4c5cbe50@oss.qualcomm.com>
 <CAF6AEGtcoMZ+WiW5_BA4NFpLZsoOrDbkY4xyvENGoS2FQVwQxw@mail.gmail.com>
 <5c3d3682-8378-486d-8af1-4b884b81f3d0@oss.qualcomm.com>
 <CAF6AEGvmEP4oGytfsCHYDCtOUDYq68y=vS7fu0jzP+=oajeq9g@mail.gmail.com>
 <b7bd0f7a-854b-4464-abd6-51f932ee2998@oss.qualcomm.com>
 <CAF6AEGuDBdmyS+N4pR3gEYz0mSLkKqYZjCASk8am2atdGKq5UA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAF6AEGuDBdmyS+N4pR3gEYz0mSLkKqYZjCASk8am2atdGKq5UA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _-Frztm2xH30z3pYCSP-oY4HAysjY1PJ
X-Proofpoint-ORIG-GUID: _-Frztm2xH30z3pYCSP-oY4HAysjY1PJ
X-Authority-Analysis: v=2.4 cv=JszxrN4C c=1 sm=1 tr=0 ts=6823c39d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=oFLY9Wx-2Yq6dO1YmhEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDIxMCBTYWx0ZWRfX+45rrmPKs4cC
 8mBxn44xmf8A6CeJjVsbBXtpXU1Udjgwzer9CJEAIAvjgiV/CNjFROtAnmUFdLcj1dekuu0KLwP
 UDVmNumeIiZKXBVdpDk9pTvRKU+3bT3wVNVT15x/JTF3rKty3xUsZ7j/p8LaZmmPudmpEF+Iy6G
 Y/40LCjdhb63koUMTCZIS/PaxXUp6zy/sjNrPHV8Qp7H27M/L0XMK9QxoeetlWD5MkEbIvTdJ8S
 BnS/v49xCDDgTMMLCxarhsLIEnBoMKB9+3al5hlhCeiEPxTsipu0P4KAreoTdwZH4DNnbRbPrbC
 DrBOC2kV6pJG4As/6Fk3+OobaW/4WBM/ge2QrQSGZhTRjz1FecglP4/jBK1qIOgXCbb319MuGp+
 ExbfIwJ098mOT99JUfVpVCfwJTXRjtXUKqmHXdeq57daV6pIpPXAjxPRiuPzF36+HgY72mZ+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=999 bulkscore=0
 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505130210

On 5/14/25 12:06 AM, Rob Clark wrote:
> On Fri, May 9, 2025 at 10:00 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/9/25 3:52 PM, Rob Clark wrote:
>>> On Fri, May 9, 2025 at 5:31 AM Konrad Dybcio
>>> <konrad.dybcio@oss.qualcomm.com> wrote:
>>>>
>>>> On 5/8/25 8:41 PM, Rob Clark wrote:
>>>>> On Thu, May 8, 2025 at 11:13 AM Konrad Dybcio <konradybcio@kernel.org> wrote:
>>>>>>
>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>
>>>>>> Start the great despaghettification by getting a pointer to the common
>>>>>> UBWC configuration, which houses e.g. UBWC versions that we need to
>>>>>> make decisions.
>>>>>>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 16 ++++++++++++++--
>>>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  6 ++++++
>>>>>>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +++
>>>>>>  3 files changed, 23 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> index b161b5cd991fc645dfcd69754b82be9691775ffe..89eb725f0950f3679d6214366cfbd22d5bcf4bc7 100644
>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>>>> @@ -585,8 +585,13 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
>>>>>>         gpu_write(gpu, REG_A6XX_CP_PROTECT(protect->count_max - 1), protect->regs[i]);
>>>>>>  }
>>>>>>
>>>>>> -static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>> +static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
>>>>>>  {
>>>>>> +       /* Inherit the common config and make some necessary fixups */
>>>>>> +       gpu->common_ubwc_cfg = qcom_ubwc_config_get_data();
>>>>>
>>>>> This does look a bit funny given the devm_kzalloc() below.. I guess
>>>>> just so that the ptr is never NULL?
>>>>
>>>> Yeah, would you prefer this is changed?
>>>
>>> I think having an all zeros ubwc cfg isn't really going to work
>>> anyways, so probably drop the kzalloc().  Or if there is a case that
>>> I'm not thinking of offhand where it makes sense to have an all 0's
>>> cfg, then add a comment to avoid future head scratching, since
>>> otherwise it looks like a bug to be fixed.
>>
>> So my own lack of comments bit me.
>>
>> Without the allocation this will fall apart badly..
>> I added this hunk:
>>
>> ---------------------
>> /* Inherit the common config and make some necessary fixups */
>> common_cfg = if (IS_ERR(common_cfg))
>>         return ERR_PTR(-EINVAL);
>>
>> *adreno_gpu->ubwc_config = *common_cfg;
>> ---------------------
>>
>> to get the common data but take away the const qualifier.. because
>> we still override some HBB values and we can't yet fully trust the
>> common config, as the smem getter is not yet plumbed up.
> 
> So I get that common_ubwc_cfg is the const thing without fixups (and
> agree that it should say const), and ubwc_config is the fixed up
> thing.  But don't see how that necessitates the zeroalloc.  Couldn't
> you just:
> 
> 
>   if (!IS_ERR_OR_NULL(adreno_gpu->common_ubwc_cfg)
>     adreno_gpu->ubwc_config = *adreno_gpu->common_ubwc_cfg;

Aaaah I read into what me-a-week-ago thought and realized I did that so
that I can still make overrides in a5xx_gpu.c (where this data is
*always* hardcoded up until now) - I can simply squash the last patch
with this one and we should be gtg without the zeroalloc

>> I can add a commit discarding all the HBB overrides (matching or not)
>> or we can keep the zeroalloc around for some time (i'd rather keep
>> the function returning const so that when things are ready nobody gets
>> to poke at the source of *truth*)
> 
> We can keep the overrides to start (although the goal should be to
> remove them).. but qcom_ubwc_config_get_data() not finding anything
> seems like more or less a fatal condition.

Indeed

Konrad

