Return-Path: <linux-arm-msm+bounces-102915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AHPLFsm03GlVVgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:18:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6623E9B67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 11:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8F4203057486
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:11:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 974393AF644;
	Mon, 13 Apr 2026 09:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HjEtIRhY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FPPcigwz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556353A6F02
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:11:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071481; cv=none; b=FUEL16cZi4gjD2ZWE3yzPrUNFM6GGLAGMozEUFpskQyFCqPomtU7UnCV8XecfM0GrxxhsFNGGRYZ7yp2T6uRiFRlJ7qVrexKiiMEI5xKHmoda4AECywnvIv0V9XVjRcGJOfcCWEW77PEp/7PmCHJO9NkHk3exsjTHMOVkjeuud0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071481; c=relaxed/simple;
	bh=3WOw8s6Ohc5SZUfbw4vOwLhX9LZmHj7TUZSBFd+D2Ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fgo7qvA88YY6KbRfktexDkMel653swvZ34k00auVl3Vsa2JxAEBKy10kM0g0O08uWaqFwiDAB1fSzr1xI1386GmUnfhk30CvNtWfPYCOjYgX9NOWVj+1yLA+fIpAnz6Xvt3MDlYkvIeraaFAwBdddFrQT4n2LEZcGovaLyzWGWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HjEtIRhY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FPPcigwz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D76xe61780819
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:11:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OaJAwMwHvRhGyIQtZCdpx+5k+5RxYYbk83a3VG87hbY=; b=HjEtIRhYP7rvPQ3H
	8kmsD+S3NpXHEKmiRoGkq2P5J1TOK1j4nJQIGDk9alGZihSnk0TSUh4+RgvkPl/F
	mwyCMMfprwotuxqqfAgbsCMvgXQ71nJ1S4CMwlWwCDafr+TGs05xvHlHdpIP1TxG
	1p73aMShwFz5N6i7TvpnfYZreRiGVLTOLGb9bKaSynLkQXUvWPie2+Vy7gnp+haO
	IiMViMHpLSQRwH7mt9b9RihoZloPpS1+mmzAeuphUkpbaKVuZNOWZaE8wmCHfgDL
	v5Xc7qr9AdE2L2OABadIuVkxyBtoGDs/aeQoIaWePDqLCJ6UFwkqh5jDVuJ8tLX/
	xDEC+g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dff0jvhus-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 09:11:19 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5073ed1ec6fso11164481cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 02:11:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776071479; x=1776676279; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OaJAwMwHvRhGyIQtZCdpx+5k+5RxYYbk83a3VG87hbY=;
        b=FPPcigwzdoY0unWKYgB9X43IK3v0DsRRuLD2tc7TzB/CdtyLyqOtf+wAC2kwpSYYsG
         voQnqRaTv7OprTWD5hyMKXccXRJxSeTu18Hb8weO0MqxJCNIWnuUhp8iNh50ygonmK/U
         FolCoV+033uDpJ/ez6dDXQ977diaabT+Eek2P3wOmrMJpkb677Z3pVoxHb8qPpfOH0v6
         xRJFsTuFg1i5SMJ3HrmCDF7/MemV4bg+Egl2xqsf/TIKvR4eYk6J2T1sHxiRjmog4/O6
         BivCFXfMu0L4kK44bS6I1mbU9So1gEeOEgUfUoM9QYVU+qM6HYtDJkecJyS8uvvgfFBc
         17VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071479; x=1776676279;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OaJAwMwHvRhGyIQtZCdpx+5k+5RxYYbk83a3VG87hbY=;
        b=s/2ce+gYNtYC1m8Yw4HDNWhiGEh35SXp5rNsoLpMDjhrHgvY7NLccvqGOe4CbxIrPY
         Sgf08jzjPg8G71uMW7Sz29yiHdnwTqGtTcMzeEpyYbaUWn8GrpAFxTQ5dja+P+SOU7A3
         NenMOJ9PEsmI5MSYhOaOJbIIrA6R8T+8Ul/7Rt8cUvi//q1PBvi0VN0T+vw4pMSmVwlc
         pdQCGgYTRw78f57qoaGwV8RhMiZthrTv8DxYRHrHk9hP0BSPtGeQANY9gJxPtLV64qrl
         aC6Z0DQ+tBqbdRVo8/dk3Wj7Lm+/mpFXV7Olg1Dx1SzBnjycuKwLsJUVF6aDuilPQIF3
         Bo3w==
X-Forwarded-Encrypted: i=1; AFNElJ9v6mW2Vn/9xP6dOSKtp8LE/LLFxSaiGNDkgLkyjf72ADjkoi+BUT0CqXx712PdeBjB51V/EXn6zEf1NSTj@vger.kernel.org
X-Gm-Message-State: AOJu0Yzszmm/0MYP8Uwn7GmMa0Z+Lpsr1qD4QzjTV08hjVB8+8MLHgVl
	HHSRs6zjq47hU7BUV1OUcwXbXz896UuAbW6/o6uqZzvWVl+BnKCHVsIKUYDVhzw0cB1F9wBdBHb
	U8OnSYfoymp19VYSqsq+pfeIXL93pj9T2k0n3ypr2Wej9rAwYn/vmnesWrQFbxb8LWIu8
X-Gm-Gg: AeBDieu+83lv/kFtZN/f+TvwrCAsfvKc8XvDM6pxCNJqsuvqRIl4d+4jjv1f+JnXbyY
	9n+kDtiUfslVBU6nNKVH/jiz4gf5Fh6RfR89JzBY6r/Xw4ejexLUbo9FhWm6LCC/NmzfEfEmLwC
	TlS4cne8OHJDfP6bsthCSJpovsYDmb5XV5TprYSMvSIGemI6cCUFh13fkFYN2ICw9w6tBACZAXw
	Mpr6ILJ3Wgo8yE4cj5SCNxsbtvHpJg4V9sY3za2CwHTp99qd8lSOuVRZtypPsiqYocpirKb4Uho
	9+hHASBMyqUq8zDZ3BMo9vN7gKj/ceSW1sba+j9oge5LePn9eQ1O6OhmtE+M0dc4xCxiEgOKM5N
	PmsCJBXG/a0Wgwt22keSq480fFMDYoY0MYq31AcFtPbZZ0XuYzw4MMjU7TzIUgpzDjx2c2C2EYR
	7HrzY=
X-Received: by 2002:a05:622a:5815:b0:50d:a92e:fead with SMTP id d75a77b69052e-50dd5bf0cf5mr130767551cf.3.1776071478687;
        Mon, 13 Apr 2026 02:11:18 -0700 (PDT)
X-Received: by 2002:a05:622a:5815:b0:50d:a92e:fead with SMTP id d75a77b69052e-50dd5bf0cf5mr130767361cf.3.1776071478250;
        Mon, 13 Apr 2026 02:11:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e5c56dfsm302667366b.37.2026.04.13.02.11.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:11:17 -0700 (PDT)
Message-ID: <d5f654de-0395-4c63-a1ef-3b99bc98cc98@oss.qualcomm.com>
Date: Mon, 13 Apr 2026 11:11:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: sm6115-pro1x: Correct touchscreen GPIO
 flags
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Dang Huynh <danct12@riseup.net>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20260413090527.53000-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413090527.53000-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA4OSBTYWx0ZWRfXyLJsTQ1mlZ82
 YnddBLxAPHc4Q7wcKY45IS77Pe/IAkR4Hq503N1ug3ng97GOO/TOpk5LXf0pLgGEBC15KXsy9H3
 3ZEvm41UoIqub/BAxFdx0Ncfq0QW3trkibdcwWBmwZAOl+Vs9ZM1ufHlOouKb6KfGfZLqy4Gt9s
 eAj+CqJlnYEAFhUtfdwdJj6DIMKOy4Kb6gVRCUsWC9FkzTg6rYo10SLt6FkrjgOz6TMjF/PgzVi
 0zC55Rp1W5wQWpDkbbtk1gqoi5Om8yIee9Gi6AWWj5BoUDwMkCMVPRhGZOkqNVedRrz2VNl+6Ht
 s5oCR0glBYWQJjKM2j7XRdI1P40jU+PwPYolEtvWcg2d8zkt6NidBAFSicqGoEYRF9DTeTYrZEg
 ugXD/etjKC1U0q/DEUPQOi5nGcppF24bLcpoR3ug/iUJQCMk9vWe4v/278J9VYc9MkGH4A5/uBn
 4EMAyncIEb5PXWsSaeg==
X-Proofpoint-ORIG-GUID: HCsOw1cQXD-Zb53v5nv179ogz_IwkY4p
X-Proofpoint-GUID: HCsOw1cQXD-Zb53v5nv179ogz_IwkY4p
X-Authority-Analysis: v=2.4 cv=d/LFDxjE c=1 sm=1 tr=0 ts=69dcb337 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=p5SleGX6KkeDsG2sNWoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130089
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102915-lists,linux-arm-msm=lfdr.de];
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
X-Rspamd-Queue-Id: 9F6623E9B67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 11:05 AM, Krzysztof Kozlowski wrote:
> IRQ_TYPE_xxx flags are not correct in the context of GPIO flags.
> These are simple defines so they could be used in DTS but they will not
> have the same meaning: IRQ_TYPE_LEVEL_LOW = 8 = GPIO_TRANSITORY.
> 
> Correct the touchscreen irq-gpios to use proper flags, assuming the
> author of the code wanted similar logical behavior:
> 
>   IRQ_TYPE_LEVEL_LOW => GPIO_ACTIVE_LOW
> 
> Fixes: e46b455e67f8 ("arm64: dts: qcom: sm6115-pro1x: Add Goodix Touchscreen")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

