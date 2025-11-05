Return-Path: <linux-arm-msm+bounces-80481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E01F7C3712C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 18:28:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 99D8B4F6DC5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 17:19:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC756311966;
	Wed,  5 Nov 2025 17:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R5e2Bclc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H+qepDgG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BDA3126D6
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 17:19:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762363160; cv=none; b=HJLU0BAk6B+25G10tjga9SQERcf3lbNKkHE/yGgW4vh1VqxrYM217+mzy2ST73oWifYYKCasXQjjNnFtQ3NZTd634uhm4CHAx4h4z2C9vSSCe4bCdKQsTPTTcCPwozcErK84I7pN/LVkdJc+8HkWsbLkceSCGvppX/1FcwOUng8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762363160; c=relaxed/simple;
	bh=gH+IgiY5WDgW/EjcfxnbiJKK5tHc1KANHL2VeROjdCY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mchvZZe5BOL8xEIvbKVI2IzMiSLiQ2Tv8hDEK9Xy0BRpT2HoXnpGg6b83FdWNxQ4G2hCgxhWlHMmqF3JP4suzG5lqeZTk3as7n4lYJY7dHRoSfRE1+0eYcnitOzPPum+rsUmAlTzxcs61+yW7vbkEJheAlvrxFF2GWOMtGM6Nhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5e2Bclc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H+qepDgG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A5H6Gpa1542497
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 17:19:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d2jzqV8oJZ4plosAL5G1y0RTbjdNLT/7KsDqWwEv4zM=; b=R5e2BclcGpupn+E6
	eJr6HC4KPCNehHfO+/Xi04jG6UhWi77hYWRyBXtfApIR5iGblyE+8gQ+nt/jEvbL
	mhsU7wOdW/vXfopUc1TbT3Iqsqdv8LGkR4d/ECyg6lhi6hoqRDx0jJrymhRCgUbN
	eE5sI2hl1QWubnFQt6y5c6BnyfchNIb04uHICuEbLWMtW3oqI/C5EIu+K5QVgqXk
	qME0RkgcJjwQpByK8H5cS28W/DgJdXlQa5CEL0iLKK5AV8PLMwK9MS544hZG/7Pp
	YzG1GUl9O7tczvX5rvXW3fIGfLcVfCkTmYUfDDyUDO07Ki5UfcQLpYANF7iMzKHO
	DLl+AQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a8apgr1j7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 17:19:17 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-33bbbb41a84so497028a91.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 09:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762363157; x=1762967957; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=d2jzqV8oJZ4plosAL5G1y0RTbjdNLT/7KsDqWwEv4zM=;
        b=H+qepDgGjE7K5ZQ+ZtKWx9zonXDkgDl+ZHxpwj8/7SNbqQJfhkeelANCieyZ0ZLVHv
         9/D7WQ/AhhSvBG872McDqtBu0qM8X2tDwcrQt9p/WyT6vLd404buChK2tAD/zQ3NyM+N
         Ak/lBk6PgWKHkrVxTG6gDE8Yqvt5nwP95Wa9/vh4f3zpzNAMpW7O9gHdWmZBakiFbK37
         nI77dGyGHpuC/kckpbGa469wOlIx96H5R6GjASieRnC5WnOCjgqlGCqnXp7L99wH9hjx
         7CSKIGQVGyeMMXyYSZMfl5B0goWLfcaCPlOt8C297QREtAohhF33uSVTD6aMYS1C8iIz
         s8WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762363157; x=1762967957;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d2jzqV8oJZ4plosAL5G1y0RTbjdNLT/7KsDqWwEv4zM=;
        b=Y+GSLULeTOK6nN1UInBA/jPNn8O2gfvKZBSVfCfqy01zhbZ/rKTfgmhoCJX9/J20Ux
         8UE79+gdUo6JdQ18zraRDyFqg6WkP2pTOSOeDxCJyTdmG5DZZx2LO9Fe5fY8RBM76kFV
         E90B0jhoXuIixIvAMJondXkp0i36XgzRfSYKYD8VDHGx+auAS4Qfs0lpf069aP+3/bzv
         3e3rsGhiDjJX62X/PxYQM+bxJb/GMq3KxdeEnivTdafbOCxnAmN+/2xtOhBODxSvyLVX
         oAe4vwFtx8kp9VElMd97mVgoCpKf4o0pjdT4IoVEwmuYdnuu8JrlP4wZ5pkB3JsBkxwT
         aDug==
X-Forwarded-Encrypted: i=1; AJvYcCUJulfOOnEOOoY5GH2R+CEY/FB32acNu3AC5WyduEAXpLjzunsI+zt+HBj8/vl7WDNXzfAasOkALk73cUJy@vger.kernel.org
X-Gm-Message-State: AOJu0YwtsLpMQfNVGGIxVljuHRvnduFqJzlZ9XKY3tbwrVQ+fOwd9blm
	T6c0egq9tn3ZQ+AyMQKREuyVS73nk51R/L6TY0NAreVjT+3RrZRpyPLMXI0opjJZaP4bCAR+zFj
	zDfQ59KZmeN2XVLOBTInYNkomnvEzrW2EjFe6hlfPwKyoLOUavTX/5HDdSROYYqsZZA28
X-Gm-Gg: ASbGnctwmhxl5i5eHlVeNEhXC5PghPw+JPPXpUAQlxJXQHzkhXOIjmcMW+s//aCXABa
	G+prf64/b9DT/eagF2BCcFzrSAIU57/CSeMvN1QFCGY1mTJJeid3euz+oKEHCACohfEAHicBEeE
	tocpaER8njUjVhSZesOHiSJGHicfGKWyMGkiCewCx+NjliXd7kLIT3WKxPO5m4JHJsfy9L227Wt
	zWeU7jDoO+E2AR9S7QM0LvWna0NMIOwiCuYfxtQmEDDpCYlAsD6cEDheBIRg5NdkvfH99NIQBeS
	lRBuYnHcm2ON8fChkPJQ1wOBasMXyFIa4RlpDUDWRcMxXY6B+nTmvbp4K1sOBojmeZ07ivRfJcX
	xo/yT4zeBv7g7V/oT8+F7GQ==
X-Received: by 2002:a17:90b:3c09:b0:335:2eef:4ca8 with SMTP id 98e67ed59e1d1-341a7012182mr5029905a91.33.1762363156987;
        Wed, 05 Nov 2025 09:19:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFvzSRF+BBkWYVbOkPymWtRFgJ+GZ8PkUlrRHN+0DizYbOyTJnzSCGFEoQNIQNhQoPoiHhIfg==
X-Received: by 2002:a17:90b:3c09:b0:335:2eef:4ca8 with SMTP id 98e67ed59e1d1-341a7012182mr5029841a91.33.1762363156531;
        Wed, 05 Nov 2025 09:19:16 -0800 (PST)
Received: from [10.204.104.20] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1e7983986sm6231090a12.0.2025.11.05.09.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Nov 2025 09:19:16 -0800 (PST)
Message-ID: <e67bc77e-77f0-4744-a86e-73fc23dfa705@oss.qualcomm.com>
Date: Wed, 5 Nov 2025 22:49:08 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] dt-bindings: nvmem: qfprom: Add sa8775p compatible
To: Bjorn Andersson <andersson@kernel.org>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Connor Abbott <cwabbott0@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
References: <20250910-a663-gpu-support-v6-0-5da15827b249@oss.qualcomm.com>
 <20250910-a663-gpu-support-v6-2-5da15827b249@oss.qualcomm.com>
 <8ff537c9-efa0-4aeb-987d-150bef8b7c00@oss.qualcomm.com>
 <bkhjgw4mtfmkatxjl7enn4fqqjbutealhaqgxihdmcvhekyyd4@lsosso5ta74z>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <bkhjgw4mtfmkatxjl7enn4fqqjbutealhaqgxihdmcvhekyyd4@lsosso5ta74z>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDEzNCBTYWx0ZWRfX1ERJWMYrsZiC
 7Ww1wvGKGhNClBrwj2enwWwbohm+eTITQqKtO5aKKUMWSphZ8K9FdVg4TNrvOkBc1gqf575CiAR
 f8ccY9bnigOcTfGwp0ETaviNTRCpAIS4vimUJ8qzRJ7EV+C1oE2OEWT8KbjJlQrVilcfn6IFvOw
 LhBixEhORQAfB4gw7oScqVq21LkgczZfVigmJCUnqjrJtkr/vKgHz+G4Kbp5QRDLK/L6IiEbSz7
 WprbpmVN9sKhHPihB08BbrdAY43gNBiA9CPJ7pZ4HiF9MRA0YbvnJA4plt5xnIVPwQMiPRwHkUz
 YDgQE30wr+Z1lfWfr6f5pNPTmgqEDaQgVAWsqZK68ZpZbdmEKFTO1LzwYWmrO49tZf0p0ocR7Vt
 F+nGumCjvjDhQ0y67ACzDmR7QjcUBw==
X-Authority-Analysis: v=2.4 cv=LoCfC3dc c=1 sm=1 tr=0 ts=690b8715 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=kynJYrAj6unHVJukPU4A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WA3noIxNiL4eZsK0yjQ43vkU1Nlw_-e9
X-Proofpoint-ORIG-GUID: WA3noIxNiL4eZsK0yjQ43vkU1Nlw_-e9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050134

On 11/4/2025 8:32 AM, Bjorn Andersson wrote:
> On Mon, Sep 22, 2025 at 12:55:36PM +0100, Srinivas Kandagatla wrote:
>> Hi Bjorn,
>>
>> On 9/10/25 12:25 PM, Akhil P Oommen wrote:
>>> Document compatible string for the QFPROM on Lemans platform.
>>>
>>> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>> ---
>>
>> In case you plan to pick this up.
>>
>>
>> Acked-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>>
> 
> Thanks, it seems though that I missed your reply earlier.
> 
> Please pick the binding through the driver branch if you can, then I'll
> pick the dts changes.

Bjorn, Srini has picked up this patch today. So it should show up in
linux-next tomorrow. And I have posted a rebased version of this series
for you here:

https://lore.kernel.org/lkml/20251105-a663-gpu-support-v8-0-62a7aaa551e3@oss.qualcomm.com/

-Akhil

> 
> Regards,
> Bjorn
> 
>> --srini
>>
>>>  Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>>> index 3f6dc6a3a9f1adc582a28cf71414b0e9d08629ed..7d1612acca48d24c3b54c4d25fa8a210176d3bb5 100644
>>> --- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>>> +++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
>>> @@ -39,6 +39,7 @@ properties:
>>>            - qcom,qcs404-qfprom
>>>            - qcom,qcs615-qfprom
>>>            - qcom,qcs8300-qfprom
>>> +          - qcom,sa8775p-qfprom 
>>>            - qcom,sar2130p-qfprom
>>>            - qcom,sc7180-qfprom
>>>            - qcom,sc7280-qfprom
>>>
>>

