Return-Path: <linux-arm-msm+bounces-91305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MIO1GcaifGmMOAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:23:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 038F6BA70E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 13:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C5A36300FEC0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Jan 2026 12:23:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACD743783A2;
	Fri, 30 Jan 2026 12:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jo9/DHW3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PJEJAgWt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2BC37756E
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769775799; cv=none; b=bIEpxQzLf0B8LsMsYtCCjYNabKfKjim+NCOiMSawyYSD7UU6UyP9GZ0PnVJ1REE9gN7sAT74nKxJWsmg/a4UBQcWEudTGbW3bEN3cFkmk4wanDqq5cD1aN6VoI3oPL12fgrR/MXGbAGAvbfBouQixWu0sGaENHRgge9NXEFC1ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769775799; c=relaxed/simple;
	bh=91K/Z6+56KvU3gzwKq0QrDmOr0Uz78giYQf7d9vHxww=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CKnO62KbXW8JeQZoVu3yZWDRsilw6uRRu2qejwqEqumSNCXvrx+9p1e3QyVqWvjVnoZhnQtg7AYn4zz7DB4/7HYzKp/po+MU1K9C6q5ZUvTwpSWKthr0Zw4tkrC1KedtiEr7OV7nh1mADS24TihxoFhl1bSvhK9EeyQr7Qozo4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jo9/DHW3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PJEJAgWt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UBJ9JW2993780
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:23:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qUd1oJ5o6OjIJRKQGNupcyS0Et6+1oBOnttCQIhUsK0=; b=jo9/DHW3C7kPJGnK
	YlvjYdqxwmv8+SQOhIdzAE09t+YM1cRNEu5v+pxspeqoAX9E7t4cXcTuw/g1Mbxs
	nMuCgvk0WULa0glhOTeBHxfyQ4dn4EHfmDr4e9nyhAnjz10dGi/ENPtz7d+RAu/P
	/vcKJ9qSevfHY9AyQNwWa3Ewt61qus9zEG4N5zhXcOtHonsvQaNmghgrHCNbss3r
	kiLgs0PLGn8CGjBs1WjF2DB9os4UEKKdS1Zt89oNB8oIl2rs8A/HZMHA2zySu8od
	3XGE160n9rjaes55OxdN6ZSrtAtcvdWQIFBUZHavxmFOtM5brxQPY0Qt7Y7YswOs
	nAeOMQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0db1jrpb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 12:23:17 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c6de73fab8so18710385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Jan 2026 04:23:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769775796; x=1770380596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qUd1oJ5o6OjIJRKQGNupcyS0Et6+1oBOnttCQIhUsK0=;
        b=PJEJAgWtyp5eew7ngZT8oAQC+YlC9b8nRN7CZTNOuhBYU/RvIy0wPGbtkyAbdSZ189
         Iu0ghfVTbiBUpEiP8amh4gKIENH62Ouk2VJH9mrdSNN2SBfDenh9AX/KDerVqkvo9MfI
         1O4GPOp0wy8LXgbuhDB+9SXINZczQa3uEvy+GedUw8NXjCh7aHqDydzahfW+mfMPYD5E
         CMLgG+44i/tSNtnx6HVzfROfoXFgdU2Ow6thCvlzCBXEHTQY+IbkFtjKu11YPxsuUAEa
         VV+KTxfNrST51VN6dn4R3XXogDVI8PxwBeRijjHvKtgvR3tgioUUOepIzGkh3qNd8jPF
         orHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769775796; x=1770380596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qUd1oJ5o6OjIJRKQGNupcyS0Et6+1oBOnttCQIhUsK0=;
        b=a3vHuo3K/hhx3KMC4ED+AzfyG1WXB3Icko3GfqEgFvuT7tfZ0eJiWb629kj7jEqePK
         sJhahUcYNwspAxSql2q4A3DZkhDDm24y8yAZWSV8i0Yl5fCzKr7hP8rDalVh3rm/zP7G
         KT8q/7mh4J6uDlGPgHrCrTcZvtqooYfIQjrRZuH6bbL1PIXD7QownavOzjM50FVQZXvn
         d9FL/ZaQ8zndJgQ8tvKLQm8rFk1qm0JCysoncDoiYf5/N06v7lbCy5Tu+HqJS9j/fTQY
         BdMlwsJenJnwJbJFNJ0lJ8dQJ2nTVfnYCDVaDcHNVhDH0Fyu/CdbACEq9yFkA59lQB3P
         3xQg==
X-Forwarded-Encrypted: i=1; AJvYcCVowDBOOd0uU9Od1WcSb1/8vWqU7alxWXhnP9prO6Ny7ZAkXNOj2RFRtb3wnUVXbwJTSqfSI2CQ9xrBcKZI@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0NW6QG4fwWTRNW5M/TP34Tj2QTCOTaynCcpe/Rom9A814kzZ4
	Y2tAPTZFjTR2Q/zOBrUShnhRaUy3rn10XIplRDwx6m0GsbCRUiyNwXm2Jo5R01QPjfZ6NR8fFWV
	sqTlfm9hkm/nm+kugW9/QtevtWxuadLwLBLswc6HJttW6IWpAzmiEfz3jJAeuPC6ZZxvq
X-Gm-Gg: AZuq6aKOp8ospbpY+N07Qb31+j/Bssw2crP/4uP2noL9GrrO9J7xGCqAcWuzznJchJJ
	UapwIZWJX1eOAUQ4U1E4KMavhwb8f61eOxjeTns4+cgbqa1sElFDi7pjidGBfyLo3neqd9BcieU
	6NXmqJ/aI18R6AuPPXRV1zkXGqFCSWnKBjQUErMFhj9CQiiKI/76SEWUGSyY9gU9N/62d3MabcK
	hfDcoZ18hZDRXGUpaipFr8Y1VhR30OcrPyEurUvTf2oXZzJ3TB8mTwGD+J6UBNblX1oAmLXgmrh
	0C2rPH7JjtH7uBjzotQtMmORaS1Y+4DAQa26Tnwh9+arQWV0Y/avNeiB0IBRjpufRY4UMUyKui7
	2eFRydQ/GlPIOaiEsZ654skRvziKeexhrO75RAKmkbupaC3K5ePM0foeFQgthiVPQcrs=
X-Received: by 2002:a05:620a:2807:b0:8c7:110c:762f with SMTP id af79cd13be357-8c9eb289217mr276710485a.4.1769775796403;
        Fri, 30 Jan 2026 04:23:16 -0800 (PST)
X-Received: by 2002:a05:620a:2807:b0:8c7:110c:762f with SMTP id af79cd13be357-8c9eb289217mr276706185a.4.1769775795870;
        Fri, 30 Jan 2026 04:23:15 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c0213sm418023866b.48.2026.01.30.04.23.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 04:23:15 -0800 (PST)
Message-ID: <af0eba46-329f-4979-8b8a-fb5dbe2ad992@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 13:23:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/12] soc: qcom: geni-se: Introduce helper APIs for
 performance control
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bryan.odonoghue@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com, bjorn.andersson@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com
References: <20260112104722.591521-1-praveen.talari@oss.qualcomm.com>
 <20260112104722.591521-7-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260112104722.591521-7-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: sboVkRhuXjy13gebstFyJY9Ya039FTCX
X-Proofpoint-GUID: sboVkRhuXjy13gebstFyJY9Ya039FTCX
X-Authority-Analysis: v=2.4 cv=VMTQXtPX c=1 sm=1 tr=0 ts=697ca2b5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=8UfQzV40dBNW6KkxgPsA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDEwMSBTYWx0ZWRfX6iUMxaZC0+5w
 ogTfNISFMzGtBNwqeUz1W+2F3eUip7Nq2LqJYgSBAjrEs1otis5puWwKJsTN2TkSuY410uJRKTf
 X2EJXdjrfPmqHARF4+1Ko9sdR3BRQnHDD8odWFT0FTAlEHpanyH3FYrDUlbEcQJVz25vYgtp+sK
 kZAaUVO9eXbE/3yZEna6sszdE59474bPQrU/zK2lQTJCXw3MWncaxE8Fdq6G1Qf2SyCzOpVJ1a4
 R1yxNZSo4B5s+r43SXqhRonRjf5OpGQ4+LChunGcy+yhq+iJDKdsGl1u07yoxddgN6Ui4Hq1g1g
 ruW2qWaOhZNo+VQFPRvliASCeW2gGDWZ1+R8nEWLu4ZPOen1TjqumctPY8zuEDXNhrYkalbH0QL
 ez4RTH9aSA8FPm7SHogNE6EyMvfPMLFfuaOebSIkRK/eEol2UkvL3OQxow1JOdKB/upQ4/5O8Fq
 Ze6IKt3Be2LtLOwswoQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_01,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601300101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91305-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 038F6BA70E
X-Rspamd-Action: no action

On 1/12/26 11:47 AM, Praveen Talari wrote:
> The GENI Serial Engine (SE) drivers (I2C, SPI, and SERIAL) currently
> manage performance levels and operating points directly. This resulting
> in code duplication across drivers. such as configuring a specific level
> or find and apply an OPP based on a clock frequency.
> 
> Introduce two new helper APIs, geni_se_set_perf_level() and
> geni_se_set_perf_opp(), addresses this issue by providing a streamlined
> method for the GENI Serial Engine (SE) drivers to find and set the OPP
> based on the desired performance level, thereby eliminating redundancy.
> 
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

[...]

> +/**
> + * geni_se_set_perf_level() - Set performance level for GENI SE.
> + * @se: Pointer to the struct geni_se instance.
> + * @level: The desired performance level.
> + *
> + * Sets the performance level by directly calling dev_pm_opp_set_level
> + * on the performance device associated with the SE.
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int geni_se_set_perf_level(struct geni_se *se, unsigned long level)
> +{
> +	return dev_pm_opp_set_level(se->pd_list->pd_devs[DOMAIN_IDX_PERF], level);
> +}
> +EXPORT_SYMBOL_GPL(geni_se_set_perf_level);

This function is never used

> +
> +/**
> + * geni_se_set_perf_opp() - Set performance OPP for GENI SE by frequency.
> + * @se: Pointer to the struct geni_se instance.
> + * @clk_freq: The requested clock frequency.
> + *
> + * Finds the nearest operating performance point (OPP) for the given
> + * clock frequency and applies it to the SE's performance device.
> + *
> + * Return: 0 on success, or a negative error code on failure.
> + */
> +int geni_se_set_perf_opp(struct geni_se *se, unsigned long clk_freq)

I think with the SPI driver in mind (which seems to do a simple rateset
for both backends) we could do:

> +{
> +	struct device *perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];

Then, we can do struct device * perf_dev = se->dev;

if (se->pd_list && se->pd_list->pd_devs[DOMAIN_IDX_PERF])
	perf_dev = se->pd_list->pd_devs[DOMAIN_IDX_PERF];

and reuse it in both cases, completely transparently to the caller

Konrad

