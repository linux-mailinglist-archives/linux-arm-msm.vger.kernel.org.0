Return-Path: <linux-arm-msm+bounces-114824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /W3jMWb4QWrpxQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:45:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 632A16D5EA2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 06:45:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nj62Dj27;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=A9t9ScEI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114824-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114824-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id BFA9D3001D68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 04:45:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D759D1C3BEB;
	Mon, 29 Jun 2026 04:45:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C724146D5A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:45:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782708324; cv=none; b=TmttlcIGIOcTaayXs51TYuypqF2mVL35uXsxn+t/GpFMRLOO6FfIzMhjr/0gV0rCRuKDvKLYa3w2xP9C/m2Tx00p5h8FW5Qay5w94MdN5iUzr6fi1Up0JlY+NHXHs92AKox1mljmDmB6WKcDe71ZL8DmjaXH+xdTzDiglUYKXOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782708324; c=relaxed/simple;
	bh=rXLCNJs+Qe724FhfE2i9Q4xJ8zLaKMK4WBawo5xVmgU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UxPloV5Suo7GV5ERtfGRvelpQBo/VM+2IeJDu8eg5rf1yq5mTqpW3+A8iZ5eHDfJlgtJrS0KcxWQOlGnS8R4yU355vqjFfsq3jLFoB+rJexhFkb8wsRrTkfbcNMkhnU8X7kzRD56Bz24dBnkuAPCCHo+PbmsGipP5tKqVQlF0bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nj62Dj27; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=A9t9ScEI; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T4NIBK1754332
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	N/ONYuKSNB9L9k/0hIlFfK2VKXuFxKv/GIWbmK4yBlE=; b=nj62Dj27RzKisDHd
	tIpLgVCqIYUyM+CaF6mjNZzjTBMRGAFQT+EhVJWQIK7Nrf8/DidIBmFbQHqvaj5a
	2GVuX6kihYSF0TaHaKMJkTPKDuPxD4+/jUQe+0rZjc7ZJGEvZEC73X9mmeCbK31B
	IAMk5gSQUcY5GZmFJgpliRYnWoPJhtTJWCdEUYWQgcQW2KMFpALX4hFQAsCLRCSs
	2XIieii0C0rbuYaYErsVB8tQsP9GWrH8sr59xEF7NknMWoqu1vnBonhy1Fg+S+i5
	fFU/0uz36t/kmyYtShlhJgfRWDUTSiEpmVWgiHQtSovooWgv9cTsZ5kCdFaJYDe2
	MWiCvQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f27334gmx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 04:45:22 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ecfc5dea0so423404eec.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Jun 2026 21:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782708322; x=1783313122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N/ONYuKSNB9L9k/0hIlFfK2VKXuFxKv/GIWbmK4yBlE=;
        b=A9t9ScEIQBpZTrX+IEJb68hcLzBquu6fd5DvKIyZDrvj9rl6/T0DHoHauMrkPe+4NE
         NFtnJo9vrp29+r8csYD1iOcsD+hMc5He1PzHpLEJfLDK1CmEPlUE1tuvzOcFtEaNiu7G
         nSjRTPUOsnZ9KUQ/VP52IPc6o/eilm0S6dkHIqbfX72Iznm7FhqEjsjlClYbwEauL0mU
         QIVy/ulB0dGRSLpY88HZTJcs7Wj3f1eRJa00hJTtrSvEYT3HWyac2pH2OUUNg6fMj5z+
         eKIzqr6gCm81MI92D9xYsONd+bB/YgGgQVIE6vRscH0qwOhREBtmeNkkVpLZkH+f9kby
         6BkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782708322; x=1783313122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N/ONYuKSNB9L9k/0hIlFfK2VKXuFxKv/GIWbmK4yBlE=;
        b=eiSS+8f7IDvypTVWgZmeYsSTdh4Su96qpkfkxpWye9oSMi7TB232U461LBEp04O6E/
         rlrYmTMnHNnEbJoYzUeKYmLYxoCOsQKHSXmsanmWbOdI2RmxtBY/TO8C5FtooblMsIgK
         tMgHgrc6cw8RiD7I0fovEUqonoHXIG72HmYEKP26tNnwdZuqIMqJOFtTrcTv+wHKa6Hw
         tkKugAbHR8fVx6awr7wSQeiCXJmaKOBf1mO4EU11z6mionPqRjNscC1+wQaUyjfZNAMn
         idbbS37fOGOesLwRGFReQVQLHW1pUB/Bk0p5rb2/goh77WIOCOUhSMnG+tmBtWRWHPek
         3W/Q==
X-Forwarded-Encrypted: i=1; AHgh+RqGLx6UJ3wEcUpGMAFfkoVJkocdozfTVHO86nsnCEUb9SnST53/BnFvtgwrlLPe7VG5zK9ia7A9+KNDRvDg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo+WGJPdSG03h0yZ2VutQ88QCV2uW2I+/Mxy2AqHa8KmDJiy87
	AnSHUF8hmoAyiQn4nWiP0fH8vQAkTzjHCpSHjRxcPM0eH1mexGRYjf8swAQI55bqXbMvHsThAn2
	0qR3VNI/ZqbygwdrC7M6a82kTXwRZdwZomJ2tUHrzx72FnPJ/7R2gk9IE7CuDd7N0jfmd
X-Gm-Gg: AfdE7clm1D1K4G54pHeSfKWZzJcIv8PPyfwiyKdbcleruIb6/rW8UzpL8cr/okGY9GB
	sHIiUN2+JCsChBdaKFz2QM74vwqHY/eSpdqZKKY8GjlFEVMIjBVH19PaHInT1//3VL9jYYlPxuM
	kw61ut1KgJmTKy2RVXw+Gutdc2Zw9wSKhXtARv1zna+1mcwWJGTVhMHVExKpxWsZyR4u/t9aajy
	y7Fa4hDRc9aqpEua+vXu7oo2nZp6EwKMuYSxLjvyvrhZ1OE3uCH9kcnX83gFl3nc1lCU/XQIVqW
	gtE7qpHxEr/T39BcPOIes3IrQwMdbGY5T8cR4CVds2bV5QxuUS9GuuxsScy3q0BE15IRyW4IyJV
	+oMWfeSd49FupxdozRF7A8WVCPKXJVCKYyvcDN/YLrCWUdQAlPg==
X-Received: by 2002:a05:7301:3d17:b0:30c:ab4f:46a1 with SMTP id 5a478bee46e88-30cab4f49e2mr6958783eec.37.1782708321731;
        Sun, 28 Jun 2026 21:45:21 -0700 (PDT)
X-Received: by 2002:a05:7301:3d17:b0:30c:ab4f:46a1 with SMTP id 5a478bee46e88-30cab4f49e2mr6958762eec.37.1782708321218;
        Sun, 28 Jun 2026 21:45:21 -0700 (PDT)
Received: from [10.218.21.154] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c9c456cf5sm31828038eec.2.2026.06.28.21.45.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Jun 2026 21:45:20 -0700 (PDT)
Message-ID: <50d2ca43-0f0e-4ebe-9581-28f0d604129f@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 10:15:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] ASoC: dt-bindings: qcom: Add Shikra rx and va
 macro codecs
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, linux-arm-msm@vger.kernel.org,
        linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260608172023.2965292-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260608172023.2965292-2-mohammad.rafi.shaik@oss.qualcomm.com>
 <20260609-cheerful-translucent-carp-c44aff@quoll>
Content-Language: en-US
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
In-Reply-To: <20260609-cheerful-translucent-carp-c44aff@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=F+FnsKhN c=1 sm=1 tr=0 ts=6a41f862 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=PZ1Z1m0jGWrO_7-F5i8A:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 4Cagf4Sd5OAb0X5vq73pcIpJVp8qDKUh
X-Proofpoint-ORIG-GUID: 4Cagf4Sd5OAb0X5vq73pcIpJVp8qDKUh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDAzOCBTYWx0ZWRfX/EvFfwSnqK31
 iYTi2OHwlVxp3mrc9nEShaPclVIq9jU6Dorqp4jmnpeX9qsY/0ueIBr3WYuy2/E15TKy/SNUPsY
 BNOXemS/CAmwa4oraNSQ/4SNEoOIObev06L3eEAPjokFdq7PDC9/LOpnPGXTIMfTzG+ELrmfi6c
 R2UaOVBSJqxGnpPyZovXvun7xoYfG3C52ni376AiFztxdq7LHG143DzeCdAFIHH8228W9bV6ho2
 54OYNpW9LnhAx8DYeUh9ixHzlJdFAMoJ7nsRvuM8onVjRaeVKkRSu0RvWBYaIrHvLOC/iA8SUUZ
 Yqft8/yj3Mer62JRcCazMQpW8nzv+ZPQ0BIXs1oH8WBt3VvT7XJzPYm8AUP4DXSF9r4bQZZyjiP
 FVkfxGNvWtzAVCLENBMWfQbwUf1MtZAaHCeqTKnqO9vU1lVoJfJTZnAQOlgUpIKNlHAHmsH1zz9
 i7xJgkAjREX26U/h4fQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDAzOCBTYWx0ZWRfX8aCcjw1JVoQk
 vrEIQnWlSNfJ0VJLciv8SAQw2YdOalKj9kjoNO45uDtcPAtI2TPFBl/URkm9Mdh3/2swmtI36eA
 aI6o2vRmOtj+4hCMip4DaOI2bu3jP6E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290038
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-114824-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzk@kernel.org,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,perex.cz,suse.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohammad.rafi.shaik@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 632A16D5EA2



On 6/9/2026 12:56 PM, Krzysztof Kozlowski wrote:
> On Mon, Jun 08, 2026 at 10:50:21PM +0530, Mohammad Rafi Shaik wrote:
>> Add bindings for Qualcomm shikra rx and va  macro codec.
> 
> Which are not compatible with older variants because?
> 

These are not compatible with older variants because Shikra requires a 
newer codec version with changes that are not supported by the existing 
bindings. In particular, Shikra introduces an additional adhoc register 
block, making the previous implementation unsuitable. Hence, new 
bindings are added specifically for Shikra RX and VA macros.

Thanks,
Rafi.

> Best regards,
> Krzysztof
> 


