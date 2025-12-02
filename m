Return-Path: <linux-arm-msm+bounces-84067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 43447C9B320
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 11:41:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 8245C346B33
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 10:41:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD73A30F95C;
	Tue,  2 Dec 2025 10:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G2eTzVBE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T6WApKN0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BEA2F619A
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 10:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764672059; cv=none; b=Tyvh+oLQY92SGDn/XT/B8KyaK9Y71VWcMGDPCte/HkglGSzjuTnbVU64vNdrrhDdYMEG11GWtxDk9VBzmFjqWsl8f9Z4aGUaJox9AKrofrURDIlhsM8gXnmQ0WWRrvr52MMPkRJ4uis82gJgZ0WWozfX8hePvh/LsZgy0OC4b4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764672059; c=relaxed/simple;
	bh=s1k7auASXVIfUGV3gkdFE0Adyx4h9MfLGwW+dSfjAN4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W78OTOzHVu8NzWeXGgEDQSOeAXE6ZxLJ46F/GDG3HtdTHBm4ao9h8ZE70dM2ezIgPh9jAiqNhsTLf5eF1ZpIGumtVPdJM/g7/KrHrV3qMA6YEmax7Tcd9zbMXroYZYnaVMO55q384i392lEQWRffG3q8qIZWFC24UmTo5nURaug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G2eTzVBE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T6WApKN0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B29Sukf3242769
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 10:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OcXzD27F+Pheti1J/j1IoOliMlF9NCAlSyQkzR5URoA=; b=G2eTzVBE1PorJKp3
	UfDcgD1jsMSQLrdNb692YEOG7LmauGrGezjIDyYnTcU0RlKcoDsM5ieEPUVk8A/r
	a4iTvD8PwwKXCTxMYOuOeVp+7OYqqa2xbcbUvZULGvqz5H+ULU4kumWevKD5W7iT
	O/foAjhtcKnbPzsyZAusKLEYJo+In8PDj2yXwBvDBvFR7MkWrIxbQPU17jFLMPHe
	qCEvhsGf2k+XSfec6Y8bnAgaGHUeC9OBwImj/+g27izCbhvpEGGbmKI1RnYXQvgc
	WhWr8sz7r7BIQpRU0/7MBPVDzZGvQQdBqHxeyes60RdpMvEjOPnqfEy3FdA1izZM
	2/z6Ww==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aswh506ue-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 10:40:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed83a05863so18977121cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 02:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764672056; x=1765276856; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OcXzD27F+Pheti1J/j1IoOliMlF9NCAlSyQkzR5URoA=;
        b=T6WApKN0zen3reS7MR6l03fa0YIYxgbdkcuCO3K95KEjcChQRLUs70SW+lUPVRtgfl
         oBlkz2mNnIKcXVko5RDd3+BGIFVdw9RV3Yc9gMc2ghJAzyKzT/fReCAc6kUXNgw7r3qT
         wGc7QJdv5wM3Vyvu6M5zI7ZiI9eMDVn9+KLaHAWElkTNhp/8d+YBuCOcBiTyoth2plB1
         Ex03sUvJXXnjOTtJnfEjRG7AIUgsJa6MAtcJAoHBu9Q7MS50e1iXJKvFa/HK1c7PpFrs
         VUJWrbfaxiuqAMaNcdjWudY+JMDDkruoPuZb9tkbA8ytkcAiEBnsH/on0ST0m+bRS+PU
         Tufw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764672056; x=1765276856;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OcXzD27F+Pheti1J/j1IoOliMlF9NCAlSyQkzR5URoA=;
        b=VGRvH7FO9Vrd66RaJcgvr0VllbOck3+uSQNdhmNtiblUr0VSQy9yT4vYtvhvNjwNU3
         gZhxUQxGUuSP2hiWSXP2q7+Pj/7ne0LI24/DgL5sflsheTyzADDzL+A4C2SxrSOubXHN
         CDRTpJfzvTVyKDLu9l5iDPZwdovRxRe660o2d9TDIEmaekWGmeVn39QKSP9r58Zuh4L3
         2gHDWWveJTs+lFpgh2Cs3853nwCd7Dgv3HN2pTv14qG993q0YCrlyOkiFbsqgs0M7Ggx
         WcDn/W1algphnCvq4TLMru1kJPFlu1DAKzzM3F9ZlY32GJEKnX1QI8/awYMNfK2JJsrH
         QQHw==
X-Gm-Message-State: AOJu0Yw9pzaqOHk/9NyEYTlR4+Eo+ORTjYHaJMvHEWRs21k3rzC6ZHZL
	HXK5qzcO6hZhRtA3VagkMygL1NXktbBN7VzKbhN7So/VwzgJLv+JEQGTOOo00VcNdIgc5CQQEP3
	0rgJJIWHpopZ8OKb4ORtpURH08lXhang1pEHiDtqL3xPKbaZGibtighAsxOqTZ4kTkFvF
X-Gm-Gg: ASbGnct4XVjZqUxVxaZCj5aLsZyyll+uLJVkJXou5uSL7SD/v5U35qqSMS2s1IKy+pi
	SK8OCJCxUlV/clAE2CA9ZWwd/Z7hI0JDL4kOfFXYuMpUdUhqe026bv5RxEo0ujNBq7B2Xm0BQSM
	Upj7f1CfZODDqh9Hq5AsDTlW7K1ebiYNwwJL/pkCkP0BvIecU/gYDeplCVwiuvYHmhRqYRDN5TH
	SevtcYMVYkug1Zla+XSAqWccu1+Zg9N/o/W7skeFj12yilfj/UQb3Zxo3X/E25ZdVoZrJx/G8+I
	aVAx+i3HCLNJxUtqfaG2fGUd6tgykt/O19Tm2QK4TZzboouam5f7maViLpBKwiZtrpwYpAj0D/F
	7V+LniBMXEApjPYe8R+qCcQBlTdNYILhpxqhLMzqHAB3P+jD9YzNySKt/2eoQnlOLJmc=
X-Received: by 2002:a05:622a:206:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ee58780ccemr420079911cf.0.1764672056174;
        Tue, 02 Dec 2025 02:40:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE7SQ7idZTyuYuF+qc/0YuQHcSC3FkDDYqszZx7BATNFBcO1I4NpcfskUl9IhcKWKIxQoLVxg==
X-Received: by 2002:a05:622a:206:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ee58780ccemr420079741cf.0.1764672055657;
        Tue, 02 Dec 2025 02:40:55 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5162d31sm1490083466b.9.2025.12.02.02.40.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 02:40:55 -0800 (PST)
Message-ID: <fdb5e8df-017f-4891-b004-5ef919447962@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 11:40:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus: labibb is not used on
 OnePlus 6/6T
To: David Heidelberg <david@ixit.cz>,
        Casey Connolly <casey.connolly@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
References: <20251130-oneplus-labibb-v1-1-bb3653e43120@ixit.cz>
 <3fcfc5b8-7509-4e4c-a1cd-e973d7e1d091@oss.qualcomm.com>
 <f86267ee-ad70-43ef-8e48-b9f2e509c193@linaro.org>
 <0d63bddf-7a88-4c59-8ba3-6655e7a8854e@oss.qualcomm.com>
 <92c1609c-735d-4b5b-85ff-c40995aab813@linaro.org>
 <63ad4e46-8450-4ec4-bb13-6701f5eec5f6@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <63ad4e46-8450-4ec4-bb13-6701f5eec5f6@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VNzQXtPX c=1 sm=1 tr=0 ts=692ec238 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tNNOYuybAZ-1Ihu986MA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: j0LHUhToJE1CvX3iiy1JXgPtr89pE4qt
X-Proofpoint-GUID: j0LHUhToJE1CvX3iiy1JXgPtr89pE4qt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA4NSBTYWx0ZWRfXwfI9tJdKSRLE
 TBnBOPLF32JeWmaQBZ4tzlZZkNbQOGgBpY9/94WEiH5auowktRCl2Me06j7IQP/GC+/bnPqcaov
 C8lzF+sGUOfehW+NbfLiROd4embF1TuHJXjd7cFRIUBMls98qlx0DeNAreiVrP48azaJDIp4E6Z
 jvDbST9x4POxDxEnrt4S5vjuuB75+mbs85a8ULhkmkZL2MYw5FPT3d8LL70liqU7keYDdyB2gDo
 mu2u/zwRm19hFvl/JIlJpL2a9R/SW/rNFLym/sf+TZ5SPlQhEgDjSZoZOY5qPm4lR5ojgwljIoW
 9BbpkiJAMhsjV6CJDTfRFky4h97gB5GHE/s7TMfPBlou7HWM8vxFxe8ecRm4LL/DpZ1d8SKFIhK
 Cp8Q4zL9vp9rZfwPyP67O/7yhH9WtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020085

On 12/1/25 10:55 PM, David Heidelberg wrote:
> On 01/12/2025 13:57, Casey Connolly wrote:
>>
>>
>> On 01/12/2025 13:55, Konrad Dybcio wrote:
>>> On 12/1/25 1:50 PM, Casey Connolly wrote:
>>>>
>>>>
>>>> On 01/12/2025 13:48, Konrad Dybcio wrote:
>>>>> On 11/30/25 1:08 AM, David Heidelberg via B4 Relay wrote:
>>>>>> From: David Heidelberg <david@ixit.cz>
>>>>>>
>>>>>> The lab and ibb regulators aren't used here. Disable them.
>>>>>>
>>>>>> Removes following warnings:
>>>>>> qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb: Failed to create device link (0x180) with supplier c440000.spmi for /soc@0/spmi@c440000/pmic@3/labibb/lab
>>>>>> qcom-lab-ibb-regulator c440000.spmi:pmic@3:labibb: Failed to create device link (0x180) with supplier c440000.spmi for /soc@0/spmi@c440000/pmic@3/labibb/ibb
>>>>>
>>>>> These are only vaguely related, as there's nothing to be wary about that's
>>>>> specific to these devices - it's just devlink being grumpy
>>>>>
>>>>>> Fixes: 288ef8a42612 ("arm64: dts: sdm845: add oneplus6/6t devices")
>>>>>> Signed-off-by: David Heidelberg <david@ixit.cz>
>>>>>> ---
>>>>>> I assume this is right approach, as OLEDs on both devices are driven by
>>>>>> different regulators.
>>>>>>
>>>>>> Question is, if should be labibb nodes enabled by default?
>>>>>
>>>>> They're onboard. I'd rather keep them predictably parked than left in
>>>>> whatever (potentially ON) state the bootloader may leave them at
>>>>
>>>> Shouldn't they be default disabled in the pmic dtsi and only enabled on
>>>> the devices that actually use them? Many SDM845 devices with OLED panels
>>>> don't use these regulators.
>>>
>>> As I said, I wouldn't be surprised if they were enabled by the bootloader
>>> as part of some reference/common routine and left hanging. Linux will
>>> switch them off if they're never used and I'm fairly sure the users won't
>>> mind the odd couple dozen bytes of runtime kernel memory usage (which if
>>> we go that route probably balance out with the added couple characters for
>>> status=disabled in the resulting DTB)
>>
>> Ahh yeah I understand, the DT node has to be enabled for the driver to
>> load and actually turn off the regulators if they're unused. Makes sense.
>>
>> Thanks,>
>>> Konrad
>>
> 
> Thank you both, now I also understand (and withdrawing the patch).
> 
> Should
> 
> 5dcc6587fde2 ("arm64: dts: qcom: sdm845-tama: Add display nodes")
> 
> also get fixed up to not disable the lab & ibb node then?

Yes

Konrad

