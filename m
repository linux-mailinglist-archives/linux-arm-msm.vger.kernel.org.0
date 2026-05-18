Return-Path: <linux-arm-msm+bounces-108260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sPMAGjJUC2qYFgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108260-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 20:02:26 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C4766571D9B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 20:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C82C3046EA7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 May 2026 18:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 30434332604;
	Mon, 18 May 2026 18:00:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RSDROQY7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BRxaWsZ9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3723935F184
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 18:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779127232; cv=none; b=hO/PLyokFePTbxX3rop6Z7npxQk4VOReKhTrlnirqkORl3dO8LbL3harl5pc1Id8JMAAcDa2N8hdgHiHFyoZFM3PmpysBbosq2Gst5wUipoXipSqMHDMPlv8j/zjqS1/fwBGB+oNHBA+SQhmFLv81aOu0EedxFYhG7cuOc7NAHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779127232; c=relaxed/simple;
	bh=3Q9g8a6PCeMPWpqnzpEOCUNgyNELRVcVdOGspv3WhrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PlKM+bFAFlfihKkUx1JhHt1X6/B46+jZ9EIyCDZEDTUZ8WtZ2nX2tZGgLNBgOqKJp+BKGtRo4E3/padmX1m8dcWVjnPsanmdNEDGH67SzlSgu1GU53PDCaidW+tH5DYr6xPBzy+F8WnkYLr3hBtIBIWMdOSUyAMYRxe3hJPbLGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RSDROQY7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BRxaWsZ9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ICp2bH2438004
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 18:00:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rlz37L1Ot7SSgmPwCHZrzPnX
	arrehpmT2ZWzmBEacA4=; b=RSDROQY7e0wJOQKFunCiywPq0NTHWyff32fQHfaj
	kPeDbPW8pIEHA/FFDQ/leEA7UJPH6aapc+SP6lNzuv9NV0fsV9i67j5QRNu2YcjS
	BUOky5ZcvgOSCYiybCYPCPwO5ToMY2Q8aQ8pZIDU+ht3b25UUklN1rH399XlbpBn
	EaQOs3xTgQxjS2UGtaZELxVwdGBm/XzF54TrYUIf4DsCANmTNC47/zXzNkp3+NBS
	rFKZFmWaKoPqIXJuBltDcES6U+FFV/erapR5iWg+9Fb2feLF7QgV5MV49/DCsJS6
	AYC3pKXjxNUY6p7CDTgr6t5Zp4lOj1h2KzQRL9ZcdSpaDg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e834v17x5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 18:00:29 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5165d10e036so60178091cf.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 May 2026 11:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779127228; x=1779732028; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rlz37L1Ot7SSgmPwCHZrzPnXarrehpmT2ZWzmBEacA4=;
        b=BRxaWsZ9fx20/OqYIEIfB3WrSoqv2AW5F5Fh9nlcqnp4Ge90RusZPeFY2K0jIP9KLq
         SSTEaqQ2FEaa/zcpwzHQP2AUMezaGLRPvA8MsRdicDemJH8ZJSUjC+jBKLmLgpJ0r8R2
         1ARQx3xngwCmAJA+IlfR1IK6PYfNeke0LQV9YU561holk/lAN8KITW9yRh1y0YlqGsfo
         rdvrf/JJjvW39P5rJ30bRex8nz+sZlvknvuREclZyrZYlsRiWG8EgXleDmNkjqxjRIzk
         VQKx4JEHj4IAMdl50qNG9D2hZC0bo2SLCXhGUDunk4lyaeEp+ATWRD8R56VoBRM8vTXD
         kSpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779127228; x=1779732028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rlz37L1Ot7SSgmPwCHZrzPnXarrehpmT2ZWzmBEacA4=;
        b=dn7KlUuBtVoAuPpZh4SJS8vhTSRxszoQnrNc8AjmmTs7P4FU5D3QDjCvrg6OkxBig2
         IViCNGEp/Zspx0+r4S9/IZWfq2gCy8tboe2tQhQSAI37yXYKd8SQ8Lj1xuAWle58gdsR
         YPmNBwUMbB7azp3kGUbyUi8KLgs/yvYFZP3Keqo0IDe+2LUm1VuJQWWuPSlgf8/Fexh6
         zYMQmAk0fhJjIhdmGNikCCBDezIbXdgGu8st30+nXcUrc08LMk0rYjdo7kBUCK+675ja
         0WxWS1lf6Y8qrEZ987t0tBgBcSEf2xnQnKq/UaxgeSnWCJB4SPlrlQRXCYorg942WEXd
         Y1bQ==
X-Forwarded-Encrypted: i=1; AFNElJ+IuES8lmiDGQmNzoes7ZlM3S/fm8SG5RU0vi7y+pBzU8JwehHTBwJnkF3MHwCyjejBJNVt09J1RhLcnOWB@vger.kernel.org
X-Gm-Message-State: AOJu0YwfSD7BrnjJs9cpVJ1HzfS0RT5ptaa/XBPvlQ1mf55H1qrJgwjx
	KCdj33nIvEGJLiQZcSQNM188llMnqMF4ycvjzQZczND/88pOyn5xAwRxPeayvh0iD4qTd31bjSm
	gxGC8SO5S3iZsox6G4c9yQz0rt8eRjCNbcQuHSmTWyhYbX70mCYQYUZhI83UioU/ad5sK
X-Gm-Gg: Acq92OHkLKRxR2Zqnqg9XXOURIAj9wdPH3Fl7ZvOThJk3Njj278y6+6xLOsN/b6HKAv
	F6OIytLiio+5p1xTxOcmJRKd1Oq1OVwQ7jUQuMiIJO6rMeQxwOYdNzbirj4h6VlFWD0H1XKuiXp
	GSodxMci8j6kOSAtOA3Chdpyd/2C6q2ilhkJy2/yLQTyP8lzKYwgXBD4e1goDmFFOLn+oNgOPuE
	7l0UwcXEyA0H69FREd0QJr4ZHywpPrlSlp2cv95iQJuV32sepso7vn9egUxHB+kmEHnBL0J7kJG
	lrEjEcr+RRjUj0YG6+2eJoLQC0AYxMTZaBKEISRh8wLxB3ycRts6U4C6tW9V7+WzPiTUhmnc0In
	lV2rqUDXIIgKb3ReO8d5w1N50mhT5LAHeInes1Vhil8UpjgfCmcQYGBM5y+fbzSnNud0aCUoS0n
	2t35pnAXkw/qMCnhoo0kuKAV2aaRKNPZFxU2J5bsZaJzxk/A==
X-Received: by 2002:a05:622a:1ccb:b0:50d:a3a3:e612 with SMTP id d75a77b69052e-5165a0b5e80mr238863471cf.18.1779127228307;
        Mon, 18 May 2026 11:00:28 -0700 (PDT)
X-Received: by 2002:a05:622a:1ccb:b0:50d:a3a3:e612 with SMTP id d75a77b69052e-5165a0b5e80mr238861911cf.18.1779127227591;
        Mon, 18 May 2026 11:00:27 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a90f10c944sm3573510e87.6.2026.05.18.11.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 11:00:26 -0700 (PDT)
Date: Mon, 18 May 2026 21:00:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v2 1/2] drm/mipi-dsi: add flag for sending all DSC slices
 in one packet
Message-ID: <kxbtfiizjbprs4sqkmtotbaeqmm5e3draavlmdskhmws2l6ivq@73r3hnghmmrv>
References: <20260318-dsi-dsc-slice-per-pkt-v2-0-0a1b316f8250@pm.me>
 <20260318-dsi-dsc-slice-per-pkt-v2-1-0a1b316f8250@pm.me>
 <rrgnyzpxo6g3ufjcnxnshexjotyq3riruc6wqjhirmcjo4qdta@gmwhs3mu2xld>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <rrgnyzpxo6g3ufjcnxnshexjotyq3riruc6wqjhirmcjo4qdta@gmwhs3mu2xld>
X-Authority-Analysis: v=2.4 cv=F9ZnsKhN c=1 sm=1 tr=0 ts=6a0b53bd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=H1zEYEgKh_2JjXxmUTcA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: OZMm5EGuvr9sd4lDq841O0tcnNhGtP3E
X-Proofpoint-GUID: OZMm5EGuvr9sd4lDq841O0tcnNhGtP3E
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDE3NyBTYWx0ZWRfX10IOVCgefdSz
 XbUMDnwCxjyc6i3xTWdhIuzighKfnSYje6v/67mv4W+/zYqzfqoI6sVVg0H64OecbgMXZTw51G1
 2NhYXuUZTapPRmZeQIK0AHTXvZEmW2Mn1A2ckpuYBYHZuzImcsB7FJlelsD5A5qifSKkM5a6VHc
 BMP8HIUy9cRq0v1nPi6Bp9+FijQAM011vt1WAD1SnAEnTb8yJ2xj8nF3AB4JnD6nac1MOZ6XOom
 6eCVhPOdRhhDSqY9DuYzT7CkQmSCj6AVCO4EOTR1uOr3TqtmSj/nAk/8N91bOdQn49cilqvXIKr
 cjElDr32gSzRvTBFxpijypCxrE6kjvm7YaQxpweU6xCcTnZCJlSY54xRukBCNTZU7KJwmN6uOF5
 yBkZfQkEYaWBYfQ3X9NgsxX3HDNI3V9bjGt8EEQ7pO2fzd7GUegUZTz9+KJohZD/vrmGx7wQr4q
 N4dl929NatEyrg1jHDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180177
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-108260-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,oss.qualcomm.com,linux.dev,poorly.run,somainline.org,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,pm.me:email,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C4766571D9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 12:33:45PM +0200, Dmitry Baryshkov wrote:
> On Wed, Mar 18, 2026 at 09:54:04AM +0000, Alexander Koskovich wrote:
> > The MIPI DSI v1.3 spec defines two modes for transporting compressed
> > pixel data: one slice per packet or multiple slice widths in a single
> > packet (Section 8.8.24 Figure 40).
> > 
> > Add a MIPI_DSI_MODE_DSC_ALL_SLICES_IN_PKT flag that panel drivers can
> > set to indicate that all DSC slices for a line should be packed into a
> > single packet. When unset should default to 1 slice per packet.
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> As I wrote for v1, I'd prefer to get more opinions before applying

Any comments? I'll apply it in a few days otherwise.

> 
> > Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> > ---
> >  include/drm/drm_mipi_dsi.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry

