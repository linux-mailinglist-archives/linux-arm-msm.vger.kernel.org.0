Return-Path: <linux-arm-msm+bounces-104155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH8YAlH56GkgSQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104155-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 18:37:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F174448C38
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 18:37:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1237F30210EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 16:31:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82ED337CD28;
	Wed, 22 Apr 2026 16:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="on1NTZ/f";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TDhGsUNa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC8D3563FA
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 16:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776875466; cv=none; b=LwUdljM4y6c79aHDPTs0fHFfTC4uWAeV8cZuaxrwnIhnvMPj3pullthBR0/5ITERTyByCoew5sukduN0A9ky5TY4zXv/2EJwrhcoOcvB+DLSeg5zJjpPZtzoY4Tr7kvukii8KkclIWfrChQgh9btLWJPc62PXfs64YCKsVNff/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776875466; c=relaxed/simple;
	bh=60UwWxCxd3MX3ib1gYypLUxc6SYqPReA5goPR8mB+Es=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GFc2feYo9vyrL1FTAroKBM/2JkoxwgwLIaLMK1zxxceQMzxUizpQJjPiFsAvjQOEgC9ZgAwmOCT9RRH0HZgblpdBGYeJcI8UTWECCoeDVUsFY8NnpaCrrdz6HMVW5GYqR8IbnNfJ16VrR+Nm7ZRGHAXdtls4zstmAsB2mity0Ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=on1NTZ/f; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TDhGsUNa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG6bO7872762
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 16:31:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=apnzn6JgRyH50tEQtI3PxWOR
	7wNRn6iGgIKeVOIJqfs=; b=on1NTZ/fyF0VjnKFaULTCvn0c06Gm/jPSQrwAYc8
	pMRPAksnh+q2debmwFnmMVsWdmrlLWpsM4cBT+ag8AXZ2Y2gCj8Gr6LtdhkVTXvA
	Nnn3BtwO3DSHQqvBf3jETlRJMoohGyu0gxKLbppLks/mNuc2ehOlmKZoawXpq3YI
	yS29+py1wANskrsZ0vvD2oEvc4+oYLeSiBH4jjbkkwhTnKO4mPBySlMu7cyD5ZaD
	5DGO5Jg1ihp7eTnSrlfCY+L7arNlq7wscWVUwFbpoYYq4xbr1K5NvXXkhplcrxMo
	dXxoVllWeYVKALU7jJnWPmZWeKfIjo6SdwQk8wIFgKhQLQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1jh02uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 16:31:03 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-46ebf50edc8so7268901b6e.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 09:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776875463; x=1777480263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=apnzn6JgRyH50tEQtI3PxWOR7wNRn6iGgIKeVOIJqfs=;
        b=TDhGsUNaTAm/NRaMc7P7c+dseursbqqQ3pT3+6Od/tHDTEDHnSjwap9iCnNA7RZZ+V
         Refip6ZBgW2pZYkkjnAc/+M0U6IvgDhXR0K25KoZzh3O2UEpqW4pkOMRDxTsC3u5tLUH
         QA0KWse7eI1stJVdD2LmpuG1L9f3E+06eNbXHiph663epznfvxvP0cbGazlCDHjLiWMY
         dGBfdX2TNFCB9qg4HZl/5jGS6QSjaIXlx2xsT6vFSvtxOHHquTd2B+wl0k1bF3Zfca9M
         ye4RwC1kRx8w5CUwDsVQ6WVnukVnLN2zJAAKd5PSWErSOT4RcTjmbhl/I/I1+uilrdIb
         co4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776875463; x=1777480263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=apnzn6JgRyH50tEQtI3PxWOR7wNRn6iGgIKeVOIJqfs=;
        b=mDjMGSv/rrQUV/GzE41k1Nuo+jW3UpUqNKajBkypLDE8Ped+XZbQGULciePgxnKSFe
         meoECey+T0tV6RIuIv7RlRTYavK+2iIs/+ZvNVwj/GLR9ToGAQ4cF9gBNZfHsw+ilksZ
         JoIjHRyUR3AqJp+SdVLKFEYbFjf84+0LZBUF2Ko/8JeIujJiXDEBv2ThvFf6cr+4xDCQ
         Zlxh2t7QvysfW6lGtqGfFIKDmWUvGAYZ3dlRp0dE2RsdBPAbIAFZwyUbXU1Sv3GF13Un
         efZ1ZbSUEj/3+ap8hPvTRDS0/yPL6u91vHeXhK7ble69VgQEw+Eru0aalSTuLUvscH+x
         nMlg==
X-Forwarded-Encrypted: i=1; AFNElJ83B9cF7nMLCkszKSg67c8oMowGd54ZONmvUxUnp1irzEXHJcepEjwoh81agKxLcJlyFiBPebQFgTj5wQFZ@vger.kernel.org
X-Gm-Message-State: AOJu0YyR8Tul5Z0ynNwXITVgl5IkHqpwjtj44oAlni3tQI4c/CPhd/We
	KI06QNo8pX53HqCbNsnpj/lxRcIl59Zs45cCNkhURSC4u7N1uRXrQyrcRZONtENJz970wauPAkY
	iziS5jqfNeBS0cQ6WdLRKZd5wUneNCUnWS8vudG36WIVIulBYtCV8cAU8Yo79ElRSefM8
X-Gm-Gg: AeBDievBoRHmpF2a0Fzevi73ZLBdsfv3yMwMkCnQTUgQAkAXbIo1R7295e7hl25hbQO
	GpwfHAXHTjBrf7TdpykXjiva9e7UWkb1aKg6R/HKjIJjPnhH98ExV9QAKLUg8OyhjRfYJ6gSbdM
	DFloK6ue20bbiLBYnAh1FvJZkivqJhR5GVBJmk9Kd5u3wcqFsXtnYJj+5wLHtiDc0HFqoMPwXKd
	XBKGhP6FbTGCug/IjenleX77mbxjcJe7Dz+fmO61gMhziuKNfFZhUJAKNPme/xDurTmcRM72VDA
	87arBDdodj71g9P/Sj0IsMt8TBUSynZFb3i+3v/IbsrZW4my4fgqPIrcfOv0nPigHz+3JjP2T9s
	cwgcUhr6lQY4+VVqFg0w7EIcRXZW3SClIvQBOcEZBG7Eo+1vYEdzd2dTcpCBexjnYmvjyqcQYSb
	R8LQK4VbFMjHuJYqagF644ak8i7CpjbZiRlnpsXss5gLU9Lg==
X-Received: by 2002:a05:6808:e3d5:b0:479:f0a2:d213 with SMTP id 5614622812f47-479f0a2e58cmr3576548b6e.13.1776875463251;
        Wed, 22 Apr 2026 09:31:03 -0700 (PDT)
X-Received: by 2002:a05:6808:e3d5:b0:479:f0a2:d213 with SMTP id 5614622812f47-479f0a2e58cmr3576507b6e.13.1776875462760;
        Wed, 22 Apr 2026 09:31:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc627sm4644664e87.29.2026.04.22.09.31.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 09:31:01 -0700 (PDT)
Date: Wed, 22 Apr 2026 19:31:00 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 4/5] phy: qcom: edp: Fix AUX_CFG8 programming for DP
 mode
Message-ID: <2735ilumweoraiil5o5mpafs26me4vwhdqdrbkemjjwceorcet@ayfi7a4z6tc3>
References: <20260422-edp_phy-v4-0-c38bef2d027b@oss.qualcomm.com>
 <20260422-edp_phy-v4-4-c38bef2d027b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-edp_phy-v4-4-c38bef2d027b@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE2MCBTYWx0ZWRfX8hYSSYwHTpl+
 AY9/GV2gruJxu8fw06s3OZHzkzMJdPS3p51EszK8WRqvppl+Tz38Y3Pj7KMHa3pUf9MA3GDKHS/
 JoiusRfbf9+x6ptIbWEKCiTCvnD+/tS+ZKGItDOM39Hzr4lLwnEXlkv21pJvDu+Kw7Clo3Fb5+x
 mT79sSQrnaVgZsFxtZcDuHFI6TiVeXEQp9OPMWZZGwtgM+u1vkHXCn6rzubKn0Lv2NPGsE2Qx/C
 tyNVXRc3UZQwmX9Hgs1l/j9iivhwa4wElLX+KhpwWeImbTHwUsDZelXhBhuJ90W2hh0mPigx/7G
 iSaSyASAU2m6ABXo1UvgfbRryu/1Er+MlguM1Ns/PxjBiQZtIjvajs+975w4R0E1rOUXOHp+i2Y
 EONORutOe5WOMzYjYcgRw4TnMGqYaOZquqe457gSzv8r6Qw68eagYs2fe3EmtlOUyXG65w9bN0J
 fS6GL+EuuFxJxU+aWhg==
X-Authority-Analysis: v=2.4 cv=OeyoyBTY c=1 sm=1 tr=0 ts=69e8f7c7 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=5Bka1ikJ0fms73B_C7oA:9 a=CjuIK1q_8ugA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-GUID: ZeACAoqkE_U53OKWzqvtr3DgOWLq2EoZ
X-Proofpoint-ORIG-GUID: ZeACAoqkE_U53OKWzqvtr3DgOWLq2EoZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_01,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604220160
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104155-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7F174448C38
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 02:01:54PM +0800, Yongxing Mou wrote:
> AUX_CFG8 depends on whether the PHY is operating in eDP or DP mode, not
> the selected swing/pre-emphasis table. All supported platforms already
> have the proper tables, so remove the unnecessary check.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-edp.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 

Fixes? 

With the tag in place,


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

