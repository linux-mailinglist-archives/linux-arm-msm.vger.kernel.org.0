Return-Path: <linux-arm-msm+bounces-87266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A6312CEEBBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 15:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 286FA300AB23
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 14:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88D97311C20;
	Fri,  2 Jan 2026 14:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZWHW8rM6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VxygbBU5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE052DCC04
	for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jan 2026 14:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767362803; cv=none; b=fSgzgqjj4iISoCoB4+cVzCV/PKirt2ejFYo7cITJe/OO3rUd0jRkC3NHUa5IVy4/WLXhA3wGOule+oOiTvtM6sGQslkdNxrDEjvQ26LjDtb3iUR4lcE/YRTaM3pNJNOdRVDHqfGFbOSMGrQ/skgVtwS17kDpkPXa3UhhPuimeFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767362803; c=relaxed/simple;
	bh=s0EtLDdJoB0XvKSbNBwYEd8TThn2e8Es+E7n8fIqgWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=kMvX7CUAAGFHZFSEhkX+CqxlUqCVXC/FlwRhL3FhsjaOYbG2Ri3xrHswmCl5TWCScKlLEYWkWB5c50sE5bcPs1Cs1QA9ZJx6sjtCHsSx3FcuAo71S3XTsiM44HsTlFfVbPRnqD9DzMqiHQE3+kuhF1R2ITp9WOevZSZ6Fh+44wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZWHW8rM6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VxygbBU5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6029W2Vf1002055
	for <linux-arm-msm@vger.kernel.org>; Fri, 2 Jan 2026 14:06:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nZYkRssRvlp1Hi9waVhR9vn2qSOLq6FZKXzjLYnaukI=; b=ZWHW8rM6F/THC753
	3z7oUCB01RdWPV+949QLzjsf2De/MBOO8XvSQPGsploMjNmIDhHN1XMWsRud442D
	RD2mEMiWZ5dpg4OE+NYIQYSnVhICK7nqEti/xZekV3zQ+R9O2qW3mjyOwKa5/F3M
	SN9h4t9d2frCiKCdaEHLLAazCHoMpWEV8pe04SrXM5crfBavd/fzAggOf8dl9yex
	lQHLUxG8AzqRD4LYMKxo+UZzORQwolLCMFJJBgPYQK5WKzrigLygoZ9zDb0I+LQd
	keY0z9bEpCm1RVXdvWnIInK6LHZigCJyceHwWza0rTkmp9/njaVSTYAnHqSwf97j
	5q8Tjg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bd2bb43a1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 14:06:40 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c231297839so197690985a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jan 2026 06:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767362800; x=1767967600; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nZYkRssRvlp1Hi9waVhR9vn2qSOLq6FZKXzjLYnaukI=;
        b=VxygbBU5QWjSw2OaJuTXBjlgYeUBe0SgblQw5zH5x+pLgVG78CtaZDCe9O2zE4h7Vz
         Yns2ZM3t7kXb2Y/Xa1D0XYBsl3yQyjbIAPTc1jZD+DhW+8n/CjmWrqFN5UD6lgZ1vowE
         iEQNONg58FAyH0l4e1jpBUZBv073ItFmScRIGMGeWTKyY6anwwU/iuAc1kvf3rlyHNRF
         NdHyZTDP6vqPvs83Ixr6Cu8ln9/fBQsbd7lrtGobXtxqNpU1yxGNxZmiBKPhvYOQBFAz
         B3obZe/ir/CBenuoh16F6NtTnReWhqI8XBavf1pFK4uRlSD0JlrTGcPHOXdL445hM6Ga
         pFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767362800; x=1767967600;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nZYkRssRvlp1Hi9waVhR9vn2qSOLq6FZKXzjLYnaukI=;
        b=w4g/9ZyulcOMYU9SnSCIxJPIlZfBSwHEpdELuX8NCrxtdd2k1VxX1dS9TqlNDowesU
         uc/x2VNOeo9U7bjP4IhWM+BRqMOQY6HHVhWsuzr19vseb2bBm9cuM57TtNWoW39QwF3T
         UCKP0EokZdUw7qtNcWVq4J2DpwAjB+AnihPMG/6wTbLMnrgZb44PaXOmv3DXhiWrbdNV
         wVwnvRo3XLOCK0lhhP0tXyzq4L4yA+jR0f4ET+BY4n3j6W2vN1wLKhmDxs33FhsiHd/+
         kjjL9vGQU9CBdY+vNqSLMD/56wbG7CxXM+DHh2uCZq3lqiMCpwXbENSSWMgrWYHOtkBw
         g1Fg==
X-Forwarded-Encrypted: i=1; AJvYcCU2M8GSzlcgKc8pTRj1PnWKYzZtBhCKK6HbkhQzIzxYBp5nVlaWoYiyb7Rof+xQ1B9lHn34KWMsRu1ASzpX@vger.kernel.org
X-Gm-Message-State: AOJu0YxtwBNQmK5gkJrCBawZkqKuveSKPjzVMJn9Wpetc9gcBAV1Z4c0
	d6ADQhLrSB031m9kYCcbAlxXY732oFmpBgO0I81nygosndbiAdlgARkoxNeEy7GLcU4qpNXilrp
	4Zvoy3nDswKPozyN72lm3n9W7iaqhIk3USP5xOSlArEehS5TrN4imuSVPhbegkuI+xf5m
X-Gm-Gg: AY/fxX7uNB4oHZSJ+ZlsGBKMbFoGxsoz6TGgmkxyEGDTZGpfqCF2ARyOoROK9AUTcEL
	wU2R2UYnLqtOkGz8X+Y1BPTkyHPWeZYp0lAtjiMKnTO0eWA4ttS82U7zOOtKj6TyHjM3+fpV8BB
	xTVig/+ic7Chg1LhN7mvuVmLWma19RX4k67UizXQ7/9UqmJtp3+QeRrWlagiSPcr0wVEAbe1bRB
	o1deElAeyhn3F4BSD+BJXcciwCuYz7oZWJZVshLrGviIu/gLa9YP+fd0fbN+VIto1oPjVeNSXyQ
	eiEha91i+gONmlfUvEnLPtJCRz33dDGTwzkaict8AHy16pz9NWY7hRbmSb/vvz3xPhOh7xEGaO7
	wmd+0Sfb+XYdReg45LrncWZFE70/IywAFJVF7s+sqrp0jGf2eCagAZdm70j9enRZCJg==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f4abdcbf88mr471824591cf.8.1767362798914;
        Fri, 02 Jan 2026 06:06:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG4rbbpmrmWgZk4BejVdpWV4cXUUDQHsGCTJBvERinSatHOpJb9xq2zgV+7kCcF1bpIVWapuw==
X-Received: by 2002:ac8:5744:0:b0:4ed:b7f0:c76e with SMTP id d75a77b69052e-4f4abdcbf88mr471824041cf.8.1767362798335;
        Fri, 02 Jan 2026 06:06:38 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8037f0ecb9sm4505942766b.56.2026.01.02.06.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jan 2026 06:06:37 -0800 (PST)
Message-ID: <cd42a176-5731-4a22-b5b9-567898e2f138@oss.qualcomm.com>
Date: Fri, 2 Jan 2026 15:06:36 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] slimbus: qcom-ngd: Simplify with scoped for each OF child
 loop
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260102124808.64219-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260102124808.64219-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KfAdL8c0Cyjwd3h7U1GxGWQGpRwZQ_cH
X-Proofpoint-ORIG-GUID: KfAdL8c0Cyjwd3h7U1GxGWQGpRwZQ_cH
X-Authority-Analysis: v=2.4 cv=dMKrWeZb c=1 sm=1 tr=0 ts=6957d0f0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=9ra_KJl88v3tURVkoeQA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAyMDEyNiBTYWx0ZWRfX4qLtLlJ9S5xw
 0uvvKcc3Gg4Qxf3douKfrH7aNPwGP27n5Lgrn1sKoN2ks30Bf/HwTIgauvPsn5fWn/MV0LhnuD5
 M0zDiNOPx6oK51o16eZ3acov8MjE3ig1J+tvS4295Lv+QTgWPolgzLVglD2F7viYmGrMtg0OaNM
 zVyE/tk+B8CVN5yQK2uQKLOgpn1eVUD8kP6gCj5lk9XV+1Av6g3ymHtT4ReHalggTnRguAwfiAa
 bzvORR2W1IAyiqpcu+T55sCO66XgwIhLoWQOnJ7G3AyNr/k6uNk/vV8K1+FBVizDrY8Y5m1H6vF
 rFi0MC7OsJelZMi8VoVafIfDIpeyVH/aj2dr8qogM+f8P/rjoTvDirk4C6gA3QcT9tD4+AM2t8q
 rhnKA2QnOST3oIkJj/DsS35bl/LEakV7rmI6jaBh+9PLsCaAYjw2zzfrxgHiuRyH0WpJnxZoI1L
 ZQrmWHNxbb7DOpvfcxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-02_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 spamscore=0 malwarescore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601020126

On 1/2/26 1:48 PM, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

