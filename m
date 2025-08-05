Return-Path: <linux-arm-msm+bounces-67784-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD0CB1B373
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 14:31:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2A0547ABC05
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Aug 2025 12:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CD1023D2B4;
	Tue,  5 Aug 2025 12:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SS92I8lU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CDED21767D
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 Aug 2025 12:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754397062; cv=none; b=G9guDbJKQqrG8H1iDSfnd+mlAB//FLR891EuxvVatnWRp74LOLk1Q07VEJ+DzWKc4K7N6GukoKKTAzqK8INtGESeKueBhhd92HRE9gy86cQ/igfaHCobPQgFYn1O0zFJ7dl4Ww4Th+RS/ZBjmas0ehcxR3nrwH40yLtMiAm3R/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754397062; c=relaxed/simple;
	bh=QcRSA3ObR5miAp51l5eibI2C+rqXlRUN/sFaHZCntdo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GgaV45aSNC3VdTJr1rW5AcnbySjFZ5namPxIMppFnkBw5AOBV5yXS5iXs/QmM1mvxHo1gegUiSbXJ4JMXi0pOmP0rZGTZniHM1983OeFB3Nca1RJLuK6lRl/K+vciaJApAwVonvP9CXFSw7nO0302xmWRNuYt4bPedWfDMq296g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SS92I8lU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5758iZIn002457
	for <linux-arm-msm@vger.kernel.org>; Tue, 5 Aug 2025 12:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s3le+/lRo6lFhwerueafNlEHaf5TdAoJ7u8vQoJNvQ8=; b=SS92I8lU9d0zXZtg
	RJECfIhtV2GhFJG/FsrlurugPbzRKZ405XKz/BWvRpRA56QqFMIMF67KXbolHmvR
	Ef3K5F/zFmkLVBt8fqJ3KAmwMpKo28CR2RxTS/pLmzVMYNl2xmIGqYJbpz/6TY48
	HuHot+MnS8zqWQzc05ZvIUlzbMU9/UXJPYFK5PAB9ujTIpwFepIACUT1Fpyacwjr
	M2xO+DiH7DSB2JO9eu8ZRe2GYbdmIa95AXOUv1nk8oPyqetdr4qLAmw7/vjHsiFL
	CC/pcSs+6hSm0YrXZKhlnjg+WFhvEo5zSoWIn9wLaR0uBpJSWmxWcQsIQGBv26wR
	A4kE+A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489byc8dxv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 12:31:00 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7e48325048aso116191685a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 05:30:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754397058; x=1755001858;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s3le+/lRo6lFhwerueafNlEHaf5TdAoJ7u8vQoJNvQ8=;
        b=AkRqIEiWuV9qFoGiYW6GthlvUx/hmkIBH5VoM8QLl3LyC7YBy5N9blCyWDpOsvnq3i
         YkTg2ozJXrZ8k4RziN3/phYGMQllurpzV8hp4+Yg28TC4KptMNR0JBlNB/DnCL2m1TH4
         J/BY5EBVrdgWDp47UnH1vAsOAOj3GKMw3X6Np30NrJU88YdYR8trAPxWq4DGKIq5PzpP
         YYUyeQ0OpoIz4mFyfRv+0YvBqiSkLhOHYkqnC6JQt9OUMSRvN96DSIHHMUVsP0tNevZp
         zHz2TGQ8zXQsh/zfoXJACg27xRhppjcVPR3FEfgYRjdyJydhGZ76VbADJpes0ss2iJUZ
         uMXQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4lFGk61HIB1z4bgNN7uDI4BW9TK7tD7A7G9Xwv/pGti6V2QVSmIBL2PnSO4MUlfYMCt7wG02DKrOc/iou@vger.kernel.org
X-Gm-Message-State: AOJu0YxTCGYgKl4iBbt6yVysSjvKIzCL0r31+6As+POw6PQB9IHD8yuC
	LxatciW2sQ6TKY5AzoNDNcdYBthftTZyYfRS/UDZYGNFb9geYBboSehqoX2zrAwKu5GITsC/P3a
	4I7XiO0MC/cPk9Uen20Af0Xpd73lREmUeL5QBv6uMwFzqYEHHthSykVRmkIMrK/uUNTWj
X-Gm-Gg: ASbGncumsz5iwLgkopztEfVwsfEBH4qkRUHgD6SQQTEZw0BPfXfJN4cLSdmNcfUXzjD
	DWjcZPCk3Lt5EuTgi2V/GchvrTA+43JGf0cNtetzOWqc82QJhOrJR32ElXVcf/fzSYHnCMROgKA
	/B4oRKM+25gF5WpbJ82XaKYYRngqDEdZuH25se2s6iRc+k/+bVkCb7LDGh7gH8JtzCeXsW2p1/P
	HPFtmVwFIbkC+oEfY8DNOId4SR1be0tMX+3NdG4i1DyYuBaXfki4taG0NlVVAeNm2h33QquUKVJ
	9XeAtmXBLYuZIROkYu4vw44m5IXAeOPfsgPfqIow4K+AcDgObr/dwo8r2cRIdrLz71DdtybaP/v
	65L2R4qOY3SEGB9d8Yg==
X-Received: by 2002:a05:622a:5cb:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4af10a82fd9mr86977421cf.12.1754397058588;
        Tue, 05 Aug 2025 05:30:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjPK46kGEs3pc1RDAynXgcof2Ji8nE/G9nnh49KnsMRv34OIW/Bz1yjYcoLC3FvpS5If86WA==
X-Received: by 2002:a05:622a:5cb:b0:4ae:73dc:3896 with SMTP id d75a77b69052e-4af10a82fd9mr86977001cf.12.1754397057886;
        Tue, 05 Aug 2025 05:30:57 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21c0afsm903708166b.117.2025.08.05.05.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 05:30:56 -0700 (PDT)
Message-ID: <7fddb531-51a5-4ee3-9626-3e59f1dac364@oss.qualcomm.com>
Date: Tue, 5 Aug 2025 14:30:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] arm64: dts: qcom: qcs8300: add display dt nodes
 for MDSS, DPU, DisplayPort and eDP PHY
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Yongxing Mou <quic_yongmou@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250730-dts_qcs8300-v4-0-5e2dd12ddf6d@quicinc.com>
 <20250730-dts_qcs8300-v4-1-5e2dd12ddf6d@quicinc.com>
 <f3aeacf5-f178-4e61-b34a-60353f89daae@oss.qualcomm.com>
 <d6559256-81e7-475f-b91f-04ae237a92f1@quicinc.com>
 <a4b2a06c-31c5-427c-a618-1f1c3704781f@oss.qualcomm.com>
 <mj6hqitpp5nsmixo7udhbe7pbcr4qctbebhyvqtmamevq7zm5s@q7tpzaggabhn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <mj6hqitpp5nsmixo7udhbe7pbcr4qctbebhyvqtmamevq7zm5s@q7tpzaggabhn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: Efl2Jhz-Z20FAi9h10RJcl6DVRJXEXdp
X-Authority-Analysis: v=2.4 cv=Y6D4sgeN c=1 sm=1 tr=0 ts=6891f984 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=c-rZqItlf4WWe7PyqWgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Efl2Jhz-Z20FAi9h10RJcl6DVRJXEXdp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA1MDA5MCBTYWx0ZWRfX/EHxw33il6e3
 uwq7vgHJBgANeiv54HL52+auqysoYEDLUh/HCpsDMySG1nEdeDU+qE8Pd3tMvVDs7En5SWlLdft
 dgiKFHiaTMeu/m6mWSpu5u4wVEPRlJQ9rUVBrmsjUhOtrvEnIua+IujOE67cvwnpcOU7SFhKCgP
 nyTOf20FcZRCvghWIxZNJb0RNnlbZbTG2QJizhtZCB0f8CicYP+PVlW9jwWk3GU2h0iBRtT5ed2
 F4iHilxitKBj3+2c35kSAO/18ta9mout5Qivtd+4qw4XQ9e2Q5ZOHos6mH/zdddBj70jv0/BctZ
 McKc3JeEqedV7WTf+9VAwkD0NNUjOZdRRvm2bcw22jwgtaLmpb5VyR38N4DX3u7L8T9htcxDyE7
 pw9PZdgXPm/xL63M8bieLj3TegBjkFx87Ou+kxxcJEh8f+TuszokNpRT5DFIy+knDG4eBDCj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_03,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=831 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508050090

On 8/5/25 7:15 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 04, 2025 at 02:34:56PM +0200, Konrad Dybcio wrote:
>> On 8/4/25 6:39 AM, Yongxing Mou wrote:
>>>
>>>
>>> On 2025/7/30 18:25, Konrad Dybcio wrote:
>>>> On 7/30/25 11:49 AM, Yongxing Mou wrote:
>>>>> Add devicetree changes to enable MDSS display-subsystem,
>>>>> display-controller(DPU), DisplayPort controller and eDP PHY for
>>>>> Qualcomm QCS8300 platform.
>>>>>
>>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +
>>>>> +                assigned-clocks = <&dispcc MDSS_DISP_CC_MDSS_VSYNC_CLK>;
>>>>> +                assigned-clock-rates = <19200000>;
>>>>
>>>> is this necessary?
>>>>
>>> Emm, i try to remove assigned-clocks and assigned-clock-rates here, device can still work.. here we just want to keep consistent with sa8775p.
>>
>> Dmitry, do you remember whether this is some relic of the past that
>> was required at one point?
> 
> I think it was necessary for old platforms (MSM8916, MSM8939, MSM8953,
> APQ8084, MSM8974, MSM8992/94, MSM8996, MSM8998, SDM630/660), which can
> source vsync_clk_src either from the XO or from the GPLL / MMPLL.

The RCG has more than one input, but the Linux driver (checked about
half of the ones you listed) only lists the XO-derived frequency so I'm
not sure it was ever *really* an issue

Konrad

