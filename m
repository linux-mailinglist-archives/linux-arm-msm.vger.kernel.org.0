Return-Path: <linux-arm-msm+bounces-46224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05470A1D45B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 11:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 58D07162E71
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 10:24:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75EF11FDE24;
	Mon, 27 Jan 2025 10:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZoJXuiN1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 157EF1FC7F9
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:24:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737973456; cv=none; b=bZA4bg4eh9a+JFwmi1JOBBxlWS4bZp6d2wK2v/jM61ndUtCjfIoC4S4HD0ViMjPrZ7fIv+nyKdGkVlYoyuqb18aBZDSfJpG0pcg1Ec/BstVYiCLQOw1G4oZUJH2L7ti5uTOlIpaQN9SIsLwZDgGP5Q/7NEZGV9ScXgb4KDMUehg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737973456; c=relaxed/simple;
	bh=PeguVylUEoEAW+1MGSCEGHhKkC9BF25hVfkYll0Mi0I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a1jrVUSfUyE+e3SZU7lyVa+dqpqdxFcn37Uc1Ovz9cRDhsaLvjpBNPyoC6p7he++ffaiJby09wYhdOuP5vPEeRu+Xsv/ZYQ2ebi6gDaPgoNjG07pc29RzBEPIivHjRwKSMMMzI5uZYFZo8dgOtARlOPzSSZtO8lfYAfkOPqiYgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZoJXuiN1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R1bmUk030713
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zqJcBRYJ7hADnVgOR6KgK89epzxGP9SaDVydnZCx8rk=; b=ZoJXuiN1aGAA+iOK
	Hq6ai7JrGHk5tj59plC7YXv9AKsY4Pcf46ZR28kxNgHtEcDPWwVEmrhKJYxG+j7r
	g08mINZ8Do2A0hNlqXe0dUpZjv27CMG+KejHojsllSxDeVdJw0wOhYqP9X82yRdo
	TuEzX9rEdH3aVc4c2Bg6GVmRpKx5KzkYIaj8t+rNVHVRfyYqJlP8jmniA520u9UB
	gEp7uXDNIFwFzLwpEWbq4+Mrpoew5uHIvcD79GOovmfriWr+5pmURSWVBH0vSYcx
	ehXaQck9Djs/alNXaVUnkqXoSPCFronL3hNANNPzvf/IH9jntKViHSk9dMCr/pBX
	q1aXUA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44dhu9ht0f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:24:13 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6d8f15481bbso6965316d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 02:24:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737973452; x=1738578252;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zqJcBRYJ7hADnVgOR6KgK89epzxGP9SaDVydnZCx8rk=;
        b=S0DH7Q4fNl7/wKXikJpOx4RJBYqVDFcbCxjkjnikxFDu1FaMS7k7q2y7mot7QmcbLL
         gJqFNg7FKcvrBrEzkKKjsqhqou5qpKjUhAqnxzl028Pl95BUbj665cVWGWmurdVkFWS+
         mZrTCdAIlNiGl66Wfg4AExxmnWBW1F+3Xqq8DqNBO40p/bzIu0NCEOjavnoBc792W5zc
         Px/WvO10VqbZCgPq7JS5HZ1dinGafcLuXL0iGY9wYh4EtdsuDLCT3ykfq3w8vUVBaO/p
         T5jtOASP1XcbQ6d91KtQeNGVm1bh9dGnDeHh+9li5I5cudoO0aN6gVJGa7X93OC+eSH3
         VG+g==
X-Gm-Message-State: AOJu0YydfNYAAtSehn7NEN3vp41CHGdU2SIiTi1RRh7yvwvIV9GJZpdq
	3bleEm0A1c4Ll0HEzMa+zVf4tq16kUCRpgxFHNIERbLzxL09j0mv6rxuVZvVnoO19kghTxeyXiA
	kF7XRui2yrnqj8AGmCU2BtZS87uReCkPAW5wffeEWsrpYTlNUpR0+rfIVcDmrEvB/
X-Gm-Gg: ASbGncst8CSyzBco76hNzOubaMSmlsuEelBAUoloLFGyhu3pAW5jVeXyGp0twiUSd0g
	BVB5C0muqvkzfHeYuEBAIaIKt22x0WlHbRdT1ee/B3/Myb8QYc3trJWxqLA53ZsgBSvCMQzzUGj
	K9EBfUbwPg61FTLC7XNffrD6eKPwnT5fsHlEYv5tArnq5Aw15Vn1Ty+oW4U/nUszuSxBrgSTsaU
	7L5et1T7TDUXRFxbpLYkA7ziVK3vnfRcShwdKetfNfShB97tuClR+ZBLtF8pjXuPyIXUv3OgQGW
	ZGZXpErdSI1uB2MMWpCGHdMZ6dMeePAFFgl1Ea5EYI4Exy6I745aWCw7NaY=
X-Received: by 2002:a05:620a:24c8:b0:7b6:d26e:9d76 with SMTP id af79cd13be357-7be6325c432mr2277213285a.14.1737973452453;
        Mon, 27 Jan 2025 02:24:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFI5PkaDqCqGnOLm5QnUI6GZTKsLoTu1/eoVLVVx4da1WuKh4k1qwmx2Qeio9Ul4VLt4wA5NQ==
X-Received: by 2002:a05:620a:24c8:b0:7b6:d26e:9d76 with SMTP id af79cd13be357-7be6325c432mr2277211685a.14.1737973452102;
        Mon, 27 Jan 2025 02:24:12 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6760fbb94sm563446266b.139.2025.01.27.02.24.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 02:24:11 -0800 (PST)
Message-ID: <70614c91-326e-47ee-80da-12f829d13459@oss.qualcomm.com>
Date: Mon, 27 Jan 2025 11:24:10 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sc8280xp-blackrock: switch to uefi rtc
 offset
To: jens.glathe@oldschoolsolutions.biz,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
References: <20250122-jg-blackrock-rtc-v1-1-3b05cd85bdfa@oldschoolsolutions.biz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250122-jg-blackrock-rtc-v1-1-3b05cd85bdfa@oldschoolsolutions.biz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Lnz_xhoPDBJqGsfQwNTr7H9OxXcvD54m
X-Proofpoint-ORIG-GUID: Lnz_xhoPDBJqGsfQwNTr7H9OxXcvD54m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 phishscore=0 adultscore=0 mlxlogscore=789 suspectscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501270083

On 22.01.2025 7:41 AM, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> On many Qualcomm platforms the PMIC RTC control and time registers are
> read-only so that the RTC time can not be updated. Instead an offset
> needs be stored in some machine-specific non-volatile memory, which a
> driver can take into account.
> 
> Switch to using the Qualcomm specific UEFI variable that is used by the
> UEFI firmware (and Windows) to store the RTC offset.
> 
> This specifically means that the RTC time will be synchronised between
> the UEFI firmware setup (or UEFI shell), Windows and Linux.
> 
> Note however that Windows stores the RTC time in local time by default,
> while Linux typically uses UTC (i.e. as on X86).
> 
> Based on a patch by Johan Hovold. [1]
> 
> Link: https://lore.kernel.org/all/20250120144152.11949-7-johan+linaro@kernel.org/ # [1]
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

