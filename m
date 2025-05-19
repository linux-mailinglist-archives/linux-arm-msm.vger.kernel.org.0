Return-Path: <linux-arm-msm+bounces-58435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0299DABBBC0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 13:00:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBFF1189C396
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 11:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 167C5278173;
	Mon, 19 May 2025 10:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NjF/tVJV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3F0275871
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652340; cv=none; b=L0zNy7eeOw1zh6kUHQ0Jf6FhHhe4BV0F58cQxTx98agpvMKgwGRLSLRd0YSNl0ItNvabGcktdne4D8ejHBCzU0u6LKNTEf852VWbKo0DrZp3R5gsmvfmZAcrZgXVkm0ECplZHKc7CweKxCJiCSXnujc1gXi+88e8Pje/3s4mpvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652340; c=relaxed/simple;
	bh=97RKXDzDoG8OCb/93VmDNkU0PVNnI64ZdE+LfZVjE8E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SP1zjo/PnqFkyr5HEJ35w8orQg86cQrtVrE0LpTBehLms32/yzFyiDLPYdHeM3Rj+wZt9R2li+X6jwhXyPzvCbRQiMD7jdjvpp8TiIBEgr0W5Ni1728RzkQJnMTTYaWeoTV6o9ys6mLVdq31WubjCEzlPKz7zafUjQVLDiGBjts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NjF/tVJV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9IMah008335
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=; b=NjF/tVJVpJp9dnFn
	yL97Jgn2iUw0DjUTbHctm9R+QtGTwvfaFe88tvwg80d+A9CDrCNtQyDuRzC+lMs+
	KHvSdl7O9WApTPpzDiP1Pb8qXvc8OEh5PDpMj4al3sSsMXeKyOGJe2l6CaBtR75t
	GxJuuFCOreqNhlM/DAWIn7sTfncYev5bL0rr78iYBf9W7os0Z3u16f6FWVviStwm
	gKyRpWKw5XbAigpZCWADerZ7qZzf7s+9i7Sxls8yhwY5+YtddipxDvf1J7lxEu+M
	YI4626r0kYCln6/pHHH73sLlXwFLe++XUUHQ3/FvKdYG8hB+M3qyVvgVgOcGvTvb
	BrhoZQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnym4g9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:56 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f2b50a75d8so65914886d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:58:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652336; x=1748257136;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=;
        b=F1gnp8l9vaesr/A5wsnxnA+Ow5mTOF3uB2fm45qx3yarni+FZe1BcM2jeD6B0oUgBr
         Azg3uzT3Qq99cuSZmYJmzma4GKH4br/xOtTc+Kbdjv0HsuXh6r5dfZJb0fALWk9SA63f
         a5BCbhZoKb3p3I9/FVhiMlniqvMeufL7qwRWbPPcG5F4oc1hiEmIGXIlrVTIC93fxd/w
         U+YAkm3BpxdD+jkKFGqRJSKy1FKOru1ghxJ8t7Fot5UhpJdoq1duGyfQsxPq4u4xIxio
         8xTa7rjGe0soB6IQUioDkYhH5KixCrL7WE4FPAkXTi0RiNCK6hv8steIYDWa8Ae6ZXkI
         vpgw==
X-Gm-Message-State: AOJu0YwQU8M8iUMBE/zwb0HTV4en373zqzRvDiFq+vATl6g5MXXzH6Bm
	yufI0v/buCgG5vWSYi86wv5RbYtMbSrVcepmUzVan5Ty/rjRpd/LLeuG4CS+E7CmMO130LrihBJ
	GpJfOMsATCM8g393m/A+a0YEUc1NC4HQ3N/CLph3MdsPeXSEeZmlRozngasv324Utnxkg
X-Gm-Gg: ASbGncukmtJYJv9qy2BR57RvtMtTch+4pSvczD2DhN5za39sDqLbU4obdFGiIA/Ktt8
	DMVcqAxzaGwwNl62odDayP9Q15TS3G+4EstdNIJgfzh9JwPf11koiXel780CVWOCBOEOwfvuwQe
	h+BHbwLqCzi0F2I/WRE+YoWDYCcfpV1OWn46DKIvAQ/yM4lYTQb4kxNZXXEGXrv/OYtKeBex2Fj
	7SptezBtnhEpSoYAhUNYN74Q0LAl4v1UmLAj5Ko6hfK/0uxH0ZK4F1jY87GP8PiNrVJyjF7w0+P
	Xng3ORBD9tL8dmkkHrqqPJfY486911MomfaowMkF1IrMmkILTKcAyzeqnfJmXCuLVTrrSr/pA+R
	7vmTfebh6CNsze29dXzTwZUxk
X-Received: by 2002:a05:6214:494:b0:6f5:3bba:837d with SMTP id 6a1803df08f44-6f8b2d43634mr196493506d6.25.1747652335767;
        Mon, 19 May 2025 03:58:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEh0901HTX646XfSkqw0SlUlwGL7S94w7htNY7rCEBwseDBwVnIRM7EgU1CqdTteJyLVHdqrw==
X-Received: by 2002:a05:6214:494:b0:6f5:3bba:837d with SMTP id 6a1803df08f44-6f8b2d43634mr196493266d6.25.1747652335324;
        Mon, 19 May 2025 03:58:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Luca Weiss <luca@lucaweiss.eu>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add interconnect nodes and paths for MSM8953 SoC
Date: Mon, 19 May 2025 13:58:38 +0300
Message-Id: <174637445762.1385605.6437405000222393314.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
References: <20250420-msm8953-interconnect-v2-0-828715dcb674@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfXwT5eJEgF6gYM
 8A1jtSdJzAT2SHqEvgst9nQmuK5oabnqzRD0hSAV2Q/2Q/5dt6VFPZeuIU4xPxV1LzJuDBHintF
 nmlLn5uBWMvpEXPe9WwpjDbO4WRu4Yq0jrdEvk5OY5F4nHUTkLKw5AACr0T++3GqooFr0JkGh4W
 RIyU8j1v2mYnipna5Dmix6YVzkZsFwosq0Jc9Y25acsImeBcC/lEt0HktCo759G8DI4EvhSNqzV
 TPjXhV7PV+0Mqm/AcoJ0jPDxkTJLG1XoB+ExIcoK+VelmXL/ryTS80Chj3IStvj5tize692ZQ1x
 LRBkCSaLTpHyE1H+kQX5nWEIu6drJEiC+vYkbTfj1ltJgFctleOphjdHO6HK/iIv0wJVQX10B9P
 OJ+zCZOYIUbmLA8SDQZytNGmcpIq++h9MZAofRkmSj6GV8tsWpcZwf0dzThms9GzLdHdizJQ
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682b0ef0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=j8xinkR703XPaYax9wUA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: 6g3rFiufJkVRI5aYDUG-jDNgfp-MNR9J
X-Proofpoint-ORIG-GUID: 6g3rFiufJkVRI5aYDUG-jDNgfp-MNR9J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=886 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104


On Sun, 20 Apr 2025 17:12:42 +0200, Luca Weiss wrote:
> Since the interconnect driver for msm8953 is already upstream, let's add
> the nodes which are required for it to enable interconnect on MSM8953.
> 
> 

Applied, thanks!

[1/2] dt-bindings: msm: qcom,mdss: Document interconnect paths
      https://gitlab.freedesktop.org/lumag/msm/-/commit/6694d17843e8

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

