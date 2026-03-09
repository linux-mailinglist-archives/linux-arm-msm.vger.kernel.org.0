Return-Path: <linux-arm-msm+bounces-96213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OGfOCu+ormkFHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:03:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A0002237852
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:03:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 455CE3013B62
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C4D31196C;
	Mon,  9 Mar 2026 11:03:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GK6T7XYI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RMFVco6c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774B533ADB5
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 11:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773054188; cv=none; b=jwbc8DFQ/Ni8RN4Mm8ba3pQzaC5SSsXrfqazYAbfu7H+SnCLD2v3wUFdZal2/Zw4YOYRu9dsJKcCsbPrTa1B0I+2P8HlDokK30zzl5XnSjIuP9yiCO2WpSIZhSAK3+pzTedpP9PI9D1eJNpZnsYNND1ILmcgTMrUKExj9cO6mCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773054188; c=relaxed/simple;
	bh=mb/zBFsIrlXFYegKo2ygdbp5CBavB9XMxOV+i8dnp2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b+XL2ptEe+WW+FfzpzjhtrxTgom+RUet7Ts4W2ITEOAHuYm6QncfxzvyUYCVYyq2XoReXr0XPm9mta6IZChgu+pViBvXG2FxXGa1Qyw59g7wvQZZi/hVIZLDQ8o1PFmeFUhmmOJ5uYuLqF10EjVu1uMuxOnXtcgOqAZWhRtZpQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GK6T7XYI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RMFVco6c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298WEDD3773310
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 11:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5EVBoumJUppGx5vMg2yuNSvMIcmavTeZvYKHTu3kpRI=; b=GK6T7XYIWcz6Kb1g
	iUC8E9jvysZvMuM8BX/av3PM7BV8GyTLCdULUq9DFl8gdjSH5NJbZOgeZ8A1r4tY
	0/SD/tqVh7IM7HqbSQn8kqfwiswAU9c/oQZchJ0BIcTftzWEXevQTAC702rNB27L
	mCHjXz8KxMvn6bJdxwnuflHe9F3Zwamgm0NTbd3USSFqEiNuMSKkZ7m1nSJh/DfU
	y5AeiXuCCQQ9gyhQKvk8rMzhXIrQRn7obdUBOZIxEZcunW/18mXSwOMlUA1VxGIC
	DClPHlmT1mufcpza6kgtfIaujZRVfo17l10CobopQh+51JjQapIeYB81MENdl0Xl
	Gf7JaA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa8hds-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 11:03:06 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8dc8b434so36684585a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 04:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054185; x=1773658985; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5EVBoumJUppGx5vMg2yuNSvMIcmavTeZvYKHTu3kpRI=;
        b=RMFVco6cRUovHvBsDJm7yu8+5EuTJ27XlX45zRLFvEUPkBKFR9HFza81SZtc9yaxC5
         i7IKjZmIBAixh2I+d5cGak9SBEU2jVhKIfJAWx8HRy8hXyYBE5uvejg2TFpzA3VjW3kc
         gtzZWQrFdNUkVHzVDVvMvZq701BY5fTML2CGyc4LH1atbB5ihBGCNPTG7RHmQkP8Oqh1
         1qXHRPo0eQeekziJWvqDcrO+3UJKuWYRyScaCEznmJNabFEO4x0LGevxJiG6pjyrECAX
         yFS67FmHNPMc5HWdPIb4EDvxrU7uxJ6Dv/EbirMzHoT/Lq2+9SZOIvJaR13UH2FaCgEd
         rDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054185; x=1773658985;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5EVBoumJUppGx5vMg2yuNSvMIcmavTeZvYKHTu3kpRI=;
        b=KEBavWW4E8gI0HOUKmbucYAPkvymx45zad9IaNbQcfs7Wq+nKuvx5iE4Deeb+YhuaW
         jbosxavQuxu9oELtIwawwdZVYxdv2y1W1eJCftdpHaCLHE+y8ZJXmSL5qS2Ujkq35kN3
         oeU2HzvXXt1luT38MJlTWRgqgtcsV/EfpHhHO6e/ebGOI0hTaK6A07cVGxNyRRMFWx2I
         tGgFSMEogWLbayFaWfZoaZKbWwPuhfLBvjB2Wjt30qQcZ95lNr1Mf9h7DnISaWD0jGRF
         X5xooBcGscfOwNjn5bJdr9wh6TsKkcP0AdpOo2gt/5USwULwA+DeolL2f87Ja6x1rucv
         fGFg==
X-Forwarded-Encrypted: i=1; AJvYcCUBKWJHCQ6zQlzMJXWYqnw5Sl8w72V47fagoiqleA8QIKMG+sBS2F14NoAoNWOIVVCgExofSWeq+5nepdXI@vger.kernel.org
X-Gm-Message-State: AOJu0YzbSSynKSywkNvY/ahSyuhjaDUQ2aX4B+wh1AXZ8wIX/C57NPnM
	N5uXExXxOZgSZcFDzKkpnwo4rRhw5Vpjs/+m5gAAJwqCT1BStli1p10pxun6h6argjrtc4ldDP/
	LGOXUy2hLtaKIoUuq1hhaUc5To/PCOdwG/MVRrP5Xc0d2vbNBPDO1RaELEm+ETLgKTNH1
X-Gm-Gg: ATEYQzyt/OYBavRh/d5VZbqYd6hWdykL2t1jp0QolDsLp1aXk2OoQcYQEghyY9H3eZA
	FyT2szLSeHibNrrd1nKnEf+Fko5goOG8OwzYbiHcKGAo0B9pgEO5oXfdqj5tf96dvKFIB/x8m1K
	vMEjXQ9R29tCMQJABNuaEyvqAmlfyDpaOUv40+Ly9NfoIuiGJfFDliNUPIe+kdm8tCkwyu2Gfc4
	zsA6NtbFqBrpPdGdzVu7LFL2qbeXDUiMJNWYCNJYz/f/Flap6v698ku3+PmyRRfFHjvvQ94XpCc
	mjyqC0ELj5wrnsgy1ba8n+rS5I85Fg2dWopNHGqqpb3UO7r7dEYILbqHm32L8eCC82JKjMP/P1Y
	Kt0ks+uMY20aqZTZR98cTOW6NBkrTjlDcgFTfh6juTVydxc7VXZToFcsYydiVb0cedStQObJ6vL
	lePU0=
X-Received: by 2002:a05:620a:468c:b0:8ca:4545:aee4 with SMTP id af79cd13be357-8cd6d3359b7mr1066994585a.1.1773054185663;
        Mon, 09 Mar 2026 04:03:05 -0700 (PDT)
X-Received: by 2002:a05:620a:468c:b0:8ca:4545:aee4 with SMTP id af79cd13be357-8cd6d3359b7mr1066990685a.1.1773054185139;
        Mon, 09 Mar 2026 04:03:05 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a55a200asm3014657a12.31.2026.03.09.04.03.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Mar 2026 04:03:03 -0700 (PDT)
Message-ID: <55250bff-c46c-4bf7-9a94-27db4f86b037@oss.qualcomm.com>
Date: Mon, 9 Mar 2026 12:03:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm8250: Add missing CPU7 3.09GHz OPP
To: Alexander Koskovich <AKoskovich@pm.me>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260307-sm8250-cpu7-opp-v1-1-435f5f6628a1@pm.me>
 <cf549a55-0818-4be6-b28f-c90a2dc09a5b@kernel.org>
 <N51k53pJOUTOpQrfJsuk9rZdo_VxhPtCdG1Aj-8uqmoS1Bl7q7FUarMhq5b5sZwAzJrH6SvH5n1KeK7T2mSn3ssMThLiEdmKNfccXata1-U=@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <N51k53pJOUTOpQrfJsuk9rZdo_VxhPtCdG1Aj-8uqmoS1Bl7q7FUarMhq5b5sZwAzJrH6SvH5n1KeK7T2mSn3ssMThLiEdmKNfccXata1-U=@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ta1m5Jivg2Q5ZQH8429ombgVtOLlFwKd
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aea8ea cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=iKFnSQUn94kHmAxMAisA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfXwpWPQIE4032a
 84Ovgq0jP9hLN66Zl45arnbq/yOJR+wY3HnRBoXNbk0Zbx8QjCGltMaMMS9u0fk3osuLO6mwL15
 lKumOD9o93Bd8l72voaN0zM2RL+aFQjgiie9u47wgkEfmhJ++WS6n8gqj+K+6Z5wGkOYnZAhbwU
 bgdwe6z6f4evqUk1m2X5ZjGwpRAi1PbReWGR1eaOt3CjI7u0nsaeatE8Wj3elzw0IWZoMTJvd3Q
 7PK4tDtSIDgTP1IrHjoNQ67kjmx3zHv9aXxdUqhkw8WHcQyIvMKX5mKnWvoaJkrc5+tV5Vt7y54
 II1H2zz0C1MSWAPMPYZJYdAmAEpZqJxyPOvRRTnJYdWXsG6d0+FxLh8BAjCwTtIJujgEd3A1VPp
 7DL6eLtQd6+3UBP3N9ymYK9I0JJYEyzQ8ko+lW4fcVSmv5+2C5NSR+4aNHimBxbYzH5jTQzCdmi
 BJM0B7Uem6w8/RMCy3g==
X-Proofpoint-ORIG-GUID: ta1m5Jivg2Q5ZQH8429ombgVtOLlFwKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090102
X-Rspamd-Queue-Id: A0002237852
X-Rspamd-Server: lfdr
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
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96213-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.979];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/8/26 7:03 PM, Alexander Koskovich wrote:
> On Sunday, March 8th, 2026 at 4:48 AM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> 
>> git grep "ASUS ROG Phone" gives me zero results so this is insufficient
>> argument considering you are changing multiple other devices which might
>> not support that.
> 
> Also I'm not 100% sure that this applies to all SM8250 devices, should I just fold this into the ROG 3 DTS submission later and put it in the board specific DTS? As I can't validate it on any other SM8250.

The qcom-cpufreq-hw driver reads out the LUT that has been programmed
into the device and only considers OPPs that match those entries, so no
worries here.

This is the case for all Qualcomm SoCs starting with SDM845.

For reference, SDM630/MSM8998 use the same hardware, but need
programming from the HLOS which is notoriously long and annoying, there
you can actually make mistakes that result in instability.

Konrad

