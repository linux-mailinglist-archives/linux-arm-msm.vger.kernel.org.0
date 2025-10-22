Return-Path: <linux-arm-msm+bounces-78353-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9308EBFCCE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 17:16:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 501723A1F28
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Oct 2025 15:09:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5A0215A85A;
	Wed, 22 Oct 2025 15:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PucaDMBY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5F1347FC1
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761145772; cv=none; b=OTLRgiwHkGWcqOt9FZ0c2fh698efE8hRKhNu1x5BYWTN3nH7qjHuwCWXeTDtaeNSGrg76uwUaVnBZ8QyqfdDf8RfDy04IUN/NUctGd/S8p3v0nj5XHz0CKDL61EOCieB3ZzAZl7Wx6AkKqaEvkLz+6jofdCUjutNBnNrPSPFXiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761145772; c=relaxed/simple;
	bh=WMIMwGu7v18FDKKJiIcw68EOolnjXiaG0jHWCuQ5J18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iDgzQt2MGf3Bk6OZ5LHh3HYs9Kj8hCgl9xbAefOFy5uL+y2o7BeQJDib9CtQHgvQIuS2oiogXaBMgo5v0K8Pxf5s48gcEVC+NUdiWHhQFLIldn1YUOc3bd8SPEh5xuXOJKohH7UqGiFRVPIIYFsN+qrjtk3kmA2n4f7jW1QmK8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PucaDMBY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MF4AiD012332
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:09:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OdkI0P3aHIPeVo9m2/RE25vv
	O4vI7yj29ODppPkFbYw=; b=PucaDMBYv1WK0qPWpZF2Va/3Q8GuClfUVNvyCe53
	LpBRo8eaLnoTy5QP6Exyow+c2KjQR9xooGIIYxHbZqlubcJNQPv1fjjz5q4AAy1D
	Y519D9hwHpMZNafATAmPUBw4xHcAarkkZDy6rga/c4+U3Q07hiOM1YCuVCX19kFj
	/Onty8pKYGqa2/lOdSSTITDNEes4Gc/12DXwncaq+LXkOs7n74o4TyJWDv0I8Nde
	ekb6BcK88JJx6Congmc9y5HsA9F62IRoFHEK4YVYLBwSfKspLFIqtWkJfvIiJQlL
	X72I0OIDhq2phzCU6LajcodLH3qfqF+QOlX15sOIWa9HYg==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0jxr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 15:09:29 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-92ec2826d66so15615402241.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Oct 2025 08:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761145769; x=1761750569;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OdkI0P3aHIPeVo9m2/RE25vvO4vI7yj29ODppPkFbYw=;
        b=VUnc4dsp9R1Utubvwrg6SrLP46Q1jViNxsFwuRx/fnbNJ6JcI9Gbs2DkbY7bV1UyMv
         KMtbP4m+Br4/Xxh3mLnZuDve/2/VVIzS/xQN5LKs9DjpVVohX9CMPs3grSU+xxlyBtmQ
         BWU9wIQ+Xz5iL6F6DGsI+/zsmcqo+Inr3y24Wxa1eEojXmUYJ6hCXZi5T6vURoMy/9jd
         C3+172jL+cCs3JIe0GmDmUvQQGar5x3xtWFR49NFkdt7UyLXTTVfSmlp4UvO3GwwVoMZ
         Fv0yYH9ASodhxQEz3aUWxA+8y2A7oqzU/hOYGilPJH3gfvtisxaG1d27j42QKaClHf9S
         +bww==
X-Forwarded-Encrypted: i=1; AJvYcCWpdFPAbD6Wix/+vjG29AP+IGQdXCjAFdIJtKhQ6Hl4S3JlMs8AE92GpuG+wX7sUlOi6Q2U2GrtcnNYsL09@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1cnp4stOtj7lCPJQlE3ZZJe+uzxi1T6s8Xtq+DgSr1LNgr6rU
	qJd0TR+SmTOybZ4/Guf2pAuhD6NAR4nRCjM6FeTn+mVUJMOokkyanK9ICjr0K7uy8I1nvGsTooQ
	eK+8qQZkCnoh1UxUmmGiv8zON/ygkBbhFc4KNCyUcVJO1qZi7ziIbPbous17Dsm3Bk/aM
X-Gm-Gg: ASbGnctjDQ22JrQfN77D/GqlcSg+989UuDuqvsLmaQKrlGMai9gKpYWPN9BQ5J/o8Tk
	Z7PS6emlj93RBT/Hscixw/Vy2PLgC8JORPWT16y7oqSNj/FiGToDheT+GBRYFE9SeUXuEf43Q5L
	3HEc/TlP4gYk9Uktk07Jb7SKV4q1Lac3CEKBOklYeSOAJWQZiYtiCm509LuFLoMTzEnJyKNI69g
	AwmMQsa6BnyRTJWORbas1ZEy7EOZn/0MYKGbleRCEbSglj/VEgP/hg5TBRo8dVwmwtnoyIMvAtT
	GIgOvjI/XVl75S6D15i8B0COJHuq+nJWYZSM8ZE/XCccno5RGNt2ZdVAztJqs/njFegMEg6ezBx
	P0+Z1knlEZHbDWDXhJ4C7oGAiB56nvIS/2kmKLZFhyTqhHbFfy1MnyET/biUJnXQ/4UDDNvpway
	/x1ms9EpmGU8Q=
X-Received: by 2002:a05:6122:459a:b0:54a:a048:45ae with SMTP id 71dfb90a1353d-5564edeeb7dmr6086298e0c.1.1761145769023;
        Wed, 22 Oct 2025 08:09:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTW7Za3xYid8rhr6v4z3vSiXm/haXNAQidSfHTGA4CeMN+hQb2XyvJwGutTkYmU9r6673nbw==
X-Received: by 2002:a05:6122:459a:b0:54a:a048:45ae with SMTP id 71dfb90a1353d-5564edeeb7dmr6086265e0c.1.1761145768577;
        Wed, 22 Oct 2025 08:09:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-591def1ecb3sm4735512e87.95.2025.10.22.08.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 08:09:26 -0700 (PDT)
Date: Wed, 22 Oct 2025 18:09:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Luca Weiss <luca.weiss@fairphone.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: camcc-sm6350: Fix PLL config of PLL2
Message-ID: <qanawqrk6izypwmmuvezzff37k66ptv2vlbdwxs62dqx7igop4@wzkz76376jli>
References: <20251021-agera-pll-fixups-v1-0-8c1d8aff4afc@fairphone.com>
 <20251021-agera-pll-fixups-v1-1-8c1d8aff4afc@fairphone.com>
 <06aec134-4795-4111-801a-469afdd8977d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <06aec134-4795-4111-801a-469afdd8977d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX10GgejdgbB+7
 lqeTrxX/yAHajY1DOc8lxcMjCA1jT2JqZw14+4Q/JUtM0ePF+3Z3iT4ZXtb98yMXyVFdTEhbGJd
 YBRuksfxSHZpB0nQHU1PFaG+3sePBdncWH5+dC5pyREGZHOxoenyhZ183iuLbMFDLHlv89RilHp
 pAtU//w23RNQqOOG4kmhrQJK9dZ3wjUEA6gAOZj1dB9Gpvn2+Ay27FpOxq868WSMG7+5x8tr+bL
 hM43kTbo1033MmR1We2RXO+i+zDusfD5hWgScQxHh1v4PbAorM1oF7jmpUB3N4/TEgSsEk1mgTr
 tfcOvjOzNoTV53NuT4s/QBCJKAcqV+V61tIEWxSTxuyQXdYFlxyRTWuaxbYW/embuhN76uJJol7
 EJvZP9an0U8hr13rAYpgcva2rON7vw==
X-Proofpoint-ORIG-GUID: eXQhNQBmrZa4T-E20wd_7HTTF881LULv
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68f8f3a9 cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VhJX9ptpD_-VFgrJVx0A:9
 a=CjuIK1q_8ugA:10 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: eXQhNQBmrZa4T-E20wd_7HTTF881LULv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_06,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

On Wed, Oct 22, 2025 at 01:19:16PM +0200, Konrad Dybcio wrote:
> On 10/21/25 8:08 PM, Luca Weiss wrote:
> > The 'Agera' PLLs (with clk_agera_pll_configure) do not take some of the
> > parameters that are provided in the vendor driver. Instead the upstream
> > configuration should provide the final user_ctl value that is written to
> > the USER_CTL register.
> 
> This is perhaps wishful thinking due to potential complexity, but maybe
> we could add some sanity checks to make sure that putting things in
> unused fields doesn't happen

Should we just drop those fields and always write the register value?

-- 
With best wishes
Dmitry

