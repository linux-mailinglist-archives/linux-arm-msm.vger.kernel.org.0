Return-Path: <linux-arm-msm+bounces-71260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C4FECB3C607
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 02:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F33C61C84361
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Aug 2025 00:14:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D65E23D81;
	Sat, 30 Aug 2025 00:13:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ArwZuVrc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A1803C33
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756512823; cv=none; b=AJTbnmGFPD0J5TTDy6lUs9jgh4vWTbi0rpNF2HYdc4tTix+KblF1NLWmFX+T1b7evcEV482I2oZiN1ghZgNMA7Eedgn7FHKDYOUeAa7dzkhHmPET5hpXhbIeNSwdnxIChNOh+If80n940GzawV2vJ9KDNYHDcIUnqgaCKRNaSFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756512823; c=relaxed/simple;
	bh=fB+FS6Rz2AmG6dZRrOjJ2PKTsvsblOItaD0Bh7Iqyrw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PrAOwHZ9zTEAuWdjEYIuKBmF515ei7KDj1jkk8l1I4bp8UolfpCcaCMm4LjHpvG6bEc9OtG9p2uSWepiQrmcxwvX71BRLGJ3xFowGvxabzLVklmVIyrXhHfRPYZGpKNTTUKP5ALDsArTkFQ0XPIP0sHKyEo3z94t3UZHRsWkkdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ArwZuVrc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TMEEC7016527
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KJI2jcouIdNFIlkiN+u9++Ao
	YlDayudAZRO2bQiSIRM=; b=ArwZuVrc8lDKy+k0BX9azqRhXwe0BKUv/v/i4vTd
	el/TJknG/c+BbwFmi667kCOPoMBLjvnJTROz1ZoRe3RUf7vjXT7JmuBFoB5fr75u
	azxh7vOcooBqfKOIC9EPta/93TbKaAmbTTY5lvqMnEvRUP/LDrNRIWWMwAqcJqRX
	1pRNjbTlcFWgujtSf7PksRjWj7+g5K1XBtbAyGAR8PadaOpfGA7aWwwHcpg1VNMY
	yOvmpp0JPQJvIZpglyDXtCU2ncujgvxUI//Lx1YGFuw4yZMGsWi2Qypt8y8UPsUF
	otSnDlQ0ym025ZTNWFpo9icxc84fiNM7ccudAGK/+Sx9zA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48tn67nbgt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 30 Aug 2025 00:13:41 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4b109be41a1so97729671cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 29 Aug 2025 17:13:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756512820; x=1757117620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KJI2jcouIdNFIlkiN+u9++AoYlDayudAZRO2bQiSIRM=;
        b=ndbYOlzInl7ps3w2WX9WjXR39z1ZOd/Q/R8T37fc3tQF+AHTNKXDC6X//dXlK98KJ7
         jzCjlbC3DQTz4MNcwqS4CC06xLDMFgzRy4EYNA5t50Wxjmba7j4rjLmucEw9WE9UzLgu
         7qvmQ0fzYxl4ogEx08e+as0pMqZG8/B1hahNnrOrPNMgevQWR+lNaHcoay4bILdqlhXT
         89ddG9wKD5toLG3coLXUySVlsGE5Dnt9z6vzkCA6Ys0Fol4zy+82A1CGIZL8aOWdeZQd
         ouf2y/71EzaWb0fQFK3zHNG2BNo5QF1xpQLCxiFAIpkFo8w0kZ82n/a/DBhP0FVenI+x
         B2fQ==
X-Gm-Message-State: AOJu0YxRf0RsuF2eodiZ1cmQ7rCDKOiGoIPjkwk2RvtCp+tApNBhmodi
	+rwB9jPl0tGs921ku9T9a1i6lrigrcBEnsRj/TwEgH9IxCMADXlFcjP0C62P1/cbTzptOElJRcg
	en0Tci4Sa3Vf6yohUbQ5ZthEksxUl7p20jncqmFVeq0RiBoAM77NsWo0SwkpAgaDeoU7A
X-Gm-Gg: ASbGncv/cUFC3aMPXdrPlMRQL1f104+5aWRbDQpZ87ttarjhiOesI2VoxwfW4UeKbbg
	gAkGv718kw6OJ3ylB3AGT+C+sOYx5oJ6Od+gCoh2fyBGG3zw31XvqpmIQcXjhzDpWs8GXlxWopH
	TxfMRHIkQu/UYRGerQZ2fwsXeJdJdutPcItZC8HDtGhjKYzGk0mIpALygegsy4kvHctf5mN8GiY
	Lya6HFDsILWuygAYPs/3LT3X60ahC3oM23ozKaxAEa/pvjcqbGtncCU21ZoK+Iuy1V/JB87esVr
	EQjISoYCDmPhsw2o6oGGQYo5C6rwRqR+t4Ih2hCaHVjQ61LF7MpU3QGp35ep5XQs4grufZGKYbQ
	umSTaFlu+BsUt0gSGnmocnE0ze6y4kUfyljV4gt8XpDbUDorTM7TI
X-Received: by 2002:a05:622a:1353:b0:4b2:fe63:ade5 with SMTP id d75a77b69052e-4b31da02273mr5934151cf.29.1756512819888;
        Fri, 29 Aug 2025 17:13:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFG7ajyHbJajLssqNp8zWk8T0G5qqW1Lj5h06mAnpHjHupukuww4VcBryXSzV5prlDAKnbf/Q==
X-Received: by 2002:a05:622a:1353:b0:4b2:fe63:ade5 with SMTP id d75a77b69052e-4b31da02273mr5933951cf.29.1756512819440;
        Fri, 29 Aug 2025 17:13:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-336b484c959sm7333281fa.43.2025.08.29.17.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 17:13:38 -0700 (PDT)
Date: Sat, 30 Aug 2025 03:13:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Petr Vorel <petr.vorel@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Alex Elder <elder@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Subject: Re: [PATCH 1/1] ARM: defconfig: Remove obsolete CONFIG_USB_EHCI_MSM
Message-ID: <forjnpvup53gpezaaqg4kri7uek3qipgamqhwub5ke2n4gxfkz@tovo2wzvppqo>
References: <20250829165031.110850-1-petr.vorel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250829165031.110850-1-petr.vorel@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDA4NSBTYWx0ZWRfX3f0fN+j0lWwj
 jxXY2/9oPUY4yfdYCo/TWgATXIOUIyh4hRr9n8/BIHYoDb0MrwKOYstU4A1sW+jaxUj9Fvfbo6T
 XYy4Kzsik+qVNN6TjSDAm0Qzx3kX8ZCof8x7xVsk/luXaZavo3s4IMDgoJGz3xHImohxbFr0BKE
 Njz8iCC7ST3Wqp+Rhj+Zal1axVqYcwgVXNbA/B3RroWY7ViqTPK+JxRXeeu1hmcyn+wkwxmYX7g
 ATYRxoumPm7LI1lx9OX+I4++siSd/hvzDCrJ0g/HHPpqzh4Y3VzvNCk7A4NwKtjzYSZ8obecpuv
 VWRIOH/mGZqdNqO5LF3jQdB7c6NtmSrHpBtnOk4NKYgB4tIDHU1btxLB4NSJNAFiMH2x9AfpiG2
 SeFtzPJU
X-Proofpoint-GUID: wIiAJg5MyFaYaMfLQTbexSJoVZ3cuaJu
X-Proofpoint-ORIG-GUID: wIiAJg5MyFaYaMfLQTbexSJoVZ3cuaJu
X-Authority-Analysis: v=2.4 cv=P7c6hjAu c=1 sm=1 tr=0 ts=68b24235 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=dHa85sIdWx2pRmVuYm0A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_07,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 adultscore=0 phishscore=0 malwarescore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508280085

On Fri, Aug 29, 2025 at 06:50:31PM +0200, Petr Vorel wrote:
> CONFIG_USB_EHCI_MSM was removed long time ago in v4.14-rc6
> 8b3f863033f9f ("usb: host: remove ehci-msm.c").
> 
> Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> ---
>  arch/arm/configs/qcom_defconfig | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

