Return-Path: <linux-arm-msm+bounces-86160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 99EB1CD5348
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 09:56:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B5A8A3031CC6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Dec 2025 08:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A00730C60A;
	Mon, 22 Dec 2025 08:52:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TRpbEqJU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DXUwOiUo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A09C306B1B
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766393526; cv=none; b=ofQrBGsa1px7B5XpHQosprMa5d55v3Gn6z2pT7us3e2hgCjeLg1S2Cv5V0dnkI4wWGuUefGYUivhQwJ+G8turEASos2xhXlFjXFQN+OhPv5ZUVQM/rE6Ae4oZLvAfHI8UrOZLjdxv1eFEdeVd5Q8vDg4zvHlKlTecw41tyq3eLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766393526; c=relaxed/simple;
	bh=s+MH1Wksus25flQEOZT8H2FX5EwOBcctS2lnJti54rU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gk24XLMw/Q2qNt6MupFlPcjSaxnrKc9FTC2P0zaponVrhpI0ctY841Yoh5PevRiJlZ0oVxxx9xkgQ5eXM5tfgx6bPiP9/DYhSt8HSzOGxOQCoZnlPedhTNwyIAEfHGAGkAEDg4RhLxev0p7O0HgyI0aSg5vndRGQVw3iTGARkFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRpbEqJU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DXUwOiUo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BM7Xf6W4015153
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uob+hAF8OiofpUbnbjg7D+uwM1p4gb+qkC9KuaAID1o=; b=TRpbEqJUhbVzV0tu
	s466P7IMqRZNeJJlAodUf//R/Gfj2EMsu1JnEcp7cYOnTjsDEQ8sg8f6pVLNipim
	gGcptlvILCb/xmWsPGm97apHwSKGr6g/xQtWAgE9HguYftCssDO3zxh4ztjuscVR
	nmBxt3outQiO0qaK+ht58YwvmwYYoRz6TKVFKhD0KQSlc3uec9IaCn5kFd3qfJ6k
	CI6HayG7gxXsd17tqoCUC0XH7cy8ib+gsFxhzR917LqrjpZBbfnTj6MMu186QMJr
	85NLRghXY6EUIJzEVXO5xznXtBl05KfUAly92bfBO52YhvQD2Daay9ViTWth87hq
	WWlERg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfmbr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 08:52:03 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed83a05863so12010541cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Dec 2025 00:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766393522; x=1766998322; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uob+hAF8OiofpUbnbjg7D+uwM1p4gb+qkC9KuaAID1o=;
        b=DXUwOiUo8ol5HBsGy0Tr2Ttz02hh40kSNEsUSySNTXgxwiYsJfbgi3gooNEM6ioRWj
         YIy09i8AKeMCPfxFo5GARBYNbAeURaZ+bX84CBsl8M8gIp+dEDO1b2kqX6rSHdMVOfqk
         Pu04RpAy0XTYbe/M5tP6DraPVC85LDbE9nYMWYnx3IkemC5/fOpAZQxbyWmN5/g0R/E7
         tvT/oc5kYHWPu04cp5L8bNyeC/vx5gsx8mtjJxhaIgdcierJ36cEgl3uK1TeeYJrLI2J
         T9O4UoqgCTu04xyk7PZymInZo5OdKX2hvpLwPRi1kPENx/OxEsFSxTshLyf8a4gtRJ1J
         6XmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766393522; x=1766998322;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uob+hAF8OiofpUbnbjg7D+uwM1p4gb+qkC9KuaAID1o=;
        b=o6UUanb8zJaO1UfG7yZQItfN7A79FGPbDbOmm2O4ZDfgCrCykXfhmfk8gqjrkp9eOv
         j7wOPB0qxOE4Ped1gkWPxv6mZchNoIMhvSIi9QlxQV+ienX7+dDpNRzJk6epd54oktkK
         ol5zz5IFQlBWT0Y6XQmZc8DnxJaUWYg9B/VDOKgefd9SE8kAeQaiY9iNvbpI42Knc7hX
         FMvvqS1wUZGnJDn18jb2IR597tjOPsSw1HdXxKSa1BHcRxvICRZt1NmYKRBmPuJCINWs
         EDnKwtooPX/dW8Gw2DmucK5JqTv/TGZwL32YEo9Km3244ifxMhdTi0YQdAemJAO0qiEf
         44hw==
X-Forwarded-Encrypted: i=1; AJvYcCV4eZz4Yc69nUOMFNF1yyMfzuzsZS3NzK+zs8sVmfdIL2WjOe/ZhfuRzOj0lNjxNQNSvverLvHShlKOz7Mp@vger.kernel.org
X-Gm-Message-State: AOJu0YzB3LXDpKW3LTpv4Gu6Lt8w3dqHwGtusNyden/QTNdw41MMiZoo
	oe/3ZsKwsWJKbZ8yK1+LFNHLu6kK7gz2BUM3VCCI7m6STZ583o4c0Vs8nxPjfop1mE7x16whRCs
	TiPawqwRH1k6U+b38i/LfT433nCCANvxjlidmQByoPzgqqEYMky6Ztg8byRyJa/I2tARu
X-Gm-Gg: AY/fxX4C2gN0JjKtLoUENuw8Ct5+PXkOv5/W6nzTVsPmyKjTACEGvaQV+rAMmcC3v49
	0bGUdQKOwSBotASlMfFSGu8w1uZcLPd8Becsh5ZxyvmQsqoZ5W+8tAA1VNDzq1+fx1Lm3TOVslo
	Eo1gx35WR7UNAZWfNpWGv/tX7VNItHy3hpOJu4Ul5yVjUAHLycFE+mD9tfhKhckeF9TlTSdLaXC
	mjYKx7w271OJ1oYL1q+MsiZ5coU4q++jRYYG1tIwiJybkFA22Rv0kCQugq+os6tE60vmd/FrXHq
	Qz5Ga6BHzWyPM1hgVrYUNYPniOVDwHFYxI7650J3wRph/itxLdZko0kp1S6VxbF79sL3ZZGhAji
	4+Fyl7pEKubRYh5ZZfG6tnR19wJRZVkvaQ/kY2/RVR4VsD9ED0sOdncj3T3AklD+sZw==
X-Received: by 2002:ac8:7c52:0:b0:4f3:616f:150 with SMTP id d75a77b69052e-4f4abbdff03mr115520351cf.0.1766393522541;
        Mon, 22 Dec 2025 00:52:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWwe4NdFNAaev00TKW28UVBa3Fu6va8hqB4ZolVSybJM2HPRrqFtrcc6EfguXpS+jYS4uOtw==
X-Received: by 2002:ac8:7c52:0:b0:4f3:616f:150 with SMTP id d75a77b69052e-4f4abbdff03mr115520251cf.0.1766393522151;
        Mon, 22 Dec 2025 00:52:02 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8044f4acdbsm853980266b.22.2025.12.22.00.52.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 00:52:01 -0800 (PST)
Message-ID: <e4748c15-935e-4dd0-a49f-a68921074922@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 09:51:59 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/a6xx: fix bogus hwcg register updates
To: Johan Hovold <johan@kernel.org>, Rob Clark
 <robin.clark@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>
Cc: Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20251221164552.19990-1-johan@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251221164552.19990-1-johan@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=694906b3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=dk0i7xQ4PQfej7aG6gsA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: LXXoGMnRqXYvWiPQtZilg7v-HHazEdhb
X-Proofpoint-GUID: LXXoGMnRqXYvWiPQtZilg7v-HHazEdhb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA3OSBTYWx0ZWRfX5/azsyWgkM1x
 7lepGWc+sinSNUIB/CKhIjdEz8fjIStmewS2o4wl6b6dNNSQdopBj5Fj3fGIB8CWbVfhullOcb7
 N5rV3CL1obcvxiKWC2sNZzbki5aQQihuNmYatTweqB2VKLat6MeELeWkzTfN2kP+1rV+dSDnCy0
 mhJItGjn7VPMFv3/yRI7mUjNhwHvPZinpO1sVEzfBcyn9VTOr2MWZE4cBmNEgsiubkWAPtNqf/V
 QnsSwcAX9GBehDYIhR+6S5YvYEomBRPxwvjfCWsFvBQw/npqwayhOMtsuKQ8e61xZAlWJVKRvP8
 heBZA9bRVO6j5tetMc86UMF6G/tcLTp76itQo55T6sLgsNR531A+LA3HCo55zHJYomWJeZAFM52
 mM7tW5mL39/9QEMVgttvrJZ9+AL616pNRXfKt3Un+h1H535b11M362Qm7YZSZQLo5NhvH3CZG8B
 VkRRfM7+2FT0Vg+DYuA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220079

On 12/21/25 5:45 PM, Johan Hovold wrote:
> The hw clock gating register sequence consists of register value pairs
> that are written to the GPU during initialisation.
> 
> The a690 hwcg sequence has two GMU registers in it that used to amount
> to random writes in the GPU mapping, but since commit 188db3d7fe66
> ("drm/msm/a6xx: Rebase GMU register offsets") they trigger a fault as
> the updated offsets now lie outside the mapping. This in turn breaks
> boot of machines like the Lenovo ThinkPad X13s.
> 
> Note that the updates of these GMU registers is already taken care of
> properly since commit 40c297eb245b ("drm/msm/a6xx: Set GMU CGC
> properties on a6xx too"), but for some reason these two entries were
> left in the table.

I am squinting *very* hard and I can not recall why I only removed one
of these entries.

> 
> Fixes: 5e7665b5e484 ("drm/msm/adreno: Add Adreno A690 support")
> Cc: stable@vger.kernel.org	# 6.5
> Cc: Bjorn Andersson <andersson@kernel.org>
> Cc: Konrad Dybcio <konradybcio@kernel.org>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> index 29107b362346..4c2f739ee9b7 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
> @@ -501,8 +501,6 @@ static const struct adreno_reglist a690_hwcg[] = {
>  	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
>  	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
>  	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
> -	{REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL, 0x10111},
> -	{REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL, 0x5555},

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

