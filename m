Return-Path: <linux-arm-msm+bounces-3364-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F894803F3E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 21:25:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B55EAB20AD7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 20:25:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCE8A34188;
	Mon,  4 Dec 2023 20:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="m9woum7u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DD9CCB;
	Mon,  4 Dec 2023 12:25:39 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B4JxZT6028697;
	Mon, 4 Dec 2023 20:25:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=VoyLD+BBBgnkOe7m+0wyGjQqsPNxrHuUW5al5xZbTeg=;
 b=m9woum7ukhrKgy2DlbVkq2m+pO/zRkSoTjp2rBy2klcmFL8JYacLW70LiypX0MjSaxe+
 ORDAuC/8DKWmhkalXAUKTu2SA47IkuEPd0mc2rwoUdUrVJiGJSGBUkg1oTFYtbKqPEIN
 VeCLf4ejhodQk8ZLMYW0T1ezbKVXmSCvRqt9kP5OY+dCvBXtuMeP7JGAXvzaPst1BNY4
 h19w4vMysFfhbAPHPvH2pMs7L63NGP6OgbkK1xVAYvmqozBrhYJtBI6RIcxk1ZFSix4O
 N0dENhlm2jcdlu8D5N6nMqlXYevBZWAmEIi7GJPf/nvhHL0WwrM8T9hDS29ca1QPPZEF mQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3usjnqgfdc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 20:25:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B4KPHqF006340
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Dec 2023 20:25:17 GMT
Received: from [10.71.109.77] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 4 Dec
 2023 12:25:17 -0800
Message-ID: <230fd6a4-c1d6-64af-1073-2effd5d44d8c@quicinc.com>
Date: Mon, 4 Dec 2023 12:25:16 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH next] drm/msm/dp: add a missing unlock in
 dp_hpd_plug_handle()
Content-Language: en-US
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        Rob Clark
	<robdclark@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        "Sean
 Paul" <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "David Airlie" <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Bjorn
 Andersson <quic_bjorande@quicinc.com>,
        Kuogee Hsieh
	<quic_khsieh@quicinc.com>,
        "Vinod Polimera" <quic_vpolimer@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>, <linux-arm-msm@vger.kernel.org>,
        <dri-devel@lists.freedesktop.org>, <freedreno@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>
CC: <kernel-janitors@vger.kernel.org>, <error27@gmail.com>,
        <dan.carpenter@linaro.org>
References: <20231204171317.192427-1-harshit.m.mogalapalli@oracle.com>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <20231204171317.192427-1-harshit.m.mogalapalli@oracle.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: f2EGCVjZ2PkGJvnv8FbQ_bzpg_EP3lOK
X-Proofpoint-GUID: f2EGCVjZ2PkGJvnv8FbQ_bzpg_EP3lOK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_18,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1011 mlxscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2312040159



On 12/4/2023 9:13 AM, Harshit Mogalapalli wrote:
> When pm_runtime_resume_and_get() fails, unlock before returning.
> 
> Fixes: 5814b8bf086a ("drm/msm/dp: incorporate pm_runtime framework into DP driver")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> ---
> This is based on static analysis with Smatch. Only compile tested.
> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>   1 file changed, 1 insertion(+)
> 

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

