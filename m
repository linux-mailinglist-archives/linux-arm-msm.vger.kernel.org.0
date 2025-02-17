Return-Path: <linux-arm-msm+bounces-48308-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFECA38F30
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:38:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 89BBC3AE7CB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 22:38:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 621821A9B49;
	Mon, 17 Feb 2025 22:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RXFui61R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57DB1A76AE;
	Mon, 17 Feb 2025 22:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739831927; cv=none; b=URoAkcM+ZvxClMp3t2pyISpics3qyWV86gVTQoJd46q5CcVS0azpe7WLf6hv+9li1jBk1wjRAHXcFK3YtXalKe8r004ggJnaYTpWkdBi8q1bvRDZfAeAorCEbfBRQg0vXYxALavjXG60JIi5Jm7Rj+kRpAKBLifJh8C0dYTtIPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739831927; c=relaxed/simple;
	bh=UpkLMFwdVN1SfumTC4gLP6uKLRByY8cWGS93kTF8qQc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fWsRdJIudaVcqE/+lQ+uoTwNmpSUkyd6qd6Uuoycw0MU/+gywkED02e0WxUIUc0yy52iok4LuhYvSesuBQIdJnnflJtun4ZFu8FS0jOm2dxXs6aDfFvLVefFuBVV/w8usicdOyVsRhy/qLdyBznv7Bp1bfSnXhmFEG1Dzm/cu58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=RXFui61R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51HAcnwq029901;
	Mon, 17 Feb 2025 22:38:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	42rWO8dHWS3ppdgrcUkKYDi9W3bIli7fWo7u/B2A2qY=; b=RXFui61Rh+bYFZEB
	vtsZVt29/JgZ1btSOCp7JXEKhuiOFEQPkJBYMb6hUPZZD3LdyMIpt/4XG5NLS54e
	KO+Eq8lOYdIKpESSQCD1FxnXYwNLvXDWmEilnuBc5SAqZdu/bbzWMMuGunPilTHX
	ZbN2hcg39BIp6sEz47ZQhXHQUo0Bii+ERWyopzz9k55GxEbwRLCranmfnJjlcAdj
	F5oqY+vUSqT/A/LvejrHljW/bHqPf/M5ELe+++qjNBhLWjQv87aqGeBSKLAvd6Em
	d1Iw7GMCWoTYeyr4sTyV7Nx39iG/59ooqRbJB4xv8oapSF+zGmaGup9Hwm5Li5Wh
	8InDHA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7sjyjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 22:38:32 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51HMcVTN008215
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Feb 2025 22:38:32 GMT
Received: from abhinavk-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Feb 2025 14:38:31 -0800
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Dmitry Baryshkov
	<dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie
	<airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>, Vinod Koul
	<vkoul@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>
CC: Abhinav Kumar <quic_abhinavk@quicinc.com>,
        <~postmarketos/upstreaming@lists.sr.ht>,
        AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>,
        Konrad Dybcio
	<konrad.dybcio@oss.qualcomm.com>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH] drm/msm/dpu: Don't leak bits_per_component into random DSC_ENC fields
Date: Mon, 17 Feb 2025 14:38:23 -0800
Message-ID: <173983182587.1719712.14378723556060583905.b4-ty@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250211-dsc-10-bit-v1-1-1c85a9430d9a@somainline.org>
References: <20250211-dsc-10-bit-v1-1-1c85a9430d9a@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 6YfRdLVYgfJjzJ19XleMGb5g2qXdKLnc
X-Proofpoint-ORIG-GUID: 6YfRdLVYgfJjzJ19XleMGb5g2qXdKLnc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-17_08,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=907
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502170176


On Tue, 11 Feb 2025 00:19:32 +0100, Marijn Suijten wrote:
> What used to be the input_10_bits boolean - feeding into the lowest
> bit of DSC_ENC - on MSM downstream turned into an accidental OR with
> the full bits_per_component number when it was ported to the upstream
> kernel.
> 
> On typical bpc=8 setups we don't notice this because line_buf_depth is
> always an odd value (it contains bpc+1) and will also set the 4th bit
> after left-shifting by 3 (hence this |= bits_per_component is a no-op).
> 
> [...]

Applied to msm-fixes, thanks!

[1/1] drm/msm/dpu: Don't leak bits_per_component into random DSC_ENC fields
      https://gitlab.freedesktop.org/drm/msm/-/commit/144429831f44

Best regards,
-- 
Abhinav Kumar <quic_abhinavk@quicinc.com>

