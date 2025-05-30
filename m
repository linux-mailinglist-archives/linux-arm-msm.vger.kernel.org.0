Return-Path: <linux-arm-msm+bounces-59911-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AF408AC926E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 17:19:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E4407A44EF8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 May 2025 15:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B332188A0E;
	Fri, 30 May 2025 15:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N1oLCBMt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5294F2DCBE6
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 15:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748618368; cv=none; b=PSFp8u2/P32WwX2JXGmtpQnnP79KRJlWGj09TCdsTKfp6vJPeoskRdk79s2/hFW3m/c+e/ZwG+nDcMbf8jR1T/k+sI8t4dO+NWrjMYwfJn05EF9A25EM44PCr6ZLEm9DOhCuhXUbplUK1TtW00zco2aKbP6m/3W+boF8mC1gTR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748618368; c=relaxed/simple;
	bh=Gqbpw1mtR/wk2FY9+6mpcrJfQIuZ/fVzc1hR907YXdE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ikW+oUxAgN6s3idasZ/kOeJSVzTfS0jek/J4hYf2NdBLj7qTMS1QLul23dn63slqrxHRk/xBiUPPbfjzUggt6iheB3wAUx0mE+ryq7xvcFp20bd4ID+1ZNQPuPR80e1f9riBhBiaDAFz1jm5yd8n2l2WFXboL4FczgEeG/eOOdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N1oLCBMt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBXuVK032767
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 15:19:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/q+YvqYtbRXmX9ePmBvjG6ebJPt80BkopHr/TbJPGwI=; b=N1oLCBMtcPxcYP2t
	kAKFZvZOWcG2YFmX910uA4wtk7ZNKO4QLsANZZJvdDrDLuLB99nuuz10dc49naR9
	i1T1Ajs46/uxGtn1AfXsxnywWxJTD0mFgpgdVYqNLWOsO3zVr4UE9XLra6un6EO9
	vK8JLNJ3jQ8e7RWFOKUneNIBPD3G+erh0motHSX2wmD5sg+lckfE6pNzCVToNkZr
	ySqFKUzuZThT+tY+3vTemB+f1ELohGuxNuxX1eFVk8Nlr1d2hCE0MxWFyO8YHP+I
	AxbXLcqIb+K0/CsLlV3rm92sLp8DSRv5dzjCvhUis2jl0ruwZfP4SEWAxt8u7N3G
	SiSWJw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vk1kx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 15:19:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-7377139d8b1so1865008b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 May 2025 08:19:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748618364; x=1749223164;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/q+YvqYtbRXmX9ePmBvjG6ebJPt80BkopHr/TbJPGwI=;
        b=ooJ7C7rWdczpCgQh8nNUgr15wFGDFThU8kn/RhgYJqDfJJaEocjHtX/itxvzpCaTOQ
         6ohPWbgHoYB8BZ5NZddXwZXV8TMcYon8Ag1z5n3g3k2wWrg1YvlGriWhopKtuusImeTR
         Qc8LWzeVuHQdUHgKrxau61ZrCbcK0tRxi8qm2/Ypd68uOGZakTz4Xgxo2geuc3ZySyOw
         HM8XtVTQBZQf3u+ii7aq5o2uqXdPusC72HqA1C4hLeNFeufDzmpaAGLuNfgUotfmVUTd
         /2yuzRGcBDXppQt3S2piUbE2G8jWVg5ung1Odx+h8TWMkdtE1gQeLD+8Vci/jsr56gHn
         iWPg==
X-Gm-Message-State: AOJu0YxJuSwsoFnI/zCB/odA6cjpLrTIynCnYWy9Yw4EQy5eBhom7EE+
	vNwQ25d7tKRYPrxt5xZHLGw+GipUonM4lw+eodkj454L7mm/x7eY9MWb2MVta9xv9s1lGm8OHXS
	v8lKK92wIjRNIfsaaEBlOnHdlx0yJFh6GSmWSXCz5a8w0bvig2Vq3Kj7gx2Epsq87CFIB
X-Gm-Gg: ASbGncvV5fGNACw+jYCzA581Vk5EoVLOhyLDWSQS9rnwWrYBHt9E9EpEyeGYpisdCKb
	gGQUBP0EgKgjPZNKnqQJBASpjDdFt7zfCTqdcJNl4pmCUl9TEiVeh5XLSy/tw0OvDJKzqqtf3fZ
	gMr1zsd+fMwHl/IXDBKxd9VsMw3rm037/czv3rMUz+VVZ34N00VE3EKrl2qoSvWAPRZKGTjw/dv
	coiGiO2e2Q2Mq5MLJNmVc52RBMPMe8YBvxjI6t9jcZudmOtcCJhicLpZL8OoPnisfb22sK73ZUN
	G4fb9u5wG7+/7ap7+nPu1c1gUfD+RvwZOBr7RlUQp4ybOcgweh8K2M0auH86fw==
X-Received: by 2002:a05:6a00:139f:b0:740:b3d9:c889 with SMTP id d2e1a72fcca58-747bda1a211mr4588216b3a.22.1748618364467;
        Fri, 30 May 2025 08:19:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEIsnc65zftF5H9opwbtI65RK9LSqmvQ1w8r/w2RETrAKhTxutQiW9vpS3JmGLmqXeNZ+QMOQ==
X-Received: by 2002:a05:6a00:139f:b0:740:b3d9:c889 with SMTP id d2e1a72fcca58-747bda1a211mr4588191b3a.22.1748618364068;
        Fri, 30 May 2025 08:19:24 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747affd41d7sm3167879b3a.123.2025.05.30.08.19.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 May 2025 08:19:23 -0700 (PDT)
Message-ID: <ff02633c-e57f-44c0-a3ef-4eb6e044578e@oss.qualcomm.com>
Date: Fri, 30 May 2025 09:19:22 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] accel/qaic: Add Reliability, Accessibility,
 Serviceability (RAS)
To: quic_carlv@quicinc.com, quic_thanson@quicinc.com, lizhi.hou@amd.com,
        jacek.lawrynowicz@linux.intel.com, quic_yabdulra@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250516160634.1408309-1-jeff.hugo@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250516160634.1408309-1-jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=6839cc7d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=53wffJMIMOjkZiTugjoA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: MW89SEJCzSSw74HQe9Bw6vQfbrSrIGkZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDEzNSBTYWx0ZWRfXxBnUZZu+MDOt
 ERh7HQBd40JlxUpW+LYkyWbek0E032/HjDx38z+5/xtGPt/wUcL6ldp6Gbqytm/2ZfyyTSqqNq5
 S30Iw6HUy54SP0aw64SJN67Gmvbqwdg7dO/jHsh1jQK9i7WDZqdSgJaKrGXSEzbtwGyTSwPwc93
 99GOzSXxKkkD14GKcRWK1rqfcBlf9hO0X7i/36dJY985iAOXFO69rBa6Pbxos0NP3jd8Sx66F0E
 IntMBs7lw2JACnZvfqFWAIE4otUicpVgRdA3BQ0N8s+I6gCWd4uOIVouYfxQ3ZzoX7WtdSavej7
 RSS9gB7qh3norEdbOSVWETjQRdQ3naNZVH+btFT0Aypy7B9tH4WtWclqLtRYB3ZhCdzkUMXs17K
 VPXKM3kVIVHqS/R1IKTpqc0IUd6bvd+b6pM9ny3/AfQm6w7B198F9aNE59vv/z4prDJSEfA8
X-Proofpoint-GUID: MW89SEJCzSSw74HQe9Bw6vQfbrSrIGkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_07,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505300135

On 5/16/2025 10:06 AM, Jeff Hugo wrote:
> AIC100 devices generates Reliability, Availability, Serviceability events
> via MHI QAIC_STATUS channel. Support such events and print a structured
> log with details of the events, and if the event describes an uncorrected
> error, reset the device to put it back into service. As these events may
> not all be reported via other mechanisms like AER, maintain counts of
> the number of errors observed for each type.
> 
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Pushed to drm-misc-next

-Jeff

