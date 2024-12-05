Return-Path: <linux-arm-msm+bounces-40604-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 554139E5D2D
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 18:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0AB6A188318B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:33:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26E19225772;
	Thu,  5 Dec 2024 17:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FBsTfl6L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B86521CA1F
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Dec 2024 17:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733419979; cv=none; b=nM9S5lt79aJ6E7WDBzCUQvR922gK35zCvNRRFWfYDDFNZkqmgikcSbMmLQVJkLKBN34mqoryaI2s+ynINHp4KA96Gym4Ud95PKSYLTbQ2z+9+LXGzVIjkDTpTaFAb3KpaqJTeJJkXA/gMjPBht8VfOngMWDJdg/aYvYlZ6O5fLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733419979; c=relaxed/simple;
	bh=+IgOZmfKX/Is1iXosgfbktUxRZy/UTVsOTJDaQQY9HE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=K0tKUxNq5MzH8emP7eriWY0zt7KrISf1xQavjyRW7lDRqIx2dhTdKT2vH9B6kJ8L3RkfoiCNOHgB7IWMO3kxtB0Doebu3o2VRIWlqVIM5X7yFsptjyJ1rvVTJPDxHLXqL1ncMXPxbOQnSp3f7sktV29fQEEGxB6LntlPZ8KmOCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FBsTfl6L; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B5HVsDZ027235
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Dec 2024 17:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gz3CZamWBOEOaic6jPPi6pYHFVeUxtduPAgsi15Xigw=; b=FBsTfl6LBbOLdBms
	pEvVpwqvkLb3AgVHwbv3+4AYRsKsWrZtKNvJQzoBz+tDgL6ML4zpUWXKzg31mMDD
	vldIO1BeDbOyesWObnALj5q2KpKVbQ7Lo4vxioy9E+YE5RCbfpd6Ne2RRUO18u9A
	EdTbGaN8+Df2iRricvgUM8GrhGr+txgTnLJK7GFbh+vN7y//7KW2MHVh79akWrOH
	GGN9so2zza5DxAjRTXjW8V9b74U2ndHuDVBIJz0vtNRI4nT6tSygy7soIZOIUiQ8
	RR3wyCv/yGmmkz7P18H9mH8DSYj2kzTVADRaA3SUkuRgq76kY9DoC2lJNWPZn6L6
	ME8Elw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba0kh8kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 17:32:56 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-466c4b8cab2so3028061cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Dec 2024 09:32:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733419975; x=1734024775;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gz3CZamWBOEOaic6jPPi6pYHFVeUxtduPAgsi15Xigw=;
        b=UnhA21m/7zblYTr3Ky7eF3gJZ43BAOkyWtDTbb0H19B12mKaxDSVNlP2yixb0klBTy
         naWvZ71mE3nEaJIKE8n5k2qugGnIYiChU0O6AV+0+18oa5WzX4KRSZjN9wgwsg9GwdCy
         Mwc3ecfNH9jCVEgKrRXKhypM80XhxrMJoEis2z7xrXkg8blZUOH+jO2xfRSlhMFIe+3x
         XERKDGUaQMIV+X7J/Y9rN6XEAEg42oCzogcn9z8t4RHAzM6z6dACw5Yx3cuJtgadIWJ3
         ZZfaaCf7hGaO3JS8XBnvW7VGQP4q0TU+fhpLWxQJU7tiG8ZCEW2DEZxuVukbMKEZQ/lH
         JbHA==
X-Gm-Message-State: AOJu0Yxr3o8A7bATInGht39QaNRI+HJLS6Fv+PZ32IdDhVifRbchdc2d
	Nc3/Lf+4Di66UJWNuyeysH2CJdNiPOWFdDnEVvmEJAc+ph5GWxmSm7vACoBLZFoLeQniMcWYBDf
	OEuBwDgGucyIs39oXeWJmlfQbTS1PMr9VqBvtNMbsguk1DdOTVZPtyT153brTgzaA
X-Gm-Gg: ASbGncuxC8pqdXSjN5cE1a5qPGJm54oJAkwcH0gEk0msOdZdjJROKbvveF+yy0bAQny
	KgewVn8eHRG2h46MKz/OkAztyk8bap9+I3Zbj9WvOjecGrPkxlFe8xBMpnE+NutlpGqTxkb0sWm
	K05UOkHAXvC0MJfeZ38uDnp5w4+N2LM6W2B4IB/YGODjV6KWaxWT5IiwZKebmxCK14RXhVdzU5C
	6B3jkQDCX6uCVBDfnNR+0VTn0Ef/CGHobkPY7hOih3W/praKN391S/6nH5fXZ5quHN597Y0tW1G
	zS/8drpdyMal2Xrd45pKzji09Tq9S4c=
X-Received: by 2002:a05:622a:1b8d:b0:461:2416:13c3 with SMTP id d75a77b69052e-4670ca99e79mr75949071cf.15.1733419975026;
        Thu, 05 Dec 2024 09:32:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEC48ihnLZNZLXeLdwFy2oLO/5XpjAPYBaz6r7BFaHbhKot2UhcidNQT25Vj3zVU0VERUA6eQ==
X-Received: by 2002:a05:622a:1b8d:b0:461:2416:13c3 with SMTP id d75a77b69052e-4670ca99e79mr75948921cf.15.1733419974593;
        Thu, 05 Dec 2024 09:32:54 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260eb8aasm119654366b.199.2024.12.05.09.32.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Dec 2024 09:32:54 -0800 (PST)
Message-ID: <ba887e6a-7bb2-4170-a957-d4299012ae01@oss.qualcomm.com>
Date: Thu, 5 Dec 2024 18:32:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] arm64: dts: qcom: sm8750: Add CDSP
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20241122-b4-sm8750-cdsp-v1-0-9a69a889d1b7@linaro.org>
 <20241122-b4-sm8750-cdsp-v1-1-9a69a889d1b7@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241122-b4-sm8750-cdsp-v1-1-9a69a889d1b7@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: q-1Ptt3ruIFJDXixc_VEFcrOxYnZ7QbA
X-Proofpoint-GUID: q-1Ptt3ruIFJDXixc_VEFcrOxYnZ7QbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=647 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050128

On 22.11.2024 4:26 PM, Krzysztof Kozlowski wrote:
> Add nodes for the CDSP and its SMP2P.  These are compatible with earlier
> SM8650 with difference in one more interrupt.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

[...]

> +
> +		remoteproc_cdsp: remoteproc@32300000 {
> +			compatible = "qcom,sm8750-cdsp-pas", "qcom,sm8650-cdsp-pas";
> +			reg = <0x0 0x32300000 0x0 0x1400000>;

The size seems to be 0x100000

Konrad

