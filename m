Return-Path: <linux-arm-msm+bounces-51945-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B4826A68BA9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 12:31:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 206863B37AB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 11:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14065253F00;
	Wed, 19 Mar 2025 11:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AB3dnEeW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440A125484D
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 11:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742383545; cv=none; b=E33zItD0VUfNNTL933i2H28o6xSB/Z3B2MQpJohPUYgOdjNSzbw6FySvPj2q0zmj66Lp07k7N6j8YIcnExUMuAwPjecb/XEiBclUQnnprYhhIuDwrpBC0iSmbzgb8Rl8WSzWsF/pbnhOYcM4v8SuKBOV6VVOi4cVeMaeOdHvzfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742383545; c=relaxed/simple;
	bh=G97pExcAu0PFq+ScJqsmjK1BHFNAKdI7GjOBD7cMP8A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RFXA5+tlsfHB9z8ps+hZnGftP9dckUUIQ/oJCuVD6WBMYCSxhlnsCfTMs5STnagSMrHW7VIta0VdC0LeQc63oGYSrdYeTXslFin7O7CmYsHLpSVCfEVw43qpyfI+gVfVTijulEDcBF2EdrhKkma+894TpcQbLaJS85L4YNA0npA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AB3dnEeW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lhsQ013238
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 11:25:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RS2IohkXOLM+bk6KsKvQ6wp0e0hwiR+9qftmMovCgbU=; b=AB3dnEeWF6twrfir
	2nMi3tS3MpvC6JjXby39gqnTb5a3lpUqwJrwydoxrSAoldbLKHo3gn6ZR6GGWBQ2
	hm+lSv/pc6K/rUNuhSYGj4vyskKbbfm0nlVbg3zN9BUT4WjuLrrYVil1f1cH+hQ9
	3LNsIGeBx1WjoLVovNdLTpKQKldC/nqB2+c1RCzLHXnZe4fNSmVMgMV1XOtLGAdV
	zcQF/V80WnVoN4B3rN5ABC4CGvFrY7wDoWDhScUCbjJlPEO75EOXpuyX31dFDL7Q
	MIvktjQK6kSc47F7BoEJjE8On6nRfv2K4wsFmq4QjLu4dFPE+6lJYxO7nYb2TiID
	ET14+Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45exwtn7xr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 11:25:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c0b0cf53f3so1079285785a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 04:25:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742383541; x=1742988341;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RS2IohkXOLM+bk6KsKvQ6wp0e0hwiR+9qftmMovCgbU=;
        b=Y3kTvK+9ZSAtP7e4a08cjj08FwWIPnry/8CdBmUSqODxTT23oLhHQnL7Ziu4y8N1QJ
         xUrbEx1PxEBX1PFZ+Q+TDI4hv6dKlR9CcizHKwWpJAdVMLJQpxMPvEFPSHsyr6g2jyxp
         Win/NniRy9jApWug4k0jL7WtSP8yg8m7wKn5JwgMKEJaXKZs8ZXgXnCZcBiliR2YMSxP
         nYVSw91gbHEScsRWu5zmTU05kQiIlY8NbUEguuTbgXMXEdB3Zme+Lnex0l5OtnJxmmdX
         xcke2rKmvTtNs7FtKBA2CBASX8CMH32C+0OVcnUsv8NQPvoHPn+Cax+Qo1F2sBU9oG54
         +bYw==
X-Forwarded-Encrypted: i=1; AJvYcCUjoTAPv8l5XUHqkTvktrU1oAZr4WL4OQ13AL/uLjAZ5LzRDS1uI8LRwajBZV4Yfet2LbtRhG+jEA09xYn0@vger.kernel.org
X-Gm-Message-State: AOJu0YwSd8tq1iXu8BmDCBPKScZMWD/MNkJEetEE2no1trSwLAmtMZc9
	XbF5nbVId3WzwcG0LA8LfIo2gfQsjUR6Tr9iRR35l4Dm5urBe82VzqVrcd8s3VwagIvQ4yMDdkD
	B5h1VdaCil2XS5e7c7egUCOdLzjeFqTJ7cmEVCgju7sdDyytUbR0HsxkKi7n+wajs
X-Gm-Gg: ASbGncuk/lIW3k+tUBElSGRLJNDufpPbQIMvwahWaZkKMQCeiVN9Y7vSs9icvX68Yu9
	gACF0pItcNMBrmtG4U8XAF9Z2o47H3Fhx8NXMKqKLE2lErEpBiVN3tF3ephmnhoZT+62cs5BcLt
	b2Xd6eWrt8XGWuA1yxncOsWGQjNigkEZtBfN4xCOO5q8+UG1tSVMRr11EcSfSgzfSk7hSQPn/U4
	NAm6xEEksrqL30+Vvuzk5gNRBuoLlYcueiTyMD8noqEWvPRD/4a07FDDDhYmamN+PW8zm+VJbyE
	TqUTfAaNOW/Q5DMyTtTULvLN3Nqns6TE9fg9TkHIOsn9Vk/K9dVguS4OPZTIHBzRYqr3gpFe+8x
	DSSQ=
X-Received: by 2002:a05:620a:24d0:b0:7c5:5fa0:4617 with SMTP id af79cd13be357-7c5a8476bf8mr297508885a.40.1742383540978;
        Wed, 19 Mar 2025 04:25:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+M4Ay3bkSSMXAvk42WzvJRZcx+tU6meYqnEdTCmoW6vyM40oF2Y+SAylnNjCfGIzo+ChbQQ==
X-Received: by 2002:a05:620a:24d0:b0:7c5:5fa0:4617 with SMTP id af79cd13be357-7c5a8476bf8mr297504485a.40.1742383540448;
        Wed, 19 Mar 2025 04:25:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba7befe4sm1935244e87.55.2025.03.19.04.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 04:25:39 -0700 (PDT)
Date: Wed, 19 Mar 2025 13:25:36 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>, neil.armstrong@linaro.org,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
Message-ID: <vpumypwwywrxi54z6g6zmcosd4mbw5y33rdex4zdbzsymcww6s@5fsbhdy6vuju>
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
 <a5ebfdfb-107f-407f-b557-522b074c904f@linaro.org>
 <38cd738c-1a2a-4382-80f8-d57feb7c829d@quicinc.com>
 <91a5a1f7-6eef-4ea0-bcde-350640984a7b@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <91a5a1f7-6eef-4ea0-bcde-350640984a7b@kernel.org>
X-Proofpoint-GUID: aFneu6R3yPjRJ3FPyFAJG4YDO9KorUy5
X-Proofpoint-ORIG-GUID: aFneu6R3yPjRJ3FPyFAJG4YDO9KorUy5
X-Authority-Analysis: v=2.4 cv=UoJjN/wB c=1 sm=1 tr=0 ts=67daa9b6 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=aSjWYWIgIm4qcLF7YMcA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=999
 phishscore=0 adultscore=0 clxscore=1015 spamscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190079

On Wed, Mar 19, 2025 at 11:29:18AM +0100, Krzysztof Kozlowski wrote:
> On 19/03/2025 10:46, Baochen Qiang wrote:
> > 
> > 
> > On 3/19/2025 5:12 PM, neil.armstrong@linaro.org wrote:
> >> Hi,
> >>
> >> On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
> >>>
> >>>
> >>> On 3/19/2025 1:34 PM, Neil Armstrong wrote:
> >>>> On 18/03/2025 17:35, Jeff Johnson wrote:
> >>>>> On 3/3/2025 7:00 AM, Neil Armstrong wrote:
> >>>>>> In commit 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to
> >>>>>> single_chip_mlo_supp")
> >>>>>> the line:
> >>>>>>     ab->mlo_capable_flags = ATH12K_INTRA_DEVICE_MLO_SUPPORT;
> >>>>>> was incorrectly updated to:
> >>>>>>     ab->single_chip_mlo_supp = false;
> >>>>>> leading to always disabling INTRA_DEVICE_MLO even if the device supports it.
> >>>>>>
> >>>>>> The firmware "WLAN.HMT.1.1.c5-00156-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1"
> >>>>>> crashes on driver initialization with:
> >>>>>>   ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0x3d soc_id 0x40170200
> >>>>>>   ath12k_pci 0000:01:00.0: fw_version 0x110f009c fw_build_timestamp 2024-05-30 11:35
> >>>>>> fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00156-
> >>>>>> QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> > 
> > this FW version is not upstream yet, why are you testing with it?
> > 
> > Generally we only support upstrmea driver + upstream FW.
> FW does not have to be upstream. We work, here in upstream, with all
> sort of vendors and all sorts of devices, for which vendors might not
> send yet their FW or we are unclear about licensing rules.

If you are working with non-supported firmware, then, basically, you are
on your own. I think you'd get the same response from any other vendor
shipping firmware files. Consider reporting an issue to i915 or amdgpu
driver _and_ stating that you are using some non-standard firmware files
that were not provided to you by the corresponding team.

> Regression is still regression and stop deflecting the discussion -
> third response now! - what you internally want to achieve.
> 
> Upstream does not care about your internal processes.

-- 
With best wishes
Dmitry

