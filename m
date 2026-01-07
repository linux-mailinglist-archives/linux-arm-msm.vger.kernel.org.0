Return-Path: <linux-arm-msm+bounces-87847-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6295DCFD517
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 12:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD00730321C0
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 10:58:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D33242D83;
	Wed,  7 Jan 2026 10:58:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RW9+50db";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BdhpWpS0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D672F1A9B58
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 10:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767783511; cv=none; b=H+OzYSXPA56ZAHvtFkFcIz2vvgoxzAYQiNr5u0N1COg0dT9s8NK1/C4XsjhC/7pQaqgZ1EgTgXRvpZ26dz+SWL2mjRWQFhZanjYj5gbXwDaLpnj9GgCut52g37llAIs9UfUhr1X3UprGTYaytmIPHHWf8hrT/oYSqlu7EYMHa50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767783511; c=relaxed/simple;
	bh=T4ejd4rvkhvcI/OMrIcgyz+gP3oiSx2dv0FXGbirrBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ql16XxQf8vzDSPRrY7ZWOrySV5j74D6c0aeB9jlrWx99qFBWtqDkNoc8rxccXiqEYZTa4TAXBFUTCpDfcznBIl3fH5sbmVp9OYhjG0gNdn9NBmZqP7sBWt3aPVVxkUZcbB31+Gf6QEd6OlEqWl5PbLShomo59VSEfLsM7fkQgz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RW9+50db; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BdhpWpS0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 607A1bUw4136999
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 10:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FRXgvYQmnft7LcFrR2dSQvlbRV3+x+nFRPxtSXRd/4I=; b=RW9+50dbWTxXNk6x
	tMmq/LfBoAgOO6S0YWQsw4RCYMSO9b6eW/VYEcZw//c/DVsm/+sNl517nqYTZq8i
	9sCx9+JgE4yuSQPU2LlPESoNGjS0PjhuYFZZHx3QgwfYgKViT5HgXn9zLPcFfQw1
	bmPaKT02T7OaHRCt69JqEEVY7DUNuKzeixU+jYoebWpBJ1I0t0KEW3pUKrZAm3aP
	xkguynmA/H7LJ/7pSyMy5CzMDQKjFLLYBPFegMr3UvGVaAB9Avs/07n3pTTqbJzp
	CVFHcKbT/NDg/l2Qh4HyoV8reMHRd2uoa+Q9DX/qYdHkj7BFVD1Ui/aa47dS237P
	TxSqjA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh66e30n6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 10:58:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f1f69eec6so21395045ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 02:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767783508; x=1768388308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FRXgvYQmnft7LcFrR2dSQvlbRV3+x+nFRPxtSXRd/4I=;
        b=BdhpWpS0cjQdRPWL32Cew84+6CLzaoh1QkgtG0APmxMZygRz5/1wA4XDC1QZ2JxEgO
         vZmqVfHiFyOnsP/hHXGCk9UmL3/Qy/Pj4Gqx9AKxgnA4Wz8dAZb9DmcULbZH60zOf6LC
         qT42tbipONMdqShx10Yr7RUS3eFTC3qqAlx4bdSDCVXgUlsFuHJRe4CWakglEoyuwSk6
         OElQYyfk1iEJhWWQV04J9oTFvfOT9u2b4P5Ts2pWg4N+sn5Hu8EIyGHkTio3y+SNWMGA
         T+4a+YN0Q8i2ydo46ClJQ15RInQ3GjnHNS1Pyq6kTWZQjgGTOb/jOLzAFuG1jjlQ7nJQ
         OrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767783508; x=1768388308;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FRXgvYQmnft7LcFrR2dSQvlbRV3+x+nFRPxtSXRd/4I=;
        b=gxMCa1Oj3BoDHMAD2EIeJ6mDJGGxdcsW1+Zs8NocK0PqeIeE5hBApyv7MGfYAqHRn2
         L9Tg07z2k3WEnfBnjP44o+l924LiL6OFmdYjPuGAX+FWDJCOUQzZi1B1uOFn1CgNk6fB
         6+jxPTcNYUX7foBpeuOeZf6weGgkaXWissFPH3Do55sNbXnj9IlhS8gFwJLL7X0B6g5b
         DKTSPyWFhaubnfJ9Upk939dNpifaGxE9QAyZCiC3GPKx0epJhD4xrpLbqGa+3nKZAOVZ
         W/ViNy83Xq4kZwZB19yJinShedh5BYAekoP3ddrGP49JU/6Sn+qvVEgqxmM6EFE8gGWJ
         Txdg==
X-Forwarded-Encrypted: i=1; AJvYcCVDGJlzoULjjnJH8ioSAg8jvdFWxRvW52DUs0ibfx3betRZ1GrbHh+q/zUgv793iFTzXyjIwil7zuws7TGP@vger.kernel.org
X-Gm-Message-State: AOJu0YzCtl17RqEMn8xwSB9w15dBX89fQC05f5G6Q/fAteF1Yjqn6D9c
	52DAhhtyK831aa4OkiNr8DcPDV6oUUVgBrMM++/L0ssa8rMuIimTtRDJtEz5ZM6jD0KcDlrRjjZ
	EF2yowsVYjYBqdoH8q/l4BlRbofWMURElsHvQ9YsBtrpTPY9ucoVrnve10hLZSlsBg/2B
X-Gm-Gg: AY/fxX7/ZDnyaTDi/+syLin/9m9VbAViiQD/pXeXBj11nln24R+jTGNlL93v14cP85K
	5xs2D1aMKSMu32MhJe5RgjdY5aQF1ewvTriVKERsFKGVpx7U4ncJkOPOFnEVJ1xFtB5l2AULpqh
	3UTxQsttXpotpXQi+a8OqpsLTWpkodeWq9Tii9HzajRIr3P9au58EWAzQ/SRPAQnvYha+ZzURV4
	xZhoLLa0UlKPWPMou/T+OAQ06hGhOM8m7xj+Bis0MpyRGRuCsctdU3dEMW6Kt4uk88ROldWUj5x
	lxi9QSRtEA8BY2JR2g7I7E9fz3ROWAX45c7ro3I1gQj/IzA6o9RW+mPh3P92OSIYAJp0Z17bw3r
	V98Kko69SfaWbuPbmDwfzeH2vPX/xMFOnreck8UIkJw==
X-Received: by 2002:a17:903:32c9:b0:296:2aed:4fab with SMTP id d9443c01a7336-2a3ee43595bmr21024995ad.23.1767783508408;
        Wed, 07 Jan 2026 02:58:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbNqpZuV6mAp6uDnE3kM7fbVgC6I+1Vf4XpkCqEkA9coF18+F5L03OETFULxVPU2jppSWDpQ==
X-Received: by 2002:a17:903:32c9:b0:296:2aed:4fab with SMTP id d9443c01a7336-2a3ee43595bmr21024795ad.23.1767783507835;
        Wed, 07 Jan 2026 02:58:27 -0800 (PST)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc8d76sm47711725ad.84.2026.01.07.02.58.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 02:58:27 -0800 (PST)
Message-ID: <741df2ea-03fd-4af2-9a98-20d68658edcb@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 16:28:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] serial: qcom_geni: Fix BT failure regression on RB2
 platform
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        bryan.odonoghue@linaro.org, andersson@kernel.org, psodagud@quicinc.com,
        djaggi@quicinc.com, quic_msavaliy@quicinc.com,
        quic_vtanuku@quicinc.com, quic_arandive@quicinc.com,
        quic_shazhuss@quicinc.com, quic_cchiluve@quicinc.com
References: <20260107064834.1006428-1-praveen.talari@oss.qualcomm.com>
 <CAO9ioeUsLwOs2RqGPcbeuOpHg4zuwwsstjJnTCH4-oRL=ss6kQ@mail.gmail.com>
 <be79091d-3b2d-41bd-9303-2c8a64dde9c4@oss.qualcomm.com>
 <CAO9ioeW=7z=LchdOOfdtujCGJ5Yb3BxeLA_w=ktYQjgpyv2RaQ@mail.gmail.com>
 <36d8fb98-562a-43dc-8b47-b4f6d29475f1@oss.qualcomm.com>
 <c0fd52a2-56a8-47cc-ad40-8c14c269445b@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <c0fd52a2-56a8-47cc-ad40-8c14c269445b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA4OSBTYWx0ZWRfXyCjkGvLT+wxy
 O1YGdP3AeTCb1RcbLFrlPVI544Q1/jifjRElVhsxy+AH8D1+kpdUJZFFxGtoQjD8ghYruotwuN3
 tmf8gLUc6tqrK9ml/9gbDKqDoyGdBlrae4gSBVOXUFX+OmmWoEY103DWaZD71bn77GhBr3SSZzG
 ZsCWFzvH1/SEAsdZFZna4OgQ2oNLpkm07zm9+U5AOwe7fcTM/x/IfcX5UTZgaccxWYL0XVGNvV7
 3Wq1JC24Y3Iz6dh6CtQxym9up7YN2yqUYGfGBOgGnrhR3M5PCfdoOGfkqLVDVCeg8FSnBF7cP4O
 +Ya9k5ZSiFoF77G6/oNFjP7QTwd4aGus4+MatlTW7JZTlcDlYqbb9bdiW4cMT4BpZahyD/2oofm
 8jJE5h2R+4yA4/e9xABng1HieYILHUKVIq6reKwOud2RCcXYDmKl2MlqV/KKeWjxxfajZD/gDRo
 pi+znxjDmf8YhLhuQzA==
X-Proofpoint-GUID: gcbpHWSpbiNKZ3uMcPVKemeRTLb7BZTE
X-Proofpoint-ORIG-GUID: gcbpHWSpbiNKZ3uMcPVKemeRTLb7BZTE
X-Authority-Analysis: v=2.4 cv=evHSD4pX c=1 sm=1 tr=0 ts=695e3c55 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=fCEnOBaRacVBP-F0Y58A:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601070089

Hi Konrad,

On 1/7/2026 4:16 PM, Konrad Dybcio wrote:
> On 1/7/26 10:24 AM, Praveen Talari wrote:
>> Hi
>>
>> On 1/7/2026 12:52 PM, Dmitry Baryshkov wrote:
>>> On Wed, 7 Jan 2026 at 09:06, Praveen Talari
>>> <praveen.talari@oss.qualcomm.com> wrote:
>>>>
>>>> Hi Dmistry,
>>>>
>>>> On 1/7/2026 12:24 PM, Dmitry Baryshkov wrote:
>>>>> On Wed, 7 Jan 2026 at 08:48, Praveen Talari
>>>>> <praveen.talari@oss.qualcomm.com> wrote:
>>>>>>
>>>>>> A regression in linux-next causes Bluetooth functionality to fail during
>>>>>
>>>>> linux-next is an ephemeral thing. Please reference the exact commit.
>>>>>
>>>>>> bootup on the RB2 platform, preventing proper BT initialization. However,
>>>>>> BT works correctly after bootup completes.
>>>>>>
>>>>>> The issue occurs when runtime PM is enabled and uart_add_one_port() is
>>>>>> called before wakeup IRQ setup. The uart_add_one_port() call activates the
>>>>>> device through runtime PM, which configures GPIOs to their default state.
>>>>>> When wakeup IRQ registration happens afterward, it conflicts with these
>>>>>> GPIO settings, causing state corruption that breaks Bluetooth
>>>>>> functionality.
>>>>>
>>>>> How does it "conflict with GPIO settings", what is "state corruption"?
>>>>
>>>> I mean the issue occurs because the GPIO state is being altered during
>>>> the wakeup source registration process..
>>>
>>> Altered how?
>>
>> During the runtime resume of devices, GPIOs are configured to QUP mode. However, when registering the wakeup IRQ using dev_pm_set_dedicated_wake_irq(), these GPIOs are reset back to FUNC mode, which impacts the RX GPIO and leads to Bluetooth failures
> 
> "QUP mode" and "FUNC mode" are tough to swallow even for an insider.. How
> about:
> 
> "qup_x" and "gpio" pinmux functions

Yes, you are right. I am talking about "qup_x" and "gpio" pinmux functions

Thanks,
Praveen Talari
> 
> ?
> 
> Konrad


