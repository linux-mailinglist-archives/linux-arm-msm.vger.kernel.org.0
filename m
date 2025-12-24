Return-Path: <linux-arm-msm+bounces-86525-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CA680CDBCCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 10:28:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5EDEA304D55B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Dec 2025 09:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4195330B3E;
	Wed, 24 Dec 2025 09:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B1fEX1sF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bYvdKYDn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F8E331203
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766568479; cv=none; b=SxR+xV0Qp7r1z7xLZZCotXvFDt9MAaxzc+De4sciQbMI7GwKzbFrJc9zyRpwP90bIRB7CymvN9rkKCrA/I+w9xgfY1U2IBBsyAjsDsY9hC0G9UkSxsRrnIb12OcKkNbuJPm0fTZJiwoB6OhZmyg+QOseoWaJFZ/9IyLIScPRB4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766568479; c=relaxed/simple;
	bh=/yUs/dWSXd4Vu3nh8mKp7zciAUhxa7I3eHWatvhT/ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ffy8lhv69iSgrvocc37IlF84/f22NRFlFjqhUf6luAF2DArcvn0pRF069qQYyRNoE2EhXKY6i/kiD/4ohqXVM4AVgPdW6PztosFD7ivm8FoDkc6052loqA+v6whZjYcdoLwW7wk7wjI075I3gMzoAwZjlERP+EeFzTlLLnXJimc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B1fEX1sF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bYvdKYDn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BO2RWrX461728
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:27:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uw59O712MjbFpHjUkMja6O6UHXeOcWDA+gCf8efOSlM=; b=B1fEX1sFeM1nBkXj
	FYmoO2+CnU/wIvf4Fgc0eUZVnTgcVxPGSZgB2Yyu85mC/SOJlMVHMkeDmloqzUpd
	hMRTi1d91LRh7xV+Xgu6w7QC9/dQwrJxW+D3H8DHk5JgW/gur3b9AVRTu8SYo+So
	cDv7VSlBK64As09G8HiES1C6KlKi8usy4MTDtA+G3jA+XRkemNqdoMvN6IOU252b
	b4eHLR3TBy9Mljwwyvzki/kTFdYj6yLa2p2G7zSgVTkvYmafYVPzp1YPYkqVrV2b
	sSYnBF2xxvOVXojaskvuGiulDs1IdTvECDPMcRKGEGkHD16t+keaggsy+D5anStF
	2/71WQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7w8ftrw3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 09:27:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed74ab4172so135498221cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Dec 2025 01:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766568476; x=1767173276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uw59O712MjbFpHjUkMja6O6UHXeOcWDA+gCf8efOSlM=;
        b=bYvdKYDnLZFhBwnmYsSj8MJaZ+Ba7eoD4E6YJovqBsM8d9/g1MTqgN5UKL7mietd5z
         sUTEQIbxxYmwpe0+oSLjAKivC68VpoanHcoHcZFOjygwrGrfphedfm9ozLKFb6zquRO+
         NSR33lyZm87bAgCIzzgidFlF9w+SNor7uueIGxGc94xfjZwcL6Zs5YXte2l7woEnUzjz
         ae1NWcGAtNsnYdF9007ZB7paA0dkiS4n4tGCwunjmwtRqvAO7JMZBbyqUzSoZwIpgPTd
         DBu4I3M6kXTxvi4OEgK2qM1yE65x5B+wUtPEU6GHKyLA7PWvh6XAjE41/v3fPW1TX6FZ
         YJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766568476; x=1767173276;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uw59O712MjbFpHjUkMja6O6UHXeOcWDA+gCf8efOSlM=;
        b=SIEyYlgMQbQ3awF7yn4NLViRQyVCq8VSW/Dn4ayXFxSyqvVKn0A0GH501wH9XjSZ3/
         TmRhU/qe5QH+HWWlXR9Vsx7D/AG1whDMzos9Dl/Zubm2c5V9VRJK8ORg52VMCNEtLqcb
         6g5/e9wvt8CIIl3jyKIjYG1nMHaqG6Bpi9qX8GrCI2W/JQvp8OQ6SqCYjNFr1fQpZc6x
         7Jvep6bl9P0wMZRxAv7uA8aiDT59qDyO5OWhaO9gx+4IRlzCT4aQX/Pl9Dnp1OXdKoSL
         uuF0rkFnnkPXTHIBNq2ZVbrNwssyxsC57wjPKnkTyPhiECGqvxGyyBBrGLHC29GN9BvW
         Obxw==
X-Forwarded-Encrypted: i=1; AJvYcCUA9RUXHAsqF8Kp0MBS4UYcGSmMVJW9Vcdy+j5V8J3LUz4Txll4VvBlJ6rnPWe16RuI9cfi4sS33osOThNP@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/l+FBNWvKZvjiKGt6jBhBQL9StLXx8nQUYPuQ0TQupbbRpmBf
	gAbojqr1Hjmb57/b5cjq8IMgepqolk5Ysx7z9rtoPeFDk0K3sL9Dr/zfSX5bg9uvK4/LdJR0TGk
	YKtENbDyfuWq44X4MERwAvgyRobpdQ/BQhQgETd7m5l0rpYnGJygqb/KA6EyXlv1ZyNUnVbufcD
	4c
X-Gm-Gg: AY/fxX77dboVSMGWdmjIwspbGSl8ZIZ79Jz53lWI8T/Mt9MOnyPVo0Gw9H2Wqybu9Ll
	4bCyQlIDqJ1maON90+O2vts68c8aD2nk0LUkpMOWwr5Hv19MVwJ+YAyzWY1ep6LUrwJFH3AYF8k
	oW6Kqf3kvFxF7E7I7YU5Fuiyk7zdDUf5VlGmnXN2nvycQVGKCx9493MquKzy2NXChj6hwux1sef
	CxtTICYLbqcQ+pmcLkzLy8WR/ZICeLwvSIs1EiHjQH75bC0ixix2pMgjGt46wQH4EtsZLUj/EWa
	Yn5CRcsDZUVeVO2BhOVq9uqo04ilKvq8GesF5kSODAZ6iDsx2J/sRvhUlUayOkBg9k2/W161GEF
	aF84ACoX6ABRFEi+I8LSG5Vh41QHkhzTwvvC3krFX7zu2VB+nBn3K9E9wvIs4bDZ/fFq8+LYa7+
	J7KQQ70kXoXMtaIkiXGtKjjp8=
X-Received: by 2002:a05:622a:4013:b0:4e8:aa15:c96d with SMTP id d75a77b69052e-4f4abdb59d6mr260677471cf.55.1766568475667;
        Wed, 24 Dec 2025 01:27:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPmb4FBu/+NZZjSLP6QEyoiN3Sxslg5qAtxT5t/ZMlY4bCsQu8Zu0+SBGsXE1HnUerjBYM2g==
X-Received: by 2002:a05:622a:4013:b0:4e8:aa15:c96d with SMTP id d75a77b69052e-4f4abdb59d6mr260677211cf.55.1766568475245;
        Wed, 24 Dec 2025 01:27:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-381224de761sm43606051fa.1.2025.12.24.01.27.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 01:27:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, veygax <veyga@veygax.dev>
Cc: abhinav.kumar@linux.dev, jessica.zhang@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, airlied@gmail.com, simona@ffwll.ch,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm: Replace unsafe snprintf usage with scnprintf
Date: Wed, 24 Dec 2025 11:27:47 +0200
Message-ID: <176656845704.3796981.11008925293580480750.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251130012834.142585-2-veyga@veygax.dev>
References: <20251130012834.142585-2-veyga@veygax.dev>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 5ebFVyVFB6zCsAXrssUZdIcFQ700dCBs
X-Proofpoint-ORIG-GUID: 5ebFVyVFB6zCsAXrssUZdIcFQ700dCBs
X-Authority-Analysis: v=2.4 cv=QutTHFyd c=1 sm=1 tr=0 ts=694bb21d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=Sr6y7Swg9AFsQnQ4lA8A:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDA4MCBTYWx0ZWRfX5vNw+exXPYC7
 28vX5oxmnu0jtLosH0oPJ1c7DCBpYcF6qpXjgSjtH/xWRUOlsjDHo1EAJf0ux51aNneY7aH0Xkm
 XGT5AC+syVVGbMhlesrJC4J8THGjir0vCxlCBLxBRUh05zztiMqRhjlckv71VkZClK4d1Q3SSgF
 qZSTmTlwkj+b2oQaikmp0+ciKkRrIPaYN7C4PxtKFLuvKeQ7XYnnB44iqWvMtNahOQ42NpA/h8l
 c0maI2b9tcFeldCshksNWqWTpGaRnY5i05OEkxYPOZ6cSiC8H3jOAqXiodHekONHnMAbDK+8Ypl
 Fc203cjtU4yYrodDAvd2K8kX46dq3b3w7EdWvaWfCeT7/8h7EG68oBwD6TDNTrnMUx0WiOZBZGO
 axNjHURgo6a1KUy9zSqqspDfyO7hmRcrv8OSAMxnTgkKPHW3yDWTkoGIKwfXYlgaX1iTIxOvxix
 NvxC0cBqHKpMVQW7b7Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-24_02,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0 spamscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512240080

On Sun, 30 Nov 2025 01:28:54 +0000, veygax wrote:
> The refill_buf function uses snprintf to append to a fixed-size buffer.
> snprintf returns the length that would have been written, which can
> exceed the remaining buffer size. If this happens, ptr advances beyond
> the buffer and rem becomes negative. In the 2nd iteration, rem is
> treated as a large unsigned integer, causing snprintf to write oob.
> 
> While this behavior is technically mitigated by num_perfcntrs being
> locked at 5, it's still unsafe if num_perfcntrs were ever to change/a
> second source was added.
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm: Replace unsafe snprintf usage with scnprintf
      https://gitlab.freedesktop.org/lumag/msm/-/commit/093cbd754382

Best regards,
-- 
With best wishes
Dmitry



