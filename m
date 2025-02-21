Return-Path: <linux-arm-msm+bounces-48972-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D9B4A3FD64
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 18:26:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 26880425DF7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 17:26:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36DB424E4B9;
	Fri, 21 Feb 2025 17:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lPVUzs/n"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85ECF2500BF
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 17:26:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740158802; cv=none; b=cN8Xl6DYuSWLkOP9tSMP6o121YAVc8AGdbUptHdTSEBu00DTcAncOT4N/lOFsdW3UJ3lD3aElQWixVRcygnQVs0AdB6ccbVY04ceN8Wof/URBZWPyZ36paY39m+lvSwU8c0b5Yx8Nj2JEOrku0+O0kqsw5ufderX2QPQ8dtdYb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740158802; c=relaxed/simple;
	bh=Ph7USw0ImrV5OFwHbz8K6e0gEHJSchG1R44WBELJdPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Vyfh812AcQcVl+P/U1BORiB+cQ8406NsTXLbT8OEAaSiIvwC1RJ8wmPXZj/JXzFbSRkor5onO8obaJEGWQCTFkbBXcRqeozCUcT0zxPJHW8q2j3drGNdiCvxWH9I7ebCiJVlgjr32kmqqZGt5TsH1RbACJ4Z9IHGQNoB+S4yA20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lPVUzs/n; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51LEwDam001838
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 17:26:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T5ynMRmaq5n9zwwwNcuq3LdcHoh2ot5zXwn+qCbZa9s=; b=lPVUzs/ntpAjnoAO
	gJ/UzNsf3qRMWaFpWZaYkdiRL4ZFuscGlLi5GkxQPvRhUyLYqw2P+x1LVLBuwqZG
	DN6kxBOr1qXgdrd+DY/lbolsajdvajjrhamBAzlAE9ONhiXcfgJ6Ikpomau+sbdM
	R4cChQP74q99o7nxJaYzuPOWBpuLKvhrL1V8fzPZk8UF3v7IgHeS3XZSe3hweux/
	pwcvDVX9jFQF2DVS9bEpDo42QOk2w7RV6N6XmkHLPWOR5Rp4EJmIS1DjzLUXcipx
	vv4kNjmKzpGyAqDbZ3+HyTIom2bRZemRsXYD3NexqgPhe5RQhLCLvdj/VL7vjwaT
	CWlhrA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy2jr84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 17:26:39 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22126a488d7so55042525ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 09:26:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740158799; x=1740763599;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T5ynMRmaq5n9zwwwNcuq3LdcHoh2ot5zXwn+qCbZa9s=;
        b=Gfa9NBLZTFkIpUpxLG32g7a/LUZRjkTD9BOYLmSIbQ37UTPFSUcKGwbCR+a4J/0L7f
         K2ho1cuwA0ko2yTkdeh7xPXneBQ4LOA471Wz4eqADqTo79LmtqAChK9o5z3ZpEO0PNa5
         iVc6i6OFsT9O8e7ROMld5Jury/Aic/TIczBomLtnsCR2VqPy4wkAFshDrpekivPBFOci
         XT8RFrF3rFlvmWmu8aRGl/qISi+1bkqlFqTrCXdxl9NzKhIrDubVTh9xzoMN7iT0T6sZ
         SnGN14B0fCWaAs+wKOspXLlhGZ25AqCiRoNsDPkKugQws0uJowypsPAxOYTIySYMtUeL
         9YfQ==
X-Gm-Message-State: AOJu0YyEy21aqyWlBuOa0u5J5Zs0vvAq7+dpVSQke33qbKnrK2R/JDKF
	79yyILO1CMXG9uV91pRkCmMPSv3zZLzYEoEsznywEE7e+VaKJSczX8R7Gri5Wiau/5sekJo+a5k
	7d89At1ETE6IV21cBYEVMtVbzp8Wkm0izMaQ/nVmlk+V5vCn/ghnJaSPOmhgaCpUTWjIYlIx4
X-Gm-Gg: ASbGnctkwTjufoMpOi+va3JoPBCnw4Kka37W1O9UkCmGQGMP6rB3SFYF5cPTtEOkmjs
	qnP7Z4lz430VisEz5gGAzzsvSji+3SWRJeT8Y0uDCnj/Q2Y073hQfMloxdqLFNE26qiStpFCek4
	jk6Qw/i585Z2V96sfgfRiB3Tv9ltht9pw/0i7JdTUkgyEfkohW4JwfV8mpYGzI5Ry5MyelrWtzO
	2EmqT5M5iXLv+LUlphxbks1vBy0NAjt3NKEs17TP0/P7qf/rtJTIRvMavID0mhUNrgN9T/1+jYi
	n4ivgUk5nuyYFQ7GmixFoEegnHdLRK86XTS4C5tc3O4VwynQ672E7scEFsUGAtQOZw==
X-Received: by 2002:a05:6a20:3d89:b0:1ee:e785:a074 with SMTP id adf61e73a8af0-1eef3b1fc42mr7610289637.0.1740158798720;
        Fri, 21 Feb 2025 09:26:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAvLjLEOT3k5eU+kwjUYn9QMNPwU+VKGSKihPzvcJYaCuOS/5cB5+9Dgq+to9a/pw7RBaEZg==
X-Received: by 2002:a05:6a20:3d89:b0:1ee:e785:a074 with SMTP id adf61e73a8af0-1eef3b1fc42mr7610242637.0.1740158798226;
        Fri, 21 Feb 2025 09:26:38 -0800 (PST)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adc7e4aa183sm13131316a12.4.2025.02.21.09.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 09:26:37 -0800 (PST)
Message-ID: <21fa7a70-8c35-4e28-8d09-e7dc71350b4d@oss.qualcomm.com>
Date: Fri, 21 Feb 2025 10:26:35 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Update my email address
To: quic_carlv@quicinc.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20250219214112.2168604-1-jeff.hugo@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250219214112.2168604-1-jeff.hugo@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -OqwhI6sP34XUHEwHXQWPxgfhw1dk1C9
X-Proofpoint-GUID: -OqwhI6sP34XUHEwHXQWPxgfhw1dk1C9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-21_05,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 mlxlogscore=834
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210122

On 2/19/2025 2:41 PM, Jeff Hugo wrote:
> Qualcomm is migrating away from quicinc.com email addresses towards ones
> with *.qualcomm.com.
> 
> Signed-off-by: Jeff Hugo <jeff.hugo@oss.qualcomm.com>

Pushed to drm-misc-next

-Jeff

