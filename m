Return-Path: <linux-arm-msm+bounces-108015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id HWBNH9WZCGqGxgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108015-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 18:22:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B59F355C92A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 18:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CA8D03009CFF
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 May 2026 16:22:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4727B3E4C8D;
	Sat, 16 May 2026 16:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G8buu+GO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bsDv4Dtr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EF53E168A
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 16:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778948562; cv=none; b=dIY6TrLx8iId6wQdevPi5dqPPQSzMSOgegLsgwUhihRQeoy7bu5CwM2W2tLb9g/bV+pozyk9VHVj3mw7vQ6bOMiHzM8NR4ZKqlDdelYTN1lc+mftNDWZKfL5M4ffifiqp9Z0pGNlBDoUP0yRWJvAq6fHTJirKGkXlE9ASm1fQgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778948562; c=relaxed/simple;
	bh=QbSMZNro/tsFV61AOiauNJk5853m5ywcmzrf4R+Y1eQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XpUGsHkaNP47Fkmu8aIOptzzdJm0Km0Ii1MbVvH4pusqGKaiTangfOOzXQ4dVmE+j/IgJkeg2wWmg2lb9n6InO3j00DGcWXeMGWCsEFYujI2S2uq+kqu5kSNJJlHkKBBo6zSXC8j4rIAoiHBc9Gy3dJ5udLrWx7xwqBiJREGD5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G8buu+GO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bsDv4Dtr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64G3nolD4083010
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 16:22:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sVs3WHhnycnq25s8a2tK9aUD
	JAVeSsHh65fJqWlNy8s=; b=G8buu+GOqEIL0v4M+PIHoMe2SaiNTbHJuns5L0mT
	TiHZ++vCqcxw7Yytw+Jj5UjD0exUFJe7Y0Ssmu3tfSfiltROJE/ggx1yRVqGEyZb
	k3jMatjGYZfhO799MYCNczCpjSy/k73j/w/fdEQVO9L6ngnXNH7mDGtnf+Gvxu9+
	bn8vZ7NGy+nqItzskjALjrx3yR8W86kXfcWrdiZ3QfAP8uq3KoAIe7FwgaD2MrFO
	YnzgBe2Rr3FegOmytlFLW2thoYtll8UADbCSpdcbOPGZhGTcozOR5kfcvStU6s8N
	fd4pAFCcUNbwbr/URAVUdXiVLc0yD2G6IdfaQ8NhIorlQg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6h0q98a5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 16:22:39 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50faf575af4so28954021cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 16 May 2026 09:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778948559; x=1779553359; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sVs3WHhnycnq25s8a2tK9aUDJAVeSsHh65fJqWlNy8s=;
        b=bsDv4DtrslOTrOTDjsG7gZYu17raTjsNQYOLZnUYj7ZrgLFNJzwO/bUnzGLXJay5dX
         fHy+l069ayRM/TjmiaPsK8zIFROPpV+iy1W7UAFCaK7dXyhGJHZDGJ0QqsH7R+VqEFOO
         avZKghmaQNkOQmzdWIEF3s3AftUdqALCcluLGXSEdTGLQK6VWSz0YKFxPskd8SkkFL4U
         TyH1yxF+V/JyvaBI4ufLshG841Kah2JMt558NhFM1jb+NE9rWhfaTKRT3gEjZHLsDKx/
         hSGPfOlqw/iXsVhKN8QyF+KxOtqvcBrfCAAO4fSzgeTUPbi0IWjTKdgEZWKlWtbZcG1j
         77rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778948559; x=1779553359;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVs3WHhnycnq25s8a2tK9aUDJAVeSsHh65fJqWlNy8s=;
        b=Ms1XfDhl+7JsIBg1beZzp5U9aQMOqdnptmKeG+DX/FRZm+DuuctC+5+CmrMqSKj4pe
         Y7RClNuI9OpuP1Deg4IyaWO9SCedV7n2sTZpNJL/+IFmZPdmigQOgjil2GDVi99As1FU
         rcqEhATQesUNvH/u2Q1Otu2nx0SsjyrJrQbYRXk7Jg0togzuZRTcHWjYwHYzCNXLfBRs
         0PHv/3+5nG+kIPRaOfSPUH7nD7/IeJUjCKK0OslLNZpt71P4ha6fGWVRV6joTyXs2jKi
         D+YzdSzRHB9cXuN9CNKvwDxTtTYpXSndgXU0oKf7eXkqkJPBYSMdQHdok9hApIaS9qRQ
         BZDA==
X-Forwarded-Encrypted: i=1; AFNElJ/kWbjcHfYE7dnbymf0+eth4/mvW3ktFzxgn63NyU9JZ/FiOcpb4HyCM3uAyV9ug/P2dwjzKaRWk0ZwMJ2r@vger.kernel.org
X-Gm-Message-State: AOJu0YxZGtN+0mNGfdcAcOHbkkbirHxAcLecLjKtRmcDYiCbxMb78Q0F
	qXEw1HW62aOLxnZNgSnsUuITjeyrGjI2fi2UmCUfhCahQc5xekpkimBKrnIU5RlMn9k2ckJDSFt
	y+1rIrWsAoEUP1qzuVRl+NDndtmBTLBa59v7RdEudXQA+O0JXfkijWkUcsSEfoDOahXTd
X-Gm-Gg: Acq92OFgD9QctmczZToMk6TBP7c9I7ZneOU94kmA16TT1KU4Xyb/07dc0N44M/AZUIy
	vSZfcoolcM4DKEzGl9mruJvC2B4ZWEqxVgZ9ko3ZcWtvMt3Z4222eTI0+CKC2hYF8L535m3AJ0u
	YSGrytK9O7SukkCmSd3pvT9+sdRmTjFH1sXdg9zEAlxd7jA9CrKOgdHaaCHzmYoLOg0/n6Y7bmf
	wJ8kAujP/2GRP+5rZ2FgeKswRCCelKFfC/woMIZjtSgginpWjZU/76n4gP6UoCMg+T4h2omM5lc
	G5TgMidnx4bVispOu6N4qbs1PBOMqoAvGEB4hGHefmNEE5ScurZ1ZP2mREGO7VCgxp/gUVhuOhk
	cJGfhHnxrlobkzlJ3UDMi0dsGXFUtd8Xq5AiZ/rDev9iB5R0DHtDU4ELlOi7qeB2kogJDtoQQ27
	4Rdf4r7cPceQTkmwCSmncD6OSqopaRDZpSQxbaBDOspBabLQ==
X-Received: by 2002:ac8:5cc5:0:b0:50e:601a:217f with SMTP id d75a77b69052e-5165a076dcamr126517121cf.25.1778948559318;
        Sat, 16 May 2026 09:22:39 -0700 (PDT)
X-Received: by 2002:ac8:5cc5:0:b0:50e:601a:217f with SMTP id d75a77b69052e-5165a076dcamr126516821cf.25.1778948558822;
        Sat, 16 May 2026 09:22:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3945cab4cfdsm23943751fa.27.2026.05.16.09.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 09:22:37 -0700 (PDT)
Date: Sat, 16 May 2026 19:22:34 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Stanislav Zaikin <zstaseg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm7325: Move common IPA
 properties
Message-ID: <mpqxflj66d6gqwek4hmytp5r6xxposcrzyvh5vyvkstqgget6e@awxvzbmfy3nj>
References: <20260516090853.2873223-1-zstaseg@gmail.com>
 <20260516090853.2873223-4-zstaseg@gmail.com>
 <urrhdy6esy4srh4hh2ebqvk75z7xjk37n4nyaybaayitlnc3au@y6cm4y3trvis>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <urrhdy6esy4srh4hh2ebqvk75z7xjk37n4nyaybaayitlnc3au@y6cm4y3trvis>
X-Proofpoint-ORIG-GUID: _4i5AQUC_LdPoFjV0uylw5moXDoWsyCM
X-Proofpoint-GUID: _4i5AQUC_LdPoFjV0uylw5moXDoWsyCM
X-Authority-Analysis: v=2.4 cv=fIMJG5ae c=1 sm=1 tr=0 ts=6a0899cf cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=q6enR45eAREWc0_BSpMA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE2MDE2MyBTYWx0ZWRfXwVVAHaQUEFKv
 IaSHtjzfheSmXz1sk6fLX13G4gsXsblIaBPqNdP61Tz00ry4Ic2GPBlamFZY0WqHbYB4XFg1e7r
 xx8+LGmeYMC+PStkYDSPuGlrIjF8hBDseTCJ4uH/ypHo4BAOC6P3A5zf7jdmcdH7lzNeJdQxudL
 iVQWxjOUWYOz1a20AqLAwsY5d90s3GZllZVIFo9Wvq4gcmTp2H8T/66JcIsLUHxSc448QRBwHjK
 6aYNom2nd0vU2kQI3n0NwJX1gCq5KYarmbjUae12On2dcpPiizA4J+CZwMa/D0wvrCjO9jsuQTQ
 Qs5+K3usWDiVFI+T0slNzwL6sjWb+4xjVu07OYMU1zbg38Vm909rp01SA/AdETqONT7Iw8lsMwY
 7arktSJHkWbf0AeIvfkf8YbmeqMJaDX2HmmLg+FDeTmBfZICC0kFtop6pXCryAkiXU8+oy9qlId
 bnLfQpuw2lbdHeIkqkg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-16_02,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605160163
X-Rspamd-Queue-Id: B59F355C92A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-108015-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	FREEMAIL_TO(0.00)[gmail.com];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Sat, May 16, 2026 at 06:40:48PM +0300, Dmitry Baryshkov wrote:
> On Sat, May 16, 2026 at 11:08:53AM +0200, Stanislav Zaikin wrote:
> > The qcom,gsi-loader and memory-region properties are common across
> > sm7325 devices. Move them from spacewar dts to the soc dtsi to avoid
> > duplication.
> > 
> > Signed-off-by: Stanislav Zaikin <zstaseg@gmail.com>
> > ---
> >  arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dts | 2 --
> >  arch/arm64/boot/dts/qcom/sm7325.dtsi                 | 5 +++++
> >  2 files changed, 5 insertions(+), 2 deletions(-)
> > 
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Looking at it, the property should go to kodiak.dtsi, but then it's more
complicated because of the platform differences. I will take a look and
maybe send a patch.

> 
> 
> -- 
> With best wishes
> Dmitry

-- 
With best wishes
Dmitry

