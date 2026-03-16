Return-Path: <linux-arm-msm+bounces-97969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +A8YHEUPuGmIYgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97969-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:10:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D330829B134
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 15:10:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7C22430B2644
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 14:04:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A53A639B49E;
	Mon, 16 Mar 2026 14:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YBsuAzhu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y0KasC4F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D267242D9B
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773669893; cv=none; b=EmuJDLPvhbGbpBbhotWA5NxLksF2zWl7mRmZEFwK3+n77fdsyZ4FB3zwfZP50RDL8IumyrMIlVJvMJBHahRiYou1HUHjY2KE/CU/OYC5D2HZVqjbCxTTuHoi4ECfN+V9P26oqBnf+yi/kN5hcOJUiHvg6E94YiAB3KxtXSEw0Jc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773669893; c=relaxed/simple;
	bh=tNth7eKz2KTziNvgZEKkQtt0GhfEtHsc3tpU9tIDnWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E+lFamKge3lmOKkwEBUCGtsu2pG9/4fadXnp73KEld1b7viqDJ1NOMEvaj3BPswFYVnSI0yDf538Gchm1PB3XUE5kUNDW/Mg8Zkk6mw23WCCD6NJemJovr7mTCG/GJh/OHYlzMp+KuriDwuqI86wL7h3XOYaf1E3C2zqNFciX9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YBsuAzhu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y0KasC4F; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62GDdZau041563
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=TXMzseGdS1JyGf4j7zPhMUou
	RAfM9EvXWtgjN13Iduo=; b=YBsuAzhupByTJfJBlwIqRmPVeqBg7Depk4yhjrNL
	2NoPy0cexHQwdlYQ6ddvOiJugAWiE0JrF7xvL3P80bR7duIBVnqqooXa971KGB1S
	bw0L8yobsQ3/NG430SB+xgDeyH9DbZe7XIFT0B1zJjGM3wJ5ZsSitnRiozD1enBJ
	XdOfG0CNKImUGgxfv01j4+PYx6TtSn++xk0Mncu88LZ9BoA8nS5jgdg6LEglQlpy
	wT+16cmko+W6eyF/df4eU6xaQWOXbpOPqR8e5aFJLTdxGAtxP1ueivxob9ELFhZI
	NVxNPu8bF8rLW1fbSurhKmRNhky/f+FGZQSZeTC1pWoj6Q==
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com [209.85.161.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cxdt81eq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 14:04:51 +0000 (GMT)
Received: by mail-oo1-f71.google.com with SMTP id 006d021491bc7-67bb2273d42so80058920eaf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 07:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773669890; x=1774274690; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TXMzseGdS1JyGf4j7zPhMUouRAfM9EvXWtgjN13Iduo=;
        b=Y0KasC4FhFJc7UnRzme4CM/oArCFSn6PL/RKXo2/ueR8NM1ebGvhmHXxYjhcfofMGg
         tM0k//BCOsFj9wYXolmjFmq66lsTPBpIcTuFzHQBi3/SlAix5KkB/3ZznChIK6T8o6bt
         VNvlkEEntleZfz+5SNg1ITaVb9gtRMulvDv4S3tTYbGThkIcAXtZmLbmN1834Y0DILze
         TP/Z5JBm1iSMla5747ZPFh150jcPBlm+H99fVED7xLNKXt2W0LeVScKsnjsg4bhZAxBO
         xNp32hFd0X/CSyrTjJAnft9B+djGEFV/p+vkjt3MlVNfmCAmoDxJgjtgnyf8SjO5MSMT
         nA8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669890; x=1774274690;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TXMzseGdS1JyGf4j7zPhMUouRAfM9EvXWtgjN13Iduo=;
        b=QZdmtyGBIKSqaF+hkFQp8dz2LnJwd7WIyImQYqlhO1XlMjaTcIW9lq/IeJwkCS9DD3
         lPZEK0eU1dXe4zEB7NOHqODnfal6x8Jp2g8e8XVWx0VNoMcllls7B/+RFqRx3elSD+nJ
         W5IOtCJsoM0z5nMLyXfGs8qIaCAuwf2XaIrs0ZZbjNF+klQbtWGGsyMewM9/S49+PqHp
         vzWakm8qYnn8fKzW/LuBwaNGip4BSK4QTyKPAJNGFDCmIFZaqSJn+PmK+oL5Qv74nFv3
         i3QU528bLpvFAqlsykZKYvxffYqwdaYoXqsNlneOJzIGMzyRETDYCHVEyv+bgeRZW+hH
         R5YA==
X-Forwarded-Encrypted: i=1; AJvYcCXpikhmcFkLsSNePgZybMFvD7O2/BpfsuePxo//FsYX56PHOQQw2pN+xuDPl+pBJH++FX9XcFD+Fyq5Yi9W@vger.kernel.org
X-Gm-Message-State: AOJu0YyLgaIdxVmNPhO5kgYteRSwWZ/SRCN28mbEP1u0Zn+/2vmbuW0h
	rmNcYVpgNuzmG8DEWuDoIj6izEAdnqCjjT0Rj+ZmICXYuMFLln54r+dxQE8Dym+GPtH39UNpX0m
	C9fjq2EgSXLBys/r/Ac+c19EFJDBPzafo8zxzKi8avnTxfvj9YHt0y/2z6GxpZ9inkfB/
X-Gm-Gg: ATEYQzyPDM+iiygIEkvC2Yr9086R1x6avlqOP/CO0WIKbXw3bJeH2T1AHsL/C2qOoTs
	suXPm9M+4SZZxDA5lvTbBQeqB4b+2T+oHMZCAMgYeLJVzmWa/yZuuEynA6AOIw2FzJUbFr4kTRC
	lseH7s6+oHyg1tb/KFMeVczCIGQCUr7krtkzDAwGsxzF6JYyH3lKwG/DsKtRD8/1XwXxFBS7koJ
	iFhUOZuKKADt8VicP7sSgaIC2L6D7hEDeMnL2InoAhNRVxo7fPk7UubHymbS0yrAW/f4qJKoeZ9
	TMVw3teTdWDvi3Pe/68Z7sKsaS9dmbCujVif3WO0CGoUy6yxcgXFwM/K0Cja82cDrnGaxakTCGm
	69ogndioIDNI1USRMDK1pAZXn9GGqfHwffvQvGyFm80GyWKXw5WB0i0okWyFaZ4ipZ2ZzjjuIcv
	y73nbXirmskBIN+TcY6Z+TqfG6w+dtuX/U8D8=
X-Received: by 2002:a05:6820:220f:b0:67b:b337:d421 with SMTP id 006d021491bc7-67bdaa8b763mr9184162eaf.70.1773669890558;
        Mon, 16 Mar 2026 07:04:50 -0700 (PDT)
X-Received: by 2002:a05:6820:220f:b0:67b:b337:d421 with SMTP id 006d021491bc7-67bdaa8b763mr9184114eaf.70.1773669889944;
        Mon, 16 Mar 2026 07:04:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15636206bsm3550873e87.67.2026.03.16.07.04.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:04:48 -0700 (PDT)
Date: Mon, 16 Mar 2026 16:04:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 17/27] drm/msm/mdss: use new helper to set amsbc
Message-ID: <hmamyk4lzo6ekswqvjlen6hc5stny2ucj5fxy5g2tvl3fqpbq2@ux7l4j4drm6z>
References: <20260312-ubwc-rework-v3-0-b7e8f800176a@oss.qualcomm.com>
 <20260312-ubwc-rework-v3-17-b7e8f800176a@oss.qualcomm.com>
 <19b36a86-12c7-4710-8f80-5e27c9c00e3c@oss.qualcomm.com>
 <uahvm7kvu2vi6o6mwznn5eqzqqscxmfetl4c3q3xa2eryg6ode@ltxfpjmqbrrt>
 <fe151ffe-aea2-429d-a725-4697381c4a93@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fe151ffe-aea2-429d-a725-4697381c4a93@oss.qualcomm.com>
X-Proofpoint-GUID: OJnWdD0dwCJUDFDesYLk0BKUKmrOILL_
X-Authority-Analysis: v=2.4 cv=CKInnBrD c=1 sm=1 tr=0 ts=69b80e03 cx=c_pps
 a=V4L7fE8DliODT/OoDI2WOg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=rdkhQm5gyLQ6vEK1D9EA:9 a=CjuIK1q_8ugA:10 a=WZGXeFmKUf7gPmL3hEjn:22
X-Proofpoint-ORIG-GUID: OJnWdD0dwCJUDFDesYLk0BKUKmrOILL_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDEwNSBTYWx0ZWRfX0H3VUVIlMTpj
 LjrP99XcLtTbkHAGdkRiCKSK4AoIWEP2BNTfNqI8tbqiGvxQSwmeJISQGeFhXpA0zv/TIWORutN
 TeFhA1exlwzATNlc1oD1s4VwDbghR0s279wVl6nfJDU1/PqVVuNwQXAyFnJryQvpR6W58yTPL17
 pCv+ftxItKgA3ApKd2rpU0y5QlugjmhnSWjRe47Ju1aJM2EeaQIao1+uIFnfosjr5XJBL0Q2o+y
 pS06F8EdyL/RzSn6D3dacvDX3s/npdLU2p6R563OAEmIbj+TRtzu0ijsWJpT+tQllfMmK0MsgN6
 idKYZk3GahdHlqUYjgFjMhvn7FOszK+RyPQOva9l2IzzrB5LF29UHslpInOxiI9BLFg8Gc3qWlk
 hTfLG5w/ZSbC8+5zFfRwZD6GgL12ku3g/HBKI6r5Oux6lKmKAyBQVNJhELvddWGGpC50z8efDS9
 YnVY9dQHu00MTHiKkYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-16_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160105
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97969-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D330829B134
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 11:08:00AM +0100, Konrad Dybcio wrote:
> On 3/13/26 3:26 PM, Dmitry Baryshkov wrote:
> > On Fri, Mar 13, 2026 at 11:19:59AM +0100, Konrad Dybcio wrote:
> >> On 3/12/26 2:29 PM, Dmitry Baryshkov wrote:
> >>> Use freshly defined helper instead of checking the UBWC version
> >>> directly.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>>  drivers/gpu/drm/msm/msm_mdss.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> >>> index ca59bcdde7b2..04efc29f38cd 100644
> >>> --- a/drivers/gpu/drm/msm/msm_mdss.c
> >>> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> >>> @@ -188,7 +188,7 @@ static void msm_mdss_5x_setup_ubwc(struct msm_mdss *msm_mdss)
> >>>  	if (qcom_ubwc_macrotile_mode(data))
> >>>  		value |= MDSS_UBWC_STATIC_MACROTILE_MODE;
> >>>  
> >>> -	if (data->ubwc_enc_version == UBWC_3_0)
> >>> +	if (qcom_ubwc_enable_amsbc(data))
> >>>  		value |= MDSS_UBWC_STATIC_UBWC_AMSBC;
> >>
> >> I know it's already there, but fwiw downstream doesn't seem to be
> >> concerned with toggling AMSBC in MDSS (perhaps incorrectly?)
> > 
> > Downstream enables it only for the cases where encoder and decoder
> > use exactly UBWC 3.0. This is not completely correct as the bit doesn't
> > exist for MDSS 6.x+. For 5.x this is equivalent to the code from the
> > patch: enable AMSBC if targeting UBWC >= 3.0 (because MDSS 5.x don't
> > support UBWC 4.0 or higher).
> 
> Right, this seems to indeed be the case
> 
> While trying to confirm that, I noticed that some lower-end MDSS 5.x
> chips (like Talos) report UBWC3 in the register, but the MDSS docs say
> they're UBWC2 - any idea?

I don't see a complete pixel format document for Talos, but my guess is
that one of the blocks (GPU, Venus or Camera) doesn't support UBWC 3.0
pixel formats. MDSS is just one piece of picture and unfortunately we
need to use format which is supported by all the blocks.

-- 
With best wishes
Dmitry

