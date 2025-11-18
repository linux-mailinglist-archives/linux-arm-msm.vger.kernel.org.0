Return-Path: <linux-arm-msm+bounces-82382-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id E3465C6B331
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 19:25:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 8F0DD28A61
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Nov 2025 18:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A21473612CB;
	Tue, 18 Nov 2025 18:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MM6wPB9J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W2WOVK9I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE96A3612E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 18:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763490321; cv=none; b=UsWW/XaL8YUaw1KAqU9Owj9OVqNH1UAnPDXftiyLP5E4MJHUpRCdmkxZZAdhNF7+SpEdsMplNibn75dwRi8TbkUU9htSZIy1AT4ilLyIuRkOAXnRJIzH3Fooc3UrLNyf1uO4/A+ZNyTvqZB2scFgA6/RSenSpswoMjKtCSstrb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763490321; c=relaxed/simple;
	bh=0RYbcD1FC3g2+gh/OJvJ1oHXpXDBxnpRP8sZE6lHwSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MmRPxKu5VacPZvmDzi7cBuhNhoDellPxByA98j2gPI8H6Qo5iN/ZlrKucu8Ryu6UvZNofIZm347iwTeKBKZKkE9N0rgy65X6eGjNFJNAFvrmVkQwarosCSbUPXeTX/dmAO3mxiDmSVvtDTi3BDzOxCPjAUtqXd5GnwDJ/cuTjY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MM6wPB9J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W2WOVK9I; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIGDqA02755669
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 18:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OtFnw+ZUhvacU8hbef65l+oiIQGF74Z2kyVRPfFI1FM=; b=MM6wPB9JEdTpLuxp
	UALmBMNdKtpGm5EJtYQT80mx+HJa2e3Y9KB5fl85c2nQamsi+6L4vvi5125GQ2wt
	90+iz/Zo5HZWlAoQ1NpFf3Ted2t4ts53vV0sHUJumdcCsasS9FCd7Ncci4GgTPGw
	Y9Mag/GMhtY8CKs/ooY5WdJwZLn7ZstAhIlUeF0KteLF1pKsdFe18hM2kuXIt5YQ
	jGESaZKolI1SjW1wtsWv7ClTsC8TetDVe8D5npJCtSwJ25cYnkOydNW6OOAxtHQw
	OpCpPkI3mjcgLjIgrdOfl6dsRjaIJ4w/qdLXZchSSKb9sFV1e5M3Gjr+YlkGPeiC
	wdtOVw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agnkj1qkk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 18:25:18 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3438744f11bso10993979a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Nov 2025 10:25:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763490318; x=1764095118; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OtFnw+ZUhvacU8hbef65l+oiIQGF74Z2kyVRPfFI1FM=;
        b=W2WOVK9IqtbP4JExBCFIW92KkvtdMrZZx1rmA/4E/roWCnY7ME4rMF3zOmkES+1Z1M
         NAjWbVJ4tfRCN+Z1AG/4+Ayn+/NlxaWsEDW4V5zEkoxe6ngfQ4TIIXpvZhoROkYCYvQL
         KBiHgIqITYwwP/z7H5qVWa18RyAUeX70hDsNZ3Ltq2B6oXi0eD+f7jD6j4W8gbQaHDu+
         FLLPzl5Y+zq/kK8PRClRGuaJD1d20r2GDrHbT2wkWjoY7L6e8YoD3AjY424oluda7ZIn
         muKfEu0Ykvzu22hcCiXysncGztuz7fJXUw96L/DXd2Qhx+gSv1Ok97cjb/AMl4P0xmrh
         6NXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763490318; x=1764095118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OtFnw+ZUhvacU8hbef65l+oiIQGF74Z2kyVRPfFI1FM=;
        b=XYmp8r+wdTu6ZIGKBWWRAnrp2BWDcDt0OesB0xjMmwzsZWMlaR/v1qSgQCOpZtwmlz
         6tDr/deSQjS0ooRn219CUQa8bYaaFR58Ld5jrrAZZ7tqauuVzk+Sgwa/qu7hz3UsTvp+
         64ui6zps7lEhMFm+7q+6wix1Ji1opcWjkUnBOL9/04omBrOUvoKVEw1rj5+P9vOy57Q7
         pCnkTAufIC3e2vFXRjjg3KWCf1eHnucUoc9SkevnXXpHsyitSsdYqUxRoYm8A3l83h7X
         kcJnnKZ1UZ8R42e9EEWex72uJoLUnQZ0sQvkZiDkDfBR1duFxGFZryAzV2iwn32dvbSk
         SBkw==
X-Gm-Message-State: AOJu0YyqETk9bGsTuqkST2akgYyFMnvkfrVEa71Q7P1HH77/Dq8pT5GW
	keBix/JvNLO84Jqtr/SZLIs2knfmjiPIXbPQo/LXpvtrw6lVPZGunr117bqEcSXsMjub7DtlWtv
	8GF4BS1I3CsHn0iM6ZqPvp9nFp/3EYum+x330dp2Jdpqc1Ve4JAwILMAbkJpkL6S7r8zed9RdUs
	pm
X-Gm-Gg: ASbGncu4o/8w+F3PmjuwRN65m7yDVpVbN0frtxW79E3n/GvYnPgLXxg0+0k4ChoFJ0G
	k0nX51oWmwWvfBBKpGb/QoTFXcLWKeY0ejxNTRFt1kabMsAjC3L31vs81AnwQeRqZLoTE1GaOED
	1HlPfdS1Zv0D6daKmbkKFkQ1t2vzpCILvzaC1JukPJf4q0hrIoA63ULMOjLRr2Kn2KGIGguHS0I
	vOG3yaIeRCqohWrJe5WvizNVv58stv13tbetafPfCQc9K28ArMOHXem5IiA2KgApxsRW37qMyVj
	zIh10vn/hGr/KnYyN/Gr92HDmdQy3toRU80eJ/DDihH5BC433spgKoBPk673SNYbYjftzH2zQ8Y
	0O9PMmbf/4wfGhR1Pl/xsBLVfAqcKe5SquDrDhm/m3DpPdXRJ3MLIPOXI5jmnmLgI
X-Received: by 2002:a17:90b:4c0d:b0:343:e2ba:e8be with SMTP id 98e67ed59e1d1-343f9eaddb1mr19030897a91.10.1763490317531;
        Tue, 18 Nov 2025 10:25:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHgkC4v9MbHD71suJ/U+iLegUV9Kt0QpttshW9z4L5Q9wXCA+ksAEvNaMfhbYTIREdqFuo+vw==
X-Received: by 2002:a17:90b:4c0d:b0:343:e2ba:e8be with SMTP id 98e67ed59e1d1-343f9eaddb1mr19030868a91.10.1763490317068;
        Tue, 18 Nov 2025 10:25:17 -0800 (PST)
Received: from [10.62.36.22] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345bbfcd094sm155361a91.1.2025.11.18.10.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 10:25:16 -0800 (PST)
Message-ID: <37d0f89f-69be-45a7-90fa-347d6a3800bf@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 10:25:15 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] media: dt-bindings: Add CAMSS device for Kaanapali
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20251113-add-support-for-camss-on-kaanapali-v6-0-1e6038785a8e@oss.qualcomm.com>
 <20251113-add-support-for-camss-on-kaanapali-v6-1-1e6038785a8e@oss.qualcomm.com>
 <bd899586-f714-4d2e-95e3-6abf124e75a4@linaro.org>
Content-Language: en-US
From: Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
In-Reply-To: <bd899586-f714-4d2e-95e3-6abf124e75a4@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: wCUQ7bEaZ58XUZWq__-3P6XLBLfRH-mv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE0NyBTYWx0ZWRfX5fwUG0+8tyj5
 ORbeWe7VF0nf/pW4gVoX237IapTqcPcVfVNAm7sqtaIMTIwoiQmTwvq1alj3K7IcGToGpZBIdZs
 UizUxMac2gq6tfuczDXbBkWdcfTXB5elcV1NFnYliEewsf44SMTE1CmG2Sz2wEr8Z0LVMf4pLZT
 imEWzlIzPcX+aiSMZXM6+EYqwc/v4trrHOvv/3URDIDnWw4tbz2i9E3tj541svL25rx/saevyGc
 uXnoHwF7SFBKWC+amgVrqj0siWB/OJvR4KzPJ5IEDRSTpHgqdEcdNK5dB2/N7eUNHe5W/XDx/CX
 tTXbLh83QEkppYcxhNnsd0c2Ww7lEey0sfRPYufP7/M1WpDIBPshRRJcNNpX+rrHy4QUoHB2me3
 X4BB73MFK6t20cLT2ZAFLFsrEFmLZw==
X-Authority-Analysis: v=2.4 cv=cs+WUl4i c=1 sm=1 tr=0 ts=691cba0e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=YIc4kcsZVYj8qvzJPVMA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: wCUQ7bEaZ58XUZWq__-3P6XLBLfRH-mv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180147


On 11/18/2025 7:00 AM, Bryan O'Donoghue wrote:
> On 14/11/2025 03:29, Hangxiang Ma wrote:
>> +                  <0x0 0x0900e000 0x0 0x1000>,
>
> Why aren't you starting @ 0x0900e000 ? seems to be omitting some of 
> the registers in the ICP block. Should start at +0xd000 not +0xe000 ?
>
>> +                  <0x0 0x0902e000 0x0 0x1000>,
>
> Same here.
Hi Bryan, HLOS does not have access to those registers. They are 
configured by the Hyp.
>
>> +                  <0x0 0x090d7000 0x0 0x20000>,
>> +                  <0x0 0x0904e000 0x0 0x1000>,
>> +                  <0x0 0x0904d000 0x0 0x1000>,
>> +                  <0x0 0x09057000 0x0 0x40000>,
>> +                  <0x0 0x09147000 0x0 0x580>,
>> +                  <0x0 0x09148000 0x0 0x580>,
>> +                  <0x0 0x09149000 0x0 0x580>,
>> +                  <0x0 0x0914a000 0x0 0x580>,
>> +                  <0x0 0x0914b000 0x0 0x580>,
>> +                  <0x0 0x093fd000 0x0 0x400>,
>> +                  <0x0 0x093fe000 0x0 0x400>,
>> +                  <0x0 0x093ff000 0x0 0x400>;
>
> The rest of these registers start at the defined block addresses in 
> the documentation.
>
> Unless there's a very good reason for that, please amend.
Sorry, is there an additional concern here or you were just pointing 
these as reference for the above?
>
> ---
> bod
>
Thanks,

Vijay.


