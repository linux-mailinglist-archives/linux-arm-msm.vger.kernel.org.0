Return-Path: <linux-arm-msm+bounces-59700-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A80AC6983
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 14:39:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD49917457C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 May 2025 12:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B4097283C92;
	Wed, 28 May 2025 12:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aN5i82Yz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FAF61F419B
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 12:38:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748435883; cv=none; b=W66qBxwrxvxBKv1ALIKpUmoXdh7mwmpcbA3EicQEulhlpuEjcFB+mDVIRDCKUOGu3sqMEAMpzxNkh7VlprBeGytPdY320efBtX79G6Lml26eNSQG3wNwjAyfxnIHIsjUthVk+Kaw77P/ukZXwIeNKJ+DVMrDywuxRlUwiZQ2FEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748435883; c=relaxed/simple;
	bh=sqONk/oAqQaksWZ2ArNRDlag/xuhtIBC0jRT4lXblFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iP+HT7vfxZA9NItOmAszaPz4ihVsiRIu+PWRrc+PICJga0JqiGzonQrPUX0tY3M6EZFo30OKtB7na3BfziTDnz83kLpKJiqKJTHGHV+8VYMdHK/1KarUIwiBdjTmgZtuyZ4BYJY6kw+DMAzbDJ76Xtv3CkWA6g5hNCoJzCB3Ckw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aN5i82Yz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S9hlfl009833
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 12:38:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LnTOhc1LJtROB/kjrDGcE/rf
	8BNOgI+khnoo3xpI+II=; b=aN5i82Yzl4Ju2K4fPRuXGArnnnjQ0DBL/U89Uyzg
	YEusB0lLkN497fDAn7DxqHzIj70kAMhEW5GON70OU06rh6P3qKlC0Np0tUkIuSJ0
	kcIje/EoAeRrNKOUOYwwZBMg7Ft/3atT3jK1RVuY5HQaYzOuUSQlKpRq3ex8bvSV
	yuB1qeoxTR3SOLJHIHktc3MH40k7HVJFHJ+Pz9+a+tWaBnfbZHhMrilhxBcj7fGL
	r4rmWyA0Yc1dIlKMGXhbe7646KGbXaG7coCM3gWhd0TqpiYcegRTOXGN8T329k0S
	rCZVS6kYetIjbeZS4gKgB6I5yNZgTCGOU5ywJGe2kr0fJQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46x03mrd99-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 12:37:59 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fab1bd8a71so38255536d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 May 2025 05:37:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748435879; x=1749040679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LnTOhc1LJtROB/kjrDGcE/rf8BNOgI+khnoo3xpI+II=;
        b=DrrHEgnfez9t/S58+1HCQbyaRd459e99/eXHjbiP88aK2cD6b3FqSZaW4X2hCjuGOf
         IWuHPBJREDXwHzAnvPkaI5Seiy7/7tQTrgc9FeSpv2rN3WM6hALUu/Lpx3j/PkcnggKw
         HXkL+D9kmd6LZLbWVxltq8f+yq/VcBC163OVbNiDa7hWoEzo+FtfaiLb3n9Au++n3ENX
         MsVFo5HQfjCRg9Rls9vXN70U3VJSWg3mB+r3eJbXaRTZsFFtq7koLFSu00hgicZIEOgL
         geNp2IQ725D13V9wdSP3sopEMhPWdjQxd2qnxyENpmbprxHqwfF0GF4UXS+dovkLL+aI
         7YWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUb+zz1DHAC5UtUE3oa28GY1WVMp5l9jk1Nltrk9GjVoZ44uXyFjLNhMlCvLNyM9lTvVZUOWtJNc2bQpSX0@vger.kernel.org
X-Gm-Message-State: AOJu0YwETFeiPcIzgk+0akHs9la1a0MJaS2XKfOYO4FzrFRoS3TIrpWc
	ceT/pypUAeu0GZLc1dGrc0HcpL648WLgXnakTIfYqFEvKp8/YC9N1SSACHkAHdKdEvc4s24V5FJ
	eBtoBlJwl4ueY/WjJUlYdkPFxBjoeBIgfaOyJyDcNw9cOhQm5m0se+giJHi6BgVmfm0v7
X-Gm-Gg: ASbGncsb+bcjnaU0WYdkzIGp28Sow5eqSxp4O1CvFJww7Wp8H/vEK1qHW9wG0joyp2E
	H+qj+3ZHEyDhEGg41P0fcEP3bHgyv2Ie6qQdKn7tTaENoqtNyRczIgJFBBd93v/t6pgvwHiJYqg
	Ps3eewDAv3epqY/T1cvLykq+JmneeFJ9jEe9WlUIVdh8XjqiGsSA6+oguvbFEddFIS0kXRd2rh4
	mQKezB6KQvZIYsjC/OE787AeBBPDqvZtRg1uEAnri5PBgk5ReNWxFB4DoxPYqrDOYGfu2mzQPHH
	yEHYgt/iKgNWn0+QVauAo9MsPFTsrDXH5jl174pwbvkxme8aEEI8/S3qb5W3nP5V1rqoUJBk7I8
	=
X-Received: by 2002:a05:6214:5198:b0:6e6:5bd5:f3a8 with SMTP id 6a1803df08f44-6fa9d289038mr256233216d6.29.1748435879066;
        Wed, 28 May 2025 05:37:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHf/wgeitoAgxxj9Q2ekKkeVrKgLV9879XWXLjEkhNeRx4XpQkYYovwYdM7CGYXKyMxm7vwPg==
X-Received: by 2002:a05:6214:5198:b0:6e6:5bd5:f3a8 with SMTP id 6a1803df08f44-6fa9d289038mr256232646d6.29.1748435878664;
        Wed, 28 May 2025 05:37:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5532f69a4easm265991e87.154.2025.05.28.05.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 05:37:57 -0700 (PDT)
Date: Wed, 28 May 2025 15:37:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Melody Olvera <melody.olvera@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v6 10/10] arm64: defconfig: Add M31 eUSB2 PHY config
Message-ID: <zybi7fyii72vm3dljqw2en76d4n2rmdicz7jgm5xdv6netpwrb@xwihqutyfa3w>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
 <20250527-sm8750_usb_master-v6-10-d58de3b41d34@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527-sm8750_usb_master-v6-10-d58de3b41d34@oss.qualcomm.com>
X-Proofpoint-GUID: fXh9eVDtPqVQyxGgKFvCqz-brKpN43Fd
X-Authority-Analysis: v=2.4 cv=FuAF/3rq c=1 sm=1 tr=0 ts=683703a7 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=J22MhVpkVBW5EiQ_9csA:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: fXh9eVDtPqVQyxGgKFvCqz-brKpN43Fd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDExMCBTYWx0ZWRfX+gayZ5Zv+duL
 TMvNhQ3G132O9RFK7QzdTsbT+Q95uVPMy4zKNi+iAaKl2wSpuuQ74sX4W/Cl8d+Hhno7JJtF3f+
 l042tYhATtxJH4K/4BQrQX22doC4UYjOtu8SZrYoyJu5DivEZS2vjn6grcpoQ9QrPth/Yix7nZ2
 e9gaXsUEvSfxr2Pc4Cts9//pYrE+pEBoa9/13d1dtLtZiHjAkB5LR13Sf/PWOXM2gwr4qOf+8ht
 LPrvINy4BqVF7Pdj5eYJF9G1Q8I5kCX0fx1+z7aNWU6hrs+5cfQa6hcs/NlozYMkI9ptTkUqsCG
 JMawxPq2p170uPYQcMw/S/POkkU/tw0Y8I0k9pqu9OQy7OPyGdayfiZt/bB02YDHjmRT9MfCYXg
 frx0LYmWEcDfXbahbg6EVskXAsEWMs5iYTw0OyZ1x5LT4xbuAn1YtS5ZJ2CwzgGTCo8wAVzj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_06,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 mlxlogscore=634 mlxscore=0 impostorscore=0
 bulkscore=0 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505280110

On Tue, May 27, 2025 at 02:04:46PM -0700, Melody Olvera wrote:
> The Qualcomm SM8750 SoCs use an eUSB2 PHY driver different from the
> already existing M31 USB driver because it requires a connection
> to an eUSB2 repeater. Thus, for USB to probe and work properly on
> the Qualcomm SM8750 SoCs, enable the additional driver.

Nit: in defconfig messages we usually talk about particular boards, not
about the SoCs.

Nevertheless:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


> 
> Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 897fc686e6a91b79770639d3eb15beb3ee48ef77..f4de2473b3078543b68b01387ac7e3ab6951e4a4 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1600,6 +1600,7 @@ CONFIG_PHY_QCOM_QUSB2=m
>  CONFIG_PHY_QCOM_SNPS_EUSB2=m
>  CONFIG_PHY_QCOM_EUSB2_REPEATER=m
>  CONFIG_PHY_QCOM_M31_USB=m
> +CONFIG_PHY_QCOM_M31_EUSB=m
>  CONFIG_PHY_QCOM_USB_HS=m
>  CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
>  CONFIG_PHY_QCOM_USB_HS_28NM=m
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

