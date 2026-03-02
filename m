Return-Path: <linux-arm-msm+bounces-94913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +LPwK9aGpWkeDAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94913-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:47:18 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E6C1D902E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:47:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 21C2830879F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:39:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E314E375AA5;
	Mon,  2 Mar 2026 12:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cryyzL6J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KzfXG4fr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81982374199
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455169; cv=none; b=Wvetj972wivMQO2yT/OazMrm7W2iOojfeIIu46dYqniEyq2Wbo0lcoJQIOC5TH9KArLEHlM2N32c/6tuuPBH6Qh6Y9eC7MfK7Rxs9PzWRw/N7MQmbjIc2H9G0MkeVbj0vbh0TvbXTpEFaTh1dZMp85Ht4ULykJJoJpWZJ0Wj+J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455169; c=relaxed/simple;
	bh=sgSw6uvz5TkF6fAter8Gcyz6f1Qegkklbw6CY016QSA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ZkJ/5X/3ruUU2IKhrOTwTof8bInGEAJchoRsVk5lCadBfGgB2/C/hARb8p1+gWA+VK5jhMegaGNZ7Ar+vTcrcmMZ21qoE+nB1R3nanNTHW3Wz2DKyAUjnYlOYey8wBhRIXWzVdvrfeWalBGlbmCI3uoDzrVhINH7qNeGd7dTyQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cryyzL6J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KzfXG4fr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6227vRpx055231
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 12:39:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ww8449eIn2bp2zLGxyNJVG6ROnNNqCtapX2um7IMARc=; b=cryyzL6J+aCfMbmN
	zGRKsJrhKW0FA+ShER+4QxbPAqdq33JlPqP1YwZLBbBPpIfkMdEQENwpmjEe8UO+
	QUSywtocX3cKo/pwZXKy55772Sdlp2SLSoAzLQ3KTZT8vFfgnctQxlBusjUVpziw
	Yb3C6AgupT9eSE34lTz22u6FcmJZ65Tp/miaMHfkkjvaIBga2lbDFV2L3/FcrwYc
	2Vy7u+eE/0dllQWHOQxbfsfYyMoFPvIwGx2ZzaPRMIp9aPJ90M/VwtyLbWSYyw7e
	X8JiKKKew4WRoGXaMjw0yViFIFk9TlpYm+BTs+c4P8fi57Yq+88nIcaAcUoJVkbG
	hbHNAQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmw64absu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 12:39:27 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3597f559e70so1259314a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772455167; x=1773059967; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ww8449eIn2bp2zLGxyNJVG6ROnNNqCtapX2um7IMARc=;
        b=KzfXG4frL2BV6+81Zi/5Ork3A+/cXZ6WOKUgnaQ1GGp1zj4eQHhp7Ue3SUcLH8DsdE
         pH2yWOz2NRmDJSYmet0gTaFunBN+IOF30H170gaygttqcA5NCSaHWbLN8RX6DNqGsSJh
         kj65w1nrn5V8lrgAILKzWzOhdbkqa9sbUrZG7XiR1S8RkU/t+IH5UYrDOJuifatwrEs5
         lKaci/kQubkPkxz4sQtF1FNaM4LIoHmlaCQxhtTWOXNSIWh1fofoTZs2KMwhRJEYQEkv
         37uANg2G/qEXPA3s5rK0rKs2XBQ5fkbDKEQvEvoAWjQDuad1wJ0ic6mu3+GY86PY/Y0O
         TjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455167; x=1773059967;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ww8449eIn2bp2zLGxyNJVG6ROnNNqCtapX2um7IMARc=;
        b=iOYFMeJdWDaMHPK7xH49VT+Rw+ioSGrG6FW9i8U8FKlEASvyHvj2WfnctT/Vtn2+5c
         Yziw3qKMSuMI6gj/I6WfH/7CTb0RH624N099UlrkWSVA2pjx02P0be06Buj9e709XAas
         DmtM17CxTTNeWPJslq3l1HAO+KMQ8RNLhSB2CjFuGvy7Hb+nZR0nJQob9B+BUsgoRLeV
         d5WQ37b2mL9l0B2pPFtQlKEgwm3A4Q1AP0Zwg2/JIYArPvmszLhBUoolBPHOAghxUzUV
         cF9hbHIm+fTowVVU9s4cESdQoEyflaCQD6eSPSqLdVjSCynbFfUW6p3+avH09ktEKjCY
         oawA==
X-Forwarded-Encrypted: i=1; AJvYcCWTwrdXbfBPQ7w1ExO6CQDmoT7hx9CjgsdGdvrYekz8J8kc45Vy3fBTA15wm+Cc8KISRloL/gzU4Ya88nTR@vger.kernel.org
X-Gm-Message-State: AOJu0YyjnuiuA2bmKZC0eIqA6F50iaMj+b2/0rWAzXuejUAueKdJH+Nh
	fSqxWuWydH6ujG35gu6HHYUk1Zw9iRZRQN1xNPj9saZeQwaML4yvwVmnqxUZervz1Z6yW0HXzyE
	8pxqb+gEq+9EBJ88R8H0SXgtsWECiIF2jMW97X7U21sMyIY7RELSEjZLn7GdnEu5ME8aoyGOCuv
	5Y
X-Gm-Gg: ATEYQzyLgFvUg1IBOWU26TWKKj8zjg/iLOYUesLFNhuKpMZvjGi9GYlibFeaRNnZbx2
	y29PKCqW+iHBJN+IXhJpAJbw9gkFwWJgi2SYENEz1T0NwVts3eDXd1QQ4cv55De9oyZUVGl1k9Z
	nCUblRS8bpnrI0Ox4lJ3Gte5837yrq0w+2G31BQY4GE0KcU9g8DKrZeFm8hsqlbFDOAo26JDQ4p
	gJilo0V4GfAQ5OXTHSqEEEOICRHZDotBdtLkuBIuWAAajxzYsYPFS9ooHs+wyeQx5SAv7NNWivp
	WR7NYfHjN6FLEEVrRiSPxOFJrybfeLaagJrBk96WB0QAmTljsw0ufejaHiAcxMsVyUaj/qH96C4
	wZlN+OvuGJadISIwhEX6GmlkakrsKF/GdYHSVxOzFGj757beWd3xOeOzy
X-Received: by 2002:a17:90b:1f8f:b0:354:a57c:65db with SMTP id 98e67ed59e1d1-35965c926a7mr9003698a91.20.1772455166969;
        Mon, 02 Mar 2026 04:39:26 -0800 (PST)
X-Received: by 2002:a17:90b:1f8f:b0:354:a57c:65db with SMTP id 98e67ed59e1d1-35965c926a7mr9003661a91.20.1772455166462;
        Mon, 02 Mar 2026 04:39:26 -0800 (PST)
Received: from [10.218.41.175] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35994b0ae60sm2048878a91.2.2026.03.02.04.39.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:39:26 -0800 (PST)
Message-ID: <8271eafe-ec8c-4d9f-9eb1-1bc115efcbff@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 18:09:15 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v19 00/10] Implement PSCI reboot mode driver for PSCI
 resets
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>
References: <20251228-arm-psci-system_reset2-vendor-reboots-v19-0-ebb956053098@oss.qualcomm.com>
 <2dcd9e3a-0a40-0dfb-29b8-99b70b73a59a@oss.qualcomm.com>
 <9e9b9faf-7c5d-2e83-a8ac-37afeffd81d4@oss.qualcomm.com>
 <aXduTklGm6AOeaGG@lpieralisi>
 <61f166a0-44b6-a917-66e4-1e1230fa1115@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <61f166a0-44b6-a917-66e4-1e1230fa1115@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: q7lyF8q5mgvthNx_rNbC6tJYBZIBlWOZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfX4pv/X5Jzbxxf
 /7LiGE4HfaSR53sW5JlNyBQIJzLRgIXpUL/iT13kT8kVC97tlJ7Jtxbt9Zm8XY9jrLREyb9/ixL
 cdgRIaF3FS+V7l2kOumxjEa4U11E5Iref/Env0mUcceae44SAAucwbnTMRaunRK9KuSyKODfAPk
 SR3qbb8Nnc6iO9thGripA5ExRafuGZu2Z/l+RVP12kp8PCH6+WFFzjA8cQN8O9kMoPAXej+k1c1
 m6EaVCgZG21IWTrs8GpiShFNCvhDPFFwdfo3SEt0emBWSYQ/OS3+oUqw8XnQw3opkb4gXR+dz7F
 7LUAGm9A34Iv/k7HvaYFe4sP410hl+AFJlu5kJFyN8qevp+XwGeosONoylcNrIeiMkWsvHzNgRD
 iO7B/FIS82CjoswOUWHvlB9W/EWuozSmtOetofq5ApMB1w2RvA8MJo0sevLOShWiTXM3v1wgIQD
 AgA9ZWnCjk/F2hKl/dg==
X-Proofpoint-ORIG-GUID: q7lyF8q5mgvthNx_rNbC6tJYBZIBlWOZ
X-Authority-Analysis: v=2.4 cv=I5Vohdgg c=1 sm=1 tr=0 ts=69a584ff cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=1ilHWjMHOYMdorrszqcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020106
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
	FREEMAIL_CC(0.00)[broadcom.com,kernel.org,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.infradead.org,quicinc.com,arndb.de,arm.com,rock-chips.com,gmail.com,ettus.com];
	TAGGED_FROM(0.00)[bounces-94913-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[30];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 11E6C1D902E
X-Rspamd-Action: no action



On 10-02-2026 19:35, Shivendra Pratap wrote:
> 
> 
> On 1/26/2026 7:08 PM, Lorenzo Pieralisi wrote:
>> On Sat, Jan 24, 2026 at 04:08:11PM +0530, Shivendra Pratap wrote:
>>>
>>>
>>> On 1/6/2026 4:38 PM, Shivendra Pratap wrote:
>>>>
>>>>
>>>> On 12/28/2025 10:50 PM, Shivendra Pratap wrote:
>>>>> Userspace should be able to initiate device reboots using the various
>>>>> PSCI SYSTEM_RESET and SYSTEM_RESET2 types defined by PSCI spec. This
>>>>> patch series introduces psci-reboot-mode driver that registers with
>>>>> reboot-mode framework to provide this functionality.
>>>>>
>>>>> The PSCI system reset calls takes two arguments: reset_type and cookie.
>>>>> It defines predefined reset types, such as warm and cold reset, and
>>>>> vendor-specific reset types which are SoC vendor specific. To support
>>>>> these requirements, the reboot-mode framework is enhanced in two key
>>>>> ways:
>>>>> 1. 64-bit magic support: Extend reboot-mode to handle two 32-bit
>>>>> arguments (reset_type and cookie) by encoding them into a single 64-bit
>>>>> magic value.
>>>>> 2. Predefined modes: Add support for predefined reboot modes in the
>>>>> framework.
>>>>>
>>>>> With these enhancements, the patch series enables:
>>>>>   - Warm reset and cold reset as predefined reboot modes.
>>>>>   - Vendor-specific resets exposed as tunables, configurable via the
>>>>>     SoC-specific device tree.
>>>>>
>>>>> Together, these changes allow userspace to trigger all above PSCI resets
>>>>> from userspace.
>>>>>
>>>>
>>>> Hi Lorenzo,
>>>>
>>>> Is this patch series now converging towards the design changes you
>>>> proposed in v17? We’d like to conclude the design so we can move it
>>>> towards closure.
>>>
>>> Hi Lorenzo,
>>>
>>> Can you please review if the design aligns with your proposed changes?
>>
>> I will try to do it this week.
> 
> Hi Lorenzo,
> 
> Any pointers, if the change aligns towards your suggestions about the
> psci_sys_resets?

Hi Lorenzo,

Was planning to address the current reviews to send the next version, 
wanted to check if you could check this approach towards psci-reboot-modes?

thanks,
Shivendra

