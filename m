Return-Path: <linux-arm-msm+bounces-56802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4ECAA9558
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 16:19:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DC6CE3BB93D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 May 2025 14:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA65825A349;
	Mon,  5 May 2025 14:18:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4PAbizK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1158125A338
	for <linux-arm-msm@vger.kernel.org>; Mon,  5 May 2025 14:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746454737; cv=none; b=qC8otAlfMdxDP8+I3e1jBQ94etsdrjZgO2aAtoN3aWa7YZds4+Z3qNRoYr4AnxEZhF+yDVRQ7guXrMWYL3O6iPIsyeFbkUPctqmDQzdYIrC8sfOOZAkCY8TnQuytWo1wEZVnjj0AMUoLBTd0s74lWM2m1mlTi8TXKrG7714ZmD0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746454737; c=relaxed/simple;
	bh=3Vf+AaQhANAKR4iErxV8pfkN6oisAXDi42nAcHc040E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hnk8OPmCcJoVHNpHw0T/W2pEuStIjb24s0rhiGuJpwKFzHMh0uDOFkGoq82ebqnsP9uradyBu7YcTN91OYzO1WufJCMrUagMqwhVtBf0UFM5bqP+FuaQICqsRYpREEhvNIT/53O/8jjPvNBCYCQXK7sFiU0apTzFBKULb4OBWm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4PAbizK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545Aawrr014122
	for <linux-arm-msm@vger.kernel.org>; Mon, 5 May 2025 14:18:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4OMp8lVlfqOS6nQjtVYiy+vsTT7GaERnrIvMt0I4OI8=; b=b4PAbizKQdgKo4Sz
	hAnB7gq3XzspJ7yxkI0rAfW/7gt8MI6H80NV0PqEJqNV3uxySOCpIdYv4a0kcI2M
	g1H+XyC3/zZ8nd+XzuT6p7yv5WQH3G5GZtwy8+MHRWRMP7nTsg1OhRLVB8Ao2Q2x
	LkOtxTrcjQC+ePkmFGRmr3CN7it78qUDiXOhLLNJydEezJTaB/wbSUgoAEn3EOEG
	rKFYA+c7uVYVYrRyokY177Tx7LL2A80L42El0vWjD1xeGlYr1oHgT2qD08MrheoD
	BeqGEQ6MFyy3CrqaZ4pB2puT0olee4bxczYriQ4HokKGlV5XmOK/jOHNeDjjVuKv
	NniVyQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9nkvdua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 14:18:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5f876bfe0so765800285a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 05 May 2025 07:18:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746454734; x=1747059534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4OMp8lVlfqOS6nQjtVYiy+vsTT7GaERnrIvMt0I4OI8=;
        b=or7t9XLfASVBPMgOeMl48lMarR/5esWcWOupYSeUPn2UDc0PEcajyLAf/P5+Z8/yR7
         HE81XyHExM45lq1ciFULwa8sV5V7GED8UAJRkcV1PNPxHE7TQuNjw9Rn9cNqg6tpR3Hk
         RjQUmJKm8phFzDq4Mk6rmv5/TaOEYLraKlVz75sT9ygNgMtQz07km98U8HcHP2TD87MH
         A+ydGUrfyvEYO5Z/1zNXYCw4hV8yljTzovliFflTGgEC3WyiRlL3GxJso1LpTtK061ZE
         SmDH9VMzEdRfGP0AQ5kDSiYHB3Lldd9kXY/ntTu95z7LKd0csHt2FPg7HNDxyHEMl4GU
         ayJg==
X-Forwarded-Encrypted: i=1; AJvYcCVjmJ9yd80HRNK5wDT8qH0LIYEyTiEi/c47jn21KES/7NNySP/g20/gvvPI1MJmvorCXtrmMFNVXk6HEqQn@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3K0V//hy2aLf96IhmfsnVCF80EA76e1bDcDlozfjzKSDL3fk9
	YqIxoylyFRTtj4M4VLmmb1RGsv5BFInEG5TF/gJP1VHeAeiGSPkIaKrhPDr8n9G6Txo0cf4Ns+6
	21AU3+jollvzA+ifUSVivNYm01xH1rHrlXZnfXTwIm9s7XUsoLo+H0iuaRWn/Tiiv
X-Gm-Gg: ASbGncsN+y+OSdSc0Z3cFSfkgRJ0oLShXRed+Nl9UXqKtYl2LzcLD8sFm/2aqAkQ7VQ
	CCptb7zeDYOcau1DW4KXc7c404rsb0JHG0M5Ghn7CoTuvXMlp0V6+eZ5fFSC/yohHahpXOPFN1N
	aOhvZdM2/nykHQG+s5gzp4gKk3bkAAcg1wdT1a50vXRgiyLFRLn+BTNirJjMv1WEi4D8WNzG1Aw
	eLYFNmBOhM9j5+R/sPXo2gdRGwSoJ078GMxDfUUNyLIw39NvGWwI++IHMgWO6vbCcT5KeUsQkYH
	0/ThUzSdJIWMYNocGF0qt1/58hMB+aO8Gtp7ddjlgopo8RGKPjoNkYwDJWIwnus4Ysz/A53UN4K
	gws3rVSGZnvUaXHoPE+4hRMXcsDpkVn67N1CxsVD3HqOvM7lf52r+ftsWjdhTm7aYRQG1
X-Received: by 2002:a05:620a:1a0e:b0:7c5:e283:7d0a with SMTP id af79cd13be357-7cadfe15ab6mr1528031185a.30.1746454733846;
        Mon, 05 May 2025 07:18:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxLIuDmlMk0BDjjG/jcKroZx3ooAtnxfCFD86oCFhHuF1R3mpWcw+w7OoB3Ift4T6LrXoRzw==
X-Received: by 2002:a05:620a:1a0e:b0:7c5:e283:7d0a with SMTP id af79cd13be357-7cadfe15ab6mr1528024685a.30.1746454733441;
        Mon, 05 May 2025 07:18:53 -0700 (PDT)
Received: from ?IPV6:2001:14bb:671:42db:147e:6740:cd7c:7688? (2001-14bb-671-42db-147e-6740-cd7c-7688.rev.dnainternet.fi. [2001:14bb:671:42db:147e:6740:cd7c:7688])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f2043sm1707308e87.179.2025.05.05.07.18.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 07:18:52 -0700 (PDT)
Message-ID: <4a186d4f-9966-4569-bee2-77e237cf0c54@oss.qualcomm.com>
Date: Mon, 5 May 2025 17:18:49 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] Various dt-bindings fixes
To: Rob Herring <robh@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Robert Foss <rfoss@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Christian Marangi <ansuelsmth@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        Kyle Deng <quic_chunkaid@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        linux-usb@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250306-topic-dt_bindings_fixups-v1-0-0c84aceb0ef9@oss.qualcomm.com>
 <174637445759.1385605.15383087742490646226.b4-ty@oss.qualcomm.com>
 <CAL_JsqKr8Xd8uxFzE0YJTyD+V6N++VV8SX-GB5Xt0_BKkeoGUQ@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAL_JsqKr8Xd8uxFzE0YJTyD+V6N++VV8SX-GB5Xt0_BKkeoGUQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzNyBTYWx0ZWRfXzcky5O0EvzPl
 R/c188CR2oZVSo0P+Ss6yNB0CuHaIq6rMONdQclyEjks/iVMdpTHeLa8Ni3WMvBXfkVwI4fuwjT
 FrI6rhMw5hDYjOnw7jkz7/PZFluIul5vsFqA46i50x3BAt7L4dZXn48ewdhUdttisLI0x1XOXhl
 f2tV04c8Ux6KGoM88PMlfBk9FIAF3s/vyj9XXK3f14AoRJpkxfU30kbquYmO7IBP3j9VhOsW/TV
 t8Xq9un52kVzs4sbu/29WLvhVk5iAFVrnWE92UklTCDqDW4TBhpkGSyr5Hmj2lIfQ7of1crekLK
 o5zgvf8NWPQGlSWaEy1va/3xCSprGsk1uOme9lw8ZFJuQBl41Kx173EKnhb5TBF9B3YxYEPxkJ0
 HODs4rLpjGTTSJHgnHyNqlE1PT28UvxuxPpkAPv/5ZZfrYR/NQOGubiEui20TbfwUKK+vMzw
X-Proofpoint-GUID: -Nr_ZFb97D2M9edCXmODGrwbR81oh6GN
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=6818c8cf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Y8Lu5Vov3j2QtJBI0v0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: -Nr_ZFb97D2M9edCXmODGrwbR81oh6GN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 phishscore=0
 bulkscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050137

On 05/05/2025 14:56, Rob Herring wrote:
> On Sun, May 4, 2025 at 11:13 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>>
>> On Thu, 06 Mar 2025 19:11:12 +0100, Konrad Dybcio wrote:
>>> A set of not quite related bindings warnings fixes.
>>>
>>>
>>
>> Applied, thanks!
>>
>> [02/11] dt-bindings: display: msm: sm8350-mdss: Describe the CPU-CFG icc path
>>          https://gitlab.freedesktop.org/lumag/msm/-/commit/60b8d3a2365a
> 
> And now there's a warning in linux-next:
> 
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.example.dtb:
> display-subsystem@ae00000 (qcom,sm8350-mdss): interconnect-names:
> ['mdp0-mem', 'mdp1-mem'] is too short
>          from schema $id:
> http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#
> /builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.example.dtb:
> display-subsystem@ae00000 (qcom,sm8350-mdss): interconnects:
> [[4294967295, 7, 0, 4294967295, 1, 0], [4294967295, 8, 0, 4294967295,
> 1, 0]] is too short
>          from schema $id:
> http://devicetree.org/schemas/display/msm/qcom,sm8350-mdss.yaml#

I've sent a patch fixing the issue, 
https://lore.kernel.org/linux-arm-msm/20250505-sm8350-fix-example-v1-1-36d5d9ccba66@oss.qualcomm.com/

-- 
With best wishes
Dmitry

