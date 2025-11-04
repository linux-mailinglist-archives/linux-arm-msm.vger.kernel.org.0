Return-Path: <linux-arm-msm+bounces-80276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EEE3C308DE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 04 Nov 2025 11:41:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 97A5D34DBD5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Nov 2025 10:41:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B472BF3DB;
	Tue,  4 Nov 2025 10:41:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k4FHjXOW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a+U8oCh2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464CC2BE642
	for <linux-arm-msm@vger.kernel.org>; Tue,  4 Nov 2025 10:41:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762252904; cv=none; b=I3Rn7F3nC9H0UmlF7TASW+oFWcrapypqSQMo5MRTxduQM/kTTivQQ9fBWCEoCoHv8b+fyJBdSzPbq9N65uMEulCb06eBMsRd7JXgNrJyGZX1upoRnuf366W2kCAaoncqClMqSrEMK8jY5uufmrWBkcchzrdDcdx8oGpUvwoELy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762252904; c=relaxed/simple;
	bh=/AztLKbGGFxl44bpJWBFEF2PUvYcgQAohT5lnP7DCok=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MrRao76yltAsBb3PYKQu+bV1VSc7HVZQGVjhJGev6TAWrH1O5RwnqJwWdMuqzCqkq+wHmkAJumzGKMSoldG710fC6215qmzf8EHOX30d9F9ZXn1q2OxsqMwYojBycZS9CEfd9gyJur0L8NT3/xZVtAKx/a22PXX2kYtUw34jQMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k4FHjXOW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a+U8oCh2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A48g0601539184
	for <linux-arm-msm@vger.kernel.org>; Tue, 4 Nov 2025 10:41:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	91AvSbiJCi7tatFtu9pUmptKmfl2yPXXVuRM4ZTqYyM=; b=k4FHjXOW6gtOWYQc
	Pu5AocvjZwhoQTXYfIaAkthHIuTCHQGYQdTnnDbKlHy3vMVmMmIMFxdKS1lTht7x
	dIvaWo5AtgbNrv6B3PA3o83Lm0JuRJfAsqdGKfxWmTiba4KfzF2fmZsukB3xJ7QM
	0dXj3yfQV3HWmYfOQh7i9ysvcqfBgYd5zUFog9IqRvmFeLLKk/IpC40xQ1XGbxE8
	f5y4qJZTkHBBVGcF98ewK88vzc6IyyyzGgMPEC6VB5VW9aDhz/ViYaffU1mJSSRc
	CW9xtTdEU2dH+SkEgO7GUZ5PV2DGgs2Zdup3TeJcxfWT/CitZPU8iabri6iBm0Xr
	5Zzpbw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a78eqsb4h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 10:41:41 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7aa5e7452bcso377589b3a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 02:41:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762252901; x=1762857701; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=91AvSbiJCi7tatFtu9pUmptKmfl2yPXXVuRM4ZTqYyM=;
        b=a+U8oCh2JIQ8mCrOclrgmod8oREUNKhH2ML2TnOa43kD1Z5T96V4Hv0i9Hyh9kngTl
         9qJRZZRNupYDP94SrAuC4u3Z9E4x3qPAyLWWCbLNyUKVS+4JZK0QEOlUDDSgN+jkgcd0
         cMpHc0ViFiBlTn55i0dRTrgj4nLzhC4IjwOF6I7KLYtLgkrvVPjGp5yjP5bH57HG435J
         hDOlmjxKxmwk0XdhuXblsd1kFjOHZ4BBId/Rc6Yx/nA3My3gkEUvwYb8vi2z3G9DYP1n
         0rd9hCUgvagJFPSrqN7j2mHVBl24s9iVODvxbed2JyCtcJoWg4D/Rg/obb05qAccabqe
         3GNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762252901; x=1762857701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=91AvSbiJCi7tatFtu9pUmptKmfl2yPXXVuRM4ZTqYyM=;
        b=Na9aj/pFIcCik9OQGZi/ig6hnuJMA4CepLpZ9yT/VYOx0f3LxLrvsb781Jaj4GhbBu
         H8hw/sSFTGDX5g8ZocyNMqsra594Pi6Q+w4DniYdtdSc3XNNip8Rdm/JrHATGnh+vFZr
         J+V9Kwi2LgLpyHaVyHp6Hre2xmemXR1QBQDwqT9z7jJfzeiPQbqmGfxjasgxGfxjpFU8
         Mxx38kAPEwcMYSGG8dBx6lotP7mXyLdp1xF745eeQV6OAz9PeGoC9SD67oKcwVFpFvrJ
         XKzYDsJhbmzRi7ymsLXeBST47/d7NrLHs3qhSmZxhebgTzBs1X0cVlKtTlwvTbqLAQbe
         S2gw==
X-Forwarded-Encrypted: i=1; AJvYcCXrwYNQ0/zMx4oIUENB7heBGxfmnjQxlIjK0DosNcSqKBLSpmrmG8rlxQ2zDy2CnOoAG6s+i4W3eEdtVQp8@vger.kernel.org
X-Gm-Message-State: AOJu0YzrdLooqEpLprb9UadbydGwx3OcZ9dARKcEx3+87GP3ifocEMId
	eJkJuUP2I12plo5BbSeTd5O2lPKIxy5pXlPb0eYG1EalQaEpiwYvY5qqBypzfGlq2j0yQl//mWv
	w84fEqi9q8UZnjM0JtqRFARk4C8rPzqYOfURjQgpa5QM/MsxVdBsUTEEZtBIL/1wH7kxV
X-Gm-Gg: ASbGncsud954wn8xMAC+cqxQdc1QAJ0iMeuvQT3czBztgOzV7N82MdBdXaATiaEyCEH
	X+YcKxozoR5t9vKTmoenYVP15SbepU+xKXzUd8KxgjyxLgHz7wIHYC+PAuRwuU1dWYW2A18XrFC
	aVPvAcyFgxdJnTz9aN966DioA/TdnhceMWabvWjqPjee6nxWNmQYoJm2yVadZgVpYagg1lBI4Sv
	hyRmDEkZCfrBG+r6pzdpqKUYBs/wAIYy2TdhUpqLfOeemd3MMIE7KyRayWuZ4ChxZBCvlXvqf3u
	Q0BeaRFLzRJrqhb1e5ZnqCkHB2w2RwU8X1ZaV+gN9z6CmFuhaMZgrnz2a/Yzm6Z3FDCJtoQdX4m
	e86D3rm0kWO9afWbS1QvQcazjIlAwHS01lBW9lRIfB49uYjGIF3KjJjlFCwwyBcFg3g==
X-Received: by 2002:a05:6a00:1946:b0:781:1f5e:8bc4 with SMTP id d2e1a72fcca58-7a7796c3cf8mr10643266b3a.6.1762252900613;
        Tue, 04 Nov 2025 02:41:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECdg2X+KKdyZ7UpDXqI1KVowix3dalkZkr3HCYmMgQdCB10hcuf+eU41ymVBOCNwqvnosmxg==
X-Received: by 2002:a05:6a00:1946:b0:781:1f5e:8bc4 with SMTP id d2e1a72fcca58-7a7796c3cf8mr10643238b3a.6.1762252899976;
        Tue, 04 Nov 2025 02:41:39 -0800 (PST)
Received: from [10.133.33.149] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7acd32473b4sm2518486b3a.6.2025.11.04.02.41.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 02:41:39 -0800 (PST)
Message-ID: <bb9e76f0-7059-4405-a8a7-323f1a5f07b0@oss.qualcomm.com>
Date: Tue, 4 Nov 2025 18:41:32 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] dt-bindings: soc: qcom: Add qcom,kaanapali-imem
 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251102-knp-soc-binding-v3-0-11255ec4a535@oss.qualcomm.com>
 <20251102-knp-soc-binding-v3-1-11255ec4a535@oss.qualcomm.com>
 <20251104-glaring-rebel-pillbug-a467ca@kuoka>
Content-Language: en-US
From: "Aiqun(Maria) Yu" <aiqun.yu@oss.qualcomm.com>
In-Reply-To: <20251104-glaring-rebel-pillbug-a467ca@kuoka>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA0MDA4OCBTYWx0ZWRfX/xHVLpsdG3oy
 Au/Xr1d9WuhWbz5JNyEdn28f1PBmJ24k1kiTnWPG+0YSnHRrsM+byv5EH17F06Jbw/5QwKVXw5a
 jBw37jdYp6BUrIY0x54HgtRvl8mGMTepwSLAmbxabIxnca5mwe55WoEBy5aUBFvxaL0VX9vPE2f
 4iDuLAhDnMxAytzO6w52tFHwY1Ao/bIMG14baybxNjcIFnEFf0CXu8eeToeauHl2mekMlJKptmg
 MdRCheiyw5p3UR60SVqZneGFaXzVUH04YWW3cISbZ0TmQWc3NEjMUqpOekYnOy87cKKACHiStd5
 KUWnu6ZFHW0KPJW6pF/7GRHUbexXpd7gXbzZRoQbe/+RLGd2IeQyAd+7ckqYkq42MoHk29m/8zD
 aEHN8y8AyhB2tcfah0rvlORYnC9fMQ==
X-Authority-Analysis: v=2.4 cv=fofRpV4f c=1 sm=1 tr=0 ts=6909d866 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=df4OXsTxo-j3LUg4bp0A:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: mNO8pwoxSmM49i96ZnzOCKYYC5deI91c
X-Proofpoint-GUID: mNO8pwoxSmM49i96ZnzOCKYYC5deI91c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511040088

On 11/4/2025 4:16 PM, Krzysztof Kozlowski wrote:
> On Sun, Nov 02, 2025 at 11:25:06PM -0800, Jingyi Wang wrote:
>> Document qcom,kaanapali-imem compatible. Kaanapali IMEM is not a syscon or
>> simple-mfd, also "reboot reason" is not required on Kaanapali like some
> 
> I do not see correlation. Something is not a syscon, so you add a new
> generic compatible? No.
> 
>> other platforms. So define a common "qcom,imem" binding and fallback to it.
> 
> You did not define fallback to it!
> 
> ...
> 
>> +      - items:
>> +          - enum:
>> +              - qcom,kaanapali-imem
>> +          - const: qcom,imem
> 
> I do not understand what this generic compatible is supposed to express,
> not explained in commit msg. Considering this wasn't before, it is a
> major and really undesired change. It also makes no sesne. There was no
> generic compatible before but "if not syscon" now this must have generic
> compatible, what?

Are you suggesting to remove the generic compatible of "qcom,imem"?
Could you pls help to confirm the suggested way from your point of view?


> 
> NAK
> 
> Best regards,
> Krzysztof
> 


-- 
Thx and BRs,
Aiqun(Maria) Yu

