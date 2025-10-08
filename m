Return-Path: <linux-arm-msm+bounces-76362-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 865E3BC43DD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 12:05:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DAB14351420
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 10:05:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 872932F49E9;
	Wed,  8 Oct 2025 10:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M6+AV9lp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0C32EBDF0
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 10:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759917896; cv=none; b=JEBAoYM8NE7CwALz/Ih2v79gt8OdBwOKp6adJIYxaN+sz+xCtxOPNgHw8s/4bmDR1YLBoTI6SN47/3ERIxNudnFQUNGwOxMMYalH184NSUGOQCgQGyID8VZ4E8vycByVhn6ztT5j5bYxCNofH/B3LPjBjnqAnE4e0mOEa4OdgDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759917896; c=relaxed/simple;
	bh=4XxJdtsTqZl/7D7l/ZNAwdjtgFJn9LSjtG/b7mIZlYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MqezrKaLVy3bQv+5OFe2l3bkiEP5rv6p4jxHwkHmDHwzt0GCst0sY/dQQ+9zgEUPa23fXAk5uyWZjnfHilQOnyEqhc3FVjhSI2b6FORlrTBpgLkcX34yr4Qi20y6ve+X3bvYguWFAPu2gjurqmrvZyDNBQckbvTwJVYftX51lCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M6+AV9lp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59890Ocx021162
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 10:04:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WY5c/4zmxkse8zO/jjJDr+KBk5pvA7tL5tyLdCm4lew=; b=M6+AV9lpMWbOcqt3
	qjpBnBgUt3+kUBPMRX550vY10O0aukIcpELdeQNvPcMa6hu50DPTf6IVHpBmJcT+
	GjnR3323XooBNylzLniaaikE0uzTgqKXZJYmevNo24pVhmoEJrbyUsli/NkbczSR
	Xzn5kzt1kG4fSfjzDVAnAThFTeglYuxKcW/VL2WLEqPuqpl08r4Hs5wZBjSumx6u
	5QFIFiIKtxFGTUhkBuVyPR8XTJ3l4+cRl2mKBAh0aKzT2Dj0MXGhYea3iTmmk5G/
	HQa+kOgIOc5lzvqmAZTewkS8xuMIOWJMbg3cPgnzBNwDfU7238zfeiyxshzx5/R9
	wD72qw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jut1t099-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 10:04:54 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-85d43cd080eso227742185a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 03:04:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759917893; x=1760522693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WY5c/4zmxkse8zO/jjJDr+KBk5pvA7tL5tyLdCm4lew=;
        b=ZiTLXvQDn3gz1fDe4oOsB4MT/KQnmuPgXHwsr+jx/c8X2DXX0vmqTQv+D/kqo2+7AD
         7LUm6O5R0Zdcia/SH5rI2GLRelJSIqGr4m5XH3/MB7FWsk40gdJnLHcP56ayzsYEh++g
         SxakYD5g180M4x4V/dPOF8F1vu8T9v87Q1QcBCcIduNlNGlysiVGmPUJP1bknklKYd0t
         7+soQzoYz/piG4Hv9nkOEv9YbbuXzc+kktG7mRMlv7OdSIia2ZC2HR2paV2gFX17/AWr
         ng9Z7XNWGhcKpNe415UqbOlhjuGgQKjzIgMxTawZ6Hb7WdVw0iK5WNsE9UQk2ULe4hSd
         GHyw==
X-Forwarded-Encrypted: i=1; AJvYcCW8dYRnMPln3KJJjWtUQhlJkDeMV7k0RDM6vx4eN818LSrXmtuzOeNshQ34XiNRe+Yr4WY1uQZCAQSumfxC@vger.kernel.org
X-Gm-Message-State: AOJu0YywfFMNRVb3pxKCBOdPKtpxDTxokOdw6O0vFz5KHGdq00flQoZU
	mvVc+bx+Q0fqOSH7j7WITchbxkCt3873RxJaQVS8f1AbFoweNNyCxhCiP9Imx0vluZvpRAy7uBv
	Q69clzRTxJTTCBlMdOBABI56XQjWup3/ReDPOi5ZnfJvlU5X928cMsmNN1qqBWk+u/juE
X-Gm-Gg: ASbGncuBisTHR2HX9zkj0NoTCDhZhAFToy4gTvJQ+OukYO14WeZwFeJPWmXkuBq1I1r
	y++xbM4Vsp6iwZZtir6v2zuSe1SF8/Or9MPd3DVG4xMloZ6LUa1AFijtE+fEs0DAyqwf3wcqZyP
	O4cFK0GWnWmPu3l1i/A2akMHVa8RC7mIU38VNMQLrhh61sqwmbgmhGE9BN9ZvBl9vpXQ9ZUItOA
	9wBFwHHX6Y8B9qaxn0fVrqpbLo7WMs3GhM7bDRghQQx7aVxf0SapT30KUgLAO6ISFL2x1qQV39e
	5DpvG6c+DaM9igqhrcWe7huE++29uGkQqfm2qA/s6yvzXSV0OWnTZd6dWDfcXGU9QUehmhbIcN7
	nyS6ypnYonqb20tNJSy0fuL2Siv0=
X-Received: by 2002:a05:620a:2681:b0:855:b82a:eba5 with SMTP id af79cd13be357-8834ff907a4mr267583985a.2.1759917892486;
        Wed, 08 Oct 2025 03:04:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsrYk53kHAbHUIZarAeviZCZN3o96KECTh+dhZAtSwTLjkr+Lu3URbxUm9serLVoPCrHnkiw==
X-Received: by 2002:a05:620a:2681:b0:855:b82a:eba5 with SMTP id af79cd13be357-8834ff907a4mr267579585a.2.1759917891846;
        Wed, 08 Oct 2025 03:04:51 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b486970b0c7sm1688116366b.57.2025.10.08.03.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 03:04:50 -0700 (PDT)
Message-ID: <1afcbf5c-f32a-4115-b2ed-583a10758045@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 12:04:47 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] arm64: dts: qcom: qcs8300: Add CCI definitions
To: Vikram Sharma <quic_vikramsa@quicinc.com>, bryan.odonoghue@linaro.org,
        mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
        hverkuil-cisco@xs4all.nl, cros-qcom-dts-watchers@chromium.org,
        catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, quic_svankada@quicinc.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Ravi Shankar <quic_rshankar@quicinc.com>,
        Vishal Verma <quic_vishverm@quicinc.com>
References: <20250909114241.840842-1-quic_vikramsa@quicinc.com>
 <20250909114241.840842-3-quic_vikramsa@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250909114241.840842-3-quic_vikramsa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: F8tgW6P4UGR-zyqyIvKHGBQYfi5xZjeu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAyNyBTYWx0ZWRfXxwgSCSdBH5em
 B5qvfcBsoZ3WFklFPWb9em2FcKKDCA/DfAtc+pDoxXGBxq2O4xSU7w35I0b9FZ6dsn3pjjOk+Xd
 YhgXoEvn1PkKUtL5J0atyh7oQmivfFmO8+FlK5f2DK3bJcbMBIqJ+lHVjkib7Jx7E+BR2sx7IKL
 lidvSPdSQeWNTHz0QrkcxCn7SaQXbadSQAurD7+MpXgbwoVobVH/ykvQDmLDuA75kuDWOJSkLCm
 Ld4y4cCcUOEYEGNR8hGrN+Q0T/xDUVyf6/WUDoZbwjuXLNwCj6sOxEZTA8+e7QKIjd2EuQcnKs8
 1qsD02Y87SQoRawANKheRrVJrhiAeNTUzjHqJIW7PHoc69tGqQk00Yj0ZEWWzn97dE9uBxIyagl
 5xVrmnDaCZzq9uiZ2ZnFCclOt3kckQ==
X-Authority-Analysis: v=2.4 cv=Vqcuwu2n c=1 sm=1 tr=0 ts=68e63746 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=prks0494CB43s1mVRQUA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: F8tgW6P4UGR-zyqyIvKHGBQYfi5xZjeu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040027

On 9/9/25 1:42 PM, Vikram Sharma wrote:
> From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> 
> Add support for three Camera Control Interface (CCI) controllers
> on the Qualcomm QCS8300 SoC. Configure clocks, power domains,
> pinctrl states and two I2C buses (i2c0, i2c1) with 1 MHz frequency.
> Nodes are added in a disabled state by default.
> 
> Co-developed-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Signed-off-by: Ravi Shankar <quic_rshankar@quicinc.com>
> Co-developed-by: Vishal Verma <quic_vishverm@quicinc.com>
> Signed-off-by: Vishal Verma <quic_vishverm@quicinc.com>
> Co-developed-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Suresh Vankadara <quic_svankada@quicinc.com>
> Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
> Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
> ---
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi | 309 ++++++++++++++++++++++++++
>  1 file changed, 309 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> index a248e269d72d..a69719e291ea 100644
> --- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
> @@ -4681,6 +4681,123 @@ videocc: clock-controller@abf0000 {
>  			#power-domain-cells = <1>;
>  		};
>  
> +		cci0: cci@ac13000 {
> +			compatible = "qcom,qcs8300-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x0ac13000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +
> +			clocks = <&camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				 <&camcc CAM_CC_CPAS_AHB_CLK>,

Does CCI really require all three of these clocks? AXI turned out
not to be necessary on at least some platforms

Konrad

