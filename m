Return-Path: <linux-arm-msm+bounces-59935-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B35D9AC97F0
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 May 2025 01:00:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8D8C21BC065E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 23:01:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C8A26F461;
	Fri, 30 May 2025 23:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LXEUZzKe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F8028B51E
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 23:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748646047; cv=none; b=le42VPu0/HxiCDbqmgEZdI311THMKfA+JDHi31uLcXBtN6PmD9EVt1jN4YxouzoaCFYnsGvfOJQyvvkXnX064ji30Wy/rtJFmr7VMRzjvSlQhJdCKK8z3TLyOojG0pqh8jSjCL0uEgGfzzHgT5UC20F+TyMzXqleifOhuYv1D6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748646047; c=relaxed/simple;
	bh=LMN2CJvWjnSp1DFxtqbW5/P+SkmfTosLclftY2KufBo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LFKqgXB38m1B4xsDCOfM4Plm/hw8Soa3LR8ddbO4HyJJE4hxf40GxSKo86Afr+z2jt03bfjJrLLaIHkJaS+DT1pd7R/xbt9uHJ0g4ElJTOO/faS4kuCh+MIQ+gQPLnsScUcSNcm13MLnmwXyHvAcfqieF1W6UAFVKg8Mi5sSe58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LXEUZzKe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UL0h5L008179
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 23:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	616bsY/nEBSBHhfZUGqUyy3WTHSx4fm6iqXWJiW0Obo=; b=LXEUZzKenzxzgwZV
	ppg18kMac9P4rgtAoSlwTqc1i6HLV9vI1EPx0iTdMCTP88OZO9REiY00KL8s4nWM
	5SnUZ3yVFjpIoDFH2PzVoQH2gyfQ3JnxOBUK2qscR18DQ7fPaCvhS8LlPBhqzyyn
	A8gIfosnLPux9ltX7pqiV8elH6RitpidT+WVhdf3ycTdChUiCwv7TwClyaOLmvMY
	l31kRPKfLmVJ+KYC7qq1Tjaw505hO9Of3kYUHFtcH+dCm5WnusRq2oJQeEEOXyZa
	3txNbhGnbonm+MZbUbJ1jfyzo7Bu02BUKj5HVsMMNJn0yYFjRhIjxQLL8OesYDdE
	MfRVLg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992vu1t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 23:00:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-47ae9ed8511so5041531cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 16:00:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748646044; x=1749250844;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=616bsY/nEBSBHhfZUGqUyy3WTHSx4fm6iqXWJiW0Obo=;
        b=JA3LTAEygbZlDce+x7SBVTQtibLcwrACbK9YEVaHXjI2tujOCtvxnIU9L+YKq/q2KR
         7pHJ1DzLGLoFEF0HjHUcluqKg3i/UU2R+If2UgnqhfHK1X5Q2mEAMS1BvqlntC0RI64y
         vYM9jv73W8V0NV8692wOFp2bIsNdwA/YlZhDoBkaCgOQaMvaxIoynas75GOB0LmoTiDB
         3weQLGr552wrr+YS8npaTkA6v1ZAKyZqHalF/sDjVJnFfL+ZkCrJOHqLNYyxRJ0YCu7K
         gKnJfZyy1oGBg+tbBy7ahmZM2/UEMIOVx7NW46F537RfzzxNNa7LJWwY7AH/Kp6XFDCx
         1W3w==
X-Forwarded-Encrypted: i=1; AJvYcCVQj6DECCvndpNcx+uoXMgmehG8MbU+EpZSRiJfNsM/uJYqFXEplf7f9r17KbMImwwe4XZ1nXGGHtIdV1s2@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5J6XzSnrnLeq4ofuhkhdESzAG/pL/3xUAtny8YwiNhIju+k98
	LTUF5I2BV3nD5F6K6+J8aFSq+Ye3JOaZKMBpOgSxwTEFHYw3RfhjVhD45c3yxsSrJzTVJ4IVXOV
	gRIJHRp/UShxEtFuY37VwA2fKAwN0029QlvL6oY6hNTUTTr0P5ACGyKhFaXtGkK+aAOou
X-Gm-Gg: ASbGncvqXv+sVQrfOXQGm1CqmjQGbKUN0dPrV9ncjSyi/AQbMSE+2DXgTWARZPHB+Ue
	BfLCiQOUNEoGOhBFtCL4v2PJhpkxNypmXVYCsYbHG7UckI2JTaqtlQVocPqA9bd/2H8jzMaWDuS
	KVCoqjLRHT5xoEeELhqCSuLiXZL1Wr0luZLHrRDsuCIMtyzVWhHsn/mDX1ie7aJOq3HP7ya9Thy
	N7ccYeJfSxw3Lq1WET5RAHP70y5XIjPDoYWByrDshYz0HBOvfFOrJMGfcSE849YGQukuT8WGmpn
	LbZ051pui+FK4pdkTVQwW11nBxM1q8HQ9kDDaZviulx9oVziZlaUngwe51tWMUx5aQ==
X-Received: by 2002:a05:622a:1995:b0:47a:ecd7:6714 with SMTP id d75a77b69052e-4a44319ad30mr25043131cf.9.1748646044082;
        Fri, 30 May 2025 16:00:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFK6iok0uvIVWvqpCOyLIDjws7FdwQixOfUFwlizxjEFvY61uTtRtd0YSIs0q8n6c4uFb7yNQ==
X-Received: by 2002:a05:622a:1995:b0:47a:ecd7:6714 with SMTP id d75a77b69052e-4a44319ad30mr25042591cf.9.1748646043455;
        Fri, 30 May 2025 16:00:43 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60566c2a7bcsm2304464a12.12.2025.05.30.16.00.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 16:00:42 -0700 (PDT)
Message-ID: <4639636e-0544-44a4-a997-2969f4661bd0@oss.qualcomm.com>
Date: Sat, 31 May 2025 01:00:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 06/18] clk: qcom: common: Add support to configure clk
 regs in qcom_cc_really_probe
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
References: <20250530-videocc-pll-multi-pd-voting-v5-0-02303b3a582d@quicinc.com>
 <20250530-videocc-pll-multi-pd-voting-v5-6-02303b3a582d@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250530-videocc-pll-multi-pd-voting-v5-6-02303b3a582d@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDIwNSBTYWx0ZWRfX9E6aeJ95lHmc
 KFQmr1SJCERIuGY5ONbzV5fhWFGOofuarHkftFrZBe/FSkCj670XnsjHu7KjrJh2f1+BtY3Molw
 vSBoeg6FE5RGEBYErTuPc4O2FOvhmhfRV7UC9itHWeuZEcZju3anSU1V6uo2I7KbC+IbdTMaOnN
 vCjmmpvAfDnBzvUOZqP+piQfqhTQin3a56CP5O+KSGREL5Rh61b7qsoRsKM3iqw070iB/JJ8eyY
 86EK2O2LLzHu4YzALGgf/fRgE5fryIJhQHWF93htq7hwwiz6fITG9TpE55AgbC4MWCiZ8mdOvbS
 qCR3XroR8a+2ebXB+PQ2K6RY9UVuQACgy3GxpcvwCET8k7S7SWnB/hAgcnIAuVsrZwRjSbKNNTj
 jXCZvihJF8zOXsv/49pqrOPwAJGrXX9NcYxhpyZ3sixJuYmi5SVv98FQJ1gfOUGkREAIcEcA
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=683a389d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=zrwMVDrAeVkrMBg2wiAA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 0bkq50twd2jlya-6zsCBFPlDi9P3je36
X-Proofpoint-ORIG-GUID: 0bkq50twd2jlya-6zsCBFPlDi9P3je36
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_10,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300205

On 5/30/25 3:20 PM, Jagadeesh Kona wrote:
> Add support to configure PLLS and clk registers in qcom_cc_really_probe().
> This ensures all required power domains are enabled and kept ON by runtime
> PM code in qcom_cc_really_probe() before configuring the PLLS or clock
> registers.
> 
> Add support for qcom_cc_driver_data struct to maintain the clock
> controllers PLLs and CBCRs data, and a pointer of it can be stored in
> clock descriptor structure. If any clock controller driver requires to
> program some additional misc register settings, it can register the
> clk_regs_configure() callback in the driver data.
> 
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

