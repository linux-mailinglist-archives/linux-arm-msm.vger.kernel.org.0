Return-Path: <linux-arm-msm+bounces-91849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4PaoFiOhg2kLqQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 20:42:27 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C611DEC275
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 20:42:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B753F3013856
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 19:42:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A1342849C;
	Wed,  4 Feb 2026 19:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KD8YXFUB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="L7K1I/HI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CA833EB18
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 19:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770234133; cv=none; b=RG+8g6ILvLXGkfAJoBSutq9/Yb5muts9aC3kCRNO3BHefA9E6pJGwt9o2rGbNWeNzLcRen4WGecU7vCVd1ogO6fGVovFl99XVw6mGQ23nXbXQTRISHt9EGcsPsVV3wrP1y3t1XaV52PaRSygwRtuM8X2uNo4WAnrKsNcSr8WQ3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770234133; c=relaxed/simple;
	bh=K2uFDuUKGmXVbCeC1snrDX1rYEsvUw88AUuCxGr5Fpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NyaE8cilOG2xEBQbUp6zw2e2mDuzrY8236bxj5mo3bB9XYD0U64G9kIY4KjBHd0j3zgIpzvF36Z5Ub9uxzh5pXdYTYCLplj93MWdHEOuGu+iTEHIVv8DGAP7Syi0dGVwXikwdWtqN4mI0oPgMLepsZwmk3C5MDiBCt80ZLmKiOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KD8YXFUB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L7K1I/HI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIbZv795222
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 19:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lZnMLbOsj1Lb1eWQdiDib+VK
	dN9JrzI2okmR+GB2mLk=; b=KD8YXFUBvN0+PZS8yQtK+E4YWA7409mSs6x45HXw
	9aHws4otwUC1+1X4nVJJKacVkD0lCvYRLZ3Z5AQjZyWj/KWCEdtitTLxfltZ3F3F
	s1V3GKaQ+UkTzVgsGsCaSmVZ8E39DqTqfSioFvn4ZzB8JMdrgjnKcGhPQ9Sy6CBM
	sDgiWdDcDaPD1xZaFfbbdzSkneB2OSh6QZyejuUJUToCQ02C3hBYUIz/YJk9RP63
	Vr6rzH0XeH9S6MNMFR0rRSblHTobFipNbAbw0CbJDXsZBZv9Yutjm9NkBR1UXV41
	Q99WYU3Ktoxv2sc3gYAjCnXqd/8SHy2Co8N1l8IKkoK7yw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43uxhxv4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 19:42:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c71304beb4so17418685a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 11:42:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770234132; x=1770838932; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lZnMLbOsj1Lb1eWQdiDib+VKdN9JrzI2okmR+GB2mLk=;
        b=L7K1I/HI4qPJSIHVBVxRaqBSF/rX4d+iFfIR86GniDLoWR0od4fCGy4sZEzIVXHGYk
         FtT6fO+asNDoN2QCRZzBon5Ig2LluTCap0RcQBJSx6tzAP23i/Fgd8ZcwiB7sjx2XCjE
         zadCND7WCtdHk7HT7L02WREYN0XzwM/3sfqe9ywbCAJmX8mRSf6pPgaTeydx66Kmkbvf
         pLhp0y6eq2hiq3lzClMArWWeEFkyG4+XqzmI9aQLwGWYOCksbA2aTOxL9ufqYnpV9j2A
         ZOTTJz/MVPpR/OjYWoY9EMF/2DpVaELVwLI1wv517xgxJUCliN3cAfInkDK9tZbmDAuU
         uTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770234132; x=1770838932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lZnMLbOsj1Lb1eWQdiDib+VKdN9JrzI2okmR+GB2mLk=;
        b=QkmnSaeqfJ6AGrRo1qK17eq9XyFL1zLUrqgFAyhHuEaG+xxXsVUhaImAT805isc/Qu
         8KoWdLo7M3s+dOfZyIqM8xMP8AwUZnl71j6K5l4qtLojH2JubbGoqALYbO3JrmnSquWy
         dS+U1Lwm3+nOzwSk0zjd7qL0xGHcW9jt+AJ3mJI6wbUHFfkPN+BVrD6sDMem0GGtsTej
         cR6znWQNLATvd3K64pq6c81OeTUdVExZ8U+eULN0aAcntQ5xhymkaJWCeziI2rUNaOEw
         wuQvgDYv8V912hHEflPr+OY4d0JwnDOaXJgvflZKpUiXacFW+k5xbQigBZAtE6na8tj0
         3BUg==
X-Forwarded-Encrypted: i=1; AJvYcCVzFMn0x4neRDpOERRMtbUVkVVqUbHyyUpmxcf7ggzbkMRjXgmb1Tb7twKiFWzTdoU/Ufww0GOJaLsQKmVS@vger.kernel.org
X-Gm-Message-State: AOJu0YzO6mYtsGPBYapMXtBsUQtN6MEH8eyRZN7NDCLOE1Stb7h5LM9n
	kLbi8sKzj4Rj0OGIt2qHa8eAGROcYqDZwZT6ARFP1SIKdy3Ld8dI7bldqyDVNmWEGZxVF/z2rcT
	jGeq/tLSXabyhZAbM4RPtddDN+chX8yhbAnfZOsYszYh5gwsYpUFv/FIEZ+RoAhUQnHvf
X-Gm-Gg: AZuq6aJ/kodNjjLhTpBvZcSSauT7MdjjEdXRhLEXtW7xDwtzaqgkaIb0harX7mSdRYB
	SUX21b5zh5R5Ir4G7lSvgDVKQzEa+AWEEMDiEQ88GJPTQ2VE49fWa+uJ5ZZcVIl3DA9sJTbdimv
	hJXgcS1MXtkMepsrjHgHGdBQwBasl6Y0H5JyiSDZ0PUI5UN/1IBd3fACsyzuj2GlC8UA4nBZHMm
	GzqsBompCFlRsiDK7MuZ+iskWpL9EqP/H2tzDmNiJGBMthta1hY4UG1skDD9LfkahkqsA+7Wi4e
	hOnJUxxCk8Lo4z9yeTaSbvsPS86oiNdevtWArV+WLeEoDSfpC+oubKSjMJlR/czDrvCN6l4CjAm
	yKGmBuaFZ2ZqmDX2g6nJ4oyrVKK6NqiUdmuHIXpm6lKXuctD5WZybyG2fHpSbBC/Nj6fI9x8Wa0
	eZuk/f7vVUmw7WV32gFI1uJ8Y=
X-Received: by 2002:a05:620a:4804:b0:8b2:f371:5601 with SMTP id af79cd13be357-8ca2f9c4d68mr522968685a.50.1770234132273;
        Wed, 04 Feb 2026 11:42:12 -0800 (PST)
X-Received: by 2002:a05:620a:4804:b0:8b2:f371:5601 with SMTP id af79cd13be357-8ca2f9c4d68mr522966485a.50.1770234131815;
        Wed, 04 Feb 2026 11:42:11 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e387f887csm866861e87.33.2026.02.04.11.42.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 11:42:09 -0800 (PST)
Date: Wed, 4 Feb 2026 21:42:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/8] clk: qcom: videocc-x1p42100: Add support for video
 clock controller
Message-ID: <vdx2ha3q4mkfhdfszgnqwa6rfkendlwgjlyn3te2h4l6jfkgmy@km7pq7faulub>
References: <20260128-purwa-videocc-camcc-v1-0-b23de57df5ba@oss.qualcomm.com>
 <20260128-purwa-videocc-camcc-v1-3-b23de57df5ba@oss.qualcomm.com>
 <aki2cw65fdl2toctcquprkzpltz4tejsyf2sudlfqy5hsluvx3@ayi7wqaa2csq>
 <97535aa1-6eb2-44b2-b04b-e7608d630fcc@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <97535aa1-6eb2-44b2-b04b-e7608d630fcc@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=StqdKfO0 c=1 sm=1 tr=0 ts=6983a115 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=wRy90H0ZoyRQatx6-qsA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: m8iJke_NeJmjVSkpDMaDljnp38Y-IMYO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDE1MCBTYWx0ZWRfX6rzh7sO9jKQX
 kSlU1JoOzlw0gZeZpeCLUT3F7Jkc5aYOuAoWaHNxfcbgv2/09sGJFhUHvwM2aSBz8CEJwZjAV2O
 5oBDQ2+lEEAofFPPBrnfXcUgSWvdTR3MefsuCtdl9KZ1yRh4zplOQuuyKYHlvzmKsZI3SpsYx/e
 OGMU/ok7ztlhjfar03v0mPlPwXoZQVwI9HsBa9UaRINfrLmt5D4ZtBz263PpY6sQUgloNJCqIJ7
 Uh9p8tFiSBvWsfk9rpAe1t0Wjn9FQ5ZGnEkM30ZjN9NeQZBXoHr7MHDimFgrRqjtUEVxeifEsYP
 xshh4aoSp7idPfwcT7M4Pi7oF+znqiCTmEWfrw/8DSWVo7k10hU+jJ/wCpFo+Zvnjy/S0a9afk9
 xIvG1wPWLxQ+Tc0f03GFx1tO5Ub6wfb+cktWzp0ZklV4ZEAqk3v5SGltHxzdfj7CajHZY3wEg2S
 iqkPwZWx3OKtpEjIR1A==
X-Proofpoint-ORIG-GUID: m8iJke_NeJmjVSkpDMaDljnp38Y-IMYO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_06,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040150
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91849-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C611DEC275
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 11:16:34PM +0530, Jagadeesh Kona wrote:
> 
> 
> On 1/29/2026 6:07 AM, Dmitry Baryshkov wrote:
> > On Wed, Jan 28, 2026 at 12:56:34AM +0530, Jagadeesh Kona wrote:
> >> Add support for the video clock controller for video clients to be
> >> able to request for videocc clocks on X1P42100 platform.
> >>
> >> Signed-off-by: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
> >> ---
> >>  drivers/clk/qcom/Kconfig            |  10 +
> >>  drivers/clk/qcom/Makefile           |   1 +
> >>  drivers/clk/qcom/videocc-x1p42100.c | 585 ++++++++++++++++++++++++++++++++++++
> >>  3 files changed, 596 insertions(+)
> > 
> > The videocc driver looks almost like videocc-sm8550.c. Would it be
> > easier to merge them into a single file?
> > 
> 
> There is significant delta, the BSE clocks are newly added and few cdiv clocks
> are removed. Along with that the frequency tables of most RCG's are also changed,
> accordingly initial PLL configurations also need to be updated, hence added this
> as a separate driver.

Please mention it in the commit message.

-- 
With best wishes
Dmitry

