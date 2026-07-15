Return-Path: <linux-arm-msm+bounces-119245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8WC7JM1/V2qxTQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-119245-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:40:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 094E875E444
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 14:40:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=GxosF29m;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VLIX6fmt;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-119245-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-119245-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8BF1F31BC1A9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jul 2026 12:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56FF746AF2D;
	Wed, 15 Jul 2026 12:32:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB5A44C67C
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 12:32:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118771; cv=none; b=ERqfZv+j+SR/AM+c/yzM/5d0bOPDklgJ9cuD5FhoIlJTJXtlHdkq551YtEv1PxLBsPDGKvgewpsfAdNSB3PBclzZUyTlj7dTGKunZtVcpvDdX47rUTzVK5Y5huEQjf++XKlGzxko03WTAOhMTiycfoF7OKvJMb9R4HdYhQNnekM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118771; c=relaxed/simple;
	bh=l2EDokfVWLOd7EizmjOsTHzq73UGspoJZp1Op+A4qz8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qqIGSZFKTHELquHf+T991Qv3uStoX7WqeWfFVwecFykgD6sSe53EoWc5m28Xau3fHqQnKPWPGZCUfSokIQ3joFQDwxPB1yT0lxJl9uA7qzJxbjF8UKAxRnTolt7tR0jbeX1/B2FBM1NzLR9FH5q0PrgkNKrKFfk4lw4lltW5Nh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GxosF29m; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VLIX6fmt; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66FBcwnM3579150
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 12:32:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	x9HbStl/BzF3lZnAuHGCNzOkA2YjZqn3RRATWA0aM4o=; b=GxosF29mlEn1Qxs3
	5o/4d5QBd1KCSGGHzVVtwh+vIQNsBNc0b9irJQ2GNEk6pYiPVwFc1UaDSZdYhOpV
	e4TFe39YMufArtUKFDY++oYcrDu9383doJTOp6RoZRlpdihq9SmOXmG98NJj+XDJ
	sd2kmO2vVublGF4RHrQdUmUJ9qCEwh1PSilkxKhcwH2lo7CPlIhcDb5boumrpJiw
	Iv2UgT++xSoxpOW38J3FjPcwJ2Yy1frdV4Pn2JnRX9HPF50uxlHr/JtnNo9jcrA6
	XCAHpgCRHLsXT2YTwdNxdn+9vN3RXU40hUmiCzwBwFVf6c0/ehP2HkgA12/Boogn
	KH5PFw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdwk32th0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 12:32:48 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38dbf293831so4663150a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jul 2026 05:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784118768; x=1784723568; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=x9HbStl/BzF3lZnAuHGCNzOkA2YjZqn3RRATWA0aM4o=;
        b=VLIX6fmt3Ini0PlxrxMG8fZjHHjYpzJ8zUmiApvb14nUc3M5AmicY6oxwHkAErTUo1
         5ifC6cnffnjj5ogierdN935API1pMIzitHFVcCc4j7lfcB0vK6ba5wzlK5Ee8Fr2CvaP
         PJrjf6nLJd0lt4dbJqoIi3cZRgK03QKHYER/nKoEM+wGsrwKZ1uq4HqImD/tksSV9+/l
         AKgEFDRV0LbrsvNUe1GzoUrQg3ur7/mLhbMaj4v+TUnYhlhbxaD6W+RywEnfny2ic4Hu
         lqeoLB1pe7vSA6LaEw2YGNQQsNJeV4IpWMSQ9ko8hm5i8Dhbu/M+20sLohWSX2KcEGIM
         hm9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118768; x=1784723568;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x9HbStl/BzF3lZnAuHGCNzOkA2YjZqn3RRATWA0aM4o=;
        b=IYz8zUssKano1cOfh/TsOVpSbISNKvtefawxhY0NbvgKkt0V+MX1qfd5AP6ew8JKWf
         mopVyUz0fv88IWLHfG1ELE7CtxQTDYPFGkWckhuCMpH/ULlFDqiKW1pT7oehvLzWim0T
         2jlk3k/bdTn/LVP0/yZ5O3VTGBt/s3RpHoMHsNSHCZYDnrgFTjNWSxYySyFTUzb6VuO/
         BQvyzKR11FvCJboHIyEMR2jMDrFi5wxLKsjKU/2CVaaZaXcRTlCVg6Q/O9QcpZNPykKn
         SWy1rklqJh/IpS2dhKuOW2IK0mMh7roRdCIeXSVx5UNaK9rXJ+orje13eTflKoDb2EyG
         7FoA==
X-Forwarded-Encrypted: i=1; AHgh+RoeLn6Kxt5OvC/MYDOHLu1I6c0o6bgAY9resWBEtTBkOm/P/hwFx9tCYJOPHf9S14EBxWnQKzdYLens2sIM@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4Pav9xP8rxbrsvqVf1Z49hf44DLgZlPhlpaQVz+xXCb4LXSWJ
	8wv8OATE3IBEz/tQsgx3Zb1SgFaIC7gekWF6rkuhoE5a+WUrsh1pB18iExhIP8Y1cqQ1mplXQRU
	3phGX+VdrOWPEsWhincFO2VS2ikI2bTim9Qq5HC5qIZM1JyinTIoAw1kNOcgodvrQRwAy
X-Gm-Gg: AfdE7cnfDWk6xKu4/zbQJmCek4tt56XKAK23dbYhx0bWOJnapz7wXMn96YXO9JtoMl7
	xt9JJPTbALnMDpqAxqjkZOk2JxXAF5jrHHVI7W9ydhzqev+RPffQcRhaaclXl+mXn2OyHqNrLiD
	uJPJP50dk/Jt/jR9EJg/Ca+nDeXJZaV9Rw/9xbvOO1TWM7pvhdqqOFkfi4P2ed8HZGLHwLuEt3Q
	2Hct8Mt4Ep5GjQzMGj6w7Szbm74ZX6PjTLyBApJ/LlYqqsU4s8bys2FeXemSxdzhVwjmwngdbD5
	nQPyNvMXNuRRnWuIRgiEu8FIDnjB8yRAKhNuwrq20fkvbWkJ5tGc9ctbD5ftTe+rSqPObGfPKle
	Swrl4sYu4JCnUuKGS+0vmlM2btLjzPDNjHDTKhMmtbqB+hA==
X-Received: by 2002:a17:90b:3c81:b0:37f:9ce1:cdab with SMTP id 98e67ed59e1d1-38dc776da74mr16463975a91.33.1784118767632;
        Wed, 15 Jul 2026 05:32:47 -0700 (PDT)
X-Received: by 2002:a17:90b:3c81:b0:37f:9ce1:cdab with SMTP id 98e67ed59e1d1-38dc776da74mr16463948a91.33.1784118767258;
        Wed, 15 Jul 2026 05:32:47 -0700 (PDT)
Received: from [10.219.57.229] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e5306afsm1515390eec.9.2026.07.15.05.32.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jul 2026 05:32:46 -0700 (PDT)
Message-ID: <5aad793e-2dff-4727-985d-5615a204f309@oss.qualcomm.com>
Date: Wed, 15 Jul 2026 18:02:35 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v23 02/13] power: reset: reboot-mode: Support up to 3
 magic values per mode
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org,
        Florian Fainelli
 <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        mfd@lists.linux.dev, Srinivas Kandagatla <srini@kernel.org>,
        Sebastian Reichel <sre@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Christian Loehle <christian.loehle@arm.com>,
        Ulf Hansson <ulfh@kernel.org>, Lee Jones <lee@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Andy Yan <andy.yan@rock-chips.com>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        John Stultz <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
References: <20260714-arm-psci-system_reset2-vendor-reboots-v23-0-e7453c548c21@oss.qualcomm.com>
 <20260714-arm-psci-system_reset2-vendor-reboots-v23-2-e7453c548c21@oss.qualcomm.com>
 <CAMRc=McKp4WsOY-EQ21n2wbqCp5V0Lr1Cbub5geEhz-LZvVkZw@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=McKp4WsOY-EQ21n2wbqCp5V0Lr1Cbub5geEhz-LZvVkZw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Yc6NIQRf c=1 sm=1 tr=0 ts=6a577df0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=1ebYhdgdrGDEZLiK4_QA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: M6RgdgrmgpF88h1aMZlGN9myi4wIYMst
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE1MDEyNCBTYWx0ZWRfX/Jq3eptcg9wz
 WoHOqqbVQ70jBFZUphIUn2kwUu7nu8ElzPw9EWdAp9Dv1NP4bO87oY47fRRpkKk+lQN9bxyqJkB
 RBwaeBYI7Ough57Xe7VL99mdJFdDoxWNbRYTWG3B+kfnh62FTddfHZxic3H3t74cPSSUDSHnmEp
 Ct6Cr/I3loF+GJaW0zUc5SLCZBtR68KbUnuAH4ZMOas0+g9gGdsR+nGIFvwXrJM551PtmDQio4H
 v7CcLNc1Zi3URrZtlfW0W9UKiNImmadwLoiB+BcKEMrZhj6ghyUY+wgySSOpMpZgYkAFfARiPuu
 sT2P+6tSt6wVm8PqDTVo2a3JI9hznqfPpDdOBjH+TCftWcWXyQoOSxAdjP23xW54Xc5patpBPm4
 vryee32OIzIOw0iVWu3nB6aIV/uprJotPghe7VeY9WZCGOroPJDtwGSK6e8Ntscj2pa8m0ZyoOi
 Ba/cEDgItwRvMfpQMaw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE1MDEyNCBTYWx0ZWRfX7xFY1fbcSX9V
 PGPwkLyDstCrYke4Pt2WilqjPEKDnRWZSOudGXlQSGdLHqW+SsAjwuCldguYFiIMED92kaQLGt/
 sk0ysADgMqvvLVLbAX00zJI+FLapdMc=
X-Proofpoint-GUID: M6RgdgrmgpF88h1aMZlGN9myi4wIYMst
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-15_02,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0 suspectscore=0
 impostorscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607150124
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-119245-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,lists.linux.dev,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_RECIPIENTS(0.00)[m:brgl@kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:devicetree@vger.kernel.org,m:florian.fainelli@broadcom.com,m:krzk@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:mukesh.ojha@oss.qualcomm.com,m:andre.draszik@linaro.org,m:gregkh@linuxfoundation.org,m:kathiravan.thirumoorthy@oss.qualcomm.com,m:mfd@lists.linux.dev,m:srini@kernel.org,m:sre@kernel.org,m:mark.rutland@arm.com,m:lpieralisi@kernel.org,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:christian.loehle@arm.com,m:ulfh@kernel.org,m:lee@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:arnd@arndb.de,m:Souvik.Chakravarty@arm.com,m:andy.yan@rock-chips.com,m:matthias.bgg@gmail.com,m:john.stultz@linaro.org,m:moritz.fischer@ettus.com,m:sudeep.holla@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 094E875E444
X-Rspamd-Action: no action



On 15-07-2026 17:56, Bartosz Golaszewski wrote:
> On Tue, 14 Jul 2026 19:16:30 +0200, Shivendra Pratap
> <shivendra.pratap@oss.qualcomm.com> said:
>> ARM PSCI vendor-specific resets, require a 32-bit reset_type and a 64-bit
>> cookie as arguments. This cannot be implemented via the reboot-mode
>> framework, which supports a single 32-bit argument as magic value.
>>
>> Extend the reboot-mode framework to support up to three 32-bit arguments
>> as magic, per reboot-mode.
>>
>> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
>> ---
>>   drivers/power/reset/nvmem-reboot-mode.c  | 10 ++++----
>>   drivers/power/reset/qcom-pon.c           |  8 ++++---
>>   drivers/power/reset/reboot-mode.c        | 41 +++++++++++++++++++++-----------
>>   drivers/power/reset/syscon-reboot-mode.c |  8 ++++---
>>   include/linux/reboot-mode.h              |  4 +++-
> 
> Could we avoid having to modify multiple files here by just providing a new
> function:
> 
>      nvmem_reboot_mode_write_full()
> 
> with the prototype you proposed and making the existing
> nvmem_reboot_mode_write() a thin wrapper around it?

sure. will update it.

thanks,
Shivendra

