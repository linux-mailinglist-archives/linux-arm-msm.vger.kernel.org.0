Return-Path: <linux-arm-msm+bounces-68644-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5992B21CBD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 07:08:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 618E33BE7A3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 05:07:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6B33296BB5;
	Tue, 12 Aug 2025 05:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dfj80GVM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02C51A9F98
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754975234; cv=none; b=gKQ1++r+iomnEb3AdHCOA+7FVsUojGBXvsoEWSyGN/8tzOkrkuz47YqXAFJA8DCQyCZiGG/Mlp9okscd37Sp8pHP3TAQmoVRipwK4yHP9MIaRfY+5IETM4qrYEa0RPdIxev3In+DAUwCiG41MHHgNO8LH+NQikFN8ZNFP0TXhs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754975234; c=relaxed/simple;
	bh=JW8imEaLawVdDB6pLuEapa6akjqmjGy+TlVBOIdQTJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hb3Y1h+vNBB4V15pnNoV5v8u01neZgiuVh12XnOUA2zfDKseSOswi5HCdyksQS06KZ+6ykUx38r/OCLPyFcCmLALFFP8GuC1p4WuhEBhWhmUlROUEmtPM0/5mwP4lxloBx1uY4qU9J1ks0CUcd46OZl2Eg7ArOdmn8rHYCSt1rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dfj80GVM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BI1M64018332
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:07:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNkEVDKLytEFqjfBNwlsGmqz4UAUYa8AuW7pBH2uoB8=; b=Dfj80GVM+Y5bhCYP
	zMLeMO2K/ZFS/sru+sGIT+iynd5c/OmM61twuHzNH85UyFCbs+K4OGmJenKBezPh
	NaxmtzjVHBAWnbkQex2yJbts90kd33oFDXGvk3DhyjhIh3imS+RP/hs5LqzBG00W
	tZ8+h8RgRrFz/NH7Q0/ODt3JgAaA9gaitKs66gFt+t8YtW5a7qhX2QNO9kmTfsRp
	aFDChMzZwQpCDr2RT2fngQoCBrA7OF5dCzD6vz1kk9t9nrIvGWgWiznjfdVE+8IN
	bZHhh6lF9YrVM2D3wq7DTwdIRfB547T/+iZRUifZpjjSrNmp3xN5cijwzWfyFMb7
	/3EV3g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dy3g6sv8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Aug 2025 05:07:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3217ba6843cso4193309a91.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 22:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754975230; x=1755580030;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oNkEVDKLytEFqjfBNwlsGmqz4UAUYa8AuW7pBH2uoB8=;
        b=g1/WlYIb3TOpkulJ6K9iYKS233IUA4KnWZ+Xpt/vgVIdO8MNI19xtVMOuCPsNKv/4s
         cqHQF4UJd0oqXfZYFeV3481vEikpy6FkrjygGcVaE9+5gRS+ZWVe31eF1Ni8z4blbvgC
         iQ3NVkWkScX1YVkOE4rlilTRo8UTkftLPSKBKRhXZLTxVbcfz3G0dJ24OlzRWGiP5XJ9
         oq3UgXwTwkOq39yWHbrOHsgTxnIHIe8SdwOSIJbUHzUAOb9bFROsl+kiDeDhtt6U1Ii3
         ah68tnxAS2EoLkE9eK6+KpSWb9q6tzQU0OHc3EeJ/3HVVbhNLw5H3yO4QUdAuhI4VDcl
         t/cQ==
X-Gm-Message-State: AOJu0YwWxNOZCQWTUWwESg4G+SSMEXsTDS+30o6lrQuFEH+GXftTHPNc
	8myKFswSobodW06j0SJMNeuZHGIGPwhl4Q2lcAFx0YL1s7lEorYT/jj609JI8qVWWv/ZLoAKPI6
	8LnkEKWnQVdoADRNK8IcGMRcgEBoWQGH+AGOoMsBTSCYKKTSA8mWdQO3U7G8AWWMKXoDk
X-Gm-Gg: ASbGncu1/pOTq+0UUqNOjIVVfwcxYEVr78e1nBdIpVfKOjasbd+gJmYE43kfWH7ydbG
	vyDW3asxfyu6K6MyhY5/KgPaia8Xbx+e3WwPP5crkMcZ2V0BrRh1BEWcNQEEpoeYAEuANVnbdEd
	5VT9a1niKD36EQ8k9vxEi60tf/KFAt94Hx8QthRWUdw00reWQggLD6ZG6H2jBQorhgmh9Xm2QKX
	rqOnVF8qVaKAgrge1dRMYEGVBGAaYTokrLtjTmRPQ/8yKfrVlK4huwP8cniBRdCx/Z9b4dEFAVA
	aqDlI9slDk95xVQcBgp8scbyLPMuCIJv5ynSIj9yG6BQvf9nRkFAcSex3jziYNM+eEin
X-Received: by 2002:a17:90a:ca96:b0:31e:c95a:cef8 with SMTP id 98e67ed59e1d1-321c0ae441bmr1689052a91.32.1754975230172;
        Mon, 11 Aug 2025 22:07:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUuQTvbkjznzZD3wAoSWPaV/NV4ZMjR4FA8Z5+ChKoQlXLWNgp3NjNrHW6g0TBMCJaplmSmA==
X-Received: by 2002:a17:90a:ca96:b0:31e:c95a:cef8 with SMTP id 98e67ed59e1d1-321c0ae441bmr1689037a91.32.1754975229729;
        Mon, 11 Aug 2025 22:07:09 -0700 (PDT)
Received: from [10.217.217.159] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-321c2be2c2csm735782a91.12.2025.08.11.22.07.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 22:07:09 -0700 (PDT)
Message-ID: <7da20363-7b7c-4b98-9068-d82a186170fd@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 10:37:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: clock: dispcc-sc7280: Add display resets
To: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250811-sc7280-mdss-reset-v1-0-83ceff1d48de@oss.qualcomm.com>
 <20250811-sc7280-mdss-reset-v1-1-83ceff1d48de@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <20250811-sc7280-mdss-reset-v1-1-83ceff1d48de@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=X4lSKHTe c=1 sm=1 tr=0 ts=689acbff cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=C2TcYtzuST-dhkRVSHAA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAzMSBTYWx0ZWRfX0GDaaToFeEd/
 E4RyPvB1j0fLezT1HDMiagwLGnuXfhKes36IY+uz6OGe2Ep/KR/5nAdFXeebH2CGuE0k61XEAcK
 tfrzU9nTzQnIqiaB/BGrMbeKhBM9gL1xSL3fjaxvHKFxv+qQleaDbsFR0HrFDv6XQiEL0nsNGd+
 suyXV0sccSNwOxhazT4paioxv2aV0O14+QfTaJSvdqUkyA0bH//GQqDl0IcmP5+O+sbCYNf4rDU
 O1E/KZoE5s111nv3W/EGo70qIT+HA7iDu5UJTUlheSGiP5N+YeQ9hMKPIYqPX5Qb2Q8TanO1wSI
 47vvfWkdA2FZfpqw4g3RYo0iMXXQlIiq524/AvTo3R0QK6YTfWuwypVbmPRPB6uRZfQtK3Fd+ZH
 tL7qMwMc
X-Proofpoint-GUID: N2hJGiupldd0pYr6daM4Emgip174RcA_
X-Proofpoint-ORIG-GUID: N2hJGiupldd0pYr6daM4Emgip174RcA_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 adultscore=0
 spamscore=0 bulkscore=0 suspectscore=0 impostorscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090031



On 8/12/2025 8:41 AM, Bjorn Andersson wrote:
> Like other platforms the sc7280 display clock controller provides a
> couple of resets, add the defines to allow referring to them.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> ---
>  include/dt-bindings/clock/qcom,dispcc-sc7280.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7280.h b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
> index a4a692c20acfc954251fd1a1a59239ac62b20015..9f113f346be80b8a7815ffb17a6a6ce5e008f663 100644
> --- a/include/dt-bindings/clock/qcom,dispcc-sc7280.h
> +++ b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
> @@ -52,4 +52,8 @@
>  /* DISP_CC power domains */
>  #define DISP_CC_MDSS_CORE_GDSC				0
>  
> +/* DISPCC resets */
> +#define DISP_CC_MDSS_CORE_BCR				0
> +#define DISP_CC_MDSS_RSCC_BCR				1
> +
>  #endif
> 

Reviewed-by: Taniya Das <taniya.das@oss.qualcomm.com>

-- 
Thanks,
Taniya Das


