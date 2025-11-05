Return-Path: <linux-arm-msm+bounces-80447-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A81C35913
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 13:12:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7C3501892F0B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 12:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BED5313E18;
	Wed,  5 Nov 2025 12:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EBgt27An";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JuK/1PZa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788A4313524
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 12:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762344714; cv=none; b=AXfn2UBI49q/+7gJdEp5TJwGICjiWhk2QUP73lK0I8nS7f9yHcPQ2NWhNasF3TVBJ3u2+GhPmG/4Ia+lkrBE+JTC1reo2hM7+M5x6wKeTMKMht9lSsFFLRgEHhgkwCloq7gKA6NxgEowC8qQ15djc+mtZ+hs0A392NxKZGB2zlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762344714; c=relaxed/simple;
	bh=wz5ENZt5Ic8O9QlHYo2XewF50GZ2Oa7k4QWZhPiExVw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEl3cMVGLwUSEIX8h2UKAmgTk05soB2gPO/7XzDZL6Tt4sCjmt2csQJRX+y9Kn0TS58pMJJUkOrdsyEUoIjMCV/pQN4qCApX69kmAULTUbgiOb4zXUl+S81JUgfyn2RmpwfCkJ/rr+NHr73SOBIIbOIGIMJOf5pAici72ld+GC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EBgt27An; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JuK/1PZa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A59A17K357110
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 12:11:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=snsQD4l2AXcjWmxN/fszbJ7h
	2kOikH95rE3CwRz2zUM=; b=EBgt27AnuOFLD3tZKyOpo6xD83u9A03VmGfBkMds
	lb4PiRYRzac2NJUvXa25gcwayfM/C83TuN60XmLEvyvKWPb2RnxBWFVfmkAJvjc4
	IUzvWYXBTaE5fvYx1WplcRSpt2ajYXpCQtvuGYakjmSqw4Ct7cS9dWTA9iPgrsni
	plxpBkZ+XqA1YbobP4Ez1BIiNFmpwJ5vF84rpnN/Iy6iAlUPD9+Bbqhl57qvKe0t
	Gmf4VZSy+E0KqIwbt8qVP8wFpIksJPSQJStcFGwGqKRUz0NZR3OUohHptKpVtxmD
	MGYVGPJIzmsEgR5KIPmxdDujDOY4D2mmAbF0gW2bKlU9JQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a83q5gfm5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 12:11:51 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-29598910dd2so77779115ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 04:11:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762344711; x=1762949511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=snsQD4l2AXcjWmxN/fszbJ7h2kOikH95rE3CwRz2zUM=;
        b=JuK/1PZaEeaFxAxhp4ULGwfAuw30sVqZx9YrQL80IrRkw30XLqPk5uZjyWBxLjF2Ku
         pRoHmhk7bbWZmDGyDwHuvdkqLon4dF0DvBQPuFWXBx8TZ0WpAkIdoaOS2LV+im3BXEkw
         YsavRANfyCgr4vcHCguCw5xQEJCHRVRwlf5FLFz3NVR0QH2SjR7YZLHZ4trIIkeBzy24
         bYeJxwaleM2iRpsFpwvKQyw85Ir5+zstwL/jt7q2qt1WAcM1UchSEm7GvZ9LTtPRUMal
         FUZSM2hiKp0B2fcugI0riFu/aBqpFv/C54F8EVHdvPavAj/InjWxt+033HGL1D9UufPW
         nn1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762344711; x=1762949511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snsQD4l2AXcjWmxN/fszbJ7h2kOikH95rE3CwRz2zUM=;
        b=wbsslcLOOIS/c0RoG7Qq5MTNfKExvqikWoy8MhG0dHrAdU9WpxaEa2NfxHhgk4TvF9
         0TQGT5yqWuGRABBI6VPftRWG1ZW5oWufmERaAL5+ZmGwij49RtjNsNP1jL7dgwp4H0Za
         NSpQ7EVV1mt9p84jtbL1FYRxL2QX/9mj/Dwnfsw9/84KEXukWX9uT05GNydRYwaLW2zB
         N+7DalL18il4O8DODf6PWMZRKGZQUQ9sZGxUeWQA09LCyGbaFG9PZgYsc7pFSsRjDi8P
         7S9hm1xtgXofdjAfnIQNHDFGFqVg/GHaQAoZ1ScfzuoqYrLtvZvvpR9121PXQ16rl1YH
         OI7Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4xrjP1Mus7X2flErs4dzdAXgW9IEMt7XfcAB2Z5eZ440c7N0ZWapMcG0DEuM45/zeNnbrHe+OqwrbSSsO@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdz1KGgHqcC8WUHSC89GdXUa6S1qUQ3I4HgSUJhbh0fRMxE3Xv
	QOWx+FOGk8CcycaiWwpQC+KNmnvvCV7HUA3Jolxr1DrnwaRUxU90kjsld15N32y2m37XxAk2TJl
	Jk0nZazdltngcz1BEsTFyl8Ahc5IQvrwGzl8LEScwX+vcTAqo8cRZN5kzIcYuqN/2fwPT
X-Gm-Gg: ASbGncsORJueg/TFZP3tromVK7M8FmJEvvOGaGbQhPD985c6M2fIBS8DwiE9iwOrUP8
	k/3P8LAP1qMplQeART7JWy9FHUMt+uGZJX8hgXVHK8Pvp0/mF3ZiH7y9++x2Bv7BpfMz4v9zwBB
	8wag/ZIUli028R0q8KzRgEpo9IFDYmRVth0e2q7RPERV2mFnpQboxmhRy180FWpoEpuhlU4NZ+d
	G/hwmRC8uBCwFzKDjxbCN3dYGM2KkhVcubos+RTVoGLsduShWhk8h7GBNCESmK6HywxVu+E8T96
	9c8KeRyz2KPSiTPGPs6F4QWqzPOza1Mxjj+QQ9/OJPx+sBEIY87hKK7cQJl+okXlJ5fmgJ8jVmz
	y1SEH5KiRIu7awgWwBXj4NnWtg5egzn/S
X-Received: by 2002:a17:903:244d:b0:296:3f23:b939 with SMTP id d9443c01a7336-2963f23bebbmr12373345ad.42.1762344710499;
        Wed, 05 Nov 2025 04:11:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiEWa0ffKN5nZV90leH7AWVaVvhnOx2CMq8Af0ffJqTrfJblGjM9mAfQcc/g0CeJMjYVL/Ig==
X-Received: by 2002:a17:903:244d:b0:296:3f23:b939 with SMTP id d9443c01a7336-2963f23bebbmr12372795ad.42.1762344709954;
        Wed, 05 Nov 2025 04:11:49 -0800 (PST)
Received: from hu-pkondeti-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a60ef0sm59997125ad.83.2025.11.05.04.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 04:11:49 -0800 (PST)
Date: Wed, 5 Nov 2025 17:41:43 +0530
From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
To: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Hrishabh Rajput <hrishabh.rajput@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/2] soc: qcom: smem: Register gunyah watchdog device
Message-ID: <729d0806-0f92-45a3-ae36-307513f8b808@quicinc.com>
References: <20251031-gunyah_watchdog-v4-0-7abb1ee11315@oss.qualcomm.com>
 <20251031-gunyah_watchdog-v4-1-7abb1ee11315@oss.qualcomm.com>
 <nnq34bfbbi3satxiqzaouy5pgi3obyqp76avh2ipyqxx6w67td@e7eqehjq7iww>
 <40a6395e-26f6-4bad-88af-d89479b6fc28@oss.qualcomm.com>
 <abicharluq6bm7gbngkbdc2hobcfifcmazh7oukcoufsrpcpse@ml2wccwe6s7i>
 <599188b5-cd2e-4667-a91d-04cbdd62cecb@quicinc.com>
 <ykg7mwgncmvdap6xzyhmgxu6ur62zzfk5nd3tqrkivugn4w474@rkazrlhwbhtj>
 <2ef1d795-5cdd-4465-9333-16a02207a806@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ef1d795-5cdd-4465-9333-16a02207a806@quicinc.com>
X-Proofpoint-ORIG-GUID: IPXoRSlxVSpTrrIYUHTyNUz25c3CtFmU
X-Proofpoint-GUID: IPXoRSlxVSpTrrIYUHTyNUz25c3CtFmU
X-Authority-Analysis: v=2.4 cv=YZKwJgRf c=1 sm=1 tr=0 ts=690b3f07 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=v0qggLAlYnFivbKH520A:9 a=CjuIK1q_8ugA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA5MSBTYWx0ZWRfX6J6xttf7tC9M
 wUcgVHcnYepcDMOdIrvCkN/65AzlHM6GlxYthbjxxtvXgP0L1a6GmNVBwRBZRl4QJUNhuFZaI+u
 naoEJhxDmdmYsLFm++EFX0ulZKBvsjJfhtsTiIlc9+EZk+26ADbkouV+fNZyHH+xWFZSqA5toVj
 0tTKVI1ClWtQj4L+kWC/iijbEDUtmK455ThQk9Lty+E8s5EHvYorhP2iwuQaLqNw6mzmChqDhC5
 WqgVhL3UaGnUBA5IZnleBBYtA0Vm35lvugLPGAAmnhd4hib8jtBnMmViBtrl0GsPuKx7ReSN37D
 Cok++tkDis0ObJ/mokB7X0jivgP2eAmM2CNScGL9MQ3C4zNI4CpbalJaKUNkAw/Nh2TFep8WBFC
 xs/Hky9snSTEWYHpkL+54PEGGcNR7g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_04,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050091

On Tue, Nov 04, 2025 at 10:33:52AM +0530, Pavan Kondeti wrote:
> 
> > I presume if we determine that Gunyah is present, and we haven't put
> > sbsa wdt in place (e.g. during bringup) Gunyah and Gunyah WDT will
> > handle the outcome gracefully...
> > 
> Yes, we are told Gunyah support SMCC based WDT even if it emulates
> SBSA. Most importantly, we have STATUS SMC in gunyah-wdt probe before
> registering the watchdog device.
> 

Thanks Bjorn for asking this question. I have tested this scenario on
Kaanapali. Since the initial platform support patches have added
watchdog device, I don't see gunyah-wdt platform device created. When I
removed the node, I see gunyah-wdt platform device is created and the
driver is probed successfully.

Since this patch checks the device node presence via
of_find_compatible_node(), it does not cover the case where the node is
present but marked as disabled/reserved etc. I think it would be good
to add of_device_is_available() check as well to cover this case.

Thanks,
Pavan

