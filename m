Return-Path: <linux-arm-msm+bounces-119273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cq2CAoGPV2o0XAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:47:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5197975EEA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 15:47:44 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=aY+PmiaR;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FMQCdYYS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119273-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119273-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C962311835B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 13:41:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0BA112F0C7E;
	Wed, 15 Jul 2026 13:41:17 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 655632EEE65
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:41:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784122876; cv=none; b=F1ddNIwz0Ez8Hc+YBlRKMdk8Cw3jypzjq24R8Yt14VWi8FuTHqRT9Zkj1lHYmrdfG92PEJCcsO/xgz1lRgL2iHD3OBG7UiUD2IiBgjoVeA+Eqb4RtViSii50QUIBlNzw7KYHkNt3X7BxjBOr9IIIynQXExlBB3e84soj7KhNsSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784122876; c=relaxed/simple;
	bh=pz2SYwnFXEo45x3poxgyvBRBbqKCYUxUb17sAp4CMLU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=j8Bd3y9OJdE1C2tXjz4bkfOvEyFW+3sTdftK7aYCDImB2Pj9tvgEkEMj7HnY0jHZD0LKjk4UKaer6MJnH6Q1IKAC/yTK+c3EZD6Rz80DQ5fq5hTNBdbW6QRfrlkQvo3dTUkRW2jLd68iNGb3XWif/BxXOaKUUllXQzout92TCUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aY+PmiaR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FMQCdYYS; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcwxV3579150
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pz2SYwnFXEo45x3poxgyvBRBbqKCYUxUb17sAp4CMLU=; b=aY+PmiaRg48/HlSe
	vRnBgSuzHMhSstyNa8a/9mrzriUVMu+7ckJvNBKVeZMoppt64ss9KhWTesJPe9Ur
	Qrkm1F580Zqe5AHf47PbGDjrAr16DJC3M0uTSSw8wpjCr5uteZemAYFTOyMvxZK9
	1f4C8zsyQx7i+mV8GVwBmI/dBYnvO9laS7zMMng9v+LF+hgtLhexOP8EVkfBj5bC
	KmVbqQnVyciR1ACCgYhd2K2U5T75ZgrNDY0zbgudulXPhDjWsv/1urnOCRoCzGNS
	FwIhohpIrcDI2qLby7C3O4pUOf+OMdW2htV2w+WQwqkDgFWSoZL+MLEicfNPK2l/
	nS4llg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdwk332k3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 13:41:14 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ef18406878so96993896d6.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 06:41:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784122873; x=1784727673; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pz2SYwnFXEo45x3poxgyvBRBbqKCYUxUb17sAp4CMLU=;
        b=FMQCdYYSsfwdeYn0jSEUzGAY8wNJgrQWTzp1fBhEnpa/ai6QONcmIszZEu3AGyfgNJ
         FyQI3DCya7r1OUY/s+HfUq8+YceO6KH1U+/9f+8JcogoO7+bTydCI+n1atdUyQm47isp
         9Tv6x4FhM/Crz0HkzeR7d1gOb/uMs/oC8Azq0112aBvaHsPZZ3AfiBJIskBjHSH7xwt4
         Jf7Z/yeVUFN7JsGJI4iME9CCadkHMUMOMdgC9/7BKT47q6gFzwNW3xezcsrcDOCLvaPq
         /Kz5YJ+IPFY267M54huJjFSX1IwadLz8itpKNnoaF0kwkxirNfrfxrqmGR/9tzGv62HP
         TUow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784122873; x=1784727673;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pz2SYwnFXEo45x3poxgyvBRBbqKCYUxUb17sAp4CMLU=;
        b=rd9BKgLE/rccq4rglj4YDwLBEnb278kChpvm9U1nrPGjFyUTpsRQHSNYy+Ef9WW0n0
         +aKwH2R36hj8SfA8ihMMnn5Vs6BBHx9lGIgJaUed4tbr3fPWiir76HOvD7d6J/N5Ptdo
         VpP1XvFZIWA4uYJ7lo6DoIk6x8nohdRj6Zmi+VgNhZHKMqwM3GInPhPK3AhFP/OMePMI
         YJZtNmzO0eFFDtaaMca7DqBuSJKa6InECu5aBumghROn3q+l/y1VPLftuct17OdL9bKN
         9E0UbPXC6ACqSLQfhqu6+umjW4TiYhQpGv8ngVolGzvvLt52Dp2JdRwH6leO8R8wPMxP
         TMwA==
X-Gm-Message-State: AOJu0YwKaljWv4eAuhV4ortiO7FAOQ9d3ERD6aJ15FVuR1ds+mLsSj6+
	U5FKiKTyEh6xIvDbwQzohVctsujhQp04um2tpfAXKQ6+iIEBX/O6EsgygdX/IT406mzT6K7PIxS
	ueTCYEg6JzrscDSR6p47Jv3WOOsJj+jQkfxCnBgCCfMbqCIxaDXP9MqUGwl4VJpfp4QVC
X-Gm-Gg: AfdE7ckSTqAahQvl04NzKXYgMM+JN5UdhhdwNyKSNN0siq1Cep0r6Isze3dRKHnYg7j
	Aq6sqdA4db0dddJlPHlvsE+Qh3SQO11zn425Ykey6c5BJXkeqMFjNhh1L9Lm4xomSQ4KeqqVY7I
	1JUoD8z6DPqb6/zKFInWmmui6G+jHsGwtZJiPQa5wkEiD30wfXUoYp8KxfLG8cjuzxmXQ8muXti
	YAA5jaEsi53pakzCZ0VCtyq17U10JgJ52ZJdz6Ezo6+aSUreQgBsu4NTM47z19+4J5+P4wkAoiO
	kBkDN3x2T+3jrLv0mrJ/uY1wvJKw81qr4R+7ZDBrZYReEVJATvPxE2EEAZy1COy3SX5SnX2Co7p
	wZRUrZFQegFIW8o6Q9hrotR5xfp4Zg6Qyaj/Pfg==
X-Received: by 2002:a05:6214:488f:b0:902:be55:9f2 with SMTP id 6a1803df08f44-9074c826a7emr78195046d6.32.1784122873630;
        Wed, 15 Jul 2026 06:41:13 -0700 (PDT)
X-Received: by 2002:a05:6214:488f:b0:902:be55:9f2 with SMTP id 6a1803df08f44-9074c826a7emr78194556d6.32.1784122873043;
        Wed, 15 Jul 2026 06:41:13 -0700 (PDT)
Received: from [10.218.18.44] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd87c9500sm193023346d6.46.2026.07.15.06.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 06:41:12 -0700 (PDT)
Message-ID: <4f641f13-a278-4465-8033-670c7279a7e3@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 19:11:01 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 11/11] arm64: dts: qcom: shikra: Add
 gpio-reserved-ranges to tlmm
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pm@vger.kernel.org, Anurag Pateriya <apateriy@qti.qualcomm.com>
References: <20260702-shikra-dt-m1-v5-0-f911ac92720c@oss.qualcomm.com>
 <20260702-shikra-dt-m1-v5-11-f911ac92720c@oss.qualcomm.com>
 <9c1aab59-14b2-4811-b778-8e96645bd65b@oss.qualcomm.com>
 <97b205e8-5ab7-4205-b1dc-cbcb0497987d@oss.qualcomm.com>
 <986da1da-db2e-4d4a-b9d0-70482adaf4bd@oss.qualcomm.com>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <986da1da-db2e-4d4a-b9d0-70482adaf4bd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yc6NIQRf c=1 sm=1 tr=0 ts=6a578dfa cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=29Tt0ABisfwxuJ5Aca0A:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 8xgaTQKd5ZOZwERUgdT5gHFrra1ckf1g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfXz7oJ1UiA4q46
 COFyEnPP9mCs2fm3t4zWtnCzbw7XS+swBanOCFHEvqVp2hR1lIlq1ClD7G4fKTgx6C5pmxRXp01
 WKWTXijFFMq232b50xqldgl0rreT37kBtm0gUpn51c3LlYn7FcRFNdFEzBdQNOQnHoeTH+Ejr4H
 peW+OH5vbpAm0Sl5Qm35L4LRLnr3sM3TphMeLu633ogtk7jaiwk3NPyUB0i5T4OGI3501Xpnx5f
 g/bSdY8oEHMQl/EM4jOJfwWyc+EoNoqXYbuumrR/Y4Tcq+6tx2+QNePef0EIGZ+HeYj0YNsmP3V
 cFL9DahiB5p+3ZBl+XxjTEQG1Of4GoZCfYNnyh6aWDJUsqC1oGqUTDOKFJ2uQOx5aG6/g3CZ2pR
 In1a5djE+AiY+mAG7PyvBqJ6Et8i8eKmoorj2fCvt2GbTIIib1oRyDliAVQptoblrK9Ul5h7D5g
 521CelAt+f+Xy/1BdiQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEzNiBTYWx0ZWRfX8f8qzd0qBGA/
 qtr3chA7v2mJuWgZolYwUsDKXTOD8evT/REnOgDGzdi016pswPv1agOsNMHXtTARKQGu7Wkz4fx
 g/+HfUgY58HTJ2RzcT36HpULP1ug93g=
X-Proofpoint-GUID: 8xgaTQKd5ZOZwERUgdT5gHFrra1ckf1g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150136
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-119273-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:vkoul@kernel.org,m:Frank.Li@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:krzk@kernel.org,m:djakov@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:dmaengine@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:apateriy@qti.qualcomm.com,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5197975EEA1
X-Rspamd-Action: no action




On 7/15/2026 3:57 PM, Konrad Dybcio wrote:
> On 7/7/26 6:36 PM, Komal Bajaj wrote:
>> On 7/2/2026 4:25 PM, Konrad Dybcio wrote:
>>> On 7/2/26 11:50 AM, Komal Bajaj wrote:
>>>> Add gpio-reserved-ranges property to the tlmm node for all three
>>>> Shikra EVK variants (CQM, CQS, IQS) to mark GPIOs used by the
>>>> SoC internally and not available for general use.
>>> These are generally added to prevent non-secure access upon TLMM
>>> probe, i.e. the board won't boot if some of them are not protected.
>>>
>>> I assume the proposed set contains both ones that are _absolutely
>>> forbidden_ for Linux to touch, but also ones that are dedicated to
>>> some specific purpose that Linux _shouldn't_ touch.
>> Yes, some GPIOs are reserved for secure-world use and are therefore not accessible from the non-secure world.
>> I will update the commit message accordingly.
> I'm not sure how to read your response. In other words - is this
> patch boot-critical?

Yes, with Access Policy enabled, it becomes boot-critical.

Thanks
Komal

