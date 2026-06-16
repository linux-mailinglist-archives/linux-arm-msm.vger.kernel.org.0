Return-Path: <linux-arm-msm+bounces-113295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oRavHteVMGr0UgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:16:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4E3968ADC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:16:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=d7ZorvYS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XGO6aIFr;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113295-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113295-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AB7DC3002B7D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 982E4217F27;
	Tue, 16 Jun 2026 00:16:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF531FCFEF
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:16:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568973; cv=none; b=UWxC4LuHroUx3aY/6nHaCEwbsso3TQvEw8Ty/XOUUz6rftzzxQWGwM9P55JJxbd8z4nCHKMnP0A365kddKl9le0sBiLCSsSm0CcH1HPg3eZecu6Zj+s9uUyOhm7Vu+aiaMOxBzN1FOKedGE0am0HxtaZr/xsMikl73C+SJ2KuXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568973; c=relaxed/simple;
	bh=5ToS+5XQHBJXe7gMJ2vXJ7GVfLnGvQsT+9ORbdlZZQY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RABKqulCSDFCIGVWQOMJ21jtb3iKWkIg2YamUTxnnQBGEjk8vpjclraMK/JJePvyKmdsh6ZgFfaDAzYvnIhxh7W0e8NN3px7E1uUOZvktn+JR6joFAKubWqieX3x2bA8D3Dk0HYusvKlDoPTP057HSTUba0cTBDZ3lTkf/l5kYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d7ZorvYS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XGO6aIFr; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIx0PD883725
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:16:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=zmARCM0otCZ73C62ypVatCZO
	1M3TqFjcZ8vF/3Xjv1M=; b=d7ZorvYS/lYMkkz54i4shARAoo7m0HIaxI4o2430
	BKXXPZOGo5s6JlC1pjbxYlmBUGtc62MAiFjMDpA5YSLUBXOZhKs4ttdnBb26+l5y
	uVspN4wv1RW+xOVLtup4SDw1iuLvDGF26P+UXq5EYmFV87G9dhkmA8WL43KQbNBw
	9Ead8maWv+pZBBG8DadpOMz5GtygBn2qFEQ7POCSBb6WcmBiTkx2uzTPlZ5th/s6
	sJkLfm8riL5GlGVw0nLuy0Kv899iy4MG22rp74P8z31AnUv0IlaPT5xW5I6wUrY+
	fp8y9AunvZqdmYb5eqw63c+CDks9huJ6w5WDxdwMD6sPKA==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etfa73nq3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:16:11 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-963c4721732so1099113241.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568971; x=1782173771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zmARCM0otCZ73C62ypVatCZO1M3TqFjcZ8vF/3Xjv1M=;
        b=XGO6aIFrKTwen97G4+29iZ0N19b6U9uZ7ekcgq+mAwGq4gklocM4Z8AOwO2DH8hjOA
         dcSkHx5sjTMVP8jqn1KXl/o1Yy0/s893b6FnGgOjYxl4iFwdKRkUSC4RkLo0Gm50GF4t
         suMIuAJryST4BDBUTYO8zr0Txqh9H22M8KtLSb/zye4g1MXjI+jDP76O9mt6wtdwkp8R
         f8PoDp6skJg1V7/Dr9n+UZmyfZj7BNcF4+bAcSXZtsbEnjbqDcivLrVTE2olwpezv0dW
         NLs3+q6qnW4ky5X7dxKE1cbbZMiz6c8Q2SwWSvCCq0E3l8Uz6l/n9QbDexZ2PkHOePl3
         Tdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568971; x=1782173771;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zmARCM0otCZ73C62ypVatCZO1M3TqFjcZ8vF/3Xjv1M=;
        b=cHBg4WC8GWNMJkQ4Dw26IzkIOGU2JqjwKLkhgvG1BspZQrGI+cDqq8Yuq1a2wiB6Ns
         PNG6eUq9JYr+k5C63RBIG4pLcJD2ScORtcHM6MZETdEkDhKtrMXgXYVxrIgQ2iz1Du2c
         lwrk33JM/DbJxy9+zp81Zoa7raC6ShWKlHjt82ZAt7W9ttL0sqtQl11ASHwgXpH/vLRq
         0Jbpxo65Mu9ujjxFSh9PhhdqQkeYMSLDlFK8ov5anryGwx1c+eEKIgkdWZQ/84+xZdeK
         y8OuoyPryUSBPWGKvMGvFy0T2aSuFmw0O4tHtCm9XAJCEBpNdXcVaC+ztTwM3ODQ8q8g
         lU5A==
X-Forwarded-Encrypted: i=1; AFNElJ8hkAX2YRMh5Xm8U40lkIqQJMEh2/2zrclin/DCeyi319uF/TUBuPpTDPly8HmzB6rePzyZILhvbHa7AyMq@vger.kernel.org
X-Gm-Message-State: AOJu0YxcQqEAtixL//gz+P6Aamf62mrCmJmFt5z6QKWSp8HKdx7sIbkm
	iOCo/wRUt2Uq+w38btkLYQC3T5oWybrh2waDTCpOD3svL94rur97ppZlX/scPJ9ldFBpmWVN/59
	cekY62RlySO0jt9eJ1maNwhOAXiHnqBc4Go1PnTJjlPzFwxqiDjnJouVboCd0fo/C4AYP
X-Gm-Gg: Acq92OHdG+oym0hpNXov4/thF0+CXINtK48x37tJ/P8UvZVSulr+5bUgS8wWMYJFkMM
	aOjjEvMkna8SlGaf+r57iC54KrV+N9AnlN7Rh3jFtFCYEr3NwLxtU8s1sKmigIx9oNVbLWtIw2X
	dimbgRDXRkjglK+oVJha/1jFcYo3ydKFsslSKHzPSiqHEl0uJDth+RB2HUrt1QC1C7Mq06793vS
	NsDKHkOCn8UVLNcvzjXu/mioZLUM/2NUKYLtwmQlKtztZoxPuSfFyJk7C09/dtUIpiQqTna6pqH
	GAwwLPnZw1pm0f0KzIF028B8l/KDtkT8PVVLBN7PBb8z2zYCL0dUzeTv8yh8x35ys40tl7eqWRz
	u5T4Dl3M7tdxPQIQ8NoS6w3MiRQ9ABZcRAMiQPzCtUVrjI4SghNJVgTgBJQgdl7Bvgr1YnewD4n
	GPYN0X+HQQ+rm3kr64tIwIVqLjr/jwREBQqqQ=
X-Received: by 2002:a05:6102:5e95:b0:631:4580:6a42 with SMTP id ada2fe7eead31-71f60d1b2b2mr6233604137.22.1781568970684;
        Mon, 15 Jun 2026 17:16:10 -0700 (PDT)
X-Received: by 2002:a05:6102:5e95:b0:631:4580:6a42 with SMTP id ada2fe7eead31-71f60d1b2b2mr6233594137.22.1781568970199;
        Mon, 15 Jun 2026 17:16:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b4516sm3045125e87.72.2026.06.15.17.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:16:08 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:16:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 4/4] arm64: dts: qcom: sc8180x-lenovo-flex-5g: Describe
 the display power net
Message-ID: <fjkpzps2txdrsqnhajusjnj446ozvbd6vejiwolaelmns677mn@va7nei4y4sex>
References: <20260615-topic-8180_disp_power-v1-0-18d36b548c48@oss.qualcomm.com>
 <20260615-topic-8180_disp_power-v1-4-18d36b548c48@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-topic-8180_disp_power-v1-4-18d36b548c48@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Zvz0SJgXpTxbf_p8bQl7HbiyMIjAJt3r
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMCBTYWx0ZWRfX5CneUYL2x5LQ
 qZk6UhfI4n6/gL00bsGU/gq9B1+PScEs9KKqeS0E1IwvtOPmeklJiprB5uqkPJpduxH8QbmoELa
 aH9JGV56+1bxduXbP1pCGfjesLhkrgw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMCBTYWx0ZWRfXxhDoFzWkRLeR
 ypFE9Ub6LmWF6BpyGkH8st3HrAI/txt7ylDieS6S6NARkLrWXHxw5S4lXZTua0I4A3FCIyrphcL
 kLYFBzYvsVmTHrMy3Hiek09Yg18+X6Ep+tpPs3Z3g36P+zJHFjNgN5VyTB6r4TO6aqGRZtFQeoe
 ulkj+FxQMhcRXE4nbe3zgfwMI0zpn++/NMCqjGkUrgH9djjjmp1U/EXzqQZw1HMJO7E1YeHY2nY
 98qx/drhp/AWcu9GXOQSwy+A+f1ONMkhHhvZ4OQaoKqx4l2dGQaH4S4ChcPzbMJn2svQoof6p2N
 oZtFR63Wfw5VuALOyy+K8OiTFksddZNc/2+gk8MyZpcEmidI6ebTUJQvmK2uBnxniViznbgLN+6
 k2jUbaTZXM69vawIAvbpFUPrByxAqWU7ZEZ/Sbb1QvTZeZmLIjhCRm3b3uscCNHALqGBROikTCP
 WpNF9VHeEMG4sp4BJLQ==
X-Proofpoint-GUID: Zvz0SJgXpTxbf_p8bQl7HbiyMIjAJt3r
X-Authority-Analysis: v=2.4 cv=AN2yTM5Z c=1 sm=1 tr=0 ts=6a3095cb cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=rJj1s7GqljL9zuNtHbsA:9 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160000
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113295-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_RECIPIENTS(0.00)[m:konradybcio@kernel.org,m:andersson@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:vkoul@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:konrad.dybcio@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A4E3968ADC7

On Mon, Jun 15, 2026 at 04:22:07PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Describe and wire up the power supplies for the eDP panel and its
> backlight. Previously, this was only working because of settings
> inherited from the bootloader.
> 
> Fixes: 20dea72a393c ("arm64: dts: qcom: sc8180x: Introduce Lenovo Flex 5G")
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  .../arm64/boot/dts/qcom/sc8180x-lenovo-flex-5g.dts | 47 ++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> @@ -472,6 +506,13 @@ &pcie3_phy {
>  	status = "okay";
>  };
>  
> +&pmc8180_2_gpios {
> +	bl_pwr_en: blw-pwr-en-state {

bl-pwr-en-state


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> +		pins = "gpio1";
> +		function = "normal";
> +	};
> +};
> +
>  &pmc8180_pwrkey {
>  	status = "okay";
>  };

-- 
With best wishes
Dmitry

