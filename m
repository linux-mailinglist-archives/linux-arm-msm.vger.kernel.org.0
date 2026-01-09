Return-Path: <linux-arm-msm+bounces-88239-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B45D08392
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 10:34:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C27D6306E5A2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 09:28:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AA943596F9;
	Fri,  9 Jan 2026 09:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F2JS7pXl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Pe1HsFIR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 561263590B9
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 09:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767950934; cv=none; b=rlOsG3g897nPu98bDUEx3RDacQtFS27tboLgUF/0Ld5nHHF/FEZ6HcHIRnwqBBf6H38pofXviuTiNiA4Lx/B1NIzrHKVqf2iTnYiuuxDwmno6uB3dWTCvMOrDYmvpOBC5/horhorFZ8RRLqjPESwvgW0rj0howhYIr9x7UvJlPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767950934; c=relaxed/simple;
	bh=EwhCvUGpThRbTE1JVdXL0bButmhHff9aBoQacBokboA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=miWWfkiun42+pYgdCjfcJEsGRdh2FtZoYL8ems2371PBfoNSHUnRhDGbxcKgpoFGZNH4hb5yZ5TntjlbLnvoEbSKPZbpuTuLRfP3PZWnyoTYJTzyZGsJqbGo26oGPbI5Qu05guqwU1wj8+WPhxDyiRnA1WRK70GfbOetfWf9aiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F2JS7pXl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Pe1HsFIR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6099NYX53324857
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 09:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DxD7+yd1ta7QrWdL8G8iViZmmPMfYUPfOb9ddgy85bs=; b=F2JS7pXl2FAHLDs7
	BA9M3V3cDqXBlvh2dNS4ARioYNpJ1+8QB8r9dP0L8ZqlHGERvYf7Ek/o45yIUbud
	pd4lc5q0adbiucOj+dYO1i4iajydgAOiUjOXSwm/ZBluvoi6m9CgzB8dIV/vAWuD
	9JC1DJpl4ZiiomJN7PDm4qis/C+0hLn65bZjHdL/KF63/Nt3xidI5x9/BGFKS0Rj
	ikQ7Dr0CN9TnVSycWoSsRdXJ0DTi7W7aOYIJh8f0XCjW194CdP9QpWSlkLmhRn1k
	nhS9MGzRGZuAW+sJyD3t0K3fgmvPCOVEskKt/Q1gKZftw3VxMTP6lBG+4YXW+s7S
	ioLonw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjrd6h89h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 09:28:48 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-890072346c2so10322546d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 01:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767950928; x=1768555728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DxD7+yd1ta7QrWdL8G8iViZmmPMfYUPfOb9ddgy85bs=;
        b=Pe1HsFIRoLF5sl96x8+O6CXWhBDo0cYQg1cvU+GxvqAfSqQUPEPAtkaCh+KyJJ3rTO
         tZJg3DwTOkc2fvk8oHTspdobmPEqXzFObqmw0dsYi+mPrTP+U+NxtVAbpkAVuI//30Aa
         5oRQM3OwkUFYfH67kceSPoC5hghicJjPu9cqXaeh/UFANgy9hGsH5KdZE8WPjOm43gZ1
         swwQYenYSUoTYpDWLcUOQplWPPNusKN0SBCE/1o5Ew8zEnF7gbu1+BjRJGwBKeu1irs8
         pciHLBiO5ICbNh/41h8uLD8ksL7BQhgG04ikogrWwfs28qn1DIU9ve2tbdoEnr3IRgFq
         2knw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767950928; x=1768555728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DxD7+yd1ta7QrWdL8G8iViZmmPMfYUPfOb9ddgy85bs=;
        b=cUWH7dOWC5KFpdjJ880Bkk31t3TleDMEHbE1fAADfUdjNs14KIP7b2xacC8va33dX5
         6O4zCrAMObD2XdX2VJ6fk0SuaLUB7FsUuRRQpOvS30K7b9aJgtumo6ckz7JOlwq/B4cV
         24tN62CXpAKnAsevwN6mw2tGWpGJCp6Mm4q5hWouumKursOVIcDQP45IrYrH/5KL3pNs
         vRTWcgohU3KloxwIDdDoE4eC8RwPjHjLoVF7yHrZxJZay0asr7kQ+eWxVbFnG7qIawLn
         GklTm1YOwAVVeHxORwYSOIhj+zEblYk7c4pHaPceAgNnbHHFgV8a6lKQAphVvKDKoz2S
         EasQ==
X-Gm-Message-State: AOJu0YyKw0wAYFHJ8sDdn7ZuwlCwQtSu2cPl7KNus09/Xh5OYLUCLak7
	LcsbV60VznPE97NV6vS4wci3zjoBmD82+OwGncK6PC0VAKunaDW3Etl7BOrY/34l1RKcgpVymqh
	stkn4bF5666P9PhMT5HHmKLxkRV3QUxNEjOCsiaG7rV8Uv3ON1vlwO4NtXxOGT0ZCDt1I
X-Gm-Gg: AY/fxX7L+Ycj2a+jyHZhgFjnuHWvEZV9zwAO+RmV7j7ixbdsAjbcTJzJ1spXrk6SIVo
	ttoTF1dtmpls5YT618xg17O+cPdQ0ICXiNivasFbeclAfAdviZms8Lf+EF3i5RYfpDi0yOMU8Lj
	uzYf6+P4xpz1TASX0tP3KZxLutocZgVCMgA9wWDruLc+NROxok3KU8xoi7Y//jKWnmkvC6CTSdm
	/AjKlSJahC0NpfMkXFGEm00btj8MYxYzHzMOV6QcDECLUkWzYbCyzekwyzu/zWxtFe0MLjCoAYD
	+9YLg7DkT6tzOXBmqWaLyZlXf0xX1gkSFS+cR6EGGSfwfXoaKkmfcQ/cfPabiT4yUFyxZMpI4x1
	A4y3sMuAXZjrkslJIZ7nvN/A2pSFl5b81TIf06FV+nw+9NEA6RU4E6Qf1O9RVy4hzkH0=
X-Received: by 2002:ac8:5907:0:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-4ffb48df384mr98422431cf.4.1767950927981;
        Fri, 09 Jan 2026 01:28:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IELVJp03z4uRsWYd4Vv53EDAXn9vErNOOPpsvhoHdIooegRE5rKxNrcCNqG4l5n4lUk6OCkBA==
X-Received: by 2002:ac8:5907:0:b0:4f1:b3c1:20f8 with SMTP id d75a77b69052e-4ffb48df384mr98422161cf.4.1767950927492;
        Fri, 09 Jan 2026 01:28:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507b9d4c0asm9792556a12.9.2026.01.09.01.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jan 2026 01:28:46 -0800 (PST)
Message-ID: <0ecea9df-00ea-42c7-a293-85d7660008d1@oss.qualcomm.com>
Date: Fri, 9 Jan 2026 10:28:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] Initial patch set for PURWA-IOT-EVK
To: Yijie Yang <yijie.yang@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, krzysztof.kozlowski@oss.qualcomm.com
References: <20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com>
 <2e8e6436-96a3-40d2-86ce-a716326f79bf@kernel.org>
 <1af7d2fd-02fa-46a4-a7c5-0a08b1e1a596@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <1af7d2fd-02fa-46a4-a7c5-0a08b1e1a596@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA2NSBTYWx0ZWRfX1UYGBYuIl29L
 2b6Ss4E/6N6jmjzxZEKy/nxukCqAdMCsfwI5Gs6+nIEzynr2Lj0q/d0oL0Ar/70j/iV/F+q5/kX
 CIubH/E6llLU62QL2kFXfjso3xtrP3QnumcjwELeyjTx39r3R414x/ThpH9IsF54c35mGACvtoR
 KjnC031Lu96lpVO1LLNdNsbD3zoly342QiDPg/f7AdzZGY63CfYccWosVViFD9m1GDigE/+yr46
 97Youue5QrBJD9pkgJWokhBGgzdeSg9hSGiEW/NPjjrnBpDKII3+ur+irCYkYOBdAlhAzGQqzWi
 5+wz6hJ6zIEAYKKE5kD5XCSgjD29AIup7DOdkgLz5rxzi+zl6dHz0ab7avaxRDGgQQ13ww3WfxF
 IoCo/Nxc69619XnWd05Q3vHHis6Ajup9vOkvKxwCQNSWUv6x/CExKtqFaNKLxF3mYmvNecM6AV6
 xuAVFAdXsCxUr0AzmqA==
X-Proofpoint-GUID: POVDHtMlAMiL26t0US-lJaC-tXJOKFa4
X-Proofpoint-ORIG-GUID: POVDHtMlAMiL26t0US-lJaC-tXJOKFa4
X-Authority-Analysis: v=2.4 cv=Xtf3+FF9 c=1 sm=1 tr=0 ts=6960ca50 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=aSFJHdPsjabWtVZnqFMA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601090065

On 1/9/26 9:26 AM, Yijie Yang wrote:
> 
> 
> On 1/9/2026 4:06 PM, Krzysztof Kozlowski wrote:
>> On 09/01/2026 08:59, YijieYang wrote:
>>>
>>> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
>>> ---
>>> Changes since V1:
>>> - Update the GPU firmware path.
>>> - Update the description in the cover letter.
>>> - Reorder the patches.
>>> - Use separate DTS files for Purwa and Hamoa.
>>> - Update base commit.
>>
>> That's a b4 patchset, so where are the links?
> 
> Sorry about that. I generated the patch set using git format-patch with format control options for easier review, while creating the cover letter with b4. Since the version number does not increase automatically, the change list was written manually, and I missed adding the link to v1. I will include it in the following versions.

Adding

[diff]
        renameLimit = 999999
	algorithm = patience

to your .gitconfig should work too (perhaps comment it out after
you're done sending a largely copy-and-alter-a-big-file patchset
like this)

Konrad

