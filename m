Return-Path: <linux-arm-msm+bounces-113303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AmoLCWecMGoIVQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:44:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7854968B043
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 02:44:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=cqIpPNgS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QBllsewZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113303-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113303-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3E3123002B65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 00:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A09401DE8AE;
	Tue, 16 Jun 2026 00:41:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C671DF254
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:41:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781570487; cv=none; b=LahtcrSkfdqoGjCqfO7AYsT0RVrxOrFKmq8bvWhtWkaQcHkSXevygSDWsISuLp7jRFiJZF48L7efmAOJ9MIRsNDBI2Qetpgb61Ja5wo99QnnU1r904mq8VyrRgKpR6BhRNjH3Pujn8LWDK8ZV2GI0GOUsMJeCNwsrViovXaIzOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781570487; c=relaxed/simple;
	bh=Q2sJ9ncZpf9ovjCpkmLG0jmcEoL+MyBabprlTz6cKjM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSsTBTc6Uo8YG3S9LphrmNH2ndROf3GFWIhSFaCK80d8mU6QzBaxOObLgTjKJIBtX6kWxc0AFcSq7GbC9C6V4sOvfSpwxyqq0UKGLeyOUNfgbK446znsxO2OexmjGxJ+NLHNge/xDgZqn2XidNtGdMrkXLiq8MC0N7vKEnJmUlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cqIpPNgS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QBllsewZ; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65G0OJRj2093858
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:41:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ja+WUL/JeEMUp3C7V9cZu6IMQ7GDhDQOxcuPvhdlOiM=; b=cqIpPNgSclclA99u
	n5INq/3dtExF2V05XOyuXC/wB2KFDLDGT70hVu99ztcMD04nnhcHWCzA6GEj3CJ/
	Whdjl41iv8iW+NncOxHZ9SYRxH7xE6vKgcXMRAjAVS7oWC28GSXjDFc1CFZXZyyx
	iKM4T7IKzAU+mI7hE5/BDGlGMcy5HW2JYQgGRRiY7eAIMbmCC+EfuiAu/3thcuT4
	1h5dTyHRDDEwe+8+nqh3yQJDPiDfJU14Hc0UnUYNSyzGlQ+k5mZF5rWHerp4KQE5
	3nMZ0NSMnNExuqH2onu1vg2oOO9lgJUpUstc1M8b0Comwq9xEo4gaHJO1idVUYPL
	9JMleQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter23w0r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 00:41:25 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-9157c8eb597so633490085a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 17:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781570485; x=1782175285; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ja+WUL/JeEMUp3C7V9cZu6IMQ7GDhDQOxcuPvhdlOiM=;
        b=QBllsewZscaYKimDZ7OcFWv5EZpcq4v7V3d6z5NwEBFBonepFi5uB3rxsoLCZhgsXT
         jITgaDPmRDezj2QGqC9ycGf4b2d2RgO6+C4UsrXtaSTCRE9q2+T9ITDgOFYpWvoJsxoT
         cf/FyFe/xSnXdfwtJHbgXrE5VKIXGw81gWXlYA6MH9yX6Mmd+ld8e/mJdwagm25slfDu
         A1W7yVxFavhEZMb6wuSVZHH/mUpONaid1sQ9RPaXWLriiYLOzS+1yR2Yt5QHwodbq5Z8
         sHdRhNAcCo7kNErArcL1f8arxThaIYePCBr81S9zw8hPeUMibbm68xUJBkguEHfjwoUD
         urcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781570485; x=1782175285;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ja+WUL/JeEMUp3C7V9cZu6IMQ7GDhDQOxcuPvhdlOiM=;
        b=d8yt5yIPMW0u0xfiYg1XeaIgThFehsieNn43Ac9Ub8MDZ09F/anPSWueabB5Ji8Vsd
         aAQDgPTxwkksdFiq19pmGth87lpGTTJwsdhbuUG4/Fr8n3DsYArMBljjVRMD+kviqKyC
         t8Gy3BaxStBddlliwvMUwUVj4N0uXhNP+VyQxr5Kulpo4pY+sbbhDw0JaYxYy/abClLD
         EE1zMY918s3KhKSPK4GfM9lsSonSUiF1DopsWW08XSJ7rVbaV9CUf6XMMga86FpOaL6q
         9QpqtKdmygurIopJjx1yK1b4eF0fNGwMz3zgiCaKAcqON7d4PLd4C8rizTXXNNPZYAGW
         yguQ==
X-Forwarded-Encrypted: i=1; AFNElJ/IQzbOJ1rur+XZ8qcJbEQuaL36/cfDv89TbPohWvMRJINawn3mZUpvkH7avkMCL+vdREXiXS5HUVz0XM3L@vger.kernel.org
X-Gm-Message-State: AOJu0YyqO/9j3MhYSqpKDE0jkJfCFp7WYZIgs9XNsinnbmW69/q8Zkcz
	kBB6iTzZ2ykwiqjfYO5EMSu3gSm0OFFiU0y6WCwHAyQWilQgbImdNzvjSwrb6CK0wb4rc0oQ+6K
	nwGlXxIDmINjR/sUevGGhbin5fkw3lQcuxdX5DrfGyqFkHbhvEW2Fjo51GdEpgOQCoAYe
X-Gm-Gg: Acq92OEsQYPDWiOI+iWMAJjIKACdCUdUhShZPiiugmhfrvUp1o7mDD6qrXFCM7gdCsD
	euJpPjJfCd5Rh+tqUrl6Sa4jh96/QOO3SJ4naI88byVjt78rsoZ2Ft/XqKdOpeAQW9dvPkdRpgu
	Z/MiJg2wcwmdUrj48PuuMicmvkoQtwQMCzWKacxOvCskE44ClA9H9CLA5hTr3hoV9MtD8mX33T/
	vlS0xkfOWwAKMtzu0NdUJ4VeKKp8PZEAOCmQHNBGVF90TvLiowIHACWYAYj1MrOn9eJnTtPVJth
	E93AJ+sIwTo/p7ujnPy3ZM6+O+VsNfva0Gh9cPcmKzwXHJgaNVH3YTuxY1Ww6ayF1H1I57gJwbc
	SsxEQgGd7Pm3X0o3gMiM5WMat9M2arLoqWsRfSYtz345awsS/QKr8c7AFV1hB2yMR+DbGf3lVMc
	WpprZxL2GTvfCmEKaEF0o9698VbJNaAKzBwYg=
X-Received: by 2002:a05:620a:bc6:b0:914:b65f:6b00 with SMTP id af79cd13be357-91c45513091mr266708485a.6.1781570484637;
        Mon, 15 Jun 2026 17:41:24 -0700 (PDT)
X-Received: by 2002:a05:620a:bc6:b0:914:b65f:6b00 with SMTP id af79cd13be357-91c45513091mr266705485a.6.1781570484189;
        Mon, 15 Jun 2026 17:41:24 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1b08d4sm3053588e87.66.2026.06.15.17.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:41:22 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:41:21 +0300
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
Subject: Re: [PATCH v4 18/39] drm/msm/dp: add support to send ACT packets for
 MST
Message-ID: <hwomujvf4h6hmyk3bu2a26k4ck26aggxbkovf36hdilk72zfcs@c67fzpbpx56c>
References: <20260410-msm-dp-mst-v4-0-b20518dea8de@oss.qualcomm.com>
 <20260410-msm-dp-mst-v4-18-b20518dea8de@oss.qualcomm.com>
 <6jkqen322yklhb4zzoj2kcgwayhcqm3mhnbrkgimr7zubwewao@gmuopu6uxakq>
 <49131a73-f60e-4296-a6d4-5ff59331a9dd@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <49131a73-f60e-4296-a6d4-5ff59331a9dd@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDAwMyBTYWx0ZWRfX+SN+bNJXvJla
 myUttZdGbZlEkiERJ+iX3nBftXQiY+iVtKPPvb71K4nvjjyeNlRHDADTYeCikFMqQH0SVVK2NHT
 fqDu2IQ9o/cKLndhnkf5E50q5g3m1KE=
X-Proofpoint-GUID: Q-YNGkaNpWc_U0-OY6S5zXVtzRiPkJBU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDAwMyBTYWx0ZWRfXzQH1LVR1um+8
 yFsDVvk0JHAX/4Kd/KOtFtdAbFAAEpXf4IXPgeC0Y9Y5uU069Vk0EEv0BiCMo/okqCxW4CVCX6P
 INObmef+HsZL4Ojo1W6+IkehR/0EyNilfSsh0d3bALJwF1AesqIAGzivJNMbmWKMBDC0OwDEpxc
 wBXe1shP0wf5BN9CZ9HdOB+ey5A/PiJEpBhaQbHILUPcBF4FQYdUzbunwymycYBCWv0cN3jiLR5
 dW7b5EyjatqmZ7qntEcTENJhK7Q6ElDCyuK31EQuwXT3NEqmIXYfYaRI3PWHXGJTcjtmN0rbSUU
 jyX/q03w5fV1jVSGBPHqyZyvD6YJOEuCCE/CnrFUAvxj3nHbaHhqjLESodmgmhDNMs1mBb8kDOX
 Qc/Lyz6A4jSZUgcl8pl9lV4RkJN9a2PL2vOE982yDl5nSdCyG69GDJIxIYCIbXLzWT8rDgy3eWq
 bt6zLY/4ZOwmdX9vMWA==
X-Authority-Analysis: v=2.4 cv=F4tnsKhN c=1 sm=1 tr=0 ts=6a309bb5 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=UKJBJXdgpxAKM_2I6NcA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: Q-YNGkaNpWc_U0-OY6S5zXVtzRiPkJBU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_01,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160003
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-113303-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:yongxing.mou@oss.qualcomm.com,m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:jesszhan0024@gmail.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:quic_abhinavk@quicinc.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[quicinc.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,c67fzpbpx56c:mid,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7854968B043

On Mon, Jun 15, 2026 at 04:21:14PM +0800, Yongxing Mou wrote:
> 
> 
> On 4/12/2026 2:57 AM, Dmitry Baryshkov wrote:
> > On Fri, Apr 10, 2026 at 05:33:53PM +0800, Yongxing Mou wrote:
> > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > 
> > > Whenever virtual channel slot allocation changes, the DP
> > > source must send the action control trigger sequence to notify
> > > the sink about the same. This would be applicable during the
> > > start and stop of the pixel stream. Add the infrastructure
> > > to be able to send ACT packets for the DP controller when
> > > operating in MST mode.
> > > 
> > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > ---
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 43 +++++++++++++++++++++++++++++++++++--
> > >   drivers/gpu/drm/msm/dp/dp_ctrl.h    |  3 ++-
> > >   drivers/gpu/drm/msm/dp/dp_display.c |  3 ++-
> > >   drivers/gpu/drm/msm/dp/dp_display.h |  1 +
> > >   drivers/gpu/drm/msm/dp/dp_reg.h     |  2 ++
> > >   5 files changed, 48 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > index 1109b2df21be..6f25145ef214 100644
> > > --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> > > @@ -143,6 +143,7 @@ struct msm_dp_ctrl_private {
> > >   	bool core_clks_on;
> > >   	bool link_clks_on;
> > >   	bool stream_clks_on[DP_STREAM_MAX];
> > > +	bool mst_active;
> > >   };
> > >   static inline u32 msm_dp_read_ahb(const struct msm_dp_ctrl_private *ctrl, u32 offset)
> > > @@ -228,6 +229,32 @@ static int msm_dp_aux_link_configure(struct drm_dp_aux *aux,
> > >   	return err;
> > >   }
> > > +int msm_dp_ctrl_mst_send_act(struct msm_dp_ctrl *msm_dp_ctrl)
> > > +{
> > > +	struct msm_dp_ctrl_private *ctrl;
> > > +	bool act_complete;
> > > +
> > > +	ctrl = container_of(msm_dp_ctrl, struct msm_dp_ctrl_private, msm_dp_ctrl);
> > > +
> > > +	if (!ctrl->mst_active)
> > > +		return 0;
> > > +
> > > +	msm_dp_write_link(ctrl, 0, REG_DP_MST_ACT, 0x1);
> > > +	/* make sure ACT signal is performed */
> > > +	wmb();
> > > +
> > > +	msleep(20); /* needs 1 frame time */
> > 
> > 20 ms is 50fps. What if we have 30 or 25 fps?
> > 
> This hasn’t been considered yet. Do we need to change this to wait based on
> the per-frame duration of the mode?

I don't know. You wrote that we wait for 1 frame here. Why?


-- 
With best wishes
Dmitry

