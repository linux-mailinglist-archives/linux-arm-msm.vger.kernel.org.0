Return-Path: <linux-arm-msm+bounces-91720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HtuOYQ5gmmVQgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 19:08:04 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7BFDD552
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 19:08:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BCFD330B0E2E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 18:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF1A53ACA54;
	Tue,  3 Feb 2026 18:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="btUPdW16";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="if8aNBAh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EF7C37BE99
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 18:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770142056; cv=none; b=cFv0JeABRslKgS8IPpTN0JJsM2ZUTKV3g7lmC+7PbH4hdQg5z0HTShCHbw2EL3ByUiq7cysln5gyg1gPkcNF8iIFSxlByJ/GUgic4VNTPbVLeENjfTlk78DFmik8vV/NymN3VPQ6PPUZo1YC983u2TVKQf5GuU+B/dJ4mKz1dgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770142056; c=relaxed/simple;
	bh=ysswifrTGHGi+M0SlAs528rnbJzQTQzj4hVwLZbdtQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smnmxwaklS/LKrhggAZQlrsY8aSngOBDSH/k88Rfy+ChhcLHNhP5UCBSQRTxIr9FzOsE4YWeWc7y+d24hdssJKcH9PJHDkhLVyNM4DDlCpzrZSIqOq1kVICOrk2/LpDecgPBOuGeAH2lLzzbveraZqjh7CxaP1UcgXaaBOSKHP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=btUPdW16; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=if8aNBAh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613GUeqt848284
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 18:07:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bCYe8baWYHiaeTRA+nDVF1LK
	QuwMCdMD3LLEWLhsuGM=; b=btUPdW16gtclOlY1M1veS93FcY/9n1CzwgFR3J0p
	aCINu69Ddj81p41B7BqPXkP1/Y8LHUoueeumbMJuq8oHGKvz8yj6/7p1BJ6psQSt
	D6sgAtIu31y2LDN48GvgGUDx7NebMqbmH+ZPMBy89tQH75JVkQYAhuDkNCkuBrTM
	ezRLcOU83sbUL6P2XbyS66n2mWCAcF92wkPBgqKr33cB4SLgOarlKIxu2N2XrjAL
	T6/iFDlhJ8oSLZ3ELyIqe/4JkrRBWIahC5sU1ydMS1OkwM0Yer7H3V86aqb1rYAp
	2c91CapisEYjfFdEvVateEL8+ArYhhkLmqg+zy1EZiC6pA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3duthsge-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 18:07:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6ae763d03so626583385a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 10:07:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770142053; x=1770746853; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bCYe8baWYHiaeTRA+nDVF1LKQuwMCdMD3LLEWLhsuGM=;
        b=if8aNBAhEdVgthY+tTN7TBWbXzz9tY/fQmdt0bKoQ1CKZAR1MznzHEvHn3a3UVXdKM
         MBdUYEzaqCljURto2hURn90OVrBSDYRbDkjutzY6St5pVgCRQOjwm3680P+bCvuQTjwD
         XHJE2CZRg9sYQcdMAKk0rWbGNktlHs0awE8lcV2mUzREA+XG3RkK1QoZpUC5/2ngHjx2
         /u7nSuYuT0vXDcRxhBxrk5qNZBci3Sfk2nu57IPG0DQj8qJ4OgP9r2wpvD9UY2LDiC7u
         EhY1JvP5//ZYFgbPSUId00e5QsoQr/xUI09iF+t8275u5uHKigY/8MdjNRVniK5Tnaaw
         3dWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770142053; x=1770746853;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bCYe8baWYHiaeTRA+nDVF1LKQuwMCdMD3LLEWLhsuGM=;
        b=JjGKuH7F7gPM+yxRMWbeWh9qJQb8nH5/53ODSdykXL1xzBx441DrIqlic42pjoik7D
         leE/zWG7Wz4AvudYE2ldKm+DYMS6VztV1+hmqrpwr65FVe7Yc85cyZwICMCnZtsTV8V9
         OEnuEsQ+jD7RQGMUTmAoZp/Xd4aRmGMsmt8f0zfDF0QgCoIRntDoPpGapJJhu0Q7sEar
         kiaUf8q1BLegXguGHulw8w6TW7WQY0PWazr0gqiu5l70HIbXRFBwmSVkp1B2reyG5X9K
         +uOj0v+TlXYy+DDpqr4CZlrb4+B7+dJaJfutB0I+9mmp202FCq5ws+oHLLrLxCHlwQRt
         nTxw==
X-Forwarded-Encrypted: i=1; AJvYcCVArQc4hh3B5wDCXFxbVf/ncTMmriXQMAg4dVtRnLrFssLU15YHmTpHylpOqx/8U3Dm5k1pVEQYOkCIAhy5@vger.kernel.org
X-Gm-Message-State: AOJu0YwK5exocPx0iAWsjJBpz4ePiyD2usrOqFBE6Ansx6u9OHfqOoZ6
	pxtXP2y2N4zrhMynptkjRv7l4CqVONY0iZwKADUu39jzGdIRv1xn5rmVwFceqZlVM+Ck8kL/WLD
	6goUEayfUm+kwMkuWuaLA+lSSjyyQRWCx20NBXnuFCKSefQFWnk1Khy0D6wO8PDkF6z2a
X-Gm-Gg: AZuq6aIFRTmlaM1sN/3yI6Od95NrO1uHDDcPNm378697Qxwnf+KXu+RDfluIUh2rLQ1
	rxuVJMMJqya3b90U1h7tuifvKHWD8AZiRRsSPpfoprsh6PGMttFhuBuB6K/xcQJE1sfbOYRKVYG
	WyVehxCDiYN3T46pcuHovqCpcgcJLzet/YYG8o5OuJsiVV+T8SYgegmYgWnWxEg3aDIf0N6jrsm
	h7r3+QbYmAky6rcg9jGTy8WKt5ZB3ModiWHL9+3bJygxxQTgK/Fh0rb8rAah+vFCmRCYu9F2Sb6
	XP9K2Fit+svbDKvvy7Y73+XQPfcEoohjgogJO0MSyFQ1asPzF2ykhRokkQVwtMTAfJy/U6AWO7B
	PYVgUxY1DcVEYs5TIkzvIUBttFFTvw/zoKcrAn0XLzRr3wLefyCWI+X7EUO/k2AOqkWgwILFAcS
	B7kdGJsjMKjs6/C+0azKwq5QE=
X-Received: by 2002:a05:620a:4720:b0:8ca:2cf9:81a3 with SMTP id af79cd13be357-8ca2f868aa7mr63421685a.40.1770142053272;
        Tue, 03 Feb 2026 10:07:33 -0800 (PST)
X-Received: by 2002:a05:620a:4720:b0:8ca:2cf9:81a3 with SMTP id af79cd13be357-8ca2f868aa7mr63415785a.40.1770142052725;
        Tue, 03 Feb 2026 10:07:32 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38691f6e8f5sm434471fa.6.2026.02.03.10.07.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 10:07:31 -0800 (PST)
Date: Tue, 3 Feb 2026 20:07:30 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0
Message-ID: <xn3hnqb4ltgvskigtknc75ajsbotbv4saxmd2bduf2wychukhw@ar7kowcf5aum>
References: <20260203-industrial-mezzanine-pcie-v2-0-8579ed6bf931@oss.qualcomm.com>
 <20260203-industrial-mezzanine-pcie-v2-1-8579ed6bf931@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203-industrial-mezzanine-pcie-v2-1-8579ed6bf931@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDE0NCBTYWx0ZWRfX3Q56K1jiaAn5
 zpNhIp5j09qNmsbV2+TEdDKfDBOD3jxjdhlDhw7L7P+JftTu5IipQy6uRI0XuS6byydDFT7eWUC
 DZ8i1bu78G2B13L6wU4TauHATk5sxj/8GUd5x2roRO9QJXtoz20aLTzuN6M1uJmWjX/TQVs6dDW
 34kBd6x0Of/O9/wXJqpCDqE48SSCJSvRclOH3CmOju8CP1Eh3I9EeRZ96x1QibNZltTDZLUEPsg
 kvPKWjaCPyzNhkV7QNp705SdohB5+cQP9ML1+boa1M6Ob4DlRKlEjRRQA4RmVsBmXfWjy4+Ws52
 cf6CnMbvnIJtCO3+5QUPmMqOaTHyRiEpvNLpsh8fmVSHvlY7w5NrnmHB2bWy7t3iRmWxzoE+Jq8
 Y30iQcZJqIZRRxZ1m0jJWhrwZkE8+j1AqEPercHqzX44iRWkN8vg7PDl5kTwsJBecpzEKngZKu+
 ikMUZjByqrpjjxov0Bg==
X-Authority-Analysis: v=2.4 cv=FrgIPmrq c=1 sm=1 tr=0 ts=69823966 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=s8K9wjJT6DSqSZ3nDFIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: FIJ23kt3vposyutj8GTmRimwR8qYMSCu
X-Proofpoint-GUID: FIJ23kt3vposyutj8GTmRimwR8qYMSCu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602030144
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91720-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7B7BFDD552
X-Rspamd-Action: no action

On Tue, Feb 03, 2026 at 10:01:28AM +0530, Sushrut Shree Trivedi wrote:
> Add a node for the TC9563 PCIe switch connected to PCIe0. The switch
> has three downstream ports.Two embedded Ethernet devices are present
> on one of the downstream ports. All the ports present in the
> node represent the downstream ports and embedded endpoints.
> 
> Power to the TC9563 is supplied through two LDO regulators, which
> are on by default and are added as fixed regulators. TC9563 can be
> configured through I2C.
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---
>  .../qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso | 138 +++++++++++++++++++++
>  1 file changed, 138 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> index 619a42b5ef48..89bbcab0908d 100644
> --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtso
> @@ -5,9 +5,47 @@
>  
>  /dts-v1/;
>  /plugin/;
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/clock/qcom,gcc-sc7280.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  
> +&{/} {
> +
> +	vreg_dc_12v: regulator-vreg-dc-12v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_DC_12V";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <24000000>;
> +		regulator-max-microvolt = <24000000>;
> +	};
> +
> +	vreg_1p8: regulator-vreg-1p8 {

1p8 < dc-12v

> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_1P8";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		vin-supply = <&vreg_dc_12v>;
> +	};
> +
> +	vreg_0p9: regulator-vreg-0p9 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VREG_0P9";
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <900000>;
> +		regulator-max-microvolt = <900000>;
> +
> +		vin-supply = <&vreg_dc_12v>;
> +	};
> +};
> +
>  &spi11 {
>  	#address-cells = <1>;
>  	#size-cells = <0>;

-- 
With best wishes
Dmitry

