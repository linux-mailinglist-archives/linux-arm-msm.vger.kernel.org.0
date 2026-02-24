Return-Path: <linux-arm-msm+bounces-93918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOALCNlSnWk2OgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93918-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:27:21 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B2DD183058
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 08:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A1D1B3100DFD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Feb 2026 07:21:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22A19364049;
	Tue, 24 Feb 2026 07:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="p0um4hiQ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XoZIZFuw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED96364046
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 07:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771917688; cv=none; b=MpJeM8Om683XqL7wrS00pw5jtsf2C5gpUvkbbhbJ4b2AcQSd/h0T0q1jafDP2uNxIWPCr1l96OPj+LACTxhFGQbxbo+xVKBaUtz52myegT8nk3E0PJWPI83Wi4E6lz10f8M8fcY65ZWZX93GOaO4ddflXdn11XWw8nROtN+UR58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771917688; c=relaxed/simple;
	bh=2Oo5EAn9TYGQNDDJZYvapbF8Sact5ScZi6mOCjWKAqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d4q2ZGGCpWwGvk0G9x98XA3ZLvwum9faABagnmdLpRIKWbqfI6UalgMIYJ01HHTPKf9PWxbvuo3HVxex4YBW95x5+wRkp2i9Q+5ofuxeHxdxlNGPzlvx8tQngc0ZsA0rS3wH2WPRiA6SV6EM9qagrkLNLJ2p+aa/MQsKdpEHoUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p0um4hiQ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XoZIZFuw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61O4LoCE1251479
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 07:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T0ptxbfQatTrOVAO/G28RkpobXhVGO3y8VIrk+NY+II=; b=p0um4hiQGFIsrSen
	Fsinht2Gp0vYw/rT2BAbNhJpIS6lfTtT1rI/+dW63BPNydZWtn1te601AGv/Cs10
	4fma4O/52lXyrLm9ksaLWhEyADj/U5a7Ov0PC7mJ/v8oXHMbOvHFbeUzlbet0yOj
	+p8ZhVEnu7kbg4ynfyrew+gQ+bCCeRWYPWmTLWPQ2rWqAF96+YehuVgXITKyX+xm
	7JtqxmOkqyni0k4hu8554rAE3nwVOCG47AUg5mzOK3ZVItfhzFTnNywsJPEiWgVM
	6ncBFrx0GTgwN2cg1MX9Mw+lxOY+2bjcyktaP4qHb7pXKT5ir5n8ORNr4+hts1va
	ZT9lyQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ch4568jxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 07:21:25 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb390a0c4eso2197666885a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Feb 2026 23:21:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771917685; x=1772522485; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=T0ptxbfQatTrOVAO/G28RkpobXhVGO3y8VIrk+NY+II=;
        b=XoZIZFuwXagq3k3oaeycNzISDBLhonRcPZqGRsggiPQjtVj7kU/E7Bx0xc2CldQBmo
         FoFEzw5Jvgto6CUMNxxrcssutkA/9ipTLUWQ4vzEBQulXrda3zs80YDouMh81zrGJJJh
         CaBPK3ZrsnUcVlAyBOVg9ldmDtEMsjq2FkmhoenAFMQwiU6WpmcGgEthuxwQG8woEJT3
         t1jCOcC7huQKUjpBmJMJQTmiiFfNxxIAGNhigkrA0tj8LUghWPBRp5UEXI0KmSnpnLhe
         tkm7NRKimTntB1YNwDnyHcQuC/qlU2yDqcW+eiUwUpHid7++YqhEpLoENfuaoxt7LLMw
         qVbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771917685; x=1772522485;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T0ptxbfQatTrOVAO/G28RkpobXhVGO3y8VIrk+NY+II=;
        b=Lzydqb/cW/ETldtNlq+jGCGxOvMiYkYkPhad5mKDtuoTZe+NlEz+afa91MitjjHam3
         bGxo3E0US4a1Grn5jdMUa1DHj3TwKlXMlPb/uW4pma7f4awPaiJpWzVAYX+sFifNbVBp
         UlypUSUwnxqL90V71/aIPPNgqqNVIiw0GHYt3xGJ2toiqS4TrUZuETz1QKPlqAdaPQ7I
         tWeIkdoxkRlm0MiC8+LbLZNSa4IjQ+7l3dxQllrJqyt+guqwwJpPAowFt4rQALlAPN9a
         qFKP7ZvqOwyFPGIlAB8DQb1xubyUQXJ3zebYVmBG8YDAGuQwxZAzYoHM2dF6UEEUwIKw
         k4fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVMHSnmShy1KYIfL4Way2KKLNzRp2oclVKdWDb27Wvp3josz+czdiotwUBCXs66ERSja4iK8COeiRu+hje0@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+croP7B3I+VxUS3mQ+2+3TcULqHkW7p4A/086HE89fWDvDRfN
	hhq+KU+M/nzZ/gW12d0Z0Vl/2/4AlEuQyoWxmoUU7o5NiPYNjaLAMWUssieALtuedzn3QFzJJAM
	np51VvY3Z4BN4IcjMJNk1kuofqtVc2bsKpOsHXNVAQ25ebLJtp+oIWkRAzv72UIkMnyH+
X-Gm-Gg: AZuq6aKC5z0ww3eshreWoMpgW33eHpLBDxAbRK0rytVNEx/CSz/oo8J1CHuts41/DB8
	zOsnHPUTVt+ij3VCNwxSYlDIlDx119PibCLhAcU7Q1MECS7A5Bq+hkyp7sSzL6XcbN56hDdeoWM
	IwCSxZkSEYNE0L0PvVJzJI5msGrTzrSoYdKaMAMALOJ1htwih0bgOV+vo3JpO4ObIFmvJw9g2kv
	Fu/G/nxN854CHHrOPpU5aYMnx5YZlXtHeKmjUI7/bgq+psDra5iQDAxGemeDTu4/TsyKGUvmpgA
	Lhb+mD0trLd/2QzE6VShh8vsXHh9m+JxMcAiG6142G+LGNwRGtRzfj33HH1I16RW10JAXzLkJd5
	vRvf0qzOqJ928z4xw9xMt3AK68kkMxIA/7bOIj08lCSPo/wc4ZAoLKCI9arOMkZxtmYcFhv705v
	4Y0lsVaMQNto6x1BCfSuEF3Z6oVhdB/+Tukuk=
X-Received: by 2002:a05:620a:46a4:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8cb8ca75f46mr1336074485a.59.1771917684842;
        Mon, 23 Feb 2026 23:21:24 -0800 (PST)
X-Received: by 2002:a05:620a:46a4:b0:8c7:c25:9e53 with SMTP id af79cd13be357-8cb8ca75f46mr1336072385a.59.1771917684306;
        Mon, 23 Feb 2026 23:21:24 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a0eeb45ba7sm2033409e87.70.2026.02.23.23.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 23:21:23 -0800 (PST)
Date: Tue, 24 Feb 2026 09:21:20 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dsi: fix hdisplay calculation when programming
 dsi registers
Message-ID: <y5rgrdq7caj7kii66qchgo2rfhg3hassku7xrjhod6l5kvxqlb@mnpnvivntcuj>
References: <20260214105145.105308-1-mitltlatltl@gmail.com>
 <wou62ifuvwru3mu3m5msuuolvou2ivkxbqjz4efy625cnnxagu@s3ofi33zqveq>
 <CAH2e8h5_iBk5eiOpBi8yTa24LGNCxutA3HX72dKazKGo=XK61w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH2e8h5_iBk5eiOpBi8yTa24LGNCxutA3HX72dKazKGo=XK61w@mail.gmail.com>
X-Proofpoint-GUID: g9BYSTY0McB9GT626RrTdGad_bOwfgP_
X-Proofpoint-ORIG-GUID: g9BYSTY0McB9GT626RrTdGad_bOwfgP_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI0MDA2MiBTYWx0ZWRfX5aLNj9GxQkOJ
 yHWlqGDUb0OZ2q3vmBxH7nOPxqjFhUZWMbkWWEXRVgRS2NPn3Fndsl8lNwmJMNVWvTEdgqYqPyx
 8hcHRhhBiXeZFCb5EdoFfzhhYkXhiPqvQs8xj7+7107vOEFxoM67eXOssq1T7U+hc4kKFDFa2U+
 deuyRS0YSh4hL2f0nfmYjNZ1r38gvo14949QaiPmqxxWkCEMSK+9AioZWrygJL4IZDZccCCk6+c
 V1NLhJbv+PQdmEFJMNaPLvUua7U7HldqYxKhMnnhkeRh6ZmVHCh+A2gfNWen09NPE1mqNHVrd9x
 5GDF7c8wIOXu0tvADMhBv5mueHgi6UMFKP8HhuZIiOzSyn73/TEKdZ1LsWHnwps+GKrOVD/xB9U
 8ilcK8BYR+8aKbZnBFn2erNSXvAVIlCV+ToaXAkJurNfuifX/wsoN2nA+ADXTG5T06MPoIg/utR
 V5C+4+XymzesxHC/THA==
X-Authority-Analysis: v=2.4 cv=J8enLQnS c=1 sm=1 tr=0 ts=699d5175 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=02btdveoW1BI-Tfr630A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_06,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602240062
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93918-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 5B2DD183058
X-Rspamd-Action: no action

On Tue, Feb 24, 2026 at 02:34:28PM +0800, Pengyu Luo wrote:
> On Tue, Feb 24, 2026 at 7:35 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Sat, Feb 14, 2026 at 06:51:28PM +0800, Pengyu Luo wrote:
> > > Recently, the hdisplay calculation is working for 3:1 compressed ratio
> > > only. If we have a video panel with DSC BPP = 8, and BPC = 10, we still
> > > use the default bits_per_pclk = 24, then we get the wrong hdisplay. We
> > > can draw the conclusion by cross-comparing the calculation with the
> > > calculation in dsi_adjust_pclk_for_compression().
> > >
> > > Since CMD mode does not use this, we can remove
> > > !(msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) safely.
> > >
> > > Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
> > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi_host.c | 14 ++++++++------
> > >  1 file changed, 8 insertions(+), 6 deletions(-)
> > >
> > Could you please point out, which platform / device are you using to
> > test this code?
> >
> Hi, Dmitry.
> 
> I was using Lenovo Yoga Tab Plus(sm8650), it is equipped with a
> native 10-bit panel, the resolution is 2944 x 1840.
> 
> I am using Lenovo Legion Y700 Gen4(sm8750), it is equipped with a
> native 10-bit panel too, the resolution is 1904 x 3040.
> 
> I witnessed that the DSI_ACTIVE_H_END bits in REG_DSI_ACTIVE_H are wrong.
> For Y700 (panel in 8 dsc bpp and 10 bpc mode)
> Upstream: 0x015e0020
> 0x015e - 0x0020 = 318 = DIV_ROUND_UP(1904 / 2 * 8,  24)
> Downstream: 0x011e0020
> 0x011e - 0x0020 = 254 = DIV_ROUND_UP(1904 / 2 * 8,  30)
> 
> dsi_adjust_pclk_for_compression() did:
> new_hdisplay = DIV_ROUND_UP(mode->hdisplay * drm_dsc_get_bpp_int(dsc),
>                             dsc->bits_per_component * 3);
> new_hdisplay will be halved later for bonded dsi.

Ack, thanks.


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



> 
> Original calculation must be wrong, though it is unused. We can refer
> to the downstream too.
> 
> Addition: To support 10-bit for dsi, more fixes are required. e.g.
> programming VID_DST_FORMAT_RGB101010 into REG_DSI_VID_CFG0
> adding MIPI_DSI_FMT_RGB101010 and bpp conversion into drm mipi dsi
> fixing DSC RC parameters? Recently DRM_DSC_1_1_PRE_SCR is hardcoded
> etc.
> 
> I just brought up the panel in 8 dsc bpp and 8 bpc mode. I will try
> 8 dsc bpp and 10 bpc mode after a while.
> 
> Best wishes,
> Pengyu

-- 
With best wishes
Dmitry

