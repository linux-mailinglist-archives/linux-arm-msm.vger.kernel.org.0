Return-Path: <linux-arm-msm+bounces-104295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uI1NNX//6WkHrAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104295-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:16:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AAA4512B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 13:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0CAA030BC996
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Apr 2026 11:13:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D8F13E6DC9;
	Thu, 23 Apr 2026 11:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mqbmyKzQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GfpuyOa9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3C93E6DEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776942791; cv=none; b=e322++uH8pIUbKXOXsZ82sHQKnv/Xq7s7t2pxzg9q/uPzmnOkKMjKNORDdzudDY14nRjjCjaU6GbfmSVuA0LgBmUFe/y9RmzScan+hniwQODgflOc5W3KagArHOM0yUDnLmLRct1s74TKxh6Y8YI7wHDAeGCAB4cs3BNYrnJZUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776942791; c=relaxed/simple;
	bh=gw6X5v14HsR1yPEPi8cmZoNjyQt53JZZt7VmNyKfMDc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EBsrbSnCQONujnhl9uxim3njTUmRrMtzH55y/z4ZYJukiGJ3C1sTT406Ga7qt2jQgEu7HWRov7MY+0OPnZdX/N5UICRMF8mD3TQ2umrV0j5V5AnRs5CLjOS1urEzlddNwygiRnsstOMfvX2QIBhc4X08ART9psfSvyukXNCO/RU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mqbmyKzQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GfpuyOa9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uG1p4178091
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pPX1s4ZBBC0Y0Zs94AvDgZwI1JUIyluWWR+MfmZt+SA=; b=mqbmyKzQgrYyk07r
	YzsfVOBB38KJ3ntF+YjZDp9KB/iPWV9uldFZeG8vdJNDyh5Pj3Xav1r4hpCdByHH
	FbNS8rzHjlJ9XQJeurumT9qt6ORMW0jKd++OUrS1SyW+1hu6R6/a+NBCghaFEQtV
	vjV+4VN1m+Wz7PkeLi0qAAr/Wo7OZP9erlQd802W17dY1ZvxDT8zI1gsBJUxxi3g
	FfgmGYCa3ulE1kFLmWFFfKcFvmBfCnekKk3ry/JSPb2BlJIJdQlfBcxi7hlLTF3V
	uFTor6a/xhCZzBwIrVrfeqcUF1FNl3onLO1JRCMnYnWh0xyfzoxye/7rpOKPiyvd
	f2U6jw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h7bjf9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 11:13:09 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb0b93e90so11083711cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Apr 2026 04:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776942789; x=1777547589; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pPX1s4ZBBC0Y0Zs94AvDgZwI1JUIyluWWR+MfmZt+SA=;
        b=GfpuyOa9SSXic+EINya77p/Th3N+lZv/tI4r+melpPyd9FNcHP5P2lBVRhGcZDYEHP
         oD4m8rX9W8JTtpJdR4jqbwx4GZ4E7NcV6RpYyVu11XltDv1NlmHzXJw8VUYduWkelpDa
         T6i5ldgPUFlqBMr1mld93jSsJ+WutsIe9s6t5TSBXKOeGj7v0nn5/FO1T2LkL4VXfFZU
         cpxUugUmIOkiYYImAB8V3gFoAoIN+DviApR+0qVy21nL7YK9VF2Qf4edcLEPwWVwd1IA
         KGVhlnRpEaMakslGJoYEF0EybLng42xOo7SfKAZ0svmxoaZ6Em0HXQk86GEsvdHyxYyk
         cI0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776942789; x=1777547589;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPX1s4ZBBC0Y0Zs94AvDgZwI1JUIyluWWR+MfmZt+SA=;
        b=DAhAw3Lco4uhwzQNMN8mG65SCmfUgd2v54Ka/h8CeE/j9hIUJA7AS4J62Jx5go3kxb
         Epbpziz/9pnehf4M/0rNwfLIR9mZAInav8KfeJaJbV5xgpgv1m/yMgK4iQyMaNXre5lH
         8dewsUwKl2D40EGwIomsm2o5t1I30CK5epVkNdDay3NNkS3NO9oh7H0Qi4R85OgOYy0H
         QhkLqMBn5wbEhNkfcR/QAc1xW3g1iBIRdrdjKD70xh16g+0K+4dZ4Y+BKHFS5HhkvtXa
         SMoQWLaSvGZSVafkKufH76LTaENSRrA7YBqf4RCY0lftMDThgGu3uAhYtTvX1PE/eozf
         HlMw==
X-Forwarded-Encrypted: i=1; AFNElJ/0hntblAD466u1dzAtlMBaDM0ghdnewMraMeupsT4isjupoDXC+kZiU+2SxP7/tjjCdkxLmcGIWI3qbyZ2@vger.kernel.org
X-Gm-Message-State: AOJu0Ywst46XyfcGfQGa4Bg1sJ0LcdP/K8trJ9Z4Ea9/93lg9cklsn+j
	gPhBcKUYdnUt/6Ucpo/hSenP4RFCUqiplatKb2aJGkFIFMot+wOCqEVuYd11vgTP7JeJOidSkAT
	K4P7TuES8zkzVbTz+6yWPX3840z4p6W11+b8PRX9LPLnBBpZw3mHbUOc8Wi5CplG8aKoh
X-Gm-Gg: AeBDiesDiPhuKnNaYGk+VUFJsCQmb+R7IwvVbrW+Y4vXUbzUDOCZqe9UIbm59trJuQ9
	eFc/ONblOXCXEB+v9PZ2i7rUumliNRQ0X1pCeZ3uElHe/6Cmauysmebajl+SMwL40BLGugJYDHI
	KAcpqLnRZ9vQJ+nqcTxmnf32pAJ4dj7YXg1iluW0pavtalHZvZOBE6uA8gjCBDi1Uzo4nBOenKH
	K68HrURQcmwaRu0OMJEc3prghrilot0i6bSKs3H99AfAPoxSIAggk045LpcjsPtlm+c2kkRjC5v
	utXSUI2MurJE/KUQD/GlqdpMv2y9iIJA5OToYPCTFMFWRMM5AS3T9o5awK4Lfau58OWIRTw0lCO
	8Q9TqsX3wHdHaJnhiTpRAQ+ou452X+gVgN5FUoTLpgVpfLZ26AX9HKGfLOfRv95Ix+sbYo2kmCn
	iQB8U5Ys6j5ibgOA==
X-Received: by 2002:a05:622a:38e:b0:50d:714d:e966 with SMTP id d75a77b69052e-50e3669e233mr267073611cf.0.1776942788756;
        Thu, 23 Apr 2026 04:13:08 -0700 (PDT)
X-Received: by 2002:a05:622a:38e:b0:50d:714d:e966 with SMTP id d75a77b69052e-50e3669e233mr267073131cf.0.1776942788285;
        Thu, 23 Apr 2026 04:13:08 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba451be2c9bsm661013166b.23.2026.04.23.04.13.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Apr 2026 04:13:07 -0700 (PDT)
Message-ID: <269bdec3-6340-4b27-9b38-3fc1dfc958c8@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 13:13:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/13] clk: qcom: clk-alpha-pll: Add support to skip PLL
 configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>
References: <20260420-cesta-sm870-dispcc-v1-0-eb27d845df9c@oss.qualcomm.com>
 <20260420-cesta-sm870-dispcc-v1-7-eb27d845df9c@oss.qualcomm.com>
 <5vkpjjuq6vh2mr4lcq5cwqd4h5cbserf3n756d465kheuwl5fk@tu3amjwe5k57>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <5vkpjjuq6vh2mr4lcq5cwqd4h5cbserf3n756d465kheuwl5fk@tu3amjwe5k57>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: bP-xw09vPt9JMMpzV5cn3t8JiUJ1CRbV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDExMSBTYWx0ZWRfXw7jBunlMsA5p
 fdUBJZWMxD+dfYf6gvI7HTnV8Uh2tVA1zDEBAqP/P2VRoRbROYj12E8Zy1lgCLNk/X8vPrOI0zo
 Pqwb9ZZqAh7Ew3JiOiJHYxeiApl2WlshzYS1js6+0KlYYyf0+db2JW2uFpOZP/JI0NiywmCGB0i
 Dejr9encpAnyvhVbEl81c6qyJlRlZCTa+vtUPUwV2rhBSxu/SfHGaRFDkJFU24ckh/+2EjYyklT
 oAp3GLoco+KMQ9nbB3udp2Z4akV3H8PZGwczrbCpFmxyAG5+kV3ECJGRqTZBHPkU5AyOYbSVMPi
 DSSvtAap4/NL5M+oaYzAakjzxhlmkYSRRHAHnWkrxwxj7oRQibaW5vjitYdSn+9Syyj+u+nZyob
 bImRYO3WOWqp3bV5ZA4ifMUX9Uq5d2q5iJ7TnJN7eTCc2/0AyTDDXmKlEEz9UaNIPaJqphx1gRO
 ugzHTz0YRLLVLggw/Rg==
X-Authority-Analysis: v=2.4 cv=UqNT8ewB c=1 sm=1 tr=0 ts=69e9fec5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ejO83hDQy6DSrCu7mY0A:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: bP-xw09vPt9JMMpzV5cn3t8JiUJ1CRbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230111
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
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104295-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
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
X-Rspamd-Queue-Id: 38AAA4512B3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/22/26 8:28 PM, Dmitry Baryshkov wrote:
> On Mon, Apr 20, 2026 at 09:59:00PM +0530, Jagadeesh Kona wrote:
>> Some PLLs are already configured as part of CRM(CESTA Resource
>> manager) initialization. Add support to skip PLL reconfiguration
>> for such PLLs that are already configured.
>>
>> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
>> ---
>>  drivers/clk/qcom/clk-alpha-pll.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
>> index 67fc97739d0d4c26aec0bac5d43d1b87d297bc6a..2f4ebf4d3884b92c981dbe0e67245704a88881ad 100644
>> --- a/drivers/clk/qcom/clk-alpha-pll.c
>> +++ b/drivers/clk/qcom/clk-alpha-pll.c
>> @@ -2332,7 +2332,7 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
>>  void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
>>  				 const struct alpha_pll_config *config)
>>  {
>> -	u32 lval = config->l;
>> +	u32 lval = config->l, regval;
>>  
>>  	/*
>>  	 * If the bootloader left the PLL enabled it's likely that there are
>> @@ -2343,6 +2343,12 @@ void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regma
>>  		return;
>>  	}
>>  
>> +	/* Return early if PLL is already configured */
>> +	regmap_read(regmap, PLL_L_VAL(pll), &regval);
>> +	regval &= LUCID_EVO_PLL_L_VAL_MASK;
>> +	if (regval)
>> +		return;
>> +
> 
> Why is it being applied only to Lucid EVO PLLs?

These clocks already have a an .is_enabled() callback, could that be
treated as equivalent?

Konrad

