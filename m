Return-Path: <linux-arm-msm+bounces-83040-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 201FBC7FEC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 11:34:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8451A4E3F44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 10:34:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C69CE2F5499;
	Mon, 24 Nov 2025 10:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SVDafCkl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eVKFuumg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44865271464
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763980466; cv=none; b=fNdpE7hNV/XPdHHUdLF9NktaiQLrPn6jk81aiDw1r1spk/2mP/Axx3REQyvNdbkdzqUv3O2LlFQ9T5UgN/yNYbWnxf3dvHO8nt/Q6m24487Yf03rJhljEiCme+v74k0WKgLsD1EAd+YmCsQL1AtLegERGKfYEM0j8WZKjyDwd8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763980466; c=relaxed/simple;
	bh=JpI7aHUIWXQTtIVxpsIt2mJa9kIeykZwlYm1D6ESyc4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EpM2yygzU/uUfyKX3SzMwa0lswYmTCIthKbqlmLz1fhEt5z79YyF/aI9u2kPF/LCLaBog2Lr+IFer8hxGkF6vF0UmfI3yKHl4LzthV717/uxFk8ANempKSwjYqgWCRmi5a80QVeYjCtH/KWaEUkW0hMMncESn/N1d7N6RVa3kNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SVDafCkl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eVKFuumg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AO8BJLs2284715
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QIH1XPwnKDylqY9n8X9ouxIff1wIEZS+4yc8x1n26mc=; b=SVDafCklLHbGIJQl
	0IHJTWVlwr4Oavf1NjYnKytOBR8ZTSDnZwOKF62ZN75+Dap+f/Q/VYRr5MtoEeoz
	38fTe6Yi0MAvQEl+DrIzVNtWs3whsmRbWlsrimUGiHEe/mbLEKvAnALKy1D4YTxD
	Ya6ML5NT7JsLxTpH0C/mhYC5ACv6VEJbnW2D50WxfL3COMmicHE7awEsAQVFC1V4
	s6VvwGF690d+p4TAA4uTO13hrGMKsWFCUbWArTwoTz0FjY+DdqGq+AEeCQk98DEr
	7eaVRN1I190HW7Efur2y1ihvVb5SSIngrO1oeTr2U9mGvwHMTFXv/7z1yTsnaUzm
	fDATFw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak694vn4d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 10:34:23 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4ee00f2b7d7so15236521cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Nov 2025 02:34:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763980462; x=1764585262; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QIH1XPwnKDylqY9n8X9ouxIff1wIEZS+4yc8x1n26mc=;
        b=eVKFuumgD18VGrMXvXcZU4ygiYY58lRxUcFOd1CpldW72zDdRVqJwVfI0BqsADqqbq
         Y3VnulBA/4Ky7cf+nZNKzbB1WCwTN+KZUk2kOKcfv0t+Q3lRk3+QM2Vgin1AQMKr9P0N
         pvqoldZWOxudpCYsgAlg0S95aLNUhgGNSlGU9oZFoY57/3rCvYIBwC7AiVpiQSkqSTN4
         5UK3UszErgT4zYFtY0yOfLSI7/MID+PMoaRFPEQt7ZouzEwv19rORF+GfgRzg7uHHiRT
         yXq1D6TQ+MdHhAIc7NNkADUomdTYAveSTbhYUQuk+3yVoEzhPWxSzP6RQOoAZdQBfPJH
         DXwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763980462; x=1764585262;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIH1XPwnKDylqY9n8X9ouxIff1wIEZS+4yc8x1n26mc=;
        b=S8lwEzDZfZSTgPySoGJnPei0IistzlzUaHupeRkV7QvcdcLQTXxfS8wZ9YYHRxbHMC
         M2TiNNZYY+vxAcNduLq3QKEkfkw+XZbQBCzfRKfDv+2WveQNk0YVEgAP1xA9qlisCyMj
         Lj58iS1wZpZY9x2cuVEPd0td3DB7Za8paQQhCiDHjEzyIJM0j7YMzdWG6roXkgI0/TF7
         S3JwK/QPYA5YXedRdmga9ihaJtu4ycIkkyyzr6NLSG/LLNxxKDzikT4D07rcy6V6fnvT
         OLiFig6S36+gEe1bW6/mBFW2H5ObVUGys8a/lQYF2iNUQqfT+h3ZHiISTJk4tOWqnFXr
         Se/Q==
X-Gm-Message-State: AOJu0YzcGlGNCk1OOQ9uVdCDonStWWnS0YmKEtVhElk/rAGkHFtFiPmH
	X37e5VQivUE7GCcnrLuh06pluyCubboBDPi2wCoWGJfgokiAq4PAjxXK/bFqn4cVwCXrxyfmM7f
	tcgvU5ZPktLDhEZGpL5f88DNFlPyQtuBF4JBUIZLGiTbT6u8MbxAoDEuJjBcB0HbsDwYT
X-Gm-Gg: ASbGncuDoBFaVYLWllu8A60gn5b2+5UI6RmCY9iMgXRws+qsRRmuCt0sKeSREQNIR9Z
	qNt5nIZXIm25y8bbXOdioBZuFE7Imq8bPUQyehL4dHRGqOKTvuoWkOf2EC3p9y6nAu5L/Z/INQQ
	T5tzTVqHdmLCvS2bZy8adOCJnlUwxrHQjWV9u/b5NUwE6Yh+al4ywyVN84I8TVDSt4hMkd46XHi
	uwqrA65GgM7V24l2Hby1pGcGvlawPCO9Ik6Xm83euZdcMy9q59xiG2pGjYfZZIQHbKDSFUYahIH
	6qliytTgyh/nUuW1NFqcX+Wi8f77dcZYBwJ/4UwuQGTQJvQZYknCYPi9VUCR9k6GNPqvy8xMB30
	cmiz3DsD/SZtblfyiBykCePJ/9h6Oyg51vvJVVy5wNo+JDjntK1DqLNtURsk3rLC5O7g=
X-Received: by 2002:a05:622a:1a23:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4ee58942597mr109572481cf.11.1763980462637;
        Mon, 24 Nov 2025 02:34:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXPrdffY1SpUaZjhwt+7of2MS6E1CxsxoyI7yl4kOk8de3aoY6/1Kpd6aApS1uGW5T/ZXioQ==
X-Received: by 2002:a05:622a:1a23:b0:4ec:f9c2:c200 with SMTP id d75a77b69052e-4ee58942597mr109572231cf.11.1763980462280;
        Mon, 24 Nov 2025 02:34:22 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76a6bcfad2sm271702466b.68.2025.11.24.02.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 02:34:21 -0800 (PST)
Message-ID: <97396d4b-69ea-49f5-a8a2-c5c685e93722@oss.qualcomm.com>
Date: Mon, 24 Nov 2025 11:34:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] arm64: dts: qcom: lemans-ride-common: add additional
 SerDes PHY regulators
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Mohd Ayaan Anwar <quic_mohdayaa@quicinc.com>,
        Yijie Yang <quic_yijiyang@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251124-sgmiieth_serdes_regulator-v1-0-73ae8f9cbe2a@oss.qualcomm.com>
 <20251124-sgmiieth_serdes_regulator-v1-3-73ae8f9cbe2a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251124-sgmiieth_serdes_regulator-v1-3-73ae8f9cbe2a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDA5MyBTYWx0ZWRfXxKapZn9sMMeL
 kfymCE+8rahL4XgxuAwDy7CNdezz/x1LvJKqcVeMDZwxkCtnFVm3naoWokv175NFJ9HuOH9zjdb
 AxcX4sbzEmA6vEDCkTYd+ZlwABchYco+77xAtUMSN4bsP04tpPf62AThJbtmCPg5/26fYXK1jqY
 M2P0k8wiGYK93jn4Umh+G+yRN29puOTTdY1nwGm8660uvpS0EsEFaP0kk4JtJhwOHR4ssCcJIag
 vlIsSZLB8j6du5OB44zTFDTLsFKc97yeW86hRpnOZ3K402ZNfARhEmYaF3ZtybNCpMj0lgokkPo
 gnVs1pn41c3cMC51MYnQWiqW2R5iQDWAUsD0cbgWmpW+blZZIXXz0c0DNolHqCpTxt0IGG15V3S
 7jnfTk24Q49UJlxFn5uz1TLHzDajuw==
X-Authority-Analysis: v=2.4 cv=YJqSCBGx c=1 sm=1 tr=0 ts=692434af cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=mAYSrJZFqx11qOWNMfMA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: V8x5SDjAa1KB5Han72KCKzrereEJj-ga
X-Proofpoint-ORIG-GUID: V8x5SDjAa1KB5Han72KCKzrereEJj-ga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240093

On 11/24/25 10:25 AM, Mohd Ayaan Anwar wrote:
> Add the additional 0.9V regulators for both of the Qualcomm SerDes PHYs.
> 
> Fixes: 5ef26fb8b3ed ("arm64: dts: qcom: sa8775p-ride: enable the SerDes PHY")
> Signed-off-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

