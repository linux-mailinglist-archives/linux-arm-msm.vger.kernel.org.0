Return-Path: <linux-arm-msm+bounces-73313-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF48AB54AD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 13:17:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9152F68351E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Sep 2025 11:17:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 193283002D7;
	Fri, 12 Sep 2025 11:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S1Vj+uzr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749C61F872D
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757675819; cv=none; b=Kkzno9jNencoaoJkOt/jyg+gCYjr3xjiDhAC8XbCEkiAy9v0hVjVqqQKif/UyPXI2LlJyqOqLHCKudNJu3dLWgilywwx1iWwZzOjEGt1AGgpJV5bGF3tUygkaLOI4Hc3bzu6EUH8UTcwynoGEjTeXOklIDDk46G+j+xY1TdBr2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757675819; c=relaxed/simple;
	bh=rhcvNmsTzZQHkse9jgvO4F3jLJZazKY8siHVo2PUE/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dzjDBCilOhrsIfWLocoJJmfL9ryxzxnpOXCfnHkdSrhBQAj9KunSzvcNcX1/cd2mwGvXtbcw99Y8B54e3Uc0eZh5pfL7R6dpu1T8YvH73Md7cz+1QmBgbiixmtPyCkLAnjv28sYw1VWNC9t4OwXAzIhp2hN87EK62Skahnlvq9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S1Vj+uzr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58C9fDjR017418
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:16:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OESG3ssqWgVEsTZ/213k4+I+aFjRTeVrTfjQpSv0v24=; b=S1Vj+uzrLbUhU5Dg
	nTFCr4L9YwdCtkOrCRiT7kEw9+EMghvpwCnF6gs98wTWepW4s88YDWtPGFHxew9H
	4t7eWFFVE9jkKVN7mr2pKHpAvuN+F+2V1jUcF7U9bq5GGGvkc02ijzrMy/U4wMDz
	21TVzfZQF9tCz8cWVXZNJ2W7iOknAUgFs9SVtvimL1Iu9/h7tdbKE7Whb3eef2YN
	FXsJT6KJhtIBiwCbIZGoGLWe89Wmmj3LsOQvoXvW/8tU0WqpWMQoHc8N0d2uT+Tc
	Nb2f4GJFvXNA8nQHRN6mp8FQlOK+OJKOJIdKg2ddopSNzA7Cmg+SCwlMWfhd5uRr
	ymtF8w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490db8uh3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 11:16:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b33e296278so398521cf.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Sep 2025 04:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757675815; x=1758280615;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OESG3ssqWgVEsTZ/213k4+I+aFjRTeVrTfjQpSv0v24=;
        b=gQDPsMsEI3E2Lm7PHKsvHPRVZc/QGynNxaqBcvgMGOBGq7YVNcO7oG/LZWoZ5xf1hH
         gj3WW/InY8LaNPjIR0HnysvZNPti5TVhGVah6qmF/t4K+FjXoCDtZ/xdkj3uriouHwzu
         ZCKTRr7VCpkWhpL496Kr2s4smdwNXY/mdo8254+ZIekr/4TvJpbzN1oZolv0F9D9ZC+D
         tI0j5oE3e0O1WrLqzzX90U6idDKpmwMIc/CWWnqqeHQff3FnKSLz1s6BEuFDLPTUXNKK
         p4fyNBS7wb1ads1pv1qAjLiZ05CKsNQKUmGc4b1NtJ1tzrgzXgRUoTQ20J9D3bh4aYdi
         m+LA==
X-Forwarded-Encrypted: i=1; AJvYcCU/BVBTXqn8l/A9qp8Bya4vVk3E+ddzc3hMoFFkpGuaduc6Hix9n6Yv+Qf1JlMhurzbU9NkboC+esjC5qeU@vger.kernel.org
X-Gm-Message-State: AOJu0YwsQig1o2AvAWYNg6bZ109n4MGETXiPhR52CstaUJp4oNh/ajUQ
	c8N9G01brWcMahFbMJJ40awjDOito48Q4aOI+dRqN+qtZyX5J8u6lAPR3gEOeBtRWdGeaumTmHe
	dH+Kbd+pT+K86VXLLquG3qEQYH+6zS9OjK+y1y6b79sEcL5lBIuM7Tk6IdlQ5H6RBIRRT
X-Gm-Gg: ASbGncteLWYCOAX0txwAiUuHJx8PrZWBlPHCbeX7QwY5ma89+PhTNpJKbHP+hi37E0B
	mNOkOtcgTz6ty9uXtkvOLSZC1SBiX2EHZx2zIqITxTZzHrOpYTA5jKpfSINnIA4DFhvN08b/4jg
	P/6q6Kq5yL23tTfAWu8lfbv1e4rbqEz0nIvMrGHn9si8MZXNaPSbh+RuHvhv5Cmq46B/5FtD/QQ
	LwQ+MH6oLHeNYr2T/zYWjdG75bCZ9I2PXHxuzjKeEb9Yy+miSdq/PQAMfCdTHy63tIYud3Z+PGo
	6w5GCf9N/G30pOV26TUELk0+IH6qps+efsgpZxsnMmpoBzOF/ygui/nXotsV+E+V2vZvl6/MyQh
	co7MhcQ7n8/Yg69HAiFzK8Q==
X-Received: by 2002:ac8:58cf:0:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4b77cff3c19mr20844171cf.7.1757675815255;
        Fri, 12 Sep 2025 04:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6jtjf37Oow/lnm/s5r6GSfkEFCpnLou6DpovhAGP4DVjGD3jXbH8ADRgUAiwdIeHIEMFGwg==
X-Received: by 2002:ac8:58cf:0:b0:4b3:4590:ab6d with SMTP id d75a77b69052e-4b77cff3c19mr20843831cf.7.1757675814684;
        Fri, 12 Sep 2025 04:16:54 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b07b32dd5bfsm343563766b.63.2025.09.12.04.16.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 04:16:54 -0700 (PDT)
Message-ID: <e06183f7-4aad-42bb-8c58-6a0d8b7b60ac@oss.qualcomm.com>
Date: Fri, 12 Sep 2025 13:16:51 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for Gunyah Watchdog
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250903-gunyah_watchdog-v1-0-3ae690530e4b@oss.qualcomm.com>
 <20250904001014.GA3405605-robh@kernel.org>
 <a547ecce-31c7-4627-ac6f-aeeef81bd0ff@oss.qualcomm.com>
 <CAL_JsqKuoJrkActpLXVUW9e9=R1FESUbD_rwBd5NGX2_Yv2ASw@mail.gmail.com>
 <99cacf08-0fb4-4b44-9036-96ea5fe01c10@quicinc.com>
 <e7f0b014-3dec-4276-a2dd-479d4248c7e6@oss.qualcomm.com>
 <499f88af-30f5-4507-a90c-d592d0bb4657@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <499f88af-30f5-4507-a90c-d592d0bb4657@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzMSBTYWx0ZWRfX6B33f1Hut5UR
 0uCNBrMTm76Bil9LL13XhMMWx7AWAQvT/qolWA4PC0lZSMnv5sT2kNsFmgVS7cK6Y4pIpdH6WXZ
 lOk5MN1Rg2vCa3NF3CKFoOPAQF2deONMuSxX8A6S+SInD9NNZ/MewcAM9W9H2mAtSCS4vrmmOnP
 KKkhkAtTwp7L+75mhi4YPzTgQyBOP2YZ3efWQUtvPp101f1yxhafeRagCg1OjjCm4J6A+Kad8St
 2x30mVXChF0VXPUAK6RPuXNZ95Q7Fp/Mo+cpqgpH9l8Wyx2YwfwQgY7ys6s+ctm10XiiVl8mEmH
 hD2QKPLBPavbj5BWriXfnAUIF78Uneo1Spd6PaTTs08Q/2V6mTvqykenI+VS6TUVk/+4l0HoMD6
 wTAQF0K0
X-Proofpoint-ORIG-GUID: tckFh7Kg5MuAeLZ1igo-hgm_7ap-cREF
X-Proofpoint-GUID: tckFh7Kg5MuAeLZ1igo-hgm_7ap-cREF
X-Authority-Analysis: v=2.4 cv=VIDdn8PX c=1 sm=1 tr=0 ts=68c40128 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=voeTMfilsXCseR2-0McA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_04,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060031

On 9/8/25 7:49 AM, Pavan Kondeti wrote:
> On Fri, Sep 05, 2025 at 12:18:06PM +0200, Konrad Dybcio wrote:
>> On 9/5/25 2:00 AM, Pavan Kondeti wrote:
>>> On Thu, Sep 04, 2025 at 05:51:24PM -0500, Rob Herring wrote:
>>>>>>
>>>>>> Why can't you probe by trying to see if watchdog smc call succeeds to
>>>>>> see if there is a watchdog? Then you don't need DT for it.
>>>>>
>>>>> There apparently isn't a good way to tell from a running system whether
>>>>> Gunyah is present, unless you make a smc call (which could in theory be
>>>>> parsed by something else, say a different hypervisor..), but then this
>>>>> patch only introduces the watchdog interface, without all the cruft that
>>>>> would actually let us identify the hypervisor, get its version ID and
>>>>> perform sanity checks..
>>>>
>>>> IIRC, last time we got just a gunyah node. Now it's that plus a
>>>> watchdog. What's next? I'm not really a fan of $soc_vendor hypervisor
>>>> interfaces. I doubt anyone else is either. We have all sorts of
>>>> standard interfaces already between virtio, vfio, EFI, SCMI, PSCI,
>>>> etc. Can we please not abuse DT with $soc_vendor hypervisor devices.
>>>>
>>>
>>> We are trying to make the watchdog work with existing SoCs, so we are
>>> sticking with the existing interfaces. The newer devices will not
>>> necessarily need DT to probe hypervisor interfaces.
>>>
>>> To answer your question on why can't you probe watchdog smc call to see
>>> if there is a watchdog. Yes, we can do that. It is just that we won't be
>>> able to support pre-timeout IRQ. This IRQ is optional for watchdog
>>> functionality, so this is something we can explore.
>>
>> FWIW Rob, we moved on to SBSA watchdog on newer Gunyah releases..
>> Which is not ideal as it's still over MMIO, but there's some
>> progress
> 
> Gunyah running in Latest SoCs do support SoC watchdog emulation, so
> Linux does not need to worry about if it is running under Gunyah or bare
> metal.
> 
>>
>> I'm not a fan of including the hypervisor in the picture, but as
>> Pavan said above, we're trying to squeeze the least amount of hacks
>> necessary to get the most out of existing platforms (i.e. ones which
>> will not get newer Gunyah).
> 
> Thanks for enumerating our goal here. we plan to support watchdog (hence
> collecting dumps) on existing platform where Linux has only access to
> this SMCC interface.

I think you didn't explain it clearly - do we need the wdog to bite to
enter crashdump at all on these platforms?

> 
>>
>> Perhaps we could extend the MSM KPSS watchdog driver (which pokes at
>> the physical watchdog on the SoC and whose DT node represents
>> "reality") and have it attempt to make the SMC call early during probe,
>> making way for both physical and virt configurations without additional
>> dt alterations..
>>
> 
> We have to be careful here. I am told that SMCC interface might not fail
> even when Gunyah is emulating SoC watchdog. We can do something like
> this.

"not failling when gunyah is emulating the watchdog" is sort of what we
want, no? Unless you meant that if MMIO access is allowed, the SMC
interface may still report no errors, even though the calls don't
actually end up doing anything useful

> 
> If we don't find "qcom,kpss-wdt" compatible device, then we can add a
> fallback to Gunyah based SMCC.

Matching on "not compatible" is tricky, especially since the arm64
kernel builds must support all platforms at once

Konrad

