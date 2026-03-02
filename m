Return-Path: <linux-arm-msm+bounces-94883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gDKVJvdvpWlXAgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:09:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1FB1D73A5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 12:09:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B4EA7303CEBB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 11:07:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64813279DA6;
	Mon,  2 Mar 2026 11:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OfEe3/Q3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jdD86HH2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E26B35F61F
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 11:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772449628; cv=none; b=L5jeD4ou5yKvjpkiTDNp8VzsEvdVXSNFzVoJfeVQAM/i1Ut52QC3vPBp27iJeuxW88w0OrHd6S7fsKV1JHATEvARAF4TN63Prx4OW+3qPxMQ0ThRcy1jgGyl5Kbzav9r+CDYTCcJydFAKHUjgLjF2rDJqgel7H2k3y4/PjM4KFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772449628; c=relaxed/simple;
	bh=BBuFilbkJGsN6xMCsRGB9mMzj5tWOIs/AWZNl6o5ujM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RQ2rwO5wIAcbNinGoj/vr1Vr5KjwVHmFqpXleP5Tvr67qV/GUfMcH8vJfn1Y8au5veR0ComO4fmOwQW59xl9IJ52vNZh5Oe6qonhy8DlsjrupcScM2iU2TAYGL327NrxXcHfl1tsBcN6hWZAcoz5ywrNm2vAexPC86UJWeFRxSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OfEe3/Q3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jdD86HH2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6229K4UK782859
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 11:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8p5W6PTajQxRRdBVXun2ntjArNqAZvNR3wDMgU+v+Nc=; b=OfEe3/Q3k25ZMdzD
	M+qtpADaKdb1/139SeHxGM7YsjbNJd0aa7ZKuuMNt9JoowXlp2icMAKzde3NiXXG
	nqDg3bXfHo7Qzu2CHmKP5dhd0zqToN1aBK0o83dmGahBQ4uU05/QD7crkFmakKyb
	kvS0K+MvV268dzEr38QXpneaMGR7mcvaIkKPQwupy9K/YMK0wvtEmhqd8ITbI1ew
	3n1UmQz4jSNihqjgXTWUwiMsnIJPGVZnNQ79nlBFQv1fpWTFMEFJswH7SBy2UR0+
	YklhYy0BDeA4pPEGXoVZTwxja+Ggz7JOmI9RtMcNmtoVrvlbwyF9B2QxWXneOHrf
	T2vOIw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn7u00cg9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 11:07:01 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50fb0abdso439588085a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 03:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772449621; x=1773054421; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8p5W6PTajQxRRdBVXun2ntjArNqAZvNR3wDMgU+v+Nc=;
        b=jdD86HH2nE79P8bTOhVQJvKfPFJpI3/mXbwIBw9N2vxZwydoeMRzOpzPifVFR+vYeo
         v3n840OPBe1oJZnNR2AmWRCx4rcQYh2ujOjy5GosnivX9tAKXlejltHQ76F6H/3xWUqt
         1911PJ4WTgY8uRynNvt4LhM8YFfC7WBN1O1l2n1onawuKRLbQ0isJQ6LSpUgcrrVUabJ
         cDhyOuHyjsVRtLuMDUrTbovZKNtRhvgNjEwuu0j2LH8s5jI2PFh1TfLP04/3IKyRcqeh
         TAUOobKbHf1JzZmQLg3iZPdWbEyHO9YzR4U1eKRFxKIoXe6QXXCs2GsZQPpMlwb7qc9/
         qBmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772449621; x=1773054421;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8p5W6PTajQxRRdBVXun2ntjArNqAZvNR3wDMgU+v+Nc=;
        b=YJTmiWscoiY5ZZ0HcAZ+jsri+4Ej9Przg0G7837MnVNFE/SZprgJLjectpoNtwoPcu
         iMDDcGlTzJX+sikcyzWVPQGwLLUJfQIq7q0iBUh/auD33kI7+jvpBPLj33shTjh53Uf8
         tV5kqoKrc8pXq9nMOCpB+mBckPLaguFtKKJUib0WsiuqtncIxaxuc5oYIxdTVF4g39g6
         N0SbgNbls8V/6vZj/O2f4xiuQyTJVSAu5VsiGrKTcLnPgRwM7G6vtZIaS5DxMlUkVDya
         vnPQQofkrt+b8oPxUdbZ1SxO5coxMRiQQJrz9JUTNSOesZqIYnnh/ARZKhnJepcTqm8W
         /btA==
X-Forwarded-Encrypted: i=1; AJvYcCUshwjNiYhbL95PXOdpvnz0lLaVtW5KnMiFhqCoLDPb5SLBMujXVzH0QJZQm4TT+iSYQjQtSP52HJAQMIOw@vger.kernel.org
X-Gm-Message-State: AOJu0YwrJD7eFbsPurF3T7GoHoww82ujv1cYu1GEocNDSGOvWHeckVKK
	WoF8wqwxs9KgwVvKNAN3MNaNUn6IaBW3jv5/MknJ58n+KW/JR6jYfv4paMWY1U4YqnzcOk9TSSu
	l3RCz0dKg/JjRszeTEljQSag6bDclr0QRAkcR7kq9V7Ea9wGQIeTZAEjX97genWoHEOv/
X-Gm-Gg: ATEYQzwML2ZGHeiop10bWi6vZtuS8DIKigKMggG65DWABZMPwypRAAWeTaU7JU/nHUU
	0AfmUJqdz/+zxm7nZPW1roGi/7L0fRVDoXH9d/gek7r76S/fhPwx2s+6q4YlYYVPLM93s8O0jcY
	ezEcrZ1tn42Jtq1YDa0k2JhO51/mks7Drj3YpqyX5+dzTc5oPKGk7TrPbQaCP5xD4O8KKqxtFMV
	WbuJzrw9I+XhrA0Kz4LN6hRZYR/7TSpmmIK3iXfVJKlTaRNyoPLxldZk7+ybbKR0m/rSDVvv+Ru
	89RUPTWt68UauGgDuOGbA2RexF9GfYrBq2nyHGb0rmWzm7oE8w5gwNyftXYCXbUoBbO5QemUCcG
	uqC7nWMldjm2vovFpRsBex16FBfUIHBfqbhJGIZSCC4lmwu237T6iNKFVfnCdd2Bq/S3at/xD5T
	ZT9rs=
X-Received: by 2002:a05:620a:4004:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cbc8e79d8bmr1105602585a.9.1772449621113;
        Mon, 02 Mar 2026 03:07:01 -0800 (PST)
X-Received: by 2002:a05:620a:4004:b0:8c7:1b40:d096 with SMTP id af79cd13be357-8cbc8e79d8bmr1105599485a.9.1772449620636;
        Mon, 02 Mar 2026 03:07:00 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabf6cfd9sm3331067a12.22.2026.03.02.03.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 03:07:00 -0800 (PST)
Message-ID: <b747b545-12c7-4e33-95ae-ffa114fa13ec@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 12:06:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/10] arm64: dts: qcom: sdm845-google: Add STM FTS
 touchscreen support
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Henrik Rydberg <rydberg@bitmath.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org
References: <20260301-stmfts5-v1-0-22c458b9ac68@ixit.cz>
 <20260301-stmfts5-v1-10-22c458b9ac68@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260301-stmfts5-v1-10-22c458b9ac68@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=69a56f55 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=sfOm8-O8AAAA:8 a=8wVjoaYgGRnUAGDsoUAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA5MiBTYWx0ZWRfX1jE2q4X2XoS8
 /wySdmH5H+Tg4WBFXWJLlPHdjzPYvrdvnF3PnUX7/m6zstoUmGuwYTcE/QLEcmwwLP36M0+mD4g
 mp6a9sMv7/AJ8EjU0SsnDgVJmmGKc9BR2WHRWgdBQR3+4J36AA8EhbPHS4reyESYqxlYqBkGm39
 /qGzgBPjABxL3Y6T7fhoAxp8LrGsUvt1xqafch3wW3OnCVCCNN2nyrGATvJK6ueTw+Mm5SWKPwt
 UYD0W1Z9C0qf5Blieaq71unNtD2LAdzc0LKTRDSlGY0FE9DbL2UjrvKX1Q/mvTRJqJ3Ur1KjtDc
 8ae+2W3y64DSI+drb88ifaP4TZg3pvjIRwjWf92a9XqreRRnhbWV8FW0ctGhDVTyBh8pI0lDphl
 3Dgctz8vBfIjSfDBs8e3hfsQjJlSZ5wsq/zbjCT9RqQcf3I2fwXc7nmSm0rd18l8cuAh2PgOunb
 Hw3Lw6AxX9diAu74wVA==
X-Proofpoint-GUID: egTU-21oe0SVNnjK6tsVmEXO9lzMTqaC
X-Proofpoint-ORIG-GUID: egTU-21oe0SVNnjK6tsVmEXO9lzMTqaC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020092
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
	TAGGED_FROM(0.00)[bounces-94883-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[ixit.cz,gmail.com,foss.st.com,kernel.org,bitmath.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[protonmail.com,vger.kernel.org,st-md-mailman.stormreply.com,lists.infradead.org,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,ixit.cz:email,0.0.0.49:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.996];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EE1FB1D73A5
X-Rspamd-Action: no action

On 3/1/26 6:51 PM, David Heidelberg via B4 Relay wrote:
> From: Petr Hodina <petr.hodina@protonmail.com>
> 
> Basic touchscreen connected to second i2c bus.
> 
> Signed-off-by: Petr Hodina <petr.hodina@protonmail.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> index fa89be500fb85..2501104b06e1b 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-google-blueline.dts
> @@ -26,7 +26,26 @@ &i2c2 {
>  
>  	status = "okay";
>  
> -	/* ST,FTS @ 49 */
> +	touchscreen@49 {
> +		compatible = "st,stmfts5";
> +		reg = <0x49>;
> +
> +		pinctrl-0 = <&touchscreen_pins &touchscreen_reset>;
> +		pinctrl-names = "default";
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <125 IRQ_TYPE_LEVEL_LOW>;
> +
> +		irq-gpios = <&tlmm 125 GPIO_ACTIVE_HIGH>;

This is an anti-pattern - you can translate the GPIO handle to an
IRQ handle, but unless the hardware is spectacularly odd, an interrupt
reference is usually what you're after

> +		switch-gpios = <&tlmm 136 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&tlmm 99 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&vreg_l14a_1p8>;
> +		vdd-supply = <&vreg_l19a_3p3>;
> +
> +		touchscreen-size-x = <1079>;
> +		touchscreen-size-y = <2159>;

Are you sure about these off-by-ones?

FWIW

input/touchscreen.c:

touchscreen_get_prop_u32(dev, "touchscreen-size-x",
                         input_abs_get_max(input,
                                           axis_x) + 1,

				            notice ^

Konrad

