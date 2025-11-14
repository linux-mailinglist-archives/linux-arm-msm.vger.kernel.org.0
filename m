Return-Path: <linux-arm-msm+bounces-81923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B13F6C5F7DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 23:17:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 088484E1D3E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Nov 2025 22:17:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33952313522;
	Fri, 14 Nov 2025 22:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="miU/a84C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aHZuM8mQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751342FFDE2
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 22:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763158619; cv=none; b=JkUH3nMCuXs095JJTRtrmgP8BUo1OAJRix+hxCJh7Oo0eJ1bTgoR76xa/0tUUUJoMszsF9YjpTa5nOmtQTJhQBVSJHYAJ6H5laBgTd+i+3qcikHBNZkt38jX9NHnBMQC4mE/MxtPpDEK+Ex2XXjdIS/FHZ0Eo1q/rMHibQ+oD7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763158619; c=relaxed/simple;
	bh=Euo3aYyIiS2EFzYRpUBRUMp9JkSwubI8mtwHHK57FSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tytVTCm6nxQa8Kx1XAIAvs6Ua44msXBx04pC7U643lLbFoikpdfM7vpKfd+GP/2m1H/RQ29OfwSG/Blk6/m7pM7SQ+ROOsZ9EckPDbcWyzMP7MbX35pj73ag3lsI8aHMFZz20RJBWBqA/gOuQ+gfMfHhYd+nwUkjBRa0C1EwLeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=miU/a84C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aHZuM8mQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AEJVM4h070914
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 22:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ztuYyaE22UQpg1VtA7huflvbOJvFMCvZ8dxISGtSh34=; b=miU/a84C32DqdD0z
	21baSOB3AveoQhq+vbZ6Az6dl9OJb+X8KQneUyh2ZOvFuIuiHUmeltvI+DUV8/ke
	rIKgEctqhccb/sV/CbW1zYMTYBnZaQsD7rC5OJ5hIqdZXrBnJanVoveR8pSN+D1e
	N/okcizq4i4lmYM+AZ9DgS9fOKNp5XeK14jI7XhR8QbHRIA0KRyKkQ+R31ueaSF8
	FDZlHuN0qJzoxNNueytjycl6T3gK5qjLUTtZp9GaILFNs2MYNxP2ng48dOaLAQAt
	bbmSK4jQhHTmcN96AnxBgyvmyryI/s/NOSY9K12oZ0gg2VV0EMVYhnzlwvo9nc1B
	0hZuPQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aeang8ebr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 22:16:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ede0bd2154so7174781cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 14 Nov 2025 14:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763158614; x=1763763414; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ztuYyaE22UQpg1VtA7huflvbOJvFMCvZ8dxISGtSh34=;
        b=aHZuM8mQYsCGtM8wSsktH1odDnq5QjK/Iz3GtPHVAO0+/dZHGCSiAXqtzHFmBPrKG5
         NeDPVeMAijHBU2rku1QxwXC16Tw26G2OqlbvoENZSTAXwD148c1wR7kYqxNAyfbnXExu
         xKz/W96XnB883is0phBupiKK8I1CXttqDwbDldJ8BAVfqVuRSExzpVeVSVhzX26dKYh8
         dxMOkS9xj7JzcdYVe7sY+sh3TmiwUxWYfic0iHwFU99VOE6w9jSlm07FLOMbZroAKUgF
         EZ6KU1BG1rYuccDkoUdY75NvbpK0akDw5Rglka5+a2rxoK1oUMDi0cbwqj9uIXOvYKGG
         SAtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763158614; x=1763763414;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ztuYyaE22UQpg1VtA7huflvbOJvFMCvZ8dxISGtSh34=;
        b=V/F57nj5AwzFGoGvT96NHqa4XVuA336IHP3UHYSD0MHbXi32YVhMZOUc+KkUvB7yUL
         YGf3/ES1MHs2f82nrCInR1nMVQSQ/Zker80EhIgMj5QZClWsG8Z3XKrI85eOArUvAZU0
         jKHqx3OuCdz+yKQhQl/8nm7LPnDTvgWtBndraktYIw+7+NSJcEogVfFiVAk4J/z0/0YI
         P65xjvb7RZzvB+coKAgpL2x+Zat2vBF1fbZrBOZ/6Q4WAFbuLVMjM5FwvomFvY5ZsBSY
         vvZ9UGbMY9CIBXLM9XeStwSqiLxDcfcNIex3qta72z+1rMWGq+5OjJui0TIlGGYJYTRH
         HmrA==
X-Forwarded-Encrypted: i=1; AJvYcCVAd7oqFTOEFYoR6mQAD79mZa1SHSKllWXhesstdxOMmv8DORb4QyK+kXY1qDRyYv7QMpfPxPxBAhZJyFQm@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoj6D+UH42kYy4J7BK5nV+ukLGJFLlu5WTHRLS87DiU1OcnePE
	D5jBm2zIxE2YHwnKE25Su8hjGsBDeIJQ4WDkdt41GTD++oYVHpHsVaPwmWz56oMujzdk1jd6S8m
	7aUESF32CmHDWQMEI3OgxT8si6r/ffzkU4eGupvJl9LFbqHX0K9pRbHKdFxzXEwCX88/x
X-Gm-Gg: ASbGncu/AcbYq1vZX+4MrOil4JwJ+pd4C/pqCCtN9g+a8AlfUvOcIVJgyQIsCYTzZtJ
	IcxN8jd0sTBq8FoAYIOLQ/FHOG7OputwjOYS7KjZIxa8NrkdlAfB5WKFIcg5BKN/iYcB91WX9tA
	2KxjUB4GNzcXa8ytFw5sqGm0Qit913f79g7wZSIYnO87mP6Lo1upGhBfMQXQJsD0eyZA9oo1Hkj
	5AjPhBRddihnevDSmGgMtdbkcmx7HsmwDfvXtlhuMj4PIHEAkMYlKd3KenL8HUGK06yIKMYHiHL
	bH4GcgeHfAZSDrYyXM4xwcrwFEbC+xuNDOwnm+Zkr9RzK3/vKN0eyb+6Z5RnApFiJwGD36fJQax
	dlYalKVmW8/NxmGIrqkeG+9D5FPCHzkRVgihejK6NUliIIUcHJzIwXuU3
X-Received: by 2002:a05:622a:1820:b0:4ed:3cfa:638a with SMTP id d75a77b69052e-4edf36e5099mr44152391cf.8.1763158614246;
        Fri, 14 Nov 2025 14:16:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0nd6c/kzzPXZC2X5wHVvvmNWn5NWPaIyzTQSgkf9L94Ds3FA9xJLXbYLBIFCtp2rkNjJ6Mw==
X-Received: by 2002:a05:622a:1820:b0:4ed:3cfa:638a with SMTP id d75a77b69052e-4edf36e5099mr44152181cf.8.1763158613803;
        Fri, 14 Nov 2025 14:16:53 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b734fb12c87sm471442266b.31.2025.11.14.14.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Nov 2025 14:16:53 -0800 (PST)
Message-ID: <5fbb0239-7f8d-4e47-b035-4de270b6a348@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 23:16:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/3] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_nihalkum@quicinc.com, Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
References: <20251114064541.446276-1-quic_vikramsa@quicinc.com>
 <20251114064541.446276-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251114064541.446276-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zqaoSgaT2O4ur8-jOTXnrXY7wxXU5Iju
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDE4MiBTYWx0ZWRfX4jZCp61w0sxR
 hahpDYQQ56Ft+PbVWMGuXkVqFEXYULZkdhSaadfLtv5ALDsY21rgmvOiSmeGf4sHDlDeMJbN/Yf
 raL4eKWmo5kRD4fw2kmHK5CwULN0zw9o4ZjFmfBZyvraEqY1OHozfv6JXfk8dICwLqg4NRD6uTt
 SDXGPljA4BKVybN/qH54txkBEiUZhEMhZJZBNso5htKjbO/WWJx5SBK43xZWvbED8VBqiwmba2c
 uP25T/ZUWYVUnHK6n1uqwqUJtn2s7pjE3FunavwzvWaLf8P5B2Qkgc5NXBIXu/FSxVjCRaTxZFk
 +4TAhdyogvKJtqP9wVyMVM8GkAnYWMs/U4/wDKWMLIh6eGOTAQnGOhGjz2++kiG/HW8gYQiLzqB
 z+BWIy69x/OBsUNfAjnflgdiWy22cw==
X-Proofpoint-GUID: zqaoSgaT2O4ur8-jOTXnrXY7wxXU5Iju
X-Authority-Analysis: v=2.4 cv=OLAqHCaB c=1 sm=1 tr=0 ts=6917aa57 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=MC0u2OBjPC9q_JU67CwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511140182

On 11/14/25 7:45 AM, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Qualcomm QCS8300 SoC contains three Camera Control Interface (CCI).
> Compared to Lemans, the key difference is in SDA/SCL GPIO assignments
> and number of CCIs.
> 
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

