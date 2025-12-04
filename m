Return-Path: <linux-arm-msm+bounces-84413-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B46BCA515B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 04 Dec 2025 20:13:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 14FD2306A1DC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Dec 2025 19:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1DC2341062;
	Thu,  4 Dec 2025 19:12:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0jgh1yA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TA9ZNgmp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468AE2E6CA8
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Dec 2025 19:12:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764875578; cv=none; b=AmiwaWdf4sJTF7EWg5mJ7LrEWZSTBgTP+vlUCqzzXQ0kl9CJQt71md8OQFNn8RaiDpc8v0mMuTZS2Z0HWV5rgZa65N9IEA0GNCWuHvg52E94A6khWL583xub1bDGMSo/lR6y6aS7L6Qu3ImJ6dzuFkygW04H3V6x8hdj3h3IX4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764875578; c=relaxed/simple;
	bh=ZSYu37fsQ8eaB5am4EVsHCPdVSE0BP/RLJg6zrrYJAc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u8sSq25iNfIMfF0FrZauXliGp0Z9UF0bHbiEnOj9r3kvyGcJo09moufyc4h3Tl23kYzP7LEpUVJxJznbEkC98t2tJVaaRBZo5/fAR2p91blu48BWdyrj4b7C+/2oasHkp5XilLpxRyB2SK11vclbrG4uPd/aIWRdDpoNl1i52ZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0jgh1yA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TA9ZNgmp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4CA4vk909707
	for <linux-arm-msm@vger.kernel.org>; Thu, 4 Dec 2025 19:12:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gMXljUTHUDZrazBKhYz0V7JIj3Pmy0xVP97f3AGsNHE=; b=p0jgh1yAUdA7G52R
	iRe+CmrWAIeAWFccDeSzc5ijBonE5yR+53N458rVTrAhQWLbKunQ5pKMplfo0eNR
	70FkZZVMrYLGfKmF9YYO0LcBapZjxw/f0RFrjEef6IFWo7P0/Q6bgGBmbMOb55LZ
	rGAjnEHObZxhOg663fKeWp4e2hxUi7w/b9aXjilB6PbmsVvg3EhPywOmCOXndanu
	zW0UBnmFyTE3JCMuiSRzAzqjFwKpOsMLngXQqLAlh3rAEWPYcEN0OSJdaR8DIT8q
	wtltJSfGTcflq0IVZ2fEy9qJc7HucSpzrkCiYLHmmHudrudRl0GpsIDopOyRGlzA
	RxWTRw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4aua2esahk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 19:12:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b5ff26d6a9so31278285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Dec 2025 11:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764875574; x=1765480374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gMXljUTHUDZrazBKhYz0V7JIj3Pmy0xVP97f3AGsNHE=;
        b=TA9ZNgmpoMOA9HK14nyVSIQPdJVT+4mBnrucefWNC4qP5Gccj2cQ+BhOeMBocDPyU5
         2W5Uguo7cRXGbr/YpWxpSiUMcp4m0p/mb9xnA8cwfuSZbyl6gHcUc7AGntrRkMD6Gec8
         RJ23VwBgvlNkBcOy1y/mXbgueClr479qUYIoARZdsEkCcq9VrXIc/6wbysEG+2/4AvbT
         VFVYUhEzwXgSOe7+zIiYLfEJmT26yY/avcOqVwtUHQom5etQCy6NA1BTfHqfoa3xR+mG
         OWgUf4kuF/gkCvbalMs6FrhcPRUJItuVSZgwO61m/68gxRYBiOKq5AHCVsBzporFxrSi
         6h6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764875574; x=1765480374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gMXljUTHUDZrazBKhYz0V7JIj3Pmy0xVP97f3AGsNHE=;
        b=mBlwxhKMR0G1bKPnsWvs02uClfnb+EgUfspaLeO8YhaetUnPx0v06Afzyp7rh4hlEp
         qhG1y+Q2nLupNqlar53l4MDAtvoR7K4XTj8jRGj4UpU8gMEzUMZ6YA7dH6KrTdYOg5/d
         xtlpfoFxvdthOVZKN03AA8/pH0dN40CK+oktTa6dsbhBNcJ4JXQkzPmgt6O7jdIVBpah
         5amBa1HXdZlKyspKmynQGYZ3rj7KcNOyGNKkdnOfrPMQsXPpbRN0FaTG7MJugfv/R7Sv
         yvpgYdx6ms7Bv8+amqCP6DdGcPfdT2msprzmHEVC4D1mcx/tAbvUCrD5XStkoGVFDMUe
         Grrw==
X-Gm-Message-State: AOJu0YxZx5oxsW9XtLUw3YZ4L6yWnq2b8iRXAvVGR1E89l8+qtSCRtPD
	bX4WeE4u4MBex46hI0xu+QSUGtTOLpCO1eSEtsztV9C0hWrrdXx/bP9qzD/q6Fh4LiLdIlT73fg
	7jAwmqCpM8lfwZ2/OFG314I6Q+uBiYx644WoVue/AHtj8ihLJe2EXvUyz61W2U4e8jl1x
X-Gm-Gg: ASbGncuzNLOY+8zL4ddhOM5oj1h37sOwqjPkVNjCqQVi6EbM4+igLZA9nSkR7ypdPLy
	qFRZdr/H93d8YfQJDdQGac9+wdw7hTfu0o2OtxuA1cm4vArUG1P8AK7MHomtcX7GI38uaH3nLZm
	Gvfhnv76S9dHvvAuJ/xgK4pHGC2r1zplElLfFUWWbAZ4GMEDaANlbUDc3M9s9/L8A3fSdsPV0Bg
	wUrgB+xf4EzbeBaUe7AugJfhJPkjjReoq+kXFgKjN2SoAgtrbyyIhf9Uvl1cz+SMeOEzXYz4nNI
	L0t8QfS3Cst/3B2RDL2FmDwJyDb+dLXqmsqYL4OvxDZioCHe3jtl3l5pW7juKdr0Tp7HdR2nBbz
	5qXzGb57VM/F6aQhEkZPw1LRnE4Wc3BP7rmkVoYGkN/Z0GXhAswkW7WSMMndNLqDRmw==
X-Received: by 2002:a05:620a:1a06:b0:8b2:ddd3:adae with SMTP id af79cd13be357-8b5f8a71ac1mr621085885a.0.1764875574444;
        Thu, 04 Dec 2025 11:12:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGZouSKHdyV4594zTzpYT1Yr/fZY+cSCHiyW+3H6kE2eA9RTsp0/fJ6OiDHkTrFNvFXexE4Fw==
X-Received: by 2002:a05:620a:1a06:b0:8b2:ddd3:adae with SMTP id af79cd13be357-8b5f8a71ac1mr621082785a.0.1764875573986;
        Thu, 04 Dec 2025 11:12:53 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f449b160sm201125866b.23.2025.12.04.11.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Dec 2025 11:12:53 -0800 (PST)
Message-ID: <170f3adb-6f35-4113-b114-6c677a7851e8@oss.qualcomm.com>
Date: Thu, 4 Dec 2025 20:12:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Enable AMC6821 fan
 controller
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251204041158.2613340-1-gaurav.kohli@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204041158.2613340-1-gaurav.kohli@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vMt0dBiPCqNJ1OsemzGwp8z5Wpx_0L9F
X-Authority-Analysis: v=2.4 cv=Rv/I7SmK c=1 sm=1 tr=0 ts=6931dd37 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=dxXtgrj7fxIw5hbx2lIA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: vMt0dBiPCqNJ1OsemzGwp8z5Wpx_0L9F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDE1NiBTYWx0ZWRfX+AQsvSWnh29o
 u+EnIjesl7gSh00RbCrtOMQY0kkkWWY9xeaopjncKvoEa5SruFeeRUMEimpy9yEgQcAJWbE8g8D
 9VXo836eLrWDNQVAVDmjGRgsFQMtG70SMeHTUA69vAFb9ZMJNFHOlFu/LBie9L3T4PH1iuFGyWr
 0LNlIP7qT4yJVIq6QVsUvPmbDbRb9nKSM8rax/c1yw9kXXr0YBic8Tu5vNhN/P5JGD8rNOjEEHb
 rx0elMMXh3Rokwnkx9jJcfw9I6XPaCn3fo18FE5cOGT4YzbWfBQmLqdS+6Ev783GwEbv9uyl5MD
 ynt8wjRHxZlrJKr8vf7ZQW1KWseABnRqqNE+FK5NHXWn3yy9gdHus2Zrylw4xixQdislKMm/M0i
 qOkQa4hwF4n8OfqycEn3fmBRRFXqhw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 adultscore=0 impostorscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512040156

On 12/4/25 5:11 AM, Gaurav Kohli wrote:
> Enable AMC6821 fan controller for monaco-evk platform and
> configure pwm polarity as inverted.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

