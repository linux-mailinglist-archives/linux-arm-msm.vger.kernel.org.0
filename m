Return-Path: <linux-arm-msm+bounces-99822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oD1QIm+2w2litgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99822-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:18:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5B6322C06
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 11:18:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BC0AE302FA8F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 10:09:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 752D819E7F7;
	Wed, 25 Mar 2026 10:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B2PNfjz1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zhy8PCTF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E743659E1
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774433371; cv=none; b=ojadQqPKwENQbUEZ3f9Hbian/3d2iFMBJ02NIqgNavss1ILDbpGQVpYBTGmqsIt9JAB0WM/vkw7jLH0MA3PdOfHS2gOcpaDnn+TzZKn5L3AwhOKLhcuekE4YEIqVycDAE8QpLO1gRvoowP5xHZ/JM8efYi/h1XE3Bym0/RzF8zA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774433371; c=relaxed/simple;
	bh=o0VZ278vh+tWOjoO4E3ZJn5z82pkomtbeITdYUEpZzY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EUWYcS9IMKKbt5YXgQiCaHoV+EWlYaU9BuLtOYzpCOjaikzQ+5ovK3yZYfcv2lHqYhJgpZJA5kA34549l2DA6ear4sww7huorjmV4b9GAnrT9ZRjy12mL6i5l/WevBKRBSy80+N0JXcqAj41aCNr3WROqDPd0MVYKW8dJHI6BMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B2PNfjz1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zhy8PCTF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62P3o9ki1208817
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:09:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lf14XtCDMSJhEsxer3Ovdkvw5jpasXmDlwuhiAqrGR0=; b=B2PNfjz1Yt34Faiz
	ccBQ+6pFltlFcNdF05NWdLazVA8ebadcYStaW1SZucDjBPlDri5WZG8v4YEwK3DL
	M08uB+NPy0iCNxFgXCaoo6ZqK55NJkE6lel48m337V4tLgV/DRZ2fhB6EBioS2eQ
	MLD5nwrQTZXMhuoBXWE2RVyNttYr9swNsuANmLPMUFlZ6p7dSoRny1d8n6bcC3NP
	oSvOW4AJdGCTFA2Jp7VJZ2zxkkZfY30bgIEvVn18W/aCNupH5pxYvwKslmdHf4cM
	GWpayRtPipri57T/NACfUyHwF+VTup8DzH2s/q9r0AxTDABUmfeXrxdjHHMXSDQj
	giuvLQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4859993u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 10:09:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899fcb63705so44052996d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 03:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774433369; x=1775038169; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lf14XtCDMSJhEsxer3Ovdkvw5jpasXmDlwuhiAqrGR0=;
        b=Zhy8PCTFEbo87IH2N5MrS2oZGX9K7nyGQKslsI7yFqIGSum4bcGz3xvIrSlw3hvLQ5
         R8swotquOS3kdhVuClY4+tWi75UXapToN6pe1o7d8m1lzYvsYv9EaWqaGPfdav5DhIKX
         dKOHLKKYH7kuN/8CxZNrXdfE+2GUS12Sx+vgBiucUzl1S8/yi3gbl5lfekjvvTzseEJk
         QZxk31rQZ76JxQWcwyz5LmyPrWGfVKAMizGvGs4R7/agfD2bkdpL2zmwrHhpS9bF5X/j
         yh7hfSZsnwZCcKknhO0pAPREU8zN6L+QEDwQyZ1DLNsHwXqOwVERratTwcMuwPuT6YFK
         Z8Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774433369; x=1775038169;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lf14XtCDMSJhEsxer3Ovdkvw5jpasXmDlwuhiAqrGR0=;
        b=LWmdlyqOLrfqKA6YuiQpzTJiPyYE6N2gHsz4DWkGuKfcp8k4U8Z2RqjYcnJTj+B3Fe
         9UIvQSkbAr+hv8dgqQgRhT+qLHvcr1shNGz+/du889k2zACIXxMikYE83wW/7iHg89ho
         uEWXub9UNNZjVVucf5V85/+JtEvaeYKE/P13ryqpoO6xHDXxl6ww8iQOcWRq8PPdqhQW
         uW3BUnXb6vYu3cFpcTTCTXrIw89BD0LpMIRJF/wSRR50z7F79R67zrwyTPSCZT+y5rRj
         5xngZnibvZcpj+SKLWkq7HKyFiMCvN2aozvhzgiB0N0fDrFTRCT1O1IuCghqd/x/IReD
         dTBA==
X-Gm-Message-State: AOJu0YyKbQplfa4vKoO9V+9vqTpF/I1lz0YTx4135UJUQzqHFHukGBUE
	yAPQeELKjpmlJeGXvcu2MUCOor/gXoTYIZU1XFyixreMrQbsUapxLy2/hhAJ4RCINZ/dBNNWzWD
	NEwG9loL22cf0OVHIJ/diKhad44SJh2tniobbGZJoY6MzRIiz9D31RT/OphCP/Zm3+IBn
X-Gm-Gg: ATEYQzzhAU8h1sXb9OpkrIJ5LKBKGNFTGDd5riQIb7aJVyOjCwe77RMyZEjJCc6rdJZ
	3jvLpzDlh+IF5TjsR6c8bxpjpjUwqVp1Uwem2AbAJIT9OF3pbXRZIZR6PAGqywyrWI6iEIVoFxv
	v/UOdS+r7axzSwqtc1cBY1mnlfdBw8lGV7YRAVqEI+bxalwwSNSfytlMWrMNI80yOyd5b7FwXVF
	DOXRJluXsqwOK4fkWCD3s9lVJKOzZSqwUzaihEh3wxx4O4SGlHFirMPoG63Yf+OFQDhu795zcds
	LMLam+hG2Cgo2DjpME2ZtnZBfzbWKmOvJIBpnTPUbgJSf/HMxrTYGnH+7xLIH/QBGC57xOqJkUq
	Y7ZpqmCL36XH7xmwF+hHYPTlEAty8fLfUv1MkdfzSmTdHpBpnRMEhJNZjWR1Mn9nOstQjTyT3Jv
	dynH0=
X-Received: by 2002:a05:6214:3012:b0:89c:69f6:a1f4 with SMTP id 6a1803df08f44-89cc4ba9c55mr31919486d6.8.1774433368640;
        Wed, 25 Mar 2026 03:09:28 -0700 (PDT)
X-Received: by 2002:a05:6214:3012:b0:89c:69f6:a1f4 with SMTP id 6a1803df08f44-89cc4ba9c55mr31919256d6.8.1774433368256;
        Wed, 25 Mar 2026 03:09:28 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983398c16esm772864866b.61.2026.03.25.03.09.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Mar 2026 03:09:26 -0700 (PDT)
Message-ID: <fe12ccfa-d201-4740-a317-e07353a96b1c@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 11:09:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ARM: dts: qcom: drop apq8084 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260325-drop-8084-dt-v1-1-a0255a404355@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-drop-8084-dt-v1-1-a0255a404355@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDA3MSBTYWx0ZWRfX7nlbqbRheJ9W
 v0y1mio+zHrz8Pl1HAfoQROrhRfiX5PPue+fY/loIO9/kitjulqVbBEJ7oouA8kPX6X7deBzL5E
 R0UoU1KJIOVEg2GBtVmHnj/fXHBu3E4BnN7L+WqKA//NaEHXe81FBddhz6Kjfyq/QdogWazoBIJ
 l2B+ANkfaKXGN32H8PY3e+Od4sAIClqAIFtrfLXLsO7cbRX5upEfsoBHB1LQZ8na9L/V5fxmyxK
 XChScFjVApyUk1WVLvLkXJ0oWjyTWpQ1tF13i3IC8FaHCnJyj7PlhIXISJ6crqJk08YNSik84O9
 CM2rtYMO7xD0ySEqcWslw/IJ8rAYMGFOMrnrM7H2qLQkC4F6WwsKz0OQ3hZxTX8p831QZPFH+AK
 ksnuvFMqZJg/f+BjqR9z7DOjRpatKq6YPbtv1WhRXNSLW/N6Og/jP989A/EGBpmUcA4ykPOu1hT
 QboB4WLr4l6QeeZXWog==
X-Authority-Analysis: v=2.4 cv=VODQXtPX c=1 sm=1 tr=0 ts=69c3b459 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=Gbw9aFdXAAAA:8 a=EUspDBNiAAAA:8 a=3T1j78d6Ci3bwRAFHhgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=9vIz8raoGPyDa4jBFAYH:22
X-Proofpoint-GUID: 3DI75sROj1rUX9fVYHo127p8I_z4Q0D9
X-Proofpoint-ORIG-GUID: 3DI75sROj1rUX9fVYHo127p8I_z4Q0D9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250071
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,postmarketos.org:url];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99822-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DE5B6322C06
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 2:45 AM, Dmitry Baryshkov wrote:
> APQ8084 is one of the platforms which gained very little interest
> upstream. It doesn't look like the there was any interest in these
> devices since December 2019. Two devices supported upstream have very
> minumal DT files. Start forgetting about the platform by
> removing DT files.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
> ... and start dropping APQ8084-related drivers in +1 or +2 releases, if
> nobody objects.
> ---

+Some pmOS folks - if there's any community interest, please encourage
them to contribute sooner rather than later..

https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_805_(APQ8084)

doesn't give much hope though


Too bad - this was a really technically interesting platform, loaded
with all the features you could dream of in 2013!

Konrad

