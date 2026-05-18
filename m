Return-Path: <linux-arm-msm+bounces-108127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKWoEeXNCmq18QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108127-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:29:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 48368568C46
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 10:29:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B05E43018177
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 08:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8892D3E1CE9;
	Mon, 18 May 2026 08:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cyouj4cH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VQvROKz0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 485843E1CF7
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779092178; cv=none; b=O9iGhCj3+PffgcTW+su3Qh8Qt5I55uYBelXQZCM1HHLTtJBtjlqZpm4Ns0lI6jg06pJXRriAAlu0+1QAfMV274zQc5DBxi/ZtmjwfjjAXdrav/FNjqgtEKS4QFLEqgmwGu8j6YbWjvMHCUwWwESGRdPOu+HGVVZeeknaJZDkTL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779092178; c=relaxed/simple;
	bh=N8Y+1HLBvsUTvy+51zph806zbzJZWuiG+Tj4xa5M9rE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pghS3XWQYGgK7tHgoMCi54SsViIv2YvLo7pORxmVzWql4vQpysnhAzZwZnUHk7/FojRV3jWaM87/ADJ7VzBUxY845kPCNmb4nf4Bmpe5WB9cVXB4fTcw0/GxNHkRhS1iRiYOQwl+ucu6YSCbtiusT0OuQPjVHoj6xwWtUMor4UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cyouj4cH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VQvROKz0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I86rsg2125765
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:16:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LqTGa4kDhF95nhlaNKGfGr70dmwIfEOdRZTGS9S6bUo=; b=cyouj4cHemLRBoJT
	C6A3oEwgzLKfWxWDGSaq3Zn1By+/yDTkvO/qyThgSYk8FF7kwJaNJhE4YfcuJ8jV
	ShdixKMGrCFJqA1WJlU53diGHS6LZOJ4Q1iL9Q5PW9QViJjU0T5IGzPXsRXsp3Bk
	HHQT16lbaI3iu5YCrpHTAhbi4ypEtYSS1MHSj8dNqELQRedv3TTRmprzo+q+UFbJ
	x/Zc2vXEzkE4wbLinbxH0XWK1OXGulRL6appat90IvLubHsLOMbI6+SYCg3hlTAN
	IUrp6El+TKHH37QXGeQH9gE6jHo94ACVZuB4+hskPDzWH4Tf1ku1L/4NeISpheaL
	7xzQBg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6gvqwfem-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 08:16:14 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d9f1bccd7so6044801cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 01:16:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779092174; x=1779696974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LqTGa4kDhF95nhlaNKGfGr70dmwIfEOdRZTGS9S6bUo=;
        b=VQvROKz0tDjOLl8jsLZlry/HFC/KPEzmCSRQ3YVcGz5inNRECNmHPA3YbI1jOrvv9u
         TpmDpaFFYXSJHY24zVayS4oeQDqLhx0mCFufB3jXO6QAso+pgESNuhwlbzAHouFmK7/P
         Re1Se3xJ9d/I68UKX7Y4CSfiS6+m8x/1ZLdEtl738GdeLlQemaa2XjyINYvDrq+If0US
         qBe0bpakLuC7VKofy/QdbWALEmJHS5TN1VJEUjUta8K2cuvJ+7N4eQGhQEtlEfmdtdbT
         ZjIOUI56SwbAF9c4WIQPrlCU55QvnBW+THTcSMr7PYGf+PStADnahFF298796GU7JGk/
         SwdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779092174; x=1779696974;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LqTGa4kDhF95nhlaNKGfGr70dmwIfEOdRZTGS9S6bUo=;
        b=U4vRGTqFFgZAkD9DtIMhDqLldsXwdf+KXdopEngbLMW8iXBLBuN+jfOJlqk+BJVUWg
         RhxIqtfr35mE0zyZa0M6TIb2Wa11z2uop3OpebEYVtRcnezHZKr6VIkb9SjjbG64zulA
         ADifIDNRcCQyrkZwwtFX3jJ+MW7nUdQV1H6jIfun8TnUOFYuuPN/nJyQzN5fRwZuYHOO
         ssqiCLvAgIVZT/nJE9qqGoLeHL9p2hlWUSVyTMBIi3HbO6jXE7EVQYSVq0dBAf1zO224
         h9eJl4rM5XeIoRQVBTQjdtH20QB4z31Udc82N8yfYfFgkPMbKgcRMhC1Aw1Mhjl/MKFR
         L6Iw==
X-Forwarded-Encrypted: i=1; AFNElJ/eHUA4dJk0PBoaPtu8MU6yXEPXDKUz3SVEh9xEDTJRXzDuucYYVFhwsgRbp/tTy1IJc4m9RB1WAJWLgobb@vger.kernel.org
X-Gm-Message-State: AOJu0YzVKNtFtu9T0ySOyQBuG04R5XCqd1Gz1ROcktj8u43EHsLEXZ6u
	XxjiaEpZwxnGDBMlixmO1fsgvSindn5R5dKYCIUsvHHPPwwh9zpiGcYCTtvZuYoUHBfqpx960yu
	JKlnNuwkrOF4KRTI8NljTYCEl47gB+2Ixi9Q8/pGx74z4GpwD+yPdFXHw6z1B8aYbBafSOagBia
	Qc
X-Gm-Gg: Acq92OFDHorNGKX5uMu8PpYj/gaw3zeF8xEJgCIjXKgplkzqxqXfNtVIUgX4R7TU76e
	Nd0fhrJ/e37kGACcuT4cMlj7xthovg/ybKmRFA9LCtQxjKTRE/DZMgWH5zXFqv931AY7ipNveA3
	MqNMSY4nnn1qzx/rUr4456Z6mphjcVrCUkN2EE0vzKrddTua7rmvIV3K6rC47iXVvULacOIhS0k
	sVC/WrFPegS0KzYWAtYdQIjlV/fwj7yR4ZxerSf6XZTAFHCORAgZT/LHp6c9rcifpxw1hn7VnQ/
	cmPvCyZs69Gl2oMzKSEpLFUTmvcc8QliTFSEKYafU2QJeNXNKeZkIXoTztlC7VqaQvkNx5XV6fi
	MbYC2g8cnIHZhh18PnjOZCatAEwez7A1XoWj0AQJ5XTRW06grCvlVmV0iz7SfWELaNMwS/Dy8lg
	bzJvM=
X-Received: by 2002:a05:622a:111:b0:509:d76:fe73 with SMTP id d75a77b69052e-5165a0dc367mr126325851cf.3.1779092173985;
        Mon, 18 May 2026 01:16:13 -0700 (PDT)
X-Received: by 2002:a05:622a:111:b0:509:d76:fe73 with SMTP id d75a77b69052e-5165a0dc367mr126325631cf.3.1779092173555;
        Mon, 18 May 2026 01:16:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bd4f4c23feasm547248166b.14.2026.05.18.01.16.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 01:16:12 -0700 (PDT)
Message-ID: <7bf3e5de-d9b6-4478-b5a5-0ee37ab37626@oss.qualcomm.com>
Date: Mon, 18 May 2026 10:16:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] i2c: qcom-cci: Do not check return value of
 cci_init()
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260515234121.1607425-1-vladimir.zapolskiy@linaro.org>
 <20260515234121.1607425-3-vladimir.zapolskiy@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260515234121.1607425-3-vladimir.zapolskiy@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: _92nhyj0n5PNm816lv8ukizXUG5txF6P
X-Proofpoint-ORIG-GUID: _92nhyj0n5PNm816lv8ukizXUG5txF6P
X-Authority-Analysis: v=2.4 cv=LKJWhpW9 c=1 sm=1 tr=0 ts=6a0acace cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=WNlnsbhrpSPQkgNWvCMA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA3OCBTYWx0ZWRfX0NL1cb2p/bzf
 tAE2uRmEN3zMA2v1fn1a2jrIJJ0DbgSISpTNBolbaCLdlQG/d2Q46R9OIQZBcKyUaUCiID2pTXr
 vWQEdmxngCWe5AGenhgEUwN5g6kYSXnQEARZi54/lJL550Fndf17+KR+THIpBcipU0VTfAirzTJ
 5+YyBYulCXZSHz2dCSXl7Rs7MI/WZc9pVK51OreplONCEeKmWX2h++nyHxlGHjkqqXe9w/m+6hW
 yEOChHIhSrPIqIZ893sKmLGIXgIGvTh/3kezr25KuDugumumpgjdK7xRZhKW6DgYuOlwqdJoPYe
 x9Vfx/1Sq/HmXa/TQiv0G+gZTtmEvYcMTwZ6ABoIp5m2bpZJEsnQti0TxP9QgFVhhRRewgY350y
 fj4y8ddOw9WRUuhBQbC+tByR1Hw4D8ZRXAMBNvEkXf5BMMWYC7xY6agukiyq0oBZAzaK3Jcllr1
 wsePQApDrsgG4gbWuew==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 suspectscore=0 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180078
X-Rspamd-Queue-Id: 48368568C46
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-108127-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 5/16/26 1:41 AM, Vladimir Zapolskiy wrote:
> The cci_init() function is not supposed to fail, and it never returns
> a non-zero, so it'd make sense to convert its signature to void.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

