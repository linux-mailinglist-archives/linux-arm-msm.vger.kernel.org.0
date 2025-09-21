Return-Path: <linux-arm-msm+bounces-74346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3190B8DC7A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 15:39:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4FC8D17F19D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 21 Sep 2025 13:39:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFADD2D7DCA;
	Sun, 21 Sep 2025 13:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Os1m0O47"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49693253B4C
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 13:39:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758461960; cv=none; b=VGW90nCKLol+HoeLIY2fxImgAtxW/8RfAWdiLh6K9RTm1k4uvU/Ybl7uY0VXzGfleQEs3vbxL1QCe34hvuunjCHG8t0ZweHhKskWgWCaWWQJdfa7W94yAfRQxRAKcddLa62w5Czs7gL9Khu+HVMF3f8jyVVn5SRrwd23mGSPjqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758461960; c=relaxed/simple;
	bh=YeWCF8IZw/rMgIpBjDDrdmysaeqgJv3xaxrThFxtTow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SAtL0XPn+z1PTo6fKlDxejiwgdtHnquzPnVmZ7pod4RcoZAQEh2x5qtwmtLojfM4rbf7QoxunDwm212pZvgcrNwB0y9UnnO0ipBFRyf3Gf6kPNbYMu+qbyDdRFDgIl1JlP1uM/pTKklLfjsp+LfvUAgc/mw8n+yOdA2gElWVYH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Os1m0O47; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58L9Lo8x020805
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 13:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=H4HGgDs5RVV21aBSEIYIUh0B
	LM1Dh0ZOLurCr/eNbm4=; b=Os1m0O47LdedXGW1oGkB8mXOJUqGunEcaHIebhOo
	F48QW5z3eRweUhxhjHGnnJJtml8KWFJruu0irJ4KVlEPCOjyEeipaWSh/NJ/LfUZ
	mOsfWjrPZwxgQsnMaT5v5JoM+R4Ti81uzHudth4n5kiAP4nsuormQFgEl8hUn/Jr
	QXhVYLuWkJsKd7U4YxPosbQE8S1zbHFMgFCBJ0aCoJyoE4MXoOG9gTA9UaTaMQgN
	vI7BqktrEnGYku8u4mZcw4jlVjm7dxqTur/xn8Zt4Wwzps5DNZqKRRob3HobIHvM
	cMctzUkFyiV6f+HCFVtPfaByIy7tdpgENtF59lvrXFt4tw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499hmnjgj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 13:39:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4b5ee6cd9a3so72368081cf.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 21 Sep 2025 06:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758461957; x=1759066757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H4HGgDs5RVV21aBSEIYIUh0BLM1Dh0ZOLurCr/eNbm4=;
        b=LWA49DCX7ZcSpOA1seKizwyOu+gJDXwdCxILmu7nfA84R3DnblmK0MZ0M7y4SwIsBY
         0+XrVTzTGzqD+rk0z8JjKtuugQrintTFIz7k6G2joggayWH1WMihGsADn8C8IrOLEEOL
         ++NZY68HFaHOeVzxETkTN7Uo8zwkXWPyw9S0z2+YcJJ4UFXX3fuPutjlqjc2psICC1jr
         X/62B0b/I3DDMP84N2HfyHedvFP+Hhul5UK/qaIlGrHwMsTaTpcXy+EF8j/U5bEsWirv
         1iwDEJ/1Dzq7GEBS9bYYI6N9iZckcsrhvQalKsUU5QRejaWEX40R4fRrzB6rZhRk2Omx
         c/EA==
X-Forwarded-Encrypted: i=1; AJvYcCXbf8xGdNbyCi1wJAfztX2Kld0sMCiplfYV697l1GIkyshaO4T0xdEL1Qy40QVm85T4c0kQhGq+e36Y9U/5@vger.kernel.org
X-Gm-Message-State: AOJu0YwJtoUtAq5uBceFJKlUBJG+YcstuPza7HBCtH3UIfvkhnxH54mx
	y4+qiKmilPGzyP2xQG+RodMcM2I5TVf2pSxThKV+4Cyl36AGTnejE5TjTsDpDJzKyzgPD8e7Bvl
	VvhSkHQf4A9r/ApunsxRfFBxz7d2Qe0sn7b5iLwpRiiYZWwjQJ5+dHnLg9Gzm2kM2n2oN
X-Gm-Gg: ASbGnct3uk81Szgsl8mNKhkLAlLsAffwtXupaYCVUK1cehm/0eKogL/IT1BgM+QmBLP
	YSUxcTXtSpCGOXxOd+hW/cjSBVYj/JrC57n6GjR47nURGEUkUjwxkqJUh2YHNpTIl0av5lGha93
	wekQa0vsyyj1dkZ4beFuhzPy1nI0azl4Uir/4JsQbrVmcx/icqFM4TRnwuzUNac4knp1jvM6zHn
	myAGf5PKgNl1ESfcEHgCs4zXLqattLPFgVWRRLt1kWU3LjfA3494EUYTyXCpd6tuYvsUz+8GgPS
	C9YZjChTLNWbEmo0w6673gFasX6xjlw39PrVjjT3xiuI4oXvc6Yqb7u/Vw07B17I5emIRAq/lid
	tg3BA9cFSFq08LyfyMm+arc1I3GKLeSS5O3pJoqh5LqBVNBBcMA8h
X-Received: by 2002:ac8:5941:0:b0:4b5:f1e0:2a6 with SMTP id d75a77b69052e-4c07248787fmr112419291cf.58.1758461957183;
        Sun, 21 Sep 2025 06:39:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF7DpKKzR/QW8716kTc6+qam5WV5kNx/1HjUdqz4fbjPbZzAoC02SPHlCMpwr//qQRmzkLaxA==
X-Received: by 2002:ac8:5941:0:b0:4b5:f1e0:2a6 with SMTP id d75a77b69052e-4c07248787fmr112418871cf.58.1758461956701;
        Sun, 21 Sep 2025 06:39:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-579c258c7bcsm1890688e87.128.2025.09.21.06.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Sep 2025 06:39:15 -0700 (PDT)
Date: Sun, 21 Sep 2025 16:39:14 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Heidelberg <david@ixit.cz>, Max Shevchenko <wctrl@proton.me>,
        Rudraksha Gupta <guptarud@gmail.com>, Shinjo Park <peremen@gmail.com>
Subject: Re: [PATCH v2 3/5] ARM: dts: qcom: msm8960: add I2C nodes for gsbi10
 and gsbi12
Message-ID: <fkksrn62h76626x6avxg5cls23yv4j23nxtprjvwlo5xjm2do6@jpn3vs6pdzqr>
References: <20250921-msm8960-reorder-v2-0-26c478366d21@smankusors.com>
 <20250921-msm8960-reorder-v2-3-26c478366d21@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921-msm8960-reorder-v2-3-26c478366d21@smankusors.com>
X-Authority-Analysis: v=2.4 cv=YPqfyQGx c=1 sm=1 tr=0 ts=68d00006 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=yJojWOMRYYMA:10 a=wxLWbCv9AAAA:8 a=EUspDBNiAAAA:8 a=yphT_XpnuJS82ywStm4A:9
 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-ORIG-GUID: 56fjWaDx5-MhqOW8PJPXVujMYce8pkCb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAwMCBTYWx0ZWRfX5Ujgc6FyKHh9
 DMT/OqMdM1CT+WrUg9+D+DIpwW7fgwz5k46BW1vzlbOZ3yksdfczXvNrtXBdq60eBOGiU94NufH
 SMNuHRpaTDjJUIMRTCXPH17ejT0fonvT702bBrQjtUa5lmRvIYsu6fN+dQ/rryde4V1i5Vqd+6i
 Bq9wwqo5VcgVFrBcHaMpw6zDo/DG9jeApWLbhvC2K3VpZxxQpsvjnWYC0F69z+Ey36umwyHANvm
 sQLuoh4n9L3yAmpDK2SiLdjyh1WKxvPKXVnIsGsNgaQEgUGKeh3H4q6KEHNU9arWmqbMYzCPC8T
 XdTE1dJP8+WVjhGKCAVHrp642peHdZKNgEQg3EFQBlDdVBZzqkm86Hfm3cOtg0T8vle8zna8qW/
 2fvEo1/X
X-Proofpoint-GUID: 56fjWaDx5-MhqOW8PJPXVujMYce8pkCb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-21_04,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200000

On Sun, Sep 21, 2025 at 03:08:08AM +0000, Antony Kurniawan Soemardi wrote:
> These are present on msm8960 and are required for devices such as the
> Sony Xperia SP, which has NFC wired to gsbi10 and various motion
> sensors wired to gsbi12.
> 
> The nodes are added disabled by default.
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  arch/arm/boot/dts/qcom/qcom-msm8960.dtsi | 96 ++++++++++++++++++++++++++++++++
>  1 file changed, 96 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

