Return-Path: <linux-arm-msm+bounces-76315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C8D3BBC3B80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 09:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 897994E03BE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 07:49:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C032264A8;
	Wed,  8 Oct 2025 07:49:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W2n2fsyj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8FB4128819
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 07:49:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759909780; cv=none; b=Qh3VAcblgHx8kVD1MYkAW0PMeg9WKblxTgFu1STnSZpTXWzaBY9/40CyHI1ZBmvbjBnkmoqrGbdOHaeTVyTfQu4Fh4nyQ4cJT5fb/Tm//Ha/bEKGVsN2XvNeUutcrv/G3W2vkT1VViG2K/985alJnm8eRp2pW6nzSIl2OKvZZSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759909780; c=relaxed/simple;
	bh=lQiMV7KwLiMUlT18FyckRf5Q3tmr93y9dRJUm0ph4vE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lfA2L/+3mQw8fKn75uwAmlIVelyv0vOtNxJ7HZmbqalpIcStNSuR1EGJUQIihsESQEj85wWUpxUnigC9LXnDxZwJ5zEek/9OYeHKIiUTCfmjkOJ4k87bNXcZT+7TV/COO/C95+yYk2s6vLDxlmPnSfrhJp21tfAJp9Di/TjS5Xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W2n2fsyj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5987aTUF010385
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 07:49:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f6FGKMqGT/it1BXXMf4DBINopGEsg63OAjTDH201qHg=; b=W2n2fsyjCenGht8j
	lqlxGr8dFa8Y01EWBRjea6EnfbpvECALOYs5Sc2CMrqJcry1m2xF9HR4QHA3X/vO
	BH4qE1LnsCzB9SfMgRNsVwRp6Egw3gP1Mqh/PH/GYgkDH+HxGyjvMtzpdGxwU/Na
	XOTgaKiwi6vSc1fIjhFvHAvqNKTfLzyf2n9EFx2m8tRPZ+hzC8HkoM1MFPtTyVgX
	CPeXOo3YI9MBNC4y1N3xe1bwKDDjQ6nVqL09zup6VCICEyWahxgoAin/ojBv8GNh
	yqVqk0I/p4tDzlzBxf573kEkA1CvoUdhe8Q0THNT4lXl14ziHqKSb5k4cU6Q/vij
	Uweqmg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49junu9q6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 07:49:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4d8c35f814eso16166641cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 00:49:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759909777; x=1760514577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f6FGKMqGT/it1BXXMf4DBINopGEsg63OAjTDH201qHg=;
        b=LO7NPyhWWQPb46YAOvboivs3tZ5EGODIxBIk4LTabw9+SRlu6YMOTLkFzsXWVTpul0
         /+/yQzyUSNgjgV0CQE/U0mBZzUqoSTGZJxMq90VAFO2n0MLA5Bpe/QDF1uL4+Gdrm1zV
         Sc9OkQ7JZbYhDl+C/r13GFzJAuZRhbK6toSQhFvrkt2dc7liK3nx04kELldlPpna13AU
         +8HkMECQKPS+dTh1EcJ7JVPjCUiZE1WKGJOhZj2pFMfB9VscPd1Qs72aC9WjirERMALW
         zw6IF1HBlp521rn9cCz7FoYzg8dvP5Gi+gfQWviNrPiUiLqZZf/4IOUWYWOBQkNjPIJM
         iWpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUy6BfU0lfjKSF7rLy9KZLUccD9J6s2K3gMyeETU8e6eLlkp7HAeV2wvQB/aIcJOnDN6uclM9Zf6DkO8Z5@vger.kernel.org
X-Gm-Message-State: AOJu0YxMf1HJaPHPyNuG+QIGG6ZMR1F5Wez0vjeAnuqcbruWmXYDVeaV
	RyonkhkGXBhGfmiKZrc4CkEyU/ni1qmTu4Jzz27S6uJYP67Bx3rlfxORPHgZc+zoEVolj2/DrzC
	86xEhNQezsQRGdAZCyutPM3C++cOMXFepPHeIRHDP7hSSuenjnH8WhfTDMbh+SLCtH7kb
X-Gm-Gg: ASbGncu/PZhZQF2697SOZJsGUVQgaAcGVULk49IhalskM3scShhQOKvpv8jxPGSHG9S
	qLadEo/P1unTni1HggR14OoUX5VHIhg0AEdNaSnuDPit9y8Cg2MZOVrOUK/nlqopDgXSbcyT7ny
	JKB7g4M0jWGWX3LhvrEOXP/BfzpRwntC9CTDGCJNY0kwzdxDJOqDzN/CERhHzeVcW2qvEPPhc6A
	ITwsP7lKIyPDyfkg8zsqBRlks508jh15SX0gLuX3/rDR4+wLCzE3Z/SpFAs1ko+zVruNvIl4fb+
	ZYRnOLsGe205QQ81BYf3PqqrCiyqnej90blE6U6UJZXrUH8UX3PKPVCAcXqL9QkqBcD9GQ1pQ9t
	6BHAFkidnn9Ii8RmWG3q1fvFVOeI=
X-Received: by 2002:ac8:738a:0:b0:4d1:7b86:3618 with SMTP id d75a77b69052e-4e6eaf20fccmr18572881cf.3.1759909776611;
        Wed, 08 Oct 2025 00:49:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGMQVUQpo51JuaeXpfR2ayI65xP1qWadO5lRPd+cQm1e8LxV0RZwtOpSEe047HzmkSgyMLPsQ==
X-Received: by 2002:ac8:738a:0:b0:4d1:7b86:3618 with SMTP id d75a77b69052e-4e6eaf20fccmr18572771cf.3.1759909776153;
        Wed, 08 Oct 2025 00:49:36 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-639d4a67888sm1577799a12.1.2025.10.08.00.49.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 00:49:35 -0700 (PDT)
Message-ID: <c3339f06-aaca-490b-997c-8b6b145c93c8@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 09:49:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add xbl_config image entry for AIC200
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ftBqt6YklgW8cRceKO0uUucEy2kNzvwN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyMyBTYWx0ZWRfX+1kGNyh+F+hh
 AqzSsJo2vAbQMrdqNXxNSuxqudQLTY+sDBZT8L5f3KPVR7njje4ho3sBMv6WMmNCU1+BkupzcNo
 54Xm7zIBi5TgP+UZ+qIc5lxoTDTAaBDaKNrNg2U1QQMDCfkh/J/8Q/Q9PboWKrkLtQqglURnz0w
 utnXrJm221FEeKrb9C+d5HKCIWbIktjI/42upcQQdjIxpAQxNY+FAVFkoJ4BBzFV2feGuWcpqt5
 eUOzGqtEm/FFvFxAtpvf+owDhmMDyqAzLqXxeQXUnN/FEjKS0clyMbO4y0iQBamJSi/AUl94qm5
 Hdq5Hg4WpIdKyDTwxtN7C2zrS1WDZvyiHLym1jMoUTR5gOUZr0UVBucikIBIbB9gfzTEzAi+ZuM
 1n2J0025z0Ql2VdZMF2/sMZUhmqGmg==
X-Authority-Analysis: v=2.4 cv=CbIFJbrl c=1 sm=1 tr=0 ts=68e61791 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=3QUyYiSUeFS93uMjaC0A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: ftBqt6YklgW8cRceKO0uUucEy2kNzvwN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_01,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040023

On 10/8/25 12:15 AM, Youssef Samir wrote:
> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> 
> Update the Sahara image table for the AIC200 to add an entry for xbl_config image at id 38.
> 
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> ---
>  drivers/accel/qaic/sahara.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/accel/qaic/sahara.c b/drivers/accel/qaic/sahara.c
> index 3ebcc1f7ff58..04e8acb94c04 100644
> --- a/drivers/accel/qaic/sahara.c
> +++ b/drivers/accel/qaic/sahara.c
> @@ -194,6 +194,7 @@ static const char * const aic200_image_table[] = {
>  	[23] = "qcom/aic200/aop.mbn",
>  	[32] = "qcom/aic200/tz.mbn",
>  	[33] = "qcom/aic200/hypvm.mbn",
> +	[38] = "qcom/aic200/xbl_config.elf",

This is the third oneliner extending this array you sent within 24h,
please get the list of required files and update this list once and
for good

Konrad


