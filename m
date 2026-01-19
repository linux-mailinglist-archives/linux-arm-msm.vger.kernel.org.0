Return-Path: <linux-arm-msm+bounces-89623-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B60D5D3A6CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 827F830026A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 11:24:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A47473112B7;
	Mon, 19 Jan 2026 11:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lP4RYpxk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Kk/vxgne"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE52130FC34
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768821878; cv=none; b=KxWcr7IWosObcfXbOzEP2rCnD6/7LFf51A4C/p+QqEWjFsC7uedS5WgV25M2s/bUGC4kI5zJ1F6/v+XEPMsB/L3Ula/tqwQ3YmGOcm2OxVCEsZRM4apQoC4zZ/oDCl0ieVznxFUMI8K73dZSW1M8LTaY2wRZJZ5Cm8VXB4CxbYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768821878; c=relaxed/simple;
	bh=AFl8FfeWyQuM11ZNIUeJzzcHcsoUvkod/1Gt2osLgvk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rIFOQEV17f13rf95AwR7HvAMabO/eMuxux+eSv8D+rsBkyBjPtxk+kpfRJ26iHwByv5S+b6AToO3D+GkBP2DI0Uk/LA+lvOFi6cROz3WusrmpqqEAV4wDOuVwthlXPAwW4wGX2mm8Q4qoqhe79QN+Dvk74TP5v5et+DTipbv7iw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lP4RYpxk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Kk/vxgne; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91F3M748347
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TUNGnYuQvZC7DS92zYQiiN2dGMEBlKTwjdJdDY2hLoQ=; b=lP4RYpxktNZWtH0q
	cczG7KgpgT8mhMgot0FCfT/iPmEgjUJ8hI2Na734lgGTU16RJ42ob1StxS2t5JwI
	z5GjAZDFI31SC+APbxWAjKVWJ++/4tsROZ1Rdz+mJfTn2OBg3D/tOmBKNFAe5cqe
	GylGiQw3AYCDStqghOIBxXD/j3kxoDl3tbDQhl8b9nbKYbc8rJjKqtOiDHo/XwXA
	b0TGaefzFeBiUew/1zuFeSW4Q14XZsvIgqprTePPqTL+wWPnhOq9D7cKqpCLRzvS
	L6bD6KLXH7pDQRZYJ1s7FduXAHlQ/cKZTu+oS3N4VDKep4jMvpqbeberhWnoWCIc
	o1GfZg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2t74umm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 11:24:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c52f07fbd0so234867085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 03:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768821870; x=1769426670; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUNGnYuQvZC7DS92zYQiiN2dGMEBlKTwjdJdDY2hLoQ=;
        b=Kk/vxgnegl+i6hQqywuV8jrcm6Jsfgw8Jx0hjNHIde2HW7MKzN5PGQqbNKAocCnivJ
         j6rbMofkxXu76pFMIiDy0KZQ7lcJUVHq030nsmqvtCWAq07Qynr96bVYFLok78wRHoPr
         +bmI9mrVayGkfFdRZ1k3BWVZcLQmrBUVz7TkgptsnBlvWUmDttdHn5iHUg4fUcRgfBU8
         kBNhagPSoyqZBXveKZl3GPGDn5O6fxEhItPMRu9E5W+waQWNAeljhvAgmlLaeeuJ5AtM
         FCJjvpVT6KimyedIaNidJep8xor4T1mq4GE14mz8wWXB5hdEGOSm0vK7fii8un7KlfKJ
         b3sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768821870; x=1769426670;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TUNGnYuQvZC7DS92zYQiiN2dGMEBlKTwjdJdDY2hLoQ=;
        b=bYRuEb6wxAkwz/Nn8CWEnA+HgpVceICg6TjsEEEeAqcmWsABYvunBZ1HY2uP0Uy/fO
         tdEjDMZyCiKuyiYCoTChbwG6GV7ctneoxLkIA9pZBTtRqWIPknSxCe13IdUMVy15qs5z
         pbdCvIezR2QmURMf03nHHH2QwMva/1SxsdQaFEVWIhY+7F5MyyB8lG+NtPTYGrGm3m5C
         Cbru4g35ny0gih+3l/TZgiuaC/4ylR1Q/pjGsQMplEWWULDcooUPkFjPmU9c43yaUM3b
         UPYktKUiavyfHmRIi21mXeDUlLM+YhAUW6u0862VMwhfLxnouc6TOlpBKroBGLZ3tFRB
         RdrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmY0n224oMhiuGrztT7qY0vOQ0PMXou6ltLTOEfTc++yvtPyfz4k16cCUZPJROc7xx4aHsVtzxrcBiSjic@vger.kernel.org
X-Gm-Message-State: AOJu0YwIvCRbyh89023MRfv6ZmrpfjZOz0tN7DTESVJ8KqF3q6djN/ul
	JsIyNjK0afXbMg+kqZiZ7dLOy1WZXka0JfYRVhKOLiph0+EwCeb+8eDxn2Hgbb6wsHMHSQ0LXvF
	lq7LQfXQYPrRZ2oZfxZl6dOXXxwCn/454m7oujzIMohP6wxEicjvRP7yZdVYevkYVyWHD
X-Gm-Gg: AY/fxX6Z3dyfZrTAA5XiVbdOEn6DWal5P2r4jeloM6TwuTsWGAMOauDlRcP9EBfTBjB
	pPKI2g4rkRvKusGo5GXMVtCeU8NnczQd5fqY62SrdcE9ds2THJjwd5k6Xax2FxQYWiAj6I8o3AK
	64K1qjpFXQJz0mDAAKolbzBtw6+qO5zw4vjIwItGHIf6Dj3sq2UbAnVe5+WXWk7Kv3Nqe4FGHKA
	95/n1Bc1DrQF+Hv1vECCN8B3UsBm2RKcXZ0QTSltjjNhnk9neidp/uOTuMcr33IjTEmbqAVShtR
	Gzm79BJ16xCMGnQmFpJW8rSvg4DFTvdUnsRfppXu3aJSNyRDkMhzntKciBQkZrBr2C8qVF3bcLI
	F5dAOo+PGa4uyR2ZOW4w9XbdA8gGp8CmjlmZ1folJQWLjMfQpdWO2smolJ4F0HWkuvrz7neyGGK
	7U4E3tFbGBIYJta7hWy3G6/PI=
X-Received: by 2002:a05:620a:40d3:b0:8c3:528b:1b10 with SMTP id af79cd13be357-8c6a696323bmr1545283385a.90.1768821870342;
        Mon, 19 Jan 2026 03:24:30 -0800 (PST)
X-Received: by 2002:a05:620a:40d3:b0:8c3:528b:1b10 with SMTP id af79cd13be357-8c6a696323bmr1545277285a.90.1768821869747;
        Mon, 19 Jan 2026 03:24:29 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38384fb9ab8sm32747931fa.48.2026.01.19.03.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 03:24:29 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
        Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
        Chun-Kuang Hu <chunkuang.hu@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Andy Yan <andy.yan@rock-chips.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 00/10] drm/connector: hdmi: limit infoframes per driver capabilities, second approach
Date: Mon, 19 Jan 2026 13:24:27 +0200
Message-ID: <176882185857.86521.18172781461760523152.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
References: <20260107-limit-infoframes-2-v4-0-213d0d3bd490@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Fdc6BZ+6 c=1 sm=1 tr=0 ts=696e1472 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=dLs8YEEMlrLrhmPZdm0A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: o9ge2n3bUVn4eoXE33NwdO5w3ttkukss
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA5NCBTYWx0ZWRfX4wZm6zZLypWo
 CkrqYeYm9e1XzOsYG3zV/BwdXxZ+S603SY41qB+GzsnKJX+aUy2JkD27qPpHR/5p1KAYzp3jpFO
 w0M0/MzmvZ4i2RrVNur+Q+O1qPVUHAsgNGHQ9LJ5W7lASscEM34BNpbf3EnTL7ZyZmytANQAGh5
 fsaZVAyg2kEQJiJuNgfFTDU8XDktc/0rqI6/Yl3HCmZv0/1M2rN3nTCYQkRYDyJbLpVBnkxbl6H
 mJQ2kOF50hBFKECUYyCKwK5PGdA4hc7w42Ub65abBTiFCuR2YLA2VxWFIZquQ/87TO18HIy+hap
 cr9FH9jIZCylx1+DaqcvrHUN8+l6VX9PtX/M4irvnBSAdF41Bf0v+ZS7bXBoyX8ProfjnzXpzKz
 sCTSDYFtL/axf0NK4U6M475S7umNeyWiHiHHcr8S+0xYj+dbBH5H4a627AQyrJsCo3n0C87he7O
 zBFYE/0rVjfhOGnMReQ==
X-Proofpoint-GUID: o9ge2n3bUVn4eoXE33NwdO5w3ttkukss
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_02,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601190094

On Wed, 07 Jan 2026 20:14:57 +0200, Dmitry Baryshkov wrote:
> It's not uncommon for the particular device to support only a subset of
> HDMI InfoFrames. Currently it's mostly ignored by the framework: it
> calls write_infoframe() / clear_infoframe() callbacks for all frames and
> expects them to return success even if the InfoFrame is not supported.
> 
> Sort that out, making sure that all interfaces are consistent:
> - split function interfaces, having a pair of callbacks per each
>   InfoFrame type.
> - write_infoframe() / clear_infoframe() functions return -EOPNOTSUPP
>   for unsupported InfoFrames.
> - don't create and enable unsupported InfoFrames.
> - limit debugfs to provide supported InfoFrames only.
> 
> [...]

Applied to drm-misc-next, thanks!

[01/10] drm/tests: hdmi: check the infoframes behaviour
        commit: 7436a87db99d57196c49d10de35f41531993d5f1
[02/10] drm/vc4: hdmi: implement clear_infoframe
        commit: 3a4ceb89a9723088615ea1c960fc589f87caddb7
[03/10] drm/sun4i: hdmi_enc: implement clear_infoframe stub
        commit: 638409979c5f7d3155afcded67532003e07a7d0e
[04/10] drm/connector: make clear_infoframe callback mandatory for HDMI connectors
        commit: afc399f7a5ea7bf405b2ef85c7470529b1a9e47c
[05/10] drm/bridge: refactor HDMI InfoFrame callbacks
        commit: b626b1a1c9ccadd8861870a2a450f02e0c61ab88
[06/10] drm/display: hdmi_state_helper: split InfoFrame functions per type
        commit: e802c783be94bf71541a7e2ac8b1b5486aad10db
[07/10] drm/display: hdmi_state_helper: reject Audio IF updates if it's not supported
        commit: 1d8847f457648ed4932019dcd3081bc27bcea936
[08/10] drm/display: hdmi_state_helper: don't generate unsupported InfoFrames
        commit: 4fc30c2c5c61db88e3d6644bd3dd2032ec4bee06
[09/10] drm/display: bridge_connector: dynamically generate HDMI callbacks
        commit: ae219fdc952c315182b471f5aa71b379584b70ca
[10/10] drm/debug: don't register files for unsupported HDMI InfoFrames
        commit: 5a4e4e30f6dc4d2a68eec08257128906572f3346

Best regards,
-- 
With best wishes
Dmitry


