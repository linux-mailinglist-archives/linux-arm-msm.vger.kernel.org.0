Return-Path: <linux-arm-msm+bounces-86725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B06BCE5198
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 15:59:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 31A403001E0D
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Dec 2025 14:59:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4492E2C1581;
	Sun, 28 Dec 2025 14:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WS4Y8wXn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ayvY2b7X"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5342C11D5
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 14:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766933965; cv=none; b=cxa793/HeRYS2ZDGs/jpA1quhC9JdFdac0DQz4dp6m9MTisvVvXGBrn/St/8qwxashHFc9kB7Vqk3NUVpl74U+DLbudeIb4IvwDGSIrLqlYFuA6MSYL5+K+kA8iXMaNZQF+8sbPqBxcbyFUyAFNi/s88csz9BN4z+Abo9tTM/jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766933965; c=relaxed/simple;
	bh=d/XKUo4lZK8CUW+Xb6LEak5c93MI3IwSlSzwXmJXEd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mez4bFTmH4fTIjr98r74bL7Yrg1904WCd/Wu+iYSapEcifRI73q3MZGzjPeXRlWexwIbNe86u0+EyTSz2XxvkES0goOlb6aIxnFBknv2XQFtj9oVcR32kxdZA6McHAp1t/QdmofQHWnVwzEKNjzgOi3x0xjN2N93MYBp27iCX+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WS4Y8wXn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ayvY2b7X; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BSBuqHp091877
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 14:59:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=ckxl8AmlS8qqEoOlTPxy53fO7iguWQqxjRQ0V+pR5ko=; b=WS
	4Y8wXnFQjcrsG6h1hNWhN7x9D/HFQXjgxW9sS0VHQOZdZBf8YmEVt/ZSeH8J1jXm
	lkCDTbCvL8G7XosiCr73qeFXehsNK4qLlEEgvhyjBw6icsITpkPgZiaa/gwAJuG7
	CmSiuShCsuwcodHrjSSx/ONUOPwHysMwIpbNHG4ArjF2hGv2zZjkdXNr5vd2W9CQ
	CDrvjjJW6Cx1ihfj1ZFEAs1qAz/DpnhPd+p4tV+5oXKZZhD2CX9jBQ9xkghw6Bmm
	jWf38G17eXOEV9Rtf6T/tKsfju/rtUa2PM7DoS/oZwXrD1esCu8zXugz+TVBBThl
	cjwGqOHa5Z1m4s8vJhNw==
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bavrj0qfs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 14:59:22 +0000 (GMT)
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-459b5302fc5so1617991b6e.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Dec 2025 06:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766933962; x=1767538762; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ckxl8AmlS8qqEoOlTPxy53fO7iguWQqxjRQ0V+pR5ko=;
        b=ayvY2b7X/LXUP/r+0yCi1ebRW9+mWgkCx7e5A57msSuBM5q8476gxI9JojnWbp4Xq1
         fZmvWMH6F+zT2+Zaq1MEuMGgg+oMNchZb5C0I8ZYnib/tTjpCifr8ODLCX00VAT3nsAd
         trvQqhohL/VIpUpzBEe1SeRYXxOCsL6NXEKiDJ1/j8TH/j8/xLiCqymu42guEEUTx4dv
         SXjx4QfTZAH4k389K5lY29KRoWMqLE/TYBUQCSduFe307VUAfR5E5osTBmtC1Zs0l6xJ
         KlvB+xeDx/sZ7OX4fNtQp5PoFCAtfLmOVFaoYJfhWyCS9x8lA4jizRB4ReWIy8VtxyDG
         vrpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766933962; x=1767538762;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ckxl8AmlS8qqEoOlTPxy53fO7iguWQqxjRQ0V+pR5ko=;
        b=X10GOk3dqV1i2Kc3wIOnVCCdv0CzWvs0bkw4aOEaQPRwE7TSt35N2RsSwdw0MyRXmu
         t3CTmeObavnNeEfv45N5uDwL4V+QUVJpNb5CxRZLALIiFr8b51Yp8waOL13kw/FhEQv+
         NbsrPtUzUO2kYBq1zDl93lXqoXZP0Ua3hAYWsfYiSw1uuKBd0/O9lJCH04opdmeFGs9I
         9XUALBWd3XuDvQmx7uUvSgKfwfuVLbEVnvZoU2JERDB1Gw+j2TGVWN//tvVVVHK1bXwk
         1cOOOzCVujeZyDa7P9aIqZt+hEpLMfIhYMrJ1tclYXiGvHZo7SfU6lcpNEVvUsZBvc3a
         hiVw==
X-Forwarded-Encrypted: i=1; AJvYcCV3LlWcimc22LkDRh4nMDedmo22tPSs7dwhhO9fs4oTbhMQD8JQ1rkEzgFKvWe4qHh7TYlAP8/KAN3cy95n@vger.kernel.org
X-Gm-Message-State: AOJu0YyHfwpVpp7TSlTLTAZTP3h6QLXCnZXaSpQaXOSKTcJtAIgF7m9J
	0HOhCikJcI644I+mLDE9uVukYrXJIjLIXWkTdXdw5gnNVHp6bteUHHnWlG0oMOHbZ4qtWRlJC0/
	gs0U/rHYss8GK0zAfjtiroKmsmFhdw5UgpMstrZpoJWcNiDmUPhAW7cO76YG7Fct76FIBzwSgwQ
	cqAelY+j02rfxJUGeDyt3u/gSY34ZTHTuap9eYeI46jSE=
X-Gm-Gg: AY/fxX5UoqL2kwarIByqPP3QUC5JzZVql70Dw2m37aSNjVuMEd0YRs+xBT6QXKGSrHf
	WTu0zla+RlsCxrycsbuPfFrzekxvZXemwuUv6WJONESBl+JNrCS10GrMImSFYZS56wjNwZ5Pugs
	td1rmXBYPKE9IDuHn9/bKJV090ZZlPGJCv6yZQXqW3FODVZnvnuMqQSA1S9XojkHBI
X-Received: by 2002:a05:6808:1242:b0:450:ca65:ef63 with SMTP id 5614622812f47-457b2149dbdmr12232121b6e.24.1766933962005;
        Sun, 28 Dec 2025 06:59:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEKQ0W8E5GFXYVpsjWfkLEr/ZyGiqCM3SgXbbT2E0YVGU5DGNlnBmjzQkxsGSiAPl47E7aHxd/AkB230yEoieg=
X-Received: by 2002:a05:6808:1242:b0:450:ca65:ef63 with SMTP id
 5614622812f47-457b2149dbdmr12232107b6e.24.1766933961622; Sun, 28 Dec 2025
 06:59:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251227110504.36732-3-krzysztof.kozlowski@oss.qualcomm.com>
 <CACSVV03H_oii=fuhaeBhUZSJk-2mr08jGqAs30Z_h9tzeDgdtw@mail.gmail.com> <2a35d31a-1a3e-4cd4-ac3a-27104ff12801@kernel.org>
In-Reply-To: <2a35d31a-1a3e-4cd4-ac3a-27104ff12801@kernel.org>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 06:59:10 -0800
X-Gm-Features: AQt7F2oqrrSbnybAXKgWfgrkTYQBre96aRd65B4VaeoTMNsFPnQpfNlykmlc09o
Message-ID: <CACSVV03FfvZVzuKGfaJrsXmE7VVxEF5zN4-R7h1PXA11jOO3gw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display/msm/gpu: Narrow reg and
 reg-names for Adreno 610.0 and alike
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 6WIU_jsl7tfQW0MPDMLKxcfFJ3-KVQNq
X-Proofpoint-GUID: 6WIU_jsl7tfQW0MPDMLKxcfFJ3-KVQNq
X-Authority-Analysis: v=2.4 cv=coiWUl4i c=1 sm=1 tr=0 ts=695145ca cx=c_pps
 a=AKZTfHrQPB8q3CcvmcIuDA==:117 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Oa6cZlz9vDz7Y1gBjq8A:9 a=QEXdDO2ut3YA:10 a=pF_qn-MSjDawc0seGVz6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDEzNyBTYWx0ZWRfXzrDihNdO4Y2z
 brgyJVrHJydtKqAOmNWRfAuK6eZEvxH9UqSCZ3zjK8PylV6fBC2OxYUjvApbbxA/3/Dag9FHF/U
 XnUW3TXdGgaUiQAVlkkhcJ5B9rI0aHkX7M6WPhBgbw/h9e8Sg8dVuY+WdFlcqNjjIFWW6SBpC3c
 aVUPCGlvrLZqkR9jHbqhD/zZF38hooeymc86dnup/dR+IaBd4+ejWu+jxFMPfNEWv8A9YMpxyiE
 0+FzAfogh6bOUoaPc4NTR61QiVKfKYj1J5omMhXUsGukzw4TsmHCqrmB7TXwMLnlnjDzJKacEKJ
 eFRmCvTEIRU4CYxtcB4XkjZ+0LHl/Bm4gFHDSlKVdm+rQN+12mxgxd2GmvASBiHLPenUmONVVYj
 TNJHlZDYVAeNgxLKZyJ3eoq96Mx9VFWGPiW6/dEO6LihIwu5stuzY0pKRson8B1+EOE0Of6ZvEG
 T6GJk3SRWDokc9vbDgA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_05,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280137

On Sat, Dec 27, 2025 at 11:56=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
>
> On 27/12/2025 23:01, Rob Clark wrote:
> > On Sat, Dec 27, 2025 at 3:05=E2=80=AFAM Krzysztof Kozlowski
> > <krzysztof.kozlowski@oss.qualcomm.com> wrote:
> >>
> >> DTS files for qcom,adreno-610.0 and qcom,adreno-07000200 contain only =
one
> >> "reg" entry, not two, and the binding defines the second entry in
> >> "reg-names" differently than top-level part, so just simplify it and
> >> narrow to only one entry.
> >
> > I'll defer to Akhil about whether this is actually needed (vs just
> > incomplete gpu devcoredump support for certain GPUs).  In general
> > cx_dbgc is needed to capture state for gpu devcoredump state
> > snapshots, but not directly used in normal operations.  It seems
> > similar to the situation with mapping gpucc as part of gmu, ie. not
> > something the CPU normally deals with directly, but necessary to
> > capture crash state.
>
> I don't get why binding was added with cx_dbgc, but DTS not. Neither
> binding nor DTS depends on actual usage, so I assume someone
> intentionally did not want DTS to contain cx_dbgc and binding should
> follow. Otherwise we should make the DTS complete and make the binding
> strict (leading to warnings if DTS is not updated).

I'm not sure about the history.. but I can say that cx_dbgc is only
used for gpu state snapshot / devcoredump.  So it would be easy to not
notice if it were missing.

We have a similar slightly ugly thing where gpucc is included in the
gmu map.. only for devcoredump.  Maybe we need a different way to
handle these things that are only mapped for state capture?

BR,
-R

