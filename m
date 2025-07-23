Return-Path: <linux-arm-msm+bounces-66297-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 869B1B0F2B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 15:01:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9F4B71C84959
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Jul 2025 13:02:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A04651474CC;
	Wed, 23 Jul 2025 13:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hpa0DRnu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DEB27462
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753275712; cv=none; b=sYTtQGqtfFP1NS0SvHNYBmPDqtxkRpVr/tnFmRVtY/FGY3SGJRBvjfN7MCaDc6EjQahdb19VL8O7mrVg7EmcSzNN2sxak9QFVIEj4JwiHONgCzA9QOqYlvvlOdHdq33Udvg1PE+8tScY7AnqUJWg0Wo7vCnPA2w3G9LLjAipCiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753275712; c=relaxed/simple;
	bh=dRAk0o72e+X33KIq1LpoL6MfpiBTQz1RGTe2fzqE5FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YML/9T+6mNou7+xgYVTIwVBFxtNPiBLRq047CQuhAGZf3PQ9FQrWQr7aV0DPJjBp7Rqd37WO37xA5rBwmkz1uMhHf9YS2HO/0LmsaDIVotWQcWYmFsrkSBVaD2sN6MPedYdLUJn8fRsFwSlrR3QXPB34+naBybwFH87rqJpXEbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hpa0DRnu; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9NHIQ032313
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1wPevboyTw5NwvNz5iHDyoVz
	DX1UybG8R0FxydcjI4w=; b=Hpa0DRnuOU88PnbYNQ38/T3Mu4FVgeRR/v8904uk
	xJdfCBisz64OSOHu5mc3OGS8mxV8yzgE7wLlz7eMqf1xBbfPIvm1PbpD5jwRtwR+
	V9qEC7OMlmjIHQRl+8D/m/8VB9KKBoVzLotuCrgfLHQ/59hkyth/ydQJK3jN0GQQ
	cp6PvlPJP0fBUZmCLy0SuE4ro4ZfQ7yJx29YahA7BUjSrslvMC41BDJ35xp6P2RZ
	lynwOwepUcEWlseWadWTF3wzU5DESPvNydujJ8TzrqqJmSNY+J3aCocphGqYxIlG
	1d8TRBQVv3AHNCuqtyDGOcQsVu2UO3Pbkyb1CpLKSH/UXQ==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4826t1cgt1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 13:01:49 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-421e4901a49so316961b6e.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 06:01:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753275709; x=1753880509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wPevboyTw5NwvNz5iHDyoVzDX1UybG8R0FxydcjI4w=;
        b=V6ya5ncEq4POZNqjB0cxQU0iKUqYolW4fBZY4nc8He5gSBxHM5mYiIkFTzOSOF2i3s
         HTMBgeY81Sm5zemflYZtH5TCT88Zuh+SUum9Uap+9Gy2Yez7l5MUx2rKbXUR5k2DWB/s
         C5Tu53qE/S9Tc5I87E0uAP5uUCpg+9lfnd2bsTt1j5NgRmlyjkOXA2xBqFli0VqD6HY+
         Vkniz8DqOPTVBuxY544YcZsxIhC+AVdEQTNbcA0jQhfuHLtqwnJ+zejohBBi8asNFJqP
         D188B0A9v7n8S8zhAjtjVCfvxBXWSZmpwsWUmi1ny7oQqg/Mef1ZKx9iDrX9XmkGO5NQ
         OpUw==
X-Forwarded-Encrypted: i=1; AJvYcCX6OQQJ52J0jkU9xMxaX4g02QhDO1klkoug2bUn46KcnyVh2a0CF1bOW3ux5w75cID/H3wXLlbxlkKi8+AD@vger.kernel.org
X-Gm-Message-State: AOJu0Ywv6eSCvHpYjyxgFKFI7CnJjjgJlMLSh7VneoaFLefcVUTl7MDg
	xRUVIfi6xboDec0REwm65gZ3fzL0mFf+dMmPv0O9r9oQ8gUWBv1bXfJDHUfdjLVxCxlsT4Pkca4
	x7NZhvHcEZswiVPMitR+ljL4XUWiiIC2q/ATwEM99af1nQIN1je2vj9FXRNICFhTBAniV
X-Gm-Gg: ASbGncuM8jBZwK+rQzJYo6aKXmqLrK6Qb5UHa+cDnaIbILZYuasTcJ8eJ/pXpZp0NWn
	NVSo31T4Lq+YF3xRdbrfcGSMXKl4mp5HNY4Ld/95pvrButc7SSLeUSUktldP+3K74w6CVWwNfLt
	TfxCUj6Lb/EVh/5hDQbNHsdpDrd80lI9u0/5AnMrD/QRtdAfB2uQvqgDxlc7x7zDHe8okl5JnOS
	jzCRuxn7uG35iWYlx0GWPwavg1GiLAIfWPnzkvfFX4aKL9qpG87kPYlzEcAHn3j7/i2S9lWN0c1
	fWXFOi0WpieSh1VUSVnGrOYGQEOAK/aQQE3XVyk28UICw3OfopdZNH+CP2hL7J2ILT6cDb9CQtw
	05LQK+w75qBK6T0Vf3Mcm4LIStOM1yA7E60ud+JGDoYEq400cLVcx
X-Received: by 2002:a05:6808:2203:b0:406:7cef:46a with SMTP id 5614622812f47-426c642f047mr2288836b6e.19.1753275708717;
        Wed, 23 Jul 2025 06:01:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGneR6HtJeJALFHOLFmNSXyrHOofiM8HoHdB+oxIXAcXdndJc6GaB0Ve8NkfrbBMs8XEHgUuw==
X-Received: by 2002:a05:6808:2203:b0:406:7cef:46a with SMTP id 5614622812f47-426c642f047mr2288580b6e.19.1753275706737;
        Wed, 23 Jul 2025 06:01:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-330a91f12b0sm21241281fa.98.2025.07.23.06.01.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Jul 2025 06:01:45 -0700 (PDT)
Date: Wed, 23 Jul 2025 16:01:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Renjiang Han <quic_renjiang@quicinc.com>
Cc: quic_qiweil@quicinc.com, quic_wangaow@quicinc.com,
        Vikash Garodia <quic_vgarodia@quicinc.com>,
        Dikshita Agarwal <quic_dikshita@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: venus: pm_helpers: add fallback for the opp-table
Message-ID: <k6umaq7xrfma44vm75ea6m7vqd3hn367xdymsjylp3zcqn5vmd@jbvgdknnc7ri>
References: <20250723-fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250723-fallback_of_opp_table-v1-1-20a6277fdded@quicinc.com>
X-Proofpoint-GUID: cVR4JCBuTLWWexZtLGryzhSvoRHzK05K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDExMSBTYWx0ZWRfX3N2J92re4VGX
 6T8rnYa+ZhKu1eYkGewzgUTZyI874nMc1r7pJfvJ0wjnQXqtulNccLa59qRtZ4UGy5AeP/xpoVm
 lVkVfPCtH3AjajCjeHC+3viQILXxhcH5epKppvEkgfAy7TxnuPWf+eGaG6Vjp9ZmUo5/zXGFJ5F
 KMWNucPPOp26UgaXCgqlHhEb6vNfxTmf6t5Q1QptSE/UYph4RtBO1EwY10df3NYfrd03oH47X1y
 4GQGULdT1GNPy2RR72SoCYUubfJMv2AiAKc2LulVfwQ3cbuAzmBP6gKKdvJQEzZV5kr3iSPbpnT
 5BOLl2cHQnuuYeEMEtjU6pwnCTilX7ErLsYyzvABRhUtFMTxwyjO08Tnqg9B88WvezUCB26wCD1
 Ai6/W/DwLZ18SPi3SCHV15dVQ/a9eX6K5q1xUGZPCrEwAthDiMZXVr94muRvse5rbPlwIb3M
X-Authority-Analysis: v=2.4 cv=E8/Npbdl c=1 sm=1 tr=0 ts=6880dd3d cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=iWKRvkjQqEvONqlByQsA:9
 a=CjuIK1q_8ugA:10 a=efpaJB4zofY2dbm2aIRb:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cVR4JCBuTLWWexZtLGryzhSvoRHzK05K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015 phishscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230111

On Wed, Jul 23, 2025 at 06:26:02PM +0530, Renjiang Han wrote:
> Since the device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX
> do not include an opp-table and have not configured opp-pmdomain, they
> still need to use the frequencies defined in the driver's freq_tbl.
> 
> Both core_power_v1 and core_power_v4 functions require core_clks_enable
> function during POWER_ON. Therefore, in the core_clks_enable function,
> if calling dev_pm_opp_find_freq_ceil to obtain the frequency fails,
> it needs to fall back to the freq_tbl to retrieve the frequency.
> 
> Signed-off-by: Renjiang Han <quic_renjiang@quicinc.com>
> ---
> Since device trees for both HFI_VERSION_1XX and HFI_VERSION_3XX do not
> contain an opp-table and have not configured opp-pmdomain, they still
> need to use the frequencies defined in the driver's freq_tbl.
> 
> Therefore, if calling dev_pm_opp_find_freq_ceil to obtain the frequency
> fails in the core_clks_enable, it needs to fall back to the freq_tbl to
> retrieve the frequency.
> 
> Validated this series on QCS615 and msm8916.
> ---
>  drivers/media/platform/qcom/venus/pm_helpers.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)

Fixes: b179234b5e59 ("media: venus: pm_helpers: use opp-table for the frequency")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

