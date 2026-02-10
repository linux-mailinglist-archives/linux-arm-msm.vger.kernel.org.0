Return-Path: <linux-arm-msm+bounces-92468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBcHJnoCi2npPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:03:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 08DFD119548
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 11:03:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6DF5930191BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 09:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70F15342CA1;
	Tue, 10 Feb 2026 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Scm6CoMy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WPsZHw4K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E1D341AC5
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:59:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770717567; cv=none; b=Fzu5Dub4Xd2ivy96EDjq5fuX6GsX2S7Fp6sKPUWzgMvE5oddsn20cnSDo6V+ovy/FPTB94rf/O6A8yS2ObYmClUAa3BFoqD7YV1VeFD6HQ8loPjT8iENA0TTFtCaO9n30W9E2tzvywcBrOoN/0dzebVftan0/jK5U1PiKeRMA3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770717567; c=relaxed/simple;
	bh=KuH9i+TcX4plvvuTg6Itj4Tzh3VmtiGAzr/F7fN+J4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=FYfQDpKyx6kZeW3ZknWLLPp9/x1SdZ7DhMPOUxhLcq4xN13Fd6QZ8VMP8P57tBicGP9cmH8++wts7Lv3EVxFcBKL/ndPFk9THu+AFHM4pYEM0U7lJys+IGaSpZrwHUDh/JBJuCygGyRSU9wJL63q0qsZR0eEjDBRVoMZyXuxbRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Scm6CoMy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WPsZHw4K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61A9C8tY1231991
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:59:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gijSi7VTqWQwgSpjW82izSKCjFJWnOi42Yk/5UzN3tM=; b=Scm6CoMyiJ6lHHNn
	7w/2My7dBN2/oWzHDn0y4jCGZh9JPCmatlHfhjNhCWnn8yMrkJ8WJscXc7AdgO0G
	eGC0OMaGm4irm817y4iAXJfXfXuud4YG31CJ1Rrb4LzQBDdIZORI2B6ASPGcXhPq
	knBXoa43A1W5LCTO75L/m/W9L1GMIUwO8diZNh+vaGazsr5lDxXdozOJ+bKyfAWk
	OGaPGCbowIt0X+Gmd4g9xb6WBNBv5SnAZcCIvY6xfQQiuNs3maPma24VEn0xv6h3
	Dr5svbKmiHOSgfy4RJukfy/ateMdyWatDCAhvhed+XaQnlY+7W6otfgJR09fmrfQ
	v3Y3gA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7uv59c6c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 09:59:25 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-895375da74bso14919056d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 01:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770717565; x=1771322365; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gijSi7VTqWQwgSpjW82izSKCjFJWnOi42Yk/5UzN3tM=;
        b=WPsZHw4K8WyOmRMSNj4ecubZTALMk2niLoF77xlpXfNZCX/Rdysw3yuMgCxnJEXM+w
         Q+L3awkxSZaowD8Fxxkyo7v5LeLkZ3U4FTE3/7CpgO8S1HjGepI7KMNiq1LRq5k/lwLA
         ANokWCk4A3lGI8s2Q44GkuiJTFIAxkORdiSPEVEENF2BSpHJrs0iIXRKa4o+zMdf/yVd
         N31M1BTyeX01XzBzZIjqiyxSeg3aZ0vVJ8RUT7lgG4mINl9c5LvMzItBgCTs9SsnN7Cs
         CuEbfoBHLg24iZmJa65ASXledr82ZTGKx6wzC6nqOad4ldeYpdKQx1p3E46DnKshMh2b
         SA6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770717565; x=1771322365;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gijSi7VTqWQwgSpjW82izSKCjFJWnOi42Yk/5UzN3tM=;
        b=OhN4K2ti5CMR7+G/u9tiUIeIvtCCZW3s6vfqkEDtY9JJcUf5C4XD9mC9pcNB9KlESO
         noXPGL8tM06jFXKobojfdrpv0821leE2JvJuABlm+cp1AM3PYPB4hE4Z6oiWkz2fUaYS
         P6Eepa+CG1IvY8KrZD0eyCKiSoqAwfif97bIGT+jLuWpWKsrUMNKABIv9XvSqlXNsUWV
         kpOG3EuNbE96JruzF9CR6kTIYrmmnVYNNA9yC0PIyCGWtSbZ2oYt9Dn3mnQhyjkteDU6
         KCyMsmvQNe50Fx7J76E50zkLQjVDIisafHvLHH78TF+JHDUy8dReOoe9fNWfr/dukjTU
         hJFg==
X-Forwarded-Encrypted: i=1; AJvYcCVynBrSw3aRLzfrEgwIEsmW7oZ+j10S4CCTr+HKik4vWoXJ6Cfzw/eWjEb6ajtzeUSi++qDNytR9iXwFWtv@vger.kernel.org
X-Gm-Message-State: AOJu0YyeotHWxXLMKrkBXFKrxYQboKDH0D3gKUVN2lmoa0hUdPHrqawL
	7mzWIHrEDpisHKzeNSQjUJ5pMXu6Fauft1wv9FQ1ao4hHaY85AK0z/mckhuBqcH3YryZVJxDAyZ
	WS1NoXrj9ibcl/ihAgRlqfs2cbq1L+XTswSN++C892+GHtDSPKN9XnPPC7mJKVnkZqovF
X-Gm-Gg: AZuq6aJCH7J8U6DlkCBliAXUiE6ZDzn0+ZBtFfXAU+/y/nRgjn71j0lMVmtwzAoSZrl
	DAePY15ZaKqCGkIvz/9fzZ3rUS39x5bX0DhJnj3MtwohqcF1a+yZ0RbO2ozGzDN5RiRA1fJScR9
	a2fd92g6Yd96EVgipG74xGBZAluCjnOakJs74UJYtkbuTpdpdwZ4/OW9JvSpDeLIwb90/qfJ9fc
	l1QjdReQzUIoC0g7gOyJG3xzbKpQ2ugeEtrBBiuXDA8TMRPuA4Mx7L/KlNTgOn+ELwgVzwbRc3f
	BoJNyLh0qAhZq//3JYtHsYMdtSY6B2543TgOxO16wHa6k4gfil5jH2iq1PlzTXvbCaA2nKW8oA6
	we5kNyuXCxuT97TM/K2ncV2nl++3lB3CjwaLmIQ1alwZg+khsYzOkPg8Kcoy7ck1Q3MxPhZlebp
	l6u/A=
X-Received: by 2002:a05:6214:800c:b0:897:1e9:578c with SMTP id 6a1803df08f44-8970fe8c040mr8513746d6.4.1770717564856;
        Tue, 10 Feb 2026 01:59:24 -0800 (PST)
X-Received: by 2002:a05:6214:800c:b0:897:1e9:578c with SMTP id 6a1803df08f44-8970fe8c040mr8513496d6.4.1770717564472;
        Tue, 10 Feb 2026 01:59:24 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-659840238fdsm3656808a12.30.2026.02.10.01.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:59:23 -0800 (PST)
Message-ID: <e72ede03-94cb-45c3-95e7-63dff0ca3888@oss.qualcomm.com>
Date: Tue, 10 Feb 2026 10:59:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: pm660: add thermal monitor
To: Richard Acayan <mailingradian@gmail.com>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Stephen Boyd <sboyd@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20260210021819.12673-1-mailingradian@gmail.com>
 <20260210021819.12673-4-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260210021819.12673-4-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDA4MyBTYWx0ZWRfXyiUxoHM4hyme
 xA6wusDKXcw3MYEs9EiRH7AZQTYPsEcGLOtBqUsJEpF7V8dzXSQ8bjsnTMmH0dJW1f2MprUdnu0
 Ua8Lwmkk0eY3dv3Huaw5meHD9GJFoWQYBJw36LkSBoPZVQ7qXF86EuCsl203CQj+HwlRy/UjUla
 jy1Nx2mQjnx4RPsa3gTtpaJ8jgtSnbh7qzbOdwf1zCsRjSQ4ELB87+kEAhGMVtjMzoTUBxM2HTo
 VyXHebwKYFwKwBDd9yaTHtY6VtozIZtSj181GZxV6vRdbUN/87tw9LNot5xWEv8DIOfAZFW4AFu
 oIv9qwMaOUq6UQtCpiPkR4bXCSdm1+N1UcbBjHs0dIA5IAwiwivMA6zF8l3fUjfSFgNfQYHpBYV
 9qbVdaUU/rP6XeTyeXj+a7OPnLQqGA5rh+QWe7koR7s5IB37H7swOzihD8PD45RhKPoLnu1f3iF
 grtCwnXj4n08HfT3wLA==
X-Authority-Analysis: v=2.4 cv=P+Q3RyAu c=1 sm=1 tr=0 ts=698b017d cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=pGLkceISAAAA:8 a=dtVtHMBJ5IpWu-ZwicwA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: BYYCE9Gqwf3Eai7k-jlN3auScRumOMHp
X-Proofpoint-GUID: BYYCE9Gqwf3Eai7k-jlN3auScRumOMHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-09_01,2026-02-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602100083
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92468-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linaro.org,intel.com,arm.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,0.0.13.72:email,0.0.0.85:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 08DFD119548
X-Rspamd-Action: no action

On 2/10/26 3:18 AM, Richard Acayan wrote:
> The thermal monitor is used to monitor arbitrary ADC-based thermal
> sensors. It is suitable for use in thermal zones. Add support for it in
> PM660.
> 
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/pm660.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm660.dtsi b/arch/arm64/boot/dts/qcom/pm660.dtsi
> index 156b2ddff0dc..7cedf6980b34 100644
> --- a/arch/arm64/boot/dts/qcom/pm660.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm660.dtsi
> @@ -197,6 +197,16 @@ channel@85 {
>  			};
>  		};
>  
> +		pm660_adc_tm: adc-tm@3400 {
> +			compatible = "qcom,spmi-adc-tm-hc";
> +			reg = <0x3400>;
> +			interrupts = <0x0 0x34 0x0 IRQ_TYPE_EDGE_RISING>;
> +			#thermal-sensor-cells = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";

Can we enable it by default?

Konrad

