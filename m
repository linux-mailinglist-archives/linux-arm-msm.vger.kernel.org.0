Return-Path: <linux-arm-msm+bounces-77233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D76C2BDA685
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 17:33:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5DB1B34E682
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 15:33:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D29820296A;
	Tue, 14 Oct 2025 15:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Uw+IZm5T"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B71749C
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:31:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455905; cv=none; b=hFtkzAN3hxltZ+PNwwIEFCmLi3YznzYgDCu1Dfabzu7tp0eEJ8/iKFJWn0pgpkUH1O4y58XrErIM7NVEs2AdQItCiYRA3dkBxR0R/IOL9nn5vRirEWellyX/m5O2IOlj091dPt/IOIQVxRiAsMKjWHnLw57hwKrV/CtC/ei2cWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455905; c=relaxed/simple;
	bh=KNkp7rtIJG5DkETo38ZhFId4mFKIVad0dnaFIWEka8w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AhP9Wevruj1N6LesKIkKoxMfJ4c87cUDUpr3JOCewZiC0NhB4DfEdpjIug+gvK//WKYfonqFiteFDsAil4RCULeWEzOr6wIRcYagvI5I8IQLlrbpoHonVpaUehS304eE8PVcwdTPmGtJ0Gh3qJIQZKd6foGLBm0jezZQLTAx6hI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Uw+IZm5T; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EFS4ke006274
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qYCwuW0vXBxbrPSEhIdNBbrGQgPRUXUIkwUiumHmDSc=; b=Uw+IZm5TUtXaHxbN
	e6+iah/6Gbie2qrjYetHaNom3EYrNd3vGAXNmMN02FxwQgCUqghDSx9uXBOeeQsl
	hp1BGrxh8TwwcGRD5GJ07QrwzLgqdU3bc8Cozl484vKzf+clIbMJSZoZvv4G6Y2w
	OeItvnaD8r16cwNVF7SETpV0lPyrWrAUy9abBpD/xOT2XD5MIqvULKaKO0WBAopL
	7n/uxSFpo5W++Y7nJ6qd3VRmD2WnCspPBRdhnkbnLRJmhQo1Dda8n24qDtkvAkQO
	QmMv99demaYqTtCGv6UQRnoaZHiXaGqw41Q6xRyQ+lxovZTH1CF4p+VMaHEit4a4
	ACZ5og==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfbj11um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 15:31:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-33428befc49so12236261a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Oct 2025 08:31:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455901; x=1761060701;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qYCwuW0vXBxbrPSEhIdNBbrGQgPRUXUIkwUiumHmDSc=;
        b=JH5miAbl4mRyr5DKB7BQ/KXjVykGRcnNwpYJx/9ghkyGKwFQX5iXYJPrtsRjzlRnzG
         6fSbzjRa6rEevj/3nR6Ob40wXqALsjZwJhKNtgg02X/a22/r5KuZ7RdjWnRKGHTSUW4N
         oLMk2afkGWqDhnPx3EcvogwB1UtXOMbNf3q0QZhptOOBx209uhehL/oYFIhH6LgqeQoD
         q6AfDup9I8mn5y4M4wzn1AfMP6/Se+A731SVlr5y75mWKhcf7XCQCTXovs4uGc297Vwz
         6vlJNLWH3IvAxCP92yfpFh/nlvUU9PkvOOyhy347RQNZNedpB7KPx73SUCQSaAEZeGcm
         NC8g==
X-Forwarded-Encrypted: i=1; AJvYcCX1/GjaD572I7YhfEcbtldoaR3MoSMHxbi9XPbZVxofiwHcpDV9E0h4LXzKdvDr4Z5o673H0bHkfdtyNoCq@vger.kernel.org
X-Gm-Message-State: AOJu0YzT14W2GJhF1bkqa+rhxiUeAna/JpfN9uzUS38L9CcxpqmRL7ki
	xs/i0DQsJGISZXAkchQbcIVBzC0Menpk7CssktBRwgqjz2TIKCzOzIY0koj9COXqIs+1+APqrAk
	nG/SqOEZ2sH1EUKK/UtS7sFJ8HYhCsb4Dv/7+XDqwfzvbhOxNPDo9mxYGEM80fj7asRNm
X-Gm-Gg: ASbGncscOfVU4cq3lPeUGvgx0WrPMfrCvvq6H/as1ptcqelBcFddCwYVwVc0lPDIQnw
	fHNJprEfa+Q4R7FTRBDBtRL+fuCY0ioqx7wbJKcYrZPUsNC++8EEgeGPoWwqRvs95sOvaNbvBS/
	H4pC0EizR//AQvVTi7v+HgwZcxAsg5Ta2INfS/KS7JdV1Ua3IzeAnHuic37QKrhDZyoAey21pZM
	EiblTIAV7jYAcqFMvWLwb0Y8JKDj3t+IqnRvAwidIA3WZ6wXQdT/bYHtJJcQG9uiqZ/Ba/oebqr
	N90vNy5eZ9uP65IISi4uHt37gjjKWp/f513IMq7IcpZDMoPmqcCojYrHyIfvIKk/UXhn3F8Rvf7
	wj2LJ/1BmFukSnw==
X-Received: by 2002:a17:90b:1b51:b0:32b:7d35:a7e6 with SMTP id 98e67ed59e1d1-33b5173708fmr36344719a91.18.1760455900732;
        Tue, 14 Oct 2025 08:31:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpLSoujw/GWBt/kXucsfodcNlV7U7As2HjtzADrWR+/8jdE2LSLXhLWWtKkFSdYqf03k7x8w==
X-Received: by 2002:a17:90b:1b51:b0:32b:7d35:a7e6 with SMTP id 98e67ed59e1d1-33b5173708fmr36344665a91.18.1760455900131;
        Tue, 14 Oct 2025 08:31:40 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b678df24ac2sm12372790a12.22.2025.10.14.08.31.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Oct 2025 08:31:39 -0700 (PDT)
Message-ID: <dc8c8467-0227-4b08-abb8-97001175ce5c@oss.qualcomm.com>
Date: Tue, 14 Oct 2025 09:31:38 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix incorrect error return path
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007170130.445878-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007170130.445878-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXyLU6uRwdlF8j
 4Qj1NjGuv5eoMBso/NyXxyMH5vH7CCbwoP+jeg6/hVjc+LlB9rFl4vD4N8Aubi6PDjnN2VvfV4r
 4MgeLULPYUn3tFgLFOTPToerfXRE3Mj9yC9Uj9Bj70pTKYSXA8kACmVLgthTU7AkNgK9fBAwaBl
 EG/OVxJw+bPiR+P1VSdOfkIEFxUfMhn1If99wzctvxrWKo36vzAkCxPmXgfzqulF7XfEfO6fS5Y
 n6AI2yLQPLZeHNktObegLr2reD7A9sE+txnlKSJY2dMR1fF/wMBqC0c9InVuGfnkvsYLhRxN3DC
 OTOcWCwLY9TdkjikJHFFQr71LdgVXti0cqxnhDiOOFaWB3iYpLUNS6g/yYhFNIZjmxR1uHdYdyI
 8jaFn7v3I3vgTUZIzY4BblNuzWWr0g==
X-Proofpoint-ORIG-GUID: __zvO_gcd32BTWhB_nKVxvLpdNY80pVd
X-Authority-Analysis: v=2.4 cv=bodBxUai c=1 sm=1 tr=0 ts=68ee6cde cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=owB73EMJWWjvXzXBjV0A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: __zvO_gcd32BTWhB_nKVxvLpdNY80pVd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-14_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110018

On 10/7/2025 11:01 AM, Youssef Samir wrote:
> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> 
> Found via code inspection that when encode_message() fails in the middle
> of processing, instead of returning the actual error code, it always
> returns -EINVAL. This is because the entire message length has not been
> processed, and the error code is set to -EINVAL.
> Instead, take the 'out' path on failure to return the actual error code.
> 
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next.

-Jeff

