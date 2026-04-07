Return-Path: <linux-arm-msm+bounces-102173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGYSAWIJ1WnMzgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:40:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4120D3AF506
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:40:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 036F53054F23
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 13:30:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AAAF73B775D;
	Tue,  7 Apr 2026 13:30:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OIRaG6Ca";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jLqlhxwc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 394BB39FCDC
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 13:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568610; cv=pass; b=bP3SO2781XezZTNI7q8a3IhnWtj812rOsw0OyJXrURP90aefEeF5b0wJ9s0hBwRiLP9inRY/msGfGN9ieTsVwD6QpATk/A2pDWFm4Sm96yGEqE/1BPDwdw/suiDGN3fVfrI9aiKtBlxG4H2vIL9eQSFtD3k4s4i7swKcrXOIkQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568610; c=relaxed/simple;
	bh=cVBfaWm38Zt4dvT+MEWmCTUPH7hD3s6kknmIa3u2TeY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q/brqmSSIpYmFv2Yafc4P9wGL7wLzrmXv0bS+Uqef2dZVUfkjDAlEhPGMLK8ahPItqhFWem4WPUjhTKtVHPbOZ2HxhHuXs6T8rT1AavC7uE9iIB/TGDLGiMLpJ3mnKfXPw2evcZ40sUg6S3kInWnxKgzHvT2X3rkHLc30+9VbZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OIRaG6Ca; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jLqlhxwc; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637DN1tL2009900
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 13:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cXHI+HoMT5nQb1dnewTDRapny/uuf10+QCLdHGxs6MU=; b=OIRaG6CaVv7oidXY
	C71YMfCAvM2n6K5q5kJJkwjL12ryNMuuvAguF3DQQ3Ea80hE9aTnE3XcMdfvUzaQ
	wu4UklE/oE+YXi1QUvYNLUvYnPbEbovwiyxlakGnf8Tc9n+MQAKj18n3TLwjdsJW
	anx4ZDub+aoUf7CaeRGlEzrnLSjMDu+uOmlT4q2g2C7EFTTycsYrSUHMGJP0IuK2
	ZzqV7mUd/19c/NiV8HurNlMIrrIKOl1h8G9AnRi88DGzvox9sw0UklnNddLlSGnC
	H7hLcrBljJAm0eUxmuWyz69McWrbw3MaHpnAq2LWekODiUMAs0h++vFCh1L04gIM
	7TTurw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmrrtw7p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:30:07 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8a5f6110c1cso146087466d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 06:30:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775568607; cv=none;
        d=google.com; s=arc-20240605;
        b=dESuSUqDCmBT4EW6lotMsd1qSPTKYaVNhyD6azaOmiICyShqnj5X4xniZfq/Y/vKbW
         LhTefqavBs1JQskJybBtVxBF/14MCKvg35vG/i+dIei+7ejnD8UBIf5cbXnXKHv/P61g
         xO5ACgw6YdpyP4/VGw4ZXyACuJR6di0PmtgIs6svWRDYc0MDBlj8Sd3wrelvI9TOWPEC
         tF7va53wF7jcyr0WcPbjdM8xT/mXaD36xlRecTZKVUgnN59X0WGFni3n2gsjXXeLkQ9R
         7B/4FAH2n7BfxGl7sxBueOu2vQdYFGVGWrQq/ii6xVkrlYc3k5Su55A8nW+8QS0KWA5a
         ovDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cXHI+HoMT5nQb1dnewTDRapny/uuf10+QCLdHGxs6MU=;
        fh=P5teF7hbCJUjLRWpK80754Orvc+QhbQjeEs8+qk/lkU=;
        b=h2gMsrfVSVkSmAQMi8VI66F64+Mgl/knVmWJXXAeEn5DN2NB1UXZ6lGfnvwxOA109r
         x5TDHDLuYlY9He/K7X1WOmryp+K4WsyTnkhM4+U6lcIFfulHst19APO2YNZSGjjhrPiT
         R3j34yrodEtO+pKgRmiPmX00P0EIfQTR0ssriTy+JfSt9KeIlCku4Mr93ekDw7Iqm8tX
         jIOxYomnoyzEN+Bo6ZcG7WCII7DrKvLwycZiZFL4r5Nyh1xNVYppPvQ5MLNlIeGz2B/L
         fjpROZglauhSYrS2nWnH9uk71hzIjEQfAW4T2ma30tcalzHawAtTb9JPZppMb5VtgcQK
         DQ9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775568607; x=1776173407; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXHI+HoMT5nQb1dnewTDRapny/uuf10+QCLdHGxs6MU=;
        b=jLqlhxwc11DcY7cqPl65wEpOwo+1a9mxea7rXEfIMpVRB77S6VwG8l1HY/8saXbmHN
         jJcHwSyfLFI/3iv6OK02yl+Jqm4Ox57LGGMiS0JlCFLeBc600GapWlSwnKMZEaT+Z/Wl
         ZYp2sjXrEr8ZBriaGnnBMJCtzgb3KR6clXueU1OnMaF5EVQEwBl+ugruG7gTzVq1if8x
         +z+awcbt9mTT0LIRTk14PGLsUMXw+KzIRKpeIyprNbrnoy2/J2QpUEo5aHnh5Aa9ohje
         6XNxChgYtEp6KQxhgJJOgW1OI7uj5yAKY5cOqKj4z0IfAAnQfPIuXzG9zZGTVOD0oTi9
         ajvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568607; x=1776173407;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cXHI+HoMT5nQb1dnewTDRapny/uuf10+QCLdHGxs6MU=;
        b=GmXgIqJD+7dksIEkDF84FKNCPSlfp9jvnUjiOys8xOlUI4Kv9tYgyRS063Gcopr1x9
         v7UQjhWLPepqG59heVYG7J/vmGLkK7PhPJZPkxDFAeOBMqQN24lfG9qC3MWhpySsQrv1
         Lg3XxvTl51vU6qKjJsNPZCEtYP8POKBpN17Bk01lokh8uG0onWXJEVpHGF/rPzJ4LI+l
         exc9ZTwL7dMCzT+Z2h3mHG9nDvs6gsgljBz3EIF/YQQO9HljPVW0/1gO9UTkWUZOpV6m
         Fa64hpyWrwT+Sa8nN3FXS9Rgok2lZhEC/OeJaEI09JX2ZexET1+dNEqbjqqJqxZoT7au
         VWYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrHj2smX8ZlKrLTh5ueWayG6U1SvLWyaEgOwpJWlEaVuoMSjNj2sWc0P8K1uine2fTYoUTfahLujeZ0H7Q@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7cZlU69Uf+gArq11igwmSiTYz75AkIreJoo28D9AjJE+lrnTo
	DBsTxKaCFy8CH9v7rTiLBMjPCo4ORNqT2mwPefZPXEc9Burt7pVm5QTx5sKeXfRpnB0hcP6jsxg
	IfOYNsm8tS/6uFc87Rv0E6G1/2RArrJFvfOG7iPplGwZn6BYnlJv9Gih2CrFQJnQ2VcbEB5K26m
	Jt7EvO2RaYFYNXfX0zO0Dm4cFoJUr4YtwZqEDhzwBYEck=
X-Gm-Gg: AeBDiethKN2JxQJHsp5JJbkk+wqDfqWuB7yAfDEXcQk0LTR/hc2w5ig2J9YnZJIorRT
	ke1VV+IOZdeEhlE2vVD6GIHcT8umCLC6000dPijmMQT//2bbPZVCGJwtDoqnOSL3rAdXAuiTJqb
	sVK+FhoC3TBrTIRU4lDq5ningIh8I4rtKT6Lwv4Fw+h8pSCPPfnVk/Q27YsW3bRhaAhBmVF5l6r
	7l83jZ0xHaDSu0a7UxSehwElH8pjCtr8fzO0hQ=
X-Received: by 2002:a05:6214:2aa8:b0:89a:9ef:1922 with SMTP id 6a1803df08f44-8a7046deaa4mr266841356d6.40.1775568607170;
        Tue, 07 Apr 2026 06:30:07 -0700 (PDT)
X-Received: by 2002:a05:6214:2aa8:b0:89a:9ef:1922 with SMTP id
 6a1803df08f44-8a7046deaa4mr266840426d6.40.1775568606628; Tue, 07 Apr 2026
 06:30:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org> <20260407-camss-rdi-fix-v3-4-08f72d1f3442@kernel.org>
In-Reply-To: <20260407-camss-rdi-fix-v3-4-08f72d1f3442@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:29:54 +0200
X-Gm-Features: AQROBzACMKUNv5MZOhI59pKgDvTug_LEOvy8laj8LYSN5opN13Mvl97amo_eGE8
Message-ID: <CAFEp6-3VdFVmY8yj4LqVq1wFZ+D07WEfNJA2RhmpTeW2OtAbAw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] media: qcom: camss: Fix RDI streaming for CSID GEN3
To: bod@kernel.org
Cc: Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Gjorgji Rosikopulos <quic_grosikop@quicinc.com>,
        Milen Mitkov <quic_mmitkov@quicinc.com>,
        Depeng Shao <quic_depengs@quicinc.com>,
        Yongsheng Li <quic_yon@quicinc.com>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNiBTYWx0ZWRfXyt89Svv+zwXP
 OXWyUDL8/gQmyi0KPEgy89udzgMNXKmKaMpyZ5BNAyNQJx1UGMIZfq5zxsDxXIXqsu2bAq9pBTq
 PM3EZKgHYuq6JJAeyMoyJnoGvtv710IuNB0O5L7a1mUItoMCU5hjWdTFGwrI9rir1vjgNvRwJJH
 RTrsKjmFqWiXpMKPsTTVXrH+uA8DRGdKs2NBNqn0tD0k6wYLpQ2J4ihu6ORdzVhaxOTvknWjseo
 2o30E5Hubrnl01yAYTn1H73wW7e9qOh71muaXK2BYN0Pe8xaImujKO0/KKH51CQti2W8pjm845e
 ks49pW4s0vSRLPe05P9xKzOqImQqSRzzPyr6XeeErTtdgP2Y5knNPjNW1r0sC1VIdc803vR6srw
 IHDq+DeMyPBlyPn4wRju5UFXig93N0JSHt6m8//Gwi2O9q7mwyrRUhVAcVCFAKqEVZMlbbzRc9S
 UMUGYkoPzEKwrpaWL5g==
X-Proofpoint-GUID: vMsji7GcTo9AynA_XhIshgx-zcSgEJte
X-Proofpoint-ORIG-GUID: vMsji7GcTo9AynA_XhIshgx-zcSgEJte
X-Authority-Analysis: v=2.4 cv=LquiDHdc c=1 sm=1 tr=0 ts=69d506df cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=q9jW2Z7JBf9VXYl_VOsA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604070126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102173-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,linaro.org,quicinc.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,mail.gmail.com:mid,linaro.org:email]
X-Rspamd-Queue-Id: 4120D3AF506
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 7, 2026 at 12:35=E2=80=AFPM <bod@kernel.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Fix streaming from CSIDn RDI1 and RDI2 to VFEn RDI1 and RDI2. A pattern w=
e
> have replicated throughout CAMSS where we use the VC number to populate
> both the VC fields and port fields of the CSID means that in practice onl=
y
> VC =3D 0 on CSIDn:RDI0 to VFEn:RDI0 works.
>
> Fix that for CSID gen3 by separating VC and port. Fix to VC zero as a
> bugfix we will look to properly populate the VC field with follow on
> patches later.
>
> Fixes: d96fe1808dcc ("media: qcom: camss: Add CSID 780 support")
> Cc: stable@vger.kernel.org
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  .../media/platform/qcom/camss/camss-csid-gen3.c    | 28 +++++++++++-----=
------
>  1 file changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen3.c
> index bd059243790ed..ed5c5766efd36 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -145,12 +145,12 @@ static void __csid_configure_wrapper(struct csid_de=
vice *csid)
>         writel(val, csid->camss->csid_wrapper_base + CSID_IO_PATH_CFG0(cs=
id->id));
>  }
>
> -static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 vc)
> +static void __csid_configure_rdi_stream(struct csid_device *csid, u8 ena=
ble, u8 port, u8 vc)
>  {
>         u32 val;
>         u8 lane_cnt =3D csid->phy.lane_cnt;
>         /* Source pads matching RDI channels on hardware. Pad 1 -> RDI0, =
Pad 2 -> RDI1, etc. */
> -       struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
AD_FIRST_SRC + vc];
> +       struct v4l2_mbus_framefmt *input_format =3D &csid->fmt[MSM_CSID_P=
AD_FIRST_SRC + port];
>         const struct csid_format_info *format =3D csid_get_fmt_entry(csid=
->res->formats->formats,
>                                                                    csid->=
res->formats->nformats,
>                                                                    input_=
format->code);
> @@ -163,14 +163,14 @@ static void __csid_configure_rdi_stream(struct csid=
_device *csid, u8 enable, u8
>          * the four least significant bits of the five bit VC
>          * bitfield to generate an internal CID value.
>          *
> -        * CSID_RDI_CFG0(vc)
> +        * CSID_RDI_CFG0(port)
>          * DT_ID : 28:27
>          * VC    : 26:22
>          * DT    : 21:16
>          *
>          * CID   : VC 3:0 << 2 | DT_ID 1:0
>          */
> -       u8 dt_id =3D vc & 0x03;
> +       u8 dt_id =3D port & 0x03;
>
>         val =3D RDI_CFG0_TIMESTAMP_EN;
>         val |=3D RDI_CFG0_TIMESTAMP_STB_SEL;
> @@ -180,7 +180,7 @@ static void __csid_configure_rdi_stream(struct csid_d=
evice *csid, u8 enable, u8
>         val |=3D format->data_type << RDI_CFG0_DT;
>         val |=3D dt_id << RDI_CFG0_DT_ID;
>
> -       writel(val, csid->base + CSID_RDI_CFG0(vc));
> +       writel(val, csid->base + CSID_RDI_CFG0(port));
>
>         val =3D RDI_CFG1_PACKING_FORMAT_MIPI;
>         val |=3D RDI_CFG1_PIX_STORE;
> @@ -189,22 +189,22 @@ static void __csid_configure_rdi_stream(struct csid=
_device *csid, u8 enable, u8
>         val |=3D RDI_CFG1_CROP_H_EN;
>         val |=3D RDI_CFG1_CROP_V_EN;
>
> -       writel(val, csid->base + CSID_RDI_CFG1(vc));
> +       writel(val, csid->base + CSID_RDI_CFG1(port));
>
>         val =3D 0;
> -       writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(vc));
> +       writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PERIOD(port));
>
>         val =3D 1;
> -       writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(vc));
> +       writel(val, csid->base + CSID_RDI_IRQ_SUBSAMPLE_PATTERN(port));
>
>         val =3D 0;
> -       writel(val, csid->base + CSID_RDI_CTRL(vc));
> +       writel(val, csid->base + CSID_RDI_CTRL(port));
>
> -       val =3D readl(csid->base + CSID_RDI_CFG0(vc));
> +       val =3D readl(csid->base + CSID_RDI_CFG0(port));
>
>         if (enable)
>                 val |=3D RDI_CFG0_EN;
> -       writel(val, csid->base + CSID_RDI_CFG0(vc));
> +       writel(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
> @@ -213,11 +213,11 @@ static void csid_configure_stream(struct csid_devic=
e *csid, u8 enable)
>
>         __csid_configure_wrapper(csid);
>
> -       /* Loop through all enabled VCs and configure stream for each */
> +       /* Loop through all enabled ports and configure a stream for each=
 */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
>                 if (csid->phy.en_vc & BIT(i)) {
> -                       __csid_configure_rdi_stream(csid, enable, i);
> -                       __csid_configure_rx(csid, &csid->phy, i);
> +                       __csid_configure_rdi_stream(csid, enable, i, 0);
> +                       __csid_configure_rx(csid, &csid->phy, 0);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>  }
>
> --
> 2.52.0
>

