Return-Path: <linux-arm-msm+bounces-97870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHneJSLIt2kRVQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:06:42 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B17296AFA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:06:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D7D7630182AF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C948383C9C;
	Mon, 16 Mar 2026 09:06:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QSZ8ENFl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GS9fnrMn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BB5381B1B
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773651995; cv=none; b=nR1yuvMNkpc3pqUJ61BFELUgupHS27nc6jfKZ98NNCTPyxEGPa8+byp/ByIH7AuGCy0i+/ZF7lF+RVztzz0cqcX9Bng2Xhm7CLIGiB/9o1lGhXyiYKkLv/U1u/OPNeqWcYe92s1wfVlFeqPVS1LS6Ab5Aef4gCIUt5hXXWMOzuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773651995; c=relaxed/simple;
	bh=WSJ1i7xSrurxwxAyDPawNLM8TAMGNP4ffSZ0RFTRNcs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=M5q7AFAW+3UX42sIflnscr2qLiNc27B63YtmYLlOmUfluyI/O+tYSaq3luJ2h7N3P6zZ2rrv2mXs6XWPszxpZb+DpVWBG95gYL++zaUOUznSOcjW75PdeoBqAosdTGWjgxDfKIzzTnqopuRq0xPMZQidrCV/7KF/nZ+oD3NtnJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QSZ8ENFl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GS9fnrMn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64iMW2128576
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:06:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WSJ1i7xSrurxwxAyDPawNLM8TAMGNP4ffSZ0RFTRNcs=; b=QSZ8ENFldnIVHBHy
	Ysga3vpsptWdsAzDiAKCxPbJj2Ae+wfK4AkfsEyOJ2XTAolErxZX0gkQDkf6yeUQ
	0go6ECSYu6GCD5wC2gsMimKeuSIp9XGJ551UpDRF0KI9OGgJpw3olbc1SrJzh7IX
	nomHxZy6Ohyy+YQW3PfgZ6ci6nY1O2i2deBGwSowlITLyu90ZfyDM9ToTvwCZeFS
	jPxU7vn784U0H4z8R2Hae9RpTPMyP1MUklFmjWPGuf27kVl15XvBrr8fChq8mM/9
	ylaCJJImi/jwxgZgPmqX1fNbcQWIQ8we4GiZN4lZ+IMvtRH0iEBgIrViSsEWs854
	OSG2jQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw00an0rt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:06:31 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b0554888cfso12984475ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773651991; x=1774256791; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WSJ1i7xSrurxwxAyDPawNLM8TAMGNP4ffSZ0RFTRNcs=;
        b=GS9fnrMnHiqkyS8T+CD/i8nH3EGFYqJzRk6wt5XObS9DsbIp08625vl6BlqzVCfvjO
         gwpoDSlnJMcmyfkRlOnxnsWueLusUGsnaQjAZH9dq9RctH8mXHGmC+I8C2kN2zEfQhG2
         bglncR3ZEXu5QkzIlBLQV8RxdXU1juC21QhVtXFKPG0/l1pRoLHAJ1T68vq+HK2yMhYf
         O36biBceEh1MFtNMPCOYxkqN0KpHSx1xc3KVlKAtDLDqTPgkcrsappSH42L876P+tpuG
         DlOCl8FAAXuXRpXs/GXppMHzF4jkgx2D9mdKM67ZA6ttBDiuUHLsybbSxIzUnrweV9TC
         fuYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773651991; x=1774256791;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WSJ1i7xSrurxwxAyDPawNLM8TAMGNP4ffSZ0RFTRNcs=;
        b=IPCoI3KfXN3pzmJQH/+B+7pVEIXKOIp/MKrkoct3JLv9VCVw8NFWmKr3rRemSRHKJp
         WsknkOi9ilZcLMXxlUy1S+9bdlD26WY6EeUQR0Ea8nxFv668Kev0WPqTaTiqTCfigKH0
         Oov20mmG1wyPaHXbLVqvBhWru5rL8COo0g57yRBZ6I7pl8grxtlNy3J5HMv/Pkdzaddq
         sHOnjIgMAKoWzffMu0yf4BNFJHX9VcfClPi3H8V6BVWR95mGwhzW1g2JukHatqX74+dL
         V4fLp2+Cuzbeg/HIS9+LfM8iNgWomYZSFkTD4/EQI70OvK0XZ2tkgfKVAv7wJKw+aPTy
         VGuA==
X-Gm-Message-State: AOJu0YzPvEX3RwsdEuyAZ8Gpw9WAj5xQZ/UoTpvQu4aiNg97NKpWHhir
	9vm/zBL+0iwHEnBEMNWwcyAMnJjTTZXv4CaiKPDDCXyLJ8pgUberiioRfbkrMSHm+ksF56bPISM
	s6YY8jGoUw1hNa2EFuCywRoH650IUPmztC4uXbzMYo+qGEvSMk1DS5zCGFEFx9RP0RsS9
X-Gm-Gg: ATEYQzzqgAegxRj8CJ1nXjjRokFd93yp5iPc+BHzDBdOyksfnWCIJtn79ftK7G3k8yy
	xQM0TMuUcZ6U1O7No1WAwvy6p96JZFz73DrfJEu2Hsb9ISFEMTfVrS6qfd8wBAp+bZqqSfUu19n
	0BF52u15TdPpNOZDIhsGcZgR/IrtdM9+YWajmgcIQAcbPJ3kKQNCBef18ZLCEqIXNd/U05Q1ekH
	kpIbC1NHmijCYQ3iGY5tnMcukF7Jvt8bWMo6M6G7iWZfmwe+1+ygEC3+A6OewEbcSv3yTO1VMIH
	uqKag5Zk173f4xSsEB8evP3Z9b77xVs89uuzJDgoSAGKscJu+U8B9LxUDjyRSa/vfqS/HPMzhnE
	MagW6Wli1x7aQ0mqK4sju6OlFpiDcPWGjdjMLccgi11QEl5rkfvvBoqqDxyOSYP3Erw==
X-Received: by 2002:a17:903:2305:b0:2b0:59c4:e9dc with SMTP id d9443c01a7336-2b059c4ebc7mr23580205ad.22.1773651990999;
        Mon, 16 Mar 2026 02:06:30 -0700 (PDT)
X-Received: by 2002:a17:903:2305:b0:2b0:59c4:e9dc with SMTP id d9443c01a7336-2b059c4ebc7mr23579775ad.22.1773651990420;
        Mon, 16 Mar 2026 02:06:30 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b05db37a8esm19727885ad.29.2026.03.16.02.06.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:06:30 -0700 (PDT)
Message-ID: <7593d19b-c124-48fb-9c0f-af8177dab1ac@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 14:36:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/5] Add support to read the watchdog bootstatus from
 IMEM
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck
 <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260228-wdt_reset_reason-v9-0-f96d7a4825d3@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20260228-wdt_reset_reason-v9-0-f96d7a4825d3@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: uvufxpnZd4zZ9JkvJRLkX_QhMkY4UYsR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA2OSBTYWx0ZWRfX4vI04KCSaXBH
 jD8YwKl3qettQ7kxtmYm7r1TcLl1rFY8zVSgf4gQyMvb+fib+S/xcR07YaZJx99IdoJ7lC4W2ub
 snatwc55X76JHBXLIHHtsys86F0XIA92ELYe9BCm1d1BLB/J5B9GX6wlX2sh7pWRlLdOjMYFG71
 NTHsoRPUXchStigC6cVI5qs5BseX8YNG95bVgIVzIBwtr98mjUQMGzqob1XgyMBK3tK+9dY+gQw
 tOELxFaO8lWKlzxgT7sg0LVyU9l7z4sLrfszKpsjQaXuhBWOmtpagZk/inJdRLtBo62NRovGXXs
 635D4h3jCx3DAl7a7W2lLLPxj9kp+K6IDtcXyDb7/xI9Nuva5IwSF6VvUNmFWip/HlKbPgbZ24X
 VxNqqhYoDj5bDIVt+P6txW/Qcj7tepqWkvMXGgO94/VArZnsvRfBjzDJiptW1zDLt2VDvlPaa/h
 QGijhDWegQTGFBOBHWw==
X-Proofpoint-ORIG-GUID: uvufxpnZd4zZ9JkvJRLkX_QhMkY4UYsR
X-Authority-Analysis: v=2.4 cv=ebIwvrEH c=1 sm=1 tr=0 ts=69b7c818 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=1iOovS3Ob0lYkPkW6isA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160069
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97870-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.0:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 13B17296AFA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 2/28/2026 5:58 PM, Kathiravan Thirumoorthy wrote:
> In Qualcomm IPQ SoCs, if the system is rebooted due to the watchdog
> timeout, there is no way to identify it. Current approach of checking
> the EXPIRED_STATUS in WDT_STS is not working.
>
> To achieve this, if the system is rebooted due to watchdog timeout, the
> information is captured in the IMEM by the bootloader (along with other
> reason codes as well).
>
> This series attempts to address this by adding the support to read the
> IMEM and populate the information via bootstatus sysfs file.
>
> With the CONFIG_WATCHDOG_SYSFS enabled, user can extract the information
> as below:
>
> cat
> /sys/devices/platform/soc@0/f410000.watchdog/watchdog/watchdog0/bootstatus
> 32
>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Gentle Reminder on this series. If there are no further comments, can this be picked up for v7.1?


