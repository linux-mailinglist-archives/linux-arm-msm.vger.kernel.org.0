Return-Path: <linux-arm-msm+bounces-88811-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED02D19C83
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 16:14:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9C57230074BF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66412D9787;
	Tue, 13 Jan 2026 15:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JTTwgpZd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h/p5zk6e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881CB296BB7
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768316906; cv=none; b=Z9rzN57HMJSidaHK/g3BwWZT1Zjh2Y+Pb3pHOCkTGN4gUM7pe4a9jQY94MVPAMVqE9i6W5GqT/rKdtHtMiO1DXpgOsm2UlhE38fHrjhH7lLjqFTE1BD+CeJUOp19kf9v2hWO+RvU+gI8s94onwF0PMeutCgDoAqu9d2nv3W0Nlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768316906; c=relaxed/simple;
	bh=aClQHtbYKBV/Te61A2PAIVDGyzdj/l/LdI7EqHK2C7k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E7q8Ybz96yfLKzfrRci6fJtjmOxuxylhHdAMbI/uegeHYdjYouH8Ynd0WYJJ1Nb9VpnXz01JhMPEtih3VV3iSqXV+Vbg0dSmZKfmWi3U4nKm50ZkX7ap5JuJ5apw5WEcH/N9Xk+Cyj08kOnZ2+0JK8aA4PQ76Dj/UqhtSittQR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JTTwgpZd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h/p5zk6e; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D8Yvr53727091
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:08:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nxo/yDq4k5k6VMy4rH14W7xz
	rBuOM4vGSO0e4PAfIO8=; b=JTTwgpZdcV4lOlhSTTqJCLghW0Rqzn9THnUYsWqC
	ely1hnTUXN+dX76o5gWp/RKNDh/JYwBXb8PPTQUeUpiLbgIgOpCSijl00s/v/0L0
	mFqywxuoOgGOwP99i8S1UfmfOQZZfwve8Bu3ps+of8mC5z8afifJltznUJUk3cfH
	GJ3ofOL/GEnMpu7uv2DsU+yfcBlM3ytLH/+SyEa6WX/RROrhS+O1CD0RbUWoK4Sl
	SCEMnvNcvW1Cpz5yb3K2nZO+zUchwTMhi8dj8ftVgcVL5pNzHNGgTFkH4NZ+Px3i
	NfmvcWXzQkyl8USRNoB993En29yqZoNYDQXZP/NbsOjb0Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnjnu191s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 15:08:25 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2a0a4b748a0so44030645ad.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jan 2026 07:08:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768316904; x=1768921704; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nxo/yDq4k5k6VMy4rH14W7xzrBuOM4vGSO0e4PAfIO8=;
        b=h/p5zk6e4Doyzv9RnMf1tUTmc+5Z1etvP3JObvNtDoIa3wPZOD1DKvRZffrlZOQ7l1
         zo5xIS8mgk8VIhP8GU0EqZ+M6+TZt1Szu/HkBUG2mQ4xxJIqipnhYuBLx+kwuhzI9e3L
         IKWZWtMGGG3TCbTQYWh39bjlHuDqZa88459rv/cakxskNLaNc5zsIc3A3N63tAZXRf0g
         lwNJMR23aX34iDQ3bKdGxjWDn/AcEgMwl+Rep2X+PvfuLVmQq2itC+J4nx2GUyDdmyq+
         CBgT9WFvlecuyDT7FITBOvb7VHsLrAul8V/b6GNN+pkgBdK+HoEuKoY47MrmQ2Q8qE22
         8Mlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768316904; x=1768921704;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nxo/yDq4k5k6VMy4rH14W7xzrBuOM4vGSO0e4PAfIO8=;
        b=M7xvKWQ8PTk8t/fXkmHyuk4xr4YUan0hvYlElmbFOItXXzoYzcPBhLZpGvjh7ju3x2
         QwPWr+ZoKGTaivoMeDrKdlFSsz5sFq2nhd6U/y9tol0mdNOc5mZnGASOa0ghdx2S8Xsz
         c6sjHVS9Wo6Xh3WXajcjJ/09SQbC8HDI4Ds9zfoZX3RyUJo6PLNl+Pthi5WDOIyRp8rl
         SQNJkC6x56oyHs8oOZ2MAy81HmY21MC4cpjzToOfAzShAov/wPGpHoseKMABF9gOr5jO
         0QAAzrgwxpwyNv3n0hUlP5lUziSq5ChzgrgD1Lka2yl/IB6TGQEHR9Y7TYELqi3pwzwT
         UWjw==
X-Forwarded-Encrypted: i=1; AJvYcCUx96rg+4rwraqtvdkmHK1McebfsdR1OTMKSP9+lzLwgBA+ThCObI54v9W4aGyLolHoTtIrZaxHm2OINteR@vger.kernel.org
X-Gm-Message-State: AOJu0YwEhfDeQjaYQdTWltXPXd+58bZh02DwOy/71W2qSCspLq19Px9d
	lppf25db0AGs9lJv2Mo6/8ht/iNFJuXhLEoLZLmazA7PoiYlOznc13/BqbjL3Nw4IoADfApxacG
	CPhX/IF5PXkvODbDFy4bWmEt+v+VnSaGz+pkMW+NrqPy/5UkTkuDYrFLKtdF8hiN8i7ZLGDQYsK
	aQ
X-Gm-Gg: AY/fxX4cdiPrxTXcyCO0IN5hq+UA7fATDgAJJpvD205Bvs/+KrYmVJ1ZPKD6hITL6a4
	fbPGfFe3ETsA+M21bCzC3hDp27cs2sQktL4YiVHIG6kugULi2p0e9DSduMOE9LVXi9MQMkAaCKA
	pWOhkRdbjvxNNBb+hZ/gGs2UVgJDMpZ69tWPLseNTuIU7m6Tf8ckWE9jUWCV6g9dkh5F3M6MCH2
	T/yXbwMnxIzsN7aC2F3POpbtFih+901u7upU7byI4VBailMBJnz8RIhpntFfFGr/dKRjfiHYZ3N
	5jVfOWLtR1VOCQsbdW/D/gdpLKfBUr8Es5PVoa76rUH1/fA5LdgzClOhVv7ncpgqDIfxbmLTGdI
	o2ozKWVIK2ayfGb8kUf6r6l5U
X-Received: by 2002:a17:903:2ed0:b0:2a3:bf9d:9399 with SMTP id d9443c01a7336-2a3ee48ada7mr207537925ad.35.1768316903980;
        Tue, 13 Jan 2026 07:08:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhFdPK3N6Oy+o7/zQBBkYoxZpt1gQ/uvoFwqRBCuFSkyD45lMAxpPUEsCAh0c6bbEYvyFRpg==
X-Received: by 2002:a05:6122:266b:b0:563:71e1:c878 with SMTP id 71dfb90a1353d-56371e1c9dfmr2828639e0c.13.1768316519346;
        Tue, 13 Jan 2026 07:01:59 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.163.152])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b842a4cfe60sm2233512766b.45.2026.01.13.07.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 07:01:58 -0800 (PST)
Date: Tue, 13 Jan 2026 17:01:57 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: dispcc-glymur: use RCG2 ops for DPTX1 AUX
 clock source
Message-ID: <2hszatsmshe3yhk3yneqxgvikr5yh6dpw3r3jcgvde7yvkz2yd@jxfb6cfroijd>
References: <20260112-dp-aux-clks-v1-0-456b0c11b069@oss.qualcomm.com>
 <20260112-dp-aux-clks-v1-1-456b0c11b069@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112-dp-aux-clks-v1-1-456b0c11b069@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: x8CAmo84FX7xPvTWoeY5hZ_mQcCe4UJy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyNyBTYWx0ZWRfX4++9lf9ZrvRg
 Iyv4pxrLoB1deCJRulp98/WXIGoOirz9T3dfdJfOw8gpok+QMKVUo6Tesfuxe9TKScZZttPWlwB
 H8H39pwOsTSCh1iFKUDU3OsTH/PVCPWDnnVinQbeojK/DA+h/dqKQxRgijoAEeRLAiThMODnESh
 0a0H2Q0ESsOTAYuzYJkfgSKjSslKtaq31q7jzF3S5v+f8ORpS446qYP4qjENvn0FGDCC6YkC50Z
 CO2DwSL5Ga7nEFZu/dfs4yKA+ijHWwyLx625Ip97HKrbsJt74ddKUNLggiJLiDCAJVWIJBV3Fdm
 1HMzUqffiM5rM0qFBp/ilcjA4Pp398VLcp86FpSkbCgnaf1OBjI+hUxro6skrbisXySJglXPZaf
 dXhmdPkzJ7FEnNvEHvmelj3NQM27GV6upYm5YyamkHQ1/FpkUhL2SuH3mXgl6F+utY/5iKuowwI
 K6OCFA22bvVzzIL7WEw==
X-Authority-Analysis: v=2.4 cv=RMu+3oi+ c=1 sm=1 tr=0 ts=69665fe9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=RUlelSpolvTNyr7Sls5SJA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UIqvOZ8aP2BlQGmZcB0A:9
 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: x8CAmo84FX7xPvTWoeY5hZ_mQcCe4UJy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130127

On 26-01-12 04:12:22, Dmitry Baryshkov wrote:
> The clk_dp_ops are supposed to be used for DP-related clocks with a
> proper MND divier. Use shared RCG2 ops for dptx1_aux_clk_src, the same
> as all other DPTX AUX clocks in this driver.
> 
> Fixes: b4d15211c408 ("clk: qcom: dispcc-glymur: Add support for Display Clock Controller")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

