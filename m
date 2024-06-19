Return-Path: <linux-arm-msm+bounces-23273-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 58CA790F6B1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 21:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EA38A282CA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jun 2024 19:09:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8046C15886C;
	Wed, 19 Jun 2024 19:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iVtbzgag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06052157E9F;
	Wed, 19 Jun 2024 19:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718824137; cv=none; b=YIfzT+BVWtKKamrOGy9GDGPSNesJ+fRiORJ8Qplw5PyNzYMBFVEjfVpmUOKsewwr/1CQw/KDAcz1sQPwD38lWMH02Oky1rgw/crtx4zuLK79czPLUlnScVYK2lEuX50/Rp5uoMxir2LxuaKlcWtcZERVFg/gfdqfop/QE/LFjXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718824137; c=relaxed/simple;
	bh=zRnzS9SZ+dxXGc3ihVIyUkY1xWZtFIkc0xyC6fJGY1w=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dlt5UtKYRV6rBix5P3DZjg+Wk/aQIEBu/ndBLx89U+cRx75XuBBSxfCwWIBkfr6Cv3CqJ2Kz5rwH4bQPVaEkFbi1FfboLr3HhMgqzj1hlz3OwFtOp2eEiOn0dYMUfx9lA3DDF4v73Jj54tHEBdgCQ+Cdb/B9xH7aRJWXEMuv90g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iVtbzgag; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45J9rQsA027119;
	Wed, 19 Jun 2024 19:08:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ZyMEkR9BE8crvd7eINIckNo/
	AY9lbygpGEBGCIg3TI4=; b=iVtbzgagFp1MyBjvKJsTleyh99UbIsIJAGpL0QBk
	WjmjN2tcOwKZ4g4epCH2DWZJ+u4x18oikF6cD88ONBwFtCicRrYko++AD0SOdHQN
	G3Ini4ujZhPmPOICTvxDyCyc5qskcTkMRVP2c++MkYI+eERM4wd8QSVswRgLwN0f
	2FvHbThhHVetORBnmRrfGf7oskkh2M9EI07OKVAiPsRB1tm88LngJcbNY6r+Go5O
	xYYN3Npbn2Zmh3Ajy7+Lw7zgdcH0FODxTKvZvB8Y1SH/sYg47LlUdPzd5Fe5abnZ
	mbMbfGCOmqgthcZOqgcIQALOh1HHnGbl+gcfks6SZnddbA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yuj9ytkst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 19:08:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45JJ8qIl015527
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Jun 2024 19:08:52 GMT
Received: from hu-mdtipton-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 19 Jun 2024 12:08:51 -0700
Date: Wed, 19 Jun 2024 12:08:50 -0700
From: Mike Tipton <quic_mdtipton@quicinc.com>
To: Elliot Berman <quic_eberman@quicinc.com>
CC: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: qcom: Remove QCOM_RPMCC symbol
Message-ID: <20240619190850.GA12720@hu-mdtipton-lv.qualcomm.com>
References: <20240619-drop-qcom-rpmcc-v1-1-b487c95162ef@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240619-drop-qcom-rpmcc-v1-1-b487c95162ef@quicinc.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: P62NNEpelElMNrCzTGLgfQtpLH-P68pa
X-Proofpoint-GUID: P62NNEpelElMNrCzTGLgfQtpLH-P68pa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-19_02,2024-06-19_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=814 spamscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 clxscore=1011 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406190145

On Wed, Jun 19, 2024 at 08:41:52AM -0700, Elliot Berman wrote:
> This symbol is selected by a couple drivers, but isn't used by anyone
> and hasn't been for years now. Drop it.
> 
> No functional change intended.
> 
> Signed-off-by: Elliot Berman <quic_eberman@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig | 5 -----
>  1 file changed, 5 deletions(-)
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index f72838aa573b..67c9188d53cb 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -7,9 +7,6 @@ config QCOM_GDSC
>  	bool
>  	select PM_GENERIC_DOMAINS if PM
>  
> -config QCOM_RPMCC
> -	bool
> -
>  menuconfig COMMON_CLK_QCOM
>  	tristate "Support for Qualcomm's clock controllers"
>  	depends on OF
> @@ -122,7 +119,6 @@ config QCOM_CLK_APCS_SDX55
>  config QCOM_CLK_RPM
>  	tristate "RPM based Clock Controller"
>  	depends on MFD_QCOM_RPM
> -	select QCOM_RPMCC
>  	help
>  	  The RPM (Resource Power Manager) is a dedicated hardware engine for
>  	  managing the shared SoC resources in order to keep the lowest power
> @@ -135,7 +131,6 @@ config QCOM_CLK_RPM
>  config QCOM_CLK_SMD_RPM
>  	tristate "RPM over SMD based Clock Controller"
>  	depends on QCOM_SMD_RPM
> -	select QCOM_RPMCC
>  	help
>  	  The RPM (Resource Power Manager) is a dedicated hardware engine for
>  	  managing the shared SoC resources in order to keep the lowest power
> 
> ---
> base-commit: eefb5ee4b41cdb68bf6feffe0d68b5bbe038e29d
> change-id: 20240618-drop-qcom-rpmcc-2f3d85aca0a1
> 
> Best regards,
> -- 
> Elliot Berman <quic_eberman@quicinc.com>
> 
> 

Reviewed-by: Mike Tipton <quic_mdtipton@quicinc.com>

