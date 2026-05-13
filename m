Return-Path: <linux-arm-msm+bounces-107251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iMxBMmRVBGqMHAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107251-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:41:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DB7A53177F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 12:41:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4B9D83081B2E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 10:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B09F3E717C;
	Wed, 13 May 2026 10:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EorIYmby";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C3SmFzaf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA1B43E5A30
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778668726; cv=none; b=eKi62Rg8b8HNWnRio8ea5MZkUxJX1Zo+dB2mSVAp7e4Mm125XSVAKlCuM8mbBNfpdooZqOyKY/QnWlrolFDAT+4vqghT28r5IrF0sM5Qr0UvsMzYZ1QY4HBNf5NLk2ZlJhNVdWczXfQMcFSsxSq8IKF5a7+gARqH32Tgw4cLuZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778668726; c=relaxed/simple;
	bh=fnZmhMvu/6lbfZxdbq+X04YxsA6wUHy+oE3sB4B55u8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJ+na/s8RTJrbF6uiwNljrPW80Kn6KcUXXT8caJzkpz6xcBxJJQAhjnpFz+YXF3TLkn004mjAdqLDqoocV/Jfv77C5xbn6KE4v3RLsfkulkz+uOFaFLcw8vxBV6X0RaCgCePCSSj8bMKkO5R2PRirQ601RszLkpKmToWwxPPFIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EorIYmby; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C3SmFzaf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64D8woEM4159625
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=QH77pafFRLjCaxTc+uNYotEX
	kTRAy9vOCLaU/RNCbCU=; b=EorIYmbyP5fFBLY0fCFeDo8vZlzLWPdwICeE+YP1
	DY6zx0+jgBbG7kOeRBqviT4M1vYSPv7A4bKDEi3y6tcsUryZZLrxLItSSW83wOh/
	bijpUyFuHk0i6NyluShWyInwKBRELUDiBCtnKl/7UuYxqNiHJBjckcw6UwprQQlp
	x0vBnNBgL0y9IB89wiT+6Ig4h/h0dvpaTUZZjiNIk3yFbsoYTpt20tp5AGRWBbOY
	O6n0mC9a4Ox49RcHSIGv3N+AS0Pfn4nezPUbbmDgWh3Zq+DJHsovQmTViIwjZfas
	EvMcVKwNZ8A+hJkW6zTJb3t7mM2z/Et508TzeglE9cW2Uw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91rc77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 10:38:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50fb3c7b989so102287851cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 03:38:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778668723; x=1779273523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QH77pafFRLjCaxTc+uNYotEXkTRAy9vOCLaU/RNCbCU=;
        b=C3SmFzafWf7pPhKH4PBmoEzGqY2K0q/0iQI1PyZhGOHs5nxSrGml9N0nJt0kpulwEx
         qKfF8avAe3YxAHwDu/gS32Nhbdsf/xsjzOHMnCyYRMOGlyRchKm87bTh63zbUSvudg5x
         ESGlx6Ua8uhCHC1lMYNPMza3YUHSuRjzVAMmCq1rRhBg+Y/8EzEMPL8o32qaFn5aZ2fM
         50bhxF2CXsWRVO0Ky/ZLTW4Br5EZdLqc6XHloZPCWLqjEsppcSYCyEsUD6xSKj+vXr8z
         0ktJdkg0FRaX+ZkB+M2yQSU7Vm9+B5ccuqjnCwyhb40dplP38/6Smy/LZyYQnfFCwSXU
         mzIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778668723; x=1779273523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QH77pafFRLjCaxTc+uNYotEXkTRAy9vOCLaU/RNCbCU=;
        b=bjzVx09eRtWxgz8meYgwzr5+D+JWmu6kFJlvb5c8zGL3YZfdaH1VyvG4y4Lp0GiyNE
         Qc2CNgWi+9FbqYhrzwgIzfrcaeetz5ioxXKgvL64ylEC+7dqKmm9FQ2xqmBbHlxiAMB/
         DlwlwKDZkRLZJ11O7ao8wDHLZsr1xyQp4Ou0tvjm9x/iiuqDZtLW6Lm+bXGzmUtexeOo
         RR2ek3+XiI6W2VK6nmF093OULhLWna6zJX1A6EDRpSw5UIAZ44IMJ1wgrUj9euum1AeP
         BO0qUnBhIP0/H8vTQbAlPj1dspt4Jisq2aw56b4x8uuAaaj6vmYpROYNP+j1usTqMtyF
         8gbA==
X-Forwarded-Encrypted: i=1; AFNElJ/vU1gCw7wKd+A3h6WZqAV6MgIiI6HnFAEkLw98LznTd+etRENi+MRNBT9P1UxaLt9tiaCY6ZaUHhT7R/4u@vger.kernel.org
X-Gm-Message-State: AOJu0YwlSVfytt2+GAUBMkUNPd2tBXlOk2dqELHxncTz3f1Y/NYCjYwj
	8cuYRHjdgagssoUJ3Ledyi0ZKyyhYxGJE+0gQNhfK2n9n7XkQ6ZIRQwZdsCRomcheWcPwRivp6i
	KSIR8HNvi/lOUgNUpU0gDUWb+pnX9fT7ZA29pij13yqtWhjPC9z0LSDOAan3G7jFakqTJ
X-Gm-Gg: Acq92OH3EjI8V2SUmKrQeSoF6eTcqrzQ5THDelI54df+Uur9OaVF92LM0mCefpctBly
	LbV+Jhh9YnwWe20nD5TN1d+XuSGxT1r9AuyRkU/8xHj2zqbc0GqUF+Sqy7Pm9EvV3c/iQdzU7zO
	ug17ksAgPQKMpdEPqyNNBK3Yru+JA7ozFF1IhD+q8fXrRTG3iL1k1HMx/5FymSZ4n262M0uv9JP
	TeYk8km9QBAHUaXxwQOsUEYhaxi3xc3Pp8jY1PGMvLQMxO/mrBDTX1LLSsnmCkDzulyV2W1e0Kx
	4+5YEdLMsMiBWq214RlC7V2BQFthov924bR7q2g+tjFKaFo6T2wJNRHRi4XYG5AfXJ4EtWafpO5
	+RU6Ke5AdGhiF0ouGUbhBebHrueWVcxUMk22/9LZGmX4ffVLAq1OsE2hYFZulqbuTVe/DY9dd8u
	0gbJYQzufsav4yIuluLD+WXDrLUXgAPqu5j4M=
X-Received: by 2002:ac8:7dc3:0:b0:50f:b4c0:62ff with SMTP id d75a77b69052e-5162f62ea3emr31917601cf.54.1778668722890;
        Wed, 13 May 2026 03:38:42 -0700 (PDT)
X-Received: by 2002:ac8:7dc3:0:b0:50f:b4c0:62ff with SMTP id d75a77b69052e-5162f62ea3emr31917261cf.54.1778668722422;
        Wed, 13 May 2026 03:38:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a951d32dsm3922618e87.30.2026.05.13.03.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 03:38:41 -0700 (PDT)
Date: Wed, 13 May 2026 13:38:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/6] media: qcom: iris: gen2: add support for 10bit
 decoding
Message-ID: <v4grfii43tvkoimmp3hlvboa3pwf5plpegu6ph5pm7jiqhc3sw@byh4bn7hyqg5>
References: <20260511-topic-sm8x50-iris-10bit-decoding-v3-0-7fc049b93042@linaro.org>
 <20260511-topic-sm8x50-iris-10bit-decoding-v3-3-7fc049b93042@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260511-topic-sm8x50-iris-10bit-decoding-v3-3-7fc049b93042@linaro.org>
X-Proofpoint-ORIG-GUID: JqZ4cVUMtvKgxjoZfUPYMWaCt50J0E8O
X-Proofpoint-GUID: JqZ4cVUMtvKgxjoZfUPYMWaCt50J0E8O
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a0454b3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=9Iyk66drAfcKlhgoEl4A:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExMSBTYWx0ZWRfXzpUQcmtIU6Lq
 IiP+uM85+JThWaVoTMoWEsi63zS+a4qCyI2jiXAR5ai8DpxUpS5MoH/4blGy69EQAo5mBMrZ/kH
 BiEDM3CMIgHfPF6sNbHNNIUnw4gDGjuMY5h6faLWUH/db7NiastzUjJ8DsXchPADM++RLYr/gRg
 od06kpGzroyHg+phSJAikFTqL30gJWmAdga4g1GxAqHuRB2+VLgAg59ELH1Hvekxsx1AeOp63TZ
 bz7/oF4zPTFe9U+qttCUv6i1BOjN/2AA0h4wZ8NIqMGYQv0TecskcomfFm+nwqGpPmZjUuLCh82
 9F5wWtC+Z4qtJwOPuHhRKQ+w9UL59UfXxnzqBIMR9kfevGI3kUX8A9jfN59HaBCmcXMT9Me22X/
 d2bTyhDg1uBMo8lh60SSPll5eAlIaMr0sDHV9xBAdFZ/0aACDX+tRjB5Ws9XN1V+xVfCH51+QNF
 OwZlIdhFL0VEjLZXVxA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605130111
X-Rspamd-Queue-Id: 2DB7A53177F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107251-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, May 11, 2026 at 11:20:28AM +0200, Neil Armstrong wrote:
> Add the necessary plumbing into the HFi Gen2 to signal the decoder
> the right 10bit pixel format and stride when in compressed mode.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../platform/qcom/iris/iris_hfi_gen2_command.c     | 75 +++++++++++++++++++++-
>  .../platform/qcom/iris/iris_hfi_gen2_defines.h     |  1 +
>  drivers/media/platform/qcom/iris/iris_utils.c      |  4 +-
>  3 files changed, 76 insertions(+), 4 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

