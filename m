Return-Path: <linux-arm-msm+bounces-75318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC17BA3EE1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 15:46:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0C09F4A5141
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Sep 2025 13:46:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E45CB1514F7;
	Fri, 26 Sep 2025 13:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="izW9npQS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CB313B58B
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758894402; cv=none; b=DJBlAEQUtXm5YAxrJEb3Y20NHiBts+u82DRQU41JADrkBoeWw4z9a3T7/T9GY3tG87DxcggVOOyDd1VDd2uLbhHHBTUZP/7luxIm3c/cZXhtcJ0BhbZXBSRlEbEfG+egz9ixe+U+xxtnd7z2BIrlZjNzAxpX31gZ3t2Kwcipzh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758894402; c=relaxed/simple;
	bh=0EOjaBswWQvC9XmPVf+lr9JjN3BYmeqPrTnFPJ0cBnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X3Ao+qy/Nr+P1ie31GyZlBKgr1kz8VLcIp6TacC3R4pCN5xwLUcZk480qGJ4id6ZuCvrfqGs0tPj3XZS/8d4q9Q8YO5D4G3fwsK2XHvDsDoAtGsgZ0uUx5h6Y0Ruv3381wFULEf7d/kJLMloLhhDtEuHdeZUQXG4s86PZURLG9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=izW9npQS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vadp014594
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:46:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	K7AOC2kVYXtte+/8joVQrCBNjRIRBFVGaIEKx6zbQkQ=; b=izW9npQSUWtSxCLc
	pEg7K8+BzdwWdQnB8LNP7gDOLBkDqJ/NohaFqQSxHW2mEaLLiKYV5gsVspVxgKQi
	Hx2y0ZadKq7eESLbdA7bKWAinffirfliMJn6ow/F/Z7w7hOdQ2/1jscNP81Vy0c9
	exDNJW4iGXKb/6TKLQ23gxH8erIQJf2cCGUTKtu0INSjVrQQqKGyiAuQwVIkCetc
	kXh2rkyCo5qV+HvF4TLUCJPD1PeCfwugk++GlNWR2n+AMgf3ZyzM76sbLCTZ263d
	gaVR4IUTUFw4MQ/5mOed1ttHXkoQqqFmEsDxlgUIdqtmceCtzmdTrLoaVRtgc5OL
	c6XTng==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db34k0j2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 13:46:40 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4b3ca5e94d3so1965701cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Sep 2025 06:46:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758894399; x=1759499199;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K7AOC2kVYXtte+/8joVQrCBNjRIRBFVGaIEKx6zbQkQ=;
        b=fXGxFlRnBgdDKxi2Ntt/iwZqsl3eFRanp+W1thmiPmLJ7PC3Dgd67XUTHMoSRyxKvc
         CnmRoPkXSBWB3gvJiN4uYNcNTpYcrARKMgySkSPZhK++C2svhOz4ucUtW5RU/GRsmRCh
         NpDejKQqWyMpTwFu4mA9ZqdD8pmpR0aJrV+hxZnEemNlUarsC+c1mci2RDM2r2eeA1Lz
         PDCDiMID3v75EdEBJvZz3CZCgpmTa8QdQcx8Wg7U4alRhCeJ5qqGuiuRbdh45OaMkudA
         a7b3RQJq7hvTxKKqFZ2OEnzZ1IH1U7UbmO/0ZazE7MrImdEB6ZYlPSMOXvWvP4DOhzCH
         vM3g==
X-Gm-Message-State: AOJu0YzKumEOqz/BsKNoU8l55GCQogOjJl2HINB24yfggSh8YGY3oYVo
	7/XHPtGLDuNTosRbCiIGsls3yQtUOFoD1FNy8DDNuUZtws2uw669RqCAdnFQlFii5Sp8XlNQsIo
	R9KjysjM+XeXJZKW/SiSGi1JTrI3hYJCFCuXDJ0sWTfUPyvbje2oh5sJfhzTUMLMKTV+d
X-Gm-Gg: ASbGncuVSRkgBStnFADschPH05m5NiLhXm9IRwaK9zOvfl1ko5YhzlnEYd25xOsGhSj
	em47ohHBvpVPLyY5cajkeGB6qR5obBgSUJfjkZlfGgV4AKojChHoh5afs/HekcG/OnWd3f1SzCZ
	qihGHdk3D3W1JSFOkoawhThOZ5bDEhI8005Y6IgbLYH48IzkFetxufb3Xd4+hAi4VR2CB/GJjnB
	87wmlGjHMN+M0YdFdjKN7gHuk/pOf73Ny7uSZbhqPS8Cgc6XXJjryHG2uQFsXn7a8966GXZiyfk
	pKdfZjpug+oDLHg6oCRgH8n/8v3ZyB4fNi76rlce/tIUwdHNSMNk0MYtxjNiQBrNsfzAvYxjlaL
	HuimY4osog9zqqsIFgWAg1A==
X-Received: by 2002:a05:622a:587:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4da4b42618amr71328611cf.9.1758894398944;
        Fri, 26 Sep 2025 06:46:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLtYwLQK9mRezkGeVWZEARoBJCmZbLKmK1lgkPXDI8njEY2QENyEHcYysVVTxAFgAyrj2CFA==
X-Received: by 2002:a05:622a:587:b0:4b2:b591:4602 with SMTP id d75a77b69052e-4da4b42618amr71328061cf.9.1758894398168;
        Fri, 26 Sep 2025 06:46:38 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353e5d7351sm375666366b.7.2025.09.26.06.46.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Sep 2025 06:46:37 -0700 (PDT)
Message-ID: <e1427bcc-0502-4cfe-9cb2-bae5bb10208e@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 15:46:35 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] interconnect: qcom: sdx75: Drop QPIC interconnect
 and BCM nodes
To: manivannan.sadhasivam@oss.qualcomm.com, Georgi Djakov
 <djakov@kernel.org>,
        Rohit Agarwal <quic_rohiagar@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        devicetree@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
        Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>,
        Lakshmi Sowjanya D <quic_laksd@quicinc.com>, stable@vger.kernel.org
References: <20250926-sdx75-icc-v2-0-20d6820e455c@oss.qualcomm.com>
 <20250926-sdx75-icc-v2-1-20d6820e455c@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250926-sdx75-icc-v2-1-20d6820e455c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MiBTYWx0ZWRfX9acuPddsqiId
 7r50aGcUxKRhZIbCRbqAkHN26TpdSBHxUYf1gY7rus9Xc74+j5YHcRf97/jfKTPhff1CH3O68k7
 ilLM8dfGX5oc1jPf1O0PuVVoqeME7n0cdENV/Ai25Sof7z57tBW7igLvDhamGusMfc5Je9YABV3
 98r0hFOHOZmKf9BTwh4rZkKIUBvvHFCydWA0/jXudRVJNrLllY+NtMTUgTseVi+J0rEU6bYe3fh
 Nxru2o9n+3RlVkYBbpdk/tWqA/tJ9mZOABPyiSLe7qLJ4tlecNuTRttoESwn9opi+YdHI54isGn
 nXZmlGWvHQ7LtB65kLPmIdttfXP250285tbYYGMBPJwF09+/YvINMiYbbqE9dUyjEZJ1CJOu5Tp
 xXWfJrS4/ZQb1foB6xBTlhGSDMmYrg==
X-Authority-Analysis: v=2.4 cv=Hb0ZjyE8 c=1 sm=1 tr=0 ts=68d69940 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=aH40uDyxLlspqTMSXGwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 8eD2HFX4ov_-xQeqd6sxukOdmgsNSldO
X-Proofpoint-GUID: 8eD2HFX4ov_-xQeqd6sxukOdmgsNSldO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_04,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250172

On 9/26/25 8:42 AM, Manivannan Sadhasivam via B4 Relay wrote:
> From: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> 
> As like other SDX SoCs, SDX75 SoC's QPIC BCM resource was modeled as a
> RPMh clock in clk-rpmh driver. However, for SDX75, this resource was also
> described as an interconnect and BCM node mistakenly. It is incorrect to
> describe the same resource in two different providers, as it will lead to
> votes from clients overriding each other.
> 
> Hence, drop the QPIC interconnect and BCM nodes and let the clients use
> clk-rpmh driver to vote for this resource.
> 
> Without this change, the NAND driver fails to probe on SDX75, as the
> interconnect sync state disables the QPIC nodes as there were no clients
> voting for this ICC resource. However, the NAND driver had already voted
> for this BCM resource through the clk-rpmh driver. Since both votes come
> from Linux, RPMh was unable to distinguish between these two and ends up
> disabling the QPIC resource during sync state.
> 
> Cc: stable@vger.kernel.org
> Fixes: 3642b4e5cbfe ("interconnect: qcom: Add SDX75 interconnect provider driver")
> Signed-off-by: Raviteja Laggyshetty <quic_rlaggysh@quicinc.com>
> [mani: dropped the reference to bcm_qp0, reworded description]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---

Too bad no one noticed for the 2 years the platform has been upstream..

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

