Return-Path: <linux-arm-msm+bounces-81562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F0B02C56922
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 10:25:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B9A63B3224
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 09:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BE4A2C21E2;
	Thu, 13 Nov 2025 09:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kGxaz+t6";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fzm1PAGI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF8EA1C6FEC
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 09:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763025917; cv=none; b=pzENn9cCgLMvUiCGxLU3H0MiCVJqDLqY3qwSHKW1Ke/Jikh5XGTwMdR4EX6yXkJXqDr5zaYgJLsBDHGFa3PQ0Hox8Ltw8F8sXbjjPShQxw0KVD/qoO0YN3+GZlpywZ7h3HfGb3CnhH/Mr+0G0SpkGnKkLIkLOLsa41dOl1UFzqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763025917; c=relaxed/simple;
	bh=OoScr/lvJFthXvfT1CXbfWhIiXmyfNZugSh4SiCJAKc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=l0EIF2hgP6ydo18edZq0m0wBSTziXEMq+ZR5OTMA12/SyUU5yrddYRCIIT/8jYWDlpRmpOirS9FX7I+aH/wBaewt/h3nI4LGJbZ0IBZ1ixprI7zy5vzyZxitOr9DE9GCQQTONHsVAQUf1y3wjE4vvmx2GhFl8wlYz7fRuBmeTro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kGxaz+t6; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fzm1PAGI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AD8vJxc3113231
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 09:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vDDFEBq90ZrP1T+dhrcOC42sUU7oXSQNn7pBqr9sAgU=; b=kGxaz+t6XTlVqj1Q
	cpp7vqdDEj0ZTNXz8YMfu7hSXI65/qzHSbr5nRE6AKQKVQYrV5AT2wYgJzV15pfC
	AWFf4V3Dw+4jXBpghBTkS9AdxrXPlhYDy+lzmCHUB7XxI0Z51jgnoCMloEngoQXX
	hQ8I069ESzIs2YtA7cU69+/xghK3FmELpWsjPt+LObVMKkqkr449phORhQgfzko9
	NW0Gy0FwRG/gh/5UqEGNCP8nZvGj3Ylxw8i0ExPUJeU4LY791/U1C+3UaqCghOg8
	E7MF97MWA/11o0Qxu/vBUsxM6lGe608VYONG7RLHuZ7uQkWbk9eHOuHdrQKM5Ree
	2cmXHQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acuw4b8uj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 09:25:14 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b1be0fdfe1so25996385a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Nov 2025 01:25:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763025914; x=1763630714; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vDDFEBq90ZrP1T+dhrcOC42sUU7oXSQNn7pBqr9sAgU=;
        b=fzm1PAGIpxKJjgd7e8Bf8V90msVs7VjDyxi1sMGkQqF0E2UJIGZ4kEVOcCV5FBZaDK
         ntrhtIXXmTJa3hmL+uNW3baoRB5QSmAVrQ+2QuQ/oxMrISS54fsDHJpyNmTFNXmYdI+Y
         bm1cpQl67kV6Jw9HpqZzuNw1hBg+TdkqAhethxabwUKiNg7cFkJYe8j34Eenb6hxwqeM
         Ttw9qlvoqRRNdvbZMb8ZlGqfBw6t7O8MLD3uiCch1VMvlK0aREoPVkejW0tFyvCw1IIu
         TWSYUYoeSOtqe59HnDVUVFO0VTYgb/JagZvlJluwNvJF0Bpu57Q3WE1xzK6N1mcWgaf/
         C9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763025914; x=1763630714;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vDDFEBq90ZrP1T+dhrcOC42sUU7oXSQNn7pBqr9sAgU=;
        b=BSQNZgfa58qZgSbYpHNnaK1n4zBAHQZVuzx0bSguDnBCgecu/gLGUxkeL/dH4/OZ10
         YPlnMR0uyjizXLKEjfIUcJQSOIdgVGJK6f9+Xjd4yGqKAS4w2Tc0Kep4Ap9la+XVK8Iq
         zHo8XpTj20kL7nZqAzefZTw1K54uSUy/FvXIjmDISfz9QxWjD3ZJlshiY4Q0ormUpovk
         tmkjqyB3Lsn3r1Y8wrazzoeWsAiD1lktFnOjm5nq89iPxwS5pQP+X/tQynE2EtLI8z85
         BZpSAyT+K1apKf8TWk0vRIqnPoAbDeVWEGBgu8gf7Sa3go5EKFUlp7RmNnNL1ZxVf1Gz
         lalQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1+74irzmI7vV0711MtDJtIacEQsr+RcX60RlkiVPtBBMliHTvim0yM1kSkP1K/UCXj1sMwpVVnqYonrvu@vger.kernel.org
X-Gm-Message-State: AOJu0YxdAoSRQ8CgIhCMd7fCdrgf4uV0/GL2muSAjQbtMDx++P+mZkka
	Kv9/K0Sk1jDV0/Ipho3L3bIWFYwq7eiX611fT7v2zdO2SVFf5tgpCjh9ELfji2HYyJVs948+3qr
	rRxw8Cc6XFIOj6S/rGGFooRDTlZCNGg4HPq0ORM665Hfb7AXeXoUPXuOMmEpa4JEsUK0e
X-Gm-Gg: ASbGncteih+bwdy7ZwpcJrY7ZN5aJBqXY7Uf4cecnOZc8TElmKUml7cUrsK0FruSDm4
	iN9cJTrWdtq9nPbpF+cnfIRThKd1k+P7ZlAG2MpZxsaWnQgHICVM0wXX29hD4FVpCkHTuf/x+/q
	2LnELXnL+zNB+mjlhJNxU3eSGvLa+9inWAs/b+O5p8HxH7Az7RwkKsZRytIEYAZwaXd7KfX+Mj0
	vVU3iL0C1eALxNy6ahdvmpec52JdwSFV6RafF9ZxLpANmYAX83Uh6leGYh29vLZYI1AmIZ/KE6P
	cYZ71cnzwj+n3YpZyVTwTZwYthzWR6+zxWaEiFgTpJIuDUQrb/BJt5J6S8QLdpzakelq5Hqina7
	u9YZOlch5AAtIX9FSIz4dk3nexj9mIIJxCe2V50krLMml5Z8FQ7F7OpPb
X-Received: by 2002:a05:622a:82:b0:4d8:8b29:228a with SMTP id d75a77b69052e-4eddbc80e92mr63505711cf.3.1763025913993;
        Thu, 13 Nov 2025 01:25:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGiS6ClbvwDxaM59r7EvhMvEL75Aioc8hfQ0S7gbLkt5XCfLUoRC68WRgTYAfl76ADBEXhpaA==
X-Received: by 2002:a05:622a:82:b0:4d8:8b29:228a with SMTP id d75a77b69052e-4eddbc80e92mr63505241cf.3.1763025912750;
        Thu, 13 Nov 2025 01:25:12 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6433a3d87e3sm1020882a12.7.2025.11.13.01.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Nov 2025 01:25:12 -0800 (PST)
Message-ID: <c8584278-f771-4976-bdae-03379e1f2d03@oss.qualcomm.com>
Date: Thu, 13 Nov 2025 10:25:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sm8750-mtp: Enable DisplayPort
 over USB
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Jessica Zhang <jesszhan@quicinc.com>,
        Abhinav Kumar
 <abhinavk@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
References: <20251112-sm8750-display-dts-v2-0-d1567c583821@linaro.org>
 <20251112-sm8750-display-dts-v2-4-d1567c583821@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251112-sm8750-display-dts-v2-4-d1567c583821@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: UQeqzAN_WqN6BaZq9s9gSuYibmJz6C9W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDA2OCBTYWx0ZWRfX0slNDV5wC2uK
 b73Qz8wXSgVgPux+NRcJ7q2tXGCLmAcRKPEckibLxSU0osApCXBzE2OFDYNg9oJfZohvAZ8bm+7
 IrzkejU2A7Hq03oeGsfibF5l5v+BWfDQP66gkWXJwk7QB3ZlZwt+R9JxVNAmZKIjh/j7Fc1Aps+
 gjniNgnKv1Z0LO2RY2ej8vPW1DuoY0skfbXAWm3tlp1Mrvb+avAYlHbcfd2IDURm7BJKqD4pvdR
 VKEnuDzrcNHJj28l+8OH/D0CdG2EesMckC3eBOKue9OaMcK+Oh4XmhTa8nY6bTjyClhO9zntO4z
 TXsbS2ptE2xfl46wXShNtoPKsIO++lU1fk9fe2jcbcUnNOotgrHVwtOGVPuGcjj3KTmf6yQGVGl
 33N43cQ9Nk7VmPsdn4wnIRpqpNw7XQ==
X-Authority-Analysis: v=2.4 cv=F+Bat6hN c=1 sm=1 tr=0 ts=6915a3fb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=31XZ2xrWJyNqOSQKvoQA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: UQeqzAN_WqN6BaZq9s9gSuYibmJz6C9W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_01,2025-11-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 phishscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511130068

On 11/12/25 4:02 PM, Krzysztof Kozlowski wrote:
> Hook up DisplayPort parts over Type-C USB on MTP8750.
> 
> Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 4 ++++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi    | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> index a08bedd2987e..8d5a5d89a2ad 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
> @@ -983,6 +983,10 @@ &mdss {
>  	status = "okay";
>  };
>  
> +&mdss_dp0 {
> +	status = "okay";
> +};

If you add:

&mdss_dp0_out {
        link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
};

you'll unlock HBR3 too

Konrad

