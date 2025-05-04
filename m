Return-Path: <linux-arm-msm+bounces-56715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AD9AA87DD
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 18:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D01D33BA28D
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:15:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B6F1F4615;
	Sun,  4 May 2025 16:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LmONVYak"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613F21DFD9A
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 16:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375235; cv=none; b=jhqrFGtm1TKEK4Whk1mXzGHiPgIQYyzW4QcaUw5TJ/qSe2X8Z/Afk9nfuyO/AIrVbdc4Wtbpa88ws/owpv+tx3U0tf7/LVSo9p6RvpQII7B60LHC6CbN10r65Pf7EYctsx8OkdF5KnqjQUWi6ocRUIQJQVnGWyCJsDK2Q14O3JU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375235; c=relaxed/simple;
	bh=/ICdIgsZCLiFOWiy0bHvTki2ux4cADLvJoe0Rkr+3xQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D2Clw6Y/eQjioDtgk+3Xmy9ElvgPbsG8rB+DrYEreTxsxXMTt+Y9+mrl2Ldd6RlBJOIyNRxKgKt+G7uUuI3O4RsjCuFEC33hKjRlK9CGdz/AoSvpH3aJ/3QysvIOPd3O/IPu2qMJ9ubusv7A1NNbRKcuJ3lF6nWe+Nu7RscuGhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LmONVYak; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544Acg25024804
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 May 2025 16:13:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	omTmMTjzao8r/tsXZJssyYTmJfhC+uEyAhGGLwohksw=; b=LmONVYakU5On4YwI
	K/8SSCmnVuzn/lniEHJYfUvHN9yi7Hv/m5ZrRAWFUvuTzsOu4t1tAMHV3FFr6S1e
	eHWiRmzvejKhLSbegOD44sOeuYQzobaJxlzvogIsc7CDV06demUwO+vAYM0QX/xQ
	J9pynUphAJHcMgpFLqTRAbB7YiyftEV9/z1nUGmx2zzOhMvDDgg2f1YUwMIH58uL
	SVWAUjAp2g7k0R6FZxf8aEfTUFAn7aWodRxGl2eq6R02g1gik3lG85ODRG8uY2Pm
	QLBHglAkgLqI8G5j0RkEjq6zOxBsgRKXvCDFVPlX43oTtkS8pjGTaqwMsxXK1Fbb
	V1Zx8g==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rt82x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 16:13:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-47ae8b206a4so70681041cf.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 09:13:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375232; x=1746980032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omTmMTjzao8r/tsXZJssyYTmJfhC+uEyAhGGLwohksw=;
        b=GxcLk1RTnMKmp2tKvPz2PN3Yjr54ADohEGuJ86IltgWHIJhwjn4OQmMCEaOJFqQCeh
         pbZXXV09JJr2YMJCcWdfdxTj1EMCC2d/+CtJWPVQcjlswCOlXPzCCgMu0cZrkTHCf2Io
         hpSLAI2xby7ba14LBP3dHgl0mXoWopyW6CZMYU/4/xEco9I39zexcEbfoH28i7ufgKD8
         0BgKF9oEvpBDwD+oIYSLfq7h3Ef4JLNqEKmI4a7yo9kYrbglxs1PH6nP+g7Jw3bCwZ4T
         XM9C4ZLCoeT3INB9fFhbJpF0cQ5dYV0TA0hoBQ08MgQgJ19cSjmxAGTfZ3z3Nhp1/nbB
         4zmg==
X-Gm-Message-State: AOJu0Yzg5oMEzA5Susdo92AoOx4WEGZadKWxIYHfEME5bNaSYdomC6ZB
	rKGnj4lVbhlaxl2X9GkuBSQml7/Z0dvxdOjb7Zb48n/XdjXGfQyeZcesU5Qj9D7LCJ7YVYb55yF
	BdUQ0n94AW4nINK12iCDxROnNu59n2gVRpLeXh5wZ8vLK48HBJXRwwVZQF9mc0Njf
X-Gm-Gg: ASbGnctG6DXZrlI9Em7XCoi/SSWFA/iB0W7j/TeZ3UB0sSRqXGOTsMvv19craLxxBzx
	3B0d1hbqbVqCdstBIjLLjo4O5vSYLDp96TszGfCrU3CDx6bqBBvHS19tKp2FB9M/Il12CmXYVj9
	4Kbh7LGOlBb+lkIkkeZalaklAlwD99ktUMbyBH4c+jUTGJo8T38knME1LQ7DL4FofKTk/Wl+j2O
	cLVG/xUnoCVE6+J0tsfCveui27yYTnB+Ct/Ijg0FY/04A95fI04YKlMYX/N74jeIPUvECBtSOUB
	oNZhezioGKQtwabW3XP1s5SuyIvwsMTh8S/6Twzrsa8XVaKpM+Ko+0+g+ieyJPRqfrRRSviRhrh
	4cNCmYlSXRirw46QMUZaGzYia
X-Received: by 2002:a05:622a:156:b0:478:f747:1b7d with SMTP id d75a77b69052e-48dff3e0b0bmr64028261cf.6.1746375232023;
        Sun, 04 May 2025 09:13:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXgRrtx6olNcggB+aVm/YJLIey1orBelxtWUEM4zIRqs1O2BkE2g6RkrgIdsjcqv5AsaJvNQ==
X-Received: by 2002:a05:622a:156:b0:478:f747:1b7d with SMTP id d75a77b69052e-48dff3e0b0bmr64028011cf.6.1746375231753;
        Sun, 04 May 2025 09:13:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:49 -0700 (PDT)
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
Date: Sun,  4 May 2025 19:13:29 +0300
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
X-Proofpoint-ORIG-GUID: DWwHTPvQBmT8BvEh42wmY68O7W9ARTzY
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=68179241 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=eF9K9vx12itGwMwpEy0A:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: DWwHTPvQBmT8BvEh42wmY68O7W9ARTzY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfXxDI4qNi+phGC
 zC0s/ylbtJ+VMPpaIdXDgzBKldnZyX7OrQzENVLJzGonphYii9D/zGVnSDSnhVXmsU/YMeyjYxx
 sz2lmHkxTfvKb9Id37tIohLy5nqZXvyzUIT8nNIW+/SWyLaqz3QsvcvJP/1RRD9sZ+BWc4nyaFf
 oDks+SzIrs4wSSBTTCcxY47+GW1vnTr7/Me8Wnp0CoWZi9oyFIOGBT+BCQvaYbzNBiLLLhL6ldX
 SpmIe3IdxGhJrqFsAaFZdHcCMlSamC+gg6iegxoIRQ6iLfzapNZVq895kYabqejjaC3vDWOkFAx
 A5s+lUoL5B/AyGkzRkxA1ufq5+mRKZdsZsIiwi1Qr+cTPgEWs1kPA4PBfsNdkNfMj1CDgGM+Nkb
 kWcryZjVLzVZr9EjmkJjfIJZHiwHVSgalpbKjF0CnN/W4psSamZFmkuVivXHVrjEtR5J3GWQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=763
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152


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

