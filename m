Return-Path: <linux-arm-msm+bounces-78030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C88BF1E43
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 16:41:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9184F4E2054
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Oct 2025 14:41:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7153521019E;
	Mon, 20 Oct 2025 14:41:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LguKjo3Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01639218AB0
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760971313; cv=none; b=eOIdbZYuXUqmdLQMBoTmH1zUhNF8nSTfhoCLVflE+uSRQ+Gde4Lp1hyC0DsA4co/VT2CXiXyfj93lpxV0hOINO6uv3AluRnQlvdhpL9RDJYhLX+O4Lkjpu5hwHfRbGVE/3fIgA8pWK0flu0+hTZ9xJR1zORaHqKRd62gY5QEjWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760971313; c=relaxed/simple;
	bh=OsRCg80zqm0z7ylRBazRHM0sQxI+lSElU9Y+m7xE4uY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eDd+3EBMXMnfS454DioMzuBWbTSkZvFGuSoM087FIialQ7Oqr6bjd0W7xwSk/ARxTY8mu2yeY3zAA2otviaxd9yVtEW8MU6+EJxisWNppM9eMXW25bi8UprlLCKkXHvuBC48y0P+z619Xejk4sM8T11mn1j3gba10ooy9j1ZSPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LguKjo3Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59KBArkd021970
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qg9ULdyYWQ63BsHXvmOS7CMv5DWm/liIJzFBd+lW6JI=; b=LguKjo3ZS2Uw1z8T
	BPMLX+H+5HioCjQJSyJHU8oEkzdT8aUh64LRnDbpUnlQN6vanyctExcLqBaJom88
	fSXNC+fe/+feUMUSWXEcASgehOeBDBrFp4GBbMaHIZfUAja/BYG2bZlDvLEYpstH
	hhOKwHBrN/vttNhi7YGlWmschdmyPVKC1oxoQsgcj3aFqOAqEDkWZ9lo4kpncBV2
	bxGZ8M48Gb6owBL2bOfVQr5mHKwCve6m4i0ENArEuL5vg6CKpW0LfGTMlcXBA+iE
	+8weQNdd/nTIyY8W8ACRJOX155b8BiG7BuVkyjrHSZ+lykKFxPDQ4IYjvUohY3Tb
	Sd9ivQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v343w2rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 14:41:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-277f0ea6ee6so48454345ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Oct 2025 07:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760971310; x=1761576110;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qg9ULdyYWQ63BsHXvmOS7CMv5DWm/liIJzFBd+lW6JI=;
        b=p8NeaTCMb1rNfcmWwsSffnXiMYj0cVayVfJTyxk3KY98DJBOXn+RDbYcSL6zACnaBq
         Xk1s0CW9PPwP0m2FLiuduOpiqzgwbKD7t0cv01ng621xtpPpGtP+zvVi5eGsg7NqwG1A
         lp7X8xOdDaYt2k7OJtaSSajR55/ctpcExqJXfaTJLD9sMRTtPegfmIl9voGIehRKrnZu
         38v6mAtQIKV0Rz4kX9ALv9i1T+CMgLMHfLDBBGRQvVxkGGBDbFryM38a23vAMeG3QrsC
         XOuofaZzFSqWKZB/gC27EEGtQaEpqtmE7RW/Gv83DkqMA02/0LcQU7nLQIH6nb2c9yq6
         g+EA==
X-Forwarded-Encrypted: i=1; AJvYcCWWyM9ayHHSOQx7V9k7m/48ZqKc+dUsH5qD+xP5kJP39lIimY4tSTg0jooHX9XpXvmmtdWqCcGr5ncwajvv@vger.kernel.org
X-Gm-Message-State: AOJu0YyZKjpy9PQevJydqv7r/p/tAQMa0gME8liE/NgZwSukj7h7tBHA
	jNrMhPe2LuUPb9lAxz45AWTA+uyjsqCU4rnQ+6thXyGiz3t9a5+y0y6SAviRaJAjA9gSWZms9M/
	0qHwoGfE+bTlahMBE1KN1grm9fLy2q1NA5x1gbStIx8TRCPsWPF3WIE53SRVlBBZZ2mut
X-Gm-Gg: ASbGncv8cyaWinUBUgsa4vk0KMeGSnIwld0a81Nu6hGiqfy7I0ESIZxxGIJ0ja0v8T4
	FT2CLwXEyusPsepwPwxYder+mR7Ij2X7FY0+UFspFbO/+4RimRF0rDlIoNL7WfSl0T0qAMhFDbM
	shFNRb0lxyvyUgMFYAt1bBRTNTXkzg7zR8DE4zWnXjTbcSLWxW93UinajkXtmdzXd0QLkfFiNEq
	0hC58vQNCYM/SGXytpnG3ENpKjBQYnquUKs+GSCy+VFwhR4IdoO96+BGGMT4vHUGOh/XWpOC+MS
	DT78UkP9txPUHF1jaeqKG9uxAYBib7hN3v8bahxJHrRlHUYfhKlkDZQyDZKM8N2ImXIedzWn1cu
	f7g0+F3iuvQ1q5MGl0ivDiUr5cxlAHEKHl5p6UgIAIMQkGLaKxYsy
X-Received: by 2002:a17:903:2306:b0:240:9dd8:219b with SMTP id d9443c01a7336-290cb65b6camr199062875ad.49.1760971310056;
        Mon, 20 Oct 2025 07:41:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFB1uBtO/Ne2RFHj2lbdXZ86nBjjvN++H34C7hdf1CMvAodD7l9c9ngO6OWEl5UBn8AGAE+Gg==
X-Received: by 2002:a17:903:2306:b0:240:9dd8:219b with SMTP id d9443c01a7336-290cb65b6camr199062675ad.49.1760971309500;
        Mon, 20 Oct 2025 07:41:49 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33d5ddf11a5sm8260811a91.3.2025.10.20.07.41.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 07:41:49 -0700 (PDT)
Message-ID: <dfcb0344-2c73-4dbf-8620-45dff85cbd1a@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 08:41:47 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Fix mismatched types in min()
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251015153715.184143-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JXw6JJvrfQVSAcRBdjw93I67pJH5SoCN
X-Proofpoint-ORIG-GUID: JXw6JJvrfQVSAcRBdjw93I67pJH5SoCN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX/dydmP+bzdHy
 hevlW6woczTDhl/EvP4BvYdv+LLesvAmlj6kLWQsqaaWdpSHEqeWrqliEklnxNeHvbGfKXl+ll4
 xyBLMCXSWQYnCT2hymJLf3FkWJtXzno6SpEBdDL6pC5tZ15a7WByCo/8rSmWZnzoKHPGgzNpN/t
 RqX48Oq1WVLkTShQ6559l2x7Kni36G483zTQHsfxvegOJivxzrsTlWmfadQGTnJAtVdbpelOSZU
 s4LKpTOMhUwRSJ8bFtT/38rjS7iJ/M4fZiv4jST83XXQpRJAGMStgfr9VzYqf47qXBXKG890YF7
 /I7H6TA58tZYdAxEChFYizguNKdpWFP6pXJicZrVHmfhBj7ZlX5UjYZMP9e5+31c2Rud1Q5a4/d
 g2t0yhqLgZolMwFVoX4ahMALS5/qZw==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f64a2f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=-G_G9_dvTckeGbZ_RL8A:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_04,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

On 10/15/2025 9:37 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Use min_t() instead of min() to resolve compiler warnings for mismatched
> types.
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Pushed to drm-misc-next

-Jeff

