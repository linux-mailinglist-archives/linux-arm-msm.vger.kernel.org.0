Return-Path: <linux-arm-msm+bounces-53918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A03DA84EEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 23:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1C69A8A2894
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 21:01:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F0C6EB79;
	Thu, 10 Apr 2025 21:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGXi4zcq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BA420D4F2
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 21:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744318876; cv=none; b=CA/RujXR2HiaLLumtI1CgfoannfQ37u/zeJhwgbPapGX6dwAFO798fv5XzxLDd5YY08bAfEHbpHjwXxlZyBXHOqBqyaewliLL+LzyZgV6Ap+0jQVniaTZKn1n870+IHH0KlI3K1xCeisHDoMOi08pUfx2N/OX76XqKUBmbobpdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744318876; c=relaxed/simple;
	bh=vT8A4fU1UmOiZ9+DWtANvxU8GSZaCb9rftBdA7ojakM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dE0iUK8gQVzen9cY46OHgrGepHhG3wuWNLHL8FkpxDgWqEipSNn6rU13buuYK61sKJZy2nV9UP6CIRYogHrUUsoehCssPc58y9JXQtEt25oeqJvp8aAw5zkDCqGqWaaclc492UpFSsaXePgbNlLPyMqdHMD+qIdcRgtBcJ6KaiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGXi4zcq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AGG3ak032542
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 21:01:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hTXBltzFE67Ruh1hsFseJc4C
	3laLglIPKoe35RaWrWQ=; b=NGXi4zcqQGWuVOFse1/QIZsmH6gZGc63XtWuDw3H
	XyDZ2X5RWZM1r5EbosyqWvq+bhMNmcACErkJLkXyJgDVtyvPxtLs11qzdG6BeryO
	zq/dkOHEQj51EN8wu5Ku8bK7tsOVJz2MH/PeY+ZkQNl4wTQWQ4D1OZZKS7f6hmhE
	DieyuUWB8Q8g9BIR+/hshQcYL3fLTl0Ay4IeWPz8C0tbLcJNhArjLVdQFgJLb67R
	u8NxIX/p6qw4sfVTLd3xPS3g0HJhm3A99JseUcqlsE4wSoK7D0boitoxmAuYnl/w
	BeQgC/OyVlGZK4ZuxD6/1S5ts8DaENv6tHC7qQoF+yCdkA==
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twfkr4gx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 21:01:12 +0000 (GMT)
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ce843b51c3so27655945ab.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 14:01:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744318871; x=1744923671;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTXBltzFE67Ruh1hsFseJc4C3laLglIPKoe35RaWrWQ=;
        b=hGQ2fSsPfgdqSOfX6OYvd19wpnEtJ99N0lrCN0AZIl4e2jCZlboXw4NlyyE6+Pqp83
         zMP4DzAvGZR4v+zPWVQByQHZdxjg4qjM/D0MXNGjAzPq6CpfNnV/HllYmOyHUNHhHAJi
         +2TKFwxm5tdpINV/BBMIi0Jqb53WuuNcecYAyGhqaLJe7hsPrkOqidDQxIdtWMGUre2C
         h3qpYK3fiEir1k1yHgd1+MpHFMfsmhKY1KwBkWkfxTBj5ntj2f/31/SRj2ntA0X6VqkF
         aFUHpJB7egOJpAAw66/SckWEZ85XanhzX29UglwSH+lTKJaRukZQlX9vTrMxuEBEV4pD
         xR5A==
X-Forwarded-Encrypted: i=1; AJvYcCUiZmZ3knLFt9Ckk/2k6DRn+PUuuSNbj1iL5SJeZxStnSAbdzHQH0Au50X64RCEvBlpVadFDcg4+5/z4ogk@vger.kernel.org
X-Gm-Message-State: AOJu0YwuG8GzjtSq9RImFIVWhGBdHRAWvOcTzfkYLcYHqL7nFZfne33X
	QHUcppO8z58EtZTxuAmsWXq6XChSfyQXgnHD250d5e1Dh5F/W3SADumVh9S6By+ZeliFwYiliHJ
	lD7nq2xVru8419HBfeB23rbx5l8OI7/Ihj9pig4b3tIsVW43anPsaeXLPkZcr1oX6
X-Gm-Gg: ASbGncuYOPTGxESZb12CO01zA9ihKKQSCgLqMz22tD6ohHYllcoMKNSXXBZWalSKNw/
	2Vq9TcR8NI2K/caudvQQDS7q4h7mdhuaCNNk88V6VcpneYTpUHl0jnrebq66gVTEWpRMSDbSd0x
	9/+IHhfyT34u/BYK4Js0jhxLt2RWpmMVRg7RdL48vcbAgsWrdtWto4TyY1tccKoVlbpj8ndAOyc
	e4yvYQ0lo0IZsN0I2+fQ2Y6D7vgCoH8YvveZTv33hV2NSn3FF6lkKjJX0R7d73fGdQvZ59cS08N
	5l0/p5W0d2ZitUnRn1LisWd307d1S9HwGH0Sv8y8GtytTSUypnm0z6TUhdxopz7YLFrBWxp34Fo
	=
X-Received: by 2002:a05:6e02:1449:b0:3d3:d4f0:271d with SMTP id e9e14a558f8ab-3d7ec21bb5fmr4965385ab.12.1744318870756;
        Thu, 10 Apr 2025 14:01:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7tnBM663rv7qwbG2Lp2yaNzmsf6T/Qev5qfbwF4jphfaqDwalzWmtac96frqAt/9iKu4ewQ==
X-Received: by 2002:a05:6e02:1449:b0:3d3:d4f0:271d with SMTP id e9e14a558f8ab-3d7ec21bb5fmr4964675ab.12.1744318870275;
        Thu, 10 Apr 2025 14:01:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d69fsm5843981fa.17.2025.04.10.14.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 14:01:09 -0700 (PDT)
Date: Fri, 11 Apr 2025 00:01:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
        daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
        david.collins@oss.qualcomm.com, srinivas.kandagatla@linaro.org,
        stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v3 1/5 RESEND] thermal: qcom-spmi-temp-alarm: enable
 stage 2 shutdown when required
Message-ID: <m5vw3et7qquuuwkrscs3e7yvjyx7obuc2legrzbsnd7ahz6vdk@elvuty2lrudc>
References: <20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com>
 <20250320202408.3940777-2-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250320202408.3940777-2-anjelique.melendez@oss.qualcomm.com>
X-Proofpoint-GUID: HFmFd2ZBoROnxNjnYxDdh-FIBYIWTjT-
X-Proofpoint-ORIG-GUID: HFmFd2ZBoROnxNjnYxDdh-FIBYIWTjT-
X-Authority-Analysis: v=2.4 cv=b7Oy4sGx c=1 sm=1 tr=0 ts=67f83198 cx=c_pps a=vy3nvQW9C2dqy/lMnN3IYg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=meonRkofVk6r_IjrMSUA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=mHQ74H5e8mo-RpSg_uaF:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 mlxscore=0 impostorscore=0 phishscore=0
 clxscore=1015 spamscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100153

On Thu, Mar 20, 2025 at 01:24:04PM -0700, Anjelique Melendez wrote:
> From: David Collins <david.collins@oss.qualcomm.com>
> 
> Certain TEMP_ALARM GEN2 PMIC peripherals need over-temperature
> stage 2 automatic PMIC partial shutdown to be enabled in order to
> avoid repeated faults in the event of reaching over-temperature
> stage 3.  Modify the stage 2 shutdown control logic to ensure that
> stage 2 shutdown is enabled on all affected PMICs.  Read the
> digital major and minor revision registers to identify these
> PMICs.

It would be nice to mention affected PMICs (at least thsoe supported
upstream).

> 
> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 32 +++++++++++++++++++--
>  1 file changed, 30 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

