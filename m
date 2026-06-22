Return-Path: <linux-arm-msm+bounces-113981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id eDUZH9wfOWrDnAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113981-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:43:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9B76AF313
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 13:43:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YJc6aGmw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Qj1SWuTb;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113981-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113981-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5CB9A30330B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2026 11:40:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D07F313547;
	Mon, 22 Jun 2026 11:40:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1A52DF142
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 11:40:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782128407; cv=none; b=ofRUIosUicX6w6EZdC5K5fGb/gpkFJzGZtbDvcsfAPmOc+DrXIrZhl16GATGx7Hbd0YPEHydPO9i/tKLTPiZ3qpilWMeDz0Y8ZORaBiJaatOOamyxdJIGPWxEUBtFbtGGX+8PBvMZpMs6typxYDx7NxtXrQX669tvy6XwqlR8k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782128407; c=relaxed/simple;
	bh=VaLYOkDwfsHGnG49Q0RK7wCa5ND4A8N6ApvIj7aGcVU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CSFMe75ErBlR7HCwmdKZIoxESgY2pLVSWvIihzpPiWfJcplauQydJbBW+esTA4OlyxvNErkHqFMH9CYthjKzZN4ferTzM/QpZ4Q5AdQXIss8tByWDBNKtEIjDzl4neknkciDC36e7VdGU9M6qAGg4Qtemskp1GJUb7TSZph1DIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YJc6aGmw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Qj1SWuTb; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65MAnvPa1016486
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 11:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t5GpxTjgtNfF4soqW0S9mePNRjn9MX36QJntyCMjkuw=; b=YJc6aGmwqa09l1yU
	NoSodAyaBFmy4S6deDm1CD+Xd6V1wIqvQOTdfaB1PQbQ4uhrpMTwB5rUDJpx8uLm
	b3aT2lViJGlb8bLZmN23saTGK+2poDEUGzqttwd4W4uL32AD6gvWD939sPPwLLC2
	T+cP7vqlYSAy78nfhAoK0em2nZJFo2lmNTwixKOGH8b7yCjM9wGb89uGOhB5htHJ
	AlISQ82jqrJkyyJJB2qKv+QKTDCEtkNZGDcRso92R0gz9J7iIWx/ytZ01NzP6nDC
	fWy+RY/NY2tlJnPkpfEVpBnNB/JnSjso6gy9hV9Cdye6MulzVO3Y1SQAUGCUYXoE
	PYuheQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ey37h886f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 11:40:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517796be724so6659621cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2026 04:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782128404; x=1782733204; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t5GpxTjgtNfF4soqW0S9mePNRjn9MX36QJntyCMjkuw=;
        b=Qj1SWuTbQPzfU/h5GurVl5Lw+dIhRJZ6azFZZ75CsAonaGsV0PV+dzWkHVekWPqAA7
         5le5PSLTLplPhdEJzszgL4QYoRwJwrXBXgfoMctWviJ0wuHAC7hzv3bUkS7kbEz96mFm
         8NCjzy55rhWlzbhThrxJ2jel/Id+duKmNYzrf54CE90u7dZ5Fw8jsVLM0bd1FQaYjSeW
         xc1L7wVAjye+aM0wSD+78ViDEYkAHNPIzNXUAXzThTKtXlyHdif0bl+wJ2ME9DLkXcjd
         Dv06ZhscDtEt3r8mojUrI6FatKbr2mfZ8sflxAmhM5Mb5TrU0iiVTAOBsuO2vCFW9uxY
         /8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782128404; x=1782733204;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t5GpxTjgtNfF4soqW0S9mePNRjn9MX36QJntyCMjkuw=;
        b=HguqTaOjo/0TUIW615ja29SubjxfiBq2eiwgN2VusOiMTDdFPSD1NvWptH2zmjtsi+
         MX+YUinqiKE1r2lQXDHZCrb9BQ2/Vy8Yy9i8wh96obu7FYoaM8Dz34D70yl4dxKnwNxd
         eQDNoOITlQlgD/YtAgQ9S2S5i9bxZVVq8R6BlY6CnU0vRO67NAale2U8Pta+CtVmz7Mq
         esKcqhX3ix96ob4BB9F0nRjNkcudRiTviBLw+5IYwVYM4WNpBV9N/7eB8ruxh7ivcQ6y
         KGpg75MG6rIQFKySTd+6/adfQJPwHpIL3KK9fih3LLBiDAQ3ipZ2WEFjvoumhnGCqN8y
         3jww==
X-Gm-Message-State: AOJu0YxwkOmO88t/gNTWAmjZOlN3yPpTp3iSKNJ1DnmogEm/uN5mddrW
	183SBA8hHDyt5Vhc9e91n4jD+YlwP6RlQjEbE8X3DYHvQ4w4WNCjtw8DJATyFU32EZy14g6MT37
	2cKHIdmF5J2FoKLwD3ny9B41FQRQUG7ZVtJnuJ6KbEcmEonu1tvxWn3pEFpbvNa9mwB8k
X-Gm-Gg: AfdE7cnmQV8pZ4cs2hrwqjd9IvV+Tr/cwc/4U+q8woNANkBoU9Z4JdmZ/8Fm2NZqG/Q
	2g0zRShU7EFB55sNxiA9ybfLqSY8sF2nkKX24ZrUQpsHEBKNHU0vmBg6CnHcuncAjhiVol7RmtR
	WiQYhxmYA0WxFqNN5acHhp6IIaSRYWT6fDu9GaaB9tQvIGyxLmBPGysnGDn6z58WO8XsddTTWpY
	m0DlSfDK0p7htwbm4d03omXgoRNwijZRycKIbC8QJW77PgipMyxu2XALayH3ylj+622MvaFk3P9
	zQjOrWznjjaEA2U8qEy79+kcvRWNi7nqlywAqm8WhzCBHIFMgfrFN1Cwsv0lluUr1Di5YgKsOD3
	B5xIV2XOIfPwz8I9lekkO8eTaglpBCfNJD+M=
X-Received: by 2002:a05:622a:24e:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a4f4d3658mr1037271cf.3.1782128404360;
        Mon, 22 Jun 2026 04:40:04 -0700 (PDT)
X-Received: by 2002:a05:622a:24e:b0:517:6162:daf5 with SMTP id d75a77b69052e-51a4f4d3658mr1036931cf.3.1782128403701;
        Mon, 22 Jun 2026 04:40:03 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c0c5e998d90sm348405866b.17.2026.06.22.04.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 04:40:02 -0700 (PDT)
Message-ID: <f18194c2-01eb-43c0-8e40-5575deac9e84@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 13:40:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sm8250-xiaomi-elish: Add pm8008
 PMIC
To: Xin Xu <xxsemail@qq.com>, andersson@kernel.org, konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <tencent_598E543ABA6624DF90EE8492CB23BA904505@qq.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <tencent_598E543ABA6624DF90EE8492CB23BA904505@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kkdQHb_JYUWaVJofye6Nx5oeDpAcunrL
X-Authority-Analysis: v=2.4 cv=ecANubEH c=1 sm=1 tr=0 ts=6a391f14 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=dZbOZ2KzAAAA:8 a=6KmFjNX2lQqt7PmtP9EA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDExNSBTYWx0ZWRfXyRy4sEeNb61b
 yJP4wYAnRHaas1eSxkWfo8y8fQy6afU8zQXanJMc+auJgo5x7ms/6HytsRJ6HZC7DNq5iJ5CDp3
 X3fwUC7AMBS/lDbrj3H0npXlDhxV/0k=
X-Proofpoint-GUID: kkdQHb_JYUWaVJofye6Nx5oeDpAcunrL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDExNSBTYWx0ZWRfX+CTJNO830Skv
 cVvhUD9FAOXqab+SZTYXpDe2xGVXCVQQtEquP05S5x7fF2oigUALDIJjjKeB9bem9RpFySg7mL3
 8fDt4cyEP4gzcN/WypOx3AJhc7fy9mthdPP3eSZ9y5/aJauHIspcq5jkhpabJ4uigPkkF+FovgV
 ydYO4P0BCu34ti6dySqERdUpw1EjsOEqeJR4/66yCb0ui8/g24kaS4U14aktq5eI07ixaqbDzGM
 uGx2RG81Vww7TclRoWi5GpoMDeisS+90iiAhsgowdH55tQv8PUokUfkPduDGTxXigro0G7aGl1T
 rM4cE5XEfT4e92PegGsY3mjDfMbQgG98H25l7+Nef8/08dCiJ211oiEHw/aTPOBRO9mkvEQ/8q2
 jYWACQEciNI2T4PaZr/VH7SarueQTs+hDG9tMccDEu0qgSdh5t4N55iiCMePTmRaBIMcZaIg1ka
 9oCgU++CuoOc+75fWUQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_02,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220115
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-113981-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:xxsemail@qq.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qq.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_TO(0.00)[qq.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1A9B76AF313

On 6/19/26 6:07 PM, Xin Xu wrote:
> Add the pm8008 PMIC node on i2c15 with seven LDOs,
> using GPIO84 as interrupt and GPIO76 as reset.
> 
> Signed-off-by: Xin Xu <xxsemail@qq.com>
> ---
>  .../dts/qcom/sm8250-xiaomi-elish-common.dtsi  | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> index 51b57c697a75..2687a2a8dda4 100644
> --- a/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8250-xiaomi-elish-common.dtsi
> @@ -599,6 +599,82 @@ fuel-gauge@55 {
>  	};
>  };
>  
> +&i2c15 {
> +	clock-frequency = <400000>;
> +	status = "okay";

nit: please add an \n before status

> +
> +	pm8008: pmic@8 {
> +		compatible = "qcom,pm8008";
> +		reg = <0x8>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <84 IRQ_TYPE_EDGE_RISING>;

interrupts-extended = <&tlmm 84 IRQ_TYPE_EDGE_RISING>;


> +		reset-gpios = <&tlmm 76 GPIO_ACTIVE_LOW>;
> +
> +		vdd-l1-l2-supply = <&vreg_s8c_1p35>;
> +		vdd-l3-l4-supply = <&vreg_bob>;
> +		vdd-l5-supply = <&vreg_bob>;
> +		vdd-l6-supply = <&vreg_bob>;
> +		vdd-l7-supply = <&vreg_bob>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pm8008_default>;

property-n
property-names

in this order, please

[...]

> +		regulators {
> +			vreg_l1p: ldo1 {
> +				regulator-name = "vreg_l1p";
> +				regulator-min-microvolt = <1152000>;
> +				regulator-max-microvolt = <1152000>;

Make sure you verified all of the voltage ranges vs downstream,
as incorrect values may lead to hw damage

[...]

> +	pm8008_default: pm8008-default-state {
> +		int-pins {
> +			pins = "gpio84";
> +			function = "gpio";
> +			bias-disable;
> +			drive-strength = <2>;
> +			input-enable;
> +		};
> +
> +		reset-pins {
> +			pins = "gpio76";
> +			function = "gpio";
> +			bias-pull-up;
> +			drive-strength = <2>;
> +			output-high;

Drop output-high, the driver will take care of setting the output state

Konrad

