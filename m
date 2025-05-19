Return-Path: <linux-arm-msm+bounces-58429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2D3CABBBAF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 12:59:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7ECE13B111D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 10:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1EA10274FEA;
	Mon, 19 May 2025 10:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AgMTqKBm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5449A274673
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652335; cv=none; b=aMLtpLYFMyBYeADqVUwfmUL8xLQ5vQGv02+d0seSBv8pfKwsNWnCxuAjXX6Te5ROjxJXDsyj9sCTm9JXYyXRA1Z6sHrAgRcsVIV2bWQA28dllXoBU5VwFHAG1HakvIPpxhTfNk4LZxaiel84Il+ZNJAWY9+rsJS0phXZb2l8x0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652335; c=relaxed/simple;
	bh=laU7zJS3YV56vTABXTYYyCyaK7vtQP0nr2IhS/ljwl4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IlxUjx1ySLgJJ8q+sW4IFQSPShcMHVfyz0GXu9/mXBWfjLDOLZFnyXWGDGJcnpmvq+GVBJyxfzTsPoeGolVfi5DyoFafMoZiAgawXLSyrBJcuNHiL2GP9APWoFTpVjWaMqr0/hZ+oszfkMIqEb7IPvDbMN9KEzrztEk8w7ZLSow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AgMTqKBm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9G17R006013
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	P97x1i15pR0DFA8r2mBaSyn//YiqASvzqBgFrFYv0Xc=; b=AgMTqKBmMNCFRM3d
	QmR+FeI7IoPU3llq3T4SCH2Hfx8Oet0nJ/zWjbnHMg5qQKZHW2qhJLn4I32vWn1S
	H1WjjmW4q32mwrRmapFrMFAzwTo5UXwChnWes5kAuGwYkYM5+kFImwG2SSMZB7sZ
	tEjMXc//6RKqHdcXXj5978JejS6taGAXEjRUDrm88wtkUsOWYEQARJXuoF1Wjj7J
	ZIYzmgKcoYZ5a76Y/l2jL+IjOKL/PjpzTVUGyTP1rLR6eXpHEIs1+qV/pUO+X8hi
	XEldOAP6lKYg0454DFIFsmcqoyOVHYynk7woKlVs5XShCB6YZ52tzPNB22kvNk4J
	rbTWoQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnym4fn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:58:51 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f8e1d900e5so1040436d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652331; x=1748257131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P97x1i15pR0DFA8r2mBaSyn//YiqASvzqBgFrFYv0Xc=;
        b=t/hnJUnDNzHCgaDP69d0o08nkYjZCLXnrp1991tt4gUpxWeirKQgyJLx2QvYs/2c5L
         7JyYdbrkSG0+/4r5khUn25e/kmgmClAEWtkD+YvJosjmX8qGqht/Tyhp9wuuwYLdTPF+
         5tfUG5n4H08EzXjspPwPG714X+/Ua9dzujui82XZzzcPVgHqEyGww2aWXe9AvxRjydpI
         rIPe9EVRLMQdnNEinDCM74xdQ1ki9YCvkJM0njZe5SkLf91ivFQ8GTxG5lcnr39e2Jyi
         iz7eL5cDLFSF5CzzFnJVPnxueSLw25ztDXrIqgSZuVvUm16lS3QcAKUCcX432UfvrMzb
         XxbA==
X-Forwarded-Encrypted: i=1; AJvYcCUVLhV0XzREcc/qwJzxWY+mMHGUw+rgXt6JSNIRteXFYR55fBS6NQ1+bRoifnMhP1QoAEqAPd2mR00CXwMm@vger.kernel.org
X-Gm-Message-State: AOJu0YzSPojw0feEyBdABqYtOOjD9LrVzcQVgB8E1NciBvS39jOrP8JZ
	0/37u+SiXsD7co3wVbbiEgRymz0ao4QxEF+LKyknaduu3GYI4O4KJiIU6K2aJcf2I2U4f8MxCUK
	lEmu6N0z45fijwwLigpQoKh7WtoCAb5UXHWDEmXoKfI/pmwZv3zEnhaaqq2ZnB17D3k86
X-Gm-Gg: ASbGncuQLGkyzOevynFxYAYb2kA0adRYd5Frkvv/+R7/njf6cbt2J3LznHTFPGrrCDq
	1qYPEmezZtjVrrNkPq2U31QpBGcU7U6w92GuThvbLvUKpqTbNV/Xz+dLYEozLgxUqY/NfdCdkL8
	cgeZ2pr4NiwSXklBXoRu8SWuoTqIOsHEO91L0QHXwSe8jRNZU7UMTmBB7IKYO+dySLyDu923tSz
	13WwNPyITRuoHnztinBN/kvnr33iGhVTdT5i8iO9ii4LC6dGB/gHFNULlD6NjaASXYDEfBFVzUQ
	9j+LXMrZz7RYHOR0nBVZIueOGhwOjJlMo+kJU8/DKnoTwdeGgk1gnkl30iD+jRHg1WPlNLt4FzA
	HW7syFuCzIv3Nzu3KFLhBzDKV
X-Received: by 2002:a05:6214:1cca:b0:6f2:c94f:8cfe with SMTP id 6a1803df08f44-6f8b08b7479mr224935676d6.23.1747652331155;
        Mon, 19 May 2025 03:58:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHRauQlOm++SfaTq2hFhTkCOAP4U1NEnYr+eOjzxOglAC03Q1vWVud53//B6i/067FYK6Nu1Q==
X-Received: by 2002:a05:6214:1cca:b0:6f2:c94f:8cfe with SMTP id 6a1803df08f44-6f8b08b7479mr224935316d6.23.1747652330775;
        Mon, 19 May 2025 03:58:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Hermes Wu <Hermes.wu@ite.com.tw>, Dmitry Baryshkov <lumag@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
Date: Mon, 19 May 2025 13:58:35 +0300
Message-Id: <174637445759.1385605.11279102681373913656.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwNCBTYWx0ZWRfX4tHFe5bYOJeZ
 SoVjsBT7/MU6SfZAG3LaTcmewDuJiotDCbt/iDiejB1LpT6fbxxi2G0G4iZTjwtWCOHGpKfOF4L
 X+8t0yyzHEzgksCGSgQ1EXc/hlbNnBAlHX5T98ysZDHeqj5vL/mytxsKUF7TjqshThLJ92upmRh
 dflRPMWBAruR5HwulvYOeSrjcliag7nSRMiyf/0HbpdfJDsGaTeUoP+rAkKg6cSMVTe/EVMH16e
 uueumwycyKzhd1WSJhF4lHvRo6ZnoN0flu6XdQ1cbCzFyVM6pO5TSj8rpmgd8olPyT//hoeQAwm
 lOcV7gDawWbBks3g7iC24xgVoQXiRZkXv8bbHNSrtxiir5/kvc7ZfldwO5U4Jd/WrW/ge3Kh7On
 5OOsCwi+fndqCLKopQu585LoqvWmE2VFhvNy/PwAvgW3JJEOHoEe6cCLIaGm3hqwa6I41Tmn
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682b0eeb cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=ElSFvC5XDyh-nl6B9PUA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: RlkInjhg72a4lMVJ2lZwAqKCWZLwqr-O
X-Proofpoint-ORIG-GUID: RlkInjhg72a4lMVJ2lZwAqKCWZLwqr-O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=877 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190104


On Wed, 23 Apr 2025 20:52:45 +0300, Dmitry Baryshkov wrote:
> The MSM DisplayPort driver implements several HDMI codec functions
> in the driver, e.g. it manually manages HDMI codec device registration,
> returning ELD and plugged_cb support. In order to reduce code
> duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> integration.
> 
> 
> [...]

Applied, thanks!

[1/1] drm/msm/dp: reuse generic HDMI codec implementation
      https://gitlab.freedesktop.org/lumag/msm/-/commit/98a8920e7b07

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

