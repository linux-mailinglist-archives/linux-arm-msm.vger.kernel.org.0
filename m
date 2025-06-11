Return-Path: <linux-arm-msm+bounces-61000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 06406AD59B5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 17:09:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D40573A8D19
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 15:07:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7804F1AF0CE;
	Wed, 11 Jun 2025 15:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dsAxDEb+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE57E1A8401
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 15:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654381; cv=none; b=hic9JiWQTg7KAdOStoVrntspqLr8fyvK7NUmLA5ReLKtpJaZY7wzF6b7OBbAazCJiHqKfgpfWfFZgTcnNkJvYFx+lkgeucEB3UraMNkOlVXYX8NV+ERmHZKkh9DLA7GDxeBLSURa3wo4oVEYdCu7Qpu4iB+FbFuOEQ6ueBaTCLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654381; c=relaxed/simple;
	bh=uggfU/x1Y1OnYzacJ5PR1iziE7YguscIhi3wGXEOUqI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sfFVCY9DGftrzsald9G81CWG4I8tFTW3sObxSo2IzkEattVdaU90TtOlEMCyj2hMjfNDkz2eZRovUw3fRS+Z5nk6/V1BFCPuFrKkis9oHDYzBSqWFxvPQsOOqQcGtSnRAbODfP8l64el7+4FTN5hEbTKr55YD99w+jfFpduiBwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dsAxDEb+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9DEsX029254
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 15:06:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S/W6554sM4PStRUOoRj5glqk4SWBmtXAj26sF2oFq9A=; b=dsAxDEb+a0Up/7iQ
	DkYyHEvfQeibaM4ORr+xG2ilSZyA03pQpA9XG4SyDB+LSzlZsY+3ZQIZyyD4eAbO
	b8I67SbQPzLPgAXkZlZl06CrJ78YjH6f4C5nw3teaU21tmc5m/uWaJBF9h3DOz80
	rOcpTk83WtX+jDZP6W+URQgA7ahE6PZHPM4grcZdFRTjP2bQdSlcclaN7yARmOwb
	xv/TAuBZvTsJQ9Iez8o+AxsOCZwAM3vN7mpCc+iQxirrqgbFK5wjfS3JcvqdHHwA
	U0BAztx6r2/zbgh7E7Ze0Qad8Zj9eMJgX/DSxoSd7dqU8M2+Yv9Xc6cHeiXDAE2g
	YhrsVQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6dbrb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 15:06:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d0a9d20c2eso20920985a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Jun 2025 08:06:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749654377; x=1750259177;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/W6554sM4PStRUOoRj5glqk4SWBmtXAj26sF2oFq9A=;
        b=rU1us1yqlSU+XBpv5Ls9fOliptJx8C3IWH0rOX6z9pqmGaIX4r2yyUtEMXIxUl8vSz
         +nSAR4Vq1zhZ9hvpD77YYeaVQVOs1fmXXvZPKO1RJAo3LErk1wbVbrhOEyvllfic3LQy
         8W8pfcKuoEF8GkgvTyi+zJDSLMecbqRfcwQXE04xZRazCQF91pmw8+DjOz6+A/6SOZg3
         Kl9kc76MTsusg6NCgG331fgBO96Pc9JCu2wqNYRbsvJ+sy8trKBWGt+OJAX3ceJnqIZ9
         KqOQic3vo+RhK2g5R+IFmXOhSfE41K/LE/8JVGyLpG+pJPkSGohhOTWinApZmGAjwe0d
         U+wA==
X-Forwarded-Encrypted: i=1; AJvYcCWTrTsR1MnRB1IYuAGkYristj/B9nx6gAnJNfaUzkxOZXSdq9gD4cVNW4hoDiuLCVXQ/p22LgzgwRUZOIaD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7zD4jUAfjcuk9m3I76REV7AndWgQl8VtJji/a14603giRhVKj
	aOydJQyhc4qOMh/U1PadfM8IOpjpGlp4JaqvdZHeDDjP6N5ln1Bvm08yfFTjoq/lfWscJ4a5iEB
	2kPAdXPfuUNBCgr9JwRx3RMwU8lXEG/QUd+J8XPXEXWQvB38IAmpUYYwRG2g0TC+P0wDr
X-Gm-Gg: ASbGncumCbF7bjU4AT+07PIdiIiibqVy6J8E5Sz6flkErhxofy0jK3y69ahojyxWNa0
	+lxjmdhYhN2ag9pT2OIhJHDnQlImgJFpkfq/xeaPNCO6pfXnBKeCnIZwnSDMJ2zRDreZwEuLJ58
	JOIWskq0muo/tXhcZtM3EMVQEr5ubiYTdAFBtP+B67IttxCk48f+PMinBjAs3DpMbJDTQUAEVwn
	yYo1Bqe8x6k0hAT/mv3risKfhnZnLcU6ufAI2Pf3GUUYFGIyetdN8L+cDVekuj0aM0mnS84tm2a
	5UFzJsJFC6rKQEcD92yggOxPSsYBzKrpuuzyv4WcSc+QrRuWQYvSnXLa/F+wGCjsY3Qm+OVvvJY
	Iu6c=
X-Received: by 2002:a05:620a:29d2:b0:7c5:687f:d79d with SMTP id af79cd13be357-7d3a87f04afmr205896285a.8.1749654377314;
        Wed, 11 Jun 2025 08:06:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHT1MIvBRTLARWB0wt/VEh6LTMpBio201lRkK2h9aABclFE5ka3MIzIuUcHTp49tOwLuqThGA==
X-Received: by 2002:a05:620a:29d2:b0:7c5:687f:d79d with SMTP id af79cd13be357-7d3a87f04afmr205895085a.8.1749654376840;
        Wed, 11 Jun 2025 08:06:16 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade31cc25b7sm832539666b.66.2025.06.11.08.06.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 08:06:15 -0700 (PDT)
Message-ID: <946e3208-4783-464a-af58-68c4f79d327c@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 17:06:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] media: venus: enable venus on qcs615
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20250530-add-venus-for-qcs615-v8-0-c0092ac616d0@quicinc.com>
 <wmri66tkksq6i3hfyoveedq5slghnnpozjzx6gck5r3zsiwsg6@xevgh54rnlqd>
 <285cae4a-219c-4514-818f-34c8225529de@quicinc.com>
 <5854a587-aba7-4e71-87f8-249ba00cbc59@linaro.org>
 <996c9a39-5520-4b43-adfa-06ce29223ba0@quicinc.com>
 <713b87cb-0003-4ee3-a599-9cd41629bb42@kernel.org>
 <7aa36a0f-6741-40c2-93f4-036823d245fd@quicinc.com>
 <247002c0-ee68-4d0d-857a-768bf68bce75@kernel.org>
 <d5aee491-3ba2-4beb-8b8f-4ba8372e6d16@quicinc.com>
 <5b6864a9-f0ee-4bc5-aba2-c165d14b0b75@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5b6864a9-f0ee-4bc5-aba2-c165d14b0b75@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDEyNiBTYWx0ZWRfX9NRhvA8tVdIe
 9LxshnXGIyB8VBnNCxHA62VVW4m1i3uw4eNoJpJSnSsG8pZqPm+GtK1kRjCJb8VDNtKfmdldMht
 a6IuH15nnGLKj/J18kISWIii09rwqusSJ2smbLaxFStbMzXjGH6n9vhoQs/RR4BjaL3yVS+ALPh
 7tQBuuDienDNC/VXoKALaoX/i4IskEEU+9SfCcRc7Q56HI1qL+QSjFX7lNUwQgDP6m87XND0xZd
 Ng5GreqXI4Ce9Lm/0XBYiByUDkROWDZ5YEvWVtHDw+niPQmeMU7MXTOFu7NvccDq6DQuMNUbswL
 Lri17LD4pKPCqEVFLHdKwAPybyz+CSolzxDgCpi/iF00dmTXFD0+HqIuQDb2FnOwaJI8JO/ThYn
 ueVX+k9V7C+gxE6lMY6zJcsvug+ACd4jojI5whiLbd/hRGA/daADzFph5bdN9dug8cGhUAjP
X-Proofpoint-GUID: SKcfQqB-r9YKvR07iMPSjp90tUZRP-WZ
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=68499b6a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=-sEhWvhX9MohxhsycYcA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: SKcfQqB-r9YKvR07iMPSjp90tUZRP-WZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_05,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110126

On 6/7/25 11:46 AM, Krzysztof Kozlowski wrote:
> On 06/06/2025 15:32, Renjiang Han wrote:
>>
>> On 6/6/2025 8:56 PM, Krzysztof Kozlowski wrote:
>>> On 06/06/2025 14:51, Renjiang Han wrote:
>>>> On 6/6/2025 8:44 PM, Krzysztof Kozlowski wrote:
>>>>> On 06/06/2025 14:37, Renjiang Han wrote:
>>>>>> On 6/5/2025 8:34 PM, Bryan O'Donoghue wrote:
>>>>>>> On 31/05/2025 01:05, Renjiang Han wrote:
>>>>>>>>>> Note:
>>>>>>>>>> This series consist of DT patches and a venus driver patch. The patch
>>>>>>>>>> 1/3, which is venus driver patch, can be picked independently without
>>>>>>>>>> having any functional dependency. But patch 2/3 & patch 3/3, which are
>>>>>>>>>> DT patches, still depend on [1].
>>>>>>>>> I'd say 2/3 and 3/3 still depend on 1/3, otherwise we can get video
>>>>>>>>> core
>>>>>>>>> on QCS615 over(?)clocked.
>>>>>>>> Agree, so we need to make sure that the driver patch is not picked
>>>>>>>> after the DT patch.
>>>>>>> This statement is confusing.
>>>>>>>
>>>>>>> 1/3 states that there will be a fallback if there is no OPP table
>>>>>>> present.
>>>>>>>
>>>>>>> Giving the code a glance, I believe that is so, freq_table should be
>>>>>>> used if there is no OPP specified in the DT.
>>>>>>>
>>>>>>> I think we are having a hard time here understanding what you are saying.
>>>>>>>
>>>>>>> My understanding:
>>>>>>>
>>>>>>> - venus modification is standalone 1/3
>>>>>>>     Qcs615 will fallback if no OPP is present
>>>>>>>
>>>>>>> - dt modification 2/3 3/3 is therefore also independent of driver
>>>>>>>
>>>>>>> ---
>>>>>>> bod
>>>>>> yes, let me re-spin this with driver patch alone. Once that gets in,
>>>>>> will bring in the DT patches.
>>>>> Did you read my feedback? There is no "once that gets in". DTS is an
>>>>> independent hardware description and your patchset claiming there is
>>>>> dependency is just broken.
>>>>>
>>>>> I am repeating this since few emails, so shall I NAK it that you will
>>>>> address the main issue you have?
>>>>>
>>>>> Best regards,
>>>>> Krzysztof
>>>> Hi Krzysztof
>>>>
>>>> SC7180 and QCS615 use the same video core. Only difference lies in the
>>>> freq_table for the video. Freq_table is generally determined at SOC level.
>>>> The Venus driver does not currently handle freq_table compatibility well
>>>> across platforms. This patch enables the driver to use the OPP-table from
>>>> the DT, addressing the frequency compatibility issue.
>>> This does not resolve the main problem at all. If SW cannot use the
>>> fallback alone, your fallback has no meaning and is not only confusing
>>> but actually incorrect. And based on previous statements like
>>> "overclocking" it is not only incorrect, but even harmful.
>>>
>>> Best regards,
>>> Krzysztof
>> The fallback is only triggered when there is no OPP table in the DT.
> 
> No. I don't think you understand how fallback works. Fallback will be
> applied on any QCS615 DTS without front compatible.

Please read each other's messages..

Krzysztof refers to the fallback compatible mechanism, which means
the proposed QCS615 node will match against the driver containing the
sc7180 compatible.

BOD refers to the driver falling back to using the hardcoded sc7180
freq_table when the OPP table is absent (which will not be the case
for QCS615 since the node will be introduced with an OPP table on
day 0).

This patchset is okay to merge in proposed order (dt patches a cycle
after the venus patch)

Konrad

