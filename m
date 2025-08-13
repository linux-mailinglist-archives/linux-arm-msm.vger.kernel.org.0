Return-Path: <linux-arm-msm+bounces-68992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC45B24AFE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 15:48:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FC51170F4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Aug 2025 13:45:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C14762EAB93;
	Wed, 13 Aug 2025 13:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BWyDWoEo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387C02A8C1
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 13:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755092710; cv=none; b=c+MJXrJx6aNA80xWlY4b0ULdyx2vBhFPZ4OiLxj11ggmvxSEka0AQPnip/2QDU+yHFSrNOViYyqUmTYbJu5nL93WZY2zaRyBmfzyP1BgUOND1Pntux2r/iQrj1fNEsCGvxBOtzXRBFfi7vmElUzueRP+HWGoS1Mf5v5eWVswjvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755092710; c=relaxed/simple;
	bh=rrnMVCgKWPLf3+i9sUlbk7B07YYSKzjrB6rut30/jHI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YKMmXDDV9rGRqcTOVcYuF3bKouptSCFfdGNNC5g/ViSJeWvJa1W988wPJ3iyTpt8ohxkK4gwX4XumKhHQhseD9Feg+E2xYBtCzRA/dvnx71Fy7a3pRL2h0S9Iyfe2cbe5bivi8DQ2ESGNKkKq8WIk/bpacz3d7SyoaOcgBFXKrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BWyDWoEo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57DBLgeH012543
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 13:45:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Tbskgr1FSTKaGM3oXM2qZ3de
	YMZHFeQyPrPKxR6kD+w=; b=BWyDWoEoFq58JRa7SG5IxEESvB+SRK7rvbZs0POW
	sWjRIfqUXIvOJzv1PPyAnuOrxuJaj+K4ayVOhePlzBTJpBHTdM7Oob8H7sRnXAf0
	D6UvXPg8TY9ebo5GZzexsA9gCdZdajJb1519o40GZtzjXBKi+v/1BZTWKpJ9U0+3
	8W9HHulT+EDFFMjpzCjkrgwf5K8C2AP+5XdS4Xz6sMr+S2cRzJ65OxywIaaI+3e3
	xW78x4RcKJ5z1MuOLPkX5XrUuIOzcqrN3K0lDxIMvsK+3VsqTDZS0VJarkgltiea
	NwBRv/2P9qgpSJdJMd5oiDaTv2RgToLKYbNov39aG5tr8Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48eqhxa3j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 13:45:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4af199d0facso23687981cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Aug 2025 06:45:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755092707; x=1755697507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tbskgr1FSTKaGM3oXM2qZ3deYMZHFeQyPrPKxR6kD+w=;
        b=XIJ/yQVEbOn9fO1W34pBGV7BCQYiSZlqUn031dLdNcmWEyut3N6ie8EH6PTzfMW1v+
         ILUDKNNzEvfwOqcK2weBgVsYEafI3a1kMM8VvNRqNkw1atqKE43fTLp+Llw8NbJ8Q6Xm
         +ghen217eLgVenQjngD2lC+K1SSfCTePvGTQUBc05CAtMficiZiVZXY3YJZUcvaE9bG5
         nxgXdpXWYvjjLZn533mPc3M0bUnxXDWq9WBbGUBRVJ4CIxIlv74/zBkrknvN6P1AzGIU
         2AwkxUq+/gUgA7qoqDS0rsVXg1AytDuSnOiZtpnbmkpIxBK0/5bUHHKKNMu0y3h52ssr
         XElQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNbyuotGS++shPfbZe9zOz2i7lgjGsJmJBzxMOMcZvC6KB5lKE2Kb6hmFXATESCuF0gHa24/S+Q1p3SWxp@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg2ClscymeVbNtT+DZtCcapyr7W5HbZnZMsVcqBGLcNXoxDVzN
	UycnCHP485QvXDr8LbsM/0BMtgvbCNklFylQZf06A7yazlft95EOvfe8HCth55bTcuBYcVa/UTB
	She09yQVLIhEDTLIoQXSh6fpDqU0hooVaGrkd//jcUDhgq8EFuEWsHuVGoPDN58QEzL4U
X-Gm-Gg: ASbGncsayqRxM8rm03mwX15CQj1k1LOP2AtxdaOT8GwZnAm/GTWhrBb5CPHcj41+KXX
	NUAGMj9ZpkyM4wK+Lzlk2iYnWfXnSq43/xsppdPE0QC+jvnIqmnwEpJNSEZ4LsulP5P7fcCnThV
	fodr4m2bJPKvh8tQqrLvNDlF2mkV+n2JINuOeejCiDX8SSgirPl8G9jkotCHiqplQMyQUHVbKRq
	j+qFlsVM5stgeNF1p/QoqPJtYfHDqo+WSVFTf8ipDxg7VLf3c55NKS8NDr7Y170D8JkUBbCAgGv
	j3zerjHBZSm6iISprSPQyi230TiWvSrGON77EQmxuLElfB/RhEh4JM4PUYWNeNCRp+q0L3JK5x1
	73FUcokQrFSOfCDErTiSp26ELXSDAiFVrN+IoSjwmpaFKUPwE+jDH
X-Received: by 2002:ac8:7d05:0:b0:4ab:640d:414e with SMTP id d75a77b69052e-4b0fdfdcf13mr30019921cf.3.1755092706697;
        Wed, 13 Aug 2025 06:45:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEwat25ikRoIeKUsZVQAp4uJJPxvfxNq7VavVdhY+SbjXOk0RTjYbCeFGW8hIPVRdi8aHXzsw==
X-Received: by 2002:ac8:7d05:0:b0:4ab:640d:414e with SMTP id d75a77b69052e-4b0fdfdcf13mr30018941cf.3.1755092705862;
        Wed, 13 Aug 2025 06:45:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b88ca2978sm5281543e87.116.2025.08.13.06.45.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 06:45:04 -0700 (PDT)
Date: Wed, 13 Aug 2025 16:45:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        Ajit Pandey <quic_ajipan@quicinc.com>,
        Imran Shaik <quic_imrashai@quicinc.com>,
        Jagadeesh Kona <quic_jkona@quicinc.com>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 7/7] clk: qcom: gcc: Add support for Global Clock
 Controller
Message-ID: <rv7puyb6wj4jf5yfnml3sjwjes2qnxwwfmkvhlbgbxescy7zjg@nh7xym4qgjg6>
References: <20250813-glymur-clock-controller-v4-v4-0-a408b390b22c@oss.qualcomm.com>
 <20250813-glymur-clock-controller-v4-v4-7-a408b390b22c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250813-glymur-clock-controller-v4-v4-7-a408b390b22c@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODEwMDA1NyBTYWx0ZWRfX6dozACvgQQTW
 fdM+aRotAPjRDFjKTCRwiE6hMcup05xQ5u98q849uu+SEmUy9jPR+u6pYrS0h3huB8r86BoCXs2
 cxfqxYjrzp+ooNLRRgWLFyf9pebhXhTF3ABiatU4sOcyxFILjzDeDY489w+3grtULpXJE+guuuG
 M2Jvay6GEAHmP+gWSoWlivLuh36YTkREwwY5940YTTVbMcKKDIgMT9r/8j70fEj9XvMGoydXnxu
 B2dv/VzK3rkHGVlc03+aLZpqu3gS3BOJuW1fdtEqQoFYjBVfVaVLGh+r0n0JeTDEnjUQKX+L7bO
 uYg3V6FZIx1T4JFGNvqxeoJQkM19B8kkty0ISSruLa0Ea/b0wtNXAYvOgYee3hVpwiT7bVYC7KX
 vVWk5G8t
X-Proofpoint-GUID: gH3Hwo_QQ6Wq_dbT05eyf8xUjUOQL6fR
X-Authority-Analysis: v=2.4 cv=aYNhnQot c=1 sm=1 tr=0 ts=689c96e4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=wc6weylmL2S_uF29i7wA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: gH3Hwo_QQ6Wq_dbT05eyf8xUjUOQL6fR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-13_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508100057

On Wed, Aug 13, 2025 at 01:25:23PM +0530, Taniya Das wrote:
> Add support for Global clock controller for Glymur SoC which would
> enable the consumers to enable/disable the required clocks.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/Kconfig      |    9 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-glymur.c | 8616 +++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 8626 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

