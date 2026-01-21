Return-Path: <linux-arm-msm+bounces-90005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kN3AMIfBcGnzZgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90005-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:07:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3050E567E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 13:07:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 953CA9A2955
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 11:50:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6888A40B6FF;
	Wed, 21 Jan 2026 11:50:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ADq7dq0I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BUEu7RYd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292CE407595
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768996231; cv=none; b=KotyKQHmyqwFrvVqzIFrZNNDbox2A4W+6NsC9NIROTbQ6kHflCs8z3UUFhPk3gIq8XoKCJRByYktMje0SOEvfWe5W/z2qtragcACULnso4xsDVQabvksHLh12EI7hPCPBxLv9eigakVmFvyVWseld/p5OO2hxv7crpsKnjR1QHw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768996231; c=relaxed/simple;
	bh=AcnHz+YEbhMZrb3eF/ZHw5vnaNb//oOZmIqA6ylkY6M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gLttTqR7lHsajUcW/n4/4DNbkcXLRcYzlrCLkjhvNrgibpQ81nluZa7OCZUz6XeI3mRmkBEbwYWdTN9Sg9UPTSGdj5ZENIQYTrOcWnr3Iba1z2dWNbmDVQJ1r3eymDDcXUEabl/Y+7PrM+mGkZEERbwTk6Yu5RCCOc6wWagLO30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ADq7dq0I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BUEu7RYd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60L8YZJh2065747
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:50:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9SLqEIDpNRShWPG3vGqyKlNb2m6iu5UFw+srphCD9wI=; b=ADq7dq0IvmYe+BBT
	UQcf0p0oGL+9p7LanlFYl3TYDxQ/4Ory4teYl4NaYokaJgDkosOEJsksTwf8zgJ3
	np4RrWNnyzlbx+ne48hr2rQB+gbYc1UyBYvfZ/R6dOcDoOJPNLQvXWBit9/JqtaS
	swBF+ItdPeNs5QLfpx5FEm2fVjYlOhbKz/wszXngjplMVpTN5pKgUEx095OLKJVa
	oWGdp0yfzn6F0XgITH14hUrZQZfHXzjpfy4hSpYEyJZNKM+3Yn4fjx/a+m4/Pr++
	ukD53h95q8ETZ/CcbYSMInhQk3Azbi1pBMNewnxlaenavpM0YnC5fgocMT3GUmw1
	3QkkSg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4btudp0vdu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 11:50:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c69fd0a87bso408834385a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 03:50:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768996225; x=1769601025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9SLqEIDpNRShWPG3vGqyKlNb2m6iu5UFw+srphCD9wI=;
        b=BUEu7RYd1FsN3DCCkpqUZva7kjsskDrHu+qVqZ0crQQvhgj/pchnerDec/8/gyTOn8
         kWY/p/7I3qixPPXq1HV+0d3U+LCi/wLDttiwy11JDllhFPAhmKaiwW+kfuNM81VtxxCw
         FF8JuEf7fMvjHQPFrFt4uPYzQpU/L4LhZEVOrQhoNQDbOJGRklKGkOWptCWieSdYL/RL
         4/E9XCHAd/rv/3rzz718vUxg46Rqyu1UHgN6mjRtP5eDO7D6BuDI8flBRX1kxEGm2oRC
         TUn75p+e+0cqY1x0bJ8i7QG0ollcPJqzXHoHlysawsfF0990X13MrAFshb9TRs4oy40l
         6CXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768996225; x=1769601025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9SLqEIDpNRShWPG3vGqyKlNb2m6iu5UFw+srphCD9wI=;
        b=D4QgOHYuBEAe7/rjmQGgaUcB6EV0saC2neWD7hmijYWziIY1PXRmGsEyB7GQJEze6C
         fzEJ0PkoEhVId08maO97BgCamwdCXaWfGY6U1wvEXoBFctpqC8JhboocXE6yVMLJwPWf
         aoCLYuqsYJt0RRdDbZnmiFzDS/IeIaMYkDbtxQjih4XddObcPY+IKa+Zaj0XHybywMda
         ejnYdPyg1jUVP2ztnWRc0XwFgu75yQRNQu+HxK1gsprQyhlOIFD/oXsoULo176DHyUlM
         q6f16lyzS6JKEAiGW4R3uqvEidlfsz0IShW0CU3NGvzb1gA5B6plsFm3wLETtYuD+7yQ
         js1g==
X-Forwarded-Encrypted: i=1; AJvYcCXYyHSFfXkzuITRjqOca4oEOcZ+ni5ZJt0AZaScKMfOxmvIF/aWJhL5BAKPpKQyYbTTVT4TIHXD/ypxfMh9@vger.kernel.org
X-Gm-Message-State: AOJu0YyI38reEOm8oAQfMGS5nOjZBJllhy0DStQwRT2+73PpSwcSk2Mg
	A8UmOuNqW9RREYVCCI7kA13UVYVwhkUQuGuHfrqJFAWC7ZjLxSqJoadQkBKboRT/7zzy4xMurQ+
	ziu1JqLYTDxiCI2S/XsyzDB5GR7GUc59z1AdrksDbxV2rSdo5L3VMNW2oOJySPaOO7bv2
X-Gm-Gg: AZuq6aL7bjOxodNnG5gyQzw4T5kx0q+3o3/dilunK/JZA+NkA3VslOjoYOzCW2Ctv1s
	HOxtBmvmnLiVjXpQ69bqdQi04OSEBqMBUYxbEQSg1P8V39Pis3G2NOMkWPnNWrBU7sr4QgSmSOd
	iZQcDXc3HufXTDLMKIGW8nk4FjwGUwWedpFUrEuU8Sij+QPZHOwYy2Kgc6ztt+iydNSa/hBi4WU
	2YPvjzteQ4e42RI3ojkQ+8ihCq+IYSwbp0+6Zj3RvGDJxbu/rh6w60UecY8XkcgVF6mvXnKsp3x
	mWuexoaptePBrMjmxP0eaGjyj8MaDxPKofWeG4OyTGsKLWf38j2G8Oo2ZwlNQzyKdmiXaJF4P2D
	ghXPvl+u4IPf6bXFJfrM55nH3E77LdREdFrrIUZ/Y+PGbDU7Lnk8tT0nZdjJLqUXn9jA=
X-Received: by 2002:a05:620a:e05:b0:8c6:af70:22bb with SMTP id af79cd13be357-8c6af702446mr1263291185a.5.1768996224931;
        Wed, 21 Jan 2026 03:50:24 -0800 (PST)
X-Received: by 2002:a05:620a:e05:b0:8c6:af70:22bb with SMTP id af79cd13be357-8c6af702446mr1263289485a.5.1768996224486;
        Wed, 21 Jan 2026 03:50:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795168e6asm1648458066b.22.2026.01.21.03.50.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 03:50:23 -0800 (PST)
Message-ID: <300f3ceb-546b-4670-a0ae-4a6f451a7f4e@oss.qualcomm.com>
Date: Wed, 21 Jan 2026 12:50:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: milos-fairphone-fp6: Enable WiFi
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
 <20260116-milos-fp6-bt-wifi-v1-5-27b4fbb77e9c@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116-milos-fp6-bt-wifi-v1-5-27b4fbb77e9c@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Ri9N1OmIR-vKJw5Gtyshd425iOJmgNPz
X-Authority-Analysis: v=2.4 cv=DJyCIiNb c=1 sm=1 tr=0 ts=6970bd81 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8
 a=Ae2tQB4DPc1jRJoPbowA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDA5OSBTYWx0ZWRfX56k0NXHxDQIW
 czaOx05Jh17ePwX2rReXB71kcqyEtj7S1e3pDhL6Kd2hN4jZhXwosSpDZghoJJaPygM+bi19pwA
 aZ7lPOxx1Ksso6G8QQhSUCSl6L2QS4nU+jcqM/hNG38eWXMOfU9hfM+F52RMSQC4forqq16xZIQ
 VnSomiTrhd3reJJ3X1kzdnVLigvTFchIozTXDv6tYj9VZuetqXthPNEMQn8TdRv/VriT+2JKGwq
 +XDxDFtzpEjQQGo90eDaSaMmNnmUllFLJZvprzpQA/LKeUMn0s6icQngJVOr7CEqOSAOn43TXMj
 AMbxMIIzM/h08CY5vYekyTj2ny7EKp1eY7/NdwvWts8/+G73W5B81mFNzO/Owc1HaMHeEJss/uC
 HNwCu78FotfNV1R3xvdwuGdKqf9atz6+G0Kti2ZZ50hOF6x+wHjMd5nMMkbnu3OiHSlUQ/4pFoo
 KsmjRY8tYHgVoFDlUQw==
X-Proofpoint-GUID: Ri9N1OmIR-vKJw5Gtyshd425iOJmgNPz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601210099
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	TAGGED_FROM(0.00)[bounces-90005-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[fairphone.com:email,qualcomm.com:dkim,dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 3050E567E9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/16/26 3:50 PM, Luca Weiss wrote:
> Configure and enable the WiFi node, and add the required pinctrl to
> provide the sleep clock from the PMK8550 (PMK7635) to WCN6755.
> 
> Thanks to Alexander Koskovich for helping with the bringup, adding
> the missing pinctrl to make the WPSS stop crashing.
> 
> Link: https://lore.kernel.org/linux-arm-msm/DBF7OWAWQ94M.FSCP4DPF8ZJY@fairphone.com/
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index cbe1507b0aaa..75f2b3a3e572 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -232,7 +232,7 @@ wcn6750-pmu {
>  
>  		clocks = <&rpmhcc RPMH_RF_CLK1>;
>  
> -		pinctrl-0 = <&bluetooth_enable_default>;
> +		pinctrl-0 = <&bluetooth_enable_default>, <&pmk8550_sleep_clk_default>;
>  		pinctrl-names = "default";
>  
>  		regulators {
> @@ -704,6 +704,17 @@ &pmiv0104_eusb2_repeater {
>  	qcom,tune-usb2-preem = /bits/ 8 <0x6>;
>  };
>  
> +&pmk8550_gpios {
> +	pmk8550_sleep_clk_default: sleep-clk-default-state {
> +		pins = "gpio5";

I'm thinking how to best reflect that. Perhaps gpio-gate-clock which
would be consumed by the PMU?

FWIW PMK8550 can reportedly output this clock from GPIO3 and GPIO5
(not sure if at once) if set to FUNC1

Konrad

