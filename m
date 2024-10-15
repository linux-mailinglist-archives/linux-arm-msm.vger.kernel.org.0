Return-Path: <linux-arm-msm+bounces-34409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E229E99E3A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 12:19:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1A6461C2208B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 10:19:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7D191DAC89;
	Tue, 15 Oct 2024 10:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iB1Bfr7u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069DD1CBEB8;
	Tue, 15 Oct 2024 10:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728987545; cv=none; b=hfAhz4LAJdpTRAHIOF+b+bzlHDKdArDalIFFkUBe1EYCgOJjfUwwvG/TgebiIck0kOg/Y5wLk5scH4/y8Awxg+4wnQhl0VomlsllZRyc0hzixXxdpZeAFuuqqilqHdND8PxwGNrsG8f4NJXHbN19spCvdETg36znr+Ieh+8msNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728987545; c=relaxed/simple;
	bh=VWUNZO+nDheRKZ5nkF50AW67/8AZ063Ip3o0fiXPBio=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VfdoL8HPCCETwF8cZ03tzXiMD1gQHYM4SlvIEfl1Y9s9lK8PJCxo446g8aAVct6OgRI0cJYoOmNaARPWFt5V9LcTOF6qP4uvKidIvbLxKT+0HMEl7o1mIIB+Wes6zjPkOE4PoAtO/iR0HA4WCp+QilVqMVLoJZCbQ307vlSHT0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iB1Bfr7u; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49F0le1p012750;
	Tue, 15 Oct 2024 10:19:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=AGzN2LeQRNdMVTwurXOEhf/o
	AIn0zeR7yD9+1e6sqHs=; b=iB1Bfr7uY7GdPS+Ok4AV0tlSd+FsLGHAOZT/Nbwl
	P8sEm8F0s3iwt0BkZjeO9Kf3f3TdwvXAtTPT8wQs4eWx6QRaeiOTotRrNeb9906Z
	mYKtmX8U/yeCbNr4UMqO3imYA5s2momnbL/w9sfzsM+iZu0fljcwy08/pNOLXSpt
	7MXTEq9E7GFmpwpd3ZQYgj8KWG781u8I5iCAqRyve2uCrJLTByBSAhZ79H/IuCI7
	k1m+Z3B2v/xfu/nI5Kx8dfl0kVCBqETk7cgzXYQxeRlweBoW2mSaiY3UzetTs6Nw
	6cosByoaLvL/BgaOfdElaXOpt1fn5HFEfeJEFX3ba4/d3A==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 429e5g17nq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 10:18:59 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49FAIxXt029902
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Oct 2024 10:18:59 GMT
Received: from hu-mojha-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Oct 2024 03:18:56 -0700
Date: Tue, 15 Oct 2024 15:48:47 +0530
From: Mukesh Ojha <quic_mojha@quicinc.com>
To: Kuldeep Singh <quic_kuldsing@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Qingqing Zhou <quic_qqzhou@quicinc.com>
Subject: Re: [PATCH v2 1/2] firmware: qcom: scm: Return -EOPNOTSUPP for
 unsupported SHM bridge enabling
Message-ID: <Zw5BhwpJ8UWm7Fiq@hu-mojha-hyd.qualcomm.com>
References: <20241014111527.2272428-1-quic_kuldsing@quicinc.com>
 <20241014111527.2272428-2-quic_kuldsing@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20241014111527.2272428-2-quic_kuldsing@quicinc.com>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: NDAUO9GaYUON1msTlhPiUv-0xbOiM1HL
X-Proofpoint-ORIG-GUID: NDAUO9GaYUON1msTlhPiUv-0xbOiM1HL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 adultscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 phishscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410150070

On Mon, Oct 14, 2024 at 04:45:26PM +0530, Kuldeep Singh wrote:
> From: Qingqing Zhou <quic_qqzhou@quicinc.com>
> 
> When enabling SHM bridge, QTEE returns 0 and sets error 4 in result to
> qcom_scm for unsupported platforms. Currently, tzmem interprets this as
> an unknown error rather than recognizing it as an unsupported platform.
> 
> Error log:
> [    0.177224] qcom_scm firmware:scm: error (____ptrval____): Failed to enable the TrustZone memory allocator
> [    0.177244] qcom_scm firmware:scm: probe with driver qcom_scm failed with error 4
> 
> To address this, modify the function call qcom_scm_shm_bridge_enable()
> to remap result to indicate an unsupported error. This way, tzmem will
> correctly identify it as an unsupported platform case instead of
> reporting it as an error.
> 
> Fixes: 178e19c0df1b ("firmware: qcom: scm: add support for SHM bridge operations")
> Signed-off-by: Qingqing Zhou <quic_qqzhou@quicinc.com>
> Co-developed-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> Signed-off-by: Kuldeep Singh <quic_kuldsing@quicinc.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index 10986cb11ec0..0df81a9ed438 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -112,6 +112,7 @@ enum qcom_scm_qseecom_tz_cmd_info {
>  };
>  
>  #define QSEECOM_MAX_APP_NAME_SIZE		64
> +#define SHMBRIDGE_RESULT_NOTSUPP		4
>  
>  /* Each bit configures cold/warm boot address for one of the 4 CPUs */
>  static const u8 qcom_scm_cpu_cold_bits[QCOM_SCM_BOOT_MAX_CPUS] = {
> @@ -1361,6 +1362,8 @@ EXPORT_SYMBOL_GPL(qcom_scm_lmh_dcvsh_available);
>  
>  int qcom_scm_shm_bridge_enable(void)
>  {
> +	int ret;
> +
>  	struct qcom_scm_desc desc = {
>  		.svc = QCOM_SCM_SVC_MP,
>  		.cmd = QCOM_SCM_MP_SHM_BRIDGE_ENABLE,
> @@ -1373,7 +1376,15 @@ int qcom_scm_shm_bridge_enable(void)
>  					  QCOM_SCM_MP_SHM_BRIDGE_ENABLE))
>  		return -EOPNOTSUPP;
>  
> -	return qcom_scm_call(__scm->dev, &desc, &res) ?: res.result[0];
> +	ret = qcom_scm_call(__scm->dev, &desc, &res);
> +
> +	if (ret)
> +		return ret;
> +
> +	if (res.result[0] == SHMBRIDGE_RESULT_NOTSUPP)
> +		return -EOPNOTSUPP;
> +
> +	return res.result[0];
>  }
>  EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);

Reviewed-by: Mukesh Ojha <quic_mojha@quicinc.com>

-Mukesh

