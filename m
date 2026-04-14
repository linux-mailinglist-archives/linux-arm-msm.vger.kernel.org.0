Return-Path: <linux-arm-msm+bounces-103210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJqEEcCK3mm2FgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103210-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:43:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C67663FDC0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 20:43:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EEE43301CA92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 18:43:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA1C831E850;
	Tue, 14 Apr 2026 18:43:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ck2aewBP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YegEhhD5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6277831DD97
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776192189; cv=none; b=G3cQvxDVg3lME24uNMGsL7M97w7LJZ3VUMcgkxnw0+ykZTxiBh6Pl9f60vKlg/mMH0TxUzZRa0kZq8gDSuj74Hs/2Eg59ZJtrSjjlpPtLXCksZJRfLA0iAiOpU4RQ8GY2fdm+BrNId3pRzss3C/0gN14E+G+ib34fLJ8+caImP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776192189; c=relaxed/simple;
	bh=l1jd6aNDXk7pyNAK/PSKi31GwvvnGmJ/mlIXyVDSlaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rdHDLHVDJT8za/lUwfaaJTdsGTVMLa43xNlYYmrns6g1OUITgTnwTCqok0VSvIBKt51BH3PYZHduKuOtJXoftHKvrgzGM2o8W7FtzlsOttiES2tocVFz/GN4uacmIMTXTyQWUJ1talK9+WiHVLDAgjE3NPZlk8foUh+ZVzH+5rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ck2aewBP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YegEhhD5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63EHbXai1701733
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:43:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	w8RtLPSozU52UhmvNz4FrnHnwFB/QlA4/KBpy5nfkaY=; b=ck2aewBP3jiXTX3+
	1LmSPXOxOB514JUhaaK+g4DciQRp1eXcblXcLDmA03NBzRvdNaVg6Y9wqJzUzeUy
	Uvb/8CI7vpGuM9u8488tVPn6PUkiKU7I3GQFYs8HmrLdEM5nXGdMp3MUKCKd470Q
	tEkmDs7sX6hX/5yU/d0U+s7vmP4PzjV/2aUA+HQ/wm4gKt0D57lKxds+CWSudR5f
	S6YC9j3O0nOAKN4vTik6jRoirSMUnJ+rk8SsKX7YCK/rbDtPzjU0MMxe8woMiuU9
	S27DZtRfX3FyTo3gWGeVQlCSAkyeTYzSXorSI5f5f4d7xtWngdyr2bPUcIF2xE9r
	AtNoOg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dht56r7xj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 18:43:07 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d812c898cso153743261cf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 11:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776192186; x=1776796986; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w8RtLPSozU52UhmvNz4FrnHnwFB/QlA4/KBpy5nfkaY=;
        b=YegEhhD5CnuWmWgCEVFST+8F9FSgHohFu6iEZB8seeGiH5EIpTDdH66GoWcfIEqVL/
         2ZzHYJShowBBOR2FjtucuaoeXoWCjlGaxg2j/gsNil/nvEHu1+ncn/3e1zYXcgkwun+d
         pHOIoKp7YUVZRkA8ofCPckmKZoqFOXkXKpB66Jg6BJiQ4iv1gevFFPt7HJ1nJIR1Lzdn
         7/BGSU9CMikSP/K8Y2I9nO6ee/ab+OpWx76cAKzQs5NAiSHvBETeTk9pTT9bSmHTxFWh
         Ojhre3mkR61mbO4zqmP0bW3B7QSr0wHoOGEZFg9NchMHh7RB7eRyrh6G5n3/SubFWsny
         W46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776192186; x=1776796986;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w8RtLPSozU52UhmvNz4FrnHnwFB/QlA4/KBpy5nfkaY=;
        b=IDvp2LtZnjrXHo7VLKYLDaAU7FOUOCghDWX3Dz1SR6cPa/9oyx+O1VEO79b8ODg7tu
         n1J1U4N6gXibgn/NM8lNZEkFylVBo4zWdQYZwr+5MGT018+kUwmJPPzzjVlzv7Cb5/tq
         3apV0n5mKllkNVgpaQjWNVZw/5L3ki8WLMO2nSr5qkHv/j17d4c5B4tX7+sBGfe4mL7S
         uLK1iZdEOW935N1EVnwLhPlccjSt+NR/AmKe2ZW896GwOJjzAITwa74zovYUxMBf+ozK
         lJvcGnSLM9rgq4wRB0fOkyaMkifomZMk4ILPsIA7V8q9nIzleiix+CdAM5uLi/Nc5ZEu
         6P3g==
X-Forwarded-Encrypted: i=1; AFNElJ8uXXaRummfKjL6RSMgJCcSzBbPqN4HvxsTjCU2a2d6TkclxUB4GLusxaGHGgz3zGeJraF+l9DnVX438WZf@vger.kernel.org
X-Gm-Message-State: AOJu0YxJMEWFoN7KwiFDwxASJ2ZadNR1mnLKWdRnBFT6fpbGy1wM4Goy
	rY7gR3EFzLtsg26n+nCCEYa3s05VBt5gcHUENchR3PVjEHBXqxZSenIvEtm9DeAqu0hU7iCAj/F
	ipKp9hMepYQgEBmB4yI5Uc0W3d6iruO5+1gkHi1L2ybLyLPaOdA+BdlybPYL0vmB4TKTiqYrbXe
	V7
X-Gm-Gg: AeBDieuvW82QEN6gVqa7q6x6sYOT8dWYjwkRR7iCWAoeWajdb52yXaWzHTaHMfYrFtW
	aJGB1zZ03DmPK9fK0mC35Hd7uXEdV8oOg8jVsMW67L4rWOQkwYBL7XBebMGs57qiBJKhVXjnJBU
	j2wHRhhT23jX44EOn84QqnRDONwLP22Kx7H6jrJVbKd/TULKxQ0emo/xQlfTvCWCsomPaa4jxui
	gRxRHu+FSRVgnnfCGROA3fsvvezUrvTK0/4IfF2itaE6CNpd2tUx9JgGIPIPKPiUuD1gxRz16gP
	4l4sofz1PebkCK2JNOP/A0fgN+PzLnxu7Xkue4YsPnBp0RSDLwh7c1eQl1T7jliSomiaQ19RboI
	h2clKB6VaoC6lYvyMxO6QOW/6DJ/viWcm52V0DVXD0EX+plHFL8bQR2EOZfTEjFbCA5GttOHAPD
	qZd/RngcGE3ZUZE0rY0sqybCjCrsl7GsElccMw/vim8ZnBHg==
X-Received: by 2002:a05:622a:9:b0:50d:7b0c:35de with SMTP id d75a77b69052e-50dd5c74756mr283929541cf.44.1776192186497;
        Tue, 14 Apr 2026 11:43:06 -0700 (PDT)
X-Received: by 2002:a05:622a:9:b0:50d:7b0c:35de with SMTP id d75a77b69052e-50dd5c74756mr283928871cf.44.1776192185902;
        Tue, 14 Apr 2026 11:43:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e81fe72ffsm12355161fa.6.2026.04.14.11.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Apr 2026 11:43:04 -0700 (PDT)
Date: Tue, 14 Apr 2026 21:43:03 +0300
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
Message-ID: <vdjgzhx4xkvid2ukp7j3yir3n4tr423riyzvyzkrh2ssiub5at@pj6wfcy4jz5q>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-31-01faacfcdedd@oss.qualcomm.com>
 <pc4brjias4ixewzlsvnlhqhlz774z4p6aq7j4kldu5ze2e35sh@tsm2mtrkk3zi>
 <b5b3b1b8-ed48-429c-a87f-0278a6632313@oss.qualcomm.com>
 <tlt2ffn2xz3mpeoojcciieh35zc6pyowlkcjtxkkrnaj32enne@mbcrdrnkmaoz>
 <07ff4730-2efd-4e9d-b632-9fbb517179f9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <07ff4730-2efd-4e9d-b632-9fbb517179f9@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: dST0EbXdLsIUg5bIje98Hb0MS2DbBFkW
X-Proofpoint-GUID: dST0EbXdLsIUg5bIje98Hb0MS2DbBFkW
X-Authority-Analysis: v=2.4 cv=K9gS2SWI c=1 sm=1 tr=0 ts=69de8abb cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=ZMo_a_pv_yQQi4daUAkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDE3NCBTYWx0ZWRfXzNe5BbDUYtZy
 PdaCQtM/CFV2JlY6bJJ6+iQuIeEO75PqDeNu194SdWHdnMBfC1x7Loia5g12zyo5OVJI0ujPLOY
 ok0xjwIZc/CRNTqyEv+/8PRgnVCJMYiFABFJ4GF+B/vsWln5DLNJMPmvXMAUqip9Uy76J0md/L5
 hHZoa6lU8pMRGeB/9d+BoyNEeeTijmvJ1R1wt3n9y1ThmIQMVc7BpwukshwDdup4X7klyVAgaOd
 ieZdNyuO3SWBF4A+XqKDts7Fz+gwkLBc6JNrHCtJQKLGcaJOkh2ofHAuWtMp4u7YuP9au6Uu9M3
 XunvK9QJzSnQUjYDlZJSfJ+WFU93O2tjOhOoz5XiyT5q+FTEo/f20ejll8fOEMbNEYf2Pdq7hEI
 67ffY4u1YkYecGgA73rvkO3FrLGqY97f1BtqDVX0dugcr0hVFQdHVkdpGT6XgneKuQATf6ZeZ3A
 Zmb3VFwCocurQytBwgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604140174
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103210-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,quicinc.com:email];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C67663FDC0F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 05:51:51PM +0800, Yongxing Mou wrote:
> 
> 
> On 3/25/2026 3:30 AM, Dmitry Baryshkov wrote:
> > On Tue, Mar 24, 2026 at 09:04:24PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 8/27/2025 2:40 AM, Dmitry Baryshkov wrote:
> > > > On Mon, Aug 25, 2025 at 10:16:17PM +0800, Yongxing Mou wrote:
> > > > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > 
> > > > > Add HPD callback for the MST module which shall be invoked from the
> > > > > dp_display's HPD handler to perform MST specific operations in case
> > > > > of HPD. In MST case, route the HPD messages to MST module.
> > > > > 
> > > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++++---
> > > > >    drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
> > > > >    drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++
> > > > >    3 files changed, 48 insertions(+), 3 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > index abcab3ed43b6da5ef898355cf9b7561cd9fe0404..59720e1ad4b1193e33a4fc6aad0c401eaf9cbec8 100644
> > > > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > @@ -500,9 +500,16 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
> > > > >    static int msm_dp_display_usbpd_attention_cb(struct device *dev)
> > > > >    {
> > > > > -	int rc = 0;
> > > > > -	u32 sink_request;
> > > > >    	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
> > > > > +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> > > > > +	u32 sink_request;
> > > > > +	int rc = 0;
> > > > > +
> > > > > +	if (msm_dp_display->mst_active) {
> > > > > +		if (msm_dp_aux_is_link_connected(dp->aux) != ISR_DISCONNECTED)
> > > > > +			msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
> > > > > +		return 0;
> > > > > +	}
> > > > >    	/* check for any test request issued by sink */
> > > > >    	rc = msm_dp_link_process_request(dp->link);
> > > > > @@ -1129,8 +1136,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
> > > > >    	if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
> > > > >    		msm_dp_display_send_hpd_notification(dp, false);
> > > > > -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
> > > > > +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
> > > > >    		msm_dp_display_send_hpd_notification(dp, true);
> > > > > +		msm_dp_irq_hpd_handle(dp, 0);
> > > > 
> > > > Why is it a part of this patch?? It has nothing to do with MST.
> > > > 
> > > Emm ... maybe here we can directly call msm_dp_mst_display_hpd_irq..
> > > I tried an alternative approach by calling the MST IRQ handler from
> > > msm_dp_bridge_hpd_notify(). I expected that when hpd_isr_status ==
> > > DP_DP_IRQ_HPD_INT_MASK, the hpd_link_status read in
> > > msm_dp_bridge_hpd_notify() would be ISR_IRQ_HPD_PULSE_COUNT. That way, we
> > > could handle both SST and MST interrupt paths in msm_dp_irq_hpd_handle().
> > > However, hpd_link_status only reports ISR_CONNECTED. So I had to move the
> > > MST IRQ handling into the IRQ thread. Do you have any suggestions on this?
> > 
> > When are the link status bits updated? Please remember, we need to
> > support all three cases:
> > 
> > - Native DP, native DP HPD pin handling
> > - Native DP, DP HPD pin not handled by the controller
> > - DP AltMode, DP HPD pin not used at all
> > 
> > In the second and the third cases we will not be getting the IRQs.
> > Instead one of the next bridges (connector, EC, AltMode, etc.) will send
> > the HPD event, which lands in the .hpd_notify() callback.
> > 
> I added some logs and did some testing. I think
> msm_dp_aux_is_link_connected() only shows the current HPD state. Since IRQ
> HPD Pulse Count is very short, by the time we read REG_DP_DP_HPD_INT_STATUS
> in the IRQ flow, the HPD state machine has usually already finished pulse
> classification and returned to Connected.

But the IRQ should be sticky and it should be readable from the status
bits.

Note, in the USB-C AltMode case the HPD machine is not used at all.

> 
> Because of that, the condition hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT
> will usually not be hit.
> 
> do you have any suggestion that in how to distinguish between an IRQ event
> and a plug event in .hpd_notify() better? We probably don’t want to
> introduce another state machine.

Then, I assume, currently there is no way to actually distinguish those.
The easiest way to handle the replug would be to store the current
"connected" status and verify if we are receiving "connected" while
being connected or if it is a disconnected -> connected change.

For a longer term (and granted that HDMI also has a notion of HPD pulse
events) we might want to extend the DRM HPD API to pass through the "IRQ
pulse" events as is (instead of converting those to
connected-whilec-connected events).

Let me sketch a draft for that.

-- 
With best wishes
Dmitry

