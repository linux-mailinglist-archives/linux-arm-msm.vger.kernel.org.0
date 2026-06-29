Return-Path: <linux-arm-msm+bounces-115021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 9f2tDnJdQmod5gkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115021-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:56:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A83E6D9B2E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 13:56:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YihHik7d;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ffJJmpx5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115021-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115021-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE748301C92D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B87453FE36D;
	Mon, 29 Jun 2026 11:56:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EB43F9F5C
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:56:25 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782734187; cv=none; b=j+TxZc+/t0SdxZEQkUp2FLu2hBLYbnRUZfgO3tkLKgpz+QSemCN1TbxB8h7eon3JDEFrYdR8I8rZ7KUi6nianUo6A1URCSArQiMkhB0p2mR1ThiaJFwscIYqfPjZ/e1b7F1gQ+MK9iV8Y3Sn/dR7JwB1E7HyJWSjRBpi78P8EeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782734187; c=relaxed/simple;
	bh=ycCB6aBXbdoi7pq++CaVTDKq50tu2AeXYjXrW9M+eC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tsqdc9KIG3BUjUTyfUcC9Hd7hupI55+QNqc/dldYtjXgDUu4S8k+jTuueVMsow0j8wdedOeZ0Ci/dHY+CzXFvTAgWixKHxRTaorSBuTUgYkmWsx/kVOVDDprazoEIQwldjb0saSBQQQzuRpsOsc+PiWvt0QulLw6ePtisusXVTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YihHik7d; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ffJJmpx5; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT6W62627926
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:56:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4+K9lShj6MJEDZD3t2KnSzbviJa3ryh7VYCUzsecjGs=; b=YihHik7d/lDJFwGQ
	8bhB9INNJaNyh5/dUyh6S3l1xLFYAbrrYyeFPDO40AepD6bspAuughI1eBFbnpVT
	q0cvtWtiWDL3jAc7DHByaZlfKA2TjlusJ8OBdDxjkFPRdHesSzdesacTpMGTx+Zg
	Kc7QVeJb69zaea7DTM6zd7Z8bc87EJf7mWKvspT6TlIrk8Oz8kmBAa2vLcbPH6Mx
	BPm89mI9PG2gCPy9EIgfIzd+InRuNsTKtjOnkydhzRrBjfzG8DSWAqfetvTornGa
	hXt7DaKm1h3Rn/xKjfKxh4NTML5omMhDNCYGeWIYlx/UWCgwvioCqMq4BwRcwgm9
	o/yh3g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nbgrqe8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 11:56:24 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c08e9c344so799021cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782734184; x=1783338984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4+K9lShj6MJEDZD3t2KnSzbviJa3ryh7VYCUzsecjGs=;
        b=ffJJmpx5b1xJcz/GtQ5aM7kbbiyW55YGYviBzylzeaMpnN3ZMMtWGYrF4hMs0z66l0
         ezk0bJmCcP3XuS+LqKjfFMwRncOWJryiIJqS+GoiAhbsqJU9psNEJYpbF4g+zUu6A6YT
         lPjzcOko9K6mt0iksrqhIY2PPqRnEIGzvXDBr3SWyTpBkKLj1AhU0q6NtH6aHukdX51N
         qZ8EApSQ0WV45Tyf/S0h50Web3O3hwc/4XY5wzOCx7HBTPqupaXVG/GKoZkZGhpaWaMi
         37OTSOburn4LgoKjeD5jgGj768dG9bxb0UGMvPNsw1U/FkUshxzGJxbDs4mmc2nQa2vi
         3Thw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782734184; x=1783338984;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4+K9lShj6MJEDZD3t2KnSzbviJa3ryh7VYCUzsecjGs=;
        b=nEU6qLNmG4hHRe6ckInB9g9lqKuqdDMjCFzhV8pd7eSIpVny5n/0muNQwZu7z2jSI7
         dDpz/JGwlWiGePA7zS4hC+iGNTrft+0297gikjYiQ7AxNixh9LeueuMQYfzp5fBdt6V5
         PygY8NNe2XoemuSlnt2r0hJWu17Wg0Deb0TlCXM5IHXJ0xtab0jIKfwoBj0lAJJaBYUC
         XaksXtjLO2LCBNRhETZt6UjibLKjU/SyPWHTSlxVvKE5nFdOGOm2chUXXKqhj70xy26c
         OLBzv75RFEi7guAfeimwQMKgWjRCFUsYPVhDB9IINkGS461Rm5kPOrNsQ41Z8vEcmx4u
         gwwg==
X-Forwarded-Encrypted: i=1; AFNElJ+PYy+/pqxv2T0it1tuyZdLBxA3R+S9+jkGSCACh8xDBR1Aujnu3RTO+BscvxVlpkInhRyAObsbPCiydbbt@vger.kernel.org
X-Gm-Message-State: AOJu0Yyhnu093eoF0668mEkBPhr6rRjWWvd96vnYsi0xe77sv0Zkh3PE
	bEgNy9Ou1+5gif5rshkbrUoALebzlgKtqhmBqqOZP0EndzJoSBvpQta2/Xa9Nmy5oXh9PRvwIoW
	uJqc/oySRPqWU5ZgxR1m/H1q/5k3pNPJ5lY9JFVhcKMm0ZCTsSSftdlKT8OUDkfavVaXP
X-Gm-Gg: AfdE7cnEGkAoCgbPn480VMtWqFksYY9FhqY32EMPqI33jpFOclAFUVP8bQlTv0HOLiw
	lHWpsTh/scG9TkQPFdMWzAUBvJFYGMMZeOs9btLoEmHlnygfrn/qQxrtuiYrrv4S2mfZaH4r7GO
	7CqUis9OZRDXC+iQx7Z7u6gL/AknhxbxAHpQ1N0WgezhFQLyCRHTc8JYLlT/ydKXLsnAPx41gKf
	KC7KUqS2MYVMPZJax88uzJdPao4/8h1TY6keyC60QJSfhACmki1JV+LdzSYzZBoNJ4LuUrGyGOh
	UBdtkADGeho3Wfv2hnOHWFY/NwYN9xyUCjASQWscm/CQeHsE6GXM7nf1sTi9vfb1vTnbqTu1ztC
	FaSVd7lCmgjYEX2H53JRlCsLHURkTYh6TlOI=
X-Received: by 2002:a05:622a:d2:b0:51c:478:329d with SMTP id d75a77b69052e-51c04783f52mr15819801cf.5.1782734184378;
        Mon, 29 Jun 2026 04:56:24 -0700 (PDT)
X-Received: by 2002:a05:622a:d2:b0:51c:478:329d with SMTP id d75a77b69052e-51c04783f52mr15819401cf.5.1782734183975;
        Mon, 29 Jun 2026 04:56:23 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05b6dsm776045266b.37.2026.06.29.04.56.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 04:56:23 -0700 (PDT)
Message-ID: <c0cc8b08-b468-4120-b79d-2ab9ef4d0aa5@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 13:56:20 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: sm7225-fairphone-fp4: Add Sony
 IMX576 front camera support
To: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>,
        sakari.ailus@linux.intel.com, luca.weiss@fairphone.com
Cc: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mehdi Djait <mehdi.djait@linux.intel.com>,
        Elgin Perumbilly <elgin.perumbilly@siliconsignals.io>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Walter Werner Schneider <contact@schnwalter.eu>,
        Kate Hsuan
 <hpa@redhat.com>, Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260619125439.55311-1-himanshu.bhavani@siliconsignals.io>
 <20260619125439.55311-4-himanshu.bhavani@siliconsignals.io>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260619125439.55311-4-himanshu.bhavani@siliconsignals.io>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: hRZXfkrL-zbMqFIDVG1gYUFcMF3J7C2J
X-Authority-Analysis: v=2.4 cv=Z4Hc2nRA c=1 sm=1 tr=0 ts=6a425d69 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=P1BnusSwAAAA:8 a=mUnpA-1eZJh-92FP3oMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=D0XLA9XvdZm18NrgonBM:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA5OCBTYWx0ZWRfX+jLQKhM5Qv8i
 b4s9dQntOYpbImn/1XgnlD/zOR8HCapKOH8c6oDFeGnHEWvbK22Dz4W1AFQre8BDHli6PAAPPi6
 sodcM+VKRsq1j0x0NSMIyr+3WgCY62g=
X-Proofpoint-GUID: hRZXfkrL-zbMqFIDVG1gYUFcMF3J7C2J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA5OCBTYWx0ZWRfX8bdYJ418dMLv
 31xgFMoDvQQWtDSMNXx2lmoeWHwZPKpvWtzHkUkE1nxtunoplJxpM9dKy+nD0EKLTpjdA7sxtnu
 EsEiI2jynA7C8v4lxTFG7HyufHSSBLlrGAZpM11Q4CNmGPr69b09qjA6c+T82xpUnOEF5MpPRbf
 i1f/49FKkQKANO86jyQNxTajsmh/3Rk0RXhEloLE5L3NnOd1qDLqTk8RAVz2axiEUG27SO9mMRG
 oUoe0XsC7MegLNZ6GOyGcsGHTijg9Yc3xExnK4wh2GSV1LHLIN4Z4Dd72a9uJabCS4l3RULHGSO
 cQQWEHhLm+w2ToWkdLcOLJ/o4PjLHpR2/kiLY0OF2juxXlrVo6h0smX2W/nCCgSjkXlddxm3ne4
 3YCqXsaU+i0WIjbePln12uSc0W9oy8GmnDP4TXaxNRdXiBfWGJFKM4+Ed+4H8sGmQGar0JlRMbZ
 dsfKyplO7blKBSxyEIg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	TAGGED_FROM(0.00)[bounces-115021-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:himanshu.bhavani@siliconsignals.io,m:sakari.ailus@linux.intel.com,m:luca.weiss@fairphone.com,m:hardevsinh.palaniya@siliconsignals.io,m:mchehab@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:hverkuil+cisco@kernel.org,m:johannes.goede@oss.qualcomm.com,m:vladimir.zapolskiy@linaro.org,m:mehdi.djait@linux.intel.com,m:elgin.perumbilly@siliconsignals.io,m:laurent.pinchart@ideasonboard.com,m:contact@schnwalter.eu,m:hpa@redhat.com,m:clamor95@gmail.com,m:linux-media@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:hverkuil@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[siliconsignals.io,kernel.org,oss.qualcomm.com,linaro.org,linux.intel.com,ideasonboard.com,schnwalter.eu,redhat.com,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt,cisco];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9A83E6D9B2E

On 6/19/26 2:54 PM, Himanshu Bhavani wrote:
> From: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> 
> Add device tree support for the Sony IMX576 front camera
> sensor and connect it to CAMSS via CSIPHY3.
> 
> Signed-off-by: Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>
> Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
> ---

[...]

>  &cci1_i2c0 {
> -	/* Front cam (Sony IMX576) @ 0x10 */
> +	camera@10 {
> +		compatible = "sony,imx576";
> +		reg = <0x10>;
> +
> +		vana-supply = <&vreg_l3p>;
> +		vif-supply = <&vreg_l6p>;
> +		vdig-supply = <&vreg_32m_cam_dvdd_1p05>;
> +
> +		clocks = <&camcc CAMCC_MCLK1_CLK>;
> +		assigned-clocks = <&camcc CAMCC_MCLK1_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		reset-gpios = <&tlmm 35 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&cam_mclk1_default>;
> +		pinctrl-names = "default";
> +
> +		orientation = <0>; /* Front facing */

Please include the new define from:

https://lore.kernel.org/all/20260628-kbingham-orientation-v3-0-4ed92968aff8@ideasonboard.com/
> +		rotation = <90>;
> +
> +		port {
> +			camera_imx576_ep: endpoint {
> +				data-lanes = <1 2 3 4>;
> +				bus-type = <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +				link-frequencies = /bits/ 64 <600000000>;
> +				remote-endpoint = <&csiphy3_ep>;
> +			};
> +		};
> +	};
> 
>  	eeprom@50 {
>  		compatible = "giantec,gt24p64a", "atmel,24c64";
> --
> 2.34.1
> 
> 

