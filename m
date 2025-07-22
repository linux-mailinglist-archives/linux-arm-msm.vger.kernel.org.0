Return-Path: <linux-arm-msm+bounces-66155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 624BAB0E465
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 21:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 424A97A38EF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 19:51:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3ADB284686;
	Tue, 22 Jul 2025 19:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kr774tyK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82016221297
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 19:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753213948; cv=none; b=l8nkeu/zZ3YsXWIoGmCZ8kntVMPqlFux3IasN8OWJ9WnAf5QrR1uteAApt2h3p4SaT1En7Hoop4ZwixBCe4Cx43tlEYYGoi0fWe5duTsmR6sgRkYrjCA26E58Vxi4ij1EuVmQ/AoHo8O/ZlXUlA2VVug9kudQpPbo8t7hlxah2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753213948; c=relaxed/simple;
	bh=+DTj+E2P7uJr3tHLoEQGe/iSqEpBHzLuEPN9shGIf7Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JpbDzanX6OXi7EsSortQpbpnd0h45vZSMe5OcOz5HOsP7GbYJna7vgaMtZm1Vgxwa2jVhlvo6gg2gdJt6f6Q9xNNpYtSvigVCD+BGpekQrRj7HOckJ+qiu0I3Ooakc1aSM5h2X4c6lVWnq6A87IwmeNH37Z6JktVblb+uLXplzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kr774tyK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56MFg1mx003589
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 19:52:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NgleyO5RfA0jJonC4fbj/fBe3zzFRDRyWtUD4mibfAg=; b=kr774tyKpnQ9Zyws
	IuNzzBUb09SF2MpAfZsdQnslNeHCnvzeZWMs5fDOb38LZRUtSJnk3arYSHS5hXjt
	yCimrEi6zN5BHVIDmqBsUuN6wBtQTl6hNX4nS49QV2Wll6ZTEgl8EsR2BKZls5wc
	7X+gf3kHSKpRARHjXcDdv5q8ts/KWNteAlWdX23/ugJDhxKwXSfbuDoA3I7G2ZGC
	FHmn911HnathefJ52Ew8TVzbdeuZF4MAmQwASVhC07a5OdN0Y2PJCY6MnDRwMnJw
	Yd4dJBqOv0VRoiQ68WLJ+UP8+6TTwYsyA3j//zWz6LRTA2cMx0evaUs/xQCv155N
	uGGL7Q==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v911j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 19:52:26 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-74d15d90cdbso4968964b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Jul 2025 12:52:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753213946; x=1753818746;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NgleyO5RfA0jJonC4fbj/fBe3zzFRDRyWtUD4mibfAg=;
        b=EGW+soomQrc2/NMU99G2xLyTvqvBB6N0Oj0WXmDcecjYMQsTGaU2rt2lWqIcpZ2Aao
         uTpiXpeNBKLcL+i3KKqiAmTC4WcadTuQPiPA5qGm1/ewl+GdteBExRm5T4HxSzJwvEaw
         eKAHXer+Pwz3A4ND7Udo6VTFTMNYViJLXhSFqHFwl6jiilbb8sjz/6mqzMdPUQH52P8f
         w5Ekv5IlAJK+EUG96SQDs+sZButgEQEuWMknHp0BRm5uYNkBaq6OwLl5ypQF9UhLiN3b
         PvycebFTFOd0RTst82r7aIajAqUVSREtBPTScsVmy+EeH5dwjPIjeevrrZUVS7FxHNfL
         7WZQ==
X-Gm-Message-State: AOJu0Yz2k8+LDJqX3BqEbQJTg3/LF0sbwTQ3BUmZpnZHQMCgMtUxH4kC
	d1IXr92muUYmBj7UOOAvYt2QyCRw00DD7S8hcFVOihObKzMg4BVtDDRS2dA9RX4+jWk3bFZeLvT
	Vj/dnQ4uEDQGqX4Pqmk2eq16ZhDA0e52RNObjI/v5zmndJCJB2gvlWz4JTLzc7yyMu8hs
X-Gm-Gg: ASbGnctJNHtTZ1j7q35vPyghtgqsl4r7JON8nbeibTVieI8aqL4nQ6O1FLtbuUzhuyf
	lu7LvlgqsI2+VWSM+P72PAKIcY79jPTCQhsPSA6huEnoiXidqGE+zvxprCd5PIx4SzWb+uPYjdk
	PDJ4iKB06/LnIqdSU4mekiKIBBqe9OHzLqzx333Hsxk3AH9R1euH8sAH2AkNv1LzUuK37ilVZ7F
	dXrswpDbsABUzqHdRjApf3dizAJawZvbnP37Mkc5PY4EQT7Lu34fbPm/61i+K2Nrwh6+awmcowK
	tVgI7QNcy2eHdlAtiRmE9ZMWJYeUG+XIvwWr2ZofoSQdFNAG+biQNYRvB25GUOmD
X-Received: by 2002:a05:6a00:2446:b0:74c:f1d8:c402 with SMTP id d2e1a72fcca58-76034510546mr882709b3a.8.1753213945701;
        Tue, 22 Jul 2025 12:52:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUuhsn+CPJWTbTSXO1IZeQTiGzjVoE9h75N3Pgihn8vh+oCDCTqUQNSuxmfB1Ryj20g7s3JQ==
X-Received: by 2002:a05:6a00:2446:b0:74c:f1d8:c402 with SMTP id d2e1a72fcca58-76034510546mr882673b3a.8.1753213945209;
        Tue, 22 Jul 2025 12:52:25 -0700 (PDT)
Received: from [192.168.1.4] ([106.222.235.133])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759cbd63cd9sm7622600b3a.160.2025.07.22.12.52.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Jul 2025 12:52:24 -0700 (PDT)
Message-ID: <62391e11-2f26-4e30-9c8d-b47d4985b41b@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 01:22:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/17] drm/msm: a6xx: Fix gx_is_on check for a7x family
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-3-9347aa5bcbd6@oss.qualcomm.com>
 <84a33e15-edaf-4951-8411-24b17ee5f4f5@oss.qualcomm.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <84a33e15-edaf-4951-8411-24b17ee5f4f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: brsyaR7lQqtTOezUToKDJJzCJchXMhVj
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687febfa cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=4dphQItTPUswyQvINXrzgA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=KQakvA195p00paWSqTwA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDE3MCBTYWx0ZWRfX6cRbOL0LgnkR
 0wn/RkDv66w+pLuKGzVNjTS/7yeZpxfTavdpzNuIiI9//D+QJLUCfTEPVSLyBJfPHgo9j1BDm/M
 H2yQx6nXKUwDbL6oLgnYRJ6QOmam0QevR2w4zOQAHZvp5jSWi3revOTcRecUDpPeFRia3ZSfPfD
 ZtHz/i8b741vA7djGx5wgTf6yL7HCHLe9gZVvYbLtsR2/EuQEu5wVU9rNgfyMhYfI2I7lHO3LjF
 sacqx7mRKUtWZwUN8Nf2zUW1/UlaiD9i2gOXnxU7aC8mvp1C0jLaV0GfAOHUye4ieQ2YbYNX0A8
 LdTpxdZtVfDlTBFNy7cjaU2Sxr8IpC/ca6da1I+NKlqjJ67eNYQFUE2Z9k6FSy0ysYzyThRj+1G
 Z4y+7J5/G5QG1Fk0qZfaat3zwIcsprDIPUkZQoC7yOP9eZc9xfwgKCKlnbuPJ6ha5Rx1UJsA
X-Proofpoint-ORIG-GUID: brsyaR7lQqtTOezUToKDJJzCJchXMhVj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220170

On 7/22/2025 8:03 PM, Konrad Dybcio wrote:
> On 7/20/25 2:16 PM, Akhil P Oommen wrote:
>> Bitfield definition for REG_A6XX_GMU_SPTPRAC_PWR_CLK_STATUS register is
>> different in A7XX family. Check the correct bits to see if GX is
>> collapsed on A7XX series.
>>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
> 
> This seems to have been introduced all the way back in the initial
> a7xx submission downstream, so I'll assume this concerns all SKUs
> and this is a relevant fixes tag:
> 
> Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Dmitry/Konrad,

We don't have to backport this change because the existing code reads a
couple of unused bits which are '0's and that is okay when IFPC is not
supported. So there is no practical benefit in cherry-picking this
change to older kernel versions.

-Akhil.

> 
> Konrad


