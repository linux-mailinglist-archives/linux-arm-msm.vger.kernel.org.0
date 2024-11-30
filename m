Return-Path: <linux-arm-msm+bounces-39731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 191DA9DF1A7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 16:24:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F5B4B20AF7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Nov 2024 15:23:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BA5B19F117;
	Sat, 30 Nov 2024 15:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="May7g7uJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1DE119F118
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 15:23:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732980235; cv=none; b=HYV1n/XNHxhqowdoSyEaW3+gRohysvddxCoU3SMDxm0j1pFH+O9BLIUO6Dk8IixiANCFFD5QyIBNy581K3N+BipgYmGCg5MdCx8ydR9sI3KwgWP2A6VRKy4O86ak6IS9jvMY+qkR8hDEfE0Ceg5ObIXvPkPkp6Q2jdtbg89vDeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732980235; c=relaxed/simple;
	bh=1JwAP/DY0HuGX8Ns1/kV/YEVAJX6VPdtZ9g52TJPUg0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P1yp+a+j+5208cPOAH+msfZmLTC9UT9Vxg1VYGABQlk5FTDpG87tnG0WKaNzjDkJGOoe3jg1TJvRDf0fohmKCiVLxp0rPb4JVa/PisV9ZWjoK08ycLCizh80RY99nk5JIfG2+VMBTVYTDVEZVtoZcQneY2TMVlalEDh4YuCmRos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=May7g7uJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AUBmmOc025373
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 15:23:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	037rDtr++WF9xhkbVafxJsPvXwUinKUzUyY36hB/xW8=; b=May7g7uJUtlaFy2l
	Ka3dgiCYMnXv3RQtyX9D14TIUyybJnTQdHayHlDpLcFECnAc1eNCTssz5myKnoO1
	/9Ge1o12CALsPqo4O5Oodvf86zRsDKjlAZq7xAm9M2gzA/7/GXZRK2Hr4rM5JUMt
	GxKjjR5aH4yqbNMdHPowZBRs+APdgKZ1w2qcm6DGvdLWEGqwS704Xwubffi4lwWJ
	yWCuv3S26O8olc9zR/wA2QFo9OeMB7X36/pL/+XnLaNA9Q2105m+aykck6u6qpID
	AvgC2/QFNjRHC4w/KLKn2WtPQAEKuzqSlChYpnTipPFbLViesby0s+ggLvgK7tKH
	VIEsKQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437ufe0ur8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 15:23:52 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6d8824c96cdso6492186d6.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Nov 2024 07:23:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732980231; x=1733585031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=037rDtr++WF9xhkbVafxJsPvXwUinKUzUyY36hB/xW8=;
        b=mH8XttniLHpxm9buv3U2lEzrmNkMgzDPo/3nfLY3plkeQJ0enCiHXKiW4pwCJ2Evjv
         FwZJP/JHtKqPb/YCv/zdHEp0qNq/VsbtCDom+XNSovrNYduRu1SXHl33AcnhMfl74HN/
         P7PSVVEpn9et5SVuhijbU0ttuZx0KruwblM38ghAG5lAvPpE7DP4omM25b5FQKykKXp8
         L7fNVGl7loCmTgoO3XSCh1vsLAsuh5d/2gzSwzk99MBN2QtrfEcqwjIa7VvBdzvjZHk0
         +z7PnRytdUco/aMbFLKrw1lhaL8zb2IlstfrjzQ8jNRrWvULwo1k5vpUjkq/maC9jiNm
         LiJw==
X-Forwarded-Encrypted: i=1; AJvYcCUBV0ZnlTXlJZ1AI6CGdTJGf1kiP0fxCy3KiVEBp29tcgm3dEE92LpiZKfusnuh7nUmsp+CIUYK0sUuHL8f@vger.kernel.org
X-Gm-Message-State: AOJu0Yy385UEhAz25zpbecmP+WctKXyqQxo/cq/3eEwOF1jsURgcA7/k
	P7H+9DrA0nxuCuQgyOAMJyqF0LusOJ8h74rr1EXw/Ebq29RIGCO4TAP2TaDYZR/3TP7cRuR6BoP
	lKUwyNHY1Tl9DKsJxDJbECmnkh693Dc4dZZjPUTktmg9lw82qODvRjzqN1/KtIbhO
X-Gm-Gg: ASbGncvat3Gc/m1JlhOYbBScau8vbR3S+RnB1PfVW+bwG0VyZNRc1eC2eVAo78ZIlt5
	AT2Z1jAPiI6xl2vZRksa8IWtDn3VFM96seNzsb9TmboOoqMM/zUcxxPpVMECY1KEZ8g4OD5ga+q
	2W8xrOV0MOs5+Oz0dOXAqzJUIi9kKt63BpjZszroji6I2ethjb760v9EUy3zwHeWWASkzBtdTvO
	clsjRH1hQ8q7jMBsFg9DhOLW7XaWUt+0ItiwfAnj8h/FxOhycBmN6w8bWhEREOLtesF5rbBNbur
	TUSg+9rDhcCrwwGRsW+QqdMPdmT1Z8Y=
X-Received: by 2002:a05:620a:1915:b0:7b3:577b:6da8 with SMTP id af79cd13be357-7b67c2d1483mr899579785a.4.1732980231455;
        Sat, 30 Nov 2024 07:23:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOtBc+pt0MjB68ivLwzYOUuJ8boKc8KNsv4m3RWKwf3pIlcjxxa8ff8a+52/R/8drqQ6A3Pw==
X-Received: by 2002:a05:620a:1915:b0:7b3:577b:6da8 with SMTP id af79cd13be357-7b67c2d1483mr899579285a.4.1732980231126;
        Sat, 30 Nov 2024 07:23:51 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5997d40f4sm293422066b.65.2024.11.30.07.23.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Nov 2024 07:23:50 -0800 (PST)
Message-ID: <2304eb69-c3f9-4946-85b6-183fedaf2f7c@oss.qualcomm.com>
Date: Sat, 30 Nov 2024 16:23:48 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: x1e78100-t14s: Enable support for
 both Type-A USB ports
To: Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Johan Hovold <johan@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20241105-x1e80100-qcp-t14-enable-usb-type-a-ports-v1-0-b4386def91d8@linaro.org>
 <20241105-x1e80100-qcp-t14-enable-usb-type-a-ports-v1-1-b4386def91d8@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241105-x1e80100-qcp-t14-enable-usb-type-a-ports-v1-1-b4386def91d8@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: vsEX6yxXGEhz9qIbHkLD34Lkxtx6cJF6
X-Proofpoint-GUID: vsEX6yxXGEhz9qIbHkLD34Lkxtx6cJF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=623 clxscore=1015 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411300128

On 5.11.2024 12:37 PM, Abel Vesa wrote:
> The Thinkpad T14s has 2 USB-A ports, both connected to the USB
> multiport controller, each one via a separate NXP PTN3222 eUSB2-to-USB2
> redriver to the eUSB2 PHY for High-Speed support, with a dedicated QMP
> PHY for SuperSpeed support.
> 
> Describe each redriver and then enable each pair of PHYs and the
> USB controller itself, in order to enable support for the 2 USB-A ports.
> 
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---

> +
> +&usb_mp {
> +	status = "okay";
> +};
> +
> +&usb_mp_hsphy0 {
> +	vdd-supply = <&vreg_l2e_0p8>;
> +	vdda12-supply = <&vreg_l3e_1p2>;

> +
> +	phys = <&eusb6_repeater>;
> +
> +	status = "okay";
> +};
> +
> +&usb_mp_qmpphy0 {
> +	vdda-phy-supply = <&vreg_l3e_1p2>;
> +	vdda-pll-supply = <&vreg_l3c_0p8>;
> +
> +	status = "okay";
> +};

Please sort these alphabetically

with that:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

