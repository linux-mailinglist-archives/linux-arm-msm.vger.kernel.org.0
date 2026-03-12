Return-Path: <linux-arm-msm+bounces-97212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4F+fNBS6smmvPAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:05:24 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76C632723EF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 14:05:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8D3D6302196F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 13:05:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60ADB3C5555;
	Thu, 12 Mar 2026 13:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kEcuhmvg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kgI5t00q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212023C5556
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773320712; cv=none; b=s2OqjzOs84aM2/4Yz3NCypg5AzpLjc2iNXWqsrxVH7eyv9P96S+MvlfljKAHe2tUWfR53BIMnARafGaC5QenJ9xLXsr8szzDJNnQOTipGTbhF+6jQ7rBmZc3HKUI2aG3XhQMy9PJsXisufo6+3Wg5V1IWR2MI/VGzxmzV09pTKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773320712; c=relaxed/simple;
	bh=+Izm7SO78Ck7p+ebiCMKs6K4cqXUV8ANqvqwB2OK8sU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=euEAVppJOP7IndB/PCnjXnF4kLXElWghLUciS77ddqQ4rzAPQD3QFXavupqWfcQb9lC2N56B125KJxFd5kuAGZ+2D9s+hJQXaxtKsTwvdGqY7lfsyvt1Nl8iDAgETxQvMjil30TDOt34BDGLaktFKfJUuXuC6e+Eg50bQKlEfmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEcuhmvg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kgI5t00q; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C9nAMe263530
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6ihcpB8Otw9hvfXSntu46Cgt
	yarcnxD610q7AM53yxk=; b=kEcuhmvgm8wHMv9fjJhx0IVadEFw4auFkQnNri+J
	mKWDinEPt5/rAL3tK434+SgPcSPxUK1CZHL4z/XsFLAWfFxEPjgC242TRy+Za9c/
	RdkCEXJC3VhtxtzWhVD0Sr3osrqTFcm3xdYn2ZnCf8I3vnhqWNFaJUt/T1TqmsiB
	wjRX3V7kifa8aHZxBHmFJCG/+XbEc1kKE4ZZsq0jNjSGaNGbuzkar1F/Q30LHPZz
	4+Q8xRravAvlf8IDL776k45gN9/2kKKU1YLffu383JyGxwzZD6ZcxCIauMGUiBk6
	v4GxFyk2cE55HOR1O4qI8lE7/TBpK2trSDZglV+KdCz9Lw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4yj3xp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 13:05:09 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd827a356aso663136185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 06:05:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773320709; x=1773925509; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6ihcpB8Otw9hvfXSntu46CgtyarcnxD610q7AM53yxk=;
        b=kgI5t00qdMP8n9pbaKA8sFqBN9W9o+JpTYelC7LSQafHxG0J/Bfo3Wr+2UTRWX2OMI
         e3ApSW5pavWJYOc8IIxvBWiW0y0Z+HB1Z3TSYs1+VEzf/PhOtRcCc/P+FsvbLO5QwRSr
         rLKbCRlmY9+XPZIC6unAjAwxnjaVHlkyTH1kr+QYf9cv3Tu5WvAGOwOKQ7IpLdeIaUFX
         3EHJZpDGSSx6cjHmYbbxx/Z/ZLVMOgSLBhQgInfQcCQJB3WW6wXSQg5YM0miSSwOKdWy
         oSjjHjJLO+TnwLdLI1yY15kdm9WQi20cp2SQUeMqmis15ybKPowG3OVKJIMTJjw9QWcf
         pdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773320709; x=1773925509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ihcpB8Otw9hvfXSntu46CgtyarcnxD610q7AM53yxk=;
        b=pad0ZoH5GD3hjoUY4a2WPiialjw5qdUqdqmCodXH0HrNil653UMzdExIuxlDkciPtH
         IMnT5n0f4/VlgVWf1EbqyR5PRJcq/OO38008v3JK0XFVRC9Q203Y4mZlVsTb7DksBzod
         UhLnkpG/1xeiUBvEBBCpb6p7MKw1Brz0qK9ZLIH5v6SC7xrLojt2DttCip1ZFstRflmc
         Dg7QsSPQvkEzuAkpumb7fZrVnPRGT5EeQSdiuGbrJr1cNgVP0NFDc2pir8NJ0phKHg7d
         xOyW72VDhrsgkaOcxw9/wtQq+7eXTkpUVTb3DrZNk7Gx6mv5CZdDVH5n807clIfc5pb9
         f3DA==
X-Forwarded-Encrypted: i=1; AJvYcCXievE2bRrd4awSJN4S1hlJF7eV8eftfOnzAjihGyKn3rxhJ4b6weS3fh0EjUbZKKdma4J5/k8FNZw4R4Lt@vger.kernel.org
X-Gm-Message-State: AOJu0Yxeeib0hTzLsWlfnZVqtvFfoLwsrTLpqXvga2wfrODWnFrr2Saj
	gRnVzY+hW5YCoUFoPIEU7/+2KiFlT8YXGcXDar7TEZargE/Fdp4iWeGlm2nW7GqOq1BpEe2SVPZ
	YzSeXdP2VMI/K9ivgIWFVCgEqA+Y09f6gDbjApa1XzzU4hgJJeehcSQeN7s35d8uiLuDvimpqqW
	4kgXk=
X-Gm-Gg: ATEYQzxvooVX16Ph3ZU8lDXiUlRUKAitu6nD9ecws4JTzaw0xPvfDiRM6itUhyUrlBR
	WSLm7gT4w6c9spOILToghch0gBqMQcjYaV8PYASosOJkhfX5n7t+y6ar1MxBVOZyUys5LIiYCLK
	yqP90kB6vYpNjml2x1viWBxOM10Mw0Rs7t67SCf+or8c3icn3bkur4V5G14EweAuVlsgMaMAuh0
	lI6WvsTlAN0DNj+fyWGET8SuaJ5bN05R6K5+NNxPENd3ZlW1Vl4XmeCrhug2aiEm2tcEAY/bDdu
	AsoYqE9A4BJ+F/xnEEHdcZTSlPC+ieLSPLEq0pgIBIVIuB2J32Ld+2sDXskdGQjKo070IyUCu3n
	pvrJG3K95HaK8UZJsNuOR+G091LclzLHqhU1mC2pjm5AFyJnO27VBC+zqGoTvhAuwleIIWezNVp
	BKo3peJ1wTPOAqoFsoZd0Rm+X3b76I+Jde5Ck=
X-Received: by 2002:a05:620a:4156:b0:8ca:a950:238f with SMTP id af79cd13be357-8cda19e507bmr731704685a.10.1773320708959;
        Thu, 12 Mar 2026 06:05:08 -0700 (PDT)
X-Received: by 2002:a05:620a:4156:b0:8ca:a950:238f with SMTP id af79cd13be357-8cda19e507bmr731698485a.10.1773320708516;
        Thu, 12 Mar 2026 06:05:08 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156162dcesm934242e87.58.2026.03.12.06.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 06:05:07 -0700 (PDT)
Date: Thu, 12 Mar 2026 15:05:05 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Val Packett <val@packett.cool>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Jonathan Marek <jonathan@marek.ca>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/11] clk: qcom: dispcc-sm8250: Use shared ops on the
 mdss vsync clk
Message-ID: <rd6kg7c65iuxoigsyysomibtegfhswicaop6veb5p4fait2a6p@ogngmaaxcu6u>
References: <20260312112321.370983-1-val@packett.cool>
 <20260312112321.370983-8-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312112321.370983-8-val@packett.cool>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDEwNCBTYWx0ZWRfX5ylfSzMPoMKl
 sNqJczjK/db7Ma3C8Jqg9Z3IAGsIWTMnr4JzrHUvx0aFda1tyKMhJ3ZLNQ50v26/eq40mkzboA1
 u/pZNuhfyUMesCoFGfa6fZoFs8O7NhsTJNzT3tLJsHSsRfQ3Xaneopnd9fkpbjEjbZucYrjYnfU
 oMoR8ntAUpqA/oTDeZ9cfwmdi/bqA6DqwGRyvMeYKCk8pY8nM+V0B/PwJlmGAau9eHOxH36jAV2
 RpOUDYbTJQcOvjbPyOxQAh+no/PmC3Nbe2wnuKscoVZ9Ss7fjLZNFpkaCWlbCCzfb4qwgC0VksP
 ZNAB2wyJhdwodYQk44HlcjvxKvU56Xce3phbUrt2s6XTooY7+QsweHzBQHZcu3PDTzse480o3gL
 mhHoV81Hx1hNRAjk7osXTJ8j/b+A+wnHvhhNeSZ03wyD+bbHYyk902JfN5SNYMJif/Vb91EWyWe
 GhjWfomegaQTdwOTHMg==
X-Proofpoint-ORIG-GUID: duGrVphVwovqXqQmjEEI33uXPVaqKT-m
X-Authority-Analysis: v=2.4 cv=C+7kCAP+ c=1 sm=1 tr=0 ts=69b2ba05 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VNIAONyjCExs_J7o2CMA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: duGrVphVwovqXqQmjEEI33uXPVaqKT-m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-12_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 phishscore=0 adultscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120104
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97212-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,marek.ca,gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,packett.cool:email,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,linaro];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 76C632723EF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 08:12:12AM -0300, Val Packett wrote:
> mdss_gdsc can get stuck on boot due to RCGs being left on from last boot.
> As a fix, commit 01a0a6cc8cfd ("clk: qcom: Park shared RCGs upon
> registration") introduced a callback to ensure the RCG is off upon init.
> However, the fix depends on all shared RCGs being marked as such in code.
> 
> For SM8150/SC8180X/SM8250 the MDSS vsync clock was using regular ops,
> unlike the same clock in the SC7180 code. This was causing display to
> frequently fail to initialize after rebooting on the Surface Pro X.
> Fix by using shared ops for this clock.
> 
> Fixes: 80a18f4a8567 ("clk: qcom: Add display clock controller driver for SM8150 and SM8250")
> Signed-off-by: Val Packett <val@packett.cool>
> ---
>  drivers/clk/qcom/dispcc-sm8250.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

