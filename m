Return-Path: <linux-arm-msm+bounces-99723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DqNIvLnwmnnnAQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99723-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 20:37:22 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDE331B9D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 20:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 651ED304E826
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 19:30:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87E10248F6F;
	Tue, 24 Mar 2026 19:30:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VviMisEE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jiFXsKgY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B39B1FC0FC
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 19:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774380622; cv=none; b=pp85OU15jYG6eIEWK+Bim9weMgzBJz0bVHy+1tlD/DXCvxVztq0UoADFkI0db8aaMEQmez+A+N29REQ5OJGdQb9+BW7jjjFmOPl4PW9Wa8IXZmOpb6BlaK28KGjZaS2oZMFRaekRTbZoEz9adBNXD/Pgs8gsEZQAWrX8ABr/aW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774380622; c=relaxed/simple;
	bh=Zt1dvzYIVftJHYLwb7Pcy1770cGtwaaqM2BsJIyroy4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OF62syGXZi2iO3iLCMdx/nNXZLPpDTEDh03EmW3nzKx1hTHEf9DZ/hGIYY6cUbgXvVrGLsfiYnANgFp2kUYiNNX+hGWKRVEGcgdSi/otnMVu2RRMTWPT3YfmDDmIsKKgol7wVt5TrYRpVx4agIn6JywbiY1xRvrVQxJhT+AVKSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VviMisEE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jiFXsKgY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJD2ee1993226
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 19:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=S+PbwUMOw7pk5C5b6YJ0/miz
	vuh+S+o9r8O5lHAOY9c=; b=VviMisEEVTf0JQKNMXS5THdDgVHtrunJMAsx/rnf
	0DpEOxKGmTEmKBgp0trY1pfHeYJSVMHbg/Bfj3inNmShCikoFbkT55vXin9Gx9ez
	bkCMe5Vc+zfTUzGm/6ZL0WoVj/vZpnsquH47FWKpAQvoOYIvs8uUbHDrExiUiBsM
	ekEcB0sD7RZnSNP5SHLjvJp4GS8+JWJnZI3o8VJLpBR/24z6atamUsKAjli91ZM9
	IdeHFzAIiEXOep5BXt/WUIWljube/c2ztJnNlhDVus1yh8+lA8QM/ESkdzUEJXTB
	lCVKHWyCRAvK3MLIQU9iFzvDQHAQGJANyxmiUHpq4UsDYw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jskujj7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 19:30:20 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-509070bda13so7421121cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 12:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774380619; x=1774985419; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S+PbwUMOw7pk5C5b6YJ0/mizvuh+S+o9r8O5lHAOY9c=;
        b=jiFXsKgYvzrFo9Lx3bzVHjwmX6qE/y0IIbGRBOaxaMouknh0sGQYylIhz2Czr6AevQ
         O2BEB/6NzCVvuRgMwP6k5p0ea7NFzR5/oqEni9a2bB4vlBjXiu1WMqtUv6k0cPlOfYmS
         tw/dNCGbaczB9QA3HmpOD9zxIWc+NCuMbtAN8Mc2VN6LGyh9pKZJA9rLmzwSCWpXmmN/
         Zutqm7BxjNEvzEbdmwEF2hRB4C7fJc9RXDG/+hg65jEqgOAoAk6dvd8v8K+K3Pd9eLa7
         lSbu7kyDFJOPcKTIu0sIS35p8nLj2emXqD5mApcdPRoQ2MsXuks/lq2SWHfdjgvJGPzw
         aRLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774380619; x=1774985419;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S+PbwUMOw7pk5C5b6YJ0/mizvuh+S+o9r8O5lHAOY9c=;
        b=Qi2BMX+g7Oy6ClnDjUujLdyFXIgXiH7CbSMykddKauWseN7JEhlAYFfD5LSqgAfr+8
         edPdiaKzEJNp9Yn8nPC0xMg5GGbU1alhhgjZ7Q1d3+f0fCUrmw5LOFZgXpEb0/vybxY9
         0046ECevV5duain39RSmNWaDdWrgw0Bh+82u/aovelb6YoQqc/z0GS1mNivb9sO7jNHx
         UA65XyYrznQ8E7TQ+zYX2i4/5vUbpwwta1sgDvb53aoiP54az2G8x6JjFChXDuTW3kwa
         iWfngOruKFuoAFNBwdQ8UrTJcV3FsbDlA3mEhk5tz4S2ffyjZpxsK6RvlEsThzxFr7Ck
         sklg==
X-Forwarded-Encrypted: i=1; AJvYcCUEgqzQ2schgSVRsi1/0AI0cwK0g2eTHTkAkOsQfJA/EnG1UtO9KQA+X2PG3xtNu5es4cOON0jrYcWtLRWo@vger.kernel.org
X-Gm-Message-State: AOJu0YynZiJ+qrx4I9C5xnPfs82Hglp8ZIhfVnncydF7XcMOiCkBuKdS
	M4H7rANmta0IWdLcCniaGMHEx7bLnYoCAgW6BfShseaWanGWDvp3lhUwAhykcLQASCg6QRK8VYM
	dhmbXaZg3sNDC+3xRp3FAGBXRGrsWM1YgHwLyE6alfvPO+GFC0ALAdCo5Li6GCAHVjkE5
X-Gm-Gg: ATEYQzwwKw6H4LfTykECjxDwHUlD8IUQgUOl8WcIF0K/dt8j3B9XrV7miO19w79p3s9
	Ql3EADis2PPmvcnoJddTjyZGVcO3wSjmrhWqgRkRrkExPzfed3IHkncGia/b6D1eUMaftkhULTc
	W0+f//BgsOGuQB51iztqj4YMP/APfZurwBVL+M+rRPF13hs3APBQpyTwUh9Mmb7h/HQJglO1IJV
	BcP2izHLzoZEw5GKy0U7oGl2NCrboduLHrt2X+ni/GXM0G78J7IUDXtr1JHCOaOGbb13UqBk+Wr
	WWuBiBkZLpFRQtlJ0+ADfRfRy0fVkCd/PDSkSE8zTfpa0Q5nGjdelOZomJ7akzdf5YfpzhJw3DI
	L6va3YqQIUxCDx10mThVDpbmwfUJ0j/b6vIk2wjEW5j9VTSLLOSm0itjJ8RqZ5A72JsVCHQcTQ/
	htdoVbd/E32C2BQPngbkf+42udLAKHw5/9eWc=
X-Received: by 2002:a05:622a:8d10:b0:50b:5743:5fca with SMTP id d75a77b69052e-50b6ef07979mr58212421cf.39.1774380619275;
        Tue, 24 Mar 2026 12:30:19 -0700 (PDT)
X-Received: by 2002:a05:622a:8d10:b0:50b:5743:5fca with SMTP id d75a77b69052e-50b6ef07979mr58211471cf.39.1774380618650;
        Tue, 24 Mar 2026 12:30:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c3aa03bccsm4516151fa.17.2026.03.24.12.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 12:30:17 -0700 (PDT)
Date: Tue, 24 Mar 2026 21:30:15 +0200
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
Subject: Re: [PATCH v3 31/38] drm/msm/dp: add HPD callback for dp MST
Message-ID: <tlt2ffn2xz3mpeoojcciieh35zc6pyowlkcjtxkkrnaj32enne@mbcrdrnkmaoz>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-31-01faacfcdedd@oss.qualcomm.com>
 <pc4brjias4ixewzlsvnlhqhlz774z4p6aq7j4kldu5ze2e35sh@tsm2mtrkk3zi>
 <b5b3b1b8-ed48-429c-a87f-0278a6632313@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b5b3b1b8-ed48-429c-a87f-0278a6632313@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE1MSBTYWx0ZWRfX2ABqaDze+rf9
 nFmyH+BMBOKmRvUOlGl4kfwZfK1gNfx4NyulJ40jpu1FvENVXo/cIrOziwFiD04zF2Oqj8vdJsY
 328jMtLBnJbMBihjcQPNp0XFBxusklfMIY2yIMQW8EL/h6f6syo5YHFlAO0zqRyn2pgrJ6dKkZo
 1Bz/qQke9zDy0V2UuE3p+nFJt34Q9SsMzyhUfu9/VT6FEVNSauGf+9O4TO5TCyLrpoRooCF7dRq
 52KjYvjhwTUb7RlmLTQe2vIBlJ7U+UTfsflmXGeKKMXmNbQIRkGGBtjvL+ZUzFv4TxEfV6yVDEh
 gF1lssGEcFLir1ab/UUMsH6vNniGjKODACZ2CKwZraY2/wdOqBKxcmVT8vPP2tGr8qiphvPhIe2
 IHmg5OyDx0v/MaiOJUC9H3wgBhWdeASUFdpm0qojDIrRICuV3L6PaLDy0f0AXQPFkndBkBKVvn2
 FB3Gsw23msCtAzc/tDg==
X-Proofpoint-GUID: YjF4h7QyuShoMaCDlcsUiAqsniZ7rOyY
X-Proofpoint-ORIG-GUID: YjF4h7QyuShoMaCDlcsUiAqsniZ7rOyY
X-Authority-Analysis: v=2.4 cv=I+pohdgg c=1 sm=1 tr=0 ts=69c2e64c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=2DgZU2EfoQVUhze0CNQA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240151
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99723-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2EDE331B9D8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 24, 2026 at 09:04:24PM +0800, Yongxing Mou wrote:
> 
> 
> On 8/27/2025 2:40 AM, Dmitry Baryshkov wrote:
> > On Mon, Aug 25, 2025 at 10:16:17PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Add HPD callback for the MST module which shall be invoked from the
> > > dp_display's HPD handler to perform MST specific operations in case
> > > of HPD. In MST case, route the HPD messages to MST module.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++++---
> > >   drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
> > >   drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++
> > >   3 files changed, 48 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > index abcab3ed43b6da5ef898355cf9b7561cd9fe0404..59720e1ad4b1193e33a4fc6aad0c401eaf9cbec8 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > @@ -500,9 +500,16 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
> > >   static int msm_dp_display_usbpd_attention_cb(struct device *dev)
> > >   {
> > > -	int rc = 0;
> > > -	u32 sink_request;
> > >   	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
> > > +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> > > +	u32 sink_request;
> > > +	int rc = 0;
> > > +
> > > +	if (msm_dp_display->mst_active) {
> > > +		if (msm_dp_aux_is_link_connected(dp->aux) != ISR_DISCONNECTED)
> > > +			msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
> > > +		return 0;
> > > +	}
> > >   	/* check for any test request issued by sink */
> > >   	rc = msm_dp_link_process_request(dp->link);
> > > @@ -1129,8 +1136,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
> > >   	if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
> > >   		msm_dp_display_send_hpd_notification(dp, false);
> > > -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
> > > +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
> > >   		msm_dp_display_send_hpd_notification(dp, true);
> > > +		msm_dp_irq_hpd_handle(dp, 0);
> > 
> > Why is it a part of this patch?? It has nothing to do with MST.
> > 
> Emm ... maybe here we can directly call msm_dp_mst_display_hpd_irq..
> I tried an alternative approach by calling the MST IRQ handler from
> msm_dp_bridge_hpd_notify(). I expected that when hpd_isr_status ==
> DP_DP_IRQ_HPD_INT_MASK, the hpd_link_status read in
> msm_dp_bridge_hpd_notify() would be ISR_IRQ_HPD_PULSE_COUNT. That way, we
> could handle both SST and MST interrupt paths in msm_dp_irq_hpd_handle().
> However, hpd_link_status only reports ISR_CONNECTED. So I had to move the
> MST IRQ handling into the IRQ thread. Do you have any suggestions on this?

When are the link status bits updated? Please remember, we need to
support all three cases:

- Native DP, native DP HPD pin handling
- Native DP, DP HPD pin not handled by the controller
- DP AltMode, DP HPD pin not used at all

In the second and the third cases we will not be getting the IRQs.
Instead one of the next bridges (connector, EC, AltMode, etc.) will send
the HPD event, which lands in the .hpd_notify() callback.

-- 
With best wishes
Dmitry

