Return-Path: <linux-arm-msm+bounces-97112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UAEkMK4osmnlIwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:45:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE0E26C644
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 03:45:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 414CD307B206
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 02:44:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB70737DE9F;
	Thu, 12 Mar 2026 02:44:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OM9+LAUp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MUkiRYfC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502DF37DEB1
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773283458; cv=none; b=Dq48d4hsV7XWZ/5iNJIgxDY03/jIM53tqwH6uwkga0ktSnm7ePnEf/Ujl2792RVkX8oihQh0UL59qaXeesv6jAuO5pP26nfX+kTNafEcAfMdAD8S/X3GaZB8uKHBYxb5vxLfgbJqDXFCmmdfDm3fd2cYZvOhDD35rosKHF7THFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773283458; c=relaxed/simple;
	bh=k2UPzwe9/cCI9xk9PLysADcPUL6OFpSHAlR9I7H9gyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQ5MnLc8lBYQj8IttB4DaKPCUEQWkQz3IRxabxZwwrOWKm0nQx15ugNVJb+qWrL0t8ZmtpP4Po+uDrfMzg+EDdpIFbluIAfSpFv1bVOGTGFCF5cdP8KoObOzOZYZmLxYID520B4Igd8bS2oNsx2hiuxEdfa4ksiSej+Ehpcl8LI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OM9+LAUp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MUkiRYfC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62C2brx01740582
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lm/WNFSNmjbImBdI9bDMcuXa
	YszFlMOHh4H3aqOw9SM=; b=OM9+LAUpzYiQAqDM7LaxMPP67OHiCYv0A9JLrFx2
	h9RRXjCkMRqFCTmfRRcI3zAclDZbpkuwA9vlDmm5p3bbRNtg/r4nDroDjdDJ/pKn
	aAdjeVS7bYGRk80CPHMrNHgxWs0/TtrY/No05Qqg6aVUZk0fNpHj4fpGgq65qmtn
	T6MgXNJYaG6fX0mymy9XzrVEg+P1iubFSBOG5r612eD9myj3DTDYuEASv1gG+dLV
	V3QhXK+HjHUBA6c0PJU8ODaSib4dW8Twt4K2KENj0E9mGvJpgj8vIVXZ8vU7Liqk
	j3r71XojOTPm95cYphiOYBTdjswkZ+leFks/2+Y3sXZRMQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdg0g1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 02:44:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cd8b37d4b2so421406285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2026 19:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773283454; x=1773888254; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lm/WNFSNmjbImBdI9bDMcuXaYszFlMOHh4H3aqOw9SM=;
        b=MUkiRYfC7CNg7B9h8OvqFmMBQXiMbENQYkz7xFm1QTXd+XG+0gq0aRwQ6YsPdHpUDz
         BS/f6SMPpQ7KrCpLjIiFDsh0xI4I2qIIwlFz1IhYHGz397aeTelZW/M+rPM+yXw5bHYF
         e7AtjthSFcclpGUH3eAMNAWu4NrEV0ptaM/EMdLbAnwol+d5OCS4LnWowavZPaCDrlZL
         ejRt6/PU6+IjNmkylfLGEyrFC1vTLwCXNmMsG9RH44J4AOdKqrFgJWBBZwtL7X0Y33LW
         OWacowwpmDI/akyjcem2oDgtz1jTWB/xdWgsGXz0nMo8Xs/CyTIpoDBhT/GKOTiDd+75
         oSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773283454; x=1773888254;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lm/WNFSNmjbImBdI9bDMcuXaYszFlMOHh4H3aqOw9SM=;
        b=HfMRYhKK6yyafj2SSSq3CqpJMlr4JeiervbWeKY0vwPen78029sUQvvF83bppdvy5S
         TlKQElbHyqn11BvAAc0ziE6OuK3xu2GGaFTlSApDAm1fMD8wpkBjbSdYwVODkGVwu/Bo
         EjlrU3ZKEj49K5qggDpoOG1TPf0Ggpj3qag0QYuljw9v/g5lpN1c5DJxNaSdOL0m60c/
         uNpzoAdMfjUoiAVS+sToUIpCo8GESWawIVRgu02ovj4b8yPxZk6BkQNNPTndLSGUk+mb
         7Yzm+x59hwYUSu0TzvcvEOjOsVhvLboP4Y4kgw6GEfrUGl6VisVK0zyp/J8rx3C1UBms
         Oyqg==
X-Forwarded-Encrypted: i=1; AJvYcCV1yx0tsz7WRXPcL+mP9QVNO9WnlQyy/7zHytaBo7gsb2LPY8tXD0jxUlVSa8ybOhRwqXNmcTWSYOro+4L9@vger.kernel.org
X-Gm-Message-State: AOJu0Yzjsxgq5apfNIlgmf1q5KV5Op1ho0alaD9x0tV5OXrgAFzKjn7F
	Mmds8RvKK8FDH5qw3sPGxgmAoYUoehdSJjx7SvXNAnH7Av5ljFwbT4GnIZLbvZU21Rwy0Y6avrd
	+FXAa120/OxIwdsnQc/pbeHvig94mupfnfjZkuX3T/Wua+vj+n3gLvPqEB/UlZXLdXcNB
X-Gm-Gg: ATEYQzw2a/v7uAxRwMZKmm6Y9AmTuyHgBXvZNA7Of/lBajfeoZD1Ca4GIbgqyYOm48c
	6nM7IdQFkL0mbPpA4Zu4CGerITvsx6Oq9xjLJA9B3id59tq9FxrL27HIIJ9h90NZHqE3x6xnjRN
	GjJ0KRbCclnzyQksBm+5J2RrV4dpJ/baeMRy4d5yi9j25G2PiaoMUFtVRdfL1Xy1ZSY5l1mAlus
	gZir/r/4huSJXethw/kRqlwKbMrPrPP53LdPE/88y87DOhhvOvXknKbz5oVOLWzDFGyg1JtnwOO
	9Dd5NWF+FOvxQl7iNvTEzq5bNgHR3FMSDrWboV8m5Znoo3LFgW66Hip9z1+McuBb8Ys+0k/YvGn
	YHLLube840CN2mYzDNFwX3ZbN6blUnVyAJfQ13xlQQK8i/VNLXIE/TXEKme2DfBhRLUsE43Wjys
	R19956I4NIQGnZ2XnEfUqPRIkMjt4pYgmEDqE=
X-Received: by 2002:a05:620a:172c:b0:8c5:3574:90a7 with SMTP id af79cd13be357-8cda1ae6410mr588786985a.80.1773283454581;
        Wed, 11 Mar 2026 19:44:14 -0700 (PDT)
X-Received: by 2002:a05:620a:172c:b0:8c5:3574:90a7 with SMTP id af79cd13be357-8cda1ae6410mr588783585a.80.1773283454010;
        Wed, 11 Mar 2026 19:44:14 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a156366606sm710382e87.73.2026.03.11.19.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 19:44:11 -0700 (PDT)
Date: Thu, 12 Mar 2026 04:44:08 +0200
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
Subject: Re: [PATCH 6/7] drm/msm/hdmi_bridge: Simplify register bit updates
Message-ID: <vsypfemefnil7273uty33vinm55b4zdg2woquf4lem3cxzunsh@fvftrtywwjhg>
References: <20260311-drm-msm-hdmi-cleanup-v1-0-c5535245f6de@oss.qualcomm.com>
 <20260311-drm-msm-hdmi-cleanup-v1-6-c5535245f6de@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311-drm-msm-hdmi-cleanup-v1-6-c5535245f6de@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEyMDAyMCBTYWx0ZWRfX+BDUc4+ZwvZZ
 F/hmaxHurQ4hq8AbTi7sj7PgXpda0AcHC7gCtuLFGnUl9zk4j3h4qcGjlntN/dgp+1XOR0YSxFF
 QGYSm/WLm/q7CfRFK/Lq3o23Ce0lhBd/7cr50rvr7xBu/JQVbN9v8BeWcMmRjbLG9ezDZo0gjJF
 e4MYMtjCD6gRrnvPeaprQBWxcvWbpnNCWDi5adRfosurTslR0or71sEabWbNYyWsureKn6mLa/y
 aPsWCzv9/N1PnIWyQyrlX8pbu9f+nCe4Mrevk7XlsxSopBUjW+Yv9WxygGPjfNa8Ntmv/N2LGjo
 UvpS70DfVtVTchwGQzDCkwCDbxPKJnpdITBZAMk877oFr9RTW91JuZgAChRo+snm5kybl8+rF7D
 eaHFnAYarLQw52aSnH3A+Amxd+CjmbCuT3lT7y2XN3PZl7FK6EQoNL88YthR1rWxqd+DWituqCG
 kao4N6FqCl+MbuEGBTg==
X-Proofpoint-GUID: oAWByWTO4cFR3x9YhoPqv_5tooGcWuC8
X-Proofpoint-ORIG-GUID: oAWByWTO4cFR3x9YhoPqv_5tooGcWuC8
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b2287f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=Oj4I6aYq7KJ5v8EhyjEA:9 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-11_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603120020
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97112-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: 4EE0E26C644
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 11, 2026 at 09:17:30PM +0100, Krzysztof Kozlowski wrote:
> Simplify reister updates (read, apply mask, write) with a wrapper to
> make code more obvious and avoid possible errors of reading and writing
> to different registers.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/hdmi/hdmi.h        | 19 +++++++
>  drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 98 ++++++++++++++--------------------
>  2 files changed, 60 insertions(+), 57 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

