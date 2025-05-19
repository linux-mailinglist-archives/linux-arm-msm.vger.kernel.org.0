Return-Path: <linux-arm-msm+bounces-58436-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DE6ABBBC7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 13:00:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 52A7C3BDF15
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 11:00:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2F6278E47;
	Mon, 19 May 2025 10:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BAbFS1rh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA84C278169
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652341; cv=none; b=VlQyB46zTlZEpLBRpwqajqjWafB/VqlfwwF2KAlE/AYHe6Vnhmq4BVh3WG6H0TDjN9uW6lq7PACKa/9MWaQP53G5jeC0yrAwmdGXsEIzhmaXBHGloAdW8uBvbvOO/xrt1x1A1dijt9T5wF6P0WK5yeHXsFyBMOhqD+QuXB2R0TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652341; c=relaxed/simple;
	bh=/ICdIgsZCLiFOWiy0bHvTki2ux4cADLvJoe0Rkr+3xQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N4h3QF9vsB1Nm+od7EiPyvkdSTBUJL+rbgkNs509DpD4U5io2A5w1DO7xhZW79q6nlorxojGp3wHVdLn1nOU1BJ8PeZZA1rIz+7U+gbvMjJ8RgxZMPDCaaKK9sEhU0n9GjwDwi0Fp09/gM+1+kQjoRq5YrmBu1OPHHMFOfnyF1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BAbFS1rh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J8dWG5002784
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	omTmMTjzao8r/tsXZJssyYTmJfhC+uEyAhGGLwohksw=; b=BAbFS1rhNBHKavJV
	qSL8Xi0XQedgmHLHnjQrAA2mpxyN+8g7vZjXqbAyTUQVko1fCGAwMRQUMGT2x5zE
	h3QJhpKHYYVE505gslaJSZ75Yrm+Rr4o260q/lhhut4d7tjdX9K+J7SyAZc3tz+R
	9D5ludfSKKSxvQ3fOT9tNFAVJYvh4cLu+ElW95pVo5WAZtBuzWjSVFbL5g+IyvXi
	IEYaBr6jkSYf/aWoKx79L0tJjpJ4YINTa0xxqrqilhYmdBksto4j7a/Qi2xHuSiF
	SeiMFoCkzONe6ic+gM0S1MJwNQ6DIUBm2lSZc65ynOUYQlPFQdzuBA+YxNU828Xd
	QUiUXQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r1atgdra-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8e1d900e5so1041636d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:58:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652338; x=1748257138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omTmMTjzao8r/tsXZJssyYTmJfhC+uEyAhGGLwohksw=;
        b=gsTpEi/kfEALttyLqEU53Mz5G52B1sQU8aNmU7o4ZuPC2SJ2fo6hKzlVcg/2+3YdeB
         EruF41ucYNowi2NzzTWfVOMWWvcxrS2ktjTRPPrkj10Po14/pfRg+TPmS0XHP7huMl89
         suYOPmCE8D9CIXFGDo6ZUlLwgjs7d1JzyXK1VREGlijBWFNGAL4bEy9reZA8513sFJUk
         /aYwtB4MaMUcdPOFDArF3G/19uW3eZPh81Mh9uIf/p1fSekpYmoVWLgADfXFNhK0TCnj
         f3RJDhiOfMDRhvEYWQyO3H3uybbQAagV/e3XGS69+APg5seFbtzJyZAfLTUIfpsENwGE
         M5Jw==
X-Gm-Message-State: AOJu0Yxd+m1BOm7tiNsHEFeHjMmv1vGn+LRvcbdDJwWHjwUZwRG2bTIY
	TdlI9qrShBls5xyoq+xQGYCqzS5hUPSeAvuyyroMXq87BdcfN+Yw9rsn1LF3JBzX5OxLsLXhA3Z
	+ocDsZzVnDj1KKW/GHHIfBV/3/5WA59rpH4/o3iHbdVxqwPObJf/1VTSVIqbck1rc0Sl2
X-Gm-Gg: ASbGncvVDKaciSmKsuxQQbpIdp1ejUhADcSjzs6Fm9zbST8VASDcPrHPC4qu8L60XgR
	13Hgxhjv1g5FSMGT37dG+dUIgbLCvVpCyq3lJc9icx5exL1wG8rZIB+SdGvljW9tmGQHjMCZm3T
	D4fPQO2hGlLDUpGkQO0RfgREmoP/lCK3mZ03p92tVRgQMfGAqbUjXVw/UWwtXqMlzLQCsf37YqH
	xib+9Y+iwBGxIW7sF0QAc/l0SrpMEt85pUGGxfpJlrSL9BobHWy+5UjzgIfUtYSmft7ub0Wlll+
	QLYMhm3iF6n0BVUyWRjA9ElkxmJBZA4NrtW7Tmh/7SlEv5SxaIwC8O3z7qR9+lTkLI4QIJqMgsd
	IHxvRRILYaCVkex1D8z/UwlxL
X-Received: by 2002:a05:6214:2403:b0:6f5:421b:623c with SMTP id 6a1803df08f44-6f8b08c007amr242240486d6.25.1747652337411;
        Mon, 19 May 2025 03:58:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5bupC0i5Ur09/y0jWLEVLMby3ucut88EMhL3xZ/vKxRnjyojUQBjAnzwYO5Ao3ovyMv0MKQ==
X-Received: by 2002:a05:6214:2403:b0:6f5:421b:623c with SMTP id 6a1803df08f44-6f8b08c007amr242240186d6.25.1747652336691;
        Mon, 19 May 2025 03:58:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 0/8] drm/msm/dpu: improve CTL handling on DPU >= 5.0 platforms
Date: Mon, 19 May 2025 13:58:39 +0300
Message-Id: <174637445763.1385605.3424290525961139531.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
References: <20250307-dpu-active-ctl-v3-0-5d20655f10ca@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=OfqYDgTY c=1 sm=1 tr=0 ts=682b0ef2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=eF9K9vx12itGwMwpEy0A:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 2F7yTEYeAyDV-y3a0Q6lxnx3D3lsQKEQ
X-Proofpoint-GUID: 2F7yTEYeAyDV-y3a0Q6lxnx3D3lsQKEQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX8yx9v/tgzNZ9
 8Bm+MlgpZbgAh5tSrprPje2kOsbDiGnDOqnUAl55XssbEC1s3u6Z6r6uu/aq9yz2wG0TltblpsK
 e0qNfhxt6dClV2cItYFMGlDJ6T90kVwBIo2ZgTKUVG5hParYpXTZRajMjPhzBAfbVnVKyrsxfI9
 oPYl0qCzg+3EHouHxzb3ul83suRQaIDLNI+w24YKOmIS2BTR7mxqE5VPgZnk/z9DPVCOgnnpE2m
 PXTbFvgSn68h/kZ5GueL1NGLelP1zPFM/75ax09Gh45iDqEui9mC+ooniHAMcxkhn+Pnwk7LTYz
 F/uIIOh5Z/iv24n00UHfpHbAb7dVx/0y3EtLo7XcIWneU0IY/saHRSOoN2ruWKrjAc/NF5xvww3
 3gA9Q53Zi3XF06LRcpd93pShYY0KWblSmzZR0e1x9KkB9KrhbgBH7AAeG8ISzmS4Ju16r/Bt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 spamscore=0 mlxlogscore=785
 clxscore=1015 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104


On Fri, 07 Mar 2025 08:24:48 +0200, Dmitry Baryshkov wrote:
> Since version 5.0 the DPU got an improved way of handling multi-output
> configurations. It is now possible to program all pending changes
> through a single CTL and flush everything at the same time.
> 
> Implement corresponding changes in the DPU driver.
> 
> 
> [...]

Applied, thanks!

[1/8] drm/msm/dpu: don't overwrite CTL_MERGE_3D_ACTIVE register
      https://gitlab.freedesktop.org/lumag/msm/-/commit/ef595c04e843
[2/8] drm/msm/dpu: program master INTF value
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6a013b60cf44
[3/8] drm/msm/dpu: pass master interface to CTL configuration
      https://gitlab.freedesktop.org/lumag/msm/-/commit/696707d3d22c
[4/8] drm/msm/dpu: use single CTL if it is the only CTL returned by RM
      https://gitlab.freedesktop.org/lumag/msm/-/commit/df99bdfcb2d5
[5/8] drm/msm/dpu: don't select single flush for active CTL blocks
      https://gitlab.freedesktop.org/lumag/msm/-/commit/e93eee524bb7
[6/8] drm/msm/dpu: allocate single CTL for DPU >= 5.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/c1824a7992da
[7/8] drm/msm/dpu: remove DPU_CTL_SPLIT_DISPLAY from CTL blocks on DPU >= 5.0
      https://gitlab.freedesktop.org/lumag/msm/-/commit/a2649952f66e
[8/8] drm/msm/dpu: drop now-unused condition for has_legacy_ctls
      https://gitlab.freedesktop.org/lumag/msm/-/commit/1fb28a8a984e

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

