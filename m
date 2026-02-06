Return-Path: <linux-arm-msm+bounces-91999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YAHoBhS6hWmOFgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 10:53:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 75815FC401
	for <lists+linux-arm-msm@lfdr.de>; Fri, 06 Feb 2026 10:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01BD4303275D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Feb 2026 09:52:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 547F135FF7C;
	Fri,  6 Feb 2026 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UMuWGk/K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="frUVE0ed"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2297C30BF4F
	for <linux-arm-msm@vger.kernel.org>; Fri,  6 Feb 2026 09:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770371524; cv=none; b=KsjjuuS11yz7BJ2i2cUCw+aQd4y73qBawpfGdvJefO7Vjc1xhZ1Rq0vWomDv5C7vOvNhX/T1BmGIcVTxzehlYJ2YaM69XCaJ8N5vdaIR0QSZEuhzoiUNDOaKGpuVK0/KhKxy/Kwrx74+GHyeCJGgKCfQu4iRSn29PHcC3UfwFGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770371524; c=relaxed/simple;
	bh=mYBee9Hggj8rVvtez+7n7E5QCcVPUnFcTz/sm/1IMXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NpqEUzdE7tJ62AsPBCjdWGiQtvzVeOL15N+8EJnkNCfo4faHiqUGYS8Zy0U4yHeBnuor407MpZQaIava+S5RsmUJbAwXqYw4OZBqIGHFNzCugD7wBTJNQL4B56yQw1T2h6qGxm6DpkERAzG//NfRqA03AR6u04oz7mEDAXAvKE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UMuWGk/K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=frUVE0ed; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167XfW81852738
	for <linux-arm-msm@vger.kernel.org>; Fri, 6 Feb 2026 09:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tJl4PHjuM44K9kkjbDDtaJP+LO52a6d8NDjnT5ppwZk=; b=UMuWGk/KGBAoq+mg
	gKSL8ho4mhJP+nvPmpTg+f3BSMYqpGd1Ee6gt7x4v8V9MMsjTTEZtvT7sqb16iR5
	mYh+G3Az8Xkc4a8QGlUX2kDXems5CPDfSHaQfqUEXmQb1/SYa5WEU9ysM1u4TS/1
	APXN0ROCuslcFODpcfMbUStHlSgJ0vj+WLBkWxMKsjspdk4ly3Z60zgPA1Vnf4Fa
	PkrppbYkl20WKHJwMjlAkU0YBQ0BkaRt5I3am+JX/9tpV3qMoAX9HLjhLSIgZybK
	JYONw4zG1eB3naEMR7vcLSS1mGRxm9qD7aR/h3mCmP/vS5I6C7P1Iu6qH6zAHqAP
	2DvsAQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c148ey0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 09:52:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c5296c7e57so182957385a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Feb 2026 01:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770371522; x=1770976322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=tJl4PHjuM44K9kkjbDDtaJP+LO52a6d8NDjnT5ppwZk=;
        b=frUVE0edL5wEpfBPU7HcYfq1FElDoVmV9jPXxi+58EpgXBCRpkVwvZg2mT/CXVPCRy
         usOXR4H6SD73W4BsHx+eYBRfaiOjpipW/oiGl8xG9FA2SH7Eq5ZO2m0SwnKqG653v2x6
         ufhyEd+J44yjLkZr9rn1HI1u4YWKbSpNc7cn2xNsUYsFPiOCXZbPCWdIl+tX0f5X35Hr
         3KWjuEjv6ai9F3YEumTMZ/e1HLsadToRLEajhqNaZ+XPc/ugn5Ti4IvjNI92zD8dn1NG
         oJNI5di5+E/Hspvc6UxCC2qlSk5U5nhgGYgGx+RPpLjm0tlerxrDmG8EzM/IWkYefdhc
         YerQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770371522; x=1770976322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tJl4PHjuM44K9kkjbDDtaJP+LO52a6d8NDjnT5ppwZk=;
        b=E00MdDFg+A7uyJZIzxIciaQ6sy/F7jJhRe24si10J1ZQiIIwUrf6+Qs6rA3EEAtU1j
         C5xQyf9xaU+fo1k9x1wJZYBzJ4rNw53YPmPuLP4aMeXE8ol/VaPLirNEaNa6/j6qwpTd
         EEt0rs1gwD6nThsKg0Ki2V0ZBs4ilGIjtsw/ouo5lluKLGtVk2MarUK/n5Tph0lWoR3m
         08H1yfH2sQjkjOQkcNxqMuhx4R73cupkcpSsH1lEOjjr9ldqBarqMgJzCvQaOQJfNFRp
         pb7iGY9SmjFe50zSNE8g+mElhT7VRSKtWuV3CEC1foZQaToHF8GZt8tTekksOHc3vTdH
         iBew==
X-Forwarded-Encrypted: i=1; AJvYcCWeIAf5YloyhoepFeO0mQMvcJjdBc/Hphi+ty3p2J0l/d18CycXxejfltXt7W1rastWQhtjeotuGmrBlfWB@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1EI1RqvvHSIhY2pxfRFHjGv3WkXoxAsG3/fJIkXs//evWXqZA
	vB0LwwovDfUUXV93EDHhufkZq5NX93DRZ8ynfS3kaOSig9pHyMRJPpvpuF+gsKHsFKElSUx75mn
	27bp+0hEdT+0YBtwCxYxmNjXbH9POHNraUp4Ms59BlEkmjEuCCVymJ3bmnY9pIYqgDew3
X-Gm-Gg: AZuq6aKPlpmvR110BHGx3NWQCRJCgl1jnJ137GgYgSmPB+roMXbK++3zHUAZ7kJD1Ev
	8LzxFSf0W6Mt8FxR9EyNAbFXLVTDNpw75U2RQO2vjO0TE85LgoaLxWu2YI2GMKnuswWSMgLd/PH
	QBmELatUDbqEa/KWS8xArb1UKbD37JXj/Emdjg6w1JqzdEE7v6m1R+Zi/RfVFg0BONfjgiG9qxt
	v76GAv3kXoJNqdWsmDN+yzeCBZYg+1midI34qejhVkuF+q/8/jovXh5RP+hsI5Hj6kEvUOGeoA7
	0ow05aG/Gx742UxFseqYHdwBziCEMyxVabu7Vtg2Gf9VzIF/SgvxFUSW8mvbPOZazJ+ruuP1aeI
	bFDEg2ae2qR+dqYs4gEsC/gjNuarFIy8I6Fj4cWvaKuC7CRBT
X-Received: by 2002:a05:620a:28c5:b0:8b8:dd7f:f032 with SMTP id af79cd13be357-8caf17e4993mr252605385a.78.1770371522511;
        Fri, 06 Feb 2026 01:52:02 -0800 (PST)
X-Received: by 2002:a05:620a:28c5:b0:8b8:dd7f:f032 with SMTP id af79cd13be357-8caf17e4993mr252604185a.78.1770371522136;
        Fri, 06 Feb 2026 01:52:02 -0800 (PST)
Received: from [192.168.68.118] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4362974527fsm5024424f8f.31.2026.02.06.01.52.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 01:52:01 -0800 (PST)
Message-ID: <6b12d222-f0ad-449d-a1b7-5c605c7def81@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 04:52:00 -0500
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/10] ASoC: qcom: q6apm: fix array out of bounds on lpass
 ports
To: Mark Brown <broonie@kernel.org>
Cc: lgirdwood@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, srini@kernel.org, perex@perex.cz, tiwai@suse.com,
        alexey.klimov@linaro.org, mohammad.rafi.shaik@oss.qualcomm.com,
        quic_wcheng@quicinc.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Stable@vger.kernel.org
References: <20260205171411.34908-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260205171411.34908-2-srinivas.kandagatla@oss.qualcomm.com>
 <a8706da6-20fb-456e-a428-4c7b2c5bc26b@sirena.org.uk>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <a8706da6-20fb-456e-a428-4c7b2c5bc26b@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=P5k3RyAu c=1 sm=1 tr=0 ts=6985b9c3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=MH57ECg2-oXzDb99KDQA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2NiBTYWx0ZWRfX+VMdXCiBbhal
 g1LXlufuGJBZqF1HfxiCeRiQGQVq+sv+m1Gbee8i4iIyV7+qqfU9GlEtEW/mwLcTEWTpuj4fQet
 H+nrudUYOvJlZH4c8u20iiIrBuD8CeizYE6VIVII0rUF5egrcwOHrU8SVd4SUWJ3sWp8Lq2ovSP
 cZqAie+Ej/rdI8WTbP/b4POfdcanPDYNfFttWnfKwmtmct3+hHPAQBg+RuXvwNcali1rrc2hl7X
 OpKTxi7l2+XLjEmtBoQrIxzANQS1+iGcfu2a1D6uZqu2FA9Ci+IY4huVJRKLpLKpTV/dp61N6qs
 +6JlN8cFMISARUyF0o8HXceLQ8TPfUL+ncucqHkqk8MhV6NElNve8mIjHuB6WrzlhxaS+qGhVgS
 WKqhM8NyLq79j/7aToPS/QOg7zmZClm5dU7Avlk1/cpu12BHMpzL2ZCch/p4OtNbtlIKjXBlQ5A
 mvtug6bXZLEIBo4r32g==
X-Proofpoint-ORIG-GUID: XNEkAGyvvwB38JGGmZkfYjcw-7hkvjG-
X-Proofpoint-GUID: XNEkAGyvvwB38JGGmZkfYjcw-7hkvjG-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_03,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602060066
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
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,perex.cz,suse.com,linaro.org,oss.qualcomm.com,quicinc.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-91999-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 75815FC401
X-Rspamd-Action: no action

On 2/5/26 12:46 PM, Mark Brown wrote:
> On Thu, Feb 05, 2026 at 12:14:02PM -0500, Srinivas Kandagatla wrote:
>> lpass ports numbers have been added but the apm driver never got updated
>> with new max port value that it uses to store dai specific data.
>>
>> This will result in array out of bounds and weird driver behaviour.
>> Fix this by adding a new LPASS_MAX_PORT which is can be used by driver
>> instead of using number and any new port additional can only be done in
>> one place, which should avoid these type of mistakes in future.
> 
> It would probably be good to improve the valdiation in the driver when
> it starts using port numbers.
Good idea, will try that out in next spin.
--srini


