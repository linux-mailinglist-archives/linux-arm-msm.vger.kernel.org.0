Return-Path: <linux-arm-msm+bounces-79265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B02F4C1644A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 18:45:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3EE1E18912F6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 17:46:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FFDC34BA49;
	Tue, 28 Oct 2025 17:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gZB6EN7B";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U1bBAylN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C21F8345CB1
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 17:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761673542; cv=none; b=BHPR8lTmQAc1Uw/xeeqwZeJmgb1S9fZkuvVfiRlXYcuC/UjdjqIisk/eK6n8/m3O845dv4QebskeRO0y54tLKbEzIXDB2q5iY0zP7953qs0wURoPAepUB6+YmmChLpm2Sb/rVUkvMcojpk5bCsn2nhvdvhUTPZlxX/irwfdxNbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761673542; c=relaxed/simple;
	bh=dPTAqo94yX4yLEWIUeLeFRZwJxE6rHIbjG+u46l/2+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RXTyewKAeGKykB/0pfqx1W3LmIgVAF30u2GilwkcyMgr5yG2wdo5de2xPg3EbdyJnMvRY0D89Tjw8zyttCSDiyn56sWSwkoK8bPoRD789Y7dsLHEFF1xcqTghju7YDBX4ZegtJZyfjq0C7ci4vTEpeGO7yubC7n5+fM3h8wM1Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gZB6EN7B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U1bBAylN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SEnZaV1965606
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 17:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xkA/zkpVLFM+Q+17lYEFpBMLDdR9dMCKrvOWUVCL/dU=; b=gZB6EN7B5M+vygTh
	u3bk+LV1sypM4bd2SOPuDqPiydmibAcs2F+LlSxvp0vmOwsbhA/PQWq5OIwYDoNB
	GMc1JfN8SOsCXZn/0D9U5hLvFC6HdityRZUadxCEokauKrpQNj2nnFYeDGld77Vb
	69/ftCgq8Jk42NHo8yCRSQsRVNtYJoFzKxa4vd7/6R1xYv6Z6ORSnAq73xoD4hMn
	Pk4BQXbEAtKTbA34PVB94/dwyl5i35W5sFjhS3cw9mjhoaq2zjiWh67ogEccTTCt
	/hyOm0uG1Gd6JohjTEyovkCOkKx94iON+1Fqta4YJewYCn+VPR8d2XPZRNTHkdnU
	nTDkUg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2w51s4sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 17:45:39 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33baf262850so5771585a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Oct 2025 10:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761673539; x=1762278339; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xkA/zkpVLFM+Q+17lYEFpBMLDdR9dMCKrvOWUVCL/dU=;
        b=U1bBAylNZMERK6gWSnx5Q9nZi4JuGGrWbioKPaa30/mhXenA1fKpUCg/MXakATiLUq
         7hAa/GRZNcG396QAuoMDuvimM8+kuGgrEo/EO2NTXJwjp+m8PPccqSpaugEJR7aigNeF
         iZAtHGagL0gIGcjzAUZ6N6jRf0u8ZxoYJKAD3gI4Ahew4TC67XrSnRI1PsL7mRktcSg8
         L/epmQ3WBvuT7cg9B82259L6DRRa2hfmMqt6FIiP2iXR784v0+oW3VaqtMAGAk3sVEv/
         uL+wIRZS8nYagjwoWjv6uADKiVHoRxBFIAa1iUc5+EeP+w8Wuwv2CSK3QWS9Ec3kZKvA
         u4aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761673539; x=1762278339;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xkA/zkpVLFM+Q+17lYEFpBMLDdR9dMCKrvOWUVCL/dU=;
        b=hm7f9MMUr08I46xRqrBIPVJiuSZXuUqBsliI332VFYouMF2Nrl5YF3g4lvmrqRpR2n
         hxfvAjYa0aq0nHOJ1CSqnH69EWbMvws6WmA4NoGE+1uQYJ8KabNF8MXSLCnNpOLlqz4b
         iB8WcvOEo9iKbck9VJ4aJZHDq8DPGGRyTkPhJKlxfpJTZGPANKJ+Q3rfvi2xxMZQ8mAp
         HfsN7u7G6vjIjCl5U/xq9mbTNTkrn3gp+radQ9vYChhaeS7y8IHQbCxUpLImf797kjtq
         q7fIS0Z1y+rlyohD3UtmMN6cYfl6ZPlQUCVIETy0zI28mwOBOawjiHsiddRaYt689qdt
         QXkQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGiZQCfofVBtDNW05G0Xs1gmQjLVbsfnJ1Dh/zTMnZeREEWuun3Jo1ZIKE21Pg5Y04wjPssJHhBKk6MZy1@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5XsCPQbfNWYSN8Tap7Razt3g8o4GQ80ouOjpjE3iqHE8zSre/
	3SPylNC6HEPc/H68v2NLqZPVM2S4F8KOHT4DeKURVTdh/VeWv6Zr0NmpGehw1ZkRddAu8I6CTNa
	MAmdue3rghlNhoqznly3AypyzF8qxFn1ZqHsGJMYLfEMviy3kGSUdGtHXMJVpKITz1+Ju
X-Gm-Gg: ASbGncuDqzBeG3BKsOoRsUzNh9YHFOC7/wGUi+q9WLsGeuyGxt+WoEQj+nc5/iTVbT1
	6eeYa7G7smsBpxgpex9zvfUCWuPJqCaCM96wXRjfZHWXtxpbemZXdVowryLdRhOASHiGyXwDOqA
	RASrkyforInaoe8HO7lEbF50QY6iU9o3Z04vPg71K4L7UzBhDRXzvlxfVYm48v8wclptrwJNEmZ
	b9Sqrxbr2i0wDp3PMIKxMYt7qjInALV32Jo3qbgo9UzOs7r90ALg9fUUor1umLxydBw5xkLFvp6
	4wahR6I5nJjbOYDCtV15qL3M5BKZR8smKRywBH8fP4xlLkIr7Vcm3m9bY4+vLkkQm0DvNi0SuCE
	7/X1fxrm+UE/eJ1XUDG9NdLM1cTi+8sJee07q+/WWRQBpjTRegq9PKQ==
X-Received: by 2002:a17:90b:4f48:b0:32e:d599:1f66 with SMTP id 98e67ed59e1d1-34027aa6fcdmr4760707a91.30.1761673538968;
        Tue, 28 Oct 2025 10:45:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuQ4oB8lAaFLm026v9WNoqkcgU7WEfxHuzAXo3vj1uF6CO0bDjhoKRGXcHBKJ0X96hMLQfHA==
X-Received: by 2002:a17:90b:4f48:b0:32e:d599:1f66 with SMTP id 98e67ed59e1d1-34027aa6fcdmr4760647a91.30.1761673538288;
        Tue, 28 Oct 2025 10:45:38 -0700 (PDT)
Received: from [10.62.37.19] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed80aa48sm12829058a91.13.2025.10.28.10.45.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Oct 2025 10:45:37 -0700 (PDT)
Message-ID: <f0c05321-776c-40af-b379-b9336b618340@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 10:45:35 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] dt-bindings: media: camss: Add
 qcom,kaanapali-camss binding
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Cc: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251023-add-support-for-camss-on-kaanapali-v3-0-02abc9a107bf@oss.qualcomm.com>
 <20251023-add-support-for-camss-on-kaanapali-v3-2-02abc9a107bf@oss.qualcomm.com>
 <20251028-wonderful-olive-muskox-77f98d@kuoka>
 <ac126c63-f40c-4159-87c9-1b3d7a8dec63@oss.qualcomm.com>
 <7efc63ed-9c84-43c0-b524-f7e9e60b2846@kernel.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <7efc63ed-9c84-43c0-b524-f7e9e60b2846@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1Yi1HG6sP4w5vV9QfiYcimmQTIr5GBXC
X-Authority-Analysis: v=2.4 cv=YMiSCBGx c=1 sm=1 tr=0 ts=69010143 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=7CHmgrWEnh46U9yic0UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 1Yi1HG6sP4w5vV9QfiYcimmQTIr5GBXC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE1MCBTYWx0ZWRfX641T1hWGOF1M
 prCG2Kez2bROHTqnqe74ZNLcf2nH0AjJy+c2iihaeqR50pxDAj19gDIAg8wbTy17ah2IXnOfWbR
 oj4eZH4UXLrItjWaUJxF3GQoS1x0x4yp/hPR06rfr8WwqvQK24JDRSGgv/kj3XMwXeV/VuD+zi7
 Cm2Khf3UebcYb4Z97M35pN7C1WBDhkWCNdr9yblLj6p3veS0HCQE114yWF0luAX1JcwXelCEU4H
 +wsoY7rQ8va8j31Bp7tq1Vsxouk4l5/0c4XJntcroEt1jGY55zCzrfzCMyAWQSuvsu3Rhu2EwRb
 EauZbSN8+BGjlaNgDR76faREUW+BTqhnl2ogo1EeP/auip1H7AdZQjP8JZLupT1/SkSyBHfFdKQ
 x9VWh8uYKfPiFkkR0skIFqXJUlq4lQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_06,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510020000 definitions=main-2510280150


On 10/28/2025 9:56 AM, Krzysztof Kozlowski wrote:
> On 28/10/2025 16:22, Vijay Kumar Tumati wrote:
>>>> +  interconnects:
>>>> +    maxItems: 2
>>>> +
>>>> +  interconnect-names:
>>>> +    items:
>>>> +      - const: ahb
>>>> +      - const: hf_mnoc
>>> Why previously this was called hf_0 but now hf?
>> Hi Krzysztof, the interconnect driver exposes only one node 'camnoc_hf'
> Drivers don't matter. Interconnect driver does not matter here. You
> describe this hardware, not interconnect driver.
>
> Keep it consistent with previous devices, whichever these are.
There has been a mixed usage in the previous devices but this (hf) is 
consistent with the recently added ones, like x1e80100 and 2290.
>
>> to the camera driver, with it internally managing the voting on hf_0 and
>> hf_1 clients. The traffic from the Real Time blocks in camera go through
>> both HF_0 and HF_1, with the former being the primary. This change
>> correctly represents that the BW voting is for the whole of the HF
>> client. Please let me know if you have any further questions and we
>> would be happy to answer. Thank you.
>>>> +
>>>> +  iommus:
>>>> +    maxItems: 1
>>>> +
>>>> +  power-domains:
>>>> +    items:
>>>> +      - description:
>>>> +          TFE0 GDSC - Thin Front End, Global Distributed Switch Controller.
>>>> +      - description:
>>>> +          TFE1 GDSC - Thin Front End, Global Distributed Switch Controller.
>>>> +      - description:
>>>> +          TFE2 GDSC - Thin Front End, Global Distributed Switch Controller.
>>>> +      - description:
>>>> +          Titan GDSC - Titan ISP Block Global Distributed Switch Controller.
>>>> +
>>>> +  power-domain-names:
>>>> +    items:
>>>> +      - const: tfe0
>>>> +      - const: tfe1
>>>> +      - const: tfe2
>>> Why not using the same names as before? It really does not matter that
>>> it is thin or image, all of them are the same because only the
>>> difference against top matters.
>> Right, this is done to maintain the consistency with the clock driver on
> Sorry, this makes no sense. This device has nothing to do with clock
> driver. Don't ever use clock drivers as arguments for doing something in
> completely different place.
>
> Not mentioning that drivers don't matter much for the bindings, so I
> really do not get what you try to explain here.

Understood. I meant to say that it is consistent with the naming for the 
TFE device that is available on Kaanapali. If our intention is to keep 
the names in the bindings same as previous generations despite the 
changing HW architectures, we could change these to IFEs, to be 
consistent with previous  generations. Please advise. Appreciate your 
inputs here.

>
> Best regards,
> Krzysztof

