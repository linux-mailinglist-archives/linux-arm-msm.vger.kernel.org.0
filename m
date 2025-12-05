Return-Path: <linux-arm-msm+bounces-84448-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F1853CA796F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Dec 2025 13:38:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 37AEA33C8633
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Dec 2025 11:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BAED31A54C;
	Fri,  5 Dec 2025 11:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WKRlriKn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bnCz+7ef"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B762308F02
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Dec 2025 11:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764932588; cv=none; b=UeQHqY1eteoC/kxst24rFAjHcS3V/sOKNhPaULJ/J3efLalZjaOMwLRcFp2EPUWPLKoqUp2kOoej60hwN8iyZd9pBmgAxHCApnH9uzAIHRh4HAuhdvacAwdeB8ka/eCMRYDkDlIw2tiZBF39MqJKAU6H0vgj9iPid1AufZWaNbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764932588; c=relaxed/simple;
	bh=7sm6Qzl4OK+Zsy2SYL09otIkmjweIWC1ipsA6O+5Uis=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X7gbI4iPPmL+i2sQvn5KuJhAktBhsg5+5P8JDup6k4NeEO3S8dKXA9BSSZ41rZR5b3DA7nhjpM5B+8dK3wuQqlemzZM9o86zwhRlz/O8h0gQmC2Suom+aNdxRtVZlxmPUel3wCwyzJ0qGA7l09ZfS+LeGYdScAgF4VOgLv2QUZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WKRlriKn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bnCz+7ef; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5AORtR067639
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Dec 2025 11:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ou1J8OmhSXxOLkY0gJ0i3TxA/9j3AaJQmvgc+HaMXA=; b=WKRlriKnpmyptXOl
	wjY4DZagU1TvaJefdLOEKa3iZgpykfuATiQpV1y6m7N9cs5qgw0KGF+4jatMAldg
	/xVwSX2qoUDTSP4EYaRzKkxEmDANUDkWktFzvhDe8nG7i5VDI7f7XPco3msN+7HS
	1kfdtG5g3cN8gDst2EXk9ZDNJvyl6fQhg5AV7GKDRgrYqvLvGYJUU43DLdDrH2RH
	dcRPurZpKvuu9nXO+1a87Yf4/Jlfya+Q9Eox+n14+ypGhATgI2P9UkAsEleUGA2W
	AS1YGuRx3/oxxLB31PAeQnTX+nsHi4hSRg7aSx96xq75e1CXh1V8sXgMdYFKEAwu
	NDpiMw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4auwm4g3dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 11:03:03 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-882384d1cc2so6350556d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Dec 2025 03:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764932583; x=1765537383; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ou1J8OmhSXxOLkY0gJ0i3TxA/9j3AaJQmvgc+HaMXA=;
        b=bnCz+7efna/bdiBpz60tlRqUjyrR+pBM49YeKz3UYiBUMihkhUVtarihgH0FsztpHg
         EWN4zeT3OpV4rtNVxx4YkbKj5aNKkKgKPcE6zy99k9yMSJ62iujX1+EO0sgWZ9Z00aMx
         Tg2mWOKf0XqL3TzKhirPZmrm58I2NHl4MWsXJQUyJHsNgRP1ONn6Ohupjg1YAkC93pZw
         BJBaXjVuyKRTjrkicOq9z0meFpuF5eaZq0rckjnd+M5/QyhPsaNC/1LifpPbjD8wos8K
         9Y+yFKQViHtr1ttEEu7HSQTpsNU6YtIq7WTu+qS8LI0v5SxnrHflq0eCrpqNezuuv3q1
         MuUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764932583; x=1765537383;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ou1J8OmhSXxOLkY0gJ0i3TxA/9j3AaJQmvgc+HaMXA=;
        b=CMw13Q9Z0LKgcLbncYGzweSjcGRr+iflwgcxg+vbsVE8qu3W5AZYyBxN64JFvI4tjM
         j2yAumpkasdIxyQvRhQwDTR08YulR8qyOVT/v807tq1kUD1A1OtHs3wufZqoSUFWi9Ia
         54aWip1Bt2Xl6McpWVphpIh+sT6twtsn2cgTEdIE2aX7rcGDUewwg0i+Xd0IbSq1s6/p
         IidJJCX8zCgozHjYUN4yZDn5hKzQGZ+Rh49V7Erj8ssTZSeEvJpuZPZvh62DeUBuQNWc
         0eE/T2IWZPiXb7Q31WuGB47JkjanLQELiP5v1407d62pj/LiV/Ree1XUgxqf/Dw41ViX
         xZfw==
X-Gm-Message-State: AOJu0YzHhy4ce3aVgIfEgrraWKMAQMaWci2ADHlhvCcNaUAIhGmU6idu
	3F5oXwgxpY5zghNzHDwwvmYj7DQASUvoGDmAa4Lydpp9nib247b8dulQlCVVP22m3jLNXNa/p/Q
	46ifPVrOT414cMwI5r4q6ncuR6unGrqd7tUPNklM7yYp/mECFu6Oql5Md+3zwSvYXpEpW
X-Gm-Gg: ASbGncvnGKQ25o56Z5M1VVrwNcxKB//3nXsbB6TsOjkMIbZxlQXyWhqZ8OjKA22phqs
	tA0OemoDtZ8uMGv5aVy7wVD2OFlwEot3XaS2fC30tO7PgQUG5Hyr+E5m8oawERGC6KIT3vS1pLm
	9yWP7VyxZ8nz5Iru0LUUJIrEXRbT1b4UQpd6YNRVZ82bX9DTnkEU1oH++RmYvpf9pjQeF93AgSL
	JeNDlMQ5hQSt4OGFqPgz78M+wa5Fo/XFIwwk1SYD8KmuVFICmBZ+sroIUBIJhFCnkk3siujk3lB
	0L2OiRp0jA/l/mvKtepGiWoDzr7LRB3Ih1Nnm0h7EoqpCSvGJjB1WMQqwpONcPoLQPECog2SAJk
	qg0Ix4WoKpTK/kHkdk0RH4E02DycwJ6n11nmPb9rB/r7qAfHpKyLnK/iKdDIx+uKP0w==
X-Received: by 2002:a05:620a:4102:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8b5f950602bmr938550885a.8.1764932582429;
        Fri, 05 Dec 2025 03:03:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXACovmnj7h+3fz+cfp5hKQZd4PH+ptjhYG+CwoTgpXwak7aPDC+heIVa7ZHZWtdZc0MzByw==
X-Received: by 2002:a05:620a:4102:b0:7e6:9e2b:6140 with SMTP id af79cd13be357-8b5f950602bmr938546085a.8.1764932581959;
        Fri, 05 Dec 2025 03:03:01 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-647b412e2d8sm3547240a12.34.2025.12.05.03.02.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 03:03:01 -0800 (PST)
Message-ID: <a83341e7-6dd0-4d58-8416-63e2c797a491@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 12:02:58 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: Add dts for Medion SPRCHRGD 14
 S1
To: Georg Gottleuber <ggo@tuxedocomputers.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Srinivas Kandagatla <srini@kernel.org>, stefan.schmidt@linaro.org,
        stephan.gerhold@linaro.org, wse@tuxedocomputers.com, cs@tuxedo.de
References: <20251204155212.230058-1-ggo@tuxedocomputers.com>
 <20251204155212.230058-6-ggo@tuxedocomputers.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251204155212.230058-6-ggo@tuxedocomputers.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=T92BjvKQ c=1 sm=1 tr=0 ts=6932bbe7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mVys4owkHv7G2Y6XTNkA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: RygkrjYafWu6yNi3qWMgeVTyWJogsHfk
X-Proofpoint-ORIG-GUID: RygkrjYafWu6yNi3qWMgeVTyWJogsHfk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA4MSBTYWx0ZWRfXzztp7QhC9GCK
 f202mNty2uh7vcvgxPfD0a22LuCiIuhgp73G78EIlCb553m5P4rE4YwCWBBLT38xMEmYKtT0NLb
 oTWQrqz140VNcSkCXjCIxkKnxeAyEYz31187gboa30hfFTqUDy5I4DIfdxdHltgwvFIwIdASDvG
 0SbYQCqrOke2DziCzYwEmdsN/VMFtM00YYpz6oBHxYxws+OGY6nTAqZlw67KcDF3m5HHH+UdPts
 JJWZEUNQlBxVNbnFbdRF68SSMmRbhFLigBhVTZH2/qB8weCyYZ5skaLQxMrarUutkVIiwhBzl8i
 MbJz+Eb4uuYOwXM4Hlibph7v3lsNP4SWyvRsITHEZiZPumldNJLKjmiXVJrI/hlRiBC04aKRAvV
 2x1A33TCL6UOYQpVXhCJ56LNzucnnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_04,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050081

On 12/4/25 4:52 PM, Georg Gottleuber wrote:
> Initial support for the Medion SPRCHRGD 14 S1, which is based on the
> Qualcomm Snapdragon X Elite SoC (X1E78100).
> 
> Working:
> * Touchpad
> * Keyboard
> * eDP
> * NVMe
> * USB Type-C port
> * USB-C DP altmode
> * HDMI-A port
> * WiFi
> * Bluetooth
> * GPU
> * Video decoding
> * USB Type-A
> * Audio, speakers, microphones
>         - 4x speakers.
>         - 2x dmic
>         - headset
> * Camera
> * Fingerprint reader

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

