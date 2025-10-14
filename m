Return-Path: <linux-arm-msm+bounces-77090-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA4EBD7761
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 07:41:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 597563B5B6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 05:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF194296BBD;
	Tue, 14 Oct 2025 05:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bdXczFNk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4411F26E6F2
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760420486; cv=none; b=Iz4noMDxEAprKrxqVJTOsHz12wbWkxs3CYiAejx2ijiL9/UBaxHodUliKUkXXT5OovTa5cIt8coAC1WrhqR992tOah2nUUTHCmyT3rWQVk2uKekBP7N36prbijJs0VVqiLflosdbKcxdt49WssCSAq0sy7nXS4u2bMCvCoKqeLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760420486; c=relaxed/simple;
	bh=jxiKHKisLUi2TL7R5DJOnPtwjNiaU554Ky65rCbpRYs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nSs6yisXBWCG6SEWSwnXxFNkBgHqoY3w/5ttTolH08S3KBhcV2AZ45WfKv366xykZgNcu0Ch/2op8WQ3PKmJPfL/ZMBa00LC1WXPKPZoGg0cKjcgWf5yIEwMCuWdmd/IN6gYQktiPqyNUqX6hAtn0gd1h952H3N79J7/DDF7QfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bdXczFNk; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDoCM021731
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8tpCshbHou1c6qrp73mVlzYVHbi5GBzcn7cKeJnjAmM=; b=bdXczFNkLSqG4Zod
	thh3348UEYPRXOb1uOaS0yPn4kDIYFYZbT2DwWNpxSc59iXmXDNBdf1XN2mGceVO
	CX5VGgC+HZ0jenNW1zSnHbLqjBFpXqnsFiPSGazbJFey8biSgk4J14FopRY6z416
	D81mEQNHILoKguRYe0VYxy1bKQC8IHtHKoKpBjNqgBNexy+fV015iXFt/t+1lO2K
	XxVrLdTctzKSKDs3qeG0mLeiyIjf7mu9Dc+FaFdVfqzW18gY/e2iN9Ij8nxf8gCV
	X3OaPB9p8Q7F4k68vu7B7psX2/imwOd+UkmK7UNWgLu1zJphZ1sDu/Kd6wBDhk6v
	vWUhXA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0by841-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 05:41:24 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-78106e63bc9so7234969b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 22:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760420484; x=1761025284;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8tpCshbHou1c6qrp73mVlzYVHbi5GBzcn7cKeJnjAmM=;
        b=aPX+01Fn8wB1/aktks2pl6DsL9338WlTky25liyZl3vPocJdODK2WDfx60j0v7CWVD
         SfWO7d8Ktz4YDrbr5Q1ngWSFND9LuU/zxP8WM+tPb3utEA13nLuQ1M9T0pbXO6oAQ9ka
         UfuuzUmpbCPG6dw0I2ZpjQv/guin6DAQGAwd/FUmUUM815EjyBXDHvMVmvMO5t/nc0Wz
         iSzbwxzPzmvMK2Ki4pGXVYMmU3+G/8lSqReS8U/uXVYq4FXNFE5P8BAM1NkxwdbhQajZ
         sT96qrAsdOGOeid9Rmhu2eI+OW4PNYrea06VP0eQGcntMhWW57VSZ7fQOh/GQH2Q0k5+
         QwpA==
X-Gm-Message-State: AOJu0YwvnXcUo9BhdGqlisN2FnD5Uiz81Yh2I+8qz9D+W7hbhRnS+ten
	0HdRXFAGX62LF2g8CgODECiESdKcK/YAeXDU/iMA3MJQrjl5RnJrGuk2nVgWv6H1tj8Z2NMdlLn
	gUz13C/tnuB3GQSOKgzS7wP0uJ2b1QbjAlmpjefNmeAt5tFVPopt2Ks6Cl43xblILV14J
X-Gm-Gg: ASbGnct5KwPzxw5CYpl+6qS8esNrFuislO4zUh9dcaChcqpVsGzCi7b15SVQ1LZ37VN
	LtJNtGFrrRQjJOt4YeYWqQYMQd6T1Zjwh0sFBu4CJFuE1YjuQXRj+FKbVgJF+dUJZ8GKaaMR1lO
	Sd1ZjrlS95SOAd6iNttPAgI76jb2UFm6SoxQwcPjYYOsMPxjCH8XjJGStuAtrq+LRicxsnJ/QMi
	Daod3QO7hjAoVmt32kkUP51/935MvNYdJ0rMDJ2xodiE5LAWL6MgdAULhQFj9riGs42/Qtdu6Qy
	Kjp595PF6ImDof4gnCV9axz/iJrUFATYzQ9POKMs0SStKRng+bGTqd/ETrbMKTzF59O6l/NHlA=
	=
X-Received: by 2002:a05:6a21:9993:b0:2bc:ac1b:60ab with SMTP id adf61e73a8af0-32da84edec6mr31369182637.52.1760420483780;
        Mon, 13 Oct 2025 22:41:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB8ImMeYEgEs5ZbDiNPK3W/dR/P2N3ZitLAmFeESrgZrUX7g84QiBVnjc9HjpbQRugVmQUEg==
X-Received: by 2002:a05:6a21:9993:b0:2bc:ac1b:60ab with SMTP id adf61e73a8af0-32da84edec6mr31369144637.52.1760420483219;
        Mon, 13 Oct 2025 22:41:23 -0700 (PDT)
Received: from [10.218.42.132] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b67acd88c77sm7861157a12.34.2025.10.13.22.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 22:41:22 -0700 (PDT)
Message-ID: <d4c2d00d-005b-4a1a-84d9-4d4221b3b85f@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 11:11:13 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/4] arm64: dts: qcom: Add PCIe 5 wwan regulator for
 HAMOA-IOT-EVK board
To: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, jingoohan1@gmail.com, mani@kernel.org,
        lpieralisi@kernel.org, kwilczynski@kernel.org, bhelgaas@google.com,
        johan+linaro@kernel.org, vkoul@kernel.org, kishon@kernel.org,
        neil.armstrong@linaro.org, abel.vesa@linaro.org, kw@linux.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-phy@lists.infradead.org, qiang.yu@oss.qualcomm.com,
        quic_krichai@quicinc.com, quic_vbadigan@quicinc.com
References: <20250922075509.3288419-1-ziyue.zhang@oss.qualcomm.com>
 <20250922075509.3288419-3-ziyue.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
In-Reply-To: <20250922075509.3288419-3-ziyue.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: VTQRoc-I9u0HhlHb6TxaGjmubX0JdWmr
X-Proofpoint-ORIG-GUID: VTQRoc-I9u0HhlHb6TxaGjmubX0JdWmr
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68ede284 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=KnwKH_b96my_iHhHw_EA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX83L0V2Sf1MOx
 9R20YvzztxS827sRMVxKkVE/80Fmn3ObvFIh3rJDc1GnGmn2moZVDdjh7Cl6laGIYW8GtdhajXd
 uKDgFbTIozbM7b/VXaRnUq+knE+PeU0uzYdpacmz+ozPsrcopyEx4P3OqqWk+9PwpRGt1ZayRGq
 f5divIuth44vWMTTtmrf+arzfdhDoZZxS/ekdeHR6ic9B3afLRp6Oil7wXOrIEVMWZKvPxqeJFw
 jfOz3vPrBPU5JsDtW8DpiIi3+nuunhhh20N4M7xFj+m7BP2T4LIzC0dc1LeK4XlBoYp7uN8uovA
 qcGJS1+Sy6INXivzzjvtOR171cAJwbZQjrkJTVwCwxbgaK1bjw9RZjqWFinFbmkG6Tvz+abeMxg
 KB5WHyeEM0gv9Pw9HtnDiLCvt/2gpg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_09,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022



On 9/22/2025 1:25 PM, Ziyue Zhang wrote:
> Specify the vddpe-3v3-supply regulator for PCIe5 using &vreg_wwan to
> ensure proper power configuration.
> 
> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

- Krishna Chaitanya.
> ---
>   arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index df8d6e5c1f45..f0e4abbcc1ac 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -832,6 +832,10 @@ &mdss_dp3_phy {
>   	status = "okay";
>   };
>   
> +&pcie5 {
> +	vddpe-3v3-supply = <&vreg_wwan>;
> +};
> +
>   &pcie6a {
>   	vddpe-3v3-supply = <&vreg_nvme>;
>   };

