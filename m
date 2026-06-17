Return-Path: <linux-arm-msm+bounces-113629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4rUsJBiVMmq/2QUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113629-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:37:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC70699C78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 14:37:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nBJGnm+B;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="DmAA/v0A";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113629-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113629-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7E9BD301BEC5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2026 12:37:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D7C3F9A1E;
	Wed, 17 Jun 2026 12:37:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7D03F7896
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:37:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781699857; cv=none; b=Li+7O3YK5+fv4MH6d9mXIV6VdPnGWNEm5cf3HPggg0xvIb1J7Bis57fv0+0RSMPvvJAv9tycPfrFmVWlM91jYKPNOvaHYqh+7jRGxXwjI3I7IJs96T7g6vtzkoz0l6PJdNpZG3Jd7Fs2Nst2pLIrgADa8waeKs/7f3sNWnUteA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781699857; c=relaxed/simple;
	bh=XYs/oadJQqChAK/QzTrw5RRoV1X9xRPmSI1lX7f6q3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RhRpg2iDKt9TOeZgxuaGGWoCjULgiYfKxdl+I14wB1+0MK+Nnj71SzAU9rbMSvTPWP3IuIyKpNaiGgJASkLk2jSajmvS/hGDZOgQ2Grawi3EyeqFYbC41OJ8WkhWFlSqodRjt5twWELeyMhaQyByEIO+TvQnkKyRQOD3DLOlCMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nBJGnm+B; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DmAA/v0A; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65H8V60n2291339
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:37:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DorGlPjOBR93ED2pENry4c/2qPs9HOj8ceWaJguAAAo=; b=nBJGnm+BimSKT/at
	X4G66KldEwCD4sZKE4jqWe1JlylGCMkNMXzG7/H82hXZ4ksJqQJlBWskJZ8WYGm+
	bcYhmHDmA2Vh5elHy9otdqwohSUIXWy/u4STRiG5vLFvuJaHtIU5OUE9wUJBH3p3
	YOFoYN97RNPqA0Blxma1CDmmOIVjN3xKsCcC4Rwmou+Cu7TJFfSGcjei1EcYG/NC
	6MCn/WuOAWQorDeAalkSoYTM/LXkjiYPC2W3TKGAFFdvtblMCUrp5fAgfK8QH5eQ
	yT7hNHyYVfcc6iCwVlfctPm2jKDKslDig8X7NR0W3GjHLi6DStN6l+0wtwe+f6PN
	dXUf5A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eueevk66j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 12:37:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-915732517cdso27043685a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2026 05:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781699854; x=1782304654; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DorGlPjOBR93ED2pENry4c/2qPs9HOj8ceWaJguAAAo=;
        b=DmAA/v0Az7lb9cmHBbUfxG8yNaqPI68BEtoRrTOXOhXFZqotJaZIS00o0vg0HzSEQc
         R1sAkwjBAKBXITjp4TTHo5IHFeGsBuJkmZcPPFEF01jp12VvCpSORmimcCesAoJTF0BJ
         Pp0Ma5Pxl3LXfKk1m3HO6vWhwB6nSnjd/qNCnwjQK8UWd1raO9/cygwtAi6/5whVaDfF
         KN7EPmM1Ef2PTsMFcQqgw5AWsjrpEaJX1xTeRNWyR8Zx09bnUw7EDRmA+Hc+DaJT/J88
         WoHWNkvsl88BHwT/OBwv6R0NTvWkAUPWB4wfS8jiiIdzFLVLWE7ePtm6K9O6L/3Ws7XO
         j+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781699854; x=1782304654;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DorGlPjOBR93ED2pENry4c/2qPs9HOj8ceWaJguAAAo=;
        b=UPlYq47LLrVDX8GMPi1WFAuRXNOacE5LCbXk6CpMjfUiVf55uAQ6hNFyFQSP2RZ7On
         xopbf3/dwO5mSn98MtXjdXU6QXvlT395IGkWXyrtE1/Ika9iHKaVQNBxucDbNct3MKMz
         m9dxL0cZdAU99GRilvPKNeg/+JR/mtwCNAXptppfrDkjEpQB4qdn9OtFgVo7ufrFbyby
         c3mxhgj8lzVM1kVLhboksf+j3ynaW2C4g0eu0jFDfVOYf2RBIMCfEBpxvru2Arn4y/G1
         N3/1IDOclhn+pt+a2jyknA2G74DZBK6uTc9AVKOK9wI/5xWnaYPMIsaMcqiE75LEi9wN
         SAFw==
X-Gm-Message-State: AOJu0YzL0cTtu0pfZfofrS5i6lQ8Nw3QOom/p64fMJomzzR7AlpUDNBO
	9utjcUp6b1AMbBwMkwNMYWEBYkcGcYx7ONcXTNzsFNognGyK5kPh5KH0qPYRCdQ+XtvFZJ7P5AL
	BOFCkf3Nc/fUHXFefpZLeY9YDBwwRBLXKo1u1YLgjyFZAWU9aqtBiX3zIDbWiTE3XByd7
X-Gm-Gg: Acq92OHEgupsiLiIHtvJK+sGFq0nVX9VtdHwolN6PhoFxC7UdKuGKSVAZGHPxBcisGB
	ybjGwbef1IEsrZVpVF9hY78zIQqxLRsEG8ibuxaIhuQurR+6WgAaeRRat1GYaRlhzhnAh8s/5G3
	2O1nQUIZsa87sCd67l2vURva3fkz/6f3tfZUrCi7+ZVb0uT2WIF7dB1617Seo9jpBxRvIqhIyFO
	kbVwQqFTD0T8By3ZgEzuH2Fqv9Hu5P39u7Q4B8n82sYHvPwskHd5ejXGKPhNPkhZAmdBEAUYCad
	UDKdJoTQc7i7BKe8i2gA9QcxvHvMP3nMN58Mug91CA7gsrYCFQh4yIVv0Xc1UD6c9siIPV/DDlM
	AAsGV4ioWDTkc28kVTu8g/AakexDwAcJbiCE=
X-Received: by 2002:a05:620a:19a7:b0:8f3:5988:f97c with SMTP id af79cd13be357-91dbb8439b9mr292637485a.3.1781699854478;
        Wed, 17 Jun 2026 05:37:34 -0700 (PDT)
X-Received: by 2002:a05:620a:19a7:b0:8f3:5988:f97c with SMTP id af79cd13be357-91dbb8439b9mr292633285a.3.1781699854018;
        Wed, 17 Jun 2026 05:37:34 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb44209f0sm794849066b.6.2026.06.17.05.37.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 05:37:33 -0700 (PDT)
Message-ID: <97894905-dd0b-4bdb-b0bc-04486631327d@oss.qualcomm.com>
Date: Wed, 17 Jun 2026 14:37:31 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8650-ayaneo-pocket-s2: add display
 nodes
To: Neil Armstrong <neil.armstrong@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        KancyJoe <kancy2333@outlook.com>
References: <20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522-topic-sm8650-ayaneo-pocket-s2-display-dt-v2-1-cdd4b70e5a16@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE3MDEyMCBTYWx0ZWRfXw+ipEC3k5Vad
 BIY7YVDtlaSRtyJSg9qsq7yBg/7sbcSCvFOPoUYH+YntEuJLXJdwSYx59TahKayk89JkrI6ljYz
 P7AS+ipEnlJWpoToSRbQ5YzXtk4jCtNQJTCtDJghAMxnSyoQqN3N5NNr3w4eJdwfC0tnbDWAnY5
 YvX1Cb9/6dAJ+sWBr8ENBtqLZlXmzIlSKB+0lsdEcF4Rsn19prmDyDYpmH1sireAHvgLaaE97/Z
 AUIDHf8qr0STxvBQVe4LGH1pFf5IlmIq2xtMoBccbnvIATMy8BXp9Cn1ZaeE67UAMnwAi746Cr+
 61Ys0xR8gj2NAWClDZoNqkewD7I4SjpDULGzCOsiGkgDYiIkh9QXt+op/Wy4KsN4bY3e47KuvlZ
 syRZgcHP1Q2biLpzr7kG3cZwujfsfKEKbdxIFolRFL9zh/ESE+3gt/d02cHlm2fJ1UR/PsjW71A
 i1NTXrrbtDWl5nAr5ZQ==
X-Authority-Analysis: v=2.4 cv=LM1WhpW9 c=1 sm=1 tr=0 ts=6a32950f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=bC-a23v3AAAA:8 a=UqCG9HQmAAAA:8
 a=bD1lVzg5nK0LGGNu_iYA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: JyEaUsuA68cvxgkVPawi0KB6Rrlugin4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE3MDEyMCBTYWx0ZWRfXwE/Righk6k3r
 8rd6pcruT4504FKKm+PTx7vX2LNguMXjw+47OQIBTkoaGAu4+HAKdXHjtnQkhjr+AlyUhzGv2jo
 woSgglmtWPY8zIRr86SaLB/hURH3vHA=
X-Proofpoint-ORIG-GUID: JyEaUsuA68cvxgkVPawi0KB6Rrlugin4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-17_01,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606170120
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
	TAGGED_FROM(0.00)[bounces-113629-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:kancy2333@outlook.com,m:krzk@kernel.org,m:conor@kernel.org,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[linaro.org,kernel.org,glider.be,gmail.com];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_CC(0.00)[vger.kernel.org,outlook.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,linaro.org:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,outlook.com:email,vger.kernel.org:from_smtp,msgid.link:url];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,renesas];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2EC70699C78

On 5/22/26 3:15 PM, Neil Armstrong wrote:
> From: KancyJoe <kancy2333@outlook.com>
> 
> Add nodes for the dual DSI panel, the SGM3804 regulator, the
> SY7758 backlight controller, the touch controller, and enable
> the GPU to enable full display support.
> 
> Signed-off-by: KancyJoe <kancy2333@outlook.com>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
> Depends on follwing bindings, all reviewed:
> - https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-r63419-v6-1-16edddda9951@linaro.org/
> - https://lore.kernel.org/all/20260521-topic-sm8650-ayaneo-pocket-s2-sy7758-v4-1-73c732615e4a@linaro.org/
> - https://lore.kernel.org/all/20260522-topic-sm8650-ayaneo-pocket-s2-sgm3804-v5-1-bd6b1c300ecc@linaro.org/
> ---
> Changes in v2:
> - Update for bindings changes
> - Remove empty line
> - Link to v1: https://patch.msgid.link/20260428-topic-sm8650-ayaneo-pocket-s2-display-dt-v1-1-ff132c00d076@linaro.org
> ---
>  .../boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts      | 241 +++++++++++++++++++++
>  1 file changed, 241 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> index 0dc994f4e48d..af890e76813b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8650-ayaneo-pocket-s2.dts
> @@ -220,6 +220,22 @@ upd720201_vdd33_reg: upd720201-vdd33-regulator {
>  		pinctrl-names = "default";
>  	};
>  
> +	sy7758_vdd33_reg: sy7758-vdd33-regulator {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "sy7758_vdd33";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +
> +		gpios = <&tlmm 163 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply = <&vph_pwr>;
> +
> +		pinctrl-0 = <&sy7758_vdd33>;
> +		pinctrl-names = "default";

regulator-boot-on would be my guess, probably also on the other
disp regulators


Konrad

