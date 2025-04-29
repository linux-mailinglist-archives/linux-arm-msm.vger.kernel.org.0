Return-Path: <linux-arm-msm+bounces-56111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0600DAA0916
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 13:02:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 59CF3483F3A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 11:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 789E221ABC9;
	Tue, 29 Apr 2025 11:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iAttqvhc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20EAC2BEC2D
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 11:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924527; cv=none; b=eIR/e4HxGt4dZB9VAXvaNkTqtOq95g88douogDERMGA1V8dLuHrJHN3DBwXhiQGc/C8RbqR8gU+ArGM/0KvO2zRUKl0526MQ6Xy4VbETXW0DtBWeSjUR+mzda4rqX7qUJR1OG4VQnCjXGzFMwXhwdPY2q2d+NbXuKQEOKLvruzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924527; c=relaxed/simple;
	bh=Ig0Xc32fMWeHmMI27tiLeWyS+nuXMNJpZg8MfYTWrU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i0vRWHy3zKJ2eChUhjmXN5HN3pV1TnBzsXIDAP5SNrcQj0C4qZdeTtZBMhVQD+hkkHl4422u1U/MQtFDrk6gQkbShS8JNVvYYNXBTe/k/7Zu5yn9d9oD+Co+bxLUsldluP8QoGso7eh5nhOJ9SW7BCLBfP+H5pV9HtyoY2rpxig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iAttqvhc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53TATjxC004138
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 11:02:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MIW1j8QbMOdaLKZ0HyR+IOgl13akEDxSg+hC6p8cVEY=; b=iAttqvhce3McJBiy
	J3SLMJw/pw3GQ2H/yceb9b5H6Wg0StZmhkzTO/EWEHawPHxUX2AdsBsnSOgq1GFZ
	GXORjrYJFXfFCfvLY/ZsWtulokYyUc0vztXtMrawkcpGfLrUjG4NWCzk3pnvje1/
	2vZpxsbAAL1Dc6yeit9DQ1rZdcn9AsjMvIYHCtpHfd6tbts1zSqQ7qPxnPnM/0z2
	OOxLnreFd/DrX4NhJAnlLQtpnvjK0uwzH4LZvZhQi8i7OkwWFS8nLBYQzJPijq5s
	z5eTHQcphHCVyHpg66enorlJ2BdSbsri1/7ENo7NUEx4iEB+5NvSR5u/C9z67flw
	/0Hb6g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468rsbb8ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 11:02:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476695e930bso10977931cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Apr 2025 04:02:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745924523; x=1746529323;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MIW1j8QbMOdaLKZ0HyR+IOgl13akEDxSg+hC6p8cVEY=;
        b=GCpcv3mk0Kmw3apDAaXAf71WJhDGx3VRYDl439K0prp4bCl/1EtBpqDb2aI2YhC863
         iQ2UiKFFp2CJknQTSmSR4BHbQv+j3tz5PVbroCrSROyh727YJYceCmlewKcyptRycdRq
         CYbPg6GNztRZ5tAmIWeHNqNKKZSbcETnatPF2ap5czMIRxyZpAPy6Dw/suiRuJvJ9bMw
         qZhscF/3Vkkx2EIj7IyN8LgOuFkvldGdYSs7QrG/XEAo4aaDFUFI/wBkS6iDXMIozv+G
         G2qVeIjfePpuFUDnMexIVetiQcVyBDbiLSNrU1Zwf4/M1vP+lNvNZVNBqLcPjcdsG20Q
         8I5w==
X-Forwarded-Encrypted: i=1; AJvYcCXH0Oah3R39/Tnxent9uy5PcQzxs197DySIqkkSa0y95hoPHj0Vhm3xy4o9dluDO5mGZbXVj0XqlupbSFRw@vger.kernel.org
X-Gm-Message-State: AOJu0YwnN5OydFBuYG9mhay14TwEP34jQpXlMcxIki2psPr7P30KCA6n
	NZky6YoU65h7ukp++dyNhsHClkInl9nAM8QWXPGnBfqv0DsEKls5z2kT0H95GmwCoCqeKcEU5Qu
	GZ3X7b6//QL2Vuim33INt5oM4Z7cLUHCdF8Y76jjgruNa+SAtl9QaX7xqKS/ExO/Z
X-Gm-Gg: ASbGncuXWgL0+MimCjDzoZoCj559UyYY5/ccJqXa6JYDuxj1Xx6DDmfufBcT/ps3eI1
	obEpuAUHdxhamonYiWXQiW1QcMLRa0WOSOcwvAvKAFJ9PVF/LCLn8VdrZx1XtWPfm5Hvft6VpdU
	tyPJVVN/YifbCV5y1WCz83bNoDsUC8oCicZyRkiiAhyc8TDog2yk2Ib9Her3s70PvgBIeC1rSls
	AIYp0YmlGSyQRaFBksxnGriCrE5iT4wfIpiihN/8AoT55RVxu2ixxJY1AQpw+IZ4Tv6ZR4N7nRS
	X+9vzFssQ1GVX7f+9RG/YgWiSddVHfMZ+toSIBX/4T00pvoPqh20sdayUr1o2fEnDA==
X-Received: by 2002:a05:622a:589:b0:472:e32:3fa7 with SMTP id d75a77b69052e-48868e89468mr16948991cf.15.1745924523613;
        Tue, 29 Apr 2025 04:02:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IELgzmytp6tkZWR1VWcXfwGrdoOVAOm2or1fI5fqeuu7cvwQUXJdZdT0bJDtNsoYSceRjpNdg==
X-Received: by 2002:a05:622a:589:b0:472:e32:3fa7 with SMTP id d75a77b69052e-48868e89468mr16948761cf.15.1745924523296;
        Tue, 29 Apr 2025 04:02:03 -0700 (PDT)
Received: from [192.168.65.43] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e58623fsm760382466b.78.2025.04.29.04.02.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 04:02:02 -0700 (PDT)
Message-ID: <24d2ade3-ce3c-49a3-ab68-e782bee37096@oss.qualcomm.com>
Date: Tue, 29 Apr 2025 13:02:00 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: qcm6490-idp: Add sound card
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel@oss.qualcomm.com, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
 <20250429092430.21477-8-quic_pkumpatl@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250429092430.21477-8-quic_pkumpatl@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA4MiBTYWx0ZWRfX9dDScOaS8Oin CNnluXrXMbYFCnF/kI3KZcCB76kMJkrokPYHh0KZg4v1DcdTMImgj+WonIuPSpNUzWoEj+TR2iL tYQ52RPb8r81E4PtSCkqYWPcqkO3ZLCssjjy/H1HW8OGSRiNlxsNOXA8kJYC86npABO5MU375BX
 R76bY6dEawHTF4cDBUWT+HuN7e+0ij+Fiy5OR1CB5vTxKPQw7PymuIKLRdy7h9szBd0WtXVEPZg rRK+H/HS2ylLfV64xXQGpltY+r7pueifTA/l7MSJqXSz83LIOWimTdrl1Mg9qf7c5QgtMkhCMkj crQFpFmj0CfikXiUPm6JToTxrSRtGFU+w6hGPStjl3MCAn1ixqywN9Ljfc1ayWhP9giXtMMd+lA
 had6LQgX7NPpdzFbs+XTgypW7yYcwYUfMIWVroh3LbJJWjOAvHL3/S5JUdbUgfHWAZD0W4+S
X-Proofpoint-GUID: fOMBjaNaPpF1vkxsI8ir20QQIeR28jbA
X-Proofpoint-ORIG-GUID: fOMBjaNaPpF1vkxsI8ir20QQIeR28jbA
X-Authority-Analysis: v=2.4 cv=I8ZlRMgg c=1 sm=1 tr=0 ts=6810b1ac cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=m2XL-mgSGVCMsbPKemYA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_04,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 adultscore=0 spamscore=0
 mlxlogscore=822 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290082

On 4/29/25 11:24 AM, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Add the sound card node with tested playback over WSA8835 speakers,
> digital on-board mics along with wcd9370 headset playabck and record.
> 
> Signed-off-by: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> Co-developed-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> Signed-off-by: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
> ---

similar comments to patch 5

Konrad


