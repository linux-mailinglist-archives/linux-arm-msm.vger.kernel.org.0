Return-Path: <linux-arm-msm+bounces-89704-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 80427D3AECE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 16:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 92730300E8FF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 15:15:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9CFBD38A2B4;
	Mon, 19 Jan 2026 15:15:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CRciG0ib";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S77EaNKO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C76369979
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 15:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835702; cv=none; b=NFgv2oQjIGVicdXZT96Hv2o5efxw7YsO1Rf4bSxDOLXpWkZd2+crRQd9Ybk3hgCZ95O4yps9T/NihmSAc4pD8bdcVBaYai2rwRPhGnVqtn+UvE4lYUr3T93yhjqW/W4ETOyghkLJ58rKEcrqyopjwg3ScSSc9Y19sW3BzCNoVXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835702; c=relaxed/simple;
	bh=Z5NzLRTKBasTAtzUcJeifItadjOfUoL8l/s/S16MFJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BmaGhui6ry1tsqEPkkBm//FcvK+6FzqySTa4S30GSoVkArOnX2LUEXb/Gx959VRKREsxhUWUhABTAEL2fe1aJiAMzCKLxbXhYiPhO6X4X8s4845pMF6p5m3Wq2ub7UYwFOHFuceybAMD3CqOuYFCEUX/WaPfvGjJ3/ZYHkHpF4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CRciG0ib; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S77EaNKO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60JBDNEu1440849
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 15:15:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RgfcSAgwHvJnYt7WupVTbKfbhUvgAda4QTEtoBlpMAY=; b=CRciG0ibo/b7wt7x
	ukUWBxGnno9TCx5/e9oTXRBMtiLGLyRJq1Suh5YsO+ATUJAP45RxDkC81PSWPxFG
	f/gYvQLl4L2uwieNRsmnuRwb9vKItWrHBjolZfvkkvlBPxQZOQeB47P1rNud9yKw
	PWIcqwtLtVmMe0Jx4w3RIKNbuLtsKJM8mbued3BN4nuaKRbN3hQI5PRQsE6EgRXx
	gyEX3VNI+Z0tPn9IqQt0YRkkKThw4gxCcIvzU1ZyXSprIyEZ8Gv9l7bSQ+clCjWi
	9jExrXqc3lmp9sWQCPYg7pO6cLjQWqlLkRio/bBFMIOfBjrk+DGekJ/cU54bpshU
	RR29cw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bskj3gp0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 15:15:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a182d4e1so109538285a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 07:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768835699; x=1769440499; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RgfcSAgwHvJnYt7WupVTbKfbhUvgAda4QTEtoBlpMAY=;
        b=S77EaNKOiIOtLvmBUtrLjazDEi6tX2a46yMRGe6WR4i/5ZKgTh3rGWTjrQXD5lw6n9
         9pV3icKpSmWCSwSJUV8RVEfx6NLCSc+BpUbBTc2o+l2vke19s+Df6Fgo41xU7brzS+Wv
         W58rj9U/Jb/FIbamjeAp6WHjVL80LHcfe8I0DevbGfhQsK3lLhPdp6pU6kyDT5W2sFee
         sr5WCzwkuhXXGezMG50lyfVyq5FXYMBeyZKaOwS9BjiwcjgIfF9sSOJp1nrCGOJUQf+J
         vrwyg0aHZOft2qtX12TmHMRnWPPTmymJnu82gMDhqWCXKXlSKxNnS5QfduDKPjdNA38x
         O9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768835699; x=1769440499;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RgfcSAgwHvJnYt7WupVTbKfbhUvgAda4QTEtoBlpMAY=;
        b=foUGmSDrok2yWb1+SGrkQJgWQ39WB5jbuGFayRnPeuK2TjvC/kPYjrdVtAIeF6ASNj
         J19EHzRbtNLJL5Xe4tk5vWvYxlL8c+B21rqBK6ZvE9lGBLEjUk0sabjDofHf65ydWZ4T
         87Ck8GQ2M61/zc40q8mq7rULFOUKR82H2QMDxIXOUN/4o8+ra+zj0TKJlDxlhwK/l3rW
         WvVzD6A68A+WUsCRK1ePQYBQA71E66A3xTEcHlFNq02G7A8vYaS5rWFnnmk34BA29BXI
         Y3tbo+er2tvjqhnIgbtVZBpnqY5gdhf9KR7hhPLvdg5lYsSciFXNT2F+CZTKJMjQBhLC
         pn6A==
X-Gm-Message-State: AOJu0Yw8lyyVWOMWXGyICKELqJ34fB4pyPSal3zcct5qNtStUQ0JwZ12
	NwsEIRum3vGMEf3zaXioKf3BO0hwvJbNFdUsn5hA1DsHDrhvSNH1fmhgOb4p6uw2+Ezr0DK59Oo
	w0lvO3jCs0YVk4A/gLf8fvPcekQ6kxuNIfN7Hc5c+A1IO6JdExirK5mMQwol4O8aFSU0y
X-Gm-Gg: AY/fxX7dc5kF7NFSHS84hmbmYj79GV/qXPVLjiNURLHiWoVB2BP7yQXTDzTVNbSN7St
	bwB66BXF6x+g8yeV6CTNHwUS2W7AsR3J0eHbPHvuekcBhIRC1fH3RPZgiazGmc473Xh2QDuR6kg
	rc6TwrSCFZKNjmv17i0RLAf9PcaZJeYLk6XF2NoUjSmsuQ2cmh8rN3prP4dNYoQhPwzRDUDz/bn
	R9YIj/fUkgByeM1rK4ZctJiO0G0/tzAn3WSORk4VUPZADiT0o4HL0nujkwLZG9BkripQI6d1oBb
	abJa8IgtnQdY4Qj8YOypv8rKRETH5ME/bPaP5wqr4I7SXDLUT59tHm3VnmnuqFuLmCmRXcE3fUS
	qoyoCmi9ZcigtH5BLeHPtC1hL2N0yS67mLuUFhwfZKKGfiDnYAW+v9alacn7Y1mCkalk=
X-Received: by 2002:a05:620a:a215:b0:8c6:a719:d16f with SMTP id af79cd13be357-8c6a719d1a9mr1078660785a.4.1768835699496;
        Mon, 19 Jan 2026 07:14:59 -0800 (PST)
X-Received: by 2002:a05:620a:a215:b0:8c6:a719:d16f with SMTP id af79cd13be357-8c6a719d1a9mr1078657885a.4.1768835699020;
        Mon, 19 Jan 2026 07:14:59 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795168ca9sm1118682166b.15.2026.01.19.07.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 07:14:58 -0800 (PST)
Message-ID: <ede201f5-fd27-4ac0-b524-638df7c412ad@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 16:14:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: phy: sc8280xp-qmp-pcie: Disallow bifurcation
 register on Purwa
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        YijieYang <yijie.yang@oss.qualcomm.com>
References: <20260119-topic-purwa_phy_shutup_warning-v1-1-997a692b31c6@oss.qualcomm.com>
 <8ea2358b-00e9-44b2-acce-777863e8688e@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8ea2358b-00e9-44b2-acce-777863e8688e@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ds7Wylg4 c=1 sm=1 tr=0 ts=696e4a74 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=TK7EAqwxfNejasLwrscA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEyNyBTYWx0ZWRfX7pbfpJbPXtk4
 oNivZxyN7Xt68V1NylPCcGvrs5YvRKlEoWZsZZ/9WFcBTlyuvXCmCyJ4HXGIs78Rg7Y4gDY5cPZ
 UcwmvQCT5/gPhJBClCCBCcua5ghugftq95SlxUdLmYH6IYPu3CyXM2ffvI5piyIUj42t6eMnfOJ
 SZGuMmkM9gMA4sumbm77iJjKutUzYmBztl8yq/SZgKEu4jExS+w0NROP7RDrfrgBS/J7/20SfL4
 kMMRrrsLnLwIm/GlVOfvtASGyKPrkUrMmizpeNclphfCkc97GDgPh/sYLLKKpgZLV02QWrr5Mtl
 vbRJdogmmLjqfbwv1rxwKoucVaGDZTb8l9beM6UUvIih3xNHRdbya3GeY+fr+/ztVxv388OKOBi
 XymXFUQk7EvG/IWfU29Ym0zeJpLMs2Rf6PX/G9N21YiXCAHf/OPMlBVVmajxl12vdBaA5tADCQA
 SM2a1mbmnWCjAzx7Luw==
X-Proofpoint-ORIG-GUID: _U1eSy21LfqKRbuz_XvmJjaL-C9Y3dLY
X-Proofpoint-GUID: _U1eSy21LfqKRbuz_XvmJjaL-C9Y3dLY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_03,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 phishscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190127

On 1/19/26 3:50 PM, Krzysztof Kozlowski wrote:
> On 19/01/2026 12:48, Konrad Dybcio wrote:
>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>
>> Neither of the two Gen4x4 PHYs found on Purwa supports bifurcation.
>> The PHY is however physically laid out as if it were to, since there
>> are two separate ports (A/B).
>>
>> Split out a new if-then block to un-require the bifurcation register
>> handle to squash this warning:
>>
>> purwa-iot-evk.dtb: phy@1bd4000 (qcom,x1p42100-qmp-gen4x4-pcie-phy): 'qcom,4ln-config-sel' is a required property
> 
> Warning does not exist in the kernel, so please do not reference it.

Only because no Purwa-based device enables it, so I think it's valid

If you really want to, I can resend with that mention removed

Konrad

