Return-Path: <linux-arm-msm+bounces-41778-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 504089EF029
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 17:25:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D052817711A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 16:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F3F521CFEA;
	Thu, 12 Dec 2024 16:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GY8OzMgJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49A8222D7E
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:02:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734019322; cv=none; b=obAY8UNfo9C2W8yzD4vK+l6It1cxM82+zj+rwIIQSU6YbSrXMl33kEa1XzerIeSiOhlVCdG7hHDvRVR5mG/VAZz60O7s2kTaUILaAZ9cPrEPK/c5B4bYIPc0QtQNI67+pGUPP9NC2gX6idZuhD57jnY7gLK5GBd0BQa5lq2k4zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734019322; c=relaxed/simple;
	bh=zi4tuYRD5hSXpcjEPi1OhVKb0cCWM56oJRj4xq3djks=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PNPQ5Fdxncxr6X6zy/k9xxadkuJuPQh+Z8K1b0RywQ3ZczrmA4UH8SE1lHIXwC/+jK+vOXWLazewF8UakCGTne8Q5pgjfFtA6e0XkxnahgAB0V+jzo6NT80vKK1IsZmfJUkEl4ElhHCClAxR8qe0UGlYBaGHbyHYp5ZpZO03bjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GY8OzMgJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BCD6Gfq001463
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:01:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8jRb7sUG5+yNHAfGhuXmpuqzNTSVGIJ56yhj48fgrSQ=; b=GY8OzMgJcVa2YaFH
	v0LQvmhTJhUOWeXXvIb58cxTJjhhRKqwAnESwVcGN5ebt+Nwbk0sV9Gx9RAgdznj
	y91PBKpX3DInu+uRoXQ1iB1NkNAwgIfYUGTMpsyNogK3o2ZVeqJTYLMLUFGT1dH8
	cjperDlYg/qCpAiStD2bJbMZI9WsSIqG4mWv8G6mfV6DlliLcFtraw86Jxe24gxD
	aBbN1/WDM+aOSpFzneAW/FDHmUvBYqr5jKYbQve48QZzor5800z8QwJV6dfn4Sk7
	rxAuImNWS3P+j4j3MUbM/CdZO7G7KqCSm/VGVvQ7DSGqqTDs8b7seEBHBvrzZVmk
	hrlD+Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43fqes20m1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 16:01:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b667e652c4so4732885a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 08:01:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734019318; x=1734624118;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8jRb7sUG5+yNHAfGhuXmpuqzNTSVGIJ56yhj48fgrSQ=;
        b=ZfNE8CxR/+w7WpBDaaQeA5JB3nrvrMIazB6PLha7yUaKcRYPG0TBqZkZ+xLQ/rAZ8v
         43OPtRQO919pJyBCdcoZJ5CwT4q2qwiqUsy8vUUbJI7zoDw02EK5wR12l2P1vcKZiWP4
         XzEBIm9MV+QormCQ/8btak/gIJ9NyZ67vaEsPd8qrycwuUpVPGBAy460FMZCLuX8Xw4N
         bCG9UJaDaUpfCC2oWOgyetST867LuCMJAGUbGiVSrWZXxlq5raPhId3h8FKWuQnrzrQ3
         ynRCI9OKRxZlnHyxHZw9ESAl4pSVrPxU2BPfiBILNumEBugR5ewFd7VER5CtF1/Nwevy
         U3Jw==
X-Gm-Message-State: AOJu0YyFs/TCiGG1cbpWeUp/WODXWXfycCxSsRauqTNPoDy6cI9eDZW2
	JAIWuK9digJtD6FGeJIBJHylYkdf1zRZbS7+WdR3eTyEAUq9U7BRLCWW5WtszHPd3oglD65oPX2
	1FMYiTr2T6/sub/FwHEp8dfS7yuU32THXHCc3+VX1reljz0pPDN+dCaWY5/WgIMu5dE9zdewQ
X-Gm-Gg: ASbGnctsC+MI0eS6BGIj0e2geGOQDk8pUqk6+lpVQaYo0OKDrYxz2Etvh+k9aGpqzaU
	ktNTAMcPeruAYjki7tXcUn0s19alhHe37MBgxPJZp6VrSTruBOvFXS07c9lkQcPww4dfaBJtt1h
	9Y9sR9VBI01worz3TqnXaTS3W2cudx9qSPPcD+WprqpLcCni3Ncx3v8dA1+0ADkrzSD5awbCALL
	io4e4c8b5HQ3rIvJgsWZCnOTxSz/EytrFusMM5g6rKGzMYQIYWmAPUAdNfuKI7dmAbnmo9wBXYc
	TLKpzm/Z+y39UzVPWZDdz/uD0UpyWd+dO4q+DQ==
X-Received: by 2002:a05:622a:199a:b0:467:5462:4a18 with SMTP id d75a77b69052e-467a13dbb86mr5936831cf.0.1734019318453;
        Thu, 12 Dec 2024 08:01:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFH/jbHZAn9bp1+beKJAw4LoLmgSRLz1SH4GPxoJhmvK2c15pEtJxc5HWmT2KmjN5x2wJylSA==
X-Received: by 2002:a05:622a:199a:b0:467:5462:4a18 with SMTP id d75a77b69052e-467a13dbb86mr5936491cf.0.1734019317895;
        Thu, 12 Dec 2024 08:01:57 -0800 (PST)
Received: from [192.168.212.120] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa698a9b74asm503113766b.140.2024.12.12.08.01.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 08:01:57 -0800 (PST)
Message-ID: <2397f125-5173-4929-b4e8-5976203c210a@oss.qualcomm.com>
Date: Thu, 12 Dec 2024 17:01:55 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smem_state: fix an OF node reference leak in
 qcom_smem_state_get()
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org
References: <20241210121955.992519-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20241210121955.992519-1-joe@pf.is.s.u-tokyo.ac.jp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 4_rLGBxG3epAa5hHG68VTrCh-176DX-m
X-Proofpoint-ORIG-GUID: 4_rLGBxG3epAa5hHG68VTrCh-176DX-m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=895 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120115

On 10.12.2024 1:19 PM, Joe Hattori wrote:
> qcom_smem_state_get() leaks an OF node when args.args_count != 1 holds.
> Add a of_node_put() call before returning an error.
> 
> This bug was found by an experimental static analysis tool that I am
> currently developing.
> 
> Fixes: 9460ae2ff308 ("soc: qcom: Introduce common SMEM state machine code")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

