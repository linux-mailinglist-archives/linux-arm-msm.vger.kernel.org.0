Return-Path: <linux-arm-msm+bounces-90008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JC9DKvBcGnzZgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:08:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F87B56838
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:08:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B3E577ECB9D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:52:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7629935FF76;
	Wed, 21 Jan 2026 11:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DSooDCE7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KeyKUl6C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCDCC36213F
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:52:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768996359; cv=none; b=SS75R5A7X1oABEDmAftKgPhYJHMlij1hCTM296wqLzUAxvRZtGfgojz/28P6VMPE4U+rPK4YPzoO/n39Ww1yMHdkJAhof/4uklPsJbmZYztzYFmQ4aU5dsVaHZ2Z3BGuoFNddK73EkxWex+I1JDjNBbURxoUu9/YZONlrr28aHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768996359; c=relaxed/simple;
	bh=bem0bfrRQTgaBeBEiyF43CC07n5PEtOByw9yids7igs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uq6QdBoDqUvJFgPBwM8YBSKQETKWKDUR09pF5P9zxDhZuaCorSz/3vzQrDDrdLhdgGPNDL04kqm4K+cQxNc3aa3az6Hxni/BbVJudqExd4TD1FEuqV0KyVSpEMAtzsIycjjW9iY+WbTtrWeXRvZVAfFkeDWqhoJoKD1cKxDmlHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DSooDCE7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KeyKUl6C; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L9esV2824254
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WTYa+f3wYBqpXDNppZzKHLZml9UqEGFmkda50YQj2s8=; b=DSooDCE7aykHzjYy
	r+fgYVz7j3DsyFNuMcPNBDZ7CRYR3OCZu4FZWj+T0VfGTg9J5DJaQtm04lwY9iug
	z/ZYs8K6qowvy7SnvPLtAQ2R+s6JTpAb5l73dzrCHpwVmaWyncDfrOQngexy0LyZ
	MjRnBJZdo59JpZM07g/8cTMS96wjM4XK65Fz8bZNC4F+f+1kb3WP+516crqM90iu
	DEk0qc1dj2oO/u5Fj6oy9krAxLs4Wp7XDG8v6fgqSH+RNpuEZJ8NTTdk3MTtictA
	ezL6HbcOQJVBXhIlf+zJU66w4XE+11Ik0wzvt1aKyoSexw2/Z2ZS23nbb6EngMPS
	6mECHg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bte5e3sjq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:52:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6a182d4e1so156170685a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 03:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768996356; x=1769601156; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WTYa+f3wYBqpXDNppZzKHLZml9UqEGFmkda50YQj2s8=;
        b=KeyKUl6CQTzZLifyV/ianfWBQ4ePnUQC3HpABs8VY1YWT5GFYILOBgxOcPL2rp7f1e
         yh5CkaxGKqcXdVICkg4/5CB0DZn+XU3kyk6VyacBkVfZ3qR3wx/v/B+rCHK8h3DUjmBQ
         webCR1Cs+EtUim8yf3WzMkRxsLfD2u3aXpOc10o51G6Rb4EGn/hx02DlssvIAyLnQMHe
         UjVIQQGNaYZK9EF8hyKok0ibUCxenU44fe0lAuH7oMMPC2gG8pQHsfOhh72eGWa/d8gd
         aybocmOcbrIOHYHY1pNXu2fjEijptQriU/t7AFsUqVywhGNfzsiIIodtlDX/0j23cR9V
         gAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768996356; x=1769601156;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WTYa+f3wYBqpXDNppZzKHLZml9UqEGFmkda50YQj2s8=;
        b=YRK4yCy93duz7/gXeZtru0qUegL4GeJq27LeD1fofud53KFVLkNIBb3qe4q+ACsYRW
         NWk4Coja4b2ZdfwnT/aQHFj5QkELm4J1sLLj/TlN42hh0XIgqvUyiVS6cndhCy9uTiN+
         uPe/LoWfBnyIOl8cuXWtEs2o+PXEL7VCo2LdZqETZPzWOCDXkxqVcrk+BL1KdzQdU2eE
         O8B1OS4oswiJjsKqZ1xMpwysLn8U9F2jYszbyDe1zB+hrMOZC1bfD3PSvvClU9MNMBzT
         dF/y/7sQaNsHtxtLWDXpnztIf2Z/ECBBOMzz26DOuDi92bz9LVldxoxgQ6AVcSmUE7J4
         KHmg==
X-Forwarded-Encrypted: i=1; AJvYcCU1dpUAW/K396T36kDDIAdPodN+v021Pkag8TCnNHh9MrK1Im4nceGyO0K/s8a83gXD56gFXQyaa9Mp8k+5@vger.kernel.org
X-Gm-Message-State: AOJu0YxjBLNd9fGsuWAh8tm3ktpG4ZQHNj8rzzTeXeLLszgTs8d6ryfr
	nIyvRtQKv09dZHLwUmgepKEJk+SUCNdT4gWdbJAr5kS3ntTffKSsmIFivR8ojk8T0/FGW6nXKS2
	hab53AXjdu+71dVtP14+kslJm7yGzf+tsJTLLNod/NXNOhPXSER6nhR8KVMgLzwYP3T2w
X-Gm-Gg: AZuq6aKAs0jM+tmrYAX1cxYcEe8YIa10u2S0tnVANVZoS+onKOplMCBv89FYFLYDZk0
	m5WYIO6ZqCb29/MePjd31XgtHuzbaQxuvMV0xmppQH9srnr+TkZUbsQr7jXhHFgVNt6H5ey97GF
	e4mbw6iJMeNJyhm8blb4chYpaIRzq8w6/04925jSiV3nZk+hbC8h8JUqTGKKLPCxJnmdLo04NlG
	IGo7m+92KPfC1+ubhv8H5PAHKCk47yx8G3unjeR7vDz7ODMFbQR0NdAwvu9n2M+XAZ1FvdJ7za+
	U8a+pyjlOsv2lIsEsvn99v3qwXAxStp1Cya0pnnLrvb+ZGonGLqVuEVRnapbIlYTy4AL9Ikv+CM
	sNoPbIP0qN0HnYQOEBBWKUwoYfvJLiBQUBdkm8qHG0L/9lWpGq7ip/9l2oxEmbzMrStQ=
X-Received: by 2002:a05:620a:1a0c:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8c6ca4312d5mr557420085a.7.1768996355855;
        Wed, 21 Jan 2026 03:52:35 -0800 (PST)
X-Received: by 2002:a05:620a:1a0c:b0:8b2:ea2d:a5 with SMTP id af79cd13be357-8c6ca4312d5mr557418285a.7.1768996355411;
        Wed, 21 Jan 2026 03:52:35 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a31322sm1582859366b.63.2026.01.21.03.52.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 03:52:34 -0800 (PST)
Message-ID: <52fffc84-2fb5-47aa-835c-b0dd8c110d59@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 12:52:32 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-milos-fp6-bt-wifi-v1-0-27b4fbb77e9c@fairphone.com>
 <20260116-milos-fp6-bt-wifi-v1-4-27b4fbb77e9c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-4-27b4fbb77e9c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BKa+bVQG c=1 sm=1 tr=0 ts=6970be04 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=HUUA1PmjzNnBZvILnA0A:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-ORIG-GUID: EUFVAFZ1mtzDNkpgThG07h3OuF9deOVF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA5OSBTYWx0ZWRfXy2UoE0Fqw28i
 mG3JH1FiR4pbX4sqfs3lCGQoGK3E64BHEzODdDgR58t0JEzj7ZW0azmTsRHo7PIqTplSzS+bb8p
 gWNaZGQ0hBd2cccU9uC6z0qbBf+Wrzc0/6qXWDQZQHPfF5SUl+/YgIJ8FviuhrXUT+Q9R3ULfNt
 +YDPnxVisjciG2v1L0c4/sM923nxw29pCfmA6DFdF5fpkBVBhMWyITkoa+Ux1ezhR8XJN5xoPH2
 WF/qoTj9LwRWGbcYzZJm9HfmM7QUo7GsBsY2ZkZIDMVvyh+07Die4pjMB0bovDx1O0vCwm6yY2Q
 /3skznEL3SgMv/Lub2QyapqlvWISn/MZX7U4/RRVOx9JmqlI63DJV8kABaYQTgL+znei6w3skDw
 YYOW+++EcgJQRG/JEhIVPVG393zon969rS1XGM+rWTwu0qCgZ06kKm0v+XK1v/Tvi0r51NKQfmW
 QrfaRcd7oDzD9W0lEng==
X-Proofpoint-GUID: EUFVAFZ1mtzDNkpgThG07h3OuF9deOVF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601210099
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-90008-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,fairphone.com:email,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9F87B56838
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/16/26 3:50 PM, Luca Weiss wrote:
> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
> parts.
> 
> Thanks to Alexander Koskovich for helping with the bringup, adding
> 'clocks' to the PMU node to make Bluetooth work.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 174 +++++++++++++++++++++++
>  1 file changed, 174 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index 52895dd9e4fa..cbe1507b0aaa 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -24,6 +24,7 @@ / {
>  
>  	aliases {
>  		serial0 = &uart5;
> +		serial1 = &uart11;
>  	};
>  
>  	gpio-keys {
> @@ -215,6 +216,67 @@ trip1 {
>  			};
>  		};
>  	};
> +
> +	wcn6750-pmu {
> +		compatible = "qcom,wcn6750-pmu"; /* WCN6755 */

I think a fallback compatible would be in order, if the data matches
exactly

> +	bluetooth_enable_default: bluetooth-enable-default-state {
> +		pins = "gpio53";
> +		function = "gpio";
> +		output-low;
> +		bias-disable;
> +	};

Not sure if we need to drive that pin.. perhaps a pull-down would
suffice?

[...]

> +	bluetooth {
> +		compatible = "qcom,wcn6750-bt"; /* WCN6755 */

Likewise

Konrad

