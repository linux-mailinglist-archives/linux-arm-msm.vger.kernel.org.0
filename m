Return-Path: <linux-arm-msm+bounces-3342-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFAF803C24
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 18:59:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C9A6D2810E6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Dec 2023 17:59:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B9022EAEE;
	Mon,  4 Dec 2023 17:59:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PnwjeFlx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78BD6101;
	Mon,  4 Dec 2023 09:58:58 -0800 (PST)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B4Gv7FV008630;
	Mon, 4 Dec 2023 17:58:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=6C0foyF5t1y3XKDKp8sjegbAV7/WSl9ZRbI12FZB9pU=;
 b=PnwjeFlxmbR9XDrlWWhs/KbFj4oWu74Q3107ieD/QaQAXo5H8Z5yN+i7snBI8ZEXTeb7
 +oewcvWHtZs+K1X31gzz3juNm96WZfvpzd33O5qMkAS41wauTW+55Tskj3GZM6Idux4R
 lgirp4Y20fDlD1gSh8K/wMph7tKkAE+4yJfyG9izGizwude8DHjTD4eD1nZkA2WwUo78
 HBSqa5mOPbTArxEsVCt85sDBoMf3DSuQKuLPyCj5969XJ8pVc3aU30UKX9tmQGTAJRR0
 19REkSg5tLaiSlgcpWFj2Pb2F34N5LCDp8GtT0qRbfq/93EkcKScafsLV4Ssh06lXH1L XQ== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3usjnqg5c4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Dec 2023 17:58:24 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B4HwNkJ017781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Dec 2023 17:58:23 GMT
Received: from [10.110.73.134] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 4 Dec
 2023 09:58:23 -0800
Message-ID: <840c8b10-c1c2-b380-bdf8-e04899bc33ad@quicinc.com>
Date: Mon, 4 Dec 2023 09:58:22 -0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: (subset) [PATCH RFC v7 00/10] Support for Solid Fill Planes
Content-Language: en-US
To: Simon Ser <contact@emersion.fr>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@gmail.com>, Sean Paul
	<sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        "Jessica
 Zhang" <quic_jesszhan@quicinc.com>, <ppaalanen@gmail.com>,
        <laurent.pinchart@ideasonboard.com>, <sebastian.wick@redhat.com>,
        <ville.syrjala@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <freedreno@lists.freedesktop.org>,
        <wayland-devel@lists.freedesktop.org>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Harry Wentland
	<harry.wentland@amd.com>,
        Sebastian Wick <sebastian@sebastianwick.net>
References: <20231027-solid-fill-v7-0-780188bfa7b2@quicinc.com>
 <170155324921.2215646.4829699354481827834.b4-ty@linaro.org>
 <OiX1EToyQ0JBECS-Vs6IOw1vqLTt42PYkTlTCBhsPUi-VXC2UoLjkRfEW-OFucxsTqz93Q3IIXZZ3Lw_Lqs1dFt4YbuFSUGrKfDPnnKDCbw=@emersion.fr>
 <44a3fbd4-44fb-0a39-65be-e680e03b1b6e@quicinc.com>
 <jLtQnAu4g7zRJxEwwoX5HhVfleNLflhi9mUGTQAVKV4QaZt_D7NIOov31MKHu3zdEls3ULzYEiQNGeL4gKRpjjU1VDbl4DDhEBldXXrYzNA=@emersion.fr>
From: Abhinav Kumar <quic_abhinavk@quicinc.com>
In-Reply-To: <jLtQnAu4g7zRJxEwwoX5HhVfleNLflhi9mUGTQAVKV4QaZt_D7NIOov31MKHu3zdEls3ULzYEiQNGeL4gKRpjjU1VDbl4DDhEBldXXrYzNA=@emersion.fr>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zEx4t-5umwSk_1qrTS_4DZiRbhhYli5Q
X-Proofpoint-GUID: zEx4t-5umwSk_1qrTS_4DZiRbhhYli5Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-04_17,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 mlxlogscore=615
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2312040138



On 12/4/2023 9:57 AM, Simon Ser wrote:
> On Monday, December 4th, 2023 at 18:51, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> 
>>> Where are the IGT and userspace for this uAPI addition?
>>
>> Yes, we made IGT changes to test and validate this. We will post them on
>> the IGT dev list shortly and CC you.
>>
>> We do not have a compositor change yet for this as we primarily used IGT
>> to validate this.
> 
> Yes, please post the IGT.
> 
>> Can we re-try to land this once IGT changes are accepted?
> 
> There will need to be a user-space implementation as well, since this is
> a hard requirement for new uAPI [1]. Maybe I'll give this a go if I have
> time.
> 

Much appreciated.

> [1]: https://dri.freedesktop.org/docs/drm/gpu/drm-uapi.html#open-source-userspace-requirements

