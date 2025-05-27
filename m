Return-Path: <linux-arm-msm+bounces-59558-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD568AC4FE0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 15:34:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F3831897FE1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 May 2025 13:34:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB73C242D79;
	Tue, 27 May 2025 13:34:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oftfNIZy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FA329A9
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:34:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748352865; cv=none; b=lb12aOLD2MtcGDwmgft0bZ6uDDB8Q8tfWnxjiiJtxcYIHn27P3wWcE3Pe5OB3RC5dkV6RhOdbc0OshQRZSInFPKOmZtBrU/Pmw/6Qr/YyRjQthlfs0e4O1tgwAPJhorf7/A+ZF1UwgAillxPdx8HPvWsHQvwH3iFNxv0pl5bYh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748352865; c=relaxed/simple;
	bh=d/P02J9qQY8iTl3rVzuh5p3XJF7As7wmADUufJt0/BY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hy+fiuWGmIm/CjQSOJyP+PS/xuQS5uu+yDHMoahX6U2YMNVNeAlL7y6JoAh0CMs32cLGvQQyLbMyZ/bkdsAQ2bQHS4p3u6+Qw/FpagKZqOVRTyWy0ticY1WXjtn9re6q3vmDDZD6uEXShDEk4WoWNj9y7WXlmGi5ogGGRjr3CZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oftfNIZy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RAl3mA015467
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:34:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zj3vrTg/vim0PVZvflmCqYbXIcZKAQ+i8s0YX2bmBXY=; b=oftfNIZy+HwWfIMr
	iPJf78k5r2/5aEbnrGhi8KoGT3BZ3gDranc8kl0eM4fgGu4OuAb6eZCZ8d7w9eeo
	qUNKsWhRZXYG4ftW0WWLkYO+ButPV6dw0JF5txNAbmGShK241YamnRydwsBZSFYE
	K6rLjXNfWJRV96gr2VFZSd3ZVhrQDIRet/l1oo0ijtV4HF04H4utMnOz5NdNbk2A
	ZO2J5CosmL+ay+/PTPH8aFmWtjPWxjwNIl3etmbTriqpOio/KsJjt9L4msLXwQAu
	v3dXMYGAS7hbZ2nOvfLpBMfFcD7LULOwcvs17Yv0mConBHuAKeq5acKhQGQZFIIg
	Lg4xrA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcufsc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 13:34:23 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5560e0893so26404585a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 May 2025 06:34:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748352862; x=1748957662;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zj3vrTg/vim0PVZvflmCqYbXIcZKAQ+i8s0YX2bmBXY=;
        b=CXJ3Md6IxQiWDaS04ucVHzphWjLeC3PLEJKX2nIJk0Cmu1d5DTEAGKHQv/adwsHLfX
         vyo6FT2Ue0Vj+G+OqU32IoTP8eH+fl9Z5S4iWK56052mRMFrGmnxpP5y/sduB5LfewOb
         yYbXYM9EeJX9BOwKyc0W+KIaN7rJRnzpZyXLqz4QyDK4m/fnOHO5APPKJXcB69JzD0wG
         wNck604P2S7bUqkZ8XOGlWkkgMNq2CtySZPIvnzb/eDkzQnolOO0tEwkRXU7M7skoHKb
         OT3TnPNseecAeBW7UEwZlMjyMUSTi5XLXIoDDjH8c7loFVZtLHDk9ua0T6+9qjpyE6GE
         7NSQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAC00yobTMJXbpK6vKWHXXk/WOXga/LW3qEekuiUmBunWxXQSE9OaJwY7BOJ4Zg/tYTVAJlHKZcv34DQ8X@vger.kernel.org
X-Gm-Message-State: AOJu0Ywl08eXwbfU3aX7g5HwK5HW2YJO0occE3JOXXYiXMgu/MZENJ8b
	MyTjmjuoaULo59CZXsMWh1gfZMoxAilc/tgMk/lOfgbjplEnLktYEMCUkljYN5sK91VJ/f5iOF8
	q1UfeB15dAvnUljUWyrppb0VqNf/eQ/mMdZh0eSvJ56ZvWN/JENC5B3BiCs2+8+lBk3MY
X-Gm-Gg: ASbGncvRCAhBPNaXJbG5zK0mlmeBM32BFRzicC4Sf2a6ztGXv4I12Mpndyvlu8PTfyi
	cGNzI32cp8zo1MYIdz1txRO8WepYc0q45GZUTlvospdzyAfoDH6+e1rv5pGiSCSK7HYMg9z5+pF
	GqIkhtvmBi0yX8INBzfYU07W5UtHIiYdjWHoBOPUg7JyOLE5pfM0ZblnMtMIpRbXfI3tlfun+0G
	uJ4iv7vbg4Oox2FxRXSnxAoOoRnMusZjtKTAjPyHtzcearyf9fLvZsgqwpUH8UEpZqxkJ6aDsK+
	Ox/NLqV5lzo+AmoxgP0kM3nDYBHD5PFHdlDWzHB0Du++WP8gzBMmkU8Wm1v/r9XEYg==
X-Received: by 2002:a05:620a:bcc:b0:7ca:d396:11af with SMTP id af79cd13be357-7ceecc33efamr674542185a.15.1748352862477;
        Tue, 27 May 2025 06:34:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjlX2yUH3BsOWQUseqYtk4hJzkMKzeOB9JG5Z8E4YKWevQ8VORYoyV+OSVUqExMtXpm87OVg==
X-Received: by 2002:a05:620a:bcc:b0:7ca:d396:11af with SMTP id af79cd13be357-7ceecc33efamr674540585a.15.1748352862039;
        Tue, 27 May 2025 06:34:22 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad888f734f5sm152162266b.84.2025.05.27.06.34.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 May 2025 06:34:21 -0700 (PDT)
Message-ID: <f2732e5a-7ba9-4ed3-8d33-bd2b996f9a1d@oss.qualcomm.com>
Date: Tue, 27 May 2025 15:34:18 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: ipq5018: Add GE PHY to internal
 mdio bus
To: george.moussalem@outlook.com, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
 <20250525-ipq5018-ge-phy-v1-5-ddab8854e253@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250525-ipq5018-ge-phy-v1-5-ddab8854e253@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: waFNoU3_3A8J4SA8S8whjdNCxf_rFlaa
X-Proofpoint-GUID: waFNoU3_3A8J4SA8S8whjdNCxf_rFlaa
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=6835bf5f cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8
 a=KVjQAK92ZotTnYaee5gA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDExMCBTYWx0ZWRfXzj2F+7fbi/39
 HY7GtJHeuBB7tyZ2ME+Q23JSqiDXKb2gdqiXsKlgF7ZvH5euQXh/3N/jWGXtbyDTWUvJexIAwxC
 +pZRleHqeZs3yP7Zaimf1ivrk6uLFDjPH2Jw2Hg1Lwp8kfNsI+A+FOqepd51BSxL9tehcwCKWwl
 Af2lgQCxm3ewKeIH5A2znTPIA4Qmr78f1udCF8if5Onxv0AAEl1ycL+JgBxx5Ih9t0m+pKTSqpW
 ECdIayeQnGvTCFu2Hdm8JOj6/eM5H1FWt6WwODNrihXsMOIrUPAbvrEW1mt+5Ka4bM2ql+Vjppf
 5A/w7fJBVous/4+Dyx3CyNvzqpTYIRTCf8wBymmznouA9L48Uf6ZULzcRA23xqI7oDT6q2iLB+f
 Fr6uRI0vN49VuIjDbDvWb9GZLlsk9tvOK62lyMh/GN8rzM/+IW430VbGvvmVZG4IpRilEeu6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270110

On 5/25/25 7:56 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> The IPQ5018 SoC contains an internal GE PHY, always at phy address 7.
> As such, let's add the GE PHY node to the SoC dtsi.
> 
> In addition, the GE PHY outputs both the RX and TX clocks to the GCC
> which gate controls them and routes them back to the PHY itself.
> So let's create two DT fixed clocks and register them in the GCC node.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 27 +++++++++++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 03ebc3e305b267c98a034c41ce47a39269afce75..ff2de44f9b85993fb2d426f85676f7d54c5cf637 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -16,6 +16,18 @@ / {
>  	#size-cells = <2>;
>  
>  	clocks {
> +		gephy_rx_clk: gephy-rx-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <125000000>;
> +			#clock-cells = <0>;
> +		};
> +
> +		gephy_tx_clk: gephy-tx-clk {
> +			compatible = "fixed-clock";
> +			clock-frequency = <125000000>;
> +			#clock-cells = <0>;
> +		};
> +
>  		sleep_clk: sleep-clk {
>  			compatible = "fixed-clock";
>  			#clock-cells = <0>;
> @@ -192,6 +204,17 @@ mdio0: mdio@88000 {
>  			clock-names = "gcc_mdio_ahb_clk";
>  
>  			status = "disabled";
> +
> +			ge_phy: ethernet-phy@7 {

drop the label unless it needs to be passed somewhere

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

