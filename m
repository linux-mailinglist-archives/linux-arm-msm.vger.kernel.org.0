Return-Path: <linux-arm-msm+bounces-81132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 485BAC48D7F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 20:02:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 359B54EFAD7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 19:00:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 263E132ABC2;
	Mon, 10 Nov 2025 18:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eQ8ANLLy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aSYW0Wsv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41AC32E7BB4
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 18:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762800612; cv=none; b=oi+7RXg19Br87ZwOIxLTJ+liE0Z/QiBnxzdzYBQBOv67r2yJghPk9dPAgcEthe5MrZ3ijXY6fwODbNO21rW0FPQOteeD/i+J28Eo689qqhD54P4HtEb2VO2BXLb0GoLorfb1acIHPaNmAt3mZ8gZKo5RSNDihTcLdEOfmATYShQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762800612; c=relaxed/simple;
	bh=wWAAHsBo5eGVreWpDIGPuNgkq+S79c815li9vXHQXAs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pPZ1DzRPGnIs4QFmLbVhmtfNIEGwwgdhJ5AYQfLww80ZzuuCFHEFGROtu1fMY/EPscdlJKSgoXiga4Wh/EXIQsrKmw/Zpm9J8TfYQgaIVr6xxSvJzRsxk0ue0zsAHIlM3pUcvymQwLMhsNOAz2M3Jf6PAjad80GR2sYwb1k8y/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eQ8ANLLy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aSYW0Wsv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAFQ0xU4071297
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 18:50:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RrsqLNacV7Ae9T939lkJ95hgRyBZA3cSW6oQvnilp7Q=; b=eQ8ANLLysglmEV88
	MDw9r2QGq2ZNgu8euJvumCzNGM2H3URrC7z4D0VUTCGKH/ruVgQRn4xq7vI8rNsO
	Cjbmw77aXsU65D4WnMnI+8cvbdQtk2oHe1tr9g2YVOZcQnLZ6GJiwmBk7EfEewzR
	WsVmfKBTbozctStCa3UBE3tDRu9akIOj6xTkvAlBzboIO3Ue9A6weUdcZKF3Hkz9
	VjmsOR680noAqDgJklluR6qBErWEV8I8CVaWYSre3ewEAYgjthVBsYjCK6rnV3rq
	WoyymRA2zJRjs4FdGhF/oYObuIL52z0J8++J+FPomv7NvBkBG0E5SrBx0YRWQ0Gr
	DCMcyw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abjpgrp58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 18:50:08 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-340bc4ef67fso3918112a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Nov 2025 10:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762800607; x=1763405407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RrsqLNacV7Ae9T939lkJ95hgRyBZA3cSW6oQvnilp7Q=;
        b=aSYW0WsvszyD93irLh90OOLm03E1safSfPmmYFfgNPoBF3HsbdoyqM9fkDNpJK/4jC
         3PayEF6qNII6Dk1DVSghGFZG1tlL78nK6wlpyNGEqJ2+ooF6ye0036xOZZYDE+QiHBms
         wGd4jd6FQDtRJ0ijAUf6po1AMP2lkXWCd6oybxA0o3/aAo1/bDLpY9KCX63gduQsjP//
         ZzXkbimDOscjDB/w4MU+0rJdh1BvvHgEYiapnsJCkKqbktGNQtHHYlWS25ErXwsqNT04
         YgQOw7ePNjA9C/rOdT/UuQ/XZUBgTV2jw2Z77lem14et7MsVmx25Tds+6lbYKFEHdo9b
         ofAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762800607; x=1763405407;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RrsqLNacV7Ae9T939lkJ95hgRyBZA3cSW6oQvnilp7Q=;
        b=OhDbqhxHhzespGLnj60d9CJdDLOfVFNOeDw4C2jFXuu/Wtrb2Zl+jfpEBpu+7KbsJE
         sNsFqWWgZGiuF2+6rYKrkE84Kt2PEYf7oldNxPxbXJS+u/hZvljPzYmuO1VFtYkq4MRR
         s3BZBQspCMgPKXbMFD44RIpoWNnR/92V5lc0MeA5Gpp6/QpKSwfNUwew3FpjqROp+s2u
         f98rYTkSUsOCoQEnt1BEGogt7aXU4wDHv2pQUzeraWAxZR6RwZ2NM9672WOaiV5bGgRG
         a4lYklTtpOnzefEBfz0Y9n4y6Gl/fvYCATzT0ZsIlO0jA+98R9QkVf9rR0dtulheRPjI
         tcGg==
X-Forwarded-Encrypted: i=1; AJvYcCUtthOxU8VfvpUZ0BJ5P2Q8gUFXqf0ryzqNiK5glvPJ/4o8Ce7bQfwcPOkc3zf1KAG+b6Tc6oKe0gSTtjWO@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0CnZ7DbkVjfxMW70SvsuLGBHoiEDqMgzc4TC2VivH2rM23/pZ
	Y4sx+XYxNlO9PZ6wyeNfN5mk6M/UnDejCOfVNYsY5eOegBuIyHu3sheylgRrTU5WxtWl+wTl93S
	/dnpJC2g6PNQmrzF+/2qvAIkGkNbDxllzaF6eIqWlZKX4GCzMiM3hGiJ8t6oTkMsBMq+N
X-Gm-Gg: ASbGncsyiiGvqeIc93E18KsXJC4gu5qzfXEhJks8IBUjhM9gmOoHJ/eGxnu2J2GG8AG
	2t7GvzhXU6j2lolDKolSRRhxnV3Waywz2O5/TWERM40JIprPGTLar2E/6vu2DC5OQRpeIW9/prz
	G1Y8jlCMpHLaax1F9Xs31QkLjehrYq1E0sjTYHj8cOiyFfxuEopeBv7DnHBouNf5I1iPQe+J8Gb
	cQhUYhn+zIFT33QMW0gjkymcjMzYcq/+/EK8G4duq4PTWZtXSuIEasSCLOQRSE5ng44yKDp8K6d
	Zl66Q3JrgLpM9MVk11KOC6BJu8ChWhBT9zgLj4ZrfyWmvmAGHlcEIslHu8impMbsgSqEmKvN9+4
	r173dOHj2sfWlELQ2AptUSgNE5yNs2wcWmna5HcB3xGfUex+WFvnu
X-Received: by 2002:a17:90b:264a:b0:32e:a4d:41cb with SMTP id 98e67ed59e1d1-3436cb73f0fmr10032679a91.1.1762800607072;
        Mon, 10 Nov 2025 10:50:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2ixeW1TzGwl+WOFs/7oSmDpLI/67kOgWoub7CURXWxtpro6vNnQTPq5GNpFvY22qB8U2+fQ==
X-Received: by 2002:a17:90b:264a:b0:32e:a4d:41cb with SMTP id 98e67ed59e1d1-3436cb73f0fmr10032634a91.1.1762800606409;
        Mon, 10 Nov 2025 10:50:06 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-343bfef789esm48975a91.1.2025.11.10.10.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 10:50:05 -0800 (PST)
Message-ID: <8f1028f5-039e-4040-a7f9-58ddb3b06cf4@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 11:50:04 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] accel/qaic: Format DBC states table in sysfs ABI
 documentation
To: Bagas Sanjaya <bagasdotme@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Documentation <linux-doc@vger.kernel.org>,
        Linux ARM MSM <linux-arm-msm@vger.kernel.org>,
        Linux DRI Development <dri-devel@lists.freedesktop.org>
Cc: Carl Vanderlip <carl.vanderlip@oss.qualcomm.com>,
        Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        Pranjal Ramajor Asha Kanojiya <quic_pkanojiy@quicinc.com>,
        Zack McKevitt <zachary.mckevitt@oss.qualcomm.com>,
        Aswin Venkatesan <aswivenk@qti.qualcomm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20251110035952.25778-2-bagasdotme@gmail.com>
 <20251110035952.25778-4-bagasdotme@gmail.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251110035952.25778-4-bagasdotme@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE1OSBTYWx0ZWRfX0flsDh8k/4SE
 V6c2Mg9O+DNbdwrKlf53KUQ6j+WCaIQAh6DH/VxeJM7H1Cmq3ZuOuEsNzWzqnzpI6Xd8L4y+hq0
 KyqgGiQZ5HnVOl/1TTrcgENbbu8rwCBwGSJfTXu57DFS/CHJ44ZJMkcQb4aDBY9cJIIf+j/j9di
 Q44kCY2g7KK514Ra27pPEPybPc2+2/LpGOQjqJaZ0KKNcdwCuMCyleuaZUXg44eU6InE7Kivxiz
 fOuz54kpePgWRTIfErvdeBCHhsoFba6hCJt89iKkdXLfTBotIVNZiLV6aydRRZ4cLU85SmGShEY
 hXGcVKN9a2JjbAT62r9umOM20VU5wLN2DzaR2Pw29s2vYnlKW0UapCUwviClqDWapMqeo8fPthY
 XJYgojl+s6RdqR9sIi5E/oxuO9E7rw==
X-Authority-Analysis: v=2.4 cv=br5BxUai c=1 sm=1 tr=0 ts=691233e0 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=rOUgymgbAAAA:8 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=p_F4U7gO7gGRQ7AvxbEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=MP9ZtiD8KjrkvI0BhSjB:22
X-Proofpoint-GUID: NedKlRsaQzTQ74qi4S9FLn-IkWqYLasU
X-Proofpoint-ORIG-GUID: NedKlRsaQzTQ74qi4S9FLn-IkWqYLasU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_07,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100159

On 11/9/2025 8:59 PM, Bagas Sanjaya wrote:
> Stephen Rothwell reports htmldocs warnings when merging drm-misc tree:
> 
> Documentation/ABI/stable/sysfs-driver-qaic:1: ERROR: Unexpected indentation. [docutils]
> Documentation/ABI/stable/sysfs-driver-qaic:1: WARNING: Block quote ends without a blank line; unexpected unindent. [docutils]
> Documentation/ABI/stable/sysfs-driver-qaic:1: WARNING: Definition list ends without a blank line; unexpected unindent. [docutils]
> 
> These are caused by DMA Bridge channel (DBC) states list in sysfs ABI
> docs. Format it as a table to fix them.
> 
> Fixes: f286066ed9df38 ("accel/qaic: Add DMA Bridge Channel(DBC) sysfs and uevents")
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/linux-next/20251110135038.29e96051@canb.auug.org.au/
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

