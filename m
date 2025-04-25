Return-Path: <linux-arm-msm+bounces-55742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EF5A9D206
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 21:41:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 462A1189D0C9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Apr 2025 19:41:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D36A21ADC7;
	Fri, 25 Apr 2025 19:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="igVIqDtl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12D6121ADB9
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:41:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745610092; cv=none; b=XIbuSR7M6OV5dSo8aN2Ha5ris/qa+Z9K2nUGhba6EE82+GRFaXScSOZWq0qlVEcnQRFg3d0Lwq3+4+elwIH36Cr8wh1f4OElxSvkvT6/f4CgHLuOpwRBvJvhLaRsLlUMTtYehWmia96qEIltcikrwp/xBfjBuU67n5dybw1Az2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745610092; c=relaxed/simple;
	bh=GFu+i1orFNKNYqHrn4ARi1x5CfHjfv9YX4NAVMnrsN0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRuKzbhNDJOCr/REltCZV8BOa5UDp652q02lYqcrzF4qVM2rM8tS3H4Re2yT7jyeIYS9YP/a/GJmfh4bxFXdkAjIkLb2z7eMZfk5Qo0TxmyFQd4iKOzWHTMLynPK4VG/AH6nClC3QI9Owgret3FE5s1ZJOevRDlqGVK6KrraTlI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=igVIqDtl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJwju011493
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:41:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GL3IxQbhqkxUKygiLbe+Fwsj
	kd3BgGNhLCaIxaMVpwQ=; b=igVIqDtlqvStpH+Ee+it7NLTTTa0+IeKzLD1wLbx
	MHwWda4yv4boL6lAWbdBSxyO414TigFiJ8XmHYSQv6ot55IcQr7t5biJ8ulue4ZR
	WwudKym85y7tLLx653GOgodNqZq6308tcQRnjjgCF04jG/+rSKSQ+oTXelNocw7u
	8Kmdmr7yHVvdCvAxvMrb0tKYzYTCUS4wXQ1azwTh/pg/5pTv0oCi3TweVEOE1XhD
	ugeZRUaa1QvOrChMc4iN6YK3hAfnGtRM39pDZMyS0fwzclCYmIBzcDGG4QKs8qFB
	O10b/WjPZ+VQuJ6AaRM6oevvsAsuToQ1WpMiAQXY9A6O0g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3t2c9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 19:41:28 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c9255d5e8cso461259685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Apr 2025 12:41:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745610088; x=1746214888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GL3IxQbhqkxUKygiLbe+Fwsjkd3BgGNhLCaIxaMVpwQ=;
        b=JwbSXxfXNEn/5mnLuJh4S3OsF0NSu/c4VrB1bIhItqnerR8UhfCROHVXfU95Bd6u3u
         xbkj9d3IANWIg6fPk67Z+GzB1xy0k2llkW3R/tpuyks23BMeuCpMWSvRH0rmt0BLwTZ6
         WhDI0BPr2CSPrbGuypN07jRg94G50cbdp1TL4Rle/fJ36DFIJ1/Xyl/48ZTCHfrdWDCk
         p19MJ7enc+jbhMGx7dXkcoPkdM21LYgjXzEY7WCYtb+Ph7IxSq59NguQASnvZnYPL0nI
         mRNc11g2n2Sh+bKrQNnz7YMUg+tuJCtLR9itxvADbV2zQZu04R9hHNWFKfgQKIP4WMl5
         cywQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCQXMit+AaZKWoohEwDsg+R2WCtXDeXxtIro056THx60MLNhZ7L0b/29T4Q41rtUd5qq1sD87TKUejYmrm@vger.kernel.org
X-Gm-Message-State: AOJu0YyspdkrpXA4tXkOQJgZ38Rbvl8TozwZ2v7bxOh1MhKeNw1djadj
	6UOvpkzvjaLLm/SJtdyyChb3080lsAYLMQVFqKC2TOcsUAnKRuAtB5vQdBJgFklXshKUQa4LqbA
	/RCZoTtrJUT/RrhddmVauZF3MeKOK8qeKVn3C4g96Dcj8r7tLizE8oi+2mXZ9R7H7
X-Gm-Gg: ASbGncuFavHdZWZarP9tMUyshYQ0+xLnyfWMSiB62iHIgACKJ/Mf4m8Kc4k0jQt994S
	0nKB5BRLKp7fkMZikIF4KW/GA0woVBwueoABLGlFMpEAEVkqx1tKsYTH0Ul8hgLOlrUIvUZuOhg
	widPB7VxkpOKZf141MgLnvAgtG8YI+xZUkSeFKZg2HDZanfHKtvw93er7UXkXw4+OhN5tNrthcI
	whA6jh8TE5UEIz8Sz3RLhfozdexIXU/s1Spa5YdECWNB46j0+eP17iVgCy8mACmHbHz48SMOSIA
	fDNTRjyM4NnsUw/Y3MyRZ5ZZq3bbxe8nyiJR8on8CCq+ZY8gNNagdPPnCH1UwzBMESlckumCHxI
	=
X-Received: by 2002:a05:620a:24ca:b0:7c5:dfe6:222a with SMTP id af79cd13be357-7c960793e41mr547095885a.42.1745610088067;
        Fri, 25 Apr 2025 12:41:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9sXFC5qtgaAH+0BpznCYCLWqca8xyr5lGiw9XprZM90nD/EbobhyTqGKDtHjNqLHN2anmIQ==
X-Received: by 2002:a05:620a:24ca:b0:7c5:dfe6:222a with SMTP id af79cd13be357-7c960793e41mr547092485a.42.1745610087717;
        Fri, 25 Apr 2025 12:41:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7ccb8a03sm704272e87.259.2025.04.25.12.41.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 12:41:27 -0700 (PDT)
Date: Fri, 25 Apr 2025 22:41:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Abel Vesa <abel.vesa@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] phy: qualcomm: phy-qcom-eusb2-repeater: rework
 reg override handler
Message-ID: <q6zqfk3l2khp3tkodxd4pzhufiesyjcypl66zoqzslolwoveyo@ltrw2iulrkqs>
References: <20250416120201.244133-1-mitltlatltl@gmail.com>
 <20250416120201.244133-3-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416120201.244133-3-mitltlatltl@gmail.com>
X-Proofpoint-ORIG-GUID: TMniLJmYcsyCATBnFvn-rWqzbZoxxPq4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDE0MSBTYWx0ZWRfXwammVY4d2lrM WNhN/iprKisuHUhr0GDaS2CHzSRFeWrP1DBKdKQlSSX1eyZw950+by5G4n83TEptQbqBw67PtYD JvlDpjsBZf8R02yBk1QJQWAswydtBL7XM2mwcUagkz/UDK57U8qo6IguXGpe3khCm9J/TygqQDy
 BoqX35Xu7GA6ZWfK/wTMN5napYtVeguRjCxbYVKGSnces7OaKvkodbVnNXHxflPtZNwGeRpv+1f /y/dv55hF88hJDliw0PYHpdd+XsG/s7aMdZFkwEExWitoFqvu7DC59L9Sldc9+9FqVdlgigsZrF jST+zL0XbkPHMNngf6ULG0A0jKImhD6W3pnpwDoE8/qiIw2JgWsfg39n0CL+NVoWaj1IU4rEW5m
 oES8AT2GVwuC1siWp3PYW4cjRXL35lliHbgZtwd3DkME68Fj2m6PPxrVGPY1K3NtZYl3wzGn
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680be568 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=dnmzA44czj2E3hsaG-QA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: TMniLJmYcsyCATBnFvn-rWqzbZoxxPq4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=831 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250141

On Wed, Apr 16, 2025 at 08:02:01PM +0800, Pengyu Luo wrote:
> In downstream tree, many registers need to be overridden, it varies
> from devices and platforms, with these registers getting more, adding
> a handler for this is helpful.

It should be noted that previously all values were applied during _init
phase, before checking the status etc. Now the overrides are programmed
from the set_mode. Should you still program sane defaults at the init
stage too?

BTW, is there a real need to override those for the platform you are
working on? Could you please provide some details, maybe in the cover
letter.

> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  .../phy/qualcomm/phy-qcom-eusb2-repeater.c    | 105 +++++++++++++++---
>  1 file changed, 92 insertions(+), 13 deletions(-)

-- 
With best wishes
Dmitry

