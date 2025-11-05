Return-Path: <linux-arm-msm+bounces-80385-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D9FC33957
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 02:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C490218C43F3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 01:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56C65139579;
	Wed,  5 Nov 2025 01:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HAe9xfjD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S+QHBiu5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA09B1DF75B
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 01:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762304720; cv=none; b=StOJG67RUD4pQkDW+pewQO1e1C/YnXvWU+BPmqCy8zw0AktHiv8vEyUcvRSO+D+VTOUS4F8rDzZhENSfmbQKYlbXzgQM1dWHEo0l3CgCG6ijaYQ/Xmexod7g3JqeecLhiHNQxNftnNcEpiU0JbGG261o88t4PKpk7aHAj00Nfsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762304720; c=relaxed/simple;
	bh=rJtYVnNy7gj+m3wBMg5oFKaq644ysYMWoHfp47xDheU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBui7SM145PZEZjPpz9uJrxLfM/AV8uRkUvRQEBO3f34czdz5nsfBqpmUAmdr2NJ82Iy39sKBIwZFG7r/klV+aELFJ2rFc+5GuICycyX2gw6U1fkNZW/V/7u+mwjxYteBVf0nDUHB88W61sd36cQRTmXxyhd0taOKLX+ZM3uD5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HAe9xfjD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S+QHBiu5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A4KgWPG2997848
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 01:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UKB3wyWvpcPr7K0yIT6UZfC+SjpvEvAQpR2nzIL2AxA=; b=HAe9xfjDP1B+Igrf
	87XNDwPyr8F8I16Gx7x9bzHay5IWPo2hYvhmVaD396GTtsPb+BUIg2Yr+DkCS8FK
	9U+T0zOvs73Wb69XyRaPPX0wLR/Ta4t/vJxRlfaQJ0n396B6qln+bPKKcogbDzfi
	f76C7wvFu1PZtk1qGRiOliABbQDXRCMvLoT5BuKEPBr+ESMOksLvirKbreUJ3i1D
	pP1wfd0WSTn9pFX2wW637jlywr9iCFnUbDHTMC3I4+UhE7dl2zcV3yselKb6aDnT
	e3OjcZou9TbstJHI+8I/wzATRS51R+ZTPf8m/izRp0cdZEaJ+S231V5qw8lHyODc
	1m3+GQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7c7jk2f5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 01:05:17 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8916e8d4aso200291441cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Nov 2025 17:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762304717; x=1762909517; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=UKB3wyWvpcPr7K0yIT6UZfC+SjpvEvAQpR2nzIL2AxA=;
        b=S+QHBiu5QPOSijwSILiNvOmtCNsua3KZ+yYEt4ZNIfzl+lv1HFUwd7iuOkY3d8c6xb
         FzwXI+CfVI1dl0bpnNrF9LvdJesjLlnwimu5j09BzUxQKc8uj2PMB+gWD4G2vt7745LI
         OniB7oPylTScCF/XOJ8FXkeyZunmmsyFCb1RlPiOqOEboWihaong3eDSv3sMiSO7tap6
         rx+MnXHoWviCDNZSieU/0/inj5705QKq99hcu8FXON7mso95qQe3K/JezyC+pmVt/v9K
         0JtSf0RhW227+DFZpz1GCnE6DXJaFzfr9InqpFwbyZhiva2KjlAK7aqANn/6nFebscKb
         UNow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762304717; x=1762909517;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UKB3wyWvpcPr7K0yIT6UZfC+SjpvEvAQpR2nzIL2AxA=;
        b=dEuFrBKNuetya8qC5pbx59SVzy7I5Ckx/d/PKCc690L8k1gr2LpYEBov/5rjk/5PGu
         zmeSRrjXINbbLW+lP8D5B/fIweLyWbMzvHrNF/OQ0OVLZSfnv3VXgfsgcvTsU3qQ3+Rk
         d6PzBizJ+PVDggY20ls6UCjkRVbe5wpwU1x+Y8NgpZQTjGlF/S2I7ngItrzRAgtdeYCX
         VDmPK3IR3tHjxCeDokmOj6NMsS6tPzsjzgc1/dBp7LdNZClMSSPS0rNVIGDerpVsb2lv
         gz72Ulk8dw5fUhWbULps7UjPx9n3sV6T8znHUP5ndZZEXuv2OcSLDvuYKhScxO73X3n4
         fZ+A==
X-Forwarded-Encrypted: i=1; AJvYcCU7xskTirGD6GLh3IDCClbfUawwteQsq6LSiGok3b+PVdZZxkAPabpDFxxsH0qribu+kC+YdfyyIZTaJ47p@vger.kernel.org
X-Gm-Message-State: AOJu0YzVkGmTiEqqm8Lj2qDWRwOxrITrnly1usDBcme9WQwiPlnI9K7/
	+q6yIybhCJlhlrhaqSTOEXGSduXbQLXVD6l8+T67s7SPBlyjkwRa//UDrBhSMol0d3dPAJWB6of
	eYVMx+yx5/paVZeTbN/Lez3x3cTER7s5jgpvUwy3WZNFpNemVj0t3pl/FraRSreCWaelA
X-Gm-Gg: ASbGncvVOlWpNPdk2ir4SJtQYi+YRTAHJmAW6bEzNOV9KZk16T+UCD3NKK53opPy52G
	qHYzL7TViJau4mlcLK9l5h38noSSFS1gaSSGr3I/XtF/7ig+fO8m++KBBFHqgMhuf6pvhxuZpeR
	h74CkH/pJmbUdHVJY4d93TPIHcNNwJpU/8G5T8u8fBgxduTBzbHgn7rto8wBPb3Pv34FcRHYBMS
	sOWp9y7TRpeIM9e1uQolk4Xl9pYcuWubJqCrfwo9StfugIx6i2tCG/W5L3MSW+th0Y0Cic4EnbM
	x5suHg5GU/Xq9rYioSUFzUR3onDHgIoWmW3OJJWZwfCA9tYTAVgTOfZsOsW2GRqwxvwUpPCBReB
	amXz//dffhkfrme9zn49sAxnDSOxsaey7nhciOt8Vxey9IY3wZGPzIWGDCTB52Or1PsbgyJOJKF
	2grTeiniQ3aT6J
X-Received: by 2002:a05:622a:13cd:b0:4d2:4df8:4cb5 with SMTP id d75a77b69052e-4ed723769ebmr20660371cf.4.1762304716847;
        Tue, 04 Nov 2025 17:05:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF7Pr3olhiTuSINhpQDsTtR+kYGQ/VuHjHNLQdRp69Wwe2b5u1dtEzPf+NBtNigm3oiU9boaA==
X-Received: by 2002:a05:622a:13cd:b0:4d2:4df8:4cb5 with SMTP id d75a77b69052e-4ed723769ebmr20660041cf.4.1762304716391;
        Tue, 04 Nov 2025 17:05:16 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37a414a0ddasm10514441fa.8.2025.11.04.17.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 17:05:15 -0800 (PST)
Date: Wed, 5 Nov 2025 03:05:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] Add Qualcomm Technologies, Inc. Talos EVK SMARC
 support
Message-ID: <xq4jidiffovpg3armhlzrzxloug4irumlycyyvmfaugajbtq4t@cutuj5736ayo>
References: <20251104125126.1006400-1-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251104125126.1006400-1-tessolveupstream@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDAwNyBTYWx0ZWRfX4lmjL0pe0IVE
 XnICMF9zpXNTb8i2GJ2vIojxVb1DttRK0Mxs5+ueEySYZvE41ZlX/xfXDnq+DOW8Caq/wGU59f8
 Mbp/nc0DrMJjNv3in5LFviY+mbnX0/lcGNO6Nq7a+YyXtK93xtIhOeRdR11CboGWeSZn97Ga0d3
 BJrfFyd3KAnqdzwk9EO6db2P6y6zFAU4eq91w+V2/+k0/KX4pPFsXFQPMFVGEWcUkbtu1msXWNL
 hU17r6u/4QMD/Qh2AdWuj/wYeo55JBAbEJYXuC6eFKL5re2Xb+Up7XYPWzFUax9vLaZPvPwVwcz
 kbk1CbrSG0qdqDEO9Le7p7cMbZa9vW8oynBJknEnj0fJunRG+IPs48rdpWohbxIFFNT/P9RTd9n
 0GGfDHDY6wsUsuX2iiQlgC89kuA51w==
X-Proofpoint-ORIG-GUID: HfxBiLb3SxEl3oadNYJgArmSBS_h2OL1
X-Proofpoint-GUID: HfxBiLb3SxEl3oadNYJgArmSBS_h2OL1
X-Authority-Analysis: v=2.4 cv=DvNbOW/+ c=1 sm=1 tr=0 ts=690aa2ce cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COHdNaOoP-U2MmXgnREA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_01,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511050007

On Tue, Nov 04, 2025 at 06:21:24PM +0530, Sudarshan Shetty wrote:
> Hi all,
> 
> This patch series adds device tree binding and board support for the
> Qualcomm Technologies, Inc. Talos EVK SMARC platform based on the
> QCS615 SoC.
> 
> The first patch introduces the DT binding entry for the Talos EVK
> SMARC board, and the second patch adds the corresponding DTS
> files for the platform.
> 
> Note:
> USB(usb_1_dwc3) supports host-only mode based on the switch SW1 on
> the SoM, which is purely a hardware controlled as USB-ID and USB-VBUS
> is not connected the switching cannot be handled from SW.
> Hence from SW Host-only mode is supported on Linux boot up.
> 
> Changes in v5:
>  - Updated commit message. (suggested by Krzysztof)
>  - Introduced generic node name for can, dp, hdmi-bridge. (suggested by
>    Krzysztof)
>  - Introduced talos-evk-cb.dtsi, which has common carrier board
>    interfaces.

Common between what?

>  - No functional change in bindings file.
> 
> Changes in v4:
>  - Updated product name to full form per Krzysztof’s feedback in
>    dt-binding comment.
>  - Hook up the ADV7535 DSI-to-HDMI bridge to base DTS file.
>  - Add DP connector node and MDSS DisplayPort controller.
>  - Added USB note in the cover letter for maintainers' awareness.
> 
> Changes in v3:
>  - Addressed comments from Dmitry regarding USB1 `dr_mode` and 
>    added a DTS comment.
>  - No functional change in bindings file.
> 
> Changes in v2:
>  - Renamed compatible to "qcom,talos-evk" (suggested by Dmitry/Bjorn)
>  - Merged enum entry with existing `qcs615-ride` block (Krzysztof)
>  - Fixed subject and commit message to use imperative mood.
> 
> Thanks,
> Sudarshan
> 
> Sudarshan Shetty (2):
>   dt-bindings: arm: qcom: talos-evk: Add QCS615 Talos EVK SMARC platform
>   arm64: dts: qcom: talos-evk: Add support for QCS615 talos evk board
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   1 +
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi    |  56 +++
>  arch/arm64/boot/dts/qcom/talos-evk-som.dtsi   | 442 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/talos-evk.dts        |  87 ++++
>  5 files changed, 587 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-cb.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-som.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk.dts
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

