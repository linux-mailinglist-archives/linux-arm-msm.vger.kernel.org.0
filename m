Return-Path: <linux-arm-msm+bounces-78001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 65858BF1261
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 14:26:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 40F423A8DCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:22:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBC0111CAF;
	Mon, 20 Oct 2025 12:21:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DdZqU3yU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCE12ED872
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760962918; cv=none; b=tsy5o3oIOLx8neB+brpOvGCrK83aMP2AqyIjxYDblPKyPoKHAtVPakCe8s+qgT9NqO8V1qjWNXydmqMXA8sialixDuZUDGv9+L5FDh0f7DTjyrYoVcqcBkzU3oSqKXy5qcZX7XTpWfyUnh/pUARlJtErJrSHCZxf1JXI+wIRxao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760962918; c=relaxed/simple;
	bh=VgVnyXqe3uZsYKis0PDC10eA8gOksqa5Yl7wUglsi1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eMoz3Ns+lEzjVyLuGjuyefLiG+gBG1baqSleV32ubH/5XRJUjyAxzKHBFzTQ5ZXu3+oSg9CBCNan8cVtMYUzkMUyCFggVyqZ3iLNWFHb0apVGeMODqUB7dzsYohwOAcUQiLOkPjMf+bBTFdqjF6+8pVSw2YfrV1IWYNNkdGxJ/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DdZqU3yU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBDxXC025907
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:21:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qKCfkUI9DYpLSsbCb7f0JpIqO0wEPZNRyKV/I77+iMc=; b=DdZqU3yU8iHDb2LR
	wtlRcKRo+2G4azN14ruQNOxwkqxXkRLpOWrqzDXuvYLbXu5RSk1yPELb39h88RUf
	5VGNG/WMALONbT4vVmUF4mrN3gO1J04bqNCYUvKaI2PWuoP+V9f1QJZmlYIEM6+J
	BFhdApoM1Zj2AzA84zMKE0f893iGGl2q9KZYqhfg6L/v4bchQobJ9M39P8GLJ21r
	LPxLJ1huJ6Ej5SfRKP5Cet6PEHww34XGIpPauNfBfC7KM2qpP0XwRDe2gkUjSdtP
	tZGXSLuDeiyrhdN3OU/D3LGrsb5/rOx6QTA9Qzwq79ioJBOm59T4MdRVwKT20x/G
	C2O9kQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08w2b1u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:21:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88f7d885f8dso169368385a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 05:21:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760962915; x=1761567715;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qKCfkUI9DYpLSsbCb7f0JpIqO0wEPZNRyKV/I77+iMc=;
        b=LdSNk8/1z8WpUiFlIrWEcHkjt/15zL9iS9SOdbzbk1n1lj59XtBp/Am3WCHxRAtGeX
         bcB+gGOGmx94Z4jMxudJv7IF8kEy9n42kAGGpUpQXMzTvFJq96HIgEUacJnP6nmyrFp0
         6MefpKeCPx8qGdB9COKZ8qJteBz/GoM4xRIsaK7ru6K9DnrZK7w0ttNgW7sGFrJRqcJN
         p80mbPc5TyaU0B6kpPULapAo7cEncT61vxAEtNgYtAYS8uaQ1OpedRKs+mQc2JiT4eC1
         J4Un25zXXBzMx6eGvvE3zCPYt9XvYTGwIoTv2tiafeOclToz2MRiNsB8041S6PNhCA2P
         nhJg==
X-Forwarded-Encrypted: i=1; AJvYcCXL+p13BY2gxZ/K1yCJCgNVgNke1fwa+lyqy9HkA5AaWZP7qNv2PNsLacnqUvolohu0EM3+/rUQDEg5N0iC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7FH8azLSUAX4+C4vVJ9r24BmiceiXTapfF5kYBkrKZHvS2ZMa
	lQaSiHEvQMrfeOPk1wf5BryVmAzwtU0wYGFxcmnX38a4l0bLCiezGIS+lUr6b0i9GJ2AsdTbg2F
	Zr5tOWPrBIzPuwubmxbx5TboYF4xzxyMbwV7DXawdV6wKJWF0+ASO8R8YqU0Ff8GBeEAx
X-Gm-Gg: ASbGncuDrFlMGKcKbBRinM0Ukk8fIcX2ZZi8LlKIUF9NLgIKhHAl8mJdqaKwqHgT2jk
	VNiYbMjdvWIDfGMo+Ri2A0+6XBPUQJwX9KCHkWNw7wVZvb+e+ysNuhSAS/pEk5hBn+BhGeFqzOd
	Ftpi1oJRqzNr29KXsV49G5082SCfZZwwZLi9MACIT/72bAsEueZW6QDzE3qEE2bIqJTEYGeEpgH
	8kA3rWNXECJPXjOKC9FGWqEByxM1T7iHiGmAuDBdLfN40W17/U8o3DgMjoWcpjxpN+UX2NaJyoE
	QtqMxlqDpMdV2GGEUAusN5wGvHeoCcDrxlp92kUpLKz5r99FLPb+4+I60kd8ZtipLcgWvEN6yW9
	TN5mWnJeycSfT+wsN7dCGSymikCJaAw2fuq1I5jSMtwSF5H55K87ZUjAa
X-Received: by 2002:a05:622a:130d:b0:4d5:eedd:6893 with SMTP id d75a77b69052e-4e89d411c5emr111741411cf.10.1760962914838;
        Mon, 20 Oct 2025 05:21:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzRsE45j1SvELohLH5CCKq4ye7i4regfvJKVczjO606BJEeqTcxSAhMC4HYbZMRn3PNcKbsQ==
X-Received: by 2002:a05:622a:130d:b0:4d5:eedd:6893 with SMTP id d75a77b69052e-4e89d411c5emr111741041cf.10.1760962914388;
        Mon, 20 Oct 2025 05:21:54 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb526325sm768122866b.55.2025.10.20.05.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 05:21:53 -0700 (PDT)
Message-ID: <85bf3468-24bf-4f14-afcd-28878ad84dc9@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 14:21:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sm8550: Additionally manage MXC
 power domain in camcc
To: Luca Weiss <luca.weiss@fairphone.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250303225521.1780611-1-vladimir.zapolskiy@linaro.org>
 <20250303225521.1780611-3-vladimir.zapolskiy@linaro.org>
 <dbxvzgqs5slrl5edqunal3wplg5jiszqv46dr4nzgowwlhkhxa@qwtfq7nfjwfo>
 <3210a484-b9c3-4399-bee1-9f5bbc90034c@linaro.org>
 <CAA8EJprP9Z181VDCT=xfyrBipzgiB0tfb8M_XZ4H=yOrvEnB0w@mail.gmail.com>
 <f41061a2-cf45-4588-8df7-22270c936ee2@quicinc.com>
 <D8EZ47Z557OX.37FDVYA5AHET0@fairphone.com>
 <d64c0776-0b12-42d3-aed3-4e6a13487f51@quicinc.com>
 <DDKNL43NWFMA.1S03T0SUYFVMY@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DDKNL43NWFMA.1S03T0SUYFVMY@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: QWvkM3bef2I5ZJmtndKXB_5jCzRvDDo1
X-Proofpoint-GUID: QWvkM3bef2I5ZJmtndKXB_5jCzRvDDo1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX5+QEl8ll1B2B
 3rdoBgnr3G+Gw4O3cCktRairjQKZ1JxRN87meuYCdwdrN3pztA3TKixF2mdVPiTbTaMs2LnOlg3
 IMaOp7s2v02ipiueYw0t1GYlzRHj+hqBl53S86ahjXPP592nlnEfmkfihZ3f2bQ/vqC5Eselu6r
 VMCLnJBcMHQkCZlt0NbUJxfZU451qEppkf/nzWsDA8YPNuxi6ikvFVDfxteqvMdWf9matSbsGkZ
 6ro6KPvmFgI+89zDEk9N8Y2zpmxl+QEogps6JekbzM42GE40J7Fp9L4SkKBeeOsYUAIwrp4yUZk
 dsFB171WHO4XuojSgEWehSMygSAS25gXlW7TvD6gDJdiCy5BXWVzO2nUelr2Mwg0xkdXgciP//i
 A8vNy31+a3XCCapQizv2XuNdKw6GZw==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f62964 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=tOHfr81QrpHVPz6DLswA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

On 10/17/25 4:05 PM, Luca Weiss wrote:
> Hi Taniya,
> 
> On Thu Mar 13, 2025 at 12:57 PM CET, Taniya Das wrote:
>>
>>
>> On 3/13/2025 1:22 PM, Luca Weiss wrote:
>>> Hi Taniya,
>>>
>>> On Thu Mar 13, 2025 at 5:39 AM CET, Taniya Das wrote:
>>>>
>>>>
>>>> On 3/4/2025 2:10 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, 4 Mar 2025 at 09:37, Vladimir Zapolskiy
>>>>> <vladimir.zapolskiy@linaro.org> wrote:
>>>>>>
>>>>>> On 3/4/25 01:53, Dmitry Baryshkov wrote:
>>>>>>> On Tue, Mar 04, 2025 at 12:55:21AM +0200, Vladimir Zapolskiy wrote:
>>>>>>>> SM8550 Camera Clock Controller shall enable both MXC and MMCX power
>>>>>>>> domains.
>>>>>>>
>>>>>>> Are those really required to access the registers of the cammcc? Or is
>>>>>>> one of those (MXC?) required to setup PLLs? Also, is this applicable
>>>>>>> only to sm8550 or to other similar clock controllers?
>>>>>>
>>>>>> Due to the described problem I experience a fatal CPU stall on SM8550-QRD,
>>>>>> not on any SM8450 or SM8650 powered board for instance, however it does
>>>>>> not exclude an option that the problem has to be fixed for other clock
>>>>>> controllers, but it's Qualcomm to confirm any other touched platforms,
>>>>>
>>>>> Please work with Taniya to identify used power domains.
>>>>>
>>>>
>>>> CAMCC requires both MMCX and MXC to be functional.
>>>
>>> Could you check whether any clock controllers on SM6350/SM7225 (Bitra)
>>> need multiple power domains, or in general which clock controller uses
>>> which power domain.
>>>
>>> That SoC has camcc, dispcc, gcc, gpucc, npucc and videocc.
>>>
>>> That'd be highly appreciated since I've been hitting weird issues there
>>> that could be explained by some missing power domains.
>>>
>>
>> Hi Luca,
>>
>> The targets you mentioned does not have any have multiple rail
>> dependency, but could you share the weird issues with respect to clock
>> controller I can take a look.
> 
> Coming back to this, I've taken a shot at camera on SM6350 (Fairphone 4)
> again, but again hitting some clock issues.
> 
> For reference, I am testing with following change:
> https://lore.kernel.org/linux-arm-msm/20250911011218.861322-3-vladimir.zapolskiy@linaro.org/
> 
> Trying to enable CAMCC_MCLK1_CLK - wired up to the IMX576 camera sensor
> on this phone - results in following error.
> 
> [    3.140232] ------------[ cut here ]------------
> [    3.141264] camcc_mclk1_clk status stuck at 'off'
> [    3.141276] WARNING: CPU: 6 PID: 12 at drivers/clk/qcom/clk-branch.c:87 clk_branch_toggle+0x170/0x190
> 
> Checking the driver against downstream driver, it looks like the RCGs
> should be using clk_rcg2_shared_ops because of enable_safe_config in
> downstream, but changing that doesn't really improve the situation, but
> it does change the error message to this:
> 
> [    2.933254] ------------[ cut here ]------------
> [    2.933961] camcc_mclk1_clk_src: rcg didn't update its configuration.
> [    2.933970] WARNING: CPU: 7 PID: 12 at drivers/clk/qcom/clk-rcg2.c:136 update_config+0xd4/0xe4
> 
> I've also noticed that some camcc drivers take in GCC_CAMERA_AHB_CLK as
> iface clk, could something like this be missing on sm6350?
> 
> I'd appreciate any help or tips for resolving this.

Is CAMCC_PLL2 online?

Konrad

