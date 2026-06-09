Return-Path: <linux-arm-msm+bounces-112007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Xbm5Bw2sJ2qm0QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112007-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:00:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B026A65C90B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 08:00:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=FFgkSY37;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FrVJrGi0;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112007-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112007-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 33F43303E04C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 06:00:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D063C9EEC;
	Tue,  9 Jun 2026 06:00:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA9730E829
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 06:00:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780984841; cv=none; b=W780WGkrBjBM5BvQhGQiHC9EZdSfqvkIcObWnd9+MqtWIsLyil+qvEdX7XjKwZE9/Czwq47Go9YytzRbr5J67akTVVF7nCZQDIOOIchxAiqu/yo81LAWZF+akBlCGgGFVd7kiU6g0JWWjBT1qhZ2vY9lPu+0VprBk5jMATsInFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780984841; c=relaxed/simple;
	bh=XCFNabTCGm6+aNwyq3Zcm8Kst3gcwPvZSnxtnxvQNXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OBEH7ygYB/iS4obgGoAetdpKNscg4LONxlhklMgDq2W9xfgzfEkKj3ZvC7UO7Xxf1YMN5+T26B0CoCvCySZcO/jGu3M0ql9fW0X7RXxkO4pQxeP25yLPjJXl7YLtxoqbCpRzHblZv8JPyLzqgnaFzTzHN6DFP4i2DVS4o0oZ2u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FFgkSY37; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FrVJrGi0; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593x1Np1061838
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 06:00:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KBhl3HDQ4JqBELbVnf8aJYjqulp5nH2X2j4Fgm26b8U=; b=FFgkSY375OwDfE1J
	239NMY4mRzvvsDK3bk9JhCC5S9vJyLJDJY24NWDN9VRUXRMfYoY1mknbA4gu7e6u
	s/P2LIdkrL6ofyKGIOfcJ6h4Hrn8rECC85kjAklSca8Pur+H7G//XLk0zc0K8WmO
	SXXrR53MtOXnakOZC24ptUtjGhiFJ7yC6fnFZsQykOIQJlFaioqvWZyvDlCVJh1O
	HydCipFy8lkJ7GNSifxf25ktnZdS2dIDkkgWzJsdKuhdrUcNZIf1hozyJ0mMjRJ3
	MvqBku46CCK7Qc8AGkHzrjXeTWHMzIGZotiSf1k4f9iBaRr7ZOol6nyPNsr8/Dq5
	SE9fsA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun44nw9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:00:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36bc54005a7so6979539a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 23:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780984839; x=1781589639; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KBhl3HDQ4JqBELbVnf8aJYjqulp5nH2X2j4Fgm26b8U=;
        b=FrVJrGi0Y3yekaHSoBwQSnLULgU5uFGzKNZsLBn/vF3M2l9V78/gQ8ZnKT4xvkfDnx
         ymaTPjmJv2GV3N8ZlJ+5XqEw5z0LUDUqNxO8vAvCifowSG9tg6rnjbMqnY2hlQZ7gd1J
         hh/yRjwCSm0zLBqHUoTkq60XNAFwo6z0LiFrbFv2lE2lNEYr13pN5EKYlIXR4jUlInms
         mlM7M+GiE030HrBbA71nTiwxTaIcohngYiKlkR60VlOeG2FJtRNYu0ykkT69Tb0QzxI0
         mRWC4xWQW3EiZhe2UrE7g+7FBIEfp+TlmZGowcXv05Pur+i+ne6LznrP6fsWoUWGI1mE
         Eczw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780984839; x=1781589639;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KBhl3HDQ4JqBELbVnf8aJYjqulp5nH2X2j4Fgm26b8U=;
        b=VzPNBSqtDc4n7EJNGFhogn4ZVGrAQmRJiRCiBAHa4Cvy/ytQwghjTTdo6XwVetmrC5
         4jBevainC1mI4n6xeIM9EXxJIwMFtQ35zDuZCt6I6r7tR7+xpY6uXvFlSAW+oUjeGjan
         UVTD1JqY3TgGxf0XLjV53bOtmwVsSyMytAQ+dT5de7YTM23W+ny21fBZAJPiMPXTB8+x
         uXa3xvdMxCAE2A8+DeL5s8pCu81bQoQPQAzSEWKUF821CUb1zO72pZuzOYnasefwSYB4
         x17d7F4iiABNaUQCJmdYAE1Eo3v9D5+WgsQy26jcDobLlS81gFYLH2LE/DgKmN8oVhdz
         rvXA==
X-Gm-Message-State: AOJu0YyOzLCo1ebyF3btcanM0EbYlzVZjaCqpH6ZUNsDln2WSdzBHjkw
	EBhUZkVPX7CR6WrGgXWxtLfHwkV3efEvKJZuN7rHgbN0gxo2X6jHF7TPkUOjrhYylH4rSBGJiBm
	AJtQQpK/4LBzyBJXTHj/JQkagyKTsyOCssUo3ay8hnEPLGvXREM3j5MwXV9CIepaLwLRJDDdo2S
	+7
X-Gm-Gg: Acq92OEvfuj0pP8VAb/LhsSzxTRVAz+DIfze+PtmATDu3yPyuMipDegWhjF4R6ffWGo
	p9xOWx9qaGuCqDrCYntjnqBA0+KcUekIIOjH81j3voQdp7Dn3nGu7nRMNjCtwPpacD8I6hqVOiy
	BKDkbvsA51OUvdSGZC4tmJHiri+hUyHXo2lkrFr14sU1r0eW7vhYpeZg41avW43J/aiR3LiXi8u
	fX5J+EuMmdbmWUKJHmF9vgvMb+yRvqWnq1N0xoc5gJLrqRRqSlhWvtKzunufwMCXXZHAUKKV9Qt
	P2xRED+AB1RV/Qev9JYb8IMOYlKZM+byiWUoLJoj6HRZMOZju2O9vOztG9O5uYtwNKRiY0iCmKY
	6Yya/ICm/rOfZqURr0yEXJSkdmXDjooED4LgX1aOa/89xeomeICWZn5tWKfs9AEAC
X-Received: by 2002:a17:90b:6c3:b0:36d:b9c5:e8f6 with SMTP id 98e67ed59e1d1-370f0481909mr21011700a91.19.1780984838792;
        Mon, 08 Jun 2026 23:00:38 -0700 (PDT)
X-Received: by 2002:a17:90b:6c3:b0:36d:b9c5:e8f6 with SMTP id 98e67ed59e1d1-370f0481909mr21011660a91.19.1780984838305;
        Mon, 08 Jun 2026 23:00:38 -0700 (PDT)
Received: from [10.206.105.200] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f710ee4f3sm18653141a91.13.2026.06.08.23.00.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 23:00:37 -0700 (PDT)
Message-ID: <400ff1d9-1d58-880c-8004-271bd7023831@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:30:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 1/2] arm64: dts: qcom: sm8250: sort out Iris power
 domains
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>, Jonathan Marek <jonathan@marek.ca>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260604-iris-venus-fix-sm8250-v7-0-7bd2f0e5bae8@oss.qualcomm.com>
 <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <20260604-iris-venus-fix-sm8250-v7-1-7bd2f0e5bae8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA1MyBTYWx0ZWRfX4MbpfD3sNm+2
 tDNI3QrDhgQn3tE9kjfkRmpC8aNo67Rf3nkSphgLn6fo144oFXhcuGLzgelXush2sqKs0ebVlHX
 6n9DQQ+KxYAYqNDmxu03FnvMAP7VWHvxbiV+sfLfmCro6ILf+CxPf6tn1v1PPMSndD3mfsrBreN
 SWqtY612HtvUXA0Y25oTiCFbQhG9fqlGqYxc6aIlH3BtP5RPly2SV4vzGjgmmeM7r3eijipffIQ
 afaBgrcpYM1eF5C+IPPVv5FUFWgVSqK6pROHr85wzFfA0uYT1Rqw2+l80d6gfZP5Oj0gpr5OSNu
 PTZFOapoSU8jSiPI05z/hCLpJT/8Cj0OC5vtJQa1RrnuzKN5wUPYoXY2x121opjWI7VScLKXotG
 JBXz59R7q0qO69wsNBfzN1JcuqktEWNX37pMKhGrc3u0XCvvslNyv9XupndmqArnjYaQNimmBZm
 JgfNwk8jPFYr/CobUIA==
X-Proofpoint-ORIG-GUID: prMJV9bPXXHlAF2yE8Y2r7E2vMSnkLGF
X-Authority-Analysis: v=2.4 cv=ZY4t8MVA c=1 sm=1 tr=0 ts=6a27ac07 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tk4UjENVHhTGfG5vr0AA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: prMJV9bPXXHlAF2yE8Y2r7E2vMSnkLGF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090053
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112007-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_tdas@quicinc.com,m:jonathan@marek.ca,m:rafael@kernel.org,m:bod@kernel.org,m:vikash.garodia@oss.qualcomm.com,m:dikshita.agarwal@oss.qualcomm.com,m:mchehab@kernel.org,m:stanimir.varbanov@linaro.org,m:abhinav.kumar@linux.dev,m:hverkuil@kernel.org,m:stefan.schmidt@linaro.org,m:konradybcio@kernel.org,m:bryan.odonoghue@linaro.org,m:dikshita@qti.qualcomm.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-media@vger.kernel.org,m:mchehab+huawei@kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[busanna.reddy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,huawei];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B026A65C90B


On 6/4/2026 9:52 PM, Dmitry Baryshkov wrote:
> On SM8250 Iris core requires two power rails to function, MX (for PLLs)
> and MMCX (for everything else). The commit fa245b3f06cd ("arm64: dts:
> qcom: sm8250: Add venus DT node") added only MX power rail, but omitted
> MMCX voltage levels.
>
> Add MMCX domain to the Iris device node.
>
> Fixes: fa245b3f06cd ("arm64: dts: qcom: sm8250: Add venus DT node")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8250.dtsi | 20 ++++++++++++++------
>  1 file changed, 14 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> index 7076720413ab..6150380795b8 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
> @@ -4326,8 +4326,12 @@ venus: video-codec@aa00000 {
>  			interrupts = <GIC_SPI 174 IRQ_TYPE_LEVEL_HIGH>;
>  			power-domains = <&videocc MVS0C_GDSC>,
>  					<&videocc MVS0_GDSC>,
> -					<&rpmhpd RPMHPD_MX>;
> -			power-domain-names = "venus", "vcodec0", "mx";
> +					<&rpmhpd RPMHPD_MX>,
> +					<&rpmhpd RPMHPD_MMCX>;
> +			power-domain-names = "venus",
> +					     "vcodec0",
> +					     "mx",
> +					     "mmcx";

With this change in place, the backwards compatibility for the incomplete
SM8250 ABI which was merged from v5 in this series, which handles the return
value of devm_pm_domain_attach_list(), will never be hit right? If so, we can
remove that piece of code from the driver.

https://lore.kernel.org/all/20260209-iris-venus-fix-sm8250-v5-2-0a22365d3585@oss.qualcomm.com/

>  			operating-points-v2 = <&venus_opp_table>;
>  
>  			clocks = <&gcc GCC_VIDEO_AXI0_CLK>,
> @@ -4353,22 +4357,26 @@ venus_opp_table: opp-table {
>  
>  				opp-720000000 {
>  					opp-hz = /bits/ 64 <720000000>;
> -					required-opps = <&rpmhpd_opp_low_svs>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_low_svs>;
>  				};
>  
>  				opp-1014000000 {
>  					opp-hz = /bits/ 64 <1014000000>;
> -					required-opps = <&rpmhpd_opp_svs>;
> +					required-opps = <&rpmhpd_opp_svs>,
> +							<&rpmhpd_opp_svs>;
>  				};
>  
>  				opp-1098000000 {
>  					opp-hz = /bits/ 64 <1098000000>;
> -					required-opps = <&rpmhpd_opp_svs_l1>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_svs_l1>;
>  				};
>  
>  				opp-1332000000 {
>  					opp-hz = /bits/ 64 <1332000000>;
> -					required-opps = <&rpmhpd_opp_nom>;
> +					required-opps = <&rpmhpd_opp_svs_l1>,
> +							<&rpmhpd_opp_nom>;
>  				};
>  			};
>  		};
>

