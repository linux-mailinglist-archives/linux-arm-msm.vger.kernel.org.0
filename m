Return-Path: <linux-arm-msm+bounces-41185-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCA69EA379
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 01:13:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3481216254C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Dec 2024 00:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DD65801;
	Tue, 10 Dec 2024 00:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="BfDm81It"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919D62566;
	Tue, 10 Dec 2024 00:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733789605; cv=none; b=Gg93jDnzMct2gsnbTnOK7iP90VNXcSnhvDbd7xpnzcbcLTsuOD9JfALtCgYVuFY9YKWlTKG2577We+3I7na4ZRdxc8Emt/ZROUA4AyizTA5OVSFoi9h81xF4hPQoN/yAHQOwCPCADUc3DGJBfPUl3xucrjTk3ewZt6CeCQB8BZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733789605; c=relaxed/simple;
	bh=Klb4wB/jVFiJASShs7I12oSH0JoT2s8nL/e0eKWCTKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=rbH4UYLKBN8vFdBO2BUFTasHPSCwjKuNV6YHPk+5w/PFIJSnbQ9SO6Y3DlrvIl1DhKZ+OzIYUOod/oR7nPR8PdoTb4VwqvfX2nf6gaw9tnd3eOKeUXXHbCQ88eH5Fi+6sQdPdmzJsC3hPX2XAIYBRneALc8mrnR+q3wjQO07TkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=BfDm81It; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9Id8ai004005;
	Tue, 10 Dec 2024 00:12:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oCl1BV2fHuuqqAlK2xaxNjelJuvim/AfeNRMvUso7Rs=; b=BfDm81ItqnCEthpw
	w6V/iDyAaUyRlwoD1H12sf++0/XmFK1fn9J5Z1ALRbK1/OO5npc8bnYulVhxG/d1
	t8DWJZd+Ci3IuNxhiMrV08I3bO+J9QtdhkM4ziPuMjtmwMcGPdXl5Rr9TevZSz/O
	xfP3UcqY0Xwn6D5dG6MMciB4r1j5TQU++eWJI8XCsbzUIAIWA+FTET5MrOZ4ctN2
	lDcTPmsyG0X1wZwllsqYSVziqD6Kh7f+TN7MrCYopwS4PyZXBInbDnc6fp747lDX
	iM/Hg97xhddPO0oIet0jF/ZWX9vJk5uTL/TpENtPIkfnfsZHjDwYgcJ9pqxXeg+y
	L4k8nw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43cek1xfyn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 00:12:50 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BA0CoYd028470
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Dec 2024 00:12:50 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 9 Dec 2024
 16:12:49 -0800
Message-ID: <71656363-1b35-4150-9273-dbfe7d3d28be@quicinc.com>
Date: Mon, 9 Dec 2024 16:12:48 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/msm/dpu1: don't choke on disabling the writeback
 connector
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark
	<robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David
 Airlie" <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Simona Vetter
	<simona.vetter@ffwll.ch>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
        <stable@vger.kernel.org>, Leonard Lausen <leonard@lausen.nl>,
        =?UTF-8?Q?Gy=C3=B6rgy_Kurucz?= <me@kuruczgy.com>,
        Johan Hovold
	<johan+linaro@kernel.org>
References: <20241209-dpu-fix-wb-v4-1-7fe93059f9e0@linaro.org>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20241209-dpu-fix-wb-v4-1-7fe93059f9e0@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 5mJ68cI9azIwJroRb_7-ju-JPNC2ON_s
X-Proofpoint-ORIG-GUID: 5mJ68cI9azIwJroRb_7-ju-JPNC2ON_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 mlxscore=0 adultscore=0 clxscore=1011 malwarescore=0 phishscore=0
 spamscore=0 mlxlogscore=999 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090188



On 12/9/2024 2:04 AM, Dmitry Baryshkov wrote:
> During suspend/resume process all connectors are explicitly disabled and
> then reenabled. However resume fails because of the connector_status check:
> 
> [dpu error]connector not connected 3
> [drm:drm_mode_config_helper_resume [drm_kms_helper]] *ERROR* Failed to resume (-22)
> 
> It doesn't make sense to check for the Writeback connected status (and
> other drivers don't perform such check), so drop the check.
> 
> It wasn't a problem before the commit 71174f362d67 ("drm/msm/dpu: move
> writeback's atomic_check to dpu_writeback.c"), since encoder's
> atomic_check() is called under a different conditions that the
> connector's atomic_check() (e.g. it is not called if there is no
> connected CRTC or if the corresponding connector is not a part of the
> new state).
> 
> Fixes: 71174f362d67 ("drm/msm/dpu: move writeback's atomic_check to dpu_writeback.c")
> Cc: stable@vger.kernel.org
> Reported-by: Leonard Lausen <leonard@lausen.nl>
> Closes: https://gitlab.freedesktop.org/drm/msm/-/issues/57
> Tested-by: Leonard Lausen <leonard@lausen.nl> # on sc7180 lazor
> Reported-by: György Kurucz <me@kuruczgy.com>
> Link: https://lore.kernel.org/all/b70a4d1d-f98f-4169-942c-cb9006a42b40@kuruczgy.com/
> Reported-by: Johan Hovold <johan+linaro@kernel.org>
> Link: https://lore.kernel.org/all/ZzyYI8KkWK36FfXf@hovoldconsulting.com/
> Tested-by: György Kurucz <me@kuruczgy.com>
> Reviewed-by: Johan Hovold <johan+linaro@kernel.org>
> Tested-by: Johan Hovold <johan+linaro@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Tested-by: Jessica Zhang <quic_jesszhan@quicinc.com> # Trogdor (sc7180)

> ---
> Leonard Lausen reported an issue with suspend/resume of the sc7180
> devices. Fix the WB atomic check, which caused the issue.
> ---
> Changes in v4:
> - Epanded commit message (Johan)
> - Link to v3: https://lore.kernel.org/r/20241208-dpu-fix-wb-v3-1-a1de69ce4a1b@linaro.org
> 
> Changes in v3:
> - Rebased on top of msm-fixes
> - Link to v2: https://lore.kernel.org/r/20240802-dpu-fix-wb-v2-0-7eac9eb8e895@linaro.org
> 
> Changes in v2:
> - Reworked the writeback to just drop the connector->status check.
> - Expanded commit message for the debugging patch.
> - Link to v1: https://lore.kernel.org/r/20240709-dpu-fix-wb-v1-0-448348bfd4cb@linaro.org
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> index 16f144cbc0c986ee266412223d9e605b01f9fb8c..8ff496082902b1ee713e806140f39b4730ed256a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
> @@ -42,9 +42,6 @@ static int dpu_wb_conn_atomic_check(struct drm_connector *connector,
>   	if (!conn_state || !conn_state->connector) {
>   		DPU_ERROR("invalid connector state\n");
>   		return -EINVAL;
> -	} else if (conn_state->connector->status != connector_status_connected) {
> -		DPU_ERROR("connector not connected %d\n", conn_state->connector->status);
> -		return -EINVAL;
>   	}
>   
>   	crtc = conn_state->crtc;
> 
> ---
> base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
> change-id: 20240709-dpu-fix-wb-6cd57e3eb182
> 
> Best regards,
> -- 
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> 


