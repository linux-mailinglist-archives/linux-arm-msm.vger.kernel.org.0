Return-Path: <linux-arm-msm+bounces-51923-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F321A688FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 11:03:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0FDFE160CDC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Mar 2025 10:03:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 117472063DF;
	Wed, 19 Mar 2025 10:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BqBTkA69"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FE61E1DE6
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742378595; cv=none; b=fmfavuNhM0S4/g3bE6cdbyLca4DLcf/DEXBAEmo4AckhrImDRRYrPK0DrbK/5daQtlxDoTwePXlMVOz63y4MxR5L3Lp8d/rVAdu4fqZvEuMtXBEMpyAtln3oVjRwRpR0Hzz8odW/judeOuKmnE21Nlt/oyERlMvnkMzvubXkes4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742378595; c=relaxed/simple;
	bh=jtxsEGScLiDZqdRASBnRspe0wt/Vw0O4Lr2pCux0cvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hihglFdrCVZUBX4VWx26VgRcB44ZF78EjOk/7H6SCP23ySuQAoHN1AEfO+lrA6so3U+Y1tgCikCdR8Kn0ZJzFfaLIQKrCBn/S0QDIJKjpXTaWz+G7w/ZU5z9mHuFtlK9UWn1IoB/LHr/j3Xkkgjx0ITTeE3jFxm1HDc/b+fOf18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BqBTkA69; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52J4lx6d019759
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:03:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=pzEcf4HDAvKkc0s10NYP45UQ
	VQBRG8PAuzto9PKZ5Dg=; b=BqBTkA69eEZI/G1qqN2BtMg+oAQEUMZ0gsd/tALJ
	j+sBfzlVQjnqzDD72OhH6AfLkoYa6M0wsevjAAqbYv+a4LrkYOIbzC16Tyg7r3b4
	cjzX2/vXGmLuHryxCmTqPg2Lzok26AyZjYtbFORNtGfbYnjTfHzynE7tLBLFywnS
	Td96SeiljGTK9JS90W2LPMLFVR07KEGNYEhP46akC6sgrWyqTPNjy1tONJqrx3HB
	1ayeqx1cLQNQlfu3PGowXP/8sKBl2vmBZmqWoaNiK2ndvteNKU8y7QaqqLHJLG9A
	+aYbFwUo/fpiicTTsLQFD2EQhposPggt2giZfaw0Nt8WWQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1uu35mr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 10:03:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c0c1025adbso1560503785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Mar 2025 03:03:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742378591; x=1742983391;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzEcf4HDAvKkc0s10NYP45UQVQBRG8PAuzto9PKZ5Dg=;
        b=EzYtL0j2cLKvRx1S2qGgnfdkMy3cnOmUx8TyzDd9PJoYZrmbFxKBi9T+F60P45TCWH
         33XmmWTe59c5oRuFOVzcHOhb6ajBPLG2gIgt0tFAJ9GSYEynK0eOv1jyQ5Oy+2efFD4Q
         2Sl3Z9BqLSPz2LeDYwdyXNYRw+g1Hvo/pIQxSYqnHREADQTETNftbkiWbuKIAsw1gzLI
         NkWHX8vkUC5CyZvDIZHK3AiszLMCe4WR0yG2OJdxirYBvoRuFyiJ96QjcoY7cikwJgWd
         hLTKLK5JTPiAIbOY8U+ral0x0xHIN3/1j7cEZEEkJyINUbLQUP8ey0zUOHmcsL7tpA3y
         zBEw==
X-Forwarded-Encrypted: i=1; AJvYcCXkAp0lovL37bmGlIwqPr3lOd+s8Ei5E7XByo7/0jnkcEl81jNnzfMb8yIyWfSKSyd90oO7faDYruTLbvKd@vger.kernel.org
X-Gm-Message-State: AOJu0YzBLJSQmL07/jxWvc8IKjkcufOckiW1aX80d8G/jmEBsIR4Hwrh
	JtNoV5ZT4lR7jrBUr+uN/8fQ0i4S6mrltqi0u94E1l55wplkcETzQ9FjNkeuo1Dm5r7dB6TKajf
	g0ateBJ8oBe80NknHLseLhpd2uWnEi2KwrJZE4Q/nov4r841pvoGJ98HQ+jOS+xiF
X-Gm-Gg: ASbGncteGY9aISl91dqmLsyMkvq+blcObGcj69XtU+PCexTykbnIrcPzyF369Ni7LFO
	Tz2jPFWVvm6BSnY3j2yQK3osH0v/xWkN7P+xFrZSNRaGcgptDKXRHe/NLaBSO/JGfW/csBQDE5d
	kFZHRNGPO7g6dPOsZ07Kh5N3jH0olStj6EzyTag/eDBRwvtHMlWVn96yIQ+dESW0qfSJpNirmNE
	JZOoiRYa8xrjybDO818tTlvKEmpuAtVQqy2NYO2Fje5SfgXDaugAHqXzdj5Di3IEGWgouJYhn7h
	kVPoPE3WxEe+calBrcRmrl11rmBNGGHL9GS/7ODy28r6cS5S5LX4ukK0dRgJeDt0dkuhRxXB70I
	YoVw=
X-Received: by 2002:a05:620a:191e:b0:7c5:9a2a:aac1 with SMTP id af79cd13be357-7c5a8469da7mr296599185a.46.1742378591351;
        Wed, 19 Mar 2025 03:03:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH36w5UmUaf1mc4I6TLyh2PvcyPbnoFFFtkRaEIewokWpjJyi3q3jXD3wRgymlu31aI1qnIQQ==
X-Received: by 2002:a05:620a:191e:b0:7c5:9a2a:aac1 with SMTP id af79cd13be357-7c5a8469da7mr296591985a.46.1742378590754;
        Wed, 19 Mar 2025 03:03:10 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ac4c02f5fsm431400e87.61.2025.03.19.03.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 03:03:08 -0700 (PDT)
Date: Wed, 19 Mar 2025 12:03:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rudraksha Gupta <guptarud@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: qcom-msm8960: add missing clocks to the timer
 node
Message-ID: <k5oehu3yt6fn6pabvjze44inzeojavznsv6xzipvb47p473un7@zrslz4kv3oph>
References: <20250318-expressatt-solve-dts-errors-v1-1-14012a4bc315@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318-expressatt-solve-dts-errors-v1-1-14012a4bc315@gmail.com>
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=67da9660 cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=HvA0BsX6I2lc9pbQE7YA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ImuLcV5swVgP_B5FL4C9AvksEcnwd-os
X-Proofpoint-ORIG-GUID: ImuLcV5swVgP_B5FL4C9AvksEcnwd-os
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-19_03,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=742
 lowpriorityscore=0 bulkscore=0 adultscore=0 spamscore=0 priorityscore=1501
 mlxscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503190070

On Tue, Mar 18, 2025 at 10:10:47PM -0700, Rudraksha Gupta wrote:
> In order to fix DT schema warning and describe hardware properly, add
> missing sleep clock to the timer node.
> 
> Solved by Dmitry Baryshkov on the APQ8064 SoC
> Link: https://lore.kernel.org/all/20250318-fix-nexus-4-v2-6-bcedd1406790@oss.qualcomm.com/
> 
> Signed-off-by: Rudraksha Gupta <guptarud@gmail.com>
> ---
> Running the following no longer returns any errors:
> make ARCH=arm CHECK_DTBS=y qcom/qcom-msm8960-cdp.dtb
> make ARCH=arm CHECK_DTBS=y qcom/qcom-msm8960-samsung-expressatt.dtb
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

