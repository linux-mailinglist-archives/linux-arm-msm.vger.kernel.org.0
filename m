Return-Path: <linux-arm-msm+bounces-64376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F268DB0023C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 14:43:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DCFB48537F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jul 2025 12:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12ACC2192EE;
	Thu, 10 Jul 2025 12:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C2BHkvSI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA412561C2
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752151393; cv=none; b=FOUHu71X/51NLcCy90ACazcecO2Bq404Ra/isQOqcetFLwrcDJoTU0ou56qB0bi61HL1nV/WESsJiqVwmu6ebKGq08MVhqnazIij22OenjBh8xRaDtbr/cq8Eu8nyMc/cQ7mKWo1SUMoYR6s+GwygETH8FEvgVM1YlTb2HyEZjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752151393; c=relaxed/simple;
	bh=qBFhK1afkV4m7aBBOosJ2f1pVgbfITnIKsst8TKTNfU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aqMKtWnS1PkfX2qxv4dFN7/MAlAEfDfiuOTj5CDE0HAbNVKOQHzEPXA2yY9Kxdh93GCh9O/bjgq7N2djhqS2UDuw2jEOPNVm2oD/AzrHny8CMKqiGJLa6WSbqW6ayGnBpfEMdoEm4KerEipers6XOu7XD/OaZv9+z//ZU8ceyF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C2BHkvSI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56A9TWji009959
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:43:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PYTkxuuxHpA2VyCMgJOS//3tQMwdPfUJSgKrXX2iCCg=; b=C2BHkvSIoZJSOXZq
	CXdYM6tfFv8SDXPQqgpBnuN2gA8gAmbQ7qwNkYdtyb2/G+ns9vkVaXghhAcbgSXt
	5rFQwYga9olvEOu5CTiqi5mRxF/YLbFkfZIToEVnqntoZvNdgWEJoLTB08ACEEiq
	jiNuRu+5vais+df93bme35RJOKuqNDkc6bTcpsPubhbdG+FClqaApEfVVpujq7EZ
	sZ/lBLSbVqj+ZufwPlIdVtdjiF0+cWIwvDCyGuqHfouP4goH5ua4J4lwvd9DakMx
	gBVfzNJwJQ4hhDPjwwvoEeuMGJzDpYoNWLfVUw/6XgGI2V61qEsV45cJX8CtaQxk
	so3g5Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47sm9dvyk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 12:43:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a804126ed6so4002141cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Jul 2025 05:43:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752151389; x=1752756189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PYTkxuuxHpA2VyCMgJOS//3tQMwdPfUJSgKrXX2iCCg=;
        b=aRRP3eptau+qeSvEMyxmVgyfzPHGMWHwitRhm+4l37Zsjm5BRgSdIUxLO1siWU/obQ
         569EhjOXDwayDEGmqtmW8RhqkTaAewoLpfrfFPEzd9ibuxd3dbvIe4uSdfVnvm8qCZ76
         YLL1yYUClZ8tnh/z7TbvJ0a0tPzy2jDBJGbFQoXaRL4H+dpzeQI4yFAVq3IHyuQgRDAY
         gk48N46Los9AQetOfyz57Xy1abvhxC2PL9vL0w3aK4VTbRESZqFr5OkBVnKx9nztslU2
         OJfSIhDsY7ktHIQHfZOo/GkxMhjn/Uz8NN+Nt/I9deXbIIQNcpQrpaGDVN/qsy02OFRB
         md4w==
X-Forwarded-Encrypted: i=1; AJvYcCU8nJLTbUzcwDOZpBEaT0zL576Bz+/J/pwQFi865qWd02qYEco5gieo13W1xbYdReWiuooGUqUXj4YI8VH9@vger.kernel.org
X-Gm-Message-State: AOJu0YwiowIuADNZhq50Uw1ApK5OI9AWo0vlTzR0dTBzXUl4lg6aaBYH
	Iv23pe8UF8qH8Qlb41ylG6om0DpV4dDeyQbwymwdWJNrx/I55lS9KbP/+9t7y2/bhwDt93bEiKT
	xMDkxUiwFGTpF5gx/vWP4cqfRIRx+2FIlHTfdHsCrv7EKBZee6wH46LajDRANsirmH7l+
X-Gm-Gg: ASbGncsV0Xw+o1G9Fe0RECG27I27H5IIy9R7YitNxfsf/5ePH4qEbnwlREgPtn7tzFt
	TXLBM+dA+VayvJ5DkFzRyAvF3g7GlHfVPUkRvALL9T7sQtolQ8kN8o2aKXS5e0iG/YEr0osKPCH
	D+7JS7+ilqFYxKemN8P+/VYG0iCpE6ugBRNwOi1eUyaGftioDm9MW9lyBQUbbCCYFkfAfdhKElE
	g4qAHXjNFEIclnHEeMCxSnKrLnU4M5YCCJNYzc119tTT+asXxmc7/2cHWD1BOY8V4Wf64sN2fn9
	5DXbdRQ7OC2rgu4Xv1B5ME5WYXnn5dU0ldEnjYFfkcNPV/Ew0F3ER1O36DfyCLf9JkRyNiWutdi
	0Smc=
X-Received: by 2002:ac8:58c4:0:b0:4a7:7f80:7a8c with SMTP id d75a77b69052e-4a9dec22598mr36676141cf.1.1752151389335;
        Thu, 10 Jul 2025 05:43:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRbTSEuEeV2umL8ashTgvApRLmR4nY0TUzJVh0ThLvKrhyZgdrRc12SQWS6A1FRWNQ/HFWnw==
X-Received: by 2002:ac8:58c4:0:b0:4a7:7f80:7a8c with SMTP id d75a77b69052e-4a9dec22598mr36675821cf.1.1752151388712;
        Thu, 10 Jul 2025 05:43:08 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae6e8294b5fsm124039166b.125.2025.07.10.05.43.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jul 2025 05:43:08 -0700 (PDT)
Message-ID: <684a8db6-ec47-44da-baca-1b16a33002a5@oss.qualcomm.com>
Date: Thu, 10 Jul 2025 14:43:06 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] bus: mhi: host: pci_generic: Add SRIOV support for
 PCIe device
To: Vivek.Pernamitta@quicinc.com, Manivannan Sadhasivam <mani@kernel.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vivek Pernamitta <quic_vpernami@quicinc.com>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
References: <20250710-sriov_vdev_next-20250630-v2-0-4bd862b822e8@quicinc.com>
 <20250710-sriov_vdev_next-20250630-v2-4-4bd862b822e8@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250710-sriov_vdev_next-20250630-v2-4-4bd862b822e8@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: GPaMXTbM2-_iMI8CLXvCwDd7l0VuNju_
X-Authority-Analysis: v=2.4 cv=W7k4VQWk c=1 sm=1 tr=0 ts=686fb55e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=H9ftyYl3DrAdAmmota0A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: GPaMXTbM2-_iMI8CLXvCwDd7l0VuNju_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEwMDEwOCBTYWx0ZWRfX5mtbZaEK+e39
 EhWAziKIpxlUiIzXvSyEqIa2s/mEVSxBwEKDtjfY4Fz9G73odHKG+PwqHnI9tFk2V4HppDe4rgA
 EI7WOBuwnz1t1iYt66eirg1R406Na+DcomFFfX39g2QebbZRRPWsiDpI/O+kfJb5oU62MqgXIzP
 w5UAskW+eHTw3l5DrIrLNYkiOT9CWWoBB2dCouATiR7iqRWgWXsP4ZxQuy5LTW1pH9II3WXTlFB
 UHitSkSmPhKiHStELLyxbZ7xPKcTeXP5v+e/e7D7n504XHYUtzyba8kcyFhdDEeusW/z7kLEYli
 vpWsevHgw23AkN6k8xQvgXbjVYbKyUuzt4cU00MtmPpvrpycLKscoyVk1QFiO7fdvvVS5ncbq2W
 lYI44euPXGcIVQlhn09alGJEOPZIWCxhdn0SJ7l3yhI9tBR14k61dSGTe5Oq49OKYn1dqHVs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-10_02,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507100108

On 7/10/25 10:58 AM, Vivek.Pernamitta@quicinc.com wrote:
> From: Vivek Pernamitta <quic_vpernami@quicinc.com>
> 
> Add SR-IOV support for PCIe devices.
> pci_sriov_configure_simple() will enable or disable SR-IOV for devices
> that don't require any specific PF setup before enabling SR-IOV.
> 
> Signed-off-by: Vivek Pernamitta <quic_vpernami@quicinc.com>
> Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/pci_generic.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 2d1381006293412fbc593316e5c7f0f59ac74da8..a64b5c365c920ef2edfebc994e82d6385ad7ddbd 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -1640,7 +1640,8 @@ static struct pci_driver mhi_pci_driver = {
>  	.remove		= mhi_pci_remove,
>  	.shutdown	= mhi_pci_shutdown,
>  	.err_handler	= &mhi_pci_err_handler,
> -	.driver.pm	= &mhi_pci_pm_ops
> +	.driver.pm	= &mhi_pci_pm_ops,
> +	.sriov_configure = pci_sriov_configure_simple

If you add a comma at the end of the newly-added line,
future diffs will be shorter

Konrad

