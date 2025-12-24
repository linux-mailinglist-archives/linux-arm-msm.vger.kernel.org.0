Return-Path: <linux-arm-msm+bounces-86521-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 06783CDBC9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:27:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0EF2930056F2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2314232FA1B;
	Wed, 24 Dec 2025 09:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="job63PWf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QM/SajjJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 553DE330B2C
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:27:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766568471; cv=none; b=qLcyGFhnWEaCFMLO/8L9UPGZeiXUamdHEzB7rtbvnbUPiwKBkvR85FORxkBXTJXAxGFuVWG7WNT19koN5dq5vwrY8AUzpXQyaoJYa/VpieXbsviiNYedPoRmQbsSM92lC8eH1I4i9a5Bb4rNW3/ZKhNYvmOQNqXVZH7Nt1/0YQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766568471; c=relaxed/simple;
	bh=lXNL5q9gaNSpPj36uxWRj3gROc7Si5WiP0kyfu07z4Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nAgqbRLN/rhUVwX3jVcyk2b74AXA4OzPNLT8GrhrkPy99FtOKLca9/0OR1u1iCN6c4u3IjQe9xatjHbDJihrN5vbF6Ofwp9r1dXxDwNA1rbAKmFZgibN9Lg5ZBlGMxBXU21cUmsBxWdRmU5ao1V02ILhv/v5JHkxnpq3obGm9Vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=job63PWf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QM/SajjJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO7Jo4n1246312
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S2+UgmRyHEzuY5//wHuUkLGw08i4UoAdo8wyqHy3q5o=; b=job63PWfTtQ5McWC
	HEohs2DAU44x4dqyNo8QzarFgReu+4PbIiWqb7M/xf8qjpKs9qY4bIaBTDjvRMdj
	XafvlHrI+lfDixfR55FnPkNlLqXH1rO6wVDOR5zvTsOUR+LI1AQVJAv+d+/vhwjg
	rzo7fbkoULyfLvV5fiU4AsfWlmNvAaqnSLk43T3dYfk7ANMsLUkB2GqWUvCpW/SP
	BsVjzp7a/nyP/uPqItiEj9DCWZMCz4xo/9NVh4RkmQWDysCn1RBk/ZG8UEGQrhhH
	CXJ1UMI9ypv73b5wWvqAxlqUkg/AL/l6kSjGU3NGbhgqdp8q1P/O0kqmGvWzu3UO
	FkKZcQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7u9cu49d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:27:48 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed79dd4a47so122674561cf.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766568467; x=1767173267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2+UgmRyHEzuY5//wHuUkLGw08i4UoAdo8wyqHy3q5o=;
        b=QM/SajjJWOZ+z7GCUhA/lpORHeKsKIe/9r9rKHTFAaszz0+Mat1B04Y6O+livj4KW8
         JLy5GZ8i4j06ki4CENf/2FGVeGbyPkwhKGZXj8tCiOhxJRqe86YS0okEW7/XQKeFOdho
         3XUFR8jnOM1gJExEOY6PjyJVobx39/tM6uDnWYC98FGFt9EpEbXjaSdb4qdpuOoJ13R+
         1mcI2ggGw2ZhD4cQHYV0/Y1aSu4hs+/xf/ArHszM2CLm9dJuoHY50BYK3Sn0RPu6esTC
         EtecyvyOAxgUGlOZOg2qigSANE1hcqMI+fUax7Xrgz8ZYOn/t/a5caupQRonfy7OGAYQ
         wfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766568467; x=1767173267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S2+UgmRyHEzuY5//wHuUkLGw08i4UoAdo8wyqHy3q5o=;
        b=k2Uq/HoEEGgaCn/ymzuitRHKEv5ASyFD8ohmm/y+JGBHXL5fghysd/plYtmoU10AJV
         aWLfFkd0zi/idajvNqHugLzF13rAXoV66lKX3zfAJMjwn8k1m8xnFRhHl8JHmoNyWoFc
         MBxTK3oj38hyMZX+jY37BDx3kn6bHfa1QhCvsRX1ngyrgwQKMmzm1XN9aow4QdQzJLDK
         IeZar2aU3/bgqrpXiR02LYud0aBPwhlFXEeP24N8YIgRBM2YCLl57FP5QjkyylYzE+vZ
         +kvZKAmmMNa6mv4VGJ0fP+NRls3qJOqaTDMIStATStCSeXdYYGT8h76jVKo4mMxPG7eN
         +jtQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrcoqQnHzMPqhVfSqRyiRtJHnx3g7bfxfN5MiAGXxGyy5IhXKFeb5/Kt37DNJ2zMgRFqr36HTZc8CiQfbr@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwx+TTnUNV4Jg6iSGUqJFEcaUcsn3jAmw2Thi6wvPUUPcPI0gV
	APL2TmcZS20iliubzdlMgjz8UsH4Hmmp+vPnvxsMtXwfF47Z4vrBwOg2mLRU51GHGU1ZF/rcn0V
	Xm0e3NIoPbViLkRfa0nYBUEEHcQWeSjZHrbzakX9e06hoXqnJlPdtEZRToDAIufm+qZx4
X-Gm-Gg: AY/fxX5+KXaXsK6CA36lrs9Zdhr+0XfP4/nV/UaHKi9IFShEh5aMdHjt6uYwu08+hI3
	Xr+GIZRP0pynwA9nuRlmpYhG655+InwFUaBEu6hGpQZczrXpzv/fDjAbQYXKx04reru9LLCm7qw
	L49Fs2BHQa7nqozyCu0+t9flHeS+FJFcyLZR2KvYY9DUIGCo4yScG68k0MsfVUcoDPMXBGma5AP
	m2HkykDPcwWosLdjfd+vO360KyoLaVaa7pw1063RepyFzEfKpCuCUbcSGeIFBIhPzbf9pnTIMbj
	uAbgleGDLZQE/AaPpxBzrv4S96kAgP7vBTpswrKOkV7tCNkQlYnqnboR0+Y0/lmZHATxxB0jPeR
	Z5kEK685Yog45OHKlErOCGIkwIrpJ5jO+iFmTVKHSbSNgUsuVLQGTkx3tcytp/bZI+aWRFgmRnX
	pP0WbQGxwiU9Jk9fSdgIsDPXo=
X-Received: by 2002:a05:622a:1e19:b0:4f1:b93e:d4d8 with SMTP id d75a77b69052e-4f4abdb52a7mr242651991cf.71.1766568467380;
        Wed, 24 Dec 2025 01:27:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGIKNXajyePpJU7X8UHXbYrzTli0bpeChd2Z0MIo3yKFTwjZi7V2JxmdWBUX5NTuC3RQJFXcQ==
X-Received: by 2002:a05:622a:1e19:b0:4f1:b93e:d4d8 with SMTP id d75a77b69052e-4f4abdb52a7mr242651861cf.71.1766568466930;
        Wed, 24 Dec 2025 01:27:46 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381224de761sm43606051fa.1.2025.12.24.01.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:27:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Jun Nie <jun.nie@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] drm/msm/dpu: Revert broken parts of the quad pipe support
Date: Wed, 24 Dec 2025 11:27:43 +0200
Message-ID: <176656845705.3796981.11555430286508569316.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
References: <20251219-drm-msm-dpu-revert-quad-pipe-broken-v1-0-654b46505f84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: al_D28PasARR5gtujygvIGR4urmm1Kyk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MCBTYWx0ZWRfX/mpEHtj0h9kD
 UVaU3mthoEwM5cS0D5IWcuwFxfL9weCUgziNCqA/OPBDIUITL+JTmEygkar6+WY/bnyBPVMsdSL
 XQ42HRpSNipfVtq1k1JSS5NT0HZkfxTyEh5tkCP0COrFAxaaBtY58Ig7bn/Io5ZuIH651uF4h7W
 kwniHXiTTmSisLZ9lNKvg+ZQ3fvWNxWdsuqiwiwiABLdYzQPYkuXosa4/VpwlQZCGsZWUxLUW71
 VxZJRUxzRbkob5PinkJpaW8XnICuH9mV8MPBfQpW9w+y22dX9H4ufUNMFxqhT1Adr5O7cc9ZajX
 zTff78PIoXFZIo1k9gu39JtXmxqWGFJzDBlY/XaBCliOvG97iZ96ELb1JIABIORh55ZZvloKYNx
 nnZxxHT0x1QYYb/cAAux0Vn9sezJMo6GcTJfnJkwjoE/xWTq6wO7zmXKZc+0kpUAYlj2bDAm+X9
 /ncZbQV5HF/wmcpe5cg==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=694bb214 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=97QjG1G37Icci1zzKCoA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: al_D28PasARR5gtujygvIGR4urmm1Kyk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240080

On Fri, 19 Dec 2025 12:39:00 +0200, Abel Vesa wrote:
> There are quite a few reports off-list that, at least on Hamoa based
> devices, there are some IOMMU faults and some abnormal artifacts on eDP.
> These have been traced to the quad pipe support introduced in 6.19-rc1.
> 
> Meanwhile, Marijn reported some issues in some dual-DSI dual-DSC scenario.
> 
> Off-list discussion concluded into reverting these two commits to avoid
> the described issues.
> 
> [...]

Applied to msm-fixes, thanks!

[1/2] Revert "drm/msm/dpu: support plane splitting in quad-pipe case"
      https://gitlab.freedesktop.org/lumag/msm/-/commit/35ab5123bd24
[2/2] Revert "drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case"
      https://gitlab.freedesktop.org/lumag/msm/-/commit/da9168d8ef1c

Best regards,
-- 
With best wishes
Dmitry



