Return-Path: <linux-arm-msm+bounces-23474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 237389115F6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 00:54:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 559CB1C21EF0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Jun 2024 22:54:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32F321422D6;
	Thu, 20 Jun 2024 22:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ioCc8jZG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BB68288F;
	Thu, 20 Jun 2024 22:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718924083; cv=none; b=rhYrcqA7QgP2vzBFG9S915EkFH9a9S4U9RT2MCA/5vqz0GTbYc09EvvE/VTOMO4KOaeKJ4MtXFoyRAAKZz1Sw9986j7qVVealkdC2Xv/l4E3ZXc0lG0oVjvw5vGyQnl1XtGZIMxqeah26rbrJT83xdHGj8tHxQB+lVVvuEW4ULo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718924083; c=relaxed/simple;
	bh=6s54gryEI2nB5nSFviM+FczXOmdQ2NwgqP5gpP+OsI4=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cx+DEjazs84y4yXaZ+fPhbY8baUSRy02xN6trHWvFFiUZT6Ab4hDuUeGOSsgm68f/IkOg7ekV3nry69bWIVBMzuzv5DxOpUMl0qKAktEdflYayMEYtk33M8g3RjA7Iy59KKTYbJFAV62hdXfR9cBPkwJ3P8aCImSOCzB/WL7mBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ioCc8jZG; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KHBPuu019863;
	Thu, 20 Jun 2024 22:54:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5efyFqs4GPqMuPKxHftb8s3+
	zllo+CUh+kZENKu6w/k=; b=ioCc8jZGqzXOOQ2a+RBd/LK2g6FF/x8CQBS/rgXB
	eSdg9OCv7YLWobfp+ysUksuRZlOsTCzP1iTOhvieyyDl0VyQpBnd72Bd3kxpdRzo
	utvUHW28R+rB6rHcKweh+qd2ktsADS9Bt1LzPYsz4EiFr6rM1fS8fpRcXMn47Rg4
	zEbZpgs5P7rYT7WIEBjXmLNSbiE/jerr083Fo9+rdLQi9I0tf34CGRA3QNx6kLcQ
	xWFq0Gmee8lGCVXy6TI9wn5lc6hMlcnoDzZODJVEEWuMAN+PJSIeMUYeCa/IPJl/
	8DscnxdoCk1PsNuLrE6EYOlM7IucjmXRq8dufXB4mCGNJg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvrkw8tty-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 22:54:28 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45KMsQ8L022892
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 22:54:26 GMT
Received: from hu-eberman-lv.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Jun 2024 15:54:23 -0700
Date: Thu, 20 Jun 2024 15:54:23 -0700
From: Elliot Berman <quic_eberman@quicinc.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>
CC: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konrad.dybcio@linaro.org>,
        Rob Herring <robh@kernel.org>,
        "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Robert
 Marko" <robimarko@gmail.com>,
        Das Srinagesh <quic_gurus@quicinc.com>,
        "Bartosz Golaszewski" <bartosz.golaszewski@linaro.org>,
        Maximilian Luz
	<luzmaximilian@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Will
 Deacon" <will@kernel.org>,
        Srini Kandagatla <srinivas.kandagatla@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, Alex Elder <elder@kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <kernel@quicinc.com>, Andrew Halaney <ahalaney@redhat.com>,
        Deepti Jaggi
	<quic_djaggi@quicinc.com>
Subject: Re: [PATCH v10 13/15] firmware: qcom: scm: clarify the comment in
 qcom_scm_pas_init_image()
Message-ID: <20240620155335645-0700.eberman@hu-eberman-lv.qualcomm.com>
References: <20240527-shm-bridge-v10-0-ce7afaa58d3a@linaro.org>
 <20240527-shm-bridge-v10-13-ce7afaa58d3a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240527-shm-bridge-v10-13-ce7afaa58d3a@linaro.org>
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rABNjX2dGB1obdcAXek6VQSLo2Ybzw5O
X-Proofpoint-ORIG-GUID: rABNjX2dGB1obdcAXek6VQSLo2Ybzw5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_10,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 phishscore=0
 clxscore=1011 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406200167

On Mon, May 27, 2024 at 02:55:03PM +0200, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> The "memory protection" mechanism mentioned in the comment is the SHM
> Bridge. This is also the reason why we do not convert this call to using
> the TZ memory allocator.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s
> Tested-by: Deepti Jaggi <quic_djaggi@quicinc.com> #sa8775p-ride
> Reviewed-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
> index c82957727650..86e26f17ca19 100644
> --- a/drivers/firmware/qcom/qcom_scm.c
> +++ b/drivers/firmware/qcom/qcom_scm.c
> @@ -583,6 +583,13 @@ int qcom_scm_pas_init_image(u32 peripheral, const void *metadata, size_t size,
>  	 * During the scm call memory protection will be enabled for the meta
>  	 * data blob, so make sure it's physically contiguous, 4K aligned and
>  	 * non-cachable to avoid XPU violations.
> +	 *
> +	 * For PIL calls the hypervisor creates SHM Bridges for the blob
> +	 * buffers on behalf of Linus so we must not do it ourselves hence
                                Linux
> +	 * not using the TZMem allocator here.
> +	 *
> +	 * If we pass a buffer that is already part of an SHM Bridge to this
> +	 * call, it will fail.
>  	 */
>  	mdata_buf = dma_alloc_coherent(__scm->dev, size, &mdata_phys,
>  				       GFP_KERNEL);
> 
> -- 
> 2.43.0
> 

