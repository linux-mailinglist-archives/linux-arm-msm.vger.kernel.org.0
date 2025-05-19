Return-Path: <linux-arm-msm+bounces-58438-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F408ABBBD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 13:01:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 55952189C58F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 11:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E0C2797AA;
	Mon, 19 May 2025 10:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZM0tL4dc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5F0279324
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:59:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652343; cv=none; b=ebCdFdVy5y6FjgWLTTJ7nFMRek+QDeucXqSTTDor8BePAel3enTYu4+RGhXvEZ8xWEtRE+gpGgpxsr7k8+ZJjsNQ4jCeq5jQ0yUjLIwWl82oau5xzAsSMAzg/BF4OwgqxMlD/S/Dm96pMFD17Vh7MUc2ecgGDpPhWc9t3cTG0Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652343; c=relaxed/simple;
	bh=GoymrrvT+xbHk1nFXIyGwohvSJZVfRO2gKNmW6FLqjE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tCZnYTObG2nOThH+mIrs1ET3ywluRODhcE/jWJYiJSvo1Lc/4cP5To0PeTY164bdaljqdavG24V4KcloTBFl6Dg0r/Oh82xsWNkPQomvdIFDxN3yedgrv8Jr0Z/LnIGMCd4nIYW/XRVrTW8chV1EiC+oKyjsPk/cMZElgGoG8Ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZM0tL4dc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J7GgvU023276
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cfdsQNjtgTXSpICV+XJjH/jK4YQyRmRdmbdXbvMbr6I=; b=ZM0tL4dceR9ZCazG
	sqyUNVptegjhUqnFXtVaK7AwTemiMq+jJw+hd/XdGG0puVGEWs1zMuzPD3ev6BEx
	rNhnRh2j2Fo2r2aLqlVHHU3jsC2WNTDQeJUh9m2RKioDejVLpC7UKoZHKtA9N7SS
	KLRt1qH30eHLUloaKE+FbvolX6Wd508DVmPkjqWveb+Cxf5ocZGat0B4lM8imiav
	1mJ+L9tdn7qbaZcnvsyaR9dMOFSH+y5dpjTpJh6fofFzyLdyvCEw428UfabjSBUU
	KQ+gwoSwxDMQCNjP12/IJP2f7KpF7QLYuFMEBJAzfsj6VnJ2TBRYffQZVdRBvjYw
	xfkTQw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r041rn4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 10:59:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8df69db27so7024496d6.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 03:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747652340; x=1748257140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cfdsQNjtgTXSpICV+XJjH/jK4YQyRmRdmbdXbvMbr6I=;
        b=cFjojcal1RTF/74WtSf3WKli2hhy+GI2n35oFUZ4F2ck/TFnJG0xOviLaXBWBQz2mQ
         9EvJFH6VJtKvp+YyYREDAOFl7Jkl3sNG6pApApQsRRPbF7ErGfeYi+OMsADXxXK6+IP8
         kDO1aUgHEqMe3z+9CCRTSnVwQm9sszEJLMO8mzOGTGj4InO7kqnAIE6kbo+U0o92Y7Ul
         G1bjOTTwE8Q6V0g9zsUOelbq/KD2usWPOq8Jf8/IhLU1eQ/mfpVZJIpOhC4H+T+XFwBb
         jzZMrTp9JIjQy0bn6wg8vuLmfYyBMw3PVUhcFj/Y4m0BP9s5kfaXhthLHlk6KHtqi7zg
         I3+A==
X-Gm-Message-State: AOJu0YyMNYZaERjSbuupPOtjeWwIF+8M98hgfkKHdIt6QqHxz4BbBdVk
	jbWaEcs2gKqn4obXPCV/9VAjRYgysFpqdaevnJvLRyCnz/20akFBx0uxOXS4/sYLkCFkal583tg
	qniS2MADoIMQJ+sW5UXjQ0/pGJ4dECblLUaiXU4ZscK1ohAGMMShEqUlD2nebdSxSAZwzbt+7Bk
	5n
X-Gm-Gg: ASbGncupw0pIJvrzgj0lznoOEsUQXUdJn3JeqTH/avx9WLCdbob8Wo+ULVnNnC4eP8X
	M3D2gYE8F8Kf2lpiIcgLKyZN3gc4txO/j/sRK8Q/21kZMGyyeWCq5oPCEIVsWszZg5o/3AIxD/m
	2kSog6VffwUbSc3Avj7qK7ctKqIsKjwR4RuHJmFFh7CapABNGqNKQkazTI32Xjvv8zyOFuT0Ezg
	i0in96u0iLLyW4UwzgLUHUl8XTSq8f/tn2fmR35PqwTgDzuzR2zYSfupY1FVWpkIz7f5/g8myOK
	93m4NVmq9MArdxVNC4HjWpw6wiTqGtL0Q78Do128RSSkg17nnf8DupOZpdCmxfio3zZnO6SQQSm
	Wd+l0A4cSs1gxLdwBh+wNOaO7
X-Received: by 2002:a05:6214:230c:b0:6f4:c8cd:abcc with SMTP id 6a1803df08f44-6f8b2b4c46fmr199871406d6.0.1747652340156;
        Mon, 19 May 2025 03:59:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHk/hpb7Fq8p+Ry8/zX3FWlj3myX25sykGI8jSsQ75/MuBj4A+SB9ODTHYvgX68XGn+AB8INA==
X-Received: by 2002:a05:6214:230c:b0:6f4:c8cd:abcc with SMTP id 6a1803df08f44-6f8b2b4c46fmr199871226d6.0.1747652339748;
        Mon, 19 May 2025 03:58:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e6f314a2sm1801140e87.77.2025.05.19.03.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 03:58:58 -0700 (PDT)
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
Date: Mon, 19 May 2025 13:58:41 +0300
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEwMyBTYWx0ZWRfXwskrPYuWlMX7
 adVaVyEt6M4DQgd4vF8xJ1ncPsOkM0CwiUvz6AemP1g8FvGgvKZwGB+txaD9Fre/NhAF412IUuR
 bs3+Yv9EfcvPPqZysO06/KHo0J9cbUNYY1gxXZJXQ7P/h5VpU70O6PDifYUbKhe+gPaiZzOcAnd
 9GbZM0NxFk6zr1MnGK047VrDyUK00gohlYTVhnbeM4IZK96iQoFQf+jW87ZJ5R8NIlZXa4DHjTL
 dqeUp5q2cw3CkQYaduyA5QvrQpFutb4YtnlbKULnFa5vbmAgxal3esGjQ01Gzw2ZqWyY9UUhyqd
 VchrcBbB3FPlfKAESXq84NCXB0AsoQXiZDwa1+f4iaJkup/N1H6mTKKhsMhGr0muwuCB/vGtN6o
 ismO9Dpq6vvq4s+oRKLIzjW5o9QoPyHCsjPV6SXak4wKBaSjtNnHfpod7yS2GTTkQ9mc0waO
X-Proofpoint-ORIG-GUID: dWW9WuF3dm0T4c3RCqbMlzd5QyrsKp1K
X-Proofpoint-GUID: dWW9WuF3dm0T4c3RCqbMlzd5QyrsKp1K
X-Authority-Analysis: v=2.4 cv=HIjDFptv c=1 sm=1 tr=0 ts=682b0ef5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=rcLBrfNTdlfi3Zk1C0sA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_04,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 mlxlogscore=901 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190103


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

