Return-Path: <linux-arm-msm+bounces-74307-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A00B8D0A6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 22:16:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC2F11B26E1D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 20 Sep 2025 20:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2A3A2951A7;
	Sat, 20 Sep 2025 20:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5IxZxg8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 816442820A0
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 20:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758399377; cv=none; b=T9wP6B2nIzAp81FopkN9yofwZ91svoGMj0exgafZQ7EUerE9YUOooTmd66QEvNgrbO/RWfZyJtls+dLtUXGrEQuKCRRQ7RYnxkfPhvg2lTciRevGBm9MJzSzL834a87hSdK7OFWqn/eKrrhiy0G541H/RImsg6hHwKm2M5dnsvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758399377; c=relaxed/simple;
	bh=9gSaNjRAqWsnV7A8tQ05dx4a1z3WSXwsKDdQMoFHyAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AiyzhwX9fH9JuT/IgWciV5aGaYbr6UlMrFnT1RlUJIKAO29vJG1WgjuSVcKfBMm8iJR3wLAlmKtZrzDu6fNJa1+mK96lAmEE72s2fnIWBYABxHJHemSPofjQV3iWSwcsHyaUCWhMH0GcdPclTD70kQFCbMYL1AZx5ZpYSeRFGHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5IxZxg8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58K3FFgH032055
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 20:16:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9cQlld5QxJYmLD6/7vCxaduv5uU03r8crSu4d602Xac=; b=c5IxZxg8m9ENpNzR
	qP7u61oMfOCl1K+twklJFtIwPFO2+4h/G3nrOfa9oTaTJ3JZO28gtUNFND+VVGqm
	E8+SKUL+eDMzZEcusSfDQr97zUHy7s0FYMX7reJqWYoDgaD8Be6ppo6AaBVumT3X
	ibNpIcZ4/ZFiVMMlmBOzM7+zGRCmYrl53L6PUCmdZgEoZZIwC8LOj5qc1VsqyTvr
	e0lusF+sEs9aGDFV/8Y7hgtMs0yf1X0LoANzUCWlH9jVKVrnHLF3OWO0XfPkN7V/
	NsofbkRjpntSOp7SeYEy0xHs9DPKf5ImgtLL7Rz9sFLJ2EOkSN1Z4PgUS2qlOz/W
	jnHmNg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 499k7ssbe7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 20:16:15 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4bf85835856so59070641cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 20 Sep 2025 13:16:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758399374; x=1759004174;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9cQlld5QxJYmLD6/7vCxaduv5uU03r8crSu4d602Xac=;
        b=Ud1tP5/DBeqxDep1WI5w1D0hKRb3qyGvXVowhMQeO6oSIWpgJYLbYPKq9CjieKPSP5
         Yi57BqQu+Ykr3nqZJGbjfAiEHTPbbLxOXOHHIe9dzL+qd/pgNU2Wqd00TL3SAZhhU5aR
         GBDAgU1J6JKrxIHrH5N+lZtUVc+NB6A+Lw4D0kDur3hzQBtTVC5w7PnkBKzuWJOQreRk
         /79+4/UjRsHrhwOcDr19re6fMfePHo0xrLkrU6VCZlrzGXNMjgUMWzbxxOORPwj9hGg3
         ScHg2PDKJv216bS2Cue7+CMltQ/XoUh+ISiTm/iglLVRB2t071EyvVZR4byiCCMZfIuz
         +/aw==
X-Forwarded-Encrypted: i=1; AJvYcCWsYS7FWGjY4rHeGzTN4XvjT2JRNK+0b0hrtaWKyDsuKPm3jm89YFplIGcUqnkCHuKEYx6UqeJWmWljLNyO@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk+CqLmKJBcLZhmjMP0rofNQ8xF3dLuBYgTq//cAre1MZF/XS8
	17yL/VtIsS3BOdk5Xzn0uHArzy5EBOmVK6/a2KeEc1Bu/w3z4LR1/n0GKbTvdichI+HzfbaLjdj
	mJtUUPv/FmvTC2t7cdVgbz4Y+zFvKmIGkgScsTFDfnPeRXPWzQ2xgUkWadIoJbU7RLTeVcqizmV
	Vd
X-Gm-Gg: ASbGncuvS/WE6LYYnnDi0rMsg8esyRwvF7h7A1Y1p/DVt70VXBTUB8rjPS4AmM6O1IO
	rQ4BwEgom52aDZ7MQt4d+hM9REI5N3FCTgrFOuNcWpg8AXonSxn0+9TZZRUo97hfE+oAYU3JECK
	h0KX4eNELZEM6U9tMsXkOw2jrgD28O3V5nOC493tVXCTW9ncnj+QLqz+Bnj9OApTg8sBn5tu9B4
	7z3/fY1R+iEHLCllNNYUGFg26f2YST31/v+EqaP9S5u6Cb7G78CQujH2bMFKeR1TrAhFa99u2zT
	JZxJygEIyBghE+05DzgFg0QaqyjcWxUkGJtpeFCDpbNJRPnmanNJltGjqmppVFGPe2XQecAGQk/
	7CCtEDNHA0pCZuliTx2q0NKKgW3WL8JbhHJApNr/1xkjJbgspHzCs
X-Received: by 2002:a05:622a:14d1:b0:4b3:4299:5c34 with SMTP id d75a77b69052e-4c036de6ecdmr86555781cf.0.1758399374117;
        Sat, 20 Sep 2025 13:16:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1DNyqHIcZCEUjbmIic8X7Hk5Rzdg8lYxc0kB18mG0dSGQEWt0thEl2oJIfyhs5VLrC0SJzg==
X-Received: by 2002:a05:622a:14d1:b0:4b3:4299:5c34 with SMTP id d75a77b69052e-4c036de6ecdmr86555621cf.0.1758399373683;
        Sat, 20 Sep 2025 13:16:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-57a6fe56378sm1078181e87.100.2025.09.20.13.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Sep 2025 13:16:12 -0700 (PDT)
Date: Sat, 20 Sep 2025 23:16:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Eric =?utf-8?Q?Gon=C3=A7alves?= <ghatto404@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/5] arm64: dts: qcom: r0q: enable ufs storage
Message-ID: <vhrxxj36weirztofpxii6iqojdfa4sujrfckbhcga6d5pckzxf@5l55a3rzi5hh>
References: <20250920014637.38175-1-ghatto404@gmail.com>
 <20250920014637.38175-6-ghatto404@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250920014637.38175-6-ghatto404@gmail.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAxOCBTYWx0ZWRfX9nd1129Bj3iN
 4sBp7mPfMQg07NQY6bg+jM/nQ2F20L/0julOkHg+BGVg0l+H16En1bvEdT+f6zVveLMso6fsORO
 1tfTc0A8mOpRfCQUfdneftnbWMZfIAGqY8mTFHbijyPbPQzEo3UCmkg/C+QrKeL4TLlf2qC62P9
 9N3JnRgx+kCX7D4PJtrK5xpwwlGTFksT9HgPr/2sdt/wlPowgfEdYnqEz148uVLdhQ4Zqxe1ufy
 DWpJdZkAc5+0KkVMio7nN1EuyaqvfJglZWt2ZPUGqbc7/05wE69Bwbry9phhylGn9+6kLLfNdAK
 sbZTLt/YuenSx3ehAZHI0RjsF+9yVCIzyHfUKPfDpE09BTHQ4wmJAiZhLfYBXhh8rjCAV93nG4y
 jXtgmrFu
X-Proofpoint-ORIG-GUID: _vaDrAvXUiNSnKotkjUFBqrtCHgwXh8M
X-Authority-Analysis: v=2.4 cv=bvpMBFai c=1 sm=1 tr=0 ts=68cf0b8f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=yJojWOMRYYMA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=0lCXNLNvAqMk5Dh7VnoA:9
 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: _vaDrAvXUiNSnKotkjUFBqrtCHgwXh8M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-20_07,2025-09-19_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200018

On Sat, Sep 20, 2025 at 01:46:37AM +0000, Eric Gonçalves wrote:
> Enable UFS internal storage of the Samsung Galaxy S22.
> 
> Signed-off-by: Eric Gonçalves <ghatto404@gmail.com>
> ---
>  .../boot/dts/qcom/sm8450-samsung-r0q.dts      | 39 +++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

