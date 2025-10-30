Return-Path: <linux-arm-msm+bounces-79627-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 11958C1F4AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:30:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E2481885664
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 09:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45A992D063D;
	Thu, 30 Oct 2025 09:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fOc7cwYG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jW7bZTNl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D513B1EC018
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761816585; cv=none; b=Iq8IHa90cNZQJvkuRV/4mULt5Sr33FAzuRhDJvhpmOQbjxdjITQTHFQpTsUE7fAV56hhaCyfxYf4fFyxhlsymf9eznCMOmN5RwlZu0iANIjOSqM7autDu9EwOXVugIvPmPeI6XbChsPH95qjZ0odUcoP55s0JDayrrxlg74042Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761816585; c=relaxed/simple;
	bh=B6ER36m7Iv0Bd6NkigQuIXl1EBA+qHiW6lMI6ZMVbVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A3iL0Y0pD4CBixI6ieoVtRikT9fOOHP2yu9IxND979KNtLP6ZzYuj4qc1xWj2AYZkg+DJlkVkkWLA8/EDzIGSkTRxcQLfVhje5LOP73JKxx1oDc9ivc2B6jKVVg2bT5FW+4Y4q4hj7Q0acU4MjWZ4co9jhULF8stxeEm+x2OGbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fOc7cwYG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jW7bZTNl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U9M9ad810612
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:29:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Wjg1/j1eaIn0ChUOMAcpTE5peaMAgfC7A+tzK3TiVOA=; b=fOc7cwYGWbchEP3+
	dc9j6A4aqjC1n1Ltx36/UxLjloB2Je05qikLFspDdVpszGTXlpBGQ1DavO/AxVUu
	Rz6aOTcgDR7YSspOPDoWNpqWL2UZ5NjsO+e1+ASdVrDhKOGvEtsKonL9PxDPdAMf
	zVYR8LUwqCOTl0MXQGw3Mky9glOrqiIRL32S1uQ1zZh1EP5Vw0oUr96mrYU+4hbo
	hyeNn8aO218zHDT1AFLfYVRwPdmOUY1K8Xg+rBDCD5gmibLrqoPMm5nza4ZQM6tE
	Ky0MFAvPuzHlebpExdtdOStMMNarHdwKvYEjf4xjYsmqWco/mT7w7E4pYrsdSNZa
	GTwH5w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3mvgb0nu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 09:29:43 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7f5798303b3so2476566d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 02:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761816582; x=1762421382; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wjg1/j1eaIn0ChUOMAcpTE5peaMAgfC7A+tzK3TiVOA=;
        b=jW7bZTNlyPVJl6mCN1J7ul0+Q4ZB3WSM1UGDMMtsbnQgDV8XO4HX65RJ11bK94vnLr
         kVVd46R16IwAGub7VPpWWgQIVkQZTVpTXrXi4Ro+ZOYC9VGZq7j12G/dwl+B4BTagLu7
         2c8w0RK8nC0vXlV8jjhjeYjGIKKsa/hDGj44hPPYvIBFYqupC514/knNaOE610X0WykN
         0M4JegDxjLykQty5P8izc6AOVgkjVFm3Jrk4bOCyBPBgdcd2DnMgSg0FcS0zhWFvHMGe
         Ay755LpfmA/ZrFNw7DUQotYnzQTpBVN1xXz/SP/R7RKs2us0gOYcYm6bWuKQj6DUNSIv
         DMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761816582; x=1762421382;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wjg1/j1eaIn0ChUOMAcpTE5peaMAgfC7A+tzK3TiVOA=;
        b=ijG5AGGrlgMjTesFONVu3NTsXytnEPA5S7DH/id9NzY1X9XwdK2lpuf2+er0Q33Z5v
         Oe3bFWL547lYS5QSh23x85zIHrpD43oOP9kr9UMXsxMUEtsPDIchLBHb05EmS7NlvFKo
         rGldLtH7EgqcQrh4sdqcKIqCp/SnFyVOJPdYYlD5AFCeHpy35rokTY5mhPfnSLeU+Bov
         ZgGdmu/GbmfRw+QZJhwyhb0hsnnJb7VGOTqKlouffSvuV+xrMzehfu5TzyOXRRhQn5/H
         qX36bUvl11lGVmYwY65Or8TW461cHwTl/81Plsh0ggfseQzzBvL6Z5EVjGnGp2utDFrF
         lrnQ==
X-Gm-Message-State: AOJu0YyBYv1f/mepVNVeCtCtpVEvuk3gFR+0DwVioZbiogak/rk4zhvP
	+AfOu7iO785i9oz6guXq9ygrlMASQfVYG+T0HRcekTxp/xS8tiRBuSoKRBXloPYsk++vyoF4ZAQ
	ATnBHKumJ24U48vpXKzJM+vJnmXhDf+SY1Oj7liz2ivWYsL1EdthMoYm16ZqeEnZy2zIh
X-Gm-Gg: ASbGnctx5f8VBphA7NhKK7/v8f6EVnLFGbYXmZY0CtWY8cld+ak84pxt2nV45S4eEqV
	LUZ354H6pPdvTfMG7vmOqhA+sT+nVcdObtZIII36apT3hmBKtFgzA5WYuCW+C8/LJfoh4mdrQqy
	7RV55SikkJVLxWfxO7VZTH7nC+IQfzpyhD6ogPADmwLdMfsyo7rCBEi239CITMSITq+iu/Zfp+k
	JcaSgSnvXVnk44RIyDtD9xVom65Er+T9DbLmo1qKsb+uB9BxRMtMEieEMOM63mY4MigWlRLUth4
	2gRYOSuROhBVwn+voxKgL+NoQ6wHkEQzCnZcgJQKVt9z4l62QYwspf7zUI/hX+21KtgoPioKCR2
	Me+B/6317XXz4QlsvqJ/4KdNd4NRTK5/YhQYAtuL+bsIWIFuRV+l0RNjG
X-Received: by 2002:a05:622a:1911:b0:4ec:9b98:7dca with SMTP id d75a77b69052e-4ed15c3228cmr53520011cf.12.1761815824881;
        Thu, 30 Oct 2025 02:17:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBY5bJcBdjoLKiu4VhBE0Nq2T68hoCiUIh6ldHo/x4Js0PebzZ+30OGsg7Lfh1G10OjaHw5Q==
X-Received: by 2002:a05:622a:1911:b0:4ec:9b98:7dca with SMTP id d75a77b69052e-4ed15c3228cmr53519851cf.12.1761815824355;
        Thu, 30 Oct 2025 02:17:04 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b6d8ceeaffasm1722207166b.45.2025.10.30.02.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 02:17:03 -0700 (PDT)
Message-ID: <8a725785-2eec-4acf-bcc1-427c0e88726a@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 10:17:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] clk: qcom: gcc-qcs615: Update the SDCC clock to use
 shared_floor_ops
To: Taniya Das <quic_tdas@quicinc.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@linaro.org>
References: <20251029-sdcc_rcg2_shared_ops-v3-1-ecf47d9601d1@oss.qualcomm.com>
 <c361ea17-7480-4a10-b446-5072e8edd76d@oss.qualcomm.com>
 <557ff048-7e5d-409e-bf21-98328a834bc8@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <557ff048-7e5d-409e-bf21-98328a834bc8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA3NyBTYWx0ZWRfXwAohl+GJn3ed
 xzGjWE27xYbNXgki0pGeJ/06Zuqbl7TW0F4Ns1gS468bvPB8FyJWlbb0EAysOZA5A/+7Gd8Dsxr
 0tH8X9WGQfj0xiXjaPUyKZfvKDdMkc9xuw2cyi5KIB9j5z7F/oGGfgP2Mvfxi4QwKUu29vewnj/
 gXrwgvLLkeMQD/ABOiuX6rjMbgyayzSZOTaPGPHUNzxYTIqpWzV3VCCS8IwTNWEIzvjdf9MXV8C
 oD2L97HIbZ1Il3n7ftGRBQx5T/TmmMwEgpJUWzBMoiHjpVr0ob8+dv6ToMG/oQ6vAyl4kf7hcEg
 AG2b8mVY/r2rEu1zSVmXfQNjIdVApRHZR9l+qh31nz0TDv7+R2eHO90MoQyHdrs9HXV+66aCZY+
 cV0LgJ7N8FP7YKw+VK4YPR1Uq/WMLw==
X-Authority-Analysis: v=2.4 cv=S8XUAYsP c=1 sm=1 tr=0 ts=69033007 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=jRDqj1xAgmH_Y79Tyd0A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: O9xmQJ_lmWYDETTX_Y1Lo6_Zv3TCUi0k
X-Proofpoint-ORIG-GUID: O9xmQJ_lmWYDETTX_Y1Lo6_Zv3TCUi0k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 bulkscore=0 clxscore=1015
 phishscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510300077

On 10/29/25 11:31 AM, Taniya Das wrote:
> 
> 
> On 10/29/2025 3:17 PM, Konrad Dybcio wrote:
>> I noticed none of SM8[1234567]50 / hamoa / glymur uses _shared_ here.. 
>>
>> I see that e.g. SM8250's downstream sets it though - should some of
>> these be fixed up too?
> 
> I wanted to fix them as well, just trying to check the downstream
> history of these clocks and then update them.

Nice, thanks 

Konrad


