Return-Path: <linux-arm-msm+bounces-98320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OAXuOLU1ummzSwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-98320-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 06:18:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 401BB2B5E3C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 06:18:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 816A53032670
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2026 05:18:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44A5035B651;
	Wed, 18 Mar 2026 05:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G5mhAI9u";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fEafNq6G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F4035B655
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 05:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773811088; cv=none; b=TTybvDngDidhNiJRIVydLOlxSoWPkJz5BJa1mZ388fpkyaJBnb6f4aSQNDEUs2EuSlW9xHWCToQb4dfty7EEM/kCgOADbWmrxkqQrfY6ha7s+e56koGKQ5YCJ6i4n6zjbglXjIKshlazJ2l90wEEVtnLqxTfL/Td0Dk4j5F5O3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773811088; c=relaxed/simple;
	bh=TSqTxmuR9gruLC5O+82/noHagn8qSom33KsPlr5F4Sw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=svIID2PcLnRzvQ8ImlP5jCcH0BMxbt6hTGFVFSYAMOuv1TeQBvpJ2HgDDLGyXEJqDpZRigNtwtQZo0oR7HE53YJtQHlEVGWtpa8U7b4jyCoU57U2FPYDFgiVFP8yn9zWf/OyBS4F18DfWi42dRyYdWRv4EGfNytlYjqmQeH0IUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G5mhAI9u; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fEafNq6G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62I3Z2kZ2294071
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 05:18:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	y2mg0QR9TLwLOfpBjSlWxmbc0ej+1lkkURV/8z0MaEM=; b=G5mhAI9uG0Tzu7ki
	8gUUaMnulXEaMqC+G8Pb28FcAiuPp0Z/Ipw8GcE2b4p9NISpKffPi6qlti9AUe4r
	mB0gt9UfUxMNwBXdthWF7l3/ERWv4tsVSG+ndraW0AunP6ycESWrE3UqMl+JunDy
	gYjGy5dvNmpIxKleC8aebj8qrNPuHBBYA9G6ibopIMcJTXuN//auC9J1zHTzZ2H+
	hxmjSRKM5n+/b4s3jqB36PIRdAo0kLD7mg8+N2EyFQtKRynBq6ml4nqjZAqOw5tc
	kEFYv8Ejd/R1Zl0N71TQAt3JFR2KIT2hcgMqZfn4hc7EWeveN9oMbniSL+X+rMqv
	IbHCRQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cya83tk9a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2026 05:18:04 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0554888cfso46581195ad.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Mar 2026 22:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773811084; x=1774415884; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y2mg0QR9TLwLOfpBjSlWxmbc0ej+1lkkURV/8z0MaEM=;
        b=fEafNq6Gp8aGRft3ZUA+ANiNbGn+XPaWwdrMCJ5QmQ2nhsDJJikjLnte23nLDyKLwG
         FnHSjrMJdU5/jOSzmmSboHUKqfZjbeNFyH8TiZgxaBOFyO2ZLq6ejyvfYyM1V7uTuDd2
         UNMLCsi1yROvZdJZrlVp/g8nYrvEbLgHenpyZsSsWJ2skHBE4cd55Sru913jJtdWalPm
         Edgr4A84FrVvHnfFRPCaDGPtTKaUiEj5wEwtf2srKF1/3JkkMsdOn7+gf++5q4uPFjZ1
         MPySGB71lBvUyOHHQ8a1EC+hXJblRqWCpSs0zDgZJlJLlsqQkfMER1dvovxuTLYoeDmQ
         FCng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773811084; x=1774415884;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y2mg0QR9TLwLOfpBjSlWxmbc0ej+1lkkURV/8z0MaEM=;
        b=Rhz66YDLQ+Mm3D0dwWjbNg7UcPvv2MG5SW8EljcZX/V519TXYc1TkDjUY/GjjkPk6I
         4JSivRHTK9FQRvP3/dwgD2lGMfb6psT4Tbkrc00gFQhnlNUqbt5+F8rae9ccVDpTB8Wf
         WSpviNslShVVdqvvyILke9JzmI4ye/575UJRu3vz55K7P0ZfdgRyaqoBH20ICO/o5ida
         bbYRioHfwrXrYM2xxDzGhmWF5sgM6Ni/5ZekVKDqUxRarDa9hpCrHokYYGDF0nXiRDMN
         ODsTwdLgn//iJumgSi5H6omg9BdmiaPTIMUrwW/k93O+ts8jMjpUvhJE2Mobybm/xJxC
         YbIg==
X-Forwarded-Encrypted: i=1; AJvYcCW7K2v50q8fcTryc0X6E/1u6SHN0lujF6h5fnGJLyisoptfzds4bvMPa1znpePCrV9l8ZCHALmNzeBdR7zj@vger.kernel.org
X-Gm-Message-State: AOJu0YxYA++8SlMdns0XFgbHWqUDHrOp1zk4KAM79xOcTNN+7uiKI0v0
	WQL8HHwADGmolG9lt9GpmN86e7CX2t+DGD/ALQ6Sg4C28DKgS+TPXi2BKAldNh3JIhwH7jwQTve
	yFR91+e/LMG9trPEGOLx+leGeLEemYSnqgDe89A6gLcJiwYOibdlKketCTmwRoWH6qj8i
X-Gm-Gg: ATEYQzwvUv0pswYtOWAMNe7dw7PhjdbEhBLabQoRhXnV8hK9WZkHFaBklYC8b62EPUq
	2vBqvCPEdhJnoVChggveivYxAZWgzUbjBEmL4Lyy0UKVjsfjxw4Y+/OYhZFwiQvBibfnd05WBrD
	8i61D/P6hpdLAFJO22WkK/VsFsKAmcuuqtFcYIJNb/v6ShW8mS055qFoI4Zh0oXsPHznZVR38X1
	WWHqNj+Ts2xoUUzS/yE7cpTi3qiC94s4nPvM1Lf/JT1juvkqCfSL21pCqep/TMYPcELvB10BydD
	EojqZmc+wDwD3eIjTJrhD/ghG66OMSfxDY+TqlB8ModtMTcqmuPajBsGeI4JnbIZV52ZM8rEFyP
	2FSadaYvDYevfSNqZMKaN1jia6izutm8XBJtO09CzTY205OLOgGxJCw==
X-Received: by 2002:a05:6a20:9f8d:b0:398:7a05:f0b7 with SMTP id adf61e73a8af0-39b9a000545mr1828048637.58.1773811083973;
        Tue, 17 Mar 2026 22:18:03 -0700 (PDT)
X-Received: by 2002:a05:6a20:9f8d:b0:398:7a05:f0b7 with SMTP id adf61e73a8af0-39b9a000545mr1828026637.58.1773811083429;
        Tue, 17 Mar 2026 22:18:03 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.118])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c741e0b3359sm1221112a12.2.2026.03.17.22.17.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 22:18:02 -0700 (PDT)
Message-ID: <27f25b77-3ddf-2f5c-f118-3dd3a27c2368@oss.qualcomm.com>
Date: Wed, 18 Mar 2026 10:47:57 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 6/6] arm64: dts: qcom: sm8750: correct Iris corners for
 the MXC rail
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260313-iris-fix-corners-v1-0-32a393c25dda@oss.qualcomm.com>
 <20260313-iris-fix-corners-v1-6-32a393c25dda@oss.qualcomm.com>
Content-Language: en-US
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260313-iris-fix-corners-v1-6-32a393c25dda@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: TpEFN6b9w01Mb3M9pe1cyNpGBD6suXCN
X-Proofpoint-GUID: TpEFN6b9w01Mb3M9pe1cyNpGBD6suXCN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDA0MiBTYWx0ZWRfX6ITqgjQyNrzp
 Q+O6unAueXiFIPwKr6rHSuF1meblhqelG7+5zIPwDpQwe4zVpmLhKIy1uf0YTJDeyA/CvxGCi7c
 8owhNg0P2p+qbdn13Usz3/iEWWdLMiGKtCHewTCVJA4W6nooTGjnWjnU8YfGAac/U8R8zvF716h
 eYVO02N1lb2lUMXBl8+rgB/BnGvjwnNydASzH7ExVqNwVWw9mlZs8zevOLpnHIgkiQjCqj3YtDK
 05k185oz2tRQnCEwEUWzMzOwPfYkUSHwT9qlKFiHP1XwF2H8DXvvZJfqDSUGryOC+BmKJBcC1tR
 5rFbV6CsUr9p4P5vDE11TPT1WOHZTz22P/5mr0jld66aJxM9SR6+z6jchfGS/7KW0LsN9rDQwsZ
 LK4QyiQyyFH+PCnp92UETqg2T9hbrrfu5B3YnMNq7XtpdUzPnbecnj0bAQWreS/kBkii3UeN1Rq
 MV79MSUv+Z+NzlpKoCA==
X-Authority-Analysis: v=2.4 cv=Y8n1cxeN c=1 sm=1 tr=0 ts=69ba358c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=RgczR8+8wRjDfzPIf2UjDw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=-AVdbO5R1FNXJZyXHBMA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603180042
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	TAGGED_FROM(0.00)[bounces-98320-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 401BB2B5E3C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/13/2026 8:57 PM, Dmitry Baryshkov wrote:
> The corners of the MVS0 / MVS0C clocks on the MMCX rail don't always
> match the PLL corners on the MXC rail. Correct the performance corners
> for the MXC rail following the PLL documentation.
> 
> Fixes: c0d11ff90475 ("arm64: dts: qcom: sm8750: Add Iris VPU v3.5")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/sm8750.dtsi | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> index f56b1f889b85..f34f112d3aa3 100644
> --- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
> @@ -2945,19 +2945,19 @@ iris_opp_table: opp-table {
>  
>  				opp-240000000 {
>  					opp-hz = /bits/ 64 <240000000>;
> -					required-opps = <&rpmhpd_opp_low_svs_d1>,
> +					required-opps = <&rpmhpd_opp_svs>,
>  							<&rpmhpd_opp_low_svs_d1>;
>  				};
>  
>  				opp-338000000 {
>  					opp-hz = /bits/ 64 <338000000>;
> -					required-opps = <&rpmhpd_opp_low_svs>,
> +					required-opps = <&rpmhpd_opp_svs>,
>  							<&rpmhpd_opp_low_svs>;
>  				};
>  
>  				opp-420000000 {
>  					opp-hz = /bits/ 64 <420000000>;
> -					required-opps = <&rpmhpd_opp_svs>,
> +					required-opps = <&rpmhpd_opp_svs_l1>,
>  							<&rpmhpd_opp_svs>;
>  				};
>  
> @@ -2969,19 +2969,19 @@ opp-444000000 {
>  
>  				opp-533333334 {
>  					opp-hz = /bits/ 64 <533333334>;
> -					required-opps = <&rpmhpd_opp_nom>,
> +					required-opps = <&rpmhpd_opp_svs_l1>,
>  							<&rpmhpd_opp_nom>;
>  				};
>  
>  				opp-570000000 {
>  					opp-hz = /bits/ 64 <570000000>;
> -					required-opps = <&rpmhpd_opp_nom_l1>,
> +					required-opps = <&rpmhpd_opp_nom>,
>  							<&rpmhpd_opp_nom_l1>;
>  				};
>  
>  				opp-630000000 {
>  					opp-hz = /bits/ 64 <630000000>;
> -					required-opps = <&rpmhpd_opp_turbo>,
> +					required-opps = <&rpmhpd_opp_nom>,
>  							<&rpmhpd_opp_turbo>;
>  				};
>  			};
> 

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

