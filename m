Return-Path: <linux-arm-msm+bounces-112181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id CDL+M6EVKGqv9gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112181-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:31:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A98BB66093A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:31:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=IyKCWtXT;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BCf0LeOH;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112181-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112181-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 2460530071C4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 13:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 510407083C;
	Tue,  9 Jun 2026 13:31:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148102DC357
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 13:31:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781011870; cv=none; b=CSXPPKLtgW1/2gbdsAsWOU+uwBKtO8gJnrw5NBWRa1yKG0iO9OVjNxllgH2wLNBMhdCMearJaSlcJrl/z2rb1YnaNtGWYxDAWRpRXQRhXHEzM4H2GofmF8vj7cNA7WnRaxtI6NziuuzPY5XEjIc0/ZqFhra5Z6Xu+OkcEtFbR14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781011870; c=relaxed/simple;
	bh=PciPETuIrHifr8R1hM7guiG4dpObdPvFcrjqt2Wz96g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U1XKntD6OftApTMBJuC8gUsyU3sSybuUClx6YORqBzw1tbjka4T1KD+q7fH0xTYvMlhHS2xiZESOcYuM3+hOUQk/nn5eD+x3Y5Wyj92kT6k1FVKvcijHZgJRCt64mZoddti9/4ifQwbnC2yPGo9JT0AcRa0LQJF0jED9YY0ha1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IyKCWtXT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BCf0LeOH; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659ClYb52693995
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 13:31:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n3rIzOQooj4MOQACqpysb+d+qYmh7nMWfhScfIEjQME=; b=IyKCWtXThJnH3jGi
	FBuiLBA3+AkcvNWAMTnTJVj8H+CRQgbUNoUModwQuoMfMIoQwwuIMLAwE163yFoD
	IgXBDUf9csguFsdEfijrL1tABqEpNcloP/NgmM2/zAWbJLEqU6uIrGfDZUjZhit6
	faHNnBwoK2zpb/SRLUHLncvLQUGoBT7irXmIL/YeLJt2a5BvBe4S8oKrU+i/LGhr
	IxU5BpGjUNE5LPIpVizYuDQy/HM0bm4+/G3SzJHP7NVudRygKLFFal5r7PpeBFq1
	XoBq3v7En6XLHZqsuiJi+msDHmvz6qebpypF/xom/nKR410qskGDh2G2YSTSKvtr
	VIlnAw==
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v12yf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 13:31:08 +0000 (GMT)
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-43ec535078eso871963fac.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781011867; x=1781616667; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n3rIzOQooj4MOQACqpysb+d+qYmh7nMWfhScfIEjQME=;
        b=BCf0LeOHWAf5JcEv/4tsNlnROUOY65+gUZDZcS5b00gQoEQu/fg8JmLUSWEq6HhUAQ
         pvgJyPI7enx3HepqHioERZn3P/MrSGfjhDDamFrn7S+LEldxLzsyi3h8ghW2ZAs/0n1U
         kn/znkRTk79y8HiXL382go+4k68360fsMcImLrD7Ya4ONdMeB9KDXIamQpVBjPzAPV4R
         ry42IdHtlMbAc6mp5ACkAA2APS43zRBOk/5JoHanuVio9VqOCsCn3SXiA70Utd7Z3LdH
         SagkoOwwXpD/kQ0EhpgJOiPujWsut+aHGlvoKGxIX1FeJ5LV/+/MTEsiTQLci5mnDBB8
         VxGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781011867; x=1781616667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3rIzOQooj4MOQACqpysb+d+qYmh7nMWfhScfIEjQME=;
        b=emTR4att3Xqc2dI8EFaCmRZSJdirC0lFckJ0PP8EXODvGk/9Tolu531ZcZjL3+0WWp
         7/WQwPEwkpyfULx2CVfdGX9Tf0KfuP5W+DxJD4qtlss+Lw8ec5jgYgVmexUy91CqUaAj
         8dL6Lb1Jmj0WX0zIjTAzrVuVr13ENn3+8+KaHB2wE4dwGLxr7vqCVQejAqt4n4OvFHRU
         VKwk5xOsN8RRRZc5C1CVfWSJFiHc4OE0aTpVM/n90T5LmWy+RYh1ptcLrWTYFsB7oj29
         +4qCgY/rr9i7Fllc03iIQrITf6gJn3ZtJYnoPVrQR/j59lDj2vJO7AtQ9iVGXjFUO/j+
         asuA==
X-Gm-Message-State: AOJu0Ywz+/aikmB3V3W0M0kD6r5TbuTr6xz2kM9H8t+Tt1fRTIXZ3dpG
	Jc3GJzens9mFw/WQoa9CdIQCy/mntL94XcvVa2ysiV/jEs9AtoMFsvdTquCtTjR8rxa1ULfrJna
	BEFH+/DCSobdznzYxCTCE9k+xSkfjQ/PZclh2wv08iPBFeNWVtp716CfkfhhgmzAUpPTL
X-Gm-Gg: Acq92OHgx4NC92QnMg9TpO+x4CvCzdqN+JqnYdkc4Z2ZhuPHsx5Dz/8ZXlxCEk3fM2x
	MA2AuzAjAUVDCDlNUooV1GnGlRjJhjpIsI6J27ULn7+lfOTawqZ6IFc2xNXE6lkmPJ6BekgELCv
	+Wf1GfRwNE4dGFy80msvf7zv1nlRdcPwY7wWQvvrMpVNKJ+ptm0ZBv6499uz+UAxdNvesWx+emB
	oQA54e/Jm37mx4A5EJxM4zoT9mdVO+v0Kxf5e1N9sMB+jV+xy5QpIUEmhlkaWoqL6HfzeYRE6dX
	BYNhqEltStu5NeK0ZHEOB2/PFQxGL3+n8ukJIAtbFGJj5XM2gIG4cVNxxqdp3yp3bED9m9Idy5d
	WuaD7e3ErribaKU/22hgOch/M4fAphGEDK4aa23LCNNwhHS9tyS58EptQ
X-Received: by 2002:a4a:db85:0:b0:69d:513e:1a69 with SMTP id 006d021491bc7-69e68bce04bmr4357201eaf.2.1781011867323;
        Tue, 09 Jun 2026 06:31:07 -0700 (PDT)
X-Received: by 2002:a4a:db85:0:b0:69d:513e:1a69 with SMTP id 006d021491bc7-69e68bce04bmr4357168eaf.2.1781011866448;
        Tue, 09 Jun 2026 06:31:06 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf055500875sm1029528666b.53.2026.06.09.06.31.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:31:05 -0700 (PDT)
Message-ID: <fe5ff2e6-4c54-4b21-be5c-0f06bf0e6696@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 15:31:03 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powercap: qcom: Add SPEL powercap driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
 <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
 <7ea2f2cc-ef11-4727-810c-e32e815bd973@oss.qualcomm.com>
 <8f045340-a6c8-41c7-b1c7-6d9b87b05d90@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8f045340-a6c8-41c7-b1c7-6d9b87b05d90@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a28159c cx=c_pps
 a=CWtnpBpaoqyeOyNyJ5EW7Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=VKwP4syk8cgDA61-jkoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vh23qwtRXIYOdz9xvnmn:22
X-Proofpoint-ORIG-GUID: VWLT_XTZg0zKWnxN46RBVxOj4zEFSzYN
X-Proofpoint-GUID: VWLT_XTZg0zKWnxN46RBVxOj4zEFSzYN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyOCBTYWx0ZWRfX9/zJvtaCI1HY
 HwMN0nDKEbifB5/yGR1Lg58wv1m+5nhu4rqXqnWE0qwCKOahpSVxBtmfpFNXg8ArvMg5N5KmyZn
 nlrqC+bAqs6i3npJ733Rm3fTjzmOSmMPB6zg/iMyzhS/Hlq09a4gtyF3BC6BHWgGW0U8BQwKRcK
 CISQ25KjYo8uTBnAG973Vi7y6QjddtUR0zMQuMoWipWswKdcDoRUK13afx3ZOuN04hZw/0gbR3J
 +GULCYgnfZN3hkVQ58S5MtFmLpOirnWkgUtxvnGry4YnJ3S5xQurHzm6dqJHIjz1vThEn9yQpu8
 UzPpwEUEVDkMB01WzDQpyhC0vhgxxDO1PNZyYreYWp/Ij3/dGj/aN24ytmQ+kqTd+H2tk2w+vBP
 TnDWCmrox7vtJw3QAD6DB0EKEs6l56Dkh33bF/3Ql5KCHx9jltrNOF6TLgTGmA8l8j/TAxOJOp+
 RXco7oYQ3lIEBeyXvhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090128
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112181-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:manaf.pallikunhi@oss.qualcomm.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:rafael@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:gaurav.kohli@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A98BB66093A

On 6/9/26 3:23 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Konrad,
> 
> 
> On 5/21/2026 4:46 PM, Konrad Dybcio wrote:
>> On 5/19/26 12:49 PM, Manaf Meethalavalappu Pallikunhi wrote:
>>> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
>>> based power monitoring and limiting capabilities for various power
>>> domains including System, SoC, CPU clusters, GPU, and various other
>>> subsystems.
>>>
>>> The driver integrates with the Linux powercap framework, exposing SPEL
>>> capabilities through powercap sysfs interfaces.
>>>
>>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>>> ---

[...]

>>> +static void spel_remove(struct platform_device *pdev)
>>> +{
>>> +    struct spel_system *sp = platform_get_drvdata(pdev);
>>> +    int i;
>>> +
>>> +    if (!sp)
>>> +        return;
>>> +
>>> +    /* Unregister in reverse order: children first, then SOC, then SYS */
>>> +    for (i = SPEL_DOMAIN_MAX - 1; i >= 0; i--)
>>> +        powercap_unregister_zone(sp->control_type, &sp->domains[i].power_zone);
>>
>> Could you try adding a devm_ variant of these register functions?
> 
> Powercap framework doesn't support any devm_* API, you meant add this support in framework in this series ?

Yes, this should be fairly trivial - look at e.g.

drivers/regulator/devres.c : devm_of_regulator_get

Konrad

