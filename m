Return-Path: <linux-arm-msm+bounces-87889-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F85CFDC53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 07 Jan 2026 13:52:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 078C230381A4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jan 2026 12:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F42831AF31;
	Wed,  7 Jan 2026 12:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fMHSwdWB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XWII4gFO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717B231AAA7
	for <linux-arm-msm@vger.kernel.org>; Wed,  7 Jan 2026 12:51:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767790294; cv=none; b=PkcSt2AMdJ92upAnTuLdvjmRJRxhyWvSvq7TOQ/Tm+Q+bB88bUKezFm6Rqhy0jyuanuFIWxT3QWVAW3sj/mTccC6D2CiOe47oTQ4CsPI1XQW+rqAI3hf7osTV0bH4FeC8V2kvvqguz37fjYF4ac8cksTld6YPY++3gY1HXz9M/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767790294; c=relaxed/simple;
	bh=UZI5NSS027CL9bh2n06kBb24MIE1QqFro5h+gCHWWuw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HWLhbZMQe+uMeBKe8Aa7tRfXDxr/8VyQbjHMej8cNOKIq0NyeLmSGfh+jqeMWf6mL9+nFyaWx2bo/jgZNP9IaFRPzTmXfroxmAp69MUC9CyBs2nZ2boshlynL5vgXuuDdaO6rfavm9kZg990pp93pfKF1vWSdbduolTGpOJbXm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fMHSwdWB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XWII4gFO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6079dqbQ2593315
	for <linux-arm-msm@vger.kernel.org>; Wed, 7 Jan 2026 12:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QUZTglwraTogm7+NgckDuNvX5948M5h70ehV8ZhNvJY=; b=fMHSwdWBpysbeo1Y
	mF8qyROaNIEzcjL4hAE8pAe+P1p8MOtxFc5wlTL4c3hL4B8/Do9jQ9lx3EQ/wi5u
	lih3FIeUOI1OwzuiQsGlpB/inhpS675SxzIY+Wgb8YB4+5/5HP2c0TMpNEyx6+xp
	WWmnauN2GhE1N5U0uAG5drADfelQ2lXw7jBzSVMgsbZVOHdLBSSJiLgdmnN00v+G
	xy6sp765mn4GbWbQR+aB4MBNowGeY6cU6jVJTEMcxYAeVet02Wet62zNUd+bYrn3
	AN4FWCB6INMaBMKOdyMUC5I8ZkXayss0HHgYqFjfWXdt2Ec2MS4980kuD6BVYXBW
	SZX3vQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn290hte-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 12:51:32 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ee05927208so6224151cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 07 Jan 2026 04:51:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767790291; x=1768395091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QUZTglwraTogm7+NgckDuNvX5948M5h70ehV8ZhNvJY=;
        b=XWII4gFOLIPTYWk5bSgw1KketKeWqoVVNbjcrRNhBPU4RZlBGPjNGiYpwj3yS+ERwD
         w8NAeu0A62KwnGQlKtsNG8m75u2vhQW2N0XHO89u2R2BcS6yZDZF3ZQvGFQ03aQz/PUo
         CWr3fvWmL5Nc+uxXVkEJLnVbdTmQkrC5wmg4u3dIPKB6GgXxKFt1l1pD6Mcnl1LecpEo
         SJpyWJUAeh40MyLgqM/qOReps+oVr15PL1QEdQqcNz9VkPBRxrqMU18q2LxVJFavSlud
         0WZUp1oYxuZzxKkJVBU7U1G8HtUCw+jL6cnMOsJ7Y8CsW6GyTVSyAdswHofuRrvSg3XQ
         GVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767790291; x=1768395091;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QUZTglwraTogm7+NgckDuNvX5948M5h70ehV8ZhNvJY=;
        b=YujKLpgf4bQ4XebLO9qpwqoBYyhh30Oe+wAz/3P/eo0jeHRlobPHTWgji72i6FGivx
         fuZfnK776+9OKQ1iWCJUScgcerc83bg7xiaILc+ETPnrft3tLED+IGpT7PZAztvCv8/w
         PN3VKxNSOfPd6cH+KKSGQsKKLkdmFxTO9YbQkYpem9evA62lx3hPi7XNKjC1++45RRI8
         jQECwJ0PF7pR2mz9oLMVrA3z/p40m07GtUToaK31RDao5Y/k+jA3/0rKlca+vIf9rzzT
         v9D+beXiYbcFiSV0c4406osulP+ZTz7wN1I4cRYpf+MbxNOVIrBHML6ifcBsG3DWVS16
         OSlA==
X-Forwarded-Encrypted: i=1; AJvYcCXHCtT4+idMet6Yy7vHNMaH7PiTFoEog7QP5Wg6tWFpOYvuKv9ziYhPjMGXpP9X0MN3yOkjQJCTg6J5lVSo@vger.kernel.org
X-Gm-Message-State: AOJu0YzT98qBkNnhHmPqZDUECyokkCb01YcqPjsyctSyHO/iraBBd+4N
	5JnXGDuJHyynwE9LaYtsrcdIn7dmWFdah/lJwgXUWOKACy746E9ScVNH4EturOIPd37AXOXzniT
	uQ3FiH5SPQqK2hzdLM0NdFcJHt2/FV1aDDui6XAFzrReqBPXvohNfdioSodMeJhdyHDFUr4GOcP
	Tg
X-Gm-Gg: AY/fxX58DGymSHubNdYzRAa3qWw0sXeOkCcmNijeZyeIzxlN5XTXeVP47/Xm+SFQEWT
	9wxsTe2ulXvLxxzYdq/lzD/CxvJRO6uF8yac3ImiwIkw3fIIUZV+/0p0tnzBVa2rjemW65lL3vp
	s9xD+bw7cva/CYcRbGO1i40rATeZnWSCkslOIknL99j9XMTekuuS7E6ngYoXopqzyaaTYvivZwk
	ROSxdzczpt3zjJUwlG+7nGzXbj6FOzK/buU/9sSz11Zig/ZIUL5iWO6TewcgbvL6i0gXsU2kzEV
	oiJwMW7rc0AuM7CuHeBTBj5KC94I7+EPwL/AObHZplENo0fVmg4OoGKM/MhBcZol0zPJF5s37iU
	6StVIVluoDqOfvAFcoktfbhkOpvIj4toEWwghi9i0s9B0pvhKh+jJA6q8slo0q3Yya/c=
X-Received: by 2002:a05:622a:408:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ffb487595amr24143971cf.4.1767790291419;
        Wed, 07 Jan 2026 04:51:31 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiICMonpfvJ/R/ogSG1ceuU5+Ajgk2M561kN++MvOVvu6wIhe7i7YbrcIT4yFCVxsLVoB38A==
X-Received: by 2002:a05:622a:408:b0:4e6:eaff:3a4b with SMTP id d75a77b69052e-4ffb487595amr24143771cf.4.1767790290995;
        Wed, 07 Jan 2026 04:51:30 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a563f0esm511541866b.60.2026.01.07.04.51.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jan 2026 04:51:30 -0800 (PST)
Message-ID: <af654d22-92e9-4ea6-8431-c76ee844d32a@oss.qualcomm.com>
Date: Wed, 7 Jan 2026 13:51:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: robdclark@gmail.com, dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
References: <20260104134442.732876-1-quic_amakhija@quicinc.com>
 <20260104134442.732876-5-quic_amakhija@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260104134442.732876-5-quic_amakhija@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IH-0jihYLQNqpFiLwajYLyQTEcbISoqX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA3MDA5OCBTYWx0ZWRfXxB9dmTl0Bg4Z
 0pgxH2nzrnzatfS3t4xvzYXQeg4tsN/Kx2iDvYMbpPwIrLiK2UAtXWM1P6w1fgpQaRhDaE3mKlV
 COK9kknS+dj7u1ihusqhBRCFtDsugmOrXpfBrd8WuezVlfAQWEX6kLW4PDZNMxjkm4fxcGnyrM8
 Lv6X580B6CKvnWlDkBxHQSFeTZ3CG69l3FwUUfjeUooCRvVVPQuZWK5orMKr6Nl8rVGljd088Xg
 8lMCfeOFm1I9S36BWWi2G1bkPxpsQJ7wG70cbx3Ac3qRY27k8GTXb2ooP69EYmQWCg53e7nFgAZ
 3rcoR/SQ5GcCkroJuERQF1YeQVSDrUAvITTMxB2TVVhCJhDbrZ/7D77A9zeRXPoxQsVP/98ZLYm
 553WCqramIlnOpyNuj/5KFpgSCtvpMOXRWuy/fguH/dWqewnb70r+dTEtDglPhdRV77yuTPoT7R
 drolvpXj/ZS6bBSPBHA==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695e56d4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=OIU6w6j0321fZR4p8lUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: IH-0jihYLQNqpFiLwajYLyQTEcbISoqX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601070098

On 1/4/26 2:44 PM, Ayushi Makhija wrote:
> Add device tree nodes for the DSI0 controller with their corresponding
> PHY found on Qualcomm QCS8300 SoC.
> 
> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

[...]

> +			mdss_dsi0_phy: phy@ae94400 {
> +				compatible = "qcom,qcs8300-dsi-phy-5nm",
> +					     "qcom,sa8775p-dsi-phy-5nm";
> +				reg = <0x0 0x0ae94400 0x0 0x200>,
> +				      <0x0 0x0ae94600 0x0 0x280>,
> +				      <0x0 0x0ae94900 0x0 0x27c>;

size = 0x280

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


