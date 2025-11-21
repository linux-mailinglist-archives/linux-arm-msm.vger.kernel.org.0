Return-Path: <linux-arm-msm+bounces-82910-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 164E8C7BA93
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 21:40:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9EB403A69E6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Nov 2025 20:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0F8F27FB34;
	Fri, 21 Nov 2025 20:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="byTrml6F";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fk+TCOHj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C954315A
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 20:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763757635; cv=none; b=itrLNJbkpshHSfC8WExosK4YHgNnkHyi9F4rtJcQ8SkkmcnWq7VCAIAI5HN4kVb2Ed/3Ut0E4SuXWPOGKoDZv7t1v97pWFvEwXI7M11Ey2uKGjQVQ+YLqGpFqOPV8azgY21ZYAFHX4s6DSn+PLrYJTjAkKViyRM+IkmHjZRGs1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763757635; c=relaxed/simple;
	bh=CeaYPnXEpi11E4tIRMWLororUh7TaehfquaEohMSCgQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=swvj99iP+G3ZOktpAyYfZFe60+ZtGZUGl+kKCJzw2nN+qjduSPE9Xnm2bqr2B0nvZdg7Ebtj0wCTtEGk2JnfSH/QaYWx4aQNbzvLE+v+SLxBkF7eZWMSNJZnX+tnVGJ+PsHzDtnQpEKocqrxeCL4qqCxnpa4696939raE6dihqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=byTrml6F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Fk+TCOHj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ALFvkRJ3139698
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 20:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M2KpO+xhIWNRnALhdVFyNAsp
	CnW41dcR+dwkMx6MtBE=; b=byTrml6FJbkXSL3bblv3UCnZJfL4FnD9Ec3pPAou
	/RTEpNt8cZSBdRcNKflVU0cNK6L3rJBmXtc3LkYNY5EZ0oefbITl2aBdW9dBlMhU
	/D/DrEW8UcoiTjJcpxciGWvwZRb0WMbhAaxRPLo9zZTJM7Gxi5KRZ9R7Kgjbdwgr
	QgytQu0P79MKZmw9elOUpLAcvmL0Kfv7BZ4J4u2eSUAvl4wy544Kv7yQRNtcEv5R
	n6Eg54ugtnC5TJLEH18nad7vMfVDOHImfpIzIdFaKc+2ZPQOIhUEfvK+QCBKUGce
	OSklnfoeAVDvf62nr9ne61j0LtbFNJUZ4ej56Ur2PaVdnw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmppjbc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 20:40:33 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b2dbd36752so735048585a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Nov 2025 12:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763757632; x=1764362432; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M2KpO+xhIWNRnALhdVFyNAspCnW41dcR+dwkMx6MtBE=;
        b=Fk+TCOHjJMDDpqZCnpgNjHovXS9GOWN6OVf7xHdmFvn+rfbAJsL+NW6tpDab8qtygT
         XylgNmqM6bZkIIPdZzaSDUEvVg9LtJkU3dVnZWu5Q1mQk7RIMPPG34i06jmSBM/3fPzl
         8xVe1PJVu98s2RyZ/kh7yIk/y+YXVeAAXcCpTwOkCDsvJXhl4yi+CwqG5s5arA/uL53v
         t8KGXxQ5uM57LfzpkJU28FH8gb25Rx3azl5wVztLRf2NjY3JC6J4R/GduLPRN0vlQsPR
         uG+liKHa196I49RyrJz4CMfdQTt9YBMIQIDzSZj1dwhk9GP15qmyS7dGW6wspD/a7XUc
         ZkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763757632; x=1764362432;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M2KpO+xhIWNRnALhdVFyNAspCnW41dcR+dwkMx6MtBE=;
        b=VxjZvAUZZXBx3wXCwR/ZT4C6DUEfiv3SZst4fxbrHEs5z7adrEm/IqfVLS+4jI+Sg4
         QDZlWsgsxh7HHQ8Hj4Pp/78U7Gsjjs2DUlohNmgABivbXbhQN+6bRhZWeMuDHQjhixzF
         sCxHAkp7ZXpQKfpXqJ/1ayQFUNhXxWFAtb4MKF6iVVEWsOq+vpIEuUQ4sgh1yVAyX0ah
         YX49cRUgPiyuDjPbcF0wU1CghkBKJND3aVNnHGAO0/hRxWeum5dJHsNUio9hboHn877c
         MM8e/Dm6GgrvVjehz/TKdoaj1iRNWpfc+X+r6VRfLaY8llUsoaEbEmGSnImjei5gbzOv
         xS0A==
X-Forwarded-Encrypted: i=1; AJvYcCUkiRn/yXk7QuomvqqXfU1rkgeZwRd7Fvt34CMdAWvOFdz5KGyfVNXC6Gs+gpLFYKaU8tgrRlWjKlldqwWU@vger.kernel.org
X-Gm-Message-State: AOJu0Yyif/zteXrUPSu1pZc0k7oEpaCVAMbsCLOcHh/zZ4rvb80Yzu3L
	gOjqMOEcawCIr4Ke8AeJPKCFvvffg/49/pAx0egDUkaILFNnUVq9YFAooy1wKY3wchbukRNwqHc
	xYeiy/hMA/BOeQWOYn61LJDvgnOGW0gHm0Z1ZG6gb35HDZF5sTQI/r/90ho4KQgfmxDd5
X-Gm-Gg: ASbGncsHLv2I2azrFTFPUARpEQoVc0DIlygH+7a+U4BVUejnpbYGPf0oKj19uNEZ4pz
	PmhLOsYhdfzjGn9aKNbmwKXzoGk5lQC0uPd0lVHguQMGJcmr3jjYX4Jvz+9oTGMkGuUazL0Rodc
	alqMl2rXW1C9gJhX8WP0muPgPZr8NqNROXDw6YWbdqQDE0SLg1vnK4nYby/5kbGMfBGYu048GxR
	GkXQwOZ1ETXJNGLrNARXfDTaWZ/uG04rICDOYCAsCHpINBV6IiwOP0wV+82YcYYcloHRACiEMie
	+mOsDYyAgpZb4/lYlBauE4eJ9HLQ/woBdjoREuBS6OzlXfYkYGaFR9S/ZJ7z3S2PudS+LD2PjKr
	g5aIXfuUd7up3VH2e9ER5HV8ceeIkrpAQ7TMWTLRCXt1ireujijG3AnNiYw9cR3XTuSFs8RDWAe
	RjR/VHJ/gcsVIWoCI1dsUJV/8=
X-Received: by 2002:a05:620a:28cc:b0:8b2:e924:4db7 with SMTP id af79cd13be357-8b33d468f92mr521193285a.40.1763757632386;
        Fri, 21 Nov 2025 12:40:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH9T/gmrFzWRpnIMdUvZ6r/CE0YqcgW+H/6QNQuDyPfFOXwwwgI9gWowiwmcGBJA5G0QLTtXg==
X-Received: by 2002:a05:620a:28cc:b0:8b2:e924:4db7 with SMTP id af79cd13be357-8b33d468f92mr521188885a.40.1763757631846;
        Fri, 21 Nov 2025 12:40:31 -0800 (PST)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-37cc6bafbeasm12783851fa.27.2025.11.21.12.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 12:40:30 -0800 (PST)
Date: Fri, 21 Nov 2025 22:40:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] clk: qcom: rpmh: Add support for Kaanapali rpmh
 clocks
Message-ID: <gxjidpjoc6h2rvuqpv2wjynumj6qfk6ktznte6igem5g4gt4ai@ukflachqlg3i>
References: <20251121-gcc_kaanapali-v3-v3-0-89a594985a46@oss.qualcomm.com>
 <20251121-gcc_kaanapali-v3-v3-1-89a594985a46@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-gcc_kaanapali-v3-v3-1-89a594985a46@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: G7rooGsafoKfXigIBJHOFaetUwRY3sxP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDE1OCBTYWx0ZWRfX9gbNH2ABsAbF
 7deCAttFmf/tHBBSdJc/NwYRKU0qkvlcnV4EYlqAKwZiirpHE/ItrxYEEOED69Zdzq0PPU0gknR
 CQx3jQ1aJIsO3Jdw2UF1WB4bc0M85DqgoL1c08g5R11oWLL8TgGA+ToZsaKoAMnJvfqzfhELoQi
 90mraiWsnlvJ+y399bP9kBqfoEMk+jkGHo0VY9oSvW84E/0YPHwO6B5p31jmiaFtTgQu1q7p48e
 G9hQwkWjpmAtjsc6bB7/bufAjXogYET6EUbAQFIDqb5TbwOAfOlCL1wSdEv/O1XANOlamKp1nsg
 4X1346dNh0rYaaBTuPZz1bpy3+3NCtgiRGsV+LM1I84GLyEm44jfRBpPNKlu932I8TKBZU5CxKQ
 BU1YTBaDFaNOrhH/RV3nk6knjvpd7w==
X-Proofpoint-GUID: G7rooGsafoKfXigIBJHOFaetUwRY3sxP
X-Authority-Analysis: v=2.4 cv=CK4nnBrD c=1 sm=1 tr=0 ts=6920ce41 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=xhHKJl3AFlBKMczUpUcA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_06,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511210158

On Fri, Nov 21, 2025 at 11:26:27PM +0530, Taniya Das wrote:
> Add the RPMH clocks present in Kaanapali SoC.
> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  drivers/clk/qcom/clk-rpmh.c | 41 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
> 
> diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
> index 1a98b3a0c528c24b600326e6b951b2edb6dcadd7..c3d923a829f16f5a73ea148aca231a0d61d3396d 100644
> --- a/drivers/clk/qcom/clk-rpmh.c
> +++ b/drivers/clk/qcom/clk-rpmh.c
> @@ -395,6 +395,18 @@ DEFINE_CLK_RPMH_VRM(clk4, _a, "C4A_E0", 1);
>  DEFINE_CLK_RPMH_VRM(clk5, _a, "C5A_E0", 1);
>  DEFINE_CLK_RPMH_VRM(clk8, _a, "C8A_E0", 1);
>  
> +DEFINE_CLK_RPMH_VRM(clk1, _a1_e0, "C1A_E0", 1);
> +DEFINE_CLK_RPMH_VRM(clk2, _a1_e0, "C2A_E0", 1);

This got better, but not enough. Why do we have now clk[12]_a1_e0, but
clk[3458]_a, describing the same kind of resources?

> +
> +DEFINE_CLK_RPMH_VRM(clk3, _a2_e0, "C3A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(clk4, _a2_e0, "C4A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(clk5, _a2_e0, "C5A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(clk6, _a2_e0, "C6A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(clk7, _a2_e0, "C7A_E0", 2);
> +DEFINE_CLK_RPMH_VRM(clk8, _a2_e0, "C8A_E0", 2);
> +
> +DEFINE_CLK_RPMH_VRM(clk11, _a4_e0, "C11A_E0", 4);
> +
>  DEFINE_CLK_RPMH_BCM(ce, "CE0");
>  DEFINE_CLK_RPMH_BCM(hwkm, "HK0");
>  DEFINE_CLK_RPMH_BCM(ipa, "IP0");

-- 
With best wishes
Dmitry

