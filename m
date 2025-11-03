Return-Path: <linux-arm-msm+bounces-80109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B7145C2BE85
	for <lists+linux-arm-msm@lfdr.de>; Mon, 03 Nov 2025 14:00:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3B21C348894
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Nov 2025 13:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15C730F801;
	Mon,  3 Nov 2025 12:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhYcuKJH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Qt5v/Im1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA5330F817
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Nov 2025 12:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762174634; cv=none; b=O8ijj43lNaZ4n7SGBKdb3Gohj2p3+bcxIZIVMM86b9qfSspE+Km/zqmlRc1zolgaPyViBpwaUPWV6bnTQuthGYImAheE4C0ABoxxc9sq6nKa4ZRHHbZEJrBvTkF6S9RisI/iLOflMvtC/cSQ+XRVCP6SHzni9J+yBbLhHU/wrXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762174634; c=relaxed/simple;
	bh=YQX34ZLHexaCXjqSS+pLh4TUptUFhA3Eq+HRANlFtPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eULu8M2e4SFPeIvIGvknM4luGSPu5ZVaLUQwWR36s6UssGsDriowjYr5+wNF5KLY211YJ3GpMeiu+DPWmIUPnKzJCI9Nso5SHxl79JSoZwRokf9uSvbI7tzU7VvMBgaZTmbLZi1npP+13L8/KDYNbOuXJLddUhyOgDtxt9/8nVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dhYcuKJH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qt5v/Im1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A3AIkrs2756306
	for <linux-arm-msm@vger.kernel.org>; Mon, 3 Nov 2025 12:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1r6C5p8i8qoVE61NTLCbILw7y67Dcz98OiXVz1S1dJA=; b=dhYcuKJHpMhns8B4
	McFRGNPxI7sz3d2CUgkc7kZq0SOcKnQqwvcZRI+xyFEEqLtqEPtfSgZRnThBX13n
	pJ5EG65oML8G1QI0TwNqKSjei+YjxpdkpcrR7/7eXmStAEl0WXNWOBRPhyXIM5TH
	t+01Wm6WVDDOSabGxBikMfs///MrrTe6UD74Kb3NKzLjpFhfDsGynIuECOjFE8Bh
	gH0GeQnFPnX6LAwK8M66CiqoM3KHJ540ap1mhVsS38AA52UMTNXbYwQTbHuH1w8i
	DV3W6W3HRQxSPWli5Y1JKk5IB6l73nm9jYVaYjPxEyLOUPmVCiMBoJKs2j35JitW
	AVrm2A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a6th9rc7j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 12:57:11 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4eb9cfa1b72so18345991cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Nov 2025 04:57:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762174631; x=1762779431; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1r6C5p8i8qoVE61NTLCbILw7y67Dcz98OiXVz1S1dJA=;
        b=Qt5v/Im1udNH0vr1CYOhnMpAvsEAVcJpQ3NQotmFjPFhZ+67riTshwAInYK/a+uBl5
         CXbpj00khICd1iWjIsLWAlisWAkYNumLdvqIOrRgpkKIwo2A72aEjyxMpeb1eQ6tCX/3
         6+bf1rgElANevYgfOg0QnuCa2US0EmMcG7U6UpkARHvkkeocYYe8sPkzMjPaAxTEJA7i
         ZQm14jNB27j/lIJS+fvwtcVULi4s2ppl++/S2pz7wppkNE+dnJZn3BrimRwwCEmUkzVo
         nCobLugqvY0HK5qNQ4/d/pSHV9cA/J5m2hr0Y8IQndgVc9tUmXwqpXtGH1q8+q15YiQO
         Ebdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762174631; x=1762779431;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1r6C5p8i8qoVE61NTLCbILw7y67Dcz98OiXVz1S1dJA=;
        b=rPjN3J8LM1n2RW9/0419CN3+PyJpRLbqbvoaCwptlr6Ec1AmNb5XaPKv0Usk83VYCl
         bsst2ipPZrVcBp2F5Atzhmz+S1uA7AH+lFhQ5nfU9dALoRCcbdvtn+K/rOcFRr11/qxC
         RUm3JzzYWOpyn8edWPHRAarYlU+Ut0g+InlJSr9RJie6VzbxbZIdEDRLlpugnatgLRDD
         XW2H7vcIIoYXaa1plUKFH2YqDca7HUp5k4UF9i5xTyzT29rQDaTkNSehuufZvslQJ6pW
         18iHX1W8ndkGWQqY59c9SEhLGWroFBIBbvsLH0z0gaw8ibP+958bYoCjiSkPxpnUS0DD
         92ng==
X-Gm-Message-State: AOJu0YzkZlK3jPqndh3x3Tfs6j1AxZ7jBkeSDNh1e0Vo73YVUeU9ntpU
	93SROIuVyUQ09toxfNr7IUhw7maJmPSeb+n3mTIqf98S+2MkyMVaLMHyIyUybLlmVCkc2PEJovC
	ehINb9Ams9MIZONsSExmzBdA+mcK9VVkIcQcMFKkL8BZ2/jSOPeUdsrYKQnpoKWmBD3xq
X-Gm-Gg: ASbGncsvaE6H6fglX8p5zAMjmonRd1Q9X347mZGb5vQGmULy4py5DVHI2QoAfBs9UBr
	H2ddIrVWRKz3H8x3D6XQb+YaExU7123NGSNxvvg1NnoNZzkq3yNjDuoRlsZDTDYgdSppzBtX2Rk
	67D8rcUtfFNx6BpgaiC8QMm9MoGbc9zeIGPYAFRk9a6AqSxrcg678g3V3u+l144GWexyfkhSI0W
	IaOYuUcEMF7MUn6VI3p7boz+J1ftDBk4lDzDgcgMPhugpRGjqMh54zq/AA+x4g01ypwidaCRjUS
	QjBaza1wBZszLLhwAcqmt+Jujos4bT+e0ZLQfLhBJzBp7KNT/ruE2TDjwmE+nFFoeRJm/XIt8oQ
	japtQdYn5tsy/PEhqbEeQO6SUMlfvMZaGjs8jHzmm/t8XuqWo9GHDraM/
X-Received: by 2002:a05:622a:1b91:b0:4ed:1602:7e18 with SMTP id d75a77b69052e-4ed30b5711cmr99750951cf.0.1762174630757;
        Mon, 03 Nov 2025 04:57:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbqiJb2plyWZ9GLiE5AoGZvvzWJdZ04NDNK9kq9hc2B77JViien5jC2pU9huPPFRpKpYpVAw==
X-Received: by 2002:a05:622a:1b91:b0:4ed:1602:7e18 with SMTP id d75a77b69052e-4ed30b5711cmr99750751cf.0.1762174630276;
        Mon, 03 Nov 2025 04:57:10 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-640a503fc82sm5930541a12.4.2025.11.03.04.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Nov 2025 04:57:09 -0800 (PST)
Message-ID: <1d4ac08e-ccfe-4b6a-8f77-e97836171310@oss.qualcomm.com>
Date: Mon, 3 Nov 2025 13:57:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v2 3/5] arm64: dts: qcom: qcs6490-radxa-dragon-q6a:
 Enable all available QUP SEs
To: Xilin Wu <sophon@radxa.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
References: <20250914-radxa-dragon-q6a-v2-0-045f7e92b3bb@radxa.com>
 <20250914-radxa-dragon-q6a-v2-3-045f7e92b3bb@radxa.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250914-radxa-dragon-q6a-v2-3-045f7e92b3bb@radxa.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: zxnuWTTkhwdm6ZEKqyXB8CWRz5AR0hDb
X-Authority-Analysis: v=2.4 cv=ea8wvrEH c=1 sm=1 tr=0 ts=6908a6a7 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ksxQWNrZAAAA:8
 a=Nk6tpkrfQ3TZvQ45-iYA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-ORIG-GUID: zxnuWTTkhwdm6ZEKqyXB8CWRz5AR0hDb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAzMDExNyBTYWx0ZWRfXy79sv9ck3ulJ
 e+TEh8IQcc4MQmuC4o8ABTy6EaK2hgHZ9LY2hUul7stLTGwNvid2BwODPlsY26ZbhIUxXijZR8k
 Px8Otbp18FyIio/UyZKXAgFz1trYehPYraCB7HFq+6nH0Q8lA/xOpW49c4oJt9QErh4zBGsp97I
 mDqcIo84XruWqazF9TOr5zDG4mpW3NHPrMRAYv4BaYRJ9Qi+PDjZB+Pc0iAuIZwM5kKFnqE0bQd
 xjwx3LEMEV7OHU8eqa03Y5H7n+wl7ZZxvbONfXB86hJe7kRSGreNOY02uEN4gY6BnZfYbnq27h/
 25nQRPeNSIPrGNvZkidLus1tWaDwn/iAUqf4+gVetsALqj5h2mtwyNLvmwT/O0jgiPXFIZYWzzE
 D9zTlwMEZenzv9ftYPdON0jVj5UIsg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-03_01,2025-11-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511030117

On 9/14/25 5:57 PM, Xilin Wu wrote:
> Add and enable all available QUP SEs on this board, allowing I2C, SPI and
> UART functions from the 40-Pin GPIO header to work.
> 
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> 
> ---
> 
> This change depends on the following patch series:
> https://lore.kernel.org/all/20250911043256.3523057-1-viken.dadhaniya@oss.qualcomm.com/

You should be good to go resending this change now, the series is in> ---
>  .../boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts     | 66 ++++++++++++++++++++++
>  1 file changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> index 85465702279efb7ab324baea0663bdbdbd5fb5ac..d30cddfc3eff07237c7e3480a5d42b29091d87d6 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-radxa-dragon-q6a.dts
> @@ -432,6 +432,14 @@ &gcc {
>  			   <GCC_WPSS_RSCP_CLK>;
>  };
>  
> +&gpi_dma0 {
> +	status = "okay";
> +};
> +
> +&gpi_dma1 {
> +	status = "okay";
> +};
> +
>  &gpu {
>  	status = "okay";
>  };
> @@ -440,6 +448,40 @@ &gpu_zap_shader {
>  	firmware-name = "qcom/qcs6490/a660_zap.mbn";
>  };
>  
> +/* Pin 13, 15 in GPIO header */
> +&i2c0 {
> +	qcom,enable-gsi-dma;
> +	status = "okay";

Please leave a spare \n before status, otherwise lgtm

Konrad

