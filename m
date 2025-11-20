Return-Path: <linux-arm-msm+bounces-82679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E71C73F78
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 13:31:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 1EA414E5F8A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 12:30:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 895EB334370;
	Thu, 20 Nov 2025 12:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHni3EWA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IxX/85dx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1761C333434
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 12:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763641799; cv=none; b=SVv+e0kapretGcT1QvCwklAA6TyeTzeAze1ZZqUEsz9q8dq41DKT94i3bd7KpFti4dZ1Xvn8AXGbMNAR2gVPYeUWqHIUY3sjx7k+Ep5MyQlPV+FrbMQ+o6wTQgGx9TSaWmfzONQU3tJz4ay2072OdHsydf/tAXrqN+a56jQnPWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763641799; c=relaxed/simple;
	bh=DEw9sPG9zerO/HnT4RfToet0VEURPZ0G3fZWrk3FH7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O/VcW0Hay4WIMOWK5gLr0PXj86Vrv1FKiKjrn8T3gzZPGXPalwwW/5JqzPitI0YHY9fCuyUzFY5UvFOXFhY4zm4S5SUHZxnSPatOBdax92Jyc0RP/h7YVk7xbV97SV1vdIsXpXA2JfutvjiTy7yAAOmhLNr9Guds6BnnSjduPBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHni3EWA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IxX/85dx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AK7bZ6R083589
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 12:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wC1bDJS+eG5NXOlErzSzXLW4GINozbdRDqdaK6KkcX8=; b=NHni3EWAGa3sCguw
	ej5JRrfNUo/s1veWtXGDMZ9QGlCkhCy4TL2ApX2VELcKaP7yjHbQxUJ2LIMZjNfW
	2OWcpR/QI2oOlEd238NScvMY7QAySj+vyEBKrfE416kKeUZCzgWFm7qkszqgfmlG
	AFNEC6SRvgPjFd9TiUBZMWh5LNYETu+VC/IKjPmk0wQZunZHtg0KTx1tUzeOjU4z
	0gQOF/lRw2fYhcYm83a8Pln13eZt0gGsGbnWCcblliih8ZmVkshofd6C/JR9zID3
	+TiXXWIam8g7f4PSKCVv5BZ1AImu/iGjZBgs1WEWp7MNkyCzYjHJfM+vQgqnYr65
	ceF9ZQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ahxrn8vxj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 12:29:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ed767bf637so1133681cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Nov 2025 04:29:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763641796; x=1764246596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wC1bDJS+eG5NXOlErzSzXLW4GINozbdRDqdaK6KkcX8=;
        b=IxX/85dx9KRW63vftukEBRFUVz8VswLZy4ceZyGSnv53iDR7/8c8msTZmPNyfqyzUC
         IvB5teNiY8Qm7oV3PYVzeQEW3JF6cPgNilUEKCw+uz1/pkvRgW6eB1gMFVJz2lLPI9/3
         jNFSbCnFbqYqjPHCPvTkLVG1wjm4EaU4R3wSomoKJJYbPnrUaFkgAKLJs2iLhzBhTToP
         Qazvmcai7ML6225S7xEmJ8fZKBzLkLuZhlzqBxqxXj0QCiGAeRZOu/0/O6XMGNb05wL/
         GTqJNtCHrO4j9KP9sBm+eNJe/l4x24rhD62k+d84jM5Xlyw28Cs5K0xXxEDhGtd/XIMY
         YA6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763641796; x=1764246596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wC1bDJS+eG5NXOlErzSzXLW4GINozbdRDqdaK6KkcX8=;
        b=rbza2YFvysNNnKkAmLdnYGIeBuxK1RrfxrkSRTdRIUTqNzOtnnaZWQ8d/6YQ+KhZLE
         ASkpk6IgUhpBmw6qrBuUK4mt2WBM/039ihuHyQLQAag7D9bvqBNoUnAZz1fqDFSobcJx
         ecZxTxphlJ6vwMBMJz6VCOUl0NH7khjJ56WrilzLNArzcxIhyY+jvfy1EKYqPF4od1TF
         JCoS9qYrQ7r/p8QqP3A+z1DZhpiwp1Cbs0WDwP2+2p0A9l/HkMQ5WNNCzlUTIj4Z0VJ2
         M92KoKKNPWLitnXSokkuynxT0bLW0efRRPgHm7LkNJhG+A+kr6XfZiZJqs/yBxTCLgto
         vIQQ==
X-Gm-Message-State: AOJu0YyXZE/fi9kZMm0ZxlkwARPTOlFr00Ypcu1202ZUSPg3ztDvQkqn
	YoxcSCWf8uOUCelvBCgEY8r1TWtu10PgM0XJKTVcXLS0B3DKP1yhmJyGxLu2HHXleCwj6EW+w0K
	qBFWQXWVj5uhWKI5VVEtDr8U+JMGybi8qEyICwt1Sg8AK65ojxtciTCYEEq6P0d1fFgPp
X-Gm-Gg: ASbGncsuJwGYN5JJHKys2og7+rc3BuejTXe4pCccmkpExVwM81kmJrhEENHVbYb6/ys
	7rk9zKDfjcWHPrnzQGoQXNInjhBNymtjrBFRvPC16z5mFwqebayvZLe4pq7MSSiTSTwOlRdOcV7
	UbqaYMoz3fRXL39vjCnkaUrdCVrDu2PTtTxCOVq5pE3W8+IzPyhYwDO03esznjNl0v5wRZKcwkq
	1dlXzqUBEsVpOwGAzVeHGBf7Sv4xOEeBnbe3tcGqQEP1G9TWsqp5hQ6k+nx/bAsHeDehC7KwHsS
	+zjOHsJo5il9jk4MNj5m7El+DXpTw8T2+zM0sY7JnGE1ZfHH51Agp9ATtg05qfHAMHrX+qmH7Z9
	AfJHqnGeGscdIobtLvLi9I7N2utTEiCGS3D820154WUG6aYPr48msN0yfkW4adMoMsVY=
X-Received: by 2002:a05:622a:1a87:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-4ee49487384mr26797291cf.3.1763641796391;
        Thu, 20 Nov 2025 04:29:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFxipkU1ri4RqgxFSgzO8ij1EopO0UAjO1tOErlqUk3ErCGROqGvIEGb3LumPtothhuFaXd2Q==
X-Received: by 2002:a05:622a:1a87:b0:4ee:1db1:a61d with SMTP id d75a77b69052e-4ee49487384mr26797091cf.3.1763641795998;
        Thu, 20 Nov 2025 04:29:55 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654fd43e2sm194018066b.39.2025.11.20.04.29.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Nov 2025 04:29:55 -0800 (PST)
Message-ID: <95a0454a-379f-432e-a9bc-a691f1689a62@oss.qualcomm.com>
Date: Thu, 20 Nov 2025 13:29:53 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: qcom: dts: sm8750: add coresight nodes
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251120-add-coresight-nodes-for-pakala-v2-1-3f09ec715dea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251120-add-coresight-nodes-for-pakala-v2-1-3f09ec715dea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: U5R740-nBRCyVGxk1bt2gVZPSrX-yBK5
X-Proofpoint-GUID: U5R740-nBRCyVGxk1bt2gVZPSrX-yBK5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIwMDA3OSBTYWx0ZWRfX2qtFTkgnmRXM
 bv0SuuHa7ESStHyqr1RA05yfyGvjZQWXWupt8RflsiUvnM+j86xx2lzybZpAPbXcTgTJqO18qE7
 pMDp6tBqrXNRQkOsx9kTRT7vp9bCv9LtgO0QNdItHvpc0yKZFLaVhJCi/nBFaqRj2lrewIAzL/G
 7VA0AWXvaX1rP8EAx3F5Es5N+h10bB7GfDyEpFIU+IRdlDzUr6Yd4yQt0XoLk7uT1ZTVfNwxba2
 oJxXLCbaXQotRdu4d9Wt2dOibvDFv+9iSP+8pNzGB5251Era21a2LLKpV40eoyyAAl/azKS0E90
 MRUhvlh8g/my8nHOSxITfMUWSpF/j2Oz6pdXqfL+uQnrXdmYWd/IrKxk1rC3GkrqczdF1yZy5c4
 0V14hTIxfD56VBi9eKcV8ugDW86aeQ==
X-Authority-Analysis: v=2.4 cv=S6TUAYsP c=1 sm=1 tr=0 ts=691f09c5 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=ajAg9ugS1Nz8UD1WXfUA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-20_04,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511200079

On 11/20/25 3:12 AM, Jie Gan wrote:
> Add CoreSight DT nodes for AOSS, QDSS, CDSP, and Modem blocks to enable
> the STM and TPDM sources to route trace data to the ETF for debugging.
> 
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

[...]

> +				port@0 {
> +					reg = <0>;
> +
> +					tpda_turing_in0: endpoint {
> +						remote-endpoint = <&tpdm_turing_out>;
> +					};

Please rename *all* instances of turing

Konrad

