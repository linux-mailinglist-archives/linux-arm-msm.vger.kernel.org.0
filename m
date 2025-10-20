Return-Path: <linux-arm-msm+bounces-77997-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id C14E0BF0FDA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 14:06:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AFAF14E7B4B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 12:06:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF2433019D8;
	Mon, 20 Oct 2025 12:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGyGx5/f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CB22F5A32
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760962003; cv=none; b=N1WPIMEQjcUqvR8ulLZNJ07k1cx8i/m+9CoE642bgVP5KbGnlQk5kVvcFj0wMIZqkNnQzZee5s2hWDvrH9YBGh0LWJ8EwPJrTVG5JHzDG5LFRA88t4kz0KhzyYRdb2k8ovgMaJwGEdf8AH+uggP1YohrEi6k4bhUXBucVmFgGig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760962003; c=relaxed/simple;
	bh=85eJelY5rLujX3HL0nj5dZhL7tMpDAL3Abbo8qRfrZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U5d/SgSZ3YtDWNwZxOjwlZboJkZuCVoatAi78pZoG6vZ7Yq6mAhqWLi5qW5XMzT+fBFxMaLGhnK8NNMFajAFy0/JOQeXv41ilt/1nsTBpO8uCLY5NXE9eETz3YLGUMWYXbUNpvHMC4clbLtqop1pjYAa2TwTztyK2mxCutH+MiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGyGx5/f; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBdsVD020642
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:06:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AM1EAi3c+8jjqOffE3vd1ZWRy962xO7gDGTST1FtuEM=; b=iGyGx5/fiN8jzYSK
	hR9jZAFxmIKb4nYScW/jtcrdQ5HJ5LBfICp97L0/7FBs48JZmqUL0AVwzhTpV5KA
	6/4ahiQY2sVHgaCbVzhGI1mfGjzSGhYQcnqYZp0566poZvncTgh8ZssUF+apUSur
	fWyUzKk8YBp8wqupy8NRKlTrmtKGvm+dmoP6K9OqAoInqWcip1S7ID9WIHlcnY+q
	23yNcylSZhjX5s6y4Vag9vYBpygGwFVXkeUZ8cDP/Ey3HimNHFq8EuGIVodDPrfh
	HIEpnGlK+wyTrPlKc0m5tC6L/peBVxNc559VKcz/NpyBk037Vke0+1D3/MEFSu6X
	pKBIdA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v469ck0g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 12:06:41 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87c0e043c87so19028486d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 05:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760962000; x=1761566800;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AM1EAi3c+8jjqOffE3vd1ZWRy962xO7gDGTST1FtuEM=;
        b=X0IQ+J+SR9nyeXo6HeZb57ku7dG+Ntg8ddo8avJUMOnUXb7ybLRmx2LjZSBOy3MFqg
         2qIl6+xS7Ehp0oEWqcBWLlGwZOSzEp9UjkqCVRLIb6XebgCqrH0IHRuAIJdpqPbXQuXd
         DdVojajr3E+DSw2eAZHi7iVtHDWJ4WAbmYBI4ZQyuJZ7i382+ZQiDqhZSfMQCasYwTAr
         P+8Jgphs3pBSiSKlUD3X8+INO4j56sU4gnQsYPpxSyLkBDhjn3QiA4hKNmdZSFY7MIp6
         gqiLAVK0j0PA7YFII96b5F4jhF5bmnmGzFyJ///wNqJtAsj5v6vENeQJUV1zxKeogrev
         cuwA==
X-Forwarded-Encrypted: i=1; AJvYcCUMUbh9kIdnxwjy7WvJgpiJAaX1T188eNyNvWdGeKAqspQc++e2Oyewwu2YKAnz2NhOBa2i7J9rS8aHmWUp@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Yyj/oPkq7pO89JvmX59aoB4m7+hum0Vtgbuhw/o5i0ijr1RI
	JFXKzqxvJ8MzglEfFV7UEYyE2PeBXu+82E4zeRZ07rI10cjD6OrMK1oR/b3KTtDMwDn7C4SDZhW
	7s95rsxjV003A/Nz/UkMio4T4myY3KnBhQcDLouN3n8+nndqLB36EwR97H5GnNcPpLZcL
X-Gm-Gg: ASbGncvoRLp+zHuAvXNVTXAXeI2UjmVIwGCK8oFHPmOEZgTy6vB/LXt2TXFfe2iCtD0
	z4yIDAPwCYVvgpYUXafOj40lNDAHMmLV1TIldC7gA3XYFU7FFIf7qf6I9HfLlpwmtL1XlRi07Sy
	JYNWvFgJHp6Z2YTxQJO3PCkEMsYE88ZK3kBXoBq6sTA+ZUqtcxcLlrirBIF69vOWZOGpx4lDBTw
	7QST1ct49gI4DOcWjjSl0K6KjT9w24YV6AMrWtsNQcS4Qg2pW74uzaCydUEEp3BUqnoxBfNwiPG
	HcID6iITfFWhSKachMzHNJ3MqBpKUyjO3Y/QraV8xmtOus/JMiSgpZJ4rSH5uMpTIA3ozXWfu4f
	e//Qa6pRCuo77lDKp8JexFwD3eMNqqFvB8uAXW0NyJakkRmbKv6aVcGhJ
X-Received: by 2002:a05:622a:1492:b0:4b7:94af:2998 with SMTP id d75a77b69052e-4e89d2cb636mr109379701cf.6.1760962000018;
        Mon, 20 Oct 2025 05:06:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8qCwyyxDM/2fV6Wa+Eg4Sftf+4gxk97dhl6Vpvo4Cc7D7+AvvddfmPWJAlfl8oh36GLDt8g==
X-Received: by 2002:a05:622a:1492:b0:4b7:94af:2998 with SMTP id d75a77b69052e-4e89d2cb636mr109379411cf.6.1760961999585;
        Mon, 20 Oct 2025 05:06:39 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-63c48ab54desm6624844a12.13.2025.10.20.05.06.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 05:06:39 -0700 (PDT)
Message-ID: <30704150-54d6-4ba8-8dcc-74145f77cdfc@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 14:06:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] arm64: dts: qcom: r0q: enable max77705 PMIC
To: =?UTF-8?Q?Eric_Gon=C3=A7alves?= <ghatto404@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250920014637.38175-1-ghatto404@gmail.com>
 <20250920014637.38175-4-ghatto404@gmail.com>
 <53b1a622-3afc-4fd9-98b1-3c166f563ad0@oss.qualcomm.com>
 <BB4E3024-F897-452B-9D3F-250ED2D52195@gmail.com>
 <823af9ee-df4e-40de-bf30-084442bb1d2c@oss.qualcomm.com>
 <17433470-8B99-4910-AB3C-494C7C27BC29@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <17433470-8B99-4910-AB3C-494C7C27BC29@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: FJh3Hj79-xty3IznwK0xsh4wGPVghIvo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAzMiBTYWx0ZWRfXxqp0teq2DPVu
 VVz8Mm/lAfLv4JTQq632NoAtUSRfdz5syqolDLN8wXht7SczZ4/ainwpiypl/ZB9u25Q57iy3Hs
 FLDuZwMaty2LWNEgAuTmlc3suVBbXU0AIWQcBAF4vj4pcJo/RKS3SvxQ/U/DojUtiax1kzrqLOx
 Xo5y0+tvZ5lkBPTlpihVtvonZsqpvkZ9G3xqNFPmbqMepbRObK2C72xt0B7pj1Ga/gy2i+t0pmO
 bVE0VI+gpTt1SR2yQtA/7lWjKf5jeOleT1NpclyXKa0DgCvm2/FiZOvR7BALw1fLhWl1fAFPEO/
 79Lvmvhp63U5T75m1+uuNLmlq0p2P3rDpykDs/g65qqTpQ/2QB3edSewBsleefrXLNHqMQBQsj4
 oDslt/y0jLl28Z1EvCKNu47VixUSfg==
X-Authority-Analysis: v=2.4 cv=U8qfzOru c=1 sm=1 tr=0 ts=68f625d1 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=o0PnOtkDTcW85J4-gJcA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: FJh3Hj79-xty3IznwK0xsh4wGPVghIvo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180032

On 10/9/25 10:31 PM, Eric Gonçalves wrote:
> 
> 
> On October 8, 2025 5:34:00 AM GMT-03:00, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>> On 9/26/25 4:19 AM, Eric Gonçalves wrote:
>>>
>>>
>>> On September 25, 2025 10:06:53 AM GMT-03:00, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com> wrote:
>>>> On 9/20/25 3:46 AM, Eric Gonçalves wrote:
>>>>> The Samsung Galaxy S22 uses max77705 as its charger, fuelgauge and haptic
>>>>> PMIC, enable the fuelgauge and charger for now.
>>>>>
>>>>> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
>>>>> ---
>>>>
>>>> [...]
>>>>
>>>>> +&i2c5 {
>>>>> +	status = "okay";
>>>>> +
>>>>> +	max77705_charger: charger@69 {
>>>>> +	    compatible = "maxim,max77705-charger";
>>>>> +	    reg = <0x69>;
>>>>
>>>> Please use tabs consistently
>>> Sure
>>>>
>>>>> +	    monitored-battery = <&battery>;
>>>>> +	    interrupt-parent = <&tlmm>;
>>>>> +	    interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
>>>>
>>>> interrupts-extended = <&tlmm 5 IRQ...>, here and below
>>> why extended?
>>>>
>>>>> +	};
>>>>> +
>>>>> +	fuel-gauge@36 {
>>>>> +		reg = <0x36>;
>>>>
>>>> sorting by unit address is welcome
>>> Sure
>>>>
>>>>> +		compatible = "maxim,max77705-battery";
>>>>> +		power-supplies = <&max77705_charger>;
>>>>> +		interrupt-parent = <&tlmm>;
>>>>> +		interrupts = <5 IRQ_TYPE_LEVEL_LOW>;
>>>>> +	};
>>>>
>>>> These nodes should be children of "maxim,max77705"
>>>> (see drivers/mfd/max77705.c)
>>> What do you mean by this? I looked at the driver, 
>>> should I add the pmic@66 node and put
>>> the units inside of it? Because starqltechn doesn't do that and
>>> places them outside. Also, by adding the
>>> pmic@66
>>> node it expects to have led/haptics nodes as well.
>>
>> Well, the chip comes as a single package, so this only makes sense
>> and the bindings (mfd/maxim,max77705.yaml) corroborate that.
>>
>> Just looking at the YAML, you should be able to omit the LED part
>> if it's not connected anywhere
> Well, looking at power/supply/maxim,max77705.yaml shows
> that this is how it's meant to be defined, (outside the
> maxim,max77705 node), no?

If you grep for maxim,max77705-charger, you'll notice that the MFD
driver defines a MFD_CELL_OF

So it's reasonable to assume the bindings example is simply not making
this obvious

Konrad

