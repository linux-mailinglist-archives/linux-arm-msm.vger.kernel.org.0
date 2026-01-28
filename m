Return-Path: <linux-arm-msm+bounces-90985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sEwZF7L3eWkE1QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:49:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F99A0CAF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 12:49:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3853305A4A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 11:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E66534B190;
	Wed, 28 Jan 2026 11:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BmBcqrmn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U175rbEY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6441265CC2
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769600451; cv=none; b=pYTGnHHR+EI9+9IXKJZXSkzPyZQ4VVzQocLzQQdBWNcM0krwlfMTJrvhpr1/A2P8eyLrvP4fDSUiIkmN9WqffrR8Xuvt63W36LQsW9MqvinIDM4xwEkiNTqRz7f92eENUvgTObVNu3Ye+Zs2OO4FTDTpKSQST09z9cK/g8LCT9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769600451; c=relaxed/simple;
	bh=j/ge1cYoVoKQtm8+vTtBK0i49s3h7i9Wjhl9szH5/vM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D+21KIyYF84DFZJ8y/Gax1t/g/fDQvr68iAISo2neDZV17WrTpBEgSAKt/sxKbqUF00tIPGV3/Eny8BqK/E23dt7UW06Kpd+SlWeJ+jo1cZ/YdAR8I1CgReWuHOhKxfu9RKprMJa9V/yaPe6JnIgubsXvCRGaUoTewdf7xQYbSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BmBcqrmn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U175rbEY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S928lo811672
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BTab+FcV48Rmd0EeSo0ZDg94erNKh3uHN+XAR8aqhmE=; b=BmBcqrmnjPGFHZjY
	t/ocnHaHSeG34qPSigvvm/QrV/nO8EPd8yBXcANDDoyQURw7tUwYL2hre9WiDwmm
	aM17gDOogpVlST4FFzoB9xiiZJMZfoq4Z9fzjaWQbziWUXF72Cauu1WI+O6dg402
	ibZHDCGYDKrZNfvv0iBsaubrceIQddt7AKv7ZMyntz8OFs6KSIe6etjFkFs+pVm3
	SBoyBzHQ+FFQFPOkBdAFF8KPK5wxfGhBJfBIS1EMAtDsWdmgq2/4ArBNCEu9V01+
	scOxBFrRFw8pQP9n/V5UOk3Gl0Wztzl/2OGNhoy2Khegv2YnNYSYtkfjcLBi3Okh
	km3Wlg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by6qbj9dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 11:40:48 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cb31bcdso15404485a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 03:40:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769600448; x=1770205248; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BTab+FcV48Rmd0EeSo0ZDg94erNKh3uHN+XAR8aqhmE=;
        b=U175rbEYCubdXT72iNFoMAoOdgYlklGwAm1J7Oy2xnuTQRRssYNHgCytOAYNnQsXAu
         1jenypo6sFlqD/jTnmRHHh5DMOYXbYHexxsnd+NcAjqEdA9N1Da2kbfUxwsHXn9PiO6j
         87QkVogpn00NcN76d7AV56cLobLZ8xwu4u1hjv5zcSo6dnaVOI7V2wCbayJqvh00Z0Bt
         wYgGQDT9ur74UZjbaUUAfWzFFFtTBU1OPZCQ7kobI1OpvRnGeDYjtDvq3EHwTNFDIgeQ
         RsY4fO/9pFi7q//Sx85XfFlKjil3ZFxqS7GEyIWNlB5YotN2/At75GmoU+DoR8qWmhPo
         JMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769600448; x=1770205248;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BTab+FcV48Rmd0EeSo0ZDg94erNKh3uHN+XAR8aqhmE=;
        b=JRI7cMcEGoAFS/tumCwVpqL/m+3yq7qKx4tfhGYstMpTqdtLWWnr3j8AtHHnSOUytZ
         /H8F+FdJ8uJ21rT2kFUHMF8TprI2uQGUSSlF2w6GRhbOCEpdswKDpl6KfX4UjzZfSDOP
         /Sfp02TBCn0NtxAQ9OBzBGbF97q/qRvi8AKrmZGE8VvqQzgkxrVz8bpESCvqDFvjrTDH
         NBg8gUIUaAPPWbI3TXMzJepMl4kgmSoN2LaXvcC/BDoSrSTNHCSnU44pPhUOXjw3O6BC
         9m8D4O089dCHVxNQz7WOiYDEw4oTz5I1bLEv6fIPVosCDZxFXkNqPf9lxjrUut8kneHR
         XNnQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWJX3j9qgZbS7cg7eGV3pObYsmjf6OFqeXJrP1J8FOJP9hb8yUmxCQy3fA99UetgObsTN+a3k52YcmLPLY@vger.kernel.org
X-Gm-Message-State: AOJu0YxBKMe+UCyW073bNRsaiJcDDrrhk/C3tWJ9s0fphfqLQ7fH7s96
	x9k3p9kUeuuYmFsuG95DW5iO/7JiAmj/VLMqDWHekBjbBxs5xCgLQ/EzHuWirHv7fnKY4chb1Gq
	KcjnqBXeSt3Izlm0wUeThnKEwkh3dQZq7m7Zbz1YQoDk+aLF9VnQaRLqwtagF8NMTUGcV
X-Gm-Gg: AZuq6aINOEscblfQs3smcAi53f9iLu2CRV5tnzyIo25ZtPq/ezjlkjmfVlo2ZE2hiLH
	B8Ed/N21tHQ84lNlCTUf73jGptzjSoCu5gBz3Yeb/9j6ZruQ52AHBrdncCQJu6zLHdpbttQDTLe
	sSfIS3C9YCXGOBNWsrbEsuUNrGSLM9KGAu6Y2aMMDFcO0/00E3z28mU4EYs25WtvbWtExRi6c++
	bQXfRnp1PPsPz4tDQwsUJfGrqozEjPP1C0MwYrt8iak7E2nWrsRX8B5KwrBekA7ysmgNVM9+RCd
	xArEKcj5GNadcjWCDl1ePmW9PnZnQaJ7d5vvh5fJbG0h7eiYhtzoO/YZ37/mjNqNNw9Q2RaseEu
	T7y6gJ1osxq9Wrk4ZBJOhBGdcyykCM8VUpeWmaEAeDMaGbioprFRwwcl742d8nK342d4=
X-Received: by 2002:a05:620a:4721:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c714c2db75mr120509385a.10.1769600448007;
        Wed, 28 Jan 2026 03:40:48 -0800 (PST)
X-Received: by 2002:a05:620a:4721:b0:8b2:e704:55fe with SMTP id af79cd13be357-8c714c2db75mr120507685a.10.1769600447594;
        Wed, 28 Jan 2026 03:40:47 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbffb7263sm111387366b.28.2026.01.28.03.40.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 03:40:46 -0800 (PST)
Message-ID: <747e0bee-9b7d-4389-9114-92882e91cf42@oss.qualcomm.com>
Date: Wed, 28 Jan 2026 12:40:44 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] arm64: dts: qcom: kaanapali: Add TSENS and
 thermal zones
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
References: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
 <20260127-knp-dts-misc-v4-3-02723207a450@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260127-knp-dts-misc-v4-3-02723207a450@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: cQKeYK80qvsNFnpVtUxjEr20STP0NGXI
X-Authority-Analysis: v=2.4 cv=Z4Dh3XRA c=1 sm=1 tr=0 ts=6979f5c0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=1E0oVItFzmgg-7_I620A:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: cQKeYK80qvsNFnpVtUxjEr20STP0NGXI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA5NSBTYWx0ZWRfX7zKKnaSSQ6iG
 LZQ5/NY4u6x0/y4iw/Dgwbnp/ZQJp2uAbOzlwl54RFC7K0iCB2f9yvamjy20fYVTNTNfQfZgzoI
 i+zxeb8FsVKFkpUJwOIjdxOwDiPMnqcRSOWHle62xDDVe9RWQKxYD0jUWEem7klGVlsDCaBjSwl
 5WTN24I4SkHVkomqaxZBXkVPEOO18l3DukGRnPvGLgdFycVOoxLeCfQl96lBMOZMu72MtqpKVvn
 OVR5uo96ndEKpIAapbXBt61QH6Nzf98amkXPrwUJ+pAAC1YOEttpGhV3dJ4lUIra4YpMUPiJeV0
 ROfnRV74/BEmeCH+TtfKy4v55E3H3URZlYSxApEnZr49ZGcYF0QfOxhNU9rNh5bc01WWAkiNdZV
 dVjphBO3qxy19V2fjO3jLKprkrj8Zz0ZWt4eO3GES4jYzvo4klJra+FhToFe2Xa7Pi4zbFgrkk5
 o4injDDOr0ENn6vEYUw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_02,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601280095
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-90985-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C5F99A0CAF
X-Rspamd-Action: no action

On 1/27/26 9:34 AM, Jingyi Wang wrote:
> From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> 
> The Kaanapali includes seven TSENS instances, with a total of 55 thermal
> sensors distributed across various locations on the SoC.
> 
> The TSENS max/reset threshold is configured to 130°C in the hardware.
> Enable all TSENS instances, and define the thermal zones with a hot trip
> at 120°C and critical trip at 125°C.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

