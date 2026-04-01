Return-Path: <linux-arm-msm+bounces-101305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFjeFNb0zGkFYgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101305-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:35:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB86C37895C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Apr 2026 12:35:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 16D1A3078B9F
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2026 10:29:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0A3021D3D2;
	Wed,  1 Apr 2026 10:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kEJtIjtq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S1jD+98R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5053B9610
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Apr 2026 10:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775039381; cv=none; b=YvOetYAtvyHZJ99Hc9mSHRixeKlNnLagNwSV1phHbUKW/PEPBiA+mP3DyWH387oCvAN7T/1j2K+Jq+ZYw1ItdCqZBOwnrCPIRYg4vLCZOzp/ZskrN6EhS88Pgrv9Oh/5r31Vj5wRkAwJjxhsEqk6toLJdCZKLguR+OPrG66Rsfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775039381; c=relaxed/simple;
	bh=vTqmhAsBP8GdKTww0YperDlWarnFiUtNXzMs0RzqbD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oY6yblLrYo46c51mOA/RlRX3FJmPUG+sEvuFZOSB5rt5Tcm8/J1Ova8LPOCP03Tt/GwtXdMa2+pUmZy7b9umC+x5dkRz1LZbHtkdakWaKtbCApB/aePkCywCK+yYxafjMVJ2ps/tbiB7qSJcJE/GwMkLFYdsEhhAvEDprZJ0w8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEJtIjtq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S1jD+98R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63171M3M3103827
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Apr 2026 10:29:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R6tUO4DuL1FdYQWwrhJaLcFQpQwrGG+29UsWyf8+zZ4=; b=kEJtIjtqVco+hFML
	/MusHuGQjDKQSc7u6luYLlPT92LcAHcy/8YHNA6b37q4c2xrhni34ket9uQi+bQ8
	Lx62UyeH2uo80OXzv7N4CXX7HBxWbTnWE/jKXYDLNTD5TW6dWmDVXFQtbNQzcKoG
	wqQ1RB5qLBl7ROp26nqNvE2AU8zjAtQEOD3+YlbmXGHWTCs5KqZIRF239+ytaHLy
	sIHtIjqNwAMqpY3ZZCot9YynOyXvdAPKWUUFkEXSsPnXcG+/4ZYTB63LtCbNbQal
	X8HAcwDD9YND/RVGhpxa0eN9Q8E5ATb0pdjDxpt/svHUcSzAY58MW+SQHrPDcrpv
	WzNo/Q==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8js23vdq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 10:29:39 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89cd541c0edso29457676d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 03:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775039379; x=1775644179; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R6tUO4DuL1FdYQWwrhJaLcFQpQwrGG+29UsWyf8+zZ4=;
        b=S1jD+98RJsOXrW6ZwFWkdsb0gQB5UetFai8FMg23ssqaHTsQoJ77ysSz95jab4dS1j
         Ie2xxR1AKm+js18ZUjLSFEFYU1SojrpoNjofg5ijCHMt7S953V3nHuWvFY8oN9Qj/Rgv
         RJOHc42KgilgAeT8pd+gW4DNtqQmqJgC1Sm8FpVdlhCcdy2sKkiGyA5L0tA+XjbLB9oa
         cGFgZtLjI4c23sHsfOsUSost/Rcgk6I2jGESnW5t77L7IdWglkzw2NvooqlZlYw1UKSz
         iEmsTVfV9VIvnIi5TC7U/H9CewfYM7ilYcEm9jopWYUaRsYQPsB4AqK3b6Zj70kbqV/s
         85vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775039379; x=1775644179;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R6tUO4DuL1FdYQWwrhJaLcFQpQwrGG+29UsWyf8+zZ4=;
        b=qR569rVAp3nasQ3ysnq9ntsnB8BSUH/4o1ckTuU1E9pcK4Bqt0aMaWeowKzK/UBXuF
         ZheByvI8iLhaowmMV5dkKckaYy+UATmkuTqtTMKpj5gE5giPaTUWUcQixjY4UjxWCLv+
         70MK7VUBu0nr6qlLxIpgWufb2T6+luBbEm2JiKvGRY37OAjjiFHi2c7HRiK2hKhqIOIl
         res4Vlo5Yv6YqaW1RnlWvq6jgW3UqQhuqAOrPMdfYLDRVWMc7WEppQ4iaGAN1GhZ8Kcb
         +sgxMpuUZmWRyNk78FVDsWPeJW6gWShnENuiXuijC3dLDctuCycb3n8FiuvAYm72qTx4
         ngyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsMi1zybazmOMGspQzqsrm3w+Sg2oJ/FY3JpTtPNmBcaQi136IMxLXz/mQMkO5yxgAlp9Bqd+MAOdrMi3a@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9COuc8QvBBRGLcOTmG9wN/NTVaQKw1wulF1b0F8r2EwjqwcCY
	xoD40Zw4plGI98ryRh76ZMOP2iO1uSAT+KBm7W6P2G4AJuJnjdrn9k2m53Ye13EevbM2LlXIYfT
	sCKHFabPDPEtZlVrgpHvv2bEnUHYIX8yzi+Tp4UrDCqgpYhA5YM6EKDlbgNS76eTmSRsW
X-Gm-Gg: ATEYQzx9tCLbQ6lmhKQCBT2KTx4imWEmUP8RdFFSMJxwdyOSKr2rDAzf0AYFP4HE1an
	1UGwrBb7fZmEByViXFPxD6WN+wtkFGnrKO5Z3rhAqZX9UZIeMNHyHqHoDgke0jspJ40fTud+f02
	8dgH4xMuAqPPSGLmQD3pIhh0jE+fzSPzyeXQIujgvHLJu+oQL9coo+frSowCmQNTDbhyZwVbLiq
	2LLuV77caotN1CJAI0pe7AeldUNBEeIu5ympgLNrkQa3XmPEWuv6TkT3+1/dlZxryiq83Ci/ufW
	QafeLVOzul/mPJU579D4XdXHzsBaBWo0b7xhfnkql+grw1t5XKnyt3nk7hAQUrqiCN+BLaqo1FX
	PJFOOp3+PfCsLQNXSA6CS48uGXUxGdyXHr0MRoyHSNkQcE23h8QEVh7G0PFJkJ0O5vhRkms3aUl
	hwy4c=
X-Received: by 2002:ad4:5f0e:0:b0:89c:ec59:87d1 with SMTP id 6a1803df08f44-8a437212308mr35873186d6.1.1775039378915;
        Wed, 01 Apr 2026 03:29:38 -0700 (PDT)
X-Received: by 2002:ad4:5f0e:0:b0:89c:ec59:87d1 with SMTP id 6a1803df08f44-8a437212308mr35872786d6.1.1775039378350;
        Wed, 01 Apr 2026 03:29:38 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1a5fb3sm514146666b.31.2026.04.01.03.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 03:29:37 -0700 (PDT)
Message-ID: <184e73fd-f849-460e-8c9b-e112dba138c2@oss.qualcomm.com>
Date: Wed, 1 Apr 2026 12:29:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: qcom: milos: Add Adreno 810 GPU and GMU
 nodes
To: Alexander Koskovich <akoskovich@pm.me>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>
Cc: Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260331-adreno-810-v1-0-725801dbb12b@pm.me>
 <20260331-adreno-810-v1-6-725801dbb12b@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260331-adreno-810-v1-6-725801dbb12b@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: jG-LzY6xBTU-JBKnNeKGwfyYpGSd7m2y
X-Authority-Analysis: v=2.4 cv=XfqEDY55 c=1 sm=1 tr=0 ts=69ccf393 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mgqdMpuNiQTOyL4mY6MA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAxMDA5NSBTYWx0ZWRfX0O7zqYyBCDB5
 qRavKGoUQjkrNyC32RW45KCL8tRZ/aUajIQ3scbSFolknwxmJyd4jpZYWjbyCk05JaAbswdml3e
 g99c4UfoiyO+BnDRKpVHS8bB+FmfS6/ZZheV8AsXIVCa/3tLdmzTldgdBeNR1MA9sVxmuGYJ4qL
 X8n5Jyi+unVI33gTB7FVzsNkQjrmOw96yKSs+Ka6OH3Emjd8pRlyX/jDJalIreKaKNSrZvM92pn
 jt+GgxGBjT0zHACrN0qYcoMFLhLLLR8o7/2/kCFkIMpmneLZv6JW1E5z2KqXCQKVhwZLi5KpUi1
 lJimPWPH8ytfxeW9vnZF50fXxcPHbLvdyxTWHmauQUwzT+w9sX1P9TToCTyTZaMeg28CePgj4/r
 lR6rg02TC6q1SggkzC1FqW19907lQpeyf4PmZkyy2zW7596OkmTFl/20XpxCAS35GUbwA3pLx9x
 iFn3FJNlYQUCRTdI8HQ==
X-Proofpoint-GUID: jG-LzY6xBTU-JBKnNeKGwfyYpGSd7m2y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-01_03,2026-04-01_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604010095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101305-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[pm.me,oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,linux.intel.com,suse.de,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB86C37895C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/1/26 4:17 AM, Alexander Koskovich wrote:
> Add GPU and GMU devicetree nodes for the Adreno 810 GPU found on
> Qualcomm SM7635 (Milos) based devices.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

