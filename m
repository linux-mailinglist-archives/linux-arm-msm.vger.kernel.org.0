Return-Path: <linux-arm-msm+bounces-67190-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ADCB16610
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 20:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E4C991688B9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Jul 2025 18:09:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED0F266B64;
	Wed, 30 Jul 2025 18:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kxFC/qMW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C581DF98F
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 18:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753898985; cv=none; b=CAaU4ALVjO/dtETtLQB+Z1QeDsmBcrniJyzuCuQK0IBzkd0a47bLYNp5z+CURdqxig/NQ1vBYFb/qjU1gzUyJkRXtmv0HlDBKf4tp4kpuAXXcPbY5FQeP0mrKRmc4FRv40KBdFPppBc1AZw+YB2AaZtfXZpdXtM6VOCMQc8MV+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753898985; c=relaxed/simple;
	bh=uysVQLDbrNrO2Dt1d2Mtse/kMVt7UURpOikxiU2uC7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TObJVn6p/L0CQqAGtJ+MtXzsJBsLsGHsWVL5znlgy1cO+3bG+4KYTUgbArQ4f1eyyQS5KO1ZJUr0a2BjusEK/nMYWlt574P54qfsIicsloJp32rJ6QgPLME3tun3+emOM6903qX1GbgfSuCQOKwQ6UH0onHGu3aunsV4GdX73SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kxFC/qMW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56UCbBK3012755
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 18:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nvtzYg1hl8x/PPGrm3YFV7F+
	GFXE8yyZC3xOnR+O4uo=; b=kxFC/qMWH5RhBuGIQfIVYvRLv+aomLMieSlJGYsU
	xig53nUEDThyVhZ06mgZJVfStk6i5zT+GZ17rgL/vruU8hf08feCb/o06DnKwrnj
	PgX2apy5TW2ejJBXMqzk6E0JWyL/pxbSkfjIKj5WSRL6xOiJ9UO+n08CFXnhqr4W
	/Nw6+U26cU8l0kGp4nZPwAL9giQ6c2SynBcVXPo/4DFinJEDXgiNypKwzQkn5YyA
	wW1JMmfLi878vC1rNsATsxKKtT3EaKgZLomoGrAe0mu+SuhoR4fSCOIl1I4b20h7
	GuGwrfAW/GHzlrzWmC3G4dy1NNJjL6apHngweFTCwDXqdQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pbm4qwh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 18:09:42 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-7073f12d546so1165226d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Jul 2025 11:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753898982; x=1754503782;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nvtzYg1hl8x/PPGrm3YFV7F+GFXE8yyZC3xOnR+O4uo=;
        b=QF+DyBaxCKbBPdFFpdbRS0ud6z2YBYugjCVqRZ64Rcwp1oJCX0RbsNB91uA9FKhOAM
         PvHY4gBzHvQ1sD6PyetTxVjo09qsuYTttdH++FMN7JxkYjwNSgjWFf+Vr7kLClcp3hgJ
         SFTr/pAMB1PuH1RVToyXRi1SdEjFLeXWcktO0zDzdFu/8mVp0C014+QgGiDEm+IUDpXA
         e/af/GSDdPHQXe7El552LQ334pn6+WVtrhBG/TL6LE0DYSgofRUBRXa4W4ix/TzWRUXf
         HBXaQasmidp6JN5pem3mOugO+GrrwZ8JiOcT8eP7d6CEQ2aaVVbEXOZRF72fnHg5Lnp2
         AIrQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5LX8mbaRmivYyspyX97IxwpY/dfMHMgMCYOX7PJEQlyfBFH+N1JfwI1T4d8IlV5eZhMJWmNuC7tHQKT4v@vger.kernel.org
X-Gm-Message-State: AOJu0YyL3ZkVzGtPBuPCR+I0THq359WAEU6fvDON6PUeTWBRxKLWGYBT
	0zFQzAYFyq29sLAIByKkDEsJ3qmLBvRfgnIi1VJL5OaaMAKP3WXuLOz+rFrfbe3RBZMZY4bVCsY
	E1bLGsiAI9tnBsfeI/VVD58jHWawoaRoUc+3cUoINGlZEIXLvWchH0jJvf9KQsOKK/FDL
X-Gm-Gg: ASbGncvfPsmHT7r12SM0e4ldIfcUTtQhZzqmLaQRMPeQq7Lg2CgpuQc/6uyVZcgmzsH
	w9T+VJvL26oT7JyK9bRbNg0O44hOtNEqyeeIn5P/esWLuekZ6l8IyWrz0w5/UJDcsI2ekP+36ts
	74ubbX2aTzbZ6SAFEBFAXZNuVsi3SlakRuq/JILhNDtyrILRZvxGkyqR8NO/IlRpBfeYz0oo5u3
	rQGQTGMGqZxpcYnioTqljIrpSAgZZNuKAGWiGF6TXjc5+bVrBLi+pwXeg1SoSKaN4yip/pw/Nwk
	dysKZKZ7RW0sF0oxI7ydIX9G3hEwqZ6QUKf9u1dPcqA7w/QMkoY2tAzHWU5ThnfiKTlUnrZZZXp
	Inb9hqho4R2hrcnOgUoKeCDWvYOKKM1QbCLSsQFXAQzaYC1Uy72Yd
X-Received: by 2002:a05:6214:248d:b0:707:5fbf:26d2 with SMTP id 6a1803df08f44-70766d59498mr60197246d6.2.1753898981393;
        Wed, 30 Jul 2025 11:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJt6gobol1sslUNlmAmCuSnfF9g1pOZQ34oC0tL/it58uEDXC0isYw713JWBv+Uf2VQAj2Bg==
X-Received: by 2002:a05:6214:248d:b0:707:5fbf:26d2 with SMTP id 6a1803df08f44-70766d59498mr60196546d6.2.1753898980852;
        Wed, 30 Jul 2025 11:09:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b63375a82sm2251205e87.134.2025.07.30.11.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 11:09:40 -0700 (PDT)
Date: Wed, 30 Jul 2025 21:09:38 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Abel Vesa <abel.vesa@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan@kernel.org>, Taniya Das <quic_tdas@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: tcsrcc-x1e80100: Set the bi_tcxo as parent to
 eDP refclk
Message-ID: <qu54efmofss6247jdnnrsxvuojlf6fyex4h4c5rzrinbtznwin@2vysndddddy6>
References: <20250730-clk-qcom-tcsrcc-x1e80100-parent-edp-refclk-v1-1-7a36ef06e045@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730-clk-qcom-tcsrcc-x1e80100-parent-edp-refclk-v1-1-7a36ef06e045@linaro.org>
X-Authority-Analysis: v=2.4 cv=LsaSymdc c=1 sm=1 tr=0 ts=688a5fe6 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=wC1PSKU0_OW3W4-qnQoA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzMwMDEzMSBTYWx0ZWRfXy1IXMS/3ZGe+
 zqjqBun9n3HKqrt6WS89/geRL8kpiRD1Wt32JTppDwrSTQm1xetsQ1JJfvkmZqbS2FK5vdKEb2E
 jtsJhJDKKB2y0QzGPatr7FoFTdlXT8wx7LSCae8ea8iOyzTiiLjEurBbHEr5yK5ZrnhJXx6ThXp
 9tNBZDNf+HPJIK9+tC8/xvMCSs78FM837WNnON20BnO48946ncrF4TtsxyZHpDqDgDVa7clkh+I
 JJPRa7GXvMtJJKHL0E1Il57uttGqV79ACptdmEJK0e63BkxO6wSAtJnvVF+jTvc1udTW3SfxxP2
 cNIRQatw5XkGWErTZOHjhP6J8KDyYkOFTNgK33nVZsZ+nR0w8TJAw9esDKm/3ULEnlNeoRU+Kip
 wNhVuY2oOnRTENUqtPPS117udI8P91rpEBoE1Fo3wEncXTUd3zQkonO7uFl7L7+BYih/Q0Ls
X-Proofpoint-ORIG-GUID: qFoQyno2CpnhdZlgNYB4XJJ2U-BD56xH
X-Proofpoint-GUID: qFoQyno2CpnhdZlgNYB4XJJ2U-BD56xH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-30_05,2025-07-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=583 spamscore=0 phishscore=0 suspectscore=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507300131

On Wed, Jul 30, 2025 at 07:11:12PM +0300, Abel Vesa wrote:
> All the other ref clocks provided by this driver have the bi_tcxo
> as parent. The eDP refclk is the only one without a parent, leading
> to reporting its rate as 0. So set its parent to bi_tcxo, just like
> the rest of the refclks.
> 
> Cc: stable@vger.kernel.org # v6.9
> Fixes: 06aff116199c ("clk: qcom: Add TCSR clock driver for x1e80100")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  drivers/clk/qcom/tcsrcc-x1e80100.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

