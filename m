Return-Path: <linux-arm-msm+bounces-24026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E73915875
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 23:10:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BBBE51F24C36
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 21:10:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED1B1A08C3;
	Mon, 24 Jun 2024 21:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="TJ/5s/1z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3255A1A08BD;
	Mon, 24 Jun 2024 21:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719263448; cv=none; b=Mf3TQfuieQt2x2onv7hKcodtxOnSr4XjIYscNRisBLGBMxOb4Ns31LejmTU2f61nyC2FR8P5wPEHrUzEs+7sKStAqXEysnmQMD0CLhaFTQWIYXYgPA3mMhIuOg+3XHwxBM68sB22ZwnkqqJ5FrEYQs/Cw5qUuNf4zwmWXsg9LOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719263448; c=relaxed/simple;
	bh=DuS6br34n6qAiBt2gtjSzoa+FWQVOZ9B+N/524S9Hl8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QW+E0PabFd6V4q79XVIwT/8FN2p7uWsYVeueAFI7CpEopabyLeYRja9HxWxKZ0Zo1XRQVuUEt2awbQvXHuFEx+0CsET9n4Z3KPB29OGAXxPS/eTFua0iWY2DScUmxD4XK1euy3EI91UNcdGHBqeIOxdsygBn/QWf+dbF8+Vj8R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=TJ/5s/1z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45OI4Fmi001499;
	Mon, 24 Jun 2024 21:10:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=CDNWPvVNd1T8V30fa/5upi07
	cClHMU//O4rRdpI9NpA=; b=TJ/5s/1zf8rSjIJkyu9G+RQxa9B2pIOdsebRXrhm
	KULVZoRUKefyvc+pHnrssaLZzKws8JfWzSGf+UFtPV77CKbxVLOTu/ZLG9MNbJ8W
	QaC/5ACktK/GLMdiAbk99YitbsP3AsUtIL2Hi75CYfCIqCWM1KsXNqmvz5SGOvOp
	UYK6Mf0TQmAFuzvndibzgjt+mgeVOTePLWSkLSv05vbhvhpnOd0gtwShDacolYzC
	i1McOsaAl+tCwbqaRZzQPlW+jeti1xyuQMaYWKrBcjN7S/vHkLTdkIN5cWGKCDr5
	WtRI0VpdCBxHqMUXoaJWi40YBjxOTsa/Ixvo3uI3iU4cqA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywmaew17n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 21:10:25 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45OLA90j029478
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Jun 2024 21:10:09 GMT
Received: from hu-eberman-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 24 Jun 2024 14:10:09 -0700
Date: Mon, 24 Jun 2024 14:10:09 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Andrew Halaney <ahalaney@redhat.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Bartosz
 Golaszewski <bartosz.golaszewski@linaro.org>,
        kernel test robot
	<lkp@intel.com>
Subject: Re: [PATCH] firmware: qcom: tzmem: export devm_qcom_tzmem_pool_new()
Message-ID: <20240624140949430-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240624190615.36282-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240624190615.36282-1-brgl@bgdev.pl>
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 97ic5YB4RtufRKxLsJMVeRk_x5M-efFP
X-Proofpoint-GUID: 97ic5YB4RtufRKxLsJMVeRk_x5M-efFP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-24_18,2024-06-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406240169

On Mon, Jun 24, 2024 at 09:06:14PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> EXPORT_SYMBOL_GPL() is missing for devm_qcom_tzmem_pool_new() which
> causes build failures with randconfig. Add it and fix the issue.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202406250127.8Pl2kqFp-lkp@intel.com
> Fixes: 84f5a7b67b61 ("firmware: qcom: add a dedicated TrustZone buffer allocator")
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>

> ---
>  drivers/firmware/qcom/qcom_tzmem.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
> index aab6376cade5..5d526753183d 100644
> --- a/drivers/firmware/qcom/qcom_tzmem.c
> +++ b/drivers/firmware/qcom/qcom_tzmem.c
> @@ -324,6 +324,7 @@ devm_qcom_tzmem_pool_new(struct device *dev,
>  
>  	return pool;
>  }
> +EXPORT_SYMBOL_GPL(devm_qcom_tzmem_pool_new);
>  
>  static bool qcom_tzmem_try_grow_pool(struct qcom_tzmem_pool *pool,
>  				     size_t requested, gfp_t gfp)
> -- 
> 2.43.0
> 

