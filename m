Return-Path: <linux-arm-msm+bounces-113274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id BWIRETqSMGpRUgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113274-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:00:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id DA01368AC16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:00:57 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gn2Kv1VP;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=WUaKuv+l;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113274-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113274-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4AA7C3011065
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:00:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B582274B46;
	Tue, 16 Jun 2026 00:00:55 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE1A378806
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:00:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568054; cv=none; b=TAs8Qm4sWidpTFPqyql2cLYR6s4mtSveAWRCDeGpSA8OIdcSPvXekqm5Z3ydsOgJNwOQJhOHwflqu1dP+pldvdeM5Jk9KbpQxWks+CwC/m2QFrYmisjE19AphEFBF2JDiziyn6ZZGbrDY80zywvLk09REjtZ4IYfOXytIhEu3xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568054; c=relaxed/simple;
	bh=sPlwMsV02UK0G4gKr2vmcvU6v1fJGwm4rA2BCharOu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7lkD0iM2dsVpNqfX5F2NwiOIXdQvns1cBmb4/Zpm1mfXqTUmwjVTNELE3TE4CI+Xn04bB+SoTcOg2EH2VuviKhClraZNjxB+ns84zEJnNoQELDtGpUxUp2s0sZVPNzTkFlSswhGN69JuBn4JLidQEcv0kSHspxQASqd7zwJqQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gn2Kv1VP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WUaKuv+l; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIxIop781702
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Vg2K6B16Dhox4exOM6MbaMm
	j5rDGhMALYTozLTw9eU=; b=gn2Kv1VPoyQNKGRRKZXoq85Yy93c6UK7ZB0F6LRM
	Xm2yByPEYATBLP5k85s0ePBn0wuCsJe9cYXYTYQUKR990dpDVbEx5A5FXODRh5f/
	H8p6EFac9TVVaIK5XkmhUFFBkAvFQ2cqrquLxgdhwU5ULpjsiWBrZX3dE6w+zynH
	rVAAxsdGxl5MJpOlYMfg8Oz6DzfdPMXUebxxM8lDSkXHlAzHm2iNw0zcHKmrAvMv
	FERgsijPXFGYrIFIm3HSH7X0JMcr+l0nGY3jYHsl992DaMY4Y8CeG7oizCZ4xGFv
	spnVbjPRLnDPdlkuFYQTZeX9tt4d/Y+0CFElTR9bpSxZtQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etetjupuc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:00:52 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9159c4b210aso639733585a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568052; x=1782172852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Vg2K6B16Dhox4exOM6MbaMmj5rDGhMALYTozLTw9eU=;
        b=WUaKuv+lfn5lLRK0lv8gvZnep2SoZ4BStdOEoh6YMWEQScDLzgfhBc4CQeHz9jVV48
         bncOtvvwea7t7bfTb64i1k6CFMjFmRjrlHmlX62ElRN7FMAZts67mfYeZyFQG40Bk1IA
         bd4aVMV8seLyS87Csg1VUvifvnDNpXESD3h/zmgsCMCmSh/IsT460rVJzMR2CuEp5jLW
         sm/H2cYe+qlMMej5SI0v1e3yKc9VzeZzcltWKK3PtaTpUYgY2E/HIXYDYe/t1CPJnxM8
         CKuavQiWHAtm4awJe3B8lDPzNnYx87A8PX1ubmlnC/aAKm8Up9xhR5uktFSlI7iTqpRo
         SrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568052; x=1782172852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Vg2K6B16Dhox4exOM6MbaMmj5rDGhMALYTozLTw9eU=;
        b=GXlGDSkPm7dWZ/FPG69dg7IKlv20dL3CeUVSRZESMAS8a6QeOUXtDj817l22KbAZwI
         KeDWqJzCLXZGRsHV+Vh1QbaBPkeruKhpdFGIvdot8ZNhe5eeNbFcVxU27hQWZy6vaZ9v
         kjEkjKERI501XhtpDO5+x0ed22RRgkwwb7DPMRHJX45qAl0Ko/O0YJinoZGXnd1sSrw/
         3cqrN7VlwLS6mIsK16TNP85E2JymMcgH0y3SjYIzfLiQjslYS7uZAKKXiGaRP0yFi0WD
         r+TgZ4KgBlhLHfhJKs1WdItxw262JI8MjceUgQKWis2PwHT8/TC3XJTynmP8DglOkmMG
         ZRZg==
X-Forwarded-Encrypted: i=1; AFNElJ/ypNji0H8goGE7dcwAd+WHCn0Pr6rvlMzHdaVM6u+HpOfTbgThhrfuJJ685AxGCdh5nfDCyBxS18EWvw4k@vger.kernel.org
X-Gm-Message-State: AOJu0YxsD6pQ8QVcBLPEfG/It++/Vf0RrEg3hQ0Gxzakp/kKSR6wu7lg
	SmNG+HkoxB4jBv20dxY22zw8biUM1RSl1rNLaHL1Xru6KPmfqaXdElpT7al+8BpkC65kENYOsLl
	7grA9QJFa1PGNSlhvtE6+9bu8THf2YF9h4Jmn1tEzmw7sGUqjZkw53eVAdVxwxe3IXMarXWD64I
	Lx
X-Gm-Gg: Acq92OF1ZUwNVmADyIi03Tey6kwCcysMX9HQYeW6T7iDRd3Bcd9SiAj9MCBuZLt+RwE
	vUO5dSk1EuZ5LwnPDVQS1B1dmO5Pgd/WcQxK1jbDzn0EmXhKDoOlHGU3br984OxzKiT5fgcLHMC
	+uowfkprq1qGzkHZna16QxstZmmfRuklahcxUO64ruL/F22MCNClaHm9VpY66RHtICQ064k7qSr
	/qGfOVIo0lwEqOs4TYHWj21XrbidsFj3K7VYwGTfiHbwMcItXslRFurRXVvQWk1ep8JrpajjkB+
	jgQaUsZaPInTMuXpI+WNv7CjeKJl/uzKC0zXP67zySILHSQtvun9CWSMuw29z6aL0GZN8rj29iI
	PZQEuCd4BwhLWk6i33CuACxr8Zg6aTUkwU1sqvcSSRXjhSrnLHLQDzgERYwojZq8eiNKb92oX6V
	iE8cKs7dIFKATS1vZ0ITJDh55b5b0KEhQzxNE=
X-Received: by 2002:a05:620a:4147:b0:914:d65e:4660 with SMTP id af79cd13be357-91c2fe7e547mr243136885a.42.1781568051784;
        Mon, 15 Jun 2026 17:00:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4147:b0:914:d65e:4660 with SMTP id af79cd13be357-91c2fe7e547mr243129985a.42.1781568051306;
        Mon, 15 Jun 2026 17:00:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7283sm3075116e87.39.2026.06.15.17.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:00:48 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:00:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 4/6] arm64: dts: qcom: sm8550-hdk: add SPMI ADC
 channels and thermal nodes
Message-ID: <qgjntewdw2qesvkeabvx46zxcwrikvpkgthk7e2cqw7biuhmqt@2khmbjh2dt26>
References: <20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org>
 <20260615-topic-sm8x50-adc5-gen3-v3-4-216a2b5ccb85@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-topic-sm8x50-adc5-gen3-v3-4-216a2b5ccb85@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfXxxPyHn9XKnIf
 cuWUQj8ICjtO7rQ8KhJtnKyy0WoDaNo9QOORxzYep4PfZE7ubCF7TrS2SRTedIkyy9Jglo1wvXZ
 gzyqLV8VkIhFj4+mYqvS0Fl4P8kPqdqLwtIcffvi9TCdVvgyfJlXKDrywTWZAnUxwy8HRewZI6y
 EZK5lCr91ZjdxzF+tBrwMFvk60zHdDq/7Jl1gFygcopRp/pBWq/Cl+7vfYufcNYHWdTvBtV96hA
 5rIiIK+J5B4/LXSw2CkuUkzj8oBBkUECTN/fiNVHne5DwwU92klvceruzQ80CRoGkZ8aafP2av0
 DYw0f4IzkZ7TC8kqVPW6Mf05lyM5614woNfs/4lnOA6BOhIYdfqiAg3Jfb1hnhxpaVQPDFq6LKf
 CcEBWJywetPzPZBDC3FnHVvKeFouNyg43sOT54pJFi8XFQw9brIsAxSFKnj6lW7ztWc3FvSmn5x
 fHeud0E6u1BmZYkoBMQ==
X-Proofpoint-ORIG-GUID: 8oqOx3lX-mPdDvwWRYrAVnKMs6Jqxtq9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfXwxJpF2vvuFYr
 GfWsXgHiDGHhcpZn0yPTJIUrRMFneliutBY1O4GxY0rfuyWANTAqeF6cc8X2Far730YjRMLERsI
 gZRUxImWAokF9FItlizoBgsAzEQaEO8=
X-Authority-Analysis: v=2.4 cv=HttG3UTS c=1 sm=1 tr=0 ts=6a309234 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=cdGb-ScAzFlxXzt0GVcA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 8oqOx3lX-mPdDvwWRYrAVnKMs6Jqxtq9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150253
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113274-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,linaro.org:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_RECIPIENTS(0.00)[m:neil.armstrong@linaro.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DA01368AC16

On Mon, Jun 15, 2026 at 07:00:10PM +0200, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 279 ++++++++++++++++++++++++++++++++
>  1 file changed, 279 insertions(+)
> 
> +
> +	channel@747 {
> +		reg = <PM8550B_ADC5_GEN3_AMUX_THM4_USB_THERM_100K_PU(7)>;
> +		label = "pm8550b_usb_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +		qcom,adc-tm;
> +	};
> +
> +	channel@749 {
> +		reg = <PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10_100K_PU(7)>;
> +		label = "pm8550b_wls_therm";
> +		qcom,ratiometric;
> +		qcom,pre-scaling = <1 1>;
> +		qcom,adc-tm;

Does this need 

	qcom,hw-settle-time = <200>;

> +	};
> +};
> +
>  &pon_pwrkey {
>  	status = "okay";
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

