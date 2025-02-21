Return-Path: <linux-arm-msm+bounces-48973-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 21309A3FD9D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 18:39:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A7FF16772D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4E8C2505C9;
	Fri, 21 Feb 2025 17:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZUZwCVv0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C476E2505D2
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 17:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740159548; cv=none; b=fTwz4ieTFqxtbWZ25hIDD7H+bcDkTOv28/oTjYpB9+MABQK1fk0aNKYHyFcqCUhKS+4dFzIrteheMSIQ+KuMfbQkIadypT/RjjDcEbc9e1BKgYxd0ODAaxVLzo9LH7zrcTAFm5KSOEIuDd4tqjqC6zzYSrFk3kFoJ/BQf/kjpkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740159548; c=relaxed/simple;
	bh=KOhCcI2yI/By8AaFG8mW3Fzk7l3kPtsFZtd9VcCZeb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R92gjGQgB1P9GkpOw0AHiW9NdNSA4Krn/Lh2RkUqqTVuED1vXwR2Q45LSMe2E+A2r6u2pZhAOcvjMOdWaCC21q7tsR/OcOvIYY4v2rPS/o2PwNT3W/jx73YXylQEzyA76BJ/Qq2lUfsa/8b6lMppdJcdn5RxkFce7lZBNAqisI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZUZwCVv0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LD6YkY015703
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 17:39:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qJSZPZcYP2Ku91jA3cNCQdXAiJurh9tb2+YQBdWVSRI=; b=ZUZwCVv0j6gcP3Ol
	y4QrFrKnpNP6ezP6ra+jV0NLBs9dnDZYaKTeftAJMcDoJxRZfAQ/MLetUSQ+KRuG
	x08WpcWk3mrJOPSBpJZLdUpgLg1NMyCb+cS7im9iAVXVExLve/1PAE0YjCKJZ7OU
	G7iy8IBWzj9/oFJzm48LD6ycb9xJtRZBvPmhnnyrM7LBs3IjViB+G6aKXFv+iJng
	vE0l/xkpztjNl657OlOVVZJDzFBgGMrgbZILTag4swpnsMwJUxJ77z4Wr0O+jyZN
	rbu1HXlfgBY00wfjROmImC+x+fSMBalVU91CvS5fFs3MzwZgcDifEmGqzabmIQMk
	rG2VjA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44xku6t50m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 17:39:04 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fc2e648da3so4649385a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 09:39:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740159543; x=1740764343;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qJSZPZcYP2Ku91jA3cNCQdXAiJurh9tb2+YQBdWVSRI=;
        b=nuToJubLUmXs8qJwvU0uyiPTZyf4fuRnNsR85ybtn6ThcSD32OOBt/lUcGasZhX8Hm
         Bc7aWQCuNM2cIak0+926EDAta2hi4cmsbmExgzUrvC+etKLtbkgCXHsGM2qvExOIa6UM
         HyyFpODbDcCywi0R/Fx3XZACDNn4zFzgBEChnKveukWZVmoseeHRwxqRx894YfBHIkKx
         ORrzfxh5gXlL+nKsHqZ0jb3jeTftOGqr+lSIg7sKeL6D0lXFUi8jwfxOS0UQe23+1ibA
         /rCsnBL1WyCfwL9XCh74FUNpDGtjo2BL9fVJdqUKSAEakknVaEhSwnlmQg8YiZh66ovC
         quFw==
X-Forwarded-Encrypted: i=1; AJvYcCWjnNv4fy1N51jCrGEOzWulua2MHom+Tg9vHCXSn3JvE3MDdmSLu1H0CrcqAuaDPmY/gqB/YnsQ0xxF93d7@vger.kernel.org
X-Gm-Message-State: AOJu0YxfVVPgdpGip3AlKsN1BleG8FWJEyka1SftJw++HlsGi1MKhut0
	NFn61iBSoQXGjXlS+b2ZeSr9LSnRxqQUMEefhqIcID14vdksJwbwOcvbJJvjEY+3JtmRQgoWNQo
	Lyx0wggizmgSSOod4cJB5DzQeF1tXDOHv9Ob6jFUjej/0W1Xm2LNug/CPwiM0AjCI
X-Gm-Gg: ASbGnctIyzSLaNrTTM/VXGkA1ZjXmfbWdhoVEetJFZMr0Zr84chBfnuk5gnWaUBBInT
	/ygCybCr1tR7YS6SQakxWXnzIyhviD7iXtwym6WUlSvph3lMi/09AjayUkDid4/Jpy9hTBvof/6
	XMLkN4657WP+woM9UxqCzrqzIIjlbaPXl1GakOlSNWZkKQB1MAwo4FdrGKFQXHAJO1wbSFXH7iE
	ebA7g8Jpw+BYzRNkTfLSYai+mY1UkVEC4xj1pCDb3PmBjWKFTks3WGPUpNdhclRZ9aN7h6XC9zW
	dTuVX9XM67CoTdkWlWrNNA87R6iIDTK8uBxkCS8B+1VkmQvMoHOyUHzXqu4ddhsYow==
X-Received: by 2002:a05:6a00:4649:b0:730:9567:c3d4 with SMTP id d2e1a72fcca58-73426c8d910mr6952849b3a.3.1740159543073;
        Fri, 21 Feb 2025 09:39:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqXkz8zxBhllIdfokgGDpZd3ZGYeLK117KPq9Iou/QAcMb2F/WpEbiYZCEY3zGYwBgVKo84w==
X-Received: by 2002:a05:6a00:4649:b0:730:9567:c3d4 with SMTP id d2e1a72fcca58-73426c8d910mr6952649b3a.3.1740159541244;
        Fri, 21 Feb 2025 09:39:01 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73242546177sm15929995b3a.5.2025.02.21.09.38.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 09:39:00 -0800 (PST)
Message-ID: <3294d770-9653-478c-bbba-7b76d1970270@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 10:38:59 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] bus: mhi: host: Avoid possible uninitialized fw_load_type
To: quic_carlv@quicinc.com, manivannan.sadhasivam@linaro.org,
        quic_yabdulra@quicinc.com, quic_mattleun@quicinc.com,
        quic_thanson@quicinc.com, dan.carpenter@linaro.org
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, jacek.lawrynowicz@linux.intel.com,
        linux-arm-msm@vger.kernel.org, mhi@lists.linux.dev,
        dri-devel@lists.freedesktop.org
References: <20250214162109.3555300-1-quic_jhugo@quicinc.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250214162109.3555300-1-quic_jhugo@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dFBM3uHtEcWxfjlvSaelEoYb2bftTeMG
X-Proofpoint-GUID: dFBM3uHtEcWxfjlvSaelEoYb2bftTeMG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210123

On 2/14/2025 9:21 AM, Jeffrey Hugo wrote:
> If mhi_fw_load_handler() bails out early because the EE is not capable
> of loading firmware, we may reference fw_load_type in cleanup which is
> uninitialized at this point. The cleanup code checks fw_load_type as a
> proxy for knowing if fbc_image was allocated and needs to be freed, but
> we can directly test for that. This avoids the possible uninitialized
> access and appears to be clearer code.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/e3148ac4-7bb8-422d-ae0f-18a8eb15e269@stanley.mountain/
> Fixes: f88f1d0998ea ("bus: mhi: host: Add a policy to enable image transfer via BHIe in PBL")
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>
> Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>

Applied to drm-misc-next.

-Jeff

