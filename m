Return-Path: <linux-arm-msm+bounces-77057-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10431BD6B84
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Oct 2025 01:21:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 267261897001
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 23:21:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF650296BDB;
	Mon, 13 Oct 2025 23:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0c4OAVE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 531E7296BCC
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760397677; cv=none; b=Wu9JNaSN5cqTO3sG1jBaWDK2KHOW00EVFgQNdIGEhiy5UiPOJYnm/nGOhfNhK+kVc0vwvu6tOWEv/Gc4NXIrTUAg6HQliMecVxZoDfZvLDfo+SL0EdwAf0PSdfFxMIa8t1vCfTe0/ffLfMXCeRlL9M3crQB/yfStgKVmrwX+jlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760397677; c=relaxed/simple;
	bh=xv9+DI+vzZKeJZR9WbDKVE4a4xHfkiCpmAAdhAzEyeg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P3nBBUGmFahuf6iIVSiV2srg/YsxQIyc7dcy3F+9tJ4Z/pFqqJSJ8jH+Ks5traYtUEmvTE2bO8hhp13bOmyFl3M7uYHBQ7BA2qJbu1LVYu83/+99//R4o/nk3b84HbKZOCHRagM1LlRjFLfQQEXhXSo8jTysGR7tYpgns3ga6zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0c4OAVE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59DHDF42016495
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qmKLeUx0dbcpirSMp8qcmyut11hmnChmSeuR8bgJNwk=; b=G0c4OAVErL1ng/qd
	hywyUaSGpLnFmq/+OMZ1IqwxFvBwRAti7dXk9bJRGy1iiLT5hSfFnlRRiPq5Tlun
	gMIJjbrJYg1ZpPWyaKNJ++n9zH0CE/enJcCdbzhzuheKW4Xes1x3G5xCmpWd1tbD
	5T/ahxFRnmmtDHjNBfK70D3UCNakM3GX1RcHnpxpvsypiOJ/qMhoO0OgYH+NRxvK
	hsUKXz21jHCOj4SHzPNQHWd0SeySof3dQVJScmR/EX58ikTGWAjj+bfQ7h5M2oip
	Y4pmyInVj2fCA8KzBiDyNoe14dl3wZZsL5oygWQ36qW/GTq3uXjS+WQcF7aGB91B
	/mZnTg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rw1aatg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 23:21:15 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-27eed7bdff0so85656225ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Oct 2025 16:21:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760397674; x=1761002474;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qmKLeUx0dbcpirSMp8qcmyut11hmnChmSeuR8bgJNwk=;
        b=tmLLW0XoYvl6rQFK1d/Og/7KilQUPCAhHd6T8sh5uyT28oDBW4wfDn5nXDedSbaipr
         fjRwAG8XZ0HRrOSeCbfglcPbqSdbQ2jygTVPQEBzz6k1KGZYhnsmpZWlRqBgXWDFUyWv
         ZTLmYHZD2+07LNTbi2NNGqmeQNhpmy+pQCc2L1A/ar1mSdiafct8rWg2GX5hppuQhfga
         ojJYsoGJQVDnhleCcFq46ifNLfMhyjGTlHyWjlBdyKEAADqEKV+/Wg2D162vXxkDUREt
         vhTC0AdGqMhcvaujRX7h2XMhDrnISWhIpiZJ2SoXjJA+fgc3qo+/9JS7Sq0IjBKiygOE
         iWIA==
X-Forwarded-Encrypted: i=1; AJvYcCUvm6FVhibZRX8XyleaTSErNcrQ9k1J6FhvdMzC8VhvrDWva3rRiKO3DzSUgbKwYUifUn8xp/ufAQyvdTzV@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6fm0BcdeZFGV4DMamQmH4Zd2H0ypsZ+7f2eEX3+4+u5yd9d5Q
	GcxAVXybUyI024aevYeSOK6Vl0K+CBQonrmRbbXzQ/QA2wP91E7p8unoQqIkHmCJO8j6itbYaJQ
	Y0OpnWoV5oOdzvmSw7Ptg2QEb6O5lvcSvWDemwQ4zZYLowcPdSPD7vd+5vrRB+OVla06d
X-Gm-Gg: ASbGncvqYJwpCrd8rv86rU/btLvns7aSc8icjCg48fSXb3gewiNBhd6+ySls5pY1Hd/
	ijj3hmhUTFLrPYPRubBHXnY7Sw47EPN6JOGyc3rNnzY8HBTH3Duz+l3sJ+4GdKRlSBIb9N2K4zj
	pYwkFiDDOoFCUfEJqlNMo7w0pOIecDFdOgoRBYf2xZp4Rl+eO3g2O4y4syyWACGVAzpmbPhH4S8
	Fc5P7Na8gYW9ui2diM4Sts+1gpjAKsqxfVI9Y0f+Fo2u1zWuJ5EPeJVjijL0hgVnWpjfQzavFLR
	bhpVeXsPvH2gHn2c3wxXvxqmkS7h7MmOZYY2uXjXjTsvcobpT6yl5vB8spopxL547WE76DMDxmj
	lX5U3EpCDVH66f5DPW1mB2AgaFss=
X-Received: by 2002:a17:903:1aef:b0:27d:6cb6:f7c2 with SMTP id d9443c01a7336-29027f0cec2mr290328865ad.17.1760397674536;
        Mon, 13 Oct 2025 16:21:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmJBscMHpLri8cVRKGo5hQcJ3KsF8SxJdCPTxP2I7QdeYrnjerUSKrFyOzoGOk8Uuzwvd9cQ==
X-Received: by 2002:a17:903:1aef:b0:27d:6cb6:f7c2 with SMTP id d9443c01a7336-29027f0cec2mr290328565ad.17.1760397674105;
        Mon, 13 Oct 2025 16:21:14 -0700 (PDT)
Received: from [192.168.0.43] (ip68-107-70-201.sd.sd.cox.net. [68.107.70.201])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034de7871sm144545395ad.16.2025.10.13.16.21.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 16:21:13 -0700 (PDT)
Message-ID: <8314b8d2-6b5c-47a7-8d15-79ec40244d3c@oss.qualcomm.com>
Date: Mon, 13 Oct 2025 16:21:12 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix incorrect error return path
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007170130.445878-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251007170130.445878-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=K88v3iWI c=1 sm=1 tr=0 ts=68ed896b cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=5tLIbcgRqjftBxpLK6l6Jw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=owB73EMJWWjvXzXBjV0A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Xt2iWhSENtbClcgb8sW76zEhEOEFwnci
X-Proofpoint-ORIG-GUID: Xt2iWhSENtbClcgb8sW76zEhEOEFwnci
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAzNSBTYWx0ZWRfXyc02Yfh6UA3L
 oVpy3sjjemzHBe0JBJRSwFaaqRxGiTaMOneIq4G4YSzJ9FfiMTpsXJ3FyNFFJGMXd1kuGKPYs21
 +SrIQKBcvK0m/0FqSWoQw1dipLwRHNUjIv8MyQw4Mp+yuRP4JVeON1ZTXKuuuf+r0ruKzxURRN0
 DUA13C24NiwY+cNUaxQeuiK2H5iE7/KG8+F9Ze3b6KQvDWDKb5Gag3NNM1tuhDzT5rehghUSOad
 Ukgb8Q+CY8KPt/haMlA0J4UuKIentD4ItNOvuVLPe3oQs3/VZc0g6lBRCNJfoVrkdZ3tQwubcl3
 fO6dF9qI6pvn0KPTn9KB78rm7d3wqnfoRw63cob6vtQnID5tzDcWxV/Lc/ItlISXh/HtB8L+Dcg
 CJkwwSueq+4y9Pdnj1eaRtKnwbxgkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_08,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130035

On 10/7/2025 10:01 AM, Youssef Samir wrote:
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
> ---
Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>

