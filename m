Return-Path: <linux-arm-msm+bounces-92531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4LdEHgGui2nmYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 23:15:29 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 89BED11FAD9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 23:15:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 442223017128
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Feb 2026 22:13:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFD8A33D6FE;
	Tue, 10 Feb 2026 22:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HdEnIsj/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gIoTkVAI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4545A33C18B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 22:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770761603; cv=none; b=B6yXvaOBCTUu90LJCwT7f5ZSggOaz1VaRUpxhXBj3+86gNfCJVmJUN89nk6ivSs33ge9z3wgpXib0AsVNfQBMXrnkwuLi5Au2Vmozz+UIVaROwLDuVQcwiRYwKfVgMlBTZHaB6O20pbonPcRsCcE16nL6J8co1BW/j3rPyHdchM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770761603; c=relaxed/simple;
	bh=zwWrhU6LfesEpgYgA/BYgk/WJcEt3YxZza1OLt0VoVI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2dDp+7qm/2Wv8CRb4XRgujY04O4XW1012qaKoj3FrjFwkJrr1H/qgS9RUI0WCBwP5lW4+8oBskLSDrtlkVyvSUQsXUKPGkENQ1rQxMKsi2VWouQBNMQ0XO0Tkfkho5rZ2qwgWxhvQtdyjJscWgXy8/hdFEPdG0RETVx/q5qrgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HdEnIsj/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gIoTkVAI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AKCFp22640834
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 22:13:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=5nTCr+xuryPJ1HpVPDG/DVIr
	pdNtB8DMTFv7L6Sd+kc=; b=HdEnIsj/u9lznKcM+cVpa5eAlJjqKYDIdfXWleDx
	ILcEWqi3xNQPG1uqcdNJVKuH6RDVfPeA27IGCPyNzunTkj3rB0UhqAcxY4CHCpD4
	osOg2arsTz+URJlKTNL9WtjlzrDlp3XOhEyN1gjO1N0V/LIakS4+C7WPkkZr0l2G
	APeufA8GrK0do4Em2NyYow+uauEPvQFQ1yxVRmkfEmo3djaLnTLDVD7WxOLQhlVx
	IgOn/GWSYha1OJBPHRg3pPAkGLKxLapiu+khCOPei/UcpQkl2AGJgXtxW56eUsqG
	awmcAC9T8OxeFQHXdAtBuoYiLUXQLjYrGYx2WUDp356dXw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8bgngdwk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 22:13:21 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c52d3be24cso205983085a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Feb 2026 14:13:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770761600; x=1771366400; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5nTCr+xuryPJ1HpVPDG/DVIrpdNtB8DMTFv7L6Sd+kc=;
        b=gIoTkVAIKGbTWjlmagQ+AAorfGbdmyRFz541/T6hqztDQ2maOus3RL8nPiFTE7tvRR
         2Vf/4jGvEbeG4axdWgYa820L74+9eMmM7Po2/A6e3Y16SwQcAd9Zn7gM/OPFyKrjjE+I
         goc4oXHgikvNLDrXCVM30ctS1rKTIQL+NUnAMkPu74zqCRa7ka+zUSW+T7we+vFKyG7K
         /y+BkZP43JAzkYDOJkIhCTDrS0O6WDAJ4XAckiDbm+HD+Y6taDpQ0Fmyta3pO0SWh1nT
         NgNCYQ5XgtNeZXHPMwPOBR+Ty3jBAd/aOvqadb65AUInJA0ave56QcvgTtNaTZGUmXz4
         3/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770761600; x=1771366400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5nTCr+xuryPJ1HpVPDG/DVIrpdNtB8DMTFv7L6Sd+kc=;
        b=w6W1gvc955Dgw+o2DNqsW/VxF8ahoA08pvAHmnnpEqEd+lb+Rk5g1maewV3SsqGch5
         kRq5jXVWKwqKJW3hzroV+BXVY1V3NbSkMm737siA5TGxBqosTtD8gPjzeqCpKbYUukMv
         XKkwuwpG0cj9NiflWeLOEghp6GsbNSWfmrsVbqEtxvWM1W1aDy6QpkzBq3hQi6tNzYOi
         WScVp6fneAxGXKoVdOGY7DgZxtntHiWl4nBrH6tR39ThVrFXH0zj9cWJc6H9eAXLStMs
         6p3nTB3j6R2ixbFOUZsclOU3zkPnMf8vXf+Zmo25cRz9/soWdZvMr/WkOU0k9eL48Yrz
         yDJw==
X-Forwarded-Encrypted: i=1; AJvYcCWvUMxJj4XjhcWwfMGqahC1MToSnP5l8cxS7m4vAGZaziRK1IGSDrzLZBNgX504OWOo63djebOA/rGPG1P1@vger.kernel.org
X-Gm-Message-State: AOJu0YzkFKpcgRpugTayX14ZBkqBQWo2dWV+OjD9iBoRO/dbCUYHbwhA
	7drWdLmKJNylBZdTEwNBAJhPRMNmo/head9OJz63c0HnFVI1vGSfWoI/uempy6v87MVsl0mxbsw
	VF58tHT++bwb9k6Cr+Hdblj/cfgTlrkBJNPOY1xgIU7idYWNurt0dFUOCLvxoRPbq4wCW
X-Gm-Gg: AZuq6aLykJYjYzpisEzqnbNVLe7rtSgXawS2kshFX6VsheJcCMaWRQulyCdV7u5w7Ww
	VNIvmOGQf+yz67sMC/qxa7WvFRtIHVkmohLG9wwTL4f51jRtUyKHGdPSch2AeswYjFHvaZclZKT
	HnLA3783q0xT0Dg7f666UNCYKgqkwMioi8m9zxRCHPcJ/U5T+p0Xgzp2INwnLuhm1goIj94CuUs
	8KF20ZIg/Y1CRSjBLVeM4yeIzs0Yqhi4BSkIewr9VdxfVCtGi7aYzwDf0c5pflOmUbtX+oxzOdy
	uv6qvDZtB2Sz0kZf2pqlwEu+33hNkeU7cQid6voU7x3zZzlfxJRAvXkbJPM3Hdoq+bofOrDa/Mp
	TnJoyf49ya1Do4pXv8UxatUgHkxHk7i+yQO8wvjrmYM9wm5K51HHK+zKHCI3vrQbMnfjFF8LUYR
	D18D5krHYHxsyYa/RJS098EzoPKrO4ZdwuOfw=
X-Received: by 2002:a05:620a:410e:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8caf13083edmr2257942185a.70.1770761600416;
        Tue, 10 Feb 2026 14:13:20 -0800 (PST)
X-Received: by 2002:a05:620a:410e:b0:8c1:ab1c:f2da with SMTP id af79cd13be357-8caf13083edmr2257938385a.70.1770761599898;
        Tue, 10 Feb 2026 14:13:19 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e44cf6f72sm3521414e87.2.2026.02.10.14.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 14:13:17 -0800 (PST)
Date: Wed, 11 Feb 2026 00:13:14 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com,
        helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
        lumag@kernel.org, robdclark@gmail.com, robin.clark@oss.qualcomm.com,
        guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
        valentine.burley@collabora.com, linux-mediatek@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/5] drm/ci: move qualcomm baremetal jobs to lava
Message-ID: <55cjkwps5sfd766uxab5viu36tez77rnrlnabocqb3o7t5hhr6@nydrmwbimnzj>
References: <20260210071138.2256773-1-vignesh.raman@collabora.com>
 <20260210071138.2256773-5-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210071138.2256773-5-vignesh.raman@collabora.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDE4NCBTYWx0ZWRfX7rAWdfczyWWN
 yE9Q20IchRRag4vFPRqMuA+eVqalwRga/cMteRJHMKSpX5NJf3ziCk/tdo0lG0c/RLd4q4rWXaB
 ZoFVKzuTIA0IxrOSX5dlJAnDALgDD2q4pg3vVbTSHox814L9+/DDzQfwpFQas3RA4CPTOw6wdJq
 is2jgR06FZaGUcfxRoWjHOm7VUXn4J2MvbevR0OE/YX65Jsoq4POfA3qJ1AZZU1Ms/rUVhd35nf
 qe7NyToLc/xHxSoik9EpYbQNOMd+RCHPdJ291zbqr/2iS4WpmsFGh/7B0ty9kyRNC68PLCLjZEf
 bJ1HZT9akRX2C/jrTR8difbUUOKt+k9iTP/wIYjFF3OTKUDFJBWaeNkEK0a7BI0w7w6flwNJ8uS
 B5dQJ4fWZ9b9cWiwM+G+JPPZTTWagEyNOaIqF4R5v7ybwNxvNEwOGwkcjOlfDqBjkhtxkBX93lu
 tGr4JbkvDYbh0hYzXoQ==
X-Authority-Analysis: v=2.4 cv=TKVIilla c=1 sm=1 tr=0 ts=698bad81 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=QX4gbG5DAAAA:8 a=9K-sheTcyn_FmZRYi04A:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: czFjALTAKbxpM1hv9iiLfUYJIxsMU2k6
X-Proofpoint-GUID: czFjALTAKbxpM1hv9iiLfUYJIxsMU2k6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_03,2026-02-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100184
X-Rspamd-Server: lfdr
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
	TAGGED_FROM(0.00)[bounces-92531-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,collabora.com,gmail.com,ffwll.ch,kernel.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,lists.linux.dev];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,collabora.com:email,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 89BED11FAD9
X-Rspamd-Action: no action

On Tue, Feb 10, 2026 at 12:41:33PM +0530, Vignesh Raman wrote:
> Qualcomm apq8016 and apq8096 DUTS are moved to Collabora lava
> farm. So enable these jobs to use lava and update expectation
> files.
> 
> Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> Reviewed-by: Daniel Stone <daniels@collabora.com>
> ---
> 
> v2:
>   - No changes.
> 
> ---
>  drivers/gpu/drm/ci/arm64.config               |  1 +
>  drivers/gpu/drm/ci/test.yml                   | 41 +++++++++++--------
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |  4 ++
>  .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |  2 +
>  4 files changed, 31 insertions(+), 17 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

