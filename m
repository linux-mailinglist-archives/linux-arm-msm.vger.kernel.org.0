Return-Path: <linux-arm-msm+bounces-104988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UOmOCpCp8GnOWwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104988-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:35:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F183484E8A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 14:35:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 220243067066
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 12:33:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F1EC436367;
	Tue, 28 Apr 2026 12:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="orEIIWdZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fl8PuCXx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D09426D16
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777379601; cv=none; b=godduENMZgF9i1AJ0IIf3w/DSM8dqXbZM6lb+UEnwgP6lfwBwXKCq9lHURDO3XNOluPR/ESefn8vfsavILFKeslRnaALAS26/s6t0OI5ppAxuLYBHYClq7xLc/h84Sib9MmwEEexu6nhrZiuJVYw1yRP5h0vdjMZXyNBegmy0YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777379601; c=relaxed/simple;
	bh=EUSSJ1Q91B+Xx9zDjKC/yNPvbAc5HxjMoiAETTuP6HQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dzMR7PYO3yhjGnbz7kEyqvoMVSafw/QYdSUv6W+RUGygpWahaopFTVgjYhQ/dUcmFyTTedP6Ct2Bs+xWgdFeQVG9v0kyZvJSXp3usgEZSteR/AJrX9kI3SJynucH2OMj/d7SgCWHc09pnwBHzcNEa3RTS3rM3gEGqu+aX0Xw5nI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=orEIIWdZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fl8PuCXx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SCU9pv440995
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:33:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fylLG2wwQxPhuCjUzW2jU3hgZkUTYpwG6DpN0l0UY6o=; b=orEIIWdZySpVRhh5
	Cf+JGLisyug1Y3j9mI/t/kiROECrg7f4P3964rlz1aTuj+q+gEvx3U4GPhveIFUp
	LqPIpGZfdfQdP1Kq5eLbIJ1osgrsTLutwKkPedYmbaB/hddqgGBRBhICzdotGM54
	7F4qiv84RzxAZtAfToG33ZOHaQ6MXPGFyaXUV6fWL2F0ZHKXph0jnuLd2guXN5o/
	f3yMvhxGJAGU3xKZZGSLY68WEJoVrifNHqyF290JiPNWipRSfURd+TmmgVOs+6Pv
	hjHK88nSg0EDc0NxHbVR0L9cZrHw1ogztkj0/p+nXKfZ4HKxgYR7/hqkcTtKnZMG
	mmDobw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtac44dxk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 12:33:12 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82fa1c94b37so8498357b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 05:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777379591; x=1777984391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fylLG2wwQxPhuCjUzW2jU3hgZkUTYpwG6DpN0l0UY6o=;
        b=Fl8PuCXxt8zjBLDqREQw1a30gQ52N5tzoCRXIn22jPMaVVJR1qQMKOrbPGTPneojwN
         Ndb8qIzMAA1klkQkJg4bUu+ORGP9g4yCD28FrTZjmOeWngBPWrQ7kGqrjAGON86+VW+P
         jGEHHUbPgLlTD+etwrJp15JQgVeaQnoKBlQkuiKc2+NFEzsaSuIAQBmCSiNxKSlFu/+P
         zJ/4yUoOb+uPXExX8Mx5l+udv4BcMKJhs3CfrslU1ZXwRkkmQtG2ZCUKB49eGVF95XDs
         Q+fM0O2/15jtX2lL4+swN5Q7wZN73rs6b6m0e+sS+kyGHRPReP9bWAyZ7Ajti4A15TrP
         qMXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777379591; x=1777984391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fylLG2wwQxPhuCjUzW2jU3hgZkUTYpwG6DpN0l0UY6o=;
        b=nXxXjRtI/fAvq8SpeeSnuUJe5u06S5rQE1rPHv3y1jTRgxEr9rZArIklnlJi/L+vSW
         SfCJt7E36MthdquDt5dsn7hsI6kM2UPBQQXiSONGrDn8hQ6wrgGmRgjRi4Thh5NE+G05
         /2p0q0g/4+3nO9dGL1/pH8s2JRz0rRNsriP/LRTOKqaHSfizTsYFaxzS6+AltHXqmOgx
         NEosY9JteFcq+1gpB7fnh+F1EqgFuRrlbCpifxj/itjmutiDOjulOSeS6xcj/4GZBGwW
         /uGmX2MOiCusF6gFx7cHjr3Ec86sZvQL4TF5TGZldylt21rCwUVAsXLJuHf94tVeULXY
         +SeA==
X-Forwarded-Encrypted: i=1; AFNElJ87C39xf0jSFATccKnBjRxeSeR+WsIhFzzHUeZID0D+naf9z9oZZAZWoC89QQE8U39UWe1SahZ8sLxXefNe@vger.kernel.org
X-Gm-Message-State: AOJu0YwL+GAfv2IRf/92ihyhKKPkCuD8HpqypUfzWl5IRJNnvN9dxrK5
	mcMWaQwFIfyjhpbfdjnq4A6fJjgkDLM3KaY2jloGNCQojOEcDNEIH0sL4KjKmgMhqDM/s+4xTqE
	ZS6JO4CLPUM9HNYtc8Alc7EfrGKKf2zkP7+X9Y0Mocj3MbN4sZakKmjRxecXp4ZR6yo1D
X-Gm-Gg: AeBDievsDT74qkkGVrYQSlwgXr0P0+nNx1MM7YWybVO1jmvdoRnWFq3wf3Qwv6g/8Fh
	Qaz7AUfUTtQYjho+PZGZrsPaXKZ91gXLm7I/vHAxQkqj0uk4JoKpy546itME96TTmd5XE6aJbY6
	H2e/LrR1YusnP07qWP6Pq3k0tBOpCUZxybcwiTrC+Ocm69hrY1RGnOWltiChdzCa97JJhxEQ0EZ
	1ivu0LoMebxInEZqr8DQyxnuacDy4EdHto1T/+5D0WFwsOWw/bi5i/+iR+ssVE7YF5XFp8GEloq
	ifHvQX8CJIDugOv1Iktri8b9w4RiPzBHezikCc8Ei3Fwjq4+yUIKpF8g1hfDfjUpi5eycC9cwhW
	yhLRWNwi7aBa6L7wD00tpbC9JQx1kFBo7xLL0lF3mtIPMPBR8mgoJ8MQQP3HMz8d/drY=
X-Received: by 2002:a05:6a00:80a:b0:7e8:3fcb:9b03 with SMTP id d2e1a72fcca58-834dcdaf080mr2761000b3a.25.1777379591409;
        Tue, 28 Apr 2026 05:33:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:80a:b0:7e8:3fcb:9b03 with SMTP id d2e1a72fcca58-834dcdaf080mr2760933b3a.25.1777379590888;
        Tue, 28 Apr 2026 05:33:10 -0700 (PDT)
Received: from [10.219.57.134] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834dae04e49sm3228694b3a.2.2026.04.28.05.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 05:33:10 -0700 (PDT)
Message-ID: <d0420528-cfab-4b43-8488-015755777194@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 18:03:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v21 07/13] power: reset: Add psci-reboot-mode driver
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
        Srinivas Kandagatla <srini@kernel.org>,
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
References: <20260427-arm-psci-system_reset2-vendor-reboots-v21-0-dcf937775e73@oss.qualcomm.com>
 <20260427-arm-psci-system_reset2-vendor-reboots-v21-7-dcf937775e73@oss.qualcomm.com>
 <CAMRc=MdLTMX34DEhoMskMzjRqx+Cdpm3=P5QTZ8S6sUVJ3eTbg@mail.gmail.com>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <CAMRc=MdLTMX34DEhoMskMzjRqx+Cdpm3=P5QTZ8S6sUVJ3eTbg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ioKGQ-s6v4QzTLtdOfjAja4n6kAaeJcQ
X-Authority-Analysis: v=2.4 cv=D7J37PRj c=1 sm=1 tr=0 ts=69f0a908 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=xJRVJYJ9JtZugbA2SwUA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: ioKGQ-s6v4QzTLtdOfjAja4n6kAaeJcQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDExNiBTYWx0ZWRfX2G33kwhDa17s
 90W8+sYJTSfqzrgeZWWsaD1GyJH7QsV8o9gbdKCa5tIzTYfLZswduDw8MuZoB62CpPi01piZ7TG
 yAQV64tcFvYTWmRDjEtptU7lLW8kJtcHipwxbRt+PVgoDNQU3Lx5O4xNYaeQ2xLKIHPMR8op9on
 QpG3xK8MB4SaNw2OlAfRYcsgEQtN2FR0RRvicfevYilOtXVKOTu1k99JxCIdZkKDfmAMH+bnHM/
 IzxVHcTa9wDCOL2ohqLbyOBofzBwC+doYSVfsoe/jghLEOafnpDhrOylKaujR4w7Afa7IbRn30S
 mpBDzn2eNdNCkKgLnd8Q8jTCo9aNqQD7/ZFYjjqaGgFmhlcYMlV+XwbiHCG/2rx1LTM6k/3/TTZ
 /Asp4HEWbnm0JVMBnRkZkwEUrd7fT3CZw0dGkC3pL37mV9qHMjEDwq9eCcVxMKxvUTGm5Wcsbwp
 hpA6WMggu944oQj6gBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280116
X-Rspamd-Queue-Id: 8F183484E8A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.infradead.org,broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,linuxfoundation.org,arm.com,arndb.de,rock-chips.com,gmail.com,ettus.com];
	TAGGED_FROM(0.00)[bounces-104988-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c0a:e001:db::12fc:5321:from];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[205.220.168.131:received,209.85.210.198:received,100.90.174.1:received];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]



On 28-04-2026 13:26, Bartosz Golaszewski wrote:
[SNIP..]

>> +
>> +	return psci_reboot_mode_add_predefined_mode(dev, reboot, &psci_resets[1]);
> Looking at this, I'd introduce a core reboot-mode helper for initializing the
> predefined_modes field and adding an array of modes and use it here and earlier
> in the series.

sure. thanks for review. Will expose a call from reboot-mode to init/add 
predefined_modes.

thanks,
Shivendra

