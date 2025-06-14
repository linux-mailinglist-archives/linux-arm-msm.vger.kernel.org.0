Return-Path: <linux-arm-msm+bounces-61305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C22B5AD9F71
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 21:22:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D53057A444E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Jun 2025 19:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D275F2E763B;
	Sat, 14 Jun 2025 19:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gvJABi6A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4949624A041
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749928960; cv=none; b=ILwGmwt+aWuuNRXAsHd6fdoFrPGPkv7Joh22beGyp9xqR1/V58TpHGoooNPp2ENHWgxSQ5pHne7fax1CnFBON/GrvCzseECCo53tP0ZomAvfTE6obsEJO3KHBp/wKOadYTnC0RLTn6ZvmmfE637YjEI+gKF9l98lB4c2onqIXMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749928960; c=relaxed/simple;
	bh=74UE4OS2luQ7P5Vh+iRkt6MZQysIWQsh4S5igVUh824=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IoqaxteOmMewzeJxST411DZSMrPdxgCC7IfXsRybwJU3f/ohEpEK9abmMEgs23d1/hQn5oLNo+8xCNE7oJDSNUtPNFtTWecRuleCcn+hhWqsOga5368vSBZIEVLZjs//gGbIx7ThsL5KjwNXlHPo10sjts4UI+g7gqFBqr6i1Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gvJABi6A; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55EIoq9G025020
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:22:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H7Xsy5pYt6HIDgczfhpBwwGtZlz4QBUYqyEAh/V/oek=; b=gvJABi6AWOfq9TO9
	HN0qC+g3ATQw3K0c6ePVTgeeHKabuWrmrJ758kyvZ2JquVhLIsqBLGUHXRDo/jIk
	qVWRKSI45vFuEbqQI7PZjifHGo2pTtNDprGhDbg8XCmXTq0t/Z8XeXtbnyDf7s1d
	ncl3ElxS2PoGfdtcj7h5tnDc2rO5mnKwZ+kCZzoMH0Jx0BnWhyaXNhnhg+k79vtA
	DvdeIeCu+jGmGhGN3/mvcGmKr2U0pXfsqMxYxxAxxNaUbenNnewYsPwyrQKFs7JL
	7dsbsOWcdGM5bPEFagSpxsSVyoku5TmipyzoODzbF+HrxFPS05IuSYOGJyyW6mFn
	IiZLfQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791crgwy5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 19:22:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d094e04aa4so92942185a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 14 Jun 2025 12:22:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749928956; x=1750533756;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7Xsy5pYt6HIDgczfhpBwwGtZlz4QBUYqyEAh/V/oek=;
        b=iqX432ZAWe2Y3z8vk70FztkGJ/19vomeAKenHHIHPqmyUB8EyqWZAvqrNqztU8eO/H
         SJb9I7kZreQrgEjmLGnvD8bTFSPDq9oSloF8j5dBZh8PCFFd03b/o/u/dzJDj/JRkr+4
         E9bPVzu1u2BvF2KTgIkBO318UJQnrGfl41Bowtj6xd651uVM5nxpy9HoyKB1wsDUqr72
         OB1jvFWHG0tkPQAcvtSnpX/XB9F7G25T6YMXjZpjNFpVfK0Y0Dp9x6T+pxjiZZkWXoub
         ZNS6jKEiXsBDvv5X0VG4lNZIzzKhz/ytZD8AwN8m2advSVeaqXvA3IcqL5rpSycpvWvi
         YTUg==
X-Forwarded-Encrypted: i=1; AJvYcCVJYlbESFMqDZE5fNF2guEaGHeyJ5mATrxgZtFN1HQ1hEXkpoAUtqanrEI29Mjp7SBVjZWUBt3kLpgZxVU3@vger.kernel.org
X-Gm-Message-State: AOJu0YwlAdc+AX5fjq38jILhKF6pSv4eOyNBOcB6af0gj8gPcSDp0H0w
	xhl3WFCFnjnPmEAivZCA1bTe2gpVAChNoKCHN6Mw/QxuYi6rR1Sn1fPmbgnynx4NZ8XkCp7zp/n
	mBWMQgV9I+yMUdN0H3cuQnojpos4VDdHeOSzFIvw5LyXIH9AcK6UVz6i/Sqn9HaRQyPx+
X-Gm-Gg: ASbGnctTskvNqRVyz9DloNPF6dm0opxrkb7CLQFlUhaYUZYjaYjdmnKr645kep+FTVu
	OTrMdhzOnSvZLsJ5Hlxp8FIv0ea2YwvrAwvtVD6IR+U9VPgXEzOXXniIxvRvB3f/hvjg1CamB7+
	40xeZr3gCJt6hVx3/ywMPsPGnqNYJmaK9BgklIws8IMzlfWPTEg1I39KJrq2AuM44mhaPoYHVqm
	tKKqRwS6gNGpJOn11Umz6ezsXARpc6Qq9XhLK+xxYeuYGFfQgIzHIlsTwtvoPXU1bA3B0jmVRyV
	q71MEmlpB/XhSshnIHRPp0qefKErXXx9OxQ7wSxx79S0CJrWKidz4O6JhP57H1v4HxHuQBiurhb
	Wo44=
X-Received: by 2002:a05:6214:f2b:b0:6fb:1fc:7889 with SMTP id 6a1803df08f44-6fb47834635mr21887566d6.11.1749928956062;
        Sat, 14 Jun 2025 12:22:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9m0yqwjFjkxOlIpQA/8WuGepGH4pwHKnBlLHgfFDPcHqIZwsozxQ0flip+50/6sEjKMVZMQ==
X-Received: by 2002:a05:6214:f2b:b0:6fb:1fc:7889 with SMTP id 6a1803df08f44-6fb47834635mr21887436d6.11.1749928955637;
        Sat, 14 Jun 2025 12:22:35 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec892ce00sm349525966b.143.2025.06.14.12.22.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Jun 2025 12:22:35 -0700 (PDT)
Message-ID: <9f12148b-6462-4ffa-b665-325571db78f0@oss.qualcomm.com>
Date: Sat, 14 Jun 2025 21:22:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: msm8976-longcheer-l9360: Add
 initial device tree
To: git@apitzsch.eu, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20250613-bqx5plus-v1-0-2bc2d43707a6@apitzsch.eu>
 <20250613-bqx5plus-v1-3-2bc2d43707a6@apitzsch.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250613-bqx5plus-v1-3-2bc2d43707a6@apitzsch.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 11Z1fYpihkPzZqUoDgh_jhhbDPd-tWUf
X-Authority-Analysis: v=2.4 cv=BoedwZX5 c=1 sm=1 tr=0 ts=684dcbfd cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=HDjIzE35AAAA:8 a=FqsyDp_bju1yIiuMhToA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=y3C0EFpLlIT0voqNzzLR:22
X-Proofpoint-GUID: 11Z1fYpihkPzZqUoDgh_jhhbDPd-tWUf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE0MDE2MiBTYWx0ZWRfX1PTino/OPcaW
 f3XHPfiF3XO5IQM/lWxuu0kbVBsEh4gRPc1SHUVQiaHnIjaxpkZ/lPP/Hm2gDjTfYvJgOM7nu3B
 wkhilGQT/s8yk6JHQI7HfrdxGidM5BcSeVcJoXlIEnv7fUCwBFlIkVcPG0C20tPl3A9reIVqOy1
 tKn6WWwnH80La5d+BsQWh3ZViguWjHPeGsBaqhoGt/fMCQWxedBy4e34DwRwwlDCbxeziULzcOw
 7IpunJCFgmHHGkLtb9J4iSgfOUYfL+JyI3wYGZDi/Urr4Ty4KIdD0Rylbl5ANI+j4gG3h1B2cKe
 yK+tOvzxQMZtpoBx56j35se7nbMCaZdFzNiICcK5KEgebRHGw3CMq+KoqJurKHXzI23l9UzNzZP
 zv6kHP2WK4kYO09tQheB2sK70jFBX3dTQiuea4m9xSAv8X6tyB2jqGbZREcY2ejMxDyw4f6D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-14_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 spamscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506140162

On 6/13/25 12:37 AM, André Apitzsch via B4 Relay wrote:
> From: André Apitzsch <git@apitzsch.eu>
> 
> This dts adds support for BQ Aquaris X5 Plus (Longcheer L9360) released
> in 2016.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - NFC
> - SDHCI
> - Status LED
> - Touchscreen
> 
> Signed-off-by: André Apitzsch <git@apitzsch.eu>
> ---

[...]

> +		/delete-node/ tz-apps@8dd00000;

please remove nodes through a &label reference only 

in this specific case, the address matches, so you may want
to simply override reg with the bigger size instead

[...]

> +
> +		rmi4-f01@1 {
> +			reg = <0x1>;
> +			syna,nosleep-mode = <1>; /* Allow sleeping */
> +		};
> +
> +		rmi4-f12@12 {
> +			reg = <0x12>;
> +			syna,sensor-type = <1>; /* Touchscreen */

Please remove these commends

[...]

> +		};
> +	};
> +};
> +
> +&blsp2_uart2 {
> +	status = "okay";
> +};
> +
> +&gcc {
> +	vdd_gfx-supply = <&pm8004_s5>;
> +};
> +
> +&pm8004_spmi_regulators {
> +	vdd_s2-supply = <&vph_pwr>;
> +	vdd_s5-supply = <&vph_pwr>;
> +
> +	/* Cluster 1 supply */
> +	pm8004_s2: s2 {
> +		/* regulator-min-microvolt = <500000>; */
> +		/* Set .95V to prevent unstabilities until CPR for this SoC is done */

That may take a while.. ;)

[...]

> +
> +	sdc2_default: sdc2-default-state {
> +		clk-pins {
> +			pins = "sdc2_clk";
> +			bias-disable;
> +			drive-strength = <16>;
> +		};
> +		cmd-pins {
> +			pins = "sdc2_cmd";
> +			bias-pull-up;
> +			drive-strength = <10>;
> +		};
> +		data-pins {
> +			pins = "sdc2_data";
> +			bias-pull-up;
> +			drive-strength = <10>;
> +		};
> +	};
> +
> +	sdc2_sleep: sdc2-sleep-state {
> +		clk-pins {
> +			pins = "sdc2_clk";
> +			bias-disable;
> +			drive-strength = <2>;
> +		};
> +		cmd-pins {
> +			pins = "sdc2_cmd";
> +			bias-pull-up;
> +			drive-strength = <2>;
> +		};
> +		data-pins {
> +			pins = "sdc2_data";
> +			bias-pull-up;
> +			drive-strength = <2>;
> +		};
> +	};

Please move these definitions into msm8976.dtsi

Konrad

