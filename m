Return-Path: <linux-arm-msm+bounces-113777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id duYcLGPtM2qyIwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113777-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:06:43 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5477A6A051E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 15:06:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=AHo7QnnR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=hA3XPCjx;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113777-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113777-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6546E3026E6E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2026 13:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933743F86FE;
	Thu, 18 Jun 2026 13:05:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5727A3F825F
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:05:33 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781787934; cv=none; b=gZdfzIRyQJzJ7iY7eNhru+QAli1HDg4qiGznWdmLII2BFzIOUsER0EhYANM5jMPGc7/RnIQJHYaMpdyeniooORYzAQwMJbhR1DiaLEpgv0LkB67J2/rHGRN3L1cKA70LIri71kJpWSdds0bMRxKZ13YFixnBqzYLNkfRNHfjOdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781787934; c=relaxed/simple;
	bh=vzILV4+h0+G1LsFLbM2We1npcaJ7hdgJ1uT/BQ+/yGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ORsKC5fWCs9eNkigknhS6ANE1yeELMjSK1Uu2V7vzsN4UxTeoOmjeTIWXiU0S0FSC03pEqHV0h9wwMzksBrZM5GZ60jmotgNiDSNDDA9KvRGAwqWP36XgL1+lJn1o1OIdvITrM5nkTu0aY5805GZWapVqYC0+ddKq8Qh5yY9ArA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AHo7QnnR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hA3XPCjx; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ICujL91878352
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hExW5q53C06OI5kfHEsByW9qflDmMT+s04jRbOB0jEw=; b=AHo7QnnR9QOcBty4
	FuD6avT34992eZifOfKBbRensUEWSFnNabdOqVHqPsJJH3Xa1d28ezcm/8I+OIJp
	dyYxbNVqdMgcwm6SjE0dBWlJOfhYo6RH33VFLRFL5p0lp0mjjQlABBepV2JWx8A+
	8QnAT0mJ6mAX3CBxEVv22oQr6lWLCJE/i+zkrHxeKiuUPkj12bCa9DkTn59Ui5dc
	eYoYOOCWMfOE5IRzN7f3Cj/rAGLmJxwAWeerRq2Af74QdyvNaxvQhQeuDpECvaQt
	EAOlR0bAyr2GUdaxqeRUSErAmzq+gsuaKBoxXum/RCdZYyYzw+IUl7wm/L6VABig
	z2GBpQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ev0g7kpnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 13:05:32 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e70409ed06so97717a34.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Jun 2026 06:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781787932; x=1782392732; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hExW5q53C06OI5kfHEsByW9qflDmMT+s04jRbOB0jEw=;
        b=hA3XPCjxDtK5dniVwqSpUhXqwTKqW3COlKQqAIzNYOXaDVJJtq5KS5cYWerz/82wXE
         aUstQ7YTzdhq0as7M+h5TV0eX0jm9/uElS6L+HJ18bNokjICkR4OKRb+xxto0xBqW8da
         vrnw+f0/570B0++uHPPEHaNJfgiQWxfMJNIVGF2T6eOqejeiJiEtXeAMhBn8dfidso5f
         2ulTtFyiEh9zRIwtZn+uD6ozZcw3qcTR4xR8mZGBB/M6pfy9JwPcrPYewdcWub/rfC99
         DYCSoD/wU7nAIW8NqmutuziG4QYkjTFOFFjK9Vxrj7nlXcWqAyR8JvSs2F7UI9z3/D60
         uLzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781787932; x=1782392732;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hExW5q53C06OI5kfHEsByW9qflDmMT+s04jRbOB0jEw=;
        b=cqyKig1hMPGMOyH7uZ8JQBMAyC+IayXKbDic6gpQbMsnHUndc7ww+U4XfauCl7jZzE
         jsA8kTb4fBmJLyJvU7Chs/yBPSmlyoSq2l8rTkjJap2BE73iJWciirnFr/BrIEWvhPyY
         7iyupNRtrscjCT54RGB528l5Im86GSLICjC6gzA20fF9wtGl/0YlsGohB9G09rXHP1QD
         bqYegKakIhO2VgT4sOa4Gy+hyhG20hhP50mb4jE5zKfBBKRBCaJ+PxAS5wgf+9ZPFUyl
         vaL7353yopmBDQLwHnAJjwlPOBG7+JLt+EIt+MGyeWHR+lyu2amonF9ifaDf/rp/RzW2
         DwSQ==
X-Gm-Message-State: AOJu0Yx++Eb2C51XCLot9bwHVhnety2AascZ1y1mvq+D178pWOwOEQ7a
	BPJESUU7N+9L52SZAySvonhEd+FMZdsAEvq56ArVmsNebHHL3NkGnGs0NFwxbLIWGwpFct6wwy8
	ts4cyfdCtNONDdF3Ipr5OXpUQUXrGFnV0AnB/HuWwtVLDO7qu0bLqQbXOZ7I7IKzpFlta
X-Gm-Gg: AfdE7cmI9AguGI3Uvhf9wxguAIdeKNi/ynz8piOrp2FEpkyV1aXx+KTwzPcKPzEmiV6
	61tzBSWt4edWG52tS3hdeDvxfMvslMUglqWLqVOpPiIukcm1ZdWHAOY1ElCRNcMDe24B/8OBJxV
	MdRhZrcrhMhRWdffVb4paOIFE7GtjGJLskc/f1rX0Sd7rJ7eobzs+k5TKaNdZrr4seTQFHLc5GO
	Jd6HNX9714o9XYRdBC64Npy7yrvodbncYqTCrqMi8zXsgAlRa7N/89sEXM+uvrYUroHslqrFPyN
	oUM70fny6trphgIutJdegPXfJysR+d1HRGffMu9iK4TvuvD9xM6UJSuogtLVoVu5gHYj7nHa/oK
	BhvDlZxfhEeYIs5YRKcgrj3mx1lJrRt9OoUE=
X-Received: by 2002:a05:6830:43a7:b0:7e6:6f9f:7445 with SMTP id 46e09a7af769-7e90c7497d2mr4390130a34.3.1781787931539;
        Thu, 18 Jun 2026 06:05:31 -0700 (PDT)
X-Received: by 2002:a05:6830:43a7:b0:7e6:6f9f:7445 with SMTP id 46e09a7af769-7e90c7497d2mr4390108a34.3.1781787931149;
        Thu, 18 Jun 2026 06:05:31 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb4b22544sm929983566b.14.2026.06.18.06.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Jun 2026 06:05:29 -0700 (PDT)
Message-ID: <71f41225-226e-42b2-87e4-2c8b082aeae7@oss.qualcomm.com>
Date: Thu, 18 Jun 2026 15:05:27 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 6/6] arm64: dts: qcom: lemans: Add OPP-table for ICE
 UFS device node
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>, Ulf Hansson <ulfh@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260609-enable-ice-clock-scaling-v11-0-1cebc8b3275b@oss.qualcomm.com>
 <20260609-enable-ice-clock-scaling-v11-6-1cebc8b3275b@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260609-enable-ice-clock-scaling-v11-6-1cebc8b3275b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfX8OBjl+kxwh2m
 iBJqJUJJDJOHAIEadGBaArxj63y/x/s6YIir4MMCE+auAzKyINo0z9BqquNHxbuNsT7EClnJZiY
 cyphIZ+7xdJl3ZOy+leO4CqNh2idUEN9Vi2AtFoYhbEEnra2vZLrPj5gtwkP+3HrwtGkCRQLPRP
 R0uYriJG2hV78X3hUyv/oGejwaw9gLy6fotTUkz3bx4YIkhkPU53CPn+OdazcfiU/gqT+69344o
 plZ2zYZLiiGoNCWsoa3FSPsG17Dy23AcZeKhiJwsH6+nOkMzkRUQuORDh71yiptuXrV3dqrF3i1
 JAJAIHexQPFA+mzGpBWTYdQZ5/ODk1RbAv0FrdiYFzYGHTr9AQhujUIJIndrXxoWJUQMJpvECxk
 KW+nwWDt57EcbJ26YY6YJHRjh2RXcBNFdK2sLzy54HgFCS7YGbziCFg/yKT8evkD5Ptc09kN8aL
 RB5fbCM1d5r6EEdqFZA==
X-Proofpoint-GUID: -RKT_nH_viZf_jg9m6P5p3CRkmLwx691
X-Proofpoint-ORIG-GUID: -RKT_nH_viZf_jg9m6P5p3CRkmLwx691
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE4MDEyMSBTYWx0ZWRfX5Cdqg1dcfWMd
 i8o3GEEkOHH9zuwKlWHN0eNDyv4MUb8egU/FCnTV2TrDx22UZiM39AaHRurbypa1Q4B41QLB2w1
 bFeuk/1mZmOOhipHajpwWsZXt7tyvH8=
X-Authority-Analysis: v=2.4 cv=YrI/gYYX c=1 sm=1 tr=0 ts=6a33ed1c cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=OfDFtJRAjKKuzGRYHJAA:9 a=QEXdDO2ut3YA:10
 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-18_01,2026-06-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606180121
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
	TAGGED_FROM(0.00)[bounces-113777-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_RECIPIENTS(0.00)[m:abhinaba.rakshit@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mani@kernel.org,m:James.Bottomley@HansenPartnership.com,m:martin.petersen@oracle.com,m:adrian.hunter@intel.com,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:neeraj.soni@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:kuldeep.singh@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-scsi@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5477A6A051E

On 6/8/26 11:47 PM, Abhinaba Rakshit wrote:
> Qualcomm Inline Crypto Engine (ICE) platform driver now supports
> an optional OPP-table.
> 
> Add OPP-table for ICE UFS device nodes for LeMans platform.
> 
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans.dtsi | 26 ++++++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 353a6e6fd3acb22ef228bee340212b8b2c300957..f100d706edde465730873702f0b0a00b44050c23 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -3109,6 +3109,32 @@ ice: crypto@1d88000 {
>  			clock-names = "core",
>  				      "iface";
>  			power-domains = <&gcc UFS_PHY_GDSC>;
> +
> +			operating-points-v2 = <&ice_opp_table>;
> +
> +			ice_opp_table: opp-table {
> +				compatible = "operating-points-v2";
> +
> +				opp-75000000 {
> +					opp-hz = /bits/ 64 <75000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-150000000 {
> +					opp-hz = /bits/ 64 <150000000>;
> +					required-opps = <&rpmhpd_opp_svs_l1>;
> +				};
> +
> +				opp-300000000 {
> +					opp-hz = /bits/ 64 <300000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +				};
> +
> +				opp-600000000 {
> +					opp-hz = /bits/ 64 <600000000>;
> +					required-opps = <&rpmhpd_opp_nom>;
> +				};

Analogous question for both pairs of frequencies

Konrad

