Return-Path: <linux-arm-msm+bounces-37287-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E509C10D1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 22:15:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 417941F223B0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Nov 2024 21:15:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA16A218319;
	Thu,  7 Nov 2024 21:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bedw1BaL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E979C21731D
	for <linux-arm-msm@vger.kernel.org>; Thu,  7 Nov 2024 21:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731014140; cv=none; b=g+uSWdYabtT2rbeoKwCbtu+yrsIu/7hMqxF3anj9CIsr8yUImQ741so78ppkAcJAg1SY3xkAH2xa5j3efUrrsl3/OHNRIxYDev09aaxdf+wSVZP8a2l1E47ZbLix40M3igwMmr1b7ZWZWZXA60VAOvWIehkthScCfGs7OntarRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731014140; c=relaxed/simple;
	bh=XRu5QlW1DxXfBAH4Som7tZVhSGLNAuYFwG4msSvv/QA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YYff4U7DdQARWSIVxOcd6y5nAYor0yfiM7EbHHrNx9RbZLYYusabXsGdJEyWD8z/4sCcF6d3l8XMR8cDkFiJ6DGNU477vWVWO6W4bGS2nGToLMhDbzxmmJXaE+gQJ4yu4y39HPXuaR3Ur8W5seapr/eqrR/c5Vm2InagAiuENp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bedw1BaL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A7HLaLR020678
	for <linux-arm-msm@vger.kernel.org>; Thu, 7 Nov 2024 21:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VKM1zK2ii29FqvPvJzM5Gan04RXe51wyQtnnHJkFK6U=; b=bedw1BaLo/eKt8zo
	IJZAQaStYpiEEPbaXAR67LDF1p/mpgMhwjxpzmH16CEpU+xjRIVe02uQCghpMVbP
	ShhmY78xuk03gNn9h+TYZmcFJV9n3des9Hkw1+ydtm0YXibAyoNGkl0dccEislx9
	s4vtKZdqYHKU3cU3NHrNI4f0cG5GrdIWGV0ZqQlGEeyq5bJccqaaTLvZshQ+qDO/
	Uag5rslad0ueBLgbK6fUnZ0kPbMUYNwvzY7GQRrXVtfdO3yA+R0/eVf3TEPI7WUH
	xPNtnqoVdJ32qN9Cfh40AUdTfecn0C5TewmqtB+qCak+1W5WtcmxovbFu/j1TBB+
	6f047A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ry7014rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 21:15:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6cbd0a3f253so3368486d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Nov 2024 13:15:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731014136; x=1731618936;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VKM1zK2ii29FqvPvJzM5Gan04RXe51wyQtnnHJkFK6U=;
        b=gUDA11TwSywB6GoxicNJQsDNo1HZWFtzzc4B+ZVqSzAXxV+J5FhPZ105a6vwE0zpMd
         FUrxddjwpt8U2GlgZtwvCH1YI3YDgShejKFlZ/b5J6XATGLVigXJbr4D8XAF3UOm8OwH
         ZgCGMqp6rgKYorQVmNj73in91ewQVo/KNrQMUIAbkYOi9rMotydcgOZkoSBWa1jDt3wW
         R80PQ795OkE8DYuziKompJf/GQDsobHOWvsOGBU+771Mh65rldTCUY1eaDxQW3ACRHOn
         7392EnpZS/i1mOfz++NWH3Nx/akE8c6yR6VQ3jXBgnFJPKIySImszaz3NuOULcsstXaA
         D56Q==
X-Forwarded-Encrypted: i=1; AJvYcCWkki1qahVMgSh/OYQEZC3WHD1lAZgSGvbKyaeeQWBzWJk4JfqvQm3Z6sOxfqGbwecq/rFXs7fvuIgxh2wL@vger.kernel.org
X-Gm-Message-State: AOJu0Yzl+USTAO0ZXT4wXNuTidUw20Y/AqHEeHMeUklCBRSFpdOO+lVa
	y/ZJgTmX7ENVY0iL1nOAii3DqvOh599/T1n3qMg856ELD6q+BRjCcUFe9j93JzFfDtUrk2s1XS8
	NrTEL1niVkxzAOkoQfJdOvxi4hXd8gn90p09ygDIBQVyajJMV5lapvO7Wnt4v/CSd
X-Received: by 2002:a05:620a:4050:b0:7af:cb6b:b506 with SMTP id af79cd13be357-7b331e514ecmr30197185a.10.1731014135747;
        Thu, 07 Nov 2024 13:15:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGXWaiqCqToM/gEdPuTJSOYLz+MK8lggTS50jQjGZS4x6LJIGT2Jt5i514hJvZ3bh+d6tN12w==
X-Received: by 2002:a05:620a:4050:b0:7af:cb6b:b506 with SMTP id af79cd13be357-7b331e514ecmr30195585a.10.1731014135319;
        Thu, 07 Nov 2024 13:15:35 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0e2f4a6sm144093766b.199.2024.11.07.13.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 13:15:34 -0800 (PST)
Message-ID: <b22836bb-4fa2-4605-86ca-c3cb83560292@oss.qualcomm.com>
Date: Thu, 7 Nov 2024 22:15:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sa8775p: Use valid node names for GPI
 DMAs
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Viken Dadhaniya <quic_vdadhani@quicinc.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio
 <konrad.dybcio@oss.qualcomm.com>,
        kernel test robot <lkp@intel.com>
References: <20241107-topic-sa8775_dma-v1-1-eb633e07b007@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241107-topic-sa8775_dma-v1-1-eb633e07b007@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: m7zaHjpvVKwl06Magw1fBLZJAw7IeVcJ
X-Proofpoint-ORIG-GUID: m7zaHjpvVKwl06Magw1fBLZJAw7IeVcJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 impostorscore=0 clxscore=1015 suspectscore=0 malwarescore=0 mlxscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411070166

On 7.11.2024 10:14 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> As pointed out by Intel's robot, the node name doesn't adhere to
> dt-bindings.
> 
> Fix errors like this one:
> 
> qcs9100-ride.dtb: qcom,gpi-dma@800000: $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
> 
> Fixes: 34d17ccb5db8 ("arm64: dts: qcom: sa8775p: Add GPI configuration")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202411080206.vFLRjIBZ-lkp@intel.com/
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sa8775p.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> index 9f315a51a7c14cd4116ec5a66a60285361d343f1..ebfa049515c63a0f1a333315dd370e6f78501129 100644
> --- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
> @@ -854,7 +854,7 @@ ipcc: mailbox@408000 {
>  			#mbox-cells = <2>;
>  		};
>  
> -		gpi_dma2: qcom,gpi-dma@800000  {
> +		gpi_dma2: dma-controller@800000  {
>  			compatible = "qcom,sm6350-gpi-dma";

Now that I sent it, this also doesn't look right..

Konrad

