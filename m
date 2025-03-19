Return-Path: <linux-arm-msm+bounces-51929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 870CFA68942
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 11:18:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 13D4A3B91EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 10:18:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E65FE25332B;
	Wed, 19 Mar 2025 10:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ELFSXtSy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C7F925178D
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742379510; cv=none; b=TnzLAvcun+nnHcQ0Vnxphn9zSoPswI5pFlMLuZCzEnz1jpOfkckvJisXmX1QjOKvyb82xDIIlO07pKobiGzN+yLjfN3JSSvdRj3/nUKH8NjnNMqVWJoR3A2XqVIwqqWsdYVDL+1DhHUnb7FxqVIlxd6f0JIXOhkaHhC8k0x4/Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742379510; c=relaxed/simple;
	bh=fjjazMyM+9OhKz4+XIpx0RxbJw3Yq8alW4cnwa0N404=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vACqasLcDHjj1quG4FA8XVcds0s5a3znsuyPxJPVBbywEyBe5a+2/eX6Bot+mXaUWmKZinstoCEQH3tLr02tWdu/eBU+WIWhDBA4N1N+fx5OV+xIdqeHIR9PKs6XZyGmb87s4oSGFj+iySlTw8gCegvfjCWyGY24SsoWOBzZQ9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ELFSXtSy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4litH012005
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:18:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	g6Y5lGGI4q46cK715gNBMUsF0BQOg3wunktc3lR3ua4=; b=ELFSXtSyaN/qTi23
	Fhv+k/KK9cS4TjDLtwnfEq24IQj+ATJ8Ow+nWodLirGL44stpHKmmxfu1fx0J8xF
	DFA2hGVmqK09sfW/qpy2dJ6QPJVlqg93fhdEDUL55Vs5LTL8fgaFpi7cQu1oDfvR
	Gys8EC06dIOeD5InvWgvSnl3G2kr9UQJ+uBtNhovEY8cMS2gkOeuqk9JFKurgL+X
	Qb5ptnMfRTST6k7Vc7vXr3qumy62xHXlsr5FCoIhoq3xxh497CBVEzOMu4ETcfk+
	0/8eCDS6ER3+IVnS+By6mtAVMj0DiP/PvuNM2dwAazBS1cpK6l4otHRG4m8dxQA2
	UbP9SA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45f010msfg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:18:28 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c0b3cd4cbcso675759985a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 03:18:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742379507; x=1742984307;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g6Y5lGGI4q46cK715gNBMUsF0BQOg3wunktc3lR3ua4=;
        b=sGWurDF+ucavz9tdmG2CpbVQtFEio2ZEDoQsmZBdua1M+tKJek3GXAPBRF1zOk9/F2
         GO1gDSqmm5cMLLFO2IcvA2TnT2upSIRDjQ1UBEotD9/qLMi97CBr/WkPKOKZW4/nnFdk
         KDAsYXtd8mAhwHmSZUgZeF1136JcMiOR80+55YFGRNECmsBKC7a3yvkTGduM3I2xa9RF
         QqH0WfmiycWEWe3kppXlWuqRy1eFZZCIDDsD9s5i2s+LcMilPNwCyQUiZc+Hj5MM+q9Y
         CdGIkZnCpokKf9rhp2BqB29urZV/Eb1iijgumB2u3a0ymTQc9OM9fqINKYD9jgtEBgzG
         vHAg==
X-Forwarded-Encrypted: i=1; AJvYcCWnnP6GmEFOAuwbY5Qly5zFPNLByRW3L/Bo+4zQ57/IG+mPhucVSH+JQet0k3yOotmmx8uBRBH/me9higub@vger.kernel.org
X-Gm-Message-State: AOJu0YxCoE6nRWL/rivHHCDftEOFd8bqt9X72XF68A9zCcgctiqkzMve
	biia87VU+x2t0uDLcdPh90ZV2SoPqKjetpkqtHl8uyPZ0KqcOrajc+lsgZ6TzXCL8qaDI2pdFxc
	s57xx6dnJCVMWEUKa4xDcLn9EmjMNIN1gYxKqG09XoKK88qHKuSJcOf4MXjA8FU5y
X-Gm-Gg: ASbGnctxh/Z7mspJtyCmrlCm6Z056wA18+x1+HAUYtP/ImjhjkBUAKBWAtzXBDTIgfQ
	Usx6TUBGdrxkkqy/E80wBqFHkU7LID7GSyWRXLNFokvlEBQumZ6ZfrEpNKOLZEy7Iz004sF5LIH
	aj4qwMnYC5aa39+6LSVyEUXH2XjNpb9RxNfBudbl3Wi4cuPh8DRGvPtEesGxvLlFpJ8PBjDMkZi
	YRrQ70eqiqr2xOrgS+Bv/hBkQCebuR3UXPmALaMFLE5ZW9CaeQL9kPE2qWiYR5gaofVGj7hfpkC
	v+zUfaODZDQBxJiqd680/embK4fnF18JCfsO0M9dsIZsUBo1p9X4fhLy95Qf2DcWLYvbipvUnIC
	BylY=
X-Received: by 2002:a05:6214:246b:b0:6e8:955b:141e with SMTP id 6a1803df08f44-6eb29394c4bmr29894946d6.21.1742379507133;
        Wed, 19 Mar 2025 03:18:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqGB3tXFnX9eFbTzML8EPlNjeAQVUX+G6oWctw4G+pdkokTJUMuoaQB1gAhPBzKRoofBi5IA==
X-Received: by 2002:a05:6214:246b:b0:6e8:955b:141e with SMTP id 6a1803df08f44-6eb29394c4bmr29894616d6.21.1742379506730;
        Wed, 19 Mar 2025 03:18:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba8a8bf7sm1896139e87.223.2025.03.19.03.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:18:25 -0700 (PDT)
Date: Wed, 19 Mar 2025 12:18:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: neil.armstrong@linaro.org
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,
        Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH net] wifi: ath12k: properly set single_chip_mlo_supp to
 true in ath12k_core_alloc()
Message-ID: <4pidr33bvbtykyufw35ubfr7mut2ypqmoiydgjlcsyxolqteze@j2xhigdoxqhp>
References: <20250303-topic-ath12k-fix-crash-v1-1-f871d4e4d968@linaro.org>
 <24b2f1f8-97bd-423a-acbd-9a5cd45e4a40@oss.qualcomm.com>
 <7901d7f0-d6d0-4bf3-89ad-d710e88477b7@linaro.org>
 <7b4b598f-bc13-aa4b-8677-71477e1f5434@quicinc.com>
 <a5ebfdfb-107f-407f-b557-522b074c904f@linaro.org>
 <38cd738c-1a2a-4382-80f8-d57feb7c829d@quicinc.com>
 <6717d816-02b3-4d27-848b-620398808076@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6717d816-02b3-4d27-848b-620398808076@linaro.org>
X-Proofpoint-ORIG-GUID: QgqUJGFlVCqTxQ6KuSPLqVgwRuDGWoyi
X-Proofpoint-GUID: QgqUJGFlVCqTxQ6KuSPLqVgwRuDGWoyi
X-Authority-Analysis: v=2.4 cv=G50cE8k5 c=1 sm=1 tr=0 ts=67da99f4 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10 a=Vs1iUdzkB0EA:10 a=KKAkSRfTAAAA:8 a=Ta77wq_4RykSGFGVYMQA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 impostorscore=0 spamscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503190071

On Wed, Mar 19, 2025 at 11:00:34AM +0100, neil.armstrong@linaro.org wrote:
> Hi,
> 
> On 19/03/2025 10:46, Baochen Qiang wrote:
> > 
> > 
> > On 3/19/2025 5:12 PM, neil.armstrong@linaro.org wrote:
> > > Hi,
> > > 
> > > On 19/03/2025 10:06, Vasanthakumar Thiagarajan wrote:
> > > > 
> > > > 
> > > > On 3/19/2025 1:34 PM, Neil Armstrong wrote:
> > > > > On 18/03/2025 17:35, Jeff Johnson wrote:
> > > > > > On 3/3/2025 7:00 AM, Neil Armstrong wrote:
> > > > > > > In commit 46d16f7e1d14 ("wifi: ath12k: rename mlo_capable_flags to
> > > > > > > single_chip_mlo_supp")
> > > > > > > the line:
> > > > > > >      ab->mlo_capable_flags = ATH12K_INTRA_DEVICE_MLO_SUPPORT;
> > > > > > > was incorrectly updated to:
> > > > > > >      ab->single_chip_mlo_supp = false;
> > > > > > > leading to always disabling INTRA_DEVICE_MLO even if the device supports it.
> > > > > > > 
> > > > > > > The firmware "WLAN.HMT.1.1.c5-00156-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1"
> > > > > > > crashes on driver initialization with:
> > > > > > >    ath12k_pci 0000:01:00.0: chip_id 0x2 chip_family 0x4 board_id 0x3d soc_id 0x40170200
> > > > > > >    ath12k_pci 0000:01:00.0: fw_version 0x110f009c fw_build_timestamp 2024-05-30 11:35
> > > > > > > fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00156-
> > > > > > > QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
> > 
> > this FW version is not upstream yet, why are you testing with it?
> 
> I was not aware the driver supported only a small subset of firmwares.

Yes, this has been communicated by Kalle (and now by Jeff) for ages:
using any firmware outside of linux-firmware is not supported, unless
you have been explicitly told to use a particular binary. Firmware
coming from the Android / Mobile might use different knobs and have
different expectations regarding driver behaviour.

-- 
With best wishes
Dmitry

