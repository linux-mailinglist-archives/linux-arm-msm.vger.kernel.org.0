Return-Path: <linux-arm-msm+bounces-62679-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C80AEA231
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 17:15:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 73C0D4E1EED
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 15:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 365272EF9A4;
	Thu, 26 Jun 2025 15:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MLsyhEPS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B59A2EF9D1
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 15:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750950175; cv=none; b=JFoaF17ydao+qWbCTReoZTN4EYWCIPvxGnDG7PNZaUHkduUmXQ7r/+wRzeZ6dNGcZfqLHDsZoqIrGPFUyf/KZq3+0vmnMXiFcoVYvSRnxhArWinQPe6EdcyERfsWtSm9AvKhVRO+RL23crS/6C1wdPXy6z7iiMPFCZjFzKSOXuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750950175; c=relaxed/simple;
	bh=wGWJ1Sswd47PGcB2x/iOZY6omMkR+LwiTigIHQ5o8VI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vcb+/FUZD504imY2sK3Scm2uBUp/NjyQot8pgGpsT9DkeBdBCGR1AI3ScgKaD2A3UsKkaCcTocG5omjcobAPNmczMMCQqjE97NWpARKi0O7pylyjRk/Vkom9qOZAM2jp9TKZcNByo4vNOLMIMJ2Aw8UAqL6kft7yjusLBUYjqzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MLsyhEPS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9xaWf008309
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 15:02:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wGWJ1Sswd47PGcB2x/iOZY6omMkR+LwiTigIHQ5o8VI=; b=MLsyhEPS0AYQuE/q
	0ZLQ6k+sCoYnDpqCYEoTp2zl0ZzzcUeT9AivWKJNd7XNPQ1YShEn8p5Wy19AeSc4
	1jhl4WVeHB9lOSVr56avIcBvdRUMwGG7lM/TTgYCfwYDpGALy/gi5ezbd+qnKeP1
	hzRxWpq5SzOiQOueWdA1gsOn2rpYgkJNNquG4wUYoU7JtoLkRU9FcRitf9Rga0gS
	VKGj5P4jwtn783sQrxHFkhIcmA3NgQf3/hAPn/CVRPxD7z18yFLtgUyPOVljzGRy
	rDh3hfcmMReJoms0UkcZBGRfogfAHKAEJlMGmIDssaHjffFXLvjc8v44sqFVYSue
	Y+OW5g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbhqt659-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 15:02:52 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-31215090074so1750189a91.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 08:02:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750950171; x=1751554971;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wGWJ1Sswd47PGcB2x/iOZY6omMkR+LwiTigIHQ5o8VI=;
        b=cRNy2UogGM+sEWaTS2UyBaDBqHNqfNJ3Us7fAVnLP2Jnf1uQPlqQq/EVyE5y/2tKeN
         XzDL04768FW2h5FXdzFWHiVkowLwOehevBPchvW3Nwk0tlCzNu6j9kenrhhzzm8HY46/
         sE9sWuND7V5FiSHPPGLS2DThmmocmGxN+RVWDiTahYwb4f+y09xAGRpbP60hw5wPG9T5
         glYgyMdPOpodijKfLLksrYl9tgWjEbwfgtLbuLS38DvcYx1cB0yOtQl1519D+TG9A4w6
         sHOPH1ZBRqHvA43CFVNGeL44z5FWQh79qnrvSKHiBfoZ3z7/wB0KEp8yx9n2Q7y8o5Z9
         OLxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBwJnFEOqhDsmma6PQI0xYps5OHt4wNvhkNVoHC65j5TWE1kxUcdLL2dmSh0hIDPxXqrrMP6PhaggcQlgW@vger.kernel.org
X-Gm-Message-State: AOJu0YyRZCiHdm1gSMoSHKOmnSWqKzHpE4H+sGW2xd9BoCVTNIN5BQti
	WwePIThuJAtjBKHaoZuwLMMrrR33QH4PDeuqe4+fH+WTjQFdZNnm/4hnYdVKrvretnFG6lP378R
	qLWGsBPy/efIv8gOzoFSAZpF/uGkkgfrqbBf7KXjcnDhq8R/2/CJd/FDPFNnKuIaciS0p
X-Gm-Gg: ASbGncv37lgrXL0ssl8VjNAk1D+VNVumnxfCEpdGJkv0QIbrrjosCb/iFc3EzkY2hgx
	Z28vkCka52+GkJzG4s7uVoxIKjN+66aY+zu65D4J0BvWNQZ//yhj626B8YEfD1f/HV1GK13+AEf
	cUot1UgfkIr9e5aPb6dPNtNnhIJhBq+lMrpyHPhl+xDAJLVRdFEpUkPbcg7UAarRsV0tlcn79e/
	WFb2iwYDSF5bGAOijamMBpPmr7WXbuy07pT2o71wlhXBsfqSxHvyp/vNKAS74/qNAv7ui309vdZ
	OpeyXZH5uIFaeK3wxFXORYus+6uY6W9fWL1hlswYf/HbpSKVp9BvSj3fWtADCx6NKEa1iFjWbC/
	TgQ==
X-Received: by 2002:a17:90b:3b8f:b0:311:e8cc:4248 with SMTP id 98e67ed59e1d1-315f26d29ffmr11663497a91.33.1750950170658;
        Thu, 26 Jun 2025 08:02:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFdptXbuCusOcSSm1v4l2+op7oqmsQT4Ib4rFlDAj00T7SkOzlBe2kguaZuOM+pV5f/S3t6xw==
X-Received: by 2002:a17:90b:3b8f:b0:311:e8cc:4248 with SMTP id 98e67ed59e1d1-315f26d29ffmr11663420a91.33.1750950169970;
        Thu, 26 Jun 2025 08:02:49 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f539e6aasm4593623a91.15.2025.06.26.08.02.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 08:02:48 -0700 (PDT)
Message-ID: <3f6c106f-cbd3-4f9a-8e7c-e43b51457bfb@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 08:02:47 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [question, bug] regularly disconnecting wifi on RB1 and RB2
 boards, ath10
To: Alexey Klimov <alexey.klimov@linaro.org>, jjohnson@kernel.org,
        ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <DAWJQ2NIKY28.1XOG35E4A682G@linaro.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <DAWJQ2NIKY28.1XOG35E4A682G@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: dgSilBYg_ddXCfX4j0zIui1XBXoRQ_qs
X-Authority-Analysis: v=2.4 cv=Id+HWXqa c=1 sm=1 tr=0 ts=685d611c cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=sXrhvLzian3437fu5cAA:9
 a=QEXdDO2ut3YA:10 a=B0GORZ8-IyoA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: dgSilBYg_ddXCfX4j0zIui1XBXoRQ_qs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyNyBTYWx0ZWRfX5/pa95/2ugA1
 /PJu14L3ta0yFjDCnxfdE0aCrgnZh4sCj8Hmd6J+DQ8wE72xTQDPo0yoMOx1ymqJq/kpr671vkM
 ik1rIzVXmRDGA+mI/Hzm6Z0jsM+61FtH++f9nykYyxUIRavrIuPQWlXic5H8GWq5k7PR3jD/+D1
 nqGZ7K0C0qLXmx9IyVEy0sobgXowk1dxjN/Rl9BBUxUbTJ2L1f6uyl2xiEtm/ox4U7489dJVAzF
 xPPBKv7GYNa0AWnuR5MYSLryibz1dptDKZpGuCxSD2R4R0g+Wq6zCmVkbW5M+5eYd3uXYNQwbna
 pgBaA1MmjdaaPJ6xau6JxaATGb6ngumTut4954SbPJV20RxGhgYoL4nK3x4XZnWWCGmFS5OsYV9
 ey7aNIgDK3FwNuBbUJfRZOqJxWrlqeKz7+FiahvcXmVEwh0+Br9rhgmpkww2JPO/zS3f6r2f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 mlxlogscore=791 phishscore=0 bulkscore=0
 clxscore=1011 impostorscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506260127

On 6/26/2025 7:48 AM, Alexey Klimov wrote:
...
> Any hints on how to debug this? Any debug switches I can toggle to debug this?
> I am happy to provide more info or test changes/patches if any.

https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/debug.html


