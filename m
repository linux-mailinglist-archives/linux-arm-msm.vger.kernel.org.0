Return-Path: <linux-arm-msm+bounces-99192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMmrDdIWwWn5QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99192-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:32:50 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFD72F021A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6007B300F588
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:32:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 044EC387347;
	Mon, 23 Mar 2026 10:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HywpP8bt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H13sx/of"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883A338C2AC
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261961; cv=none; b=DDjUYtMvd+f5mW6dyWrPDw0alHGziRx9Akfsc/gBgA2M58jMD5/6BJWpUsAOlxOUDxfwYAeJsXApL33bV9CCtD/5EeIPTXcYg2uYUVrgWpE0KIff6zNr7W1jaCq97dPLp8FaQqaaWMeIq3c6x15xO8zyzU+iX4OraJrNZIFSZTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261961; c=relaxed/simple;
	bh=M9TJbC20ZbjsQ2ZRYaguu9GU4i3XzOcSMPck1zZ4W4g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FVVWHVos+Af9qbKNFYDHQwf0hAJ9DB35fxP3RvneBKLEPljYZ4oqxhNEMKoz8FOkaJGvJqS1sTGvKjjoiRGdh51lqq1mFowI6GnEdoXMuXqTolf7g4+VbFGqstacBOxn1xP9dTLjyN+Gu9WMgV9me8jdQsUNKhyPZ3mlLBCnyoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HywpP8bt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=H13sx/of; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N7tAc62291136
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:32:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M9TJbC20ZbjsQ2ZRYaguu9GU4i3XzOcSMPck1zZ4W4g=; b=HywpP8btK/xv9IMp
	e13zKGeSbBSNZ7EZni+TmkdOK3B3T5zR1r2y03vLSejCIlW6Qy2ME7xX7muy2xZy
	chA+b0H54TV/znQ7CvWGkQFoXj1R23YnUFR6fDZ1MsK77cOYYuGynCI9OZRdHkGs
	4SSm9r0A1Q7GAMX7fMkKAoGd6YQfmuteBBLQakEfXtTIbRfeAnADKERcNU3CkRvn
	xYx7/a8SpQ9tPe4XW8QU3sRNENWtRy6ilUYtFubSG79w386V/JmZuGSZlG3Z625z
	7bJFgi7H05uIfGRV+Fb2/UELSMv5IraYkj0WjTfxt5dGzvW9Z/bz5Akb17xUvtHT
	J1zt9A==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d31j70hwt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 10:32:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b33a19837so39905891cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 03:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774261957; x=1774866757; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M9TJbC20ZbjsQ2ZRYaguu9GU4i3XzOcSMPck1zZ4W4g=;
        b=H13sx/of/oe60SSqXsXGRFQiNuJqjPMK4s6A7wRmsUXX5BaNpZfxCdkcIa+xnw0FOc
         mLfIA264II3sOToDIjexKOQOVVPYYqw7zN4gJ8onjSuCdf0p/IZe/WFSXOuMJRqATcB4
         JItM7AMXtOVwe75kB44ZkPBP8ZOWgGTFSVhessnP9gPR1wAJj0hUJdNp+ajAfoP1x0u0
         ajVtK4HuchVJ4fTUuODg6bGFWW+gp+Iwj9u5IJDIrB3ll71CS8jbi6JgSdBODzCOdmXr
         WJQoY01mrj64ceCkrBSJlnhpP6FMLtI1Ijv47T64frXGHr+X/lEztukhgNK6mu4Shxrc
         UIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261957; x=1774866757;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M9TJbC20ZbjsQ2ZRYaguu9GU4i3XzOcSMPck1zZ4W4g=;
        b=lGOJFMdKRbBUfWjqDJFLoRj4UBkmKogAxSnjdW2SxodKU/LUgKSxG4diHHbCsGqAO+
         wULDYmee3N3fVdShEodyXNkkesp8vaeaFiLGQ248zr6CyEENMap0g1orB+2cXf7FySKh
         +vTLoYp71dMSBCAcgHcmr+T87c24d0MxUd3ss7dbJMQ52rt21tSsDRNs7jLrtR2fVpTq
         Xiyoei09knYv2wEGaUKzy0XhOB2Jl0v7q5AhsuW/X7MEPEdKXp9MNbjjluKSHFUnWVNf
         hcQpaWUngo8rxDlUtIRgyH78jLCdd7sEMZGJKff3lB7Eb0oUv3spxmXhhDwrzqpfnYTO
         hrjg==
X-Gm-Message-State: AOJu0Yy+oHURfkLWCGSotzzS2fBJTI3fpaq0VmN6XFSCK569gy388Vvd
	N24XePhAF5noVqEpytIv6TzQzNzDi/sm+WQTyYLrJ+hE4IdgOqzHdURePjWfc2V2QXE6Hb3MHp7
	4UF04Shzn78D6iGzyMSx6ZRjX/DmARhBcv5JxRak9qLNJm14hKqFcxUPrSwT2dCgiBji7
X-Gm-Gg: ATEYQzwRbwIKfIIyZq8PbCH5a8yXkja9CofPfGGkHiLpZmvhjlsvL+NSCwH/cu4tFQo
	CYTLsZ4PcrwpkqmNfxZCtEaGy76CUhE2LJzSrfs8g+a6E/txEmoVGYEKXYUihYNjqpJ8+XjTGx2
	rd4iHb5b6Tkx5OvHUIcrKhBlCqjCUyvqAPhJIA7igpewq+sPVs5vqyu2mEyaTlESev3RyJN0Nta
	TuHtGUiiTbi0MMgWkPd/AzYTl7bnHqzUFPE7vhhLHSHN5ucJ15XYG5IElrt628grnFrXCN4dE0+
	G0qEaZP1p24Cze/CYmGh2M88pUizZ1FSHPSi/wFZw1SQNdB6GcH32ZUp6lrGOt5d+LZMmAZ1Xti
	xizt/2dgjpSjWBjU0ctJ7ktDQbCHqGva9WaUnNh8+B3CA0HUWLJma5nr3s15letk5up4tHfwU1T
	m6LZA=
X-Received: by 2002:ac8:7fcc:0:b0:509:9d9:e19c with SMTP id d75a77b69052e-50b3739034cmr137127641cf.1.1774261956731;
        Mon, 23 Mar 2026 03:32:36 -0700 (PDT)
X-Received: by 2002:ac8:7fcc:0:b0:509:9d9:e19c with SMTP id d75a77b69052e-50b3739034cmr137127491cf.1.1774261956354;
        Mon, 23 Mar 2026 03:32:36 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9832f8ef74sm467617766b.25.2026.03.23.03.32.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 03:32:35 -0700 (PDT)
Message-ID: <abb14718-3d94-426a-a0f0-d101470951ad@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 11:32:33 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] interconnect: qcom: icc-rpm: allow overwriting get_bw
 callback
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss
 <luca.weiss@fairphone.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Brian Masney <masneyb@onstation.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260323-msm8974-icc-v1-0-7892b8d5f2ea@oss.qualcomm.com>
 <20260323-msm8974-icc-v1-4-7892b8d5f2ea@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260323-msm8974-icc-v1-4-7892b8d5f2ea@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=ArXjHe9P c=1 sm=1 tr=0 ts=69c116c5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=0-7ZaTWUpwkl6A8NQQIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: k_LC5Mn-yjdMyFzvjwfvGxUx3gjn07j7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4MSBTYWx0ZWRfX1lneDAgtyFuv
 XYVjnHh7ohIOgW3XsLOz0GkCvw0JCSeMlK2xsWmBTDA1WVZfx0mGoR0KZbGcKsO50ATbR0sgiKi
 xW5G7wuAhefQ4hGRDwVzczsC8CcSeW2rnko35T90BUUCBzEUXvJA6B0U9tJLrK6LAYbQNOb5UPt
 /J0/73k7pXFr1KqsFaC04iVa1K31JJ73XzUbZv9wwJVFSJ0ZUusNe9rGtkIB12GxOvGtLtkuC4P
 usy7if1q11Y50QBc7UdCm9EsSxnemNaq1dSPPCO+NMlG3ickJVttc+jNnEya4x9JL1dzjO1w9wI
 uUAF293oFtJKIVzOZHGZoV6Z/qe/dOtpF34LUpkgl7A3YCSxZ6UeJciLsug4qw1sxnhGaeVj0DU
 Bu6Hhxr/0t5kFSfJjpE9pzX4WF65FVheMdiM81CIB/vSVfJbfrgVN8mE4yhnKd3h11jIX2GrGF4
 M3CpjqUv8MpffPFb2kg==
X-Proofpoint-GUID: k_LC5Mn-yjdMyFzvjwfvGxUx3gjn07j7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230081
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99192-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CDFD72F021A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 2:17 AM, Dmitry Baryshkov wrote:
> MSM8974 requires a separate get_bw callback, since on that platform
> increasing the clock rate for some of the NoCs during boot may lead to
> hangs. For the details see commit 9caf2d956cfa ("interconnect: qcom:
> msm8974: Don't boost the NoC rate during boot").

Is there a single specific bus where this causes an issue, or is
setting *any* resource to INT_MAX problematic?

Konrad

