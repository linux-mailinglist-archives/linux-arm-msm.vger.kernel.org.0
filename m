Return-Path: <linux-arm-msm+bounces-102167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DNwEYAC1WnOzQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102167-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:11:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D4233AEE26
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:11:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DBA90303350C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 13:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2483A3B6C00;
	Tue,  7 Apr 2026 13:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i3OUms9G";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gl06eJ9O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD8AF39EF1C
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 13:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775567434; cv=none; b=ahDbwjiYi7DpQfZ+w8vxiqXwl9Z2MO0Bs23dyryQnvB6VUxi+d/aMgemO7tWXZC4TW+aX1wD6mUU09YorcXwKQ9mhWEf9qLgBFGMjRN4rc0/OW+SFglLSPwdagC8/ttWc7umnNWyKiz1Mbba3PZ9qFLKcZaoGQ2jkKVcO0Y0K7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775567434; c=relaxed/simple;
	bh=ra6xEjPGUd082pwekDXPZRBJqACOOs2yzIRqYTjPovE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sdsWHYD7ujEc/M/n4Ca4SO30hBHwdNGTD22GVyQjAQwr5PQcyaRxBX3ehVKNF1wOBsawQ2kc7PuhhMaPmxp9jnkolh+Nd6yT8ES3uPoZiHaProgQ033Rd4vFqL7fgA5Mb9wKzG1pM7nyKPL/9kPdPgIglQlvAGdAjpTL5+DKWyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i3OUms9G; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gl06eJ9O; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637CjuVu3815288
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 13:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S2wMrZ/z2PzZnfeKqTuUJmhmmuTVpcpoive3zz4Ny2Y=; b=i3OUms9GyBpWNaZ1
	EoshCvAi43BYzbLs2Bjk8/7c/8W5m8GSvAA5xuCF0AzvL2RoDCRLXmJgGfcqrZ9d
	256buWjegjZAuvNo+Zvsg2toXA8lLvNYDTBqXK5m06XCmWu5wr8HmvqIYa7DDedx
	pBItUVl8pkzgvmJbPALM+G1FsjKH9lbJnc/tUnP7DVNOduNumuRfGT1VqsLN2YXm
	zWqHsS5IYwhGP8Q0ip2EkPN+B9yPdWRgbsDlPVJRVUlbSNrV+zKpkXKWQ6X5bYIW
	QY+7np6KSy8iI5m3zhCq4hyKiqJ0z53fyn5gBWid1k7PnKJWbcCo2BGKoGEgzvC1
	aZZ2EQ==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4tuu2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:10:31 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-604e29ad4aeso278285137.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 06:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775567431; x=1776172231; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S2wMrZ/z2PzZnfeKqTuUJmhmmuTVpcpoive3zz4Ny2Y=;
        b=Gl06eJ9OPUzhlsjZj0Uu98hV+EDCcSwGLdMjd9KWkUuVl1zea7LWRweBZURF+nV6IE
         VbnlIuyjcnOVw/OER/TRbYjOMfWleykIU26an47zvbibhbH1bxX2dglxUHVpZsOkZfI5
         WwEK5KieWpRz01idKjX1L1RFZD76MesnDYnw8yW0Nv6R2MO96qwLfnU3j5wJiwQNdQ7S
         LTC85ByOdH37HeJDLVulMDl4wXDbEkAu0bh9aZckpjEVUUb5O9uZwj1vro2cCRNYfi5t
         MRRxsljYkG52lTaeSW8Zgu+/LInv0Qwc2s1QlKj/X2SlGAaFhW3VnRnusq4mm8Opmjf6
         yA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775567431; x=1776172231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S2wMrZ/z2PzZnfeKqTuUJmhmmuTVpcpoive3zz4Ny2Y=;
        b=e+Rv7TI/lBzXfbPNDSqaJlZuR/RKK5hunvNlzAc36Mv7tKEXDcpCg9yqIhS0bO5fBD
         c2/Fn1s8i6Q7mxa+URbZvlH38XhHbVezt/ZlYwm0laIKO4I4vdN5Xi4Geneep6BYrpam
         f/VGkE2arwr2WV/pIhhw+z/Tc3s88ddBHLn6Q/mEvG3DanYK7QPxdwGiUGyR1vPSKED5
         LDmm2WzmnEECUwASfjJScINFLmkzuL5FMHizqUzF812aaBn5hiHNhOxDs0F/GCI2Vjy0
         umAiHztZ1UdhsESWHo3HPtWyDiCiIHstEdXlW3K/wmnXucvhXa1AFJ/O/7otrfpSHPiB
         g7gw==
X-Forwarded-Encrypted: i=1; AJvYcCUFb/6N9jf/d+0ZBXrTIJCqMPIYEn2cE0FPv2Uwiwrit1syinw9nb2OfkX4I6HefffeZpujj5m6NYrag0hX@vger.kernel.org
X-Gm-Message-State: AOJu0YznEVnselun3EE+gqn3Z753pD6nvwvlcDFrsOTikZhmF7iByd4w
	eHGcU2EdcPE4BK89So513B2YqJFKj8w0vfI57LvXO+PlZS4qjM9PcjsTCC+xyjMw1kawhNo5r0K
	qT5A+LJ0YoM/GXABNe3vScsUxQIFICOtKr5lOtyN//Kz/yW4mQ9XzMG7XnxV2Y24oCD1y
X-Gm-Gg: AeBDievIlFrQOApkufOi9u7RoF1k3Sq5Kck+Tk9UaXesNG9FZ6+pLQShSKpac5gYy24
	1IOKSYzH9GPoTs/QcPlYHUm/fx/FBxS+d5Y/H/kc4zhnkCkHzATm0iCk7ka5GgjmmH0HySW4qI8
	B9zDDTmgKlXb/6Iw6X3LrPMYRcmY+5hqQzh9i/IMfmQPZxkQw43130bVtin0N2YBeagEV5KY9m8
	NTCVcftcQlDnulxk80vAJjdvIMtHaG8eMWRVoZ2fTFNesWe33JxDSuE6OvGgyZxtw3/owFYIkrc
	3hiiJ0/lMhObZwN34Q6mzpz7Vrt08Fho7G13b4DmatZ8tYbRdVZUTDC9IDCk73LB13/ZfbOqDXS
	a77iGmJdYtbm9KEtQEQm9qbDrVm3oLsmg2atMfiQuYk83kdRd13JtH2Crl2Wne92Rm98XNuDdlg
	VZB6A=
X-Received: by 2002:a05:6102:21ac:b0:5ff:d9e2:3f7a with SMTP id ada2fe7eead31-605a4967393mr2047985137.0.1775567431122;
        Tue, 07 Apr 2026 06:10:31 -0700 (PDT)
X-Received: by 2002:a05:6102:21ac:b0:5ff:d9e2:3f7a with SMTP id ada2fe7eead31-605a4967393mr2047949137.0.1775567430625;
        Tue, 07 Apr 2026 06:10:30 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c31sm558300166b.37.2026.04.07.06.10.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 06:10:29 -0700 (PDT)
Message-ID: <dc2dbc10-e1d6-4b1c-8903-7c8c612517ab@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:10:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: milos-fairphone-fp6: Enable
 Bluetooth
To: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Alexander Koskovich <AKoskovich@pm.me>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann
 <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
References: <20260403-milos-fp6-bt-wifi-v2-0-393322b27c5f@fairphone.com>
 <20260403-milos-fp6-bt-wifi-v2-6-393322b27c5f@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260403-milos-fp6-bt-wifi-v2-6-393322b27c5f@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d50247 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=fx5w4MVDiXKpHOpY66wA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 1wnNGTSqUwg1Y-yuP0LG5oypHr-qyxAP
X-Proofpoint-ORIG-GUID: 1wnNGTSqUwg1Y-yuP0LG5oypHr-qyxAP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNCBTYWx0ZWRfXyV1Kff5uN1WH
 QaIunUaNnL6dGUiRhJWHtfX+ZH9j/lme3QDOIXciPPyBXmLulc5E+Po80Ka91+VKPNaUSM6gQDH
 Yipjf+IhDMu6oXojEk45HUDe5LY2HDzl5JVZNKkdfWrpWyk3Tk9z9f5XOb94CyE7SJMh7s/GuNF
 Dj60Lj6JAm5yE9WmGySK5jGTU6sMMzsvjEohl5EFYyYGePK/FB5k4JblYTWvcKRk1zR1oJFLZ9Q
 z7Vn2/DFe8sfSD1ub5y7McUWsMAIs5OREzqrHyhdnSlwU63TqnZS9q61bDJGChVqN1AAi1WFFoW
 hZv2kuCaCu5b9GF27tSfsVCsuxLapZxJkzfk4/WQtYknrMTpoe5IIO7BNGCZmZ0Vhik2D7FUwMc
 ybgvcKcCSKjcz4mkSywgRVSV13dXwyMz9mMMtxKqoe1PUqRNQf0H02MO7UXUCspEx3jPx9CFDt5
 s+fpSNXwyV3JCR7VOrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070124
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102167-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email];
	FREEMAIL_TO(0.00)[fairphone.com,kernel.org,pm.me,gmail.com,holtmann.org,quicinc.com,sipsolutions.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5D4233AEE26
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/3/26 3:52 PM, Luca Weiss wrote:
> Add the nodes to describe the WCN6755 chip with its PMU and Bluetooth
> parts.
> 
> Thanks to Alexander Koskovich for helping with the bringup, adding
> 'clocks' to the PMU node to make Bluetooth work.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

[...]

> +	wcn6750-pmu {
> +		compatible = "qcom,wcn6755-pmu", "qcom,wcn6750-pmu";
> +
> +		vddaon-supply = <&vreg_s3b>;
> +		vddasd-supply = <&vreg_l7b>;
> +		vddpmu-supply = <&vreg_s3b>;
> +		vddrfa0p8-supply = <&vreg_s3b>;
> +		vddrfa1p2-supply = <&vreg_s2b>;
> +		vddrfa1p7-supply = <&vreg_s1b>;
> +		vddrfa2p2-supply = <&vreg_s1j>;
> +
> +		bt-enable-gpios = <&tlmm 53 GPIO_ACTIVE_HIGH>;
> +
> +		clocks = <&rpmhcc RPMH_RF_CLK1>;

nit: I should have caught this.. intriguing order of properties where
supplies are topmost during r3g2 review, which is presumably where
this originated from.. not a big deal though..

[...]

> +	bluetooth_enable_default: bluetooth-enable-default-state {
> +		pins = "gpio53";
> +		function = "gpio";
> +		output-low;
> +		bias-disable;

nit: you shouldn't need to initially actively drive the pin, a
pull-down should be sufficient

(if insist you do, output-foo is usually below bias properties)

with or without changes:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

