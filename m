Return-Path: <linux-arm-msm+bounces-85470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 163F5CC72B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:53:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4EC431597CF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 10:45:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E39B38C645;
	Wed, 17 Dec 2025 10:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C5gf8bmM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JF87Y5dd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E34E5366DAB
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765967210; cv=none; b=dnoXCefKJYsA3xPt9x3OcphTK10jXxEH9ykFz8Q9z+qeLkU/XTAXAGvo8pqk/59+R9q26jT7fT65gYP4L8e2ggimsvA39qIs9CnOuXEvqJkb8Ys1lCCE5whSud9lSegpWB9dnxOcXaMUBMXAocW3Ph8SNMBIUC3sexcdoeRG64g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765967210; c=relaxed/simple;
	bh=BbBdrPOTb3U8KSFm+OnYyyRLIiM6GcBcsEQ/6awetQc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VlqQrFcMuCXSWqzA/1G0gfQrkuQ56WHVwrwMoBmHsFx3gjITm6GfiazCp/8IwGnu0gU/khKsCKg+/F/qT3QEeLB6myV0NpQ4aCD7kUdlQb0ovL+rW6HP4bbGx3Bx/jHtY/BHBEqd8YHOemgAzW03J9d5OerNtPk8DzX0AYXu8CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C5gf8bmM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JF87Y5dd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH9pWVH009161
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:26:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZlmuHSKtzBBKyVJ4bvvOXP5ljFfHfrFz4FRDlTvdXi8=; b=C5gf8bmM5W7DUXY4
	BvYrWnXbTZG9mJbTPUF01ZjZ6In8dP2chJVKom6DoOpDLi9053yUM3d+2u8x9moo
	blY31kKSHFKWz6KtiYLWSxENdjSBetELKPM+0rEwkVMDN6IILPdchSXNSLgaod6P
	GG86iqXZrwAHNTQjYaj97RVOgpP018B7KDbmGT2gF20HdCK6oPguqPtHhHMienEK
	DiSi/Lolo1La6KJLvJio1rPmN6N33EGpEAwk3moevdZ+Z2HKppLP73VozDJ4cf8x
	wOITZSdFqIiybcxbTLcWDqa9A02h74+TCEGv15sKlBbG5zUcE7klZSD9DD1lo+RK
	x5chrw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3t8e03ru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:26:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-88a39073c8bso9799146d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 02:26:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765967202; x=1766572002; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZlmuHSKtzBBKyVJ4bvvOXP5ljFfHfrFz4FRDlTvdXi8=;
        b=JF87Y5ddI+UMU+tKxXuQ/pZaywrhaK0lHV+qVZ8ZN1dXSXbZWgqgAhcmTmkrtbBEhY
         cCkqkQi35QRwRimY6c8cexJQQQOOwaFAnvmbS4wK6ulqmml2iwKAAp991Rez5bnREqKr
         HwsiKKhuVD9nV/7veBKvS1NHs24Wqw63JRIGvBkg7C/BIaN5QrdwWl/+g1adVxDbFjqn
         CyUwU+11g1fLEBEt8no7wjCi94S4FOejG4vcWMkqmtVB+cu16r+ZNL7wiCahv5N76ocT
         CjtDo6q6wFg5VX8N28n56dht6XtwSepYPmMyaG33+Kx6I3v1GB/WTPV2TEM2Reeu8l1O
         7znw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765967202; x=1766572002;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZlmuHSKtzBBKyVJ4bvvOXP5ljFfHfrFz4FRDlTvdXi8=;
        b=f31dxmxau7Av3xLrVEocZwfn55W7Dc4A2zKxpjvNDm/qgdMqzJ4M64+CxZKYgim6Q8
         s0we3MlJrQN44+l77Du/OmCTDf1ujBvKGpLBR+ZwQ9mo+1xFJ2a7uZIzmA48eGxYaA6I
         +rxnYC+vjErbzF6dG8hCFr1p+CdCXuR0F0YVTldPkO8ZKX5LnDSpf37G1KWb87Vt8OS5
         t/fvqaPZDJnmzQx9ESnm7iyQFuNGEXOboXpDMn17bA9xZKxmC2Ukv6nA0VCypAWMpei+
         W66aR8k/6hKl4e8rBZ7IcT7ut3lsLOFriDxxLiHzpqJR+epB3lPWIgy0O0iGEWtatMdG
         qfEA==
X-Gm-Message-State: AOJu0YwOWOZQ7dYXkhhc+nquZu7loqzSsKpqtjK1QnjK8uJEOkBob9rs
	DynJlqRW8HTTOfs4VdG2eFIyEp7m5KJK62WpLpa1J0FXopKcb1tUk2wrp9pDVt99H8ciL0Opnib
	Z/YO3n2BuOJdGfqO6uA9aOAHP5E7RINs8pyyR7H8+QU911T9XhGNok6YeDd7kUsBoZxEx
X-Gm-Gg: AY/fxX6rihPYzVXSfYng6VEXwtbEPO7KVzt/tu9JXs7/FepxEFsRzZhcZXTbmZ06L4/
	zuq5k8gN5OjXcrRyzPzcQc8iN1aLClJFh3heEoKKxF1m4g1OH/sUkWs0nHIT4ThDRbKxiIQmE9K
	hDOGqVtjoLhizagMB1OTzrilnyIkZEvxUX/LOg/J16OIxWRwtCJGPsm7jSghePZP7zDN+aj9WgE
	ryHtYIuJT0qLoHf5QBDJF5y3CykAnlw9M+HOIgMf1jwfplrgCXuPJe46/P0JpaDzRHVChe0C6vk
	yCIPlpC+eJ8Wg4+HfawI4r0VWl4Bim097cRoEwI0L6yKvxrWi20p07HEULSBV6hiq5Rz5ENdK8c
	APDbZ5SqyQiwkJrwURdeDUzVy50vPRATpGt7g8LBXX9lUFKjDbwzrypa0uCT/LCuwVw==
X-Received: by 2002:a05:620a:46a4:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8bb397d65aemr1826972085a.2.1765967201725;
        Wed, 17 Dec 2025 02:26:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEnNS9rlS0sf2cqkeL19rlfxmTX2ew5LuoOp3KqhGW4mJ+EUK0XOP5H7sc+68WgeBU5kegXDQ==
X-Received: by 2002:a05:620a:46a4:b0:8b2:6eba:c45d with SMTP id af79cd13be357-8bb397d65aemr1826970185a.2.1765967201297;
        Wed, 17 Dec 2025 02:26:41 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f4f5a22sm2085241a12.9.2025.12.17.02.26.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 02:26:40 -0800 (PST)
Message-ID: <167af8ac-64c9-4add-834b-ac500dc3aef1@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 11:26:38 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] soc: qcom: pmic_glink: Add charger PDR service
 path and service name to client data
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251217055655.638594-1-anjelique.melendez@oss.qualcomm.com>
 <20251217055655.638594-3-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251217055655.638594-3-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4MyBTYWx0ZWRfX0rLxKMSdyM+I
 1YUVS4SBmfd7YoJquGKtdFhunONc75wltwSQpZbxUduiFjU7TUa/RLR90UfSzUAmnTGDrzwwmgm
 He59b3rV8o0/dU62U3+qsm7zfVXuC6FWm77U5EcKPjkI4PzKFSpUzDVolk4BmSB7PH3PPG4iwGQ
 14OmnIPcZ1gcAJ1Z1HpprnQHKYiqtyJlW0Q56CreF24zSEuVXT8UAWAan9Yom26yEh3iauc5ld1
 n3RV8kTgQZOUxLqqlD3bE6gq4L2D8v2lc5A3irde2Xs8hUY3H4oJtlTZdXZZCTBG6DGRjfISfhF
 1+xJL1uvnNuD3nKgJnlhbcq8/kO9zHDXp5pz8BgBkqSjZFPoHgmT8rnEl5JqcNgZzyrGN7jmK45
 n6S/Q2zgMwCkh91yY4JRI1yVRqXVVQ==
X-Proofpoint-GUID: HSpvQUKKsyptyksPBZUd_HHl0iFlGimM
X-Proofpoint-ORIG-GUID: HSpvQUKKsyptyksPBZUd_HHl0iFlGimM
X-Authority-Analysis: v=2.4 cv=EsHfbCcA c=1 sm=1 tr=0 ts=69428562 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ES-LWyGZB6HvuNGBYh8A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170083

On 12/17/25 6:56 AM, Anjelique Melendez wrote:
> Currently, the charger PD service path and service name are hard coded
> however these paths are not guaranteed to be the same between PMICs. For
> example, on Kaanapali and Glymur, Charger FW runs on SOCCP(another subsystem)
> which does not have any specific charger PDs defined.
> 
> Define charger PDR service path and service name as client data so that
> each PMIC generation can properly define these paths.
> 
> While at it, add the qcom,kaanapali-pmic-glink compatible string.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

