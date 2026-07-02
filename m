Return-Path: <linux-arm-msm+bounces-116027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FMdtMahdRmpaRwsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116027-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:46:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4806C6F7D7F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 14:46:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kCMY3zff;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jNtsaInh;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116027-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116027-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 125A7304E1E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 12:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64AB13E44ED;
	Thu,  2 Jul 2026 12:44:16 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE7448034D
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 12:44:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782996256; cv=none; b=Cfrbb9v3E+2ygAOddwZVshTiBHvI4LQ6f4hfFv2Y7IqdBqs+VRnTxd9K2pCcnyRiW0wH+5qM/Buse8VhuOYAmdBggWzdWTLOryBI4UB3lMZ20/yN9Os1cj5nsD5DCbFBSGMgM5vgxDpUTskV4cdWuLSpjb0CcKg7urbci/xMJNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782996256; c=relaxed/simple;
	bh=KSEMk83LTvH1ntmywIj4xfqhbRZJboxTUOGjWyN+i1E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WP1hYMjgN9a1DyA4seEy1X0ulytxRnoehtXUx7i285ZEnU74ncYEJO047Y1R080su1eLGgVcL4QeNnT5dkVyi9MvSC4dUwylgynK6nPlZve/Dv+FAn/hBD/va0PEMThG5HO2CpWCVlgRi/m0U3/G2QxhaG6SZ0mik41KxjXhQg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kCMY3zff; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jNtsaInh; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6629KJMV4115130
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 12:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DwO3VIiIxXw3d1C054wPvvl7
	WENNMj1otLTOtdBbpWM=; b=kCMY3zffz4cbVZfUtG35Tpn0fYD/KwtY6N/D/gPo
	NfSF0HzLdDfhuirPU3dve9J9AE1fmVMgWBXvrF/mxNlXCFmOYn9MkR6JhXO6QxfY
	cBsuMq0dyHBd1ZD8Ucg7p3E7yKosw2OUCi16bUqvH1pNDQjXTR1YESrLX3a8mcQ1
	BRlWzaTR3pkEsbMC17kcjdGRsvmzeGRsY+4uqRWCj4OJO0wtBxQKKLXZmPWyJoVa
	7b/GOKyalKCEXmU9STpMusVqO4ovi168NTQ5FTl4PWO7EAFy4Jv32cf7C+dm9mxW
	s9o4xW6tkapOZwx/QbWrj81R41qjtJJigPKdLttZA4GIbg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5n940sat-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 12:44:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e63df032bso50671685a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 05:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782996253; x=1783601053; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DwO3VIiIxXw3d1C054wPvvl7WENNMj1otLTOtdBbpWM=;
        b=jNtsaInhGu5ck2hCtsgowYLyL3WAdytTLNFdZL74SYzaiU0pgDXIOkrayg9gkrKbsM
         FQKp/k+XriRg2z9Kbwr0IX3ym30wd04cuGrj3eU6UVBjpsvlCTO2JzCUkjrBKHcDTeuS
         /iKZlBVqg15HVM+00SIqWXP6+tvhyx0coHHLj5fssr463MO0wyQFzipx6alJpvodMRyX
         d0Ut/2akCJZp3Xk6C6GUsPuN6XgkJv0xrvTQ6LmOd4uwUHKDFG0OE/774isc4r0V1qs3
         aCtWpeP5xo3cFrg9XWAe866NyuhLAwkXh6jTZl8g4eRRoDGfhk/o2zgZBPvbtWlLN8rA
         ujhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782996253; x=1783601053;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DwO3VIiIxXw3d1C054wPvvl7WENNMj1otLTOtdBbpWM=;
        b=h4WnW0YsqCfgcVcd/hMkH1zWpKOJSJ3FDLEymV3Px5P1lmpxDJtQmGeHN/WAOV/vdp
         tWw2Ygg+GRGig6a6Jgtkst+MzIY36H7kszs+LJGKCL8z1WUDZXbiuI8wa53XpCrjzZ2j
         TATl+QF3i6D37NGXvRJyhPyu2ELrY82tEnduqKQ4nu6InAbC1yCWFiOv+Odyn1/RvQFI
         lhcZ+Tt2//SxiPhKULBlLicJ9Dr46V9SP9Fe6kIWaIcaXASmg0oIksVGj1KOpiC1tYZl
         13Kqdy52yPjXoZVgvi5YFgsH7E9US0AbnN/tJXZR9BNItpgMpYL5YsLHUgKGJdcg7VSl
         ldSg==
X-Forwarded-Encrypted: i=1; AFNElJ+WqLpCex9zf5Lfiya5mIJoXPN65xjZASbs00uuzxwk2684kFHAN3VzkDsOyvth5rqQI8eQganDf3aW14xc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0fgR3ces9NvTopRZqlDj6MjmJEvKpLun4hRwAF9cHUXMbT2xA
	EYHVgqzXkAddACoolh26X2xyOtD7QIlI7YB2f8yOmX+2Q95dJbQXTdbz7uS+JV9dPkgfMxCI62L
	56KOkLZfpdEEYlJzOW7fbSLrkM9yxd7ZAg49mGY7rG11pGfa+0EY3MJFFRPIHsDb+oYRg
X-Gm-Gg: AfdE7cmAUFdph4RUAc8/O9l0EvSw/NSixTVnBGQ7q3t7BlKEmz+wJ60ijjhzUuYnPxQ
	MUTFo+oXpSJLCyTutMDhlnfdmoiKfOpeIkbd4sK12ZF8OqGbGBWvU3JfT8lxcWLFYXysIb+kkLo
	Z9l/APpI8TIKmBxZi7s0Kw7ic9QZ/BhELUSbb94YxrWebA24EIVDw9e+WiGbpCflC+5/1TKKEc9
	GAhzFzXloQNgL6ehXKl46VLKRdLOkoq3npjNHiTwGa+He/6B0AUGopFTd5wuQSEQ+sa99+79CdM
	COqe3Ns1quVhB7crdHapx4/fjRd7GfP6A6WlvBX2jHpOBsmuncQuF7GnphTIzRwRNjSLH1giBom
	8nBtop2XV+SbBeKjWOcxqx+WBPOUIthUtMvF2m4AElmGhUHeIcUSFABEghu+vXsr2m6wpDyjNbB
	cyWPMLTdm5eEmeg+3nWVjrhMOx
X-Received: by 2002:a05:620a:44ca:b0:92e:65d0:1cc4 with SMTP id af79cd13be357-92e697f1e73mr1201651785a.30.1782996253077;
        Thu, 02 Jul 2026 05:44:13 -0700 (PDT)
X-Received: by 2002:a05:620a:44ca:b0:92e:65d0:1cc4 with SMTP id af79cd13be357-92e697f1e73mr1201649085a.30.1782996252623;
        Thu, 02 Jul 2026 05:44:12 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec899a3a8sm655055e87.31.2026.07.02.05.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 05:44:11 -0700 (PDT)
Date: Thu, 2 Jul 2026 15:44:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Monish Chunara <monish.chunara@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Nitin Rawat <nitin.rawat@oss.qualcomm.com>,
        Pradeep Pragallapati <pradeep.pragallapati@oss.qualcomm.com>,
        Komal Bajaj <komal.bajaj@oss.qualcomm.com>,
        Sachin Rathore <sachin.rathore@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH V2 3/4] arm64: dts: qcom: Add SD Card support for Glymur
 SoC
Message-ID: <w2ml2bktc2a725reirixn7yu7d3aihua5dap2klp6bkr452qee@j3p5nulud7xf>
References: <20260702094056.3755467-1-mchunara@oss.qualcomm.com>
 <20260702094056.3755467-4-mchunara@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702094056.3755467-4-mchunara@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfXwf0A5KfL5ptX
 RvSscK1EYVeTHkqYHyNia4kYiof0B2ovTn+a0iAI/+KOL2jL8F1ySqoGduy60CqVFDSSzdq4Mit
 1rDfdYumPAchHEeJLM6yw2sV8Ibs77R8gaYn4errb6J1h8qPfYLzzZAZ5w7eyQUfAPORMdGhuZI
 VFTCMD2weIa5rZ9Ze3pNnfnSSNbpNyP04ZdWx2oPr9ssXadM700QxkRTY47FALXT1utqiiCp9z9
 8T5UuJzosZvZB04DN7NqhcyYMvtblP8V8/iY+Hj8fziBX36rsREX5XFvDHTAFSH/ASEQ1DOzBFG
 9FQI7l+Ap2x/yFAoJm+lVkn95WCQj5XYlPdu6qVuOmGxR4z49WdmTYsxFqXGrZA+DplTxnnoieH
 ZtVtcrH6hxKve3WhRoLD01IoYMLt1Dpr06KqrfvwwXAnHl3JzTFYXRE2+0om+usci2/RZ4xS9xp
 kRhP7NGPQbIQkJYhHCg==
X-Authority-Analysis: v=2.4 cv=Lv+iDHdc c=1 sm=1 tr=0 ts=6a465d1e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=FZAofsGHiTNuLk9495wA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: py6MA6JUfMm8sY-mL3nUqxWXUPZ0wnIQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDEzMyBTYWx0ZWRfX8OnJ2+wRv4HC
 0WxH6yrwvYJpL1rq0ipMsilTMWFJFackiUZffRU5qKLIv1Ni5A6O+HuVS6GnQJq9Muz5B3I8/0S
 CDeUXsXKAT6lR03FQhzZZ1SigxhRJOc=
X-Proofpoint-GUID: py6MA6JUfMm8sY-mL3nUqxWXUPZ0wnIQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020133
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116027-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:sachin.rathore@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4806C6F7D7F

On Thu, Jul 02, 2026 at 03:10:55PM +0530, Monish Chunara wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> Add support for SD card on Glymur SoC and enable the required pinctrl
> configurations.
> 
> Co-developed-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Signed-off-by: Sachin Rathore <sachin.rathore@oss.qualcomm.com>
> Signed-off-by: Monish Chunara <monish.chunara@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 91 ++++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

