Return-Path: <linux-arm-msm+bounces-102174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPpGK0gH1WnMzgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102174-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:31:52 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5FD3AF2BA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Apr 2026 15:31:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 747D93015171
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2026 13:31:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4C01F37D3;
	Tue,  7 Apr 2026 13:30:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0G0d8Db";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FqMG7MCk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F591288AD
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Apr 2026 13:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775568658; cv=pass; b=IJv7htKJRaFtVZHFiWAT7jeATuzadRzAU+Gde0IoPVEM8eQeAEbXnpHKwr7ZtJ2dDB9PAQ/TyhBRKuT+qJj7dqUZeGHkNGQ1gM9/WHWVdZb0Cyee1k+z6sXmGpvuAcRNBqPwnkyRB9ULd06RJub12WEQk8nR5xniJ0uFSrKh2eE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775568658; c=relaxed/simple;
	bh=6ok4H/A78ZyBw+LzL2iBrCbG8eJHW49PFV8E20QJ7qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mK5PdawylyOKDiKVGaU3hLJklrv0jH9C2yCb4SQC3vIfMoRx5xA0W3VB6yAxDfyyZ1pnEqTxWCcexmndsDVGg1bD9cHWwK/FnkeyosDiCeLJF9dnswwJcnbJH0uYdaDjnVa62K7SCK8/O1O1g07cWYDxFWrSeVaOC6PSfNPxFEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0G0d8Db; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FqMG7MCk; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 637COjvs3816869
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Apr 2026 13:30:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RBu9EXcvfTVBwdBS0Esdcym/TI5NiAgkrKjJnoDtpYA=; b=N0G0d8DbYhV3c59P
	T1u9TCVvMXAyXi9cB6zsmEjLuOcq+M9tPzg8Wwi9WCi+7CwmtWWaTC+pxzpQxYqI
	kwlCtusPZgBy2eSQ8vdze89ruve4QzHhF8lnGs4G/OX7Vdd7cfvusS1/jXgmLtbS
	7wnvi/AFV1EZ07xWost4dpRWZJTMgiEPF/THuvkTlwYrGEa4x8am1zzdatko4vcn
	lEr1oHw4QaD9O/sN+8YIAFie4pK20qY1DbXvyoaZN8gpbZQDrHc7igf7b4BDHq5I
	xFX+Nt/m5mDEIaluoguhoOb/+Enzf/5O44GkanpsAGJWI2ecSKDKx8vBQwufCGC2
	MXX0zA==
Received: from mail-yx1-f71.google.com (mail-yx1-f71.google.com [74.125.224.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dcmr4tx0s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 13:30:56 +0000 (GMT)
Received: by mail-yx1-f71.google.com with SMTP id 956f58d0204a3-6505ef93ffbso5577958d50.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Apr 2026 06:30:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775568655; cv=none;
        d=google.com; s=arc-20240605;
        b=I+Hy/Pou9Go3IgLHlZ44Vmv6rrRb46dyLnv06hw1vq28KoG6LZzjznT8YuiXFE17xf
         bo5w9+AhgFpMWQs5vV/VfBHRrYg88M6pnrUPsjYY09FCpGy2ja38oqSxwEj+7qMTts/d
         89pKC0LfrLaCKN50Slxzud2km6hdPmD45WFt7XCv5e4ghC6VCJ3w/mck7lvf7SPi5GoF
         9EZNw9KLPCWJ3xNzsfskpHWxPt7w7RMz5M6AnzxSpVsyQNJ2BHL/mE4AkUnoedQSJWj/
         08kacyBTL3PYv0R7XNNe+5PwaBOjx50SFCdef81Mt0setLNz8DDAmqERZQWERIEBLVtx
         sWLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RBu9EXcvfTVBwdBS0Esdcym/TI5NiAgkrKjJnoDtpYA=;
        fh=jRsXY2erJuA2BOLGE2kDel9KfDLnW1Fe0DQNjIOu51o=;
        b=h+MggwOyPsztE214C2Gva9mO2EHebG2l2fa0RmqZ/OxsiCjSjZsX5CMhSiQEhU2aP/
         SCW/+ZC9nU5tUIFzpt/JmL3F4iERFdIdzlMkFawkB1tUw9yQ53y+lr4Ug/xTjvY08eUK
         JOaqYp3dq0IZYzrbse6mZCCbPyb/7H5Y62iKmKPyMjewCH8soR2KMA/V9EtmsdE/Lvmb
         ryKXxp+EfuZiQoPilArDZl0UbQimEm0rU9tKyeplWxJc675FsBmWvZbPB1INzvOgG7ky
         loy1PEe9PSnjWZorvxj2krOGV9ChWLWRYdIzSks3dI7OzHNHvcB8HGZs8OoHKjSv8EwA
         oLFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775568655; x=1776173455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RBu9EXcvfTVBwdBS0Esdcym/TI5NiAgkrKjJnoDtpYA=;
        b=FqMG7MCkK/vnnIi7C5qH9B88pkmFNsHkgS/2lhrEwyA4wqJ41tcPzjfqmJNenCoRBJ
         eQHKgeUTlrFNwTFGtInSzBek8sZlPVr5AidRWtaeUS3SEVF2AXAK23MEmPt+3/sjV8zg
         DSH6ZKleKlxxa6rlpww3BmU4b0fzG5C1q40TXpoekTQtPVpucYe1X61iqjkspRW3NBOW
         2D8EpgpIoBTnRicU2qUHNq98hyQJoLMt5ZpRYiM8SYuzErgXVCVTy/RpagFABWpWRJBP
         zLlEhtLrp2tutifaXDp7UDAV+PI3OoJVC2t3N6MLEh53KmTU/BEG725JpWIk0ekwNfbO
         444A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775568655; x=1776173455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RBu9EXcvfTVBwdBS0Esdcym/TI5NiAgkrKjJnoDtpYA=;
        b=WW9V64E0FHWZ2/3QBn9Nhvf2jY8zyrygm4wApHVRGEOgtpIvIkuR8tF3kPPzby1XUg
         THG/6jSE1JuJ9AOVXaORJey0W3Vwb8aRfaTsIfzm2eIxZPZpElVpefvNeQekS6teiiZ2
         MkvBjJW5v8YCnamo+IbLxzQpm2QODvbMk8SeyFGytC3ATeY4exQUzNd2PXK8NtdfPWLN
         AP+e4W+sIqXZPh2isEQL8ZZbMu9OI6ef2LH9UGxQwqFVzZIrkFVtal5oPRdv7QNKpZ/5
         5ZoHB5AImJuQ8cUSYuPkqMshKj7smm4q11ULCE8WJPI6xTLb3jb6hfRl2CBOLV99/Rk2
         qiyA==
X-Forwarded-Encrypted: i=1; AJvYcCWglLgWvuqtmNQexH2iPZlVKR5Kh0F92N1R43gXdc28RD+V7q/m8rN9U14daoAvQEfOfdupdI5oI187gloJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp9Zs7BolTH3Na7JRSnigQeFEGEkRor9Bvdo9Ts126Wyk6QC5B
	QRZ4NhatT+RqCSUJ/miVHF+PvdN+Sm39Sjf/QfV0rKk971elUGeOWuBnSl+mS3w4O3Tc+ESQONE
	CO+wrOqIUM+YEX07U3+xyu4TZB4jmkysybQ8uovtgha2iv/QIKTMmzA2ZruyZDKHFhBzPeCJq1X
	Z1dV1b3RLiV28q1N7VnqT2UNQABGCxUC5s6yPa9L3jSHw=
X-Gm-Gg: AeBDies9XiebQ/E9r4fNHDdWxRrRogH1nJVjkpYA4a8nafO97ge3qnSAaOeW/Lm7tIk
	luF37ydzBJf1ENaV7Bqd6B4HGklKj4jwmdeYwvd1d+6yKj8RrpNErmMZb4jBopq+7QahG1n94YK
	2YRmQ9CfFTjpBbmMCHwR7Kr6lIDmzwztCrdmSeg0CCwiJSBlT49IUTBuPiAk/61eI+RIWGue0xh
	HPqtjK3CZnVyAGCPIspmOAXspX1j4OlmI7kQi8=
X-Received: by 2002:a05:690e:1902:b0:64c:e789:4397 with SMTP id 956f58d0204a3-65048698fbemr16755090d50.10.1775568654896;
        Tue, 07 Apr 2026 06:30:54 -0700 (PDT)
X-Received: by 2002:a05:690e:1902:b0:64c:e789:4397 with SMTP id
 956f58d0204a3-65048698fbemr16754990d50.10.1775568654023; Tue, 07 Apr 2026
 06:30:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407-camss-rdi-fix-v3-0-08f72d1f3442@kernel.org> <20260407-camss-rdi-fix-v3-5-08f72d1f3442@kernel.org>
In-Reply-To: <20260407-camss-rdi-fix-v3-5-08f72d1f3442@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 7 Apr 2026 15:30:42 +0200
X-Gm-Features: AQROBzA_LvXeAkvS_aQxZuX5tek0ZSvAzp2tpf4m_l3i-V-nzuLhNv461BiH2MI
Message-ID: <CAFEp6-0Xj_evmeKXX+1yXaULL65eemhfRiFjMrQfZcwELiK7Jg@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] media: qcom: camss: csid: Rename en_vc to en_port
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
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=dO6WXuZb c=1 sm=1 tr=0 ts=69d50710 cx=c_pps
 a=ngMg22mHWrP7m7pwYf9JkA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=1FwFdbLlwGuMXyfPU3wA:9 a=QEXdDO2ut3YA:10 a=yHXA93iunegOHmWoMUFd:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: fwWUQ3MH-0jQfvleefLpW_Uf0jZ3lZYf
X-Proofpoint-ORIG-GUID: fwWUQ3MH-0jQfvleefLpW_Uf0jZ3lZYf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA3MDEyNiBTYWx0ZWRfXyJDMgcWhrTWa
 UKKc634vqI1yxm13RSkx+TURVqxbJvgrT1ibkrVl22lh56P9Q9ybfoTrFFzp/PTmX8Tew6ibLe/
 COYuRjKmkur6EeKKsUQnNOv0Xm+ZEEYskZbgoVtfXIATpM1f/5TafrhNx1ztdUNPd7JA570DwGq
 c13OvqoxMLoANeBR35CGbff1I8eLHcBUMdsPIYwI6Y7z5Q98W2J6d6uqu4AzbUtay3GlF/txYnT
 U98Dvf9lyd39YOUyjC4zrgCX2YFcTtlv77hYjwq96ajyIjV93Hxz5Co4hZDcKj9VvmYI4KhpCMY
 7++D7afOYApdEJ6h4yLTk7Nn9IykBtE0fgBIkjYE2QP0lE2A22L0QCQEaBBVM70DXx/yrFSfci/
 7xDJZu0WeYF7Y23aEROH5QcZg3OBVph4ync/aKAU1811RL3Tbf4xYGnZeU6m2Qty73zsnTxrj7V
 4+WrPVeIm2Nj0fWIXpQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-07_02,2026-04-07_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604070126
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102174-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,oss.qualcomm.com:dkim,mail.gmail.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Queue-Id: 9A5FD3AF2BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 7, 2026 at 12:35=E2=80=AFPM <bod@kernel.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> The en_vc mask has always also been an en_port mask. Name the variable fo=
r
> what it does a bitmask of ports. When implementing v4l2 subdev streams it
> probably makes more sense to have tuples for port/vc mappings. Such a
> change right now feels like putting the cart before the horse.
>
> Sanitise the name in the interregnum.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-csid-340.c  |  2 +-
>  drivers/media/platform/qcom/camss/camss-csid-680.c  |  2 +-
>  drivers/media/platform/qcom/camss/camss-csid-gen2.c |  4 ++--
>  drivers/media/platform/qcom/camss/camss-csid-gen3.c |  6 +++---
>  drivers/media/platform/qcom/camss/camss-csid.c      | 10 +++++-----
>  drivers/media/platform/qcom/camss/camss-csid.h      |  2 +-
>  6 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-340.c b/drivers=
/media/platform/qcom/camss/camss-csid-340.c
> index 0231985746edf..6827d76bef5dc 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-340.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-340.c
> @@ -120,7 +120,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>
>         /* Loop through all enabled ports and configure a stream for each=
 */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
> -               if (csid->phy.en_vc & BIT(i)) {
> +               if (csid->phy.en_port & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers=
/media/platform/qcom/camss/camss-csid-680.c
> index edf01ba79907d..e530639456ee1 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -292,7 +292,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>
>         /* Loop through all enabled ports and configure a stream for each=
 */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++) {
> -               if (csid->phy.en_vc & BIT(i)) {
> +               if (csid->phy.en_port & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
>                         __csid_ctrl_rdi(csid, enable, i);
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen2.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen2.c
> index eadcb2f7e3aaa..0e0c44d118a59 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen2.c
> @@ -329,7 +329,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>
>         /* Loop through all enabled ports and configure a stream for each=
 */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> -               if (csid->phy.en_vc & BIT(i)) {
> +               if (csid->phy.en_port & BIT(i)) {
>                         if (tg->enabled)
>                                 __csid_configure_testgen(csid, enable, i,=
 0);
>
> @@ -370,7 +370,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>
>         /* Read and clear IRQ status for each enabled RDI channel */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> -               if (csid->phy.en_vc & BIT(i)) {
> +               if (csid->phy.en_port & BIT(i)) {
>                         val =3D readl_relaxed(csid->base + CSID_CSI2_RDIN=
_IRQ_STATUS(i));
>                         writel_relaxed(val, csid->base + CSID_CSI2_RDIN_I=
RQ_CLEAR(i));
>                 }
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen3.c
> index ed5c5766efd36..cb6ca470dafa8 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -215,7 +215,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>
>         /* Loop through all enabled ports and configure a stream for each=
 */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> -               if (csid->phy.en_vc & BIT(i)) {
> +               if (csid->phy.en_port & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
>                         __csid_ctrl_rdi(csid, enable, i);
> @@ -263,7 +263,7 @@ static irqreturn_t csid_isr(int irq, void *dev)
>
>         /* Read and clear IRQ status for each enabled RDI channel */
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> -               if (csid->phy.en_vc & BIT(i)) {
> +               if (csid->phy.en_port & BIT(i)) {
>                         val =3D readl(csid->base + CSID_CSI2_RDIN_IRQ_STA=
TUS(i));
>                         writel(val, csid->base + CSID_CSI2_RDIN_IRQ_CLEAR=
(i));
>
> @@ -309,7 +309,7 @@ static int csid_reset(struct csid_device *csid)
>         writel(1, csid->base + CSID_TOP_IRQ_MASK);
>
>         for (i =3D 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
> -               if (csid->phy.en_vc & BIT(i)) {
> +               if (csid->phy.en_port & BIT(i)) {
>                         writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
>                                csid->base + CSID_BUF_DONE_IRQ_CLEAR);
>                         writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/med=
ia/platform/qcom/camss/camss-csid.c
> index ed1820488c987..71a40c2cb350b 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid.c
> @@ -1278,21 +1278,21 @@ static int csid_link_setup(struct media_entity *e=
ntity,
>                 csid->phy.lane_cnt =3D lane_cfg->num_data;
>                 csid->phy.lane_assign =3D csid_get_lane_assign(lane_cfg);
>         }
> -       /* Decide which virtual channels to enable based on which source =
pads are enabled */
> +       /* Decide which ports to enable based on which source pads are en=
abled */
>         if (local->flags & MEDIA_PAD_FL_SOURCE) {
>                 struct v4l2_subdev *sd =3D media_entity_to_v4l2_subdev(en=
tity);
>                 struct csid_device *csid =3D v4l2_get_subdevdata(sd);
>                 struct device *dev =3D csid->camss->dev;
>
>                 if (flags & MEDIA_LNK_FL_ENABLED)
> -                       csid->phy.en_vc |=3D BIT(local->index - 1);
> +                       csid->phy.en_port |=3D BIT(local->index - 1);
>                 else
> -                       csid->phy.en_vc &=3D ~BIT(local->index - 1);
> +                       csid->phy.en_port &=3D ~BIT(local->index - 1);
>
>                 csid->phy.need_vc_update =3D true;
>
> -               dev_dbg(dev, "%s: Enabled CSID virtual channels mask 0x%x=
\n",
> -                       __func__, csid->phy.en_vc);
> +               dev_dbg(dev, "%s: Enabled CSID ports mask 0x%x\n",
> +                       __func__, csid->phy.en_port);
>         }
>
>         return 0;
> diff --git a/drivers/media/platform/qcom/camss/camss-csid.h b/drivers/med=
ia/platform/qcom/camss/camss-csid.h
> index aedc96ed84b2f..b227923ca5c15 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid.h
> +++ b/drivers/media/platform/qcom/camss/camss-csid.h
> @@ -68,7 +68,7 @@ struct csid_phy_config {
>         u8 csiphy_id;
>         u8 lane_cnt;
>         u32 lane_assign;
> -       u32 en_vc;
> +       u32 en_port;
>         u8 need_vc_update;
>  };
>
>
> --
> 2.52.0
>

