Return-Path: <linux-arm-msm+bounces-105640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ZVwbI9U7+GkArwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105640-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 08:25:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 40CF24B8DA5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 08:25:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63D38300C81C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 06:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 473CA299AB1;
	Mon,  4 May 2026 06:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CLVqXhPs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gMQ5O0Dz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F389A18787A
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 06:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777875920; cv=pass; b=SuffROqwc6c8EQzVLuwhsDlteRjp7bnsDr2eQzJnVMfcy0p8Y2Mn38VTlRyoZ+ZemsVpbDac0R2jXMNOVfgRLnOvYpk2RVm4Ch8kkTgc/8LioiGpnY32vmRbGygc4ROTxuqJITH4f2YH2/Dh2oWOraIom0N5UcySOj74n3MK+4c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777875920; c=relaxed/simple;
	bh=Kr3jwdRxaBtI40R+rmJsDENRbmnOH5f7Z3o6bDWB034=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qnA3TgRwxSmO+gxjSpHAqAdk7tylIx7EWUgUoOl9+TE2w2mr1dC1/2KQv57IF/R2Wqmj/qyYS77o1gIx9YQZBfs4684PMlwoa9wo+StiCz8R+bFKcskPkAYIA3zN+KKEYBARE2NlOqSzT0uA1jfmlLHV79eYRZ3E40UYHd+tUDU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CLVqXhPs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gMQ5O0Dz; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6446DCOH098064
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 06:25:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Kr3jwdRxaBtI40R+rmJsDENRbmnOH5f7Z3o6bDWB034=; b=CLVqXhPsboOUV0Sb
	qzqJRCnYEcb4JC8rL3rOhU3/B1TlrB74U3r9OZAnVoEaFIiCh9qfw9xvSNMqZke4
	lpD/7HnHTa8dt9Lhw6gYz6hYP0Iu/KLfi7yvZphmynn8FXh/7oWjGDRgztHREuno
	qPmYcE1ym8VFiT7p7YoyAn2Crz/oOlGqlk4h/3Fh/lImT1Hno9mn/5FIkHO7PooX
	cJa6xRicxBQqxWugbgxiCqWTs+Kcc2XiU+hv3vrjXRGv2HqN4J5z+VXI9SYLaQLH
	Ggd31QbVIp2W7PQ8FCIv5hDDrEREiHztd3bUPN/H6woUPHyZFUQOZrzZk+/K0ZpW
	aWy9Pw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dw8kg4hn3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 06:25:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8eaaf673eb4so837789585a.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2026 23:25:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777875917; cv=none;
        d=google.com; s=arc-20240605;
        b=PgxldsvIUgm8hAoTt9ulUy5LbbRQ1jghwGbOZK3FRLi0BREwYzCyuoCyAt72OsnChm
         P7lvyDKXxtNjSkn1KusUhjqVLVSCg9e3SS2KED7q+vgu9xlNdddZP2CUq16sik6qufoo
         p8Z0JhD3v6eHX0FwJp+j1b2sIJzsgoY5k5nAKlFR2wMGkIcCoq2nK1suf8oc89Tr6XHA
         Wpom1P6S8pUEjvKkdsBiEF1vRpgqlop6jxaMdmEFXp/CB90K8Z+X3zqtS3REJzBsNojh
         p/jpdLsIFq4fuLHsp4YYyBiKqENBk7xa1BkB+JrEHIJY/amJGGzzD+nXb8oiGqzUF17f
         /ERw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kr3jwdRxaBtI40R+rmJsDENRbmnOH5f7Z3o6bDWB034=;
        fh=WMDOM7bTmJ93p2hbx6fbAkQLPlX8lfjFQB0vJ/qb0Rg=;
        b=bfqVJuwuwNMBOCL/DFB9qcMVSG+fv68V2GhnV/6O41/WCFVBNbZy8j6kqBmiYldoIe
         SRvN+LKKTUlhr5l/lz6MChwcmS8mYKsLLK+LNPdev7k0WolnY6wzJw+iZ1jnnmOu70dd
         t5fYEVEYgGnJeRTwd2mI82zuPVSUkOl3fmyjg6Ao7bXh4hZmxO4dNGnhBBX+T8QLcIVW
         UIdqROt5rcWPxNfGMTypbpx6ONtupatDCH/B29P8WChpLGQNb+e+wWkjOipy3gq+kiwL
         57yjr/WIQptCwzzvaZK7bc6QdTppCl8z3QEN8cBDq6kswlnfPezXBsy8isKEowJh6q1f
         Illg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777875917; x=1778480717; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kr3jwdRxaBtI40R+rmJsDENRbmnOH5f7Z3o6bDWB034=;
        b=gMQ5O0Dz6uRoTEtMw3SORZokOjZYsgMFnOpspmBxdF2ByfI03n1oGCAtxzdqMcXYTR
         UNwsae6l9D98fEI1oIgJXdVmGlBg7HonLJ74W3iCrcKDKBlSBpiIP0F++NTpWj7duq8+
         TCb80g4rFt67hwzu6H+5HTHJ2ZpC9fhhxlco4m4Mhga6C2dtfrv+i8uGJXFSeFc+XRa2
         TSlItcN6Ml1F+hL92Uk7XrlD52m3Ahp3lTE3KVIhfGvD3kuu7FlDTgSAuRWM+rYxFvUP
         g5fSqtnX8AkYBJ3HXUi/cMrqqLqCJk1z7ICKOfKwjd6hZuxOKN+73HtgNy5KPXVQq0u8
         f3Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777875917; x=1778480717;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Kr3jwdRxaBtI40R+rmJsDENRbmnOH5f7Z3o6bDWB034=;
        b=cWS138CobJWX0AtNUi0f5G52S/5dysdIeFIghHNXyxpaQwD57jQvbD2H9E2eRpClvt
         ODm/eDk5IdDFEDEXYXQwS0weJz9X7dUNrSm8pGEMhK+OHilnEG1xsqawUfSvIER1kIhM
         lqfeyXkI0cdAsYS7oHbputT8OakuiKmHAQx0BcbBdMp4cWVBm5qu7iMfktih8TkbrLN2
         OLo2qCGGRhCGFuuIzD/FTgwFqSQ2b/U8xNyOK1NX86NkEWMKHH+IoUF45eslbR0FHe9M
         McXOqpFt+h9uelic/uq5pfkIwMT38zg24eoLXf0Tirk+W208dXnqvhtxlCn7U1OXBiJI
         NIDw==
X-Forwarded-Encrypted: i=1; AFNElJ8rZK2k8B1hC9LF+8yNzHoZ5G57H/6hJ6OZoCuuCz8i3aM4GKRvtN5ThxP2Widr304OOMcYWN4vGoFTZjGz@vger.kernel.org
X-Gm-Message-State: AOJu0YwGNHABKd0C8mSnd81WJKX48/+fbyeNfJFVaycJrD27FppP6g2G
	HsNmtbVkbKlgcQQZylfhRzT1HYkQTZ5Ao2TY/tvdcM+GNug7kh/TcLxciMDefp3gtQRp6Ip6UEm
	kiFuIqN2j9qgBnYvA1qZigks3v3CrovwhAr9sGyVBJYs5aDLNj0Y5ZZU0G9TfRFGlbeJOjyq53p
	bSB1vGxRkph1wv0+MGB2ZcRYWCmxRhHMRN0ODzdkVcxLk=
X-Gm-Gg: AeBDietatxFq+M5yRtXEW5Vtgwy3RxO9Yx8O9/s+xGn6MfDdo2CuEnmn6OvPbh7bYHR
	CQX/iU9HDheUGThYfmM7BkPAXL5NYcXG62fSFB7cadQSuAqJLhpYPy+fxQ20C7GBgupoVG77EfP
	+UJfKveY8k4ExWf6X9nNGU3SMC/QG5KwBookK5UYKSishbnnn4SU+9xAgeEUroKstBbBclKaMiF
	p7X4WVBJ2mDqVmElQ==
X-Received: by 2002:a05:620a:454c:b0:8ef:74c9:daa7 with SMTP id af79cd13be357-8fd155f1d33mr1366862185a.8.1777875917234;
        Sun, 03 May 2026 23:25:17 -0700 (PDT)
X-Received: by 2002:a05:620a:454c:b0:8ef:74c9:daa7 with SMTP id
 af79cd13be357-8fd155f1d33mr1366860085a.8.1777875916771; Sun, 03 May 2026
 23:25:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260430140118.3684018-1-swati.agarwal@oss.qualcomm.com> <20260503-shaggy-coral-iguana-cbf5fb@quoll>
In-Reply-To: <20260503-shaggy-coral-iguana-cbf5fb@quoll>
From: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
Date: Mon, 4 May 2026 11:55:05 +0530
X-Gm-Features: AVHnY4LpYiNbxpk5kZWilKYhclSEgxdDqag9deB4xLXJKeWUWfhJh5yHp4_H1X4
Message-ID: <CAHz4bYsA+KcwYx0J1dG9_PcXPWKRCRPXjOq16tBo1PayexbftA@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: qcom: move gpio-hog schema to tlmm-common
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=P8sKQCAu c=1 sm=1 tr=0 ts=69f83bcd cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ZRzTmORx99hk5lNcyW4A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: RbETlleQkelR1beXswbR3RrW_4t1UyMB
X-Proofpoint-ORIG-GUID: RbETlleQkelR1beXswbR3RrW_4t1UyMB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDA2NiBTYWx0ZWRfXwcKs9vj4xm5Q
 PTIF34NTr/45X9kLocuX0LUuhBKpbvKA0ENNl/AgO1yqizCCCDHLoFjKg3L51pPEzJViQ7P5TXo
 9qaHXfYytPJ75GgHecUhdEnSbC6SPPzvCDkBtlTiWrO8AAa+9v0JdhnvIGL5W8fYl4G655PqMVg
 kpMy5H4Wdmm/cB7fz+RaknJCSlKQxrCzdgWHisqxEkPeNtF48kA7zKXly4Ke0Ug3k3xODvaNlFZ
 sytQ6bY/UTEX7IJqDNuIr473vskDgqySBdODq6bzEnOYD1NH/XYfv6LOWvvv/9zO9A7rY7Jd86x
 d/E9JVKPRlCAPDex2mzczReEU0MrofjMV2t0GiKwOlY15nH6YNvU5cHmblN/5FnulKhfdtT4sI4
 gbyjVNMiehSZxwWR2mSiLHYjR4RhpXvAoctF97T/hCbF0hIRcAQwxVr1waCYbkTcV1/YvH1oF/R
 gpw3XoGMEwEcZYxerYg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040066
X-Rspamd-Queue-Id: 40CF24B8DA5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105640-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[swati.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

On Sun, May 3, 2026 at 6:06=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On Thu, Apr 30, 2026 at 07:31:18PM +0530, Swati Agarwal wrote:
> > Qualcomm TLMM-based pin controllers share the same gpio-hog binding
> > semantics across multiple SoCs. The gpio-hog pattern currently defined =
in
> > qcom,sdm845-pinctrl.yaml is not specific to SDM845 and applies to all T=
LMM
> > controllers.
> >
> > Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml=
 so
> > that it can be reused by other Qualcomm TLMM pinctrl bindings and avoid
> > duplication.
> >
> > Signed-off-by: Swati Agarwal <swati.agarwal@oss.qualcomm.com>
> > ---
> > Changes in v2:
> > Move the gpio-hog patternProperties definition to qcom,tlmm-common.yaml
> >
> > Link to v1:
> > https://lore.kernel.org/all/20260417152014.3000797-1-swati.agarwal@oss.=
qualcomm.com/
>
> Does not look like v1. That's a DTS patch.
Hi Krzysztof,

Yes that's correct, v1 is a patch to DTS.
But in v1 , I received comment from Dmitry to move gpio hog bindings
to qcom,tlmm-common.yaml [1] so just gave reference to that v1 version
and splitted DT bindings and DTS patch patch[2].
[1] https://lore.kernel.org/all/6ijpvrd7mm5c6zsvogzm6uwsxpwqugur7oles5i55cq=
yage2hd@rig24poqt27g/
[2] https://lore.kernel.org/all/20260430142000.3707614-1-swati.agarwal@oss.=
qualcomm.com/

Regards,
Swati

