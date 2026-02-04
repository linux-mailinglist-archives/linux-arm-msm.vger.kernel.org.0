Return-Path: <linux-arm-msm+bounces-91770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OANJHMTWgml5cQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 06:19:00 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A4BE1DF5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 06:18:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5343A3012435
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 05:18:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB96B2D5937;
	Wed,  4 Feb 2026 05:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bc5mgXxS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fDBU3BQp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE1E26299
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 05:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770182336; cv=none; b=oiv+RAitcHh7kTgtF/HW8YffKi80eIThpZls0Lvmccl4rzuT8rS0TBR6z3oKuhF0LkZfGAuQhVkU1M1YGocrglkwWi+WiY4ILbxrIvAMXhNPewYLepS6wD8R37iKJypzuT4aZNunYde4xzjBhHo6H14E+oj+S3RKuuMG8JlJ7rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770182336; c=relaxed/simple;
	bh=pZbP/KDm3d9zf7rWC1WJ+TPqscXWFX0xVrRW0kGXTZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AC0v3iHgRh8rAxCIM+kXK2Vzf2flfnAsmzR2ufl48cGiFNPnhMlMugxcazyJjHpksGEZTw8kyk6hegZt/IloUDIxZT67vaF4RbxdL1g1p4RLP6n2XNFRPIvm0kvGfSpBdXUjmEgWZTcA6fO+M6ECPFfV0oxBQ1vt8eeM0T66rFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bc5mgXxS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fDBU3BQp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6144DLxa2732648
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 05:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QTGIdDXWEeHzCVDoRyE9D4/yRVEIvH7oRcS5mXl5a6Y=; b=bc5mgXxSTRsnqNKB
	J+GM7FQQl/VbKh0idS9Gy2i//haHzHcbruxMz+cfdYKGyw1RgJA/wtYYJEBNhfgO
	tGOstA6lYLnku+3w5GhSnpmOyXn/cdjoRGPdloQoBLvGs7BnzxmvQt0z73ItQ9lf
	tmAGntFasgdTyF/amFjvgyTz3m+T3/qCpgXfpjMmTJ3L53FSSduKwwkSuJdGgd9r
	hwZy7fgwFDQhbVcLaaaqoejrUE/ywq6mEWBBEE3kWsCFicJpg0xqtttrryAMas+3
	emr/cldusnZe6TGSuU4BIYENqqYiLn0xXv4N1w+Cf1UrOTGpdCuB9cekLiK09j2/
	ADbCZw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3exjkcqm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 05:18:55 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c5eed9a994dso3889045a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 21:18:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770182335; x=1770787135; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QTGIdDXWEeHzCVDoRyE9D4/yRVEIvH7oRcS5mXl5a6Y=;
        b=fDBU3BQpfjCu6eW0Z+4HRumg1mU6V4p3IIsRuGxzOGLV7oBZp2iqBzXcnmcSEuek6A
         rFj/K7Ss28KfCO8rlrD6KhDHduMWt2tz/CsLcOjx68i9JccWsYLk/j0RD8Oz4GWaxkRt
         ebBAxvcL+o3Xo3nBovKy0kXdQXD4TcPRRUBk6TMMOSwiy27DkcdexQi77A/iLJOhI42b
         /EMNpzsXGY+SJkbLgIg4mMSgKvrLZadf7JAqjsaWZbrhhQxzsM9UV8CsNk0bfKyBNkU+
         hbUFfxwxPB3Pm6eQgPtcRAub3/VSWr/uHmYtrRWNiWBY5hZieQYz5RlkDeitKagKAb5E
         566A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770182335; x=1770787135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QTGIdDXWEeHzCVDoRyE9D4/yRVEIvH7oRcS5mXl5a6Y=;
        b=mAPv4yo7EHFE9I6zu3oy9Iml8tE+EdlooeWUKiuGVOJV/DUNugAH6Ei6hz/N6WGNnV
         YYduLWPkOk4NrrALornPLUysL3dZcbP24tR2GvLc6RGjiJ31qoGvBGaAYroxpVJDk3zo
         elc7iVyB342zuYq0kDSZmFL/yO8dEDka/KETfnLS78pBzFae2+Kfh8FVjCE4sDj0Iklk
         fLd4DqsqFkFGIbIBpMQItvdnloYVsWehy7M5uNmeTohgXauERwEN/u/Tyk5EGDAdat3T
         O2Rz5lWRjAubomxzC4qqAMY+6yPWKgx2A4fmfToYrybuYzGX2QXplNUqu4ab4rM5vel6
         cGrA==
X-Forwarded-Encrypted: i=1; AJvYcCXOsbgBH0SwItaLPs3OglNORbYBGtt235Ja1yaGuEDevPi3RGSfJM0/i8Zte3K7k1itTg/jV6kW22Jby3W0@vger.kernel.org
X-Gm-Message-State: AOJu0YyfXmxFPTkS4CXXKlSQLjw6yAuoW8DQlwZZRXzqLWVlQ9MEtDFJ
	CO3/Of0M27KlBjwzpgEkViN4hZxQ2ec0cYKeGZUsrEgnqRb6tMz05oj2zmoYHNurh79Ju051yo3
	JYS4GBRppQkN/ygpr5hKa8Tkkf1Nsu1vsFQSIznmG4slgfBG43c2pPNaQlTbNUbOz8RcV
X-Gm-Gg: AZuq6aJ6PtW6hQM+4ZOuHQK5wJ5TlhA0qBDzSyWFm8Fmnl8XwvduF6jqjwwZYXKLktG
	OumRbjZ5IWUZpUTwC/468CmRNyrBeLIkwdrgQi3PJDN8YsWHLizcNzZiYa/6C2YoEPqeBSQj61+
	pWZY//acMgvcOMNGzjR7zzLqNxQVyZdW0t8aHXattNDDoSX79oIbRSMvcfhLeD31X/xqpLxW/rR
	7VI1ZCTwswRixquSMlIyryT+R9X/WZe2QGgdaJdZeHGPk+swH4WuuQfayPHpM29eTRqoom6MGkx
	2NMf7VODFecxu27gnCs76ZlewENLfmScKinOLwi2R5DemRKTwcU6EqFI8e35dQw3jlXPugk4+8r
	LDSG1VBKwaOvQTt5NNciwrSFKgdeqAKFRTRkZtGm+1w==
X-Received: by 2002:a05:6a21:4d92:b0:350:7238:7e2e with SMTP id adf61e73a8af0-39372438780mr1706539637.45.1770182335063;
        Tue, 03 Feb 2026 21:18:55 -0800 (PST)
X-Received: by 2002:a05:6a21:4d92:b0:350:7238:7e2e with SMTP id adf61e73a8af0-39372438780mr1706504637.45.1770182334502;
        Tue, 03 Feb 2026 21:18:54 -0800 (PST)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a933854321sm10224445ad.3.2026.02.03.21.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 21:18:54 -0800 (PST)
Message-ID: <06d16c97-5db0-4c2d-9d30-68fc2ef1c5c0@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 10:48:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/13] soc: qcom: geni-se: Add resources
 activation/deactivation helpers
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
 <20260202180922.1692428-6-praveen.talari@oss.qualcomm.com>
 <ff9a2aa3-1b2b-4001-82ce-198c61a4b637@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <ff9a2aa3-1b2b-4001-82ce-198c61a4b637@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=W8c1lBWk c=1 sm=1 tr=0 ts=6982d6bf cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_TUg1R5cyTUgEzYIA1EA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: r8tqKvAp8xf2rDn2yVbGbOqyFT_O7YHC
X-Proofpoint-ORIG-GUID: r8tqKvAp8xf2rDn2yVbGbOqyFT_O7YHC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAzNiBTYWx0ZWRfX7hEkXee4tH2/
 qewfAN/1sUOjqF9FyqCde5vCbA/jvui+Y/ehvttAYAgrgOPZV/Z7NIGJhO90Wbhs9pjtplGB/E+
 WJrAn+8/KjTsFTxl3q/Imo1ZknfsBBeP9c3CRFqa0612RHKttwQQJfbGVom6LhM4SgmNyCdmiEc
 wY7duSP14LQQqETy9OcMAGYKhYhZpGLVueLELl5G2dfh36YzEUq7V4+PWEwxDZgzfESezAD1Uea
 uPisGOEWEoZ8znfmMEEFLqwmAa+W4EmFhSj6fcKY/93WMg6cEpIXX1Q2GXExPlZ3RF3l1q62+QO
 T3xM6/1Ru905Vr6qHucix0+40lW3qHoyebJve0m1dYsp0J+qWhGvxey7FXe2d2PFs63UDoL9mht
 vvnsIrRWWi13Fq7Snf2CDwx/Hw7h+emjTf3PXQVLUmAkjJvSThTQjhXx9EnOJOB7Z9g9st4Ib3L
 UGyOdl7ZzEoIxm3pudg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 phishscore=0 impostorscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040036
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-91770-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 07A4BE1DF5
X-Rspamd-Action: no action

Hi Konrad,

On 2/3/2026 5:50 PM, Konrad Dybcio wrote:
> On 2/2/26 7:09 PM, Praveen Talari wrote:
>> The GENI SE protocol drivers (I2C, SPI, UART) implement similar resource
>> activation/deactivation sequences independently, leading to code
>> duplication.
>>
>> Introduce geni_se_resources_activate()/geni_se_resources_deactivate() to
>> power on/off resources.The activate function enables ICC, clocks, and TLMM
>> whereas the deactivate function disables resources in reverse order
>> including OPP rate reset, clocks, ICC and TLMM.
>>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> +int geni_se_resources_deactivate(struct geni_se *se)
>> +{
>> +	int ret;
>> +
>> +	if (has_acpi_companion(se->dev))
>> +		return 0;
>> +
>> +	if (se->has_opp)
>> +		dev_pm_opp_set_rate(se->dev, 0);
> 
> This is still unbalanced at this point of abstraction, notably
> keeping the RPMh vote at 0 permanently after the first
> geni_se_resources_deactivate()  since there's no counterpart in
> _activate()

I don’t think we need a counterpart for this in the activate path, since 
it is specific to dropping the vote during suspend. The vote will anyway 
be taken again as part of the transfer after the device resumes.

Thanks,
Praveen Talari

> 
> That said, the serial and UART drivers do rate calculations internally,
> so perhaps trying to be overly smart about it wouldn't be a good thing
> either.. Let's add a note in kerneldoc that the activate must be preceded
> by a dev_pm_opp_set_xyz()
> 
> [...]
> 
>> +int geni_se_resources_activate(struct geni_se *se)
>> +{
>> +	int ret;
>> +
>> +	if (has_acpi_companion(se->dev))
>> +		return 0;
>> +
>> +	ret = geni_icc_enable(se);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = geni_se_clks_on(se);
>> +	if (ret)
>> +		goto out_icc_disable;
>> +
>> +	ret = pinctrl_pm_select_default_state(se->dev);
>> +	if (ret) {
>> +		geni_se_clks_off(se);
>> +		goto out_icc_disable;
>> +	}
>> +
>> +	return ret;
> 
> nit: this 'return' always returns 0
> 
> Konrad
> 
>> +
>> +out_icc_disable:
>> +	geni_icc_disable(se);
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(geni_se_resources_activate);
>> +
>>   /**
>>    * geni_se_resources_init() - Initialize resources for a GENI SE device.
>>    * @se: Pointer to the geni_se structure representing the GENI SE device.
>> diff --git a/include/linux/soc/qcom/geni-se.h b/include/linux/soc/qcom/geni-se.h
>> index c182dd0f0bde..36a68149345c 100644
>> --- a/include/linux/soc/qcom/geni-se.h
>> +++ b/include/linux/soc/qcom/geni-se.h
>> @@ -541,6 +541,10 @@ int geni_icc_disable(struct geni_se *se);
>>   
>>   int geni_se_resources_init(struct geni_se *se);
>>   
>> +int geni_se_resources_activate(struct geni_se *se);
>> +
>> +int geni_se_resources_deactivate(struct geni_se *se);
>> +
>>   int geni_load_se_firmware(struct geni_se *se, enum geni_se_protocol_type protocol);
>>   #endif
>>   #endif


