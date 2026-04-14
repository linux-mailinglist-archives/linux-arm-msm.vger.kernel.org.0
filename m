Return-Path: <linux-arm-msm+bounces-103204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IHooBlmD3ml9FQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103204-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:11:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 542203FD82C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:11:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 98A8330666AC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:05:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E2DE311967;
	Tue, 14 Apr 2026 18:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y4ibd+mY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TAR+m4NC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0429830FC0F
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:05:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776189950; cv=none; b=Uhes/JnP4pcKU54FwYXCT+6j/4NmzBtBzhAWUP96f6QutMrVN5Bx25JphRFXQDJ2Mny8xxkkMR9b2xgUTcTNzDrh0s4Ka1MqcCbRJHmdlmmzagQfykXWdcQwkcQoUVvO2U+iUYug7RoQlF2EJxtiHgYOm3LY70jedBwXC525S3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776189950; c=relaxed/simple;
	bh=bf+IjV06ReV1dDFWFZlv1VRjyhuRCC1wGSrHyy9iGRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PaOxMM7ouHcyipdupXHiqDfrCBK4N369Pq4ZM96Ws5amSojDJjiqQvQWqm2j8s/b4rlY5/eJtxjBB0o6x9gJDjmjCoKcw2Uphptm9aDqq4uqYT0X8ZCDLRXZ2qDC2xKA99hd7SbNsyGU9e8DLucNwK8FdYauKXCdd3eQOMxSf9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y4ibd+mY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TAR+m4NC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHvpF33059030
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:05:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OhqR9vG8Ni4aOgZIumqEuvhz
	5RlcPtP1kdti8y6DfmU=; b=Y4ibd+mYZ9Qa+tNlmu4HM9/+XdXNR3+RfJArR0RJ
	COyWkUgXTuaZesGKU/frNzKpUFSq2tQWlhy55Ed/FGQCEzs9vxd3BqM5951xMPkq
	+/5yZLwRps4phBE55PYSsdDsHao+e5c2iPT1nrmv53xrdjCjuYzPLA37/fdZdByv
	b9MUJldbmzmzELVzOyKJwkLFAYJCDe+Fn4ZZ/GmP2jRXCy7NCqUecYMDUJe0fn4D
	tcN6ERPKoH0g0V7y9jY/Eyud87qCc3SHHWq99kde0r+1HhnURwe7Y+gcNCILnXUJ
	7T0fVxUciWYXQkGa4hfxfQZfbliqHRf81+ECdypYPeUDJw==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhtepr128-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:05:47 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-5fc74c6634aso9206135137.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776189947; x=1776794747; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OhqR9vG8Ni4aOgZIumqEuvhz5RlcPtP1kdti8y6DfmU=;
        b=TAR+m4NC1MDaSOjdN6qi2DUaYp9karXuSfCAC9rNzCcqJ1iY997ueFgkSIK5wgcxj7
         q/7+fASW2dYuqrw4nyyN0aOumpfNpP7j8+TfporOgfIMQQ4xMQkBqZAkySYOBE/lnGAA
         DYRrWZEwkdiMpJ5p+bKAOGDL8WD2sndKZ3bZqSh3eouDsyOrLJXsyMBxoD+OQJIJPlvS
         xVaJsVF+yHH7nphshnKOccwY3/PxYFz5jnnBQyd7i8I16TgY43mX9ctf3VNPpUaHhalG
         E/1F6C3FeKB96ejbWlvu+QhaClj9Pf1go2TEO3OW/TvJDxtp6xiONgyruuHW45G6O5zi
         gK+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776189947; x=1776794747;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhqR9vG8Ni4aOgZIumqEuvhz5RlcPtP1kdti8y6DfmU=;
        b=KSRnoY7awsYcLOqgQ5/nLoRmQMT40aunmRK9VgSaPJsncyYbzToEGtzbWFjrAfo5kX
         eadzSfI+RZQr5HGfQyFm5QXj1DVw+fr99MUJqfCplz7+GnIOj6TPJDzCy4R+HfdwZRgE
         sk0cbbFbKY8KHf3ZzYNVuaq25AtFqxQpxDp5ghyVHXt9k+FJaCVR4DCSaFeZ/FsBnvKa
         c+9iKq+NxRYZJ4CAkwnmucb78ukHMXufeY61MvHETWFLEdMp1J4may+s7OpJHYLQgY+a
         Nluk2vEGqn5obMA8X7vLq8tZf+vnPVkpbelA/wAlF2gJHnRD/5JB56yP0+DWCulXY6uB
         f7xw==
X-Forwarded-Encrypted: i=1; AFNElJ9kSiiADPaHdlsBh5MpwOYV4MmO13SgpBAQeiDAZbe+r952AuTGYlMwQFbTNC/OYSpky51d1KtDgtHjio3R@vger.kernel.org
X-Gm-Message-State: AOJu0YwMVQcGt8CCeFuUCQ+gG3nIGKYECbZM+tnOS8A5lcCrdeieOeni
	v1pukkUeD9R7rx1/cZtTC2+femPDfteNCVKkP5JVOomYYQ9v6joE/1RvpkXjq4pcreGseL2Q5L9
	706UQyMt/53M18vXeeY+yCR7hoUHILPPlJMF/EVE3dSdbSmG3akIjGlU+HhIAYHwj47ow
X-Gm-Gg: AeBDiesNFjl9ZxqC8puubebOCZSmBUksMhVAVejT2ACuhs+dddWnc8jZcSuF4n09s3b
	3i406Ew6mNoN9KIO0FHDNm0ap5L2xLisz0aiXwUEL+E4utmssswzGXarTBc3cAjRfjZb3/Bgu5O
	Mxsxyl5u2j0fKa7AujzyE963kern2tOagqEzhLK3paGkU1H4OOr47OLSCRUHKpQlQ4jtejRWGOb
	9ibQIcvTV1sLfsSx576+uaTWr5Evh/SQ5kEAxOV24rXz+liep88X4PIbzB+xgZd+/0IE3pgQQd0
	ZK/hw9Y/VxOeKogOPEdo4kD9tup4LxpLbYe64FX3jZ7Gyk1xdgoR2tSsOyxhOpT3Q5HPwj2o7xr
	Jt+O1llffKah/wgH9NFS/RSiAarMBNZHEtbLr0+CLfh52WuWTPDVsaOZ5oQaT72Nu9B4u4yVflk
	UoocGnVX12XESlzAcPEvDMA0mHYFryMVixcbYmAdCwNwy2YQ==
X-Received: by 2002:a05:6102:38d1:b0:607:4fe2:d3e1 with SMTP id ada2fe7eead31-609ff7d06ecmr9583112137.13.1776189946851;
        Tue, 14 Apr 2026 11:05:46 -0700 (PDT)
X-Received: by 2002:a05:6102:38d1:b0:607:4fe2:d3e1 with SMTP id ada2fe7eead31-609ff7d06ecmr9583066137.13.1776189946338;
        Tue, 14 Apr 2026 11:05:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e495417cesm32389181fa.25.2026.04.14.11.05.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:05:45 -0700 (PDT)
Date: Tue, 14 Apr 2026 21:05:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 05/35] irqchip/qcom-pdc: Add PDC_VERSION() macro to
 describe version register fields
Message-ID: <gfghnk74kr5ca4a6thd7rsyycpcs3744ybz4labevs3zqjswhp@2kmn7s4b4cne>
References: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
 <20260410184124.1068210-6-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260410184124.1068210-6-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-GUID: -Dr_rnfSzWB-xy3MHoUzm-Ny-dKEn4-J
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE2OSBTYWx0ZWRfX3W+a7wJZNsUE
 T+j0+XAMDqR8w46yI8wtGQ93I4CwfrO2BTnESGYYKhc/x/iPxMRqlkMirZ0jEum1dZ9FvMZyAvg
 UN0rmA7wS1FtvQhRT55k+I8a4eAGrXVCNqHhahg2zXddyFBVb7HBS0Vlb6AlR58CZrTKxCQPuVW
 +w2iPnkaYZBYnSJuZ9YgGxunKYk5Uxn6rk5aiYrPWrrxs8GFVTMzR6PD9r6ikcU2WWryd0QOXgz
 C59IlR0gpQgBZAzaqgMAxht3RqaweIhGBGaGMtqDU+yIoozyukpgqqLP5oCecYUngtctBB6YDnd
 lB5DOCuEQHVG98tAY6FXnQHhP97jZKep1JygxqfO0iTtoqC7xjj7lAvm+EqBZEsQpA3Nebq03pI
 bOCGxoablJHvgNwoYc6R+HDGUZyCCcHC3IpqaES+leEJ9c+mVO3+0S8XjJezw7E7/oE8ge8te51
 9kGu+lLQNJQkPfeyLXA==
X-Authority-Analysis: v=2.4 cv=CoGPtH4D c=1 sm=1 tr=0 ts=69de81fc cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=seQ3RpP1mtjBJ7LqmTAA:9 a=CjuIK1q_8ugA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: -Dr_rnfSzWB-xy3MHoUzm-Ny-dKEn4-J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140169
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103204-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 542203FD82C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 12:10:42AM +0530, Mukesh Ojha wrote:
> The PDC hardware version register encodes major, minor and step fields
> in byte-sized fields at bits [23:16], [15:8] and [7:0] respectively.
> The existing PDC_VERSION_3_2 constant was a bare magic number (0x30200)
> with no indication of this encoding.
> 
> Add GENMASK-based field definitions for each sub-field and a
> PDC_VERSION(maj, min, step) constructor macro using FIELD_PREP, making
> the encoding self-documenting. Replace the magic constant with
> PDC_VERSION(3, 2, 0).
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/irqchip/qcom-pdc.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

