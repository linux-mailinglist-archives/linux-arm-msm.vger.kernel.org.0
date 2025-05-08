Return-Path: <linux-arm-msm+bounces-57255-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 126BDAAFB15
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 15:18:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A08F43AF224
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 13:17:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C2B4C92;
	Thu,  8 May 2025 13:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCn+6HTV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD2C86358
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 13:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710272; cv=none; b=CEydmwzvwBqcUXls925vNXv31veTDZtIyVbBHbS0Jck3cgEMN2AOlEy+s4gXlqERquQW3EFibRBKByCbN2fzYuX3mVvW6KhCsRsLKAFWtMQWrCZAGaxH17zHm2M2/eEoxYGeWUeH6GUI9gIEsK6C37cTZvrww53C1WtL4Jcw/mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710272; c=relaxed/simple;
	bh=ErPsB1GftNLSdtVkXNDPWtrGLm5oNECiIAZDxBNlw34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EemjQez9oVV5LQZ5/uQNcFidtNaypm5QRt6Gb+cx4n9nR9bxwkkiOj62ZQyCp0kc3nCmHL6boNCz+ktoAJvMd8e6dX9QSNLzmh7qyA+bMJs0Au9r+CAflkJH6T4vFYnv1H8StXikK26BDB49hV4jCoRNu+DN5ujyyZt5j5Q1txs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCn+6HTV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 548D3pO6016139
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 13:17:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l7e3Qtmja3PTSHxPd5n9Skwg
	dogb1RFbMZ2gqpLdjXY=; b=jCn+6HTV0hnjPFR7xzK7RCVIAoUHdVfT2zkoAJwv
	HsNgzpO2kOenPCLw9icECi0EQ8Qbgde+ZMwZdqfTDjAPvE+vdSPC6OGQsBR5/wnz
	3g43tTnyPLsPN7tRms4BbJiSNOSRqa+F9OQZzm4/qRZ3B6uajAnkBD3qX3zr4YoJ
	2ZyS/INY6JNrF55/gvkMYIpTURA4x6M06dfZiacgWq9zzQN/PLSCnu9N1awFxZzA
	u5Rfhm9Mpr8kGfMv8R94X9pvkEYSnW2Q5quk5jm6hV9mWENTBGJkP2TIBCsDcG2L
	hMq+VKptK6FKVRKa0kp/cPJlmzWBCnZ9DarLfPg7QInyNg==
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp8sdf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 13:17:49 +0000 (GMT)
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-861d6e340e2so80450339f.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 06:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710268; x=1747315068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7e3Qtmja3PTSHxPd5n9Skwgdogb1RFbMZ2gqpLdjXY=;
        b=Hq2CawiKyI1ejri2sWZzwE6C3oFAxSAdzjvTHxFzSPRwuYk13EuFboONAfd+a+rdzL
         ShV2dXDKSG0BmXoKovKqHWBvmn+hwWfAuhkCbwN7vvokTLSSd+VqDtguHhG2VVyxL4a3
         ohayWVy6V1vaclt2TckcFZTKLitavmBtEyXYCjTPtBEhOIR4xi/LrAgIkYBFQMZezIhj
         BjaPdnfX7OQu+3j2rUKnLYGZXkaNqjBDq1HMVw4uKS/sP1Byzs53xfbsuKVvMzCsrJ7A
         njJkScgYgWK/ceDydNINwkucHK9OFI2nJ0V/krSIr420NaDc2iD8XtCaDonXhe5tKkYC
         USVA==
X-Forwarded-Encrypted: i=1; AJvYcCVIu+6VdgEMIgICZsMByw8JCHRL/0+9gQCavFr3fh3ECdgQ6nIvutRt/+OmLaj6FLsOiH6u2aHxSzWVk2/D@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/42n9mvOIxLlO2SV0MX89wV3Rty663BIp7JJxdkJkY9owzmgS
	s+xDcoTcwcdr11l8iYxMK9juaIroTJUHLmOVyFVLvfmWXkzv3qFcGlIhUkcS5byZ9S4VllFNE+l
	svodzU61uFljOztMgLfbUBRvLsGeWw1arbe8Y7J6EbYOIl0NAM4JLDtL7Sw4CsOw6pYIkeTrfNL
	E=
X-Gm-Gg: ASbGncutpxovg9o6xosAypnd+2ko0aQYbMmM8mlWbS7dkcZLoz989Jrb7rInBISHPs1
	papFrrhuCMP1f6NJyXPQmZKQ1y2fwF/9Rj3pYFW6N/cEgtsJ6PHfWY9TigfnCrsD1u1q7kz5SX4
	OrTAAWtHpDtY31FvxP91+rJ1KlBl31jT7XR1zJW3ZJtHIg6/UhZPZdtTiHM1CHmjfJbvutI+jmM
	ozfEgEIN1YYvCIoA0FCYRP+XHtRuV73xLsgfepCcodOxoJj1JCNmoDhOPY3xwPxygBshozSmhzv
	+g9ms3ZnbC22uAw7+Ck8yJ2kfMvslc64Qt0HpEefRANVDecHYA6FfeD8754D3+MWWwU5UldyzTA
	=
X-Received: by 2002:a05:6602:490:b0:864:48ec:c312 with SMTP id ca18e2360f4ac-867476e16bbmr942544739f.3.1746710267803;
        Thu, 08 May 2025 06:17:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH8xNL29tdew9hezclB47ncc6Ol3hKGwmQCYokRS50sHKFSsRnYKdUZ1yyl4p8l0FkVpf3yA==
X-Received: by 2002:a05:6e02:338f:b0:3d0:47cf:869c with SMTP id e9e14a558f8ab-3da73933d66mr89992905ab.19.1746710256287;
        Thu, 08 May 2025 06:17:36 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-320290183d5sm25207421fa.45.2025.05.08.06.17.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:17:35 -0700 (PDT)
Date: Thu, 8 May 2025 16:17:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/3] soc: qcom: socinfo: Add support for new fields in
 revision 21
Message-ID: <q6qtzibi6sk3ofu56brg4dxjs7zmeuo2u2xccvhsgs7r7fjnev@o6tje3mipv7m>
References: <20250508131258.1605086-1-mukesh.ojha@oss.qualcomm.com>
 <20250508131258.1605086-2-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508131258.1605086-2-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: O23_FvOjGIFWw-JpfIllQ7ZocVsl0DBu
X-Proofpoint-ORIG-GUID: O23_FvOjGIFWw-JpfIllQ7ZocVsl0DBu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExMSBTYWx0ZWRfX6X+Ld2flL3io
 cxIHZgozks8rFS/iZAi7gKHskxZh0DZspe2QvB/8U7zpVl43l8mkuvh1sTfbfMGNW6zf5o52H9d
 Kf5yL0GL0o/R2nrLO0jiC9BZJxxl0mzDpx7xELcC1yNaWecMUXX+w1NFa4RCVKp5s6Y40X6ZljI
 0JUED8AJWXDBN5K5yOt2cQMyjuY7moJGTeQgIuWnyV4o2TmwLbew7sYGsbdQ24GYw1uEPAemvKT
 P6qfzMHzD0lXXdEd9cFGGdwPcg3+Xur9pwlcUV7ZjT8Bi3sWU/UwL7S2JhhFBTHJ8/YlwGTdS6K
 jTyDKvX9uPPpehDo9me/lbJvrgo+fIWqp1abktbIZ2LQ2R+8UxhsimNg4CBiiQmZfplYdvCOl3X
 iSyGlYD129En5q81Sey2DTInF/LbU1hC9B5llUcP44dsuG3Mbu9Nje2jjiUKc1d2c1Yt8xvb
X-Authority-Analysis: v=2.4 cv=e/4GSbp/ c=1 sm=1 tr=0 ts=681caefd cx=c_pps
 a=7F85Ct0dzgNClt63SJIU8Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=onFjxjlXxLmf5A9ibekA:9
 a=CjuIK1q_8ugA:10 a=LKR0efx6xuerLj5D82wC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 spamscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080111

On Thu, May 08, 2025 at 06:42:57PM +0530, Mukesh Ojha wrote:
> Add the subpartfeature offset field to the socinfo structure
> which came for version 21 of socinfo structure.
> 
> Subpart_feat_offset is subpart like camera, display, etc.,
> and its internal feature available on a bin.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v3:
>  - Removed debugfs entry as per comment from [Dmitry B].

No, the comment was to provide useful data. You didn't explain, what
kind of offset this is. So, I'm sorry, NAK.

> 
> Changes in v2: https://lore.kernel.org/lkml/20250425135946.1087065-2-mukesh.ojha@oss.qualcomm.com/
>  - Added debugfs entry and described more about the field in commit.
> 
>  drivers/soc/qcom/socinfo.c       | 1 +
>  include/linux/soc/qcom/socinfo.h | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 9a92c9c5713e..55acae79ec3a 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -608,6 +608,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>  			   &qcom_socinfo->info.fmt);
>  
>  	switch (qcom_socinfo->info.fmt) {
> +	case SOCINFO_VERSION(0, 21):
>  	case SOCINFO_VERSION(0, 20):
>  		qcom_socinfo->info.raw_package_type = __le32_to_cpu(info->raw_package_type);
>  		debugfs_create_u32("raw_package_type", 0444, qcom_socinfo->dbg_root,
> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
> index c4dae173cc30..3666870b7988 100644
> --- a/include/linux/soc/qcom/socinfo.h
> +++ b/include/linux/soc/qcom/socinfo.h
> @@ -84,6 +84,8 @@ struct socinfo {
>  	__le32 boot_core;
>  	/* Version 20 */
>  	__le32 raw_package_type;
> +	/* Version 21 */
> +	__le32 nsubpart_feat_array_offset;
>  };
>  
>  /* Internal feature codes */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

