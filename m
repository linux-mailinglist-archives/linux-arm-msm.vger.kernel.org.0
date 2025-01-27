Return-Path: <linux-arm-msm+bounces-46222-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B6CFA1D447
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 11:20:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B42B03A76CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 10:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4660D1FDE22;
	Mon, 27 Jan 2025 10:20:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jpMv7jNo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A396A1FDA6F
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737973252; cv=none; b=oWblEpyaFXvY+g4HUDUTcHEAaYe9a5jzcY12F0Gup0DyG20IGhSKjraGNcAaHn7dYN8xDYYUoWB09nHl5gH9aFFVu/Wfrl8+m45oGt8EBHFC9x2PrW4edyUQn6jhAvKkTk30aLTYA15e00bn6TQmlseYe6zTXL+/M8jj8O6pUWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737973252; c=relaxed/simple;
	bh=Hxw8IyGjQ5J3gtUl3IIP44BkHPVhF2xScdnF9smecmw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l4/CW+IcCXTPTgdjZuym0Onn7idwZ5fhj7wM+kwwXvab6h8PJHZLC1bf1kf7Xbt1Od4Gv+nevSJNkKEgxS7pEENGdwTLV0NneI3Oyd4u3Ky0nBtHE7bqqQ9qPrYqCz8uRdmRmYaksLva36yAYFD1IssBOTQXVvBebisq8FCSY3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jpMv7jNo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50R0nKXv025380
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:20:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iRHY/8aTKLk5Axq/TaQ4eFvrRO/9DYyZjmqiQ/7+6XU=; b=jpMv7jNoRqDLEUbW
	JdFEZR1Q5XmRERgVr8OVhbMxQmEBVForyNHaKjSMz1+t8p4KhnvMdQ0ym5wGDA2i
	YdW4GLAlPh3d5FF0HtJ/IT/rXOH3MF+k4KLf/K0HD6yFuZzazaM/rbztt83f2MFT
	H4Myw5tS1Zcy1jlm3LW2FBpddicV6lkHabeKh6Q/oDF2mq469tuHhNXehUX1riWs
	9kjmeGVcM76NXoSv7QQMaeliBNYSM1zXBj8L+EMyhF+TnWFSvMpiEdjAAYqn2WCa
	AZ5PfAqR0SwvDBQjXRPpWp9tIgDLKoSqk04RwwhsQOYxTk4pE/xUKN/gnU9CDUBd
	LSzJ3g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44dtn2h67n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 10:20:49 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-46e4842dbd0so14130531cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 02:20:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737973248; x=1738578048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iRHY/8aTKLk5Axq/TaQ4eFvrRO/9DYyZjmqiQ/7+6XU=;
        b=Ko4H9rmyK88bvqQqGaduj06pD/jy7M5CB9gqrr9TcgLXrOpgq6+gKAtxEhxkAHCaz8
         uTxmKRjaGuUQgUx7WAoODjJUaShTBxsOOH7Az9O534PSAEb6h6kb5l8SfGgZtTYCccGF
         ljbQJAUzUv/8WmkSWfg9EfG3PlHTR9orEHGgVY/GaOx75CrneOR9JlP7JFrgntJOxcvT
         X+YLowwkI1QpDbHCBT9dE6MRpt1lkuZVYZogrTf8S49ja2lRYEAb/d7nAQr0wCO1FAeX
         6VA5qHJSVVQBHRTizFEDHNFAbTbziuOOzSn2KwONVTScYMxRX7HicxPtMxUp2EO2NpH1
         TZLw==
X-Gm-Message-State: AOJu0YxM3OOGCRxaOz4+7AGkWT3cPgBvdzAvK6AzcaXz9xYL+F/9bca4
	fvuB97pmfSjtngbdaNro5Q0nvgQsya6BGyOOLizPelSzRu2z6c2MdmN/t1kjnuAGXQy2vhoMdJt
	1sVJE5GJf909ToJpfUYGSg/IUDtftr8W/LPDAjYMvulT1TkybsvsUrwxI5aHfzUcM
X-Gm-Gg: ASbGncua80YtMg34X+gNuVWe/qBsyv+zA3V1q5ecmF7c5W+X+LEDIfgHKNl9DtKuB5W
	EYWSVLSxnWFZ9wppfu42WKYkgZ5zj5lp/z2nYe03F+7aVi1/dmVWMeGZS+XINfOJrmkNyvgFFm3
	G//8AEZ+GrVaN8YarTiabP6grWSgjGpXFJc90/mAtQ8QOziRdPDuU+KfuOLYZp/OtiCjOzOVd5+
	OEdlwvEdQrtVcNrZdSyiPFlqIrokGlETCV2RsLZu2hE54BebiNK7zAtP5cOS7r+iEsQqKpn4PmJ
	8cb1EEyLaO/tI9ozwsqPnlFOgUIGYg1q/aKXq3WWVzvYqhqI+UYIXaNSeC0=
X-Received: by 2002:a05:620a:6884:b0:7b6:6b55:887a with SMTP id af79cd13be357-7be631f49cfmr2438124985a.6.1737973248510;
        Mon, 27 Jan 2025 02:20:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHuECCNFGoubW/Ui1yA1XWf9mVhKR81xmqRhv+HGsGJHLDgTBaX/glpXBzB7yhX5w+9mKrFPQ==
X-Received: by 2002:a05:620a:6884:b0:7b6:6b55:887a with SMTP id af79cd13be357-7be631f49cfmr2438104185a.6.1737973248048;
        Mon, 27 Jan 2025 02:20:48 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc186b319asm5333483a12.49.2025.01.27.02.20.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jan 2025 02:20:47 -0800 (PST)
Message-ID: <f11012b5-f387-4144-a4f2-b9d629a4c53e@oss.qualcomm.com>
Date: Mon, 27 Jan 2025 11:20:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: sm8750: Add UFS nodes for SM8750
 QRD and MTP boards
To: Melody Olvera <quic_molvera@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Bart Van Assche <bvanassche@acm.org>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, Nitin Rawat <quic_nitirawa@quicinc.com>,
        Manish Pandey <quic_mapa@quicinc.com>
References: <20250113-sm8750_ufs_master-v1-0-b3774120eb8c@quicinc.com>
 <20250113-sm8750_ufs_master-v1-5-b3774120eb8c@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250113-sm8750_ufs_master-v1-5-b3774120eb8c@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _Q77AFulDV7qlj_H8hqEiSsPm2LeRN30
X-Proofpoint-GUID: _Q77AFulDV7qlj_H8hqEiSsPm2LeRN30
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_04,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=699
 priorityscore=1501 malwarescore=0 spamscore=0 mlxscore=0 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501270083

On 13.01.2025 10:46 PM, Melody Olvera wrote:
> From: Nitin Rawat <quic_nitirawa@quicinc.com>
> 
> Add UFS host controller and PHY nodes for SM8750 QRD and MTP boards.
> 
> Co-developed-by: Manish Pandey <quic_mapa@quicinc.com>
> Signed-off-by: Manish Pandey <quic_mapa@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

