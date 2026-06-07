Return-Path: <linux-arm-msm+bounces-111591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zoCFD0PPJWrjMAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111591-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:06:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8511A651710
	for <lists+linux-arm-msm@lfdr.de>; Sun, 07 Jun 2026 22:06:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nudKNXZm;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ykk6TCYV;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111591-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111591-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7985C300CC17
	for <lists+linux-arm-msm@lfdr.de>; Sun,  7 Jun 2026 20:06:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D3C31A807;
	Sun,  7 Jun 2026 20:06:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3223B2E091E
	for <linux-arm-msm@vger.kernel.org>; Sun,  7 Jun 2026 20:06:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780862782; cv=none; b=aAHnDwBlC0PiApQl4gXXSrOsq8BBhaeQ61R4+imoBx0EZ6XnzOhPFQSkBv8nhu1SXbCvQ0nj4xK9E2uAgL1Yj4/9lN/zur4o6RKVUEQeB9QolZWd8wuZz4b/c/32/JAl6ZXHgF9BZlSm5EheWNoGjQfr5/4dEbfzdXly3pZLTvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780862782; c=relaxed/simple;
	bh=/dSri843urCQMocVt4iX5/3oh3lf3me1TQOi4X3CA4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBrJnDnBPOGj9bdhaUjOjhSRhHL5C57Kn7c4f0+Kymyzkw6VualbChsKjurGGjts9McOGI+MFZLj4mF4UpkCcjA/sbIqUZ0ETXPClenlFL+HEj36qJ8m1HjSRu18M1woI9hHxCsFa7xZrhrUmoAY866SgM7kZVWixrT9LgncSh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nudKNXZm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ykk6TCYV; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 657EkfmF337074
	for <linux-arm-msm@vger.kernel.org>; Sun, 7 Jun 2026 20:06:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ySrjtkrN4U4WBwoTWWvvislB
	tDYzErtLRzA4YICPT2Y=; b=nudKNXZmexcW8Fl73NINkt/SmZNGU/gxxjmGjnuF
	6mL5O7IlKQCoClkoj0Ban32h96eV67duaHfhenRP8U+DJNzMXGbNxJVEe/Zqenyi
	SaWp3+BNdQ3/CMr2QuFjRCvVZYm7pDzVVNN1zpHYE7SLpamoiH6PkNPWx4wPMdLZ
	1xNqK90036m+eyNxVGtB1kHUpPorBN4Xm/LPQHGxJGVy3ofXVztVTlB+zCZ3fCAs
	bELpK8ViYFfsrQz42SGeV2dXZu/CW2OHjdtBAJ0fxlZP5RYnBWDWPrURwdCasqfo
	jZZ8a6KYIchDP9dgmsgFYUOITwqXNJ7NRVAGHwq1WFi7Bg==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emcqgvcep-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 20:06:20 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-59eb3f8969aso2577601e0c.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Jun 2026 13:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780862779; x=1781467579; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ySrjtkrN4U4WBwoTWWvvislBtDYzErtLRzA4YICPT2Y=;
        b=Ykk6TCYVLf3CqN+VYjBJ3kyfBHfPkd+OHnqWzqFPt47DEyeDMIJciyfXVJ3mZftJTB
         sKy3vA9+w/MtTI/en4sb/8Ks8Ktb7EU0xdVMf4dL5nn+wfA8U5i7Wx7XWmBHh/xqt9bK
         jwAT6rgPCOsIoaKBj7euRcRodjlIG8EfhIwMIgnTALWwMrGnu1MDdMshCWQ3KSH4EY7e
         pZ1hQEbj/bTfh+CnuOhbckQrXAGVoNjWpnFIN8kHNr6hZYP02BQmzukLebBIkR9mB7c3
         yh+NVelWJS8qQn3XIVh5Ml7WNdGE8KyXpWbpZ3Mriawoan4u34HmrB597X5dvQ6CWLOt
         0nxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780862779; x=1781467579;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ySrjtkrN4U4WBwoTWWvvislBtDYzErtLRzA4YICPT2Y=;
        b=bW3StDneceNys4FPiWPECkV2u0zJk59TYFIu+VmzC3BgxhIvSCJ95/Lf6hrzEfEbOZ
         Ot+wpw2tOWGp+dmSSiDkDsRdYcfU/GEbWW/2yPsSFfz1fnXYR9Hs87s45A6XER+DnnpB
         bqzIxgoSmZUJhzzZTqBOA+Tlq/t8YkNE2yRSOkU9TBNaNMyV2AmOqvjq8C32MWdzsyXd
         MgNW1n20eN3vNnrqd5YdCoEY5ndr/IraErPhUi0/5UZQPmx3BGoUDkNEJ+MnIqTR380T
         7wrIs6rrgKl+fkGzDbUrZhm3tAZ9M4GikLMDhB8XQlkdVo5QWKZF9PFVGJn16ItHo7QW
         OxnQ==
X-Forwarded-Encrypted: i=1; AFNElJ9QSKidtAD56rPGI5o70b/RUxYnftRJM27Ds5Ivc4azhgaW/unWaSmiQyWJZvLk75T6NURhZ592WT/RQ5oi@vger.kernel.org
X-Gm-Message-State: AOJu0YxEYX+egWF9h9tIUIl2ay/R3clod1vv/zYj5ZkkQUBP2bS2b9U+
	N3mnltFk6WlVlP61a0zZfW2Abs9b6jqgRvdIX+GYvuRjlQYZ76LG9uG1bdOBtIqUIRSYSrAlEzv
	EO2Zw9hR/OloVIM6DRgN+ABkhKBSqbPShM8P4JptmulOXtKYKFUgRoEetgviHj5WOEa7W
X-Gm-Gg: Acq92OErTmWbGZt2q7VueKmMWkPTWn3zZnnrhG33Y0yDaOocJAGWiiXyznMs98shMu/
	7QajhU8vHWoWsjMD+PAf74WRKHf1uTb5fbtGV43d6gsXHt++5jOjMzfcP0UsEmcVmKJ5/VBzOIw
	aVGxXNkGsTJ+27PLb1ctXqeCkXIMa/0PLIx3CHseGh9SGHAr4M0K4gUwI4hjk804SHdVOGUrLn4
	UZDTONg5m1qJhYMSBzwMPz5OVCIm8+EDm6jU2MLRSrBqdD+nE5Zfjj45Yfga8yG+tCAOBckejO2
	ACWthYnSbGIbuvtf91T1ARLWzW+zhtPsuGLU42+z9/sU7faTq8gKj7KnbONItyzrTY9XbXWtUr3
	Clevzhd7sCZXGA7lNXhAJOhOcfbtCFVV5nlAA6HzQmjKgvUvRyklW/rK71/qwWsnYLZSMdJqWHz
	rHDBjz1O7pUQuRL2iYtt+zheIhP12C3QVCNthIeq6rmWUH7w==
X-Received: by 2002:a05:6122:134f:b0:575:e9eb:d879 with SMTP id 71dfb90a1353d-5ac48699ccdmr5535558e0c.0.1780862779329;
        Sun, 07 Jun 2026 13:06:19 -0700 (PDT)
X-Received: by 2002:a05:6122:134f:b0:575:e9eb:d879 with SMTP id 71dfb90a1353d-5ac48699ccdmr5535544e0c.0.1780862778808;
        Sun, 07 Jun 2026 13:06:18 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8edf44sm3228662e87.9.2026.06.07.13.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 13:06:15 -0700 (PDT)
Date: Sun, 7 Jun 2026 23:06:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Phillip Varney <pbvarney@protonmail.com>
Cc: andersson@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        bmasney@redhat.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: a53: Corrected frequency multiplier for
 1152MHz
Message-ID: <vvguw6izixyignnsen7rtzat7xukxpf6a5632lyh5udjisbzcr@zb2ngw2ub3ip>
References: <20260605005502.313928-1-pbvarney@protonmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260605005502.313928-1-pbvarney@protonmail.com>
X-Authority-Analysis: v=2.4 cv=dJGWXuZb c=1 sm=1 tr=0 ts=6a25cf3c cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=sfOm8-O8AAAA:8
 a=EUspDBNiAAAA:8 a=3JEogiOhbz56tVuKwNwA:9 a=CjuIK1q_8ugA:10
 a=tNoRWFLymzeba-QzToBc:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-GUID: vKlXFu4y0tyHjZswjmVMqpLFNGr6Q75p
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA3MDIwMSBTYWx0ZWRfX9glni0Qgxn/f
 EOQVwjAI+m6oKo5w0lHwlZDQUuNgnEhNYfe3Uch2B/9rkC6wdOXkGTWjrgfFn3mHrMNWy0ywTIp
 MZ1ES03oyjW7C3GrPw130BCn5PZjM+ObckrFAWu1BlQwKjy7wntIbq24ytCSdIox1UyDQtyeAWq
 xSVxESUfy5tlyizmxU2fVDa0F69GpYkiTJNzx36oYItjpXIpDiVAD1LyMABHjKHU71OXByTfr+7
 Eut2ann7jHACCy+MaafhXSDuaEOE7qjE1+BRS0A97GCBJSyFwikTfk++QX/TFLaMigEbYt+Le6j
 kHImF9QTCdGSXst0XSPhcCEySACrej0JlQm6kuyBo/z2EiIHbR7QyIm2Vv+6p1FleR1/CPpFL7n
 WuRHWQ8aWiDxL1FKCsVdqfz8tubixSxTLQzd66eNvCxeaPIr/d4aeDh8BAt5HtXVPrC+pUMgc0C
 u5fWaVzQrv++iuJwrEA==
X-Proofpoint-ORIG-GUID: vKlXFu4y0tyHjZswjmVMqpLFNGr6Q75p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-07_04,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 phishscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606070201
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111591-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,protonmail.com:email];
	FREEMAIL_TO(0.00)[protonmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:pbvarney@protonmail.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8511A651710

On Fri, Jun 05, 2026 at 12:55:45AM +0000, Phillip Varney wrote:
> The 1152MHz frequency entry for the a53 currently selects a multiplier of 62, giving 1190MHz. This changes the mulitiplier to 60 giving the intended 1152MHz.
> 
> Signed-off-by: Phillip Varney <pbvarney@protonmail.com>
> ---
>  drivers/clk/qcom/a53-pll.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Fixes: 0c6ab1b8f894 ("clk: qcom: Add A53 PLL support")

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>



-- 
With best wishes
Dmitry

