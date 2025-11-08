Return-Path: <linux-arm-msm+bounces-80839-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5B4C42FB7
	for <lists+linux-arm-msm@lfdr.de>; Sat, 08 Nov 2025 17:18:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E208F4E3D5E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Nov 2025 16:18:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE4CB1EA7FF;
	Sat,  8 Nov 2025 16:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T5wWA3En";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LaH+dIG7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4589A194098
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Nov 2025 16:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762618691; cv=none; b=DpIwTV9iJoZZJHB5kSeJPjcJEhNNQZmu0fryrSvSzDpoUmhPVAzZtjDtUZtASXYFBytnXawWAmn7Z933KDeMEOJlzUIz1yGqcF5yNDmK2mAPKE7228ieC9nNOKb1M/3/xHH92tWybat66lobo0eTrFWbAR81x7Cs2Kw8xFzUzJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762618691; c=relaxed/simple;
	bh=KfS1aINBmDG9n1Ht1jQ+g3Uz+CAnBWGpxp7yztMXbO4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e89YA/p5CMMLCU0If3jFsRgKwEV29SXCp4+FhG1Revav3u4Oq5hPHXGkTbleOIdpUnrWELpF46hxpK5vSMH7rUD2N15zfA7I7nup/slmfreIHi1rjCH4uH6yGj7mDkmr5GkGwk5NB/do+ItlT8dp1iA4QMzJ8nXW93aU7o7tNZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T5wWA3En; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LaH+dIG7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A8DbfeL2025348
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Nov 2025 16:18:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Py00xPDir31YyU79HXmqWuCZ
	FlALcJqzV/HA9C6gi4Y=; b=T5wWA3EnSiakaRbwstD/6GyVkDWKYVM1kK0rYEau
	5nGVAKxhOl+0hlPG0l27oHKfz65EAURJfSGakBLXfRmSQEn4UACPJJ+5c+HJOVvD
	xc2JAWDsZD2D6Z5L/Uh09EZbeZIGEqYgpdA7Kbcys+0gr13EVGV1xajX4eIbMhPV
	tA4aFirUtLquOi6adh2k5xAlV/sr2eLX3Okwn0s81NU59LuM5Gd9HgmzWwcQaFSR
	LqEpX+BVQQShedvSDCrHnNSXcm0P9ZLwuXsimNPMbb3vawUNeZcdFpAwJLOfDbYE
	gGtef/gGD+L3GFpx5oonViZD+ATNw7HanXJ9fzFReHkJHA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xsg0tq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 16:18:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4ed74ab4172so51565381cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Nov 2025 08:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762618687; x=1763223487; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Py00xPDir31YyU79HXmqWuCZFlALcJqzV/HA9C6gi4Y=;
        b=LaH+dIG7JmdBVkTpyUDLknoUm/h+H4RpYpT6+TMr9PThjdioPVshU42ocLV+6yuo66
         OTF5ZiWLSGuGMpgW7UBpSnJ/OnOKORMFGIlz7du3j8Hb6ABth617AF0WasQMhBxYDHO4
         Cl8WexuROfdgXMjr2n03AGe/bV16jFF2eYongAthNIa96XqDJeLYl/MiReSYwO+wvhNX
         CVZvugw1NLTNvAAYCLr0CQTjP0JERQLBAQPwezD6p3LlMwPx/jiHZ0zY3xpj1Y0XTN4K
         KKti/dTpTQrxnV2ZzeK6suJA8OfioT0oTd3CKTlJBCjX/BxnhZPUSY8vs9YrD1m0g/Wy
         9D/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762618687; x=1763223487;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Py00xPDir31YyU79HXmqWuCZFlALcJqzV/HA9C6gi4Y=;
        b=HWr196EkGtPnCfSXjskFEtdNIYJpMg/GLoFp94//VZchBEQSUuYbjzZBLLUk6VcfOG
         UzQRYvTQYKhFqr92XW9fM2qSUyx18CKusechWUhCGtYu4nzuVgHCrN/C5Wortk5Za5J3
         ZEal2xL7LPzkeEKyflzU2xLJcrJg3uRXv63qua+KhSQhMFaHCaE5TYWs71yH2vcju/gj
         eG53yeKeHcyaaJaxyu269Eo9k14mqz/x6mzu5o0XPk5quQXuqmUN8tFZlOPTwR7O5ztB
         0YqLXyKmGguPqeoX8EoVXUxiXaQ8PtqG286FoUvJmo/50KH8+K4H1cHC5m3cV8wEYvqP
         rmnw==
X-Forwarded-Encrypted: i=1; AJvYcCWKT9qUrzY1LnFiMgGMeVsV7ofWK8J+G5UmJe+CniDtW+LalQGY/Bylav9dRcOBH1q2DhnRAkw9OMrzWH7+@vger.kernel.org
X-Gm-Message-State: AOJu0Ywz8kSle4aN+cnQ0pETg+JZq/+SUe5Ug1mL1inu9rulx4V0cybh
	ipQ/+nnXkFHccgKnA72EzEKroR5VyMRojaQrY7FWZS989X6k5d2SyY21XyqZUQJj6y16Rvl8oKx
	8JCk7CnFAMfQM/tKGyUTUL9+3HkEdAhStD4lZcHWbERGmSqTlv6kQvFlzSzuA2toE8L5Q
X-Gm-Gg: ASbGncsXfFmJqxfVwv0NQ5d3yGWv+850cvI4BRg/QXjXD3dh/r3+bMb9Xkg868U0X5d
	SATqVYSd02FqSMxVZlLNAes6Pug8x/7D3Ik80KIUz213EgM4AKfL94uKm16KWdEtvWQ6sNffWoj
	l+iMZTV84Gu4QmiyUOeGeW/zAHCKdgXFo4XN4CJNu8BPv9anAyDQS2pVg2xUDa7t2g0tuMShgye
	IsAhPwf9UBaKiVnNN8BDFFbQmHlRKUSY/28T3DAEWvaG1RHp21hlCTFYZUwMCc23fUiSKoVvDlN
	79id7UHn1wD3t+5BgHt/c/u8W3LEFaFfh6Zi9eEdlapGMYsR8wrfErqL3InWb1J8e7vrmLujtYB
	CZwpJNgE/+wCoyWOz1KgNh56wPw5E6hD1Vfp1f+eTu/Xcmio1A1el6IpstNK5zu2U6jqC/cww9+
	2J9k7ymnywGr/8
X-Received: by 2002:a05:622a:46:b0:4ed:4548:ac74 with SMTP id d75a77b69052e-4eda4fd2c4fmr37056381cf.40.1762618687396;
        Sat, 08 Nov 2025 08:18:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGEtOM0UAMNLO8z3Kc+CTbZr6goeR/evQn274D8c+axM4oynKJuYSlJ6L7YV2IzKethULeCRw==
X-Received: by 2002:a05:622a:46:b0:4ed:4548:ac74 with SMTP id d75a77b69052e-4eda4fd2c4fmr37055831cf.40.1762618686873;
        Sat, 08 Nov 2025 08:18:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5944a0b75f2sm2270521e87.54.2025.11.08.08.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Nov 2025 08:18:05 -0800 (PST)
Date: Sat, 8 Nov 2025 18:18:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: manivannan.sadhasivam@oss.qualcomm.com,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Vignesh Raman <vignesh.raman@collabora.com>,
        Valentine Burley <valentine.burley@collabora.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        "David E. Box" <david.e.box@linux.intel.com>,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Chia-Lin Kao <acelan.kao@canonical.com>,
        Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v2 0/2] PCI/ASPM: Enable ASPM and Clock PM by default on
 devicetree platforms
Message-ID: <4cp5pzmlkkht2ni7us6p3edidnk25l45xrp6w3fxguqcvhq2id@wjqqrdpkypkf>
References: <20250922-pci-dt-aspm-v2-0-2a65cf84e326@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250922-pci-dt-aspm-v2-0-2a65cf84e326@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SLVPlevH c=1 sm=1 tr=0 ts=690f6d40 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=8Yqsnq2At7iDAUDahdkA:9
 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-GUID: RZryXw5hVdf-bUnkkipfud7nmDW8qadq
X-Proofpoint-ORIG-GUID: RZryXw5hVdf-bUnkkipfud7nmDW8qadq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA4MDEzMSBTYWx0ZWRfXxiVO22CNBAp9
 nEMO/BbolSHzmPmv2NPj3ubZofOVVPrNxxfVRkzaHOxiJHV11SLIMq+y15AxPdTKBDha5o8/CY7
 mPFmYr8OU/RuESO7FqYg949uqlVYwpofNCmbMz/De6Cd7Hu/6Oc6GS93Zuz5n5D8jxgcZ8rS1PX
 0y7IPnsTcf+YVockX7km9sA/sVYLf1L8Jfh0GYH+YGoLekTNrXrg3PxbPE+8rHmNRUeHv8xM/0C
 UhD4vJqleVrRPYq33CfRSQpUA4pDiOBLWoJtHmDd4wVYAmfdbAaMzUN+5Df5ERkL4b56TZWZLkM
 Zbg5BsfilzjD93ZbLYN41it5aJre5uAXXXY6Ja73uDZGa819tT6/Ht3SpOR6l+t4YyIWHh+2LGY
 GO1Qroyyk5yM7vE5Ezzx5Q2xnNT9xQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-08_04,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511080131

On Mon, Sep 22, 2025 at 09:46:43PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> Hi,
> 
> This series is one of the 'let's bite the bullet' kind, where we have decided to
> enable all ASPM and Clock PM states by default on devicetree platforms [1]. The
> reason why devicetree platforms were chosen because, it will be of minimal
> impact compared to the ACPI platforms. So seemed ideal to test the waters.
> 
> This series is tested on Lenovo Thinkpad T14s based on Snapdragon X1 SoC. All
> supported ASPM states are getting enabled for both the NVMe and WLAN devices by
> default.
> 
> [1] https://lore.kernel.org/linux-pci/a47sg5ahflhvzyzqnfxvpk3dw4clkhqlhznjxzwqpf4nyjx5dk@bcghz5o6zolk
> [2] https://lore.kernel.org/linux-pci/20250828204345.GA958461@bhelgaas
> 
> Changes in v2:
> 
> - Used of_have_populated_dt() instead of CONFIG_OF to identify devicetree
>   platforms
> - Renamed the override helpers and changed the override print
> - Moved setting the default state back to the original place and only kept the
>   override in helpers

The series breaks the DRM CI on DB820C board (apq8096, PCIe network
card, NFS root). The board resets randomly after some time ([1]).

Note:

- Reverting just the second patch is not enough ([2])

- Reverting the second patch and picking up df5192d9bb0e ("PCI/ASPM:
  Enable only L0s and L1 for devicetree platforms") is also nout enough
  ([3])

- Only revert of both patches results in a working pipeline ([4])


[1] https://gitlab.freedesktop.org/drm/msm/-/jobs/87321332

[2] https://gitlab.freedesktop.org/drm/msm/-/jobs/87476851

[3] https://gitlab.freedesktop.org/drm/msm/-/jobs/87482677

[4] https://gitlab.freedesktop.org/drm/msm/-/jobs/87481381

> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
> Manivannan Sadhasivam (2):
>       PCI/ASPM: Override the ASPM and Clock PM states set by BIOS for devicetree platforms
>       PCI: qcom: Remove the custom ASPM enablement code
> 
>  drivers/pci/controller/dwc/pcie-qcom.c | 32 --------------------------
>  drivers/pci/pcie/aspm.c                | 42 ++++++++++++++++++++++++++++++++--
>  2 files changed, 40 insertions(+), 34 deletions(-)
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250916-pci-dt-aspm-8b3a7e8d2cf1
> 
> Best regards,
> -- 
> Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> 

-- 
With best wishes
Dmitry

