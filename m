Return-Path: <linux-arm-msm+bounces-60764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E922AD34A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 13:11:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB800167E92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Jun 2025 11:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8EEFA2253EB;
	Tue, 10 Jun 2025 11:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kig8GL0q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1112A28DF3B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749553911; cv=none; b=iYuw9n/Tnb5r8hVfxcZ101wPkfWbHUeGPE7gLI3U69PhC5epxfkzuZbUT0MqMkYPZPzO3tV7p0K00YPwcixDJbXeSpRWdFhmndu1tdDO2aQTTc0z19A4Q6PXgiKfxttE2/Pluf2VjzRSjvUhaGlqYAquKoQdHPzbMgYBnE4AwhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749553911; c=relaxed/simple;
	bh=lGfzwxjvbEeSHMr2uJyICRwLy4LaylD3mrDy0I7qXRA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J8qXc+n1msK6AsnsuEN7trh39By3sJALZzrAyCd1PScvEoUcovy7kf3bq+ntLBmg+UJ0peN/4fpCESiEJDz21uvGTe8LQyVqODO7T48shgEKf2k9/nuUO2vLrRrp5v5hHlquvlVwVBAIaQEr72kLSTOU5NvFV2MGF12hwol1POk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kig8GL0q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A85c42025339
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HK0Q8aC3LXcnvaq66Cado38s
	e74xEfV882+wZWo0hHQ=; b=kig8GL0qr11q5E5Aj5/wwSFeqxnf4pqQ76GRU8uR
	K6Cpx6DiioPEXFMqgdL7h28bbGEapNJ9TPaud601vGDB/CBmlB3erNTzT9z556TV
	8Xl4MbT4pFS/f7ecH4i0YS+pUrtbcQGG7nhCiVQB8dV7rgqTxh/JkyQT3J2UT/gp
	kFX8CJQ8vj4QOSBuV68vaCVeJ5//HbiQ+0R+upbsEZHXBLOltUdzbu5uBOOHcAHJ
	uuu+6WrqgZJ+tM6aemT5BZKjE2B6EBFXirYOxCXvGOPXBIG4wbiiN4iuSAsNCshE
	gpqd5G6VEmqs28m9WXFrG4S1vaiUPe2jlxLzDlJiPpYgAA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dgxsfnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 11:11:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c791987cf6so1020110085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Jun 2025 04:11:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749553908; x=1750158708;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HK0Q8aC3LXcnvaq66Cado38se74xEfV882+wZWo0hHQ=;
        b=riERsjWtwK7MIp2rDw6uasPLlkeB27ilhBT6Niok9nxzf5MkDrfATuD4Z7WMgB43c5
         Uvs5/0pHnoYTrx5fLcUDsEksgya+wDntJ0d6vTx1aIWfqjfp2QG33BvlOhGNgVy61hw0
         Ec0A9MTHtVtqww2C6BldtokYIPBI+QYzQhgxcAGudInQesm0UQd9XKLNB5ZoZMc0IZTT
         nyTfovB/+JPxMjwe/9dr6MY/Z8RyRupsysoFHnmQYBEmBUSta5sK3/lOKg/9TK6ygqYY
         wLkTy3/SMxy/6Ez185etEYCSbySVqctPSWYPcnZsP+8WHLDnroz8Rc0iEE8xpZ+ZmEMF
         1rEA==
X-Forwarded-Encrypted: i=1; AJvYcCVa06lK3Cm4rd6GQod0PnroJb6RLueH3hVYw2ZadzpnZWbvO79PZM3x6GfrghpveUs/hqr9OpH8ttkZnNgw@vger.kernel.org
X-Gm-Message-State: AOJu0YxKTMbswktCNT03h6/E6UksEV3P99VlMBAch+M+/w8Dl2nDCP9o
	jiJ+V7TDAqJIXygkpx8ub2FzqCmEZ1WiJr/ZuWs0DOTTyvbwMig525XPxP8VB+uStIURB7aegNY
	D9oEaOGRb2dqrYQydDNIG0LHSFqy4kL1c72StYiqeK3w3LatDqgWzmL1//A3G3nxpxdIQ
X-Gm-Gg: ASbGncvhByBd7Z/Mr1GMrsPKyAknB9IPVKlCbIjey7wuXzas6Cr3EYlpmTA38vwKEVs
	IffYbzzJ02o7iwSp0OCjz+jiD8R1KpyRLnL/cbL+wVJMibo51KbKw5zleT7aw8USTyH33A8phUV
	mdWdusYJWVelREchEW2iaJ1mRSTKtv5vI8F1NlF7NaerICpRrn7a6Tgza+JQmx657J7YaXU4a1k
	w7GOINpbqZOsiObXUfgfNOnyPsGs8UBAuGUiMR+gXIR4tNRllagE+W8fJj57z2M2bkSKVpzWDwi
	qbmOJMvg8atcanEsAMkRvBbZ9NOuuZp3E+M1l//AYNgw//fqw2d6+4qSX5bMBd1NPmnfCyJl/hJ
	SIeTEtxNakE55TTSbAPy91laFbr9B6mGw6/A=
X-Received: by 2002:a05:620a:440f:b0:7d0:9be4:2d60 with SMTP id af79cd13be357-7d22987e58emr2222429685a.29.1749553908058;
        Tue, 10 Jun 2025 04:11:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb4kfyNuHSaU+T1FQ6VVMu2WzZsjYdsmsGCLkuk82qWqzLkqzTASRPgiH65daVXczZpDmSIQ==
X-Received: by 2002:a05:620a:440f:b0:7d0:9be4:2d60 with SMTP id af79cd13be357-7d22987e58emr2222426885a.29.1749553907729;
        Tue, 10 Jun 2025 04:11:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1ccc9cesm15298411fa.82.2025.06.10.04.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 04:11:46 -0700 (PDT)
Date: Tue, 10 Jun 2025 14:11:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans Verkuil <hverkuil@xs4all.nl>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: media: qcom,x1e80100-camss: Sort
 interconnect alphabetically
Message-ID: <20250610111145.zp62zx5rjmezvmkb@umbar.lan>
References: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250610083318.2773727-1-vladimir.zapolskiy@linaro.org>
X-Proofpoint-GUID: 8IS8L70yjnJeCpNisAQqIUiJXNWmK8SD
X-Authority-Analysis: v=2.4 cv=HMbDFptv c=1 sm=1 tr=0 ts=684812f4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=k9-6lplzp057ag9H7OwA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8IS8L70yjnJeCpNisAQqIUiJXNWmK8SD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA4NiBTYWx0ZWRfXxffywiOSXTZ0
 bNWeL81jzzq9GG3XH7TQ69aMmoyKv1pm4nQC8E5gRvrXwKxw47dFYOrH6OE2nZ/fCP/WWERHXe9
 7X9AsGnbylWFP/K8PLWeJ40wue7zw9Xm3mjZajOgfUwhB8ZdMfrXfOEkYKJbSy/tXcIJp/cL0aA
 riwz4CeBPNEstgnT6fcJ1wifux16QPNApkySgen6ERqyPvZ7XyD2jwWxDyiRlvKfGq2FGvBSEgn
 lR7BsMWB5Dcd6LJy8ueATGT4YG3sTfx8ZM5kOi3I6/8eD1a/IPeqdystPPH1yB0e+iWh4ews+da
 HN7IILF06YBmICXmy7ufgOmuglCP1ZWGW94lCRPBZ7QM4DkDXTtAg67UeR0O4/lY6+4jUr0SVY0
 3GiaOinIpu5u8X1zN1gs2+o9yAYVtHbF3FfY/tsAC+BBB1iCrEwgJ3IyAshp4O/VdLWHMDXJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_04,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=828 priorityscore=1501 impostorscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506100086

On Tue, Jun 10, 2025 at 11:33:17AM +0300, Vladimir Zapolskiy wrote:
> Sort the entries of interconnect and interconnect-names lists in
> alphabetical order.

This looks like an ABI change. At least you should explain the reason
for the patch.

> 
> Fixes: 2ab7f87a7f4b ("dt-bindings: media: Add qcom,x1e80100-camss")
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
> Another fix on top of https://lore.kernel.org/all/20250502204142.2064496-1-vladimir.zapolskiy@linaro.org/

-- 
With best wishes
Dmitry

