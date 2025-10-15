Return-Path: <linux-arm-msm+bounces-77428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 351E7BDF104
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 16:32:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E21A41A20181
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 14:32:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44E3127F727;
	Wed, 15 Oct 2025 14:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KjRVU9yK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF6522128D
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 14:31:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760538704; cv=none; b=ufllK5L8JTlwe60d8h/X0fbqedpu5fkGXBPZdMtMZRiAA5CCnmGDpAu96OmhknFPiOqgoofdoMgWeC2V6M0leGoHDKB+jALy78Ho8qkcgaF6ktCCJKY1aoSEG1/XtY5dJvcaNe/khP0lXQ0f5N3mOcqwTZIUwEfL+/YO7Lpew6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760538704; c=relaxed/simple;
	bh=7C1kqUL2+pSHhXzgLUx/+UHRV9bHHrUHqpI6u3kSEJ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GZc4rGSfRxigw1q2QczMWpDsJCd0lcmh/6tqcEgMRjJx4Lrt44P1KS0XjM7Pfb1U5tEIpWxS6kyF8phGi1zD1bo4CrXSJoJWVApxs6moWg9fbWEwzEt2HQHzmmkueOd0dhAknPOkhlalGA6xUJR9Gz35ppChQ0UQR8HsPIHGGw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KjRVU9yK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FBCHib009199
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 14:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7C1kqUL2+pSHhXzgLUx/+UHRV9bHHrUHqpI6u3kSEJ0=; b=KjRVU9yK9J2g5XfN
	WYApyw9hUCwkyWoVPN8+r/Gg7hC4gSr2Aru5jR1TFD3Ex34N4kp9PdmptUQSytay
	1vuz2iDWXUEKRvEcT75gj2eJ3Din9JaeqMzEPQflAoreKHovs5aIgPbYi7uh/m8h
	V+FOJxAUKMfVpqYRCuEfDmk8JW6PPKrl3cOiou/a51j1Tg8HbwkOHY8zG07O5Kky
	qK5ODp9OIA1TIc4klrUCu4F/WyzxRvueBYpt6zgPK2N5TlZG95zObj/436166S8I
	YZSrOYnO5Ftd+vGLnp8vthQl7E7yhCzAuigycyyQOUYPdD0QhkQx9h4GswzSlUCD
	jbov3Q==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0c4n2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 14:31:41 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-554e68b14cbso2294812e0c.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 07:31:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760538700; x=1761143500;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7C1kqUL2+pSHhXzgLUx/+UHRV9bHHrUHqpI6u3kSEJ0=;
        b=KYP5RGzCFoRxR/wDGELrb9vF8AxUwozj/yfyLe1Fwr1cKdqhX4jitiSodUtW0f9uxJ
         zeXqI2SFdbG5t6UUJPzSfy7gmPg8krFIr9SAz54YE/vd6tznhwSCum5+EYK+GlW2UgwP
         ZV1gPNXr0OOjwsWbn8EY2LcfO4NJsrwUWOcqNRonQB5pJcvz/AIHmKlKpm4M8iHwd1ZB
         XCHi4v90/dY08lqGRH+h6Sog0qz9hUZGICYDseWfhrrdRmcyx05bvgVv/5BMLWwGQaEe
         My1KLnKDdg5OtTXsrYqZpgbhobMOoRWmAhPmTzh5YoUeYxLt8YYO01NiN9lVQVrbpPIH
         mTmA==
X-Forwarded-Encrypted: i=1; AJvYcCWroqpnUKIP0hXuCrlZ2+OkWH6ZZp5m4T98jJd74H2uLqLBM6VaWjwBmp3PufiPiBdEAEE9+g45TzUMD3+D@vger.kernel.org
X-Gm-Message-State: AOJu0YwSObj9QqB3FIlPpLjjfpZcW+Jd6bu3BIDRmRApaKyiFNStfYcS
	yeN+Wc1akDbJXQ0g6XTo7FKr+NgBDpOb5gEGbIPAY8XYC207CqwRKzkXItsI53h8wLeWrd4E4MJ
	rruwuRapEfU4aIzWTo1ctKshgUbdWrrRqH86/wp+o5z9f0UzeUjChkEcNRsJo5KS1uydaQmuwzT
	ekpI5fwZk9skoJLAekODGc3Jl2beiWV+as1AJQ5PXBcNw=
X-Gm-Gg: ASbGncssM86PTBEz4NytLEVSiYvjTYUXAibhR6E1zZVrLCKvtHu/qLddjMRvp39sEDm
	S4prtHocDMcEuyu3BvjSjPX2PySqcJWexBqp0FQTyxRciiTOlNXishvFpnDOlTguDRmExpsfLRt
	jT7WIXzNzWH4UWydvvQRRolg==
X-Received: by 2002:a05:6122:3c46:b0:54a:1e96:e958 with SMTP id 71dfb90a1353d-554b88e4b6emr8902480e0c.0.1760538700179;
        Wed, 15 Oct 2025 07:31:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFoCzMasGr9ydKzAL8etqZmuW94HxQ8w3vyPkrOTkAFlVbqRQfNuVAEq7kcm1c8bivioVTyL9H6cLg28nkgV54=
X-Received: by 2002:a05:6122:3c46:b0:54a:1e96:e958 with SMTP id
 71dfb90a1353d-554b88e4b6emr8902363e0c.0.1760538699592; Wed, 15 Oct 2025
 07:31:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251014170927.3908383-1-youssef.abdulrahman@oss.qualcomm.com> <830edf8e-8cbc-41ee-874d-5ecb6450e182@oss.qualcomm.com>
In-Reply-To: <830edf8e-8cbc-41ee-874d-5ecb6450e182@oss.qualcomm.com>
From: Youssef Abdulrahman <youssef.abdulrahman@oss.qualcomm.com>
Date: Wed, 15 Oct 2025 15:31:28 +0100
X-Gm-Features: AS18NWDbmFbR4RZnRdVwXgxdX68v5vDxEZfeiuQ_jxKhyvKegSFVH4tvSCmYZZg
Message-ID: <CANyhwx1QScQkR=MFRdmV3Fd8R6QJjq+1=esB_NNSq47FuBWCcQ@mail.gmail.com>
Subject: Re: [PATCH v2] accel/qaic: Use check_add_overflow in sahara for 64b types
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
Cc: carl.vanderlip@oss.qualcomm.com, troy.hanson@oss.qualcomm.com,
        zachary.mckevitt@oss.qualcomm.com, ogabbay@kernel.org,
        lizhi.hou@amd.com, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: ePQ_qB7XdzmwLPfiIbbGiS1qRDEh7zsw
X-Proofpoint-ORIG-GUID: ePQ_qB7XdzmwLPfiIbbGiS1qRDEh7zsw
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68efb04d cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-g8CD2O9qlXXIwQv6SoA:9
 a=QEXdDO2ut3YA:10 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX53nEpGqdmoAo
 aloLMpY/5BbYHUN3tuSxuTmBRdvTLK7hnL57BL5hg9uvL975pzgLKEkGJHbGvDwgfvGBQmq97ni
 qMM1SiMWmWskJLlnwHQ5o6khLyGlMORAC36G2upQrVKnKOfZLCNYpPfMF20MLvI58/FUJW5roni
 n448Q7JvJUxA1nVokaRKz0M9973AnGIQEOaSpmU2q0ge7QX6+NVM+Op7cPf+4gzQPaZllGHdMnA
 ei2Gg0ojIaRAkA5dpld7CyUd/auEAV2d3GKcAkAl4Q/TJan2QDVE+/igihUmddEmMlp7gGluBvo
 VJvnp8sboqaDk+C5xtoFR5zWyInrqis/GRA/+bIF8271C8bdi6EtTrse9qnokKY5iJ53BWFrum/
 zUFlVyebQKCZaJz3zPWQZnCHzI+eNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

Will send a V3 with only the explicit cast, and send a separate patch
for the min_t() change. Sorry for the inconvenience.

-Youssef

On Tue, Oct 14, 2025 at 7:31=E2=80=AFPM Jeff Hugo <jeff.hugo@oss.qualcomm.c=
om> wrote:
>
> On 10/14/2025 11:09 AM, Youssef Samir wrote:
> > From: Zack McKevitt <zmckevit@qti.qualcomm.com>
> >
> > Use check_add_overflow instead of size_add in sahara when
> > 64b types are being added to ensure compatibility with 32b
> > systems. The size_add function parameters are of size_t, so
> > 64b data types may be truncated when cast to size_t on 32b
> > systems. When using check_add_overflow, no type casts are made,
> > making it a more portable option.
> >
> > Signed-off-by: Zack McKevitt <zmckevit@qti.qualcomm.com>
> > Signed-off-by: Youssef Samir <youssef.abdulrahman@oss.qualcomm.com>
>
> I think you are missing two reviewed-by tags from v1.
>
> > ---
> > Changes in V2:
> > - Use explicit casts with check_*_overflow() calls
> > - Replace min() with min_t()
> Fixing typecast warnings with explicit casts seems good, but min->min_t
> seems outside of scope. It doesn't match with the commit text, and I
> don't see a good way to include it without making this patch look like
> it should be split into two. Thus, lets do the typecast fixes for the
> min usage as a follow up.
>
> -Jeff
>

