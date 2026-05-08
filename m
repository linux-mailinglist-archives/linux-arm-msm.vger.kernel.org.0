Return-Path: <linux-arm-msm+bounces-106742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCKCJxxQ/ml/pAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 23:05:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDC04FBBEB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 08 May 2026 23:05:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E43830071E6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2026 21:05:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EAAC421A1A;
	Fri,  8 May 2026 21:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eW7RocQL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LTP9Mu2e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D73637D12E
	for <linux-arm-msm@vger.kernel.org>; Fri,  8 May 2026 21:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778274330; cv=none; b=R7YReqr52IDdF4W/JU5J+di0WkazWD1m08mXAnSKrxE19huRxEmoWfapFH6Oe+FVWV7GiTSorsbY4BeYI8Ln7tKt9wfCA6i3qWnlIDcQbRj4tvaP3Dn6oqy7RbmHnYetYp+9JQtEq2xgo+mPhyC1rdJmQrAPCX3y9mEZehjEFMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778274330; c=relaxed/simple;
	bh=cxx3q6er/2Jp8boFJvS2SzwG7KspxfN1RepBdmSSxe0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCyevg4VXN1MHGaqhGJfwAOtUnJeDXoOJuszv3uCgSmPSysNSHaT7SaPFVR12tNJOcJO7pMZH4nJWnHr/Fm8aUcfZhkX5JR3TAjSKFMdrVCSze/7ZDEsxDDH1lra5mbXapm5z6KGaYT0qUMPZGTyqwHg5wJ+XybA+tegrKmoMXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eW7RocQL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LTP9Mu2e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 648G4mNq1116301
	for <linux-arm-msm@vger.kernel.org>; Fri, 8 May 2026 21:05:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=j6IDmdp2tBKWZbmDUwX9pJa2
	6g1q0zTIXRhZUhSahes=; b=eW7RocQLzWJXjdPuFt0TIxkECpXehzWRNtWBsYgO
	bKyZkIqNWh5V1jURa55I41H3O1k9C81+h1o3tAgooXyhibLI7W+5MxzJc2Utn6FC
	S+Axk4HQWr538NE3T9ofZ3FLvn57aRykj03KSyFmTIeVVlxCeZEwmUlBGS3wVcht
	xGidi54ChOVFAVsH6iovLMRmxUOvSlzzukOF87jmZZilWslnv403ehcsGt9bnWXR
	qhj1J8hD3cG4U1s/L1cLveC3xSHz9Lvv8MvbYNDUviZNt+2ifHUiR3ijBku/EIzb
	GDf35chA0SEy0CFe6Xw6mD2HHOPYym6xflsOPmzAPHgu+A==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e1k1pgxjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 21:05:27 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95d41dc2ea7so1537445241.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 08 May 2026 14:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778274327; x=1778879127; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=j6IDmdp2tBKWZbmDUwX9pJa26g1q0zTIXRhZUhSahes=;
        b=LTP9Mu2ep0Tm+DkEM6RglRJAUEKFDg3htS4Flj7Vcla+aKd1bighhIZSAMqr/lynAR
         jHqLTSk6mLydueQmrVf3Q6Xyf3XKbzjmYWLsDNewc83zzSFG78z2msuXtFjLLSwSDwAi
         yz0RqM2v97rTl3srNXQUkmH5x6cmfywWK/+PnqAsmwU1f0937J8ZblnBMDb2zYKi6l3u
         aMrzXOC0qm/BCOHKZRXP9MV66ctgEtsYTkwJG7cgGjEat85s+qAlPZYqhpqkPzOeEuvI
         u43hYyF2eVEp/RiIMTUBmubhLCLwp+OipG4Isxy2w236cLjWhiTQrMov5Apb0SNF64lj
         XMsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778274327; x=1778879127;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j6IDmdp2tBKWZbmDUwX9pJa26g1q0zTIXRhZUhSahes=;
        b=JHncOCPybT0cwgirVfDs0u300CdYbfXO1Il+EhPkcJ1cnEYTxlmOkTo3mVd6S7pVLS
         RYKGpEHnvWuCtVpZb8MLrv8kb5mquoS28d86f4IKoO0wwuBHNEROnXPqkOkNfDeO09RS
         XD1IsyHKCaRqeyZKSE4H2lTlfPwfY9TgIWL+mK1VBW7x8Hf2xHZQnA5ppKnTH6lKWIbt
         wxyZwMwlxwpRTYweR9lc6MsM75sOFdt1mk8eJzVN+xYZn7zzjYRtsb9G5Di24fGNs3YS
         kI4XQQzTm8/xNp2xEl1p7txC7mPpte+pWnITwOEDxSkCLvmtueo4tCjMZrK72KOh6wfd
         CLVg==
X-Forwarded-Encrypted: i=1; AFNElJ8I/FdZCyVSreC51lhMaJ9Tm+bFnVH76gs5zABLsgOzlz1LdYD80BUp+f35Sa8dz5MbJrZ5cY1iLRvIsrMQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/85YWp6qMgAsMHgEHDGUDThumGIN+HOhTiXzobulF8u5uOdPc
	QmAA2AZyW/ZxyZfWaSWR1coWj8c3i1C16V0z1RoorzFNDOmQoUOCWesxFLRWwDuP5D6uaabrk7O
	FncylgLENKqqBgtAUODosCi3oH3Uo/c0yz6QNi1viioXuLEwN/BJ6eMTTw93aCE71qGjP
X-Gm-Gg: Acq92OFeUhmya9SNDMYnIgM02b5fYMlJ0iaejheGiwqSHpz6fiip6j1ACxp1G1pDLB/
	wUR1HbQKHUzd8yPjaKZTJb2bdMfkGuZh8pEpq3iyezROeJF7FwQZZ0WWPN+wCqGO3kP4RNWzo7x
	AD3tWH0LzpF+9EH+2AWOKLqCMv5cxplbGA0T/cfHeA5Bbv5WmwyFncksoaoJC1+7lOQdCswOuBS
	evudY6hMNLgB3V5W1V197BaGXB2rSvohvx3ntEfVEcedQ7csREopbFvCqeB+FtSijt8TLtfWUEV
	lVN7KxlOV/mD6nrC9qhCEyjScbeK/NN/yuba2+LW27Y7MqZ7QReAwnqHTyJ+OPVU+K7Op4dCx5U
	guy3CjYesIGo4ed+3Z+2bhEhaTd7QMSxrYjfoTZ8b9n1fTQi8zg77b0cQ3eKPTiAolu7UDGou8H
	IQscl/pXYxwCS4/4fp9xjqnCgvBePwmrLugwc=
X-Received: by 2002:a05:6102:548e:b0:607:5cd7:d7c0 with SMTP id ada2fe7eead31-630f8fd2337mr6693797137.19.1778274326524;
        Fri, 08 May 2026 14:05:26 -0700 (PDT)
X-Received: by 2002:a05:6102:548e:b0:607:5cd7:d7c0 with SMTP id ada2fe7eead31-630f8fd2337mr6693764137.19.1778274325857;
        Fri, 08 May 2026 14:05:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a95660absm807695e87.65.2026.05.08.14.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 14:05:24 -0700 (PDT)
Date: Sat, 9 May 2026 00:05:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, Krzysztof Kozlowski <krzk@kernel.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v5 12/14] media: iris: Add platform data for glymur
Message-ID: <jfypqc5ise7uezog3lwmmrzddbsctir6ze24ma4vp4zgcuwjbf@4443jqib6nxw>
References: <20260509-glymur-v5-0-7fbb340c5dbd@oss.qualcomm.com>
 <20260509-glymur-v5-12-7fbb340c5dbd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260509-glymur-v5-12-7fbb340c5dbd@oss.qualcomm.com>
X-Proofpoint-GUID: 863nGzL7Y3xhRgJTFEBpGA-f8FMhRP70
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA4MDIwOSBTYWx0ZWRfX1kQg6k+MqAZ5
 8l9OpLQGJuC1fNRCv0L4NjZlvl7d8/V2aLcr0GEs8jfQvBCiqtTj9UrW1gZX47kJbUzloGSE/MP
 E0l7o+iinzhh+u2s4nUVtcuEcfOb5WJCZDqMMUk78RkJywGM0juvqJ7W8K6rPczKNd/sKTmGbq2
 R5MdxxDhO8AOmzu6agEgekFbhuqb37JAVw7T3nF5+51aLwLPOBQiS/vWm2lyJUOZ5Q2tLov1Jr6
 JMGp8dR65/Oe+lwlbStWfX5SiGRNOiX2SGt73T+rYryGzta2ZyTeORnQTc986JpwTrylBIFhdzR
 duMotIHnsEyDpwMinJxUtMbpV3mFJt35I2yhYWWao+Nd4NR/akMMaLM+8vXFxFEz2lBLRAgq1A8
 Hv9B4cw+oiz7b7mPvJUSFgsWOu/vTgHOe2L0evVFqUqLmvl9VSXlez0CYIsQ/QQ4ENvyz9XZUFr
 mYWsLqoqPDol/Ezp92Q==
X-Authority-Analysis: v=2.4 cv=COwamxrD c=1 sm=1 tr=0 ts=69fe5017 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=JIw0tT-Unf6lt2tsWH0A:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 863nGzL7Y3xhRgJTFEBpGA-f8FMhRP70
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 spamscore=0
 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605080209
X-Rspamd-Queue-Id: 3DDC04FBBEB
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106742-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 09, 2026 at 12:30:01AM +0530, Vishnu Reddy wrote:
> On glymur platform, the iris core shares most properties with the
> iris core on the SM8550 platform. The major difference is that glymur
> integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
> one. Add glymur specific platform data, reusing SM8550 definitions
> wherever applicable.

This leave me in confusion. Having two cores, each with its own set of
clocks and pm domains, I'd have expected that each core scales
independently. I.e. if the load is pushed to the core0, it requires
core0 clocks to go higher (while core1 clocks can stay at the low freq).
Or, at least, the clocks would be set to the frequency corresponding to
the max of the workloads (if for some reason the cores should stay in
sync).

However, I don't see it in the code. All clocks and all power domains
seem do be scaled using the common workload. If my assumptions were not
correct, please explain it in the commit message.

> 
> Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
> Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/Makefile          |  1 +
>  .../platform/qcom/iris/iris_platform_common.h      |  5 ++
>  .../media/platform/qcom/iris/iris_platform_gen2.c  | 99 ++++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_glymur.c      | 97 +++++++++++++++++++++
>  .../platform/qcom/iris/iris_platform_glymur.h      | 17 ++++
>  drivers/media/platform/qcom/iris/iris_probe.c      |  4 +
>  6 files changed, 223 insertions(+)
> 
> diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
> index 79bc67980339..adb970b3a3af 100644
> --- a/drivers/media/platform/qcom/iris/Makefile
> +++ b/drivers/media/platform/qcom/iris/Makefile
> @@ -11,6 +11,7 @@ qcom-iris-objs += iris_buffer.o \
>               iris_hfi_gen2_response.o \
>               iris_hfi_queue.o \
>               iris_platform_gen2.o \
> +             iris_platform_glymur.o \
>               iris_power.o \
>               iris_probe.o \
>               iris_resources.o \
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
> index 502d7099085c..2003b7186480 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_common.h
> +++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
> @@ -30,6 +30,10 @@ struct iris_inst;
>  #define DEFAULT_QP				20
>  #define BITRATE_DEFAULT			20000000
>  
> +#define VIDEO_REGION_SECURE_FW_REGION_ID	0
> +#define VIDEO_REGION_VM0_SECURE_NP_ID		1
> +#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
> +
>  enum stage_type {
>  	STAGE_1 = 1,
>  	STAGE_2 = 2,
> @@ -41,6 +45,7 @@ enum pipe_type {
>  	PIPE_4 = 4,
>  };
>  
> +extern const struct iris_platform_data glymur_data;
>  extern const struct iris_platform_data qcs8300_data;
>  extern const struct iris_platform_data sc7280_data;
>  extern const struct iris_platform_data sm8250_data;
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_gen2.c b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> index 5862c89a4971..d11c9d1ce6b1 100644
> --- a/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> +++ b/drivers/media/platform/qcom/iris/iris_platform_gen2.c
> @@ -12,6 +12,7 @@
>  #include "iris_vpu_buffer.h"
>  #include "iris_vpu_common.h"
>  
> +#include "iris_platform_glymur.h"
>  #include "iris_platform_qcs8300.h"
>  #include "iris_platform_sm8650.h"
>  #include "iris_platform_sm8750.h"
> @@ -931,6 +932,104 @@ static const u32 sm8550_enc_op_int_buf_tbl[] = {
>  	BUF_SCRATCH_2,
>  };
>  
> +const struct iris_platform_data glymur_data = {
> +	.get_instance = iris_hfi_gen2_get_instance,
> +	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> +	.init_hfi_response_ops = iris_hfi_gen2_response_ops_init,
> +	.get_vpu_buffer_size = iris_vpu_buf_size,
> +	.vpu_ops = &iris_vpu36_ops,
> +	.set_preset_registers = iris_set_sm8550_preset_registers,
> +	.init_cb_devs = iris_glymur_init_cb_devs,
> +	.deinit_cb_devs = iris_glymur_deinit_cb_devs,
> +	.icc_tbl = sm8550_icc_table,
> +	.icc_tbl_size = ARRAY_SIZE(sm8550_icc_table),
> +	.clk_rst_tbl = iris_glymur_clk_reset_table,
> +	.clk_rst_tbl_size = ARRAY_SIZE(iris_glymur_clk_reset_table),
> +	.bw_tbl_dec = sm8550_bw_table_dec,
> +	.bw_tbl_dec_size = ARRAY_SIZE(sm8550_bw_table_dec),
> +	.pmdomain_tbl = &iris_glymur_pmdomain_table,
> +	.opp_pd_tbl = sm8550_opp_pd_table,
> +	.opp_pd_tbl_size = ARRAY_SIZE(sm8550_opp_pd_table),
> +	.clk_tbl = iris_glymur_clk_table,
> +	.clk_tbl_size = ARRAY_SIZE(iris_glymur_clk_table),
> +	.opp_clk_tbl = iris_glymur_opp_clk_table,
> +	/* Upper bound of DMA address range */
> +	.dma_mask = 0xffe00000 - 1,
> +	.fwname = "qcom/vpu/vpu36_p4_s7.mbn",
> +	.pas_id = IRIS_PAS_ID,
> +	.dual_core = true,
> +	.inst_iris_fmts = platform_fmts_sm8550_dec,
> +	.inst_iris_fmts_size = ARRAY_SIZE(platform_fmts_sm8550_dec),
> +	.inst_caps = &platform_inst_cap_sm8550,
> +	.inst_fw_caps_dec = inst_fw_cap_sm8550_dec,
> +	.inst_fw_caps_dec_size = ARRAY_SIZE(inst_fw_cap_sm8550_dec),
> +	.inst_fw_caps_enc = inst_fw_cap_sm8550_enc,
> +	.inst_fw_caps_enc_size = ARRAY_SIZE(inst_fw_cap_sm8550_enc),
> +	.tz_cp_config_data = iris_glymur_tz_cp_config,
> +	.tz_cp_config_data_size = ARRAY_SIZE(iris_glymur_tz_cp_config),
> +	.core_arch = VIDEO_ARCH_LX,
> +	.hw_response_timeout = HW_RESPONSE_TIMEOUT_VALUE,
> +	.ubwc_config = &ubwc_config_sm8550,
> +	.num_vpp_pipe = 4,
> +	.max_session_count = 16,
> +	.max_core_mbpf = NUM_MBS_8K * 2,
> +	.max_core_mbps = ((8192 * 4320) / 256) * 60,
> +	.dec_input_config_params_default =
> +		sm8550_vdec_input_config_params_default,
> +	.dec_input_config_params_default_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_params_default),
> +	.dec_input_config_params_hevc =
> +		sm8550_vdec_input_config_param_hevc,
> +	.dec_input_config_params_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_hevc),
> +	.dec_input_config_params_vp9 =
> +		sm8550_vdec_input_config_param_vp9,
> +	.dec_input_config_params_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_vp9),
> +	.dec_input_config_params_av1 =
> +		sm8550_vdec_input_config_param_av1,
> +	.dec_input_config_params_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_input_config_param_av1),
> +	.dec_output_config_params =
> +		sm8550_vdec_output_config_params,
> +	.dec_output_config_params_size =
> +		ARRAY_SIZE(sm8550_vdec_output_config_params),
> +
> +	.enc_input_config_params =
> +		sm8550_venc_input_config_params,
> +	.enc_input_config_params_size =
> +		ARRAY_SIZE(sm8550_venc_input_config_params),
> +	.enc_output_config_params =
> +		sm8550_venc_output_config_params,
> +	.enc_output_config_params_size =
> +		ARRAY_SIZE(sm8550_venc_output_config_params),
> +
> +	.dec_input_prop = sm8550_vdec_subscribe_input_properties,
> +	.dec_input_prop_size = ARRAY_SIZE(sm8550_vdec_subscribe_input_properties),
> +	.dec_output_prop_avc = sm8550_vdec_subscribe_output_properties_avc,
> +	.dec_output_prop_avc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_avc),
> +	.dec_output_prop_hevc = sm8550_vdec_subscribe_output_properties_hevc,
> +	.dec_output_prop_hevc_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_hevc),
> +	.dec_output_prop_vp9 = sm8550_vdec_subscribe_output_properties_vp9,
> +	.dec_output_prop_vp9_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_vp9),
> +	.dec_output_prop_av1 = sm8550_vdec_subscribe_output_properties_av1,
> +	.dec_output_prop_av1_size =
> +		ARRAY_SIZE(sm8550_vdec_subscribe_output_properties_av1),
> +
> +	.dec_ip_int_buf_tbl = sm8550_dec_ip_int_buf_tbl,
> +	.dec_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_ip_int_buf_tbl),
> +	.dec_op_int_buf_tbl = sm8550_dec_op_int_buf_tbl,
> +	.dec_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_dec_op_int_buf_tbl),
> +
> +	.enc_ip_int_buf_tbl = sm8550_enc_ip_int_buf_tbl,
> +	.enc_ip_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_ip_int_buf_tbl),
> +	.enc_op_int_buf_tbl = sm8550_enc_op_int_buf_tbl,
> +	.enc_op_int_buf_tbl_size = ARRAY_SIZE(sm8550_enc_op_int_buf_tbl),
> +};
> +
>  const struct iris_platform_data sm8550_data = {
>  	.get_instance = iris_hfi_gen2_get_instance,
>  	.init_hfi_command_ops = iris_hfi_gen2_command_ops_init,
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.c b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
> new file mode 100644
> index 000000000000..f16155b7dc99
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
> @@ -0,0 +1,97 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#include <dt-bindings/media/qcom,glymur-iris.h>
> +#include <linux/iris_vpu_bus.h>
> +#include "iris_core.h"
> +#include "iris_platform_common.h"
> +#include "iris_platform_glymur.h"
> +
> +const struct platform_clk_data iris_glymur_clk_table[] = {
> +	{IRIS_AXI_VCODEC_CLK,		"iface"			},
> +	{IRIS_CTRL_CLK,			"core"			},
> +	{IRIS_VCODEC_CLK,		"vcodec0_core"		},
> +	{IRIS_AXI_CTRL_CLK,		"iface1"		},
> +	{IRIS_CTRL_FREERUN_CLK,		"core_freerun"		},
> +	{IRIS_VCODEC_FREERUN_CLK,	"vcodec0_core_freerun"	},
> +	{IRIS_AXI_VCODEC1_CLK,		"iface2"		},
> +	{IRIS_VCODEC1_CLK,		"vcodec1_core"		},
> +	{IRIS_VCODEC1_FREERUN_CLK,	"vcodec1_core_freerun"	},
> +};
> +
> +const char * const iris_glymur_clk_reset_table[] = {
> +	"bus0",
> +	"bus1",
> +	"core",
> +	"vcodec0_core",
> +	"bus2",
> +	"vcodec1_core",
> +};
> +
> +const char * const iris_glymur_opp_clk_table[] = {
> +	"vcodec0_core",
> +	"vcodec1_core",
> +	"core",
> +	NULL,
> +};
> +
> +const struct platform_pd_data iris_glymur_pmdomain_table = {
> +	.pd_types = (enum platform_pm_domain_type []) {
> +		IRIS_CTRL_POWER_DOMAIN,
> +		IRIS_VCODEC_POWER_DOMAIN,
> +		IRIS_VCODEC1_POWER_DOMAIN,
> +	},
> +	.pd_names = (const char *[]) {
> +		"venus",
> +		"vcodec0",
> +		"vcodec1",
> +	},
> +	.pd_count = 3,
> +};
> +
> +const struct tz_cp_config iris_glymur_tz_cp_config[] = {
> +	{
> +		.cp_start = VIDEO_REGION_SECURE_FW_REGION_ID,
> +		.cp_size = 0,
> +		.cp_nonpixel_start = 0,
> +		.cp_nonpixel_size = 0x1000000,
> +	},
> +	{
> +		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
> +		.cp_size = 0,
> +		.cp_nonpixel_start = 0x1000000,
> +		.cp_nonpixel_size = 0x24800000,
> +	},
> +	{
> +		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
> +		.cp_size = 0,

Whys is cp_size 0 for all entries?

> +		.cp_nonpixel_start = 0x25800000,
> +		.cp_nonpixel_size = 0xda600000,
> +	},
> +};
> +
> +int iris_glymur_init_cb_devs(struct iris_core *core)
> +{
> +	u64 dma_mask = core->iris_platform_data->dma_mask;
> +	const u32 fw_fid = IOMMU_FID_IRIS_FIRMWARE;
> +	struct device *dev;
> +
> +	dev = create_iris_vpu_bus_device(core->dev, "iris-firmware", dma_mask, &fw_fid);
> +	if (IS_ERR(dev))
> +		return PTR_ERR(dev);
> +
> +	if (device_iommu_mapped(dev))
> +		core->fw_dev = dev;
> +	else
> +		device_unregister(dev);
> +
> +	return 0;
> +}
> +
> +void iris_glymur_deinit_cb_devs(struct iris_core *core)
> +{
> +	if (core->fw_dev)
> +		device_unregister(core->fw_dev);
> +}
> diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.h b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
> new file mode 100644
> index 000000000000..e0d07ccf658c
> --- /dev/null
> +++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
> + */
> +
> +#ifndef __IRIS_PLATFORM_GLYMUR_H__
> +#define __IRIS_PLATFORM_GLYMUR_H__
> +
> +extern const struct platform_clk_data iris_glymur_clk_table[9];
> +extern const char * const iris_glymur_clk_reset_table[6];
> +extern const char * const iris_glymur_opp_clk_table[4];
> +extern const struct platform_pd_data iris_glymur_pmdomain_table;
> +extern const struct tz_cp_config iris_glymur_tz_cp_config[3];
> +int iris_glymur_init_cb_devs(struct iris_core *core);
> +void iris_glymur_deinit_cb_devs(struct iris_core *core);
> +
> +#endif /* __IRIS_PLATFORM_GLYMUR_H__ */
> diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
> index 34c981be9bc1..78e3627557e9 100644
> --- a/drivers/media/platform/qcom/iris/iris_probe.c
> +++ b/drivers/media/platform/qcom/iris/iris_probe.c
> @@ -369,6 +369,10 @@ static const struct dev_pm_ops iris_pm_ops = {
>  };
>  
>  static const struct of_device_id iris_dt_match[] = {
> +	{
> +		.compatible = "qcom,glymur-iris",
> +		.data = &glymur_data,
> +	},
>  	{
>  		.compatible = "qcom,qcs8300-iris",
>  		.data = &qcs8300_data,
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

