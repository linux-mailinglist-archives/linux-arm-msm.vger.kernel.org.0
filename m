Return-Path: <linux-arm-msm+bounces-102497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOnROV+012kORggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 16:14:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 503FA3CBD92
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 16:14:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6EDC83051C9F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 14:12:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ADE231A045;
	Thu,  9 Apr 2026 14:11:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="frO4aQnh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Cfuu3CqO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 611B633BBCF
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 14:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775743911; cv=none; b=GMQSG1Dk7TssGG1f1aVZPy/bL2baDLuO8e2XnrADDCxxpFTtH6lIMIOaUu2wIkdtsoa/iY9a2/diDkps/z4iKgdqnU+WX5+nm59yFJ9FEydMgirdBTb2U2vk47euPnmNpFqF+FascRdIUcYr3+CsAw1WoXJ9e7THtf3lLk0A9CI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775743911; c=relaxed/simple;
	bh=HMiZI0uPwQhrnJU2jsOiGFdKv+IJH5gq4nh4GJrMiSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHDBaEHwbaQqw2R0T+SH62WEOK6g9fHS8OCsL0baYvkNe7teEYmM8HBBbYU8wFI0DhMFdrcZOVXGX3CBCWBneDv6tGIvtmxYFyhl5HQSaYuJ9zilROEOmC69Pdp/ZOibeY5+9KT3osfRbs8mnMsdD4rUmk3Z6WI5n4K4Ds99bmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=frO4aQnh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Cfuu3CqO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639CxBF11433128
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 14:11:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RXM4/dGQCOY9WohzO9Vwfur2
	lRNX5z3S6aMHTL5x5+M=; b=frO4aQnh/4WwuUGFpPPff35zIDVr0S/j30OdaeM4
	Gp9F3m6sWRsMa6gE2PaTtPUdw4Akbmf0Fisdu/vCeNk8rNvdht7Tt30DS+lTR5+l
	bC35HQEQEfCS9/XXAwEJznE83Ac+u0L9rlcNtwjhqLclguQ4jRLnf0U2wGET/ya3
	G30dsponJasJJHOnz+oZJNMWF8mimcCiAQJwvGQYt04c9H36xuE4ybBb7/VlyFeU
	c3uAYx42txjataVz6z8br9FLGd7x77M8LqMeqPWo3iYRvF4RtBc4dadxN3rSWRzs
	P98ldQ+RXEpqXjefr40uN92DU/PB76v8QyykwlMCRKcHGQ==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckf89kw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 14:11:47 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-6055b9cfa08so317834137.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 07:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775743906; x=1776348706; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RXM4/dGQCOY9WohzO9Vwfur2lRNX5z3S6aMHTL5x5+M=;
        b=Cfuu3CqOK+E1YI8ArNj2TiFbfjzkvaXJwYSpZiPqbGuHF6UV1hkq7TRaoBNl9A/yYd
         w3RkCFnGmCln/4nd1N37s7BqrF2fccTUzZ71ygEhXcM+VpWeCxCjA+E69elgecixATtf
         EO68J+gjvALE8MjykQR6+IFDXB0+gBJxrsGqWwYSrtqd7ulDl3SFSLFEX93p5cpGTC8a
         geRZitnNT1NkXLyO93GbdNjzmygzwdu697axAK4hWp4+wYM6eJjvQyibm176NtBuT0Y3
         9A54Lf+E2kTMrPBUEg/RHyoFCWyWRDm6HMWbpIIwNJmkpMe+fAzR0TO8S6B7TUiKhckS
         rpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775743906; x=1776348706;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RXM4/dGQCOY9WohzO9Vwfur2lRNX5z3S6aMHTL5x5+M=;
        b=sqba6YmscE6/BRrPl/F/8JBSQYAbJc0jgRyxtjVZrDa8tK96JddNC42WrVKB2V7BI1
         Ouqbl6+7G0W/NkuXWMoGeSDJyLNtUeet6cwuApnwsRisGxniM4ocbKtJjptY1TESfiA9
         VHrfD+UTR+YKvQBuX8iWxo7G+69PFGvlO3Dbv6gkDMjfSP3/O56PM6FwOIdxD/51ecg6
         PG1Gonltxt/ASibjju9Jbj6NAFVqfWU0t/QYDcXmnebaeP5SZCXQtXxNpWfJGK4bl+8C
         LXzEUsSmwmgGd4PDGeIErGFfnl1/M+ecFJ1YOSzm3HYbMyuk0FDxnqFy+BhGNynuN1dA
         2oCg==
X-Forwarded-Encrypted: i=1; AJvYcCWat0R0tIBXGIIqOVl9oktHdEAHi105rnIpzW3UMNtP1QjoqGeU48CTNRuQiN8a4iRCXXqHrFKWtWz0O/oH@vger.kernel.org
X-Gm-Message-State: AOJu0YyWPSzUIuVocKlqx4pWQxDudRF/lm80ty93LdqFDTk6ho3Vay0/
	rcFMALl1+9kcHQIsENqREmL/YrJaYik0tt1ILnYlEfF5G/6d73dKTzwuGrt2SqVh0nk3Daiolg0
	YRB3gGG5915X66/D4zP4O4IOQmWUyBuA5BZv/4lm1l9DDsT5ql1rccCm2ejYsf/HcUfFv
X-Gm-Gg: AeBDieteqAWrSWbz5LrGOf60KXCEih5w/xxffy+M8H1T1zB8/3YodDlKxyP4g7+Cn2m
	JEGsQaIQy1hXlVdeRjAsmr7w3fogMBFabXJRpMr9RDouqTMgqW+f182jnQHgxSrNomWq/OBCchS
	ALRr34qHT3NC42Sr6hXTRS50C0nryRti/D4S2VyOmxrvU2i8tLf33AyVFyW+Nv85bdc7SOYmmgr
	ejfRW3U1M1a4eR5YVwVbzrkyp/DyRtMQyCrlwlZS3iLbphYjuxVRFu35CcTk8EmOkKLrCnYVyId
	honzK+tPmXOL6aE+bCOFAsBns3iywshOvel/4hThI9G/5Eg9QdJQKodT0HRjUMdXKJkpNqnjAzJ
	QFygdBk970B6DqtEkjqgq6g2X5yoL6z6uPG/Sjw6lcSjQ2nI6mXnRXy4MMm5XUZkX2sxwTYobin
	//E20BzK/O4u64BtrH4UgSfTsldfqC3QQXI+o=
X-Received: by 2002:a05:6102:418e:b0:5ff:cb2c:a04d with SMTP id ada2fe7eead31-605a50982b1mr8825228137.17.1775743906336;
        Thu, 09 Apr 2026 07:11:46 -0700 (PDT)
X-Received: by 2002:a05:6102:418e:b0:5ff:cb2c:a04d with SMTP id ada2fe7eead31-605a50982b1mr8825176137.17.1775743905774;
        Thu, 09 Apr 2026 07:11:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd1fdd274sm55855971fa.14.2026.04.09.07.11.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 07:11:44 -0700 (PDT)
Date: Thu, 9 Apr 2026 17:11:41 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v3 26/38] drm/msm/dp: add an API to initialize MST on
 sink side
Message-ID: <h6v7c5ily63uexzumctmtqgtgmmr4znv46s4hchagahj5h4rrz@g6basnvp5k5i>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-26-01faacfcdedd@oss.qualcomm.com>
 <4u5bt5y4suecanvxni2fnljdzrxnkjrg2dgkwzpj4pztvyoef3@nopu6m7w543n>
 <f08a3a89-4a02-44a8-a221-0d2d451d8536@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f08a3a89-4a02-44a8-a221-0d2d451d8536@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=S/fpBosP c=1 sm=1 tr=0 ts=69d7b3a3 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=BmWwVh5GUV5RoyxtEogA:9 a=CjuIK1q_8ugA:10
 a=ODZdjJIeia2B_SHc_B0f:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEyOSBTYWx0ZWRfX4gbOOp1Vn4Rk
 Ali4ElImZQNiCM3TO0Y3Jp/JY5aIfEzXoS2X9x9QnPsSIv8rHm+H5z1DgehKcg4ALr8+NImP18j
 YH1cCInz417IImf2GTsRlmL+no+Y5SOCOiy/Xu0Zx/JbENrrGQXaClj8Xtr6qtKTh7OvW1mAQZ2
 5TML9RT9JJtaLblbt+mhmRcSo56DZZ1pdLL4tLFFgEkHgZ8yBMp8nGMiV4FQg9kULPK7ERYzgcm
 hQWrc5qQiQvV7Ea95pg8vHvzP3a4enBCOLCjqtitCTNN6gnzWVsFpRdQb/2UoXfpfl6nU2WHfcP
 MGkrpgykN/IsSKdwgXr/sl61xAt4mIbdP+F1srGLGbfrWGyxS/DwbORDiGD1tctbB0SIfbIwS84
 zmuTlyTaaHNuC99QLbYvNld1oMxO9uN0463ID6zyrtoKC7A+iXG9mznHCUqllfcpBaj/cQPELCf
 u8LTSUBFIR6fxbaXZ0A==
X-Proofpoint-ORIG-GUID: MHDSGFxWSATlmaFaVs3Gdl58am24U_gq
X-Proofpoint-GUID: MHDSGFxWSATlmaFaVs3Gdl58am24U_gq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604090129
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102497-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,quicinc.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
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
X-Rspamd-Queue-Id: 503FA3CBD92
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 12:19:49PM +0800, Yongxing Mou wrote:
> 
> 
> On 8/26/2025 5:26 PM, Dmitry Baryshkov wrote:
> > On Mon, Aug 25, 2025 at 10:16:12PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > If the DP controller is capable of supporting multiple streams
> > > then initialize the DP sink in MST mode by programming the DP_MSTM_CTRL
> > > DPCD register to enable MST mode.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 55 ++++++++++++++++++++++++++++++-------
> > >   1 file changed, 45 insertions(+), 10 deletions(-)
> > > 
> > > @@ -315,18 +345,20 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
> > >   	if (rc)
> > >   		goto end;
> > > -	drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
> > > -	drm_edid_connector_update(connector, drm_edid);
> > > +	if (!dp->mst_supported || !drm_dp_read_mst_cap(dp->aux, dp->panel->dpcd)) {
> > 
> > In several previous patches, the functions initializing MST can
> > return an error, leaving the user with half-initialized MST. Are those
> > errors a safety coding or do they have some real-use usecase? In the
> > latter case, it would be nice to keep SST wokring if enabling MST fails.
> > 
> After plug in, MST will active when mst_active == true (DP_MST_EN
> programming succeeded). Before that point, any return will continue to keep
> the system in SST mode.

Ack

> > > +		drm_edid = drm_edid_read_ddc(connector, &dp->aux->ddc);
> > > +		drm_edid_connector_update(connector, drm_edid);

-- 
With best wishes
Dmitry

