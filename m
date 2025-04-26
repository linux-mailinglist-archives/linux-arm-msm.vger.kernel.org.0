Return-Path: <linux-arm-msm+bounces-55824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E491A9DD38
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 23:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A81C1B66677
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Apr 2025 21:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29AD11FDA8D;
	Sat, 26 Apr 2025 21:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fgjrAf1v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A411FBCB2
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 21:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745702692; cv=none; b=ihtYLYhgrtKLNsTRif0RUSyvYJv/QPjiS87+oFRWc9DfsZNoAhQtPhnyMOehlBhruYdwEbZWo5tntqwMMU8q01hErIlbozjkIqPAjJb9WLiK3qg0+B8w1/qrT0U1MSi4mOqkc/1YhLDf+HS9ZMq3h8wuoJpOsuGEL7cPj7bb0V4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745702692; c=relaxed/simple;
	bh=+e2jnoEU0KW0QXVKjWeyp4SP2tcdhAZ7keq7BZMyPA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AEFsEsLioMpAaZftkbXWtDAIaihY5xREMCK0MwvLZqWdLnroAun9O4wSWA6zTN2PrrZqksfo4LUD+g1u5cqEIoS5WXIJFiVWOZN3ZzgTT6EFim2S0m9UYtGgvMmbGkcJFQIJrTpUk0qmKfmeczUmXRl/5IpVzkjlyilibDHRB3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fgjrAf1v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53QGOJQK032053
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 21:24:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WR+R0rhCOjYqlZUhhYUXJ0Rz5/y0uM5IX/cfP7qDHJ4=; b=fgjrAf1vO8jRmSJz
	tWe1iBFd3RV+TWEznsjja5vdAx2BbLr45XiDh37J0Ccq9eJJNjoqgwidMInDyk5n
	iWF6d5NgwymuNCuu3oMjEDDV6DV4Up5pMfI4qFU2lFsXTM6NPOgL8c+E8RgQ33O9
	I1FRyApyHBfU1U368E/0NMZXHNFW70cqho7CUe9MrpWT/7RSvoQm9y0Y21qRGEfq
	GKxqOKuMXwloz43augz0oGF5lUKjOtRvdqsEMPxiIrT2UZUpvNhnzF8hvNAY7Qej
	Kx06axuzKbf3o135CE4mf6cMtzHdiDHaOz+zkWjCnY9WrlCxYXjx+blG5IkEQvYG
	S6Iuow==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468peva80g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 21:24:49 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e8fd4ef023so8695106d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Apr 2025 14:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745702688; x=1746307488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WR+R0rhCOjYqlZUhhYUXJ0Rz5/y0uM5IX/cfP7qDHJ4=;
        b=Sd9iZ2/2zHrsvOLde8cXF7yfN7CDtjKECTdmHUMEIMtd98a7pag5W6V0fDdzJhoPax
         hLSe/gi5bjiT4L/HGnLohdPtMg6q5eutwWoqPM8o+vKIRCGTTjRrKngh4pdIBs0pZzMF
         HGimx0kPau83kVOO3m7K8twBHSWWIxObL8zXHaJUJoASA5tNkfslz3kiRnuXhyTJTxk+
         bu9cB9ovj7TWNSHgOLmg11fbmyyFcdii/WC6/SJ3IAOtUTsf0N1mjLKfYPg9UTo7fWix
         40uGHYrCaex0EFEoTw9ywkrkFoj+v+RYvCWqR2lrP67Xkuk0krNXSx8/btPpEqkTQVzd
         jpvg==
X-Forwarded-Encrypted: i=1; AJvYcCWN+ShOtxyMSuEBWkrmBJBse6EizL89U0rXqTdWg6+ItEqwMUfzVUgOjJCDf6MSQkdbyebH633eGr4JgEAG@vger.kernel.org
X-Gm-Message-State: AOJu0YwoFufJigbh0RDQXCT1cmnNw42T8YG3tVqHOv5Dh5Zl87y3Td0A
	dKb+WpbJZtp5Nd/HmqUH31mveVTvvxdz7xiGUakXajTX/YwXIAIDrrioQtFVx7tTWitgZbXKT44
	FzEwk2MTyl983/YzzbozJWZaKDUw5h3zZcMqj4D9SincagD1f3mGwRVVB3xd255qO
X-Gm-Gg: ASbGnctrHlAEpwm2FqnY4zEVO1qqciXUSxAyTXjoMLbMI06I6CW0WiKA9fBhayZs0A+
	tmh0cBn3lG5bLRY49X07oP31ck46X/e4f2A4tMJzjCpbU/MfTX6bmFDILkcBo3cItQ2FatXiao3
	bb/eyysrdwqByRPWhz5qpLwFtbL/L/zpLUVUc82pVZZ+rXFKX3Ig45kaHWfxezlLqe4yzeyxigB
	7FUjzMlSmbQQqPH6RyTy8iinpACcyOdAgy8eAWpjHcUd1mmDu0OuILFV4HYWcAK8mGojcnqay5a
	i4UPJK9TbTR7InuaEDAEblFohooJ6UpFmzz4jmvt1OJjEHSpcQHfj6Q1cXWs/DPEKIY=
X-Received: by 2002:a05:620a:4723:b0:7c5:687f:d79d with SMTP id af79cd13be357-7c96071e76cmr432500585a.8.1745702687804;
        Sat, 26 Apr 2025 14:24:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE91mB/OTCAHM6ZPMMnYcSN+AYgw89fz7uJMpE+BIsfhFRJH7wciNvcBCPhWb0E3BpFD0EuKA==
X-Received: by 2002:a05:620a:4723:b0:7c5:687f:d79d with SMTP id af79cd13be357-7c96071e76cmr432499085a.8.1745702687493;
        Sat, 26 Apr 2025 14:24:47 -0700 (PDT)
Received: from [192.168.65.152] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e587f1csm343657866b.79.2025.04.26.14.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 14:24:47 -0700 (PDT)
Message-ID: <dafd9a80-9aec-404a-88bb-dfc91c8ac224@oss.qualcomm.com>
Date: Sat, 26 Apr 2025 23:24:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] arm64: dts: qcom: Add support for X1-based Asus
 Zenbook A14
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        maud_spierings@hotmail.com, dmitry.baryshkov@oss.qualcomm.com
References: <20250426130203.37659-1-alex.vinarskis@gmail.com>
 <20250426130203.37659-5-alex.vinarskis@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250426130203.37659-5-alex.vinarskis@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Pvfz2HYj09PQbpCU1dLOdFf0C04XRpAG
X-Authority-Analysis: v=2.4 cv=aeBhnQot c=1 sm=1 tr=0 ts=680d4f21 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=04dXdBH-sfCwm-JsXqsA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Pvfz2HYj09PQbpCU1dLOdFf0C04XRpAG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDE0NyBTYWx0ZWRfXyHjb6ZQHUArH pDepG9Dpr1l9V4b+oeoago8t2mn1F9ZV/x/bYW0PmdQRCLEycat2To5hzePJqZesdMKx+Qya4qi nCk2V6bywXnihit8cMcPelf/eOaToRbpyPzwOGb83NLxcpXHam21fmZ7WRXiLrMRDkG4liXoXx3
 6Q7l3AKpr2n97NMWYf8X6SdSIzZDdsnj3/lAURwmjw7dA8BLpepM8Mus88zkOuxH8dwS4F+1cZy 5MdCez2IazSwhxPSdjhRTRtIVS8DH7LsFZhGqUIWU/6aZoDE5tWdutcotULZmqGubpaySiSl0+E bIeOi1ZDe9h5e/310tNC9eR7b9/Vt/jVn9Yh+F93dY4/rPs/rADPjNis+TrDcyKIz94AZu8g1jU
 izMicnuSOrLQUsV1/EuvkSOs29/5HdypUPQZgpWztn2u0C/n8r+Hg8/uFW2Gtxl8qSMxk90H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260147

On 4/26/25 2:58 PM, Aleksandrs Vinarskis wrote:
> Initial support for Asus Zenbook A14. Particular moddel exists
> in X1-26-100, X1P-42-100 (UX3407QA) and X1E-78-100 (UX3407RA).
> 
> Mostly similar to other X1-based laptops. Notable differences are:
> * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
>   and Qualcomm FastConnect 7800 on UX3407RA
> * USB Type-C retimers are Parade PS8833, appear to behave identical
>   to Parade PS8830
> * gpio90 is TZ protected
> 
> Working:
> * Keyboard
> * Touchpad
> * NVME
> * Lid switch
> * Camera LED
> * eDP (FHD OLED, SDC420D) with brightness control
> * Bluetooth, WiFi (WCN6855)
> * USB Type-A port
> * USB Type-C ports in USB2/USB3/DP (both orientations)
> * aDSP/cDPS firmware loading, battery info
> * Sleep/suspend, nothing visibly broken on resume
> 
> Out of scope of this series:
> * Audio (Speakers/microphones/headphone jack)
> * Camera (OmniVision OV02C10)
> * HDMI (Parade PS185HDM)
> * EC
> 
> Add dtsi and create two configurations for UX3407QA, UX3407RA.
> Tested on UX3407QA with X1-26-100.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

