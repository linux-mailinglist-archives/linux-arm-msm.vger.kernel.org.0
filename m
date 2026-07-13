Return-Path: <linux-arm-msm+bounces-118671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2JHlNiCbVGq2oAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:00:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 907E474873E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 10:00:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Pwi7cO27;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ZO5QagQD;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118671-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118671-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DFCC83044F3A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 07:56:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31EA939A040;
	Mon, 13 Jul 2026 07:56:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BEF139A064
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:56:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783929382; cv=none; b=EClNwO0nGuZdObkzMuZkzvDr28MRLB5p6tg/bRFz768wlKn1lmvvSvzMkLrrCelAXLBk/OokHlY20SsYdFYfpCOLK/iTqxgBzJIo2qDxqhv4Yqsm+cIHhI/2s1XA+DArNBvxOhKANCHt5dg71qL0+L17IOhCXqWnlFkbz2sfqpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783929382; c=relaxed/simple;
	bh=klnn4AulREPLGSwO5Wlck9J41piwEK6D0bTi/iwwsyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S1OU0I/Ss/ySzyxxsfrrHr8I6G7aSqm7BZgOrilNgqffbEnxRN+NBuBE4WcKAoseTStHRfJpmzjMjnVtV4h9jfkENK58SCGVP4eQebA2jr/wgumoAMLqTzpQeXIr67IL5SgQIkZJGSYusrSCu8Y2sK33z4aeJpAJTzH8BDU4a0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pwi7cO27; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZO5QagQD; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D6NfsO731623
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:56:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+PFkhQbhjQ87RJz3EDdUVKiA87gvndBXXidhZE1m3U=; b=Pwi7cO27qcAQPaP8
	itiUBkEmL+IviRPR0kolyEDk9Z7MhWWcIzpVj58JycvUCYEGYN5ZYF6f92SbJ8Uq
	e4/lVT1ffHyyqDszWb8R/9dKfJKqS4sicfLEpzruVDEXKhcOigSQ4vXbY01yPhZW
	cXrNHxaWmeAQANqcFKnbjQ0NnWUI/bSr4dvM5g/BzNq1DBTJY5zg2sLj/zm0+Dbe
	ld3Dx1n7UcaqpaRPEpb8DfMcdsC0PxUBcEL7L9eyhq1N+rBKqjq2/7OXwT93h6oN
	xPnVrKubdSs6xC/cAJ7InVaTAAKknJ7KF4tlv+WCLP5DkXYrcIG8KkCaig2VjhF3
	jg8IAA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn39gqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 07:56:19 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bff5c7035so62926931cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 00:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783929379; x=1784534179; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=n+PFkhQbhjQ87RJz3EDdUVKiA87gvndBXXidhZE1m3U=;
        b=ZO5QagQD4j02flQzFgT9Yb5z/1K6ct3P0HY02hiNIVRBt7eNo+J+mIMNvPVszmrJDA
         WZSp0traecLigpu4uIUrw8plV2i3Y5JGDTSKG1sC7q18SH0R5ESb6mRCuZ++lAjD/CsZ
         bG/FEPydHBqvVh6aHTJYH7lbXGNBwd0edWcSJiPmIwBaaw4cje6FMgHmVvgf2g1sU6Pj
         2y5mnrv1LZpdjI+vF00dpVRK7dCngOjvVasb+wR9tmP8YSoh9nCpApicOnmebOSLrtVh
         gYnUB8wWnrxUjysJRg6JOnTlbt49R+c+jJgYeOLVPY7NnHZlLc1NTUpC5+sV54YH3TYa
         kdnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783929379; x=1784534179;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n+PFkhQbhjQ87RJz3EDdUVKiA87gvndBXXidhZE1m3U=;
        b=CgN5iOrZ11S1pSbPkP7m3cR4u6U1RGSwgS3UvbendwEc1cHIIFq+bnqDTvC+S9Xnx8
         4geSJBMnuAaPhLFZTuOz51kdBI4WA8y8ud9H1NQLFwKNDUmE8/uUQ47/giAWXY/lT1Ty
         b1KKm281FnE2qymmCf4iGp+j/iqiGgKm+ETjTpayQW9EowCkRLI5A+Cs1aWEi1SaBGLx
         avmoxRRZF6cRRDK2ifC4t0ZFkRHNVs2oVKAoPl6RNnmibc6U/RByeUFx/tSyJ6HDajr0
         z9mUONSapq0JZRAs3GhR7rKH3JlSjKWFYKXetW2V3kbVIPAbTNWkSh5a5zrEGEy5hxAU
         csRA==
X-Gm-Message-State: AOJu0YzN+0b1iU+hQNIdEW1lYWmKAe5sVSiRRJZMPCPEvm/yJIl77Ki1
	fHhNoguU7hdKGbUjO6/2uzg/ejYGVB7Igf5pu0bq8GuulqIMag0/GMZgQX7PUbFswGne23ttqOg
	TP3GALDcpPY6SvNPEySdK+maXYqNwuG8papnMSC4XCRkyNJNVYfzP1LVu3DoCojjIdUNp
X-Gm-Gg: AfdE7cl1f9IQZsHhFzd3HRmm9kesU4q2JEj0JOknTF3DgOnDvm5s5QsHRu5JZuPTTEe
	VfQRNvRT7M4qbFCD+9q04kLGxJ32T1oY8BJvbJmm83WMilc1RdXi4SrM+oYwyk/eR29gs/k61va
	0bRfPd2Vmb2lSs4z0bZfyJnvmmXT3f71qE9RPOAif+ZWjyo2KG07KJdt3Ef60vBRUP8dvdbN1aN
	srw34pxeJRVZjODT+nUv7SvYBKGnL5k2fKrHDyBkJCHaKA2u3w5b3lsF97+wdVZjl/el5AVXVwn
	c8al2inryYtlxu/jX4QVU4RfEI6XrC82mYcW5NY7X+rLHiU1+96TV9Bhmzbnh29GBOjXtYeDYMM
	RoANTBwkQOMEgup9PR3CJ0t+6EfJpSGjJcfir2zR3
X-Received: by 2002:a05:622a:d1:b0:51c:ee7:c355 with SMTP id d75a77b69052e-51cbf2c12f5mr78770011cf.68.1783929378886;
        Mon, 13 Jul 2026 00:56:18 -0700 (PDT)
X-Received: by 2002:a05:622a:d1:b0:51c:ee7:c355 with SMTP id d75a77b69052e-51cbf2c12f5mr78769851cf.68.1783929378539;
        Mon, 13 Jul 2026 00:56:18 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.223.174])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm82823935f8f.20.2026.07.13.00.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 00:56:17 -0700 (PDT)
Message-ID: <aeadaf73-692e-4d31-9a3a-ec6b4db9ea96@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 09:56:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/6] dt-bindings: remoteproc: qcom: document hexagon
 based WCSS secure PIL
To: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>,
        George Moussalem <george.moussalem@outlook.com>,
        Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
References: <20260713-rproc-v13-0-41011cbcda3e@oss.qualcomm.com>
 <20260713-rproc-v13-2-41011cbcda3e@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260713-rproc-v13-2-41011cbcda3e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDA4MSBTYWx0ZWRfX1fSWhfvwf+X3
 rqyxVB6n5MIs+/L3QJvutqncfME6mjL8AZH8lyR0nKM+FJvkpAM9nsa4DIxluPVQtEE1tlDniHZ
 zc0DdE1Ce6ITNnieK3G8zowzKlUOKU27kT85hCMVq+vfVLDajr6G3x1fJKARDC8e8sDfWWW+LUZ
 IK2rLfSnFNyVA35WTHE+QRpi6pXnF2Rv/I3KtnxMetG3zH9VwoLt6ZRyABhoJDs36hAlqUmEkLi
 stpJwMS/DB9Pvr/2Zpb7TMVL54gQofNJlMpwn4OV65MWsnfm+iZlj01maDhaOGRNv3YphLtSxX5
 wjua5xQRQaxMruy5Y8wI0Joh7ecepLkreOLy2opOTXt3jwFXnJfC+29uXzzFK2hTBFo4xehm82t
 JwzUJt+3ueThqeRvIu+Rw6jXiVx/nCvnWi3+OiEiH1dK6NvqQbA+GWGxIfRMqzWcxb6O+52uL1q
 8SfALWHXSxLiPjc7xtw==
X-Proofpoint-ORIG-GUID: N7TNRoWpAeV098D_yFnoZIO6a7OkXvBG
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDA4MSBTYWx0ZWRfXyvtaZlGVl6p2
 Y8omKJw/x4osxEVHD6axO6uYZqZT0p87KmMmIbbh13dmoy3V7DFzxnXZjZ8EjUdDS+aJx+ascZ5
 JGjcjB2UYSJexoqL7OTwOAZdny79xU4=
X-Proofpoint-GUID: N7TNRoWpAeV098D_yFnoZIO6a7OkXvBG
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a549a23 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=N6niishs+lR9UBL1FN3Qrw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=UqCG9HQmAAAA:8 a=G97aMpG5GzAg4TnEwcsA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130081
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-118671-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:varadarajan.narayanan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:manikanta.mylavarapu@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:gokul.sriram.p@oss.qualcomm.com,m:george.moussalem@outlook.com,m:vignesh.viswanathan@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,oss.qualcomm.com,outlook.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,outlook.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzysztof.kozlowski@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
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
X-Rspamd-Queue-Id: 907E474873E

On 13/07/2026 08:32, Varadarajan Narayanan wrote:
> From: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
> 
> Add new binding document for hexagon based WCSS secure PIL remoteproc.
> IPQ5018, IPQ5332 and IPQ9574 follow secure PIL remoteproc.
> 
> Signed-off-by: Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
> Signed-off-by: Gokul Sriram Palanisamy <gokul.sriram.p@oss.qualcomm.com>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> [ Dropped ipq5424 support ]
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Tested-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>

How did this appear here at v13? That's a v13 so all your tags are
expected to be given in public.

There is no such tag:
https://lore.kernel.org/linux-arm-msm/4a4e0e9c-8541-4fcc-8019-10a576840109@oss.qualcomm.com/

Not mentioning that YOU CANNOT test bindings in a meaning of tested-by.


Best regards,
Krzysztof

