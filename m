Return-Path: <linux-arm-msm+bounces-77908-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F248BEE423
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 13:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8F4BF18988C5
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Oct 2025 11:57:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F54E2E2EEF;
	Sun, 19 Oct 2025 11:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lVoVWAA7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B22462E542C
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 11:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760875041; cv=none; b=uNgiAJZ53z+U7GdIVN4drHYa7DH6Y57l9DYltAKiN9kU4OBy6EE24x86HJ7FtIy/X70qlsigj0EOtc4pk2gE1biSELMh3fX5m+Df2GDY/qJw4BUyd+8KxTwGthEVT5nRASr2UWnsexsN56g4qEEQ+hsLX15XMrpRLAXW5MO2K8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760875041; c=relaxed/simple;
	bh=uDfMWTWeRD+ipeRnmX1KcRU97w67iC3Ok/q8BFKqbdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EsZM1/wXH+oLuFGbl6RnoDjocE5BEob+wvPmhlx80MmW8mlMIGib9siosY3MB23ov4HYC4CR4iWLxZD8bVRaAcnS41q+R4AYB67uD2+JC+Z+REcVrB7lCi7qqHJeOOqaY2jPom5w6j9y/AXJdBiRWPcSVoT9L3cNYiZ/+XvKiAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lVoVWAA7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JAJ4B5013524
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 11:57:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fGQ0MOLcCnQuGNFEws8tSgmj
	Y6Cq/DDB5jiuxcA7h9E=; b=lVoVWAA707Wxc31l/VYGNTxdteth2GASXjMSBSdy
	+zoc+/PCElxn2YJnsllNtvhJmh28jb33bTb9sYU2NBMcWV/rzUITNI6g+GidLXEe
	AdSNGUi5kwcSeulH2s5IHbgyN/AfR/t+9Pxrixs42WGQ7VYlbkZ7JyoqWkhCTWhB
	ZjuvIGKsAayNOthmF3gubpaan1ODBJSpQPWvb25PfXcMn5bHqZbscUvVcEvFK8ID
	jmqBEg4BtNflagzLYxhz4sjSx9ID6BDMo0xVXK83JXTj3z5D3Nezl/H2I/ohLVwM
	c1cLG2ffTJu5gLu/5Y6VPTc6KhDGxAoEw9V4CbW/exAoPg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v343ta00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 11:57:18 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-87c1f435bd6so107194416d6.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 19 Oct 2025 04:57:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760875037; x=1761479837;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGQ0MOLcCnQuGNFEws8tSgmjY6Cq/DDB5jiuxcA7h9E=;
        b=kBaQNHMv4zP4WoWvViOigHoynB/rUADGyUfAVTWWVQXWtvv12qpSzArmRBy+Duh8lS
         8vkQ5mphnAJ5jYz8yTELnpvRvCjG/vOtJ8GbBr9EH03yF9/XA1dmPiz6pEaUk3bmieuY
         sTpNwZE7mCIS/SpyoSN7ZU7cFzvQbR7cCeRHyJizRrX6Jd5StfOYRcR/7f4HkF0nUdrt
         +n3fmiV8ClBnd9JLydU11Se76c/si5Pz/kAbb/2Ir6tdazWRc6FILZCmrQgS39rZO2jb
         0MdDD3Pq4vDsqGDlWw3fnGj8LG2smXmKB09U226EZrQLI1t5L4ETZ90xZAyXt5n3VWqT
         TXGA==
X-Forwarded-Encrypted: i=1; AJvYcCXUQHvBdA9WKWhgQsai+aCOb4By8PcQCLo5+rwQgJrfsbh8zsV7SiLAzWnukfqAvFUF8m8QRWFppK4DDZ8i@vger.kernel.org
X-Gm-Message-State: AOJu0YwM5WxZvJVTX5gNMoAviFDw+T5MXYHeBbswBmcL9UORyCMIEyQ7
	fJkjfI165fsLNumh4YT91ELEGceM4QPk77+g8ZNI1A5fR0YSLzZ3xrDDA5Wtgfp+RoUMu4jUISL
	1bERFRoHeO/rXBEdF4aQeDeiC+fFYyDJXIS/HV/zjPMW+2XHiybPMyc3OHK57WiDVZxgn
X-Gm-Gg: ASbGncu5uAb038OUB4QOZfvJwh9fMNikh6BIIcanUOmLlo2036+9d6iaeAQoekvM7Ca
	PeUb5dNVbFcSOyeumSdbwDoH97GRnCBYrtXnVPE0CSjiSbFLUr11brn7BGVWv8rD8PuWlh02W+3
	toHWGBwxfAEidLUlqxc8vr4vrXNJYjMZHtKgEH7/sG/RdFevwbTzB4Pq6GHWBY/Dtrop59P0go3
	qwKfLUghJ6wKoRiDZ/NCTEAi1+BCOmJ8GgWwh5I5NWjwWJQwqqMpECgCpM4VhCQSez/z8WZp5SN
	jhcQo/Iu58rAGw4dOskLrlIsjecDzzHtsJ5sdFdkB7J4Z2C4Agd6QWvCxp84oYc8Ufwl7idmhfr
	jQwNWvo3sxqv8IGHyGIoHyLBSP9YF3fyNfShzVxDWEmINKSdpstGIIYc0Wi/iygLuJ11CsJ4cNp
	xdO6F0SIjB2EI=
X-Received: by 2002:ac8:5883:0:b0:4e8:abe4:9d38 with SMTP id d75a77b69052e-4e8abe4a39emr77390921cf.41.1760875037440;
        Sun, 19 Oct 2025 04:57:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX+YQp615nB1m9e4OBBL2rDPwe9z4DG6TaUYbaoSrZe/rJKku24BCoQyPFtL21NMa605kdaw==
X-Received: by 2002:ac8:5883:0:b0:4e8:abe4:9d38 with SMTP id d75a77b69052e-4e8abe4a39emr77390621cf.41.1760875036915;
        Sun, 19 Oct 2025 04:57:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591deeaff12sm1501803e87.34.2025.10.19.04.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Oct 2025 04:57:15 -0700 (PDT)
Date: Sun, 19 Oct 2025 14:57:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: defconfig: Change CONFIG_SM_TCSRCC_8750 from m to
 y
Message-ID: <s2u4wktoi26b5yjfl52j4y53r2bgtwsryacjd22smidl4kbtsj@ahiqbwgrcpif>
References: <20251017-update_defconfig_tcsrcc_sm8750-v1-1-34b1b47a0bda@oss.qualcomm.com>
 <30390038-0f90-48a4-befe-475cf88ba1fb@kernel.org>
 <37f54b76-a274-4ce2-aaa9-88ba0eb84199@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <37f54b76-a274-4ce2-aaa9-88ba0eb84199@oss.qualcomm.com>
X-Proofpoint-GUID: i2l6ACVT9RlBKb0rHwhkzAjq92ISrPIP
X-Proofpoint-ORIG-GUID: i2l6ACVT9RlBKb0rHwhkzAjq92ISrPIP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyMyBTYWx0ZWRfX4RSwLb1gAJQ+
 eWefxO9Rqg+Ah2RYyYRvtmigg6wGRwMeVNqCkwF5vljpVD47iX1onrmAwHwUn1a9B/nEVrkLxF7
 UMP86/ZYGrlC1LsF6YkJwIj3I/ijN6BZEU9qDdCaNuTwXLuWNpciWmxWhOVl4oebbQHnsuHAIe3
 FumhbRQCi5QG5yXCtCi9FUqBO1yqAlV0yP5csvzv9vX3ERcM2jh7hUpp2l6ZrzXTxcaWX4PV1ku
 SdDQ+B1p5ij9DsZUOr9skjElpCc/SBrMtfXtvxRaZg0JGxxa8sZZBY96w77mn8HCAfYLmuaHtCW
 eW1lU9R9O1Ls8R0+1N8DybyLYsgrBaYjHLYCpBViSEm0umKzY7C6n4zDq+brHXuz24gRaAtZZ/p
 G5isYpCFmgFXOJJXWJDoYDy1eMgx0Q==
X-Authority-Analysis: v=2.4 cv=E/vAZKdl c=1 sm=1 tr=0 ts=68f4d21e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=7rlisPeBpEk40MJsvS0A:9
 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-19_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180023

On Fri, Oct 17, 2025 at 10:46:43AM +0530, Taniya Das wrote:
> 
> 
> On 10/17/2025 10:00 AM, Krzysztof Kozlowski wrote:
> > On 16/10/2025 20:53, Taniya Das wrote:
> >> The TCSR clock controller is required  during boot to provide the ref
> >> clocks to the UFS controller. Setting CONFIG_SM_TCSRCC_8750 to y ensures
> >> the UFS driver successfully probe and initialize the device.
> >>
> >> Without this change, the UFS subsystem fails to mount as a usable file
> >> system during boot.
> > 
> > 
> > That's not what I observed. UFS works fine, especially that it is a
> > module, so no, this is not a desired change and explanation is not only
> > insufficient but actually incorrect.
> > 
> 
> Krzysztof, on Pakala MTP we are observing the below issue and it
> requires the module of tscrcc to be loaded explicitly. This patch also
> aligns to how it is on all other targets.
> 
> /soc@0/phy@1d80000: Failed to get clk index: 2 ret: -517
> [   10.496570] ufshcd-qcom 1d84000.ufs: freq-table-hz property not specified
> [   10.503660] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
> find vdd-hba-supply regulator, assuming enabled
> [   10.514548] ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: Unable to
> find vccq2-supply regulator, assuming enabled
> [   10.565955] platform 1d80000.phy: deferred probe pending: (reason
> unknown)
> [   10.573078] platform 1d84000.ufs: deferred probe pending:
> ufshcd-qcom: ufshcd_pltfrm_init() failed

This will also require you to set CONFIG_SCSI_UFS_QCOM=y (=m in
defconfig), CONFIG_PHY_QCOM_QMP_UFS=y (also =m in defconfig), etc. So, I
doubt that you are using defconfig as is. Please extend your
configuration in order to pick this module.

Note, defconfig is supposed to be used by multiple platforms and
multiple defice. As sych we can't enable all bootable devices. It is
expected that the users either change their configuration or use
initramfs. Only "working console" is expected to be working with the
defconfig and that's only because systemd doesn't reopen /dev/console
after probing modules. If it were, we could have moved all pinctrl,
interconnect and other similar drivers to =m in order to make the
footprint smaller for other platforms.

-- 
With best wishes
Dmitry

