Return-Path: <linux-arm-msm+bounces-21805-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0482B8FD717
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 22:09:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 065EB1C21E69
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 20:09:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F4E81586C7;
	Wed,  5 Jun 2024 20:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cTgR5h7D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E7C1586C2;
	Wed,  5 Jun 2024 20:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717618181; cv=none; b=k5+wLAWV5Tobd2nH7CjzfmPnD894inkspPDN1Z69k5A2jMXtzGSZwISaPdF9HZ2ct407IqnlaDjQ9KF7JY8zSJq/w1T7EXVFC9n62za5nVu+lMYhMcEbYf5pdMbGf93SEmXEH/d8qTsg5T+ghc23D5Q18iRjxkEYYi8ys9Ia6r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717618181; c=relaxed/simple;
	bh=q5q2sPEHc1IeGS8/STUgj6c5jHJLzgf+gSISjwzr7LY=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qOdfnriGAZKVPEOTkb5gXV72h7epjf43rWahCbrWrUQ9Rj7tvCbee1zMOlO5Z81ymzhzszwarckPeYl8+p+uFFBdN2pcmz8sgEwKcXrZXuvLTMGnbECwdbuhBYLysSrez+qj5xRVrvtlalarXpAxajvNBjVcqQVghKLMWQbQ4i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cTgR5h7D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 455B1UAE031701;
	Wed, 5 Jun 2024 20:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2jD0iAByBrblo2mHsq9wVJpyFTNe2XYoMJW7oYlu/mg=; b=cTgR5h7D9gHy40Hp
	JiWGqeMh8sBbEIbPJDTOaC4B07rHZcPXFsBE/dWUs3ECOS8Wb/az2pk2vsfMyse0
	JLFYKtZ7aLkqEutVXexvtwAfdQT62EHnVNANk91EH0J1vFMwTnFnATigYSmwrcvb
	S2JT8WMoYkLTyrRN8swIzVJgGHWms1fXY3u8qU79TEqymUoZv2yI5zUHF1EUzQiz
	ZB2wDmvBQAplombCeKSLzlirhceVA/DXE9nFbPPNN5bz4CWOJwMz7Tf0L653tbIR
	CPR/yhTw/7ab24chng7kt3hzw/DFUgkpgB5LEOTIg0PP2fppAP9YIMSClG0gHiuS
	9CxfaA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yjh3tt12v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jun 2024 20:09:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 455K9WTY012571
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 5 Jun 2024 20:09:32 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Jun 2024 13:09:32 -0700
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        "Marijn
 Suijten" <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Revert "drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set"
Date: Wed, 5 Jun 2024 13:08:44 -0700
Message-ID: <171761747138.369436.12855914358070843959.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240522-dpu-revert-ams-v2-1-b37825d708e1@linaro.org>
References: <20240522-dpu-revert-ams-v2-1-b37825d708e1@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ewqQ6WTefxTODDIndemJtBrcncU-rcSk
X-Proofpoint-ORIG-GUID: ewqQ6WTefxTODDIndemJtBrcncU-rcSk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-05_02,2024-06-05_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 clxscore=1015 mlxlogscore=582
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406050152


On Wed, 22 May 2024 13:24:28 +0300, Dmitry Baryshkov wrote:
> In the DPU driver blank IRQ handling is called from a vblank worker and
> can happen outside of the irq_enable / irq_disable pair. Using the
> worker makes that completely asynchronous with the rest of the code.
> Revert commit d13f638c9b88 ("drm/msm/dpu: drop
> dpu_encoder_phys_ops.atomic_mode_set") to fix vblank IRQ assignment for
> CMD DSI panels.
> 
> [...]

Applied, thanks!

[1/1] Revert "drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set"
      https://gitlab.freedesktop.org/abhinavk/msm-next/-/commit/6e301821c28d

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

