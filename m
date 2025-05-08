Return-Path: <linux-arm-msm+bounces-57256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 453EDAAFB21
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 15:19:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A53DE4C3C24
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 13:19:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03B5C22A4ED;
	Thu,  8 May 2025 13:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="U7V5S7nj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C2A7F477
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 May 2025 13:19:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746710388; cv=none; b=UgBYBw9alqFugTeFWNDAXQNLK1dV0WcYowPF1qnJ/OdCwBYHJhfTF0UMsGjGO+FLioNinXMDCotXkR8Ppdj+Ani/zZSCDyifxvgLlphQYURdrJZEl0L6g8os8x+uj6RzwpqE9wMzDiwkWa6zY1/FOriGvhlRWiLH2tyUCH2SJmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746710388; c=relaxed/simple;
	bh=oYsKZrI/QuIcLR4LB3WMeOu7dsFyvR/V80WTMUsSwMg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pl2kWUPiSgBalw5e4EdUUqkz35fjQsK5hRhlD7p02hISMCb0iFvJOPgPwGYS0Mj3xhsebxYnAfRFVcl0Y4IpBA7qhbp3Tdx5wc6fcuR4Ymlk2LIR67U3fs9a7VylF526XqMKhBQEnRnpojbeYzfT67qsL41JbDM5v+vRr6YrfXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=U7V5S7nj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484X9mS009191
	for <linux-arm-msm@vger.kernel.org>; Thu, 8 May 2025 13:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=z/1xtniQuJczlJZ01ujz+Bh9
	4R1uqdJi6knoWevjihQ=; b=U7V5S7njDzas1wDtTjAEEvjvjLEu9rr/+G2h5r93
	86wVDvMoepXgrlnDbRyu+vVWo32Z9hGhrChGe4pPTjGpKa/RzhF36aRnC5DeP36z
	A2S6UP9iooPcIOFnwKfLvId8NaxZ7DIYUNN4K5dJFAuzQtTp1NNQ+eNsyMu+Z/mo
	i8D+vpCUOXo2nf3l75PK8KxcDxW5QZ/lnRYdGjjDJFMQJ9vjVmizzhDtu8eO4ZuY
	v+BfcU7DI/V+zB4vwFonjZUMq7xlWMy/XG0Rh6+PW4F066g85fgf1fUkBHZfswxg
	RapJxyQgxTrp4TC+DwfrjQO6c0MFRN6fkokjTHi9FyxegQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnpescw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 13:19:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e2a31f75so314511185a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 May 2025 06:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746710385; x=1747315185;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z/1xtniQuJczlJZ01ujz+Bh94R1uqdJi6knoWevjihQ=;
        b=idI+/wKcyaDoWqcJnUi5RbUsqrWjJ5T3iCiGW9juByEBUzHmmuVGFnPJnELFZ+eX9f
         RV8Om3OJf0kZiACnH7gCzignBRKMxTqx4QGj1FzK2zsLQ4JKHDt0okUxuInltNOclt+Y
         QjaXoEZqKlnDbqH8zFagHJRVpSnMHT3LMHwPKg+1liAvRXKCPHVWfOyl+aMfrd23JK1k
         ATi2hGSlD2Tas34LbXEUpWHZZx8qYHV2h+Wse6OUXwVX6H4WOQqdxkt5e2c2yEwdtUad
         x1YfbCd5aJKtOxMsZH5WZgasT50ryW/hfHuTSE9xXmn96WvIM0gxl9NLkX8L3gC3VGwR
         WW9A==
X-Forwarded-Encrypted: i=1; AJvYcCVmOqk9ntrG7Mb3corC/FV+Hje/84OBVVvSDQbU/xkW0OFjGg3LAhhxhxA2HNPvR3xkUd3b+vh9mqjvb3i9@vger.kernel.org
X-Gm-Message-State: AOJu0YwTlkYGsuZwcqZUPT+qvoJ6J/+3Sw8J8Ifm4HS/repSHThC866K
	u+GL/Z0I5AsLYEde8nddLOxHh7O+uh+oVzxTn6JkZxUP9CjQISsGw1z2knXgfgwRqETYHV41cg6
	6stiN9oGYi+3ELZViiGKM63h8tE4fH03mPxZVkF1maP7XToY5KySJ6Z6vCDTz6v6306C3bhqER0
	0=
X-Gm-Gg: ASbGncsg9PujHZ1qzTeJrgmQuRI59kygS8QtYgNCDBLLWgLTnw3yN5eSLop8/sQg2aq
	F79N4x+CtOKS0qupHPkx2LlpcSpSpre6XPXwmtCKiW2pldympo46OymtGFgRuV1MQ4sWRXZ9Be9
	phRXIgtMFXd4UdJ4lpKebHziVQ52yeoid2R55VnlFXZYXj6EKA49rbMvr2qWJWVru0XuvJjOmr1
	y4FjDCW3zJ6AaejcqZVKV9DvL9X029RNXLfIS/HBE7t0RDKJso0QnKxwriOFuz+yzAMqAgjkNVL
	B/5/QWeRhXQVcAY+o+MWYg+uoUPtJLSxfABe1iRQPJTSwnlhSDuCXX+YpIhcAFA1dPLVbbnpRYg
	=
X-Received: by 2002:a05:620a:468d:b0:7c5:3e22:616f with SMTP id af79cd13be357-7caf73a197emr986079185a.21.1746710384871;
        Thu, 08 May 2025 06:19:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwZ8OHi4nmwi2PAMVW/hTh0yRsHpekT3AVeqkkGbnKdO5qYSUxeVNmtp3L6oWAEFv8SH23dg==
X-Received: by 2002:a05:620a:468d:b0:7c5:3e22:616f with SMTP id af79cd13be357-7caf73a197emr986075785a.21.1746710384459;
        Thu, 08 May 2025 06:19:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3202a89f7f9sm25700361fa.71.2025.05.08.06.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 06:19:43 -0700 (PDT)
Date: Thu, 8 May 2025 16:19:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] soc: qcom: socinfo: Add support for new fields in
 revision 22
Message-ID: <buah53a3j7l2ue3y64m526ztbu7467t4tooyqvc7rhwoxbbnzy@3zxm5sz5qchb>
References: <20250508131258.1605086-1-mukesh.ojha@oss.qualcomm.com>
 <20250508131258.1605086-3-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508131258.1605086-3-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDExMSBTYWx0ZWRfXzgxVAe/bC838
 2DhAtJH7ndIS9aEjvxofrHv22bChdzchAizjKiWRPGNCl8oSH6s97020lporvyW7OrNHUOcEhG6
 iOSnRBvqagxavWDc8Iw/gWwWhiXl0DeKtI13iIDJ0o8qYqytPnKV3mBB7EICnh3a9WzZqO5H6gj
 M98PfSS+NTMY0DB6lH/vi2mRxuoGEbVMR5RTwVwyJTvZbv+DOtiSA5ysX/TPmcgG54qKhPsrxVj
 M6405b+j2rM1MQ0KLKP8cTuX30r6IX2Th8cEwvJCAgeUAgzp6/hQkGXyWzu07OWCl8B2h3XtJ40
 Xp/rmNKXW4Nl6umie/FqSoSNv5EVqpnM+4ETwv7u/oPp+uV51BNx8YFMevDsICrPjCflRR3ELtk
 YmDvxeYmXwORdh40zf/HW1EEi7Bq9Q/XCSxC7AY1D/g9GSl6nrEc5vWtQSHZL90i3jYSqILi
X-Proofpoint-ORIG-GUID: o3UoXthnIdRJS0oJuYu3N7xn3mgDITG3
X-Proofpoint-GUID: o3UoXthnIdRJS0oJuYu3N7xn3mgDITG3
X-Authority-Analysis: v=2.4 cv=Yt4PR5YX c=1 sm=1 tr=0 ts=681caf72 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=RQ3MwxKCdYl4j3XfnywA:9
 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_04,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 impostorscore=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505080111

On Thu, May 08, 2025 at 06:42:58PM +0530, Mukesh Ojha wrote:
> Add the ncluster_cores_array_offset field with socinfo structure
> revision 22 which specifies no of cores present in each cluster.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
> Changes in v3:
>  - Removed debugfs entry as per review comment by [Dmitry B]

Same comment. Please respond to the questions instead of sending next
iteration which is going to be NAKed.

> 
> Changes in v2: https://lore.kernel.org/lkml/20250425135946.1087065-3-mukesh.ojha@oss.qualcomm.com/
>  - Added debugfs entry.
> 
>  drivers/soc/qcom/socinfo.c       | 1 +
>  include/linux/soc/qcom/socinfo.h | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 55acae79ec3a..7ae4c602e3cd 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -608,6 +608,7 @@ static void socinfo_debugfs_init(struct qcom_socinfo *qcom_socinfo,
>  			   &qcom_socinfo->info.fmt);
>  
>  	switch (qcom_socinfo->info.fmt) {
> +	case SOCINFO_VERSION(0, 22):
>  	case SOCINFO_VERSION(0, 21):
>  	case SOCINFO_VERSION(0, 20):
>  		qcom_socinfo->info.raw_package_type = __le32_to_cpu(info->raw_package_type);
> diff --git a/include/linux/soc/qcom/socinfo.h b/include/linux/soc/qcom/socinfo.h
> index 3666870b7988..0c12090311aa 100644
> --- a/include/linux/soc/qcom/socinfo.h
> +++ b/include/linux/soc/qcom/socinfo.h
> @@ -86,6 +86,8 @@ struct socinfo {
>  	__le32 raw_package_type;
>  	/* Version 21 */
>  	__le32 nsubpart_feat_array_offset;
> +	/* Version 22 */
> +	__le32 ncluster_cores_array_offset;
>  };
>  
>  /* Internal feature codes */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

