Return-Path: <linux-arm-msm+bounces-100797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eM8EO2N0ymmB9AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100797-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:02:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3369835B8FE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 15:02:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0315A30075E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:56:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86F423D1CA4;
	Mon, 30 Mar 2026 12:56:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WUHb8Xv7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TK2g3jK6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5903B6350
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 12:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774875360; cv=none; b=HluofmyUn9T7YMWiIK7iYb/yGS1QcSMDqQNli/LTl6mUsFJrbSkX6feUyFTKLidG9aVE3d/cSb6YP8ARgzDEuVoWsmnKesEIJOed8R+zC26WNZfW3YRUopxAKMgur0HZbgpd1Ol9Hv+9kKo0ADahmdo7SyfO2H8YbTpMQtViJzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774875360; c=relaxed/simple;
	bh=wADqLBIuu0wHUnd3L4QtQgmFjnNFqNtU+W+zPrEI+X8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dXkDvIHLbIRIB4+FV8LmycShSQv0/DjdfQCCSdP9C101aZJs4nCggrca9q6bvkeOYoEERevmuPOabgl+ALJb/qoa+SJOp1DmxY2MLVZO3Y8V9hY/DCm7HWxxtOl1HJgv/JCIcMwpih28CxxpeWBLXa/eJj1POBI6NxQm3EKT9Yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WUHb8Xv7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TK2g3jK6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UAGi283175040
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 12:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ytaBsCpX3Oi+XaxiWu6gHvI8
	cOcnRa4qrGzzXNNXFps=; b=WUHb8Xv7E2jmWhGDBUDGQ79ESL2ZfZ3PBaeoHUwC
	3JADs2T3pj5ULUnueoQ0QwiSqREUjmV1s++FAjz3iJEB2PqHI6dt3kJh+pS8lDZu
	EsFN1PBwQE5uYqp2zafmcp64RVYgj/I5AZaOHUAysOD7/aq8zrVANuYLQ5UnKQhW
	LZlfolyK2hHVQB9GSAymwm+YSCSsIL4vxRb2JIpteo5y5HIG5TqQhFXdDGhvHRKI
	fKkLyw5Tilc4LwHe9Ye34kfn9+KOEgfEL9VkxSHOKcghB+61D4nd0WMRos7C1RV7
	R1jzG4m7KusJONaS3xarh7uFAXVA5VtKu85o7IRGOjRMwQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h0k1y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 12:55:58 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b0bf2b3879so147218025ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 05:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774875357; x=1775480157; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ytaBsCpX3Oi+XaxiWu6gHvI8cOcnRa4qrGzzXNNXFps=;
        b=TK2g3jK61yKREnh9PQI4LqOFIlTPqEqBouFy3McYSOmzODa8zJJoimP9vswEJ6THRj
         QGL0knqQMyXpar+n7a/uBTIiTiyVIiC4Qcy2fuyCBm1p0TEd/cVDqXWjTmA9vXnsHO2Y
         I9elGbyMcWUT7tDrZ7v/sgcaTK7jtrrMWUPxToh9Il2f+4sKpai0hJObJpIu+u5urgXy
         +Td5gi8aa2PDM+SB+eIJkb+MKl/sa+W0pgqQQ8/JUE5pdQFdm7zB0D/SQwn/aBJCVPL4
         vVn+D4iv8gv89MOwOye0VVp0kOmRphUoV9H09FWcHEXCujN7SLruHs0JN1zjMG8rHE95
         ZOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774875357; x=1775480157;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytaBsCpX3Oi+XaxiWu6gHvI8cOcnRa4qrGzzXNNXFps=;
        b=DM9wB9e8Ck7piQ+ATH58/A944FKlpHi66nA+pp7xGmoTdD0pyy0MyPd0PlYzIFlrlf
         B3P5YX5c0mvOC7smKAiXNxnLoBcFMdod/Z89gCmpz1nz1T9mCdBBqOnn25D4jfiCX4+I
         XdJxlLItBq4QkXT6n5G/vtX70Nh3tgxcubJ66PpMcy/DOz9EBhZWJ47+iLzanEhiYtih
         q844YXMZX4YBNNXlDaLGoR7jgihV20vVpQA9MR0UBxJq0OueYRxDDlQ+g+BC8WVT3rKU
         VotMFFwNfFar5YfxCuxJG7oQWdjA4O+ehJqwJBP1YyoUuehWQdvay0YFopPZqR9c04Qn
         EyKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVni2nov93nHhNwfhjqHXzv85wfybfVUkURAV3NFJWZySZDXFB7jGfxb5YOj+XmCVLfU685MXFpa6WURZsc@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0O70X4T0V6KIBN0D8xPTIrvd8d9t4mmRzIOFh11Y6M0/xpJVk
	3dYC3OeDsbN+JOCVB0DheMpcxiPi7UqUxeZeg371p+W5xA6WqnBN5EENWlvLUMH24iKsWPd3YUc
	i7TYrwQN6gqdPx+ykME1cQEP/ccq9cpAvq0jDTygqVSdedwULMG/M9Nbf7OK2hVrGM8IK
X-Gm-Gg: ATEYQzxYW7iz41hr/n0dk9aNSiLLVEDaB1tmAYHqM25YI+Hs6X36KnEcOs8qqfJ0YtO
	RMse2WjdsMIliwiws8zZMDOFHND1+7jeY16cT8Qw7etFHPqnR9ZEQPxHWDLilY5EJlWzGYN55DE
	lw/GoYGlYklI4I8h/ajNC1zbn/iibxxGleGRee4UIBwKm5Md76+ysmqe7zAk4byZBWorIz6D5sm
	OzfKwYM0lUWblHujOJ2kUSlXEhpXA8+E1MdS3qstomJBCuHNvDRz//UiM81uThngsWuyv9zKJVA
	Xc12+rxwAh6LZYdjNF41VqODbElerWeqn7dQTUgSopVNkRKf+nnwhU1vYojUe/gt3gTynkakdoY
	/ybkrVIe+XvTh1bTBKYT9Jcuv4VOp8Yjap38f8LJN4SEk8fVU
X-Received: by 2002:a17:902:e809:b0:2ae:4150:3118 with SMTP id d9443c01a7336-2b0cdc3b9d9mr125462505ad.12.1774875357127;
        Mon, 30 Mar 2026 05:55:57 -0700 (PDT)
X-Received: by 2002:a17:902:e809:b0:2ae:4150:3118 with SMTP id d9443c01a7336-2b0cdc3b9d9mr125462285ad.12.1774875356530;
        Mon, 30 Mar 2026 05:55:56 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242765b93sm87234285ad.51.2026.03.30.05.55.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:55:56 -0700 (PDT)
Date: Mon, 30 Mar 2026 18:25:50 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] remoteproc: qcom: pas: Fix the dtb PAS context
 creation
Message-ID: <20260330125550.5kvn4mo5kplexa62@hu-mojha-hyd.qualcomm.com>
References: <20260325191301.164579-1-mukesh.ojha@oss.qualcomm.com>
 <fcgfzcg5upqw5idgb7acayxgtrmyojtmosqbzqok2cl6dhyr36@n5oyb2rbkf3k>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fcgfzcg5upqw5idgb7acayxgtrmyojtmosqbzqok2cl6dhyr36@n5oyb2rbkf3k>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDEwMSBTYWx0ZWRfXzevKTr3zw9u1
 mPMxmON8eyt8+brsI6FiVqZhldDNc9wNsUfdBXHbcxzULe70a8cOlbaCs/E4CrzwzXqgp9UglAq
 EA4bDykT2dBTBKZsaeiFQ9/YdhYj41IoUkma+0yt/JSImJdS1PQN8YXG+cSi5aZMTZOPe4kRbwR
 W9f+/224b/xZXdW/f9f56Ja3YcWRBJaPNjL5hTKiSXeXPWBYcYSUhwlTSxD0lgS9R4mu5Wq+S6m
 EWWK3zZ/GI7nBJaIdO6DbOTPeUGe6o7nB1Jkzlm4sVZaYPZnvEkoz1Vl4lxiJBioS54EWGpraQJ
 QpAb/wH1zRQf56gIlwgRH0jbUzKJSSmKcyJ5IrqNmXLi8UfGMXk5z+hOCCN7Y589gVpzE98HDQd
 DqLkRVxneACj+E46k4Wljm0tyQ2bOXmacn/iR839CDvCzk1ix8XvbnRAAoJEbRif8HI+6d1WUwz
 wQddwhWxNXPVPmdrYww==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69ca72de cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=0qksRMzqLdDqFFOAvkIA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: yurKYQ7SYE4s8eZvjaJBQmD-IFGD7Cb9
X-Proofpoint-ORIG-GUID: yurKYQ7SYE4s8eZvjaJBQmD-IFGD7Cb9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300101
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,hu-mojha-hyd.qualcomm.com:mid,oss.qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100797-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.ojha@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3369835B8FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sun, Mar 29, 2026 at 01:51:16PM +0300, Dmitry Baryshkov wrote:
> On Thu, Mar 26, 2026 at 12:42:59AM +0530, Mukesh Ojha wrote:
> > DTB PAS context creation should be done only for subsystems that support
> > a DTB firmware binary; otherwise, memory is wasted. Move the context
> > creation to the appropriate location and, while at it, fix the place
> > where the DTB PAS context was being released unconditionally.
> 
> Okay, if it wasn't obvious from the previous comment: split into two
> patches.
> 
> > 
> > Fixes: b13d8baf5601 ("remoteproc: pas: Replace metadata context with PAS context structure")
> 
> Was the issue not present before this commit? Was the metadata correctly
> freed?

Yes, it was present and even after the above commit nothing has changed
as ctx->ptr is still NULL but DTB context memory is only needed for
subsystems which have DTB support.

Let me see if I can split this into two patches.
The first will put the DTB PAS ID check and the later will do the context
allocation movement.

> 
> > Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > ---
> > Changes in v2: https://lore.kernel.org/lkml/sxklpgc2rtr75maiu7lg4iukmaetvjyho7ytyyykmtdu2tov3k@gctoozxj7frl/
> >  - No change.
> > 
> >  drivers/remoteproc/qcom_q6v5_pas.c | 36 +++++++++++++++---------------
> >  1 file changed, 18 insertions(+), 18 deletions(-)
> > 
> > diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
> > index 46204da046fa..3bde37ac510c 100644
> > --- a/drivers/remoteproc/qcom_q6v5_pas.c
> > +++ b/drivers/remoteproc/qcom_q6v5_pas.c
> > @@ -250,7 +250,9 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
> >  	return 0;
> >  
> >  release_dtb_metadata:
> > -	qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> > +	if (pas->dtb_pas_id)
> > +		qcom_scm_pas_metadata_release(pas->dtb_pas_ctx);
> > +
> >  	release_firmware(pas->dtb_firmware);
> >  
> >  	return ret;
> 
> -- 
> With best wishes
> Dmitry

-- 
-Mukesh Ojha

