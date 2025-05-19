Return-Path: <linux-arm-msm+bounces-58430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8013DABBBB2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 12:59:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B9CC3B6010
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 581912750FD;
	Mon, 19 May 2025 10:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LOnMGi7A"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14EB274FD1
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652336; cv=none; b=VU/dXEXx5qr1j/yOOr7xLefgj9yrdCps02hYwzvTCznXjVheJRu5md0FYU0dBPeAOA+t7VSlEZCnyNc0Nk5soBlJeUgMF+HpitEBxxxuSXE09eB4+uQYhSlH5W+IQmzGVmSlK4fodIS3xrcZ7SrS4NCbWqxOKjCCUr//y/4Yda4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652336; c=relaxed/simple;
	bh=ZCNOXoTXOG1O0zfWSUHeh8dN/NL3V1HIw6cRpzkclyI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DNb5+Ng1InROMsCijPMQAHQaAjwj3SAAqlxzhG973AecSzZ+uz6jCtJmnqUWTP6/EX7s+1DLlf+qO2t3/KMK9y/AqdXzSrluPXmftmzgL5z8F0NN+gtEBbpaQ+xi5uHhm0gcwGBYK9nBE/AEVgygMOfcVAHwXko0TxBquz/FsbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LOnMGi7A; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9VVMT015117
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oCrre7kyL+DtRhPaevA50uxzh9J+o0WUmDy9isEPb9c=; b=LOnMGi7AgMhX36cD
	0gSRiO2PXSIcgAPfk7iWbavD7juGF26n5lAygIki2uGCpAuLp/2LM+b4GXjvQuan
	f07iPfqbhI6AC4yPL2qPlw+ttfXFrhDL6lHsdEVBeRRyVmPF/8bAad4RP+2anlJl
	aSwCfw5MTZNyImYcLxRYJ3YSuAOd6Vb/smc7A8leVjMASOFtycegWclgVOIE1xlp
	bgQBCAbq2EWgQ9WfYIHiHwTub1zUaf/VdyQagJkEO9QDs5JOi2yY6ItiAq5chsGT
	SY1V7VsRn/ANaVC2zdZjyD2vsN6gjSUk726J0it9hhn3Pq4KFAF1CEE/HmOcC2r8
	vqfwcQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkr9v34e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6f8cc1c047dso26226566d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:58:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652332; x=1748257132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCrre7kyL+DtRhPaevA50uxzh9J+o0WUmDy9isEPb9c=;
        b=BABc2gdlETOC5g0Ge6PNO5sQ/FiPVCjrn+dfrtHmBnP315Ijj0tX5QmByFvIKg1zTf
         5Fvj4fizarylvLdGvSqNp5bJYHO/N+TLemBI7clYBSBXnlkVed1LKONRUjir26B4s6F6
         TwLpluNH+fNRbI0Ogp8oFLdoEDx0WJc8M19hQkJmnhAOqR9GZSPE4TJSFvVu8WN0A4Iv
         kCHYHal+WWMAwOP2SMnXjcMKL3S57kAqVfvTf9zifUQUHhmZW+9uj2XfHa1KLPKYzNGG
         CK5ZGtvB8nlGdMEFeLLh8S9+dsyRKA1sopez5df02C4tzUMr2Cuv9sPQ3dDdlmAEj/QD
         24mA==
X-Gm-Message-State: AOJu0YzDjfq8ASeg+aIER9Wwowxz+zwUiDcVv9H6vjlZ7QTp1Y3abyNN
	RVC+38d2bKAcKj0C++i1I//ic2k/jlMK2p1GUdJvKsBn37gQ7l6ISYSmLlKBQnC1P6fJgWpveM/
	aHEFEeIpBXYZ9+jTnnQGJ5mWJFvMDvjFD7gGlirz3vK5Hw/c/hi+POvUvL2iJ0KkPdiDm
X-Gm-Gg: ASbGnctilHaQilyT/8DrV7Sf+KFfFq0dABMBtTQILUv1+4AB3gFl//QjKeXZtQBKRfl
	u6a6QRn3ZlWfJUShNjidiT8NiEURruspq2fbERBEaVrL6CE3Y8xO+r7It4cJdIvtK/CNX6l0JFf
	7HqIoSFyL1J/VvKwoisV3GYe6OzpZwup1XruT71yqzr0gpGqEAsSPss0iQPWaH0LmoPr8dh3Q6i
	Jf2EXk62YcjH9y7/VOYMeCPGzc/1ZDdMzR/6Cv5y33m1Y29m7XMNf0VfaanW94YwQjWu5kjF18O
	p1MPKy67GHn+1KzI6xHVFpLjx+756hwibqF9FpXsvWmaY9ZilI1EyunZzsMFQNgP1frPWOWShdY
	292L/5fxXJaK1Cg9CCWeT3+2X
X-Received: by 2002:ad4:5e8f:0:b0:6f4:c15a:62d2 with SMTP id 6a1803df08f44-6f8b0877c06mr210711486d6.20.1747652332487;
        Mon, 19 May 2025 03:58:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrSoFENNThQFwHFQnIjtZ3G2QfxB92xA08zp06I/ajWbkOSz2fGe+TRkoQyETd6W9zuDBS9g==
X-Received: by 2002:ad4:5e8f:0:b0:6f4:c15a:62d2 with SMTP id 6a1803df08f44-6f8b0877c06mr210711186d6.20.1747652332123;
        Mon, 19 May 2025 03:58:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:51 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v7] drm/msm/dpu: allow sharing SSPP between planes
Date: Mon, 19 May 2025 13:58:36 +0300
Message-Id: <174637445761.1385605.4846218535199859363.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250426-dpu-share-sspp-v7-1-6f4c719e373c@oss.qualcomm.com>
References: <20250426-dpu-share-sspp-v7-1-6f4c719e373c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ziP_uWiRy8UVO6ih2U6y4q2N1JrRqVYW
X-Proofpoint-ORIG-GUID: ziP_uWiRy8UVO6ih2U6y4q2N1JrRqVYW
X-Authority-Analysis: v=2.4 cv=DdAXqutW c=1 sm=1 tr=0 ts=682b0eed cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=-ylb_1dp-gWGt-a8D6MA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMyBTYWx0ZWRfX4I47keDyPRX9
 RJBRWjMbGXYDe92Rsqak3U44XnQqHla0UG20yTkCdjiVRnlGQDci4SY3KnAABwK0Il1WPoZHdMR
 o1x4wmAhmwXa0timSyHjlBS+1tWss0Ot776kS1eAeR+LVSlgI6DG0bghMiPH/lrOH45mswUCMae
 CQM1Q77tgY4+fjqxcvEMIqLZjlfmhxDOwDFaKmfMLyiZ9End66S/QYiM04t6NPoxTS+vEycj7c6
 +PRTBIk1URlQWH529w+F0kTUwF+OxtZIX6zst/xIo7IzXsyliZ5Ln9Gop5mNm9ULrmMzimp2IFM
 EFpQnW0OhbzqD+WhvUpJ9865CgVmyHPq535vJe5E9X81stfiq4eCTfM6IoTibBamwQHMds9luqR
 cGoAAD9OLq4qixO2QCyMlv40p5C310eLcLEMVGJAAD0ILkboJ/YkVj4TQRJvCIXCqXfdgPc6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=596 clxscore=1015 phishscore=0 adultscore=0 mlxscore=0
 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190103


On Sat, 26 Apr 2025 07:51:17 +0300, Dmitry Baryshkov wrote:
> Since SmartDMA planes provide two rectangles, it is possible to use them
> to drive two different DRM planes, first plane getting the rect_0,
> another one using rect_1 of the same SSPP. The sharing algorithm is
> pretty simple, it requires that each of the planes can be driven by the
> single rectangle and only consecutive planes are considered.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dpu: allow sharing SSPP between planes
      https://gitlab.freedesktop.org/lumag/msm/-/commit/3ed12a3664b3

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

