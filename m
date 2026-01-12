Return-Path: <linux-arm-msm+bounces-88605-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 14801D14A8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 19:06:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 66E8930274EF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 17:55:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C68837F100;
	Mon, 12 Jan 2026 17:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JRYKv2jg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="e9DXVqBK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCBFF26B2DA
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 17:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768240525; cv=none; b=KSVU6XmyGlcXTllLgcR7BK+wIW8eSMH62FWsW9LicJGhbXzREJW82rnFSJb3X9x4cwEFnfOJRBVutmOJqAz0GXROmKNVNcGHblwc5nbKratsN+oSORHtpVhd58uYjjhBKt3SDvKlt8V17lfantL6WqPMuVgWBiAJKGvWyKhnpqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768240525; c=relaxed/simple;
	bh=NxqkDsWBFI5KkFWQ8HUFZHQt/OCAuQojaBPhfnFGv0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u8nKXrpHSNhMj+yMqTOv3ftS9J4+ezTWSmZANyqyf/YVCjybmpfW3XNkTaOKOl5NNVDIqi8OldImacnlo+5mSNwzx1rjJjyMaHQt1QGjsce+jfhBjhJi3P/dM1KNS2S52cCDrQ7z/NIHI/j4+fCaAfiAbZmyVqtMErufdusaOis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JRYKv2jg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=e9DXVqBK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60CHfCLj2363627
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 17:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7wC12hIjapFHnxbTfyvh347loINH0/VC2F8iYpPdYKg=; b=JRYKv2jgb+iiZ3b4
	Kaiwf07C+GReQjrv69JZ+ClqMMhzeS+tTV3E98uX1wm1KYP8mlCNrIPpgOXbzlZt
	AzhpFu4YFTysSOsjNMbVpGkmEXUzqxiMyHUbMqgZoPsaQAE2l+RMGZaFdXoS+Ly6
	WBkVoNKwh4A035kNiyrFLCqcwiFT3GCkCvcJBTLCPvkkKNTb8r6EsEMMTU4xlSIt
	11DlBIaZe+yBhwZ1I4x5x4AhRXu361qGi7yXGIUK9IXtQFV4uaaQh9XFRenyO/gu
	VKqUhQyDwnxjovSzh7yTN66cHuDh8J/E3n3UoQLtQm0+b+cyGWf1E/UG72hCW2Pi
	mjRL1w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bmxwv1e2s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 17:55:21 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4f1f42515ffso190038411cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 09:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768240520; x=1768845320; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7wC12hIjapFHnxbTfyvh347loINH0/VC2F8iYpPdYKg=;
        b=e9DXVqBKeLQquAdmi7CZ4VvaWEr0pLOa16EHn+/Z0cp4cHMMijQ50fEpk6AbR1SE7C
         Cs6GT0HKz8N3JefS2n2B470+f4uu7byRA9jZIXSGuPdvb2yU64IbSddAeefVjSRQT9vL
         LB1nvaX05ZTUxYxAaHrXQfqOL/S3BWszXC2kNoqqPT3uIBaJB/nG/OpB+CVvH79qTPc7
         tG/IC31XHbyLccOuJeiQTmofGxWRYOSzNSUFFzMQqzK5zrMH5GusGCLS5bo5f96QZnVv
         fhSdOZKEGpQIdqOgWAG9vSVsZg1gLA+NzecceLJwcbJqOsNszc+6bvjdvxK9kjIaQsbs
         3bGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768240520; x=1768845320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7wC12hIjapFHnxbTfyvh347loINH0/VC2F8iYpPdYKg=;
        b=qkVILLSrJun0ykxTL2fQ4E9vnHfvPe1ygV4H+7W/RZNI6dpbxOfl+V2E9vIMaJDrKj
         R3hGw6qOi0jVXOKOFusIF1UAmYzPo85NGd2h1ZQHHVEPhqUbigy2++DeyK6/6vc0TcYq
         t1dQs1FT6nAIoB5aqmJKRR+IZkNHyuVRO9PxGL/5dxhRYAqU7gYThUGUXj6pIvPw2MO8
         FPPkX9+Y65pUav4uLLVMhAZlYYuFaQpKV7FWYj/jFFxFq80ibQXnKFHn3ta8gIcm0pks
         2pyq7oHP2Mglzuvm9ab2AOhUwVWr1ko/tE+6KuPo17QGebotUwUJOAuDh5BnV7lL/tFk
         GKaQ==
X-Forwarded-Encrypted: i=1; AJvYcCVywGB5/J/QTwrTl7YQjkW0zppypgJKHxQPlSx68wcznsV486oAp9EKMj+xUmKubCly6UxR8EuOfzY0NoEb@vger.kernel.org
X-Gm-Message-State: AOJu0YzgbA75lnHsf1GJBxN8OMmJg6AeFsi5q5cKhrdHqRuC8m9cFPRA
	aKNziFMikgavrvm0MQjFtmox7+8CG5uY+miHnsq1aXsZWnnbc0O37OWOVhdjxo+wmelqo8XydXA
	pv6kXAaWSKO/A0HjoEUUT0UGsgdjnA0syFF0fxe1jyOV7+ABUnlLgwhOqqoTKVVyuyC7FMlaGa9
	1CIXds2gpbEsKPHLhkVoGR+ihBFWwlcuregNpcXVGu0pw=
X-Gm-Gg: AY/fxX4qhrItJ/gaaFV90EUuKjkXEgyziNhMD1U9a5oaG8tLj8RBYnuBMqdPT/hNw2M
	3ym+C1BDEOgFScim64jCehigVIUh4FsESgX/mcBxixhlvq6WyzDkO1cfrqyWb8DaTKK6IWchodL
	wWK6Giksfe1OTMx4/QLcyLBY1zp3U9zUedsHCSJ0rfa0I3m9JcLVnWfYCTKsSmqzBfFEw=
X-Received: by 2002:ac8:7d12:0:b0:4ee:209a:a012 with SMTP id d75a77b69052e-4ffb493248amr239254701cf.30.1768240520401;
        Mon, 12 Jan 2026 09:55:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHkIE4UQiDWlGLDB5w+wYNs+Gn36BQ7I0jvQlIkWPIDFo+CJGqpd/klyc5izbasi9kBaeAa2piY49p4mUqvGPQ=
X-Received: by 2002:ac8:7d12:0:b0:4ee:209a:a012 with SMTP id
 d75a77b69052e-4ffb493248amr239254401cf.30.1768240519876; Mon, 12 Jan 2026
 09:55:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224143009.2769836-1-youssef.abdulrahman@oss.qualcomm.com> <c0d07081-cb27-6c2f-604c-00f6f526a0dd@amd.com>
In-Reply-To: <c0d07081-cb27-6c2f-604c-00f6f526a0dd@amd.com>
From: Youssef Abdulrahman <youssef.abdulrahman@oss.qualcomm.com>
Date: Mon, 12 Jan 2026 17:55:08 +0000
X-Gm-Features: AZwV_QgCA8afy_69FJDdsfDkXyaqRMMIpeabluPijgC7rXl1YMMaLtc1rcnrj-g
Message-ID: <CANyhwx0ts+Xx2mwEn+H6RkYgGzA=MS0e55+bmpceAOcWpcqPBQ@mail.gmail.com>
Subject: Re: [PATCH v2] accel/qaic: Handle DBC deactivation if the owner went away
To: Lizhi Hou <lizhi.hou@amd.com>
Cc: jeff.hugo@oss.qualcomm.com, carl.vanderlip@oss.qualcomm.com,
        troy.hanson@oss.qualcomm.com, zachary.mckevitt@oss.qualcomm.com,
        ogabbay@kernel.org, karol.wachowski@linux.intel.com,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 8LlFUghFDIaNOn73b2St-20KVo0oS1vr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDE0OCBTYWx0ZWRfXyUpjPXHSuy8P
 tk9Y7NmX28tUvppvpndMe82WjAxtUeT9tHcY472VelmJ5dY/9RINix3ymAteY3kc7L0pmQzAsgn
 d54mHXQa6YH2hAvOOsqyNVIq12icBns7uyQVxJvpbWMgIidYO5hUbruklu8raeE8mu/cnipC038
 eVsSBVf0uQIFW/rJV4mFTA5dl+t/lNEthiEMzvNwQycTHqF/Ddm6xbX5B2rtfDjRzv+1+HSbrju
 nYO4v7EKxRZF+X/mWcFvL0N/UQIaRL+GQlB39aSwBn//dScJhc2sZ61UhNaQYuV0CGhTAbsxIKr
 eLvRnw8fwu0BZJ1MSKG3SQUufLF3Wih/Xwrq7T0RrTGY6GsjESVTZRJ/b/vlmKMcL42o3RtcS/q
 +8dD6GpKq23kwUOlj7DiokGBmxDpAlhnJbpSUfXAPLVYwm2gP0xg3IDzyt9Rcd6AT313z8c5+AP
 F1JCxd+vOk8s9GJMtMg==
X-Proofpoint-ORIG-GUID: 8LlFUghFDIaNOn73b2St-20KVo0oS1vr
X-Authority-Analysis: v=2.4 cv=C/XkCAP+ c=1 sm=1 tr=0 ts=69653589 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=zd2uoN0lAAAA:8
 a=CdaD7TzLHgGr7jEhopsA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_05,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601120148

On Wed, Jan 7, 2026 at 6:14=E2=80=AFPM Lizhi Hou <lizhi.hou@amd.com> wrote:
>
> > @@ -1108,6 +1108,9 @@ static void *msg_xfer(struct qaic_device *qdev, s=
truct wrapper_list *wrappers, u
> >       mutex_lock(&qdev->cntl_mutex);
> >       if (!list_empty(&elem.list))
> >               list_del(&elem.list);
> > +     /* resp_worker() processed the response but the wait was interrup=
ted */
> > +     else if (list_empty(&elem.list) && ret =3D=3D -ERESTARTSYS)
>
> Rechecking list_empty(&elem.list) can be removed.
Good point, I'll apply this in the next revision.
>
> And if ret =3D=3D -ERESTARTSYS, elem.buf is not NULL?
No, this check handles the case where resp_worker() is able to get to
the element inside list_for_each_*(), which will set elem->buf to the
resp message, at the same time the user interrupts the wait in
msg_xfer(). So, it will be treated as a valid response message.

- Youssef

