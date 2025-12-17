Return-Path: <linux-arm-msm+bounces-85461-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16457CC6FD6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 11:11:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5D2E63009DA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Dec 2025 10:10:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 192AC34A78A;
	Wed, 17 Dec 2025 10:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QEuQIfqj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EhwYLlWy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949532E9ECA
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765965908; cv=none; b=rjfOUB2W4z5bVRfYqTffyjOoqDhPMVfjp6cqZkJnNstezVY+4lvIEhN0UFdNn5O1hi96Y6KljLYIDzOuaGmcQzyh8HC8kqxo22uR0MqislMtzm/WnK4X0GDT+AHlN7QGGPvfuiD7H1st24sQNU1OBnF/RYQACQH8eO2WndtoZSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765965908; c=relaxed/simple;
	bh=gZz3B9iIJzC/jmBs/0TCW0/gvf/+P5s7w8dHI1HIvQo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N/FMF5KNPwP6VlvE5BiNZlVLKgCiJ9F4vUebjf1cg35LlUbywoFmUI0oimoAyxaIAsUghsy6M7LXhaYLy3cSAufugQDPJZg8+Okic3xDcXgWDJZr346K6iuR3G7VIDghFRF2I2pHs5BwFauaRmlw/GuWg0LVzB6FmJaKxtQmdWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QEuQIfqj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EhwYLlWy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BH3F09n1500904
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:05:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k3NJNOmNAyFKrjcNT0S5mV7RCgG5RqpzfwwSj7O8e2M=; b=QEuQIfqjtFSzFxDa
	r502rq2ok7tpkYLWABCygY8WLLHjnZOB6vP7Tr+xn68l3M0gOvOuqKJOf5weWKIJ
	roi8ToaLyyZvAowmPIhi0DvuaOQa6haqEwFyoWJuR6GvjCBm09NQPTkfguJ/MIgL
	VwebXygML2+sNSLVD3wIQOI5StnZAktbGUrguAC+FZNr0oYGx6UdniTg796h97ad
	OoktumscbmgKYLNjLb4uRHSIFtlgzC5qQ4h88fI9nHI73K1ZyEO1RQ4eL9V6qaZ+
	cKGXC5j+MeiWYOdl0fWYSUP1AOaAc45oI0VgvW3/vZeona3Y0xh8c3uCrY9SfnxH
	Fe+pew==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3kkescn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 10:05:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8b9fb4c55f0so103884085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Dec 2025 02:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765965903; x=1766570703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k3NJNOmNAyFKrjcNT0S5mV7RCgG5RqpzfwwSj7O8e2M=;
        b=EhwYLlWyk60VvIayQykJrYZhPNZ5ybOKZ+S8mhWchTZZ1ZlQw26kNzgyRZx8l6djyL
         D7+5T2pbDBHka8U0pygQ9CBO0GjOruPlRuyiSR0Q4MSR8HNCrFagB3gLhl0KX30Xvm8j
         me+Rb/YRUbqTUJtw+SRzRc9EQyQBIAZLI+q1O+vQFFt4x0KBjD9HPXodNDt3sYzbBuaj
         bWgjXzO5fOIZfjNkg6tzKOV1zdDXaROWD3p45FXxlZ/JYVSpMyH7dXaiW6AyPT78LYo0
         zR0XJxXbP47MHcoTqIyABFrvVqpfxAVaVRZow9cR12/TTuwJPVfIL3JefZ6B2/7kBrjp
         AYHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765965903; x=1766570703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k3NJNOmNAyFKrjcNT0S5mV7RCgG5RqpzfwwSj7O8e2M=;
        b=frUm6JSdqBgvK0/BfnbCuJelABu7ISnquyTY9ibRrs5CfT9jsnEcbPQ654TB4Zgp4U
         gd81NN59NAVJ0xJYO8EtiKarDLW3sgs1CCdKgln/SGGRx9i02rFZ17lew6xOdTN+JOTq
         w2RlK7KRo932llDYwHuTumjup3jgagggYfQvP5B/Fn0rc5GfE1Ia+WU/MTViZOzoqfI9
         CKXmJUfwUg9NXsG/ZYWRfORuY41PVCjoK7+HkmKaWhLfVEljDmm/wl3Unl3QEP3w6MKD
         40i6Bz1WtEevDkpXzloCJHMR4qRfSH7Pbjq47iDRo+EKwMSyXTS1f6SsL9jqEi9X50GM
         GLJg==
X-Gm-Message-State: AOJu0YyEa4IDi837Zr7JwlD+KtM1EjaeyFBEz57QGL0E+/ZclbPPsEYW
	ks8S0EGgEJJIJP0Ebzo7e1mq+huD9zzT3HGePw4gqbypaDK3D2ZECQOixZyV9rqLVD7+jYfMsAC
	AQpA/nNpBX+8B8pGiw5DbRVPdm1xnPjMle25wsyq+YpBUh9oyx8/Q7i3IZ0S+Bh0IZMhy
X-Gm-Gg: AY/fxX7dnk7apcowJDoSAluzanUBJBFu89WJreg5jWi7g+uGcq2d0745+/mgucYN0v9
	8N9AF8qepfNpUQ8RWPMmKKAhX9+ofhFwhQLEcbCdUdxsoS4PCVpmmZ2ZrovdfTjFvvakfFl4ZjG
	D9oSREr9a/mFY7adZGv6OSNV745H+D3IGtmxi3YJ9tQQiJnZQnSSUEzXHG6qwssLaoO6zLVhqX3
	/hWtZq01l+kNFDv6p7GssFin/Dmvr9FHIZ9p64bsGyMN8LraGs1jirtjUtISyyl7xdRoJjx3Rfw
	aU1yMFYnPfDkuV7nuXe0uB94OvEKQuMvJG/lVcINZ2jc6MUYst4P4ZTZ3MEIA/pvUJ2FX7AmwUT
	P2u3AXkDA7ebgAZU6zNqdRTmI8fx0VH/03pcTG+UrkcfOj4wCM8HjgVa+9S/kr9mPpw==
X-Received: by 2002:a05:620a:3193:b0:8b2:dbf7:5193 with SMTP id af79cd13be357-8bb3a3a54b3mr1775809085a.8.1765965902784;
        Wed, 17 Dec 2025 02:05:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyT8wqW5vJWs30oNRZ8PJnnBqtLGOozur9GpczUF35gV60z+b4nAtlhuY/qisqT0pp8Zvmlg==
X-Received: by 2002:a05:620a:3193:b0:8b2:dbf7:5193 with SMTP id af79cd13be357-8bb3a3a54b3mr1775806085a.8.1765965902296;
        Wed, 17 Dec 2025 02:05:02 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b3f4880dcsm1994074a12.0.2025.12.17.02.05.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Dec 2025 02:05:01 -0800 (PST)
Message-ID: <470f8e79-4fa3-4d02-8e24-3cca5c4fe33a@oss.qualcomm.com>
Date: Wed, 17 Dec 2025 11:04:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: Return correct error code in
 qcom_cc_probe_by_index()
To: Haotian Zhang <vulab@iscas.ac.cn>, Bjorn Andersson
 <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20251217041338.2432-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251217041338.2432-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE3MDA4MCBTYWx0ZWRfX6awzv7fvPKJm
 AoXxJK3BBJewypXfAKIWHEg9/z3uUfvk6giuqbx/8XvvuyIdJFo5wnfIszIeSFYGRxoxHPPvWWT
 Y/8qN+yZpezhmi/HFJhjcTBQ1dMJegGx3eJ2t88aSFH5JEGbjwQ49T9p2ZYjGluTsM7RLLde+X8
 tNq7rvfVtnzAhhi6XkxJRa3KsE1NkYHKKsxxLCURNrEr43PZuePl/VYz1uuTHQzGNMtsA+AYYX9
 JSJ9xpmzf3rNgoZ7oe2NGMoBlHcZx+ZISedJgshb/e73p8fi+gLcJZOSFs4d6U5w3ehIsARttHE
 ZEYbjLx24xEDvSth5k4KSGqtmnLtgeRj19PSBiKcGr0g+Mob63/caYT/Va9k2OmW2QWWet6OC+L
 jRkuMrOJcilEWPPvU416LJaoK/SrVA==
X-Proofpoint-GUID: NXherNE3z_13Z43hV4MU47_xxHQT09JA
X-Authority-Analysis: v=2.4 cv=Fcw6BZ+6 c=1 sm=1 tr=0 ts=6942804f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=P94ZdOjJmrbMzeDvDm4A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: NXherNE3z_13Z43hV4MU47_xxHQT09JA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-17_01,2025-12-16_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512170080

On 12/17/25 5:13 AM, Haotian Zhang wrote:
> When devm_platform_ioremap_resource() fails, it returns various
> error codes. Returning a hardcoded -ENOMEM masks the actual
> failure reason.
> 
> Use PTR_ERR() to propagate the actual error code returned by
> devm_platform_ioremap_resource() instead of -ENOMEM.
> 
> Fixes: 75e0a1e30191 ("clk: qcom: define probe by index API as common API")
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>
> ---
>  drivers/clk/qcom/common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/qcom/common.c b/drivers/clk/qcom/common.c
> index 121591886774..eec369d2173b 100644
> --- a/drivers/clk/qcom/common.c
> +++ b/drivers/clk/qcom/common.c
> @@ -454,7 +454,7 @@ int qcom_cc_probe_by_index(struct platform_device *pdev, int index,
>  
>  	base = devm_platform_ioremap_resource(pdev, index);
>  	if (IS_ERR(base))
> -		return -ENOMEM;
> +		return PTR_ERR(base);

Nice find!

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

