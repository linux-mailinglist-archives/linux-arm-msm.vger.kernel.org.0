Return-Path: <linux-arm-msm+bounces-107261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qAKZOZlcBGqiHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107261-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:12:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 48881531F76
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3F17C30262E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 11:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 838F83FA5D6;
	Wed, 13 May 2026 11:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MZGRbYni";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eoXtHsKf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF2D37C0E4
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670665; cv=none; b=p7VgwHHTViVJ+H/YtRmvqJQ0pVIvDPyxFYmkwxAbf43hFF5nnLpZTc60TXZbnCXJlntk/djh83c9e68MaY8NBHxoP5p/g9aO2I9J+gGbhX1JAh0FEBb/yfsNsCDgWyP40nhz1Xy9XhHf9P1zuXwVjL69OkH4nzNVyDuwJYJbLtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670665; c=relaxed/simple;
	bh=bx6ugxalEcCPey8CfB0Outa8hUIV/XXjwV8kbVwvypU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mciskAQbLL9tio9Fhj0HvSync81vON51QNBoQD2UYPqJZ5VDbTmOvQeGx6SsNH27gNTZDf+qdRtRSnp9spvrhpJPtlGej+gOVLgy6zZ/8HW7Tg2h9VxJJN6OweSYVal9xCPcUE2BeyOXBmGWRflF1VLrbnZS8V8JVixp/o3LjPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MZGRbYni; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eoXtHsKf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DACwjA2338782
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0E0Z7HP9N5oq7AEii3r0dxE3
	Nj3yySAbE6o5Bh3hQIg=; b=MZGRbYniTaehZSrwxrcjNLpRwc1+fX1IdMmyLo1V
	11mZn0qa9nE4TyfOBJmOwRV08utMCFn9G46ihg6nurJ2dwJcVxskgwPzGLlLsFoU
	5RV94pXzD5L0rY2ErlxJzwjYoTNgcH8KM5hJ7stQyfJ902n5kksr1XUKC/CJOEJy
	/jh/nxV7RKs4RzJVmBc9m/M+Uy8MHjxbRU6W/n8ah4M3e2BySeeOIaxpyOC6xWrm
	WGJHQTDKKGWiChrBQbJapTZcg6CfrpvRMjJjHuX50Yzlag4CVllw0wDRuXLdIckO
	pZAXYj3MU5puuW21QV89bBUUxpzfMkOdXNST1YjozqLsqQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e49vxb4ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:11:03 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-95ce6d50ea7so3160381241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 04:11:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778670662; x=1779275462; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0E0Z7HP9N5oq7AEii3r0dxE3Nj3yySAbE6o5Bh3hQIg=;
        b=eoXtHsKfP6CWygqtg1ZNeGSG0R7jjPYw6uM/XA7oktEdpUm7FYabN+8VIt5M7nh6uF
         WV94CixEP6TdJlW/IqTg+kFal5GkVL7TZ8DW4GyRvcn80cIecnugkDVilWdHwCH3ThDb
         SJRMPMTyLvwVGQZxT21QUjFxzO4MioEicctmXKND7Bk0S/v5c5FE3fOEYcy8sEg+CVrm
         P8+Fbcy/k+HxF8MnAtoh/pw0q2JglYUSf+lFTpJBj872IMeYnZ94tt6yIDEbycYMhB5B
         MjpMO52ylcX6K4gSlyYfVNRpNKdkGxbSHPElNk4tG4qaqjkFFmcQ59CfeLO+AK0tmMKm
         fKMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778670662; x=1779275462;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0E0Z7HP9N5oq7AEii3r0dxE3Nj3yySAbE6o5Bh3hQIg=;
        b=UdhD/SMJmNOW/0Goup5pFuv1KPIonfwBM0pTF1oUWSPd2BBaGg7Cgv3uA8HCUOZ+9n
         HYnbFGouUhyWtGzQNX0PPCgzTQpdts7Ue9nxpaVmy9jcwtEg9olrsEheXjytDnLG6TOD
         lEB6/4QhWw2aDP8q8S39WEXcF+n7Ht3viFJQ4TOsubRCcx3PfiMEJWa9jIDD6PbLlw37
         WurB0uRB5kXtgbAQgWQDGUfp7e2gpmeKyp9u0gtntmEd2ITN5ioPj0rTdWV/t4VIpEw6
         2HkgzZm3AUGLHMvGGbxpNFW/zngtqIe/RCjLTBmO4N+cMQexDhMIx9J0FaRLaNTv4lXo
         30eg==
X-Forwarded-Encrypted: i=1; AFNElJ+ydCItCCvu0VXQEJJz0QEV0poDCf7sKEPtcJxVeUsPB5w5/1F7KNXPAX5whTaz5hCrZrBmZRLCWuKgAJkV@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq/Xp395auyCYOW6xYlNnVLvs0duSPW4Zu/QZ8FGj2o1dyMuri
	W3oiJVknXJcVRMg+zRPTCmFM8o2VtWIblK78ZVmv20UEY4zHuhNLrDplxa2oyFbCLvcpAu+21q6
	K1KlSGjMqaWmgL5vO5D2nI2IuGtdtcd0TLiJ1Sbtt1JgnJPjS5V2gw9Z/Dr1Uy6gbHa7R
X-Gm-Gg: Acq92OGTKtAQL5zWauYeXP2phdiKTbZvrm4OFFd8429Zip7k0hxqPDwBzfiTTx98F4y
	1S3hwOcqM1KtnWk36+KBjVi4W80phMhgPtmU4VhPzdAS2Mw20TIvbcG23bue7Jc2ID8qq1XWMyo
	wSQhIERAP9NIPo4J0t5kfP8TWHCsokUCcvXbw9j4aLwIl+1ztwPU015rBMfpvyeCOWGw5Tcg95O
	C3b8F+HfGgaO1UZtYIre/Usts84lajM5V40Iw9Tx6fkKJ49rHyJUiTafVDYFETyJNh/WrqFMa4O
	dkEv4KhELlhAhYN4Vf4PqCILBgBnhcU87haFobY0HGx7PIHGobsD0c1h1ULoSweNz+pNhHGK/8d
	/lSkQKH916eYSsUL3oxiApG2yTYCwEoBdVLJxo4nT6SaHsllHAKpBmHet6hwfiH6a8wSkRURoP0
	ZLUi0ySHy+IL5GrCnBN7WZeBrMAjDYNWhMZMhN6BxEeALLqg==
X-Received: by 2002:a05:6102:6055:b0:62f:2f1f:599b with SMTP id ada2fe7eead31-63771b747b7mr924355137.7.1778670662398;
        Wed, 13 May 2026 04:11:02 -0700 (PDT)
X-Received: by 2002:a05:6102:6055:b0:62f:2f1f:599b with SMTP id ada2fe7eead31-63771b747b7mr924351137.7.1778670661854;
        Wed, 13 May 2026 04:11:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955e163sm4096980e87.44.2026.05.13.04.11.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:11:00 -0700 (PDT)
Date: Wed, 13 May 2026 14:10:58 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 5/6] media: qcom: iris: Optimize
 iris_hfi_gen1_packet_session_set_property
Message-ID: <s2aa5kpszswt6bcz6j5jepxk3ogmuqa5rhtrdqtwduahocdyy6@nerzjw3g3b5v>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
 <20260512-batch2_features-v7-5-4954e3b4df84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-batch2_features-v7-5-4954e3b4df84@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: RNl46bu_bxNhZwmGQzxt9McS19L5_UC6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNyBTYWx0ZWRfXzLAnGkGHAA8w
 O2XlsNql4r6OqHPyXC2J5CqQQzmHUBDG3s19oNJdusvnqpSjgZIJmI61xFcDvC6FS+/QDzenK5+
 kxvNi2z/F3WIDNS7wl5S1mZWm0+P8eih45cyV3KVmrC85VWIgojko1fhkGSMJ2LXBFVCEQBnrso
 5LIpjeZ1fcTv7NKSINIi7AbHJyAzIkjvyX+JLJPt084jOTOvPW0VOR30CFhp99UdsTp+IGcIz99
 IYiMyrmoeiu4yWPEYN+/YgbTfoaaulmeJseh26/jPvvBbSFM+nr8/vfN+eNBqd4ItPYNO5XiIQz
 BEnyMOolARxjzv+XJWiDsnygMkHRLLParxgatRQ/+PPZ0jnVtR6AO35sPPvM3P3au3qkfgUuDu+
 dOBEFaBehvszn2iZSVvqe6yJegeGWXKKSOCDPJ6UrXRZbPWrO/RKsWP4E3Ud3PXIE8KUp1BbDGR
 9wfPoRG9fHTUp0+d5dQ==
X-Proofpoint-GUID: RNl46bu_bxNhZwmGQzxt9McS19L5_UC6
X-Authority-Analysis: v=2.4 cv=A8Fc+aWG c=1 sm=1 tr=0 ts=6a045c47 cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=m-et6-tnyGGeQiwqTYsA:9 a=CjuIK1q_8ugA:10
 a=1WsBpfsz9X-RYQiigVTh:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0 phishscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130117
X-Rspamd-Queue-Id: 48881531F76
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107261-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 04:55:14PM +0800, Wangao Wang wrote:
> Modify iris_hfi_gen1_packet_session_set_property to simplify size
> calculations and remove redundant code patterns.
> 
> Previously, packet->shdr.hdr.size was incremented by sizeof(u32) in
> every switch case, resulting in repetitive and less maintainable
> logic.
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  .../platform/qcom/iris/iris_hfi_gen1_command.c     | 50 +++++++++++-----------
>  1 file changed, 25 insertions(+), 25 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

