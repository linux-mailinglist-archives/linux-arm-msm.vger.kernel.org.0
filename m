Return-Path: <linux-arm-msm+bounces-110146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id q1dGDlVgGGphjggAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:33:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 89D005F4776
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:33:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4623A3113FB9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24AD0176238;
	Thu, 28 May 2026 15:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="l4JSNao4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KrnL+Mqh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42AB26B973
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:28:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779982112; cv=none; b=bvL6j2/nklEpdmKiyNOIxWJ4q5hDQz8JTKYtARNzYNnpefcMOkDXOz7Z2jCUFLjXWrk04j8btIL6vTLsyAh1mWe1r3kq+0f98naa37nw9C6QD1EPml8oJWDd+yR6Zm9PaRw0zBJl6drg08VuysDq56ZnJZRk0qXITxlq1c14BiQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779982112; c=relaxed/simple;
	bh=LJGJCLxl8SQPkMoELpDG1syBBGemlrMrn8LcIsnQ5Q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SARgtMTx0gqbArHMS7Y/pT+avKjq/PQd2MHOoJn3ujQIxSA9pmqw0gTpS4irRjhN6rboeeu7ceN9gO04Dw/M/92fPIfjwm+bTeoETu87LeyplOrEXMZKYLJ2gHvuZNFsgZWCMBG9HWvv6JwNytottN2DybrzvKSjSLI5aVQnnqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=l4JSNao4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KrnL+Mqh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8vO0D3545348
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:28:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DEfw1QU1zLzoap1tp5Jhi4Me
	cLeOegImq4Fgt6OMM+g=; b=l4JSNao4lUbVUP+dYFt7BkWVNPvKuZXtpfl1H1NT
	pgelLvw/FUdvH00tLdnbhSvT2BF8K4jyXn0rVhv/RUYdj2NWUHi1cftmyKsrkDq8
	JkjAJXI8VyYfqKjApuZ/KcFfg0oZPBhf7GJUq35iIsAV7O3xWE6+tJbuYSUmnJjO
	jrnmQPnYT8Hw0Ysaw7vrUEZ3MKWQq6npueW/qLjZYR4+4G4kTRD6806Q/de2f/0e
	inxOCcVHJHUgg+7Ub6TKSnAOKQ8q//wGu46ncq3yCMPUpS9PRwYArg1wpZb9WWLL
	H0NQv5+yIl4Ep75djIG0vgrc+Jm5OQ2V8pXYS/+coWrIXg==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7y3ubxg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:28:31 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6a2b2eedc3eso1215137137.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 08:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779982110; x=1780586910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DEfw1QU1zLzoap1tp5Jhi4MecLeOegImq4Fgt6OMM+g=;
        b=KrnL+Mqh6nErFD8z04x9c2vkFLYstG4mOf3AAE8si8I77PJJaI3ukQcb7arW23Eovr
         S16jJkGuUiL9bVxaqoO2OQalAAWDEBLwAoR52g0j+cwbagZq/ebW6CC1qvFaYXGLVjyh
         iBZB/4K05rx5qgo+qNL5ooH6G6/qiU5xCLqSZmz47/C0I/H4kzT/zP9LXiyJFpsgqtDw
         qf3gaWSFiCIZHqKdHnHMgT6vRAl00cX7KgteLBdlEUvHFj++bcv9JOqB6QAYCYQglcby
         D0W8IpGcfB2ZD8MVpBjCJUdxeIhDRANoSmxPowrTaloqMlneVpZf0pABgRf0HRgO9Ja/
         Z9Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779982110; x=1780586910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DEfw1QU1zLzoap1tp5Jhi4MecLeOegImq4Fgt6OMM+g=;
        b=Y80/GcaAQUEa67ld8AXeTo6jUlX3XO5QB9tF4qO0lgMRyL2FGfizvQvNCNvD/olRrh
         mQTvgvepBWeQdzOFPgo1PzkbLvn/l9qoi4Ub5mT76gX+NVXuttWg88oXGf9HwkZg2g6I
         t4b/ndktAIcrr2Og4A3o26I1z+R6lBPlHM8hUMx/4BkOYB3ixBjxFjJ7wwfVzNJhhvGZ
         8VdWRapDUvpfbT2Fsmlt31MLh8WMuNHrzyph1iUx3q/6NmgecDq87ZcUSlABad6qDvHR
         5/dXbrapfFcoWQUk2dij4183E4taVWQr0blgHa4coWjVX9NZXfVmJlHfgYR/PExx7LRo
         OjKA==
X-Forwarded-Encrypted: i=1; AFNElJ/eYTJWmXFUuqarkah/NBDxV0MR7fHN+dqDRsC00eE66I86l1IGTnFmzyk77XD/yojcQD2nlfY7cGG1t+AQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzEE5v3hn0U6k64tZCu0YkB2fxT/QTQqLmEWkpjeMgu32+lFDqH
	2zPjfZ25KWW9HjnQeoURELzHLdkE3ZfeM7Wchsk/ajLNC42e61uVM2z+tx3bNPJaUlILPTzdNv3
	9E2pshbwkM/cve3BBnvfEJt96znfB36qFjaB43TQ5fE7wRZj38CgPxGNZkQF/MUpDWBqM
X-Gm-Gg: Acq92OH37zHl3aGbpLsURM6DtQXCEoSWNQe38O50VzS8FhWq74mkoEuc8xNc/igL/+z
	ByQ2lCqPxJP5DAN+BIdBzskpB2O8R+8OLx80ieoPdCfh5xaSkhFq/7VonEOLJ9TO3l1CaHoUjAf
	LxsR5xnmE1epn53PhIUjJ8WsVBisXeYBW+a15wHgfPx51FkTaUrYz/nG0Z/z1de99VaLJBFEXhU
	b1u4MOwX845TqKqO00UtzDvY3pSsTwojZdHl32gAhsDBjxHI+4qPd1t/Rvcx+yWQHEZWQ06ifrY
	Pyh3Eviucg2bhuRHgHUh5gPaR9jUE03lE/1dEiKm8/1gHGfZ4sN6NYenSmGaI73ZArOrwW/uKGX
	umHL5RDG8QVBig6yOc7iw7O99OCj14U3u7QhNCk83bE1EFIlwOpNwHESyfOLaydXfsSJQYwBjzn
	1dUy4iG44NHlzcsPqRu6BpIWPzCJ8tK9fkoZRDFhsxzCfUrA==
X-Received: by 2002:a05:6102:5813:b0:632:c69c:fbea with SMTP id ada2fe7eead31-67c80d6682dmr11492408137.19.1779982110121;
        Thu, 28 May 2026 08:28:30 -0700 (PDT)
X-Received: by 2002:a05:6102:5813:b0:632:c69c:fbea with SMTP id ada2fe7eead31-67c80d6682dmr11492394137.19.1779982109692;
        Thu, 28 May 2026 08:28:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4aaa8f1esm1359828e87.26.2026.05.28.08.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:28:28 -0700 (PDT)
Date: Thu, 28 May 2026 18:28:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 15/15] drm/msm/dp: pass panel to display
 enable/disable helpers
Message-ID: <y324daiszlubxda7u3sob424qkm2ggtcijymk722gktnxk4jzz@qysobwgu7523>
References: <20260528-dp_mstclean-v5-0-a9221c1f1f3b@oss.qualcomm.com>
 <20260528-dp_mstclean-v5-15-a9221c1f1f3b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260528-dp_mstclean-v5-15-a9221c1f1f3b@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: eoaEmAM9JaMi9QQqtxhbn7nCQGharcVy
X-Authority-Analysis: v=2.4 cv=JMYLdcKb c=1 sm=1 tr=0 ts=6a185f1f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=1hnY2tqY8zy_tLQCQi4A:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: eoaEmAM9JaMi9QQqtxhbn7nCQGharcVy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE1NiBTYWx0ZWRfX3Rr+PntgeGol
 RMhIYjct/FtVncHdsD3kmf+T8s5FBpGl/5Z/GxpJEAjB6a6U/aIVrOZogaBeA8uC6YmnVhj0KEy
 zE5u1AjgnzGYRBQBP8CTLeVbbRnyLlX5rSi9xHsx/AYhI84pdS6RKKj5zKwDFw4iq64wjtNfW7E
 JvVRvvChH0fWsZTszIbruLq3pFFptqnAuK8oRyehlcBIYmcNGK0hh8wt/0GnLDtoDZDDNek5Apq
 iq1zSsgdDpRavWFC28RYA8dN1tX7qsrS2p1uhQ8aMieBBlv/Act1dw98bUWha60BJFxyNAzNXRX
 C67L9a9bGyYZ+wTqqczaa7k5rOtAqHZbEfpmDbUhf1hgsrco25s3+Fjv50Bf0EBRrCyOosf70Kh
 T8Uus3I/+ZZxvOUxAMvd+4XXy0YTMivAJ35bz8/ORVcJ9bosEyIS1fm8Dp1vJn3AXcp1HfYzYEP
 lb1U3wZssCh9lzIvF2Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280156
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110146-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
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
X-Rspamd-Queue-Id: 89D005F4776
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 06:40:36PM +0800, Yongxing Mou wrote:
> Pass struct msm_dp_panel to the display enable/disable helpers to make
> them easier to reuse for MST stream handling.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

