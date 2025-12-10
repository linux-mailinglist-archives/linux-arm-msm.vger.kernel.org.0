Return-Path: <linux-arm-msm+bounces-84888-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C14D0CB2680
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 09:29:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7DC2F30069B7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Dec 2025 08:29:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D5763016F5;
	Wed, 10 Dec 2025 08:29:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jMKxYa0b";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="O+sCiEtH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A312E6CC2
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 08:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765355350; cv=none; b=XRvok4SNstIBJrQUcdG9mGI0ZC/w5XIjEuCIRK5OpZhOH4Ar9w3hiXTaZF9AwERPqGqPKQ009LZTNf/OoMDC0Xawh/JyhpwYlefLuav9Nb3y4zhNYrpb4LHPDr02rRnrL2rh9WexAkwIizfgLQNBfYMoCUlT4FbI5e3odn2ChOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765355350; c=relaxed/simple;
	bh=MwQDE2DHU1irvZtuuxqgOd/ak23ugwNsaRMlnmge7I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m0nMFQxKDxu6CYgPoqbSELOS4eIILV4mRf6elybUXD1h1fDMKNb5pUh6Ms18usG1I1nbLSH/5wpR3uALRNHN7fip+7x8jCmEY9Q17tZMeyx2ZmlieCLv/NoGBCBIqyvHfvPBv3glKJB5BCIk8mkI41+qElBvxgV56z1ksD4b530=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jMKxYa0b; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=O+sCiEtH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BA6DnwE2175660
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 08:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=LQ6U8pxK0994QNAVNbIVYwcO
	SDd35n5YdbkWgIRVSjo=; b=jMKxYa0bus/38+fd9gLXBkmvpqqWPH0+JTEgNDLC
	jwS4uaREm9WzGYpfvDGToH2dPj+g8/UI9Ifx3Y0MPGhKRlO7g1QYsqutQcRafoO3
	Npsr03imjQqOUpit7zLTVgM6CIBh04wgQ2Tz1IE1gtEzD5G5z0oIPlh38C8WiokS
	uZGE2mK1kvH99ya07vc5QTge0CHf55mWHNs1gy9jrH1kx54LztMDmDIiM42ulbdJ
	iL8dRfcu79rzthOh1o6dwTLQJG2zIJnWBzvohqQV/Y8pKv6ntSe32qo8u2EePh/w
	jwchKbFB1MZlSfSAOPkKEDKJm1Pi0vB6r0j6xGZZItAZ3w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ay1xwrmj0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 08:29:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4edad69b4e8so12154691cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Dec 2025 00:29:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1765355347; x=1765960147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LQ6U8pxK0994QNAVNbIVYwcOSDd35n5YdbkWgIRVSjo=;
        b=O+sCiEtHSJxx3jpiicPt3hCRKfdvaxx+p/uYhAoxT4serg1WWuF7mnTYAkCKQK2FP9
         BEVcoR5yPFCyEDLVY1nJCqIGbh9av2IBu9B5ERNnmHA7jOrKQ3AQnYxUBf7UgI/4AO2a
         amFq3e0Yw0oi7M1fXF6yMLQNWT5Hr1cY7JCxYntEipG4r5UsPiQZD51gVBd7y96jlEdP
         xFZ7m9jzI96yKDKA7foBs7/TvsfTu/IyTt0K10iwFji25pxKl6oSupxCGu6emUB0KKgK
         EZraESdWgopnd4r8JNWTVJHamkDV7Z+Ke0VVdrSa2NTFu3kuYFmrCZKUh+Wqo5skMu6Y
         6GcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765355347; x=1765960147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LQ6U8pxK0994QNAVNbIVYwcOSDd35n5YdbkWgIRVSjo=;
        b=cTFoiCSGdcI0KFz10zZwr/KX2TbXOStJdQFINr4vdl78tCjndN3NTKj9bvFdFcWiTb
         I3fAHUhi33FgnRI9E8anf+Q/yxj2oD9wT8CHhyYeGL84uYMq5aLIzZ9PgUWQbTYXJ3Lx
         IfWJJNQ2wIGl6bfGASnXzTiFIgdRMLI/cZNdIzvZeZeYIuyam4uV+Zw6dWDABB3doUBM
         NyVbaB7iGJ/2qHiOlppa78hpYaaebihBvfqsbA9lCwHKna64mt7Z736hbFWBKhwJEZod
         snLvcPhYscz6MXbKixZAVqVhcypkkpvlEYf+dLa6yRS0ee58u6iAbDhVRHBhsuePB8eH
         SM7g==
X-Forwarded-Encrypted: i=1; AJvYcCXwYDG84hlUg0vs+/yTl4wJb+LdCwMEsuFxhGe0GgcMU7zGtRar53Xch27/LSMtTfacr1kwT/j3G9fKAUo/@vger.kernel.org
X-Gm-Message-State: AOJu0YxvT0UnOzVOd/KsTlpCmjBiXTPMRs8Br6dsLQ9jUG6inNYLsTwn
	ALiq+ZL9AjKIfbCpbLQH92EVdhn2ZZEGcju36Ov7E0OjUeBSFdV4hMMyx4gkve6tIZ2UwCq3mq9
	CedzW7NlDjWJYFGqBT4jA6lHOGMcT/8iIcKjtURJchbQnuk1ztO1BZzkVFZ2XqaQy4HC3
X-Gm-Gg: ASbGncuwI8NIIg+QsAMKd81MYxnYguckLu5t4Rcq07KwJ7vZhzp6/IormOgm8vgywba
	VRXlNT1xrvpyb5u0L0tdYJGS6zZV3WDN/l6g9aBs10wBairteO1tEJnpTWLSm4vaXKsZhYL4Eqt
	/+nJN0eR0ojNMgJaWzE2JTbd5jMtwQRn4zjzrOqFq+fosWA9xo3pxf/orm8ZeJ+0pU3fwaDqf/j
	uB8M4ktwW6kTYHPkqNDG1iFE7WdBmZaggAHp9bB4Ciop6T6f1V1Zn7xjFvwuq7RiFSf0jKWFhRC
	de9G7O4JH/rdHu2bTcA3T7rhlMuHKqNyU/7tN5k6ImVE0HSJAXSPT3IQ6HxM0H3FYMt7bCBnESv
	L3F70V8KBFEKjoJNJjZ8j7N6UgBKma0k6WtMdOggaXYKWbdbTL5Mcu2AVmRrKJiiHiElyLdVClC
	frRmAGBRkzOia4B4uEF4moOHk=
X-Received: by 2002:a05:622a:146:b0:4ed:9264:30fa with SMTP id d75a77b69052e-4f1a9b5345emr61274211cf.31.1765355346842;
        Wed, 10 Dec 2025 00:29:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5yN2+4yMhNVOKdG3urL+Lh/0KSj3dcRe9MDeVCagD75jX9QBzox9VjYfSqdlDnHahOyqOGA==
X-Received: by 2002:a05:622a:146:b0:4ed:9264:30fa with SMTP id d75a77b69052e-4f1a9b5345emr61273781cf.31.1765355346374;
        Wed, 10 Dec 2025 00:29:06 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-597d7c1e32esm6151019e87.53.2025.12.10.00.29.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 00:29:05 -0800 (PST)
Date: Wed, 10 Dec 2025 10:29:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
Cc: marijn.suijten@somainline.org, swboyd@chromium.org, mripard@kernel.org,
        abel.vesa@linaro.org, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        robin.clark@oss.qualcomm.com, jessica.zhang@oss.qualcomm.com,
        abhinav.kumar@linux.dev, sean@poorly.run, airlied@gmail.com,
        simona@ffwll.ch, alex.vinarskis@gmail.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_riteshk@quicinc.com, quic_amitsi@quicinc.com
Subject: Re: [PATCH v2 1/3] drm/msm/dp: Update msm_dp_controller IDs for
 sa8775p
Message-ID: <sfnfn3vctmhuks3wjco2f4y5vcfon3fn3pprcwgz7umpx6jt3t@dlps76vcmybc>
References: <20251125105622.1755651-1-quic_mkuntuma@quicinc.com>
 <20251125105622.1755651-2-quic_mkuntuma@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251125105622.1755651-2-quic_mkuntuma@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjEwMDA3MiBTYWx0ZWRfX3/ieR9aCx1gk
 7SnFwrpcNUWg3o+hLegrSDHFG3Jn+fiGyudXkV3z80TBOv3wLwHUyLUZRXgzs23oF7OOmJCGAI8
 UlqQevP5FHnsbn9M3wuvyQag7uF+kH+rLSrH0O9SvssmuEqsU6InfPwSxzVplQgSIcAYWeIXI2Q
 PZuzMuoOpqq8GPbEOgYIAuQ3X5H9KzvU/QrVNhafBTpVAkvQxwVGh44JCB38OCs2ejt9gBl/cun
 OIwB8YsUsXY6rSnmaUnIaEmSJS+WpOgro4Wge2rcqKnvR9VyTOobCeuEHb+TY4Fz7JGY+JUvBFA
 5UXYN7Eu4rg/rc08TeR/lA9/8qHN18sbv0H8ELL1oMrHLw+lI1vw/swbyat+0+R1SDIBWnaD0nV
 A5XRKChluiXJWKXN6YgJcxgp54RPtw==
X-Proofpoint-ORIG-GUID: lvFJFJzMYbVdzcjE8LoaGJZ_2NowDh4H
X-Proofpoint-GUID: lvFJFJzMYbVdzcjE8LoaGJZ_2NowDh4H
X-Authority-Analysis: v=2.4 cv=F/lat6hN c=1 sm=1 tr=0 ts=69392f53 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=m0UsThpCaeJMxhqdgYYA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-09_05,2025-12-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512100072

On Tue, Nov 25, 2025 at 04:26:20PM +0530, Mani Chandana Ballary Kuntumalla wrote:
> The Qualcomm SA8775P platform comes with 2 DisplayPort controllers
> for each mdss. Update controller id for DPTX0 and DPTX1 of mdss1.
> 
> Fixes: dcb380d19e58 ("drm/msm/dp: Add DisplayPort controller for SA8775P")
> Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

