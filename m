Return-Path: <linux-arm-msm+bounces-79684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63098C1FFC4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 13:22:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F32B19C4F65
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 12:21:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4C8B3F9C5;
	Thu, 30 Oct 2025 12:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aN2y5qTR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hv+pWHew"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1315929408
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 12:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761826872; cv=none; b=emNnTEIwFZfWPGA1nvECTy5wxbSzvkJWSPlljLbA/v1yq1usX6ITRk7iQw1JQnvbyD9Db7+m92xxZi96Q5IKEkpwmkpTt8vgqxuFaddoZri61qbGSaaWGjG4utHbuosGKOCvgb/FaLbHWM8BR3F8+LxQjnjJxYTd15lS48Y6xKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761826872; c=relaxed/simple;
	bh=BtClwc/SBf8PtBQY1f79oGGMCj6JUP94qOT273TptgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=seEbl9u9waDy/x0DGVc/Fv2TfhgNecIX0YOsPxYgsWAeP30j8lw+zoliFDtDpSyFLoO6hnpau1okYsWh9QItVIUspLvSxDb7nTbslmPiD32ESjDgX1nSVIHjSSpvy0pVHf5SFfPOHi7PF2qCXx/zVJutNw6Od0mPJOdcXjGLyCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aN2y5qTR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hv+pWHew; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59U7lgMP1697216
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 12:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8u/d9fdIaldMlj+IUObUL1xUVuajEoWHiVt1WYY4+8o=; b=aN2y5qTR6+HqHbGk
	1Sz3ZlwyuWtpaqPQyNOZWA48XBHZZvnXK0/pltTCzLseexL/RCUQiGEl6sBnkRb3
	mKhLumvuW+9M3UdTFDFZTzqBp4xUaVnjub185VOxg6HLx4K0fED4jvykRjEA9iRG
	Pt0xVaVR/5kWWPJ9loKMnOFauuL0yWc+kPGT1o8OSu5YZUFJzj1R27/c4YcaJTsL
	pK+ssQC8i4QKfIQ85gTiOBWRXpUNJgeIcyJAHvPqR1CA7ZCCOBXkmE8sS/0/lHkH
	tx1GTqodp7jpcGbmXloZb2vsuPW8L0vEbhm585peptBU2h3goNyB2OPmrbWfp7lr
	L+EncA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a3trv28mg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 12:21:10 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2950509239eso5349825ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Oct 2025 05:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761826869; x=1762431669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8u/d9fdIaldMlj+IUObUL1xUVuajEoWHiVt1WYY4+8o=;
        b=hv+pWHewUIBDHriTHrsnPSopOIgsAtXlmLo+XvNyDwc/hRDqkpEFNFEm3d4nK/8gwM
         urtPMtkox4nQsq2h37SCOHcOw1ktxfE3GfmjP1Uh4jK5KnMZ/1Go83+Ed3mcG4K4YpNJ
         alQK4HJT7Um/MksWtUHux7NYXeLxu7O1eFOA/olSWc9k1ZAYhovz3UO8zU4+S+CPLHP7
         gsYDud1HlZmddrUHY2FEek/p67BxLyGMvuDwsVeiOfcuLxHg3wmZZyK1TbrFdAXV2fND
         AUD9Uhz2sUid/NV28fkYPJNeZkH82IgErWCRnPiQwutUeuHeop1bDrIBlZ6/4J/v2LCl
         clBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761826869; x=1762431669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8u/d9fdIaldMlj+IUObUL1xUVuajEoWHiVt1WYY4+8o=;
        b=VDZSKdD07HPYAyqdcW/GEzL+EcVIKr48QDwcg77mU4z6yAnFyCyLerpCMuVRHjR9qs
         hHT0U636gyFbLQorLwDj2rv+wKeq5h0c6KD1WbHL1Y2FvkTROuKxFrzqOcmHWS/B7t2Z
         l0SsR8NkJwnG7CgDa0QIWjhB4ljIjfohKroe0FjW5EV3svZ8GGqhjtPlhyCRfV3cA2iJ
         6lF1N7n2dJHs9jI3SMSwSb2ffXjOr/rwO+6cx10Bg+ZzSVA0f7IAAAkBXkBIe+AuRFMe
         RBPMXfbTcqLfzNeKJm0WE7O2dtNhUs83HNWce6/PhllsMTJ48xsJVV/1d7sF6njsnBBs
         +jQA==
X-Forwarded-Encrypted: i=1; AJvYcCV4+kapLW+pQpBEUE+HB5bZSN7lVQyuWNY6DgB0tdepcNa4yMGVvDzvg3O1a/qFRnI/i5w9He/WRe78coau@vger.kernel.org
X-Gm-Message-State: AOJu0YwmW3BeN3AwwuKMXCiE5RhVHLImbfC5E7XLES06RasbOHLuC2e2
	RO7SrhwSsj+GeWXUyfC6ClJA+DlRMNWRoMi4IFR411jsYNtkaEgQg2Luasv/JM3ol972Wyq20t9
	1VfnNybvvFCxXkeogq9SOKLg7V4HOCqVnTJ2vwmBPdzCgCNQfCDk3RM2p3Hvx0N0sgiQJ
X-Gm-Gg: ASbGncvLDwkNsrygrQJaDRx7s62Tj71hfT7kUDjqsqfzU0aW+8ofxXlbm7RfyIvCdGa
	VJsxoD3oCsUgB4jkvJaqbHo5c3OEb4VLhM2WxGbdAEcvqgeU06kig0RzvN48NywvrKq9CtEsXZj
	b9TraapTAM/73xPl/Gh9tAJ4Um0BUpxM7+iOVqVM/6cVhaA4c6xVqncXsv8ZLNY5cFHQRfB6rZJ
	cLeYBE3owad++CILZbQTfZraQS1tNnr8135L8Apm4onqJA48L+DZVIxUEnl4FMN4/AY4SrKzQuV
	RMEteyRnc1mGv3kKs0ZhEGQwZOHb5zaYGv2tAwuazbOticqOsJ4YB0ls5SKfLONoQd78TXJO+EZ
	/3y/OMGhYMXyz+HVp2+3X3TuuyFI=
X-Received: by 2002:a17:902:c403:b0:246:7a43:3f66 with SMTP id d9443c01a7336-294edb935b2mr38687005ad.7.1761826869175;
        Thu, 30 Oct 2025 05:21:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH9a+1g/H7YMX8/5719QDerZeZz7R1O7nnHZuhhQfmWjkfEEoOVbjmAyEBhWoR4OGVkuIGDFQ==
X-Received: by 2002:a17:902:c403:b0:246:7a43:3f66 with SMTP id d9443c01a7336-294edb935b2mr38686465ad.7.1761826868367;
        Thu, 30 Oct 2025 05:21:08 -0700 (PDT)
Received: from [10.204.79.108] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34050ba1472sm2466032a91.17.2025.10.30.05.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 05:21:08 -0700 (PDT)
Message-ID: <58a658bb-7338-442f-ad8c-845b5fa5ce00@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 17:51:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC/WIP 0/4] arm64: dts: qcom: sm8750: Enable display
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        jesszhan0024@gmail.com, quic_rajeevny@quicinc.com,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Abhinav Kumar <abhinavk@quicinc.com>, Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250424-sm8750-display-dts-v1-0-6fb22ca95f38@linaro.org>
 <w6f3s56gx7psqgweuntqvkzrot7elhc5pdrxhvenukzwyt5eys@fndmaszfbo5k>
 <921afe20-42b1-4999-b5c4-035669dc831e@linaro.org>
 <32eb3b4f-b2c4-4895-8b48-ade319fd83de@oss.qualcomm.com>
 <CAO9ioeWdJpKfpu3jGyv42Mf5+02ehxyEu_Lj+Boz0NyDjPZ-CQ@mail.gmail.com>
Content-Language: en-US
From: Mahadevan P <mahadevan.p@oss.qualcomm.com>
In-Reply-To: <CAO9ioeWdJpKfpu3jGyv42Mf5+02ehxyEu_Lj+Boz0NyDjPZ-CQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: YzBcHLtNowkenaePn81XFcDCmUVAxnbk
X-Authority-Analysis: v=2.4 cv=D+ZK6/Rj c=1 sm=1 tr=0 ts=69035836 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=RTWzoQZwi2ic3pXUtg0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: YzBcHLtNowkenaePn81XFcDCmUVAxnbk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEwMCBTYWx0ZWRfX4rZBPXFfZsw1
 LY+jEtUJRvusUAY5Vd3nf+kVvjK4QtreynCyPAKZMLaoglK13vtBkJNmxdblzcDe/yP9m/ltP2t
 zZ7YH0+UKOTDmkk5GDP3lDjIVfqhVYMs1bkDFiM/lP+cDGyV9p2DUUOIu7ogcR5sv7BzAPhLG0i
 angJ7k3DdAKwJniFtd41C2kZyIWyXvy17z3gZ1BHv/QvGhDs3mYZvf2DevMLgEy4f3hyNSfhVa9
 /m/actpy+0eckFUrtdVIPqtiFKqXu3erVR3oPpJrndDzmyH1dywvIfrAXPvNrgne5PkIWRbEvs9
 q/NIMWrlUypdnlMed8v1I2+QvIK4qFDdHVrIzIYjXwIX7jLGYsxgCe7lEE59y8hzSKtMFayN988
 OnhWV1kO+Ye86KeLjArSKBm8tkxmbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300100

Hi Dmitry/Krzysztof,

On 10/30/2025 4:46 PM, Dmitry Baryshkov wrote:
> Hi Mahadevan,
> 
> On Wed, 29 Oct 2025 at 08:20, Mahadevan P <mahadevan.p@oss.qualcomm.com> wrote:
>>
>> Hi Krzysztof,
>>
>> On 4/26/2025 1:24 AM, Krzysztof Kozlowski wrote:
>>
>> On 25/04/2025 21:34, Dmitry Baryshkov wrote:
>>
>> On Thu, Apr 24, 2025 at 03:04:24PM +0200, Krzysztof Kozlowski wrote:
> 
> Could you please fix your email client to _never_ send HTML emails.
> You've destroyed all the quoting (quotation?) levels. Your email was
> caught by the automatic mailing list filters, etc.

Thank you for your feedback and I've updated my email client settings to 
ensure only plain text is sent going forward.

> 
>> We at Qualcomm are currently working on bringing up the DSI display on MTP. For this, I’ve picked the following patches on top of v6.18-rc2:
>>
>> All the DT changes mentioned in this series
>> [PATCH v2] drm/msm/dpu: Fix adjusted mode clock check for 3d merge
>> https://lore.kernel.org/all/1154f275-f934-46ae-950a-209d31463525@kernel.org/
>> [PATCH v2 0/2] drm/panel: Add Novatek NT37801 panel driver
>> https://lore.kernel.org/all/20250508-sm8750-display-panel-v2-0-3ca072e3d1fa@linaro.org/
>>
>> However, when testing with modetest, the panel appears blank. I wanted to check if there are any additional patches already posted that I might have missed and should be included.
> 
> Any errors or warnings in dmesg?

There were no errors seen. only panel was not lighting up. Got unblocked 
and able to validated modetest on DSI and working fine with this 
workaround on linux-next
https://lore.kernel.org 
all/20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com/

> 
>>
>> Also, I’m curious to understand more about the DSI PHY PLL VCO rate issue that Jessica had narrowed down—could you please share some details?
>>
>> Lastly, I’d appreciate it if you could share the plan for merging these changes upstream. We’re aiming to enable display support on this target as part of our program.
> 
> Please see Documentation/process/, I think it describes the process of
> merging patches pretty well.

Sorry for any confusion in my previous message. Could you please share 
when we might expect the next non-RFC version of this series, 
specifically for the DSI enablement patch? Alternatively, if there are 
no immediate plans to post an updated version, would it be acceptable 
for us to take it forward and submit the subsequent non-RFC versions of 
the MDSS and DSI enablement device tree patches by adding dependency to 
this https://lore.kernel.org 
all/20251023080609.1212-2-yuanjie.yang@oss.qualcomm.com/.

> 
Thanks,
Mahadevan

