Return-Path: <linux-arm-msm+bounces-65614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13F95B09EF6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 11:17:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4657B176E85
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jul 2025 09:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0396296163;
	Fri, 18 Jul 2025 09:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pYXNZ6n/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 507C3215F4A
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752830219; cv=none; b=RHFbPXTS7PeVrk15FYa5JhHs9Lj3L16gAyFR4ci1O3lgoZzp224EVEFNfzXlspIapktZepEksYggzf75JY4bZ8KCSF4/Q6WNhM46tnk66SgsVvByBd0N/9SRcR0WT4dpd/HJF6OlQjavTHwBXVf7yLIlkdpctmZYegbZnkCbrJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752830219; c=relaxed/simple;
	bh=15bWVZVSnTIFduZ7/xHmgAU9e3VDjJ/VB+d/vR79urw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pAZMmxBETOMOzmTpj6BedClzdoEnHT1EdchI1YEz5JqWR6zwEuMABHOwd/XO3n3Ijph5II6eLw1czfGrHnJNUHvZ30cqVZi55CS+Oou93YS14i3wkqwWDEl9Fyp3Y+UPD0xoWcJqR6FI5J6Fx6NCnGj/E0SfJrGtQQRQHmvY92I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pYXNZ6n/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8UFpD025177
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pYokExG8ocOnk32ffLPXtOoL
	wlbRQtxlYfSR/1QHzsA=; b=pYXNZ6n/YlzDtpShATqmFxwAfM6AIPdaYXLHCk4k
	FWpViIuBFfRz+pJgUJ9KHeOpsGbRG8JID1Qc+01Y2uewLbxA3+tVlUlkaosf2vdg
	qbuPz0ihK4rBo2vkdONdUoMz9PwCis0JHEgF9oFl6BK1s0ZALsu3CethPwYPn2/2
	U4zE2BWTMcl63GmB11jJ3qx7RSoACP7Fl5TTImWIXbTiLCyVyHPlrXAu62G99JYb
	FxiMZMe6/cthvQIO8BhOlZgyyDwCULfo9J/jVRsKeOR67K5IoK7fjRxopxhaTF1X
	25ZIYoEHqCfsX61bXxtVlR9i2qeOwoUkIfjnxqKVkWMS/A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47xbsqf3bb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 09:16:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7e237c2f4ddso251012485a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Jul 2025 02:16:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752830216; x=1753435016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pYokExG8ocOnk32ffLPXtOoLwlbRQtxlYfSR/1QHzsA=;
        b=LtZZeVLhak7w1nc4oHXlpZQusxR/wMA0M9pPTGLt8RRjNKP3KTGCqMYHXiPp4m8ir3
         hcI/jJMekGkAMHAM3OoHb2woTnOMa0f3DTgCoyyOdwFKT7JTv9K+tAcW1lnSl/mW+RuQ
         tZQPysNZG23Nc/44HvQqRgYB998tIpJ4HPNnsfnyYmobK5nRWN1uz0b/1YZdIZy7iXB9
         qaAoWFYu2rM5Tp7WCdUyZZ2ODd7KhTxobHSFEcYXRtVlW96rakTukC8+J09USqlTeMsA
         UPR8oM+na20kHPv1P/nwmxhHBLO4fY9UmcK8JjzFGLxTTZPV04lVtqPRT1mhOJMWekXN
         SgCw==
X-Forwarded-Encrypted: i=1; AJvYcCXlQ3RK8BDtDbDuY8dzDUUbDKu/XxPu1S/FQavBKtuT4TA4bNnRq+edssy47jjXPhY+DQOkPz8gRu1YyBSf@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcy1BJmjA4n2nLBp1gaiUlTakyn5GrNAtbyEOQvouqblMJ11Hl
	zIUWOv8cz1qaSsCzdytYK/V25HGiBoePZarXs7A0jmAiCAsblENfNBOd887/zPKNS8aU6oxA2EI
	tocYXiMcXaMyNI130DqVdwJLEXQwBpYQ6J8qkVhbSjVuzWj5noat4DrrwNIWs2L1yT7fG
X-Gm-Gg: ASbGnctMKpkjeXP4x5LE+xSunV1nlQ5Z0vyGUofu1nZBEFSb5CN2r+1qJvrctUQORrP
	xaPZ1PgEcSjHGhp9XxaISZEQdgvhtOndsLmMuscezVXG8Gt2C4p7Vg5smEPAT3qD0pXSG8iKfBB
	P/TdpIAWS5E6ZtL3QdUxUSKeFKcKikLnW65JXt/Yrd6KgUq+6q0vGbOZ6VlBbsHFug3cWx2Yu44
	3LwYp/GTtZJWkvagcOeUXhE5jDqEfiBBeFMl6lWH7XAEeSjamgFIAs6SbxcG4fq2iloN2cZlhTu
	4Fa+S6VJkubTqAseZ4dksurD81VflKCNI2pOSDhJgIeLVuuvonhVX8uqjTblC9Z1rRFjk3MRiVj
	MnCF2EWvzM5ujlrpleU1jlhtFjBWyQhKM7F5ZrB+AtkZQF1nRmqyz
X-Received: by 2002:ae9:e304:0:b0:7e3:2c2c:4ce6 with SMTP id af79cd13be357-7e34d9abf75mr544629885a.38.1752830215897;
        Fri, 18 Jul 2025 02:16:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0z4h/bNYjkTKcJEdw5AHQ4fY+3EvQdQvkxbqzZEQfmjF2dKwRZRVkd1oo0FyAL9YgvMwgkA==
X-Received: by 2002:ae9:e304:0:b0:7e3:2c2c:4ce6 with SMTP id af79cd13be357-7e34d9abf75mr544626985a.38.1752830215310;
        Fri, 18 Jul 2025 02:16:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31ab0fe9sm187324e87.80.2025.07.18.02.16.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 02:16:54 -0700 (PDT)
Date: Fri, 18 Jul 2025 12:16:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Danila Tikhonov <danila@jiaxyga.com>,
        cros-qcom-dts-watchers@chromium.org,
        Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Yongxing Mou <quic_yongmou@quicinc.com>
Subject: Re: [PATCH v3 4/5] dt-bindings: display/msm: add stream pixel clock
 bindings for MST
Message-ID: <x6nqzxuz272j4on7e7s5loitql2zhrlcojuydbhka4epb4b4di@vencjok2tfmm>
References: <20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com>
 <20250717-dp_mst_bindings-v3-4-72ce08285703@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250717-dp_mst_bindings-v3-4-72ce08285703@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ad1hnQot c=1 sm=1 tr=0 ts=687a1108 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=TLo0AdDBy_HI3n6x0gMA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: mldvuDwaeMlNVapJBQYtRKu41cvYgS8m
X-Proofpoint-GUID: mldvuDwaeMlNVapJBQYtRKu41cvYgS8m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDA3MiBTYWx0ZWRfX6dLQZ5R6MU9x
 EgyCNx/omAOUagGbdXX/MtitgR7I3WzFDgS5rrSVgcTdp8qQfVM2XiY1jbTEnyGU8C/QVxVFVvE
 1n22WMxe8At2CJ35KkdAH99ALINJQC3zyW5hy+aGb8HabfDa+dUgWJWcN30oSX+eDyRR6gCRmyt
 z6aPYGB7n6Ic71Iwb0hO4G5Q9yOJHOVPJdcZQG51YVGvcyoEUjVNUSq/qVcflJkSspUOaUAEch2
 2PE5K2vIPIse3jLLYqpNdkZRetTVMI4vl1NEkDPjKLFxwO1NzWUmz6e5ShSu8s1XkMX6cOC5EPA
 KzvlTRP52NjvmL1ucXN042yciEOD3tf//Ai9n0Hw+zH1htLRlE43YrANY/BFcJD6WuMr/hbOgB5
 j1kJuuOd8Vli/n1BlimImaX4rax7UhoazXNHaSgMbxapRj0wNLcv4Q0hZBYQHa0bwresGobV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 mlxlogscore=992 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507180072

On Thu, Jul 17, 2025 at 04:28:46PM -0700, Jessica Zhang wrote:
> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> On some chipsets such as qcom,sa8775p-dp, qcom,sm8650-dp and some more,
> the display port controller can support more than one pixel stream
> (multi-stream transport).
> 
> These chipsets can support up to 4 stream pixel clocks for display port
> controller. To support MST on these platforms, add the appropriate
> stream pixel clock bindings
> 
> Since this mode is not supported on all chipsets, add exception
> rules and min/max items to clearly mark which chipsets support
> only SST mode (single stream) and which ones support MST.
> 
> Note: On chipsets that do support MST, the number of streams supported
> can vary between controllers. For example, SA8775P supports 4 MST
> streams on mdss_dp0 but only 2 streams on mdss_dp1.

Then for this platform it should be oneOf: minItems: 6 / minItems: 8

> 
> In addition, many chipsets depend on the "sm8350-dp" compatibility
> string but not all (ex. SM6350) support MST. Because of these reasons,
> the min/maxItem for MST-supported platforms is a range of 5-8.

Do we still consider them to be compatible?

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> ---
>  .../bindings/display/msm/dp-controller.yaml        | 36 +++++++++++++++++++++-
>  .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 10 ++++--
>  .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  6 ++--
>  .../bindings/display/msm/qcom,sc7280-mdss.yaml     |  6 ++--
>  .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  6 ++--
>  .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  6 ++--
>  6 files changed, 59 insertions(+), 11 deletions(-)
> 

-- 
With best wishes
Dmitry

