Return-Path: <linux-arm-msm+bounces-92285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMj0F4PWiWnZCAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:43:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A875110EE38
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Feb 2026 13:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BB1A93023379
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Feb 2026 12:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E87C372B40;
	Mon,  9 Feb 2026 12:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="S2fEhG4H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i4qoXwnn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4718123A566
	for <linux-arm-msm@vger.kernel.org>; Mon,  9 Feb 2026 12:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770640970; cv=pass; b=Pucaq5eY89AvugGtBeReEXURsrhNuxac/2MenTyPbS5VRFs80qEfiXnmqcGrC23fnqKdzdAU/CY+R60+GG4R7S/tcMHKTYPE1jH9rC37AA0ZDO80tlP2dtLepsi+9+CQX7X4NvmBWbaYnQJGtChAGrs6KHoaT+2Au/k3NVfqit0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770640970; c=relaxed/simple;
	bh=1YAPMat3fgMYTPI9lsT4WpJJ+YO7j5j7QhykCTiO9ck=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CmHoK+naGc7QGTv5n9im2dS1YBUOfdhPwhB0VWGBdPJNXQCBn7GMlkmEWYN2qWSvhklRzF+Haq4vASCkT+WIGX3qCfx9xJPO0k92LdvHjkTCphIV3+PHj+Yj5+j1ImIFdqwtNiBlD6afaGocD0DzrYNa1REQlOZBI8pvrFysKuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=S2fEhG4H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i4qoXwnn; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 619AqsBp3454168
	for <linux-arm-msm@vger.kernel.org>; Mon, 9 Feb 2026 12:42:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4HXOdUncAgw8qzJsoTSeySMYtHEC/kLDp+/WjXf/xvc=; b=S2fEhG4H8sMcdrTh
	FqXnPs1I5xUqwgGJSxlfWg3+yq9FcX0Qi9XO7JzNliDrr0g3H78hxshFeN6i8Jt0
	3JfjAphMhIgDlepocULF72EsgGYuNu8SUcX7+sfWWlUvHC4yLwtmiC8FesSLSqxE
	AIkgBVCf48JLPtddcB4K/hF1NcedQdBmawgLrde3gpM59gi+SJlAFenOE5jsZRqU
	laDu2385LSPRGB0Zz7xfd+gNWY63/YKykdXBOLTYy3BX3DTsUJEQj6EEBfogJZp8
	xfZ5EbQ9HpALMouw8O/yr/LmRQTCS0q8UPvwsssVWo6sw+OllkqCX85/OzaKqr+a
	SZ4V0Q==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c7e7g8a3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 12:42:49 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2ba8013a9e3so421606eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Feb 2026 04:42:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770640968; cv=none;
        d=google.com; s=arc-20240605;
        b=CTiRzntrtvWDNxu2TMLhmBC9rB06E6HYSNog9ShXVz2nYdlzvRCGEvBv28sgrlZLnl
         5cXGt0uhfWOPmZ6eGyqcv6IbLj+AEGk+t2pKFNCxnf/SR1mINRjWbs7S8oGk/V7ysNWq
         3X4z52GEZc0BwIIU9JkGQep9qIAVlZvmMy9obnSFt17ilxXb0rX/F3W0/RbTHjr0lt3x
         FvKJbXJh05aA9RvaXPXNsEnOjmcB1cM49arEdQH/wa+zECYDb4WYiIFp3qK/mNN7NeMs
         rJNDJq95c91lJ34P66Us+w5so2JOrhNGWjlRS5A0X/Jor6GO2wrGkxVokRAa9rvLDIO7
         kldg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4HXOdUncAgw8qzJsoTSeySMYtHEC/kLDp+/WjXf/xvc=;
        fh=+h3Kcs4X+3mFUGvXl7ISkziVRKIYAKAroID+xOLRtw0=;
        b=lJyv2BguHrWFJeIFVQBdDP3JAwmPi1//APj5/eqJt7x3yh23QmYOKDnijNT6dmX62q
         zHktLiwvel574jPFyIMDJy6VbrkY9vv2Jp8bxGfNV3u54XbNLb3XYQeaPbB0b2A0zbjK
         tM3sXNsbGsLLpAx8ekjAFRQ8ohodMVm9IC8LDyDwj2Hcr4RgzYO6N8drOpl86qwQgNJC
         IqdcS66RO++sY2WnFkat4USPUJw28VtWsoWejjqdBw8f+wOdIB9UmvWJYAdjO1FIjgDZ
         lz8nh6PXe1IH85bNEEM1pnsjoR4BMhe0Swn6MeMqswEHmXGewylNp3ZsJESLlLiuVHVV
         Ogdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770640968; x=1771245768; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4HXOdUncAgw8qzJsoTSeySMYtHEC/kLDp+/WjXf/xvc=;
        b=i4qoXwnnJh05Pi5z3tfQ7Rw9tOF+I4resdhn0L8J/UWZaw2rjkdyGLajTPMGptvZHS
         vrWhlDuHi1NmzlSzC3WJZdhwvTwf9PGGLc0BvQdTdrwmtKvjbpBuG71EmqmPtLvsj7ou
         l4itBNBleCIRlI6fLKmblSIyyf4tfl9e3wWsAynoGzomqGsSN4kk9wQ8iM4dJ1aOMreB
         3yqoDDdVwbO1b1bL97vhNiAq3H3eywZWPxpjk39gaugA2xZul9vJWJha0tYyJJ6YGpfq
         pntlk8bejF1yV/tKZuNkwLt/Y5fc67vlz1smqMVstOlWkghnxbIdl0btmLHzhOZ5Qlpf
         9ceQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770640968; x=1771245768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4HXOdUncAgw8qzJsoTSeySMYtHEC/kLDp+/WjXf/xvc=;
        b=rdlvlbxvUc+fcdDk1jESe5Hg9BR8Y1ejlvFwLxoldHE2espf7Zvx78HtiTBbupyzeX
         un52eGUtShCeV8Gh9Bmf/NOrvQlm++/PcqT7GDBpN7dagVyE7aCbvT1MgI9Z4tH6R7+5
         fBfvjGC7h4eRcdCMtY55hvL4aF/dqvBGBCZ0XPnx82kHtf6XGAMTx6kATd7m532cVrg/
         WaiVL9vf9jeiKjugzgQtF9H5XQ0FQ3juZqWTJom3CmW0hhHXaBqIi9Xc/uA6lV2T5CCO
         d4rIvlHef+M49cYZl/Ts/o5AMgvUvcRnmZNWkL1LTrLOdnm//Y6brempr5nIBHikYTZJ
         fC2A==
X-Forwarded-Encrypted: i=1; AJvYcCVH62QinezjB/WpCl9eDJSWnKoZO1POidnUajvkhU3f5kSrEpusHtoymm0wQ84E/5in/rUOT3qdjuwPBolz@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9R9HuMuvgzXEoDd5eIyVXBLj3DpgQu3g6ApCgsqSAYAkRqxwd
	IrAoGSUJEFfEsw5QAM/CZlQj9JCa/MKQ4enL79suWrTXnhXFmOatGDYprxuCcLOmlbIaKHJ9q9t
	PLZFScuzb712lkxn/810Q4DqtUlrL6NNREfgNZCubLb5QTZM5RkiXi0ermNreYzVuXFbnu8BXGL
	OIgdCgqEOWCiQY0YUjn//EW1fPvKAmpl9wrUsmtzPMkGw4z99gy7BTDQ==
X-Gm-Gg: AZuq6aLKqRlYZxGwh21StwbE5FugIpArLX3jlTg7uOJr+dUhgVOPSiZLmL3aPLIyLY0
	G9EiA4F+1Al8rmPWzAqST7jJV2bpqO1XaYngqaE9bvtHrSmTbEgD/+VndykaJZ7BlnbN160IHRO
	XW4flaxmzwzfxEsBJNbYKe7Um4BIjwnqSiEPkFkOBm73CG6CW+X1I3orin2JhQbp5OmDw2
X-Received: by 2002:a05:7300:e410:b0:2b7:ee0e:e9ca with SMTP id 5a478bee46e88-2b85647b551mr4807557eec.13.1770640967825;
        Mon, 09 Feb 2026 04:42:47 -0800 (PST)
X-Received: by 2002:a05:7300:e410:b0:2b7:ee0e:e9ca with SMTP id
 5a478bee46e88-2b85647b551mr4807543eec.13.1770640967266; Mon, 09 Feb 2026
 04:42:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203080712.15480-1-manivannan.sadhasivam@oss.qualcomm.com>
In-Reply-To: <20260203080712.15480-1-manivannan.sadhasivam@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Mon, 9 Feb 2026 18:12:35 +0530
X-Gm-Features: AZwV_QhQGrhmiXiesmhxlG4WV4s55cvRqMlCM-CccbSkZMO1A1Xt1ut2g-2JQXI
Message-ID: <CAGptzHOfmrHeJWvMxWj_xUTt_Xn-WGX04oc5s7DvjujPUOWQZQ@mail.gmail.com>
Subject: Re: [PATCH] soc: qcom: ice: Remove platform_driver support and expose
 as a pure library
To: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        mani@kernel.org, stable@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: -SZDVvk8ji6GBFh6g8WwUW6UK2sJOzmb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA5MDEwNiBTYWx0ZWRfX5Sukb2v7WnhF
 4+fpbksnQelFo3P5/i0/gqGn8gZ31vldMkznnX0/PX3FNd9OG6RA2+LLpRkAbj+4WbOpGJRMVEq
 BCA0N4RYH2Ux51eaUjgGRgggg0thWKYMHqsD2u42BZiEjfKO1ws/lWGGrPp5A9NplMy9FEbRdgl
 Ly29S8P9dYjHy5jJOy3LIELliopL7fqIZWC4lsjJG4e9YviNh+koeDY61vFG30bev1TlIcAirnn
 p4QaAryTDJI+W68yeYnJ0hGNwso1iSljghdS9tUdXIuPAlLxReMUXZHLyD+XDlfC+MsdZydEn1W
 aNjl1/uwFC1c8rgj+G3ouf1hSOCMP36b+xamUt74N8s8hFO6rgY+XFBGjohAriEywKDVcRt6GEK
 0Cn8NcMEnplU8IMH4vrcqA0H0XzlYvQffGSMRtwMJybaWcohkjwFl0K/Yln489SBHJh65/lNukR
 R3ml6YWfJVisuEiK5JQ==
X-Authority-Analysis: v=2.4 cv=GMMF0+NK c=1 sm=1 tr=0 ts=6989d649 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=9JMtb3v2HZz85qpu0UYA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: -SZDVvk8ji6GBFh6g8WwUW6UK2sJOzmb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-08_05,2026-02-09_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 adultscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602090106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92285-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: A875110EE38
X-Rspamd-Action: no action

Hi Mani,

On Tue, Feb 3, 2026 at 1:37=E2=80=AFPM Manivannan Sadhasivam
<manivannan.sadhasivam@oss.qualcomm.com> wrote:
>
> The current platform driver design causes probe ordering races with clien=
ts
> (UFS, eMMC) due to ICE's dependency on SCM firmware calls. If ICE probe
> fails (missing ICE SCM or DT registers), devm_of_qcom_ice_get() loops wit=
h
> -EPROBE_DEFER, leaving clients non-functional even when ICE should be
> gracefully disabled. devm_of_qcom_ice_get() cannot know if the ICE driver
> probe has failed due to above reasons or it is waiting for the SCM driver=
.
>
> Moreover, there is no devlink dependency between ICE and client drivers
> as 'qcom,ice' is not considered as a DT 'supplier'. So the client drivers
> have no idea of when the ICE driver is going to probe.
>
> To avoid all this hassle, remove the platform driver support altogether a=
nd
> just expose the ICE driver as a pure library to client drivers. With this
> design, when devm_of_qcom_ice_get() is called, it will check if the ICE
> instance is available or not. If not, it will create one based on the ICE
> DT node, increase the refcount and return the handle. When the next clien=
t
> calls the API again, the ICE instance would be available. So this functio=
n
> will just increment the refcount and return the instance.
>
> Finally, when the client devices get destroyed, refcount will be
> decremented and finally the cleanup will happen once all clients are
> destroyed.
>
> For the clients using the old DT binding of providing the separate 'ice'
> register range in their node, this change has no impact.
>
> Cc: stable@vger.kernel.org
> Cc: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Reported-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> Fixes: 2afbf43a4aec ("soc: qcom: Make the Qualcomm UFS/SDCC ICE a dedicat=
ed driver")
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.=
com>
> ---
>  drivers/soc/qcom/ice.c | 100 ++++++++++++++++-------------------------
>  1 file changed, 39 insertions(+), 61 deletions(-)
>

Thanks for this change but we need to avoid building ICE as a module
too and return error code when ICE SCM calls aren't present.

So following diff on top of this patch works for me, feel free to
incorporate it in your patch:

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 2caadbbcf830..db528104488b 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -283,7 +283,7 @@ config QCOM_ICC_BWMON
          memory throughput even with lower CPU frequencies.

 config QCOM_INLINE_CRYPTO_ENGINE
-       tristate
+       bool
        select QCOM_SCM

 config QCOM_PBS
diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
index 8640e05becd1..139891a122db 100644
--- a/drivers/soc/qcom/ice.c
+++ b/drivers/soc/qcom/ice.c
@@ -563,7 +563,7 @@ static struct qcom_ice *qcom_ice_create(struct device *=
dev,

        if (!qcom_scm_ice_available()) {
                dev_warn(dev, "ICE SCM interface not found\n");
-               return NULL;
+               return ERR_PTR(-EOPNOTSUPP);
        }

        engine =3D devm_kzalloc(dev, sizeof(*engine), GFP_KERNEL);

-Sumit

> diff --git a/drivers/soc/qcom/ice.c b/drivers/soc/qcom/ice.c
> index b203bc685cad..b5a9cf8de6e4 100644
> --- a/drivers/soc/qcom/ice.c
> +++ b/drivers/soc/qcom/ice.c
> @@ -107,12 +107,16 @@ struct qcom_ice {
>         struct device *dev;
>         void __iomem *base;
>
> +       struct kref refcount;
>         struct clk *core_clk;
>         bool use_hwkm;
>         bool hwkm_init_complete;
>         u8 hwkm_version;
>  };
>
> +static DEFINE_MUTEX(ice_mutex);
> +struct qcom_ice *ice_handle;
> +
>  static bool qcom_ice_check_supported(struct qcom_ice *ice)
>  {
>         u32 regval =3D qcom_ice_readl(ice, QCOM_ICE_REG_VERSION);
> @@ -599,8 +603,8 @@ static struct qcom_ice *qcom_ice_create(struct device=
 *dev,
>   * This function will provide an ICE instance either by creating one for=
 the
>   * consumer device if its DT node provides the 'ice' reg range and the '=
ice'
>   * clock (for legacy DT style). On the other hand, if consumer provides =
a
> - * phandle via 'qcom,ice' property to an ICE DT, the ICE instance will a=
lready
> - * be created and so this function will return that instead.
> + * phandle via 'qcom,ice' property to an ICE DT node, then the ICE insta=
nce will
> + * be created if not already done and will be returned.
>   *
>   * Return: ICE pointer on success, NULL if there is no ICE data provided=
 by the
>   * consumer or ERR_PTR() on error.
> @@ -611,11 +615,12 @@ static struct qcom_ice *of_qcom_ice_get(struct devi=
ce *dev)
>         struct qcom_ice *ice;
>         struct resource *res;
>         void __iomem *base;
> -       struct device_link *link;
>
>         if (!dev || !dev->of_node)
>                 return ERR_PTR(-ENODEV);
>
> +       guard(mutex)(&ice_mutex);
> +
>         /*
>          * In order to support legacy style devicetree bindings, we need
>          * to create the ICE instance using the consumer device and the r=
eg
> @@ -631,6 +636,16 @@ static struct qcom_ice *of_qcom_ice_get(struct devic=
e *dev)
>                 return qcom_ice_create(&pdev->dev, base);
>         }
>
> +       /*
> +        * If the ICE node has been initialized already, just increase th=
e
> +        * refcount and return the handle.
> +        */
> +       if (ice_handle) {
> +               kref_get(&ice_handle->refcount);
> +
> +               return ice_handle;
> +       }
> +
>         /*
>          * If the consumer node does not provider an 'ice' reg range
>          * (legacy DT binding), then it must at least provide a phandle
> @@ -643,41 +658,43 @@ static struct qcom_ice *of_qcom_ice_get(struct devi=
ce *dev)
>
>         pdev =3D of_find_device_by_node(node);
>         if (!pdev) {
> -               dev_err(dev, "Cannot find device node %s\n", node->name);
> +               dev_err(dev, "Cannot find ICE platform device\n");
> +               platform_device_put(pdev);
>                 return ERR_PTR(-EPROBE_DEFER);
>         }
>
> -       ice =3D platform_get_drvdata(pdev);
> -       if (!ice) {
> -               dev_err(dev, "Cannot get ice instance from %s\n",
> -                       dev_name(&pdev->dev));
> +       base =3D devm_platform_ioremap_resource(pdev, 0);
> +       if (IS_ERR(base)) {
> +               dev_warn(&pdev->dev, "ICE registers not found\n");
>                 platform_device_put(pdev);
> -               return ERR_PTR(-EPROBE_DEFER);
> +               return base;
>         }
>
> -       link =3D device_link_add(dev, &pdev->dev, DL_FLAG_AUTOREMOVE_SUPP=
LIER);
> -       if (!link) {
> -               dev_err(&pdev->dev,
> -                       "Failed to create device link to consumer %s\n",
> -                       dev_name(dev));
> +       ice =3D qcom_ice_create(&pdev->dev, base);
> +       if (IS_ERR(ice)) {
>                 platform_device_put(pdev);
> -               ice =3D ERR_PTR(-EINVAL);
> +               return ice_handle;
>         }
>
> -       return ice;
> +       ice_handle =3D ice;
> +       kref_init(&ice_handle->refcount);
> +
> +       return ice_handle;
>  }
>
> -static void qcom_ice_put(const struct qcom_ice *ice)
> +static void qcom_ice_put(struct kref *kref)
>  {
> -       struct platform_device *pdev =3D to_platform_device(ice->dev);
> -
> -       if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
> -               platform_device_put(pdev);
> +       platform_device_put(to_platform_device(ice_handle->dev));
> +       ice_handle =3D NULL;
>  }
>
>  static void devm_of_qcom_ice_put(struct device *dev, void *res)
>  {
> -       qcom_ice_put(*(struct qcom_ice **)res);
> +       const struct qcom_ice *ice =3D *(struct qcom_ice **)res;
> +       struct platform_device *pdev =3D to_platform_device(ice->dev);
> +
> +       if (!platform_get_resource_byname(pdev, IORESOURCE_MEM, "ice"))
> +               kref_put(&ice_handle->refcount, qcom_ice_put);
>  }
>
>  /**
> @@ -713,42 +730,3 @@ struct qcom_ice *devm_of_qcom_ice_get(struct device =
*dev)
>         return ice;
>  }
>  EXPORT_SYMBOL_GPL(devm_of_qcom_ice_get);
> -
> -static int qcom_ice_probe(struct platform_device *pdev)
> -{
> -       struct qcom_ice *engine;
> -       void __iomem *base;
> -
> -       base =3D devm_platform_ioremap_resource(pdev, 0);
> -       if (IS_ERR(base)) {
> -               dev_warn(&pdev->dev, "ICE registers not found\n");
> -               return PTR_ERR(base);
> -       }
> -
> -       engine =3D qcom_ice_create(&pdev->dev, base);
> -       if (IS_ERR(engine))
> -               return PTR_ERR(engine);
> -
> -       platform_set_drvdata(pdev, engine);
> -
> -       return 0;
> -}
> -
> -static const struct of_device_id qcom_ice_of_match_table[] =3D {
> -       { .compatible =3D "qcom,inline-crypto-engine" },
> -       { },
> -};
> -MODULE_DEVICE_TABLE(of, qcom_ice_of_match_table);
> -
> -static struct platform_driver qcom_ice_driver =3D {
> -       .probe  =3D qcom_ice_probe,
> -       .driver =3D {
> -               .name =3D "qcom-ice",
> -               .of_match_table =3D qcom_ice_of_match_table,
> -       },
> -};
> -
> -module_platform_driver(qcom_ice_driver);
> -
> -MODULE_DESCRIPTION("Qualcomm Inline Crypto Engine driver");
> -MODULE_LICENSE("GPL");
> --
> 2.51.0
>

