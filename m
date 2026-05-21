Return-Path: <linux-arm-msm+bounces-109043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yL5RO/L1DmoBDwYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:09:22 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 531B65A48EE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 14:09:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0C1D630131FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 12:07:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6635C3CC7DC;
	Thu, 21 May 2026 12:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nzDcIMxy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Xo5VO3Q3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E1E23CBE97
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779365247; cv=none; b=tIhMCKMkalqlCfcZ7S+skApcsuRDQ7Ixtjx8UjGI4VO1iTy+680T/n8veA8X7xQ259nAXTxpKa1AUU5lQYaCOAB/oFjWAbY/iGN2RnAV7hSQRXBnB1P/WR7imMv1MBmS0LeESqUq/qqG0FTHJz6xT+k2enL1KpnlLgc6cOAi4yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779365247; c=relaxed/simple;
	bh=9yhaczNARFx5kC2ySYETK1tangL0tt1qRcnFsvQm29M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ephJtEE34eMqRTK0VJsVaJhIz7Qr2YU1HeYz/zA1mUkDxIl79m6o5U881fZBQhrbtyAI8oB9iqs2cEgbu8KeNs6igmvILlcaBG0/GX0xQX8weT0t0h/XQb3yUi4mrLS0pGizBIKVq77+EU8o9yvlElyg+xktQHP1PQDx7cx5moI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nzDcIMxy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Xo5VO3Q3; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99rST517909
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:07:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=iaChCRreVrJ74kZNk7MSCJr0
	m9ZSy7dcaCDchcoc19I=; b=nzDcIMxyjJvkmntJZeCUqKK4rGY7v2BWgji395mH
	SOupqFt6B2iOfRz0M2XXB2G8GaXVB7w+Bax4Du746G4jmLWhfGHPdZymhR8TdpLl
	VvFAwKBxi9LSBNkxdDcbaS0crrbgtan9O7vrtO/zikVQ9S8m9NHujQm1fRs+L9UD
	WgdA7rYosaoKPuVGZrCcdr8jDQUadeg2yJluCzuJDpvRoy4+LN5KILpiUqA1nK54
	SKb/VLhe4TVbuPd6tQgOTGFXahcPdORtHqOpKIC/Ueidmguhup7mZPI7cFp+RuSI
	u9f44UU9dNTvgOs84uU8+C4DcUyceK7GPyhdv2HX9Le6oA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa24c2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 12:07:23 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-43a281ca836so14160785fac.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 05:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779365243; x=1779970043; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iaChCRreVrJ74kZNk7MSCJr0m9ZSy7dcaCDchcoc19I=;
        b=Xo5VO3Q3rCDMVESEHeMGvyelo6IvOEARNmVge4nwdE1GQvuP4tbhbRiXb4vObPea/r
         zPrlmz4xlpp8X239VhC0H/B3iAzPHOiKs0kcoZjoouqaFcdvwKJk18ZGp8hJzSuXcp/5
         tVUh3X/fPLO+fvDcvp2FRc1koJZWc7cQzU4tDUvX7cPU6cQ55eTP54aBrrQutbI4sF0C
         vcfOohBN5LQsRbZxnwBLMJxJmokDGZhdT24lYmYmmk0NMvsNgj7YlfljNpksqGNlMa70
         FWoIKWndEA1ZQIFOmQUjURisvNATii8cwThm0SzsD2wu5/dw7TnrtaQn1bDQuWAP1fyE
         zK7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779365243; x=1779970043;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iaChCRreVrJ74kZNk7MSCJr0m9ZSy7dcaCDchcoc19I=;
        b=GJI2itJfjCNIuxZ+QoOu+IN2BEOtWBLlYz/jUAHF+eZkyfcIqY/9KvFpdFDW2wO4Zl
         4OpvKaf5KGD74b86rK7BxcE0GyHt/KmKcM+E+S6vvMZ4NPnQLl31Ac1eQL5V7Om6AhM3
         fGvJkKrrrctbJBRj4e8dfe17f+AC4r481z8c1QphlMplwesVxs3xM7WGCHlh4ClTpma/
         61EJRqPRuSUroVIRW++t3+5VJbzbDQzCx+sl9VkW14IH26Xh2F7XEmoR7qZW6WlAfmNO
         Y3HQfno0n3rXtm1Taho1844085b0XFsYUyGuJR/ZNyrp430qYApOH89Sl4DCHMWLnuye
         nQlA==
X-Forwarded-Encrypted: i=1; AFNElJ+O9sRTm9F07UzmSJTRLggu0c3k69EsfXENBDwHwGv/XtDGpbPZYYDuePa3tCuB62XZTjoChFG6dgL9vprg@vger.kernel.org
X-Gm-Message-State: AOJu0Yxvpv4A2nJQ8gC5KOBJcG0Nbi4XC0/G3CoWLrAnGlNVw2Hm66ob
	X71L+fSgQUAmTF8hgi8HX69lPf210PINTULrlRahFtkuAPAK6RvOi0BgrNNHoEZeAnYZbcbu/HD
	r9dMjo/6RCnj3DfYj7rBpPlvjUpjk2hSOt4lnDpzwXjsx944XS14CJBT8JNHb+3zeu7+L
X-Gm-Gg: Acq92OE6YB5PfogITWBS+iKK6p6MKvoym9eK65LcnLv+NXmBPZa00lpzVKaIjqLoMiw
	tudeEhM0r2JYKrd88y8/HOHL/7U0ekx0Xnz0kqBnf1I5eRsv5XvC3OXHqJ46LiHfH5JMMVOihWd
	nVkJY6zxfGqjSMhT4i1NQqz2iseFmQKZtFOqYG5iIIungzZs5Frl25ax9apEw3G3eHHoYejSN1L
	nU6rOvyRmPU6HWpoYUN+lDwENOauuzHMTqcH2/3M3FCLmBZ3t/0VpmE77+cLFpL9X+Ogal3XJ0I
	tud/8tF9ADIt8eN1Uf/gyjaStbtGpwuv4AnKKBj3zZJinUSviyvdKi2KDc8BKYgLq12wJfMp1La
	X1yb2OeOvxaKcNYVBmdDusLkW3F+hlRpNExl58iJ0ovkziQ9BauXrgaQpF2goMjZNl1sOTJzc2u
	i1oPcf1KHwSMghG9MIgK8fROamDmq3uGy0V8A=
X-Received: by 2002:a05:6808:e659:b0:482:ce40:abeb with SMTP id 5614622812f47-4852ec297c0mr916938b6e.7.1779365243002;
        Thu, 21 May 2026 05:07:23 -0700 (PDT)
X-Received: by 2002:a05:6808:e659:b0:482:ce40:abeb with SMTP id 5614622812f47-4852ec297c0mr916918b6e.7.1779365242588;
        Thu, 21 May 2026 05:07:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa2f120b83sm204605e87.32.2026.05.21.05.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 05:07:21 -0700 (PDT)
Date: Thu, 21 May 2026 15:07:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: Re: [PATCH v4 14/39] drm/msm/dp: introduce max_streams for DP
 controller MST support
Message-ID: <p3jfi2cxevvdtqathqrpnxdkzrwuna3hojovfjvdni7zvjec24@pyvaubeq77qk>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-14-b20518dea8de@oss.qualcomm.com>
 <s32w4u44y4jhuk4c4qxsytat2pdiskzuvbozklhofpjh54r7pc@2i6vvbaen2ur>
 <0e39dd9f-9858-49cb-a052-7d0791b694af@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0e39dd9f-9858-49cb-a052-7d0791b694af@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDEyMSBTYWx0ZWRfX0CZFiqu7UDoy
 L0qUGL3StPFm/ZQ6kUQRcG7G4wO4iHBFZFG+t0wRcPD0d5Pz9gKjREnqcNhzeodmkS92NZF/2jC
 0ao5HRR8Nc9WQkGjuTn2rTZeNSvhWVjcbORyWhO4yjf0BTazT3HlvHZRKgcOxUA6Q3MzgFs0DfP
 HmaX6qrVmn4Lx3OTTqwdad6wHIwt/TX6vq+2atb5t/5XBw+aMlvgBQapxlQrTDL3Dj+yTy82w+0
 Dq8Xs+qbiyi6YDa57fgAlmRfiTEga70cEHjtvFXkg+2MigPVj/D25EscodL5sZ1872dPuLZcwPi
 q9ZOSTgriB7X8xvJQ7Vlg9kJGFZxEvbgFHQ5PJHZu25+9ZLmxLIZAjJcXZ3JXmRc8E0Xd57GP0J
 +ruTjiDzrnF9gy8XKuYd8NAcKosHSEfgUI8tfr0MS67nkKzurUspHjCnxN/cHsLAxKryeZLDgu4
 AM4ilmupukSq2umvUKQ==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0ef57b cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=COk6AnOGAAAA:8
 a=u-wEjeJDRpFVrNTbhscA:9 a=CjuIK1q_8ugA:10 a=y8BKWJGFn5sdPF1Y92-H:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 4HYap086ZdbZ_EJQfe3HHx9CMP9tMoDK
X-Proofpoint-GUID: 4HYap086ZdbZ_EJQfe3HHx9CMP9tMoDK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210121
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109043-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,qualcomm.com:dkim];
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
X-Rspamd-Queue-Id: 531B65A48EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 21, 2026 at 07:34:32PM +0800, Yongxing Mou wrote:
> 
> 
> On 4/12/2026 1:59 AM, Dmitry Baryshkov wrote:
> > On Fri, Apr 10, 2026 at 05:33:49PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > @@ -2740,7 +2741,8 @@ static int msm_dp_ctrl_clk_init(struct msm_dp_ctrl *msm_dp_ctrl)
> > >   	if (rc)
> > >   		return rc;
> > > -	for (i = DP_STREAM_0; i < DP_STREAM_MAX; i++) {
> > > +	ctrl->num_pixel_clks = 0;
> > > +	for (i = DP_STREAM_0; i < max_stream; i++) {
> > 
> > Why? I think the code was fine with getting up to DP_STREAM_MAX clocks.
> Sure.. will change max_stream -> DP_STREAM_MAX next version.
> > In fact, I'd rather use that instead of the hardcoded value for
> > determining how many streams can be there. Think of the old DTs which
> > didn't have extra stream clocks. We still need to support those.
> > 
> The current logic only assigns num streams to dp->max_stream when
> desc->mst_streams == num_pixel_clks, otherwise set to 1 which mean sst.
> I would like to introduce a switch in the driver to control the number of
> streams, rather than having it fully determined by the DTs.

Why?

> Do you think it would be acceptable to use:
> dp->max_stream = min(num_pixel_clks, desc->mst_streams)?

We know that num_pixel_clks <= desc->mst_streams. Otherwise DT is wrong
and should not have been comitted. So, the min(a,b) has a known return
value of num_pixel_clks.

> 
> > >   		ctrl->pixel_clk[i] = devm_clk_get(dev, pixel_clks[i]);
> > >   		if (i == 0 && IS_ERR(ctrl->pixel_clk[i]))

-- 
With best wishes
Dmitry

