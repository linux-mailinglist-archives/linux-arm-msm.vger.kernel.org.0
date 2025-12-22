Return-Path: <linux-arm-msm+bounces-86166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B00B9CD5402
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 10:10:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 904093009F25
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A694D30DD11;
	Mon, 22 Dec 2025 09:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hj7MUYmL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fKs2D1EI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F7924DCEB
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766394607; cv=none; b=nFBMHOk3wwrjH4ozuw6qHEBM9uaD295Ntl7duiheMyS/I2EMu7iub7dcNycZEROeCbXPa7Qk3MhycygFW7MVNV4J0r3+kqzCvwt47pNTRtN6vPZEH6rLNJ91zrnT+qiKOqAXp0m4YBxW6ljxT3cof0agkg8/OzLgOdyzsG38X4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766394607; c=relaxed/simple;
	bh=Aymwzfq5OhK2FRrCpRucgvkJmJckgyR5Klq1Sf7k5VE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=huGM7UJGzrDnqqA7idtPxwT+f0ppvLu7xbyWxyhZN7gqH/9AIsulryp2XvMuDEMx5AcZd17wm2NR5gKA6ghTKzepjPN4bh7lisY8Ju5d90kwvJ1TLJHnssoaLwO0o2O29+7G2ZtNoULi/AP1cYPlgiKtsN/k5WOgU1Avk08YJhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hj7MUYmL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fKs2D1EI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM5gEvZ2189759
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JHWWdE+wbubFTvie2Z1oIhb9fPYx8KhlXYjd4LJ4pI0=; b=Hj7MUYmLG/YfTa5j
	EV6U0BVE3kdgHyx/TOBsIi2Muuz36pYia49op82WlExlvYS9E+Fj00LKPyUndzmd
	7gfgGAhfaThqNaxWSiHygmWDieTLNCrimmy0LRa5ZyGI95gjjjzLtwTwjVhe7YKt
	5XYYP0KkoRnRuqH/z3eiTstuFy3j6mBxWZs9/MYCGP2Bz+MDgZ6Wzz1YDe57Gd3q
	XWS9aYg08MF/xtFXHSAUxaPuTA678CaJsqkobEvcWJrGHghrIUHCAHzFlhEn4Fzr
	aV/DwIgaOxYh77R1iAB+QPwBM4rBgHtUIrhFSEW14TyNtpqs8/htktVPR2LTqIdJ
	A7M7FQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b702t8kup-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 09:10:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ee409f1880so9314311cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 01:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766394603; x=1766999403; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JHWWdE+wbubFTvie2Z1oIhb9fPYx8KhlXYjd4LJ4pI0=;
        b=fKs2D1EIPeWkeMcjYGSxbGQEoEXA9fleyYTgg1s3e2lTqrtzwLjJebsSMwoLiJEBdi
         yR1Eb2I1Bc5FvbsNEpdpGoeDw02fr2FsATBx6duioPl8dY58xcBUn9qVz2jyUK4msBGG
         q9C9PEp4/N0i7qwuj+Sv7A1pHpiK4+SaQPBcPtcHRnearlOlehRVnizIuBJ+HBF8CJBj
         /piVIqgQkgd1sUn3wKicYlcAEDKBlaoJcITyQOZcsGzBbpYCsAg2csy6owiEawogW79l
         X0xf/ylMPpgiboJM1FL9gjfmoihg1PdxGdA+6lP+tAQP0o/1cqdONzeslbk8C1SsuRe/
         cfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766394603; x=1766999403;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JHWWdE+wbubFTvie2Z1oIhb9fPYx8KhlXYjd4LJ4pI0=;
        b=TblfQ3s6FuAjY72TiZtOqmPv3zuKc2BSsxfoV5FnFFAx0wZqzJyzOErs5rRTlpTygQ
         HegoNXaJbtmxFrwsnKilnBZlRFpqxsRlc8x1tFoi9xz9DgSYXpropO83w3IHS53oY3AW
         DgJ7zILYEgZkiihKlou+NGPPc4nlwTEEjgDh5tKvxoZDG9P186rZko9ViLD7eeEwbKrV
         Bqn/QZ+WyHfkIT4JOiFg/TeocC/PuQ6QFMHk8168N0b5pbK3XVAbbCj5p5ojDo5bm9Qn
         Ofrm9ctGS9VPReeDzH7eDbmLEtDqyl8iV4WncaeqfIWjXPJlxMYf9vLTqt94IHRE4ogT
         zWFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJPdjvYcHKoHm99+Ey67L7xgmdHa54Zh4ru3UZWMpVFkwV690LAwDve4uKdgVL7dFDGHrw4LHrBxPIhiS2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcx7y8KGWavBlWOzMohrD9w4qeb3pkn+Gv273/Gnqs9hihndtg
	HmnmIpSefBusiTXH95Tvb+/W+Nzo0q5ljKMU080ua3+SQSFBr4mLOMlpHRt8nJYu/IDNXhKo+MP
	n7NBJ+nQJIOB6pFnjPIV2kFVN5Lbr7g/iNxDrAX/rPbXPLipanJqyQNPrZk5dlj4ltBYg
X-Gm-Gg: AY/fxX4UEEB4dzy2SzJXBj//JjmNbSLijWFlPxof+aLzWNXDi62I2ye0jvSn09ODrBq
	/ANMXRbiMIpDJg31Jvf/uFNUQ/ZriqgeXtNLkqLWuHzoGzugALyxJhZ2lFTklvtXY8Ak5ylmXDw
	bml8bhUKD1/FI+dnIAOwwZY8+9yTdp4h9VyeBeX38K/dKF/hNXUziEuaJBsnq5JcxzT/qFU6glE
	EABYz4oGbq3SmMYN3u484c7uZ08qzP5jrws2Gf1qcGH77AKUUn0R9V5idotOTzT0RWHKSo0eqUa
	kc9iRgfUoNLGZhW4Ue/lJ48jANHlq6omByAEh6dYBfADM4enmq3wzLoJkI3z4D9FqeepdXyQLwT
	2EIEmZWfWoHPcytbxunlWbLy3cThQlHHm8V358uZrDPbpy9YvjhVInxqhOJq0Wuftzg==
X-Received: by 2002:a05:622a:247:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f4abce7d98mr117884111cf.4.1766394603168;
        Mon, 22 Dec 2025 01:10:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTv9EYxPbsYfG8sAutjjuuUPajlBybvkaycaj2QtwrxowzdMs7eKcuYEBPmJLLlgfLbWzTsw==
X-Received: by 2002:a05:622a:247:b0:4e8:a54d:cce8 with SMTP id d75a77b69052e-4f4abce7d98mr117883871cf.4.1766394602784;
        Mon, 22 Dec 2025 01:10:02 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b90f53b21sm9799699a12.5.2025.12.22.01.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 01:10:02 -0800 (PST)
Message-ID: <2f3c7bc8-8c7b-4c47-95de-7a8ac6dc3c57@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:09:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/6] drm/msm: mdss: Add Milos support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-3-4537a916bdf9@fairphone.com>
 <475izg5bi56oefqtqkvqeyspx2por66zrw4tgqbb3f2ziaghyt@tccm73sl2u2e>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <475izg5bi56oefqtqkvqeyspx2por66zrw4tgqbb3f2ziaghyt@tccm73sl2u2e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SIhPlevH c=1 sm=1 tr=0 ts=69490aec cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=DgVbG8OoVQ-VTv-dGB8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: vPzIVypKiu-0OkM0bGErvR6QkoUMxfyk
X-Proofpoint-GUID: vPzIVypKiu-0OkM0bGErvR6QkoUMxfyk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MiBTYWx0ZWRfX+zverW1YOSj7
 U02Ojl0CKFHIxfc+f/Zhjd6dCwPKWzNkA+gtCN3EFK3bQbWQaEvXeilw0JCf7GgrPfBguwaGvR8
 pC7xO9cdGF5EZSh+YkXLUCK+bH0Kg2VAvHxS6SzIbI+KRmyOTcyQ+NHSHxn3/fTBvuyeQe1Behq
 jeg6gGi7mF1IUhTjDCS7XpJPehjSx5510Ju8gNC0D32YZ925RVJZT82ljC9Uv3Dlx7FlBCwsaQH
 sClqKPNQV2xSAb0FOzbFUZxbnoy1aiFq9v3o0HjsnJz68yPN5mPyI7l+5nQVa9hkpHl02cHly04
 y6oHdRJx8B9jW2/nZNSljGUg/nzM6sDPFtYXyQ+63S7Aa7s8H7pXasgDM5W8Q09bQ/n2zIqSQUn
 B/qqzesE5Un5YlDvARJJnvi1KZodz375KUSCpunJ1KVtItEU2+TgJGk0MCerCq5qrpwSheyxNPg
 dWnRThopksUkU9BzEnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220082

On 12/20/25 5:52 PM, Dmitry Baryshkov wrote:
> On Fri, Dec 19, 2025 at 05:41:09PM +0100, Luca Weiss wrote:
>> Add support for MDSS on Milos.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Though 14000 seems lower than the value for all other platforms.

IIUC it's essentially "nonzero" or "first-level-above-just-nonzero"

The downstream DT also defines a 140_000 and a 310_000 point.. though
the middle one is never(?) used and the latter one is only used during
UEFI handoff and upon the first commit after (runtime) resume

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

