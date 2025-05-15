Return-Path: <linux-arm-msm+bounces-58080-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA44AB8B04
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 17:41:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA8B91BA469D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 May 2025 15:41:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EAC621A427;
	Thu, 15 May 2025 15:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nY1mWB4k"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BA6218592
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747323665; cv=none; b=Zk2LOJ7aXUWOA5fRmb8fAws6BHPZMwAfMa9VtCUnm9G2c7J2GEg51ggn8+fvGPRortAyhhNoJD2/cCFACEVat5qqmQt5agY3k/al4NnTyibILtJH4SDY5XCAuyu1angfPCwtwFeSpi3x1TsEbbCWApXLgs2Rd1l9c/P/X/4kUdQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747323665; c=relaxed/simple;
	bh=r8Rz9y5mBO826o6HxT9wcmQ+Cgxb+4L1qYpw84sCd1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JrwOtA76JOxYPP+w/iYfuq5vhZC3LZMYQg4Qk5j1dNOaJeLKiHNF4wgep1rPK7HElb7DCgj3MmQNeoiEkaejPP8Rk9KzhA2avnICJi1X4+XrDwnAqoXEQNWidF5Sk9/lUgtElW0dy3QlgJ77QRniFqW39jG6v3E7bBY3FDj8wR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nY1mWB4k; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEFXn4009374
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hDP2BOABWrcdmtprDmarKLv3ZXSLVag50oTBIKB6RbY=; b=nY1mWB4kDphGytYu
	iWSFS+6yKBWXV3C0FVD+NKWS+voV4MwFhjezUbgnJtHOjcK5kMa74wx+L4/T3aKg
	WmHyNsU8CZYGq6LTEeTzoRMfEnpNOEwPcJamrLFeIpegOoxG22cHmVrcQoSXN87f
	G5yCWm3Vm1zWmv5gREHlwDCC42wEwL1uCKJqNHByG0GpHEnHdCe3FVUYeSc524+e
	6vmS7DjMTzON7w+MdvePKkO7m4gooqd9I7dFyoEoYcl/sfuHyNCBDOg1yni+AIVh
	Mt7EEwwbGSc9ngXmDgSYKmIELS4AatMXMfAQTO8z7jl9hpa/e45OOI2/KhPIvd2H
	KxPVfw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbex6pb1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 15:41:01 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c547ab8273so21209585a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 May 2025 08:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747323660; x=1747928460;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hDP2BOABWrcdmtprDmarKLv3ZXSLVag50oTBIKB6RbY=;
        b=uSjVw9691ReHXxIabvSXmjhH2ioSa9I6iS8jCcT04iRD7tKr3Qq53wwBR8QGUZrKVl
         UoGgE54+RfrBwg0pzbukBxL8ASLc+b2FA8C3jNydLnl/DfFcOTzkqE2FfXxihlrccJfG
         j9t043QaJuDMwNzPJLE7wKmMdqazma8QqYDLE7zVFucTFXcNvroTEi8rZdnYIe54JMRH
         83oolQevqzqS5D5Ti5uOjnJVF1+lNdXQVctlvNLnZ0kylQg8lkQDebQn4Iy6jCN//8M0
         G4T0G9bKbFIu3FP8EDJ08ptxCA4uCoeF0uSlL0NbdX+blTFfLkdZUdtESqaPVbMRcJSo
         qzEg==
X-Forwarded-Encrypted: i=1; AJvYcCWznNl3HQrOoWrSEkFfen6ifyMhkaXGNRv4GL/w4jjJNJOiDzOlb9advI1iTSHJwUe2pybJnlQsV5yneVW7@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk7aC01GO2OmG0IIq1vUsO/urYb+ML7gtwFsjO95L6GUWf+AIb
	bmIlET4+wHy3McsKbBj6CyKP8DOswFYAfea0KbLj8p2sTsIlmvNw1pFjb6kvmLSSZaM88UhUfHo
	1KVu8Zmc+k9bn1N9cpMcBnhRBYlffbfZLUgRkskkmH3tSfY1t5MrEq6XIL+vI95Y4
X-Gm-Gg: ASbGncvMSnZR4UmkhCm7VJu6B/m61UkGTfgSfsmKc0yhnGSEpGU21LHen+yuRnAztXl
	/azXMA838mw9PBnB8MvYwRTgRktJft06kukQ0Ry7jgI7HfZ6Quj+hrzijkEMOFEDfB4bnxDHBMl
	F6pMCf+h37ylzl4LLMDfbAL7ah99iqEc1eVwiD5oVJyXKe3fnFDu7cxeIM489m1LG6CkKTA4mra
	5p49KPU3V+1c7In0rUbPtmHlInn856I8dlTvSaMHRKaKnimLA2BXfJvBBB8gsgqcJ2If5atEmw1
	Cepy76hLMGulNxayjzMaJ64fMbbDwtAUdRru8VqFV9Fof0G/CE0ZRvN0udDwsV8k+A==
X-Received: by 2002:a05:620a:2696:b0:7c3:d266:3342 with SMTP id af79cd13be357-7cd28817e46mr483162085a.5.1747323659982;
        Thu, 15 May 2025 08:40:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkD/kSx20+qw6EEF+iZGvVJtXA5uOZxo7BEHt8EbD6OzUqzYurpQEx+s5agdussKHsTUcOVA==
X-Received: by 2002:a05:620a:2696:b0:7c3:d266:3342 with SMTP id af79cd13be357-7cd28817e46mr483158285a.5.1747323659432;
        Thu, 15 May 2025 08:40:59 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d497a0fsm5132866b.140.2025.05.15.08.40.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 08:40:59 -0700 (PDT)
Message-ID: <764e3582-6e09-4252-8e5c-12a7c5ba58f3@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:40:55 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/18] clk: qcom: camcc-sm8550: Move PLL & clk
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
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20250515-videocc-pll-multi-pd-voting-v4-0-571c63297d01@quicinc.com>
 <20250515-videocc-pll-multi-pd-voting-v4-10-571c63297d01@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250515-videocc-pll-multi-pd-voting-v4-10-571c63297d01@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE1MDE1NSBTYWx0ZWRfX9m3m/pqcqApt
 ez+7XgXDroMEDd9ROFkzhSqpJHFY3F1dXmbgj//Pf4mScOAgSlRV4gm27Lup21N4eCM57KIPjE1
 v+UCcC2R+K9nRrGf/Nvzg5uDBTuB8phBl0Bjvcp5ceKGu28GnzYuZxbTCQht/w51sLxFVCDADK3
 DxlOQpUA+bvFH1GVKQNw81l+rdxZ4WfgQ68uJAhZSnOoBMrIPUSAsn2dTsCJXcEDlA1CkJvmltA
 YCXygIfHC3G/IoVXgo/xz/V9IAbAqN+pLbEHFDmcJwMPcHv+Nvhoxa3wSSxxnLJrYmi4S5Dh/fv
 r2SrEHbvWdbx9QsRzj5ab3UAYWqCLtrnfl38lySx0gBHFZVyBrZwoyEgBzphtPwX0tXoTr3WtJo
 bEetaWE2y1DMmkw2lh8uQjlSPD+MnKqvrBFTk57S1+gtGN5heN0olXCP+T5VX/Zu1nKSVLRy
X-Proofpoint-ORIG-GUID: X9OkNh1lcASDtslQLdfFhnuSy48DlJG-
X-Proofpoint-GUID: X9OkNh1lcASDtslQLdfFhnuSy48DlJG-
X-Authority-Analysis: v=2.4 cv=IcuHWXqa c=1 sm=1 tr=0 ts=68260b0d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=OU1JASuMovj745rkUKUA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_06,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 clxscore=1015 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505150155

On 5/14/25 9:08 PM, Jagadeesh Kona wrote:
> Camera PLLs on SM8550 require both MMCX and MXC rails to be kept ON to
> configure the PLLs properly. Hence move runtime power management, PLL
> configuration and enabling critical clocks to qcom_cc_really_probe() which
> ensures all required power domains are in enabled state before configuring
> the PLLs or enabling the clocks.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

