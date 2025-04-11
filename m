Return-Path: <linux-arm-msm+bounces-53992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F31A85B75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 13:23:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7069A189536F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 11:23:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 627DA238C2A;
	Fri, 11 Apr 2025 11:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PzCpobK6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 797861EF377
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 11:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744370568; cv=none; b=hifMmNmrMC9ou9NAfiDF98d0uhr+lqjHWpm2Edxlsjjl0XlYT27zlFkC0PlqYZLUVuv3I8odl1ajQ4N3baoOEbEFz7hhlorcydU8T8tqDu0DGu+mjOg3hgbK2bp+PmctBZl+bKQHy35j5JAnXlKCCfPyoJ8ERFFv8sVr316QBkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744370568; c=relaxed/simple;
	bh=xWEYAXYN75uPFbnF9tMBMayDM0TPtCpSrhXZ3dzsbXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nc8arXo8LXfX652gxEUSro/sgpDGiGaVADVu2GgdBt6S8MrGUJ3oGeSEbNqf0a6j+DqVJG3+8Kxdje5V6K6lA2obEkicOGgKIc/cLvwmRS9RMIXdpaOI3DTHqxnAYijp1dbGEydYxbM/UtsDAIwA9pC87E88kdxBgr3xPMnT1Yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PzCpobK6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53B55FTq018376
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 11:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o7ldlKd5A1c1kzPQv6PSKZi5mNPAQ4xGSwtKcBaJjAA=; b=PzCpobK6k49gH9pw
	6B2mE8QRIPd3ybIuROrbFKS0vSG3bh5q755fu9xmdB9xYloq4sopQ2x3U5UfGMcF
	EbQ8/pTUU4qQYl2lqutTbixe0nOyqrxHz+X0bmw9xLP+MY9Lic51Hj6hqVy8PyJt
	memccoaKhxy1pg1bpp3Q3M9OQ/gXQuRALWFa2PTcgCAWbGvexrq+rMeEDKLsorWs
	NqhxZ+kAQ2mLWfdfHqf5TwSPGguMXQBp/AyVxJ3LKYfUfVOGoiD4dT8rAMII3fMp
	9x7lkBPfma+M0WY85tZ70Y8NSB88m4sLWVDpMM3M3puV7JgKrm/ggTfyTWmFcOiW
	lgdKgA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twtbaas0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 11:22:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-476695e930bso4086151cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Apr 2025 04:22:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744370563; x=1744975363;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7ldlKd5A1c1kzPQv6PSKZi5mNPAQ4xGSwtKcBaJjAA=;
        b=bIC720OC62UWqLOZ+UyK3bsU/YNksmW3csRFdHXDfp8CCYIgEKAQ3tZtBFZK9erAB9
         90NUgsxhycGB29j4BexbHT0/oryclakJGevf6DKwSe5s0BIROZvP2dLFyS0rxT0cktpf
         dHxjaotQioOrpd5zH7n33pP3x4jAKh115BhRuu7iPH8uPJbHYCivenD6uWGqewqYzC6r
         3Jiq8HJybbyt7UYj9XbvZn8IUX9GlwYn7iLf4XlvL0C3EwhOaAgIuthaOe46zWoti2fB
         2TChmBUnb0XROYkiN8B0B2jNt7Y94/LUL9y1B1cITeT6Y5fLP0yBppzwsTl2krVXEY7o
         rkwg==
X-Forwarded-Encrypted: i=1; AJvYcCUIZfC/U48aPUDT97grag1eJxwvnMmZcUpmgyZMTZh0CF1ZZK+dMc+Uc90lXmAuO46GZNbD5grzcgElYzuO@vger.kernel.org
X-Gm-Message-State: AOJu0YyJekuD7hF65PKV15wgGzZGJwm5IL85W9Kvnx5wyKyXP8gKwHyQ
	cGDjzgWgfLcnH1Q4IrFTHe7SBMTjuLuASetVRlGcg2e7ZkUsx08sQ3Fe/wD8lYOK39mq+cx+ioF
	DWBfFnAuegDz2Q172l2PeGEjTyAo0ynlE4v/pNT58lQEkFuE3bKh2Nw2/4b3tEa3Y
X-Gm-Gg: ASbGncuE1zN4/6CLVoiFtW+OGf2EIWZtYp4Ecn3BnbuUnxJkziFa+dI9PQ4aRXaBlzX
	m0/q6iaaF3CbO2De28Xqx3dFVqIjBPYxsyfgNsb+Ep+W9bybsFwDDzPLTt1OqB1ZtSnPr3s1vkN
	KefjySVWA3pdAq6DAeNkBIFnPzhIPxEHIUyP3xspoCCx/aLIyPwgVSxcv/Fp+Na+GyOfsijPBxD
	hSH3tVrb1rKmO17UhqI6mKWmMaD48Im9k3UyN+qYtiaiACJPDm87gzklDVwsDufa3gE4IL9ReQ4
	QrCxVROlHIl1WdLDesXT7MvE6JLrtqiTTlRWWAztrhsTxtm+yEJ7EPj+D/r+MXhH5w==
X-Received: by 2002:a05:622a:60e:b0:472:1573:fa9f with SMTP id d75a77b69052e-479775c57cemr11267151cf.10.1744370563323;
        Fri, 11 Apr 2025 04:22:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqXzDm9Tm3+0QeUI5Zh14tIbU+d/Vs8viys7evruocl5cnMn/7ajmcF2ZxqV8LNPFi3bPWpQ==
X-Received: by 2002:a05:622a:60e:b0:472:1573:fa9f with SMTP id d75a77b69052e-479775c57cemr11266921cf.10.1744370562918;
        Fri, 11 Apr 2025 04:22:42 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f36ee5541fsm818081a12.14.2025.04.11.04.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 04:22:42 -0700 (PDT)
Message-ID: <48361e2a-89b2-4474-97aa-557fbbbdf601@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 13:22:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v14 3/4] arm64: dts: qcom: ipq5332: Add PCIe related nodes
To: Varadarajan Narayanan <quic_varada@quicinc.com>, bhelgaas@google.com,
        lpieralisi@kernel.org, kw@linux.com, manivannan.sadhasivam@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Praveenkumar I <quic_ipkumar@quicinc.com>
References: <20250317100029.881286-1-quic_varada@quicinc.com>
 <20250317100029.881286-4-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250317100029.881286-4-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _7bN-OqHEBXG_JcsNVh5SBbPtLFzmb7l
X-Authority-Analysis: v=2.4 cv=LLlmQIW9 c=1 sm=1 tr=0 ts=67f8fb84 cx=c_pps a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=Y_ot1G8rUta36iX-w7oA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: _7bN-OqHEBXG_JcsNVh5SBbPtLFzmb7l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-11_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 mlxlogscore=949 malwarescore=0 phishscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504110072

On 3/17/25 11:00 AM, Varadarajan Narayanan wrote:
> From: Praveenkumar I <quic_ipkumar@quicinc.com>
> 
> Add phy and controller nodes for pcie0_x1 and pcie1_x2.
> 
> Signed-off-by: Praveenkumar I <quic_ipkumar@quicinc.com>
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---

[...]

I think you're reaching out of the BAR register space by an order of magnitude,
on both hosts

IIUC it's only 32 MiB for both

the register addresses/sizes look good

I'm not super glad that we decided to move forward with not putting PARF first,
as the other registers are in the BAR region, but bindings are bindings and
bindings are ABI..

Konrad

