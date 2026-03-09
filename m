Return-Path: <linux-arm-msm+bounces-96231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eIdlGMusrmntHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96231-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:19:39 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 05FA9237C72
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 12:19:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1A4E9301BA91
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 11:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C27FE39A05F;
	Mon,  9 Mar 2026 11:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IpI6JDD0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iCwej5Uz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9FBD37BE68
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Mar 2026 11:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773055176; cv=none; b=OIuncTA24kAMljHTxWfA0BAfUHKl6ezYZ+Wl+vHkgMbl7vihCgBgwdM4VDR7+72YRZSm5xRCKeapAg9wPQ0QnYgLgbz1SjhkD0B7oVHVakcs4g/bCj6yBLxv2VORBdiau9rTPLa8VveSaUm5f+uh6UMR5joZf6RufSC43UxzngA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773055176; c=relaxed/simple;
	bh=AejVh39OfouTSd2iF1xalh+o1wTJiUiMTTrorUnm0v4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mDHsAx7PU2pGqgx2YdaaPkuA4+sGrYkri3n7VMivoUwmHilWPuGAexUWTN8MlJ2mVUCbQtxTCzlCJjRM7P94u6MJafanr65uUA+sLg5sK7GacuaOhWqdzZJ+ja0Ch4V1ni+pszvXE+gyML70K4gGbKXJ1KIVDewLeWZl1qAIUc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IpI6JDD0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iCwej5Uz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629AWTXi255307
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Mar 2026 11:19:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aBuXrT3z0syHkRjP3iylAVgo
	7EGbnv7gdiOgzGuaCiU=; b=IpI6JDD0HWnBmmlj0OFHN8/gFzwsaR6GGIPaSRWZ
	iFf/DH7u4vd7h1Ql6MNsSNVW9oPR5VFW70oJAOTynQa/kotTy97vXA0zLfU6dzvA
	uNntI343AApVrwilF4Ccnldt+LK7L50ujgLUmwLSHh8Zw6kc69JCAMGvA05QoRPE
	9O4dpQc5tRl5IG1keLHk0u4cwJIhRoOu4w361lkUDa5Q2QOyO9hNNQvNH43cn8he
	7kk5Yw7SulMX0XAPaDCMv1J1DuARQsDGemPZ4pfuNOCdlEnEvGJDhSE+ExzyMWep
	mCjRxW8ZWiSYWgw7VY+HBiZ9DBPabub841Zlzj4UETzIkA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4crda9cyjv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 11:19:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ae49120e74so76076155ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2026 04:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773055174; x=1773659974; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aBuXrT3z0syHkRjP3iylAVgo7EGbnv7gdiOgzGuaCiU=;
        b=iCwej5Uzc2W4ofJrtmyHnVECx2FD7lPG6JGRf7wfG0dhkC5dV+Z2Yi5KObS1WaBznz
         TIR0hH1nH86TzI+mtyU6g2MWn25cQDlYrHz5fT0hLcA1e6P3fbPAu0QW9G+D6XE+In9E
         caOr9Zlhv1894g5WJElGyv1rHAKyG06NZrUSIoDgLK9+j4hYpmaZnT3QuKNf7lu9kb/8
         rW8rAD9v9qZ+6ouDQEFLAtinT65oha7X1XIOgMW5Br/rT+G21o3aF1EViUo4Yuu/jF3B
         3wFF0anzf38whn0dWUjsTIWQRv9Bno4xGuZZ2iXUV8TWZTegFWfeJu5y9DcROpV6G5tK
         Fu0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773055174; x=1773659974;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aBuXrT3z0syHkRjP3iylAVgo7EGbnv7gdiOgzGuaCiU=;
        b=ljecSoWC8brtr72pBEbXwPI8vk7bFsJwsGEXT35mNK3rg6CY3hiqdTvT19x8RjoMWv
         FAnwBdRVPPTpa8RPhrdiC92Yb/nnhkXhxsEX0ekc5L5dzgyucKj4fBvMhKSXuD/rXEd2
         hNodTx3yTwJBgtuA8YvlrwCozorS8pa48DYd6+3CL51ncFCTNiqoSgELD1VQvIZdSzxy
         ghBkF2os8/YOTwl1QBzfgmAorwpmLSpzRJRQAj1CjbWo5zajWXbXmM0RBlGlncmF+N+/
         vNg9fdvVNbS9/+/uPfViNmTHvMbpfaEcLLOOUKWboWH5JkNt7iDX3izAUj2ExhOyoJpG
         OcXA==
X-Forwarded-Encrypted: i=1; AJvYcCX8wvbQjcOIdNtO2eis8U5R/xdbjg6qI5i05Kt2jszbVIqi0U7ShgpNEYKEE5e6Cx3/mLkHr0YXx97vJc2N@vger.kernel.org
X-Gm-Message-State: AOJu0YxSAaj0mCaG2fOsOcnrk9ss8X2OpISLbl2RFHM0mxKypF1Y934x
	4RUQoeLGphgZSSBbcA9kzc73sHbtWr9SuMNlMK1/aE2piWKckASUmsS0+Dd7dfzCxBiYF6Wv108
	AFeTCqlncgsSVf7tM3LXpjiHcmWmsU1ufWsdFeySvECZe85BVZ37XszhZzX72thrmJ9VN
X-Gm-Gg: ATEYQzx6wYVVD1WJ1fP9sBDHaHN3qf+NJk80e0Yl+4k5ukARW3JQXW9IcTeuz4fyFhu
	LFGoPrFwtgz0XothwYC+kngpFbgshyYYw4GDZSLDMA1/iOjqYNIkuK2uWqFq58VMOPLScpkbIAC
	fhAiczRKsKTRo0kdTsQ7NNfhKHqs65C4mxTZcwqxtKqvkgXUOnTF3ZHTmKdl93/eRwDmAXB485a
	pjicCkzodYBXnZlm+G0T3lYegCeLcvJ4Zr9cxUsGN6/+ogJxX2/qIKtmI7UqIc/78tK8ShJdsQr
	t7ZAoYsK/5Jxx71qYNwqt8Sifpu33n+tEF+a3zwGTxruhmsGAqj//hWL/rCr5SRLk+Fu7/mDAWH
	6XyyrRDOWIT9id6htpWCd9RwWE7nqxRDlUcc=
X-Received: by 2002:a17:902:f64e:b0:2ae:5fc0:308f with SMTP id d9443c01a7336-2ae825056cemr110474445ad.41.1773055174156;
        Mon, 09 Mar 2026 04:19:34 -0700 (PDT)
X-Received: by 2002:a17:902:f64e:b0:2ae:5fc0:308f with SMTP id d9443c01a7336-2ae825056cemr110474115ad.41.1773055173696;
        Mon, 09 Mar 2026 04:19:33 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae840b2e9dsm150127135ad.85.2026.03.09.04.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:19:33 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:49:23 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        Jan Petrous <jan.petrous@oss.nxp.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
        Samuel Holland <samuel@sholland.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH net-next v2 4/7] net: stmmac: use u8 for ?x_queues_to_use
 and number_?x_queues
Message-ID: <aa6su45ASA4jR2VJ@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX5K-0000000CVsE-0J0Y@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX5K-0000000CVsE-0J0Y@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwNCBTYWx0ZWRfX6aDKGXGI4OMN
 S3cyuRhMlUBXmE5h1ShS+9xyR58w6DYKO3z4YoEBUe+wNSkj1km7Miw2SdA6E8WURMh7DW/htnN
 zzLYRMs9gvMOVLNb+2VzMTBmcmOeGgLX/NTfMe3XkFLxN/PKmxCKCsUW1dEahZ7MTPlCqMakkd2
 lGZOVvZhYVzskN1TYZItSHmATr4N9SWGb/jiAedewJoP+E4Gi+2LLk1SyULJosm3Xc04bVw/PMU
 BUDD738qfkrRCj89Y4WdAFXay104u+XIT0GjVcVskhmW5WEc29AuQSi0pWVQuU3r1HwJRNdzHhL
 kJT846ycSQwefSB4Fo+ZyHfov4VFAS0qHcJfMIYplP6IIaa6qa2eXvPxao6WLNKxB18jHoRHo3z
 9hX8cR9ToMzeKT75PZsRu/s7hmqPi1h2F8NH6KD6N6LNOScpg1jyIJyBlPNpoEycASKZc40RBEK
 Yy+XFcKfhagwnoC0IXw==
X-Proofpoint-ORIG-GUID: hJvWhyB_jOAhav50ay5yiQbXjRRtP4qP
X-Authority-Analysis: v=2.4 cv=QZtrf8bv c=1 sm=1 tr=0 ts=69aeacc6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=2l7Dc_Zt4Q8SQ2GGjncA:9 a=CjuIK1q_8ugA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: hJvWhyB_jOAhav50ay5yiQbXjRRtP4qP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090104
X-Rspamd-Queue-Id: 05FA9237C72
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96231-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mohd.anwar@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,kernel,netdev];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 09:39:34AM +0000, Russell King (Oracle) wrote:
> The maximum number of queues is a compile time constant of only eight.
> This makes using a 32-bit quantity wastefulf. Instead, use u8 for
> these and their associated variables.
> 
> When reading the DT properties, saturdate at U8_MAX. Provided the core
Nit: saturate?

	Ayaan

