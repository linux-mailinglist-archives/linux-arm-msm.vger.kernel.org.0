Return-Path: <linux-arm-msm+bounces-101429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kGTrBpYJzmkwkgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:15:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD57938455D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 08:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1B92A302D591
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 06:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 423F337CD3F;
	Thu,  2 Apr 2026 06:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c8bHzOo2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hZXiD0dj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F26973793B5
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 06:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775110544; cv=none; b=T9Aq4tmQi9djOwVhXXlPMBm50AgacdjteNcvXViwubnV52SnMIRUs97uZze7zrjgKiftbFG9RcRtfdbJ3I+6Bj1Y2uP/hoWW/3nPCTzf+Xc83UfyTYurhv6f7jgf8IZo54tIFgyE9KlHug7Uz5XDXdjasFXhsCLTeFZqC9j4weM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775110544; c=relaxed/simple;
	bh=l1loiawBIn+Nx/k/dA29xAyzkExLzj0o5+J/2k7RVgI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nZWrvtvDgwPs+5esNGgVPFMInsTJZLLwS4YCDtlV4TjX3Pb1af0pK4QidOvvW6f+8HtPKI4PSeCgfHRKjgS2WSpJxqXZmWJQLTZgVFBn80jl9IJ8/l/48lSRNwjLCvQYEgbIZCjN5Smxo4ng3m5vCpM4F+4lJe7AExasE80btBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c8bHzOo2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hZXiD0dj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M44wn2903749
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 06:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aRHUYded+TYp1esSjYtekH/rdFjnY9CsQjfogYeamHw=; b=c8bHzOo2Owcne8i4
	ePx8ePExa+MRg9dXSvXV9+XMQ+EJyz3WNvSshCsttH74t56HFmLBZvE9txWeth1s
	QIXKRwa1R+laOy2am9B1eWOPsotau2zBgKPN8KeDR8L4oDofkeNLtsmQtSNCGPnM
	0S7YCtaB1qW3a8Kq/Wg/Ut3cSzNws1FrHiIG8GRQ9XcA7xeCEJyGTAkm4R351QdH
	ogqyKu8RlS0MyYpvEhUHYNht+FGGVta8hX9LkGEvInydyGKiaovL3eN6H7zEA2jZ
	BYHuNeZHTWgRTWEEmHy06deecWJxrvg3MNZcHbHZRPwuQOAY4eG44FoaQfUA21Y7
	Ii3v8g==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d954cb3sb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 06:15:42 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c741c4cebf3so259972a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 23:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775110542; x=1775715342; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aRHUYded+TYp1esSjYtekH/rdFjnY9CsQjfogYeamHw=;
        b=hZXiD0djI2ie92tB/TOFgMOK1/ZtzPW3Gf4e2839fsG10IK1NjDF2LzIDdOun4a+Kw
         qLeVjx+gndrz4ZJxqEVmCzzsBj1T3c0mNbBleo7Ul6DcARgjxwT7B/EsbMwXQ3NJ9YGc
         6TPeTWpsdskY5WYKyAzer3NXOMVCrQa4l6AKxZFTYUK1jxb5F1ovVHnE1XSlyEJjsWd1
         T25v0R0yEn+zgKz0G5MqtZzO0Bo+vzBVlnikOaz93mTsKBn+PewwdV4oUNkUqngLRxK1
         l8Rqzw7FHEljpxZ2QBCQewmPTp04hl96Ek2VjOJpyJNU8BSIIrQ3cej4+IEZqcncOzAh
         +JMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775110542; x=1775715342;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aRHUYded+TYp1esSjYtekH/rdFjnY9CsQjfogYeamHw=;
        b=gIUUSciawjhF0bZf9Z35yvWZx39srRnbT4DPv6doCf56yeUdsdbNHhY+UKHkFsX7W1
         /c0XM/mguFNJp0GToDOLsGi8TongBG7HGn4jg5TI0NRVCaP47dFOr8nAeUEeDWFw4Jrt
         ZBAjaIHdnydmyVWU2OzI8xWu7gJDHE9H0egBR1jrZaFuIYHkqhGtakVU45cqIkUvX/ER
         LPCOKDErYPekm5OMr8FlodT8jXSfpAZnf7bE/74e5iEQwbERpP/IBuZdGeKeM4OGJg9u
         pLkWdXpX2aaphVPIdCOWHzZ0aO6JRGshDyoZU3HDXyxTwM/SI6PHBf4PJb+Egl6yuibl
         EKeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZOZKR2MyO3AEGonAsmkt6l5vQQML4sTlUu+oG1iXQPXb4k2Is8fslaQhw3/L5u+Uas3XhORaDSJJ0pPtx@vger.kernel.org
X-Gm-Message-State: AOJu0YwvVgzwrhsqh1nAOe/R869cdU9oUeDXLkliEAWtuOkCR/3F+23P
	zDLOJ6jmWVg7UZMfVqsk9NulaHRFw3twRjEuxMqeGKckwnb7HN5PIiSLGRNDwXSs/+vPqKOZfV/
	mk6ZmVI8OonmKu+sIuM+8GoCLPZme54/D56tf75g4g89nZOxnUvOTIDCtPoNyblxst/7V
X-Gm-Gg: ATEYQzw9vX74SvFiZY+T0RJNw3Jv2OG/dwvB1LaoHtfdO9GXK02BkbmATmpcQEEXLuS
	jcFXtOFOA6/tuHV/6XT15R45WFiRb4Tz4XNSlKDhxOWvLfNnWSOBvRQKlvrg1CyX9Z5rW73REzY
	ZhbTTHJaafpad2LkBXBxuUP7DTF4ifx/BQBmWUZvRxUGuqm7jnNhPYuHcfwoBb9waz03fZ8z91v
	TURd3mQLEqaxqrePRn2tEskFHbkMlH1Hea33rgn6aqltuE4BRx2DhHFUr4PjnHPkdKsM6pQyO33
	6TxSWcbn4XUirRFFoBiFiWHF28pZ+97iHoZuOUp9F4IqyUY91kkt99NKS6tL6mwlfqdAaQU9AW9
	Hoi0vfuSAJFe4xK0eSIfA+0vpxmDk8iMZjxSqsXe4u3gxewuTr19fx2IJ
X-Received: by 2002:a05:6a00:ccf:b0:81f:3c34:fa83 with SMTP id d2e1a72fcca58-82ce8b39b7emr6362546b3a.57.1775110541651;
        Wed, 01 Apr 2026 23:15:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:ccf:b0:81f:3c34:fa83 with SMTP id d2e1a72fcca58-82ce8b39b7emr6362522b3a.57.1775110541169;
        Wed, 01 Apr 2026 23:15:41 -0700 (PDT)
Received: from [10.219.57.134] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9c3ce13sm1854075b3a.38.2026.04.01.23.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 23:15:40 -0700 (PDT)
Message-ID: <043066aa-64ad-4b7c-8592-ca3074beb7fb@oss.qualcomm.com>
Date: Thu, 2 Apr 2026 11:45:32 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 01/10] power: reset: reboot-mode: Remove devres based
 allocations
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Andy Yan
 <andy.yan@rock-chips.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        John Stultz
 <john.stultz@linaro.org>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Srinivas Kandagatla <srini@kernel.org>
References: <20260304-arm-psci-system_reset2-vendor-reboots-v20-0-cf7d346b8372@oss.qualcomm.com>
 <20260304-arm-psci-system_reset2-vendor-reboots-v20-1-cf7d346b8372@oss.qualcomm.com>
 <be9db30a-ee64-4457-8722-b9f456911ad3@kernel.org>
Content-Language: en-US
From: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
In-Reply-To: <be9db30a-ee64-4457-8722-b9f456911ad3@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WMlyn3sR c=1 sm=1 tr=0 ts=69ce098e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=8-yduQQsOBGYcPy-76YA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: YCsJtfAAufAxh36XDbL0lqxRP8nXxoeA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDA1MyBTYWx0ZWRfX+cq9n70Zzwmu
 l05tY3u/z71TJyrg2xxjy8cZL+FSWOKYEIZn+vJ7j7bPXvXv48H2AUaFou4/h8BSQcFzHYjaYIu
 G4PK5wDM+y+gUQH16H5VtEQoeQYyWPoBD5Xa344mz0ncz80oNUtivkUoIBghCgxg2woVw4hck4I
 Ju/7C+bSLttPFQvFTBLymsBaZQOr9lHvg666xmhydMdiDHSHsn5iGUI3jmud/rFS9NZN1P7hytf
 7leoe7JfUV97W/9Q4r1qY/IsiQn2eurbdmQdi6/QE8pQPEMGIJDI75ej0m2cU7G0vZNhRe/INSE
 BiRThv1mXjj32+uMWQwjkd7BcUYjAMDev+nTAdtWPHL1YpjIqFx+qYGfxzj8FqbcPpCksj0jhMX
 XEUuBnOwn6RW6gLCcitnGGm8cg/zjGla3pocJGc+aGcnWNqrJE0CBbklCllPdV757thaeQCf6Xa
 tToDnUq8P7qY/mnNAGA==
X-Proofpoint-ORIG-GUID: YCsJtfAAufAxh36XDbL0lqxRP8nXxoeA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020053
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101429-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[kernel.org,arndb.de,arm.com,rock-chips.com,gmail.com,linaro.org,ettus.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[shivendra.pratap@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CD57938455D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 01-04-2026 20:49, Krzysztof Kozlowski wrote:
> On 04/03/2026 19:03, Shivendra Pratap wrote:
>> Devres APIs are intended for use in drivers, where the managed lifetime
>> of resources is tied directly to the driver attach/detach cycle. In
>> shared subsystem code, there is no guarantee that the subsystem
>> functions will only be called after a driver has been attached, nor that
>> they will not be referenced after the managed resources have been
>> released during driver detach.
>>
>> To ensure correct lifetime handling, avoid using devres-based
>> allocations in the reboot-mode and explicitly handle allocation and
>> cleanup of resources.
>>
>> Fixes: 4fcd504edbf7 ("power: reset: add reboot mode driver")
> 
> I don't think this is correct tag.
> 
> That commit added code which was a driver, not subsystem level things.
> Using devres, as you pointed out, in platform_driver is correct.

sure. thanks. will remove the Fixes tag.

thanks,
Shivendra

