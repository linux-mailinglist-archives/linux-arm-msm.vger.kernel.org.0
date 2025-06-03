Return-Path: <linux-arm-msm+bounces-60132-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C574ACC47D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 12:37:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BA58816693D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 10:37:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA78A227E9B;
	Tue,  3 Jun 2025 10:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hlcSe1b2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2113E53365
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 10:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748947033; cv=none; b=kPicR98Rl1pyrPE9paO7looTyTQ6VQxtNUnH9axoHIhRDaWfg9z3BEj3ciBwH5Irkjv3ZQgOGduSbg1XNpPp8M+WDVlE+v1+5i0/xSH4DWcn6Se29oT5ZlowQVGMv3tnlGENIWjXaZNZTUmigt8D8wSwxBCik6IpGrUYreZWwiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748947033; c=relaxed/simple;
	bh=uqpOJv2wigJPKhBBU0tlE5lRcyIvfno4JsOZUYts/FY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mk+ntwRJAS8b1iGy1+EPZKIGKNH0We3pNhPGtvo/ZJ5EHrdVcJ5cC37IVHST4YOHe2gO+Y/au8DqCqkFXgf0pvwm4zpplPbT1MXn3jNUSVCdblDCUZInOBfym9I+dJtXYFaTN8fCMcYEP2FVPhWfs8iMVAkKziZizDIWCrruo40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hlcSe1b2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5539JFab032316
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Jun 2025 10:37:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w9uWNnzZMN7gxXGGetcBuxHkVFtdiwfBWdURBEwcqsI=; b=hlcSe1b2m80sbOH+
	HrmJDeiCebvVITjj3d/gHYyowy3NuP8JYUV/BR5d8mbbzf1KTrwRKFRvXBzzL8uv
	HrhbhuseCaIT2KZe4HGcmug2znR5CnaNSW7jRx6v4bcAO9He3/4vmow2zhOJHBWR
	mZmkryhInHOTzytu69Vh/R0rsIhRX5ta/bM31l5wufZUzxvKvH4Uafjx0XhS9p4A
	Y8jCnyLguivFvriquzrkWchJZO7/c92KkacJ/py5QD8onnTTmI3+OBg5i9LMqcMg
	DX2MnNFuXPgLHNQt5SkdcuIR99f4AANY9XAoSetwDrpq1EVR3I5HxSIOTo6RbqRG
	LPv4bQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfus2nc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 10:37:10 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c9305d29abso867382985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 03:37:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748947030; x=1749551830;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w9uWNnzZMN7gxXGGetcBuxHkVFtdiwfBWdURBEwcqsI=;
        b=ZfDI//BDwqTj6QdR4nVSPte8ySKlIGbP/DJDx/KmHKLzL0ah28JLSIh6YjFQUyvKYV
         XDCUQIJaAIF12NllVF/L9njXnpUWu+FIil4/o2oYfZly7mC2U0+qs77R7qqAKuITlbMp
         9Q2w6Q9Kd+LcMEb3jsRy4SMvF1IzbTC/2NJ8BKmfVoORBCkoB54Hlegp7odaRKd7cR/h
         9iUowLNtt2XFxf98anwEQRz1xXk3/g54VkiHYh+S5mGXup9MF4q4qvFtE4GZpCPWj3J1
         FRGsk3w3lRJo/fwJNzBxyqKcPxZT7rDdT1IuNImhHIXvsZQnqrG051xB1HyZTT1h5fUi
         7AFA==
X-Forwarded-Encrypted: i=1; AJvYcCVoPM4IrbMhoiz95ANd1qEGHZyFazi5/j02DcfKCKSLXalClAZDREJ13iCGNYe0Y2+jDHhksX9ML8NV2Jbf@vger.kernel.org
X-Gm-Message-State: AOJu0YwNrjE3FetGiI3AW5bSSlTybP8uf1pHMbkwH3rEF2bjrP6amB9s
	TIWnWbhlXdX5DuLcf3cRFzn1dzPDIEOjlV001NW2DmzxX0g5WL5Rpu22L89kgnL7hDl1fDa4Zf+
	7pbT0uCBlCtvltvHyNdDKM8VxGl+jQCfYTWn+Qpbl4TRs7RzR4Kk5dwTUnsHV6dXwC+ee
X-Gm-Gg: ASbGncvFHow6CjunedmPqj5KuaIXNJiZ5WVLZdSnMgdOfNeZk/r4C/shuBlCgbxRB4S
	aUHZF1IUYh3Q/DVop+w8NCF9A+trZTFl3CWBo5Po+6PCjG6DEnzoROm6akbv4A8XBN3H9/kXtQh
	EPJp+PLJ3avwNYTZ+4PYRXCIbN1nhO553SAojcqIUPyTIGw1NOVq3D2+tgzlQC8HBI/wvcsWe4I
	n/oQ0h246M0N14EqiSB7rE4q4XSMe1jgOot2jbWcpHbsfHpnELUSLww6+2y/LTVYHwWdT6zxq1d
	4bJ8R6sdVsmDj3oceOn+zHAKGkrMVrHGL2HugFNJzit3hDPiCZWpo4424n84+61p6GBHdUsFzT8
	=
X-Received: by 2002:a05:620a:3f85:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7d0a203c941mr2733684885a.58.1748947030004;
        Tue, 03 Jun 2025 03:37:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcaWHfUMt/J84blqUHOVj38V1G/bCnq6PQ19HYI5oXarRw/p2CQ+daA0/OPAIVimxK24L/Xw==
X-Received: by 2002:a05:620a:3f85:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7d0a203c941mr2733680685a.58.1748947029464;
        Tue, 03 Jun 2025 03:37:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553378a00d8sm1888642e87.82.2025.06.03.03.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 03:37:08 -0700 (PDT)
Date: Tue, 3 Jun 2025 13:37:06 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Cc: =?utf-8?Q?Gy=C3=B6rgy?= Kurucz <me@kuruczgy.com>,
        Sebastian Reichel <sre@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        David Collins <david.collins@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com,
        devicetree@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 5/8] power: supply: qcom_battmgr: Add charge control
 support
Message-ID: <5knsdgk7o5zifkvzlrqiplmhztnsyhlxnqiuikqf4l7wkx2qvh@s3vzkiezw2bc>
References: <20250530-qcom_battmgr_update-v2-0-9e377193a656@oss.qualcomm.com>
 <20250530-qcom_battmgr_update-v2-5-9e377193a656@oss.qualcomm.com>
 <f2e0f1da-c626-4cf0-8158-8a5805138871@kuruczgy.com>
 <8bb3a056-c00f-4ae0-a790-d742d31f229a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bb3a056-c00f-4ae0-a790-d742d31f229a@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=683ed056 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=6IFa9wvqVegA:10 a=DVxyIStym39DqTwfPQkA:9 a=3ZKOabzyN94A:10
 a=wPNLvfGTeEIA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: L0jVK4yCShznLwhUqgPgZbTbY0aFpahC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDA5MiBTYWx0ZWRfX/R19wVojODj5
 WtgziU9uFP25uOl0PnYpbz8r2fxUAdDUBuABoupb3d7rcD0bEdvgmcxbGo5oZqFSiVnXhBNAQFu
 kdm4CaFa/y3YDkp8yWjejcXpAjaMCRu2XunpZ4tNsEZ0qObpFlBHxwPinhXuH9znEltARit6gd0
 hYWSePTOOdx/omGWdaNQ5vtOtTgpsrBd1zzB37pNEvydm1x5jRTtcMU5v5wUivTBGH73/fj+4hD
 aqKFvOXUB1eDiW4fBZ5dnViPn0qIpAEBi7X47Eb/EMwM+jOLyoSogd1ESeMQpmJxcywi7NsqmXp
 nnlh0Rlu0PEl3pLy9MMp2xKlju/8mX63NW1Xh7sNsYaUfm8uLAOaqvFc21FrbO19xjFRG/nr6hO
 XrGw004lanQdPMUm0w7Iq2WsWIwwpPCPn1d9QV6byautnQaQhcRHOX6PkwIaO/rCar7zh6Kx
X-Proofpoint-GUID: L0jVK4yCShznLwhUqgPgZbTbY0aFpahC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-03_01,2025-06-02_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=742 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506030092

On Tue, Jun 03, 2025 at 01:48:11PM +0800, Fenglin Wu wrote:
> 
> On 5/31/2025 6:36 PM, György Kurucz wrote:
> > > Add charge control support for SM8550 and X1E80100.
> > 
> > Thank you for this, tested on my Lenovo Yoga Slim 7x, the limiting works
> > well, I finally don't have to worry about leaving my laptop plugged in
> > for too long.
> > 
> > One small thing I noticed is that after setting the sysfs values and
> > rebooting, they report 0 again. The limiting appears to stay in effect
> > though, so it seems that the firmware does keep the values, but Linux
> > does not read them back. Indeed, looking at the code, it seems that
> > actually reading back the values is only implemented for the SM8550.
> 
> Right.
> 
> Based on offline information, X1E80100 doesn't support reading back those
> threshold values in battery management firmware, so I can only use the
> cached values for sysfs read.

Which limits usablity of the attribute, it is now impossible to identify
whether it is enabled or disabled. Is there a chance of fixing that for
the X1E80100 platform?

> 
> > 
> > Anyway, this is just a small nitpick, this does not really affect the
> > functionality, and I would support merging this series regardless of
> > whether the read back values are always correct.
> > 
> > György

-- 
With best wishes
Dmitry

