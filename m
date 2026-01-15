Return-Path: <linux-arm-msm+bounces-89279-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ED038D289D4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 22:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6C23030124DA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 21:06:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD7E4327C0F;
	Thu, 15 Jan 2026 21:05:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nZflvEuH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RP1GcwzR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807DB29E0E6
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768511159; cv=none; b=f5QrSIkthOENpJAhDoqmRSSFon6MWb07WP+2LaBYSq4lUFibvbMHcZAocWugVeUIrA53hbcDycm0rQLN62q1nIW0sYOVid4IeJyJRirElQ7HFgibz0YTFGAFzNhZk+CSY5PEiDz/424tOzju/b25dynBUHNyhHAAXJC3j8VI5Pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768511159; c=relaxed/simple;
	bh=kHgSAGbvvph948kvEdLF0VlhvspYemlEooPl7c1kSSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZQ/ihH4GlruCF3fddPOetwKZeakjGZ2L+AEbFDJC3dSCijKGQL7+MfpoN4QJVyZdpskts+yZ80HQtu1adTmTWpcOFHiGOe3lMyqQWLHvmdZ5lCqCrJ1kU+4QF4w5TFX0tZBHp9zwH5Wx1/B6ltOA9Tsvp0Y7oQVIMSYeM2N+9co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nZflvEuH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RP1GcwzR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FIwTjd2159764
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:05:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	07FPw3PSZSCEYY7otxnkryfX7xi+qhEJ7PX6/evaCrI=; b=nZflvEuHnG3T/s8T
	25OY9rH7AXRGDVbq+yx3liJ/bat1DYItFGnvnUEEJ5mtA0EVo3ynsavQ3X/LNwuL
	UWV3kwuOyGfp2Y/57O9ZUlulPsmuvZ3BGDcbOX/5I2h9HUxeorUaYcfJgzUxktJI
	vUg0hhRt8LFTKbdePz2hrjtq5oeGTLuOVaSvMc95jot1PMMhM0UcMc91rTaeG6IT
	IVAaqLNiPLgsYOsDW65mz3vJq4XLt06u25AvPeL3VZyb9qy+TL27An2c8iEtsXms
	hcMc8e8b9ngsKLsgwxNTkMBr+YJW/4UMg+2hlVgHYq1ogD/xXMsjXSD0cJPOyQb0
	To8/ww==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bptna2fmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 21:05:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6a4c50fe5so220355985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 13:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768511156; x=1769115956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=07FPw3PSZSCEYY7otxnkryfX7xi+qhEJ7PX6/evaCrI=;
        b=RP1GcwzRxo81q5c4st/fc6WatbH6zXhjhLjkEeI7N2vK1LBXrIZFOdz+vBP7J2IQGV
         m7zbPjL1rP0jXLa+4I6AJbTx1SP2hmUAIkGZnpObZ23loixB6/LA4m5+rjuGgdk4AZBT
         7+X+ffEjzWomNJS/w9btjOzV53OoQszZumR/IYWy8JTjgOxLnyr4PtaoX9jyMTl/UlTr
         eF3zfH35bqWAKvO9RX1i3jJPungrVLMEmobzUNDruO1OZn8GrmvEn/o59ilU4togehIc
         wpuI815stP92MMofnbAOytbiZpSinNPufX22t4o6F23KjUz6U8/RFYWPCaLqqlkqwu6i
         8epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768511156; x=1769115956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=07FPw3PSZSCEYY7otxnkryfX7xi+qhEJ7PX6/evaCrI=;
        b=D3bypG/ud7yzSiFZ/DxDhSXrnrxa3PXgzaiRGrysPUq+JvQ29lyNLh1r0AJOAB5hjQ
         tU1Z29bfNH9eADz+7sUYu/rbCzkKzG9jzA3HFj8bOP/5b8U5QRy0h7k1gafh6XA0uTiG
         GbR6N6OcvivIrv9KDOBXqWKyTUXn+YsMU0SfrAijYedc8hOwX38obd1dnmGXX55OtDFG
         8xcsS48TcVS+so/ptcF3jqfSwdcbt95WDL3L3WUYGTXEDnKZNoznIh5HAqs8dFvVNjAt
         cQoDClXxVivdpOwv4bSh9042PNkq3Z+1EUiTDzIxgI6wpuR8RwEyx7FnzZmIVqZPcbmB
         sQBQ==
X-Gm-Message-State: AOJu0YyGnKFxTq1DjXiYczE9JMnMajAHAtgySG/lbjHE5zFrsVRw7IAd
	+rO8HFYPar/5Qj4R65/cxm1hTBg6nDGMFuB6S5lax938bLXuFR4+zPYgPIX6SYx5Mt5dbBZwJC/
	r8qFCXtGd+Hq7XLr/AK2gKiEprsg9E2eyZAy0jtdPO+49s6Sd1BhYYn8J7xP04nc13L+V
X-Gm-Gg: AY/fxX76n8qcc0u+tgKuauWCkQd6nJRUPAscK2aE0mL0O76nJau49jvhIGegcJBbA+9
	gm4F0OIa7zbS4hG+OkieafA8nc06uPSzjZhp4b6o40Z7MhRnnFluH1IsExMBT1fQDDf2mOXxRM8
	3IO2zhlAJXph18IgXwJPmfB6HP8mu8DZj7R7Xd8Ny98Yc2SY2VY3VxdEqZMLNioTtf/tBXiEMeu
	4a71od3+pBDhiqcf0jQwDF0t6Qn8P8H+mewQbWg8M6OojNXaE4NqhXoFzmjjWBxmymIb+v9WI9j
	1e+HneNLadk/ruADT5+uo7Dcxfgyd7h8jW0P6GJW5J9TrpF0ziGiI9lIvL6+v3OlYQvbFRCyAEL
	CvEWh0V8lzxvcFcnBArrTr2ZE9eZItsWoOpLeusQa8ikF5DQ0AYn8Hpg1vGInHLBoJFnVDwhVGD
	R7sHmGX/Bj7aCAIk1IGzovXEg=
X-Received: by 2002:a05:620a:414d:b0:8b2:efe7:d82b with SMTP id af79cd13be357-8c6a68ec7e1mr102704885a.30.1768511155853;
        Thu, 15 Jan 2026 13:05:55 -0800 (PST)
X-Received: by 2002:a05:620a:414d:b0:8b2:efe7:d82b with SMTP id af79cd13be357-8c6a68ec7e1mr102699785a.30.1768511155382;
        Thu, 15 Jan 2026 13:05:55 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59baf397672sm155740e87.61.2026.01.15.13.05.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 13:05:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Alexey Minnekhanov <alexeymin@postmarketos.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 0/3] drm/msm: drop DPU 3.x support from the MDP5 driver
Date: Thu, 15 Jan 2026 23:05:52 +0200
Message-ID: <176851027322.3933285.5551205562887648299.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
References: <20251228-mdp5-drop-dpu3-v4-0-7497c3d39179@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Yj-73AzxILsP0XSnRjvd_YaYUG-sTDp8
X-Proofpoint-ORIG-GUID: Yj-73AzxILsP0XSnRjvd_YaYUG-sTDp8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDE2NSBTYWx0ZWRfX5K6azx1JCC0/
 HG3DFyjdr3oSNjGfiJmr7sRQ9xvAO/iKtjJjtUMeTwvm6sTLcndaqEUn0qWtjig53jm1iH1QTdJ
 TcsGElKI2In3OALTgAUhWzqiqwKEbXGO1x/zWy88s7GYAlYUVbwInZUz2JAjihQkELrBWA8VWDU
 BX/eHWXBXSEHiZkgxUEsBadydnx6aWRu2NIMqwR95VWRRik+Lq7AeRtmCAHu4wbTsehJmJpWXUe
 +xM0NGWWNjMvsYtrWX7bnEmbELkV1t6TD1o/pEtl5dL9lM4JKJdt/WoLIoECH2CL8F7oHnxh1TJ
 kWewnSirwUOuSYPow2TuA8d6SPVEMHrb++xPT+dL3hsSEPWUnJwU5swsx3/H1q51441YdB0tL0o
 gR3V6V3VgFxVrFaW5qzs4w6f9fGF2Xm6jVwXVzzvWA+2yKqym1m+YasYeeAT0EvweH2csW7+pRb
 aD+51w5QSDSgfRegXdw==
X-Authority-Analysis: v=2.4 cv=fsHRpV4f c=1 sm=1 tr=0 ts=696956b4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=MOX2AFg_143LD5mekm8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_06,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150165

On Sun, 28 Dec 2025 06:02:26 +0200, Dmitry Baryshkov wrote:
> Fix commands pannels support on DPU 3.x platforms and drop support for
> those platforms (MSM8998, SDM660 / SDM636, SDM630) from the MDP5 driver.
> 
> 

Applied to msm-next, thanks!

[1/3] drm/msm/dpu: drop intr_start from DPU 3.x catalog files
      https://gitlab.freedesktop.org/lumag/msm/-/commit/f4a8e3a34ea4
[2/3] drm/msm/dpu: fix CMD panels on DPU 1.x - 3.x
      https://gitlab.freedesktop.org/lumag/msm/-/commit/59ca3d11f531
[3/3] drm/msm/mdp5: drop support for MSM8998, SDM630 and SDM660
      https://gitlab.freedesktop.org/lumag/msm/-/commit/23c39217d933

Best regards,
-- 
With best wishes
Dmitry



