Return-Path: <linux-arm-msm+bounces-62628-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD6AAE9C31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 13:09:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A3F8C7A8128
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:07:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A100E20E031;
	Thu, 26 Jun 2025 11:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gps6Mmm+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D80275866
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750936114; cv=none; b=eya4xUkyYgxr1w4KP9sP9L1Ry93qfuyG/pEijjZS7jBhwV8j9jGog/U5qe+f7XNS/mAx3FrydKKnR5reJKt74WIyFxvK5sNCy2HvBllHmZfF5zKhLGEgL1I3JKuskj3vI4DTO0VhKgBFsGxQrMbrYrE61rd+dyzYBf2s4FjWAd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750936114; c=relaxed/simple;
	bh=tgDbUMq0bPViDmaVEOWRC3V0sWB1g3V6Suh5uci4jrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qO5seNajFeXvnBumI2xUsji7Q1WcE2XmJg94LO6U9lYlWQspL2b62WubbMcfkg8hjo5ogovcbgKKvGx+PzRoWa/6sEbF2WpSh4dfomyH/DC72nCExuq6tsVsjxbW14GSJCBjcLdHBkkP8E2Fpt3ZaqX0lMke0z4ycaB4Wh1luzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gps6Mmm+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9xVpO014018
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:08:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NDO94FYMHnaHttKs7F20hKoE
	AFJH2zviQvqSiK66GDU=; b=gps6Mmm+xm+3TP0gdVGy1vO8M37A+AbGqGkeRzJ0
	AAOyeDRsWf/Pc3DWZDFglCrDwpvJ2HSuEWvQa6GztPba/aLqrl3IoaENyi22BcV/
	Zrb7dBXhGulA8JFiSK4xfD5Ym2GUluQvy6UpmWFlQDiZWnY1CN/uvZNTecnXH//P
	FrVUod3s/9ndkKhgLWSF9YRwlDf0qp9RpHxJqa0N8eA2ApdMiCdxof1FceJpEt3F
	4Wyzs9DX/AYtYSKIRBd3qWRHuKk+UTsWja31s7iEGLuxTpeaZ+LU+ZuTN0W5xWSP
	Jx/8FGFzcCj7OwZujLu/5txJuEM/pvuO/vPg/nx5/3MFvQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgk2qg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 11:08:31 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7d09bc05b77so140469985a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Jun 2025 04:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750936111; x=1751540911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NDO94FYMHnaHttKs7F20hKoEAFJH2zviQvqSiK66GDU=;
        b=wH69M9KY2ZDkMQNvJaIoLzbIPB83J+aWYZqqJUaXGuG/AI9R8VEEZm0h9mLOlGVqn7
         ukZb9+XyY3SgL5Ma1qOlUhj69bJe6D0h8XBSCCT/sKm38tDtTNjoyzvpaf2daYd0ab2e
         bvzV8ZNmMAan9/TqX70enXS21elXRYixTUwGN00kVwhk2rhAzo1VcghhGIsh/X9p9IGu
         uifoa56DPmMpmEqreXzytFncJrFWXLF3xhlyHg45kfIc4kRC4BnDRXJT2oHT40Pps8OH
         wuXk196lUzMM9UitZS5x/XUlTafk+OQUcuIMIaHlaQX4OypzT4RMkpmIhtlWxGeCDC5Q
         zzdw==
X-Forwarded-Encrypted: i=1; AJvYcCWt6jdXFv9kenH5k+QzukDEjZbfjyrmobTpf2Vf5+hHpyWNcaeRgA/u7sPZQc3mobDDKo9QGBdFc2QvQvM+@vger.kernel.org
X-Gm-Message-State: AOJu0YxJy+fCALjYlAjjRHuE39p1UzO1iKa8PRs159K+OfBfLQsxJUec
	AW4F0/ytj6QLxWKYRywWjX2FsdokoufcUWVOzgXq2ZvdSarsy+NqQES+/3oZrwjIOXN6h0A/v95
	5zWfQf4mWTiPSkIgNORH9M1WX5LCly0L9A2NrH0mVPOI4RmSJdVplY3hpkEOg3UbQS8z1
X-Gm-Gg: ASbGncs1YuUV08/HWR0WqpKRRdyphT9A8NKUKlpQqXaOrQhgEXBmlaHClPZNEwivjh8
	sBKum99CQxHMTs4Cz5qM5GRE69wYDjzZw0SvxO/WG/48LD9gioHBOS46JGsB/2o4+a4j0LjNiDo
	22PHekbNu0GBAFqzxRFnYV3oRQGsIgBdkfoTMZva1LoQ7OO95NXQM67QBKpds73Etl3SQ/cGawn
	k7dqapBObsoZ+3ujEXifiygbOIYMCWB+nmkwEiPRgZY1wmSviCQUSyxpF9feiKHaEpQgt41adxl
	5aoPPGW3Fd+SPQluLhG/CYFNywabyVEcJbIztQeidKzbUgZOiSDd1fVlsDNV3WW/xD6M+zGbvky
	VTB1qUR4rMI3A5CKV3+PjBFZ+MUPV18xZa0w=
X-Received: by 2002:a05:620a:1a0d:b0:7d3:f9a0:2c10 with SMTP id af79cd13be357-7d42976ae51mr772836185a.57.1750936111075;
        Thu, 26 Jun 2025 04:08:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYQ7jiX3CY9CqgVQJOm8mOTCxYPh5cLR7q4CRfPMz1xEcvXyNgrncOwmwhAndCAILJnT25Hw==
X-Received: by 2002:a05:620a:1a0d:b0:7d3:f9a0:2c10 with SMTP id af79cd13be357-7d42976ae51mr772798985a.57.1750936105882;
        Thu, 26 Jun 2025 04:08:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e414444esm2545086e87.29.2025.06.26.04.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 04:08:25 -0700 (PDT)
Date: Thu, 26 Jun 2025 14:08:23 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Johan Hovold <johan@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Steev Klimaszewski <steev@kali.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-efi@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 6/8] firmware: qcom: scm: add modparam to control
 QSEECOM enablement
Message-ID: <gqoba4uu62sh4qxapqkhlufxnliatevnsqcxvijvb74tposf2b@iyonh347aext>
References: <20250625-more-qseecom-v4-0-aacca9306cee@oss.qualcomm.com>
 <20250625-more-qseecom-v4-6-aacca9306cee@oss.qualcomm.com>
 <aF0cyOpkjUI4R3bv@hovoldconsulting.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aF0cyOpkjUI4R3bv@hovoldconsulting.com>
X-Proofpoint-ORIG-GUID: WgdAimkyNgTNF8cUPTfo9QmFGipzBRuH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDA5MyBTYWx0ZWRfX0JhLhi1y6Io5
 SBEtkyQFYRqa869xZVfNwdy6TSMArI/AqGW7mIvad4UdtMbzqzyBNra3My+U/4eudyzjbjKd33+
 FgspPEwUQe+ZjZGT7d9gtDqx1sh+lN/5SlP6uPs2vk2HnVLik41HKUSVjskcEah2Eq5+Y39F41D
 xBa9ALcWpP7v+fZ/fPqb1ozTunC8ZeXxM15w7tn+ltNOTrjZ99AOplQs5otR/GmR4bCfiRSLeOI
 SIChpGAJoxkeGvYcy97lB0X0NdLzILXKbsG/7m9ArqnR67QU7hlUquT+jIVTqzprzwGNAs/H5aj
 uNxaJQTwLarvcjGrTSkAZ9hPETyVOgCz/c+pM5LO3qG4HeLl/2JMYexNlbQ+HaAFpvkEuujbMWn
 RHZN2aK+JA3g5y4YsC2LtmfXWW7vNZdD1AFWAPrvkPpOXi+AsCPjOuDdYvixiZDwAEtkSf9U
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685d2a2f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=H1AuHuLdujuPDguO8vQA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: WgdAimkyNgTNF8cUPTfo9QmFGipzBRuH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_05,2025-06-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260093

On Thu, Jun 26, 2025 at 12:11:20PM +0200, Johan Hovold wrote:
> On Wed, Jun 25, 2025 at 01:53:25AM +0300, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > In preparation to enabling QSEECOM for the platforms rather than
> > individual machines provide a mechanism for the user to override default
> > selection. Allow users to use qcom_scm.qseecom modparam.
> > 
> > Setting it to 'force' will enable QSEECOM even if it disabled or not
> > handled by the allowlist.
> > 
> > Setting it to 'off' will forcibly disable the QSEECOM interface,
> > allowing incompatible machines to function.
> > 
> > Setting it to 'roefivars' will enable the QSEECOM interface, making UEFI
> > variables read-only.
> > 
> > All other values mean 'auto', trusting the allowlist in the module.
> 
> I don't see the need for this. The kernel should just provide sensible
> defaults.

It does provide _defaults_. However with the next commit we mass-enable
QSEECOM for SoC families, which includes untested WoA devices. If the
user observes a misbehaviour of the UEFI vars or any other
QSEECOM-related driver on those platforms, it is much easier to let
users test and workaround UEFI misbehaviour.

I can probably add an explicit message that if the modparam is used, it
must be reported to linux-arm-msm@.

> 
> Johan

-- 
With best wishes
Dmitry

