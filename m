Return-Path: <linux-arm-msm+bounces-78132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0063ABF59CD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 11:49:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AF2B54845BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Oct 2025 09:48:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B6B732B9B9;
	Tue, 21 Oct 2025 09:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QCS9WO1R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9061F32B9BB
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761040070; cv=none; b=mer37wi1MDjnVo7bES9JOJ4taf48gBp82xk31luvMa9FOfQ/NUgaNjE2ckmQHyxs0O113G//HrXvNE/bW3gRaVpGTKKdb3aV6OHrIqlkYswUavzzGGe/bgr2oq0zOjJa4DHJ//kLDcFaZY9VkDLNPfTM9Scdum+uBxOZZ9T+2fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761040070; c=relaxed/simple;
	bh=LWUSgs+ntXMLNrWNlpepE0odeSrrzoevlr+4MiZjHNE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VCal+g27NLyDmXT/9SUKlMOk5Rrv3CDhYPauJMfeYt5Rm0VXdBTOfnGZ8nlsr0+tCBpmOWTnppgKcgP7Ff8S9CWvUn7KzkqFHIybx2iBGcOlVWtax/DecY0HZAi/A9FkeillF+AxhGxYj3H9zTCNmi9fizvAQwKgKOxPuaObb0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QCS9WO1R; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59L8KSUo029822
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A5Yfri4rZctc2WzJB/Dz4Ckun09407Nsj2ZILirxlFc=; b=QCS9WO1RKabpMbvm
	D8Jk99WmZ4BnPvq4/b5MbVO0qRmbxhUHq0bcxzRwHGDAEKBjxp+YU12o3tne3q4N
	oHtXkdI9wFg9jTNXVUipuyWveVQFzkoeNtmJnZdRy5iGN26M0h3hDWuU8rS422/y
	HZqHZWzWNuQvGFnMep3U+FfMRvWFWNU3vROqfQ5pu/F34HMlX7HLw814yLxSK4+Y
	DqRWfceRUvgum819OoO/DnmXOJiNwM+bxCRuPfcEklHbFCxuLYPbebSf5Md1+6Ku
	q/dnITCtOWDQnu7oDEo9S7snScK3dCpxT3RMWgGjhVFqCXXwd9G+BAOyJyqK5w9y
	dnwJKA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v2ge0821-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 09:47:47 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-886eaf88e01so239592685a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 21 Oct 2025 02:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761040067; x=1761644867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=A5Yfri4rZctc2WzJB/Dz4Ckun09407Nsj2ZILirxlFc=;
        b=vtIVYFxbvd5QVlrl2OlReq7PiuAgLji1X3o+UID+MOV/XmMc96+D2mK+5MRXYW0iUK
         /IAodovDLpCotSnJCu2Y3xcIkC06BAvswNgbu5xFG25XrHuYB+jERM4ZbII6eYOEiqq4
         vh2Vryy3NxtgguSxtA2FjZctbnXXCfzj9JLHNz6n2EMsBEiucj4g3SqbX9N75B4DP0vc
         Xp+pfzMKx/JTrZxgMS3AXkxmyrbJzh6xymJFRY2BBqfDKqysrRXRzT0bKtrn1Qmr309o
         Sp8WqXsAC6fmEaJaFWzHstTatyRxi6qEXY+wvCyJu5m/lM/y2a2b4dBb7oEIBGNi02NG
         Gsnw==
X-Forwarded-Encrypted: i=1; AJvYcCU98GGPXARatA70H0jbSr23WI9+Zy91oowx1eRD9sOEYoVzhBo8f3jFYSd+Q9YmGZ0wanXEP3qrHr94sbXQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzblwKu87csITc0I1RCTAc/1g0FtjGYoAZhD2r37vqPt48VXB25
	iIYA1m7c4+1fJk0gvTfayd04dR5j5NRsYODg0RfcEoX9NMBXFuWzIeY0pEjPVcrdOhv6EebS/Jc
	W/33Q9QmrfR/bRfHQLVmNK1gbMZxhok/xOrLVh6r8OSTj42dMuRFarXbxBbxm7hZJLScS
X-Gm-Gg: ASbGncsjkseTSKG/33QCNTk3dUbOyLWYsXgnwcp3sboprC9u8qD5EW1wPKY/773wjz7
	z/z3dn7Uu2lVralIl0tAeOnWovk21BX7UJIi9pLqr870a+RvCQlmIwXr9nS7agg+NPt0YCRW8nA
	EEIvzXGh7mPYtWGOrAXLO4xsVxxuyqPI50ngkvcrn131vzGS8Jebkajlg2FROnlWXdVVN5ngzNZ
	Ne/tmSyrHalUPBULhP31eRKr29wVKz2VHwJYJtaM+0vqq9HJfckgT8wql9MLKYmV99Xvnlzw+Gx
	jitfDPqFm6xSECqitorBx1WR1lmghSZ2Ir35QQKSONfZsjm+1xTXOFQvok3g9biO7rrZLIktpt/
	yLoE5fAMPSMEquXVBKkPXyrq6BCm3AvCXNShdvS8vDrroIv34wpzl/J8d
X-Received: by 2002:a05:622a:1ba0:b0:4e8:966b:459b with SMTP id d75a77b69052e-4ea116a557dmr18313161cf.5.1761040066618;
        Tue, 21 Oct 2025 02:47:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEzeSwT4NYOPDSj7jE+oqcdo1BkVBK0JHZ61OGnrTRCQKhTR1Q5b2mB6h6qybPWjeA3f0K5vA==
X-Received: by 2002:a05:622a:1ba0:b0:4e8:966b:459b with SMTP id d75a77b69052e-4ea116a557dmr18313091cf.5.1761040066061;
        Tue, 21 Oct 2025 02:47:46 -0700 (PDT)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb725f3fsm1027485566b.68.2025.10.21.02.47.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Oct 2025 02:47:45 -0700 (PDT)
Message-ID: <297c10fc-9b36-4eae-8a56-7556cc14b8c6@oss.qualcomm.com>
Date: Tue, 21 Oct 2025 11:47:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: hamoa-iot-evk: enable pwm rgb leds
To: Tingguo Cheng <tingguo.cheng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: kernel@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
References: <20251017-add-rgb-led-for-hamoa-iot-evk-v1-1-6df8c109da57@oss.qualcomm.com>
 <cb973808-005e-4920-a35b-3f02a402a78b@oss.qualcomm.com>
 <ada950ed-7b51-4e62-93ff-550c427a73fa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ada950ed-7b51-4e62-93ff-550c427a73fa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMCBTYWx0ZWRfX0nc0Qx8VNhX3
 p+4w/Ki4SvoHIMCtdPVNkdUnCYF6OTdSCRgAP26Asiumk7ibIMP+eXP0InTQ1QoHsoP2fjja6+B
 YWo6coi/Q/vHGDcUf1tQt2RSp6OiRB97UdlregoSKTzZpxPIhT6E+Xo55CPbEcBlaP78bUn+LjT
 igvmzFng3eqsRMwa4LLg4LAj5B9Pz8IUmPNU6AiHCn3n3i8Z7fSGn4RrimA3D/xv1iDOZ0xIXEi
 FN+KbJOwtzV45icuO8L11JzhYsAF3VsEDDPGMzei15y+zOQD53azgun0amIuEbBTPCbTVQTdFlz
 zCVP981TmJL8qY7+v6pYnA8Qs7M3cplNLY6Si0YhXm6XLS699UW6twea1OmXTQFpsG2Wl2fGPXe
 6RJoza6jzwBu89kqznaTcrTBH5FTKg==
X-Authority-Analysis: v=2.4 cv=KqFAGGWN c=1 sm=1 tr=0 ts=68f756c3 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tnXrPiAtB4-9hrzugQcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: CkH8EWxKVZSottm555rOOmPOA0X2SAKe
X-Proofpoint-ORIG-GUID: CkH8EWxKVZSottm555rOOmPOA0X2SAKe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180020

On 10/21/25 8:29 AM, Tingguo Cheng wrote:
> 
> On 10/17/2025 4:09 PM, Konrad Dybcio wrote:
>> On 10/17/25 10:06 AM, Tingguo Cheng wrote:
>>> Add red, green and blue LED channels for the RGB device connected to
>>> PMC8380C PWM-LED pins.
>>>
>>> Signed-off-by: Tingguo Cheng<tingguo.cheng@oss.qualcomm.com>
>>> ---
>> Just to make sure, is this a "multicolor LED" consisting of 3 ones,
>> and *not* three LEDs that are supposed to communicate different
>> functions (i.e. network, power, disk i/o)?
> Yes, it's a multicolor LED composed of three individual LEDs within a single package—not three separate LEDs for different functions like network, power, or disk I/O.
> However, there's one exception worth mentioning:
> The blue channel is connected to two sourcing signals—the EDL indicator and the PMIC PWM-RGB blue LED—via two resistors. These resistors allow selection between the two sources.
> By default, the board is configured with the resistor soldered to connect the blue LED to the EDL indicator.
> To support software control, I’ve added the blue channel in the DTS, enabling the capability to light the blue LED from the software side.
> Some developers may choose to re-solder the resistor to connect the blue LED to the PMIC PWM-RGB output instead, depending on their hardware setup.

Ehhh didn't know we had to save money on onboard LEDs..

This is really inconvenient to handle in software, because if e.g.
userspace configures RGB=0/0/255 to signal a notification, Linux
may program the light pulse generator, but the user will never
receive it. On the flip side, not describing it here will not let
anyone use it.. I'm not sure which way is worse

Konrad

