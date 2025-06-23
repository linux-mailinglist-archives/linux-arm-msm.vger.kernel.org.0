Return-Path: <linux-arm-msm+bounces-62047-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E57AE3DD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 13:23:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 938AD171CCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 11:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A0823D2AE;
	Mon, 23 Jun 2025 11:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ANNbLeOp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB9D231C8D
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 11:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750677809; cv=none; b=G/MPLgmNdqxjWAcbwI4nvvPASmDNQejez8issRBDTSYtFXU6AvZSUqfK2NFOrCXyEJt010JswcFihch3vHPFWH/2R5kRdpj2v1Ny5/awjm3G+PIjLI7VeQDC1MUplLLl9CbKNlp2gPYu8hBB3uL90NerXfNjuC78JcH9Cgi3u6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750677809; c=relaxed/simple;
	bh=za3jzPzxjRKrGPWrbVkFmVAdacWDo5Ii0cqWZ2Fo6gI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HSqwWNbDSxGZI71+wlUarAY0jOumzHUm6mjtSMnxgGwKS81qniBuvwkdem9zN4FMUxi+Y3ue4xmhjClT2mi46ek6PLB3xjNENk0uN6F65H8gGONrs48pTfkBGGAFFwfvB1GCXVnZHHQbPX5uldm+cE1Ne3+2ZwwDtCu1YQDMDHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ANNbLeOp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9PHYG025930
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 11:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UH9uuyUXsNQsiJs5r+UXcRRobA53OwqGqf+ZGt8Cb88=; b=ANNbLeOp/lN1DG7z
	ewPOV4RIwpwnh2qgJugpOWgn9hG7ZcnJhNqKxKk6yQQDZI5ATFASG47iX20M9yUW
	xJsOT5W2HKm2qVLCd0ChgDCarqGqraIxwtWX7UIVDprz1xH7HaXD7CFIdx/JWQw7
	oL9qVim5UxKaNub47x4Pm/tEuJ+fwN0wKEm5DliM+nsOeBW1CtzZm2OPjh0nsoJA
	tUxUKgeovmOKKPjT5qs4EpLXkQbM9fVb3WLFzJDQTxroDKye5JhTNXQxIBREx0kJ
	QtVERZfXTKSIeVEMbRlrjxyMEG9kIxaup9DpVAaA6XIxTwMFRFGkyXunjz7w/um8
	bsfqTQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec262n5x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 11:23:26 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d09b74dc4bso109986685a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jun 2025 04:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750677805; x=1751282605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UH9uuyUXsNQsiJs5r+UXcRRobA53OwqGqf+ZGt8Cb88=;
        b=J0gLkPoqR8W9Psx+fKLsXCKrriTUa48XbxlM4dT6rLa9SjC6+6dScnNtKu7XNqWOh8
         sCK/lIMTw8SEc6RH0yxYy6LWRzooqGWicuID5E3VovHI0kScMl/CJ2vMIJw4AM1Uuct/
         +xD1qqPGm/jY24w0EeyPv7tscM3BZfWcYcqpZe34zhZU6tkgUK1M9fQczPDCrHiKgjKa
         xw0UkO751VKbtNSys/cteSA8t91CgbZKMAXHkdsm7SBcBbPBF6YjZAyFxW3amo7E4a+7
         hqIlnZpovfPJpBpWGeKkDgrXUQuPzuN9n+3ddmItO9/H/M9saHSPqvu5ruKzzoqjX3iB
         7GFA==
X-Gm-Message-State: AOJu0YxepoXxNIFg1TpBX+iqIvDbF5zi3nEZbgfiq2w5mrLKcHmBHgnn
	RXaQbakw1HTQx9gVlHmpphaGjNXXRnvpmvhmOmLDkZACmBjT0i4gJg+Bt2N8Ba1KBfJBIlyaHqM
	lGcI1zbcPTmQpl78opU0AcokGCpjOTEETXlvlrLhu6PeeZeVQSU7lDFMRxBbiqDzarQZ3
X-Gm-Gg: ASbGncuk1iWYrBwo0ph5/p1YHXmJqf469noPvUIDrsKbpepwu2NSKZirh4zbhvbhEn+
	DIFSX2Crl6XJMC37I96PZ/6o15SwEcYi0k4tSSNeCC3KoKjX3+TI+opNDFcC5pYWeKlSjKiwDiL
	4xnv5chFuD36WB5wd7yUHB++Xp+yCwa6Yx1spVRcSwPf1+WS94EEISG/+6H1vkWtiVCnDEs5dsF
	FzXp3v2mLDbhvYfHef0S27lyOd7rXn2RfpTUxkMvt4m/yCRWp/ifREh+V7cQcXesKJ1rtBt5GBt
	ZtgJ8lmtdFyY5ZlQnwub69gDMU0QJrFg2TtCj9Qma2AzhbVtUKPFuZe84S03DoMzQS6MmNuCGNu
	yLy8=
X-Received: by 2002:a05:620a:26aa:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d3f98e252fmr566910685a.6.1750677804755;
        Mon, 23 Jun 2025 04:23:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIeTIVZmLAQYrPGSdghytyNjTMxnVjrXHgHo2iWPUvYkxGCZEFn6pW3QQTQQmBw26psY+Vwg==
X-Received: by 2002:a05:620a:26aa:b0:7c0:b43c:b36c with SMTP id af79cd13be357-7d3f98e252fmr566907985a.6.1750677804000;
        Mon, 23 Jun 2025 04:23:24 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18543642sm5902920a12.26.2025.06.23.04.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 04:23:23 -0700 (PDT)
Message-ID: <aabcf5d1-7380-40c8-896f-6ce37944e97d@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 13:23:21 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8550: Correct the min/max voltages
 for vreg_l6n_3p3
To: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20250620-sm8550-correct-vreg_l6n_3p3-vol-v2-1-b397f3e91d7b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250620-sm8550-correct-vreg_l6n_3p3-vol-v2-1-b397f3e91d7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA2OCBTYWx0ZWRfX9hKKkHf4uxx3
 97j15GmhpXDSAEt/42W4WyZ7TsC4UwkzgZkDReb9gMN8liDR+COMHUneTTjF4FXTC/IWZTAP0As
 +dtTJ60eF/IcRqDnYjOcqG1Eef6l6SN5Y+rfnMvPKi5eM1zAs2ktpLlzlx04WT9N4cXmgNxzxJs
 I953XSFcyeDUn/439lG4RlcYKEI0QrxMwxFi6YxIAyR4sFJ1psoWfLlmxxKamNj1LmNVE80GQM6
 4nEK0zHCWruN9/odIRgW6S4T52WtKTUTRnaBkM+vcN1XSXMp9VI8iUckhOtp1miEPWmvrdh02yP
 YfyWr292MV8XaQBLaZWdPiBZqyLaBWF+uxC2mhjK7HW18mviCGNQPEQB8keKssYgnpL5+1BPyP5
 GhX0UkTYpdXHPIpGK7WsBagVk1lJwPcNHVSyp/7J7TqCBhIwrkbFb8TDuM0uMej0bZMO7epB
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=6859392e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=cfxGQl2wVvWQvt-4oC0A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: B71ZA6cX04mz5e9YMVIilDv5XQpXO4Fk
X-Proofpoint-ORIG-GUID: B71ZA6cX04mz5e9YMVIilDv5XQpXO4Fk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_03,2025-06-23_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506230068

On 6/20/25 5:29 PM, Kamal Wadhwa wrote:
> Voltage regulator 'vreg_l6n_3p3' max-microvolt prop is currently
> configured at 3304000uV in different sm8550 board files. However this
> is not a valid voltage value for 'pmic5_pldo502ln' type voltage
> regulators.
> 
> Check below the max value(3200mV) in the regulator summary for min/max
> used as 2800mV/3304mV in DT:-
> 
> logs:
> 
> [    0.294781] vreg_l6n_3p3: Setting 2800000-3304000uV
> 
> regulator summary:
> 
> regulator     use open bypass  opmode   voltage current  min     max
> ---------------------------------------------------------------------
> ..
> vreg_l6n_3p3   0    0    0     normal   2800mV   0mA  2800mV  3200mV
> ..
> 
> Correct the min/max value to 3200000uV, as that is the closest valid
> value to 3.3V and Hardware team has also confirmed that its good to
> support the consumers(camera sensors) of this regulator.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>
> ---

FWIW it seems like 3.312v (which is slightly above the previous
value) is also supported:

static const struct rpmh_vreg_hw_data pmic5_pldo502ln = {
        .regulator_type = VRM,
        .ops = &rpmh_regulator_vrm_ops,
        .voltage_ranges = (struct linear_range[]) {
                REGULATOR_LINEAR_RANGE(1800000, 0,  2,  200000),
                REGULATOR_LINEAR_RANGE(2608000, 3,  28, 16000),
                REGULATOR_LINEAR_RANGE(3104000, 29, 30, 96000),
                REGULATOR_LINEAR_RANGE(3312000, 31, 31, 0),
        },
        .n_linear_ranges = 4,
        .n_voltages = 32,
        .pmic_mode_map = pmic_mode_map_pmic5_ldo_hpm,
        .of_map_mode = rpmh_regulator_pmic4_ldo_of_map_mode,
};

but if the hw folks say we can do with the lower value, it's probably
even better

Konrad

