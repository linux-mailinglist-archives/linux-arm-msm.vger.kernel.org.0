Return-Path: <linux-arm-msm+bounces-66316-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E5F2B0F41A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 15:34:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 883B3188026E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:34:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3F92E7F22;
	Wed, 23 Jul 2025 13:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QQUR6D7s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4D232E888B
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753277645; cv=none; b=o1pCxHaF6l6ZgSuWBWPU2A0v+H/xOlBhM3/Y/3nM72QOS8OhlhOqD405c1Ygf/2fsOrP7kqxfITQm7Fk/6fqJHA5Cm8IC3KN5N4Y/agVjpkTnYB157OJ6ppDBtCvQkJ/IeiUvdpDdRuimMhC36MaN+XFddj5bqu+WxfLvF3aaKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753277645; c=relaxed/simple;
	bh=I/HwupANQZNrDN72YfoYISTR/jnhtFvcCce7OTyzEPw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nSwsXrs7rJlxRmjT4H60pbVhJoifHVnI2xrENem/s9Z1s1Q9UZKrzaNOZrXqemQOCEtleRoDkqlNNMYuBg66cb+QWfYoKN2tzCrna5wMIsGEEf0Dg/8vev3Jy1JgRSh6qwSkTdM5kRsIJEErIYnvonYrn91LuVBUdn6xN/CWk3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QQUR6D7s; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9WRiw020620
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cErycuEc1BPG/yLEfc2IRSm6016iTOA8t+hzUspH65U=; b=QQUR6D7sbLdLbO7d
	yk0ql2PNHiYYPDXcKRtlvJXdUeyMAX3dfjIr6QyFopjtEXCHWPxIDnXR5/PG3mPi
	5Se8D9MZ4f6/CRj8oe2kwsJCm2aqBIzXcdwcc2Xxyyc78f+1DHRFfmKJvE+uBHAG
	4gSa6iBRSdidOG3jn8QLG6w6DtK9dRGg7Ey92LLo1V5kwUnOgdSXDVRzGU3UL/cJ
	PpaVEhWllGgwv7d5V0tJLBkuv6UIDh2k3QBC0bM+1i5ZK2LYp35khqrADTVs24w4
	ules2YRfLEqpH4phg8zWziSpbgKWdnXSCnqmlD9x2HWepMHdeAkbMiFDOQX7T/Me
	kJNbjQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481g3er3ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:34:02 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4abc1e8bd11so16003311cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 06:34:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753277641; x=1753882441;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cErycuEc1BPG/yLEfc2IRSm6016iTOA8t+hzUspH65U=;
        b=pz8CafXGOF/gpBAamIyIB6q3Uvttz29sUczIYa2dngdnf+JCjWVeRqWJcKnhUp6LdS
         MkDc4Fq/qDJZlOjiqr904xNvUK/SXblcHkg+LNL/HGPKd1UJq8wUJKZBK888X3eFzaZC
         kfulclSlf2Cs8Fu8QvS1vftTLFIorLu5PkmEnDMJlQvfSY6572RbLMhJ+vobUFyDNAHe
         fOyFvGvw8RdjhByMOTRgk00KOE8DRk5S8vz8YyhZaYQg2mBsOTHmzs5FCW457DiFFUxu
         cjPSlaOrXhJ5vWeoiFC67oP+HjNeWzQ+mKengRBidq/XGvrVbSyEDOgmbRBF6DsQLf8c
         ewVg==
X-Forwarded-Encrypted: i=1; AJvYcCW4+j/KgoqPLYlMUPkVaN2OeipxG0yThreEwqFKE19zjowJpymnyr/OpFYKLASzMlFlsKL8A1QGLtRuFQOM@vger.kernel.org
X-Gm-Message-State: AOJu0YywiFydXsgglxx1G6eQM1CFLZn32lgD9Ty1Ur54mZrw3NZouuv2
	OEFsv073t4YfgKOyAcKRK03ewRUi6qHlOLKBDmICi/pNamQFwCa0dfwEsMpTYkc/cPi4AzE6ods
	SDk2GJFnzXvlpZsDvSuDtNus5cfxsxnFhwV7IplnELhXQRDNFuPfTcXgxDGTL7k9FFYo0
X-Gm-Gg: ASbGncvmyEOAp7UwUpTxP53/hCc4/18pkBXiAuPRjqG9r5CVLioQ7Dmd6CuRyOyq3S8
	tvjcOQPJ0HHCoxG+h9AoxGA7+sInK4QpuxK+CnydfFVqf2XMHoxSb7lJ7cPxh5xMSyduQAy2Ge+
	UG06Oo5UqcfdaoU7CinP+KN+TYYouXvH888oezYTZAGAHyidKpDfMFPQ7XXPbc9A1Zo4UpyrD65
	3kZQMFNUKMmXywqNtPjx4FTlpk8iohdVjloGFy93PQzstmk2LmmyfX1zYmtrFx9QH/9v1Hqla+7
	YWXg75rhP03LHfKfamJdIFFQ40BQhsEgzItml+zn8C62rpHDCp6SaVR1wd5gXxRFhU55d9Xijsz
	QsJYZnmOmTdNQp5ba3g==
X-Received: by 2002:a05:620a:48e:b0:7e3:3c61:564a with SMTP id af79cd13be357-7e62a1da96amr124749285a.13.1753277641271;
        Wed, 23 Jul 2025 06:34:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzYMNLS1GUA8u7+fQK+6rKxw7iDDU93TXDtPnP5+2dDFuZKetwr7kiUpYLhhOQk9KpRqg1Eg==
X-Received: by 2002:a05:620a:48e:b0:7e3:3c61:564a with SMTP id af79cd13be357-7e62a1da96amr124746785a.13.1753277640829;
        Wed, 23 Jul 2025 06:34:00 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af244a659a4sm236451266b.22.2025.07.23.06.33.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 06:34:00 -0700 (PDT)
Message-ID: <277971b8-09d5-444d-b0eb-1e658b68029f@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 15:33:57 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: ipq5424: Enable cpufreq
To: Varadarajan Narayanan <quic_varada@quicinc.com>, andersson@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
        rafael@kernel.org, viresh.kumar@linaro.org, ilia.lin@kernel.org,
        djakov@kernel.org, quic_srichara@quicinc.com, quic_mdalam@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20250723110815.2865403-1-quic_varada@quicinc.com>
 <20250723110815.2865403-5-quic_varada@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250723110815.2865403-5-quic_varada@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 1ltOqjCugepnNcBc3R6tpAKklNzrTjyg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExNiBTYWx0ZWRfX4naJI98l5veG
 AwhJTeNL0A5my4ndjx9c7IJKwVjngX2lCf5iAFQKfmQCBGH0khlD/9OTPANax7FU9zs+nOCPOOi
 4ogKG9xXr0HV9We6J+drl/SZe59vMvFtDvBTElz47YYPrnccrux+azt5hPiRdEDvAv0GCTIvk3f
 RvqZa3/Z471usXj5a5YFKF16N7L/JnHUMxO1uq8dDCjkVHkoamZDz7DZSMS0OPUV67fXhs9npE4
 bltVJKF+3C05+pQ5K14dUIrVs9p49QyKNA0IuljQVNg95HtXzAosJWY1+vLYDZlY3vWXp90bMA+
 0z8UvIRVcszoQKEbptlKdnteO36b0SUnfc92wXoELuHcQRn6LLlrNVfdsZ8QnbBZBAxDSZDjpVJ
 NmsRP/3wQI4p11mU3Ut7j+1zYGbwt6lXLjlE/SPjhsLbVdNGkVt02CtiQTuu/Fjy4Jjp1bbk
X-Authority-Analysis: v=2.4 cv=Q+fS452a c=1 sm=1 tr=0 ts=6880e4ca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=R0CBZZInQid6lz33ABQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 1ltOqjCugepnNcBc3R6tpAKklNzrTjyg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230116

On 7/23/25 1:08 PM, Varadarajan Narayanan wrote:
> From: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> 
> Add the qfprom, cpu clocks, A53 PLL and cpu-opp-table required for
> CPU clock scaling.
> 
> Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
> [ Added interconnect related entries, fix dt-bindings errors ]
> Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
> ---
> v2: Add 'interconnects' to cpu nodes
>     Add 'opp-peak-kBps' to opp table
>     Add '#interconnect-cells' to apss_clk
>     Remove unnecessary comment
>     Fix dt-binding-errors in qfprom node
> ---
>  arch/arm64/boot/dts/qcom/ipq5424.dtsi | 65 +++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> index 2eea8a078595..39d394f49789 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
> @@ -7,6 +7,7 @@
>   */
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,apss-ipq.h>
>  #include <dt-bindings/clock/qcom,ipq5424-cmn-pll.h>
>  #include <dt-bindings/clock/qcom,ipq5424-gcc.h>
>  #include <dt-bindings/reset/qcom,ipq5424-gcc.h>
> @@ -52,6 +53,12 @@ cpu0: cpu@0 {
>  			reg = <0x0>;
>  			enable-method = "psci";
>  			next-level-cache = <&l2_0>;
> +			clocks = <&apss_clk APSS_SILVER_CORE_CLK>,
> +				 <&apss_clk L3_CORE_CLK>;

You exposed the latter clock through the interconnect framework. Now,
every set_rate/set_bw call will be fighting for whoever completes first.

Konrad

