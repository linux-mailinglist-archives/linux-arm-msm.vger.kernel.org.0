Return-Path: <linux-arm-msm+bounces-105153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4GBgOx/L8WlCkgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105153-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:10:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id DFAF5491995
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 11:10:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 90F573006D72
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2026 09:10:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D223BADB5;
	Wed, 29 Apr 2026 09:10:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jZee+Eyk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PGWg+DGI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B7CC3B9D9C
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777453830; cv=none; b=Z9loIPA3AgOprMucHTsOdYltss94JJ8pRWTtd3WTETQInI60rYJrpdpGycyLrbIISYxwoLiocfcd3Pqau6eRsFnU3u0Fu9KxzhDO05vB3maiR6XuhnbIJqSvMaJnt/uNOvG/moLQep4sTORQCr8jQcnuWHl1/Ju/XaMxwAMKU0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777453830; c=relaxed/simple;
	bh=CXfKtKHK9mWURssMmZRNEVI5JFdaGoJUSkpOqksHbSA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAzDvTfLLQx3n9C3+OruuV4YmbSUcxUf7jAZqas1nZ9ulbNft/shj/fhJJmFnQheW9URakmP8o2PROnaGxF2AyfYHZBglMmbfAIKAER9FJ2Ebbfe7+jlXbg3uZWueMAcbF69HN9kfXxq2DSsnC3if4vX3dS1ViFjTKIuE03DJNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jZee+Eyk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PGWg+DGI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63T8ptko2094157
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:10:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sRmyBxIDO0E+txbpxwIshNW+RJbh4YPcRlsPsl41xh8=; b=jZee+EyktKqMMdZF
	b/sH3FuIf5ZjpzfrClGocQkk4f+OPNoI31ytlltyYOk2MkDRfIBbSgor6CQFf5wW
	I0DEegIUMuQdAzrtuh+fccAsfyzMOCB35QdJUvgQ/SZZj9/gvU9OUlQz69RZtoCb
	OPCYF0y39ijNDpAeAXr4tk+UW+4Xdky/3r9KF53EbAqdrlQJpI34lKF2zZzxdwgi
	147jAe57LSFle4u0iS0yXAlsNbF2CHNnpwYTID3Vwn6b/TDcn5FOIBrhA/LnRUXH
	h0+66y0N0mjep+fca5YJq7CFBwEe44DuL5ifxwnlVmpeRegfYfbcUcIJVAKufORt
	sKikSw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dudh3rh5b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 09:10:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50f817c3240so132641061cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Apr 2026 02:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777453827; x=1778058627; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=sRmyBxIDO0E+txbpxwIshNW+RJbh4YPcRlsPsl41xh8=;
        b=PGWg+DGIZDxbvW8ewNiSmnW30D+b/WJ2Vn36/90qKbHcVRiCd3VKX8G5B/7UYzDnTc
         R1O+/Ppm/WV9CDJpfyZiUq8MCqi/SALgtCQIbizYAvz2/IGMiYrvX8Kh7p3vabEOOaDA
         iPSK5v6WPnMnyS1N6zl40o2QKDm66mPEhDprzoj7kX+u8NyNnBgFgtn41Sn/7qXy3gAs
         bAkLPChrU8tbhaqPcuhNvIOJuvBGoPWf2wCBkvD5z/5pfGBobLnZw2/2PzsHhi37qQco
         aw3iEoW/W+ucTxkMI9qh2zCsAxkkhjVvrzUeG8RCAM7voZDLzqGcxUuwLaKmQ8Ve6tlR
         3gNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777453827; x=1778058627;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sRmyBxIDO0E+txbpxwIshNW+RJbh4YPcRlsPsl41xh8=;
        b=hLQ+gN69ER7i/xUh+dCrVbfXhIqjOu2Lv2uZMNeJbIwREkGpxjqoQhGI2NajwCvr9e
         JHg5RnpUi1iyTLFrHF/LXU7Q/SJnUaPOjF+Dg37Dp5+hYdPdrMbkI57v/LCSQ3w1qP0U
         ktjM4mNaX3060zHyOJEK1cFHmzMqPgpAeACwArh0CPBVPQ6XUyD8qqUE94Jv+i8L1B+b
         MBhJaxj25+8jit7lFMCoXLEZB3Xabyq1Ln0sJ6Xh8YKZTT7VpAV5WHOoRgl8Zn1ePbIF
         kh3lG5A2BdKz66ZZTTfud7VCNUPQtlxhWfgh6VvjPGpAsu0drwUh5H5QeUZ6flCmKcrM
         d5Gg==
X-Gm-Message-State: AOJu0YyOy+qqpDzIgaMxFDfNrXpJzePLFcIKRrD5UGe2OBzx6B24MoXj
	iDy2lP00yHuHKF0i/DBXMzlo6dVA9CitThNPnqKTCOO+rlLetbQL2Yq8clrYLi0JZ9QGjJI68cX
	XWYQLPmSBOpd+TnrrCjvK/bVoBbzTZ9WNavOiunlWIg0p1jrCJRDydOfWUEB9L7g6f6oI
X-Gm-Gg: AeBDietlLpnmpIC7QXBMhDS0l7qgsLaIBx3tNkUOuPacXOvj5nB2EdRbgfLkoLWz3Z6
	hFFvdysQLnBvYCtZdKUSt4VTdbzowfAOhw2lFIzw97kLHt/om1EAHE6jqvQF/Prj6KS5mWUCKD2
	arZe4wja4g3dZ9uyskP+hy5LagXU0YM0j1xS3L6hMUTAGUc/KZnWPRIApQZFSUCafske9FdZx9N
	BxkLTzNRhFJ/xJ0tGejSliOcye7UXaPEi4lceWGQq8SoP6lcJBoL3/2eaC9wQW9cfZl7o7xVu0Z
	Jlh/r9J7Jg4raZNuk+lKJRU34a6SepsYhNqqYhm5kRDe1Re3BVXFa5DqxEwJoT0Wzw65ci3e1pk
	i36jQEiQowYlfcJamhGxl1d2HpSWMJhV0pqqQnViodxHsxncKtOmNX7zwtIo=
X-Received: by 2002:a05:622a:1e89:b0:50d:cd5a:577b with SMTP id d75a77b69052e-51018a34651mr44472731cf.35.1777453827391;
        Wed, 29 Apr 2026 02:10:27 -0700 (PDT)
X-Received: by 2002:a05:622a:1e89:b0:50d:cd5a:577b with SMTP id d75a77b69052e-51018a34651mr44472391cf.35.1777453826893;
        Wed, 29 Apr 2026 02:10:26 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7bc7a359sm64972395e9.10.2026.04.29.02.10.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Apr 2026 02:10:26 -0700 (PDT)
Message-ID: <4f2d364c-6e36-4678-b01d-e5d0924c9a78@oss.qualcomm.com>
Date: Wed, 29 Apr 2026 11:10:24 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] soc: qcom: Restrict drivers per ARM/ARM64
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20260429-qcom-soc-kconfig-v1-0-69ba540b3fe9@oss.qualcomm.com>
 <20260429-qcom-soc-kconfig-v1-2-69ba540b3fe9@oss.qualcomm.com>
 <527a434e-5ac6-4a79-91e7-bf8bac4adb84@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <527a434e-5ac6-4a79-91e7-bf8bac4adb84@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sL9JLJFi5I8-5S05zqrDclWGgXL3QJkB
X-Authority-Analysis: v=2.4 cv=A4dc+aWG c=1 sm=1 tr=0 ts=69f1cb04 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=m3SF6izIDSniu5dlxVkA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: sL9JLJFi5I8-5S05zqrDclWGgXL3QJkB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI5MDA5MSBTYWx0ZWRfX5UFqIrAl0hq9
 jzvSPOy88T6VnNvfCPIBO2CbMgTyuJLFqvOmPvkMMsyt/PB4zpvSKKzQHC6CwjGuAWU10RmBizi
 Bb5wt1Bh6lqkmgL9UrhpnUP3ZcyGoudbWIiACzO+B/bCmu4XfEDIGezdQreTgFdHLEL746PD9Zr
 ImLuoA0ZHNuGxAIO2unE22EYrJdZC1ze/t9HnI2hA0phoTRmJ/zOkHz8GG0PEY0JIuJvJ/LTHSf
 25aZeaNTlSMJD7gtfHqG4DzL0qV74jdcgZ/pnZ7QSppgYaZt6wzbDG4qAUoQucdQCjTDEk+yLAL
 L4Jcm0Obh9G9s0khh2aOwL603znpSzOWphQ+Lnt9ORGpZH84Lzw2LgjSBEZ84Lzppv5CIYeZFaV
 KyTQr1h8NhsyKpEA9aBEjTxHTDhJFYJjumnUb96zpl6n21A362QFuDdfqMglrhYAwDjndDNBeGO
 J3RSAjxfG0IfiU2d5qA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604290091
X-Rspamd-Queue-Id: DFAF5491995
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105153-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 29/04/2026 11:03, Konrad Dybcio wrote:
> On 4/29/26 10:56 AM, Krzysztof Kozlowski wrote:
>> There is no point to allow selecting core SoC drivers for Qualcomm ARMv7
>> SoCs when building ARM64 kernel, and vice versa.
>>
>> This makes kernel configuration more difficult as many do not remember
>> the Qualcomm SoCs model names/numbers and their properties like
>> architecture.  No features should be lost because:
>> 1. There won't be a single image for ARMv7 and ARMv8/9 SoCs.
>> 2. Newer ARMv8/9 SoCs won't be running in arm32 emulation mode.
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>>  drivers/soc/qcom/Kconfig | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index 62ce1c67d684..9a050ba1dbcb 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -19,6 +19,7 @@ config QCOM_AOSS_QMP
>>  	tristate "Qualcomm AOSS Driver"
>>  	depends on MAILBOX
>>  	depends on COMMON_CLK && PM
>> +	depends on ARM64 || COMPILE_TEST
> 
> SDX65

Ack, although not in upstream DTS.

> 
>>  	select PM_GENERIC_DOMAINS
>>  	help
>>  	  This driver provides the means of communicating with and controlling
>> @@ -37,6 +38,7 @@ config QCOM_COMMAND_DB
>>  
>>  config QCOM_GENI_SE
>>  	tristate "QCOM GENI Serial Engine Driver"
>> +	depends on ARM64 || COMPILE_TEST
> 
> OK
> 
>>  	help
>>  	  This driver is used to manage Generic Interface (GENI) firmware based
>>  	  Qualcomm Technologies, Inc. Universal Peripheral (QUP) Wrapper. This
>> @@ -45,6 +47,7 @@ config QCOM_GENI_SE
>>  
>>  config QCOM_GSBI
>>  	tristate "QCOM General Serial Bus Interface"
>> +	depends on ARM || COMPILE_TEST
> 
> OK
> 
>>  	select MFD_SYSCON
>>  	help
>>  	  Say y here to enable GSBI support.  The GSBI provides control
>> @@ -53,6 +56,7 @@ config QCOM_GSBI
>>  
>>  config QCOM_LLCC
>>  	tristate "Qualcomm Technologies, Inc. LLCC driver"
>> +	depends on ARM64 || COMPILE_TEST
> 
> SDX65

Ack

> 
>>  	select REGMAP_MMIO
>>  	help
>>  	  Qualcomm Technologies, Inc. platform specific
>> @@ -108,6 +112,7 @@ config QCOM_PMIC_GLINK
>>  	depends on DRM
>>  	depends on NET
>>  	depends on OF
>> +	depends on ARM64 || COMPILE_TEST
> 
> Probably OK?
> 
>>  	select AUXILIARY_BUS
>>  	select QCOM_PDR_HELPERS
>>  	select DRM_AUX_HPD_BRIDGE
>> @@ -242,6 +247,7 @@ config QCOM_APR
>>  	tristate "Qualcomm APR/GPR Bus (Asynchronous/Generic Packet Router)"
>>  	depends on RPMSG
>>  	depends on NET
>> +	depends on ARM64 || COMPILE_TEST
> 
> This I think goes back to <2012 SoCs

It could, but there is no upstream DTS in arm32. It is however in few
old like 8916 which might be running in arm32 mode, so I guess better to
drop it.

> 
>>  	select QCOM_PDR_HELPERS
>>  	help
>>  	  Enable APR IPC protocol support between
>> @@ -251,6 +257,7 @@ config QCOM_APR
>>  
>>  config QCOM_ICC_BWMON
>>  	tristate "QCOM Interconnect Bandwidth Monitor driver"
>> +	depends on ARM64 || COMPILE_TEST
> 
> This is OK currently, some arm32 targets have an older (unsupported today)
> BWMON, I don't know if they would be using the same driver or not

They would get their own compatible, thus driver would be changed.  The
depends here is for current driver.

> 
>>  	select PM_OPP
>>  	select REGMAP_MMIO
>>  	help
>> @@ -265,6 +272,7 @@ config QCOM_ICC_BWMON
>>  
>>  config QCOM_PBS
>>  	tristate "PBS trigger support for Qualcomm Technologies, Inc. PMICS"
>> +	depends on ARM64 || COMPILE_TEST
> 
> MSM8909+PM660 exists and makes use of that

Well, not in upstream, but I get your point.

> 
> Konrad


Best regards,
Krzysztof

