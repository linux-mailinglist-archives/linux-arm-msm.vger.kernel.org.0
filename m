Return-Path: <linux-arm-msm+bounces-105557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKjuFGUY9Wm+IQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105557-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 23:17:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C984AFC22
	for <lists+linux-arm-msm@lfdr.de>; Fri, 01 May 2026 23:17:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C168D3003621
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 21:17:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD67A35DA49;
	Fri,  1 May 2026 21:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ekLosy8E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZveWJU61"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F68352C39
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 May 2026 21:17:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777670242; cv=none; b=gPX7Fmtnnhdxg8cR9ZmKYvID/q0WiLnS92TaDkWr8xajQyYZQcCHVM6FcKHQ10ZMAezcoTHy0sHPl0Xc3xRMsb03Pkqrb3ZRjtvgUMRUNXdDxYXlBltET9q/FAajcItsywMVIBbmsQZxNP+HAthAzIFkrFRxItucwuh8m8qZGRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777670242; c=relaxed/simple;
	bh=dDbelPM2V89cIoQsQrcM86mlrQIMJyzOrGFRRfgRs98=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aw/MwUIf00KlA5mOHV9KLzAQ8SALw+rExQlufVzlu/Vw0mSs3zIpoX1cPmdVpcYjdvIJjUPYhM6i7OkMdzye1Q8VO26Nd2YzvAGmBGysZyN/Hz5wevwUtkgtJTo3o22r8XnanU/crZI5hmR+QijU/C+Ups7v+A5FOwjhqRDLZ4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ekLosy8E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZveWJU61; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 641IG6WB101320
	for <linux-arm-msm@vger.kernel.org>; Fri, 1 May 2026 21:17:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0hISFTIH9qemc8WfsjCvYlvWtmbajff+MCxuRvrDDwQ=; b=ekLosy8EQdjCqU/6
	QUD1khqPnU2ZaUG0//YemMqM7854zqbZfpSEvac8mdgSVJldkvo4Cp8pvS3Sk0S9
	ZNgtSJHXYvPHArbevxPqwmzh9eb/GtdWT5aoaUasEVILmVgKPY/LSqlkXXKBG/Zn
	xhw5DGyylQKiHQCgXu734ZHJiVfDh+GlkGYnZ2TxrD3qQZobTUtuPb1kF/ETymAy
	pRA5YxVSuyeV0a3mLrYgcPRc/DZ3QdM4SXZKIXBTd9Yc82vJizpQTGXfNCKnxk9W
	BbauTyuxQaCq4desOUxG7IFcMvTg/YsFpT+pSKdcBJuJIyrWY8rq0xEpMuVJVCrU
	mvdy0A==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw1a8reyn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 21:17:20 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-12dfe12d285so1017597c88.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 May 2026 14:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777670239; x=1778275039; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0hISFTIH9qemc8WfsjCvYlvWtmbajff+MCxuRvrDDwQ=;
        b=ZveWJU61DBasoHm92ptpm54wytVtbWJGeOiQ7+osTQFwzRGBX3Z1qIJ948rwT6SZ+4
         iyEyRcHoN4JD/X7VMa82PS5T/H8jyNNYdfy05BSEtJVYx8IzhFYcjZWdBsrIIdrI9Kz9
         OCDsed5VIx0EhhV5tevOU0L9+da9cRD/TxaPLNJfDCTWIZbn3+7sq4gHC6GwB5Lgbna5
         GDAQmQq6bHLQioc14oRQVQFm44kWr1UbEBBPlP4hlvoC+fW92TIPtUIkZR1ZYZVDsuGQ
         vQ2xf8PEzKq7wtM+2eRfQBnSLhnfc+tPHR0BhpYU7aPFaAIwBd3yJMBiZ1HaqBcjFHn8
         BSkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777670239; x=1778275039;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0hISFTIH9qemc8WfsjCvYlvWtmbajff+MCxuRvrDDwQ=;
        b=c2B2xYNvbRGTuxOMEQiWcDWYmGQRqS6y2nOq5u/idnAl9EOeMWCSlBEuLDEroFRDUI
         5IDujUcqKw4NhGMZFYF1J4+qfTobmgs/JN3dAO64K+X+mYWSOlDT8tl9tk/DpyqRuGj0
         2ui8/OHy58ZEKyhoaN8oYSMe9Q0axyR5wUnW8efGsnCNIYNIKEGDb3B4/5ejN7G2Wfu5
         GCDFeo7JqyepF8HS6Y9RthPn3+P61x/6oJ3YMksUL6zTr83x7yT2Vm/RQtntwafRvfbv
         0iWB9K4eigU/hXoCTKgYQZ7RLmO0FeJDC4EqAisPI9dYP88+zBbwOyFsg7ohuEPChUvL
         3lXA==
X-Forwarded-Encrypted: i=1; AFNElJ/QKKoaITEJp9HtRbA+Qvqm5JaJ5eyVXdtYekotXid1g4mlMj0K4szwXavRc3jKT5kHB/Lg8T4ojwQaqQCC@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/6rB5p6YUT7MeM/XUJWYs4d72TENatUbNZOrEj8CUCJoptmpB
	yIjLMaofp2eI5UFUBHh/bGg+7VutACnIxYxrnctdyYWPheHgEga79hpr9jwttRPOWiHgjb3Ew5J
	faDgPxBxjM3HfSzMy91CqC7wYxWyROJ5XU+zkBWtSvGtgoxyTzO9JKeCyI0Vd0DqD2k36wPYdK5
	pf
X-Gm-Gg: AeBDies+Je7BSrlEHEXJ3AT/ag5pd3gz5QiXglS3C4CjeAPUicXK7pv+WH4XiPoP/27
	u5GHQPEG35w8k7SfEYPj2+ZBU9s7Wncz6iD+W95VuHLnxUI4g5dTuglZt2Jemmidlki1zWqgYlU
	2gs/bv8hNNSYaWn+UijFXwtpOwWSkDze15kfHk/CMpDKMZPVwMz++vRe6DJu8th1cjDdmrLsC07
	sL4/kRdgXr+JKEldAWPUjEShXTgs6RPaDL6yCjMQ7TNHn/wfqJ4Gact7hDeTQMZQDWo1iwjFQ7E
	ePrRNB7PyN8yzILJXLUawhk7V2IQnhJQ+n5IgZp732jBChC3PBRU7bqhmKeW88aWVbEPi/85XpK
	a/iRC9XZ+162wXaBL7W6i56fXQm3mKRe+N7QMKS8ye0IRNXTZBK3bWVhoSz8x8AMQKZO/Yy+OiS
	/l6KE/hp3dww==
X-Received: by 2002:a05:7022:395:b0:12c:8f92:c6ba with SMTP id a92af1059eb24-12dfd83ecbfmr389826c88.34.1777670239226;
        Fri, 01 May 2026 14:17:19 -0700 (PDT)
X-Received: by 2002:a05:7022:395:b0:12c:8f92:c6ba with SMTP id a92af1059eb24-12dfd83ecbfmr389804c88.34.1777670238597;
        Fri, 01 May 2026 14:17:18 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df82a141asm5540058c88.8.2026.05.01.14.17.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2026 14:17:18 -0700 (PDT)
Message-ID: <c093a2b7-1a2f-44ef-adc3-0612375e3433@oss.qualcomm.com>
Date: Fri, 1 May 2026 15:17:16 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: fix incorrect counter check in RAS message
 decode
To: Alok Tiwari <alok.a.tiwari@oracle.com>, maciej.falkowski@linux.intel.com,
        jacek.lawrynowicz@linux.intel.com, quic_thanson@quicinc.com,
        carl.vanderlip@oss.qualcomm.com, ogabbay@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc: alok.a.tiwarilinux@gmail.com
References: <20260410112015.592546-1-alok.a.tiwari@oracle.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20260410112015.592546-1-alok.a.tiwari@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=B9WJFutM c=1 sm=1 tr=0 ts=69f51860 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=yPCof4ZbAAAA:8 a=kkqwuB-7APtATm1xqVgA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTAxMDIxMCBTYWx0ZWRfXyk+XR4l/LKde
 hP0iuxLHeOtviwEDh0BQs+ihblcI8XFeubx0jPmXIqYeg2F64f+vUwf2Ybj209j57uylq+979ej
 c5QbN0JKF3WC6YA7sgUJe+oYvNieUhVzAoKr9azFMXj8hKIOcOE24nmHiYNRQzEYjVrjc4dNg9R
 vhgA1mcOF3ieIn7GVs15UR9RqRU1E8AesasU+y/4wkXsr0oMtiHImy4+oHLFocIE24/KnGmP6Jp
 2kvmRGKArjDH9r8TwMeyHQF5X3J79IIbZ0HPhGK4rdn3WjBdrGgLo1IYEbgqDjUESBPDQGLYQnp
 VXauIk2V9wBsFHgUhb0fAjSr2MRBZQnmVXglzgsYEs1ympPEihCeUIvj3OsI1o4Vh7ckQmbqoK8
 DPxrZBiMgrHrWP/LdhyldCl0kFQLU1X6UMQ1+ich34d1SiBdn0oM6ar5zmXm1Dhc7jjNJKbYf21
 fDkjOWcWzfd4pSdFkUg==
X-Proofpoint-GUID: _OPHnt6XSrkFCQPMyWUxOFFoQbFE3EiF
X-Proofpoint-ORIG-GUID: _OPHnt6XSrkFCQPMyWUxOFFoQbFE3EiF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-01_06,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605010210
X-Rspamd-Queue-Id: E5C984AFC22
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-105557-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jeff.hugo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On 4/10/2026 5:20 AM, Alok Tiwari wrote:
> The UE and UE_NF cases check ce_count against UINT_MAX before incrementing
> their respective counters. This is logically incorrect and prevents
> ue_count and ue_nf_count from incrementing when ce_count reaches UINT_MAX.
> 
> Fixes: c11a50b170e7 ("accel/qaic: Add Reliability, Accessibility, Serviceability (RAS)")
> Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>

Applied to drm-misc-fixes.

-Jeff

