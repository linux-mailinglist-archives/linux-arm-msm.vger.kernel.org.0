Return-Path: <linux-arm-msm+bounces-107510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KJ9bHuY2BWp9TQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107510-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 04:43:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E761653D219
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 04:43:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 733023027D9E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2026 02:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8D232EB5B8;
	Thu, 14 May 2026 02:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eTyoZNkI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SkWCmTy6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53AEF2BD58A
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 02:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778726626; cv=none; b=tUYM51rmxmYfC6RxUOz/BsW2zEILETmOZphqvQKfKXHgXrfmm3Bv6LuQkLKgU9kQsEN8Q8CiE6XZEoR1LtZKd8Sk0Vumd0zZLL1fP2SiBfweB1JkHe1in6Io+o1bX9eiewLKa6YQ9hRUPo2KEypoI3U+iX2jzX0kK31LHjclW1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778726626; c=relaxed/simple;
	bh=j4VkVGsKmv81DZdgXB2+725aBWLjte6B3kwkxQ0Aapg=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Sr/HGbEZ2gZZW4mSSqNn5BzkWWmcy9nok5SXsk3oXNp0JGsd5/Mfv7FxFsHS6to0PoZuL4LbZzLtO81ihD8b0ZzTqMKNkonjxQetI9/J6IOSdvxGfxEkGsc29MFQo1AORinBXNEMJFEVearCR3HYP77Os/YClVBzPHGbuxL6hVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eTyoZNkI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SkWCmTy6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64E1EW5C4159625
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 02:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DD9oeM+wN6tf0uECje+qAm54Sbo9Rh+ZmIe6cFAiyIw=; b=eTyoZNkIan6atNiS
	HK8aOfa+Wh7UjtMgx/eOYnVuzdGqf3efjQIwkdU57VZ6XEG6OpxjV5iiyHX1ibdm
	A+nDFBrB05DbvHjXiwwNHtYAJMBuE2jSyjAzzQ5OZLJWOK/04uqYdAkt2q/GaVJ/
	jU6IwbRrDzcTF8K9yi0fOUsnndLEM0U0zGH7uT2vpYLkoee8pegzAJwE7YZk+OMc
	GQylLJvf55dlGUDbOyYUnDlDoCC8tNysXBq4m2IcHNkKe0XwmsGHg51J889ohIXD
	5f6wtAhuE6ZI3MuUOTmXPjfVYqW1CtpedR5m90VRGu7S7esk2g3L/5Q7sRfgIHWF
	QUtoAw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4p91urmy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 May 2026 02:43:44 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3662eec51e0so4244251a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 19:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778726624; x=1779331424; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DD9oeM+wN6tf0uECje+qAm54Sbo9Rh+ZmIe6cFAiyIw=;
        b=SkWCmTy68fVTx3qeNbZMiXf/wa+dcGAM7+S19fT3lSmRDlrn2AFqEU92lrxmBCnoXp
         sLmW3axHRrFZoIZbn/55biuEUZedYviV7krX21D0BjPYsBZOLAeCphDaGbedzZKYciWF
         3R+91meFPoPaDryK/R5dXta6W1o9aGTHsEzsNvwhyFhS2hptQy5iuMyflSc3Gz2zoa1n
         V+hE8BTB4TI1Udwm+NaGnn9H10kU3js4Zgb9S5jrE1SQUgM+qxGLztBwVaBpeJXZNkfq
         ouBazIQSGanNLayEUP6VraQOQZKq/bkzyB74c6a/CZ2kQ2/ERisn+YrEbXqpRoN1MndP
         NApg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778726624; x=1779331424;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:cc:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DD9oeM+wN6tf0uECje+qAm54Sbo9Rh+ZmIe6cFAiyIw=;
        b=oauIbgghSz5eHQeNH/drNOMtKUCYkT7Vgq9E2Dqh7oXjVSR/A+tcXguhuhEr3XXZcM
         RklRvdvyJOqCHGrU71znukK3QCv/KhVnXm7NQB7/ac4OL2xKg7mqWeKRSsFSm1gnSbKx
         29XphW4+7EwkJmq4IDSlHFWy4m45Fcf5p3JjHEkBVNLmxGLYiN8rpWQbkgs1tvbzNERb
         Q6THJOLk5MXMTf8G51U3yEa9piXIN79a4sxv0+rFt2K9k4M+s4EbGcC+s4ey2VvwDP0f
         MJLr28OYmQZVhCETeYaWVMY3M5Vmii9J+NBQjtNzgGIQeJK3oLbV4eqrESYaFF+WpnSD
         ADAg==
X-Forwarded-Encrypted: i=1; AFNElJ+3+AfL44xaTnayZ3NWYsa+Da55vzlD6H5OFdhBxvebD90gpy9R7M3IqmFvdbLtVvE/G+2r2FOM2kT2ctsj@vger.kernel.org
X-Gm-Message-State: AOJu0YxgmJXMumxhD9S8BbVeU0u04jQLe5aZPVWPLOh6H0qJajVsEyMV
	EfqyyPr76+6r0n1LJEQlzgygKYc0dNK1dKw0Dz40q8HA6fsIj+M5FfA28TwunFqe0vbGi1iNnCb
	Nl13niO+GAekw3nANSacGfPqppi9I4k7wCDIAomPaZ2e49kyPjBq8g9gn6jNBtZAfI7D3
X-Gm-Gg: Acq92OFoNnkbg//g9u/sFBr7YxTaLXFd4Tf0G0XFWikmXqA7VfNbhaUbICDGf/emhzk
	f3DLx5AAOENPyeB85p28wl/uuXRVfEkaNsQxVgFdNacxV/VcTCMyHzKCpTOOwpU/b+JhanN1UV0
	daI1J2jOcG2fxbHodPTz3p5LhBuBRwsjp6pYdN3fkjWRN93akUq2SJ52LZxjfK0PB8LVOhI4ayH
	KvUU91m84U5VvApQVkhRdHqWbCb5e0rWYHFSCHAg+OJ6JkkZ7AWwlSxmXHwNSsbSTYBHLbiQIsB
	jDHONWHrOnRM0SaT3m2hOvN07CnyU23bVbyYClM87E2eXoAVzKsaQujSRHs4bODOt3+meiJ1FIm
	gJ2ymZs4BlkVu8+IJECxzUwzBGvPSLnWb++zDPruho9IWiMhFrxDZKKBeRKu97U1lDDTzSIq1xS
	/yR3e3gRk/WeOD2h70Uuxi0ZvG5vQ=
X-Received: by 2002:a17:90b:3a0e:b0:369:223a:cb60 with SMTP id 98e67ed59e1d1-369223ad529mr2081172a91.8.1778726623695;
        Wed, 13 May 2026 19:43:43 -0700 (PDT)
X-Received: by 2002:a17:90b:3a0e:b0:369:223a:cb60 with SMTP id 98e67ed59e1d1-369223ad529mr2081134a91.8.1778726623102;
        Wed, 13 May 2026 19:43:43 -0700 (PDT)
Received: from [10.249.28.138] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5d0fcb10sm6502625ad.60.2026.05.13.19.43.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 19:43:42 -0700 (PDT)
Message-ID: <d3a7fc7b-259e-4cd8-b72e-a352733e69cf@oss.qualcomm.com>
Date: Thu, 14 May 2026 10:43:37 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: wangao.wang@oss.qualcomm.com,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 2/6] media: qcom: iris: Add Long-Term Reference support
 for encoder
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
 <20260512-batch2_features-v7-2-4954e3b4df84@oss.qualcomm.com>
 <hhmz7gci2o2bbbnsul5aj6oxxtvvzxfuxcifqvg46unl3q5ckm@gxlysjc5y7q5>
Content-Language: en-US
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
In-Reply-To: <hhmz7gci2o2bbbnsul5aj6oxxtvvzxfuxcifqvg46unl3q5ckm@gxlysjc5y7q5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: y5HmYEYxg2HMVPkLgNlf3pYNCyNknnIU
X-Proofpoint-GUID: y5HmYEYxg2HMVPkLgNlf3pYNCyNknnIU
X-Authority-Analysis: v=2.4 cv=G9Ys1dk5 c=1 sm=1 tr=0 ts=6a0536e0 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=0T0VQSjcn_Gl0omFypMA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE0MDAyNSBTYWx0ZWRfX3Oo9Jc33YUT6
 0r/TpRXveVGpu6bcJuvHHoFV2mXVHOA3zpVUcToxrso8OebqLIjT6PVgGbvLnWEICsPKyZkgrPd
 Iq6s9EbT8m83D2o9bK77zLMSAb5/RonsflX05QjzCGk3Q55GCcILiybJNvtonL6krLuJOXA40Ke
 5vTK0w5U7SiB8GlM+x/vLdKuqA3/TjmgLfp7ZYOxDOupo3GicIBh7oXruI2xpprrPxtlOC5U6Wx
 DHprGkgZXOkllgQ6UUiYk9YJQzyMkQRefDb+sSEF3ZOucuZo7xco6n37lJbCVxHO/InUv1uq4+c
 VuyAmsV2ipqmYjQpZ4KqwksDmrRpdrkcQc33qKvYH/+VACZ9nMBHund5mPvadO86SY2rw1S1L/u
 j/3T+yZr6E4uIwlgMvAv9BawY/HsDgryGTWot2x4J9H8NrbsX9epcs+qyvi60W2Sh1JC30XnGpC
 4VyHLl2q6fmdZx6Vj0w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_04,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 spamscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605050000
 definitions=main-2605140025
X-Rspamd-Queue-Id: E761653D219
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107510-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[wangao.wang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 2026/5/13 18:56, Dmitry Baryshkov wrote:
>> +	if (!ltr_count || hfi_val == INVALID_DEFAULT_MARK_OR_USE_LTR)
>> +		return -EINVAL;
> 
> This means that setting the property will fail if userspace has not
> updated it. Please make sure that defaults don't cause errors.
> 
>> +

The error returned here does not affect the encoding from running, it 
just prevents the invalid value from being passed to the firmware.

-- 
Best Regards,
Wangao


