Return-Path: <linux-arm-msm+bounces-69801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA4EB2CC34
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 20:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0A35E17652D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 18:38:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6761630F7E8;
	Tue, 19 Aug 2025 18:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S8Tt1NgF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAE030F53E
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755628683; cv=none; b=TiuIxZSsaOWJtXo54SAGcDKTJ5/614ETl8VJRC6uxED/MVjyQYar3gM3E67PgFHQEV4E8YtsmCUy4pF5vHiF6oU767dkWTJ8L7lTON8cGKUtwGgVKfpv3nW1Gmcpy+o5qEu3TAe5oyTDwi1wStbLFdJ6mTBAdwP9mB2bd45jzLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755628683; c=relaxed/simple;
	bh=fzu+T/ZpzSqtE+bS/ZciAkniuUnpqpoUpamP1BrgRg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gh8D0mSfbzXFfKarT6sOxNPLMMRDxGmQAQBO5lneAOCOiYCqgzwLz7qzcf2a/CL2v+3ECcDZgdULdYjwUlseV7nX3x4qAzDjMaIJ7OOKUSTgqHMYsMWbD+bXMLda9wnWOvonBMLD1bXdiNMW/QE51ybKUKdDm1TQTxdQfZyV/Sc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S8Tt1NgF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JHItuN023302
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:38:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FuqeBl3XXkMoRSpQWscvedo8
	vMMNpCq8+JIGH5PifRQ=; b=S8Tt1NgFWZUAxFYCkBWUVN1turDtFmfB4OuXWqVy
	Tq5bcbnSAjmB5TYv5bbb/76sJBu5DnUUuSndAPo1ADNeX4xpopW+Jb+PiyIr3yfJ
	b8WSrheObpQxIuvCAtPU7VSZfqEMm6Tc90Arpr3EtQWG2Mp9H0FqRmr0H6fnvlid
	Z0+eov7NWaMrE08ih5/JVtJJq3IPWeQrtVwCjsrw8xp5mdzbNxL/Z3AAY2sKyXVt
	OhER9JJGBVt9RS2t4Ta07CUVZhSoxzAg8dPR1vX7cZD3VEEKWqPI1zXtiEDbJqdr
	+R3HeypNnVIrWolFV+tnwpUV/jE8vSkio+yTXalrL9OL6w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48m62vmjt3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 18:38:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a88de1e26so199777596d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 11:38:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755628679; x=1756233479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FuqeBl3XXkMoRSpQWscvedo8vMMNpCq8+JIGH5PifRQ=;
        b=GqWychyPq++2JvJHMjTQhDCoBvo3ODnBA9/AW44n6K6QVktDVa72lwBGtcgDmsSRl4
         Z/Vx7R1flTMfBbwyKrpTVS9X+90G3Ktyf8Onqb4tEiWb/Rj/EK4CwbubMzEyo97ukezn
         8M+qzG6pTJRyWssJtDG8KbC/v/JsWfTj+JhABvwz0GO0GJziFYAtBtzeXuY3SSVWp8xz
         oMUzNt/Fy9BWdj2VyY+wW7tElf6Op65Yg4d1NbXPkd9B/YyI72wIP+T9o4Vy4DeGYyi9
         KTmr2wZRfBhm8QMLo4vgI5mOqHZMSftX2BXLQmxeAqMeqzzDiByuswAdK1ZaaxsQ06lW
         THYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVe4tN9380kEr9sA61gBic8PnqcqCAfPv9i2gyD2wEGIOTZSeMq4Q1H48BpExHu7fdsvLdhhPITCcBMl5o@vger.kernel.org
X-Gm-Message-State: AOJu0YwAstqEYV/+hjl1A+mHbCt6l1p6aDOwYPUgdY2qScvO1BzJ4pcT
	CRRybm+v7EO+S9snRbpgr2lZfGrHxye7pZW8/ZytxcudgMsM1XY2TAzI5nQegvBRYDQLk2PnXHO
	fFT6L9el98wdO/4ixHRHHrKAS0si/GaPf6EO0BIZCN9Wbtg/PlSBt4rnmBUs2wQ6P5rlI
X-Gm-Gg: ASbGncu+0zAvWGQ9ecnuLRevUehKEEYQGxTndVnLDB73KAjo1XCBYU6JBPgefTvstE1
	Vol8MGXge9l6HgPTncbeA5qGjz7Exk0rnKXclt2pLsmNZuQDMuwvP6zoPMZr7H98lOXFOo1JCEh
	gSC2fuphChbPhtUtS5rdYKIAejwSgIFaIPF8EVMOGiVfQNoNb+gqndMvbezwEkNhheSelfQ2Gy8
	Sthx1i3WBNh7Qe3neGhSweqlaEVi0i93pHv+8C4WlqhpLLjSrHbe+UQkM7BwWo5j+LZKj6Cdhjg
	j/W8tP8qS9/0qHv+YFMLDZpRlU9i9ZjdB+gGf0JsgYNGUEqwCn5ivBZCZ/ZKRvO+73C/pGyDLmy
	wOHNmuVEQ41wPv4ingoHVzF3W026DIqzYIUU7RvAoA+MKwA7Qch6j
X-Received: by 2002:a05:6214:485:b0:707:62c5:975b with SMTP id 6a1803df08f44-70d76f8b608mr442426d6.15.1755628679241;
        Tue, 19 Aug 2025 11:37:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLtaEbQxqekbslnXL5QEBDgG7J4g/ZfzsWbUQYRkJowuQhIsbV+V8+PDEmGQipEuEBgC213g==
X-Received: by 2002:a05:6214:485:b0:707:62c5:975b with SMTP id 6a1803df08f44-70d76f8b608mr442106d6.15.1755628678559;
        Tue, 19 Aug 2025 11:37:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55cef473889sm2167995e87.167.2025.08.19.11.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 11:37:56 -0700 (PDT)
Date: Tue, 19 Aug 2025 21:37:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Qianfeng Rong <rongqianfeng@vivo.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:ARM/QUALCOMM MAILING LIST" <linux-arm-msm@vger.kernel.org>,
        "open list:PIN CONTROL SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/4] pinctrl: qcom: sc8180x: use kcalloc() instead of
 kzalloc()
Message-ID: <ezuwnxx3djye23x57vnlnvujauiefcjd5sh7yyodd7kcldfqhi@ya5kyvdftwn6>
References: <20250819143935.372084-1-rongqianfeng@vivo.com>
 <20250819143935.372084-4-rongqianfeng@vivo.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250819143935.372084-4-rongqianfeng@vivo.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE4MDEzOSBTYWx0ZWRfX9QW7VdfC/nCn
 L1VyIf5UowxUx74TwT/sFLhJC4FjC3/pK1CDGuspge5iF87+WFOT/4mZmEq7cYR9eyqfguOpG/s
 R8SrOtWNblUqSjHGHYpIUtBCj8MK+VNg0Ii79zk1GFlXL5ZaPLh4959huBICQ8etIW3v474yC+J
 y8+pNZGN/zClA3A6t3hhxLdFPOsfqY3SDptmbS51lHWqvYImmrClnlEwgHlCRu4vnPZKpbwvsAb
 XtFO0hdOkV8QZ3M99P0mBO6WbbUi8sX1ONdySIVZGvu9QGxY08SakxTZY5rWOcsYf2G17TQtwmu
 /YtAYnYXQ4gKPzxfcTGw6ILzc8MdAyEcoC3AdB4ly3a/rgmp6e7nk75ltLwxQYuypF3r/IRgJ3X
 mz9xgKrG
X-Proofpoint-GUID: 1an6MTv2DJDL2UipsWDQfz1WWb4NqSVz
X-Authority-Analysis: v=2.4 cv=A4tsP7WG c=1 sm=1 tr=0 ts=68a4c488 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=2OwXVqhp2XgA:10 a=1WtWmnkvAAAA:8 a=EUspDBNiAAAA:8 a=fkPgAY4U1MdPopZYpRkA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 1an6MTv2DJDL2UipsWDQfz1WWb4NqSVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_02,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508180139

On Tue, Aug 19, 2025 at 10:39:34PM +0800, Qianfeng Rong wrote:
> Use devm_kcalloc() in sc8180x_pinctrl_add_tile_resources() to gain built-in
> overflow protection, making memory allocation safer when calculating
> allocation size compared to explicit multiplication.
> 
> Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-sc8180x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

