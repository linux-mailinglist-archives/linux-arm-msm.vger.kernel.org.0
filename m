Return-Path: <linux-arm-msm+bounces-80810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E725FC4147A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 07 Nov 2025 19:29:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 95B843A3022
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Nov 2025 18:29:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12A2C33A018;
	Fri,  7 Nov 2025 18:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzwFIR/2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hP49cdqS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C16132D7E0
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Nov 2025 18:29:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762540182; cv=none; b=hd6VmE97iEaiAboqu9SynzH7tNjilXsmcH0xYQCOhC1GbefLTiI0Rmbj28MRhPI07JruTuvtDdq+CH9hHogEEORAH6dN0siXR/T0DlzI6QhOOCK6hEea/wvP7kFJiImSoJcZKEKtpIn9ezlXthDwcA22QGUUztqUlOQPUG0hbwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762540182; c=relaxed/simple;
	bh=XTIdZlCuZ8wOfIFBwMjyIC5veeD2IYGjH9LvxctPHew=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qTEqjz/zQ43arF+dXiG6RNUL82DJ220v7I6Geuc22vfeN7oO7H+4Hyaulx9w/pvieNNriUseZopLyemRlOuzusLF7Hc5eJpdk30ZKzH2qxJRVhdt+svSBSpUR2d+Z/JZScGxgoRTeFW3OwXee0tzU1SFhgQjE/g+h0U4D51SEg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzwFIR/2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hP49cdqS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A7CTwwp2280821
	for <linux-arm-msm@vger.kernel.org>; Fri, 7 Nov 2025 18:29:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MpjK2rA+NNwU9b5o/GD7Ujhzx79pLwNclFBxZ3L2HUo=; b=NzwFIR/2D58AtxLI
	5vkTuMR7EJxjYHwRtLXdEVdikBcDLg7E3jA+JGkvevSgH2KpCcJaNkH5s+UiDg2q
	o36nIqic8WjGCXrh3RoS9XX+ZPs/5c7rGK3lyCCOUQ2UNlTFHhe+Zl/UmoSO5M5K
	P/rJ1W9A34S7yhpIj/6HSCYM+MAHDgwGywmcycPyBxT/t7rYN0jYqoMl7CsKyL5R
	a6iTMWjUwIdfSQ4yMG8QymktKzXE6+PCh4GtLAZsoekbrdykMz8E0TAAGeF0eWNF
	/geBRHEUJh1pF4pIaJNOFGFHWKiH7x53op1rA/kDpT39+lpjJztQkr9HaaDDVZCD
	tBNuEw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9a9sj7f1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 18:29:39 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-297ddb3c707so2742785ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Nov 2025 10:29:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762540178; x=1763144978; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MpjK2rA+NNwU9b5o/GD7Ujhzx79pLwNclFBxZ3L2HUo=;
        b=hP49cdqStdh7HHjkH2007Tj7XwVtu+OC6DA7Xtqaov3zDkjPdBHdaV4RGFSezwPztH
         m6EMsZ+S3mdUHOerWuzISijfT2U9+MA7PP/XWjKyH/aG0ENZjfmV/h23xEu7PlDHOPqZ
         wTOxvTRDjjR7WFo6hXSedyBgUjaSlWAkVOzV4dO1u5CTmBhl4ExT1J2AMpW77AHzh0oy
         PfTbym2Le4zykbXsc+v2AgQNC5Q8kq3MOqq3/ExJTC+ushsLJ2GS0gia4++KG/kZUx25
         n0B4kLChnT1yluQeccEk4/DFXfhHDebp4WYnB3EH1LKszI0HvhQZfK0vLpFvpUgC/DyD
         EEww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762540178; x=1763144978;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MpjK2rA+NNwU9b5o/GD7Ujhzx79pLwNclFBxZ3L2HUo=;
        b=lOcFhWNvYEy/hhd/0T9Z04mmNTDwPofLZtsux51XE2B119FWNDD1PhKkQR5nD033PQ
         Sm2gngcguHN7BlfBHlb9OzJIStkVSjRqzIki1575GnU41EgG5u59EjUMP4mjc5GctSaY
         O7HFacS7+WIVh3jIRf7PV/rYUX1shBePdMdvBPdHNKLc/KKv9bjw5XliLmgTUk7s4a/J
         Ud6BvVs730FckBYOzkbNiGt5ATlkqMpWYgtCFx0gwb8h2TTIjCsek2yviS9wM1FBhec7
         3dbpqY4jhqWmWshqeG95PBwf2z7zxKDOcOwNRN7PCRkUWdcSiWiaJ/PFDI+bVyUlIkJ1
         BRAg==
X-Forwarded-Encrypted: i=1; AJvYcCXA1Gkj7yXbUpZawBcLrYXy4kSsoLaRxfsDlEjpSEoFHWEhqyzqT8sHjF4wvwEyl2vzl6Qah1OXAjjdQaEA@vger.kernel.org
X-Gm-Message-State: AOJu0YxIC/TQjdbZpGnMcVLNdo1nQIzdYvKaNzux3VxsaOYdC8uSQx/T
	TSlredSrzMGHYEZauhkE/jMt78W2bPkd/WKQB3cjsFq28UHn6ayHjDoCxCPfCtpg5zWrh2xf9+8
	Sma1mB1C68Aa4QvE3q2BdxoKaVjqpCyRu8h+r3DZ8EaIkQf6RnyjsJMkpdGuIV/BrpO+X
X-Gm-Gg: ASbGncvNa3HjfOugraelyrB8g82zahy7GdfpU3DrUI4N9yLznMbopPVGUQ5VUmrtFlQ
	rqojFydd2SJUWc7lpNlJTCllPzdR1SUhGlDp0L0lm8ct7FsEDeEKw6GpHZFoEmKCvA151at5rma
	6PKpvB1THq9dCeo+rRIhW/CHwb8HMVLjWk4IZvG+wY+8doZtg19htgeSlgXCLOZw6vVQB50sK4g
	W3kbQ4cFgXuzu4V0k6KDsyzARO2TTaNmrfd0lxM5EkGO6L/Y+TWkk+yY0MRu22gft3SgQPIN+cZ
	eM1gpTNXQB0edoZxCHvOyBSb7/0eemJ+vEhWzcoNxn5G/fcBOU5sbfl07hjDU5UxQulqV765bm1
	tgnKpO80szYd/zVc6Vq6kqxm70kvDsQ9rIowlRbM24FZdITW4llfD
X-Received: by 2002:a17:902:e80e:b0:295:987d:f7ef with SMTP id d9443c01a7336-297e56191b3mr1004525ad.10.1762540178404;
        Fri, 07 Nov 2025 10:29:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqRuxfjVyRZCDf3BXcIUPdAAopn2/c6Fn4uA4ymDQ0hrtducOxKth5m6lXQGzuYY/M3lL16g==
X-Received: by 2002:a17:902:e80e:b0:295:987d:f7ef with SMTP id d9443c01a7336-297e56191b3mr1004045ad.10.1762540177465;
        Fri, 07 Nov 2025 10:29:37 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c6f797sm66983025ad.56.2025.11.07.10.29.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 07 Nov 2025 10:29:36 -0800 (PST)
Message-ID: <2adbeb5b-2b52-4763-bc69-ec09b7637e86@oss.qualcomm.com>
Date: Fri, 7 Nov 2025 11:29:35 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add qaic_ prefix to irq_polling_work
To: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        youssef.abdulrahman@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        andersson@kernel.org
References: <20251031192511.3179130-1-zachary.mckevitt@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251031192511.3179130-1-zachary.mckevitt@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=CdgFJbrl c=1 sm=1 tr=0 ts=690e3a93 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=QMP_p6KWfhAjlvo0swIA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA3MDE1MyBTYWx0ZWRfX2Ot38mN4cG6A
 LvN/u3Y0520fTy1Dpl1HxIjCr/tZBMmRj+kPndFpbtsE2VxNmcmDxCTo0nOHA1cIqFX9hTPBxRf
 P0oxmXZr4uBkPPVzhPP3fHyBRomO1bZSBw1ZPq8Z2oyd9CkBIw5gNhurWrBkF7J2PrrnbyNizUq
 uAPNYarJxju1Ecdc12ACe8AfoSgwU/xJl6KoPUniIRIq/S8HeBcNDhs9Wnmu0IePVg7EhuSyEA8
 PHxDeBE9yQt9vXMjG4UF5LoZErmxFdjEpTursCa9fwXpUEf1ejEBHIoQeeiTONaXf/977mtqxHg
 YcrbZ4G4guJWqJsDCYg7b5AkSuoIncfOVLwvJnFKBwoML+uaj1m8W8eZGik3dgsqxumYS2/ddRv
 b/Act77Y8DlZgtgYzfjaYHM288n0vg==
X-Proofpoint-ORIG-GUID: 7RSTGkctS2KiKAGrl5cZoXpoDebWOFIO
X-Proofpoint-GUID: 7RSTGkctS2KiKAGrl5cZoXpoDebWOFIO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_05,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511070153

On 10/31/2025 1:25 PM, Zack McKevitt wrote:
> Rename irq_polling_work to qaic_irq_polling_work to reduce ambiguity
> and avoid potential naming conflicts in the future.
> 
> Signed-off-by: Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>

Pushed to drm-misc-next

-Jeff

