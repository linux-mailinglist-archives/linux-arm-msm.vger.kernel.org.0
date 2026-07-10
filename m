Return-Path: <linux-arm-msm+bounces-118310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yRHTDGb6UGqC9QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118310-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:57:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A20A573B82E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:57:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TMh3ys41;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Fr5xezbj;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118310-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118310-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F9D43100C35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 747E02472AE;
	Fri, 10 Jul 2026 13:50:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26643223DE7
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:50:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691448; cv=none; b=s/akjPnvcr8z8/cfzrHr4JAHXHduqY6BTxhznfVo6rG5n6aI30+4NtvaxvqoSiamuPWwLiwsnLDkyLqj2joMZjJfFbJF9UGXRBzj3W/qGrwlof6GqOZYYcY3PYbVtEyMMJsIgtxkHzmq3GOOjKaCPhDel6kvRQbJ5WWLbrWF++o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691448; c=relaxed/simple;
	bh=xH1xh39y8K/9voN/rwyDLcQiZ84Qo7t4SMNVdhnEKJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HenNxyBeO28bVk0gMuW2XYLwqZtmjYu+3jKieMnSN6xTKotZLQFFuzeSmvyjfqBLBiGd778iDxGY0dydrb2YwDIY8Gc0CSAr7q6TJo6dX7jnSpmrPobCj9Sus48yy5SIc1w/8s8pgj17ELQWOimzmy8gggV3WWq5VN7RO+PVOH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMh3ys41; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fr5xezbj; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD5su3910199
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6AIQxvcRx21RioxQhZDbiYJ1VNsBCw2h40lSC03Og18=; b=TMh3ys41KU3gbhm/
	vr+T7ySZQJvD7YOYzs+Bb5Sz9GUZPEo6JmxpQc09aLvo0+qi/kg6wgGHizmkStZM
	W6e7R2Mw7Vkd459x9ll99zW1qxDLZu3sXYRPJXV7XBz/uvMQ3nnZBRmS0D+e+I2u
	Mi72rS3Psl4VGTAC7/Qvpv6/J5B974DSuVlxrejFr2uvVc89wKUq+sbDkmYJTAqW
	iTxwITLqCQFRbmIhUgK9l1eGyQnH4Z3l9KGCpX4ZM5fzGDxQmekXg3nw6iNOSDL7
	rB/risaTQu8Tsq3e0KRAwqlKCEhFWeE42QrRk+REEL8aKlUxjYnV0/RuWIkISFyK
	GI5PwA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanweas2h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:50:46 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7386e55c63cso23891137.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691445; x=1784296245; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6AIQxvcRx21RioxQhZDbiYJ1VNsBCw2h40lSC03Og18=;
        b=Fr5xezbjSQDRuyBXSRyaRfbhp/Uq22KrkWLYgxyFcg6SXCNlufhyL55YrLcEln40EE
         HyHXKph4n0NJpvuvoBQ26LrYu0PT4eOn6prFxDRFNyNPM+0BOtJnMpur6PD3BIkdLLTk
         TqOFJslpGJkNqAz/sIeEn6qoiFtF18TxzPHjk5Bg5xdd5PDRGHlC34lSu0Eu9MV7yR/I
         X/MX4tuiBvu+zCzVnb3JbfwuEyuE9F42sq2Z6Y7lFL8BKHE/NJVGjLhGkaT1xM7WdyO5
         pc9aV8SpbbJRAwzsO6Y+KftirdYjXGCHUblvyDiz1o1x+TsuI/3AAKlge/Io/2XlhXiQ
         hx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691445; x=1784296245;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6AIQxvcRx21RioxQhZDbiYJ1VNsBCw2h40lSC03Og18=;
        b=rfKgXG6F+kBh69L7+kP0FyIvcG9jUY06Lc/6U8d/K1rCqRD5MwFoZdZgxayiIukuxZ
         ctQkVAlKi6YdvIclTt3pHqI8/HuwgNO3x1IP98MxJ1+9mIMCl8k+Ze+0GS7izZOb3HVV
         CbopO7HwNqOtRNDZ9hPmnOhwu5IbLr2y6zlSp+x0uPFOdfLw1VtWhcW2LRvijaQoODh5
         8n+vh6JT30Opw3DT6hQuD0MMc4ivrwmF3Q4ySpJvkrbtyyNcXid4OZW7KJFEyVkDnA4w
         rhXK1KfDalSpTqU601G54TOFCB2c291Qzr8Q1qAhA1goeVExKcfrjSDNUeohndiv0yaV
         gZtA==
X-Gm-Message-State: AOJu0YzcWfGipopc4qwPwOqMCVjWYnxW3VWctCrtGWAnb8NwSwWh7DhL
	lKSjf3z7I0nFD5bYrb0GumqgWifNFyr45TtMeDXihxURHLGdrvIhLPLuu4iPMTEXkikWibyUzsk
	Ljhc1xdrNbIHwPWXY3rxli5Baw5euausiMAAiupDaCO+RwY6FNfdy1JhbjbsvflfhDVYC
X-Gm-Gg: AfdE7cmIlK/+QqCGczWLb0IjIhDMqSxcxSePuUfV3qmt0z0Asp8VCEAsudVbTqE1uDf
	oAaj8KBFFpb38CPvKrXxGpcCFlvpRYBuqaNbL6Q6N//q3vq7SMvL20/7DKaa9xf8W37E+nt6CPK
	xyRDyWKDdqBPqw9n/on0DyRdkAWXzBBX2JIGDPpI7gOdRaOLpVOexGyXXzPvTPJEQ9N/EE2uMt9
	5AmSNKDpbLncWCMwmbYIazcVU3pX+pkKsB4Mzqd+Cf4IG7fjELLTHCeNSPkjDJ+oB3OCodB46ks
	SpPkEwyq86DPLdXGkGpU61cd51OhHxf4xkQPj4wY8ffOeXYWk9Oej/m8dqYuGu8+96LGQRwXhLc
	8OjeBkCfi0psutf+L++jKpV0gBwTqEs+dC+g=
X-Received: by 2002:a05:6102:a4f:b0:73a:322d:1bb3 with SMTP id ada2fe7eead31-744f0ab5277mr2225551137.3.1783691445245;
        Fri, 10 Jul 2026 06:50:45 -0700 (PDT)
X-Received: by 2002:a05:6102:a4f:b0:73a:322d:1bb3 with SMTP id ada2fe7eead31-744f0ab5277mr2225535137.3.1783691444637;
        Fri, 10 Jul 2026 06:50:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca54e25sm615052e87.30.2026.07.10.06.50.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:50:43 -0700 (PDT)
Message-ID: <63643fc3-3a3b-4aef-96b4-de42498cf47b@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:50:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: qcom: hamoa-iot-evk: Describe the PCIe
 M.2 Key E connector
To: Wei Deng <wei.deng@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-pm@vger.kernel.org, mengshi.wu@oss.qualcomm.com
References: <20260709-fix-hamoa-m2-w-disable2-v1-0-5e725091266a@oss.qualcomm.com>
 <20260709-fix-hamoa-m2-w-disable2-v1-1-5e725091266a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260709-fix-hamoa-m2-w-disable2-v1-1-5e725091266a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a50f8b6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=MVNNC7U5w37-LmZrIMoA:9 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX9rv8yzs8jcoW
 CYUqGNYDgSJmLE45ByRpNBU+PeggvL8Q3l/kiaJV92yK2HVZ/rYSE6nJjCWYoAEasdKkAfevu10
 ZRqUtYL/iLljKa9bfZXARg58faK9jdpt87yiaVXL5R+m7JoOlkW2qKi02z6y7W1PKzPdL4gYMWb
 4xG6Nxex2l0vKPKIk2jO+v3/CgwZnTNwFt8IEyqEr8G0Ltf5SHNMvgLIsccrJhkqNHkwmkZuTQ1
 14w0e7jEabzX8Vq0p92M8N4XfTlJdHH3FJtk7hmF/ba5qARZBg7tza6m2eQDssjNOECZXG4E2OG
 PLTsoc8SnXORSjBRxJpsJ9PG/scqXDjDysuubNy6mUAcdeP8Q+lQsq017GuovsvK1VBkaNMytSw
 /Hkp/LOVhySGmCHPjlVCFyWha9D1xqeCGGoMQsE0gSLOIwpvXJdr3zM5r/jFSZdybKCGCxjfpJF
 Cdi8rsRisL6MJGWHv/g==
X-Proofpoint-ORIG-GUID: Ii_vXS-WgSZobmO-RnMtX6KeEEgR_c2v
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfXzr3IyRJOyUFb
 dEZ/Nfza7nXC6J/e21Th9dH9bDtSJS/EB3wuPJ2B09Nc2+YWi5z6z4M0AH64+a/ucKMHYw8CIlI
 +GcMRKJVNA9mOfc+hjO4dnuiYbi6+oE=
X-Proofpoint-GUID: Ii_vXS-WgSZobmO-RnMtX6KeEEgR_c2v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100136
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118310-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:wei.deng@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:mani@kernel.org,m:brgl@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-pm@vger.kernel.org,m:mengshi.wu@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A20A573B82E

On 7/9/26 9:29 AM, Wei Deng wrote:
> The hamoa IoT EVK has the PCIe M.2 Mechanical Key E connector to
> connect wireless connectivity cards over PCIe and UART interfaces.
> Hence, describe the connector node, link it with the PCIe 4 Root Port
> node and replace the static BT serdev under UART14 and the
> chip-specific wifi@0 child node with graph port/endpoints, allowing
> the pwrseq-pcie-m2 driver to power the card and dynamically create
> the BT serdev device.
> 
> The M.2 Key E connector is powered by vreg_wcn_3p3. WLAN enable is
> controlled via W_DISABLE1# (GPIO117) and BT enable via W_DISABLE2#
> (GPIO116), both described as active-low GPIOs on the connector node.
> 
> Remove the chip-specific wcn7850-pmu node as the M.2 connector
> approach replaces the WCN7850-specific power sequencing with a
> chip-agnostic one managed by the pwrseq-pcie-m2 driver.
> 
> Also add 'compatible = "pciclass,0604"' to pcie4_port0 in hamoa.dtsi
> to allow the PCI subsystem to associate the DT node with the
> PCI-to-PCI bridge device.
> 
> Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
> ---

[...]

> @@ -1025,19 +1004,10 @@ &pcie4_port0 {
>  	reset-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
>  	wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
>  
> -	wifi@0 {
> -		compatible = "pci17cb,1107";
> -		reg = <0x10000 0x0 0x0 0x0 0x0>;
> -
> -		vddaon-supply = <&vreg_pmu_aon_0p59>;
> -		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
> -		vddwlmx-supply = <&vreg_pmu_wlmx_0p85>;
> -		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
> -		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
> -		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
> -		vddrfa1p8-supply = <&vreg_pmu_rfa_1p8>;
> -		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
> -		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
> +	port {
> +		pcie4port0_ep: endpoint {

"pcie4_port0_ep", please

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

