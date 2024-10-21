Return-Path: <linux-arm-msm+bounces-35285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7729A9207
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 23:27:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C977C1C20834
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2024 21:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E6DF1E2313;
	Mon, 21 Oct 2024 21:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ph/HajrU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E686D193409
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 21:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729546072; cv=none; b=dfFkeIHXGhxwOXsV9wclIEgSofvaiBQibM/eQcOCRXTGwBQQRTW2/JmMVNw/2WiiT4RqRjwK4xExFzFCw1oOH+pW3Tlg3Hr8Abgs37IocGxDIxhkkjo9UgWBzy6EUNpR/cgg6vpSgonSgzCxj4Q6QCwLa7Hga4yW368KAuqErkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729546072; c=relaxed/simple;
	bh=id+QeBRM0Lo8H3SoCiMSa9A/W3S3whdMx4Ntb1TS2nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jNWTiV8I8FcWJXmp+lss73qHiGI+HEHJhK55E8/vw2c8jk8MIXz0LPz7mwrpGXgGuvBKGQ4Q5D4pf3UoH/gS3nKLn4EePrMtsa/nGf5fbvD3ef5EenL3fNObFO1E5TXrwJUvb/B0YK2Gcf+IDzyc0p7ENciwysLW9kEGiobbarA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=fail smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ph/HajrU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LAlH9f012350
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 21:27:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2vgxIq1K+sBX6DjBuC+X85kn
	cvch8gPf/xtxKiUcmh0=; b=Ph/HajrUVR+7nHtEbCfPgak91pZMuyVpGLCVPoYR
	VNGzltZShi3zdwCfVMMTP2i00F1bBpggI67e+XmKI69Olu7MVlN4UYc9DIEIXoJv
	O9o0YG44FGLAPP/oH6WOsx6DIkNcPGyc6Vkyhx+Az9eJYxCRGrKaSAviAZlUHUKm
	16jrbcTEHjJ2wJXtBnB/gCPj1v4fRsn0h27oKbAaVTzpyYz7emR0aYkGj44WeUZ7
	gEgBco6LO2aBju2bqxF7MeDyW7NzfzI5mN5eIhzefMNFDiS3qKSBZc8pKahqpAid
	RhQhLbMK8enEQxNmV5xyGU3Q3b/PlLgEgYHzkcUHtoD/Zw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6tsp0pm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 21:27:49 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-20c94c1f692so50006135ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Oct 2024 14:27:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729546069; x=1730150869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2vgxIq1K+sBX6DjBuC+X85kncvch8gPf/xtxKiUcmh0=;
        b=QX4TqxCgnB5Enl1jhGG3Ov6CKs7yX5Ss1AO3a1JM8i/5v2MPR20XPQ6L28vFvFdK+d
         eRdCnBX1a2uMyMzkYmacIfS01U437eiUnu3ePwL7imTrd3mdDV79+EEprMQN1MRtxlLw
         EcXIrDjjBhJR4YQ45SJBBKaFlUM9DD9Wvh/s4U27rAI61nZPTFzZoJCBWujJHcqDiAEz
         bCHSvmibeHufx2bWXOQb77npxbVYV3C9OOR5po9DMRStsp5dJw2EZk1V/VyRL1hvgTxI
         sufoSKlEpxrQlCrVF8xTaO6tetSPoMxCNaImM1QUsE0s5xPwnsfZ2G9+DH3AsS8MFVCf
         G2+A==
X-Forwarded-Encrypted: i=1; AJvYcCXBZogMUEr2RQR3v4yMzOlT57EFewTDAhpK4taiH/TLRQLDFC5cfwzzkCedFhBD1V7afVb0GUVgseQHYofH@vger.kernel.org
X-Gm-Message-State: AOJu0YwkvyuB1oC3beeyn/yPNnt/duKE9vcZ59wcWJyu/QlYnLSeW4Ly
	OMzySs8Y3Ew2yHdRdutPbzszynNzuDj2ieBo+7TQPW6IZ9vqXDVxMIE0jgkmnIzxST9dulntpyA
	lWpHVcrHDA8ff9bzE9IqgqkwDJYESreWTRw+1v7+4bfirK+InALdrmEpZEDXZUni0z6ekll58
X-Received: by 2002:a17:902:db08:b0:206:892c:b758 with SMTP id d9443c01a7336-20e9700a865mr13872285ad.13.1729546068878;
        Mon, 21 Oct 2024 14:27:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHXIqur1SYtINZajJaj1NzSMDl2l3N/PP6vSiFMCr4sRNM4r+R8SvuVte+loqR2Aq6Bzt0Mlg==
X-Received: by 2002:a17:902:db08:b0:206:892c:b758 with SMTP id d9443c01a7336-20e9700a865mr13872045ad.13.1729546068490;
        Mon, 21 Oct 2024 14:27:48 -0700 (PDT)
Received: from hu-bjorande-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee65e9sm30530495ad.42.2024.10.21.14.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 14:27:48 -0700 (PDT)
Date: Mon, 21 Oct 2024 14:27:45 -0700
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
To: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: andersson@kernel.org, jacek.lawrynowicz@linux.intel.com,
        quic_carlv@quicinc.com, ogabbay@kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] accel/qaic: Add crashdump to Sahara
Message-ID: <ZxbHUQBdusgjJuu0@hu-bjorande-lv.qualcomm.com>
References: <20241021200355.544126-1-quic_jhugo@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021200355.544126-1-quic_jhugo@quicinc.com>
X-Proofpoint-GUID: 8L44LQUkT5CkqgDiV1QusyeVmB22q3bB
X-Proofpoint-ORIG-GUID: 8L44LQUkT5CkqgDiV1QusyeVmB22q3bB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 mlxlogscore=690 phishscore=0 adultscore=0
 mlxscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210152

On Mon, Oct 21, 2024 at 02:03:55PM -0600, Jeffrey Hugo wrote:
> The Sahara protocol has a crashdump functionality. In the hello
> exchange, the device can advertise it has a memory dump available for
> the host to collect. Instead of the device making requests of the host,
> the host requests data from the device which can be later analyzed.
> 
> Implement this functionality and utilize the devcoredump framework for
> handing the dump over to userspace.
> 
> Similar to how firmware loading in Sahara involves multiple files,
> crashdump can consist of multiple files for different parts of the dump.
> Structure these into a single buffer that userspace can parse and
> extract the original files from.
> 
> Reviewed-by: Carl Vanderlip <quic_carlv@quicinc.com>
> Signed-off-by: Jeffrey Hugo <quic_jhugo@quicinc.com>

Reviewed-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>

Regards,
Bjorn

