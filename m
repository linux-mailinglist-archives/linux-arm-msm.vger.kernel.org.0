Return-Path: <linux-arm-msm+bounces-54469-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id B4084A8AFCC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 07:37:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9A9597ACCD4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Apr 2025 05:36:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D6A822A4F8;
	Wed, 16 Apr 2025 05:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="iilQiLtV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C2B0228CB0;
	Wed, 16 Apr 2025 05:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744781860; cv=none; b=EhyFaWpeg8VS8bjRCA/g3gK/p9cCyR+YEp1FhN5xTrFgxxNIT0GmA+4+DlvAbTv/5I+5zydGYcTEPwZfnNaP2BD6ASZecprj/f5aKeEurYJsg/Zc/TBzQiraho9bXoPkMm25me01ffpS/SzZml9CfJyx0f0nCjWZE5M3ZDDfHUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744781860; c=relaxed/simple;
	bh=A6kXgggCO4o7RDD2NyQnu226bFD/028Fmg8dIYXG4R0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EoBCxupapvtfwtoL5UUverI8xtv3AI8G5qTfHD/Mf342WPQjCu5ORSNkFbnFDx0mvicufWps0gTy+U1PqKvXYbihvzt6MZXkLJUAZRPEU5/mGrIdoD9QJVG8s3g93XemAkaFzaMd2m/henrcOXk9ESrGt2xnIRh1BkjYJXGSw0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=iilQiLtV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FIChio019767;
	Wed, 16 Apr 2025 05:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KCpapz9ftP2FRoZHqWN8f77NTGNz4obrqIaZLZWJP5E=; b=iilQiLtVlxLf8dlG
	QA7o0gKOEnivGKE9rXZKMYeZjNWSY0EZ43yTdGux7u/C20urkqHldgoXkWlUIWEH
	v2ahjWenZEXG03yFyiJXWVrrdDUtVCP+nzErk4meJPHBHr+lIxN4KsHJK6g5hzn7
	oQkQ/NT1OuKC+JEjzoDZE1C1IAoJRZf3AQqwyEOudOhAsUDOq3VetNv30juB7kSe
	6urXuvNvdaN1YqYWQXaz6btmx2R+2tfvnxfqbGt/+GSg8DymDqaDArrUap3sfc/G
	oMBh0IT0xztcwxezzlqakH2wdGm0NNrBeGKPrZ/ax31M2zUiCOuZaGjXYnjXwq0D
	eaSWPg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhfd2c3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 05:37:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53G5bagm022018
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Apr 2025 05:37:36 GMT
Received: from [10.216.44.139] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 15 Apr
 2025 22:37:33 -0700
Message-ID: <0a4d08ed-b5e8-fdad-bc1e-02b7b573eb86@quicinc.com>
Date: Wed, 16 Apr 2025 11:07:29 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Remove assign resource usage
Content-Language: en-US
To: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>,
        "Manivannan
 Sadhasivam" <manivannan.sadhasivam@linaro.org>
CC: <mhi@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20250416-remove_assin_resource-v1-1-e92dd361fa0a@quicinc.com>
From: Krishna Chaitanya Chundru <quic_krichai@quicinc.com>
In-Reply-To: <20250416-remove_assin_resource-v1-1-e92dd361fa0a@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=CfUI5Krl c=1 sm=1 tr=0 ts=67ff4220 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=YiSYcO1dwI_is-tjhJgA:9
 a=QEXdDO2ut3YA:10 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: _zAgu_8SockkMuHyMyTnONtFEUXMzhcF
X-Proofpoint-ORIG-GUID: _zAgu_8SockkMuHyMyTnONtFEUXMzhcF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_02,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160044



On 4/16/2025 10:49 AM, Subramanian Ananthanarayanan wrote:
> Avoid redundant usage of pci_assign_resource for BAR allocation.
> This is already taken care by PCIe framework. Invocation of this
> API leads to unnecessary relocation of BAR space to a new memory
> address.
> 
> Signed-off-by: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
Reviewed-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>

> ---
>   drivers/bus/mhi/host/pci_generic.c | 4 ----
>   1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 03aa88795209..7501abc835c7 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -996,10 +996,6 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
>   	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
>   	int err;
>   
> -	err = pci_assign_resource(pdev, bar_num);
> -	if (err)
> -		return err;
> -
>   	err = pcim_enable_device(pdev);
>   	if (err) {
>   		dev_err(&pdev->dev, "failed to enable pci device: %d\n", err);
> 
> ---
> base-commit: 5b37f7bfff3b1582c34be8fb23968b226db71ebd
> change-id: 20250416-remove_assin_resource-aa0db88d02eb
> 
> Best regards,

