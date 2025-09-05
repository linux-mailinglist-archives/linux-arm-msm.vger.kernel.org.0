Return-Path: <linux-arm-msm+bounces-72286-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C78E7B45824
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 14:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id A5C964E1191
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68CD635084C;
	Fri,  5 Sep 2025 12:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hi6yo34A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E417334AB08
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 12:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757076490; cv=none; b=cmNlZ3nnb5Dm5HUG9nwTBAqXd0+y0bjfky09lvOH5qFn4HwVBPGPTxzEpVY75NPSLFLRKSEUEcDaxoRklFahs50cIOG+6mVHqRbc7s1AyPdMPUgzqyuKMt2peEYo70I9hlPGcj7qi4kvOk5NWmo9sUFCi3qNthxl0vK8XtRiXA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757076490; c=relaxed/simple;
	bh=eP867im1PNQSlQH0RP105yUK43I1I7etGb230DP2KcM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bbEcnVTWYmbf+rkjoM9DFt3NnGYut0AhmoJzCveb8aP3nu16vG+Zt4qwuVYpIfrGQU1UeKqcKVStP0uvIB4+lmmeBP8qTe3jAhLjX0TtQa3EkZetli9rvRxCxvAw2QzteA5tiu4Vyulix1D9T3GQc/3izOtmlwUkZfjBk5MEsLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hi6yo34A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 585787le013584
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 12:48:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ZVoQZK/NUQF8NTLJXml9/Jc9mpKZVnyeUkELKpWfaA=; b=Hi6yo34A4CSECkEy
	in3l+VwwNrdQ6GuihEaLSZ8pdMPQDi9lXGOksR3My2YGA1VKteV4zqqlwdEMzoJl
	B4lQpu6s1rmjeIWEqbH0YsMJANl8znAiyzkOH9Y2LO+pgTd5FsSw/xkI0Egp7tKu
	SC35tPxJBmHl2caBubK6NAHEwBUQzgKVbyGQoIXsZ/kEx65UwN6UqxGrGt3nMEFw
	PATPGNA4XaOZJ/VXljLilvqq075X2eXhmRYvbXfvaUqIka/dwLDHlY7oifDaUyNV
	ohIH/PlqNWtFc7RGCkMv6NYYYGfliyTPtPjOyhs2hInzVExp/zykB/clpvO1jzd8
	ufcaLg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48w8wyf3ng-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 12:48:07 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7febb5ea60aso48668085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 05:48:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757076486; x=1757681286;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ZVoQZK/NUQF8NTLJXml9/Jc9mpKZVnyeUkELKpWfaA=;
        b=gQmUL/zre/t7Pcsz0SWfhqr2CepTCsmNOguiPpxjGinFOOlECfQ17D8FhgHPCZHmaK
         VdCro44eP9qdC2d7nIbqiYDxkRfWbEzX3t9u4+vT864htpK7RldIo3k+C+t3RXL40RDn
         /Q7qSMH6Zn5Bm6aA1Gc4dw6nZMHXXIR4j5Zi29wKkIQRDlvZT8vQOADzsDkCJsKFWvil
         LX29bP3ZOMvtCiyrTOA0zKJM2fdT5/8Dt/nVq+4D25fk8MGHXhmDUcBtmzVB6zWZmLLH
         DKUl/Rbh6NPvrqdePZjSUy9id550iFD01Rn3EA8AG8/u8qEz6soFGY5yzSyhF8FutEB1
         aFUg==
X-Forwarded-Encrypted: i=1; AJvYcCU3/FLrTXtRrCiuYUzlELwvvoVCB5Hv02+jlPF3YfbX8VPtfcvC74plQZro8YsO27RJJ/K2DbOzxdo/XDzS@vger.kernel.org
X-Gm-Message-State: AOJu0YzIi9WuHFXnrpSEyFKYhgr4EqQrI2L38xgCOf7oPlBl5ErNaSGW
	lEfuOsS5b6h/x0Yb/s/Rt3K9CzN6FZTfixdb5cyJVVL/h6ABZY5TmXDglDOev6i+oWlXj2Pjga3
	/ut3Szq7s3FRAC054pm4nZ7ZwomFkqZK05jhQe9Hyg6ISjr+vvUXcwfg7qoN6czXMlcoMWrdE5E
	OQ
X-Gm-Gg: ASbGncsisqOuCC+STqFmv4o4ZzZIJk2AUrIQfrSDiGwssUZqQs9sdA+mymDUU07XMfv
	4QVoUhBK+QHvHVB5MufPIO+socR5k6+E7b8Uvtw3ugWJ/QVmqjumilJO1bqwoLsev3y1djg8gpX
	sXhw/WnOnBXMVVMGvUxW0Db+ZAJ2SOR0Xugs85IEogGN04i/Cr6vDQNAreP1JwVpPzMh5OpwfPg
	vnbEK0zxWMSfRjzJQFdce03+LSdXu4Qa6fRgzCgcUpScEhUs8sjWjBM/nHOqaf1TfsIJ/N3XETE
	yhQHQ8Adl1XOAHNoYjmiji5Pk8d3Rd5eSugiNvHFqEQfdJKiQD6kvWbtgddauC6NG48aPmjfOzC
	56gApgPACA2XiDRaRyNxj4Q==
X-Received: by 2002:a05:622a:349:b0:4b3:d2c:f2a0 with SMTP id d75a77b69052e-4b30e9a9735mr211937291cf.11.1757076486030;
        Fri, 05 Sep 2025 05:48:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2ElF7QOoyt6gf6FW/4zDA+dbADMgok/NNv8+HL6CTAMy+7viHFeskOkCiSzRQ+mmOfHHfSA==
X-Received: by 2002:a05:622a:349:b0:4b3:d2c:f2a0 with SMTP id d75a77b69052e-4b30e9a9735mr211936971cf.11.1757076485517;
        Fri, 05 Sep 2025 05:48:05 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b0466a962c4sm694167966b.71.2025.09.05.05.48.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 05:48:05 -0700 (PDT)
Message-ID: <25489432-7cdc-4e99-b5a7-eb976df302f6@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 14:48:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/14] arm64: dts: qcom: lemans: Add SDHC controller
 and SDC pin configuration
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
        linux-i2c@vger.kernel.org, Monish Chunara <quic_mchunara@quicinc.com>
References: <20250904-lemans-evk-bu-v3-0-8bbaac1f25e8@oss.qualcomm.com>
 <20250904-lemans-evk-bu-v3-2-8bbaac1f25e8@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250904-lemans-evk-bu-v3-2-8bbaac1f25e8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ycq95xRf c=1 sm=1 tr=0 ts=68badc07 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=EaOeOJoe_TH6RZfqOFQA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 5xVCfZzNPDXuWbeAPOmKUQx9IKPvzVb6
X-Proofpoint-ORIG-GUID: 5xVCfZzNPDXuWbeAPOmKUQx9IKPvzVb6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTAxMDEwMSBTYWx0ZWRfX/dO2ac0SQWs+
 fzqKuJpg9fXtxIYTtNvbRKIheGfP93lmmmoWVXQHOLzDSumRyXe2njSQyjJLltLlo4T/6eLaLsM
 s6rEq9Ab1sIOrHsj0h8hzXhUbaaCr7dmhvA0rwqZxzc2uIvhOC/P3OwW1O+q/5t6DKurxx3vdgk
 QwPnDTEwu3uOOPBv4dKt3JR9fzKtKSstsgb74sGaJ/ay68Pf2de7c4nIhIUty448l2PYrnpO7vb
 Our+/CVNeKzP/j/0EIQ7luYWttIIc9TmSC9+ZXgd6OFuNMEWXI+lmFIismgBNUPqBnDWrTscnbM
 fNUzOlQUKhOjGUQvW8lMdBsb0pDGGHB99UGFjdiOmEh+Z32DYy/V+1KHSUcrzjP7XTKsjselhiA
 HVcLp6dV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_04,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 impostorscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509010101

On 9/4/25 6:38 PM, Wasim Nazir wrote:
> From: Monish Chunara <quic_mchunara@quicinc.com>
> 
> Introduce the SDHC v5 controller node for the Lemans platform.
> This controller supports either eMMC or SD-card, but only one
> can be active at a time. SD-card is the preferred configuration
> on Lemans targets, so describe this controller.
> 
> Define the SDC interface pins including clk, cmd, and data lines
> to enable proper communication with the SDHC controller.
> 
> Signed-off-by: Monish Chunara <quic_mchunara@quicinc.com>
> Co-developed-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

