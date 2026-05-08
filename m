Return-Path: <linux-arm-msm+bounces-106599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIf8OU2g/WmwgQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 10:35:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id F044D4F3C47
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 10:35:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B5F58301068B
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 08:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3050837D12A;
	Fri,  8 May 2026 08:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hNx31RBg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gRvvVAtz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2CB3363C6C
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 08:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778229319; cv=none; b=Jmzqq5kr+bHSGbSxJd5dYGb4Fp33Fy/IEDWBHacv3I0qfrDsVPVmCekdRyC/nWP+oGNYH72Gd2eyDW5vcVATIWN7ruKePzCldgP126ezISGi/w62kmajrzveECCYrOtqWQNtPGoTRiW5p+Eaz3hl+6Vj/GGGffVVB6PmXIMs4uA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778229319; c=relaxed/simple;
	bh=Og43riZoLZ2jT+xZ6sRON5utsuqpu7BVFI6EALbrgnY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CvKXuKHE4TxGq6U3izZTI7v2+HKcXIiinUH1x1m7Vu5E7NAf09TquCf1BId6Excd99JRx+1tAWAkv40jozv9j8MflxGfzSFC3iaMqNdTjIKJw+gWThotFOY4s4F9y5c+WBOTP/eDJsaQgDgGsQmEAekvckfDk9kNX3oomfII5Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hNx31RBg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gRvvVAtz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6485Cepw2531307
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 08:35:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OOT6IuPBR8V22MOehqvTfPQ/05wAliu3hoYeuKhpTTQ=; b=hNx31RBg/9GPaaJ0
	S/A5yGPm1umWR/0G/Can7DpGybbk9hJUD9FLEO3emg4skYw1J6edX1ElmVb66mpE
	FIC1Gx6fgMwYbExI6VE4sBNJsziEWdKMNWeupPnTJoWeYgRXqlyLKahLea9KstyH
	5c+QQUpCWOlMYCpb9iiWHKlAzA6o92bR3r1mit6fvSRvBD0Dx96zIK45ym5nSw1y
	UFsplLxlD/0gMToWbO4xZYzbXRyLm4D4Ds0FWxjn9bAI7/80lqWBhzOBjwHEhgcm
	y1KeI4skaw3sVeZlf7ofX6kJ8l1S+Ukoipga8WQbmnkptx50zZCpv9KTipszJZMr
	LJPvEA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e10m9tgq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 08:35:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8eb530174f0so42744485a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 01:35:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778229316; x=1778834116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OOT6IuPBR8V22MOehqvTfPQ/05wAliu3hoYeuKhpTTQ=;
        b=gRvvVAtzFSmTAg50d8S17sMWIwl5PeKVkb2gScB3X++llyRuraILXPyZV982R0b13h
         bitwut2CjbmioKXDqBO12aGWbla0QwBi3d4F7FuXAVQcEhEgGKlt2PydoB9S8k0FWju8
         tSjWQxklcA0RiIllykbAh8ySphemHx5rs6/4K6U0TwdO5T5aMbu3YdQWsRUvTF1g6BMh
         lTwFh2ceavSjtHPWoQ+RJtYRzLl5xzV0f2Ko7yMnVenXQDPQv4XET1LNw2ZVtK3rAN1G
         Y+mhDsNV0L9jK5Tg2vqpsCy7Usau/F31vKZPvKW926AHY6R14R2cNKgCYXcPGNooRU+n
         r2rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778229316; x=1778834116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OOT6IuPBR8V22MOehqvTfPQ/05wAliu3hoYeuKhpTTQ=;
        b=l5rpDRE/W/I3+CjYASbE5BnlWSxKcFqPE6BBqSUg5oDqH2KcmdHVGblFahZtcfmR7m
         lYV+4X3jG7rqvNC8hEER6XTjDMa+xYNpgKam1VwBC8Qczt/KT07exxhLKhTCmcbBiR1Y
         Ura2N8JbapdIJZiaXvhPuh7y0NguSKCKhVKuHKiBMfTWAfYw/kOY6tIafOd04cxSdAKn
         7b8BF0EJavZY+DO0X8f8aycf9G5QX6ZXaI5WvGiPoeqgeN/9e56juCcf/Azg3uRbCJki
         sF4QQv8vUBaL7wcT0owp4TPA3eY4oHScNLPGQQpTDouqwANZyvVRomOkv6WbiyA3Z3M4
         GS2Q==
X-Forwarded-Encrypted: i=1; AFNElJ+91YXQhc5iG0Ig0eL8U2f4nd0o+6XB3ewcIhwTKyR/yjvVUL0Lr48F3hfGJHdz2y1tb4XWYMVNjsXhNdt8@vger.kernel.org
X-Gm-Message-State: AOJu0YwLofHjXdVQadVk1GOpForw9QykQlmsAbY/wQpOnHXuw4VoX9CR
	gHec8LlqXmr1tq8oP6VUGufTnEQzf62rjsFsc6KtHFeTkdtc5lCrRYHdAkrUxcK0eUYVYdGu/sx
	5MQy4TTxe+W5x3cSJI55nevB6RRcaF3Py7RZWMkMZVHGcHXY2EyPoRYO46nn0gslUPmTr
X-Gm-Gg: AeBDietXr8vGzHoSkMeyvfE+Bz7H5QN2IJlz+8k84kVfsegWFihyKVf8VnefwKzubXR
	f0+40O1HigM8/7nQOj/jhviIfjSlF5vmEp2IqMMh99iqCxFk+8ewvj+RAxMZhbb1mRufTWgY6hF
	tzB2/3BVycegFOelfLEsu6wE0612Qa+NjmNhrE0VOmioMUaRJf52dRgp1fhbHMemXeqFlUD1ZA7
	nvfXx71lIVQv0+fYL0R5muw48pwCv497ZuNVQoO0jVcAv3QavXGIFPzMyJ4FzT2iCLJMO+nu65k
	F6+IdfwNg8p3ty98DCWbvfePZ7Fb4CWpZfDb0+aMh4bAoM61tfInOFDy2kB2eIjNuufh299/mVS
	U9u6/lggFmLI5IrwKir9xq3Nnj1cY9OPPNy/q4l3hYEyl1N1gh0fuVPDzlB0nYzkBhKe6EK8tH3
	834c8=
X-Received: by 2002:a05:620a:17ac:b0:8f0:10b0:9e34 with SMTP id af79cd13be357-9051f3638abmr1054281785a.8.1778229316136;
        Fri, 08 May 2026 01:35:16 -0700 (PDT)
X-Received: by 2002:a05:620a:17ac:b0:8f0:10b0:9e34 with SMTP id af79cd13be357-9051f3638abmr1054279185a.8.1778229315757;
        Fri, 08 May 2026 01:35:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67ef0b4236asm377282a12.3.2026.05.08.01.35.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2026 01:35:14 -0700 (PDT)
Message-ID: <ebc94f62-6dc4-4299-bba0-329675ae7f9d@oss.qualcomm.com>
Date: Fri, 8 May 2026 10:35:10 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: Remove lemans-auto.dtsi
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wasim Nazir <wasim.nazir@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260508022912.1046618-1-shengchao.guo@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260508022912.1046618-1-shengchao.guo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XXBAezi72bhXM90LyISpe0S_QEHMexjM
X-Authority-Analysis: v=2.4 cv=VP3tWdPX c=1 sm=1 tr=0 ts=69fda045 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=5N_fG3F-Q1Bs9q6qf48A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDA4NiBTYWx0ZWRfXyFOb48098qs5
 9a/+sziZDfvEtzktbZ4RytE/4NXC0ExWa0wN7o7u6w40nEKpaJvC6WkZRiJOQ4bztlJf09Vv3EQ
 UG2sGP+JdN36q1zXJmmvmvThOtyLGmjYO8GAojxJFUM3aqEY4waOPdhl33DVrCmAGC1XZEKfZ67
 MnGTySrw7sY7+Ec95eZcKf4NRMqGFG2bCBoxJWQbvUANCVZNq1d9P7xe2L9zhRM17Z/Oc2bA6CO
 6s96dXTo5osxvjriSzaqQqmOP3fQWL6YTcdDwZlvsPDf4Pedh5z3CweVXvQkHhkQr/2zkHIcKyD
 Qv1XmG8CqG9MwZk4VawH/ItuWsuCpZE4m2u20b4t/z9PeNVK17eTfJt1g9Nq7OuoRsUx0nql/Wn
 zc7g25G/jKgmiqECO5nr5+RNABtv4IQK1s+XpxGg9Ax1kY79dmlCC83pGLB1c5nhbLcNwiprcW2
 ZL4RuHA7dXBNHJjVRhg==
X-Proofpoint-ORIG-GUID: XXBAezi72bhXM90LyISpe0S_QEHMexjM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080086
X-Rspamd-Queue-Id: F044D4F3C47
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-106599-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/8/26 4:29 AM, Shawn Guo wrote:
> lemans-auto.dtsi maintains an old "automotive" memory map to support
> legacy use cases, which stopped being supported by Qualcomm META build
> 2 years ago. So there is very unlikely anyone still running it. Remove
> the file and update sa8775p-ride boards to include lemans.dtsi directly.
> 
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-auto.dtsi    | 104 -------------------
>  arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts |   2 +-
>  arch/arm64/boot/dts/qcom/sa8775p-ride.dts    |   2 +-

So because RIDE is the "automotive development" platform, do we have
anyone running the (effectively) IoT firmware on it, or should the
boards be removed in general?

Konrad

