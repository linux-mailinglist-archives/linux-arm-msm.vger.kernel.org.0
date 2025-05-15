Return-Path: <linux-arm-msm+bounces-58084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 441E7AB8B1E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:43:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 548AF1BA7D0E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 15:43:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64FD021ADA4;
	Thu, 15 May 2025 15:42:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KfwLXqwT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01D6733DF
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323768; cv=none; b=U6JAod71cALYbex1TifkblSZx2own9HpiOMnIuT32ZWzRQiQ1a6akCv+0d50n1DdxIfBNRpIlOg89AyqUbspelf1j0PhPAW2D+CMbQNl41IQsGxuXdjb6laFMGU91RaRVU/I6MpwEMzxiVdtlC9JnHdbX1qzBc+12ifac1gFE/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323768; c=relaxed/simple;
	bh=dVPm+i7vwTa7TKxnsLDygbGcoSsaRGh//y5CjsAz7AU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fdYkBrpp4u4Rhr3K/uq9JUos8EPLX3BXHZy4oT0hrrtz096VgevF8IjG6AhWzeLZksW9QKfK877W50aymGXYJ352Hrt80CSMAc1Quk/nyLavuvQBhI8a5/lFjJpDFfQsJ24yH4cpO3lzu3Y+waQTqJalMhHDfvXk8oF3IPhf1j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KfwLXqwT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFUXX025636
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:42:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Atzjdv8tlkFhFRHK5Mi54oJ02dHYxrl2pRFuh6pKCi4=; b=KfwLXqwTHkQr5/U/
	U3DRMBPDGaMZ3hZtLlgvmcYOFeUVZhdxyp8qxh+VRwQTOkeLzt49t9whtBQxknwO
	1YkGDnrHhgwvD+eyOZ7eJqaVTIsx/PUkyuhARih4ZN1uPue4wVgmcjhA/EEjX81Z
	17Er508zs9LkEfA0/Ilz1CdKn9Rk8ZVXw6wEGVXT0Qv9rOpP7+AM4PmLS8pxCtOh
	eTKWnfeqYApx4q9DhF2MkGL1kKdH3Gov9l6L8AVcRhavJKBz3l8dwvqoiXBbEASG
	KdWaXIyO/ucYeaZMBfpigdzMf9c40IRjbc5EI7HJq6Q0dOP4PUGWPnGWnGWepIv3
	pWlzZg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnxqfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:42:46 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f0c76e490cso2478166d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:42:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323765; x=1747928565;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Atzjdv8tlkFhFRHK5Mi54oJ02dHYxrl2pRFuh6pKCi4=;
        b=lteANXAu5NJEG4CJMChwV/gX2HHZ9IpAGrjcBlMm86vEMmPi/TFb4msHb1VFGoiedu
         xu113FgTF03IA2155p7TZahvpFFI25NlN5CB1cZHMNv7sMCX+RNdQHf+wcS2XcZ4wBsQ
         XapvTOhNPXVP+9QXc2DwbhKmOz0nhg5on+fBNyQnhE8Cda3L3rS4wjsKEeWzWTP38UNc
         LWanoKv42FRsEHgp5C0EA0RQHgs2wfBclODc15ClkfF/d7xU7KwETbqSK/I2oeuZRTZ3
         ARfgTwzIaq/ikxOiPi6MLg6ctJK4hk2gZxmFirNXgGmJj//wY2tsj4ja0vmAHcbNHdGO
         EyNw==
X-Forwarded-Encrypted: i=1; AJvYcCULeX356IxVntk+xapNuDzS31/eNn7IWdYvxhmCNM/zl4l85aTp8OVq5/5j+EPrGXaCsFqkwT7T8Ewvw2CC@vger.kernel.org
X-Gm-Message-State: AOJu0YwsS6WeuUdHGYFuBKPdnMR3jn9AtnpVwfidtRk9rh6zT36jnfMO
	H/zHykJIgi0EOBUWI9v9eyFYndDcrFufy1FgU/C0sovgCb38OWOmaf6/T3ZK4gsATqI+GiWenIS
	PJDXp0zmNZRLhFaeHlHt1KGaRbaKxinbiORJqSuLKrbjNuFLUvn4Pufq01uzVLYpSAmnt
X-Gm-Gg: ASbGncv3wk1CVM1sq0rxbnrsLRzKza4BQ3ch7l5fpDSj1JkXZ44TYM2KdifW9QrXlmL
	AmluQSurUDDhA0Me6sfKAuHnd/TYlo2yZolj3k9Wru9ohsUBobqA9QR5wDLMMs7wzXqMMMfhdeY
	LqJUYz867w4i8crYWH75jYgPz4fosv4GB9SkndwLgEd4EvfFjOjCxGUKa3N68RjKQICWLadl3l0
	HNvuAMG0zrntw5XWhQkzkzCT/WS/ttxAtc0Evf1+r+izqGkVdmq2kYt8GpVVLGManzrNfOKrM3m
	6s8DVJYp/2hbSpMiUS9jnzSvznWUaS7AJ9vl5tqa0r56P/4C1xizw/0EaRELFmZijA==
X-Received: by 2002:a05:6214:20ab:b0:6f5:3d12:1583 with SMTP id 6a1803df08f44-6f8b08350c5mr1345106d6.2.1747323764700;
        Thu, 15 May 2025 08:42:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyaNW4ZwY6l5LXOsDRMGiN4VEbK+2ZtY3TIpG9uj5oJTWL3ICqFydKxc2MQwVwbdnhbU69Qw==
X-Received: by 2002:a05:6214:20ab:b0:6f5:3d12:1583 with SMTP id 6a1803df08f44-6f8b08350c5mr1344846d6.2.1747323764097;
        Thu, 15 May 2025 08:42:44 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d04b059sm7133266b.10.2025.05.15.08.42.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:42:43 -0700 (PDT)
Message-ID: <02fdab40-b9a4-4569-8af0-ceb229252a05@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:42:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/18] arm64: dts: qcom: sm8550: Additionally manage
 MXC power domain in videocc
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
 <20250515-videocc-pll-multi-pd-voting-v4-14-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-14-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: aqpgtskunuP9qmQAHVmW7ClIU_EyKYTa
X-Authority-Analysis: v=2.4 cv=D8dHKuRj c=1 sm=1 tr=0 ts=68260b76 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VvphFt63O8erv5bwH5sA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NiBTYWx0ZWRfXyCOd2RzPsJxj
 bhfB3OJLhbMayt87sMLvukSXaqVIc53I5jgItL5uO2IstSTF4eI9TLF6w5IUiKpBZQBAgjuokDJ
 l29N+W/YUd9NryYWx0m8SW67CQhwMUmPED6onzLloWDTTqhj1FoHygUySSIWtTq+LcD7B6GcxaB
 ew2yLathMrUsNAw88PSAcCj7U5aUtndsY+gK2TUH6kLE1PupXANdMuOGsxjo/bVRtPovKeugsGP
 FiO1TLeb8iR3QXQkMfby+Vact4z4aRiSATWDPxNC24nk/G4jxs1n0Aa1g5CaUnQCvLtCxHnvL6V
 MiCEaLG6anyTLOs/XWcotTbCqjaHjcE+hovZl0WX/J/wKfjUpammao+aivYx6JTTRBPRGsqrk1r
 igXXdK37+10Z8F/nGxUzb4QYoR1Njbxjay8nPor3rrh+YIujt+bDR1TAc3r8jw6YI5s3g38H
X-Proofpoint-GUID: aqpgtskunuP9qmQAHVmW7ClIU_EyKYTa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=724 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150156

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Videocc requires both MMCX and MXC rails to be powered ON to configure
> the video PLLs on SM8550 platform. Hence add MXC power domain to videocc
> node on SM8550.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

