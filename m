Return-Path: <linux-arm-msm+bounces-53915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDCDA84DE4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 22:08:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B20A9A5328
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Apr 2025 20:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C5438290BC4;
	Thu, 10 Apr 2025 20:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UIoz9clY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E36E29008C
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315571; cv=none; b=jM1rdVm+bK8y16/dfJCWwteySVVkNXaNzK3zDR9EaMfsCHFSPw2bnAbpBcOH/F0VnAhL0tQ3fmO19ZMYOI8/N/HAWUT+zAA9abxRuLQCXWqFz9VCBUboy8zO5GjDRY/63ynzL61AErd60121PnO45HL1ADnwcuKwApZgjYx4wZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315571; c=relaxed/simple;
	bh=gJ8md7PQ2OiPGQLW9wdP+YLmyzBHezBVypNSfQMRcnI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vd9gLhvFZje58eZPyHr7fEJFfCnqhdpKoa9Gq169RaJkKMoOnolPjFaQtCApfFaNqtMseghwLRqlsYHYmouR16YpG1InGhstwsmlWnDxTjBP84mHEpV82bv4dTvoJrgBEsHrrYYITy2OosaoXJtzCIcgCy14vM1TavnhgAdN3kI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UIoz9clY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53AG4BpH008249
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TZVLf8DQJOqLTTY5zbwnNMp8
	Hx3tMMxkt8z9vF08gyk=; b=UIoz9clYmvQhAvShfx9ifABIG9qcnSFNb1HUoZOr
	+XXrAaIDteF8LFXNuBT9IOS0s7Ay/lSIy1FppGlB+vAhNem2JVp3uDK+NkaOR7PD
	aQew5ygeYTaeK4Lc7yE5reIfyjuL8lcmM0/bXJXcaEaA1aYLag35VYlTn468yD/J
	hvDLIxJAFMWBnYEjngeqthoX9ZBZw8PcVx7VfEJNVhF0LqUItVALVg/j9Dlb55AC
	8UkIeLMuJ0QGizKhD2V2FrLBJidLP35sYMMeGmr9BXR18bcWyovrwD6TNx72IacC
	nDEkqadARg+d4Ob+CjWfNfrryh/RaDBtQsU5Uuwe5iURsg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twd08bs0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 20:06:08 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c57f80d258so382807085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Apr 2025 13:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744315568; x=1744920368;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZVLf8DQJOqLTTY5zbwnNMp8Hx3tMMxkt8z9vF08gyk=;
        b=iooMGUPxMu7S0Rr84UYhBHfgEnHL9u6YZymXEXuuRZ+naenRqDDkSfk+FDw6QqHYJ8
         CGtreQJXgV57ZJnrKAcDWoD33NZvLY8wtpob3z12kK28BB/UVonrxrgJHi3eGfgIY7x+
         CObdDWqypVE35JqzLl5PLG45/n+kI+/oHhFK6elbCuW2RwuEFQuxiSzQ74Kz6MF2BkTt
         EMi0v4WseZ321lXSncfyoOgrZC9NfD4lmTztgKyO65OByx/QKnjkprp+BBLlZk3wnYfv
         bzYJPhauiS9CVHoDVoCygmWKvxsSn3ogXB6P8GUchHivYX818Wgj7xQniEO3yiIKzc97
         pkfw==
X-Forwarded-Encrypted: i=1; AJvYcCUE6oWbpSNeuH5+5hfpoWu75ImIAWJGvNqQugJwkv4Gh6lCknaE2Al1Kf9u0h5QLffzIhHYTqaiyY1ug/GY@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ6ZrEsxHjI3lsSzYWgA9nwHWS1/11cnVtHnpTbcln3NuqM3ox
	lnKpbiuUNJLJwzRqXDfNnC2BMgI/66XFmz+B2207eacv/aj08aq/kZbyTIzave+zTBVCqVcydZv
	4X38a7AvjwEe2zEQbcjJn48RY8kgoyggC/otnajbQ3zFtUjyxJi8y8+wjSZg3zdqC
X-Gm-Gg: ASbGncsiqSviiOamjPVoX8OPNP8qHwdnoDZO/OMNjb+ww7zUeNaINN96/TiOPEb3GVe
	PRyhJl0vlcWFIPpSlPeuR3LhsWiKrs+Tc+l3hl5Yk7t8fUWlX/V2k/JgALe1Imjxs1VE3D+BJDi
	QaBvtlGdoqdipczlLRV8DWhWSHb/kARlHO9/6nfmDrP0W1k3b7YMBTmj9e2ucJvDs2zxtfHp/rP
	HuT5juuGWXwOxTpO0AJ12MmMdVEkbhhgmo6jLlk2Rz9iCeEz7bBl1EgRGwgCAXPNq1BrW9/j3qM
	bDp6vw2lr5oE8wXOlqyMS3AOmMbljyO9QPoJ4lgrjueiJk6hgxxjfSlrO3lA6FQlMGayb2W7tx8
	=
X-Received: by 2002:a05:620a:2585:b0:7c5:53ab:a722 with SMTP id af79cd13be357-7c7af0c1080mr49122185a.5.1744315567830;
        Thu, 10 Apr 2025 13:06:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHyFCAIZv2SoWtCU+S6mL10ZPcuXspL7BYeiCNpGEUGoqpR1wyjch03Yxp8FlSr3X0GqorOTQ==
X-Received: by 2002:a05:620a:2585:b0:7c5:53ab:a722 with SMTP id af79cd13be357-7c7af0c1080mr49118985a.5.1744315567533;
        Thu, 10 Apr 2025 13:06:07 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d3d2387cbsm232524e87.68.2025.04.10.13.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 13:06:05 -0700 (PDT)
Date: Thu, 10 Apr 2025 23:06:02 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Nitin Rawat <quic_nitirawa@quicinc.com>
Cc: vkoul@kernel.org, kishon@kernel.org, manivannan.sadhasivam@linaro.org,
        James.Bottomley@hansenpartnership.com, martin.petersen@oracle.com,
        bvanassche@acm.org, bjorande@quicinc.com, neil.armstrong@linaro.org,
        konrad.dybcio@oss.qualcomm.com, quic_rdwivedi@quicinc.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-scsi@vger.kernel.org,
        Can Guo <quic_cang@quicinc.com>
Subject: Re: [PATCH V3 3/9] phy: qcom-qmp-ufs: Refactor phy_power_on and
 phy_calibrate callbacks
Message-ID: <yswahfclsulxp6zveueauxtizcrzhgegwff4a55aztebgykawn@kwjrt3j5wswd>
References: <20250410090102.20781-1-quic_nitirawa@quicinc.com>
 <20250410090102.20781-4-quic_nitirawa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410090102.20781-4-quic_nitirawa@quicinc.com>
X-Proofpoint-ORIG-GUID: m26haVEaVibIXy1FUdAl2_Iw6E1FgzED
X-Authority-Analysis: v=2.4 cv=Q4vS452a c=1 sm=1 tr=0 ts=67f824b0 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=lFQMB9wLRqEjQFf09QYA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: m26haVEaVibIXy1FUdAl2_Iw6E1FgzED
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_06,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100146

On Thu, Apr 10, 2025 at 02:30:56PM +0530, Nitin Rawat wrote:
> Commit 052553af6a31 ("ufs/phy: qcom: Refactor to use phy_init call")
> puts enabling regulators & clks, calibrating UFS PHY, starting serdes
> and polling PCS ready status into phy_power_on.
> 
> In Current code regulators enable, clks enable, calibrating UFS PHY,
> start_serdes and polling PCS_ready_status are part of phy_power_on.
> 
> UFS PHY registers are retained after power collapse, meaning calibrating
> UFS PHY, start_serdes and polling PCS_ready_status can be done only when
> hba is powered_on, and not needed every time when phy_power_on is called
> during resume. Hence keep the code which enables PHY's regulators & clks
> in phy_power_on and move the rest steps into phy_calibrate function.
> 
> Refactor the code to retain PHY regulators & clks in phy_power_on and
> move out rest of the code to new phy_calibrate function.
> 
> Also move reset_control_assert to qmp_ufs_phy_calibrate to align
> with Hardware programming guide.
> 
> Co-developed-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Can Guo <quic_cang@quicinc.com>
> Signed-off-by: Nitin Rawat <quic_nitirawa@quicinc.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 26 ++++++-------------------
>  1 file changed, 6 insertions(+), 20 deletions(-)
> 

With the cover letter updated to note the dependencies:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

