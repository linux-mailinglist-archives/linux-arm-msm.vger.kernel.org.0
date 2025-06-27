Return-Path: <linux-arm-msm+bounces-62882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E588AEC16C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 22:47:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EBB023A1B6D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jun 2025 20:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27C822EE29F;
	Fri, 27 Jun 2025 20:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d3ypjC2v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6312ED85E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 20:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751057164; cv=none; b=P/xESJz8DxOMdqIA1tokfhMAECbpwbcAxeVDMNAM2ZSaQJ9L75MVJXSeKa6Cd2CFmlboyqM2C7EeCPAVmGRGjJ4sR+SyZ6cTmwDNH7R8bZn5nx+RgbrJyv95cTqxnxdM+Yntv+q7eME7RIqWvemt57aruIhHX9KAN0n35F4xzDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751057164; c=relaxed/simple;
	bh=B1amgNphjp1S7GFjFXPs/GcQYxye3YWoYVlI/qcxf/Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8dMqvsBb+HRXwiOvAmYPH1I2k1GjjjuxnOGYEHEbTVDyu3S0k1Qky6ytulfcTig70Ts4E0AL/1yyxSAsK9R3WOIAUjExLcgzs4ydT6YlrsnVdTBwJoNr039MXq83YlaFQoUOuYNpa93JXE9IACqdoxvwgyMNDAqvsqPAVpvrRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d3ypjC2v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55RBXRIe027405
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 20:46:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LvmCj0v1cjoY74eE/WOAeBAPKyTiGX4dCvytV+elP2k=; b=d3ypjC2vuoyx12oD
	8k3PeRG+Wf6owcxXBFDsZJSjn/sCOXVMkGMYfpnZNv/uw0wnJk5vwiDJK7Zz+NlO
	D0fSn2N33W3369LvFH/9K70cgB1S51+RGdDwQfhKNyZyxePjWky7Q/UZsohks4+u
	5R2/64ueSt8eRw8qBP8g0w5ny5o12bPjU6CiCYqS0dRsFpvvelLwOFvg6chmnMGm
	/03ZLxzOzEn/d/2+HVZ0geRg/S8PizRdbHykya5lhod0rSc3GkuQfEUuTsjEGZLs
	qP80KJBWvLTUg55glWb1xy3M7ZBm9nr3gVS10df5BReP3pcoRYBLVjDLySjCxdck
	9zb4nQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec26jcnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 20:46:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3ea727700so32602985a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jun 2025 13:46:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751057160; x=1751661960;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LvmCj0v1cjoY74eE/WOAeBAPKyTiGX4dCvytV+elP2k=;
        b=CCsLx3G5JUcf07xhfp1IT+MT4RpT+putYfqO3duh4k7tPebSyJ26Q1Orex2ITg+VfJ
         NZ5kIZeu6GbBJU33e+cllpT+TkcY6+aYDbnY4I/uttqB+d2REodhcLPZRI8QJ+acbfI1
         TyDTH34qgFxd2VhkLxQ3w3F7QvvaIpp04RTlvCQOxolLdhgL7rHzc0s3acPpcaKHCTS2
         NGU7Obh00YCaTaoMy1izIAXVhPXns+QBwg3Fld7kAu3TjgX3e0MbGXJL38GiUbDlr67Y
         Khibyzeh9tiIr+R3AikStkJR9f2Zh97O48UaX0YrVE0WIs08+htC3kjk4ianSpNHEoy2
         jG1Q==
X-Forwarded-Encrypted: i=1; AJvYcCVVvROIYV54gHdONEn+jzNDnKsp4nqro6vStsV4MXAGt9/GoDVis/LSG9OQS8fII0Vz3eShNJI70GeiydGc@vger.kernel.org
X-Gm-Message-State: AOJu0YylijU6OuKEqlCjloOZDK6RjyC3Vr9WhoJzH4uyuaf8WH2e67eK
	zsNhDagZpq8LI7MKoewDxK32p/k4SgDUfLx8p/KGUXWjxb73EexVPGPsZF4juMmEp2Z1JjC8RX0
	QFOmJtVXcrIkAdz7JKr70geVXDg18gPuCGFknjghFfQmYdKAhWjKBukzRjWPj192SREra
X-Gm-Gg: ASbGncv9ko8Ll9WMHz55KiV8893dNqabXKrHjgYeIXorzFOGkyZzvfKwswuSb1q41kY
	CHWch/aiqt5K4EX4hipl8P+PiCqCPnors5l/3Bu7izVdq6hvBGR3Db27kMSj5nh2Lg+P/Hg8hBn
	DhQdFNDcVSMqDD/GXJ8HGSLsoBIGQLyV/6kcNf9GnULU7HJlVEDqJvnQC0Qi2GscytsY4HBTMn7
	BlzSfFrjJuTuoOddIMpn3Wn5s5+m+s04Pedqi+wgqeuIIVGBOFVFR8rksD4iNmnUOxaTFu844q5
	7KDqp2qallWgSconK4FIBqBNcAQ7web+ENSHP0NGeu1wn+H/7Mss3/VXve7begqZ6ZXYCmSo3s5
	/6Jk=
X-Received: by 2002:a05:620a:2b9b:b0:7d0:993c:7163 with SMTP id af79cd13be357-7d44c2a78eamr30936685a.15.1751057159572;
        Fri, 27 Jun 2025 13:45:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHwFR1XY8aZISqHPCrWFyviC+3MqnKMSTMQkUGTWSkYl0QopZh6D1CRsu1zF3w72yFTsELv0Q==
X-Received: by 2002:a05:620a:2b9b:b0:7d0:993c:7163 with SMTP id af79cd13be357-7d44c2a78eamr30935085a.15.1751057159165;
        Fri, 27 Jun 2025 13:45:59 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831cb724sm1976837a12.53.2025.06.27.13.45.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jun 2025 13:45:58 -0700 (PDT)
Message-ID: <c309acd7-e306-48ad-81e1-cb5fdd02b2da@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 22:45:56 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for IQ-8275-evk board
To: Rob Herring <robh@kernel.org>
Cc: Umang Chheda <umang.chheda@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konradybcio@kernel.org>, kernel@oss.qualcomm.com,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Bjorn Andersson <andersson@kernel.org>
References: <20250623130420.3981916-1-umang.chheda@oss.qualcomm.com>
 <175069348269.3797007.5540625905808833666.robh@kernel.org>
 <bcfbfaed-e857-44be-86bd-d4e977fd4d27@oss.qualcomm.com>
 <20250627202313.GA4189710-robh@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250627202313.GA4189710-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDE2NyBTYWx0ZWRfXyPverv3h/8hR
 hv+NHS4w20yUfpy58CVXwHT0vPf1HIbuquIjjUpy+vhAJuZDRJc1QRumtVuOlCGsD/kkYMFSVDe
 fmKOf4r7iVQk3Y4bgxiCbDY1OdvvkWXgig5Mskg6yjNaxn7HGtoAlrYVNpXXHbxMQjpw+mSntH/
 9cPDYQO1uv7f++2WBwrL7My16ofkl3kJayZHjOJyHIO7Iw2zKY8zCFkINGmXTtL9P5DbpkkZcxH
 ATMABf7/+V/W3hl/O5y2eoEQExnHZFKp5VBVqsd1h4NJcYs0ZziARglFNVEZHbNasFuPZLMGxtM
 cd1jp03RdmdCLmLGc6wygFh2TVqlTIS/iJFFnbu+rs89DVf/IzkL+m2wkSO/Bf7VRff5xUeRlNN
 HCgU1uWszXvc1xBIMtn6wPohEGeHpk68+SYFr2FO//iGitU9z6qFVN3UkRu/e9joiy2fZS4h
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685f0309 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8
 a=tTVXt7mVe-G5UhCDjR8A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: mIEN87CUu97VK2eJa2RKc1xR7aZtcd91
X-Proofpoint-ORIG-GUID: mIEN87CUu97VK2eJa2RKc1xR7aZtcd91
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506270167

On 6/27/25 10:23 PM, Rob Herring wrote:
> On Mon, Jun 23, 2025 at 05:50:11PM +0200, Konrad Dybcio wrote:
>> On 6/23/25 5:46 PM, 'Rob Herring (Arm)' via kernel wrote:
>>>
>>> On Mon, 23 Jun 2025 18:34:18 +0530, Umang Chheda wrote:
>>>> This series:
>>>>
>>>> Add support for Qualcomm's IQ-8275-evk board using QCS8275 SOC.
>>
>> [...]
>>
>>>>
>>>>  .../devicetree/bindings/arm/qcom.yaml         |   7 +
>>>>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>>>  .../boot/dts/qcom/qcs8275-iq-8275-evk.dts     | 241 ++++++++++++++++++
>>>>  3 files changed, 249 insertions(+)
>>>>  create mode 100644 arch/arm64/boot/dts/qcom/qcs8275-iq-8275-evk.dts
>>>>
>>
>> [...]
>>
>>>
>>> New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250623130420.3981916-1-umang.chheda@oss.qualcomm.com:
>>>
>>> arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dtb: panel@0 (samsung,lsl080al03): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
>>> 	from schema $id: http://devicetree.org/schemas/display/panel/samsung,s6d7aa0.yaml#
>>
>> Seems like a fluke..
> 
> Yes, I failed to filter that out.
> 
> This is just a before and after run with filtering out everything in 
> before. I suspect that sometimes warning lines get interleaved and these 
> show up as new.
> 
> If QCom was warning free, then this would be less of an issue. :(

We're trying.. not always doing the best, but it's on the agenda!

Konrad

