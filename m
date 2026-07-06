Return-Path: <linux-arm-msm+bounces-117002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id h71sBtDyS2o5dgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117002-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:24:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 15EB5714774
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 20:24:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Yl9AUP47;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="ZR7Zxy/m";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117002-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117002-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D51FB3000B90
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 18:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69A5B434E25;
	Mon,  6 Jul 2026 18:13:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12546434E35
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 18:13:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783361611; cv=none; b=n5pKaodUBkyqELfoiVS8YU3cXC0vLwBxdZ/HKoqWfjaw/4g/QxbQrnfnkjshbWNv4+oLpraR+iSnsyr3FDT21yppwER4jZWnPz4EJt25GXD/j0gNTVI/UNJNlvcuqNBwLZ1sQu9Gc9w4mWxneRFdJzdmw2Xs9E/4RFqTL+FuKtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783361611; c=relaxed/simple;
	bh=4DZvEIZA2+sxTIunlpdVHrdORDcA2xWTHPtkc8lVWfQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TUi5t39gE9F2q1JfBuIkRETV25ZMNHhdsvvBCg12fT9c2vtSvf9/UDKQMpuRpOEvPnz/roKHAtH1VDMAzy00b5zylF7j+Kli1ZXLq9ufLnftjvTq+8qD6oIwKtwxViAW+6dWbcZylS7Qt1+JXJ7vqJXyqeWlCeHlN+LvYdwfwKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Yl9AUP47; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZR7Zxy/m; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FFCTM762339
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 18:13:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EkRx4lIqqRFJsnIqB0R6EPjWgTCRZYycUonsPfbypHk=; b=Yl9AUP47ngtT8HJE
	nvn48dUHlDIYAmSOgNxuCIfMt1ncVyh7hYv15bjZA2hq+uUqxyzUCWqV/W+9lA0Y
	Z5rKRO2VlND09ii8caWAv8cPmp2KUbc/LYsKeaIkFf5CcSdRdOEXrgwdtvau5XR7
	p67CaW/e++4OM5YBmOV/V76L/W4qXA5wUDxNsGh4v7UJ1kxRGVnX+c1dcOreF76n
	OU8rjJS7YpVqNo9HxftGbohBZlY3S1MIhwwFk2S1F+EhT5JJ7HQVyXRavey9pOjf
	BTQ6j/++ySt9aMhmBk2N2hJX4PzxmKHh+tHp2hbtCj6i16oa8T4p53Smugx1Y1Yd
	IrQ8bw==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87rxtxjy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 18:13:27 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-59d595bfd94so1188593e0c.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 11:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783361606; x=1783966406; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EkRx4lIqqRFJsnIqB0R6EPjWgTCRZYycUonsPfbypHk=;
        b=ZR7Zxy/mVl+xR36yJTfpm1bqRX17TBlex4MdU82TBXxrUcrq2+SnPRo5wBOl5GFgQz
         5FDSZ+6BT0ifQWt/gMPUT2D67OTcYoAbz1Mpn8E6WbGkt6kedOiDq2sj6qY6cnYtyyv1
         rxOHoVm9SIgmm+i8TVhTPreQilfOp2Ic/DNFtWKxr/rVwzO3KDfJXwx+1mESRtbsXb23
         x34gokHFvpj8DeDN8QLfakbDuI6fm7trZkQ0R1eKzC2dcl78ACpD4v+nAuh7uUhK/iF8
         IdUDHKCqlgnS2druMvzTepPvtp28pRkDfgGiJq+Gpk1CptJPfk7nJCPiHsiR3Klen2CV
         esMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783361606; x=1783966406;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EkRx4lIqqRFJsnIqB0R6EPjWgTCRZYycUonsPfbypHk=;
        b=L5xcPiqx8V5IWps0BsShBSa40mg14duV/Jl2X361RA57c1xUrFOynhIQRt2z8HQPCv
         ss+zzyRIBYD0ZjikvORtseXwHGo5AkGxEQi6mVBP+m9wQIfYEDijgZrbytf0wRKLdHpX
         7lgoC89IOcNrSATSAEuhqocKtkwjL5MSWhYZHH+msdUDl2Mq48i4eTxdeux6238avnTg
         OcSYDY4l32A+AWuhtqUDE0ipL9YrZGCiWMMqgGkQmZhJnY3EV7ZgYA5IL1vZARH12Lrs
         5BAE3LfPrFsEU0nkAAbcG6Ag0n2klDir1oleJjHXm1sUcH9lesc6FI68o5AaIVi/nzMq
         GULw==
X-Forwarded-Encrypted: i=1; AHgh+RoWeGpkDzp3RPkTqgpo2gqm+MpF1JdrfXHY/6afICSSZs0/YafPnliXWCHnXMHWgqhUw+lo+xo4FOXdiY0a@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2wO2/PdBtEJWT81LXd7XETly6HXvFflgwM/+dLhqG6QGgPdxX
	BkF9AjCzA25fXM2sIdo57y/+PEz67me6kAveU1KAsn8I1dBSMTCSiQn+bPYJ0nPwwffvYnGoqKV
	AK5NzgMBQdvVyu3uoH8059Tl8RKYEcUQc1ptAo93envbRimETXwq2ibOL3K/UcDwxcI+D
X-Gm-Gg: AfdE7clKXanJSI56QZtyao3AtldLaV4UhxLz1uKHqZ4H4OjfevKd+YILnPzwkamMIFf
	Yl4vF2DWPMzRrPD3LTc6FjhocPkVhbXJ+NpIRH3SFEwgD5SStEOsn6156cedYDDqIo79BdNeryf
	Wi/3ehIT2Rb/dVDu7wcRhv5oXJM6xaYHN+ChbYkYSm6nf8lrreiOc0j4LY2HobzhkolIY3hRZ0S
	1j9TAXcW5SBk/Wz3VHFreX8l3SEUyhaqUZ5sKk2eriN3zAYzgbUR1H0GogmU9N5OaljXOAipCpe
	Dq+s3uexTHdgaSere7Nawqpu4M3+XXDkIflL21k8rdwEIq+vQrzfIQKhpVtpIE6tgt+Cxxs2Y+j
	oaBgXItsMg1rpO8KdwW4PbTJiQ8ARnI24ambp5q3IyH5QgSm+Vq8vvO0qZ37AqYhaCbFU83o6c1
	0tPtCs3NpEB5VkMW1R8g13KH/Z
X-Received: by 2002:a05:6122:4f82:b0:5a0:afff:78a6 with SMTP id 71dfb90a1353d-5be908f759amr847827e0c.14.1783361606532;
        Mon, 06 Jul 2026 11:13:26 -0700 (PDT)
X-Received: by 2002:a05:6122:4f82:b0:5a0:afff:78a6 with SMTP id 71dfb90a1353d-5be908f759amr847809e0c.14.1783361605969;
        Mon, 06 Jul 2026 11:13:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bbbd1sm3012662e87.44.2026.07.06.11.13.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 11:13:24 -0700 (PDT)
Date: Mon, 6 Jul 2026 21:13:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v4 6/6] firmware: qcom: scm: introduce keep_mdt_buf flag
 in PAS context
Message-ID: <yg75raxv5nlbcg4jwytba2ijqe4qsrutw3i4xtc6sxenbnaxqk@fnutisnlywf6>
References: <20260430191253.4052025-1-mukesh.ojha@oss.qualcomm.com>
 <20260430191253.4052025-7-mukesh.ojha@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260430191253.4052025-7-mukesh.ojha@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: kioZvoh-prKdI85eDZLDRk0zbsxMuiz4
X-Authority-Analysis: v=2.4 cv=Hv1G3UTS c=1 sm=1 tr=0 ts=6a4bf047 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=JcZP6P7CLaFpWR7VDUwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE4NCBTYWx0ZWRfX5f3lyXU9wgn6
 +T7k8SpTNUu8PK5FbA+/mPekf7prdI5zofGPBEdQ5EhhUI08+HAT92jymT60FG71wM5ZRn4ks22
 6cN4dGon02Pk8KymAIVdZxm9jV2DaYU=
X-Proofpoint-GUID: kioZvoh-prKdI85eDZLDRk0zbsxMuiz4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE4NCBTYWx0ZWRfX4R0NXhRV2S5o
 hPX4Za1RwaRtSbgJZkd7tdAc96i0kwN00U3QUGjZUFTL9FIHGmeMn6w62yvTaD5BfhlVJaHI5Gf
 q3wMvHKSsXDABAiyw7epvl5NI9fJRHEuXenJN7ixEmsFoiqyF3td88MrQZCx5HOuGQ60eqGMY1a
 vOCJGHv7EIVDZiwxSrlBitR7Ul9Bg5oUaJj1Y67X4+9hzDxQ1TB0AIQKZ1B1Sn9Lsrb9fhM2jVR
 YxMJWv5hx/1/HYaOs/9+JBP6j2D934hVoMNVs0OJqOTTeu8GGxnfMopCfqKq6Dm/hs28QVbH1WI
 An0etCACqOyrSZKcFJJuIHWjr9KSS+uDFyzvzk0ziZmtICdUHDTKKcKq79jLq8mXP5EHrGs0v8u
 w2gy/wLc44ZJXn8Fx0lcJGE6o86ST70WkyP5otFQKO6Hgo6BppUoureIrJYpxKuBAtBVtYXxpct
 BGTLOQW8V9s9O+2bVOw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 spamscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060184
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117002-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fnutisnlywf6:mid,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 15EB5714774

On Fri, May 01, 2026 at 12:42:53AM +0530, Mukesh Ojha wrote:
> The PAS image initialization path always retains the metadata buffer
> when a valid qcom_scm_pas_context is provided, even if the caller does
> not require it. This implicit behavior leads to unclear buffer ownership
> and forces new users of qcom_mdt_pas_load() to manually release
> metadata, which is error‑ prone and incorrect.
> 
> Add a keep_mdt_buf flag to struct qcom_scm_pas_context to make metadata
> retention explicit.  Metadata buffers are now freed by default and are
> only preserved when this flag is set. qcom_q6v5_pas enables this during
> probe for contexts that require retained metadata for subsequent PAS
> operations, while existing callers continue to work unchanged.

Would it make sense to make new API backwards-compatible, so that we
dont' need to touch other drivers at the same time? It probably means
adding ->free_mdt_buf flag rather than keep_mdt_buf.

> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/firmware/qcom/qcom_scm.c       | 21 ++++++++++++++++++---
>  drivers/remoteproc/qcom_q6v5_pas.c     |  2 ++
>  include/linux/firmware/qcom/qcom_scm.h |  1 +
>  3 files changed, 21 insertions(+), 3 deletions(-)
> 

-- 
With best wishes
Dmitry

