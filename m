Return-Path: <linux-arm-msm+bounces-102501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D24FU+912mdSQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102501-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 16:53:03 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F713CC3E5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 16:53:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1C6BC30071F5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 14:53:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C7556369980;
	Thu,  9 Apr 2026 14:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QWUv/xiM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="af9V3XpZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8159E2C11CB
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 14:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775746380; cv=none; b=azvQqqQEZsP2B6ukC9Tves+3gF7pq1raevVCXsX2sCIMzzniGW+AuRaexRpql2UFkCHb4UZapEKnhKaJx4vr1ssXf0UdzMxt2TKLY1xUOaAPqRD65juOBbkMQtz3uNdzEPEYwNFATdmcKi5QjxGjnnd4nzklfwPXzpin91z+kGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775746380; c=relaxed/simple;
	bh=FiYLtlMWc4b8BeFcU0mDiMH7ACLIeppEzMUn3Bzm894=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DM2H9D4TLFIVrH+T1S4x9hbT9mE29vuWwYOnC7t8HTKcLXTWi+OJ/4B4sCvjimOjSrZ75Qu0N5tHo7tSlCwupom5VxriYZR28uaXbCtmErkMUZh7rdGs5iMQ6zFjUCH7JtgyFZoQQF8nNRLp8YZuR4MsIaVFvnOjzjr0w5JVt/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QWUv/xiM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=af9V3XpZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639D1SCb1972547
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 14:52:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lTKXEEfEkbo8patR5RlRtyxf+q7DRuscaUKI+vzwDWI=; b=QWUv/xiM+RZtsrJG
	M4Tv9WJ/UWFf/IWgVRyy+L0/tndEjdVdlKeS554KPptMdnU8ac2Qpv5MxQWXwfCr
	GXVrz5UVT+FXPJRnziRJxhKF/T2QpE6PLdH68AuebcuChkKTYZvmRDhml4OOMfKp
	s67SBWgA5dsc2VVAFd1TNDGbmfz+RkXYZI4BOex7J95O5DBQ/5VxpDkcMjWMpmLL
	Ow9mcUa1qkKDapLEHLZt3vrvdsYFwgbe7MVoOiQ8AQjwAEAPwFVcTuCgCfclOs3q
	JdhJkQF/PhpFXzMykmfNvyq19jM0tpAG3Lu0BO3ajfJFRSwf71DDzqoOr4b3vbPJ
	cO44vw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4decms0dky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 14:52:58 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-5fc74c6634aso1361812137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 07:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775746377; x=1776351177; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=lTKXEEfEkbo8patR5RlRtyxf+q7DRuscaUKI+vzwDWI=;
        b=af9V3XpZhL7rax3YZzlj3xGe/cN0Le+X6NQ16tuREUOGR4ZdSBlyp83V51SEf477sL
         oYMLD+Mlh/YEqWi5izeduFuFmMhdRBWcwzxq21eYQQyrATLvq6c5G4G/IpO8HhrsOHI3
         YYsHuekCeEErtxCcCKZP2k+wML080rI2utTw/xLmFmdx/LvTyUw5ZYaw+OPSKi+n1eO0
         36jDkdzweM9b/YjAkVyhFvvH0VcQ0GpZbJaX/Yi5bdzKxR0gLNBiky4ndQJ8ZipplFGc
         suAbRb6lrEfK17Y0Wl1TPXQ+igrNm+XuN3nAYlYqbxmEjDCfPUIBZu+hB4GQyJ0WIR/4
         GEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775746377; x=1776351177;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lTKXEEfEkbo8patR5RlRtyxf+q7DRuscaUKI+vzwDWI=;
        b=ea9KAvWi00RATuzHsejJNglnMh5TWrlFGlN4MBhzrU07qryexUXpjWdDcZOCK3AKW+
         9TT1Qoht4yEZkfeOVkatUXLudzhWsBStMPXAX/i5Q7N43Ur6nnuZXZiOsN0yNQGFLAQz
         7P7kPuEacVHThnF+RLRsS7KpX8uho6CbC7RccorJq89apEw01UNVqRiotYJEzcv/8oU+
         FxhQm5uB8cpQMH3RuYIQvRMC6RdvoGDL3XR0PC+SZP4KS546OjrxTP3mOsM1522uhwrZ
         7drQCvcJqzpvKeQFImiES7CSHwRVOjJ8fsZPyMnKvD21weXgKJN+fygSYjIAXkrfeJCp
         0mMA==
X-Forwarded-Encrypted: i=1; AJvYcCXBsnw8anD6LOl9Z7zrJqFUd3SpdHxb/zPH5rIrUOUwWMXFpnOMagRJy2/oLQfBW5eH4MTxcyJMldSKcezU@vger.kernel.org
X-Gm-Message-State: AOJu0YwrOVkryR6RyWfYp8TK+Aw2OXfMRavXochK22WIoqITkoipu4f6
	QBI+wlJpbsEErjDYVuMcwEDuTkdrMrg+0ly8U9E5gJqX8wOOMRpJ68ABxMokJS3LzHLh7pHpe41
	+o6Pib0uieZx5ik7G33xbFsG2lRnQKFQJkq26QLcmq+3WaRnKoyrnN8pOE34bDGbtHZI+
X-Gm-Gg: AeBDievDJjPJGjAPXuDWb4VUqonGci9WxpNUaOpTIQJkFQ5Px3gUZoyMaZsSN/S4EcK
	9TpXKdc80aclfIFHkTDjKBRxdper7Vjmkm6Tvflmn3/HbWYocVimud2tBpvzTj+BU5MSbxeHyDo
	Jiwae0YjIRcLLEimfID0mQPvEpc8fGqzh4/MU5cC0Ae08WRuYxdQY0rV754/sCZA0IToy9MJYeO
	qqwHXaEjt28TGOHBhGbi51gGdG2EoWis0SFtxIMGTe3QvIeORZ/zwnmDOWdVXb+qHzKn39E2IkK
	gDzqsvjn0TtoCANhLlDqJ4Of3IWmIRVXtSqvOIdJhjt8DPnjh+JEIJssS3b+0gPOiLeSQjbPYdE
	z28BlTeCyuRVbavdRUvBowghIUSQ81w+JWAcTIs6YuMW/+gy9farN6s86foiwJCm99JHPuDCzLi
	ZuCOrtAGfHti/LKUHRQwMe99KktZLj19uVDmg=
X-Received: by 2002:a05:6102:943:b0:605:673d:18c4 with SMTP id ada2fe7eead31-605a4e11f7fmr9946566137.9.1775746377517;
        Thu, 09 Apr 2026 07:52:57 -0700 (PDT)
X-Received: by 2002:a05:6102:943:b0:605:673d:18c4 with SMTP id ada2fe7eead31-605a4e11f7fmr9946553137.9.1775746377019;
        Thu, 09 Apr 2026 07:52:57 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38e49298c4dsm9121fa.13.2026.04.09.07.52.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 07:52:55 -0700 (PDT)
Date: Thu, 9 Apr 2026 17:52:54 +0300
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
Subject: Re: [PATCH v3 36/38] drm/msm/dpu: use msm_dp_get_mst_intf_id() to
 get the intf id
Message-ID: <zosdnfcnqqhvbqhe236csccf4i6sgh6ocadmr5v5xvylkpk3nu@huphblztbdm5>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-36-01faacfcdedd@oss.qualcomm.com>
 <exfflgjky4zgqa7tnudfteeosncr6nsuwqadxnfftxtjay6hke@fxru2weupuwt>
 <10464c59-31cf-44e5-9d7d-68b04ec2529c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10464c59-31cf-44e5-9d7d-68b04ec2529c@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: Q1RtHWN9rH3XABvygFC-ssNapUSHecuS
X-Proofpoint-GUID: Q1RtHWN9rH3XABvygFC-ssNapUSHecuS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDEzNiBTYWx0ZWRfX7V27jODnPmem
 b1a8IbfY3rv3b4NoqLTPZd8F4EyLaBqPWFIwo42E//2VaEnJHgQrBEMeDcuQ9Yq/eeHmRjrnCmz
 Baln6dW4lFY5Hp0cEL+X1xdgG2VuRRPsB1kRdwxj2PQXF2c9XV6yXjWJ5RLEUwVb/wW2wRSD/Rz
 GgJbr27d2DktrwafbmahSkohzsb4uqEnXKShlcTwTY7CGa3x2csFVbIbp+nqYXDj0H5nSp1uqQs
 aLuSDIJ+NivvZSSz3z+m/fQj/HqLDGQTTOBFDfmFyptHzuwkxYnkNeRw1iaI5WGVdjYqD0RA/pa
 8k5qfRMBBwe38VfoqYn9QYDJU2tf/ylqeFSmsca1z6FNkcD6G34bCvzvmQPDMEIHrVGrtfWoG83
 MESZb7GVA5+3SKdIfihMBGOm23OnUyKCTibn2v3fUbPIzufcx5IXcTlLUuxDu2qx4fZN95X9ZAh
 nBIzvTuWvZNhzbH9Weg==
X-Authority-Analysis: v=2.4 cv=N/sZ0W9B c=1 sm=1 tr=0 ts=69d7bd4a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=8nJEP1OIZ-IA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=tXddtnhPeo1MaeQpTl0A:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=crWF4MFLhNY0qMRaF8an:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090136
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102501-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E7F713CC3E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 07, 2026 at 10:32:22AM +0800, Yongxing Mou wrote:
> 
> 
> On 8/27/2025 7:42 AM, Dmitry Baryshkov wrote:
> > On Mon, Aug 25, 2025 at 10:16:22PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Use msm_dp_get_mst_intf_id() to get the interface ID for the DP MST
> > > controller as the intf_id is unique for each MST stream of each
> > > DP controller.
> > 
> > I think we have one sensible exception: SC8180X, where we have several
> > DP controllers and one shared DP interface, but let's forget about it
> > for now...
> > 
> Sure.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 51 +++++++++++++++++++++++++----
> > >   1 file changed, 44 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 05e5f3463e30c9a6bd5b740580720ae2bf6b3246..2eb5397d15732b224372c68d0b2b7167da9f2896 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -1429,17 +1429,52 @@ static void dpu_encoder_virt_atomic_disable(struct drm_encoder *drm_enc,
> > >   static struct dpu_hw_intf *dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
> > >   		struct dpu_rm *dpu_rm,
> > > -		enum dpu_intf_type type, u32 controller_id)
> > > +		enum dpu_intf_type type, int enc_type, u32 id)
> > >   {
> > > -	int i = 0;
> > > +	int i = 0, cnt = 0;
> > > +	int controller_id = id >> 16;
> > > +	int stream_id = id & 0x0F;
> > >   	if (type == INTF_WB)
> > >   		return NULL;
> > > -	for (i = 0; i < catalog->intf_count; i++) {
> > > -		if (catalog->intf[i].type == type
> > > -		    && catalog->intf[i].controller_id == controller_id) {
> > > -			return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
> > > +	if (enc_type == DRM_MODE_ENCODER_DPMST) {
> > > +		/* The intf order in dpu_intf_cfg matches the mapping in the DP HPG.
> > > +		 * example:
> > > +		 * DPU_8_4_0 - DP Controller intf to stream Mapping
> > > +		 *
> > > +		 * +-------------+----------+----------+----------+----------+
> > > +		 * | stream_id   |    0     |    1     |    2     |    3     |
> > > +		 * +-------------+----------+----------+----------+----------+
> > > +		 * | DP0         | INTF_0   | INTF_3   | INTF_6   | INTF_7   |
> > > +		 * | DP1         | INTF_4   | INTF_8   |          |          |
> > > +		 * +-------------+----------+----------+----------+----------+
> > > +		 *
> > > +		 * DPU_9_2_0 - DP Controller intf to stream Mapping
> > > +		 *
> > > +		 * +-------------+----------+----------+
> > > +		 * | Controller  |    0     |    1     |
> > > +		 * +-------------+----------+----------+
> > > +		 * | DP0         | INTF_0   | INTF_3   |
> > > +		 * | DP1         | INTF_4   | INTF_8   |
> > > +		 * | DP2         | INTF_6   | INTF_7   |
> > > +		 * +-------------+----------+----------+
> > > +		 */

Drop the comment, please.

> > > +		DPU_DEBUG("controller_id %d for stream_id = %d\n", controller_id, stream_id);
> > > +		for (i = 0; i < catalog->intf_count; i++) {
> > > +			if (catalog->intf[i].type == INTF_DP
> > > +			&& controller_id == catalog->intf[i].controller_id) {
> > 
> > && should be on the previous line
> > 
> > > +				if (cnt == stream_id)
> > 
> > if (cnt++ == stream_id) return;
> > 
> > > +					return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
> > > +				cnt++;
> > > +			}
> > > +		}
> > 
> > return NULL, drop else{}
> > 
> Hi,Got it.. Does this code looks fine?
> ......
> 	for (i = 0; i < catalog->intf_count; i++) {
> 		if (catalog->intf[i].type == disp_info->intf_type &&
> 		    controller_id == catalog->intf[i].controller_id)
> 			if (cnt++ == stream_id)
> 				return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
> 	}

LGTM.

> ...
> > > +	} else {
> > > +		for (i = 0; i < catalog->intf_count; i++) {
> > > +			if (catalog->intf[i].type == type
> > > +			&& catalog->intf[i].controller_id == controller_id) {
> > > +				return dpu_rm_get_intf(dpu_rm, catalog->intf[i].id);
> > > +			}
> > >   		}
> > >   	}

-- 
With best wishes
Dmitry

