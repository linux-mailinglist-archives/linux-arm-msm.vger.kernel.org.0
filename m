Return-Path: <linux-arm-msm+bounces-92721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GHXLAeP2jWlw8wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92721-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 16:50:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F6F12F19B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 16:50:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04A443042886
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:50:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30E5B1A9B24;
	Thu, 12 Feb 2026 15:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJAESe4D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WxS9b+mJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2CB1E487
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 15:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770911456; cv=none; b=PhoG52530RAfBplkg22vG7PiXJKgiYPZYj01lo0CzrSEINL1KGlq4uYQUFafUYd+AjqBzPiNJhPcgyLqLmd0N3hVpJYns1p3f+kmCRUkVBXmYMRWWBdK4i9ajB9ufcNMfw1JgExrJ4EwT0sjwDK2dDQuCUC6jXSps/nKO5WASEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770911456; c=relaxed/simple;
	bh=CIzCTqkDNb3rIIkk0MbjcE/nClFALXCyCiD4DpiFyLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qPFNlZDal6jCL1hJrv9DHhupSVeH8x00p/3f1AAnG2w3gGgMFSTFtjBXTqwuipS6ZmnFLQX0avt4+I8L+D/5VGsFOJrHjobe/Nl5vy2IRfGofWyoeLXl0FMuJaXc7jn+61ZTkTUZgrcIGMtO3IbTL1PGt9ebEazmsZ/Quhi5+60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJAESe4D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WxS9b+mJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRftb4033368
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 15:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xLYYh5xSwKeRFCrd6PmkUX/Duq7kpvYWAMXuNW4i5Dc=; b=fJAESe4Drp7MJGFT
	TFRUFXwBHvE2naldkBEqEJaSv5tMG2O+I26R/HLOLhHSgllAZNysQyP+X6RQrOKZ
	e2k6Wierh2YVAr4kWcfYt9XUfDzyrqqQs53yp63JAS6a+DaqtLibkvZQE/em6eS0
	wcSaljSgdrtfaIZdzPV1VDDTZDWLg6+5VfaNsmrsegwzu1yXzYM5IwML768VY/qg
	e6QrbNsp050RI2mKn7+kjDgRHjPWbIrtLql8cSbEUIWl289H+llnYfu+0v5VK9Nw
	UJjPExqm7TDbREa5j1nl3kbTGcUdxkMdku1xqJtXGF/PILf7PCPQXfiDi7poc7K+
	ZfiwEg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ck2h643-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 15:50:54 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-821862cce23so2394019b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 07:50:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770911454; x=1771516254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xLYYh5xSwKeRFCrd6PmkUX/Duq7kpvYWAMXuNW4i5Dc=;
        b=WxS9b+mJM/htprsyKjhBFCBn0bt0Vpfa3aBxuCe/xZU91ZovtSZOMqQCgkNsKkIike
         1C0MhhEGeHBnu+ItNhR5r9OmlMRJxe0SJ3M2Sve5FMV9/BD3pd5WLwnSHAdtLdicA4w5
         uwehHTGzRV4yAio3iuusiIJFjnvhgAzLpAI0PIev9Y+048fphcQlNVuJF9H3f71JDy0+
         ZzHSq5c7T7k1I5jCnmY7BQdepZmowHPh2ZOHkwiAyJSuz5SpkMUU5UgzM9no6RVZCujX
         /pLm4Bp46ZKjJM4E1iBYc757BjwuxWOqxWIG0narIbGbpBmYWrdeaR2kMod1KHw2VjmX
         pQdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770911454; x=1771516254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLYYh5xSwKeRFCrd6PmkUX/Duq7kpvYWAMXuNW4i5Dc=;
        b=l68dOfzFSICTv2nAE8HZ5qJCcHNQfOBKrg+gqZIUKadbpbqtb+BPq0KjRlD2m013/4
         Fn+IPN00hrsZ4y2pQu8m43WyT1NKLtyWodYyslxWWIYCBEdAtXZOX+cLFOk5xtYAz/Zc
         Yfw5E0Ry+MahDTFx+DyXujuLhHvOnNdpovWlBFoTdntpXLYORS8t4XSU+P1g5UPCGuv/
         ipg2ICm0/X/w4aGs39N73avX5zrB9Yb+NF0xO+JhX0yEOoEgBTkPd8Y0H5Pme1zP8+BY
         uqgauvZXESEW8iQghZ5BXmZ9NPR1nJQ2SILQeDTQ/Fn7gMByhugGIo3F7qrGuhjCbeJG
         dN7Q==
X-Gm-Message-State: AOJu0YwbSQzNdNOz7INTlgodspv37PHGJpfsaYIvS7Plzu+jKe7zBVn/
	pplNQB1cCLxZtZ6ErON8ZXzj//O5g7INN9RObaWcjJInt98yixfcSktnv6+iv9za/ko5Yzo4qbw
	oH4sLWtOSjwlw7Drox0PRI0mA9RkJvcpXZ/sR7MgVvUsssjbkuVAKh5XyIbqjTIAOzocC
X-Gm-Gg: AZuq6aJAi7Uy2vlKijIfvQr3jszbxnpX9ckhEWoN16A6tA0UOA1Sy9XLxCwGyEgq5KW
	Pj/7HQWst9JlQQJ8deO8x/6ZIkVgsNeKVY0bQyMhy2xXwgzSKdWgypI1zKdHFp05Vx+Yn/di60f
	7Z5twakHEK4uevQo8ndfNm4sFOHpXQdePnV97obQgL5/AJ84OEuBv4GvmrKG1syuAvs37rF1PDt
	wgRi00Fqch9g/WgAArKhouglATdgM1sMwSMfFG60kDIt7/+RB2FlC7W9klzsqBNI9XAbqncRHs0
	+1LrBpkY2s5sx3RGHxyZp/a4MbfSQ6mH0+KuF2b8xZhIRFal5T8FZ7dJS2ZpGNIPU9O9taoK70X
	rcOmeEKuweZzQmEdHSKzG0L3O9fit1lZB6/yMOA3Iy468AfXhOg==
X-Received: by 2002:a05:6a00:130c:b0:824:9f50:83c7 with SMTP id d2e1a72fcca58-824c4762166mr2809b3a.0.1770911453584;
        Thu, 12 Feb 2026 07:50:53 -0800 (PST)
X-Received: by 2002:a05:6a00:130c:b0:824:9f50:83c7 with SMTP id d2e1a72fcca58-824c4762166mr2796b3a.0.1770911453175;
        Thu, 12 Feb 2026 07:50:53 -0800 (PST)
Received: from [192.168.0.9] ([49.204.31.131])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e82fd32sm5301020b3a.53.2026.02.12.07.50.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 07:50:52 -0800 (PST)
Message-ID: <2d688258-2e2a-4a86-aa98-eca31627d418@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 21:20:46 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: qcom: monaco-evk: Add Mezzanine
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, richardcochran@gmail.com
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohd.anwar@oss.qualcomm.com,
        krishna.chundru@oss.qualcomm.com, monish.chunara@oss.qualcomm.com
References: <20260210103821.4169-1-umang.chheda@oss.qualcomm.com>
 <20260210103821.4169-2-umang.chheda@oss.qualcomm.com>
 <957d7896-cd01-4864-bf07-e6dbdfff1273@oss.qualcomm.com>
Content-Language: en-US
From: Umang Chheda <umang.chheda@oss.qualcomm.com>
In-Reply-To: <957d7896-cd01-4864-bf07-e6dbdfff1273@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cd7fb3DM c=1 sm=1 tr=0 ts=698df6de cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=fSS5ttA6gTe5buUWvtuyAQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=Vjbjgj_5ZK18s0nR_PkA:9 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDEyMSBTYWx0ZWRfX/Sto7R2fVfWM
 E3AgZgMDKjnigVc0TzBaVryW9k7iEoFAIW4CHXWVXJXLcnvqeluZWEtsNwePSQRi0YK8bcmDWtc
 BjFcutPuMcJLhE7yKSMSvt9XU3+Uwn3kBbm1hvnejLwRMPa2pTtTPK51987OlbWILtj6SdLFA+O
 kAs+o3p58HBR7Cvp+OXTKPVss/o4m+maVUX/neK5akHv9844VpFJFMUEtl8LK9Zs7w5dYjOZuWK
 opLonGuHkTvuUVoRe1jL/E9RytIuu+k4xdOe7C7BK5ORcGeKdGed+byZPw/faugyGhosI6AORmz
 YBB3LvBvKyvZLpnTaw7UJWaOjB6urFY/MjDqMuCkKmhW1Lynd9959/B3x4mFnuIz/UBDco113Bw
 dooeL+lCZS6UyI8/GuAArmjd4HGnhk10G/Bua1ARiHJvjXYXwuy8FcSJRqbz4LT7dI0znJiB0i3
 Mws/w1Da31ceK+ZhUHQ==
X-Proofpoint-GUID: 4Vluy1RBorF_O1j7jcOpIvBFnMPBVGQ3
X-Proofpoint-ORIG-GUID: 4Vluy1RBorF_O1j7jcOpIvBFnMPBVGQ3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120121
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-92721-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[umang.chheda@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 58F6F12F19B
X-Rspamd-Action: no action

Hi Konrad,

On 2/12/2026 7:10 PM, Konrad Dybcio wrote:
> On 2/10/26 11:38 AM, Umang Chheda wrote:
>> The Mezzanine is an hardware expansion add-on board designed
> There's normally multiple mezzanine boards (e.g. a "vision mezzanine"),
> is there a better name for it?

Does, Interface Plus (IFP) Mezz sounds good ?

>
> [...]
>
>> +&tlmm {
>> +	tc9563_resx_n: tc9563-resx-state {
>> +		pins = "gpio124";
>> +		function = "gpio";
>> +
>> +		bias-disable;
> please drop the empty line above

Ack

>
> Konrad

Thanks,
Umang


