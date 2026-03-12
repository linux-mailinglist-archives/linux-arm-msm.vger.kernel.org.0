Return-Path: <linux-arm-msm+bounces-97111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WGYYLpYosmlFJQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97111-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:44:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C6E26C634
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:44:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED9013061AEC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 02:44:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9928F2C0274;
	Thu, 12 Mar 2026 02:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iUveAogS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="adnVkaMH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4D637CD47
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773283444; cv=none; b=WtgHy8r7HXpfT5zSKuTcfV4kb/FHUDY9CtIB94ja9rDXdOR7EXpyhD38PVJpQ2csBedVJDxYENwM47o/HhFDEOEo6suJoW7HlWUKC6H+V6vLu//kyzdE4rttmULLf3WCtvyLa7AqBUERn6twhTV+AKfTsO1OZXTfw8Kt9jamjC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773283444; c=relaxed/simple;
	bh=DLcK8BXUXIwo56cMvZghLNmtsQ3ojcwqmiHBbiMVZk4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BdEloCOkYVuOfXp33KtXqcdhmbEF3E8VM4dP3aOC8D0oXX8/WDhAsN3NdrPjCRsobWPylC2CD/d6v3Z5cbBv/SyojxAYB3503+KDyKAJbJ0eXr70OMVkzKq/GT4kAgsOoAL9rqLwocTif1hjufSfepBMfOTElcUKa0uXZL0l7sE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iUveAogS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=adnVkaMH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62BMNC6q1756014
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n6aodtp3VLB5B14pWHnRzgph
	rscPbL0X2BOxybOmCBI=; b=iUveAogSInhK26wVQujrQITb8Vlez7ptTQHM7YBf
	66i9sW+pPpmeFzR45/3GxwXe1p1N+cJtlu7kh3O9QI4YN6cDbtNEYp6AXKl4V2mI
	GVcpAWSt+DzKx5QL1YEvbUhckXRYVMKd99rD5zEH8QUesf7v5dFQaHQgmyQKUBqa
	aRIVPSQiH1ly4EGV3RLtbfVB6KsSJhXWvzj5m9mQ+Xgirnu7Cegof7ro4HdTJxZh
	ozElbEUolyr3Bh+gFE8R8dB74EqQCPQ16a1wA97AdPH3RYuxBEdLflaj3d4Eerii
	pcMaBLAxQFV7aJe3H98Q7IJF8eL3UUMwBnXkxq3cKMsS7Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh53gn58-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:44:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd827a356aso359713485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 19:44:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773283441; x=1773888241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n6aodtp3VLB5B14pWHnRzgphrscPbL0X2BOxybOmCBI=;
        b=adnVkaMH68th0emjKdZvadaCHBvXTM+KYhIK5MGYWuspAQplYi7GBuEswmzT5xtjJ3
         fYk1XNzvXr/OYPiSo69iw3Kld9IJvyfNTX+an+wMwMUDuv/y7x1g5xPNyzoYE3VkzR+R
         vI7OGoLIEMNT7/hvfU2vfYRXyPrAq55107P54FslC4FEi0xv5SvGWcETlry2RePJ8++r
         4T4X5nX4mxfwAgrHKkQ8KQq7FSQFdTPjwetfINjNPPVuoEOl9m6l7B3NCWRfUFOnrJmU
         TwtzHuE0okkGu+2ZBrKzbmSvJ/Y/rpjqXDYHiVs/6qAEG7usVet66ZjRPZ295rDG/7CG
         pZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773283441; x=1773888241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n6aodtp3VLB5B14pWHnRzgphrscPbL0X2BOxybOmCBI=;
        b=oihkvwPrPUxhLlJFeNEoBrVoWOTz/sMGRJ6Eag0oy95rl2ovT24tsJeEluWr/gP6tw
         ZPNbV3u5DGspyYRPlrRbZDdbZ0a692UUqc4+qs84ynI3EeKS1zSTWC7srQfu+mCrnjiX
         bUJiolh2To3TS70327sgs62cVUgMySMFXhEZ25zpYXYNxgOYNivqxMAex8z40aRg6UqV
         PZI0SqzuLiNwqnQzGww/ltKDfgE8gbilCn7vvVWgNxgRfcT7KDKK0kgzAFrNXpV8jaPN
         XZak2IyYXc+jNwawgTN7iy7UN7Wzirwdm5V6hsOSPyjriDU1XOYcUukEqUg3b8XoK/WJ
         pu3g==
X-Forwarded-Encrypted: i=1; AJvYcCU4hULN8H/9MPLWdpTG02ed4uFFRCFJyYqOHVq6DjZVwNBi37itcsMfYy2SNHasNVKZrOiM8KZ6nJlrwBqj@vger.kernel.org
X-Gm-Message-State: AOJu0Yxcv5ZCm2V0VrROr3jjTUtlHfPx6UVD92iUTrAajLPL92prJvwM
	x+TUcNA0r4sMgk7JCHC9GYN8WUqWi3KG70Tx92x1yRXRgqzKscpVLh6qQtqdd+j/EmBrPHB6Ljs
	Xub5O5/Wl7KDnLYEb1OYbFD0OztToSVGM167w8wyqsptAsA4W415okisIvCWSn4NQTZ0J
X-Gm-Gg: ATEYQzwodYQM9BbZJlKJ1R6ifFktGa9YPYwVbrlVaOOQC5f/jLAS6BWOCfDB6PvX4Wu
	4/Z4tmJ5jBnAtnd+oRO9PQzdndxHWzJqJ8ZOYTjdP4eApgQ/2Gf+ECBJw/QmRcwmfU3b9/uM+wj
	on3SYxHiFnsX0AKq0PZLn0pYGsUksfghlf9Jwr6yZv+by+EY7m+HgwQQljx4tnAuICzz++QIQQQ
	P78fGfko+9CCiHeC54sImpByiWFwWzz8j59gdt5MG8b14EliFnr6XqdZDwp7oRzNBOKjGjaZJxV
	uJH6ynHNJIYVOY/oHRFChhz/qVJuDSI9lruCWfGVThpBZqmSoZZemUXfeOVq/CW5z2RtIY9LUkp
	jqR2jaawxu1grcRlnHYlZIRJ9znha0hAo39qiowS5J+40swROjcupHvztwqZwuUtzhH+xTX71WG
	FoGtSSeHC7tRFfF5Ialt0Q/cX2dTyssoJZHdU=
X-Received: by 2002:a05:620a:172c:b0:8cd:92e7:7192 with SMTP id af79cd13be357-8cda1ae6df8mr601609585a.71.1773283441532;
        Wed, 11 Mar 2026 19:44:01 -0700 (PDT)
X-Received: by 2002:a05:620a:172c:b0:8cd:92e7:7192 with SMTP id af79cd13be357-8cda1ae6df8mr601608485a.71.1773283441145;
        Wed, 11 Mar 2026 19:44:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a15602e713sm684227e87.32.2026.03.11.19.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 19:43:58 -0700 (PDT)
Date: Thu, 12 Mar 2026 04:43:57 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] drm/msm/hdmi_hdcp: Simplify register bit updates
Message-ID: <kzgyumanuqpbbduh2fuz6rgzyc3dxvnnv7gymwkwcbhg3jrbws@w6xfwo7riwyq>
References: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
 <20260311-drm-msm-hdmi-cleanup-v1-7-c5535245f6de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-drm-msm-hdmi-cleanup-v1-7-c5535245f6de@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=ZN/aWH7b c=1 sm=1 tr=0 ts=69b22872 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=Oj4I6aYq7KJ5v8EhyjEA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAyMCBTYWx0ZWRfX6+VBFXRDqQEM
 SrZpqf7eyosHQVgQREkXNjetlMAeXTzmd9LgHKgnXCR5B615swsm2ovd759FpEni8tdJPKd8Lqu
 HcKFvLdwUyIpDQY/eU/qgeV0e6Ra7NgzvG+4gwTttzJ9d7MDABiTr5eFcZcG28om2UdATGaazWT
 AMDEY3azSd5TiRGe8Gt2K7n1FzSC3UiL4eFrsJh4bQBvP8ap4klUHKM2rX+8rvNylV9HaXbNIbM
 Hs95npjggXKwvnfdy9uEhwHN0UCjrLcO9c+1MhvPrwJeA78UDg4cWvi+rl0RODu3fAB9XKfnBjf
 BCyNjPLGUYSh1l5hD11Eh0wKa0o35XZlxuJPnYE+fpXHVQ6gy6TlDlj5D9WZ6/O5ysZN8G2Php4
 RW+dp05XBfTM3Mh3Ejlpa0coQNRm+Ax19i1GgcpGChsPoRtfHD2P1MnYPhsXEd4uJVktDztCflZ
 PUKPpJeveEFplbeDQKg==
X-Proofpoint-GUID: SLOjr3PmvbZ2NhIIVJCvXiA5Okd3uAF6
X-Proofpoint-ORIG-GUID: SLOjr3PmvbZ2NhIIVJCvXiA5Okd3uAF6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603120020
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97111-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 28C6E26C634
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 09:17:31PM +0100, Krzysztof Kozlowski wrote:
> Simplify reister updates (read, apply mask, write) with a wrapper to
> make code more obvious and avoid possible errors of reading and writing
> to different registers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi_hdcp.c | 85 ++++++++++++------------------------
>  1 file changed, 28 insertions(+), 57 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

