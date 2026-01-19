Return-Path: <linux-arm-msm+bounces-89590-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 82F79D3A351
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 10:40:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 67E753025DB7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 09:40:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0A33570B5;
	Mon, 19 Jan 2026 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cvvg3NUY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WLbNYJKe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAF333A715
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768815639; cv=none; b=o1ipBz6kUjyDDFdEMZn4nPWQl2SzsfCj7+/iSmQZHUwjwR9B6BcJye3/G3LiZT9MFgyIf4CYeIsLFCmCDKuhMdAJBPLl5DxlmoNfXyiui0gx87iEfvFXJv2mGnJyyjCVbq+2IFfFkBA4Et2CB8W6A173ijKpxPHcoedaX4+StGQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768815639; c=relaxed/simple;
	bh=twlrZl2HI0iBiBkJYhXKCrLjGLEWpqwu2Wk2mC0mbe8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gyl2Dv2v58I+KLn/EgU/HRboTzfbQARENGlmfXbrMNJCQQfQfxOaSOyTsQU/BQFd/3lj8XXSFxpWCmblx9fYPfn77JcgqkuYq15VzoF2uJF6qzjaZfYw30ec8ZZ+FiiAd8X6usQe16HVsDa//aAbwdSy+2iGGBvlyS7XSON5z/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cvvg3NUY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WLbNYJKe; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60J91JUC1470690
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:40:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Bip6G8csV4zq/Xp+lYc4Ge8wdL7FLZzkYw/gjd1Ywp4=; b=cvvg3NUYIxQPKJvS
	vItfA8AiTG8ZUUY1hkdSsQWWeGcEAWLz53cKwzg5NQ9wAefCM3cNc7EIX4qPUPuS
	epWFPWj953JjJaiw6bwOEDjm6cMozpr//pSb0iZdtLw3DUn7SQo9aeX7cbDpDlfA
	CN1dJlxv5vO7+ETVj1aXMEqbzNIq4MDi0KiAXIevNDQGGyCoQy5aLVg5x3knx+1B
	yxsPt/pHCHsYfK0rCevM9Gl1tmZyIPT0rjc/FsulZE0atf5HVSKpNEGIXNnSBLHc
	Y3GpUHnNcvnXwui8/3Ayl2WqqH9uy6SaMubi230302Jg7INwN1xC97ERdegn7186
	Ru/Adg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4br2gummsw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 09:40:36 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a0a0bad5dfso67064895ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jan 2026 01:40:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768815635; x=1769420435; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bip6G8csV4zq/Xp+lYc4Ge8wdL7FLZzkYw/gjd1Ywp4=;
        b=WLbNYJKe4YzHCXzxtVt2fRMgOzcfvRNxWQthkbUsx0AtoEA9NlYfXwasp/dzZzFEHc
         HICFdQFt1HO42vzer1JamSqLnxFBoThO9VrYhDH31/1pPgeyzeV5B38bG+qMu9JSaMFF
         rFJbGGaJgazygANDPx6WpYUjI9QTwnopD6k++9AhTb01U3hvZUPnhx3wIV/jn9cvdKyh
         1zpEDZErHI7g4KpYiPmX4ZueX/RFQXcZyha2AdM8gxRZdU/Uzjo0s+k+FznOC+w8Dji4
         hjdWfA3W9R0Cu0PhXp0tL2qyHoWMQBGcbqk/CszWlDYZjYs+h9q+ManuiTQeye8N1CCr
         oCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768815635; x=1769420435;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Bip6G8csV4zq/Xp+lYc4Ge8wdL7FLZzkYw/gjd1Ywp4=;
        b=mdlkgb7l5bLOVVAp2460xAiILWH22iGOoCXwpvadp7RXxWNgmrl2aqUvg0Xr7wG9wB
         vKk22H/NWR0D6fJ9neptXVDh82H5Foc+DZG49Xvh03vyKBKiKCWuXASJi2jbZEA0RIxm
         8m3PCFXYz6iEwETWukj1LhWW4wmLqXDZ4g6i0ISC7FtyxuTrFb1XnANEYWANvs6cmEyY
         Gx5+bgyE3uOOtTe+VSY5wOftAAGyzcN4b3D20x2R3vm94UsEFsHt6zXzwCY42t2TMHCL
         VSDCywMLpA1aBqt4rXbnQqXMaiGOY/FjXVhSg/pFKbCcqX4lM73mFPsyuQGrC+odycwm
         jVGA==
X-Forwarded-Encrypted: i=1; AJvYcCXcdPGIo2jodL2q4mlyqL/9tGSjLPEn/Hzk/Ha0ZvjGbxj/E1ZBSK+Rixmx3cxT1VN75V2tFkYi65k0abk/@vger.kernel.org
X-Gm-Message-State: AOJu0YwVr3UtWgB6loZ6d71OLysIH9Dy3p7//e9zh5R951Xwl84chkWI
	p4PWGwia/gOb6jj5+Yl04VQsmvFk+UavV95+7zi1RKnJLF80t/LpCNL1ANd0d1rPLlRLK7YZJvE
	Z6AAf2djHv+hnNrW64EJE5IVltgvtceNHTYMr/JngWkB0djrbO60xpZUyyIs2pqIikq7LXu8MfF
	Ez
X-Gm-Gg: AZuq6aK/okxRN6wIj61Jnd6yzNAYzciZtS1HtdJNjA4+CFUw8hUHUHLZKF8MFLSpBf7
	EwgL9o/7e8WwNs3rlggonbVBlbTFU3kP+wt7P1bfMXDOfXzss9/T0v2j4Nl2zGxLVFsa8u2UHe/
	UjHPv2q0qXmu2oDxv2DLkgvnOnu9la0FmzfzweUC6O+eA61AHi7ssSMfmzp97QJaiWHEhTFHvB4
	H2uyeAoMKKvVqs6cAbqux6G+49Xqlj1Vmi35OucNP2CTVCtVwMuVzpZP565IzubDyygY8Wev+3K
	zYLXbXPkBDM3e8hp720CikFDMGZtDpaTjql9taDIEpCg+cnPFwcnn8THLaa7Zgia3p6pPzlSutb
	rSHANc4UkQxxt+gvxgIbLkMExPzoi9goma0et1Pqn92NY
X-Received: by 2002:a17:902:f60b:b0:2a0:7f87:2347 with SMTP id d9443c01a7336-2a7175be2abmr98610865ad.46.1768815635291;
        Mon, 19 Jan 2026 01:40:35 -0800 (PST)
X-Received: by 2002:a17:902:f60b:b0:2a0:7f87:2347 with SMTP id d9443c01a7336-2a7175be2abmr98610625ad.46.1768815634867;
        Mon, 19 Jan 2026 01:40:34 -0800 (PST)
Received: from [10.206.109.90] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941b915sm90223415ad.90.2026.01.19.01.40.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Jan 2026 01:40:34 -0800 (PST)
Message-ID: <2b87e1bc-75ea-f2af-cb81-fd12b5d2cf07@oss.qualcomm.com>
Date: Mon, 19 Jan 2026 15:10:30 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 3/6] media: qcom: iris: Add B frames support for
 encoder
Content-Language: en-US
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: quic_qiweil@quicinc.com, Renjiang Han <renjiang.han@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260109-batch2_iris_encoder_enhancements-v3-0-196855ef32ba@oss.qualcomm.com>
 <20260109-batch2_iris_encoder_enhancements-v3-3-196855ef32ba@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260109-batch2_iris_encoder_enhancements-v3-3-196855ef32ba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDA3OSBTYWx0ZWRfX2sABF76WiaNC
 QjiHRInxKjx55sTyLxrB+Uml+0atzHoTFc7XEjGsCe2DOm2tJVflRWt0zW+Amfh73D2d56OipPW
 rH/ClrtEiKGaFyXrlnZtLVAM51yrBAfgJj2e2SOzp4l6JxJqHWGU4mjhyJRqfgqdM+rzA0rKXWS
 hefWnBEC7jGTWKPX5mq7u+Cao012zBoTFU06gh0yscwqM4Rvq91k58plVf8LLYGSX/Yhf7hOX75
 ulU8idzMK6MJ0UumA2v2jmxgmQhGUhyU7FtSONOVeUS3/oTHvvdAehibIrM5p6r/q1hHM0Fy7jG
 Zh9km8z4q4oP0i7dKf7WpFLz5swLXaTGXU6cRgSkNZCEVXhCXEw/DLPnX+uX7x58vlh2JxKmWrN
 q1hV27md+sYdON2Wq311pFdbKikVJNQjZh1hsw5RU4fKRU2TTggX6XA/D3GVAAF+IatzHgf+r2+
 U06eNFH1QKrImJwPR/g==
X-Authority-Analysis: v=2.4 cv=Sev6t/Ru c=1 sm=1 tr=0 ts=696dfc14 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=hqVnMPCZWYgSQcfks7QA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: DCWwJZEtYmiNpNaMrQAGpbLWUzy2iNai
X-Proofpoint-ORIG-GUID: DCWwJZEtYmiNpNaMrQAGpbLWUzy2iNai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_01,2026-01-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601190079



On 1/9/2026 1:12 PM, Wangao Wang wrote:
> Add support for B-frame configuration on both gen1 and gen2 encoders by
> enabling V4L2_CID_MPEG_VIDEO_B_FRAMES control.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_ctrls.c      | 30 ++++++++++++++++++++++
>  drivers/media/platform/qcom/iris/iris_ctrls.h      |  1 +
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     |  8 ++++++
>  .../platform/qcom/iris/iris_hfi_gen1_defines.h     | 10 ++++++++
>  .../platform/qcom/iris/iris_platform_common.h      |  2 ++
>  .../media/platform/qcom/iris/iris_platform_gen1.c  | 18 +++++++++++++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 10 ++++++++
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c |  6 ++++-
>  8 files changed, 84 insertions(+), 1 deletion(-)
> 


Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

