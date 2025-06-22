Return-Path: <linux-arm-msm+bounces-61975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B482AE3082
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 17:16:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAC15169B8F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 22 Jun 2025 15:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26BB61EFFA6;
	Sun, 22 Jun 2025 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DNhlYn8S"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C591CF7AF
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Jun 2025 15:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750605385; cv=none; b=dm05L6E/KoGIsZ/cynLYg8H3aocR3tnzMTWAgyOwIpSrM+T9Mv4hC21ygTCqGwjnYQJBmfXF+C1Z/8euCGNee4l7ErtFeQ2ZZVVdCnWWqs94ktGdZ7GWQxTKIP7d4s4fvUexfnRKtPCKdZr/WzxwE5UTCLM63xzhHfryT2sCZZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750605385; c=relaxed/simple;
	bh=8uAt+R9QKABn3nX6nZT/Y7rKM1grPj/9mjul5urxgwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=puBsIZxOmYPwBXZbNLz/iTVhE0WCE+emDB7lTppclgJI7tARmkcmZxs9kOhL01NgBMAAd0NbT9jcpuPMj0CUtDIgyceibcukJXvKbPzdYIPNBRIdM+VX5+PV71OP2EKFZMzpLjbOp3IipwXWw9FWbJ8jn+E+Ji+Y9dxNadXOsvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DNhlYn8S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55MCvHic018017
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Jun 2025 15:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=w44qBsK+6lDTVdeGCkoj9uoc
	0+WdT0uN8/42Vd0SJ0c=; b=DNhlYn8S/pc51pN0200rO+7nsW9ztT91FFjy9kk/
	eVuBGx5ZrTu8HtRve7rLFgc/0Gvhs2DvIM1EutuZjcOo5RC8iZ9roJPMWhh2Qcde
	YxF5vUWgMGPUAc+rcWJnMGPBSDRc87jAwhy+Rz5oL0I3fVXSWHwaqY19nTy5ogkU
	RksgKmgVTQCf7sDLJtQXNsY17+8PBbnnSOVPRok/CX0YveI5Uxmc129V2W7zfxAQ
	0hy1O0E/L5jLqA4VNiZ+ra6wPVgcluSQ18cTrgxK9n9snIq/lZWm7qM5PETHg/4i
	dSuoKAcyxVUi9Rd6f9YkJwwdIT3so05HktHbLE1V9IWq2w==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47e3xgh13g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 22 Jun 2025 15:16:22 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31332dc2b59so2774000a91.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 22 Jun 2025 08:16:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750605381; x=1751210181;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w44qBsK+6lDTVdeGCkoj9uoc0+WdT0uN8/42Vd0SJ0c=;
        b=IIoKB9cptTtulSyv91chh6lsBcrKB4exB9bkSchJMjkMKp/lWSXKiZtdI0GjP+iZlY
         O8hQamRE3rqlgtL2nxpymeY6617/DW2GFXyc4BjCaQXaLCeak2tW2yXfv1+IMaon648l
         fokoGWW186qY6lENPSqIs/AOBhcH/qO4qIsPC3dYOiYtGenOAS/r2DK6qcxpjiS+99qI
         y7lJjq/grVqFJL934BhHHI94N/lJN8esuyjhg5ZKZb0+skD2ZSdJwt1Q8aWJl2NgdSXV
         Bzw6WGARDYYEW5WV5PlGD9sAUn5kuuqjHRMwkUvtUU/J7epFW0pggczvBUWF+om+eNLa
         n2dg==
X-Forwarded-Encrypted: i=1; AJvYcCWH8oNgORVI8GEoxfthNtB3eJhV+s9j6bBXHDujCV0tuR+wf9tIGiNGv5e0bv32f+/xevBQYpjzkZQ6qNhn@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0+SnKOQmG4cbhceErOoU5D506g0avaf6524y/JDxF5MVwt4n4
	nR1FNuJXwj0xJ1bq5h5q2yFrZoKlO1ZziTGIrAWda4R14alqxp9AaGZTFqexMktcgXSP6j0Z1qe
	wmcNsR33sdLHDRC/i8xvlcp15V+PEYwhJcf9SxsAspzFMFB5dzYrY1sdOnmZ17WNLKhQ9dsHCDY
	/dD8d2bpLjeAu8vXVVHQNaq6oEw8C3cIgTz1sfMovlEJdZeqb0fh8=
X-Gm-Gg: ASbGnctCC7mZPGaP00Y9iaNwcT42OdUbgeQELuVcYAOiRuHol4hMFZBzV7fnwS4jHT7
	Khn91F8YaPPtpuZa0onJH66CAOGQYee8iDiiWy0w2J0nFv04hVyh1ftyduzP42ofxTihgAYdaPT
	LYJw==
X-Received: by 2002:a17:90b:538d:b0:312:39c1:c9cf with SMTP id 98e67ed59e1d1-3159d62b22cmr15786180a91.7.1750605380958;
        Sun, 22 Jun 2025 08:16:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiwVZwDGbFUpSLYFGCsHNtl3tE4hRSKWPLVVMlFvnXrZYfO89S0fwQKG1OCoJMnXdixhjlo6XBKZbBKl9aewg=
X-Received: by 2002:a17:90b:538d:b0:312:39c1:c9cf with SMTP id
 98e67ed59e1d1-3159d62b22cmr15786133a91.7.1750605380412; Sun, 22 Jun 2025
 08:16:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250622104531.19567-1-quic_nitirawa@quicinc.com>
In-Reply-To: <20250622104531.19567-1-quic_nitirawa@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 22 Jun 2025 18:16:09 +0300
X-Gm-Features: Ac12FXwyH-cIk5yRdWwy9i0E5tkcXIM9jcGCRkf5RmrHI1lbknvM47tnpdZ-3sM
Message-ID: <CAO9ioeXtLk5k3c-jg1CTt4SKYu6QKjqTM_WOEx3BM3Uwpe+7EQ@mail.gmail.com>
Subject: Re: [PATCH V1] scsi: ufs: qcom : Fix NULL pointer dereference in ufs_qcom_setup_clocks
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: mani@kernel.org, James.Bottomley@hansenpartnership.com,
        martin.petersen@oracle.com, bvanassche@acm.org, andersson@kernel.org,
        neil.armstrong@linaro.org, konrad.dybcio@oss.qualcomm.com,
        quic_cang@quicinc.com, vkoul@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Aishwarya <aishwarya.tcv@arm.com>,
        Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA5NiBTYWx0ZWRfX3pUivVJcFriD
 IhEwKKKLU/rqokVP4RyHKbxmjvkbXc3GPp0pdieduQeyiczBXIzvel5TK/Hdgtz4oozh23t7nQq
 KhQTTm9VUyhuRK2FJu1QD0nlpz/qozK3ovH6tGSeA4w1X2zGsHIgfmDwIL1j7UDid6ANtN2P879
 rrUtfZ4s2Ejlyjr77bCb1nMF/bnOM64LhmkhZ4nU+ZlqsOqnEvGZagRL0Ln+vNRG8ZQB3RVaQq2
 fk09KD9R+9JZqiTnZqUuga3BGYuuEeZAIgoxRAn+wSPiD/wvNfRO2Vsvt+ibVYpAR9By2EyRtXl
 5ewfiK12qBr+4fEJQltnyPXqV0W5m9K74Jxf8MEqnvMdpfxGEzNJjmsgDYObADMVDMvigyq57A7
 vJOtjVJf0m4TfY8spHkojnw4wVRsTU+w1ivlNgK++qX5So/YmldHsNpD0MC9nLmGlppZk9mQ
X-Authority-Analysis: v=2.4 cv=e8UGSbp/ c=1 sm=1 tr=0 ts=68581e46 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10
 a=VwQbUJbxAAAA:8 a=7CQSdrXTAAAA:8 a=pGLkceISAAAA:8 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=BtV6YcfmfsbFzQIroTEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=a-qgeE7W1pNrGK8U0ZQC:22 a=TjNXssC_j7lpFel5tvFf:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: -onipn_L59N9ez3laz7HL29YnY2cXILS
X-Proofpoint-GUID: -onipn_L59N9ez3laz7HL29YnY2cXILS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 adultscore=0
 mlxlogscore=934 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506220096

On Sun, 22 Jun 2025 at 13:45, Nitin Rawat <quic_nitirawa@quicinc.com> wrote:
>
> Fix a NULL pointer dereference in ufs_qcom_setup_clocks due to an
> uninitialized 'host' variable. The variable 'phy' is now assigned
> after confirming 'host' is not NULL.
>
> Call Stack:
>
> [    6.448070] Unable to handle kernel NULL pointer dereference at
> virtual address 0000000000000000
> [    6.448449] ufs_qcom_setup_clocks+0x28/0x148 ufs_qcom (P)
> [    6.448466] ufshcd_setup_clocks (drivers/ufs/core/ufshcd-priv.h:142)
> [    6.448477] ufshcd_init (drivers/ufs/core/ufshcd.c:9468)
> [    6.448485] ufshcd_pltfrm_init (drivers/ufs/host/ufshcd-pltfrm.c:504)
> [    6.448495] ufs_qcom_probe+0x28/0x68 ufs_qcom
> [    6.448508] platform_probe (drivers/base/platform.c:1404)
> [    6.448519] really_probe (drivers/base/dd.c:579 drivers/base/dd.c:657)
> [    6.448526] __driver_probe_device (drivers/base/dd.c:799)
> [    6.448532] driver_probe_device (drivers/base/dd.c:829)
> [    6.448539] __driver_attach (drivers/base/dd.c:1216)
> [    6.448545] bus_for_each_dev (drivers/base/bus.c:370)
> [    6.448556] driver_attach (drivers/base/dd.c:1234)
> [    6.448567] bus_add_driver (drivers/base/bus.c:678)
> [    6.448577] driver_register (drivers/base/driver.c:249)
> [    6.448584] __platform_driver_register (drivers/base/platform.c:868)
> [    6.448592] ufs_qcom_pltform_init+0x28/0xff8 ufs_qcom
> [    6.448605] do_one_initcall (init/main.c:1274)
> [    6.448615] do_init_module (kernel/module/main.c:3041)
> [    6.448626] load_module (kernel/module/main.c:3511)
> [    6.448635] init_module_from_file (kernel/module/main.c:3704)
> [    6.448644] __arm64_sys_finit_module (kernel/module/main.c:3715.
>
> Fixes: 77d2fa54a945 ("scsi: ufs: qcom : Refactor phy_power_on/off calls")
>
> Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

No empty lines between tags, please.

> Reported-by: Aishwarya <aishwarya.tcv@arm.com>
> Closes: https://lore.kernel.org/lkml/20250620214408.11028-1-aishwarya.tcv@arm.com/
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/linux-scsi/CA+G9fYuFQ2dBvYm1iB6rbwT=4b1c8e4NJ3yxqFPGZGUKH3GmMA@mail.gmail.com/T/#t
> Co-developed-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Ram Kumar Dwivedi <quic_rdwivedi@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/ufs/host/ufs-qcom.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Tested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> # sc8180x-primus

-- 
With best wishes
Dmitry

