Return-Path: <linux-arm-msm+bounces-91213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AJ1TFBLbe2noIwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91213-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 23:11:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 293C1B5323
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 23:11:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7D977300147B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 22:11:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B70A36A029;
	Thu, 29 Jan 2026 22:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O7YNnzb7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fM6AnFRO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7335369210
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 22:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769724687; cv=pass; b=DU2nGP3TWX0v1sosdUeK277T5R/JfuPbYtdugAxii8BSxhnMsQCNl41KnYRonrouoGee+5MC5YJuJNWB9Ooi37bStcCyRfBI3XiPBlsh7iWWGry8zoIMDH07B5BTMzCY8AokqmunCnp9BKN65LhqWqMhsj/E7593nqmCOYGqFFg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769724687; c=relaxed/simple;
	bh=ap77qHZRIpEOivUnp/VeDSCYE5tMNxl2HR6tClSYRwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k4vf2RHhSjP4eDwukUivNLqnO4v2F06oTHtb89UOBLoXahgSu5rKilvGbb4MUe2q95/RnonF7HO9LpreZaJPZz7O9cXWAkf87sHJSu/kIWbBHmdGVlmJS1xA8wOGBXbL6WQwJsHmPAFYM2n9LsRRsoq3mgIy81Eg4V1WKypCLQM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O7YNnzb7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fM6AnFRO; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60THavGs2953199
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 22:11:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=c48bU2/UQ6SHwzlMM7sKOP+HHv2vwIN/zOT3Q7WnU+o=; b=O7
	YNnzb7Iw8mCyhHM5qVAJXeL+wczijyw9mixwaVP5AhZcm3dagoN/ayjVgpS+FvZx
	FBUEiekrLvdFSHoZQCJ8pooi1JBsXP3G+uKbe7gKLx/x/0bCll6Sh4RpJpaPSHKm
	EUsDuWgNUqPjUQ5XJvHmlmMwwuUgWiHOYx4TMe6MkNPBL4yJvIER9O0ipQY5Fp3T
	SX32d0h3qveq3ZEicyjBIBPWwYoOdrUp2dlsjbeod85msH76pXWZVr32lDUa4AYh
	1aVI+gclniXVXQ16ebQta1pzSrolE/fnWIdbfGzmT2kXvOrZNLulF1emI2cVX9HA
	3stMNu+tbDAUzSIuRSQA==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c064226sn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 22:11:24 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-45ca4a13da3so4191607b6e.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 14:11:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769724684; cv=none;
        d=google.com; s=arc-20240605;
        b=Zl3ik2CqH4L00WXb9ZFhhwYJT5OriRxn0JLTwDtpSn3eSJ8htO5reu4/sECvI3a3lP
         dzMCjlqHO4+0J/37Q+WPAtEqfCQ1JlfuJXJ67rqRqVni75awKRWDzTSTEwoRTfIwW4NH
         Z30ujIxsdYi2UaIT7RZLfTbbm2sukaUIN2KUyem+bhPkXvXW79btz6QMBRC7ilYYVRGt
         cVGbZrcPhIuokFRHqcszkbtF8ULgfw90jQGEF8wg1CGAk9efJ2zZhJnky8dkgX5TJLSE
         1MzATA8qkCBgFf5TBmH3UhRXCkwBb9UBoyd/jYgq1CiAG7zQH6/J+QBQ0t7Ia09MwaqX
         AKfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=c48bU2/UQ6SHwzlMM7sKOP+HHv2vwIN/zOT3Q7WnU+o=;
        fh=RtmZNorYv+0FxY0ZVzX4zg+hmYBHvzwSCLc5EY/v3Pc=;
        b=gqbDPAjh0dukijOFr0l0YKjyR+Nz6YQJNye6kc1WsE82301zINoT4PYYRVyA5FRgiJ
         hU3gK5J3rH1d1e+xrg2IsG2HLZclq+VTd7JV/c84Ap+MHuydGoqRKit962WUEUdFn6xX
         M1dgsoE7qL5n0TpWQTcw84YNo8ON+JBRjfHvY2INAEJ50fk+hVEMrwRcGs9ZrjRpkdTV
         J8gIeULOOuZSx9UOlcZ0USSu0QdVcJwewtF/Sy5RqzHzA2rNNHySU2KQ0YUS1qzulD7C
         pnGeD6Ypde6dFXTsBuEXZWoqr0nVrlSxo6hVo/LgBilB5D3GeQpcq8xAnXG0F20a9EJK
         CIiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769724684; x=1770329484; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c48bU2/UQ6SHwzlMM7sKOP+HHv2vwIN/zOT3Q7WnU+o=;
        b=fM6AnFROLlUyMZo33twxzdBDhnlLqnQnCwHN0vLx6u4KicE4brb5hIMoVi2bn18X56
         N4FFZeR+grja7Q/JxGycorjhCGzUd8ZGO8ppj5ZCCAw4GWh7VIWlx7HXJnZK8L+eTJ0Y
         4YqdFTbncCI2ImYeRgHCiO5B+CYugCxlqnJqjOfnHnJkkT96LB8x0ArW0KLdR1Pgx0ag
         xJxAuvXl1r2thPrK9nli26aqiY1DxubCsZsIsk1KVAZsvO3hNKGxuSaXNCo7zVIHJvYH
         kblG6tJwD5hN143Pv9TS2YN60KMMO+etcUfEprPI4ZeGZCtWCS6QMdRN8guL4OgfdihS
         NcFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769724684; x=1770329484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c48bU2/UQ6SHwzlMM7sKOP+HHv2vwIN/zOT3Q7WnU+o=;
        b=fT0Yd0OvXeOqixN2Oc64nctrTRwrtunIacyhI0pkYKMREyBHuZPPEK7tYN5wjE4Wvi
         evxBBXIkGHI73lc9YBXa/mPjf37rYRe0tgMcTQqNQu+G59ylRpgc8hUu1X9ZSknwGgN0
         /p3CfV4UnoMc94tPE6v2uqn5Bh2YxrEubPTwnC0s5XQQl109ogblgytJRUsBmkgd4ghN
         I4mjWhYu/HmP76TtI6A/+tOL7qNwp0O8hmwv7DsTvXVXgv5mYVN2fDDcOYB2OxaNJ8I+
         DOdpp7jrNKU51Jucd9tGU9oi2mObW3nRLzVYXIM7T/DPtbFGJf4y+k/eCk8ksOaPhvem
         Ctjg==
X-Forwarded-Encrypted: i=1; AJvYcCVhd0X2llZkM2NS+p2rSMKbVptWJlUay9l7MPyuv07Xruwfl9iU6kiSgWSgHIcuc8xkkLX072/67C3FnMOW@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ3TIMcDYBWC4R0FZCYjSqmzvIPuTqtvt1ibn+n6nelhRXqI1O
	XGIlgNut1jSS2iWqUksgUVya7MkLSliu47xTmYaE9fgIiP+vXO62ksvluPrK9gjsROQ0ln8dL9Z
	kPKYDm56SNDtX6zw4fqy4D3ZGGPaJ59amzzQZ0EluRzDFO9U7MLRQ4pDIP5q7JnqdxGmnFFP4uC
	uLEplc4M6Mt2Nr2e21Gs1mgIFBBUKJBGF01H+Zf7N/fMuMq6anEdykFQ==
X-Gm-Gg: AZuq6aKMNSK76ZkViFGBq2WSeRiryurrNKR9860KXci2tAuWVkCqdc1KrX62wpcCXsc
	R+sVK6rwILvvUNEhpR+OSEfq1PzthJ8DxZjDHv7lSuWurEwFpF06WOxD2J82oWLsMmqTeEsAnK6
	cxIrg+0115Gp4pybNyxaa+KdQMcZp4wY8BcyczPJ8GmTBZD+YPCz9Uhv6ZTM85PdhVyKolGEncL
	BZSikwoBbiv3cG7RZ2CbSBgkw==
X-Received: by 2002:a05:6808:4fd1:b0:45f:48a:ac1b with SMTP id 5614622812f47-45f34bb27a1mr665740b6e.20.1769724683748;
        Thu, 29 Jan 2026 14:11:23 -0800 (PST)
X-Received: by 2002:a05:6808:4fd1:b0:45f:48a:ac1b with SMTP id
 5614622812f47-45f34bb27a1mr665726b6e.20.1769724683294; Thu, 29 Jan 2026
 14:11:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251230110225.3655707-1-ekansh.gupta@oss.qualcomm.com>
 <20251230110225.3655707-4-ekansh.gupta@oss.qualcomm.com> <z3tktit6jkxrkre4gm666aw3ql3plyhs6266cu2itrbjbj2das@yjp2pyesoszn>
 <69cb2d42-6672-4c42-935f-e3fff9bf38f8@oss.qualcomm.com>
In-Reply-To: <69cb2d42-6672-4c42-935f-e3fff9bf38f8@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 14:11:12 -0800
X-Gm-Features: AZwV_QgPcy7-OJRCAtUNZO1W2C-9P0rec9RL3k1GibIqwml-6lltb9plG3LOTx0
Message-ID: <CACSVV02ArZQYW0D66wCzcLoegAB+vUODDxfX4Vbt3xpBajRKYg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] misc: fastrpc: Support mapping userspace-allocated buffers
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, srini@kernel.org,
        linux-arm-msm@vger.kernel.org, gregkh@linuxfoundation.org,
        quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
        quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
        arnd@arndb.de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDE2MiBTYWx0ZWRfX7tlEccJc7/D+
 BfgnvucVKu5YBmZWVYWmunjiE/nTF+HDTsvUEhbaQKwoRBpyHOkFS9zUA1akOlQxRDtgTCIfJSJ
 47KRedNOwHLHRoCv1/F/E5zVS+RfjYun0f66+CE8fnWWu45YIkderR8YeFFOPveGXVVn8nl6ZD0
 6nvAD++yaqnoDhjFWp+bRJwsFESuq1olprCkoWKQAoQyiTgH++GgrG2X/MOyMmmR+lsTlv/LHGF
 haFj0GEd44jmJQAc/yql/xW9/WApqmKSLXyX7Dbm2cJs8ukbAOmPyzWRJxrbEM0BV2dsIAwYMWt
 Dj6yLNt7j/Y5HACfSdi2v10T9GdYvUKNM4Xvt0Uu5kbLrI7OPUuK3C8qghi70ZwA0Ftp6s+CebN
 osK3aJ/NAMnRX/b4CJtONMppS+V86mo0KcBzSUd7NHzlsbDP2mqK/adUc+dXos8iBUszH8HP/99
 C1jewcCu1W6tXqCKOqw==
X-Proofpoint-GUID: N_KnuYniBVDpFy_qIXN1frCMHzD5xgpR
X-Proofpoint-ORIG-GUID: N_KnuYniBVDpFy_qIXN1frCMHzD5xgpR
X-Authority-Analysis: v=2.4 cv=dpTWylg4 c=1 sm=1 tr=0 ts=697bdb0c cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=Luqqhlx33GSuvbvJmHQA:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601290162
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91213-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 293C1B5323
X-Rspamd-Action: no action

On Thu, Jan 29, 2026 at 2:39=E2=80=AFAM Ekansh Gupta
<ekansh.gupta@oss.qualcomm.com> wrote:
>
>
>
> On 1/6/2026 8:21 AM, Dmitry Baryshkov wrote:
> > On Tue, Dec 30, 2025 at 04:32:25PM +0530, Ekansh Gupta wrote:
> >> Currently, FastRPC only supports mapping buffers allocated by the
> >> kernel. This limits flexibility for applications that allocate memory
> >> in userspace using rpcmem or DMABUF and need to share it with the DSP.
> > Hmm, for DMABUF we need _import_ support rather than support for mappin=
g
> > of userspace-allocated buffers.
> >
> >> Add support for mapping and unmapping userspace-allocated buffers to
> >> the DSP through SMMU. This includes handling map requests for rpcmem
> >> and DMABUF-backed memory and providing corresponding unmap
> >> functionality.
> > For me this definitely looks like a step back. For drm/accel we are
> > going to have GEM-managed buffers only. Why do we need to handle
> > userspace-allocated buffers here?
> That's correct, GEM-PRIME will handle it properly. Here, the reason to ad=
d this
> change is to enable routing of DSP logs to HLOS which is done by using a =
shared
> buffer between userspace process and DSP PD. The buffer can be allocated =
from
> both fastrpc driver's DMA-BUF or DMABUF heap(eg. system heap).
>
> So this shared buffer is getting mapped to both process's IOMMU device an=
d DSP PD
> with this change.

So, a mmap'd dma-buf is not necessarily pinned.  Or even backed with
pages.  So you wouldn't want to try to map a userspace vaddr from a
dma-buf to the device.

But looking at the patch, this looks more like mapping an imported
dmabuf?  Presumably going thru dma_buf_map_attachment() somewhere in
the existing fastrpc code?

BR,
-R

> >
> >> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> >> ---
> >>  drivers/misc/fastrpc.c | 97 +++++++++++++++++++++++++++++++++++++----=
-
> >>  1 file changed, 86 insertions(+), 11 deletions(-)
> >>
> >> @@ -1989,25 +2020,69 @@ static int fastrpc_req_buf_alloc(struct fastrp=
c_user *fl,
> >>      return err;
> >>  }
> >>
> >> -static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *arg=
p)
> >> +static int fastrpc_req_map_create(struct fastrpc_user *fl,
> >> +                              struct fastrpc_req_mmap req,
> >> +                              char __user *argp)
> >>  {
> >> -    struct fastrpc_req_mmap req;
> >> +    struct fastrpc_map *map =3D NULL;
> >> +    struct device *dev =3D fl->sctx->dev;
> >> +    u64 raddr =3D 0;
> >>      int err;
> >>
> >> -    if (copy_from_user(&req, argp, sizeof(req)))
> >> -            return -EFAULT;
> >> +    err =3D fastrpc_map_create(fl, req.fd, req.size, 0, &map);
> >> +    if (err) {
> >> +            dev_err(dev, "failed to map buffer, fd =3D %d\n", req.fd)=
;
> >> +            return err;
> >> +    }
> >> +
> >> +    err =3D fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
> >> +                              req.vaddrin, &raddr);
> >> +    if (err)
> >> +            goto err_invoke;
> >>
> >> -    if (req.flags !=3D ADSP_MMAP_ADD_PAGES && req.flags !=3D ADSP_MMA=
P_REMOTE_HEAP_ADDR) {
> >> -            dev_err(fl->sctx->dev, "flag not supported 0x%x\n", req.f=
lags);
> >> +    /* update the buffer to be able to deallocate the memory on the D=
SP */
> >> +    map->raddr =3D (u64)raddr;
> > Which type are you converting? And why?
> I'll drop this.
> >
> >>
> >> -            return -EINVAL;
> >> +    /* let the client know the address to use */
> >> +    req.vaddrout =3D raddr;
> >> +    dev_dbg(dev, "mmap OK: raddr=3D%p [len=3D0x%08llx]\n",
> >> +            (void *)(unsigned long)map->raddr, map->size);
> >> +
> >> +    if (copy_to_user(argp, &req, sizeof(req))) {
> >> +            err =3D -EFAULT;
> >> +            goto err_copy;
> >>      }
> >>
> >> -    err =3D fastrpc_req_buf_alloc(fl, req, argp);
> >> +    return 0;
> >> +err_copy:
> >> +    fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
> >> +err_invoke:
> >> +    fastrpc_map_put(map);
> >>
> >>      return err;
> >>  }
> >>
> >> +static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *arg=
p)
> >> +{
> >> +    struct fastrpc_req_mmap req;
> >> +    int err;
> >> +
> >> +    if (copy_from_user(&req, argp, sizeof(req)))
> >> +            return -EFAULT;
> >> +
> >> +    if ((req.flags =3D=3D ADSP_MMAP_ADD_PAGES ||
> >> +         req.flags =3D=3D ADSP_MMAP_REMOTE_HEAP_ADDR)) {
> > Side note: why are these flags not defined in the uABI header?
> Ack. These should be part of uABI. I'll create a separate patch for this.
> >
> >> +            err =3D fastrpc_req_buf_alloc(fl, req, argp);
> >> +            if (err)
> >> +                    return err;
>

