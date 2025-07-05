Return-Path: <linux-arm-msm+bounces-63819-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29344AFA02B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 15:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A12D83AD180
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Jul 2025 13:06:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F53248F61;
	Sat,  5 Jul 2025 13:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="B8qMdPxd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303197483
	for <linux-arm-msm@vger.kernel.org>; Sat,  5 Jul 2025 13:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751720823; cv=none; b=CN1Li2l4TNaAAbhvrqRYTqLrIU6V9Ymz3BdY6JmZ0XNJ6TZlVxl2Ut4tvmrEUgit9Nk6cINOnNUzAu91tgEfWPFLsc9xXDRhtjzVkSop+V4Em65ed9vEVdgRsNTD3/rX8CVKKvwUYEAu3LeMfoJ8L6p0iUtU+cdxQejIouRKC5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751720823; c=relaxed/simple;
	bh=FajfBbIyFZaoqO4Emj2sRX+mRhmdhcQblGwInlSO+24=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BgbLPjPUx066DFKOqZqvZSB6qlbXk1FELQtNfNj3WKkirv7aucvNEcHx6eg2PLcbwVfwbJk/chbohz9fDxRYMzfcjEpJvp7UwF09wLmG2GmxkQnN5MGTUvUmOA1LID9XtCafBdblSBw1JCuAJtgijmcV/NE+8/5DMydaCOcaNc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=B8qMdPxd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 565BQx9Z030441
	for <linux-arm-msm@vger.kernel.org>; Sat, 5 Jul 2025 13:07:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IKd8N3ast/derty+5n3+jvo7
	9rRMBMcTu9wby44QbFA=; b=B8qMdPxdhn8B7S9xQezoUQ4O1W2gvM4L07ywLqiQ
	pNwj4BQCNNL7ME2GLaDgDQlbzBVdH/onfvTsk7VpnW8GmcFC9rd46mFjCUuLLrho
	DktEtCekx2HvvrPlEAA3tysKt5HMTHZOALIK9sDypkC0VPnqPpMI5Dc4iDiIJhnf
	U13c9etLgMfxGxsKoJq9Fo+QS5d2WXLDESpEXDZ0Fzdn/wJFDOgX0sCCFx0uYKSg
	doWCXGRnaE9mzye6te/QhhKAfXdImpqiNIBJaTZ66+Gy4Ujvcec7jpciexBSKywp
	SwGdiMNiWcKUN6+g7dhv6RH2slLXXxBjOH9NV5MDvfvKoQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7q0wvh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 13:07:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d3d3f6471cso271653585a.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 05 Jul 2025 06:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751720820; x=1752325620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKd8N3ast/derty+5n3+jvo79rRMBMcTu9wby44QbFA=;
        b=byXfaHMqa9FgplCqxK06+mWXbLePyMCKNMiuExO7v8kRnudQQBrpRNEV4pTNmYXxsH
         IZEgjzzWj1Ru6IM+eseY8yx9ERpXcABkQSaPfiEdDkS7ZNXl/whQ0pTbiQ+7E/cpI6/x
         ZZ7iazItbzq8euZq5Vf8HqfY8n+gEOGznbW5DsOZgF+YaQJ/a7PgxMSuHQkkGfRWEqUl
         I+LWUE8z4izX1bUJHwVoUEEa0n+07tRcZ4BoJ9oW3hVRiAAysOn4biLyXPvOXVh9mCia
         y2UbDxuRsTTYD+9eAXgBnFldVhatx1t0tmiDdmS79Ile61m7xgay4W+iMniIBWwzk1Nu
         XPBw==
X-Forwarded-Encrypted: i=1; AJvYcCUrcJplpxh/8K1hTZnYDYfb53K4XO3O3TuWUMXbKLGrr1K5o203eWOTsTRm+4OXe4jM6UrohnU9LHVGXGsk@vger.kernel.org
X-Gm-Message-State: AOJu0Yybk8eSze3XGvyDUuPAIeOWp9DW2IKeZvWciBiwLhIhkshcvTb7
	ctEX3cA3gZL+DyxEqpMcAc0r3LEBl74wm8b32AvRn4MtCYGUQW7AfoXYI+V/NLHpCfIWhEBAuDo
	JaQtYDkosf+PxJF11UfEby+M/SzoBOXcLZdJIUYRKRJtrTd8NBnme8Ec48wSquU07iy4B
X-Gm-Gg: ASbGncsU3WecqKBrapKfCx19WRGwFNU9gkFyAeO/9BCtgteMz1iw+jYSX6lhU1gtZDI
	2baFHGnCjTZ5ECJeWxhPIaiWZkjeLBPukF8j0l6TzhBRReZdn3c/AsJo3Uyg63/h7MYBhwXHobG
	DEBoBBQDSrSxruBRXPlR13nqg8uFe52aR9vKX+mgtAnZoPL8vBLVgdEyYick6NUAl/YzXpSPDv0
	llzlNjsXGGrphj7+oacIuMMeZAM1LULIvo9Rf0iA2NJFyiBLf/K6CGvIOmyAXRXH33Y1wtffBRA
	RsSWetRYMveLnqSj/Bt90BrdFSs0T7EGRdvGiuVxfQGSuseKVctNtXXY5zxOrOGtFwZvbNWhTza
	Y8wAk6wgKKJRymSy8d3G9tDAxs0lXcz3Kz0k=
X-Received: by 2002:a05:620a:462c:b0:7d4:2854:7960 with SMTP id af79cd13be357-7d5dcd3380fmr989846985a.48.1751720819792;
        Sat, 05 Jul 2025 06:06:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGl2P4eow0MB8ZATz7sgaNnaIhCr6NxTArKEUe0L5N4/jUT6bdGt4eYeFrdGpjGLiRly/SFRg==
X-Received: by 2002:a05:620a:462c:b0:7d4:2854:7960 with SMTP id af79cd13be357-7d5dcd3380fmr989839985a.48.1751720819187;
        Sat, 05 Jul 2025 06:06:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1aff3f6asm4991761fa.45.2025.07.05.06.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 06:06:58 -0700 (PDT)
Date: Sat, 5 Jul 2025 16:06:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Xilin Wu <sophon@radxa.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Nitin Rawat <quic_nitirawa@quicinc.com>,
        Manish Pandey <quic_mapa@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: qcom-qmp-ufs: Fix HS-G4 PHY init table for sc7280
Message-ID: <o2chuy22dls3y3bsjke34z7pnyzap6m4m34tjxswueshulii4d@d5lbcragrbjb>
References: <20250613-sc7280-ufsphy-g4-fix-v1-1-1bf60744f5ac@radxa.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613-sc7280-ufsphy-g4-fix-v1-1-1bf60744f5ac@radxa.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA4NSBTYWx0ZWRfX020gdbgp51E0
 tNo9SDdncUD2L1IhKRNR/zqFqotM5HlbobN0BClWvE1eHpIHg8wiu/FvlBsJhnqvQFJfMVeLDs7
 xWDqIGldOxLEXdtViesjOH1JU+tiYFj/o4GzxQv8bBc6aZ+Lq+pmbFcK533yf67axYqMrMDJ+xH
 msXnP4Gd9DsHJLCQV7iKTGXWp6EpAHkixLXUicLEcSG1lJGpZnxQ6CGtJEFB1BPS3tyta/nqF8Q
 XcWy408NcNuTldja6B1aGlMeb4ysXg3WKsNDcGVe3VGL34aKul4IrWBBNi3MVmglVgX4FsB/h2p
 3ZxGi+iuLzEpmM9TVRawbOhq9GywvAZ6xFOw5UP5ZF/shXuOO3PaLw+Lx3m+zfQTpPVLqUhxIow
 jh1M9S9DsoOOEPZAEwpQNj9AHe78d3MSRoQ7zq/hOVCRn9LR2sHD2rOm0eufqYYIPeLFMUU1
X-Proofpoint-GUID: vxsQ7Z5P7wEwLMyiJHf5aaX9sNE9vBue
X-Proofpoint-ORIG-GUID: vxsQ7Z5P7wEwLMyiJHf5aaX9sNE9vBue
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=68692375 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=ksxQWNrZAAAA:8 a=vXUHhcYBCYzUoxaoE6oA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=l7WU34MJF0Z5EO9KEJC3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050085

On Fri, Jun 13, 2025 at 10:41:48PM +0800, Xilin Wu wrote:
> The PHY is limited to operating in HS-G3 mode during the initial PCS
> registers initialization. Extra PHY init sequence is required to allow
> HS-G4 mode to work when needed.

I can't find corresponding settings in either of HPGs.

> 
> Fixes: 8abe9792d1ff ("phy: qcom-qmp-ufs: Add Phy Configuration support for SC7280")
> Signed-off-by: Xilin Wu <sophon@radxa.com>
> ---
> This might need testing on sm8150, sm8250 and sc8180x as well.
> ---
>  drivers/phy/qualcomm/phy-qcom-qmp-ufs.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> index b33e2e2b5014d3ca8f19b623ba080887f53e616d..7797be329d75f95c80863e05351d0cf55fdf38c2 100644
> --- a/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-ufs.c
> @@ -570,6 +570,13 @@ static const struct qmp_phy_init_tbl sm8150_ufsphy_pcs[] = {
>  
>  static const struct qmp_phy_init_tbl sm8150_ufsphy_hs_g4_pcs[] = {
>  	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_LARGE_AMP_DRV_LVL, 0x10),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_PLL_CNTL, 0x0b),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TIMER_20US_CORECLK_STEPS_MSB, 0x2d),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TIMER_20US_CORECLK_STEPS_LSB, 0xb0),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_PWM_GEAR_BAND, 0xff),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_HS_GEAR_BAND, 0x1b),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_TX_HSGEAR_CAPABILITY, 0x04),
> +	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_RX_HSGEAR_CAPABILITY, 0x04),
>  	QMP_PHY_INIT_CFG(QPHY_V4_PCS_UFS_BIST_FIXED_PAT_CTRL, 0x0a),
>  };
>  
> 
> ---
> base-commit: bc6e0ba6c9bafa6241b05524b9829808056ac4ad
> change-id: 20250613-sc7280-ufsphy-g4-fix-024542f31fac
> 
> Best regards,
> -- 
> Xilin Wu <sophon@radxa.com>
> 

-- 
With best wishes
Dmitry

