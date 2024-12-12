Return-Path: <linux-arm-msm+bounces-41763-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA7F9EEA73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:14:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 922C916BBFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 15:09:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAEE8217F26;
	Thu, 12 Dec 2024 15:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fx3MRZvf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F4F2163AE
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734016144; cv=none; b=DjkwUlk+IYzA3+3MB8jxLEZMo9Scfch5US75Elj0uGqHi83yZbQLsI0kZlTiFerPphMRlOQnKHBUED5CmeG0bYTGYeObK2CKjUVZBqgurFBxhePzvMKRNjf34ZBv2eYGGHelTPwMv5GQeXHV2j1cAFFZ90J+dZN9XFdnn3PXCnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734016144; c=relaxed/simple;
	bh=7k49yoU5iCLQkIkTaX85Jb0wjiQkl/LFPcm06qJVtIU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WriOXqoiB5onQ1O1xRk/PacvUQFX+0NTCs3TPpDBpCt3wQEe12WFciTTeQSvatsO7Wz+kC/UfY3cdB6x4xu3xxfab/dRrlS/s+SLQ//0wWHGJMAxwYRm4S8ctUychfd4CkYshGbiUCUEwG1eZbEqNNJ3FhZD5+tFEY6u74klMYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fx3MRZvf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7IROV001900
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tbbmtuIopE68EoB/LCcm2ylXTJ6wVvJcxHK6UUbzlZQ=; b=fx3MRZvfFuVz4idz
	FFciT0GzKA7l0e8WGu3A5W+QnUpXeoRIb62Feyc5tc2Z5fyvu//vPol6GqPYyGAE
	A9s602mCxV48NUcvHVZOrlCX9HJq7PAuhxiWaXvVsa676aWrX3jYePlJYCmzmgFn
	//gtxUnZY/6lqZGOj/eDHtuYKwNetPcdUcTNGBHscdGPIxWgbc3Zhz3QLVbG6aSe
	2ptyzpZsMfYajmWAP709AJXzN75dPY1JW24zS7Pw+iVkhe/PA1I3/3S4wXmrfAM4
	HC9A0qXY5jwgAdrRj1UheLe8GHdkVs1y7mHvZbnz9rn5AaajUoprxZBgN3vQ9fiA
	OefkjA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43eyg65vyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 15:09:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7b6d50cd3aaso777385a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 07:09:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734016141; x=1734620941;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tbbmtuIopE68EoB/LCcm2ylXTJ6wVvJcxHK6UUbzlZQ=;
        b=QdVA/jkuDxuIhQawsMlgN8A8adcGRzunikRRkPWmX7LECAfm1ct/MOMib2oryaYFMi
         eYl9djWWIAbJzNNNDng1OFQ78v4yKbBPcpNcFc87Q8GlSsMfvO9hAKk3RuSwyxWT2Ze6
         ELgtFBaQHzxXKqrdCiMKqrndERc+zb3eKh7Lqzvya+lievZneu7ZazfiCyXjMd7aoRTp
         K0yAXK0R+ThffxluEcpi5HlXK/L+T5bE+E+2Jlz/Fy1UPCNhc/0VsAu0Z3NV23UTRwCK
         GzkwbzlWTJIusrL8pYRT7guwyKfUrSnaaf+USGdzHo955nZekXC0Cl8Bi2FE/oTVmM1s
         nrTA==
X-Forwarded-Encrypted: i=1; AJvYcCXMSgyOTwTq36yLlx4aqDxMpmBooBcAy3D4wv2h3dDBYdwfAmdAaxK2MmNpdagO3dBmymQaBGgBlLJJoIyS@vger.kernel.org
X-Gm-Message-State: AOJu0YzjG5589p80BqNnscnspAcy09V+kwMMncNQIlBjvuRapIBS7JdI
	SDZN5dwX7cPhoFgKZqneWZ07ILZ0/RfsOMKFix6GYT+u++SLZTkk3ugEUydEKsyWZfGj8hI3Sps
	ycsHuRKrjCWFslYTRbNzEsn+pOReYR/Ml48lNjyU0q2M4oRx2LeNxpwxO2WtkWjFp
X-Gm-Gg: ASbGncu39sivoGfE2+pKqK50ScNdp4OiPh5kNWAKW9/8mgWJ2jWghTOl/968Xe2Qg6e
	gE78YBHcTUf4ivNYbYUkU2ykz5aUJS+kVjS7CzuM4xQNjOTPK4vdtGe+av91A9OfO0tmc7kkc2d
	agBoZXBXpNXUzcK/a6Qmt7wdYjK3JARS75+eEN0VXB9YNQEYS4JZKwz8CmG9UvQ2HYIJQ5+uvwv
	gBOyZtKiVbtWmNml1dwd1zh8EXbhw0N80wbiV4YEoEBZaFnOLTeEPFA/efDYry+VEd5+k698tzJ
	pNc0Ij5d3LsWsLeQbSQzj4bt5phkM1BCA1wfxg==
X-Received: by 2002:ad4:5de9:0:b0:6d4:1bc2:386c with SMTP id 6a1803df08f44-6db0f72f2e7mr2957966d6.6.1734016140990;
        Thu, 12 Dec 2024 07:09:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IECGBD4UFxTS34V4+BN0AUO29FSYDbonTJqifxpjHb1kM0nyKjYMHeI5BXED/P+sXetih2oCQ==
X-Received: by 2002:ad4:5de9:0:b0:6d4:1bc2:386c with SMTP id 6a1803df08f44-6db0f72f2e7mr2957816d6.6.1734016140532;
        Thu, 12 Dec 2024 07:09:00 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6749d08efsm718200266b.29.2024.12.12.07.08.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 07:09:00 -0800 (PST)
Message-ID: <26609a46-7d89-4e7e-8513-59cca81ea10b@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 16:08:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: x1e80100-qcp: Add FSUSB42 USB
 switches
To: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>,
        Johan Hovold <johan@kernel.org>
References: <20241212-x1e80100-qcp-dp-v1-0-37cb362a0dfe@linaro.org>
 <20241212-x1e80100-qcp-dp-v1-2-37cb362a0dfe@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241212-x1e80100-qcp-dp-v1-2-37cb362a0dfe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YCPet8eNna2Hxq4UQM8lNRroECyRwqp_
X-Proofpoint-ORIG-GUID: YCPet8eNna2Hxq4UQM8lNRroECyRwqp_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 mlxlogscore=636 phishscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120108

On 12.12.2024 2:08 PM, Stephan Gerhold wrote:
> Unlike most X1E boards, the QCP does not have Parade PS8830 retimers on the
> three USB-C ports. Instead, there are FSUSB42 USB switches for each port
> that handle orientation switching for the SBU lines. The overall setup is
> similar to the gpio-sbu-mux defined for sc8280xp-crd and the ThinkPad X13s.
> 
> Co-developed-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

