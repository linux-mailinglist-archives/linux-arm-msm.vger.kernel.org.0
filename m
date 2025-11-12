Return-Path: <linux-arm-msm+bounces-81398-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4F4C51FD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 12:31:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6EADD1887966
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 11:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE96230C609;
	Wed, 12 Nov 2025 11:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P8kTtd9d";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VjL0XZWk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360E02FF641
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 11:26:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946787; cv=none; b=QgC3py+Ogxemxbd8jk02jsziyCKhFS3dlJc/yYZXGxRzdq/mA2HtdxedXQA0CWlrAacD0/stweCnH/WCswMmg6G+1fdLJY9VjXvoL5AG3QlQw8oHvFwKbg+3L+xWckK+iUT+hjClzPF7QG5XNOfuGBTNcIdSy6j6qoN2/NXvLHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946787; c=relaxed/simple;
	bh=mftZh7qwz9j2JQ5d9XIfRBpLELuuTQFswKjyfXKekUU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lrUuKTaFe0KZFdHAohrKjiYhVkNLMdfBvL0ildqL6aTqRWFeuRX1YWc/lItTarF0UBf/S/YHcErZW1F6K4n9cnX3ePKRJR6j3P9f2BLVjw1JveKwN05YXFVum+x6WodeZt4OQ6jk2VgmtrIKK3+I/MxsDUIJNVDwFFMj5D5FFjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P8kTtd9d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VjL0XZWk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9CZxW510056
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 11:26:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0tfV8D0lWm/tA70jlBURKawrIKg8H5x3ti8eAvQylV8=; b=P8kTtd9dEanFeLCi
	OQbeiWOKN8zuKe32E5StXmyDqYszS6QUsNNRGGlw022Do4S0VFkPMr+qF+QwsAsJ
	OrCjGdL7Ta34RjlVlP9+krnc3rvuYFfTSt4A0lXhV0Wm/SP6rE9IK4J26lZKBTsg
	tcQzgZzqNaJ/pxpvlGWEsQjw7SZdOFFv36Ew5NGJlr9STANCKvdO6dMFr3qPEZuy
	FcsusV4gLacuACgWyc4ls6Z/C6OtOK+YO4NkLheE+608mIQJ+5LsTvF8HMJ6Mmk/
	I1CCYNEIl5bgmXLoy6cPdZkaV/qbMDdEkNFJt5Vc8JSNsQTnraD4VLKAFNfccNZZ
	yWCa1Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqdggfvj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 11:26:24 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8b227a71fc6so25865285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Nov 2025 03:26:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762946784; x=1763551584; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0tfV8D0lWm/tA70jlBURKawrIKg8H5x3ti8eAvQylV8=;
        b=VjL0XZWkb6heh/JOOOsiJAvb5HDtq5be92sIVyKyZmmxHxYhFMEzXJuXOTFxPFTgIN
         waML0d7L2jbkI7h7EgySlhL9OSZ34z88PIPCvW2MvYpk7W5zLcuX31oNSur7TI8AEapR
         KPYPr/MaXxiNfxjvxVCeCJ2/uIpNjutjNDQx2Og4TVtiOJ9HDEz2peC7F6KAjAipHAZv
         mQOunkL0aWsRB1Oc+QrY94bh7qpOSYXSscTCOnvi8rFhD3vym+G3p4Blznz1YS/7xrOX
         q3ZjFEB3FsX3hChFVRj5qZRr/GK45pH8yCHrSJHZcb54d4x+Bu88OF6RSiZ+J1/F0gPs
         YE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946784; x=1763551584;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tfV8D0lWm/tA70jlBURKawrIKg8H5x3ti8eAvQylV8=;
        b=NEccM0eHv6bpdNvHiIYvgyQh5dKJwbzqGtaLV+jxsakc3I9OQNy1KEZYzlyvfJuTEc
         Oz/Ybp2zhzfQ34geWaiMlvsp4CrDq200EYlVyYTN9Z2w6tpAHHUPk2nioQg9sJstW72/
         2XGIw60I/uRhBsoROFD+0UmKEbMpqnG96WGmTJu50RFspzhjUeVF4ulvhvOqgGKliZFI
         cSQLiRidZ8TXDUc6OQ2Ow4vKEQmMHTJe456fpKEpR8Xk40W4sqzuw6klL15KVJfS+9u5
         BvhMHz/ePvSs+I7SnRiTm15RVAnGqxsVJdyRV8mzNjp8HdmrE0TohhegOUbKLv2WnDWR
         0WWw==
X-Gm-Message-State: AOJu0YziPXOleuCEaLG4aeSdSTxynamNGIw6z0CDRCczCE5NINLiXEZx
	5cSp3j0WJ2Sj4hUj6NJvI7IcitkSIzQjLxbIfbC342kIzZGRr4rkitQrZ0gTEriwjh6UZLqPe86
	qWOO+CddxSYVX32fMlcjXIALfnXfow0TJ5A9UJEGRzC0A4xhNWYwozCaMUhV1u4rzFP62
X-Gm-Gg: ASbGnctGoTAxLZLAkkpaL7fQdKaI16YR6hk5iNn3o0iXvfaSw+aJayX812CD8bOKvMj
	JfqfP7saYqRDC46QAvtys8RMkVzA2hGkqZh6NnmrSMPpJACU6gc3keh2AhHqHia6EzU+aCXCkup
	BWHNj4lNrrVEJkRbto595szse0RmmavR2/TvQIPOqNBAk/+xtk/pGoMOofOCbEy5u3NQnQ9pIF6
	3xO5KiT4QEdCAG36FhTqjq6TJg/QAW/EZ8HZaXJBmve3KY2R+NWEr72jABsKiLNXKVDfH+KDNx1
	POvh24IUcxYFbeXJ6m/Aj6QP1iFJ0r1JTO1q3teQmaGSB7hppqYxTy3m1xsp/GqhXrcW4xO8B3T
	hXnPF3tZf+4mVykKlbFOAQsH0OeV8a6P9rT0WSKNge6V1Jf3UimTQPn/y
X-Received: by 2002:a05:622a:1209:b0:4ec:ed46:ab6d with SMTP id d75a77b69052e-4eddbdad3damr24246971cf.9.1762946783717;
        Wed, 12 Nov 2025 03:26:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/QcRp8U8DMZP/7J7w6/mt8ZpGCzHDr59+4/KQ+rPDXlRdzlSZSWUMxtW/o1KzSZ8uetQB5Q==
X-Received: by 2002:a05:622a:1209:b0:4ec:ed46:ab6d with SMTP id d75a77b69052e-4eddbdad3damr24246791cf.9.1762946783268;
        Wed, 12 Nov 2025 03:26:23 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b72bf9bc214sm1630778866b.52.2025.11.12.03.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Nov 2025 03:26:22 -0800 (PST)
Message-ID: <9e8b47d8-9a20-40da-a6eb-cdd167c108dd@oss.qualcomm.com>
Date: Wed, 12 Nov 2025 12:26:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] soc: qcom: rpmh: Add support to read back resource
 settings
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20251022-add-rpmh-read-support-v2-0-5c7a8e4df601@oss.qualcomm.com>
 <20251022-add-rpmh-read-support-v2-2-5c7a8e4df601@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251022-add-rpmh-read-support-v2-2-5c7a8e4df601@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dtrWylg4 c=1 sm=1 tr=0 ts=69146ee1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=l5wVe-rlrMsD3pqKN94A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: ekhgXa99LWqQA5o2ITbg-9JVl1CPVFWx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA5MiBTYWx0ZWRfXz2iYIWDPTUcl
 qFpY4EX9JEaFMmGi0NdZtonFdpy9GZeZhR4uk27bd5eqQxNFL0zxGRh0H2+cZV71d5rxVnNGQV9
 lqsuySwA08RC0AQ+DvC9xV92nPdZU7/XsmhWTA+4Ies6/ISSn+aNm6sAuJONrDKG0aRKT7p+2i0
 XK2CgLMBAAoc6D48VUFNNsGv2kBRFe1s95OMdXVieNOyJh+0qp0PFGvjtPBIr4MlJf5XvttBcSG
 UaLmF+P8zKWRqwqf3d/C8kQLQdG45GEsCDjnKpIRp9gvij47X9RVnkeNUc5TgiKJ5yqsyrptF4B
 +Mh6jOrvPDbi6YzY/XUhg2VEADuI9OqOuEb91D+lgfAYMpVO96FxrpZuwH8I2COVyF2VBESO8xK
 IdzJZN1UXL1fFz0mrU1ZVaisx5fi0Q==
X-Proofpoint-ORIG-GUID: ekhgXa99LWqQA5o2ITbg-9JVl1CPVFWx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511120092

On 10/21/25 11:08 PM, Kamal Wadhwa wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> All rpmh_*() APIs so far have supported placing votes for various
> resource settings but the H/W also have option to read resource
> settings.
> 
> This change adds a new rpmh_read() API to allow clients
> to read back resource setting from H/W. This will be useful for
> clients like regulators, which currently don't have a way to know
> the settings applied during bootloader stage.
> 
> Link: https://lore.kernel.org/r/20250623-add-rpmh-read-support-v1-1-ae583d260195@oss.qualcomm.com
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---

[...]

> +int rpmh_read(const struct device *dev, struct tcs_cmd *cmd)
> +{
> +	DECLARE_COMPLETION_ONSTACK(compl);
> +	DEFINE_RPMH_MSG_ONSTACK(dev, RPMH_ACTIVE_ONLY_STATE, &compl, rpm_msg);
> +	int ret;
> +
> +	ret = __fill_rpmh_msg(&rpm_msg, RPMH_ACTIVE_ONLY_STATE, cmd, 1, true);
> +	if (ret)
> +		return ret;
> +
> +	ret = __rpmh_write(dev, RPMH_ACTIVE_ONLY_STATE, &rpm_msg);

Is there a reason for making this ACTIVE_ONLY?

Konrad

