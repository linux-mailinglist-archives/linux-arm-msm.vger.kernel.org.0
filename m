Return-Path: <linux-arm-msm+bounces-118546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QvGILjJwU2qTawMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 12:45:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B1588744675
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 12:45:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=SHrCHjqs;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=h0lMdhXF;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118546-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118546-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 01D1E3002F73
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Jul 2026 10:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0331A3749ED;
	Sun, 12 Jul 2026 10:45:01 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727BD30568B
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:44:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783853100; cv=none; b=Nnsd63j3F3xnzJ70gFpWtZYZ2DauENeyHtaIVgNP/hsQ2btwYHoFDx7ozS5T92yjj6/2TrvIWC/E33xE2WV4WUzpEE2XuBt1kOuMz+yLDI0+ZpH4gyYA0xPcXbxW8XAD2g1L5t26NeCYsdAP7hdUzUr69RqypkE+9rnjg6ibAWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783853100; c=relaxed/simple;
	bh=HMMx5y4y+5aOkUrSOSkSWNHfTNEsJlBry5yhP5+PyqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QIZKSkPmVw5bkoXG0SjCgKdN2L3h5z6Qja33ezPigWZNjxZuMhDtEZtD7na2EA6Y56dmPIAvbHPSle36VY4qiETIncpUOvEYpdx3FyaNc/0vg+OTbGAIcqtRXN2nlz0ZMm0wTjmeek6pXeNCTRXL8iIf9AAE6+hLno5LdTnufnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SHrCHjqs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0lMdhXF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66CAdXH12390387
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Sb4ApefZutryRdB75QWmCb7+
	x6M/kUCog+7gDuEDR90=; b=SHrCHjqs4df99NJG9bdHq119sHRuizAVPkyTBsbi
	mP51su7CI5aprYTPnlfhgyhKnr/zIt6o7Z01lHjNMV95wVeOyfWqIG7WJOeQqTFV
	w08ooD1SMRKwk0y3KWWKl/aO9UdzS/vjtU1NJwSCQzXEY7AD3Jf0GSyAyzKO1oZr
	nrEQxsMlq7BKi9Sm9pjThbaKr5hDuSSrARY8SZHy6EGueoQuiD6xmPVoJSIMUnPv
	keiJctLBV1zCeh2Yw/ZSgwgB6/cA1fyd8VoF8A7V60DZjcVl9z5UJ361uQsa4Oet
	jDuWGQnsv1DPTrXlstLtpV1WASkoIhBCtH1KGa673UFq+Q==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbecgjngk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 10:44:58 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5a787be4ee9so3184404e0c.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 12 Jul 2026 03:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783853096; x=1784457896; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sb4ApefZutryRdB75QWmCb7+x6M/kUCog+7gDuEDR90=;
        b=h0lMdhXF7MhVfsQNae4PbC6b6mmvL4SuzyS63cQwsJ9Tx+ZA774XC4Ydwr8ZqdaCOm
         0p2eWkfh8z/R8vSEqalJotY/A/SZ6BVUEVeNQ3VcwZUROq5ioo/9EczdwcgfZ3/dp9TE
         W8V3WMGcGsHd52Yq+OVNqYDExjs6izV9Ml3+5CiQ3NHwE20b8N8Z0x+Ewd17tAGPSWub
         1Fp9mLnX67n4KiXJUoeCntCb1400HJxdBo13v8TkoMRVkFi8nc5W12HZx0jVZScaWcbc
         bE9+0+kaNF5Z7TMnRpN+D8idxaZuzEjAz76BM6paYSgVA9/B3fXH5B67jJQ74zdMvZxZ
         puZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783853096; x=1784457896;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sb4ApefZutryRdB75QWmCb7+x6M/kUCog+7gDuEDR90=;
        b=o6emNW5nf79sVZnE0U7Gnzqzwbmrx2DJ1BmrUzJAZ0s3JBKSL/1njSTC10J8H5cGYC
         KB/AVyHtFVF7L18K8EXYAc6+B++/TKMaF0t5y4FhLr0LSP3GENHpfAakY5RG5tN3bXOt
         k1udIp01wuUwyo1V5phgE8lrJ6sX36zZ7lw1n0KnY14XR99o5Om3pVDEqigVPuJ0kbsC
         LNNEPN8umxtX9so0rofWO5+1RWyq9lmKa1LYDzuv9eYQ2OHwFgbLQRWgdCd1Z9KVpyPp
         fVGjL2bf0BGOCHsXvidFOJn04f93OjOlIisvqI2Ww06P9gmIkEYWdmQvFXnPVuJqsCxL
         yI1w==
X-Forwarded-Encrypted: i=1; AHgh+RqsBhSrtJ5qiNB8IOwyqe3XxD7o/3mHSQ9K66ZDEWTCU6AOYd2Zp5LK+npmi67gr1qvhe+ZJaSGD1Got7Tv@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4INbOE31PgUo2j0znVeD6RPnozvowltJ7iVYL3uDSk7dN8jWy
	mmYWoEYLn81LtFSm6h/JplvUT98Iq8OtBTnukSBcbz5mE4WZrU7P0bTUcBrea1jcsQJvBN0rBMn
	ywo0DV2aK142g2NbygLSQneU/o5r7A07fk0o/NvpNf6njIrnlTffEd0bpIUlFkngB/d+5
X-Gm-Gg: AfdE7clSsm/9HH2/ur7C5XE/CIPHs7ZtcFxI7rePjhd8iZ+SnwLmyC8Q69mO+EHC58D
	lS/Em0zU3tSagfDKM2/SuUZJX8l4smNuUKilXTpcdr7Qp/HQlomshfHX9WldRU9olHEVDcEHB2h
	8hl70ZtvWSxTNH6MJJeX9yY0/e/J2LxGN6xDavnG3JFZccry5+m+EQoG/J4nKy9Q7Ge1L3n7Tx2
	kiwnfanyGMFsXvEGr6IzsqlviwS5MOB8mjB7Hm72pgLqb5jF2KeM+z4bVHkx59EY9G6/VP2e9HI
	f8RyaFXgTYnjdwFBcP4qaVDxU3eo3eFy3r4FwDNkiUWjovcMHjkcEwEK4GyLG3NrWxdEjwh7jDr
	Y6nTawVkwtWwrrHeiooSvb3gZsp+L8j9Hly9pq6BB9LQyTDpfXk8xtjCY/44T72wP6G5hstUZDb
	p/vWD8ghC2+HnOBYXrr1+zewMa
X-Received: by 2002:a05:6122:d29:b0:5bf:bbe5:372 with SMTP id 71dfb90a1353d-5bfbf3b676dmr3706441e0c.12.1783853095629;
        Sun, 12 Jul 2026 03:44:55 -0700 (PDT)
X-Received: by 2002:a05:6122:d29:b0:5bf:bbe5:372 with SMTP id 71dfb90a1353d-5bfbf3b676dmr3706406e0c.12.1783853095217;
        Sun, 12 Jul 2026 03:44:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c84b854cesm19921011fa.27.2026.07.12.03.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 03:44:52 -0700 (PDT)
Date: Sun, 12 Jul 2026 13:44:49 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
Subject: Re: [PATCH 3/5] drm/msm/dp: suppress bridge hotplug events during
 MST operation
Message-ID: <fozk5fz6bgat55vmlgyvovnmfzabjprna46cmcaoh4jyrwmbtu@k2qtjgip5vg3>
References: <20260629-msm-dp-msttypec-v1-0-646a10256233@oss.qualcomm.com>
 <20260629-msm-dp-msttypec-v1-3-646a10256233@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260629-msm-dp-msttypec-v1-3-646a10256233@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEyMDExMiBTYWx0ZWRfX8c1m6xWS/m7f
 2TV3PBM8fSPHlsPwIgOI9dzZzecyzxVSjSwgfg2zeWdaQrxvuBT37Yd182NDcril/TdwsQaTAxL
 mtS7Mv6pg+kExIqU3IXD+oxQhlCLelY=
X-Proofpoint-ORIG-GUID: JPcJEMDeUVW8YQ0d8JHB6blA_w_GEtrx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEyMDExMiBTYWx0ZWRfX2/v+fTkCwtT3
 0nl58EyJoOjzr2/nXfkbp3hQF/YRTxxpFXxgL6A5LRnFDmerngv59043aKCROkxM7KrwEWKwD1x
 s3eA3X5R56twmS1o3F1WfmU59PfKDSVH0Us1r/pN2UgS8Q5n1T5kMIm0sTBQJ9mHjM8R0I49c79
 JfIcUC0Fka/g15GMHZ7d30f+o9XWOSdLIXcDv9JZsUxtFuxeS8SyIIt/L0b7M/JEkHJ2pNmWn/M
 UVBB/vg5lRx87itLXrWNfvU2JqvOB/YQQqig8XDbXzUZIx5LwEdvgEUQoobOcMO0F26Dda9NyhE
 i9myZxliim/AUH1vIrwvTsHROfN3zV6rYpkYV5srmgPCJN5TlTicmiRDf7oWHDthdFetSFaipzM
 w1p28xxs3PtyD5SC3JVR7LAPMsFcJnEnbFSTFBy9eGOF1Eu6ZKu7Rd6gUW/UeNyOC9BOx51WKJb
 xo/qfv4Q/C4wj9oaBIA==
X-Proofpoint-GUID: JPcJEMDeUVW8YQ0d8JHB6blA_w_GEtrx
X-Authority-Analysis: v=2.4 cv=KM9qylFo c=1 sm=1 tr=0 ts=6a53702a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=dRlQVyWoEjKAXtvccWIA:9 a=CjuIK1q_8ugA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607120112
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118546-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:luca.ceresoli@bootlin.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:khilman@baylibre.com,m:jbrunet@baylibre.com,m:martin.blumenstingl@googlemail.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:tomi.valkeinen@ideasonboard.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:linux-amlogic@lists.infradead.org,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:freedreno@lists.freedesktop.org,m:jernejskrabec@gmail.com,m:martinblumenstingl@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[31];
	FREEMAIL_CC(0.00)[intel.com,linaro.org,kernel.org,ideasonboard.com,kwiboo.se,gmail.com,bootlin.com,linux.intel.com,suse.de,ffwll.ch,baylibre.com,googlemail.com,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B1588744675

On Mon, Jun 29, 2026 at 10:48:05PM +0800, Yongxing Mou wrote:
> The DP MST framework already generates the required hotplug events for
> MST topology changes.
> 
> Suppress connector hotplug event generation from the bridge connector
> path while MST is active, and continue propagating HPD notifications to
> the DP driver.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/display/drm_bridge_connector.c | 6 ++++--
>  drivers/gpu/drm/msm/dp/dp_display.c            | 9 ++++++++-

No, it can't go as this. The drm_bridge_connector part should have been
a part of the first patch.

>  2 files changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
> index 7334d6677604..82ed0dc450ab 100644
> --- a/drivers/gpu/drm/display/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/display/drm_bridge_connector.c
> @@ -162,6 +162,7 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
>  {
>  	struct drm_connector *connector = &drm_bridge_connector->base;
>  	struct drm_device *dev = connector->dev;
> +	bool send_hotplug = true;
>  
>  	/*
>  	 * IRQ-only notification: extra_status carries the event but
> @@ -179,9 +180,10 @@ static void drm_bridge_connector_handle_hpd(struct drm_bridge_connector *drm_bri
>  	connector->status = status;
>  	mutex_unlock(&dev->mode_config.mutex);
>  
> -	drm_bridge_connector_hpd_notify(connector, status, extra_status, NULL);
> +	drm_bridge_connector_hpd_notify(connector, status, extra_status, &send_hotplug);
>  
> -	drm_kms_helper_connector_hotplug_event(connector);
> +	if (send_hotplug)
> +		drm_kms_helper_connector_hotplug_event(connector);

But now I can also see that the idea seems to be incorrect. You are
preventing the kernel from sending the events, but it doesn't really
matter. If connection status oscillates, then other components might
notice it even without the event being sent.


>  }
>  
>  static void drm_bridge_connector_hpd_cb(void *cb_data,
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 6835c68fe510..bc93b566fbca 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1790,10 +1790,17 @@ void msm_dp_bridge_hpd_notify(struct drm_bridge *bridge,
>  			msm_dp_hpd_plug_handle(dp);
>  		} else {
>  			msm_dp_hpd_plug_handle(dp);
> +			/* mst_active is set in plug_handle; suppress SST hotplug */
> +			if (send_hotplug && msm_dp_display->mst_active)
> +				*send_hotplug = false;
>  		}
>  	} else {
> -		if (hpd_link_status == ISR_DISCONNECTED)
> +		if (!msm_dp_display->mst_active) {
>  			msm_dp_hpd_unplug_handle(dp);
> +		} else if (send_hotplug) {
> +			msm_dp_hpd_unplug_handle(dp);
> +			*send_hotplug = false;

Why? Disconnected events definitely should be reported further.

> +		}
>  	}
>  
>  	pm_runtime_put_sync(&msm_dp_display->pdev->dev);
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

