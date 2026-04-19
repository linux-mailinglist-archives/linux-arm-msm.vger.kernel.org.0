Return-Path: <linux-arm-msm+bounces-103617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8On4GA8i5Gl4RgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 02:30:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FDD422BC1
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 02:30:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A445A301912F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 19 Apr 2026 00:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E282324BBEE;
	Sun, 19 Apr 2026 00:30:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XCfesNHq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QmTTRCA5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C5EE1F09A5
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 00:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776558603; cv=none; b=eTYs2iFcmBd7FcPa3D4XdEAJRoc1ihi6SoQjLLSdiHaiLFxgbt1tsPGmQREvoZYtFKifM22BA2tcKkLOG0Ve39DeScVWp06HVztzO9d2Xwkaa3J+MEUe3Nmt9tYQPgfdBml4T/mPoCxsdIYcu+sBm+lWE13pVtqyOcAr9tokFFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776558603; c=relaxed/simple;
	bh=dsAX/amlu/wjGyFpRDNbj8KcBQmWPd/I8Hecm0wlOtU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tXZk1rcdXCf3D+wBJHdgDZvMBStRzjOG2E+O16Bum0ySgDaovvm/ipT7cCrrXcjGg3Fgt6MAcV43N7XyZcEamGMjcEm8yjCFcxZWccltkYE7zSNCGcyLFr2OMMTh9S3r6EUpBKJek84UqAKBK3aATYsxh1NOf/7a5l2yQ8sdK30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XCfesNHq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QmTTRCA5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63IMwIZk1708994
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 00:30:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yVJVf4XIvKZ6i7x+0NR4DP8TeKhTKkDlVKnam6ZbTfY=; b=XCfesNHqu7/JXNhC
	DfUihonBbpUxE+I6FKIijHA8AUNDMMK9CPuahdVcYLpD/hq+gP2bug7d9VW8aj8p
	sXPsp01ZIbbKPbSQ7KvdxN+KXvwgwI52Ag/XHtVcKy6YcGoh1aRuHPt0BqT+r8ZT
	mBapBmWYTVCccXsnRp3IxAfin6Ogdc6/buHFprAvTH1q8kqKSYGpB1+ZaUWlf0OT
	aXurqJvciymnFh7U+raySWe1PudXOH3f31LPEZlotLccpzTqVmqG4JbuFh/I1ZVw
	FMlDpLT+HWb2FRyt2yMZD9dVvV3RgIEkbFKcJUtY419QsH4MaV8UwJluLAzPH9Mm
	aMPoug==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm261spub-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 19 Apr 2026 00:30:01 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d812c898cso55181071cf.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 17:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776558600; x=1777163400; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVJVf4XIvKZ6i7x+0NR4DP8TeKhTKkDlVKnam6ZbTfY=;
        b=QmTTRCA5R81eWnAc1rmsQMDv414Gwnl8JdnwHQhp8PiH/ePRP60bCV8r2GsDd/aRoR
         1yj+F07C30EMAKH72GG6tdcp0UWvtXvHEOmGqUagW9VKIEQYP9tcovLnbLDX4MTlz8iI
         LsBxX0eCvdwSWPfS10ByBAdvtORgXjdBUOcb7/iE3VqRhN+4VBjBRFdlgr/sX1EAmo2S
         MPkkD/3tZRkAevp7kfyLUNCfkzVDbkUH2z1j9J7T6RZ2XXd4rF2cQrqmyeE5T7TFppm7
         lzayBPaRr9+2Pe6P4OQTU7mPnFlG+ETPLblCkqnacE8SAuyhMVkEO3zzDTVPadqOSedH
         qw3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776558600; x=1777163400;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVJVf4XIvKZ6i7x+0NR4DP8TeKhTKkDlVKnam6ZbTfY=;
        b=Ajd4iDfCSZP+4WEYUUz70YKwQeRKP95Lr/5Wb2FIw254GoumalMFWbBeg4yVyB3VVu
         h2yDl1CToEcXSAcPcTZbcZZug7ygrBdmgaaAwMdZGFxTNSzl9ALzbXdDVaZSNkBqR31W
         RRnQFtvS206oBw0rYGUdjM9sCqEZ76bDTHVF3mdcmMZuuqm+SzT1TBnzfbLZsMf5kwlV
         ilDz0jgFxsW8eKUDD8RGQUNMKIUAn3qc1PJnIWb08eHThe0UUOY90uNfyoKu39TPe6Fi
         JE1Anbcbp/lHy2e6eeHd+Jp5DuL+hgcoXArgvpWg2ZZOfJwZqyr8sbU4ov58IqiS1NNI
         LmAg==
X-Forwarded-Encrypted: i=1; AFNElJ+Bj7EZ0MM+pfjY4VcLhbBxcK8ZrrzMsX7JwRfj+E/bINNkwbKIDSz4x7KM4Xx/TwzQO5sYsO4tFU2VtKdp@vger.kernel.org
X-Gm-Message-State: AOJu0Yyn/dKrRioYwGB8XAu9uywEIP5UvcumrCC3Gc8ApCkROgu8Ital
	0CxZXLXj6x1sOcd4dke8zVwJ6p+ehMB/enPQM3Hc4r+KwJWkJxe47aO0sJnjIM2XdWTdrsOz5p+
	pL/YiIwlvY9hK1YTRsf8/nMAaxmCWIT6DdZQNEZtgMbdFp2wr1LUoEY8CqLeazawQ2YbB
X-Gm-Gg: AeBDietoY7oqBMI1ygOfG9kqW2yegRz4ib/SV0y2XIaUqJfJZ6/FXfDVkvTE/qaFjMw
	JN/I3L8NoLPd4l2k8juUVF4chGhbFccSYTtn6MNmoru8qqvNsbA3S2kBeM5zAXg9rhDNGoT32/J
	7Df4tQOUd1o8n6VuDIdg1q6GdkzMkuh+bnZxrloADechA5txZ0V1ZIcf6hI4bSweRGQEf8/Mrjr
	jQ0b0O4QPNkF0YuWwZSaQ67DT3jkdKOwWcUUsV7vJsi+rpjbgEtGXRJSQjO8bTHL7O+kGV7aqX5
	uxk6xh0TSpCJowVi9D/RYrs6M8r5CbK7Ut3KbPGGt95vVHZ1Zhe4uZJfLiB+ek1pqUqlhtDfjJZ
	QLWYVLle9N/5TRps55VHe/CmLD5WGGDFRabN4zT32opShgs8Fd7iBr5DgO9Eb1lpSM+Cgj5ymqe
	ng8PY5t9xVVU/r4+s1GWGfdxc7TgNJzKD0VOyQhuAahGTang==
X-Received: by 2002:ac8:5790:0:b0:50d:8cad:2381 with SMTP id d75a77b69052e-50e36f18d42mr127332761cf.54.1776558600481;
        Sat, 18 Apr 2026 17:30:00 -0700 (PDT)
X-Received: by 2002:ac8:5790:0:b0:50d:8cad:2381 with SMTP id d75a77b69052e-50e36f18d42mr127332511cf.54.1776558599998;
        Sat, 18 Apr 2026 17:29:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc240sm1759416e87.23.2026.04.18.17.29.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 17:29:57 -0700 (PDT)
Date: Sun, 19 Apr 2026 03:29:54 +0300
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
Message-ID: <k6y3e4fqfwkevvvv3zmzmovsrz4i6qkxs3duhz7khsggxwwa77@uogtrpuaxhnc>
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-31-01faacfcdedd@oss.qualcomm.com>
 <pc4brjias4ixewzlsvnlhqhlz774z4p6aq7j4kldu5ze2e35sh@tsm2mtrkk3zi>
 <b5b3b1b8-ed48-429c-a87f-0278a6632313@oss.qualcomm.com>
 <tlt2ffn2xz3mpeoojcciieh35zc6pyowlkcjtxkkrnaj32enne@mbcrdrnkmaoz>
 <07ff4730-2efd-4e9d-b632-9fbb517179f9@oss.qualcomm.com>
 <vdjgzhx4xkvid2ukp7j3yir3n4tr423riyzvyzkrh2ssiub5at@pj6wfcy4jz5q>
 <4b18f14f-d485-4b9c-a75c-ead6f7c80f95@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4b18f14f-d485-4b9c-a75c-ead6f7c80f95@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE5MDAwMyBTYWx0ZWRfX9ws9P/73eQ0r
 kNEYTTJy7JpY6m5WbYpuRcIG1Sow435/m6AWHsj40Sirgs27hImePCtI/LS1n6S8/4A8ZoEiDGJ
 q/ks1B7hpf/uA8Y9p3oCGqHVBjyK5ymvv6cLLbLfiRU7PpQpN4Il7f2nifvNGaCTP7GAjcbxn0U
 5G+8V43kFCliZCMlDzU0NwA0kruRjyPa9EXuXIdyOGPtCZ9Lf/fCNVM3LmzHb4DwfORx/ZuHWy5
 y42Rq0CZDz2P+75Ne+8u6d/qK6p5CoCxl3cub4GgM9uSIRhPz2zci25R/OjHwDT+ZmvYsjm5+qo
 UUtDw7owrkAglv4oYD8H5s3ZczxekKVl1xNXqaNRD9zwh7jCy7hNT+lA0PUEZ0WCljKDsTl+bNL
 FsWhqVSKlg3x93yZwg16GBmw7l5fL/XskBFE4pjzt+UMPhGMLRSKwH3DNXrVJZTNfJ1h1ki++q+
 /5PtZP6jyxWowDtNYXQ==
X-Authority-Analysis: v=2.4 cv=dcywG3Xe c=1 sm=1 tr=0 ts=69e42209 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=1-tdV8naFid5rhdxo8UA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ceZa3M9b-DBYRMkkh-WzuEvdisyP5exL
X-Proofpoint-GUID: ceZa3M9b-DBYRMkkh-WzuEvdisyP5exL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_07,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604190003
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103617-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,poorly.run,somainline.org,gmail.com,ffwll.ch,vger.kernel.org,lists.freedesktop.org,quicinc.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C7FDD422BC1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 15, 2026 at 06:32:29PM +0800, Yongxing Mou wrote:
> 
> 
> On 4/15/2026 2:43 AM, Dmitry Baryshkov wrote:
> > On Tue, Apr 14, 2026 at 05:51:51PM +0800, Yongxing Mou wrote:
> > > 
> > > 
> > > On 3/25/2026 3:30 AM, Dmitry Baryshkov wrote:
> > > > On Tue, Mar 24, 2026 at 09:04:24PM +0800, Yongxing Mou wrote:
> > > > > 
> > > > > 
> > > > > On 8/27/2025 2:40 AM, Dmitry Baryshkov wrote:
> > > > > > On Mon, Aug 25, 2025 at 10:16:17PM +0800, Yongxing Mou wrote:
> > > > > > > From: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > > > 
> > > > > > > Add HPD callback for the MST module which shall be invoked from the
> > > > > > > dp_display's HPD handler to perform MST specific operations in case
> > > > > > > of HPD. In MST case, route the HPD messages to MST module.
> > > > > > > 
> > > > > > > Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > > > > > Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> > > > > > > ---
> > > > > > >     drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++++---
> > > > > > >     drivers/gpu/drm/msm/dp/dp_mst_drm.c | 34 ++++++++++++++++++++++++++++++++++
> > > > > > >     drivers/gpu/drm/msm/dp/dp_mst_drm.h |  2 ++
> > > > > > >     3 files changed, 48 insertions(+), 3 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > > index abcab3ed43b6da5ef898355cf9b7561cd9fe0404..59720e1ad4b1193e33a4fc6aad0c401eaf9cbec8 100644
> > > > > > > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > > > > > > @@ -500,9 +500,16 @@ static int msm_dp_display_handle_irq_hpd(struct msm_dp_display_private *dp)
> > > > > > >     static int msm_dp_display_usbpd_attention_cb(struct device *dev)
> > > > > > >     {
> > > > > > > -	int rc = 0;
> > > > > > > -	u32 sink_request;
> > > > > > >     	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
> > > > > > > +	struct msm_dp *msm_dp_display = &dp->msm_dp_display;
> > > > > > > +	u32 sink_request;
> > > > > > > +	int rc = 0;
> > > > > > > +
> > > > > > > +	if (msm_dp_display->mst_active) {
> > > > > > > +		if (msm_dp_aux_is_link_connected(dp->aux) != ISR_DISCONNECTED)
> > > > > > > +			msm_dp_mst_display_hpd_irq(&dp->msm_dp_display);
> > > > > > > +		return 0;
> > > > > > > +	}
> > > > > > >     	/* check for any test request issued by sink */
> > > > > > >     	rc = msm_dp_link_process_request(dp->link);
> > > > > > > @@ -1129,8 +1136,10 @@ static irqreturn_t msm_dp_display_irq_thread(int irq, void *dev_id)
> > > > > > >     	if (hpd_isr_status & DP_DP_HPD_UNPLUG_INT_MASK)
> > > > > > >     		msm_dp_display_send_hpd_notification(dp, false);
> > > > > > > -	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK)
> > > > > > > +	if (hpd_isr_status & DP_DP_IRQ_HPD_INT_MASK) {
> > > > > > >     		msm_dp_display_send_hpd_notification(dp, true);
> > > > > > > +		msm_dp_irq_hpd_handle(dp, 0);
> > > > > > 
> > > > > > Why is it a part of this patch?? It has nothing to do with MST.
> > > > > > 
> > > > > Emm ... maybe here we can directly call msm_dp_mst_display_hpd_irq..
> > > > > I tried an alternative approach by calling the MST IRQ handler from
> > > > > msm_dp_bridge_hpd_notify(). I expected that when hpd_isr_status ==
> > > > > DP_DP_IRQ_HPD_INT_MASK, the hpd_link_status read in
> > > > > msm_dp_bridge_hpd_notify() would be ISR_IRQ_HPD_PULSE_COUNT. That way, we
> > > > > could handle both SST and MST interrupt paths in msm_dp_irq_hpd_handle().
> > > > > However, hpd_link_status only reports ISR_CONNECTED. So I had to move the
> > > > > MST IRQ handling into the IRQ thread. Do you have any suggestions on this?
> > > > 
> > > > When are the link status bits updated? Please remember, we need to
> > > > support all three cases:
> > > > 
> > > > - Native DP, native DP HPD pin handling
> > > > - Native DP, DP HPD pin not handled by the controller
> > > > - DP AltMode, DP HPD pin not used at all
> > > > 
> > > > In the second and the third cases we will not be getting the IRQs.
> > > > Instead one of the next bridges (connector, EC, AltMode, etc.) will send
> > > > the HPD event, which lands in the .hpd_notify() callback.
> > > > 
> > > I added some logs and did some testing. I think
> > > msm_dp_aux_is_link_connected() only shows the current HPD state. Since IRQ
> > > HPD Pulse Count is very short, by the time we read REG_DP_DP_HPD_INT_STATUS
> > > in the IRQ flow, the HPD state machine has usually already finished pulse
> > > classification and returned to Connected.
> > 
> > But the IRQ should be sticky and it should be readable from the status
> > bits.
> > 
> Yes... I’m not sure how this is handled on other platforms, but on LeMans
> can not get IRQ status from msm_dp_aux_is_link_connected().

Can we clarify that somehow? Maybe with the hardware team if it is
uncear from the HPG?

> > Note, in the USB-C AltMode case the HPD machine is not used at all.
> > 
> > > 
> > > Because of that, the condition hpd_link_status == ISR_IRQ_HPD_PULSE_COUNT
> > > will usually not be hit.
> > > 
> > > do you have any suggestion that in how to distinguish between an IRQ event
> > > and a plug event in .hpd_notify() better? We probably don’t want to
> > > introduce another state machine.
> > 
> > Then, I assume, currently there is no way to actually distinguish those.
> > The easiest way to handle the replug would be to store the current
> > "connected" status and verify if we are receiving "connected" while
> > being connected or if it is a disconnected -> connected change.
> > 
> Emm.. Currently, regardless of whether it is the native DP HPD (on LeMans)
> or DP over Type‑C Alt Mode(test on Hamoa), a single plug event always
> results in two or more identical .hpd_notify() callbacks.

Could you please check, why? On Hamoa it might be because of the LTTPRs.

> In other words, after the transition from disconnected → connected is
> completed, there is still one more .hpd_notify() with connected → connected.
> So it still can store "connected" to distinguish between an IRQ event and a
> plug event from .hpd_notify()?

I've sent a series, which explicitly tracks the IRQ events. Hope that
helps.

Thoug storing of the "connected" state should help us to identify the
long HPD pulse (wich should be treated as unplug & replug).

> This is my current understanding. If this is incorrect, please feel free to
> correct me. Thanks.
> As an additional note, msm_dp_hpd_plug_handle runs through its full flow
> twice for a single plug event. Also, the behavior I described above does not
> include any MST-specific filtering codes.
> > For a longer term (and granted that HDMI also has a notion of HPD pulse
> > events) we might want to extend the DRM HPD API to pass through the "IRQ
> > pulse" events as is (instead of converting those to
> > connected-whilec-connected events).
> > 
> > Let me sketch a draft for that.
> > 
> 

-- 
With best wishes
Dmitry

