Return-Path: <linux-arm-msm+bounces-97447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJ17CKX9s2mWewAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:05:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C472282AC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 13:05:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F2F0A30031E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2026 12:03:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D6A737E309;
	Fri, 13 Mar 2026 12:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CPxfVbCT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZPLKwJ38"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24819374162
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773403395; cv=none; b=FsXhtAr2Mji681UtmLIveUcrBzoHOZR7/n0W3J5UMoCN/c8vDRLKYztKmfWmcNlhGHSbx3NvMce33iftKByHn5HKJkvNDmmJMSbzJQvorNZTRLFa7FZFs4tqyq17M6NxBZrbUx/Kk+pzjcUHTwqUi4DyOgmOh6vyDYCVzgK0hWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773403395; c=relaxed/simple;
	bh=6iZUXRuQAM45qmlglS/W2kS8kceFJuoO3QVeAY7yUJg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bxfp8aq9RbU3vHDNKJQsJ6pJC+J6xqs4DChaMFa74yuAehhxk8Tl5Uybbt48v9Ko+UzyJyuCNhKH/plJZ6UzCKEKabLrFIqrw6j6/RrRVXePJ4jM6rNlIvg6iLe4rXy8w5UdDaF/jH0HDK2DyDLFDJ7xw6FYOIPJsorDXVvpHQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CPxfVbCT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZPLKwJ38; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DBtFNf4140698
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:03:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3yVc/AQHc8e1tqRdIVfUMouFrDG6IHPRjwgFSqudTOg=; b=CPxfVbCTYDkTvdh/
	X8WDiw1rzy+dmAghKYd6d2aHqtveDIz59+BiXPrE9jY06MH6OpXLJINseL96F52L
	C24EBt31WeHtT820tHoA2kqPxiOI8aNf9oViXqsBD+aX7Mb2jXV7rVdfCRSR7wU2
	XmlZqCT05UhqlSVLxLY4V4E4EnN6p0/GfJtizjifO8jy0+oswUHGo3NWOi4oVwjK
	46O4iO65kXs5dXN0klof2zq8C0kY4gbQ14ckPhTrOVvUSZ2siKMRGvXR09vEmdIU
	NZPW0fR7Y+s9gVWhwpAU6nKn1Ui19wjH4O6y5Wm/o5yXpAk/wXPSq0fd9D+jVFQV
	2Ic2Ng==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cvbn29f6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 12:03:13 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-41718a3ad0aso1748215fac.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Mar 2026 05:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773403392; x=1774008192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3yVc/AQHc8e1tqRdIVfUMouFrDG6IHPRjwgFSqudTOg=;
        b=ZPLKwJ38aRWGxznMfsSStP376AwEt+Gm1Iccga2o5xRYGmyUU+WSHZomxVwsoRSQq9
         Z0yPqzjdJhLncmoP7Aem3PfRaKsEq6966XLOAiyLFkp49Oe9q7sUMr2ptBAZJD1CS60G
         b9kDSCXYIvgOywAx+/BmGWgQg+9JPNZ8WS+pbABE8tA0uIF8bb4PBC9U4XvJPY0ejSc2
         vJCsl1lOyBR+vtpsPMiRQih/DifsiTyBljLq3O5Wp+iZXlvMO42X7Y8sdHck5PG+kgpg
         EVrkXLY70gb/Zx/G2bpqWC7oghj7m27MAHwJfnDUMsrUxMETGAVc+LYbdHSWSvqGF5Rf
         hiHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773403392; x=1774008192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3yVc/AQHc8e1tqRdIVfUMouFrDG6IHPRjwgFSqudTOg=;
        b=MOcs6sNKDyWhF5lig0t03hUPizaITzZvZeUDVc5GJRiyCz51vsi17fyc8VbCBxMh76
         6GhgS+cOcweqtW/nrTcjIDJrL9UpDrMxrf3B6BEmx8aDLvcoAFd56jBsmH86E27VJbCM
         Jv0QHF1kBmuEjN4jnEWEETIjiKNkYEQXtlIyemW1gP8GkzLpSRN+quHAcDQwbPBD0o41
         nE9vUgWUDnT1twnQAVViyczE+PS/f9nSzX33ewTXjHimZFZGFV8ZhmJX1jgYz8aorpPQ
         T+cj8yjHMhszUHQD7kp5ugv5m+Bju8BHMM7LPDAlNAF+7iAS8hkPZO6+pgLOr6TjfJM9
         Oofw==
X-Gm-Message-State: AOJu0YxpXqZjqAcwYfYV1d4aeKrrUNicHdIMx95ZfqxOGe2vcj2yEfj3
	PyHBg3stQgt044lJPFrcRRJAe0/SqMuo5YmLNodHaBKgjtR/YkSF2l4D1mMVl8uyZLVauudHGxT
	G5wXWr1OTRPKL6N2Ob6N7hL6B8YRIUsZU7leB597K7iaNBLIW3q5tdNAJpNb0cclhoCta
X-Gm-Gg: ATEYQzw6zgv7I4wk9hWhovl6QOgq6lSrd23TPcW5AG5GDoWa7yO/aWeavz6GTvfpaj4
	3lGU9C7q4oNgXaEFRGnes39EH/9FkfKlnti+yoZ3o+u5WbFSpr1OH8yvv/mryO9gbsl7yilUhsR
	AEkW7MtE94y6U1CNVTAjD+UWXf9xw4zJ0MZznFB2N2iYf8zJ3itDpy7TxXSZVqr4SaRFgBhsf3q
	d6TqhZza4oU43cE11BxBo0WbjGXBTi2siYoCHtvC92Yd1ZZEemb8FhjSNzykiT49fVt5erKbawR
	PwsOfdzyaKmuGBemcGOTm4WyGl4yZGjgiYb48lyhkNkzF6jx5wDld9l+KJzS5KzoIYfe8WAUXnh
	85+vVt/2Bl7AZIEOZu6/Iwy/9c2T6lfMFIrJj4nF1swxPdvvcFAJZnxBTBZvpnTqIBfsVybhRQL
	MtFqc=
X-Received: by 2002:a05:6870:2188:b0:404:2e44:18cc with SMTP id 586e51a60fabf-417b93e2d7fmr1270141fac.3.1773403392452;
        Fri, 13 Mar 2026 05:03:12 -0700 (PDT)
X-Received: by 2002:a05:6870:2188:b0:404:2e44:18cc with SMTP id 586e51a60fabf-417b93e2d7fmr1270084fac.3.1773403391665;
        Fri, 13 Mar 2026 05:03:11 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b976d096d58sm40840066b.62.2026.03.13.05.03.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Mar 2026 05:03:10 -0700 (PDT)
Message-ID: <fb08be02-e73f-4efd-ac55-85ebe60a6e18@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 13:03:08 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: qcom_slim_ngd_ctrl_probe: blocked on a mutex
To: Tj <tj.iam.tj@proton.me>, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org
References: <f1a1e72f-318b-4888-b03f-4f38ab4cee6e@proton.me>
 <7672009d-7b14-4df2-b057-1ca5ef4fe79e@oss.qualcomm.com>
 <539a5f37-e06f-44be-abda-3afa69397711@proton.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <539a5f37-e06f-44be-abda-3afa69397711@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: wkVla7GFSMuAxQ_PAYKGbu-1CzXoR94o
X-Proofpoint-GUID: wkVla7GFSMuAxQ_PAYKGbu-1CzXoR94o
X-Authority-Analysis: v=2.4 cv=ZKfaWH7b c=1 sm=1 tr=0 ts=69b3fd01 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=unwBlSNg4wIqc4wMQw4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA5NSBTYWx0ZWRfXyOvPKwzGgZme
 qq27YuLohd687+i6rkHOhc5ji+8iDKJNlse8g/L9Qa3y+sxA5kg2gbrIvYCLjNCgO+yyQx6r6n2
 phH2x5VlW1eOKDPykXjDQFBeYSuNb0kWlei9YZTRliQ7uN0dmwuFhweYqd6UYb/Rusjs9FNZUOh
 NoMbH+IaFqnchquap3KBD+vviEG6Wj8EFbzN0VRoCI23il3+AZsukYoWKWDBcZpCCRF2Xa7+MJB
 m2U8VraQ6f5irsVkF/zDe9juzHB5lVND4IO1obff/nOuIeisoGEqVfR/WT633uBpEo7K89qA9lF
 OS3x0ps3mBsbCKtzIIxDbAsic9oj9kXu1ujxNxCY2+evrC9O4uyRY8fFylw2Cbi3Slc17zk2tPd
 rDDG7YcRxEXON+Q2iV6uLX++KL6ZCC4cFz1BwfOhSjwvLGRqM2GcnDhVpSnFzxsCGwKhKr9SlP6
 u4wAyzgtjpAa45hAVjg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-97447-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8C472282AC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 1:00 PM, Tj wrote:
> On 13/03/2026 09:54, Konrad Dybcio wrote:
>> On 3/12/26 1:14 AM, Tj wrote:
>>> Currently working on sdm850 device (Samsung Galaxy Book2 W737) and
>>> seeing kernel hang early and never recover when probing qcom-ngd-ctrl
>>> platform driver.  Only able to capture a photo of the stack traces as a
>>> result; I'll try to transcribe the important parts here. My diagnosis
>>> suggests that the module is calling __platform_driver_register() twice
>>> and may be the cause of the hang.
>> https://lore.kernel.org/all/20260309-slim-ngd-dev-v1-0-5843e3ed62a3@oss.qualcomm.com/
>>
>> should be able to help with some of that
> 
> Thank-you. This morning I'd just resolved the platform_driver_register 
> issue myself so now seeing
> 
> qcom,slim-ngd-ctrl 171c0000.slim-ngd: SLIM SAT: Rcvd master capability
> qcom,slim-ngd-ctrl 171c0000.slim-ngd: SLIM controller Registered
> 
> However the order of registration of the two drivers is important; ctrl 
> should be last, so I'm surprised that Patch 1 works.

Please direct your findings to that thread.

Konrad

