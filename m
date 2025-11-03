Return-Path: <linux-arm-msm+bounces-80076-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A2219C2B12B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 11:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 787A43B7E2E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 10:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7818D2FE570;
	Mon,  3 Nov 2025 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BsWGaqtI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MERA8aAL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E406E2FDC3C
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 10:31:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762165862; cv=none; b=Hvb1L5ykJEEkS5TKGbObRvySVjBy7yMCsDAXN1+RLq9y2PebpiK9AGMhKiMYdwECgmFmNkIjlguXCdrMqumn0M2nmKfWL2+Sd7razzzWgZytU/bO9jK1XhUI6xaXK6P6clf9VMzx4eio9m/jlnNfwc1T+7TP2wCNxRZ2Kbrpen0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762165862; c=relaxed/simple;
	bh=DUl/v+dDDeGqqyWq9yWVSUSXbQeJIusN+vU25wQ/e/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gQcuXorzKe55CS+imYV0fujJKX7I/5EUh1/pUJVwlZAXnzswNQs04pEmK9qzqQL1kUWvlpv4JY3uTj8pFuKxo9OmwMYjmygj7Jnh/sTHEnU3QJeY316UslbbNlUOJXJjvRdjxTFFXZU5DYoHzUChzNseVZwtHRU/4gstjv0QnIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BsWGaqtI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MERA8aAL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A36BDKZ2267756
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 10:31:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jWE4ljXKfIWeWBpJ574mSlDJqGovq2Rh5s9YuFuiV3I=; b=BsWGaqtIqSlRSyOZ
	ja/kOMcXZ+vWZwhJyjM5cYka3YfJuSLcwRtK7nJaCZjTyYidO9yG25tcpL6FS2Wp
	yExKrgOVk0MVT2kpXeHxtEqV/UWbYiTv/58GYHN/baezMKkfT8QAwbilZYprUR4x
	f5Ei3TzdtVLGoLfLNlAB1qJ9B0KC1C6S4vNDRe+z12uPaXQTkCjNAoghCF1wPXL4
	WqNNnP32qLldY5extbEzZBPyBSFMy1fTVdpVrflH2h29Aw3nMS/01NBGZu8Pymrd
	q1eurZCadmdhdXOKL1mL3mYr0EVZtSfTyJ8oObnnWk1CZumZungxZBkhoCf/coIa
	fN1PzA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6pwagtas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 10:31:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8800460ca8dso16884086d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 02:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762165859; x=1762770659; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jWE4ljXKfIWeWBpJ574mSlDJqGovq2Rh5s9YuFuiV3I=;
        b=MERA8aALj/qDbz+/oXVoCHKMPLPi1NBkTO6dcwgNwN8rKDt96Sqhv53tqgbDj3TZj2
         K/hr9CjDJ8Hsf6PsQdudgrgGn/2zI+/YHLh9IRxQS7FBYAGenYyvVV2IaDj/my0UIZE+
         ngYcUGZmHLC98vAa0s7YdrJJDFp0sW13Bx7Rx4vIibIsuw1psI3C4tSe6kVWSBimd8HH
         wEqUutFP6exOefI9mjTVUVZwIwkS6Qb1vC/uh5RCBURYDW/4TpKbqmeVKIzdFoHTLtLU
         Iek0yHep5Fx+WltUp8m+0Wt4gdwx2KE6kJzhB0N52b62liTpW4XanaIPJHwFshm25Y80
         t9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762165859; x=1762770659;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jWE4ljXKfIWeWBpJ574mSlDJqGovq2Rh5s9YuFuiV3I=;
        b=Rww4d1e1FLBV8Tar4did41YCSdOzZb5ryN/1tM91NA8WYHg0mJltK2CbWsM6/C4f39
         BN/clkhP05unXg5D65+FqvCXXqC0tBKY5CQrCHZFzZVCyaQnfDuaE1PuZgBh2r2kuptz
         BgwQK/mP+6Ttzq59z4qcfngTB52EqnkYF4D+lxLVbajayIhurgsru8zmIZ78qd5cQpcd
         zMX2/D86vLjU6stT6GCeDvU+YmJAeaW7GP/W0BQjznyiZyWXDkoej6TEuV4qi2gr8TuH
         d5R6OAIuu30LffWAPY5Z8f4ZKz+fF2faI/QWrnVdH1XTqYT7p/8RmDJSRdShotLq83Rd
         2C8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXME5wxd/EEnPygwRBvCoBpFTESwwSWTB1xDROoHiMDIhkCT2qVBN+5Dy4tiUde91EJFht4A9a5eGcjpQdq@vger.kernel.org
X-Gm-Message-State: AOJu0Yy59so+68gwgrVevXJMhMqq/YmzMCF/AzzlaqdRgRtY7TnyLZKg
	3XuGWm98AvpBc21CUcogp0wqJuHk63rnhyHsvoUsItBs2s+Tnv9lJ9Q9sJ3+JrZBTPS4bkYYuaG
	7bU7CmHH22iENKswsSkgPXxiBih709DtaTTbRv7Y/X+rCCgy6oHWoW3etgpmLRZxDiRIq
X-Gm-Gg: ASbGnctc5ob4gxVBE2UNQPVUizOAliSA8aBTfPV+iF/WNqNFaAPEtDgxGHB8r7/wagR
	4Oo1JUSYXWVS4NhF28LXwsDZN+hICbV0+wft0jZDMvhmkTnuUjauyQMoLtKRjHxKDY9d9w/VPeE
	3QvbFt8owPmxYL2ZK/bqArcuwFzI7olYWaCnubdqL7FE8rR16klfBIOQJ+zZXw/OGPUPtMD4Mqo
	GU2L0wxFi5p7IwpnDY9+P8r407TTwYrPCDngs5NEwg4lbowXsNaMAmLG+IW6dir331sSl1UK2Q9
	JhE4D/uJ4mnR4K19YfIFuELV1tH9gjCBGxZa2NK6qaVD3cOltTbm0WZU54nj214FJicvoYuaeBi
	cqMoQnMnFIctU+GyBrqLG7fdPOQD5RXmKFQcvDlDo+NlOZ5sZjvYSXPzo
X-Received: by 2002:a05:6214:415:b0:880:5cc1:693e with SMTP id 6a1803df08f44-8805cc16b70mr6734616d6.7.1762165859028;
        Mon, 03 Nov 2025 02:30:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQp+B6BbASeIJWfxPDgxaNj/gsZ2jj9hIlPnMzU22TpzxNI//yIFYM2vt+axjIO4e746PIRg==
X-Received: by 2002:a05:6214:415:b0:880:5cc1:693e with SMTP id 6a1803df08f44-8805cc16b70mr6734366d6.7.1762165858569;
        Mon, 03 Nov 2025 02:30:58 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7077975cfesm1000680166b.4.2025.11.03.02.30.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 02:30:58 -0800 (PST)
Message-ID: <801d8e09-276b-427d-8419-7f2355df2295@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 11:30:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 7/7] arm64: dts: qcom: qcs6490-rb3gen2: Add TC9563 PCIe
 switch node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20251101-tc9563-v9-0-de3429f7787a@oss.qualcomm.com>
 <20251101-tc9563-v9-7-de3429f7787a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251101-tc9563-v9-7-de3429f7787a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=OrdCCi/t c=1 sm=1 tr=0 ts=69088464 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=gkRObvzxmN_HJK3DEhcA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: WQR2F1_2ONgFccSPK0-iz58BQp1YXFzp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDA5NSBTYWx0ZWRfXx+7nQCP5oXKg
 Q2yH6bnCM8AWHrBIWKcTLQhedyFomumLaNI5G+AZ7STO7vykpheyHxCJiePH0RWACOJUfFcb37b
 VfBSxlhzOHs2I+g7a92+VG9aRmFGsZIYt2U1aiXzWaFzlj+RFu4JJtXRBZf09Dz7qdvv2gPc1Qc
 vg7HlQWHL8PsswVgGleWUMwQbvcNQ6mLliYLojgQx0bQ2GwotUw0aai7oPfvolAQ5faa4qavdWP
 y03ormfCp+zF3fGSs2cUc7J6tE6+pfp5Wh7kdcO2R4KrdLmxe8ig7bhNoiVECy7kljFGw92DPJk
 PWerZgnIICZ2OKgP+PIXz0byhonzNl9yXwLd9aor+2soj20atRN/m3+LyT3ll85CU7FFxUvNGGe
 xO7m85kuF8RB5QV9z2iwRvsZkvv4SA==
X-Proofpoint-GUID: WQR2F1_2ONgFccSPK0-iz58BQp1YXFzp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511030095

On 11/1/25 4:59 AM, Krishna Chaitanya Chundru wrote:
> Add a node for the TC9563 PCIe switch, which has three downstream ports.
> Two embedded Ethernet devices are present on one of the downstream ports.
> As all these ports are present in the node represent the downstream
> ports and embedded endpoints.
> 
> Power to the TC9563 is supplied through two LDO regulators, controlled by
> two GPIOs, which are added as fixed regulators. Configure the TC9563
> through I2C.
> 
> Reviewed-by: Bjorn Andersson <andersson@kernel.org>
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

> +	tc9563_rsex_n: tc9563-resx-state {

The label and node name disagree about the pin name

> +		pins = "gpio1";
> +		function = "normal";
> +
> +		bias-disable;

Odd \n above

Konrad

