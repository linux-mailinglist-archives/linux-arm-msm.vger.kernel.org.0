Return-Path: <linux-arm-msm+bounces-75056-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F87B9E9DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 12:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A4E7D1BC5193
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Sep 2025 10:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23F2C2EA179;
	Thu, 25 Sep 2025 10:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I3sqOFnX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902D9E55A
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758795921; cv=none; b=DOwXeTCd5MSS41q8F814gPrR2Ru2gmiNLRRY/3DWIE0584G3r8vSRBYoZ2eDEFk5lwsBNm2ElkZcmp5Q4UutyLs45vbwAho7OCDO2Unyi3qiWLUqtONm86DcOZlR46hwwGuB1oVVOfKqxqWfYaC3HvkqpruwLZsxZMAGioStQ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758795921; c=relaxed/simple;
	bh=jJH46p3z2LOWDtL4CTl89NqL9Jpzrq56C/RNQoMYBPE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gw5yqiPfG0efTlaEVMUgiZUV/XT5doC0n+bIwqfzZ9Ep+KnM0n4BdXnod4lR7aWOYJO66gSCoat84eDze2yd3u2tTANN3WKMz84dCslK8/aYjRWo81O2citJW7EP2IEhrAVOgG1xC5zpfNijWYAhfgvgcZo7+ZfRnRPgTluO+3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I3sqOFnX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PABmdo002662
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qJ4HNspy8ugKaxak0rI5XESfap+Y3CVU5ROm4M6HYI8=; b=I3sqOFnXsA3IAxUg
	cPGCPtxVZBJD0lE30y6n6ix3nZgsnRIo4ofm96e/GfsylnPcZEhWeaGIkEFQDHs/
	Axi7VYqUcTNVEwmdAiUEtw6hEoZyEIt4Pn9snrJbUxLjWZCLuv9qVwR56o4tVTb0
	oPv78nf3ThCMLqhXzRQf5JAN7Qyy3d/u0GzKW+yd5cblGsOIHQ7OTjbklXsemFKC
	SVlo8LapVEKWP28zAk3EMYBby0QHMctJM8Nmh+xY8teoZN/g8uvXckrgjosQQkzL
	X0LA4n03acbTJjJeY5kUuNLFx7+8TX5ThKbNzUgLqNAQTZK677y0FsTLg8m4TQbm
	a0ApaQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49bajf295c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 10:25:18 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-85d43cd080eso11075885a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Sep 2025 03:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758795917; x=1759400717;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qJ4HNspy8ugKaxak0rI5XESfap+Y3CVU5ROm4M6HYI8=;
        b=lY1kFckNsRwYMnvBrHoSYWevsxphhoVnQyQoBsefemsHVkhQsIsJOmNItyBoKtkJoz
         UIl7jqfcbDVgHjRCTDodMKmPRQNQESa/P9dudz5VqmE9xJw80EwTI5g+GWTZ91uJM8tC
         GJCnsBUgKA+oc1AZ0200cmFmX7QnQRPcgwFgXrY/kQgTHJN2f5omxxXQLoumQfMajGcR
         U5iQvISQwiLC8rgKCrs6rJsxQ3w/uBjV11MlAJbLZX/7tbQ0a0XKzqMyM500OjpOIeWg
         NnQd4VgFfePc0QNZiTMulUkUgorK7jr3o5jP0vXpV927+QLPVzvZS8itehdFQor5tQJU
         cdcQ==
X-Gm-Message-State: AOJu0Yw1ZcW2Zrd9gDa68BOFvlusNYvwtDKf23qcA6xqyYSsFemAmivq
	JvGy1ch8gAeW0UJ85TfYvWHAJBTohXVBA6L24CApH7hM/45Qx7AUxhCeowlxPWis7gobWCPt3ZN
	3HeD3gEgdhMkFikynFb8+b7FagNW6igIOY5cYnaZ9RNJUtJtdT39tlkR5nbHQft2Dhuux
X-Gm-Gg: ASbGncuS/JO5OmcSSZiUeo5jGZg61IDfjtLNzpBi6Fyqm8Vl7W/cz82hI+p/3Z1qlfx
	p4PTZBMbsrwVM5sQZQj6UaUyFDZAA5Xa8pzy3Kk9+5mlbrNK/Qbfr3dZ8C6NgLNig5cSRT/RPK4
	8jDFpPBmbUMcrTVPCwVeY/xfTJW4DL9DjdNdmMHVl3LMUz8d63/VnG1mPf6MRy/49Hz1oZd05Yq
	eceRWpOpSVqrN2JeBVKjNwzh7LEt4Ob6WR6zvz2PQOTstlCbFxQaegObd9SsRsuhm7wvpWYOMv3
	Z3SwvDxL6BV61aaP3V+KbU7y8pqLrAUt5A1uhmVO3LEQlyK/F7c/NZESUqktXLAQNw0nnmU8H5h
	jwhl1JF4mMhVFo1JB1CgzgQ==
X-Received: by 2002:a05:620a:40cb:b0:855:b82a:eba5 with SMTP id af79cd13be357-85adf5d276cmr231391385a.2.1758795917405;
        Thu, 25 Sep 2025 03:25:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2Zz6UrEL9X1kyHtq0w9S+d/UM+2pLk4ePCwwUt6YIR1xjOW2GmKX818dowCttFUH2RlgjbQ==
X-Received: by 2002:a05:620a:40cb:b0:855:b82a:eba5 with SMTP id af79cd13be357-85adf5d276cmr231389085a.2.1758795916935;
        Thu, 25 Sep 2025 03:25:16 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b353f772528sm139148366b.37.2025.09.25.03.25.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 03:25:16 -0700 (PDT)
Message-ID: <2055e6a8-dace-4ee9-a74b-0e3bf2d58fb7@oss.qualcomm.com>
Date: Thu, 25 Sep 2025 12:25:14 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/24] arm64: dts: qcom: glymur: Add cpu idle states
To: Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
References: <20250925-v3_glymur_introduction-v1-0-24b601bbecc0@oss.qualcomm.com>
 <20250925-v3_glymur_introduction-v1-5-24b601bbecc0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250925-v3_glymur_introduction-v1-5-24b601bbecc0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ojlx0McvKeX4MdgD3nqbCOlAe4JE9gve
X-Authority-Analysis: v=2.4 cv=fY2ty1QF c=1 sm=1 tr=0 ts=68d5188e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=IJKnKGbGdoixpOcUAUoA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDE2OCBTYWx0ZWRfX2ycOZc+XuxkM
 yy/6YwTz7zEBpHAmZEf7a79K2k59KfjXSSh26NCuQtoMzfxah1J1fhaDmYbXrakRsdZZaVR3Xg3
 JUvHiOcV0YQuWJZVPhd4WVysMAzo0aqjXSVNBscJQRwN+y+AkyRAXW+hP1mgcRg6CuVrZSMyt6o
 FQOIliIjC9BuEJjYRDWQbqDqi42BbcIvZ/VKthVFU8szrISf0K8fP+eASqxQYyYozfNkG3kTZhT
 8GQveULhHSNAVKaVbOwMmnKvfq8kWXNsOfuWPIX9QwNYhK2BtQpwiSjSeARqKi2KC/CxxAi2sz4
 QV4IarCgjLHDMfQ+WftjIZsijclJ517k7+OvoE9/x74LqcyMdjtXG3Tzyx9r+OA6qaZEK4RI1cI
 mbpowb2q
X-Proofpoint-ORIG-GUID: ojlx0McvKeX4MdgD3nqbCOlAe4JE9gve
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_07,2025-09-24_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220168

On 9/25/25 8:32 AM, Pankaj Patil wrote:
> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> 
> Add CPU power domains

The commit message could say something about what kind of states
are being added, what their impact on the running system is, etc..

[...]

> +		idle-states {
> +			entry-method = "psci";
> +
> +			CLUSTER0_C4: cpu-sleep-0 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "ret";
> +				arm,psci-suspend-param = <0x00000004>;
> +				entry-latency-us = <180>;
> +				exit-latency-us = <320>;
> +				min-residency-us = <1000>;
> +			};
> +
> +			CLUSTER1_C4: cpu-sleep-1 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "ret";
> +				arm,psci-suspend-param = <0x00000004>;
> +				entry-latency-us = <180>;
> +				exit-latency-us = <320>;
> +				min-residency-us = <1000>;
> +			};
> +
> +			CLUSTER2_C4: cpu-sleep-2 {
> +				compatible = "arm,idle-state";
> +				idle-state-name = "ret";
> +				arm,psci-suspend-param = <0x00000004>;
> +				entry-latency-us = <180>;
> +				exit-latency-us = <320>;
> +				min-residency-us = <1000>;
> +			};

All three are identical (should they be?), just call it CPU_C4 and de-
duplicate it (unless the framework would read that as "all CPUs in the
system must sleep at the same time" which I don't know if it would)

> +
> +			cluster0_cl5: cluster-sleep-0 {
> +				compatible = "domain-idle-state";
> +				idle-state-name = "ret";
> +				arm,psci-suspend-param = <0x01000054>;
> +				entry-latency-us = <2000>;
> +				exit-latency-us = <2000>;
> +				min-residency-us = <9000>;
> +			};
> +
> +			cluster1_cl5: cluster-sleep-1 {
> +				compatible = "domain-idle-state";
> +				idle-state-name = "ret";
> +				arm,psci-suspend-param = <0x01000054>;
> +				entry-latency-us = <2000>;
> +				exit-latency-us = <2000>;
> +				min-residency-us = <9000>;
> +			};
> +
> +			cluster2_cl5: cluster-sleep-2 {
> +				compatible = "domain-idle-state";
> +				idle-state-name = "ret";
> +				arm,psci-suspend-param = <0x01000054>;
> +				entry-latency-us = <2000>;
> +				exit-latency-us = <2000>;
> +				min-residency-us = <9000>;
> +			};

ditto

> +
> +			APSS_OFF: cluster-ss3 {

labels must be lowercase

> +				compatible = "domain-idle-state";
> +				idle-state-name = "apps-pc";
> +				entry-latency-us = <2800>;
> +				exit-latency-us = <4400>;
> +				min-residency-us = <10150>;
> +				arm,psci-suspend-param = <0x0200C354>;

lowercase hex, please

also, this node oddly puts arm,psci-suspend-param at a different place,
please align it with the prvious ones

[...]

> +		CLUSTER3_PD: power-domain-cpu-cluster3 {

"SYSTEM_PD"?
> +			#power-domain-cells = <0>;
> +			domain-idle-states = <&APSS_OFF>;

Does it make sense to include some shallower idle states?

Konrad

