Return-Path: <linux-arm-msm+bounces-74347-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A52B8DC89
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 15:42:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D5821189CF0A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 13:42:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEC802D63E5;
	Sun, 21 Sep 2025 13:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jiGuu+k+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3292D4803
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 13:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758462150; cv=none; b=pTuULtPRl5TD4c5Frrt5LWC6mMhP8qH9uPGbliJyn4NxsUt1o2yY2keIOBaURQ2X106E8FtJ9u6QRNDLHyjMKN0yp9kcZCzf9enqYmGrxnzfyUxlo9fK23z6nfsl6eEgHt25OzxT2kIH8gICAYsQieQp90R8/61hpZ05n/pAAM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758462150; c=relaxed/simple;
	bh=P1m9m6X7raH53exBEgl1dSftxYvXtfQPuUKA+FGcWJk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ctj0O4BjJXgU3TElpghihUqijOajNIYjPisxyFQ+N3iMc/1TCqhV91U6woonttozCdK4NRjhz9aRdi2Inx/pHvO++/WO31jj3q9AgPO4A3GdhR/0Tt0QnXDLdKTFfE+1BbMRpoyOBR5O1gWhk0ciS/zt5wj/uVAHZCd6k79FilI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jiGuu+k+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L9PSmh000776
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 13:42:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8fbZ8AUpdSZTGf7eQiIgMqXI
	ZYleKr5ODhbUFzT6EXc=; b=jiGuu+k+texJvrRXTRJ6E/bblgHDWUjW1QVgjrwg
	SfmDYMW44LEQO7SZwZm8yQVoI13ioB/phuMiUXK4AUQdpTFy3QB4D9JEvTbEyMBH
	Gn1nQRCHxXGtBPrKhnvDwfey4kXdgK+fsn2RzeSNbGhshZt4qJ92kYulprxmn61m
	Knv5vqLft+d2pTeSIEyAlXk/B09HaGyz+Gm35cjXusKX2oJZGr2MoZby0dOgWiVQ
	AN2qE6aavGBLvOtfCee9hogEUbPem1as14gl4MMhEA0ICTi8NmqmFJ63k1uO+t4E
	P5PmVCRoRRJccKaJYMGTlEK2oRpXR8Y9fm399BhfykkX8w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k98aabd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 13:42:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5f818eea9so57780581cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 06:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758462147; x=1759066947;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fbZ8AUpdSZTGf7eQiIgMqXIZYleKr5ODhbUFzT6EXc=;
        b=jqQXSftDNeV0iGGINiKeaGAMzTmO7zBeWBcfwwBoh9PZyX4Cgrn7X7DyHTssUolHsF
         FTjJS7ddTQDbuTjKMK0JuYV/KIg02mReO7VcN4s8Zv1ILXaLtYeAidcOcaouTiR4yTv6
         MMiRjx3/RzSD6wtlLglgFx/kk4yH6MuTIGU2yCKYl2KFCPbp4BzHq8CRHu8b3LFxvOZI
         Sj6KgnwQGGEImDmzu0JBqCElOtzRYlniW9O8YjsNlp+Sy/+Yv3qgtCGsG4yADzhN4BbY
         JxJGlnbu0qg3s4h5ci5LrsepO6qkBxlbMD0kA06ySGNWFCB3HGt1i6jiCLEbiM670fEs
         Fg3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfdNvCm5hT+CETeiC85NW8gq33AIOs3oNcnqh4nSTBy8/KymYbDm8Pzcq0ifUD4hjRz6m55i78Dx4rfivY@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcr5NJjTXLAXKFCSJzA8wQkZK2YsVlyeh15brXLfDXjQBIlSHA
	VPdl/pUEgEU5a1kyDq8DWMyCJS8WeuFeyCM5CUpDukCQoUPAhI+0INWPGghKbp/pQCuKvcrp2zt
	KLD9bJlY4iM3lf4ZX4E87HiZw0EShbpuiRxau0PsvDPviXrXhwpircgvfzMHsCiRwExGx
X-Gm-Gg: ASbGnctEWovyPvKEjqRU4l6FsTGofsn39BJMXBWaPbFFXZ+RKtp3XziEVG8If+DkYoN
	8BqOeyYI8P0P5U7TM8qQba00ve4a6jwKypqCCeUZCNl67R0WmXV47pvQea//1qmEKnr0b6nb/Hk
	r/IovvfKUs7i5tj/2ti557O8xMwEMn0b7MwKe0vJHSPn3Nt0Ee8v3bU/Xwrze4CyoJ7e1Z87e2E
	O5cZqA7bfehmXQYsmMsPfFnuLKivzcBjoKuta3IqiVmL7YmncNScQ3ZSCAPb998oeOduaX4cg+s
	3NRNAGxjAXN+/co+lzR7UyCrEGBwZN35xBRKXqoc4Pi7z/DE6VWa85xSHjXP8oOXDZDd+3104i9
	WvIGccLfoVWDlvwnkeCPaPJpphuiVLuWIp7EBerrGSZSiEDBnXHUX
X-Received: by 2002:ac8:5d0b:0:b0:4b7:a71f:5819 with SMTP id d75a77b69052e-4c074075e01mr132048631cf.38.1758462147380;
        Sun, 21 Sep 2025 06:42:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJ7Q9Xe0lR9Xj9tnIcryF9l+1mpr8zgHCX8Mvs3/dsJgHI/XKaercYfK+VaNnsZz4Oy15W+Q==
X-Received: by 2002:ac8:5d0b:0:b0:4b7:a71f:5819 with SMTP id d75a77b69052e-4c074075e01mr132048351cf.38.1758462146925;
        Sun, 21 Sep 2025 06:42:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-361a8f56471sm23012031fa.42.2025.09.21.06.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 06:42:24 -0700 (PDT)
Date: Sun, 21 Sep 2025 16:42:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>, Shinjo Park <peremen@gmail.com>
Subject: Re: [PATCH v2 4/5] ARM: dts: qcom: msm8960: add I2C nodes for gsbi1
 and gsbi8
Message-ID: <vanz6ktal4lx2v7d74u4ac7jzxjahnxy2l45yg36il7evgaw3q@hbszkjgfrkct>
References: <20250921-msm8960-reorder-v2-0-26c478366d21@smankusors.com>
 <20250921-msm8960-reorder-v2-4-26c478366d21@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921-msm8960-reorder-v2-4-26c478366d21@smankusors.com>
X-Proofpoint-GUID: UPRyLeiTTaa4OEHrlCX3Cm3OWv-Z4-up
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX8QJTObnGDTiX
 QjiuMdZ3LFdZBIRU66hckE4bt+LeAcIFFGPEXnMoWtnVrt2fxXtWp4scCm2XDySDAoPiq/5+qSd
 LANhZg2ZgDq8uE9+cqsOMawYEwCc/R78ZWy6vu8i558KbcBIOtY6qlXjzpFRKlvHqgeYX/ODzJc
 T8n4QkbRSNoXXg9RaNOYWL2GQ2JCz8n0I9b+18o1dyYzDPk8KKSBg1Nn3NIjG+69TqymbC/Co4y
 51tgmu8l69iu5pNjaKRSHNxo0Wz90vitogj4vfCYGJNPA1Q4/CW9h8a6rBCVUZ1+KiDEqmB6OR1
 4Ud8TXJ00sxj00BiGxYmwOifuJPG9FEMz+z/A3EE1uZx1w96Eyn1i/JFRciLb8O69aXbe+tTerY
 XO2hYFx/
X-Proofpoint-ORIG-GUID: UPRyLeiTTaa4OEHrlCX3Cm3OWv-Z4-up
X-Authority-Analysis: v=2.4 cv=Dp1W+H/+ c=1 sm=1 tr=0 ts=68d000c4 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8
 a=t1JXzLs-izEPKbqAoeQA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_04,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Sun, Sep 21, 2025 at 03:08:12AM +0000, Antony Kurniawan Soemardi wrote:
> These are present on msm8960 and are required for devices such as the
> Casio G'zOne, which has NFC wired to gsbi1 and audio amplifier wired to
> gsbi8.
> 
> The nodes are added disabled by default.
> 
> Co-developed-by: Shinjo Park <peremen@gmail.com>
> Signed-off-by: Shinjo Park <peremen@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 70 ++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

