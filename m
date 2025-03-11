Return-Path: <linux-arm-msm+bounces-51022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A685AA5CC15
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 18:27:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 336671898F93
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 17:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC9CC2620D3;
	Tue, 11 Mar 2025 17:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VFGv5oWf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E45325D8EF
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 17:26:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741714021; cv=none; b=MAe8T+raOuosmEo+agAJxZJZXes+sLzWBNldt3I+K3jmM2tNG5C+h+gxCBq6wjbvIP0DZAcG1DMpo9dPZglF0/sSRUaK5yfJwOdKluRB3/QgI6fSiyZdi7/fmhgNrtos+z85vAzjAdMzrYrZlg2FVyvVseJ6ZHFAYwEhPBFZ4S0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741714021; c=relaxed/simple;
	bh=XTIRAgPmD28skDvfDwDGIOCVy8D0GYqUCBr9UNVDX0Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g+GhW1cwE5cNyz/AYccS7e7hfjn0z8CKEoDbzS0g1RHcWqXVtAo96oEEzG0QHHlWcBmtVDNUK06PHUmgwqBQI5hFsIf417fIgYQmAs+s/y7iATushrXa6+7hI5s3EE0JWn3cXMd5+DVWPtyf1xE9OlK88kg5L/cth/P2Xhazjmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VFGv5oWf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52BFEZrB030761
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 17:26:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	modCKFlPbohmYS2UCFV6htda6LZj2dmGCzj/GUvT+OE=; b=VFGv5oWfJIvhnUAl
	4zvjCI66xOiOuk/ivNSRQm07MmqeMg0RKuuir9Gfx20xH7YnLHvEXwKdjB7l+EQy
	5NsrJ/bm1qYO8xpq+JUoMQ8NkLBCazzhYSuqr/PBP9Qh+a0mEujKayl+YCQ8fObq
	eUcFtM4ScROXfzvsfotudNdFUz2xfGpda84fKGCdaxqVqBjXCvtJDXV4Z7ouliIf
	0OFAuTyQeRoICh8vVWd5jx9kOv/CiR23vvcM+1NUMJZ7Hh7QQj4c0rRZWVeZkyT0
	OeSROwoWmQ15OiU8VAfgksx8oeVbpLxsBRdzIYQyu4lC/Z7HEpH6AQ1l7kLDYorH
	lfd0gw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458ewk9fer-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 17:26:58 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c54788bdf7so32088785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 10:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741714018; x=1742318818;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=modCKFlPbohmYS2UCFV6htda6LZj2dmGCzj/GUvT+OE=;
        b=EgTVI24lV0eEc2lRJvCKT8XXv5dw1soM7PVmR1ADqun8xotoiQJr/67Fxp2uHOz31g
         9HIy9doUfq1Hv1VGrR+hLkdoyvPZcfj4JO1II8dFpbLwsDRVK5Vho7Eh5Dz1zNLnntzg
         qDqw/cHV9kewYZMY3F8OtXYAdJwUTB/KnnOk+LbQxDaVzvt+DxEvvXQ0nB639eq9zzS1
         wRXuBJZy0DeSZl0KgbFMRw2fzSG/+tv1coE9DmD16VdseI1lPdMw/kjA1lE4qQSXy3og
         gQv0o/iGTB/If9mkQwurLIxbZsSbGjqSmvTo9yoGq9EFm5c+ZOKcYzXR9eSz8z6NecQS
         Deog==
X-Forwarded-Encrypted: i=1; AJvYcCWLvqv0IDvsfxqArHfz/uXZmMMZssRsD2kIqyt7KDx8fD9OIFiyGt3cyyE9OxKIAMv0E11U/B/+6yE1Vn6i@vger.kernel.org
X-Gm-Message-State: AOJu0YzOVYoOapKhGQP5F1nvWA2cgV8yvKg1YmMyJVAyZjMHRABteNoL
	aXlpLPZsjZS4WvaBRonZPXuuUa0RvVvc+PSQ31gfTMh2JnMpKPN/646MvMS1MhmsENyFMxX+DIk
	Avn/YNeimsPQOnXt9KNQYRCaVWuuka/WThY5u0AxeqKIomeESd/o6Hw5xyqz2ojs4
X-Gm-Gg: ASbGncuAHT1bxPU7Vm5IF+pUZ5slBTT+chrqjoZwIDJx1f5IDz/DocETaPvFyIzRcoA
	mWKxmtvixLJPWDtjIZHUOTcQp3sZnNymxBXB7hs7pX6OqbXEEyX9kZb+IJ3t22UfCPlaNiN2OkZ
	FlHwHYqXvRHSGUGYLSStjCwztaEYtuoCGSt6ioRjjPyUMLd9BJgVwPUKST8fgAzXJ7HZM+jGCx1
	diJTvKfg3o3EeqOHr6q8aGCCm4c4qj5QDEMP9H6QECFzkYTGb5pLmHA6zqPw1A2tEUM1LOsfu4+
	uyOJSGGF19L/wxFhaZm9VCYeSj1gokeXgHDm8ZKoIxZQA4h8yW0YyR2aJ14ukFG4DqzwPg==
X-Received: by 2002:a05:620a:2989:b0:7c0:b588:992 with SMTP id af79cd13be357-7c55e883133mr250949885a.9.1741714018103;
        Tue, 11 Mar 2025 10:26:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG4PwZSzygwJpbbK5qOQtPXbubl94YgeE3+YlE6YRMOV6fyG+MXaxjRZxgCRgDfKWP75HKduw==
X-Received: by 2002:a05:620a:2989:b0:7c0:b588:992 with SMTP id af79cd13be357-7c55e883133mr250948085a.9.1741714017691;
        Tue, 11 Mar 2025 10:26:57 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac291796eccsm453035566b.25.2025.03.11.10.26.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Mar 2025 10:26:56 -0700 (PDT)
Message-ID: <f93baac4-7415-4d31-8000-74f42340a933@oss.qualcomm.com>
Date: Tue, 11 Mar 2025 18:26:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-crd: add support for volume-up
 key
To: Johan Hovold <johan@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Johan Hovold <johan+linaro@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250307171036.7276-1-johan+linaro@kernel.org>
 <2aac1aff-694f-41f6-8849-f1dfe802a1f4@oss.qualcomm.com>
 <Z87Yi6IQEIhqu27O@hovoldconsulting.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <Z87Yi6IQEIhqu27O@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Tr8chCXh c=1 sm=1 tr=0 ts=67d07262 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=n2lFrQNbv3neQDgrPP4A:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: BCCIaIoiGfhvm9tzGVer2gWmnqCl_Tgs
X-Proofpoint-ORIG-GUID: BCCIaIoiGfhvm9tzGVer2gWmnqCl_Tgs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-11_04,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503110110

On 3/10/25 1:18 PM, Johan Hovold wrote:
> On Sat, Mar 08, 2025 at 05:26:26PM +0100, Konrad Dybcio wrote:
>> On 7.03.2025 6:10 PM, Johan Hovold wrote:
>>> Add support for the keypad volume-up key on the debug extension board.
>>>
>>> This is useful to have when testing PMIC interrupt handling, and the key
>>> can also be used to wake up from deep suspend states (CX shutdown).
>>>
>>> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
>>
>> I'm lukewarm about this since there is no "actual" button for that.
> 
> There is certainly a physical button on the debug board. And the UEFI
> firmware also supports it (e.g. it can be used in GRUB).
> 
>> Does the power button not work here?
> 
> For wake up, yes, but not for testing PMIC GPIO interrupts.
> 
>> If systemd induces a shutdown, try setting
>>
>> HandlePowerKey=ignore
>>
>> in /etc/systemd/logind.conf
> 
> I'm aware of that, but the volume key can be used without updating user
> space (possibly also for CI testing if that signal can be controlled
> remotely like the power button).

Alright, I see

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

