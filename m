Return-Path: <linux-arm-msm+bounces-87750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C72E7CFABC3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 06 Jan 2026 20:42:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 921923115794
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Jan 2026 19:05:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE47E3590D2;
	Tue,  6 Jan 2026 19:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C3a054qM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N7bkBITR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 576CF34F484
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jan 2026 19:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767726343; cv=none; b=h5W2plOZXUVUNpZOZIQcu4pUHXNcus2vA1fX7k5fiqnb0XnhnOHa4OXAMoGDkyzRAE507yb53WPLAdwze7CVPhyrB8zjBTIRT0BjV5e6nG140nWVeLVD1FEV7wh6MPsPtzoe4k7BMSie6ddm/6YYEMSJdDZZfNappjLorZIVRxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767726343; c=relaxed/simple;
	bh=Jof7jOFgcaRLMomwqn8p7+/6+iRi1m/y3bzTdQIGqlo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvzWijhE9VUnWhO9QOaOy9m+qKR5kkiqi5KmU9U6uyxx4phXnjzSzZ9LkXdoEcs7wDnmYtmxPxkqf/j9RusIzpPI22OF0vPuGWwhrNvPDO+YpnbVGmxYs6c1/56MBPSDtvpCfVJIcXpDDbPWasz6HN+Tn2EBQXKWVE9QogLKPY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C3a054qM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N7bkBITR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606H1Nde822621
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Jan 2026 19:05:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=PnExPef8cl/W7C0NmYsrDUDP
	tkQ5SmQs4VU42ioQmqk=; b=C3a054qM8LODfGtLZD+57WqS3eIH7oXSdPPghxd5
	UotksFkshR91fKLHfFh033KVU+/kWbj9eVnbLnN612DdvW/tHUIXTYeA7gF9jcdV
	8wI1odCLe5DixtvI9iUSWc7D8WnW68SB/S5Uvb7ahtWHiYq2DXdeaZ02AYomc5cd
	DBo6tL1pfsKj+OUtGXNTJarClZCXK03HFPdO1mUqvzOMNQBWRtn3dr3IKiAtHpnK
	xUgocWHEc6b5vn27YQ8eLYWk6a8261YTwR5QYikajjFvdt0ff87NgkARzSHFPbiU
	VtpvsJijmjV53PHJ4ducGOqkTmd6QPw4S+ByeHm4Wsn/cw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bh6e80d97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 19:05:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4ffb4222a4eso884721cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jan 2026 11:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767726341; x=1768331141; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PnExPef8cl/W7C0NmYsrDUDPtkQ5SmQs4VU42ioQmqk=;
        b=N7bkBITRKRLfqTbd2C3rlsDwyk5EGWB1XwUb4CX9YuZGpifpoVqT5Sj08pEM+5mmvn
         iT8DuoFdw7VtM71/f4rJ2w9+y69qrsE0ho9iNGuO2TwH4CSOzmLHZPj+NhJzV2C9E5zm
         hjRLfKWvL1OYGrlCUNXOGBUi0Jm8Td1I/0TocnSTBOToSACFRMB9Zz4hC61kat70+O9e
         0Rx/mrvNY68yZWUVOFBwwlvYG/N5EXent275IqxgOX4z2WPDpnngkSRkxmBOBboRxwuQ
         cFJ+zt+NFpk0f6878GHtQlvddSiwXnQl+r98i5wJZWUwZOHJOVuT870MZLeJ8OxvFuRr
         WQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767726341; x=1768331141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PnExPef8cl/W7C0NmYsrDUDPtkQ5SmQs4VU42ioQmqk=;
        b=v5/pKBNzan9OHVf+g2NJW7d6LrVKWraE/q8AwQmnn4IRWaZwXFbPt9xZc945duv+26
         3fmHf3O2qwpUKK7h66E1PUiZtUEZnnw3hCHeJzE3zky9Va/qeveAm4RXdxdq/sLFbmhp
         9DvcEZWvnC9ZpZEB/nU4CYp9eAQbYQBBuEczpVIxFwtRSSupa3xcNsyZ2xy6/QVSMRGK
         FifbA7diUsNkI6BGyafp7+7+5xyL+j3Kv1aaWjppOs+j3bn8lxpyj8ht+H6nP9HqOmcv
         jX5exRF7We927S3DAwKxyZboybz+83LP3Ze0NrWVy37sxoDgNtIWT51rMZWFFKwPgBJ9
         kGTw==
X-Forwarded-Encrypted: i=1; AJvYcCVJGtKmx4lEExNrmDTN7NJClYo9wBhx/OaVu9bDBXdV64Ujjc7fJtu7D6Roxnth3FWGeu2NaCWon+2BNOdo@vger.kernel.org
X-Gm-Message-State: AOJu0YwAl9MMOVfBwkv2ebb7n+CbF9Yi3x1Js5hYDfvpsl4ivVrpDfOC
	vVcNvbiZq1kh9l/7pAQBIaCBRxg2k/SsvG/f3eJGaujOpDhleRfoM0UsmsdQGq230T7RGIvt/1e
	5UlNhph23TnOSfYNNPFOTIzvAJ8pTsdm8LnRwPQys0Or1Kgk4Jt9tYDx934BbhVXNw6/a
X-Gm-Gg: AY/fxX6DvvUdnGfl1uEq3ZgG7B8vZfhVRs7zKIgw0m5t/LcVISeHuZk+C5uPIMPpH0q
	J83q5doIXAFiQTtkX3uzVu/8S8KCSG1ys+1WlDssAyvctb+nX+aFTYgGBUJvVdZEf87DK+VIS/d
	G0Y8rmzc2ah7VrHfo4+2IV79QXsGD7QB+ob0gzCf40GssngTyLDf1HnPR8cJ0XuxLVXg7XVFsHe
	v7Y1gJQ47W+6coyG3sKbL6lrIuG52ikCHbiBB8rRqYpTGafYjbINGxoG0dnaPBKex+EzkIOtDld
	PlIIyTRYqmxAMT9HJoFfpQxORYJOPSMtrCVCJ4ffJ8kTa4Qd6pIM8Whx/w6I4qBcnxpQZn9sNI9
	7Kd5cadsPpOaCZCP6e/MD+KLdKMXX4so0cF/cJ48FbhEw84xSK8JHe2W02loLKFV9jGvGoA/qqi
	oLCxdi7deCabT5Sgf80xO7onQ=
X-Received: by 2002:a05:622a:4184:b0:4f1:b9c7:18e7 with SMTP id d75a77b69052e-4ffa769902bmr53511741cf.4.1767726340578;
        Tue, 06 Jan 2026 11:05:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEVpXiBpqgf+IvbViiedT0amY3frlnLBZ1F6bvBA99wLJJveEExSGo3UHoQQSia6uOOo+1k3A==
X-Received: by 2002:a05:622a:4184:b0:4f1:b9c7:18e7 with SMTP id d75a77b69052e-4ffa769902bmr53511181cf.4.1767726340003;
        Tue, 06 Jan 2026 11:05:40 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d0d22csm762779e87.37.2026.01.06.11.05.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 11:05:39 -0800 (PST)
Date: Tue, 6 Jan 2026 21:05:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PULL]: Update firmware for Qualcomm AIC100
Message-ID: <7bng2llowofthbhuagrwnmh4mt2xliudmtyjfinmd6pj2i4vvv@sigtzabqdeof>
References: <8ada0f35-9663-4932-b7c1-53c00f3cdf92@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ada0f35-9663-4932-b7c1-53c00f3cdf92@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDE2NSBTYWx0ZWRfX1OS0O0QKKlqR
 L2adD9Cg9wc8vncl75oMrmDEkep9Jb0tAPp7hcq2k8sKKKIX4hUbR0abPF+GT4+9Zq+DkWchOtk
 eP32t+4y2Eyv+lUc4WNpXVMox/ydP/bYoNA9LoZhWd9g+y7gPEFJB1eRNod5IfW4J9R6WkRZQD6
 cLDeT98uPOdgMdnVJq1aSyX+fPVSfbtjsShydpBcuMbP/PMs4FJPwMcVmspKPKgZceWhwZC12RN
 3L1kdKnP+9Z94stAmHf8wseaxZEjAtMrgAUSaRStCnAPzRAMZ5WQG9s/ATxofzOa89WSnQUn0xx
 EujFA4SlOEHaCF4pqzlpST8iYTyAOdBR5aGtPyNLbduuGAKn3eZeLuckFrSriEiahm30m9XRD7y
 E7cyfK7Oi5cauLbGHvVTJTMhHPQExmLbv/nx7o/ydWKADxjXIZaQX6W6GN068b8qY7oUwOOlUxi
 ZIYlPqmdPT0feeXKWfA==
X-Authority-Analysis: v=2.4 cv=F45at6hN c=1 sm=1 tr=0 ts=695d5d05 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=SlpdmATz_RgLBfTfWzQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: 1aJ256I9a5EtfCe97sg-PODh_SH5SBDd
X-Proofpoint-GUID: 1aJ256I9a5EtfCe97sg-PODh_SH5SBDd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601060165

On Tue, Jan 06, 2026 at 11:39:50AM -0700, Jeff Hugo wrote:
> The following changes since commit 61a76356fe7fc29479fef362abc1f47bb40eb52f:
> 
>   Merge branch 'upd-wcn6750' into 'main' (2026-01-06 15:37:35 +0000)
> 
> are available in the Git repository at:
> 
>   https://github.com/quic-jhugo/linux-firmware aic100_1_20_2_7
> 
> for you to fetch changes up to 3ff97fca3cccae8c68b14c3bfe9785f25287bf1a:
> 
>   qcom: Update aic100 firmware files (2026-01-06 11:25:03 -0700)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

