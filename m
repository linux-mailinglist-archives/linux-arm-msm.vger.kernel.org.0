Return-Path: <linux-arm-msm+bounces-112574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cPzTAnk9KmpUlAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112574-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 06:45:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 733BB66E46E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 06:45:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=eUCmfE5X;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=G8QPs6Ma;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112574-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112574-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CC9CA308838A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 04:45:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CED933E355;
	Thu, 11 Jun 2026 04:45:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3551C1A9B24
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:45:40 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781153141; cv=none; b=PmJT0J2meNcCvZy8S4j41smgFZCRQCTLvDNsOhGKLhldZJJBk+9Dk7Tcae9lKwqQE1nFLzXK//3FflTVXn5PHj7S/aZfHBnkvlotbbY9y4hYkzUd0995PHbz19yRbNRaDXx2EOVb1JongnpEbgq7yXFkAi/Eu8/bVd9Mttm0eNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781153141; c=relaxed/simple;
	bh=wDZgTVz/oZs6fHMeDkBQJjN738mapPf0RtpZObfLSGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtehA0QnB4+thXgajg38DD2Hr9T5kYHem2iLPSp+BGj5DR5qP1GENNI1lrbHUGiRarvbRKj+POHIITWD6Qc/OWA/hybDfevKQ0WIqof6oUFgWjNimNB/tudn/jOfnPyFQoKTVn+1ZY+1r/M5ZByHw71RixwLwE5SBwMKScileCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eUCmfE5X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=G8QPs6Ma; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B0NON43183585
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8ks7xcs4CcsvhpxQlRnY7mYEmf/7lZqBcXTDU2LX0qM=; b=eUCmfE5XNyddAO+D
	0dw0SQBchcu20RPqbpJtWlc+F9af0uhK8DgWGreLf/IcuIAHWstGYcvZE1wBjWrP
	pOk3mE3TS7UAxtT2EbgtxlrfPWeHICyUpm/5ME2ncJCLlfHIEkDFMKo87wiJVxO9
	xTRl7wT+haxpU2/pecsGphJf0QdP8yTcuqM4gLs+mnNA/qOkCCwHBtEa4p3C2t/a
	269c2KgniB28cCu/RNw0PeGLnEqdXZ44WFMg8+cnx3oaU84JBeBc7z2zZvjNgkcL
	iJo0IJ4q4XAnWtTK5FJhCjIk5z/Zc8YSJ+yDMcDVAAVw5i6mMneD3B0oA02EzWKe
	yJjCVw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe6u1mdr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:45:39 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-c858e0cbc89so4326995a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 21:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781153139; x=1781757939; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ks7xcs4CcsvhpxQlRnY7mYEmf/7lZqBcXTDU2LX0qM=;
        b=G8QPs6MaIde05IkbfG0Ekp9B3NYDtG+Wikvx63NT4Z3ZspkYV3dy4uEl8bzfL11in6
         MLrStFDGJVnFYS7e3PchvWDQELTzfFWBcKPMEcT0uJmIW6/2cA5gVXWBiuarZPMHIOv6
         DH4FbNHrI0Kzt4mlea1EjE5uzodvXYHLFnyWTepjmVGo6dxe0zzm9bNhzJNxc7snDicz
         O+jUMC/PFR7No/YfTxFjLT7KTnCxl9XXLTtob0AmixFFU4+P4OKHozQ9/KP0mA40d3ae
         ZXKat/xJchAJ7PuNas9iqqq1gewWuWipGGxLiKW/NBP7NyV3B+R61qq8gTSPNyLU86zl
         ATng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781153139; x=1781757939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8ks7xcs4CcsvhpxQlRnY7mYEmf/7lZqBcXTDU2LX0qM=;
        b=SkZeqQUbRv6E6Jo40rz/8TFM//PKQ37sxmXK6xcjxuSAB6i+Jm8ltQBbTwD7MCrviC
         8R5OysJJ7czg74ZedHZ5AmOpaey6FM4gyQ0Jss5yf/qR/Za3nQCdavcOnoeNobj89GgS
         jChbf/Sxp9IMnLCaou/mdcD67vQ2BKtwtrfoRBxHFcPv2GN41a3eVXPYSwla8SwmM/ed
         /eV2O95yT0ZMvtn/oxcvmw4MJ82tLKWvCe5QtbZyzySF5GGmOVBxDbpulQckVqypITj+
         NpvFmAk32c+5fGyqyM7XSeV60selCv0FdjPPjIl+djmpCFhGiU5xkjnYA5T6onTI8OvS
         AR0A==
X-Gm-Message-State: AOJu0Yw3ZVlfUr6fN4sB06kJoffNn2XxfJ+ToYDGcgucxRf0IGn0Mua/
	XLHpseGI1Oz0oI23VReXPsqtRjiGnYz+39UBzIdRwHMs4NbsDigU/aP3ScyG68Exiw0z4YAw/k3
	W1oZ+/t0GRKLM1LqudJltEyJ18c435a7F9CFVgDu6D3fL2C4Kf7TC9+TAgnzRkCUvwM59
X-Gm-Gg: Acq92OGnIFHiopqZZeKfMBGrstTi6I6Gbi+Lzwr+pVLdd66HcI7PtnbDj0E144n0yA2
	USDamuzgdus/KmV2mUUjqC0ilSwo2+nd961h8WkGRpOjQQGRst6raxGooZaDX5pYB4UbT2SnO1P
	TpPFNF0tzgGGnS7havwBd4j8bHU25n7Y49tcBGwy8PBjK+hk1UQOZx7LTSUisrQIW3eicMH4DyX
	jgmNOvONwF+WQfcBPiqcu4VGN7eFOOKclbcv+ALxsUHZQgznG9IvWvqZOAidH+92d/YRcN/tcIt
	AIrBt2DaQy2bdjkGGCqDTwNZBfjGlcymkQreNkOPLfDZle9mnjUmRHpFk89IFDr049pWx8nkxes
	++IqAY7sbr7yikYCGQOIYDjh3+eZK6+MiL86fBRBcvFgTjZqETnU1JP4aNVkcgw8=
X-Received: by 2002:a05:6a00:bd89:b0:842:5ea5:5fdd with SMTP id d2e1a72fcca58-84336bc6f14mr1290379b3a.40.1781153138782;
        Wed, 10 Jun 2026 21:45:38 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd89:b0:842:5ea5:5fdd with SMTP id d2e1a72fcca58-84336bc6f14mr1290333b3a.40.1781153138304;
        Wed, 10 Jun 2026 21:45:38 -0700 (PDT)
Received: from [10.217.199.117] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-843383197e5sm467576b3a.52.2026.06.10.21.45.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 21:45:37 -0700 (PDT)
Message-ID: <cb244225-5375-4925-8d20-232cae9da672@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 10:15:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/8] remoteproc: qcom: pas: register TMD thermal
 cooling devices
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-3-291a2ff4c634@oss.qualcomm.com>
 <e9573827-81b5-4c75-9d1a-d59a4809300c@oss.qualcomm.com>
Content-Language: en-US
From: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
In-Reply-To: <e9573827-81b5-4c75-9d1a-d59a4809300c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ekiNRO8l80t92whyqBAFezLbphjNLj7j
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDA0MyBTYWx0ZWRfX8Nnflh+e7o9k
 Gx7NXASkMukqwwqXcbgr5h8vCb79vFeWfaNqrOeOWlGQ+YWebUnym87J8Z4AA82RE1YZ8Nm1KVe
 LJxrv4amDvSfea6aI4aBAgQ5SJYRzk8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDA0MyBTYWx0ZWRfX3bXtmkPRftba
 QmXHQaAiKIoqAaLmjq0PxqZjbpnf0KE91edEAmGFO9b51bNXrCReHOzsKmIMnqSCJfxxpcrBPcY
 SRakpE0NdU+aEEv6ddq85wVnph6SwVqUzLego/zz81EA5QNFYlbvkqfhbJMw75wE9+af5q6SVrf
 BLIQNpUmlODI2RFGYpk3G0N6g0FZFdzT5g7dBPZowK8rdB3ghLCRfQir1mh1W9+Mts8vbcojDOI
 pMlLOGWCVmSz82dtyTVKAfpfisKMtq2mKx8u1vCOlQVEp/YGO3kRATWWkRY5ePqu6FkWD/DCgxN
 0KdZw95zG9lk1CQB0BnfV7fprUrLm1jPB54Iwfv2IwAtPlNYbnpiL9v/x0QdIovWLTggG99IuHB
 AAgQkyX/nGxash1gT5lxIkVbgJQbP7g7xcHWVDr7BmMJPMXV9ctRL2Zh1bcXgHQ8qsnDo6+OdWj
 iTfxsOMRFoqNZlV/jVA==
X-Authority-Analysis: v=2.4 cv=F5lnsKhN c=1 sm=1 tr=0 ts=6a2a3d73 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=cgKxsijKBzv_CCWCEVYA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: ekiNRO8l80t92whyqBAFezLbphjNLj7j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_01,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110043
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112574-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[gaurav.kohli@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 733BB66E46E



On 6/9/2026 5:33 PM, Konrad Dybcio wrote:
> On 6/9/26 12:22 PM, Gaurav Kohli wrote:
>> Add support for Thermal Mitigation Devices (TMDs) to enable
>> thermal throttling of remote processors through QMI.
>>
>> This enables the thermal framework to request mitigation when remote
>> subsystems (modem, CDSP) contribute to thermal issues.
>>
>> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
>> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> 
> There's no other signs of Daniel in this patch, please fix the
> tags chain
> 
> [...]
> 

Thanks Konrad for review, will fix this.

>> +static int qcom_pas_setup_tmd(struct qcom_pas *pas)
>> +{
>> +	struct device *dev = pas->dev;
>> +	struct device_node *np = dev->of_node;
>> +	const char **tmd_names;
>> +	int num_tmds, ret, i;
>> +
>> +	if (!of_find_property(np, "tmd-names", NULL))
> 
> Let's use device_property_present() instead
> 

Ack.

>> +		return 0;
>> +
>> +	/* Get the TMD names array */
>> +	num_tmds = of_property_count_strings(np, "tmd-names");
> 
> Is this something we can stuff into platform_data for a given rproc on a
> given SoC (for which we already store *some* data in the PAS driver)?
> 

Without tmd-names in DT, it is unclear which index corresponds to which 
binding. With #cooling-cells, tmd-names in DT provides an explicit 
name-to-index mapping. Please suggest.
> Konrad


