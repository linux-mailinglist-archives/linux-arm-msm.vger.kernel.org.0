Return-Path: <linux-arm-msm+bounces-68352-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F339BB20735
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 13:16:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67C883AA8F2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Aug 2025 11:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E052B2BF015;
	Mon, 11 Aug 2025 11:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ktTDidAI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 550082BEC57
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754910879; cv=none; b=CnG8iN3ziasnqjNOR4OlChuUQ0BZEOC/QwIhCME5/fyejxYBctFs+g27ato6pfXKSyqpbdSrETJfcWT0Wkjhrs4LfrVRpmy9VvE1wTC7EssYR0hccPZHdMOyXViq77IMeo+3ujV+InajFnmi7R6rqUPCC01O8qOOoeWB6KTNsng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754910879; c=relaxed/simple;
	bh=e24QJFeYn/rd0qZBMV40BvBKk1/UrSZNtUYQoAsCBHs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NyLb/LKuodD4YUQWwLbEivalGPJ6CHcymWylg9wLwnQmu6gmsfasp+3fTZD43jF/EaUyxvhhJw9Ch7jx6yuhLIHdjwzSRNGSLcua2ngo/nt1ADfA+YABrddryexELaeVLTnhpGZTUWKQykJCSPilfolC7cvQdQsHl/BxDuqn/P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ktTDidAI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57B9dCHU019164
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:14:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FMVgCALr0eA8+Us8AyPrgn7ofcaNBLZnHFXRdCHjjtM=; b=ktTDidAItFqOW24t
	S2HZKgTLd608Um1Wjh9VBp6qsSawH55zNd6TIZw11mULKqEatccWJTDo7Mjm5C6n
	DwQlz/d12F0HPP2jPg0x+seP3HZr+XLAINcB7wcGiqNdwY5VQJm9glOX5mxo8/da
	rzrKG9D4mjdzpf6exaer6qjLaWEum3Uq5SgPpNl5ZmEHsJbhvOnURV1ondGMOEnG
	UeBeEHbIybYWKH641vvZNVqfu8TmAhRjb8wgr3S4obhADzh+mpZA9OeQmOOYlKVp
	4WGchkteboag+vIkXj4KcPEYY64Oswak4OkZfCz59BGRPTPLZIOdV9VOXV3whK74
	9LibGA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduv5ak-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 11:14:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4b067cb154eso9711441cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 11 Aug 2025 04:14:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754910877; x=1755515677;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FMVgCALr0eA8+Us8AyPrgn7ofcaNBLZnHFXRdCHjjtM=;
        b=r1qWnhzbNhCClODFln3M5ADT3m5Lu4UquHoVnj3a7s0hkjewxTm73wGBE9Yi6c/Tn8
         m83407EU9L62YR9/OeU1voeaFr1DMkMOD8tQzENnB7T278XcSQeZ+CPF3mCekhgGDzpm
         jmqjddmqIvny/PddkcjO6qepJQaErWSB48pQfEfI2yfHq73Vh3bw595e/QSs885Xl7Xe
         2oJS2I0ZBP/k2kannGQa/Eatqaxp3zZaakZRvueliVmjFUtIAhpVcW0Au9eSheCxOegO
         RBk3slb3TxkPT+OAi2K3V0dSaqyRLPT3oq3sMjGOAbL/qQoMWoBrr9Jeuxjzm85JwmAg
         RzLw==
X-Gm-Message-State: AOJu0YyTyKBx0gCLbu2zS/IgPSvc1KL7UxfZbow4bXDrAqkxFI00j7Uz
	owMuwxsoZwmtOx5bes6gZxfs6A3rCE9hUCqpRkJ9ok1lrtBcdS+bN/HBvdcGWNX1CxqydJxD/Ei
	u1zNjYkb6kncTh862bC3JpE+0jOxwh4ayO8rVDeISKxsPuwFNw78lxGnDgJqwOrZ7goNy
X-Gm-Gg: ASbGncuxv5FL4ILrt2CStJBKmDRDcnGCPI1L3xRkKLO3QYdwr8N3OjiyTHc4hrFKLUS
	NIxmGDFT7j6ktHt6bb7+XLt9RE8gu/ZbOxMbWLzd23RP8dycm2EDA2ADTwbDoJeQ39vRtkrKKHH
	k75apVVvNC43uLO6OyrogLBAMFQ/kfM4IJjW3TJn1ILIWqZo+hvMI8fHCQxKnpJVIxhao3qMdVn
	qKTP+mI7iZfMR7SpPbY9PKm8RKDFBXmwtVyqjSTIjzoS/yw+MR0nAZQkIu7EVGhddeD/Wg49tkH
	UmpNzv/VM0X5EnaWuVLkrkmbG9TbAhHGfxp8ljlg2xMrPUwIiXCAQ4cyM2gCydgr42LAiXrSxZl
	MGWr+GNf8XiniSmpjSg==
X-Received: by 2002:ac8:7d14:0:b0:4ae:d762:c070 with SMTP id d75a77b69052e-4b0ea60d209mr1240971cf.2.1754910876593;
        Mon, 11 Aug 2025 04:14:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcUfndsz+/5jp0G9OaiDDbR36Irm8Uk+PPCGZvdlMWx0v8ppULBdZLYX9OArLLxW8LKzxvuQ==
X-Received: by 2002:ac8:7d14:0:b0:4ae:d762:c070 with SMTP id d75a77b69052e-4b0ea60d209mr1240671cf.2.1754910876078;
        Mon, 11 Aug 2025 04:14:36 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a21ac0asm2000540266b.99.2025.08.11.04.14.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 04:14:35 -0700 (PDT)
Message-ID: <a6dbfe06-00bc-4fb0-9496-fb7ca849f832@oss.qualcomm.com>
Date: Mon, 11 Aug 2025 13:14:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sm8750: Add PCIe PHY and controller
 node
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Lorenzo Pieralisi
 <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, quic_vbadigan@quicinc.com,
        quic_mrana@quicinc.com
References: <20250809-pakala-v1-0-abf1c416dbaa@oss.qualcomm.com>
 <20250809-pakala-v1-4-abf1c416dbaa@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250809-pakala-v1-4-abf1c416dbaa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=6899d09d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=gkRObvzxmN_HJK3DEhcA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: MfPK8NRXePdcnMkhVUw75X86yUs7h85i
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX9sKOtUQ+s9sB
 MkyHxI251U9wax88PHUUZs5eHz958paK4luOSvhsCcWF4MbF2l2HD0O+rTu/nhTeCe4fkJFJbPh
 Bv4hLpVLIBELoGn48m1CHK3BTuLeIdYmGixPqRBxfCBQy4ZLBtqf+7LM5ubekXj9DNHmtHg60uo
 0xdsvGycaf98Q06vw1Zu6ULe4g7jOg44okuh13RonLmmJ8dlr9lCDxgBLph5g1lDAduycPZlzKi
 4ZtmR0BTY5rICo4a15qI2SbNg10cBa5nAutwilFRZwNWTMBx3aqptz6MEvtpvRPpCWInBuACa+P
 6uX1j90OuvKdWignKxdKdJG4q6qLEVoheJHwGXOqgN1CbgWa9zUnPPFTF0rQxtaiCnlsFn/jQ8/
 fCCzvEld
X-Proofpoint-GUID: MfPK8NRXePdcnMkhVUw75X86yUs7h85i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-11_02,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025

On 8/9/25 11:59 AM, Krishna Chaitanya Chundru wrote:
> Add PCIe controller and PHY nodes which supports data rates of 8GT/s
> and x2 lane.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---

[...]

> +			phys = <&pcie0_phy>;
> +			phy-names = "pciephy";
> +
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			ranges = <0x01000000 0 0x00000000 0 0x40200000 0 0x100000>,
> +				 <0x02000000 0 0x60300000 0 0x40300000 0 0x3d00000>;

The BAR space is larger (0x2400_0000)

please align the overall node style with x1e80100.dtsi

Konrad

