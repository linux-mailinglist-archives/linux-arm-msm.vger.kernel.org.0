Return-Path: <linux-arm-msm+bounces-56714-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA3DAA87DA
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 18:15:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D94F93BA429
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:15:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2D9A31F417E;
	Sun,  4 May 2025 16:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aZjDiq17"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6F991F3FEB
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 16:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375233; cv=none; b=FPe7H2qcl5ZWS8ua29Zos85POB8Dm48ZuV6OcCCoznasJk0ZH6gjyZ8qnSW6+LGqeqtzdItATm1qvvTdelxPEr31kkvpRdLDKWYW2wTSJLDaSFbc3o0X/uxy/JqrWhyDIso5u0EcTIo13gb+6d6Lm9Mma7BPzKVejavXfGfT0Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375233; c=relaxed/simple;
	bh=97RKXDzDoG8OCb/93VmDNkU0PVNnI64ZdE+LfZVjE8E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TUV2GxysMXYdeaGyXN3xSyCxJoihl91FNZSD2jcdSaZxVCMgH78kckvf46AD2pPKYkrj5aNzlMpSHxpMaEoaGq+QAyy8+w+uFGMnUax3TKf3o3mSZteDV7TYW0ateeT7LWYa7a4jdz6xiQ8U01iGiIh5MrYOlx3IggQ3zWPLuz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aZjDiq17; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543NrS51016191
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 May 2025 16:13:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=; b=aZjDiq17KIhl1ALW
	clqtbi+CIZdf2/GxD1LQVuQLnsOWSN3Sc2+Tb9lKmIKCJHaUzRLENzKHOXxRxdbl
	+kxerPxTRIiT3GSURePl27YOfEoeg4pjbKH4UPMLMbg+7lthLZLzPJOZRxyPk1rI
	cAahuifJ25pVkQ1EUSefDjPRMo/VGLRfE2bnUVYJBXHE6c7uw+LVaNwc1KvsRwXZ
	XfjjKcJ19EeqqmGm0FXFb1yiVvMVTLIF0Djo9VxBFjqZnFJjqCUxm8db39U9WkMd
	stwaAP2O6Jww1Sep7/uHuchriqAt+49mTUQRAZ4T4ofFk23M0XCxGNRZC/65P0cW
	G0btTw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dce9a2ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 16:13:50 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c0b0cf53f3so581136285a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 09:13:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375229; x=1746980029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kXjbNrzMGzMmwsR/qHDXl5YJYMxf7IlPJm6MXrGTCk=;
        b=U+tpZpQB0dVHx/0xtrf/QwLsGfXPFgSFRiPVycYGjJ5h9TAqN2NoWee3YjWKaUN/tP
         WFnbyiUQ6KsXklkfV/r+UBSgj7Ujx4tC9/bvvRztAWk92MvEMSfstd+32UsI/ZbepiVo
         J9neKgJLTdYVfo+KN+tX+dSCZUCWdeSTHNV75ZtoKLzq9CNJ1MYbJJfTd0xcX3qF4sQ1
         e00PvWYxGNXxouE+RVaKorKrjkXEmOGccj0apJlZZI5kwvAjTkAawZtsqeQkW/hzX2Qp
         Voib40q4Bly+LWRtJt8oi5F0bJsi0e7aI++E9Rq6PHW9N0boyJS68mP7VEAp7hmnNzNY
         XuFw==
X-Gm-Message-State: AOJu0Yy+nScYXsUORo9ZxIrgw1NDPo0jdz62giCBCiq4kiHyyJx5Qdt8
	z++rrx+Kv8AxtVSXfFpyjbqMZIocKUTRz58oTAo7FRsKcbRwS/lKPuC1d4mJK1/hClGKbGOMlXD
	LYco+4j1DGmVdZWDvAtOVpCtYljvF4Ua9QjPhLRI2cK3KE4KW6q00X0KNdISWVxVq
X-Gm-Gg: ASbGncuYPWmZHpIsXk5qIxATkZ13C0V6gmcs+F/BDYoVxJBFktwl8UQo3nF/GoK+I6z
	LJL2+I6uLoZer/rHa+iEwqcLUtHz7t7vxy0aHtELiKaIDVVNRmTN3chxOovH6hGUCm9Opv0eAQU
	kmjvznwscq9PMRo4lIa/CmdxtWLBqbKKsfy/13353lqgDAIezdsfQuq+dMGsGiHxkT+1fOruP7E
	V9Z94D+ymx5wndgszNB+J8GwzKPFwGG6eIEvAnY8YalTYm6y2W/8tS0To0p5S4whaYFyX2LFzDI
	4+SQWPz9sKnZc7g+fQnnfCEzf/w73/kzSQtpTKV2ybnHH71Acg/U3pCjCdlN9SvF1MHddjbJ3NC
	e0UXS07EfenaQ9mwFFa1ErAxi
X-Received: by 2002:a05:620a:bd5:b0:7c7:bb3f:fd40 with SMTP id af79cd13be357-7cae3a89beamr601651385a.5.1746375229638;
        Sun, 04 May 2025 09:13:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEOpfARWuH6M/BB8J4jIJ9/rRDdEqKJLyqrBgH4bY43WfHx9v+3pxeLlRyLuaD9LSQ7iLIxnA==
X-Received: by 2002:a05:620a:bd5:b0:7c7:bb3f:fd40 with SMTP id af79cd13be357-7cae3a89beamr601648985a.5.1746375229307;
        Sun, 04 May 2025 09:13:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:48 -0700 (PDT)
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
Date: Sun,  4 May 2025 19:13:28 +0300
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfXyfGj+zUI6VCu
 IsVp2XEkzKl6GS89e5+boBKC5LcNR72XBhLXjjmCWOIwB+WGp/WAMYykEDm6svbN2q3va0tX+ur
 XXWA7J4duC/RuozCFkt5DBG9e6MfWH9YGUMgu3G2gOyckRoZ7cViXdjqvx8I44hJFIOvHohrTJp
 ahRZw4XLk/V7SgttHnq3cGnM4/0JF7Oa81zB8OH8r6/9M8pfKZyuzsw3oLVEBS0Bc6sLbSzzBcE
 4sxJ3jh6IzYLOYRByYYito1nltyPrRDHaOHQsnu3mYqLPOLNJVPZ+zSQRXdZBnssi0N1kejvlNE
 GPVWGc4FN1dkJTorzKK8pqWBvZ2fmR7kQwPDxwGMM0gDMGJizp0hjn/w1xMFVb4hiQbFVf+uEqi
 fOQREiN4cgs2kERLWyuCIKiGC+aWqLfQt4kMyflWM3hbDwpVsGUjs/mqRoItCAoiHPYqbRSz
X-Proofpoint-ORIG-GUID: yWFiF-0XuY6gCMK34hqrI_UeAl6-w4Kz
X-Authority-Analysis: v=2.4 cv=Qope3Uyd c=1 sm=1 tr=0 ts=6817923e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=j8xinkR703XPaYax9wUA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: yWFiF-0XuY6gCMK34hqrI_UeAl6-w4Kz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0
 mlxlogscore=876 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152


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

