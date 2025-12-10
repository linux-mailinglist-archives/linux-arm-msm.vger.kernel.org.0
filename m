Return-Path: <linux-arm-msm+bounces-84866-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 86969CB1DCE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 05:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1221230051A2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 04:05:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4512D2C08AD;
	Wed, 10 Dec 2025 04:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j4ITfTdx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LLN9pENA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D92272343BE
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 04:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765339516; cv=none; b=GYneFFD1XpnaA3agMdKLEz38yH9OSkUicqaOVW/rwXqodkxr7Cop+D9JSt4DROEnEBVXYqZ7E0lBf2QO9+nCQphQ1KccQbkkZpxvM0qTRKjNL/GQLHCJkQZcs4RPGo4k6+K9foWM/G+IKc+Y6ImObi1ncO76phdyM5bfP0WkFi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765339516; c=relaxed/simple;
	bh=lwLQYwyax8SWvdaZyIgy12S19bZwCTmKfOxCJXm86nI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nQlZv3OMXc3sA3ze457Z7wnfNZGDe2GW5RCNLYeVDMcVjvQA2YGjPCxGj4cXa9FyoHAunyTwOYfK8Qn46hvTZ+YsnOedjI/55SjxN3S/H6phHomhmcsM+Otk2XmL3gjiT1nB5D1hjyQWQtrdUHj91Jr4zz4lUz2D4wbNun1BQys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j4ITfTdx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LLN9pENA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA3LQ421253678
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 04:05:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jMXe+9WvRnEW6OAXDTrVPKJc
	7LR+z18srNy4uA6ZXFc=; b=j4ITfTdx88KNCAGeFhQ4Wg7lKpFJr22RaUG9jGvB
	sN8wsJqyf5Wf8vrD8dm8dztlCnbx4zeRL9CUPeyqaoTrG26KM3GIClDuS1pHKd8n
	YIATBpDq8ajf7O/v+Wt7Hkw/zJ+ZinkAegp6PjGRUOx/wKwDQPnDu0vykOG2cp6U
	vFnZUtvGbvoM2/d+CS+t5ZxqaD3vU+zot9xNcCLbkh0RS27lXa+gddBS0AlQ5Bh0
	JBMfH19M2Q9bjObabB9q1+pXzbmMuKubC/+9+wX73rJlasKoqojsFJASNaXd919Z
	DY6J4A2SIwYkuAEuQpBtYJvpTg9yA8WSWvPWAIMTsswN3A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4axqqn205s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 04:05:13 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b29b4864b7so1459632585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Dec 2025 20:05:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765339513; x=1765944313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jMXe+9WvRnEW6OAXDTrVPKJc7LR+z18srNy4uA6ZXFc=;
        b=LLN9pENAF5v2SmJKOqadT/pB+nNrV0DZgsBkdByH4HYo8mlKu8TFIl1Ur0MBKx93bO
         TO3ZsHKwOtijYyNsmnn82YMipbPbsD/jTuPDkyghuYLH5uLJl1d0VQxyKw+7Bfi99Hg+
         dnR6rBLML5NtPWy47RRo6MgYHlvnff/BD1yxLbS5Mc9cm3k5SoflZhcE9zkJ8HkgILJf
         /yr8SvW1g62BspGiylUikZo2PUpegcsq8zhBdfsgV/YSfcPiFYbj2SK9OrS3R/lDPi7k
         pUlBxaeRVNcdP3wA6TXkN8Q5yU3YJdGM5zWxtqqr8PIzv75FHUSvqA8D/xOkalP8eNqc
         Ok0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765339513; x=1765944313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jMXe+9WvRnEW6OAXDTrVPKJc7LR+z18srNy4uA6ZXFc=;
        b=IjXj9r5Z7NC2EkditHoqlTm5/JYF96K0R80MH7S7S+Fik5CERTe5JsDLqC/D5KYnEO
         raDJn5KnMiUNKdHS8QDomLjwsqMHvlqa3d5WQE1c3SAU57Fa1/3Q5r6vNALz7tOBN+x0
         yUTwmOyQbxWpT3Hx7AuJM5X7glk0Jci9F42uZTj66uZTjXulakucrtv3CibIFj2s7PQb
         OevDbhmf6oVBy35CFkCPcqz6yUPNx3h2MTDEEaCrLLEm31pXlg+CZrB9ncgxnWk6E35P
         e/wnGAS4/+7PY2sIdRLwmU45I7dKq8Jq8tSnDzIvjCRHbEnyA3v+wgAWzdFOOs2AIng7
         W4VA==
X-Forwarded-Encrypted: i=1; AJvYcCW0RbrsSxiSQMI5hRNRGCoh5MUQePbcjPXcQ3X9D+cS0h5LHrM0baOQXVDqw8j7UVHAH7gkz8gl97+CDAMQ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9g7Y6CKa/8QwGZZKHM+VK3pG2nwOvg8dVsvpMCVdy3jHey9BA
	6GlXbtygnYN8IhEPUIoOPtp2kWVcQuzieCSeDBbKRiW9wvxGfLY6cVsKR1G4q0PKpAGHaEiDF+W
	ALbYIzmWc7QI7vLs7wep4K735XZ04HG7DT0X0YOsyJH6bHgIsXX5lbvCtHEgJn5ekAPti
X-Gm-Gg: ASbGncux7ovnoB2o0ukHD6iYtD5WXyZ2H9RwOuBxEyxaG77CxOw1hBo/qzBUTXLNpi7
	wLfTqQ4vsyPOiiJFGAbP1RoOY2igJMcCcYhjcNprBrIMHKpVLFqVta84RbHw//QlhKdb+ib7UrP
	ofPAF9WUfUJD2tQjaXz4pv6N/YQw4OtW2lsZRh8TTC5wjGBPWAd6JiG9+IkvogkA6fbYFiir5hy
	ytEzrjkO2F/ILhT9julh4nMTsT4vGpczSpXHt873BVf3XVRXe1GKph09MygR0g675toJZqMZyZN
	6Z2f0E+1IAvZt487lPNvnF7h+xyw1pWmsP3zuyrKyDqwvWGkuYHMtVhvzi/7VuP/58bveSwUJwP
	MZjUWz78QecqLiNStCY6R+Ezzb4InnIs+iRlPP5wlcV6XAs1VlNzoBly8u7vtvv2/t/ZYhgzKO8
	ZLYR53hR/6EMxO8c9GSliuHCQ=
X-Received: by 2002:ac8:6903:0:b0:4ed:b448:b19f with SMTP id d75a77b69052e-4f1b1a99b2bmr15628841cf.51.1765339513013;
        Tue, 09 Dec 2025 20:05:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGURYeDIes9ouTLCB4hZposKZkETPB32W9fRqpclujgON8/agDaN9BintIrj5+IQ0zaMkUomw==
X-Received: by 2002:ac8:6903:0:b0:4ed:b448:b19f with SMTP id d75a77b69052e-4f1b1a99b2bmr15628571cf.51.1765339512620;
        Tue, 09 Dec 2025 20:05:12 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-598ea05b34csm1365961e87.101.2025.12.09.20.05.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 20:05:11 -0800 (PST)
Date: Wed, 10 Dec 2025 06:05:10 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: krzk+dt@kernel.org, abel.vesa@linaro.org, conor+dt@kernel.org,
        vkoul@kernel.org, robh@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 8/9] phy: qualcomm: qmp-combo: Update QMP PHY with
 Glymur settings
Message-ID: <f4xxep32unq23mqmtdruj3lxp6t2qdemyilk73cjogj7tz2hmp@ypqdwda73oiq>
References: <20251209-linux-next-12825-v8-0-42133596bda0@oss.qualcomm.com>
 <20251209-linux-next-12825-v8-8-42133596bda0@oss.qualcomm.com>
 <4f3og44prqjjxsiy5lwnxam3ikqylvmk3m2ofsxoa5byczhs56@3uvxjtobddxf>
 <586da917-6ea6-4b99-8222-7c49a5452451@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <586da917-6ea6-4b99-8222-7c49a5452451@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: pXv_mZ1cfstkz3Tz1V4CHo-EmOatg7d8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDAzMiBTYWx0ZWRfX9vMTjlfhzMxF
 MXgbE5w/mgaDhzKSQCpSAYPJ7oOadE7AsUWASI4lVv0LXzVy2/Ph7Dm8iX81hxQ5BKXct8izaAS
 XHI2bZ97n9qCVrdTPeI5iXNA65/F/jTsycMdW/9BkRMTVzZqXgaK2qGjSNebzjM1MoOquCXm1l6
 gzdgvaqriQVxoSFX942MQ/rXNP4rOH/FvBDPdEa7O9rPVrz7JdrB3kPiaKnG7Ehknm9+ng7UQqC
 SHMy4NY2P28r3lggPTgQxudQMUtbEe4jkoFJHYsEYfzwofN/kMXse1kUDx/aQEJ1FIZjl+KdpFo
 Q0F1j/X7XMy7wzmMoFbwegk9lppQNVfiASR4K6qebDrUppvV7QWee0obsPASjgTvhLaDYjUebus
 trQ7LPwLFpNBtTPW/fG4/7UwP6pm4Q==
X-Authority-Analysis: v=2.4 cv=A5Jh/qWG c=1 sm=1 tr=0 ts=6938f17a cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=PBfNxXwbQfs_KfBYZo8A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: pXv_mZ1cfstkz3Tz1V4CHo-EmOatg7d8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 bulkscore=0 phishscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512100032

On Tue, Dec 09, 2025 at 03:44:23PM -0800, Wesley Cheng wrote:
> 
> 
> On 12/9/2025 3:19 PM, Dmitry Baryshkov wrote:
> > On Tue, Dec 09, 2025 at 03:09:44PM -0800, Wesley Cheng wrote:
> > > For SuperSpeed USB to work properly, there is a set of HW settings that
> > > need to be programmed into the USB blocks within the QMP PHY.  Ensure that
> > > these settings follow the latest settings mentioned in the HW programming
> > > guide.  The QMP USB PHY on Glymur is a USB43 based PHY that will have some
> > > new ways to define certain registers, such as the replacement of TXA/RXA
> > > and TXB/RXB register sets.  This was replaced with the LALB register set.
> > > 
> > > There are also some PHY init updates to modify the PCS MISC register space.
> > > Without these, the QMP PHY PLL locking fails.
> > > 
> > > Signed-off-by: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
> > > ---
> > >   drivers/phy/qualcomm/phy-qcom-qmp-combo.c          | 285 +++++++++
> > >   drivers/phy/qualcomm/phy-qcom-qmp-pcs-aon-v8.h     |  17 +
> > >   drivers/phy/qualcomm/phy-qcom-qmp-pcs-misc-v8.h    |  12 +
> > >   .../phy/qualcomm/phy-qcom-qmp-qserdes-lalb-v8.h    | 639 +++++++++++++++++++++
> > >   drivers/phy/qualcomm/phy-qcom-qmp-usb43-pcs-v8.h   |  33 ++
> > >   .../qualcomm/phy-qcom-qmp-usb43-qserdes-com-v8.h   | 224 ++++++++
> > >   drivers/phy/qualcomm/phy-qcom-qmp.h                |   2 +
> > >   7 files changed, 1212 insertions(+)
> > > 
> > 
> > Does this work without DP tables?
> > 
> 
> Hi Dmitry,
> 
> Yes, it works without DP settings.  I verified it on v7 before sending it
> upstream, which did not include the DP tables.  On this series, I verified
> that the QMP DP block is initialized properly on top of the existing support
> for USB3.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

