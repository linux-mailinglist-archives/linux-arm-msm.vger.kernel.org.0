Return-Path: <linux-arm-msm+bounces-108256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IBkiIsJRC2qYFgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108256-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:52:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89ECE571C27
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 19:52:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 7E8B4300D781
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 17:51:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB8AE388373;
	Mon, 18 May 2026 17:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D0+NDR23";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDjC0tGH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E4D382F08
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779126716; cv=none; b=Ap7pd3agrcR5dl1vh8F3q2cAl5zrk1S6X6qBtT2QUn5y6SgScZf+J4hVYWoMm2ySNZ8/Wl1Dcv2IwAwS9D3wDjs6GTre2sKk0+0XSNBKxQqeNj1kg+Uydq1fLD8/Lyy7IYI5xujV8CM5q9xiYmMyUCkMuRD5gwNjAslGFRajRpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779126716; c=relaxed/simple;
	bh=YO0xaV+puJb+FXu8XxI7Miv+9xXb71hwJzUKynMUnYw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oP0y5yT7FJfiqClldXy/YyEgZmtcmTaFj6LPEtNqjmCeFrzSU4jVN/SeyjE7adnlIQVWLku7PMgDM1pfEHQPT1JWD1KygEarHvii2lPZje9vsZdjK1HdR4fqjRkrPSr6Xb012xm7ZyDstl4wFKsfJlde/tQsHx4W43VYyBs4X5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D0+NDR23; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dDjC0tGH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64IDp8LU2893009
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:51:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=W24vIOGiSP4y29K9PfNEC3xc
	hhMtUW4j//8Nr4NBCog=; b=D0+NDR23gr0Hf9uN9SsTR97Wpa/hUSXks34Z4fPc
	ytW9M2nokM2oR6fqX+mL0I7KfQtCXwXCPHUcUkqZD/006ngkEKbeFTjSa7fMsvE+
	zMcUWUNuiDLB6MoFr2ooNeHmcPFtHDRWif+cRlWyXrPY7kF+XcEJkk178y4MIBoD
	BKZaBrXwe+FzmKeExjDx3GfI/Ad+KCq3L2djYW9f0nAMwRf2u+KeRlzn8jNfS8Y2
	wNlU3Sk4kcWZjh3yXvVxWYRT+b0yjz+SHKYU6MeX156S0Qwqz2UpnwHtTztCQTSK
	OjHRfa4h4faErBt85SDg+UUaIMe9cH/6tBIowaAbxvSaVQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e7xk1afdm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 17:51:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d5d1c2289so83626921cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 10:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779126713; x=1779731513; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W24vIOGiSP4y29K9PfNEC3xchhMtUW4j//8Nr4NBCog=;
        b=dDjC0tGHbk76CsBAbyEOg/s/WIx5Sbtwq3Gmhd86dgMQiDE6vKYZhTP/i3CUTnDcyV
         bzsHc+aiNhgwQhfEEx8yf+Ws+AfyYipf+bXSrVbRyU4Df/dTvFPsIzDvmI8CmTVUBAoH
         nHwvWaZ9Sjvj94MzE7yFBSWGmv+KGh5WwU8u8E8GaNCE3C8sravQyE4xGsvjWuyBn2lM
         eDu1GG2zCYyRjG6/qe713+itq+Uj4Md2PixWcuXTjhDiUQSm0DwEh2rHvAw2r7nUcjKB
         oAAIK/W1hjnGcHmZkCW2IQ1WdobTOlGI7ZOPs/aocq7eqC0vEAGNPn0YKyUUwEEWwVhK
         h85g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779126713; x=1779731513;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W24vIOGiSP4y29K9PfNEC3xchhMtUW4j//8Nr4NBCog=;
        b=XXlgW7nquOzdRp1BJY+lvEcdgvAOZwSkUSom+IKg5njrvVzKD+CBBblKSIAEwCWDyk
         Uq9zveWF0sq4PlkOb+7oUT4eoRRn+k3FZF43aLDhT613PvgPqJO6PanDUYJgsnnX6CFn
         XATzagpTLPbsBISQwehxWamyFGjpGFpgv+JdMsXlZpQTETXm2hyBIyzGtpPpE7nP8wF4
         2D1LDSIhoYEN8WFInmohX6SgnaeobxyAhm1gsr+5ms+yW3wO0BXTpGtMC0ilVgsyAUCP
         mwEXfbsAjqiTnZs9EP8UlyDVFrTE+92aW/xHjvwh2jBwF9Lr129HBV7So2Eon4kXDFI2
         /TnQ==
X-Forwarded-Encrypted: i=1; AFNElJ86PKrkyH0gpPRlogUMdszEFImiLqr9o8fd7F6f39MjV6Ymhb5TUR9hjpNyJNzVqHIE2fscAXnePrF1q/dD@vger.kernel.org
X-Gm-Message-State: AOJu0YwUIalgUrOcEmH+UPlOAePc3S/w6glvEJ8vVazN6msgkFZj7OBU
	yeUvwMLenOc/kXNDzl7LtOuQAmLsqLF17R0Tu4BbpJ29bLHKmePp8ark4jOl7KSKWk2AfD48TOR
	DUmjRxUJSEQIFGv42CGB5cayD33wqU7HZtCalQyN53G2mbs8neJgYpWMwMd6ImhjHNeb6
X-Gm-Gg: Acq92OHhzRq0Jcd7Hyyd3AWWXHu34NZnf2U6No+8KnONwZofHjQAuHykK0uG/pixyoZ
	8P+T3EHlcYF600ADLkRUyN+aFG1zEk/MYLm5C4S/5NOOxpsP03hTpUDspUIgPsfP4tP+iCsJuWg
	UfFXF26VkrBwe49Edp8mA2JezwlnkkjZ97PUDhyXoj9kygiNPs+w/Wd+Qm8gP7FlE5DTDetCEjg
	GMc7Hn1VL4kOn6y+yGNwB2SwqGooR6lOo2N7apEn21CcTxsTLLTEZku6QWhXzTZwwGu4x4v/V89
	kljJEf6KfbNvpw1LcSReSl7PeDg1bCtkqeRtUbYzwdeoVWhyRUSUCj0QHEFPfn41Pm052CMDpuR
	4X3MYdi3sgReIOwVswX9rFcbsxHm3ZHycC1sPlb5f++7YdXnH0KzqCexd5snyiYfhTuf1lSGeTm
	PKtWrQIXwzEqx8sNpFvpJ6apRhQKl3A2VfG9k=
X-Received: by 2002:ac8:57d6:0:b0:50f:ca25:fb48 with SMTP id d75a77b69052e-5165a26b016mr236818361cf.55.1779126713028;
        Mon, 18 May 2026 10:51:53 -0700 (PDT)
X-Received: by 2002:ac8:57d6:0:b0:50f:ca25:fb48 with SMTP id d75a77b69052e-5165a26b016mr236817891cf.55.1779126712506;
        Mon, 18 May 2026 10:51:52 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3958878a103sm13495791fa.29.2026.05.18.10.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 10:51:51 -0700 (PDT)
Date: Mon, 18 May 2026 20:51:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org,
        Herbert Xu <herbert@gondor.apana.org.au>, davem@davemloft.net,
        neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, jikos@kernel.org, bentiss@kernel.org,
        luzmaximilian@gmail.com, hansg@kernel.org,
        ilpo.jarvinen@linux.intel.com,
        Douglas Anderson <dianders@chromium.org>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-crypto@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 0/7] Add support for the Microsoft Surface Pro 12in
 1st Edition (Snapdragon),
Message-ID: <qfoobb7xrqkc5ivs3v3wcymbhywwqe6albcijchdmkhwrvdatg@pbsnwdrawko6>
References: <177869930359.1496076.12020223802779537187.b4-ty@kernel.org>
 <cover.1778822464.git.harrison.vanderbyl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1778822464.git.harrison.vanderbyl@gmail.com>
X-Proofpoint-GUID: 3ibDnb7UB6q56kqxLAIKjnv1Ftv_NCXJ
X-Proofpoint-ORIG-GUID: 3ibDnb7UB6q56kqxLAIKjnv1Ftv_NCXJ
X-Authority-Analysis: v=2.4 cv=BICDalQG c=1 sm=1 tr=0 ts=6a0b51ba cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=DHJDpsF2dBqhSPlo:21 a=xqWC_Br6kY4A:10
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=9VIlvAo4FWx-UwQJ4rAA:9 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE3NiBTYWx0ZWRfX4lI60XxpyRQu
 xOHKadvxG69I5iuC/JMZL4lpkYB5VETyPxbpSpNSkUGN+h4ouPDl0PIbFpgQ+pJzBIIHHL9YIM2
 sx8TvKEbmioEH2BfkzAvLvF4ksTijOcobGQ0BPpzvDReIr1HhtTiGBs7gJkoSPg4trAlieriSAq
 /CGZg2DHWsPLWW0wtOwjlIyQWeQi1fOeWnlwxBDgkiNkL7CT/4DfL715zsNgDNm/KFuC3zW2P1B
 sttcRmdko1SrHsxKT7BHPw4pr6694vMq/e1et4zPFiCSZ2fgoK1eNXQLwHtx7+VXjkrWCVfaacg
 KLSCRAVh1EOVT21VcEZYCENq7apUFUYjByMXaCN8c/TLS1SQvnlq+lue3RcLz0ePF8C5Ld2AX3E
 GRh0TOR+zeC+tfTGXPn0geV1e3USV+eKxc/QfOaRPOEEiIoN0Yrt7budF2PHrmEUeNvZWLWF0p1
 uVRG3lgXNjopEK5BdtQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180176
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108256-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,gondor.apana.org.au,davemloft.net,linaro.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,chromium.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89ECE571C27
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 15, 2026 at 03:41:45PM +1000, Harrison Vanderbyl wrote:
> Changes in v2:

Please don't send new iterations as a reply to the previous iteration.
Always start new thread for the new iteration.

> Ice device tree: 
>  - Updated to use 0x0 formatting
> 

-- 
With best wishes
Dmitry

