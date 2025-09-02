Return-Path: <linux-arm-msm+bounces-71580-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E85B3FFA4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 14:13:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 355A37B7970
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Sep 2025 12:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B5E530100B;
	Tue,  2 Sep 2025 12:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+/dY4wK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9568B283FF1
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Sep 2025 12:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814840; cv=none; b=csDH/T9YGVQQtnFwTp4dcnAMujqT/nsejmepR3KsHZrb3BcGLCrEBso2C+S5HKw871ZNos5LRMfTjvYOBA8Nle27vpgl8zlwJkMyVdjjDsZ6Z2grS5IfOO5mCXI3gr8iPBla2ZZLNcsjeKUpm4T4ACEo0cmIzJ96qJF/5666VRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814840; c=relaxed/simple;
	bh=xt2M/EYFY5LLWVrahB1ctY3E6iHAceS7dO6dEG4T8u0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lOxliLzY9YAKGLvHnzY+2r8vNV9aSZLAxIpAm8OrQVmdRSwQoSXq6hG9YZIufvZGCCP0uE3P819mS2dX9+TEje+t14uN63/MngGHk9/qyQCNr/sgv2ngaSi1Dtu5NJMBFrUcklTp0QUy6ItQPiUw0UyCBbOyd9/AHIcHEKeRnDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+/dY4wK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582AlB5A020481
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Sep 2025 12:07:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ooAgjRpTHNP8kFwOiUKb9Yh/50coU4iyP/eWLaeMM00=; b=C+/dY4wK+FzU9XOb
	4osh6w2fl+WAynCdo5SXzupLhtwkiwRNhcT3l6gtaar/Z3+ZahQMR39JtpSBSuG3
	gxQuAdzeJGV+Ju501Y5mEcDtJPK/cHL3vmZ5W1RBIGUEwEbvgI88sOoXcayivoX7
	wh4Z30+NyS1+BBhYBZj/RSmJA2+02EKmu/rZ0SpnDPeaEAZoqts7cXRdEAuPVuaV
	79xq3DTGKMPsbhnCubvOers1owdLoI9touOy0qusIc1eyPTfhfIc9s1wmc0QnigM
	6G37eyGQyuE9MTejZwjgz/pE/p7uYyCAy6OS3K/x42roEsPi54Y3boGKZb17KOSx
	IROvKA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ur8rysag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 12:07:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b2d1c2a205so15957621cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Sep 2025 05:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814836; x=1757419636;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ooAgjRpTHNP8kFwOiUKb9Yh/50coU4iyP/eWLaeMM00=;
        b=lIRKh8iSKzPlTxl1e/2+0PX17gCQnkr/T1XN3knDcwL/ias7TA8L3Imp0Qy6ze6Fkt
         FG+h19+/Qd7mLfUCa+Qbz63dMHYkbEh72MSdWDzg84imTVbnH+sSjEIqON8vBu3fEe7U
         Ghjt5caHwnFfHdSB1DXKh4Dm/IB2Pxp6K0mOK6zANv7869CbbnJKc9AOpTY7nM+QACfd
         GuHu2jPc/yPms6KWg52RBofIAroBrTcaSkzsaiQ4XUQ9n8i5Im1npi7Nme1OmC6KVNjC
         H9avAo7UlO9tbO3Q58pbeDcgdAiTHcSuEpKE6CBpRYmaGwsLR4rQXy/GKerSMeEx0Phk
         roAg==
X-Gm-Message-State: AOJu0Ywu9BrPNDOsL+THX7tWZ2VZ5CmOOjlw+uwHk9vBS1aopwSQ0k4+
	OTaViiB65vHt8Vs7d3YXLr6cLy/uA70P9imvEtP1AKjgltW8ze03NgqhXMf47xcaqS9gXL83IfM
	GKKytTSZlXi0We4kzTpEJ9Jy5/fLYKNO03H3hvrzD3nVa5GulQ8goWa9GBPF/48t1FeHx
X-Gm-Gg: ASbGncsi8mnJIXNF+fndhw4RLHvzWMsNyHx2thHahCva21N0RVDnGQQcN2doZePHrgx
	bxCvnuuovt+VJ9FaxOgXEgSzNa8qAI4k2WtRP1q3L5qUmOnbB7zjN3fyOH6uCjykxrTzz88gg61
	I0FxhCrA7NDIj6FQbWyDn5b8T48M3fnKnTN9zK82M8Cb/7tVLScmfWrbpqsAW0HvrzN0kNFO3Sg
	6eT3f9uacdF6n1PnP7WCuwp76S4yqh43iL70aC1dnKcqyPjF7bAdPuP/W3u45ysEAW5E94JXxjh
	IFGX8NsRa8dPK2oSuVs+9FNoJI1b0d9lhy9aHJqtm/aakelwGUeczodXnO3Uzmvcl22yr/2rnNY
	BaZFxRLrMrJ7wgY0txRF5Yg==
X-Received: by 2002:a05:622a:164d:b0:4b3:d90:7b6f with SMTP id d75a77b69052e-4b313e6f3aamr104880771cf.6.1756814836086;
        Tue, 02 Sep 2025 05:07:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi7UgyhFAah0VP0bJeUSU1wMpek7APbVlPpwHN7xSB0N6vFLNU7Pjd9+3uvDbCoDIOTsYYeg==
X-Received: by 2002:a05:622a:164d:b0:4b3:d90:7b6f with SMTP id d75a77b69052e-4b313e6f3aamr104880181cf.6.1756814835494;
        Tue, 02 Sep 2025 05:07:15 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-61cfc52ae40sm9249215a12.44.2025.09.02.05.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 05:07:15 -0700 (PDT)
Message-ID: <e9c70483-8538-4f9c-9dd0-b4136b34a667@oss.qualcomm.com>
Date: Tue, 2 Sep 2025 14:07:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 01/10] clk: qcom: gcc-ipq5424: Correct the
 icc_first_node_id
To: Luo Jie <quic_luoj@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Anusha Rao <quic_anusha@quicinc.com>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Devi Priya <quic_devipriy@quicinc.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Richard Cochran <richardcochran@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        quic_kkumarcs@quicinc.com, quic_linchen@quicinc.com,
        quic_leiwei@quicinc.com, quic_pavir@quicinc.com,
        quic_suruchia@quicinc.com
References: <20250828-qcom_ipq5424_nsscc-v4-0-cb913b205bcb@quicinc.com>
 <20250828-qcom_ipq5424_nsscc-v4-1-cb913b205bcb@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250828-qcom_ipq5424_nsscc-v4-1-cb913b205bcb@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAxOSBTYWx0ZWRfXywcxhnqx2FhB
 6CGarZW34JmnplNhh/cfh2+9uK6pv2DCVty0hObcIcg/5EA9AgIO82huTvmv8jQhfFrlD76f7yk
 0J06H1glUR3X+Dek36wtDuR/WY5YuHuLLv1Zc8ImLAG+eYPbqut2chk7wCdt5EuNH4DLKNCTKHR
 iHYzOJkGkVPkfkuuE7fJuSqm8HXWSl0x5TNyIq+AGXL5wPWcrCps26ET5duGtMSO20elnJNloIj
 tZLFRiM+T+rShWLlUbR8LC+k9N7LcM4MoCDXFkV4IK0AvCTIRp0/qMAkwr/FyNVpOCtfsnltXFz
 9gxWLnID6/0eeJvxUpAUZJaCUfwF04Mae9uOIvQ11hBV3oRBJ779hYEhQrzGYj4JpUazFusfiYL
 0UWXwU28
X-Proofpoint-GUID: ppRDlojnPyUS4kLGnh3o2F3pa_AeXVMS
X-Proofpoint-ORIG-GUID: ppRDlojnPyUS4kLGnh3o2F3pa_AeXVMS
X-Authority-Analysis: v=2.4 cv=PNkP+eqC c=1 sm=1 tr=0 ts=68b6ddf5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=5e-Oaz1CA7JNmZ_uPyAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300019

On 8/28/25 12:32 PM, Luo Jie wrote:
> Update to use the expected icc_first_node_id for registering the icc
> clocks, ensuring correct association of clocks with interconnect nodes.
> 
> Fixes: 170f3d2c065e ("clk: qcom: ipq5424: Use icc-clk for enabling NoC related clocks")
> Signed-off-by: Luo Jie <quic_luoj@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

