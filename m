Return-Path: <linux-arm-msm+bounces-52499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6BDA71018
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 06:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9CB6C188FC62
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Mar 2025 05:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33B9E171092;
	Wed, 26 Mar 2025 05:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mInLtaxe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6DB42A8F
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 05:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742966577; cv=none; b=FgvWjyLNm2k+6c3EWkwkmXv4XDCKkBgYZEtYUUvMaeE3Z7+w/oWthkEDts0amnZNlEYqMrJZc4bfuoqUt5d/ieohUuw4Y3MuNBoOh/M9t4mdvzByoDoxFuf+6sKXxe8tNxkmBAGA2XK87NoQoyyv4Spz0AmkGrmbEdQwVhA5e2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742966577; c=relaxed/simple;
	bh=wu7KOYhzzt1aPvXGvaZbPMj7vgB5f0xmpvm+F2Ru8wU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=C2c6iz/Wp6gUlAHi/MDdeFV2nQbt4iotrpbMSpTt2VDjM+sA0OLrIF4Drr2vUUCKNs9Uda59X9q6pFJiOHlziu1pCW5yuwdMZHhjE+w2w9GEeg8kg8T9X4pvAluqs68E52luwuGXcLimbEhHMmu+dRjdF30GKnbVIG9TNd7xpgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mInLtaxe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52Q5MFwU004131
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 05:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lrTQx8ERJ6iGYIHN+MKhyMH5WY0dx7oLLvlhBvGBzEM=; b=mInLtaxeISjxutxP
	Fq4Kv4WTEEhBAI5ZoMeJ2bzkmk1Z2yM3SOo2D5wnHET3ZyoZJcUyWpbE9gVaDv5/
	G4YQLOxjCP/oJqnBTjOhQQkosXtjwVPs0oiXj1TeQ1WBqsTx4XlO4/l07rwvdoo5
	IVGN2Za4bCPtnZoGDxqLPJOIWFCyR1qZuwmnHKlr7JPuE215gaREPcpZX2yR+Rm4
	clCvp5Zlu9HIKo0zMBxgd7FVJ+uk6N9QiDN+KzlASATL08+ab5sim6Kud9+CUQ6L
	t0LUxQ0CNVKL2r3B0+hodZAy6WVUxuft/49EeAlXwWtkSXnUjSiSvJ8Fd1qwJFKH
	Vfa2OA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xds9uc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Mar 2025 05:22:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2240a960f9cso106914415ad.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 22:22:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742966573; x=1743571373;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lrTQx8ERJ6iGYIHN+MKhyMH5WY0dx7oLLvlhBvGBzEM=;
        b=gFcLmQajTC9+ITNBtJgIyMaWs14Dccz1uwJd+iRQBbnWUzxFhzTgEvPExws8gnNDkh
         Gob0m4PsrI2/SFpKIUpQ4G4owHfWvNV5aDtf+b5X75WtlKIgaoj7z2SvVg72CruE9IXl
         CgKZ86Ven5QEF4DTTue7DwE+ttRtpavABs6xojN+K5XgXwZmhDLgS7eKqoyXk6qJtUkK
         v2oeZ041F/JkJpMXdSXwa4HLhoA2bkpbdgQZF3zRSMioFobG0kPmC+y0/E1HhAgovMkH
         KWRb/l5hujRluSotFHxgit/yV91vYypQ8hGJjjrSjPVqhDD1Dx9g7JdktrniwaXl/djv
         WAkw==
X-Forwarded-Encrypted: i=1; AJvYcCWCryGOSkrjkZif1fUiPgJ4p33jaoY8BHJPPGrERZZdeARBegQPJ33pu9VeT0TIbVPJZocOe43MtwH8aqTE@vger.kernel.org
X-Gm-Message-State: AOJu0Ywa2OXRwzIxLQQnvt2FvY8t3fdWcgmYdz1qlSe4kSwuwcBmHQzw
	yOXPFYXCpGDDIigNcCxokdi95HOqQr5VuZtI86fzckGzvOMdfi83/IlfEiTdidBMzvaszDnHdzB
	hhNmdjtDFJLZKeSbY/yfaZ37JJlBw0bdt47FuwtLuDyCN2FDDunwFR6k4Gz4fGEEa
X-Gm-Gg: ASbGnctK4aTvmdRKfyBOMXVMLiv4cpm15kUJ9xXcXhCQhmKP4CPaOeat3f9s961gxEj
	3jLDwjvhdY7/9N1YR8RbLHi6KlMj4SHq+V4mhk+Eel9QhrrctGi4XkE1VudMY3EaCnUK8HUi0le
	Mn70LzJvL8v+1AWmfg9xTO0z8PP2+wB/vEbVntn/9y8IgVLFXZqCSsJg/1hYqoX2pKf5YRDZfz+
	Gv00117gBhJ+PUEu3w6LJjG/j/44oX4RUFVGHWQzag+5gqw3qP76teXyE0HySlw/e8mLbJ0M869
	pFIGvgCz5E8biQlhIONq6hwzlR5qOpJFuqM9QZc1T0+1H40=
X-Received: by 2002:a17:902:f691:b0:223:53fb:e1dd with SMTP id d9443c01a7336-22780c54cb8mr327398145ad.9.1742966572665;
        Tue, 25 Mar 2025 22:22:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFebjSy2oxdsjTXdcD4YfoNGhOHZD+Zmo7A64HsjPRGvUWflh0UFqaK7hjXKeLCamBfTp3XMA==
X-Received: by 2002:a17:902:f691:b0:223:53fb:e1dd with SMTP id d9443c01a7336-22780c54cb8mr327397735ad.9.1742966572049;
        Tue, 25 Mar 2025 22:22:52 -0700 (PDT)
Received: from [10.92.169.223] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22780f45029sm101199515ad.53.2025.03.25.22.22.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 22:22:51 -0700 (PDT)
Message-ID: <9a4c51a3-ebae-486c-b8ea-44035ae5e616@oss.qualcomm.com>
Date: Wed, 26 Mar 2025 10:52:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 0/5] Add snps,dis_u3_susphy_quirk for some QC targets
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250325123019.597976-1-prashanth.k@oss.qualcomm.com>
 <ee0848ea-7a06-4f4e-9115-5e3c0ab8bf95@oss.qualcomm.com>
 <7029a455-47be-475d-b429-98031d227653@oss.qualcomm.com>
 <gyeppjlzfpmazj5seohhab75mbhv5kyzdbxh7iqddd33dnah3n@w2tpd5gme2rq>
Content-Language: en-US
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
In-Reply-To: <gyeppjlzfpmazj5seohhab75mbhv5kyzdbxh7iqddd33dnah3n@w2tpd5gme2rq>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fR3yHN3tY2aT-Ys6-6NzTWiGV3-KQamJ
X-Proofpoint-GUID: fR3yHN3tY2aT-Ys6-6NzTWiGV3-KQamJ
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e38f2e cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=oWU9Ulub17UrF1cabBwA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_10,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=963 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503260030



On 3/26/2025 5:51 AM, Dmitry Baryshkov wrote:
> On Tue, Mar 25, 2025 at 08:31:55PM +0530, Prashanth K wrote:
>>
>>
>> On 25-03-25 08:11 pm, Konrad Dybcio wrote:
>>> On 3/25/25 1:30 PM, Prashanth K wrote:
>>>> During device mode initialization on certain QC targets, before the
>>>> runstop bit is set, sometimes it's observed that the GEVNTADR{LO/HI}
>>>> register write fails. As a result, GEVTADDR registers are still 0x0.
>>>> Upon setting runstop bit, DWC3 controller attempts to write the new
>>>> events to address 0x0, causing an SMMU fault and system crash. More
>>>> info about the crash at [1].
>>>>
>>>> This was initially observed on SM8450 and later reported on few
>>>> other targets as well. As suggested by Qualcomm HW team, clearing
>>>> the GUSB3PIPECTL.SUSPHY bit resolves the issue by preventing register
>>>> write failures. Address this by setting the snps,dis_u3_susphy_quirk
>>>> to keep the GUSB3PIPECTL.SUSPHY bit cleared. This change was tested
>>>> on multiple targets (SM8350, SM8450 QCS615 etc.) for over an year
>>>> and hasn't exhibited any side effects.
>>>>
>>>> [1]: https://lore.kernel.org/all/fa94cbc9-e637-ba9b-8ec8-67c6955eca98@quicinc.com/
>>>>
>>>> Prashanth K (3):
>>>>    arm64: dts: qcom: sm8150: Add snps,dis_u3_susphy_quirk
>>>>    arm64: dts: qcom: sm8350: Add snps,dis_u3_susphy_quirk
>>>>    arm64: dts: qcom: sm8450: Add snps,dis_u3_susphy_quirk
> 
> It is hard to belive that this quirk is to be set for SM8150, SM8350,
> SM8450, but not SM8250.
> 

At the moment we wanted to add this quirk for targets where issue has 
shown up either internal to QC or at customer's end. But the issue 
didn't come up on SM8250/ SM8550/ SM8650 so far either from customer end 
or ours. Would like to update for other targets on need basis.

Regards,
Krishna,

>>>>
>>>> Pratham Pratap (2):
>>>>    arm64: dts: qcom: qcs615: Add snps,dis_u3_susphy_quirk
>>>>    arm64: dts: qcom: qdu1000: Add snps,dis_u3_susphy_quirk
>>>
>>> Are there more targets affected, from the list of the ones currently
>>> supported upstream?
>>>
>>> Konrad
>>
>> My initial plan was to add it for all the QC platforms, but wasn't
>> confident enough about it. Because we have seen the issue only on these
>> targets and hence tested only on these.
>>
>> Regards,
>> Prashanth K
> 

