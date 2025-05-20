Return-Path: <linux-arm-msm+bounces-58694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C826ABD5BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 13:03:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 19C261888977
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 11:03:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF27A26E14C;
	Tue, 20 May 2025 11:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e0YIMzu0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2C21EB5DA
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 11:03:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739006; cv=none; b=rXilVQXg6YUlAqYU2LYAgiSWeEgJ09k1cSJ42RBF/WodUGNPkysLXtfx7ve6PEFJ4ecWLjMIXlRJ4jMZjG99VPL5OTfXhboFw1P4n4Uf8Abv6LH7e4HXzOYxCx//zHh827p5tKI2usg48b5YEs4Zr0Tgymb97Zc/rr9lO/hxgTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739006; c=relaxed/simple;
	bh=HASfEQbYU5nw3DzOLjgQQ5wPQXIzEj4uBQ47tMxhs64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MLxGFFtO2uZTyBktQK3vyfimsQGrostDwVwxKQKBFfjNWdgF+O0Bmoq1iLySCtRyaqGUZsvU6xY7Y8BWgrkmIPRIZiZUiMdSV4sKBwK50sADuV+t9130SL3bUysNpEeeQBIFY0sN4SOqav2dnqNJ/iRYLpIthFjxd3vNVuBfDOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e0YIMzu0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54K7cIi3023174
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 11:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HScz0u+Llm93qijaunpm9s3ySMN/5Pt+kU5sMHKjuGE=; b=e0YIMzu0M/p3LryV
	zXREBg6/u1ASGZsH/hYYEt06tH/XHECsh/OF5v//CNfuWDGbHhQDE4x961grjHDm
	RfU/wlP9E/MJiAa7xIR7yNGMp0yE14BrHijFARg3v/KwNX78Bup8b3jRmuc/+G8Y
	9uEObGdFQnfRUzlvIVImOGRc3sLbG17OqDxQXkQeMb8nj71ZjUBnAkLroDqGSDeL
	KmHCN09mgaWDkcuxG67xDUWEyEjW+1RyuWZwLn2ZS1oNh9o0OOwR8cUQ/DXByqDb
	AXIvMwgWJMGXvG/1pEoS73sjNACkWnC5cuR9wwQ1kouV73eU/zeEcbfjEnqdDG5X
	huiMJw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r29d3mq0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 11:03:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5841ae28eso149932885a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 May 2025 04:03:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747739002; x=1748343802;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HScz0u+Llm93qijaunpm9s3ySMN/5Pt+kU5sMHKjuGE=;
        b=FFUu86w6KC/cMrspglSZh6HZhVfwEccQD2D02Vq5l0OtEVkykQjHpkoYdE5w8mh6Dj
         ngJ+XnVwtvIsl42j6t7XIO4yrEVQVWPdmVaV/AnoBi180t3y8vIKp9VUsIiwrOYThqnK
         jPtDxdY681QGAXjEbEX+x2HiB43AMkbVYBm57nP6xykJhksq0XpSHFjg3rYb/pJFPdMG
         OPNVxqgf02bP4uFkwV7TT5Kijmz8VYSEXHIiaVJC++hMPuDS7roiyyKvqbDVwB7XDB8G
         mHeQgL+Cn41BQBpiBcxFhre44HRxdbGDVW/N2oBWF69ow6YyZfVY02nU6kNslrBflmGd
         P/zQ==
X-Forwarded-Encrypted: i=1; AJvYcCXX017wuFLW4olR7DaRVxYCKeETnkiMtVVSS4tjWTLwZpV22dxRQqcUvAU7XpgeP3apJ9PBAP9hu5nqxFZV@vger.kernel.org
X-Gm-Message-State: AOJu0YxXeOahewUzzMZ+hnhbHlW8bNzADBElDwEPcZhN5i4JDWlmnvv0
	qfjxirv8/fX6MmmWvHvNGijm3hGgd0+7sfDx919G3FyRAyVT29cWZ5sGu1L9VoQHadXAMKX41gI
	Vyk2Amw1N10B0p/BjmEAT5qjQpNsl2N7N8Y6hVuNC9oL/tm/IwhKtWcu6v+1ISEavGdcC
X-Gm-Gg: ASbGncuFgHHtnzG5L/+W6srKE5MtJ62AIdnVkeWhN14G94Iutfkqg/qaQ6zt0PRgp5k
	Zw7nz0H1HSzP6BNWiXVul5GbVRbEl6cVsilgfdYED6V2F2mmfbdoXserRAcZme19CR0FJY5Fa+W
	12jXzFW6TZcjGOgTdxqE+M9mpml3IQM+t4JiKu5p6JGpiJxIW5VMnJ4wbzGfDu9C8RPC6LTiF/k
	/S7q/b0mk+aaJ9u1OEKbNN4ETa9wGlynWrklsktee7+x+lGqGhCcKjCFTJkWkxEvAF2sszVUiqA
	k2GMzONJ/BJR6VkvhltjltGwMvvbh2sCygNVxK/w/RcmKNMNsF7bCyldKeweyAvNeQ==
X-Received: by 2002:a05:620a:1b8a:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7cd4672f622mr1130274685a.5.1747739002110;
        Tue, 20 May 2025 04:03:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEL3+EcEBMCFUs5rn/uE71zSGiY5smfjbdn6K4KuMrGJ4AUyjWUYi3XwmVrvc3D2YpXLTwxvw==
X-Received: by 2002:a05:620a:1b8a:b0:7c3:cccc:8790 with SMTP id af79cd13be357-7cd4672f622mr1130271485a.5.1747739001540;
        Tue, 20 May 2025 04:03:21 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6016d193ebdsm6673791a12.57.2025.05.20.04.03.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 04:03:21 -0700 (PDT)
Message-ID: <8b3ab2b6-4180-4560-991e-41780658cb52@oss.qualcomm.com>
Date: Tue, 20 May 2025 13:03:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] phy: qcom: qmp-pcie: Update PHY settings for
 SA8775P
To: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, krishna.chundru@oss.qualcomm.com,
        quic_vbadigan@quicinc.com, quic_nayiluri@quicinc.com,
        quic_ramkri@quicinc.com, quic_nitegupt@quicinc.com,
        Mrinmay Sarkar <quic_msarkar@quicinc.com>
References: <20250514-update_phy-v2-0-d4f319221474@quicinc.com>
 <20250514-update_phy-v2-1-d4f319221474@quicinc.com>
 <8e900d20-009b-4cc7-ba1d-52582e414402@oss.qualcomm.com>
 <CAMyL0qPmMVt1Wd4fkQsf_pt8ggJhpR=u7GbXtifczK4Xp8yRJA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAMyL0qPmMVt1Wd4fkQsf_pt8ggJhpR=u7GbXtifczK4Xp8yRJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDA5MCBTYWx0ZWRfXxcrt3+Gl3/nZ
 XJP8i/87odYWlViVmA9ez7QASXcszWS24getfhrgIqFK/AqiW4dKjFxVejXhLAjUx0c8QdnGMvi
 QBJKZg2TMKpPM8uRvqsmNfOWiAltXepfuS3K4Rw8VtAh7/059UocSxXDW0bLyyoGgj4wrAu/fDx
 YtT205nR55zKKDSRqigLbSJXLo0iG7W5ZK2A341NpM7ob61Rf//QjOSe8Dqj/9cj6J8pV1mE1Om
 lHQJrVhVCHnV44Q4GHwAYYkmivrfFpc+QhBl/7gqUiMDSr1ckn6xJh9XsFrXp2lHvjplh9MpGli
 lxbRuhRkog+L8saDP4XDxhb6Ve69VTAPTyr/dY3h75ZKuJIpkQK+a1hZ/cv+kjyGOtxWSl4zbsh
 utd+0UuB6RnRc+BoWlvPkRy+9ec+bRbdkHMNANVHkGU1sSnbbvf+sKDKQMJBUmY8lVeIVYRS
X-Proofpoint-GUID: LnY85sGXokYtoAMGeKVskv-XqSGmqGBS
X-Authority-Analysis: v=2.4 cv=KLdaDEFo c=1 sm=1 tr=0 ts=682c617b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=KnjBw1EjzzqmsG5sd9YA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: LnY85sGXokYtoAMGeKVskv-XqSGmqGBS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=564 mlxscore=0
 suspectscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505200090

On 5/19/25 2:25 PM, Mrinmay Sarkar wrote:
> On Sat, May 17, 2025 at 11:46 PM Konrad Dybcio <
> konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 5/14/25 1:37 PM, Mrinmay Sarkar wrote:
>>> From: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
>>>
>>> Make changes to update the PHY settings to align with the latest
>>> PCIe PHY Hardware Programming Guide for both PCIe controllers
>>> on the SA8775P platform.
>>>
>>> Add the ln_shrd region for SA8775P, incorporating new register
>>> writes as specified in the updated Hardware Programming Guide.
>>>
>>> Update pcs table for QCS8300, since both QCS8300 and SA8775P are
>>> closely related and share same pcs settings.
>>>
>>> Signed-off-by: Mrinmay Sarkar <mrinmay.sarkar@oss.qualcomm.com>
>>> ---
>>
>> So I took a closer look and please re-validate the changes, I
>> checked one write randomly and it turned out to be inconsistent
>>
>> [...]
>>
>>
>>> -     QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_MAN_VAL, 0x08),
>>> -     QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_RX_EQU_ADAPTOR_CNTRL4, 0x0b),
>>> +     QMP_PHY_INIT_CFG(QSERDES_V5_20_RX_VGA_CAL_MAN_VAL, 0x03),
>>
>> ^ this should be 0x0a according to reference v1.19 for RC mode
>>
> As per v1.19 for SA8775 RC mode I can see the value for this is 0x03 only.

Ah right, the docs are structured in a confusing way..

Konrad

