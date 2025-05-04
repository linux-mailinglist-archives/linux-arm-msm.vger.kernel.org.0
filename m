Return-Path: <linux-arm-msm+bounces-56717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A127AA87E1
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 18:16:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FF571898272
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 May 2025 16:16:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 195C01F4630;
	Sun,  4 May 2025 16:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HnA4f4aq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 961831F463E
	for <linux-arm-msm@vger.kernel.org>; Sun,  4 May 2025 16:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746375240; cv=none; b=bVq5BPZRxsoaBCIle0n/JSqHtVGk7DWve0t9aE0x4Qj2Z0NvPgpuF4X6hqS7dohjEDXmsMlJ8nVKI8xLsVXjN76Bx2MxUalQzGQScKMkRr/7vqSG6A9v7230GJGMeKlfYh7b2oZjkWQUvWPXQn2VWuTrJDZM7StZvbhl2wt4R8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746375240; c=relaxed/simple;
	bh=GoymrrvT+xbHk1nFXIyGwohvSJZVfRO2gKNmW6FLqjE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cfu09BDimZl5kKGKCQsygZTxJrXmajvvpLt320zb9Op9TfJ6u2hRUFJupJXSe7oDgIWStrgIwbsVPAxCULdVHUDUPFPJaFlsHi3aD1T+wFc8IyFjQnUGJzGwW5a/wkeaNtWnOaqQJPd9jVp8r7X1PJ5wTsiAseIf8csaHNBX56U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HnA4f4aq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544CRMfk021065
	for <linux-arm-msm@vger.kernel.org>; Sun, 4 May 2025 16:13:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cfdsQNjtgTXSpICV+XJjH/jK4YQyRmRdmbdXbvMbr6I=; b=HnA4f4aqSTGjwKOb
	Dm7vLbj/46k2CAS2BXIF3QnAySBj1MkUoq9Ke52uq3Djd6NYKVmKZ7UYy04UFyb/
	wnIYMx3iMQBCVUk0AuiEQoZkDDtiROZEbyH5xE0sdCFXouASd+UtRVlwto8PY5er
	w8lBtFCDM9B4YvW1NrZWPsIL6RcJy0JfmlC1J96JqF4+8vFsG9l4aVxwK/qm9lLf
	qZuBiP+fQfa2l34JmPWLUI38drmgh5FWAMtZKB2/OZPKbFB9uBIjyqYcUCLzWW6/
	acMx69grj90RVvygiKE4BgKTa94LveXtrYIu2+L7EwZUzMLhbazoLLdoKN285IJy
	Up1cIg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46da3rt83b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 16:13:57 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5e2a31f75so372348185a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 May 2025 09:13:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746375236; x=1746980036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfdsQNjtgTXSpICV+XJjH/jK4YQyRmRdmbdXbvMbr6I=;
        b=oyvYXY3Wd+YG9B91n0aujGXa3ovg2ckHFk9EoGwSwmstJDZJzzvRZcCTa3tCVDiSnx
         sOoa71zZtZ4md+E1xtjLAYF1eme2bLt+9QbklOwJTS+nkpihsJkleV+tp4ARDKQzGmsI
         YHLYV+EaY8369XE8W5CYxrjE2K3/Wn7Ox1qWJwO+HbLBbEAOc6FY/urlOEpE/dpSH+Br
         jOT5ghSlhLa1mE1oW+R0TQZ/dtrWjEZPiRoR3U02RrjEmAKjd8nHVEB1uODDTOxvNTG8
         C43HIP3LXcrzLnaeh2pdiFJ4vgr+8n/iUgbX9zep5Q61at85P/f/hU+ZEEn6OZnOUdKi
         zwaw==
X-Gm-Message-State: AOJu0Yw7Nm9oQGDFEvak6/Njm2QuxzCAUQe43HCRWwGEQrqg5qZRi/2r
	UWgT8rq4GXi/K6LXqyAJF/BPMURoKG98CbBZtR3FTaJZr/TZ/8k/uVDI8EKBHtX+C6NmhBjYccC
	CmevbCP0xNTBY0zls24XG/ZzAgorrY/kB4Bn9TOROmZc8IiHgh2afC6cobETQkFf4Xrs0WM3M
X-Gm-Gg: ASbGncuD9XfM61vQ1U2ntDxG/mou4is3AZmmbotOTquCKO+LrGU70Lg3VCSVB1UOism
	pklchGX/R4UaI72Xp5I7pohX4Ax8aI4hLAJZtDyUP+AlMMUUJ4qudlzPzTSmOhtC/GX9U5aEahk
	o1RHEjuVUDyVGaigbD5Ox9FJDF+sH8CMWCuqYoWAHowxTW69xM8p+h6NUSV50tUUZi4MXR+krw6
	NE5FoydRmYx8F0/6fgIOxwmtsy1nlV0T6xRMw8VqAA3TB+sGqq9LEU1+wyfNRDOE1zK1k0Ww4kb
	Vc9VkTxLUxVuwZl7pNSvZNZ+Xrjxv97Y6GZ/5rJoWCE2gg1MtCISU/ee/AOcnKtK6fZJfkMDQq7
	jXCOT5FOymXh6QTLszRin4HNI
X-Received: by 2002:a05:620a:3949:b0:7c5:6140:734f with SMTP id af79cd13be357-7cae3a926c1mr607136885a.18.1746375236095;
        Sun, 04 May 2025 09:13:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IESd4V/tl84ujiy+ueBS1wdjRHJiBAwRJzy9189FWkkAARUTf7JATItoLt9gDMWQyef3WGC8Q==
X-Received: by 2002:a05:620a:3949:b0:7c5:6140:734f with SMTP id af79cd13be357-7cae3a926c1mr607133085a.18.1746375235745;
        Sun, 04 May 2025 09:13:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee937sm1335231e87.142.2025.05.04.09.13.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 09:13:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ayushi Makhija <quic_amakhija@quicinc.com>
Cc: robdclark@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
        andersson@kernel.org, robh@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, konradybcio@kernel.org, conor+dt@kernel.org,
        andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: Re: [PATCH v5 00/11] Add DSI display support for SA8775P target
Date: Sun,  4 May 2025 19:13:31 +0300
Message-Id: <174637445757.1385605.6744814496349716759.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
References: <20250424062431.2040692-1-quic_amakhija@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: IxkDiIZhXn46n0jI9EhXyQnu5UAwdpks
X-Authority-Analysis: v=2.4 cv=cpWbk04i c=1 sm=1 tr=0 ts=68179245 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=rcLBrfNTdlfi3Zk1C0sA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: IxkDiIZhXn46n0jI9EhXyQnu5UAwdpks
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDE1MiBTYWx0ZWRfX8tkPnfSMD/Ca
 p6GvMPKsNsQ70jnfH4GtyebSckKQYk1HyH+vCbnTOP4W0kBtLR/zyu17c7fAj/5aU8QCDYt9CM8
 mvkhep3q3I4pnviz/kWROFZYbS4T8X2i8Hjxf4Nsmk/r3Tf+1sENHzhg1sgFTXuHkzRh77CCKr+
 NaVTATT2Ig0DyMa5wrir3kNiFvWiGmoLBKsT4QBJJoshu/QfLc0E+33aARRqBBR59ht0YuVMOhD
 Mxm0eu1/Z3CXRPrQ5T8Z1/QnTzFaCUR45AdnjlMHAGKrRyQqr6AQGSOPSDQjYhHZV9r6PDXVfMh
 VI80swbaEIV6DTV4J1dGh5VKEhHBXELEF/y0Ovh+cypxE/GgWipPazcE0KTy+RdBht76b6na4Bl
 eRcwfU0w6QKUsG08mChEOAbyw7TQDdGPdxm6DpDbL1chO16nXrK7PHmMOgL17zMO3nABis9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_06,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=889
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040152


On Thu, 24 Apr 2025 11:54:20 +0530, Ayushi Makhija wrote:
> This series enables the support for DSI to DP bridge ports
> (labled as DSI0 and DSI1) of the Qualcomm's SA8775P Ride platform.
> 
> SA8775P SoC has DSI controller v2.5.1 and DSI PHY v4.2.
> The Ride platform is having ANX7625 DSI to DP bridge chip from Analogix.
> 

Applied, thanks!

[01/11] dt-bindings: display: msm-dsi-phy-7nm: document the SA8775P DSI PHY
        https://gitlab.freedesktop.org/lumag/msm/-/commit/850e13b65e3c
[02/11] dt-bindings: msm: dsi-controller-main: document the SA8775P DSI CTRL
        https://gitlab.freedesktop.org/lumag/msm/-/commit/2a0195b94cbc
[03/11] dt-bindings: display: msm: document DSI controller and phy on SA8775P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/a6f2524f4d5e
[04/11] drm/msm/dsi: add DSI PHY configuration on SA8775P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/d3979192fac5
[05/11] drm/msm/dsi: add DSI support for SA8775P
        https://gitlab.freedesktop.org/lumag/msm/-/commit/249a965c3759

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

