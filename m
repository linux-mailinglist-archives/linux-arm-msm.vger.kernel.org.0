Return-Path: <linux-arm-msm+bounces-99109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCumCdThwGnAOAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99109-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:46:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BE3872ED287
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 07:46:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 87DAA30086F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 06:46:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC01735BDD7;
	Mon, 23 Mar 2026 06:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j8S//1c1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q5mhrDkZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79FAF35BDA8
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774248395; cv=none; b=Cd7CHW8WnN5rM+KEFJdbFM4xtoq4WcqCPPGKOjT3zrkuz1UPtSTv6OJjZMwROpidRwRITHvQGCPOW8cISMdilTE3lnHV+7VQkbKSJK3tAlvPw8hoM6RTjzdFdqHiM47s5AP1JjkUmwdqY6FQ/Z1o/kWKBHQ1QR0OCBC9yoviHss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774248395; c=relaxed/simple;
	bh=YaD+CatjIqfxIvSpZJAbYPQwzCHAxtNUw4nAc7oYroc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=As21/8tLkAGhf4afPMa2PnI11IxXS0cpGlaJBur+Fr4Ul4r2skbupmOqqDgrlI/LmiM4ml8meF7WUQgWJ89krvFdzV/pC3ghA3S5BfTRjirUZkfvhyj1lbNSWvq6Sz9mNSesok6JHnM55NUVVskZ2fxW6By/Fliz3q7xojBIKG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j8S//1c1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q5mhrDkZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N4AEZX1584129
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JzgrEA8u622UtmJ7BDFdV+2Neo9h7xytlbrUEgoYnlA=; b=j8S//1c1CV4vxAD7
	1/OS5fuZttK0wmEfc9YsihpbbwJwmx9EeNZYVkXEXRo6VdRcxGr5WOKU70g1QOWl
	2doE6d45nStmLCMkGkab3BppeBhGnOt239mmwvFhEoKzUQKVSg67Z6XEhXHIZRFb
	FB2bs2kEF4Ue+40jwbk080kNQRe5P/HfTg+1QSGhHAvdzzMldr7zN9VKA9/wdt3C
	rr8hKoPUMEh+SORmHs3t1xLiK2k/UZVPX8IQVOt93vLiDv3B0mGFtFLRswTlb1yt
	yGCpRieCzGe1jylYIYJlFQM74WxKAez8TdT487dHr+kyYnV5eERe1Hxsq9k/AMBq
	YBOYfg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1jng43e6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 06:46:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-358e425c261so4547040a91.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Mar 2026 23:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774248392; x=1774853192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JzgrEA8u622UtmJ7BDFdV+2Neo9h7xytlbrUEgoYnlA=;
        b=Q5mhrDkZ5lItoKp+E/dAPB/7rMukvIOK/oCF2VwN4QOAMP6eQ1YHPTAQ7vYBQzcN6/
         N3S3YilK8KgFkb5Rl0RX2EFt4u1PdctkEVCNvHwMGwN7trgyMysQTn2WDCh69Cz6g3kv
         UowEjbGhCgqcu+F0m3npDxXH7Z8ZYp0apgPHmNgMXyP1LfeUB59dUOaWFB81kTfpQM0i
         AzUP2EdRc0qJvklisdHBGBIlZorvGoesJu3bDvzZyorg0+gm3K7DhCPlMV3ZmhFEgNIG
         aCyPRxyp9Yo0T9rcoUJdj3Ck7vDeLD5tfCHWbW04+Z3HuOqhOfsGB9Z2NnKfDg2jPFm4
         gRzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774248392; x=1774853192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JzgrEA8u622UtmJ7BDFdV+2Neo9h7xytlbrUEgoYnlA=;
        b=cKAVjSA7gJ4mMLqb4LEJ4C7UwnYTIGND5ROya5mODZFz7q+eK9/pQxqNkVOOWNGQK5
         YSk38vEaDBhZHUsHTGl3juzuBi+Nr9BcT9dDP5nZevK/MEhkbhcxujhn88qLBD2yCB5o
         eWSjVj4gJZUFuR9QtQ/b/UpqGYpT2ijwMFi+PcitgDiKl49PteNVzlUSsK+pFfop7Zrv
         SVI1E3GLkz+2OPmDLhRf4j1+kdeByKXRazTkIqxrUpwPT4s2zdCcLRCjOL2mg94ztqvW
         LVyfMmeTmAdVtCpuWid7UUfNw8uaahN3GEyOgSydOjSw/JEnH1GPwqllIx0jFnCcuVE/
         Btfw==
X-Forwarded-Encrypted: i=1; AJvYcCVuViHiCK0WxJlfezrj7boNpnvVyU0YhUq6ewHp6TN2sYLJ5R86aTbQb4o4UgRdQfuXhdSs/5BaRH+OF9sF@vger.kernel.org
X-Gm-Message-State: AOJu0YxNT9Qby5Qi9g5pAIpHDVA0fyNmWb6aRk+Zr2Zw+hbrvNNfOTGw
	/wl4t8Onp3COAi3Byo6E3i0iU91Wdy0nMw4pK6tJZ7rtlsaehE/alG0rNghgru2rdNW8GluAhyd
	8JBrBPoDDVkXqfDQimbXq6VFtBsO5j8T1QEFa1a4ZfM2/fP1Jg1PFbMD4xxWh6qGb1uaK
X-Gm-Gg: ATEYQzw2/9rH+PMzm7fRkKBXyw+JGlrb84PABJ6rbgGAh1PYXnWmP1c7/4h7U/gGRk0
	u1Adm0T8ZBkOqBEF6pHCJGml1rhlSHtwBwi4EOx8fNeZ8fmVJSouh7Fd3yKSpioGAEeqe9qOtQU
	Fo5myYaTYsdV9yySzrTlBxpACKhhAeZHPrQTF/mgDlvTO6dLW4JoEZzhXLT1743OKIxwLX6KQsZ
	yyUv+Dv1Kh7H7vOuGDP2DYWf033WPLqaa1qkhenCrFIf4bfSh5yt2bmCbbn36D/X53fjWQuWijo
	88/LpF2vVV974UabvjNbWTvdWKSFVY3/XF5PH1B92hnyZsy9lV829LpYPVjH6nG/EOwea3taK94
	Bc4UTtTfSjeicVeMx43o++jQZwN662r+YXIk/NJBY8m5nSdhH8qVNeGRBL7QJ1y3b6A==
X-Received: by 2002:a17:90b:4c48:b0:35b:e844:3bd with SMTP id 98e67ed59e1d1-35be8440fadmr3293683a91.31.1774248392310;
        Sun, 22 Mar 2026 23:46:32 -0700 (PDT)
X-Received: by 2002:a17:90b:4c48:b0:35b:e844:3bd with SMTP id 98e67ed59e1d1-35be8440fadmr3293667a91.31.1774248391804;
        Sun, 22 Mar 2026 23:46:31 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bd33919a0sm4548940a91.2.2026.03.22.23.46.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Mar 2026 23:46:31 -0700 (PDT)
Message-ID: <01bd44db-32b7-4195-ad66-0a608b25dca3@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 12:16:26 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] pinctrl: qcom: Introduce IPQ5210 TLMM driver
To: Bjorn Andersson <andersson@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260318-ipq5210_tlmm-v2-0-182d47b3d540@oss.qualcomm.com>
 <20260318-ipq5210_tlmm-v2-2-182d47b3d540@oss.qualcomm.com>
 <abtbnafiKkswWSy1@baldur>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <abtbnafiKkswWSy1@baldur>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: btZ_hbpUTe4286rNvbwu1ohrxM_2NmY7
X-Authority-Analysis: v=2.4 cv=Q63fIo2a c=1 sm=1 tr=0 ts=69c0e1c9 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=xLcBPJq00M2AN48BsqkA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: btZ_hbpUTe4286rNvbwu1ohrxM_2NmY7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA1MCBTYWx0ZWRfXwxMZ6tlaE/uY
 kF8TXjjWw4S6iVZf6be58F7ivl9zc2QmLlVgqeldzj/9AHvnyLW3oHnyklLV5mpM57r/3FVyL3c
 azYGW6fuYKeHiWXzubJhMvUGLP9E8pBUpXMvEmCivboulKJhVNQkdm7AJByC2jFBnn0ab+mxes5
 FY8w6WSe2eF+BrB4J6Xu92wLhJmxhDmQX4WL2P6hKYl3t8eY0+k0IWoy3PIC+kghnC8nF77uJps
 4rGPNro6DCBhXaGthlt+NpEFiwxz+gUCDUTltUUO8DirqxQ8DEiQRmNp2MjG6Ka/9k52M0zWh2h
 68b3+axk49CJuTanXHNfvmDCMQTydXv6g19a9VIcP8NxTDVZAat8kaNJy972Z27A9uUqbLx+9+/
 xkeTrotBAsmxZP3PvTwy4mC4j1Oqeypz5/r8mkXtSONCSU/Js4KbH3HYkhI1gsNesjs0IKMoDyc
 QpWwOtWcvCfRwU7utgg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_02,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230050
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99109-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: BE3872ED287
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 3/19/2026 7:47 AM, Bjorn Andersson wrote:
> On Wed, Mar 18, 2026 at 12:44:31PM +0530, Kathiravan Thirumoorthy wrote:
>> diff --git a/drivers/pinctrl/qcom/pinctrl-ipq5210.c b/drivers/pinctrl/qcom/pinctrl-ipq5210.c
> [..]
>> +static const struct pinfunction ipq5210_functions[] = {
> [..]
>> +	MSM_PIN_FUNCTION(qup_se5_l01),
>> +	MSM_PIN_FUNCTION(qup_se5_l10),
>> +	MSM_PIN_FUNCTION(qup_se5_l11),
>> +	MSM_PIN_FUNCTION(qup_se5_l2),
>> +	MSM_PIN_FUNCTION(qup_se5_l3),
>> +	MSM_PIN_FUNCTION(qup_se5_l4),
>> +	MSM_PIN_FUNCTION(qup_se5_l5),
> Listing each pin of each QUP SE as their own function forces the DT
> author to write one state definition per pin. Group these into their
> logical functions instead.
>
> Same thing with other logical functions that you have split into
> multiple separate functions.

Sure, will take care of this in next spin.

>
>> +	MSM_PIN_FUNCTION(resout),
>> +	MSM_PIN_FUNCTION(rx_los00),
>> +	MSM_PIN_FUNCTION(rx_los01),
>> +	MSM_PIN_FUNCTION(rx_los10),
>> +	MSM_PIN_FUNCTION(rx_los11),
>> +	MSM_PIN_FUNCTION(rx_los20),
>> +	MSM_PIN_FUNCTION(rx_los21),
>> +	MSM_PIN_FUNCTION(sdc_clk),
>> +	MSM_PIN_FUNCTION(sdc_cmd),
>> +	MSM_PIN_FUNCTION(sdc_data),
>> +	MSM_PIN_FUNCTION(tsens_max),
>> +};
>> +
>> +static const struct msm_pingroup ipq5210_groups[] = {
>> +	[0] = PINGROUP(0, sdc_data, qspi_data, pwm, _, _, _, _, _, _),
>> +	[1] = PINGROUP(1, sdc_data, qspi_data, pwm, _, _, _, _, _, _),
>> +	[2] = PINGROUP(2, sdc_data, qspi_data, pwm, _, _, _, _, _, _),
>> +	[3] = PINGROUP(3, sdc_data, qspi_data, pwm, _, _, _, _, _, _),
>> +	[4] = PINGROUP(4, sdc_cmd, qspi_cs_n, _, _, _, _, _, _, _),
>> +	[5] = PINGROUP(5, sdc_clk, qspi_clk, _, _, _, _, _, _, _),
>> +	[6] = PINGROUP(6, qup_se0_l2, led0, pwm, _, cri_trng0, qdss_tracedata_a, _, _, _),
>> +	[7] = PINGROUP(7, qup_se0_l3, led1, pwm, _, cri_trng1, qdss_tracedata_a, _, _, _),
>> +	[8] = PINGROUP(8, qup_se0_l0, pwm, audio_pri2, audio_pri2, _, cri_trng2, qdss_tracedata_a, _, _),
> How can both function 3 and 4 be "audio_pri2", do you expect the system
> integrator to be able to select function 4?

Function 3 and 4 are audio_pri_mclk_out and audio_pri_mclk_in 
respectively and either one of them can be selected based on the codec's 
mclock requirement. Let me expand the full function to avoid these 
confusion in the next spin.

>
>> +	[9] = PINGROUP(9, qup_se0_l1, led2, pwm, _, cri_trng3, qdss_tracedata_a, _, _, _),
>> +	[10] = PINGROUP(10, pon_rx_los, qup_se3_l3, pwm, _, _, qdss_tracedata_a, _, _, _),
>> +	[11] = PINGROUP(11, pon_active_led, qup_se3_l2, pwm, _, _, qdss_tracedata_a, _, _, _),
>> +	[12] = PINGROUP(12, pon_tx_dis, qup_se2_l3, pwm, audio_pri0, audio_pri0, _, qrng_rosc0, qdss_tracedata_a, _),
>> +	[13] = PINGROUP(13, gpn_tx_dis, qup_se2_l2, pwm, audio_pri3, audio_pri3, _, qrng_rosc1, qdss_tracedata_a, _),
> Same here.
>
> Regards,
> Bjorn

