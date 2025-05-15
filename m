Return-Path: <linux-arm-msm+bounces-58081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF0EAB8B06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:42:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 87ACF7B1BBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 15:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 88A3021ABA2;
	Thu, 15 May 2025 15:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WWYwKoDu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2093C218593
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323709; cv=none; b=SkdovrNUN6OCsqmVrMndDqs1WeDmK5/8R5Sgah+1tkKu6EpTm5fMFOPX+qibHppxtJSK9y/b9wmijbMGTsFtladPIPORzYsHsGkd06fhIIH9e7o1H3y6fTvU0Su+5wgJmlqXZ+U7Qr6HW+NfCOuI5nkei4EAb+yfs6gvKXCXQiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323709; c=relaxed/simple;
	bh=7ywYiiKNLO9A8nztS2XTnBGliTV98wcv1CVo9aAO7eA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rR73YlDY1dFYWQKVMKDrqjrKYolxny96X/jBX5hdasiU226DV0laiI3NsjqXrfFSDpkxpF3Q7vsiy5bK+VsqatH0dhNgYEvMCoEWc8d8VzWgR9k2d22qHwey4zxGY9Ub5Vei+q2ftGusSQhyHZn6eKaSPfPfpMErVi7k1fC+0Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WWYwKoDu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFFvL009152
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:41:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5/0ojRnSWXvRmL/NeRTFyIUoU4Q+EzsHrqsYsCOLaMc=; b=WWYwKoDuM723eE8r
	LElS6tFxfrFg9Mew4iYi4haIng1XDIaRkspLqfu1IXDkZdOveJyJNoI2OEK+Mj19
	uqRpJ6+mhCgQwqU5ngvMESTCDHq+0Z5D1Ldeg0JAohFtmW/fPuJwrvrjF33vzCQj
	OsEY90lgwMTefvNv/tDQP9P9htinKTnZsvcnKA8CF60yGMCPVf3hKdssbQ9DsXaW
	LL3ZN1DytBp60rRCjQp1uEHd55PFFSg7MQPQIZtre/JPDOKoeYpNKO53jDmGYsqj
	WTb6wM9oX6SrkKiFqqXLr657ZzB87hbPReDatFpKFexYEtkzfA1ThhwYfgnxOG2M
	vW0nYw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex6pcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:41:47 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f89a2df0deso3293986d6.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:41:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323701; x=1747928501;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5/0ojRnSWXvRmL/NeRTFyIUoU4Q+EzsHrqsYsCOLaMc=;
        b=rvbZTXmXdFfZV2qZ6CK+Sfa8eH3Tv0dQsRiuMzIXFV/iiBEjG1VGfC3ggld9wIRNME
         FIvnryzzJelHKraam71K+PG3xWsoWOqZYdrX5m7p5bcLU2vFhfHW6p8yaAmazeoGE/dW
         wB1b1S7GNNTU8zvSy4kKFdl8J5C+qEOGJEYYciDjggDYHE/VntRZOE0tp+3VjT8W+vwK
         d3xlU8u4PSVCmDoM3Y8E+3cZxcSVmMUuGzb0BvTmQFQlw7kfJd8827eK6ccOyfcl/NgS
         oi8U144TDPd+JIgTWUqxWPk68F53IeeowEODby2D44HRa/ucT5HlBrDsQOq+X3hHw5UA
         je6w==
X-Forwarded-Encrypted: i=1; AJvYcCXu9DasaCA+WQ2IzpfD85h2s/bk26GwRoUsWaPDFDKyqJfjgmYqk2MzcYWBLHbW10cxfnHoNiFg7ZFY3mq+@vger.kernel.org
X-Gm-Message-State: AOJu0YzGZ+7JiNHrPcgadiuO7PT8S49TW1V5VvlZB+EDiMKdDUGv4EjS
	oT+CIXsLoYqrbIYgwkW1mo1qnxu5E9r+VN2Ln39VQwlz2XfcWsg1UaBs/PTZedNA5LFO4ShZZv5
	YK8GRWz31qBvycZ2WUY9EtufyVnq1b6+vbprr+IInqypuh3rX+O2CB4cOhoTjogA7RXPp
X-Gm-Gg: ASbGncswMG5jRw2xFzsCKCOSY/MhrvYA7stdgFE7PlDs2eKXw3SLeqreOIcswkoEOgX
	8L0lMj73fgB9z75GFO6qiLCplWIFsVQJ9SdHUesHUdKk8PA5+9ZIHD+fPm9y6KgSTvxp6nbpunw
	tVXlSNbRVuCUrF/TMevC1i9FMqLaZwir+hxp3+WlJPVnfqKNGLegA8LAID49fO9jCBfMULgLhp8
	6eOlEUEyFtPNKS6jEiG6+d0jbz0hi4cSuRK2pnPuj0YoPz3vAEbddD4GDfsMo4rxU2yJqUpfmYm
	6QTJS+90/icEsNTKKpFgTAhu6f6RWbyOq+L3ib+w+XoO8CHE5NvCYGm/LHVbRaUOvw==
X-Received: by 2002:ad4:5aa3:0:b0:6f8:a978:d32 with SMTP id 6a1803df08f44-6f8b08811b3mr1101096d6.5.1747323701168;
        Thu, 15 May 2025 08:41:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3C7W2ioUB8m6KAq++Aglw4cWZcPp6NjrXNXBkMScIXWVKR+28o/8L6hATFVney/nMPPQLlw==
X-Received: by 2002:ad4:5aa3:0:b0:6f8:a978:d32 with SMTP id 6a1803df08f44-6f8b08811b3mr1100906d6.5.1747323700776;
        Thu, 15 May 2025 08:41:40 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6004d502ec0sm15772a12.31.2025.05.15.08.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:41:40 -0700 (PDT)
Message-ID: <12bdd004-c2f5-4246-b103-f94d239e9f91@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:41:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/18] clk: qcom: camcc-sm8650: Move PLL & clk
 configuration to really probe
To: Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Taniya Das <quic_tdas@quicinc.com>,
        Satya Priya Kakitapalli <quic_skakitap@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-11-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-11-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NiBTYWx0ZWRfX5Zdx8s9GSbiL
 jY7bhecr1Q6TuLfIYAScQWV/ZEFZe5gTkdTWD7z8MUBhmXQ6PiLUAktuwM8lj62XfFfP5rRr+ir
 mWLOxrdX4ron7hU3fs1dkXX0UhBB9c8+/bErZRnMathlqv3Rl1A+/3ehUYMtNM9qWxz2jV2/6OM
 +wzg+b1x79x05BtgQJn2iaIuT1KlHcEJjiDF3Pwmyj2NUxhdYvnVQ7kKU6rKxNriEYMTiIQ0EgL
 PX4U3MjIC1gWcX6TpIqwOJspj3Ze+JDd5pEx1xPlEMLdUUkEynNreGxkxfwwOofqj4FYfrGJQJ9
 mHUvIAIkjjjk0QYsv4ltK0gaOSSSoZv3eT4otgC9g228flB8Q3BGPFt/Pgh6I/0p91vL3jPSiL7
 ndFi9d0ly8bRXCFu8faRv7zrt8jvjfD7Z0RLXXJRiuk9cRs+o7yOb0PGWgLtgaEd4jnF6yui
X-Proofpoint-ORIG-GUID: XKSMYPvgp59DMp75CBajRQcXjqo1ymJS
X-Proofpoint-GUID: XKSMYPvgp59DMp75CBajRQcXjqo1ymJS
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=68260b3b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=R-MJ-YjwOO2PQHfhffwA:9 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150156

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Camera PLLs on SM8650 require both MMCX and MXC rails to be kept ON
> to configure the PLLs properly. Hence move runtime power management,
> PLL configuration and enabling critical clocks to qcom_cc_really_probe()
> which ensures all required power domains are in enabled state before
> configuring the PLLs or enabling the clocks.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

