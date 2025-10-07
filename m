Return-Path: <linux-arm-msm+bounces-76235-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id C57E6BC1FC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Oct 2025 17:49:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EACF934FC59
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Oct 2025 15:49:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BFF81C5F1B;
	Tue,  7 Oct 2025 15:49:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZD5Q8R7c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573642E6CA2
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Oct 2025 15:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759852143; cv=none; b=MsYo/ljJ1LC9VeQ8yhb6xP30MigbmC3aTmY/K2cERDQRhGTNv6AkxDNWiRKjwgU8qOv3rNybdWSr/RvmuBdNMz+i2KEGE/LJKEo/j8fu6MjQhjpmHWLJ4ylttOajt7v2GVcP9jPdGEh9eV0gnlzRPeqH+EdGvEDRVECbhla6s1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759852143; c=relaxed/simple;
	bh=4V+Z5+wD8kzGaUPcBtAK23VqpD5JCfVqAgrK55pw3ws=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KPrpDacKr/3gtmjqgT7Y3VW4qBrNqd7JOrqlmv5B/yZmvsJ034YQJ+KQt6LMHsXOVlurzyge+gSGp9PYo7iGtRwpUKwNEEE00q8jYEKa7Oim2qvrzrpMdtOOYIub03qjh0eJi7MAY0eZySRsf7uj18c/4gETanc7hTajdex/Oi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZD5Q8R7c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 597ET68n017459
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Oct 2025 15:49:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uBc3TaXn2BwcM0y0SH9i5CDp0h/G+JoiGzmqs7V7f9A=; b=ZD5Q8R7cUyuan4By
	jotgyxlOQhgqBlVf233v1oVMIfq37Nr+BAe1aH++0Mxx1QZymCrtVKqOgacQBjM+
	pp531qrNYh0Heq0IKx4p+FcbkOGTssg+pVR1HAH5U1U3QQGXLH7NpJ95bdglhRMl
	+4EOBuhRiZ1LE4l6sRnyJcFEmHNSgeFuIVcDmR6oO1B+AWf4O0SGXvjetH0CBHl4
	lGRqWB3FWkVTLD4vRaCPyG0ZTQXLzdK93Eu3PpoI0PEOzvG8U00n5U+l6xW431Xk
	0PYFuRbGdFxRqqqUQF5ZI/mYPIhKLBlPfOj/lWqyYl4NkJBjPjtS4ObyZ9waSkEA
	NAxT7A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49jrxn8358-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 15:49:00 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2699ed6d43dso63652715ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Oct 2025 08:49:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759852139; x=1760456939;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uBc3TaXn2BwcM0y0SH9i5CDp0h/G+JoiGzmqs7V7f9A=;
        b=d4e+/kCTi3zRPQUWtY/mEu6ajCHtIbv5Z2tLd8SLxM+grBH4dLungOqTBpLF+0VPPK
         ECUHr/yfuHs1aXR9v1akHH2dgT7xnWgIILgOZiKByzWW+QPr1GxyQjMUddiFkAr/AGHV
         ZKMaz4paJg5cUUR7CtoieJCExEAJ/e3zbVMrTC5WIaPAHAqfVHQ+kj2clF9nyhsxRpCk
         hBVQcfcnH1IqTvWtOltOEE6gKky36EVZHQQ4cV7qG4Gbxv5q7wuPT6PskR2Rw0mUo7I+
         P18N46Fxc6L15q2IVgCNm27327SpMUEcE+423uDSoCLVoU+rHL7G6qRc1tra5NDWm5v/
         1XZw==
X-Forwarded-Encrypted: i=1; AJvYcCUn0sBf2090PKZDMNElYATmT3gPmGx2VrlIlkczq3HD8PEGk95wgUe035gApiCBxRFQOvC8rHeLAGMpfP6f@vger.kernel.org
X-Gm-Message-State: AOJu0YzaJI8zjBMM1IHes9oNfdwJRFS01N53/Nw5sVx4Yfbhr8agfavI
	MH0zkRPWeysAhr3bLpDg39S7rWsUjFemPygcyRQXsMcopV69KSHq3Llh25HKq6FOBUl1fly0lZq
	iKp7e8D5A6QMxV3qBlWdF9wAtUn5APPY8Ytqxh9tAs/F9txpz6XUPyxfvGcjakPIol5Sx
X-Gm-Gg: ASbGncuApbLzmbq3574Ry8Mdy8pFSgplEgtyWwJA2hpdk+pBu05fyb22ihsPbws7p2C
	eBvYcbiHEWNiaNy3ZPSaw1NdfimyKIGZejvGp4P9Sz+g9HzGGkyg0nvQ0pd+PgovAfOGP3HFcjO
	uE2+PJh0HcUg1wcTP+XD09MUoD9fiX73eBE+g8rD5G1mMpzvLI0pNxLCgxn9R5dXACaSEHXJ3BA
	eznUA61BRYGGtnV92M5T4M3HBQAdvtiq+h7BqEarUdIN6ZrRZONWfrgyag2Av5grJRKhSToBGcB
	KfT/0fHpiyHd2VcnADpxMzGKMLRb/sPtVdEIwGqgssbu1c1+i76aYeCmprvdFthBFjyfS0EhTJU
	Jq7p9C/kNytOhvdhWuXU=
X-Received: by 2002:a17:903:380d:b0:26d:e984:8157 with SMTP id d9443c01a7336-29027356ab2mr2558695ad.8.1759852138921;
        Tue, 07 Oct 2025 08:48:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9ZCImmibY0972JM+a8fYWB0e9M38UidJwDrKMxNtcuWsc6T7jqjdPGj4BSor+hsjb20euiQ==
X-Received: by 2002:a17:903:380d:b0:26d:e984:8157 with SMTP id d9443c01a7336-29027356ab2mr2558395ad.8.1759852138513;
        Tue, 07 Oct 2025 08:48:58 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1260f0sm170476465ad.46.2025.10.07.08.48.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 08:48:58 -0700 (PDT)
Message-ID: <120c0040-2bfc-4c88-bbe8-2a56e824493a@oss.qualcomm.com>
Date: Tue, 7 Oct 2025 09:48:56 -0600
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] accel/qaic: Include signal.h in qaic_control.c
To: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>,
        carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com
Cc: ogabbay@kernel.org, lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20251007154525.415039-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20251007154525.415039-1-youssef.abdulrahman@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA0MDAwMSBTYWx0ZWRfX6qkQcXw2I+Ri
 RpbQyBHV3kqdcingqxHSN+96O34ld5nMMDSOTb3TYsYKMiX3BxRgZgtIj00CX9AcaICN9dJllKb
 DMVZEy1MK5qFLnLtVGiB0ot2F2FTWTdFF6tGQjS4z3iGg4/rFcuELMSm9lPKBupbesULmCaqmT4
 lse+Z7glWnFwg5qqvxohgI3x3xFoMuSrix77yhoCg/QrkzHJnNSHnBsgbp3JzfIN6/UhNh+2F+t
 mFdeDqzi+N+Q7waYsbCET7Sg5/sEn7nNrVXigw3AbRSK0HDfoETobGn6e0BZu8VM1XrupLZFsUv
 eF+SGEPscVXM9SuhD7zBIIJ3RlZMQVqTwOWff87+qgd49E8n9eAUlRfpy3GI+qEgZlxh0+jUem6
 /6h8r2Zw1NJmETe0D5q6G0o5w53TJw==
X-Proofpoint-GUID: o--Oqh_oji8szrQBPLs8QqZHmvcceyk-
X-Proofpoint-ORIG-GUID: o--Oqh_oji8szrQBPLs8QqZHmvcceyk-
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e5366c cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=EUspDBNiAAAA:8 a=2vv6iFeKVT2olVQFumUA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-07_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510040001

On 10/7/2025 9:45 AM, Youssef Samir wrote:
> From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> 
> Include linux/sched/signal.h in qaic_control.c
> to avoid implicit inclusion of signal_pending().
> 
> Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>

Reviewed-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

