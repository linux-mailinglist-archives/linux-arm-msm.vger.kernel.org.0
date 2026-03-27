Return-Path: <linux-arm-msm+bounces-100233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDn+E3tPxmk2IgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100233-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:35:55 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A26F8341CD3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 10:35:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 31B7230B8E66
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 09:28:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D025E2FDC30;
	Fri, 27 Mar 2026 09:28:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="armFG/QC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gnzy+K9b"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504BF3DA7DF
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774603695; cv=pass; b=Ri4YvSJRDZyhFlhgVyz6nKPTbW6WmYnDCr19eAWXf0mk2hNkpR00AXYkOm8CCUaaru+9Aytap2dqlqgYfJNEC/MOtq4HsQBW3UiltgTuB6sDdYTL0+UcmgVVd0ir05Shan4u1/Vgg4kII1zaib0sTtAgYxtDsnZc8OxbRh6XboE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774603695; c=relaxed/simple;
	bh=q2wTjoA6AQ5vEokXlprNqUP97xG/5b3CiAspVWzTJJQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ofTNxysW55Ax6RvJFHwfI280+dypf/aqIgxgIvyMF0YWzllm8MGP8C5WQrcc9lLt75HZisCWh3GV5Oct1zpGxxCAqKmS7oXeWmZTvQy4HYBqZmO1J2UvfUPc+r/c0qc+9/kdVZWZEYMIriDyiiyv2LbjObpU8usLkklpgqvHWaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=armFG/QC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gnzy+K9b; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62R6vp0N298526
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:28:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t+ch7aFI4mufaylf8fLgNIC6y+jzwiCkcyQleXYUlGc=; b=armFG/QCcXwWnxnw
	v4lxtnRWnVbz6lYolGJu8RV2zT1MafVRhsJ9e+3l1mFdNcs6S1cp3lmQVjUmVIvY
	kMI+3Sr9DPphUg4Eu0+/RcAylc+fZSqeSdxsKtqcuMDfHf5XsVKTr0bL9SGP3Ca7
	V3WlQKGGwBkcSN+uSUV5xiO+XNCd0zaKDsRMsI9f+jIKkbu8Bvd0SrYtPhApD7Cf
	R4p1YDtVGC5etGcVgGmIi9vbQb5nWB+26kaX/VbfJnTTq8bgzfb3u72s9SWq6oFz
	O/jZiXLdToqnGV3FFYESTc+qc17LfpyM+vFbMxWDmbOdq/RkikrBg8o4yNdwwGW8
	bCpIgA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5bd8tfg0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 09:28:13 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b31cff27fso20269701cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 02:28:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774603692; cv=none;
        d=google.com; s=arc-20240605;
        b=EZypd9VxQbmUMkcq7k+nFVzEwwKKPn7x0LRQ/sJpxBnDCHAiVehP7435DLamS+1clt
         UwHbxSSJKH8C/mklUfyT4W9ZxgKpu4VFA7h/0O+qIoDDwout3ynjktS5KP3TQt4aGKfW
         21Zzrn/d5srbUA82p/xmulqRNPHIWZf6CfllsaOfdBCjH/J3XFXwqcOQfGxea8aYdvsc
         GecnSGSDTE0LJqrfLw/QgAljlctROPpIPryyeWb3/axqgnWSlPup9sDRg/HPbKAP708e
         SORvHzqpOrI3uGttUf6krSSMARK6EAkRJdO5+69R9h9JMwD2fm7czgmW4HjquAeh1LxR
         09Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t+ch7aFI4mufaylf8fLgNIC6y+jzwiCkcyQleXYUlGc=;
        fh=MSTHD0+hMu+5qd0c2GmCUt3HKOA9QyiN28f6Z5WqZZE=;
        b=DUHWcNdfkbgFevvNiJ1GjBcV3Q6kGUinFbswiT+Yp9jp+cpxgdd16fToHsbQDWBeez
         PpIurhp/x6SwPE/sL/IXyVCnw3Z/0KtrYolREWKlzi/tntAc7RTJOYyjOPHUYw1NIt/Q
         FTYUsaJa7qufdydB4wmhuSmj0KuX9H5iHrM+FIIcnkGempH5wkwXf0cWG3g4qin1akTO
         nYzgCD4E2Dwixh8YRdzcSVduiJTHCb1SE4FYNuzkM+JSGPbqxg7iZhJ1FDvzZFfOUbOa
         feq3TZlQ9oAM7II0rZBrk2lQhHEmE+UhqcZlqGA8AReKy+Ig5IcFZoXrj97V0Oc1Qf9s
         dKPg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774603692; x=1775208492; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t+ch7aFI4mufaylf8fLgNIC6y+jzwiCkcyQleXYUlGc=;
        b=gnzy+K9bY3I25xNNv7e/brJEsDmuGatEbiep0ryE8K6Qg6CpLfx6zopv6rREDZk+vi
         gihr/Tt/zV8kgEO8lIQ3lG8OLBECg6e8df7UWZk+IZ8pDQhLvKqlUF3IYQLPnCsyCmio
         9SbG2hnnKVoNsQ1LtPMmL8MECtoYfo9HQc+XM4spVOglygxQS9NjWDy0UXfFnUbrNLCg
         MgyPvyDCMYI1+F6S4AEQwxCxYZkvl04NtHfgvo5BXTH3M/+c0vZ/6HJlB1BYsNhADHBN
         hVntEGqrj9Lz+gvcbK0RKwaaNJ9CUa+MXwW3tjXFgaqy/q4gLCep5FHYhN2x1BNitUO8
         dJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774603692; x=1775208492;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=t+ch7aFI4mufaylf8fLgNIC6y+jzwiCkcyQleXYUlGc=;
        b=pp9mU1q3E/D3evLOq6RgbFIFyksMAFAIVfbjU0mtaPKN9+ER+mMpevuMKvP85IFzwb
         ET6pzH314j9bnZruojWTwmDogbHWGdOCC68zEn/KNK7ZJrmaIwpPkInUoeiYmyh2mV6B
         7ru7wMJrbwoDfKB92UXk03F9f7EqJUKGQDQtoih9zZD1kyOYbwL//Yo5I1rfPAVUxLHL
         m58yiDfI5B54RzRd49sVI7Vti7tw96W7f07ne+1Aja3lYYychQaRnRmGrvN+WIiZ8rxH
         5ssg/sMDWqwcm/77kE7rnm+uN4Fgfij3DCX+bxdPa+K5wgx1bjm7mpAaxi1t2tvI01nI
         GjDg==
X-Forwarded-Encrypted: i=1; AJvYcCWdheU2WLxlzOngVsvt4IKEzAc+dB9v3eJ8CZMPDZxeJj1TZ9MeOFw+aspamEptQjhc4+dleKVOt7phnNoS@vger.kernel.org
X-Gm-Message-State: AOJu0YzjPX0HaYAIeT+OC2BXQ/8eNQDEjAUS0wyfUpu59C1Nc9blexsj
	0RtdaHmTKrPekQCXjjh8zlQzEtRPbzifNhUEHt0JFgjj1C02Cf6vqeGWGnkdwmqhEIBM01nRcrU
	iY9TokHKrlIOcxtrQqtVuu8QQ7aWsbCEKbgGBiLQyGGqrfJlJwUjsA+5UXB7f/Btjg1w9tGw/vK
	R8ynV/ocz7c0K4wF6Nt7nhbePU1JhljcLmGKTEr8yUyumvSSmxI1huLQ==
X-Gm-Gg: ATEYQzwe8lQ0h6RJt3prjW67G61XxYwgpyXkPe2O1HK4gj6CjbtW2/ab6U0oB5Inqee
	XCtRYSoD6oSPNs3A2dtcOEUI4qMvyDS+dVovekSnK+wy0FML9ZdGfklDgBtesDfgkt3qlTZv/O0
	aiYET6vkW7Gu2c3DYmtVZHCyTVBRc5NAGAEzL8O9nWNvQtNabJMLdMJQUIGZjJPci6MJ5Be2JdG
	/9kQlIGutUQyN2Zl2JV2DC5DmaxN9323IyzRJk=
X-Received: by 2002:a05:622a:4d09:b0:50b:52ee:62b5 with SMTP id d75a77b69052e-50ba391933emr22125251cf.41.1774603692447;
        Fri, 27 Mar 2026 02:28:12 -0700 (PDT)
X-Received: by 2002:a05:622a:4d09:b0:50b:52ee:62b5 with SMTP id
 d75a77b69052e-50ba391933emr22125011cf.41.1774603692009; Fri, 27 Mar 2026
 02:28:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326165345.762807-1-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20260326165345.762807-1-vladimir.zapolskiy@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 10:28:00 +0100
X-Gm-Features: AQROBzAtzjmTb6epJEaAE1Tvbe_-Sctq_a0cze76MzHnR-ymwRbetX_a-DZvQY8
Message-ID: <CAFEp6-1v1fxTsB_6m_=F62vpzmLeUZj=mW=NWc7Zj78HssQ0pA@mail.gmail.com>
Subject: Re: [PATCH] i2c: qcom-cci: Remove unused CCI_RES_MAX macro definition
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Robert Foss <rfoss@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDA2OSBTYWx0ZWRfX1oN7PFDOdeDr
 BwxL795ckrtIwPMoFQ3ugfD6fNEwTJyfIS3SDpxdID27PhESpDBW8ZJOzFNOqzTxbziY3pD0r+D
 nEXt3pZsaPo+p9Sf7jCSNz+XvfWzv/eybIKxqM9fwWxSOttn+c6XDWAnarX5e7bvQDyesV3tTax
 ZE2dmrrsaZIVeM/1KnrljXVrlPtJK0N+nObAPGvyHpyka7ZcHoBJtnyVqB58p9cl9dsjtyX8xf7
 2IwrQKhMVo3YBVGZ8rNYYPgw/mUnoRAxrHE30xxH6aDLh0VtxYaiuqwu6Dn3eSkRIF2UWLDdxnk
 dK7nTCpp+0Ozi7cDd01+tg8vRGPRQYI0ksHDHLmiGT5OFJoWP8q7SLTTUcWHBxGH2Z1QpAvkqB4
 Wt7A1K6pEgLDtTk0tU/AMd21z7ATLYhz1lA4wWJrdZ7kWjlOUfz6rvG1zqxdbCKl9M/VApmnhr5
 GAoV2TYtqjpihC53Seg==
X-Proofpoint-ORIG-GUID: iUO-jwt3HASC_hc3jeKuzl9iLGIqdXkd
X-Authority-Analysis: v=2.4 cv=BZrVE7t2 c=1 sm=1 tr=0 ts=69c64dad cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=0yNr40b3K-hL-g3DCFoA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: iUO-jwt3HASC_hc3jeKuzl9iLGIqdXkd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603270069
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100233-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:email,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A26F8341CD3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 26, 2026 at 5:53=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Trivial change, a never used macro CCI_RES_MAX can be removed from
> the CCI driver.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> index e631d79baf14..7f146d02e5a5 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -71,9 +71,6 @@
>  #define NUM_MASTERS    2
>  #define NUM_QUEUES     2
>
> -/* Max number of resources + 1 for a NULL terminator */
> -#define CCI_RES_MAX    6
> -
>  #define CCI_I2C_SET_PARAM      1
>  #define CCI_I2C_REPORT         8
>  #define CCI_I2C_WRITE          9
> --
> 2.49.0
>

