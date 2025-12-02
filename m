Return-Path: <linux-arm-msm+bounces-84065-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC84C9B2B7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 11:34:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D26584E4180
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 10:34:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32DB0303A08;
	Tue,  2 Dec 2025 10:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U2pBJPGG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SjXQLIlR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8837429A300
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 10:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764671671; cv=none; b=Uu3x3/Sod7FKEYbrHOQA4nb+J3QY/QpLizUWJIDmtjo+0Y2mOuIIPSz7Zr1l9+vixez6/OD9fl+0AIE8AgIwEspIww0A9+yfGfGUwnNEY03Ee4ne1SIbwJW9CujrsUq5cWBpBH2v2t3aap4/GdQR3s1Vv0rv+t4X9XSAX4Aego8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764671671; c=relaxed/simple;
	bh=mRBpEIMbCWseS8EmKMcji3u++cs6Nw0otPP8nWuP3cs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FlL97mvSTu2DgXNErxu1Bhzy6miq1olnrfPVuwS95fyvR6vSjGmxG6KKWlSc8TP9NHkcaeeK+5hP5k4oOMa8fbABza/0MeosrcH9VeU1F0WQ/wJ0mLTQBFtLpjQdnm/COjaW9/ZQfOgtynL4CQem3mVHaaOoftQ6vRwf7K136z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U2pBJPGG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SjXQLIlR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B29T3233242928
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 10:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iVaDDj93Qsixiii7tAc2HvTx01p9MyhJSH+M1UmH+cQ=; b=U2pBJPGGNXyLBs2I
	wcQSEmN5QnKxCnZYLXVvBFcVt3RQ++bcABj1oFbIhoR5kovW8hSORDsvQXKgrrvV
	PaTnwVqohaORFql1sPTddudTIxor6YYHWgez4u0S4sczH7k+WtpVhTERVUKNTnSx
	RiGpT7R5dnuI6Zdu6d42E91/61XJbsJuE/WuprZVSC8DQqXJTcX61iFWC8+F6J4g
	2akLYfhYlJ6pQSOOo9tYfnvxtcX9nIUVkyjZ6YrQL/n86NjUDdnI1Scba8uZz7/y
	oeNqoW9/13szX6V1j2+Lzlp0UXOCEqC4zNBTr5OWZlo+mcwNWbhcG54KNbPsEoDW
	ro1IvA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aswh5067j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 10:34:28 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ede0bd2154so17862951cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 02:34:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764671668; x=1765276468; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iVaDDj93Qsixiii7tAc2HvTx01p9MyhJSH+M1UmH+cQ=;
        b=SjXQLIlR7p+u3CeTtoItH9DusoZ7pv3bIITpNsL/hhDtSMMAUM1cgG+UOW5G6BxkHb
         23HfKdvdxVYdt+KvmE6dDAi+vzhUkJE7Q1Xtu2jgJfItlRRXCHJwXqIFYIutvEJmYQej
         KSTRcetKd6Hsm9H7z0A525KIeXFzamItR5jVrGrgz7a5d6HALLYanFWwrzut66E6Wa2k
         9oSt/jz/ENk36ECOwLOqkpqlo2Gao0GUTKGUM5VExqbh6yNbp+O61r85OLqDapCUalvf
         njawpnKTPgMKQL4lbYdmp9N+Uy6R2PqelhU2tvJm3wh0pLxjcYAEGo95BYpcPv6BjAPx
         xiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764671668; x=1765276468;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVaDDj93Qsixiii7tAc2HvTx01p9MyhJSH+M1UmH+cQ=;
        b=FbIMMbLhAowEvqE+A/hjOim+CDEYdvwiVPIbPR610rTjwwv70naKKAGMxwZ+9QXf9I
         ADuCiioKkDprBxCpG/FGoA5uqeOEnPtSQyR6M94Yx/DNrzeZWaCNfIFY9cVV3TNSdj98
         hGXlJyuBhQju/oQ/awzbKIbZWTtb/yDGShGMo+Z/MpTRZecYdRlwAHLKf7gCggjTaIKC
         du0BjRRSBLpr7gGr5ogZGtGByevY4dOCykYv++Ihf80vAmFqThjQ81cMjV9xZIuS05lG
         BUpz5eWw+t3Hesj5KTUtNHUOHOuh0wwxmK5KTW3ZFbXUqlemueR63qYtTM93wloMABVK
         bThg==
X-Gm-Message-State: AOJu0YxePiDVxOL2940TLxQfdZXvFrmpdMm7ea+mPYDVzAiiAPupbo5o
	sFIAEMDCgeN9z37BRfkJuEqDtvjsg20DMyPGCWKf1ITHyi9t5oieO8F/sU27mni/3MSxt/4YDtt
	iRQVGbmMvMUTGEbajyH74vo0VuKIVF6QGleo5gjt3X9lGSxomFWW2nvPLdPgcj2H65sSGa52opW
	iT
X-Gm-Gg: ASbGncufIkbyMlDwzqnEiLE8U6bV6ZOfLDh0A9EmNbdPfN5ZHFxmxEnDQMuXFEpXtlb
	jazkb9ixRGS8A4KkTpZNX/BqNbBCtLN/grevCWJCShBR5IVTOA3K+lsMoPw7XvEFViffv1pp5/X
	3RxtlsWnkiaHwsOfPBE0FkZrj4c4pHc8fm2CS8rBxKtA+A5WIR4kN8/tpwjqQiH94xATcE91Dxl
	I2EQMRiqCOpoAxVoUcI4c9NJFLM6uk0k/6n9RY47nrODAmhngRAAI9SIoDPjcPHhqcoSwXfSagg
	NLODWqW9xyEhORVLxwWjSo3s8sTFtr4TnwoKDvepMVIWRYFXwPZxUh5OrDpAslgA2vdHBZ5muSI
	Kozi1PZTamWlar/ovE7oNrrybL88qRvmbFx3AAH92ry+nXlonTiZkN9aptDR+1LcbC/c=
X-Received: by 2002:a05:622a:206:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ee58780ccemr419965461cf.0.1764671667793;
        Tue, 02 Dec 2025 02:34:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6R2Q6T4uhj/5AKTr59dwLVq7SMProZCh9NMSJkGjFh1CQsE6BWuFzsz9E2M7yp+Ac4HS+Xw==
X-Received: by 2002:a05:622a:206:b0:4ed:e2dc:dae4 with SMTP id d75a77b69052e-4ee58780ccemr419965221cf.0.1764671667164;
        Tue, 02 Dec 2025 02:34:27 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f5a5f979sm1459361166b.69.2025.12.02.02.34.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 02:34:26 -0800 (PST)
Message-ID: <6030bf44-c239-497f-811d-2afc0e5aa926@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 11:34:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/12] arm64: dts: qcom: sdm845-lg-judyln: Add lab/ibb
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20251125-judyln-dts-v4-0-a5a60500b267@postmarketos.org>
 <20251125-judyln-dts-v4-10-a5a60500b267@postmarketos.org>
 <09e5d84c-39b7-45a9-b7d7-9beb54fb2f3f@oss.qualcomm.com>
 <cb37445326732dc1c17e80d245c8a29ba3f5aee6@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cb37445326732dc1c17e80d245c8a29ba3f5aee6@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VNzQXtPX c=1 sm=1 tr=0 ts=692ec0b4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=XKEg-W0rSRFBAHshmuIA:9
 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 1nvqGtSSKRsPq0T6QGD2QpxbiC3uA8NY
X-Proofpoint-GUID: 1nvqGtSSKRsPq0T6QGD2QpxbiC3uA8NY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA4NCBTYWx0ZWRfX9Q0XeC1KT56d
 yt8TNYwsTJVlD5TPxL8JbMMc6lp+sIX8T8rG89zFFS6QNE+HPiMojCoMqLq2IBq+oF6JnhoApjM
 8xphoPFGwBPIW7E1fMlngugBA+WzK4ecW/4i4vZ7MoIIjWjhWGbXFi2ODXkx0P0AASVtyD8LPH8
 wwHxhA/YHw6kFt9M2ku0HGUhBcjIGUH1aWwBE18TX1sZzI5qp7QUmN+Vuq4Y57LwhRnyFSzOwyk
 5TLD4TQ1tzw/7ffgt1LdoNiP/GPR4t0n9rr7XB6eIEyb4xPoUErQr9mMAyWymAeFZYDeTihiq8f
 I4ADcUp58XUFlYHf/4vZ8LgcYRGL8nWJTC0LrkIh8O+7AckKksOSMZFP4Tl5HnD7fF/jBUdCgmg
 H84TvHHQHcNT11VMR/DL7QO0ViU83A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512020084

On 12/2/25 5:21 AM, Paul Sajna wrote:
> December 1, 2025 at 12:38 PM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> 
>> Sorry for not responding earlier, you can retrieve the actual volt
>> numbers from the hardware by reading
>>
>> PMI8998_IBB_REG_BASE + REG_LABIBB_VOLTAGE = 0xdc41
>>
>> ibb_uV = 1.4 + .1 * val
>>
>> PMI8998_LAB_REG_BASE + REG_LABIBB_VOLTAGE = 0xde41
>>
>> lab_uV = 4.6 + .1 * val
>>
>> Konrad
>>
> 
> I found it in sysfs along the lines of your previous suggestion instead.
> 
> ```
> 1|judyln:/ # cat /sys/kernel/debug/regulator/c440000.qcom,spmi:qcom,pmi8998@3:qpnp-labibb-regulator-ibb_reg/voltage
> 5500000
> judyln:/ # cat /sys/kernel/debug/regulator/c440000.qcom,spmi:qcom,pmi8998@3:qpnp-labibb-regulator-lab_reg/voltage
> 5500000
> ```

That works too

Konrad

