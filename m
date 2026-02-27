Return-Path: <linux-arm-msm+bounces-94371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wHPSDfcXoWk9qQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94371-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 05:05:11 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1BAD1B27AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 05:05:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6F4DB3119330
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Feb 2026 04:05:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E70A9343201;
	Fri, 27 Feb 2026 04:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aCyPnSVn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ich59cOX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7846342534
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772165098; cv=none; b=POOWR7+mO4ll9H3XSuwYoyVzv54Jkn1IDzCqQVXC0ugMlb7ZezmreiOFBv9vVFUaErQsDaoUaCBLZSwhB7TkVYYw2o9Lk/C4CHhdcJ1ijWqIpgn97IkuwqkVRyjwTQftsr9WqosAhc15RsWMN5sJ+5frXC35qaEdTPMv3IfPB1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772165098; c=relaxed/simple;
	bh=x33/zI55NqCp2SIQHv3OZD0bGg+unPQjprEqvogQEio=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mot6MAvBvYQzIr4TAU0O87lMWrzIEVGBjJdZtdUtdmrpdqPbJOiQC2srchnbf+B7TBwzNeWM1P/el2Qjuhn3Z5lgY9Nuh0WdGUwP9XidwqQhX3BklBcgErU6V1zfOgzP5IFXnTZjqR1dL55mXaj0JoGy378Zg7wj7Q/EAZZp7Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aCyPnSVn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ich59cOX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R2Jvas2982225
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:04:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vF5ebjzI3ltfd+GlOyn/ovrS
	76xGTYky2kSG6LrMPmA=; b=aCyPnSVnbdhJDfviUFTEKxxxmu00GUB5itvkfR4+
	QRY9/lSKG9OeLJPde/Ljx9sbBDG38u5RZwvF4RWnGZdVTkiNR/5zSqs+WwPpp1Zm
	9U+MXbsJOm+enczWLMSdMtgYrTuerJkhfBdpaHC+zb8fLtmqQk6cKEv03r4vMntf
	wVRRgGjEEL6hYbfJs3U81wWsYQqewwZ6vLp5hDA2cqFm/LJ3eCvfpvmk1CXbwVTn
	mgEPSjAtWhmmPDYYKC79vDXik+ghFc4yUT09YVWcy5eemfK1McIsDYCBE0gd2AS4
	hMNFIUJdgRb3mOSxJnshiT45/qUYPGOkggCw+urcrn98Og==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjk2v3kdd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Feb 2026 04:04:56 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ab7f67fso1769315985a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Feb 2026 20:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772165095; x=1772769895; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vF5ebjzI3ltfd+GlOyn/ovrS76xGTYky2kSG6LrMPmA=;
        b=Ich59cOX/jtul/dtXsRbLaaMLlEFGYVyR7ATSHhji/3Pmvagu4y5oFhwpjsDHEp1a2
         d3LK2Qu2AYaBRns0xTlQ2dHvPdDHoylyAWfmBYGUKJoUDihbpOyx/sNQYWAMNF90KtPN
         az1xXMTOAZVtM1+mbPfhF/LxiTlhW08Boen1kwQiyhJbxWKm1qi+1OYTEtyTNe8MVVrW
         x4FwYfIJK7n1Wgi40cruOyyzibLlopgwGdY+z0y2tAW1hWT1CLdsDOAdql3CUYcTY8cj
         lgtA3PGcL97n9arYclknzuJg3MU9ogimqTnW1wISFxCbakdOAvtdqktc5onzLBhqKeZy
         Kfng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772165095; x=1772769895;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vF5ebjzI3ltfd+GlOyn/ovrS76xGTYky2kSG6LrMPmA=;
        b=PANweZCCEAgrlrwcmCD6fset2exOwa2OW6aSpWPzg2nocHDPqEDNEp9uLJKq0N7Z4/
         Z4LqMkM+FLQYkvsU/fX5AHzcDij8gd9WQNBOAbDaO1gKUlAU07bcwBOTCR1AKnbp3Q/Y
         IInKv6Mc6X3m51r/2kNGfikneNGGTvziGezYb++WQLRLjkUDohuf4Y3Nd5pSbIe4lN4j
         JYwaL/xy1TdfQY1h6VXToePxsVDaSEx5j3VPpivc4ds86wHXbKDoL3vgS4W1UQ6GWJ3d
         BHoXVa3WRbDCqjSHOeb/Ob2Pt3i+5ZocpYTc3iJXypyQdMbgqKqVf3Puw0k5zble/xUz
         L9XQ==
X-Forwarded-Encrypted: i=1; AJvYcCXS6hgj8QY1UuDAcXiOf1oe5r3nEBEO93WajyIHY/sCuAZ9H2nUi9JFJDDy3whEFbImYzTjqBN/MPSyMyF+@vger.kernel.org
X-Gm-Message-State: AOJu0YwbFJmW64VfDKl4MVYiYmM65k+n5sHGj6S6Kh+uKtNTdMNAgZx2
	TA3iMnR3Je26cCs/a6+lmsfUBFtHdUZWelPu7Deh1NiFgfDv9U0L8M09X/9ZPtnTvVDPzbtw/pC
	P8cUsBMT72s0WWM1t0fNtArLcIoSH4p0RiZKF5x7an5g4icWuF++rJX+bPSiAwpRPBzEU
X-Gm-Gg: ATEYQzyng4AaU8/PQ4iY95iHkFF9zPWv/NxWneNqhvpYgTaqF3FCoboVQXOJDWvjM+V
	vnKgJ8dWSwfwN+/C4ZoFcFGla0liehWV2lXCxMpy6Qf5wHJck/9Dbo8O7rnzhViC2z6aZX79/Fo
	nzN1KTxSOBRi9IXS7UnGYAey7bnWipsUrMsrQnU1HyPpjp1BRXQVejczMbRvciI7nNu5J2k6FQD
	UOJRXdzKoFd7n9RFIST0Gdvinu3uAEyHhU8YgUHk4+W+PJW0NTgbgjM2CPJJ7IexFBE/cWliiKr
	UncsB08AorNNkbXImqQrEfbuGtrQ2tCycHdFFZV52O8kV2647jPactKH6KAyzHwtsaeYD2jJMzv
	Xh6IzYpeshaddZlIDd/Vx2SFTBtuCBYntkuprYpwUz1TeXoT7i5LtqLu0AXnS3BCie0FvdhCXyG
	SkiP6q8dXWemrGugQHXlUqpU62Gh5Pus4tKVA=
X-Received: by 2002:a05:620a:3949:b0:8cb:2c2f:90e with SMTP id af79cd13be357-8cbc8e4fc12mr181458885a.39.1772165095143;
        Thu, 26 Feb 2026 20:04:55 -0800 (PST)
X-Received: by 2002:a05:620a:3949:b0:8cb:2c2f:90e with SMTP id af79cd13be357-8cbc8e4fc12mr181455785a.39.1772165094646;
        Thu, 26 Feb 2026 20:04:54 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389f2f626b3sm12487591fa.10.2026.02.26.20.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 20:04:53 -0800 (PST)
Date: Fri, 27 Feb 2026 06:04:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mark Brown <broonie@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] drm/msm/dsi/phy: fix hardware revision
Message-ID: <vtvn377utuwptjbfuqvjypxzltblh5c7dyocwjr7jqyemgzrwh@ei4cx6q6x57l>
References: <20260226122958.22555-1-mitltlatltl@gmail.com>
 <20260226122958.22555-2-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226122958.22555-2-mitltlatltl@gmail.com>
X-Proofpoint-ORIG-GUID: BdpbTyBnh0JuwPnS08JyQr9fYILtn4-g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDAyOCBTYWx0ZWRfX/bC34XZ+8sN9
 mgOAAEO/HEVU+jTDyXJe1TegHEkmDwMUMHPaXAs/pp9He0ISj/8q4VnNPBRwviYy7MX/OzDyIDJ
 4KYcZqQp4UBUOFbLOq+MT/MmrxhcbZQTe7XwHOgTUZbu4ciyC9nC0buzes+loNeWpMNmFtYeoD7
 P6NSg78MCAPrnsq8PxcOEFVwjSaq5jFCSrtTHXiVqrAWPNR+/iRC6N1NgTO6YY+XPX+i55MEKX6
 4jC9EtMW+G3EBZ39sG/b7KZkGeDXc124UJLeLF4FdQqjuXLzRy3kLAoRvUtdUnbrR2WKZEZeJ4L
 OYVTcrArkQirlDLxS7WJUvZCyqxVKwAVRgd31XJTwA9+4EJ4VLKLVe+/8XjK1Rn5odiZFwjLOBJ
 p6cWEuozh9eG6E5pJIMab6UDORn5Ra4QCxqUgKLynHs5/05vWYPMaUVgO9nC1eOWW4qCPH18AeF
 1KerCVqyoBNE4PbFtJQ==
X-Authority-Analysis: v=2.4 cv=PO8COPqC c=1 sm=1 tr=0 ts=69a117e8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=pGLkceISAAAA:8 a=IGH_EllJKgn0EH2UewEA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: BdpbTyBnh0JuwPnS08JyQr9fYILtn4-g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-26_04,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270028
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94371-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A1BAD1B27AC
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 08:29:57PM +0800, Pengyu Luo wrote:
> The hardware revision for TSMC 3nm-based Qualcomm SOCs should be 7.2,
> this can be confirmed from REG_DSI_7nm_PHY_CMN_REVISION_ID0, the value
> is 0x27, which means hardware revision is 7.2
> 
> No functional change.
> 
> Fixes: 1337d7ebfb6d ("drm/msm/dsi/phy: Add support for SM8750")
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

