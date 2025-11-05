Return-Path: <linux-arm-msm+bounces-80453-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F55C362B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 05 Nov 2025 15:53:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1508034EC69
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Nov 2025 14:53:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F6032145E;
	Wed,  5 Nov 2025 14:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oXHWNnIG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ch1NkDJj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009E83064B5
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Nov 2025 14:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762354399; cv=none; b=qUmCQcyTYHHSYkOBUiqeKiuZL+8iQn/vUOc20N6+QU6yyUHn6JnYcoRmsEWQnKF1TZHMCsvPVYUk7Dts0KCdID01iC+yfUqiG16B084JMb5J2gBi/Q5EVrkFq14LisxS+zeF2cAODa/jQVdzTiXDUYHEDEKUfRsAygWKDxZ+CrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762354399; c=relaxed/simple;
	bh=ZgLnTIpuw7iMUD2p5JgOQgzTNBsRCY7NK5SJrp0upI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BKl7odoHhzTAtD6g8ro7lpw/0+J4xWfXyBx2rbWMemm6zLlUBjS46WeYa09rQPcwhhYtMA2wSf8+p1DWaOILL65Y+FPMAzSeIXEGBaXxx5HBoMIl8/8d+lm55YhjrFpmFsE02WLeVRgKSXkwzB3KL+ttKJbNQ2GlmuYRDJ51z18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oXHWNnIG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ch1NkDJj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A57ugae159621
	for <linux-arm-msm@vger.kernel.org>; Wed, 5 Nov 2025 14:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qb7H+O99MrRRnHa7puLi6iRhzA+Dw742C6iM4xdYqBk=; b=oXHWNnIG7ITEgmGn
	TnsVZcEWUaIdjH8wxjUZUPzqzDpGtcurQX0ttF1DXX45cH3CBjtbpU2gqwvZSoYF
	mxcn+2G2qJezWoNdwcLUrwUPk1E7Uyc1ugVTJcU0iY4xrDqsrhwb3hV491ncWlXw
	Y2slfrwjq7Acgw93IsYIjZGriJrKsacWlml2nkZGlpphTs93jP4fayvkPf6+1VZE
	2XjsNWBmLPABM74yq4fCVV8R3KG/KN5mf9L7ruSaBkK3e9mz6kvu7ehcFriZjCwW
	8WJ31XOo/FdpH7ZnrCrbrBXtQxdbBacS3MXWYlNfgBsmRNz2RY9+LlcpBvso6WNw
	U6iYlw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a82mt14k1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 14:53:17 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4ed6466f2baso45709751cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Nov 2025 06:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762354396; x=1762959196; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qb7H+O99MrRRnHa7puLi6iRhzA+Dw742C6iM4xdYqBk=;
        b=ch1NkDJjCsi/DjDbDmEcjCI3bJyNnWOn5TySmEh5th27LAAJZOCuSfPsOvIrxAOS0y
         TEzyXwwQegZzJ3rg15HCL8N3NX3t+VNGIEpt4vuu6G85u+8Mhln+cUqSc5Ovq5uBMLLP
         Av2K1bIkMd14FuEYz3a/3EogiwD7YbilaP33R8eFkS64pIS0W0mJivK090ABn3RJjPFD
         6cNaIfFDUvrXA1RLpIL89snNRNrWIpcDQcgNtQY6U0fq1XgjIHxkiUxjH1fD1Hu0r2TS
         XNP0bmHDOHwFakpdYtpZIzM+djULxYTrvT0hUX+6CEuN+u1jwSsvjyvsofFmqM75O/i4
         tYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762354396; x=1762959196;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qb7H+O99MrRRnHa7puLi6iRhzA+Dw742C6iM4xdYqBk=;
        b=sCanKzMUTw/xcKoQTpIcWKn4nV4UZvS1fWqtVcyJ3zXyB/xV6UUBoh64/CcdJ0awFl
         0AbGxf5r5A0wZGNrxTgbpekgYx0JLhnwW8lI57tF1D/vCDu4wc/OvIv+UkwDMdZNbXB+
         3lYOpQkkq97O/9DTKXT1d9jpv1vCcIxiaFhwZMlH/eqquMuqziBijcorKThyWIy67+Cp
         BybuHJSN1EijO4q8+xYRzcQrd9sgR3SLaAe/Z5fZpsYo3ku9VSapW5WpVJqXuJz9c6wd
         xzNquxZ0nefLi5/biPjLvLhBwixbpD9MiAlv+n0xjH9E14shI9qrMesuKnds79chYG3I
         VjYw==
X-Forwarded-Encrypted: i=1; AJvYcCVDjkihcMAHfkhrbDcYcUqZRe4IzuZsPcB7tKrVoDov15jfVT+YucACNNz7riGXgVGGKzvtfVBDir5UT4Ms@vger.kernel.org
X-Gm-Message-State: AOJu0YxtOkq6xLHFN3oP3WkNw8qi7A+jJyyNn3ZSCNfePjgPOZIhHgoC
	/a4pfvmV2dBiw53vZhys8BeywakAnQiTjQgR25Pfod4+x0AwtkpPC2eEhqxRnZorfPeAQJmAfNt
	/9jjaOqqj3khZsoITIh8jjacPXu8MRAW2b9LUvQ+hVA2BsQ0aemqltQb0qCkNCXEaaHslJsFAg7
	bR
X-Gm-Gg: ASbGncti5Vl74WndNOnVSAI8USBs5EVvVbkwXc+jz+ldisTXJtJjo4bedUhNetoRGNY
	c+rUP//vciMqc/pu2zlgtlo28i1T5HIDTmT/OUnn+9k/Rwh4Bt5TeEFSJ4ZotElcRht8YPziJ3t
	Se5KeH0gm7zYgriHFDucgeAHyJO+mNhEtn6/BnvckSaBYJikGbadgW3ZQA8fOq1LsqCl+VxumNP
	ri4v1Y1IGmPR77c906Cz4RWGGsJ7dKbtwKl8Bfp6kShJvMl80CzaW1UlxCp0upFoHO9mIuNlh44
	YnzZ+q2lHwF1laUQQw8ecHZESi4VwmkikciK/nKoOhyXrG4uKSMlm3ItrtF7efKdC+9nVw5rvSO
	HkI3z+EZzM6+J+EunJwcU169pvZpHeXkWliRIuVyOvGqzsSy35iAwQsb9fMNEwEXLa0y2/8MhVD
	b8Utw7s0tiAEgS
X-Received: by 2002:a05:622a:2513:b0:4e8:b107:b213 with SMTP id d75a77b69052e-4ed7236e696mr46499431cf.32.1762354395612;
        Wed, 05 Nov 2025 06:53:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGErc0OJ9wz7u4BP3Imr6hGAsKunW4g+kcQcp6nzduMA3D1epXa8r0HbwLy2NVAJs9hmrDq2w==
X-Received: by 2002:a05:622a:2513:b0:4e8:b107:b213 with SMTP id d75a77b69052e-4ed7236e696mr46499181cf.32.1762354395098;
        Wed, 05 Nov 2025 06:53:15 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5943437efdcsm1803773e87.13.2025.11.05.06.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 06:53:14 -0800 (PST)
Date: Wed, 5 Nov 2025 16:53:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tessolve Upstream <tessolveupstream@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] Add Qualcomm Technologies, Inc. Talos EVK SMARC
 support
Message-ID: <7tk2hd5qursarvomuwe7yt574vmjixh23zz3iw6nzpzm6x7jlj@7q2vlik3t2h6>
References: <20251104125126.1006400-1-tessolveupstream@gmail.com>
 <xq4jidiffovpg3armhlzrzxloug4irumlycyyvmfaugajbtq4t@cutuj5736ayo>
 <58afe57b-68e8-4de3-841a-df3dbf04ee64@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58afe57b-68e8-4de3-841a-df3dbf04ee64@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDExMyBTYWx0ZWRfXxT421kQgyZrX
 lVOJnmJvxMLaatUiBt+BA76R22jFnGglMa9aoOmOiuXqpJnQSF4ckx6pRLpI/uZnYcmBFzb/4gG
 SdfJ+3Eq3Uw0r7tgG/l5FgeBan34ysyyLRaPZjK+MOoOR6L31aMMdlWpjIrA8HIYG5V7eo+ZeDW
 uJA0xtHeg1zBYbhlZW/xuRCdLDavlUxNIHE2oigRIv+s4ZHcU95TUiHmxtEuCVPuQLORWoS+aJV
 um3j2+yj9kZkcckGAoKaa1PK8pVWKzdQxdoPwdGDvTC8OO9D+zcvAWoPlulYWGGyQVVefvcb3UJ
 S8jzCh/hLSJG01KGSj6Fn79ACzq5J3vHXsAjGEw3PVSmC5oclYMFfucd+dAd7bjLx0QByA9ufUm
 1JsfnDKXPBKHFmYTn+2CjU64gzQfqQ==
X-Proofpoint-GUID: 9jHRpiTy-QqUQiD4selN-HkGnCTHKvN8
X-Authority-Analysis: v=2.4 cv=LLtrgZW9 c=1 sm=1 tr=0 ts=690b64dd cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=wqqN0V02qe91zFPrGA8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: 9jHRpiTy-QqUQiD4selN-HkGnCTHKvN8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_05,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050113

On Wed, Nov 05, 2025 at 06:27:42PM +0530, Tessolve Upstream wrote:
> 
> 
> On 05/11/25 06:35, Dmitry Baryshkov wrote:
> > On Tue, Nov 04, 2025 at 06:21:24PM +0530, Sudarshan Shetty wrote:
> >> Hi all,
> >>
> >> This patch series adds device tree binding and board support for the
> >> Qualcomm Technologies, Inc. Talos EVK SMARC platform based on the
> >> QCS615 SoC.
> >>
> >> The first patch introduces the DT binding entry for the Talos EVK
> >> SMARC board, and the second patch adds the corresponding DTS
> >> files for the platform.
> >>
> >> Note:
> >> USB(usb_1_dwc3) supports host-only mode based on the switch SW1 on
> >> the SoM, which is purely a hardware controlled as USB-ID and USB-VBUS
> >> is not connected the switching cannot be handled from SW.
> >> Hence from SW Host-only mode is supported on Linux boot up.
> >>
> >> Changes in v5:
> >>  - Updated commit message. (suggested by Krzysztof)
> >>  - Introduced generic node name for can, dp, hdmi-bridge. (suggested by
> >>    Krzysztof)
> >>  - Introduced talos-evk-cb.dtsi, which has common carrier board
> >>    interfaces.
> > 
> > Common between what?
> 
> Introduced talos-evk-cb.dtsi to define carrier board–specific interfaces
> common to both HDMI and LVDS top-level DTS variants.

Are those two different carrier boards? Is it a single carrier board
with mezzanines? With extension boards? With a DIP switch?

-- 
With best wishes
Dmitry

