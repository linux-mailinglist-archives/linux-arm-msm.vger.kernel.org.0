Return-Path: <linux-arm-msm+bounces-76477-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id ED961BC64DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 20:32:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BEF204EFE0E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 18:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98D3A1F9EC0;
	Wed,  8 Oct 2025 18:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NPQ0JvwW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08FB04C6C
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Oct 2025 18:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759948347; cv=none; b=tbwXR8T8wVNg2/5lynjueRnLbCvrvLYeUJRmLiOShUUombiHU1j0koyRdDJLpoDlI7VDDnRh1BKQwd2bK6H8Icw+B/r74GF660PS6pvVWXWYYkI4nnHEAKRjKp6ugdOu4yaR57erHPW+k+Pc1Fm2C7Eo84OprO7a9UWHLo1L+KE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759948347; c=relaxed/simple;
	bh=f90LnNJFz4vCvJjhrEtaKxBSp+U+ePAWeGlBeGfSDsI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EMoDWhqOnQXzxbprBt4/XdEDyKTHO8GWsxYIj3J0rVtTXN32W2RlhQvUtOBuF43MfmaP39HRHVGE0+8qcJ7LCaONlpHfrj9lm1axhd4U4zxO46yF5egTYwRKKIulXFpZTdwQW1RbPW5ZXOPfBVvz7fN2cDZaG2Ifi70oyXO5VC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NPQ0JvwW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 598I5GDU019393
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Oct 2025 18:32:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sxarXiX1GMKIyFyY2fTHJFWuNA0u8+Vt8KpUQFDN2G8=; b=NPQ0JvwWdgLTY4/B
	TGoQVpDcAkeIQ8UT5BW/YQZyjX6ku+NWCMXQwZ1YHT2baeJzazQQ04IxDmsn18Rd
	vxyk5gxTWkMA7u33xRgb/Jn3IaCi0m0+ymXV9Rb9p3haZUaOnxDHsCsqXqPSeinn
	JG9b54FAA7e1c2y9ibQc/EWTm7mDrFq7vEQEbMXcPiSNVnhopn/Teb01RO74ZBVU
	FqpAl357mVeg0qhcWFNqHTx+9iB3qgoSfSwyey00F3A5lC1hCv6WIiNdJq8XCvpp
	TkMSTa10EKG+MXc4I/yBVy8674tMnPSUPQ7AYzi5dVs32BS0xCnVvkNUyFhYd4ru
	mI4aBg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv9a873s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 18:32:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-267fa90a2fbso17484605ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Oct 2025 11:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759948344; x=1760553144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sxarXiX1GMKIyFyY2fTHJFWuNA0u8+Vt8KpUQFDN2G8=;
        b=xCyeaQZV6uAeKWT1f8ycyuxwRMXKgBg2yvJIctX1jA8uYVjxJFsCoxEylNSFy9J7GG
         8EXIRhc1VhncvN78bXlZ7xh5jwIQ0n8pug38XiQiJ99I6sW+iPVoTGuGBUMiAyq8GwbI
         CyzkfaBFFwb+vuSUXzB3qsEwVTpDUlMTVWBRW696Yq4WUrKMz7dsSVy2OSUMLhBMJtFE
         ati4LAKRldHQe8FpRyabEbxxiGXcGhN8I63zJrcwKu3S46/H6z2JkUisJX7PEuCHtauK
         EKYcb0DRCRaTuric8smL8NwTg9MRkXWuIamcywI/L102EldNuZC+zxxAF3NUsjlPtXJ+
         w4mQ==
X-Forwarded-Encrypted: i=1; AJvYcCVGaKO2PpNai5cCXIf1H7PD8rcUpXAMUTmIleZJ99uJu5+NqN/JrJ56lSAG6vu3aacB825v7p2EfPUZX8wX@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj4Sbybv8xOrzDZ10H6EzNkeF9ZZx2yDzUoS7GNaLAmt9QvwZF
	GugFkks0kfc242dUA1rv7iN75jkSZPOiwhNWbMVRhCaTPMjjSKM4Y6aj591rMmWZpZnxED3LHFA
	vyMAmMvCyg5hpx870xzkQKiop+JQAhoi1SZ5rUV/Y3iqxkgYh9xdhyjvQ1zGsg3be3k1E
X-Gm-Gg: ASbGncuX4vL64M/9O8s0Lb3beMpoiOJ7uwrgETWczcyTRMZDOSpFUi5DVmWZjE2/9r0
	Pv4/3Ox4b8dreUCzYhNmaVEb4mOhXHCgvJGL0t+4ZOu2bUWXT681p835kaJ0lTSwH92yoXIBSGt
	w+de5S9NAtuJdy9yWZH87PR7cLnsmkRpMhVfKQZKCUctwEbO0oFjGLld/+pMWXM2qNRfHplyIc5
	mzSdQ3DnY01ypzALsButRwxa4ifGi3xAZjNbtIRqE3BikjV/zriIM9fFTrQpKYc0dcCwtAlEaxy
	0/xKVwnCVXmZdcECWO7FwmNDgnuMNTzN0E7fqldC+Hee5ETw0+16Pz4mOhgdS0W3zf3k6hEOzna
	zuCDna4jKT8eZiAbswBU=
X-Received: by 2002:a17:903:286:b0:26e:7ac9:9d3 with SMTP id d9443c01a7336-28ec9c97670mr111370305ad.18.1759948343784;
        Wed, 08 Oct 2025 11:32:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG188KcELEkW4UPAjYoiSp3SrjHFty3fkVfuG1ImYr0uJXwhqvnWgiVuFLowcI2zc9DLXkpbQ==
X-Received: by 2002:a17:903:286:b0:26e:7ac9:9d3 with SMTP id d9443c01a7336-28ec9c97670mr111369935ad.18.1759948343348;
        Wed, 08 Oct 2025 11:32:23 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034e1853fsm4280925ad.41.2025.10.08.11.32.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Oct 2025 11:32:21 -0700 (PDT)
Message-ID: <21d22b78-a844-4c86-8be3-e07b8b61cd4a@oss.qualcomm.com>
Date: Wed, 8 Oct 2025 12:32:20 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Add xbl_config image entry for AIC200
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007221528.561242-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMiBTYWx0ZWRfXyp+0/sbKs8jZ
 CnRjxNyznzww4FqPJplMhQRF4i0dGOfaWGwTcNvlE3uXDZgHFqJbBO3XsyreiGMcAz7t6r561cX
 IxL0ZSDwvqa2GfbsyxXqOS6quAK6HZJLoR8gbtmm1rJLiYh2sHke8j0cfQDHAdWt3c9TgoxnpGA
 rtkeSO6DE1zGT4B4hguFIHaZ00kFppp0HK+NI+tLya4RDi2dmJF8sx8s+ZcRvJ/J3qvR9WtCSLK
 lIP/jptxOEwUineY5dyk3PVDNlJBYko3AlCkZrbE3yiewg0cg+DzYxwHztgRjcDLVAexuvXmAER
 VS+EXMICMRrRdVzgRdqlrc1JDjdEAxK/xHBlzdbPMBR90PKCeq01Vy2db7HpL9b33oWJvvWO/9B
 w55z+cZ2y2L6xIow0PW/4S6aSt1U4w==
X-Proofpoint-GUID: i3Ydl6bzoc3qzXhQa-2vBJrmaFjW_HS8
X-Proofpoint-ORIG-GUID: i3Ydl6bzoc3qzXhQa-2vBJrmaFjW_HS8
X-Authority-Analysis: v=2.4 cv=JPk2csKb c=1 sm=1 tr=0 ts=68e6ae39 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=3QUyYiSUeFS93uMjaC0A:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-08_05,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 impostorscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080122

On 10/7/2025 4:15 PM, Youssef Samir wrote:
> From: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> 
> Update the Sahara image table for the AIC200 to add an entry for xbl_config image at id 38.
> 
> Signed-off-by: Aswin Venkatesan <aswivenk@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

