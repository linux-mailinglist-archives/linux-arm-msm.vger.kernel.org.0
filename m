Return-Path: <linux-arm-msm+bounces-100787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eLi4L8thymn27gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100787-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:43:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6677635A70D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 13:43:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AE820301117F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 11:42:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E5E73C73F9;
	Mon, 30 Mar 2026 11:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VmruPPAx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZBdizP5Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DC83C73E3
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:42:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774870978; cv=none; b=fV7XfzwMhVEZd7KZocThf3G0o2oVWvkSWawpUtful+KTWx9OOJ+qPS4o/5JKKBFfpfKSHq5D09w0jzXxwyXUYnOdOLbBBlIOmGcQYlA9FL5rhBm5Muv/azRf25GkcL/wThQx3BpLi4cRvLEPr4cViQSaQyqpSJGsbjTiqx0AwHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774870978; c=relaxed/simple;
	bh=5eoqnI1RcEzPyH6gJhH8KM9kkq9Pz+c8FRyINE3vRDg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ClhUM9Ua/X2trzcDe5sisZOMg2FCDBFLu+zwcMiQnw/ZDXmk4m/Czl4GJBrIs8M3ySmf/57hiJgNfNWBOW+U5yYGJX8bN25oi5GzHF3XE9Ojjpcv15HAAWbPle0lNw/CNg47G+6pPqbP0FolaU7VzbClee1+/LFRVo0ySGKqeCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VmruPPAx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZBdizP5Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U7oIAI3424452
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rjoFSm6qiE7LWMLVtA5QcpAtvfw6I+fpcq6AR8NNYD0=; b=VmruPPAxM+D8ogZk
	NbOEHNIxyywAKKGN/r0PnpA52DtSrgXFs1QrfX03jrtU1cZJNPF7fg8yE/RNJfaH
	ORXqbUIGeqgT/29zMRd42JDFpJ9xL23ERXBVHlnOTip6UjnamLpm0jBFMQMYzwnR
	hbiTWpTUNRvFjZLQqoX+cY4ezFdKElvbl+aSY0UbXy+mh4AE72xKLnb4HxDbyqy1
	ZY9S2KfFzC1IHfQJCcv3bPn0pyqmaIvT/K8DUfDfilyRLIsfEDLJIwvHbdoHx7pA
	CWscTyOlyy03/HSlm8n1L1FbCYr5HKhip9ThrCqlQlaNjJWOmgCbDbN052/aEiKe
	iTY/mA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6ufmm2gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 11:42:56 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4031b86dso140096001cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 04:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774870975; x=1775475775; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rjoFSm6qiE7LWMLVtA5QcpAtvfw6I+fpcq6AR8NNYD0=;
        b=ZBdizP5QBVAhhFQkQ6NZwj1ZpmachnuDWhXAaWhWDGstQQcaAosyDRSxmsGOlujl8L
         GthvRAtgw8eZmEgtF5tLXbBUTkpA5PQQxnPCJOGJURPnXnqOHgQbdlqMY3r7HE2gZT/4
         8p1KJfiB4T73plwUOFrhqAKiv7p9siTM1txOG0ESY1v4U3pekD9cdfZM2j9PBWVhljk7
         vOhumSXnBD1EQjTTRmJOKh1uoXr5f+J3Xb+lL+47TWtc4kiZ37HxX3C/ELYi7X2ytCQc
         dhL7lEpuKf7lzHsb2jcMNAgA42huTi5HYo9+m7Owx9O7VVpnCjhQbKnDd7R3fcOnD0zH
         sVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774870975; x=1775475775;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rjoFSm6qiE7LWMLVtA5QcpAtvfw6I+fpcq6AR8NNYD0=;
        b=FherT/oxYdoY0ucRYHB6xGJu05dKf4fIpGWAgS6fcinUoB6GzMrR1J8hl9eFz+r3Ab
         G4eX26psWdmCDobFupRNp/w8oJaIebyGjkNcF0HgaYpCni8wTZ6LUqExLnhsyH+nOaxz
         kNMKkkhy3yaazGKWh+unjq5DjGCaGaG7w5uFMO0uQh8t5KqPcpqsB/BuXhKTUB642sKl
         pNkjbn0YRFT89IjjcKVeZKsdh3YzFPZDNtFJaHOHOUp6pEnC65UsKSuETQnugUVdAmOi
         CDujo9xNOcJP/KjWDICo5JB/vg8h1X6tN3eKi6HjUN8YQjPHOJ8i9hleKgtbc+8Fbofo
         XBbQ==
X-Forwarded-Encrypted: i=1; AJvYcCW88TcsIIQ9WsOQc7ZrErSauwl1kV7hjccXC0iRSuQwZrwBd7+vBOLenqjuqt2iDiKIIu9FQvLj1KsPVp1q@vger.kernel.org
X-Gm-Message-State: AOJu0YxTJrWKmadEUXOPr/GKl9JtOqhati3uBXyjrhR256xlnXZ+KS7/
	kTsJ0g1fG5C82J0xS0Xy9Tpp/wbUM02zUAAvpWpzidtE7T+hh8Z/iMUGO+NVjjMCTdOH2g39Wbu
	3N5674faIYvhK32rLDTF12EXWK32/wAwWfKXXjAyvfY4NTouvn45Fc9wbAJ5Byh5xX0HD
X-Gm-Gg: ATEYQzyfk3teKruSiBmiH+mS1Fxi7yoFHXdi/4iZsuDSqdHGFJc/WkxshSP/lWPps+n
	9qC7NM4obpK/SndHy0VwQhgjjr7tJTVzyecwTJUuKNAmCcbGGrvD7CU6JbyjFjQnuT8pOeNEF6B
	BaK/5u1yamnw60F5u9Ewd3HbC+GxsqQ71xiDrf5XQ8sYjDSt3cyDeFulMXiB6SRdE95EO6ruoyB
	pCrkc2Fsi3yZBZXZ3l2CsfVkbtx+LyN9zmAwNqWiSsWG2CLwDLcH3p93qnEzsLZNtbqAqeS1aLA
	Jq6EMAPtej4nIWyPejFfRxMrCY/lgkxYNwEG1VgZuAU/ZXUK7KjDzzPS5xqHeJAgSAiIfjs1qRi
	hBS5aQRAW44uPmk9AoQmBohImODQJNnspk2EhYnV0zbf21wZjQe3WNQkeGPYaiO+svIjEbq8chJ
	Jh1o92L6zCiEK/lqSjSwHn+ijmX0Vw4rpGJdc=
X-Received: by 2002:a05:622a:2443:b0:50b:4b81:e376 with SMTP id d75a77b69052e-50ba38b2183mr153351191cf.42.1774870974976;
        Mon, 30 Mar 2026 04:42:54 -0700 (PDT)
X-Received: by 2002:a05:622a:2443:b0:50b:4b81:e376 with SMTP id d75a77b69052e-50ba38b2183mr153350931cf.42.1774870974466;
        Mon, 30 Mar 2026 04:42:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c836d3f31sm16152051fa.3.2026.03.30.04.42.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 04:42:53 -0700 (PDT)
Date: Mon, 30 Mar 2026 14:42:51 +0300
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
Subject: Re: [PATCH v3 12/38] drm/msm/dp: introduce max_streams for DP
 controller MST support
Message-ID: <ns7sknmegndsf6uvih6znbwk6bpltjmbykvs6g2ma3ccd767fe@3q5rhx3zj27u>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-12-01faacfcdedd@oss.qualcomm.com>
 <ltlmp5ytl2f7no7aqq7sl54pwd4f53fuema23xnuwu5uthhbg3@7wamwvv22nle>
 <c71ea478-ed93-4f10-aba2-023180c2ed42@oss.qualcomm.com>
 <ex5zvncmnt5pmb5j2utolgbw3yewj4x4e6nu7sdrgzm7ubasmi@2jdubbxuckwd>
 <99d6795e-1cea-4e7f-b8b6-97f55af55d8d@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <99d6795e-1cea-4e7f-b8b6-97f55af55d8d@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5MSBTYWx0ZWRfXyDmysJzfFezg
 PQ+Btw378CPY7XN+3x05bGC8cW0xak/GSDnZ8zcsMFkBrwAmJVmvd5eJE2JfBRK5RA5aLF2Ed3m
 AcZDR2aUMDKZDE92O7mTM5g8C6YK3IPVtPx3N4tdRCtEGBUoA0YUtqC8oigfkwOdcoEckYb9+s7
 FfwtAKosDoqTc+6a85gJ2AkZU+ALeX25lDyE32woZY27QKWaGT5FsLY7uJI5bHZzyl1+CxkAmAm
 DqC/hozuyBgAsV49bItQvOeRtwrvd8PVmlO3k1kS2wfBcGA/5vl+NYkh//+whQvhl+Kzt9enqNl
 HRoYkxSPuE4o7quFoo0w2V0L/eq71u1ZSNpZIzr4B2Aqt8eUFgCy02Jlt5C8trvom1Pc3MloHx7
 Ss5wywZwpVYhIbHnQZlSmbhiV5USnQoyDW5NXYWCR6asvU+jizP9CrJL98Iw05Gq8+uNhW5Z280
 2fknTfUcnBWBF5wHvGA==
X-Authority-Analysis: v=2.4 cv=aOT9aL9m c=1 sm=1 tr=0 ts=69ca61c0 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=0iNppLCTePzBA08WBLAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: pT0-2cXwEzrp7AiC-Z8cdCDHyQHAADOF
X-Proofpoint-GUID: pT0-2cXwEzrp7AiC-Z8cdCDHyQHAADOF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300091
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100787-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,quicinc.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: 6677635A70D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 07:32:38PM +0800, Yongxing Mou wrote:
> 
> 
> On 3/30/2026 6:35 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 30, 2026 at 05:57:13PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 8/26/2025 1:42 AM, Dmitry Baryshkov wrote:
> > > > On Mon, Aug 25, 2025 at 10:15:58PM +0800, Yongxing Mou wrote:
> > > > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > 
> > > > > Introduce the `mst_streams` field in each DP controller descriptor to
> > > > > specify the number of supported MST streams. Most platforms support 2 or
> > > > > 4 MST streams, while platforms without MST support default to a single
> > > > > stream (`DEFAULT_STREAM_COUNT = 1`).
> > > > > 
> > > > > This change also accounts for platforms with asymmetric stream support,
> > > > > e.g., DP0 supporting 4 streams and DP1 supporting 2.
> > > > 
> > > > How?
> > > > 
> > > Each DP controller have it own msm_dp_desc ...
> > 
> > Why do you need to mention it?
> > 
> Sorry, I may have misunderstood your “How?”. Could you please clarify what
> aspect you are referring to (commit message wording vs. the actual
> implementation)?

"Yes." You mention it as if something was done explicitly to account for
those differences. And then fail to say, what / how. My assumtion is
that this comes from the commit text style (see
Documentation/process/submitting-patches.rst). Please use imperative
language rather than descriptive. It will make such questions go away.

> > > > > 
> > > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>

-- 
With best wishes
Dmitry

