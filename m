Return-Path: <linux-arm-msm+bounces-118750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id DALTJUbOVGpJfAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118750-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:38:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E34AC74A6F1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 13:38:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iOr+AUS8;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=errtHx53;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118750-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118750-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 94BE630AA689
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jul 2026 11:36:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73A253E8357;
	Mon, 13 Jul 2026 11:36:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3B5F3EA955
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:36:11 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783942573; cv=pass; b=DseVTEGYSH9QGOXW5EdwiUPw/AMg6PzXRjZ+AHQY4HwOPYr1FNWLotBcSh91Qv8s84lBKzFrJPJ5HUCQP7Lp5d73Q/YTnZoWmbSyxdDqjTqmgN9GrP9tIYgiVdaIYgBumao5/FWMm2dO8LS75fvkraPdMLD+oLgeQFo6Eo1AwnY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783942573; c=relaxed/simple;
	bh=1qZ8Ve4Jn/7mGv4WO4K1szK0MsIRHTBTV88WgM6jRkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JYjOZR/t6nOFQUqSIw8TAnXFJsdCfAdg+0LUgvupk6iVOgCKlettQDliLWZca0dk+EUA3UF3NjQBTzQBPV7frzVCYbvuLjB5LArToFIx7XS3zMBwhXWwR4s40L05AdUC36deNhX/OzNExq3p4p9mRygZ9uKPyWQeX6Ltr1Jggf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iOr+AUS8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=errtHx53; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D9drct955819
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0oiCD99k36u3eESQ8rlDWdjtm2XbS/KRfOzUv69JEWE=; b=iOr+AUS8x7T/kinR
	R/g6T+KItavjDRbZ/YpS1tYQrHyiknSCTh893NXyDbRBdQDYTDQVTvWKEcLIfJsL
	o4xtj5EFhKdNtfCXfF8aO4UWUthlI6cdldANtw4kHDAmi95wWDH9DKNJ6SgjzedG
	5gosYmv2oVcVXmuL7dUBhzYobnFONLZh24wzyNvItlfyuGYFUk7zsSETKnHOFE0L
	KHmlPLcDCfJrLgTlKy/IBTtV+oEZUYcImLmJs+5q1lLz65Bf89y5KVmqh2z5KjLv
	zBZ6sKDAl8EAg8aQSqC9l/2MdgIRACjBqflT8w61w9FCg90HK1m7LGwyt1DnkUBm
	fgThdA==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwk9rd3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 11:36:10 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7f582244e9eso95873397b3.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 04:36:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783942570; cv=none;
        d=google.com; s=arc-20260327;
        b=HeWJMWmYXauTs0Y7Be7kOr/ySK/Tz3TI5qgmIV+F6p/9tq5gE8Wmb/TwoJJt7DkxM8
         HjWsGsoRXzU9D+B2nBDp/B2Ptk52kRLa+/Yc7VNU2A9Xm6KvFkPiMYSo169rkZR6GhrV
         1zsBTZ7kvu9Bll5Fs82fkpPI4WVlioGlUGXVRRewvomvZoBcR1hMOTqZfOFyYJ+Vjuzg
         kjSCE0JXwJMpw+KqDLWhbR86rA6AgClukLPTIl18LuCjXXIrLhRBVsiuN9xp8D6vsDL7
         cBN2B0V1OeZsg9cl6Pi6mp9V9Tlo/SeffqqjOW9tPagLK4xi4nXGPOD433/Lyc15EXf3
         4vog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0oiCD99k36u3eESQ8rlDWdjtm2XbS/KRfOzUv69JEWE=;
        fh=1oniimSM3hHvSFOsQLQazGLrufMJ1hq3xjcCJSxTXW4=;
        b=nPhcsQyg7ekVu64AOGubU95tSktB4OICfPewOY+J35hvnStEHkalOZMlEl28Zc9WE6
         UiJWIUzpArS5kg0SsGVF2nyWb+C7FvzSimMAjLocq9ucw5CreZLb5d44tz/qrscxUO4P
         7sKQLSkBinFfuE4O8Z9j1/MgN2gJ6pk78hYewji6f2EYYwnQ2tPQYR/54es3AoEFRZl/
         kVR0UFRl810n3s666cRKbCUqkHvgXE8L0lPdrsEyn34SfNyCu+aNKj2Ajg3bUnLgrCzu
         1Tj1pKnuecPsH7yU+ETsm+rhtbXFkNfp/UA7NqJVoq0gBm67TZC0urhlRBQ+NHdOlDWo
         625w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783942570; x=1784547370; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0oiCD99k36u3eESQ8rlDWdjtm2XbS/KRfOzUv69JEWE=;
        b=errtHx53NbUcHB+MMQ0awAzV4eFSo3zLwVtwtDjv2/OD3pEblqq+FTtitckXtvrDtr
         KklPZnqmeuhEquyIvxEp2E0err3E7tdzMt/vz4Eqsq0Y60CPURJiWsXLY+WPZwaY7i2A
         XvJNziosPl+paq7vRc9heksZFuGfEKlVpuduSXG8iAm2x6qKjLfzChjlHzdfCj5VW0OF
         7rMfNS7UWVEY0odHPTRvdWJ0and9LP3B9DTgegJjEyVlTklwPK7U9BMjREPczpKsg66s
         MB6gzMcAP9q8tM0qs5bLqD0qDTacCaZjxRAZAbi7TqLM5oNjJaN7m/H4laIR8ZYXucJR
         TsAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783942570; x=1784547370;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0oiCD99k36u3eESQ8rlDWdjtm2XbS/KRfOzUv69JEWE=;
        b=Cxrr+AA295srURtuRz3wWvPdubH3tok8qkku6i0DTE3bQN2tLCbDiNf/uHtucUjp35
         vqBWJN3UB/bfOMdoe8EjXa2anWQpRNLPS0Dc+0ZcY9ig/iTLZQlbk9GtVucUqhu8I/OW
         ceNhJ0ODWYKZ+mXwK4yGPj7EKl3tz19euvnkG0+RhpcZ+Lo/hVUy6Jrt/BN+iiqKAFnE
         4Fltc9o6eLOoi2ntGUjx7aqXuP7pKEsbGF2lDLeB6WUWYMWw3mE1Kwbyt/5+mwvBIIXc
         TLag2Ui23D5xFKBg74C7hrVFGNhIUByXSCXbevIGLG7jFs7mDSqZLOn+I/pUOe331omL
         Y7+A==
X-Forwarded-Encrypted: i=1; AHgh+RrC4ckZlVmVHag5bdBIWyjwH+VRIem42gFCNtlYUo09R1esVtwj2WxKJdMhwky+2oG7kK2pN0rfhQIxlP+l@vger.kernel.org
X-Gm-Message-State: AOJu0YwVNTn33EIcF1DTorKjqv+YvVaIarke2K8XYK0V5AETWjlai7Z/
	fERV//K0tV2UwXJcXWnIfGRYgpBmvISN7Bh1tBs6vfdRpJfwueQ2jh/1WsjI90+yQ7LivjZMjMI
	D9k9Z13abDCoyi+fPteVd3oDsA1Y5KYm+Q+V22u1MB7dDWHr/Fk+6LHp6pABaU7YH58I3ESn2Bb
	93hb/VfmQK4DyWVdtw3r/4KY6goL/3uovntd7ATlscZLE=
X-Gm-Gg: AfdE7cm5KY9LPmicauq48oY+o+UdqYS7ZlGxeQ7XZDgU01rSmVGQFvzjNHP0QM9VqGq
	2uuYluPDNWQsHV2g4EXWH1BtIJWXGKl7KklEYkklkUvJbXTA6pL3gYukAGgY5mXGj24CN+zf+B7
	o1lbu/Pli2jqusx0Nc1r0tIn6krK18KE9gp/MPd0+Wk/amzR2vYPEAAY/TxRnfpWzoj0Nb
X-Received: by 2002:a05:690c:64c3:b0:7ff:1399:9317 with SMTP id 00721157ae682-81e8ffe4bbamr68138007b3.11.1783942570352;
        Mon, 13 Jul 2026 04:36:10 -0700 (PDT)
X-Received: by 2002:a05:690c:64c3:b0:7ff:1399:9317 with SMTP id
 00721157ae682-81e8ffe4bbamr68137847b3.11.1783942569891; Mon, 13 Jul 2026
 04:36:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260713045811.484554-1-sumit.garg@kernel.org> <b967394f-b1ee-4718-8629-b5814b4e129d@oss.qualcomm.com>
In-Reply-To: <b967394f-b1ee-4718-8629-b5814b4e129d@oss.qualcomm.com>
From: Sumit Garg <sumit.garg@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:05:58 +0530
X-Gm-Features: AVVi8CfrKvltY9dRfIqdAreXq2aGBt1pi7WDwVBqmErmfCyyXWeuGi49RvB6cM8
Message-ID: <CAGptzHOvBZP4sC5+Tp0rCzCuJFU5szBPeCETbxrsQKkY=pNwkA@mail.gmail.com>
Subject: Re: [PATCH] firmware: qcom: scm: fold tzmem into the qcom-scm module
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Sumit Garg <sumit.garg@kernel.org>, linux-arm-msm@vger.kernel.org,
        andersson@kernel.org, konradybcio@kernel.org,
        linux-kernel@vger.kernel.org, bartosz.golaszewski@oss.qualcomm.com,
        harshal.dev@oss.qualcomm.com, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX06wqhGZcY+vr
 E+1im3tOTqjpyozmwvc5YBAVx1OWYJ8vSRsLgGEXPYT5Ae7QeN6OLUEVFX68vB1ODZuJlc80kO/
 Qor0gMJ3QaQasX3ls6/d0op09arJc0HAPPeEz9lOKUIz2vfMquCLyU+gTtNSwQkXOjC33cbGe4z
 s9aOSLrc3Eppa1xcRILHLLHKGDZAecGI1MWp8+nN5FmQeof7QFXX54RzHRHr6keSuiW3sEh3tSr
 AXW2EScqOYrmXhH6YpX3rhva/AbDwQhdL38UN4KYDu8ayILCgiYFjOyuyDaESusUwSRMkqFXk2E
 gTBEdYePgL5Y7h/D9lTlbiRgiczLB5x/sg0fpW/PWGCxUGTFSf32pfXsHC8hjibIZAmiFqHlcUC
 i8dz5ZajqM5xOIi7aqx6LzHWILyplhJ2buElIkjLb2zLlQlmxtLgz5IvwrqBxGXHbrK16co0z2g
 zbpnL3FeUvPBBd4dPZA==
X-Proofpoint-ORIG-GUID: h_DuDScQ55kyLSxw5qnTXqymkm-YCT7D
X-Authority-Analysis: v=2.4 cv=UMHt2ify c=1 sm=1 tr=0 ts=6a54cdaa cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=iNp7DegWzIIEW5pQnQkA:9 a=QEXdDO2ut3YA:10 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-GUID: h_DuDScQ55kyLSxw5qnTXqymkm-YCT7D
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDEyMSBTYWx0ZWRfX2VZuTL+TdWJw
 QR6AETEn4/TaS/8rMqcAuMxpUfLgvJ49Kis6HNL4Q0TJIkw9WYFLdTS9Vwmg2E8ldh3eL34vZuW
 bPWkMYdXgdCJ/ssLaXFgPKHzsxGVayw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 clxscore=1011 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130121
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118750-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:sumit.garg@kernel.org,m:linux-arm-msm@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-kernel@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:harshal.dev@oss.qualcomm.com,m:lkp@intel.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[sumit.garg@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sumit.garg@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,intel.com:email,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E34AC74A6F1

On Mon, Jul 13, 2026 at 4:07=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 7/13/26 6:58 AM, Sumit Garg wrote:
> > From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> >
> > qcom_scm and qcom_tzmem have a mutual symbol dependency: qcom_tzmem
> > calls qcom_scm_shm_bridge_{enable,create,delete}() while qcom_scm
> > calls qcom_tzmem_{alloc,free,to_phys}() and qcom_scm_get_tzmem_pool().
> > When both are built as modules this results in a circular module
> > dependency and depmod fails:
> >
> >   depmod: ERROR: Cycle detected: qcom_scm -> qcom_tzmem -> qcom_scm
> >
> > QCOM_TZMEM is an invisible tristate that is only ever selected by
> > QCOM_SCM, so the two are always enabled together. Build qcom_tzmem.o
> > as part of the qcom-scm composite module instead of as a separate
> > module. This breaks the cycle since the mutual symbol references
> > become intra-module.
> >
> > With tzmem now internal to qcom-scm, the shm_bridge helpers are no
> > longer used outside the module, so drop their EXPORT_SYMBOL_GPL() and
> > move the declarations from the public header to the private one,
> > alongside qcom_scm_shm_bridge_enable().
> >
> > Reported-by: kernel test robot <lkp@intel.com>
> > Closes: https://lore.kernel.org/oe-kbuild-all/202607122327.3zkZCUaB-lkp=
@intel.com/
> > Assisted-by: Copilot:claude-opus-4.8
> > Signed-off-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
> > ---
> >  drivers/firmware/qcom/Makefile         | 2 +-
> >  drivers/firmware/qcom/qcom_scm.c       | 3 ---
> >  drivers/firmware/qcom/qcom_scm.h       | 4 ++++
> >  include/linux/firmware/qcom/qcom_scm.h | 5 -----
> >  4 files changed, 5 insertions(+), 9 deletions(-)
> >
> > diff --git a/drivers/firmware/qcom/Makefile b/drivers/firmware/qcom/Mak=
efile
> > index 48801d18f37b..55751d282689 100644
> > --- a/drivers/firmware/qcom/Makefile
> > +++ b/drivers/firmware/qcom/Makefile
> > @@ -5,7 +5,7 @@
> >
> >  obj-$(CONFIG_QCOM_SCM)               +=3D qcom-scm.o
> >  qcom-scm-objs +=3D qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
> > -obj-$(CONFIG_QCOM_TZMEM)     +=3D qcom_tzmem.o
> > +qcom-scm-$(CONFIG_QCOM_TZMEM)        +=3D qcom_tzmem.o
>
> Does it make sense to squash the kconfig entries too now?
>

Sounds reasonable to me, I can do that for v2.

-Sumit

