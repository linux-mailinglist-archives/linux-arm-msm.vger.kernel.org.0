Return-Path: <linux-arm-msm+bounces-77453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6D2BDFD78
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 19:27:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9B0C2486CB0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 17:27:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A3C32F7478;
	Wed, 15 Oct 2025 17:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bnjuUHpi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9647B2EBBA4
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 17:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760549233; cv=none; b=hScdAVn/J2fygrLG79WjkLuYwCXITIygirsRg+RdMHMjufdMQhRsKU9IuySOkdhH6kkO3L2VerJHgSOvYQLPvYX97SpLtUAOGQdd3yHUbJ06WES7ut3FL27F73hk/xzVskP22JZ14MYV8q31Xb6eUbCl+Jlwa1DCC7FjgSCPXi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760549233; c=relaxed/simple;
	bh=Gv/R3xTsUmzqFKuO7n1MBxQsLAEK4rc8HQnlzk3wma4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=etBi/3FaD7iXWIl5WUgCrZ4uXJZBunLpwVa+7DKfZvM+4GdwQ1veoTSPzYZGkMnUmnrxFZm7ovt1tvsW0/+DKyf7y1HXsS0NKhw6v1UulIXcuKCKt+vbjcjXOB5RXj/IgjEjkWJqaqxXlAqkgLbN/ynVhj415NpOuzQXfNUxBEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bnjuUHpi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAabGk016719
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 17:27:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KTf2fO5KRH7KVrGnVrFxPrc4+WMg+22pOx6tu+ulMNU=; b=bnjuUHpi0B+IpYSB
	4KpbUART/cgQfvAwCFGlhIaJ1dmqzg19pS1LFpelDnzWGsumUWILD6I8gUGgm+Sd
	9z1TbRRfdQfckiK9jhsM7ywTYoo9x9Xe/Nn2POjKPAGIR8SNOmAaq82C9ISZRFoJ
	8xBq1eRauNbjfjpBBJc7QGZmniCe6mVroXBDhEjTOVGwU+onVb3e8ugFONsSQOli
	uQsjWN59PebIAv20oQhB894dpsaS9ErJlKNarrd9H706u9Bmyic07d5GJYYvUXed
	qYCBK56wWWBX/N7lwrfIVoAWOam4Wkn/aYbfMO90uoO8okT1YhGfTaraKW5jkd2r
	+wm2bA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49rtrtaa3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 17:27:09 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b55443b4110so870047a12.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 10:27:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760549228; x=1761154028;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KTf2fO5KRH7KVrGnVrFxPrc4+WMg+22pOx6tu+ulMNU=;
        b=onYyqy3c/iVTL+WR2g/4cFumUk8mEOypOYMcE6ca9SLfZC6QiEX+jtKZ3vG+QQAKxR
         Z8Jsq/EUcrkUtj0k6LbHzUq4mAIjQ3xXBt7S+L2uF4A4Rp+zNSOjxbjDHR5kXsQSLCGz
         gKjtrXu2+VcmWsuJUwEkm2763HgZnw9ivdQ8cruX0g56Lzf+lAzdMDY7T8UDflEWok8r
         v48BNNuSeQH7zs+X7Lvr920dy0w1uVt4ux69H1YHWv5peVLh/uDclDtIZwKpG4Z8zv2b
         pyoZsLtUKR335PuwM3AwtsIPEEVI6Tqw50yhrjWbXT35cxqaeTd6p9ebL6TxQo/ZHS0o
         oMNA==
X-Forwarded-Encrypted: i=1; AJvYcCV4TNKdRb8O4S5zMayPtl0Y9W0oa95OTjbOYUAaSIq4KKFvLAk0ICUcaC+a6ohzcvOvQ8+QPnOPGxPWTFgs@vger.kernel.org
X-Gm-Message-State: AOJu0YyWk/IKBu3e/TSeqkfVy8A2/obJ8W6bG24d6ny1ugxYkYUvAkw3
	clJD5a0d5WjiGWNYEP2EBFJWSRwe+aiADaa+TY55189SHyLRWgcdtTK3936+fP5OoJklAVEpq29
	64sI8TbHOyWz9Nffmtb3fvoRCVHeElu3T4KcgXABkpOkXa3KtQ4H3ugVh4/GuakymPnRM
X-Gm-Gg: ASbGncvt5lRs1BmGUzijhRX5aVd+ssYObqb+pAJu6FJaHR/O9b07d7z1q/VEFz48HPc
	wS4wIT7Z7GI1zThfWABvv7x88amh4Wh/D+taFDFaFtu6Hvni8cejSeyNW6QtRbFUw/YhhW7+oTa
	lNb1oDbhYXQSYzaZOIhX0lz2gICi50TX53IkyPwA5H+NfHA7yv+jZb8sRZhy7dIS04k5ez6/Kal
	2eGfdyM5qg02gQpGypIVZA4htkHnpAMrQIxdGLcyCGviMNX5oVDgtOhW63p208m4XWhbDmjjm4E
	OGc3C+zhEkztewxBctOufFfebLiZOuUqRwS+pdb8XJdRU83FTql4tgoIxWaZm7Dxd6KL7PDbQcB
	lP/Pj+wrfz1E=
X-Received: by 2002:a17:902:f644:b0:267:8049:7c87 with SMTP id d9443c01a7336-29091b02b2emr8957525ad.14.1760549228048;
        Wed, 15 Oct 2025 10:27:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3tuSh0KK5oaxfpqjUBx5mED7fEp7VjVJWxeGeZUoFaEtc/KDa09QQGlqXf32X6jSlMQwlfw==
X-Received: by 2002:a17:902:f644:b0:267:8049:7c87 with SMTP id d9443c01a7336-29091b02b2emr8957225ad.14.1760549227553;
        Wed, 15 Oct 2025 10:27:07 -0700 (PDT)
Received: from [10.73.85.4] (pat_11.qualcomm.com. [192.35.156.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29099a7c255sm2042235ad.70.2025.10.15.10.27.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Oct 2025 10:27:07 -0700 (PDT)
Message-ID: <0e034840-37d6-4492-92e9-61a9eadbf794@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 10:27:06 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] accel/qaic: Use check_add_overflow in sahara for 64b
 types
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        jeff.hugo@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015165408.213645-1-youssef.abdulrahman@oss.qualcomm.com>
From: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251015165408.213645-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2D4B8rrmrD8KMnnSlD2zSeI_5uuyZ3Gp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEzMDAyMiBTYWx0ZWRfX/qNvSuqoSw0i
 c1xAokE/qQe+sxXdYS5PbYb6Jcam1UZ0MXV52CKtk+CYS0pRttum/Mq5QItJXyK9QOhf0VThiyA
 jiKdJ/Xjtf4AJnKv3rVO0K+bz5mJdCsnrHya2kiQstOsws0WLIJqr0yrzeBf/2KB0Z76sVz4RM9
 CEE20LN7uuI7U84QIEdAlZGgew/QX3L1+ZNCiI78ufQk1uecy9HClcs6GzCc8WISH4ZeVGb+Cqe
 XdEoIRpehl388kPn9ELJWAgSyuzC4LLC9Df5jXJjQ3vB1FB48IgU8Gh6ADg+UV/j/aT8xB2ieSH
 0ad4XzRctLqOcpj60vz4wF9v8IwuELrMtGY2eivlGnR17Qfe2U5tK1ENEN8mJoxelO56LMt8e3l
 OU27cjv4g5Ax/skx/0wtfyyH9yCWFQ==
X-Authority-Analysis: v=2.4 cv=SfD6t/Ru c=1 sm=1 tr=0 ts=68efd96d cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZdW6uxA9NKXbfdqeeS2OGA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GWqr9FCoMw_Da9qovAsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: 2D4B8rrmrD8KMnnSlD2zSeI_5uuyZ3Gp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_07,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510130022

On 10/15/2025 9:54 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Use check_add_overflow instead of size_add in sahara when
> 64b types are being added to ensure compatibility with 32b
> systems. The size_add function parameters are of size_t, so
> 64b data types may be truncated when cast to size_t on 32b
> systems. When using check_add_overflow, no type casts are made,
> making it a more portable option.
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
> Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
> ---
> Changes in V3:
> - Remove the min() to min_t() changes
> - Link to V2: https://lore.kernel.org/all/20251014170927.3908383-1-youssef.abdulrahman@oss.qualcomm.com
> 
> Changes in V2:
> - Use explicit casts with check_*_overflow() calls
> - Replace min() with min_t()
> - Link to V1: https://lore.kernel.org/all/20251007154853.417114-1-youssef.abdulrahman@oss.qualcomm.com
> ---

Reviewed-by: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>

