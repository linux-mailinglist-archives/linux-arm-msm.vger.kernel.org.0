Return-Path: <linux-arm-msm+bounces-105079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIDpJnMZ8Wm3dQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:32:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D83C48BC6D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 22:32:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E89E4300E597
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 20:32:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1248740DFD3;
	Tue, 28 Apr 2026 20:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mGHrAYuv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RSY6OKBI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1114A35
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 20:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777408368; cv=none; b=FWODy7S5NG1j19nLki7/oN1lK9ZepYbqU/zpx9TuwH4V0HXfiI+ko9M8PMDcpPhsfYZ4e0ABtC8hteauCaXtzocws/hLaPmn6sYHE5SECyzd5yhDYmd77Fyczj7t0YvqvQYouBXumPlya8kyS6Pe98kqiWsSpZUWuAcrDzuSfjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777408368; c=relaxed/simple;
	bh=HQMh5PY8nqJe6O5jrTRy7CY76iGabNGL7qd+UJ3vjoU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZUANcEk8hxrEXUW9DRwedef3oTvj1G8o0Q+HVt5m0B689GM1MH6tsLCTpJ9DFpLMC9hSK+zMDrtCFDMsZBS2VfNJhTg1fhTH1c0OHzK6l04pieeuahiQLi2rhzQKKvJ+ouuR/oxqsiBqga90LZi1OszJu7ocm5mJG9ZiUOG4DgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mGHrAYuv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RSY6OKBI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SIuM3I3347474
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 20:32:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=p9ZHZ+Txy5mi1xMSfTEMkpbb
	O+fn+/HINQfWSf0RFmg=; b=mGHrAYuvqYqk+iIbadUEARFBN4q2qHFLJ0TCZ+en
	thTyU8iFTiMT3i3M/lDdrX7EaT+790HtDfBzB8R3Aitm1fTXx4hBGsBpP5AZMgUg
	e2JINAR+i51/xX5+aNua6OVhAIomFFDxo6l2JblcMGSz+DKhfD8CR1oNoOBNWR5c
	3CoVlfvRq+bEDF7h990WwRTConFWdEqJr0l/FdRXFY+1aecxmsNzr8RJIT915Oj7
	WI0Dku2hJAPwwKOKti8fGjRwQT9e5oUIvvAwRZUft1V9r9dK3KP/x7Ollm1qXB4r
	QHog+JwPD6EjJWsAolHkK9o7caT/0XGDquQ4NhR7TRHSbQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4du2m4r9nb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 20:32:36 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5738ad13968so5929202e0c.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 13:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777408356; x=1778013156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p9ZHZ+Txy5mi1xMSfTEMkpbbO+fn+/HINQfWSf0RFmg=;
        b=RSY6OKBIrKbDrzjIyo74Xf5ZoUCwCHs/c87a0yCLAP8+j7suMLL8qSeANqmDDKgyqM
         bzTSQWuTJXRMnTFrio/nnqaUvhIi+SLm3gXoLVYqXmBafm06vTz0oni+IirFQrNl7zD4
         oTbQqKU4ZG9xXJ5AVDIcg3gT/8Ynm3tzFMOhvB67KWAMtguJjVscSUssehyzmPxNCD3n
         M8fxRGceMZWhomQdGhKEkDY611kWhQBtClea9eDv00EwzWlsyi19YQ8zHJE/WHK5EZxb
         ha/RaYHdXo/dnn+GsIRKwutc+/eT6Y43SKDIeIzcDig/tsCTaKLjySM/JVFOdeMJZ2HX
         ifog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777408356; x=1778013156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p9ZHZ+Txy5mi1xMSfTEMkpbbO+fn+/HINQfWSf0RFmg=;
        b=J0mtc/DuvaIN1559fpXSkGwoFsD42iOcTIgVcAFJgDjceBEAC4Vna4mlrFC4KCTfv4
         2/p/ac7yPh35VzOnTcGzH9MzkGE+pPi74aT41fo3NBvbi2sFof/+y7kxl4111kngkyVM
         5WtwF3CH84WKGdDj9FClq8qmmjqBEpfwXS/a3VCKystdzkn4YHv5VZmOX0q0/Z8/qsNS
         WKdFjmRE0jYD/Q9XCMmP4eqCBR75795Kee6ywu2vRC3IKhCK+Dc4DVR/EnXvndD8SlMu
         QRcSWOqECQtYUnSNlRDG95gS3jIYc5rehPALrFw+QyyubxxVttIAw7+RQU5YfSN99iR1
         4/hA==
X-Forwarded-Encrypted: i=1; AFNElJ9rT0yOWmfR1BsJWOw67e8p9sKEZWCgrFnmWm/4Typ5aUYiaBSIiJqNYHUQwDfh2zXu9fKcnFopMYiRlta+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8FXY3pcEQFAlEw8CDP5Q82lAyGd/vhRI7WDIQCdTczSq8T3xc
	AY9F6HR/i333jbFbvJpt2cOx9aeT//N/+CDH3hrSbDQl1NeOvPzTKRGU+U/YqOWXH6U31+7n34Q
	o/nQ+h5tE9zFApkVpgzDSaKkGp6QGf+Da4UkAU006ATQfnYt7Y3P4GezKTbNbNh/r7I/R
X-Gm-Gg: AeBDietQYombdZD+WOvOrb+m+2xMihQBi95zlsPGAZW+Ayc+j8V5sqSyhfUthIHLObP
	5tQOD7I8ufphSi1zQsr0kAj4YZSOzHjMm1+4hKyPI6+z4n9IxLO2x/zEXK643Gz5aleP420mWTD
	6hgO68slfi4ge8ayc5zcbpEfHf32o9kZkAeJxtI4L/kfvQZMeV8m2WoqKOfmLWw2tbV0YFhz/WZ
	UZhiSubnzXQC83031byOa1FyjiUWJiPKT7NId1HZFyNnmN503aWfcDiEC5ZI9rDSZzUpJHeniVG
	CzC8Aefu4Sa41Urpgss+qVKvU/OWq46vIp20ZGzuIQMN80narhytSfLunxUDiD1Yz+qvrflxVd0
	GN4OMKSWXJvc6GFO+g68paYKKpQZb8arNG+brlnVRXbJli4CDMTJ25OWDYrCBFdONbI2Sg2Ox0s
	nkKA4TOj19yn1y5ryNRpJG0W/Rqsg1fadeKdESdCyGiw82Mw==
X-Received: by 2002:a05:6122:46a9:b0:56d:451b:e4dd with SMTP id 71dfb90a1353d-573a56b3c5fmr2957432e0c.12.1777408355983;
        Tue, 28 Apr 2026 13:32:35 -0700 (PDT)
X-Received: by 2002:a05:6122:46a9:b0:56d:451b:e4dd with SMTP id 71dfb90a1353d-573a56b3c5fmr2957401e0c.12.1777408355449;
        Tue, 28 Apr 2026 13:32:35 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3924d12f94csm1201771fa.15.2026.04.28.13.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 13:32:34 -0700 (PDT)
Date: Tue, 28 Apr 2026 23:32:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Xinliang Liu <xinliang.liu@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Yongqin Liu <yongqin.liu@linaro.org>, John Stultz <jstultz@google.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Michal Simek <michal.simek@amd.com>, Hui Pu <Hui.Pu@gehealthcare.com>,
        Ian Ray <ian.ray@gehealthcare.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 03/11] drm/msm/hdmi: switch to
 of_drm_get_bridge_by_endpoint()
Message-ID: <qpt5vwoyin7ox67ysllnaojduwl777e3zzm2rvw54eogeewoke@gysroqruf4v7>
References: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-0-a537b5567add@bootlin.com>
 <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-3-a537b5567add@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260428-drm-bridge-alloc-getput-panel_or_bridge-v3-3-a537b5567add@bootlin.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE5OSBTYWx0ZWRfX9CdMELbzLB7c
 Ygwj0KufW64cyFx4ShOI9xdTVUFW5Ci3YUe8MIK0JwpQDMr17FhWubWRWTSqh+XIaad2Ifk7nO/
 xoTZZp9TvpO/1dMIlXmj7NHXWF0bG4UNgj5E2uQLgCyUJQEEc3hz8dJqeN+w2VsmhcHjW2FEjUg
 GFAmIZVsJDqzWb9YrPz8dFXUAVAtKfJQodPQ4WylFn2Yc81rOyK3X71CBeGCcjutj8gmsv4o7ZG
 gAUlXMdWifjg+Fb81GyVaxBCpayF3YTQObSTqQ9DtH0V/A8l/SKmOK29fz/cood67adheVSWgBm
 DpovUo1+uE/sPyly+r+0RcX73BXQbZ33+9Oq7IyasJtqYrgd0nQfapsrYBgTTn+6iUT0TZ4bQMT
 iYeJlG28eKZMjmJPoo2gFj6juoSJhPe8DLtALtv6cL53HqwJ0tfYEahObKmbI0P49SLkiZtC5xk
 zklvpDdVcJBXQ7jk0iw==
X-Proofpoint-GUID: P_MzZR9lk_TLTB-IlJxlZyIddFxZ388C
X-Authority-Analysis: v=2.4 cv=MuFiLWae c=1 sm=1 tr=0 ts=69f11964 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=P-IC7800AAAA:8
 a=EUspDBNiAAAA:8 a=hXVsb92WUBna0ZnZifYA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=d3PnA9EDa4IxuAV0gXij:22
X-Proofpoint-ORIG-GUID: P_MzZR9lk_TLTB-IlJxlZyIddFxZ388C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280199
X-Rspamd-Queue-Id: 2D83C48BC6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105079-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,google.com,amd.com,gehealthcare.com,bootlin.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,bootlin.com:email];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]

On Tue, Apr 28, 2026 at 05:30:52PM +0200, Luca Ceresoli wrote:
> This driver calls drm_of_find_panel_or_bridge() with a NULL pointer in the
> @panel parameter, thus using a reduced feature set of that function.
> Replace this call with the simpler of_drm_get_bridge_by_endpoint().
> 
> Since of_drm_get_bridge_by_endpoint() increases the refcount of the
> returned bridge, ensure it is put on removal.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> 
> ---
> 

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

