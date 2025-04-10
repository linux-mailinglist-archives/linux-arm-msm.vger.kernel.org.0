Return-Path: <linux-arm-msm+bounces-53919-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A492A84EEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 23:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 755357A76E2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 21:00:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 947101EBA08;
	Thu, 10 Apr 2025 21:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XDTaYRtN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2220D6EB79
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 21:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744318919; cv=none; b=MZw9ndYV/V9a8mZHC1Y5hajlrJAQ0N2NDurBu86rgbRtCVc6pg8T+y9XlgLTgf2Ecm8bIA3dPvZR/4vUEpG5NyxHzPcuwc3+Ya8lOXjhLbXyMjMmNxogWDNNE4uJVg9XBff5hj/etHX5s5kkrjh66vOJBmUs4F+twItHlQ6JfHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744318919; c=relaxed/simple;
	bh=Bp6+mDq5oMmXkzUXL1kUpCmqYnpORysSLja5cHQfqko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tvgczuk9CwJIW4ybzOXbYiJ0Ja5Agwa3zFBhAnJfFPZA26VHLIGsxHi+Qceur7aMWH9MwMDENSuwY6tdKRVSP+FBCAhbczcnVuI/7t/KsTbYq3vIaURssEfWMMezLqunU8H7/f8Sg4PD2VRsvFRjfDhCylMsbODH4Hbw/qBillM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XDTaYRtN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AFrPOT031979
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 21:01:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EAczs4DgsEXDn10TzeEXpsxj
	GDsTEgsnPDFYAZGDppQ=; b=XDTaYRtNGakvPh5wIcPKRrqc//FrVnluzievkDqr
	4YXunzjTjFI0Uz5TEDtY84vc6dDoJf3KPW7FWsqPIDIUyPCtprp47tH6s7UNpFe+
	jptYSFcsbynAJFc0Nn1hV0A053T/pkNjYrz3pjyWB71w/Ns1SH5VoijBBb/E8rPl
	5MUga9ChweZxPO8z6vUYwZooOyELMZevWOeVgr6BmsYjyOOlNF1VB8UKpu2xfs5V
	y8kpN7c/g9LxcF/nkiPaifFhOPVJnUnw7s+ByvLfWW82414u8bQY83SFy+ijoAvr
	25RxV2V54aS1hPtF2NH+SSylkA+70s2AXvxHfF5crpQr3g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twpmg81e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 21:01:57 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-224191d9228so15183365ad.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 14:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744318916; x=1744923716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EAczs4DgsEXDn10TzeEXpsxjGDsTEgsnPDFYAZGDppQ=;
        b=CJNT8kXLWDFrOg3uKCEdKjcStSYAhqjVlVubp/Di8m5O6FyGcy0/hb1Z0xRZ8dvobw
         0Ibp/f2G4kXrg9Q7pU7wyxOaHkMS++2ELwQrjbgAnCznksxfKYf5Eds+2wurJazUVEkS
         bQKcxnYTyGSqH4Iq0pGvnayaIgRvTX0CNr+5vWzcaRbKAE0zAPd89fdkyhVuMsc6Xzqo
         mvPX7KJMtpiODwOJILX7oorNHmMrC3NT7Vl/Kf5CpquQu4a7VcFswjsCHF12fiTstn04
         A0PkIsxGZYcWHgdEdHxr4tV8T26JTdpMQ5B5iABTrLY+rSvvkwq2sLoQRZogRQusnwtK
         MI0g==
X-Forwarded-Encrypted: i=1; AJvYcCUcDVDKVTVirL7sj2pUl0UDbD5gW2LR0ia3YGfD/ycYr3DVoIfOYUwNg75oZZgr9WUJvGOTmz7exGdPRM3M@vger.kernel.org
X-Gm-Message-State: AOJu0YzEejuqBg5A16OsGjhdc0Hv6blcN6pA3W9q6l20GTJMCRkMAsF/
	B3QFCZO5GPjVRV5Vd4uSC6eL972WZz/wc1qCUOaOAVafZW42kKyA+LwUR4Vj2Sc1mHMeuc8FlbI
	MUyEzxgA9+a1Mf0x5SlUlaK1o5yq2CslXlBOhMHM+++E/RLIV+35ww75wz9V4odfQ
X-Gm-Gg: ASbGncsXGzstXJnPtGgvxXOa2dlb9kg9+mlrtMLyArS9vTnJ92Y0Zc7clxbgiIk8ksE
	gC6Lkfjd9aMxAvbPzWQiwIqsxTykVdvYHWG7W8QESypAlwxU5SmgPtrA6QYM26UjJmyPkMMDD1/
	YqyIoWEtkwHkmIRdCZ0Yq/r8BZ3uHboCns9EpdNjrIv7yMBqdLvS5Lf98RyY8vEsRgk4x+9LV0z
	0Z5Vv7MMRhCx5spIB8Kg6MYl/EpUts57zpOBxNsOLXw3/7JPhuMIs49fcplZlarrn9/hQjAS6/e
	WjWwDSHCB2s53ooYQhWU0KAdIYiqumt696cEizij0txeTvwq48/CPCEdPqbWPGPY1MfjZ0KIHZ0
	=
X-Received: by 2002:a17:903:228e:b0:229:1cef:4c83 with SMTP id d9443c01a7336-22bea4956e4mr4389835ad.4.1744318916237;
        Thu, 10 Apr 2025 14:01:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2LTJB2/RY/DdqKTkh2gKJbx/x6EreWNzJjdMoIjeJhs6Ywk/JJ+CEjjTpDEwY4jA5Y4atkQ==
X-Received: by 2002:a17:903:228e:b0:229:1cef:4c83 with SMTP id d9443c01a7336-22bea4956e4mr4389375ad.4.1744318915867;
        Thu, 10 Apr 2025 14:01:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d70dsm5790861fa.22.2025.04.10.14.01.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 14:01:53 -0700 (PDT)
Date: Fri, 11 Apr 2025 00:01:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        david.collins@oss.qualcomm.com, srinivas.kandagatla@linaro.org,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v3 3/5 RESEND] thermal: qcom-spmi-temp-alarm: Prepare to
 support additional Temp Alarm subtypes
Message-ID: <vsxqfagv557jiqmpu7dkt5ojiltsc6bqhgaiiccsnamcsn7eec@myowjpia5war>
References: <20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com>
 <20250320202408.3940777-4-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320202408.3940777-4-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-GUID: bdB2GB0xucJZDsKP8G-Bxrixi72OtyZZ
X-Proofpoint-ORIG-GUID: bdB2GB0xucJZDsKP8G-Bxrixi72OtyZZ
X-Authority-Analysis: v=2.4 cv=MpRS63ae c=1 sm=1 tr=0 ts=67f831c5 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=igDgIpU7c0FD-4j4V8UA:9 a=CjuIK1q_8ugA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=970 clxscore=1015 priorityscore=1501 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100153

On Thu, Mar 20, 2025 at 01:24:06PM -0700, Anjelique Melendez wrote:
> In preparation to support newer temp alarm subtypes, add the "ops" and
> "configure_trip_temps" references to spmi_temp_alarm_data. This will
> allow for each Temp Alarm subtype to define its own
> thermal_zone_device_ops and properly configure thermal trip temperature.
> 
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 38 ++++++++++++++-------
>  1 file changed, 26 insertions(+), 12 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry

