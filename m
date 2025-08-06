Return-Path: <linux-arm-msm+bounces-67839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4347CB1BF5E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 05:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E15AA188A211
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Aug 2025 03:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 301F41E25F2;
	Wed,  6 Aug 2025 03:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ky5hYJjO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91C811C2335
	for <linux-arm-msm@vger.kernel.org>; Wed,  6 Aug 2025 03:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754451285; cv=none; b=Ds8TfULSTQZEmjx8ChGgK3e0w6BICY2CIrTclRmgNcYIUEkmd4N5bErzTTzqyAkYab6s4Rq+mlXFMvPDh7E4wtkusPwuLM2nEgJMBm9deNfizTGWT9UJXKf6fPBKmMB/w3q3TlpszgB7wc2KvWuqmvzHhKIL0Bbqs287nzVIQwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754451285; c=relaxed/simple;
	bh=NzrlrfT7twieWqubi3dpeNuoCN+FVi0qfUc+p3YFJVU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i4JKeyca1mEHQmKFmGG29XBpuTXo0Y0o+UZ1OAiXYdyoS027XYIEQcY+/wdgHZ5crsaFGJRUgzZw8d2erE1Qy9DS5B8/wtVEAbGGGEv8gKjszK8LL7z6RUxXJgeyi9BGvuuJffCkLwvFkhhRza+mELgJ4mh2hIaTHvuGPdlLOyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ky5hYJjO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5761f8pk028575
	for <linux-arm-msm@vger.kernel.org>; Wed, 6 Aug 2025 03:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vth/2Y/jgsPixg8dhAKuw2SN
	Go8Ue+WIsJu8g0n76us=; b=ky5hYJjOnww1R/xoC4N1pXPVFWroBLAe5pfNyjWy
	66AqCAs3NHStzYDJ1JJoL1iWs74SksGM36HfTCwAAgFPNjW1KEV7oTQAeJA00FMx
	yzDWagytDuOdPwbVUdq6SD68LVW1P/Kb9epzZcap+Jo+d+xDmUyB7PCv/XhUiKrM
	3Pmv6UvuVH8x+0DhWSROpkExfXOF0dukgqXa7sZ5PbCxQT/p7c0/cPJ7UOKQqdVG
	XlmsoePLIo7su/iy0Jt2gdYAo7pHIJ38NZpU1i2Yoc4CMNqkICZ8ssML8FKMKj7N
	+x7uoip+lMbk/nGPVUqZpRgm59TpRWPfsYsqcNIgYxdGZQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyb998w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 06 Aug 2025 03:34:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b06b67d99cso67955851cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Aug 2025 20:34:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754451281; x=1755056081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vth/2Y/jgsPixg8dhAKuw2SNGo8Ue+WIsJu8g0n76us=;
        b=a+fMOPQwzLhAe0ckeQzRpo2Xmv/CUv35m+esEp1ibv+1Q9Y1Liiu07BqKraUwbfpqw
         VK0clo/5etMno4EpRP31ao21QK1ctBE38tdfKKGPHFeElyIqmXlauZIt5fdU4DFU4+vy
         ERamkerM1x3YapxV6YU0szss9YY2qEWFtiXTOxYrH+xsE+5w4xk13c4fxvEvQRy1ri7X
         66gviVH6HitWkRgG4KKCNtPFxVQLkl7kIizPVlQ8pezR17QXy0gGib7/JHn8r4ktGxsh
         6P7sgauAzmSvMKdJ/UT1rqVZ/4x+auD9R3dtAQp4N3qJQsFQCngIEUYdySOn5X/fj4QF
         AFbw==
X-Forwarded-Encrypted: i=1; AJvYcCWzstnBga3pDQ77yt+9KHzoSuFc+LNRtn31yYQHvx4p/kc5j+ghbqdR2qIcngSDTrlJTQbvxc4BMZf9RTzJ@vger.kernel.org
X-Gm-Message-State: AOJu0YxApX04nz0yJdRKKidftjMa80bI+C3MOoNqzn9YiDbUp1+9P3mz
	Yxr2ci/f9IPY8dkQT+VpFeBlW/xri9Sd3RNDzyeHJcJTOodBEi+r9k/GWnFTw6vHPjekK1UJL1I
	n2CHSMJM2EHZMMFr/w2Fu9CoMXW0w5yE96liGQejmQMHhSEFH4gM8P1okRJ//7zzRXFGj
X-Gm-Gg: ASbGncttVGIRvymqpf2AoB/SiRfA5RopnDJjt3+c8I8JFZKv9IDwuWBxsqW7aUWnsD9
	QWybuZY+g9IVL68c+ouWmnvQboAzsvMGB0tkU5LoZrfA+Zuonihngoyzt+FKRCBsvbUwZCLlaax
	OFlb5N8jKw2ibnigDQ0nmC40BU711qgYeExtVdfitvc1gcdSzeVswD89rpHBUZkECWjzDMl61oL
	tRnMZZlWZj10vAl5pu0GPDWfL1/b7qgO1FEWniH29Xyiu7jmv4NivmNxTjlPK58pnj3U6zDK59C
	S9d6XkGwNV4F/v311JyfxrGQEF1Bu554uJ2Gec9Lq5gLV0IQq0zgy7YJqB3eOtIMJobFq4th0ol
	3KJnwy3NTKJVYQL3j7Rf5frhEY/1301SpgUopAcUc+nqp+dJ7q4aM
X-Received: by 2002:a05:622a:5a99:b0:4ab:5c58:bb33 with SMTP id d75a77b69052e-4b0915e48abmr22499061cf.49.1754451280645;
        Tue, 05 Aug 2025 20:34:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7vcXFUJ30iJDUbRPzNDGIhCemggG/HQOqpvhQreed4gLOPOyKQ2xyiSwmnN889jRgtv0Jfg==
X-Received: by 2002:a05:622a:5a99:b0:4ab:5c58:bb33 with SMTP id d75a77b69052e-4b0915e48abmr22498721cf.49.1754451280181;
        Tue, 05 Aug 2025 20:34:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b8898beeesm2165977e87.17.2025.08.05.20.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Aug 2025 20:34:38 -0700 (PDT)
Date: Wed, 6 Aug 2025 06:34:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 4/6] drm/msm: mdss: Add QCS8300 support
Message-ID: <edsul4zxzcgg2lglxpor5xlzfq35c7r6gmw4o3iermf4z7ftpr@elzstjjft5m4>
References: <20250806-mdssdt_qcs8300-v6-0-dbc17a8b86af@quicinc.com>
 <20250806-mdssdt_qcs8300-v6-4-dbc17a8b86af@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806-mdssdt_qcs8300-v6-4-dbc17a8b86af@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfX6G1oB4DuoQHL
 2Cvd4A2StF8WcKWODutKisKp44kOehwkSD3GjQKHVUSsWynTd5p22X1L/hhgO6whpzQFEobAeEb
 tqEukkKAakBTQ0nybbBHM4dgw5twpCWMkORldCCLtaGiKQwNAKXwE3uc2r26/vozPw4IwJuOYL3
 vpn0qLelT2s957EBzD5D5A9GcM6pMaGAo4jGICPAShu0i98gD5Ib2HVk8G4UsDijPkWKnCdB5g+
 DwqAUFkalnKNrOG7zucShPv4RFO11DIw1Xv34e9tYDspBRC2gQkoVV5MOw6qzQLDS2qFClHPY3y
 Vyo0xBxWYeNsHcGuTrHVZJ/PS14KW4zPB58Lhd0+9h/8p1FlNXDOSJY+2u934gmBVMUBGie3mz5
 LmusCCDG
X-Proofpoint-GUID: nYfN2phG-bh3IwMC3cxzvOsDesbUpLMP
X-Authority-Analysis: v=2.4 cv=EavIQOmC c=1 sm=1 tr=0 ts=6892cd51 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=COk6AnOGAAAA:8 a=FdNK5TKXhCwMvpUfx80A:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: nYfN2phG-bh3IwMC3cxzvOsDesbUpLMP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-05_05,2025-08-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 adultscore=0 bulkscore=0
 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009

On Wed, Aug 06, 2025 at 11:16:48AM +0800, Yongxing Mou wrote:
> Add Mobile Display Subsystem (MDSS) support for the QCS8300 platform.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/msm_mdss.c | 1 +
>  1 file changed, 1 insertion(+)
> 
Nit: the order of patches is incorrect, UBWC should come before MDSS. No
need to resend the series just for the sake of this change.

-- 
With best wishes
Dmitry

