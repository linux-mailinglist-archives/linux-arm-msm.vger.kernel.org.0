Return-Path: <linux-arm-msm+bounces-105817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLyQDB8f+WmV5wIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 00:35:11 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 336414C46DC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 00:35:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 277C83008FE6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 22:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D3A7386455;
	Mon,  4 May 2026 22:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LWc86HU1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gFLGuhsq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE6637CD22
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 22:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777934106; cv=none; b=Q/mlAlRJZrlXBFvxSkM4LmacAu5gFp+sVdnOK3BjDUBMebC3vB0hem81V6K4lP3EvuitCYiXsn5cSHdt/ieNVK6/WK3g5MVHbvGtc8HESqJIVTEtM9i8L5HvnTnktO51tgbDwhW7UcgQ9bWBUkYB23WWKgyg9eupSOdikMXAWRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777934106; c=relaxed/simple;
	bh=rt1E0QFnkxfnptgvlnG73puBASDaeFdz8fWRDtSHGb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WEPp5bE5DNa5rxHnHYeKl5miP+g5rlIyu8kzVb2P1pe5OvDu6Cs+kz9WQx8AByonwvLJebcoSr16BFmVHG+jhU9onT6ey6qQblB92j6V2jHuHH4ybg4Y1tWg2DXMqczeHY+ZSF4dL2pHcQDJleleHn+9cJouMNpr4XMMAcCUDnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LWc86HU1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gFLGuhsq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644FOt781346410
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 22:35:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=juJhpaeQMcQi31hFdx6qlzW4
	XzhmmQ078AV4wwuafy4=; b=LWc86HU1TQOHm6Tr47q+r2OoS0I1MJae8PI/tItK
	hNLZdlQi2vCxu1MhXZ0sv94FOMC+6vYZapMOxTmuLoXqDt4hVvgwQcT+qnPC2mwb
	C6OLQ17mcig1bBKmuHDn/0kuv4lgZHKhZSMgmNo7sJpZndvjFxwPxznPahLoL2uz
	htDPkvN8oSkcIeN29zboLgodjaDaUw/GoZR7adDY26SF3hWJPYDmbE/HEcKn3muh
	fFKPDQednCd7qo/RasMOcntx6Cx942b+B2oWFPmQT+RP14y3Y2t8L92vMsPk8CdC
	z1FJHdGmnxVj5QqQ9a3Jpt4S+DO9C+rkjXhZcZJcNYh+hA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dxx2x9g6w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 22:35:04 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-62d5a79af7cso6121781137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 15:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777934103; x=1778538903; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=juJhpaeQMcQi31hFdx6qlzW4XzhmmQ078AV4wwuafy4=;
        b=gFLGuhsqOoHN7ITr8lLZPdUi1zMF6BfF/36X5uKPaA5u49N/S91dcEpDtwVE82VVil
         HXZgnJu95sPD8ikRCYzsVkU/XuQPp8qVHMrPYOTM+gYuEoYqXVHrXXtPx5PCNiMbT02/
         NNORf+inndSvhedhZwUSPHmZOorwvG2fOwOvN15+xMqquKXBI2vdt90N5QV2zI2qq6q0
         bokX1bty5v3DIBJLxHEWf1dUnPL0im/zmUSrU4M2T55Xkyq7QVamylpAU3hnlONH2Mz9
         rPRB7+7aNVPxxOcDZY7Q1R6vdE8VNej5IZ4iFnUb06cHF+DzApuAtbHlu2xWvXb2Gnxe
         WTxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777934103; x=1778538903;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juJhpaeQMcQi31hFdx6qlzW4XzhmmQ078AV4wwuafy4=;
        b=a2WYcGnZ7tSfNzwv5gIROVPQnXmPRXqbh4JIntPRvFEyilnVeGD/BvT2H/FOlLqJXp
         7r2+oQSt3wpFOq5IrSzLYmss+p9uOcV1Lp+aT5uuOzwa3revK4RgJWOCpuVLfx1XZ3o+
         WeMXZSfDYPoTcHELSDN/YhR8Ogi/rDaL+jMqXb3C5JpEhdQLYN7UEODhbb2ynPQUxZBR
         J2cdrSRYKNp7llDT1GH1HUqoVKDzDG1JL2vMSeMzofvFbl9yPXdz426GjoV06LzLfoIy
         uZf0clOUozXUgtVpu41wjIOYhM5bknDdHLwncKt5Ru7jk6WvTqD6aFoOj1AfvOQsAF5r
         B1fw==
X-Forwarded-Encrypted: i=1; AFNElJ/7+mR2nP/SV80uF/MmVZl7UCb25Zsyh19dGVoNHHmoISYjhh3mOHWrs7dl3ocCBcTeR1DqyjafwB9brRgJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/Nh+ei7GDDCzaBSDOOpIrSI/8FKbvOk7DKOk1zcgxiNdTTRWw
	2QWYFWq/ItWvWaeiQerFZR76JDjSuyUhZf9EeEDK5UURGWz3ItG8qEFpwcU/TFdOOf9tnw9CqNw
	7IAsYyISD3qvMAc8Y51pELkNEtLeE3xqUsC4Yi/9XXMdBDagF0VGYaRhTD+ODP3tLLV6y
X-Gm-Gg: AeBDieu4mcC3rFv/goi6C1CwxUgCyusWOYKxxRW5thSrcbzHcP/k4O9F+YfcY5t6d4t
	0YF/wZopOMc4IrWT/rrRKLkwEtVfIiWgABapsuuafwPNtF4J7l2AI9mhgt+JkLhejQDpOMRqsMB
	UTeftuoGZkhZu3671oaRlkANrhl7P7TnFAUh0KnyNUGFrN7KRczy7gwiiL72EkgMiBs62Bla5GR
	hkv36l9pdfbD/Kq1XqKTrPo1JGjr0QvikgoWc1RcztYX+kWoz9M0TsMTebfRjrt9d/5DgTo3xn3
	wPKanmQjdZjagC54bsNEI560YZsyXhNbJrlna9Hvm4whSRtsSTGxYNaC7dtOoWq34PCRmn4BwIf
	D4r6RpdspxE1nWxr7AX36iRsxm+xZ5IlNo6b4kuwzWtlsJ2FtPwyFLzTkHRdm+p6RKuqrhhyU5Z
	QOfDzkt54vc68mi8pENz8GyrdZPLXuGHVm3mFikaDpTB1adg==
X-Received: by 2002:a05:6102:1606:b0:62f:549d:ad1c with SMTP id ada2fe7eead31-62f549e2478mr1356219137.17.1777934102962;
        Mon, 04 May 2026 15:35:02 -0700 (PDT)
X-Received: by 2002:a05:6102:1606:b0:62f:549d:ad1c with SMTP id ada2fe7eead31-62f549e2478mr1356195137.17.1777934102388;
        Mon, 04 May 2026 15:35:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393a11fcf41sm12255651fa.26.2026.05.04.15.34.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 15:34:59 -0700 (PDT)
Date: Tue, 5 May 2026 01:34:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v2 3/6] arm64: dts: qcom: sm8550-qrd: add SPMI ADC
 channels and thermal nodes
Message-ID: <nbs7rqlfukx6jq7aoc6r6kw4tjoloqnaclxtm4bm4vbwhjcxe3@nkcdrqjppgbo>
References: <20260504-topic-sm8x50-adc5-gen3-v2-0-5cc04d6ecda0@linaro.org>
 <20260504-topic-sm8x50-adc5-gen3-v2-3-5cc04d6ecda0@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-topic-sm8x50-adc5-gen3-v2-3-5cc04d6ecda0@linaro.org>
X-Authority-Analysis: v=2.4 cv=U9eiy+ru c=1 sm=1 tr=0 ts=69f91f18 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=6TFKjZ9nwxz7Y4waD9oA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: kuiEsS5NzATMPpCsaete7kRnoUSvj_Ev
X-Proofpoint-GUID: kuiEsS5NzATMPpCsaete7kRnoUSvj_Ev
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDIwOSBTYWx0ZWRfX8th2JxmHKhB3
 n6iHu4rOQHJi1wmQGTrqoOPu3NJKU1FiRhat+cyofUq5/234HG5LWeOPrm8uBGIVkKNM8k6IlOH
 6FHtEyQcJPeXp54p2hUWQS/Cb2d8TNiULwjKkONQfJik3sTH+o7YyNI3SywQnWdIO2X2X9VEau5
 UxSMFdkqi6wSh2+Jv9z1+DTFwsoYAS13NlZNTMlQ3fR3qvEBm4HkJJfzOwkRDx6WS6Bnz06lglm
 4HQ7Zc5xO6965MQ75kq/8noLqR2R+cQQQ8y0Bwze6iGUyUjksyDXjb1aO57xTQ30DAVcSO1hLeJ
 zPDmBWvOzCJEWjWkEyjJS5Q7ov+VJI74v+5cL/bJtdZK/qJccxsM3byfxah+P4s8hJmtMjfV4Y7
 +fxeb7Ghuymbh5PV/rUacpw99qYOq5Q+9M9rSDbnMzBukpV30LBnsDmOdUCtqFqULI0a6ScXbGw
 3xioz6tlq239SahZADQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040209
X-Rspamd-Queue-Id: 336414C46DC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105817-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, May 04, 2026 at 06:29:51PM +0200, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-qrd.dts | 279 ++++++++++++++++++++++++++++++++
>  1 file changed, 279 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> index 2fb2e0be5e4c..8405cb9e0d6d 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8550-qrd.dts
> @@ -17,6 +17,9 @@
>  #include "pmk8550.dtsi"
>  #include "pmr735d_a.dtsi"
>  #include "pmr735d_b.dtsi"
> +#include "qcom,pm8550-adc5-gen3.h"
> +#include "qcom,pm8550b-adc5-gen3.h"
> +#include "qcom,pm8550vx-adc5-gen3.h"
>  
>  / {
>  	model = "Qualcomm Technologies, Inc. SM8550 QRD";
> @@ -205,6 +208,92 @@ platform {
>  		};
>  	};
>  
> +	thermal-zones {
> +		skin-thermal {
> +			thermal-sensors = <&pmk8550_vadc PM8550_ADC5_GEN3_AMUX_THM1_100K_PU(1)>;
> +
> +			trips {
> +				active-config0 {
> +					temperature = <125000>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +			};
> +		};
> +
> +		cam-flash-thermal {

Nit: I understand that the nodes are sorted by the sensor channel rather
than the name. Would it make sense to add a note (here or in the commit
message)?

> 

-- 
With best wishes
Dmitry

