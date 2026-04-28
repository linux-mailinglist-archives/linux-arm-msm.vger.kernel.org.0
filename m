Return-Path: <linux-arm-msm+bounces-104978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIgwMAWe8GkRWQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104978-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:46:13 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9F548421A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 13:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DB289301AAB3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Apr 2026 11:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69AA33AF65C;
	Tue, 28 Apr 2026 11:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQVz4BFZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LfFNbewc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A1193AEF4A
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777376478; cv=pass; b=mu72Fs+5fJyB/SvVQH5jDtyyDpnmnb36CnrIjV5rP5AVMQCvOvEI++30HEd74we28WlBoer/X1qNKGpN51u551dIbu4g1Tv0a76DgRRZzrnN7pM21Kshv72MGIEkpSuWdLmEbgzDMarsL4UUFeQJY31YWGY2BkMXeUsTQf1rnZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777376478; c=relaxed/simple;
	bh=k7HeohUbUssFnrsRkngGqREcYGE1ZE44XRtGWhZRoG4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=het3t6cOwACO9PxjsIwypZOf9hxGuwqmY7F+s7GrVTAw61Dcb3C/qKkfFTv909PBZEVrcsZWvH1BcmfVkvKF6kTmiLSfQak5bAzeK6pYivxRaLBvLpFwzSlci9ay+lD406UxjjTihDmT/QDEnbKZ9GIuWw6SrS1NcnoMiMaqHUU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQVz4BFZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LfFNbewc; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S9hZTI2045259
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:41:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	k7HeohUbUssFnrsRkngGqREcYGE1ZE44XRtGWhZRoG4=; b=jQVz4BFZpNUbhzjD
	OvQje9QZrZqkjOyy6WeWu0C+cuu3YORqh2mzv/LsUXJzHECzFBZgA04NdVSPcTjJ
	GtsmU7o84uuiNPVKV8fz0vVA6ihK8HoezmLfodwxb73Jhd7VGaOnahIqx0kBFrIn
	il6zi0r/Yk0Genz32ElVVLBlvW3i8D+o7AQLUFrzjuh6vbJ80LP3/7Imf5mC137w
	PGKUHi0j9vEInenqaK9ZEMlQRzo4dSjXKClTQldlckXulqp693yH9xbLqpX3JSQL
	5cbHfc+Va2x4TzQt42ssjmmZ4UkUbd8rm8zydJzkRw306s/PYjdpdYv+q84S1kdU
	7893Ig==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dttgyrcuq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 11:41:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e2592ea3bso120810581cf.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Apr 2026 04:41:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777376475; cv=none;
        d=google.com; s=arc-20240605;
        b=Qch+Z9rbtJ1xLrCdAl8VG/oEEcEU7Nws2S0HQzptlImPoYjlUjCPJgYA+7dBaXlLYw
         nJdD/11T5yqL5SO8Dk0IDXt8/s0XKueWFydJgI3sIzW3TlPEmUoX+fCCHdwOqZax4tJY
         W4TvYVz1d1zv3lHhTqG2bLEdf8eYKJ06afqzK0pDxOkGV0hFyGPuqm4ktQuRIMI5QMCZ
         Do+96LFJSDLKlT+hTA+jV6l/YiQXYvGS4nIEEEHPE9EXZCGAqDhsch9Kc9pRAu44Mv4J
         GwwrucujB19ADKzLH4bR/6+Ycna6EwpBdn5R0zZGWOf3EyEiizLJBTscQJNtCplq4SmX
         KfUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k7HeohUbUssFnrsRkngGqREcYGE1ZE44XRtGWhZRoG4=;
        fh=8dDnBLL5VtxxzmmhBe+I9XtdD5qlA475EWkZKuOikho=;
        b=SYh2LsSnM5CcFWMSAh2ur7GYh+OjJzc1qy6d8FyEq69PaXFQ+sFMw9gZ+RLIqNTG66
         Rt8KLo8ZZQQU5JaX7vUn0dKXlfTTOT2OID8kgGNzoSPeYtxifKiOCdcrp8Zv7URG7IsC
         95Kge6CI3Osc6vECoEC5BK22t9srR9iHdJrV+sm2qQd3OOIMTBMgfeBYZWmBbLcDqZo2
         cCic+iMzgCtorgmcVdCTa894czf9EvLNb/lSbx8HCK2to2hvRTymq6skNFBLiSxGaF+H
         1SFSvPQIHb6swId2tvmMLY15j2xaPN3AuVQHQibjWp97+Xral+MBtScNIg4FwxFdSNQ5
         tMAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777376475; x=1777981275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k7HeohUbUssFnrsRkngGqREcYGE1ZE44XRtGWhZRoG4=;
        b=LfFNbewcLWl3JujrYcatutEczwGW80liCpCzAigkqKXneeOBgqiovXJghdbbCPdsas
         YqXSGppK4TouqK26Lso1bO9t6c2yYTt9945dCWZxp9ps46nyIMuuz2xwRwLbD2+lyRUk
         gw204McufDHYBMKSOpV3bhE3LtJe9rVL/zAW+J140zwltNQnxtCK8vQlBK2v8ZpNeXSv
         nPpGI2i4pByWavnV1fWrNG1hr/f+0duLu5Rxyv+hambheoNRJT76pdopX9OW7p3DDUfI
         NZKTOC6ekfxjQvX+K6F6WkDQsg7Lky7A/F7AIySi3E95fbjXa2F/dw9oLQsIUvwxAB1O
         M/Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777376475; x=1777981275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k7HeohUbUssFnrsRkngGqREcYGE1ZE44XRtGWhZRoG4=;
        b=med5fvx+A1KnvmLrk/9S9EhmNKqDJZe3t+oISygUqCJPifhxjq7HA/oeB7z6FHrML0
         K5AjtZzMtHcgMsiJZjg8I0FKdZpZAJE/05ZTmGpJuqMurrTJ32Jp1Sk6kj1lLzllz0SI
         RMDytwmBhCENJmH7yLDEE6xOJj9VpwPH3FcJZumPAp4TSclBIOONfjJDZrTmLUXwa7/+
         /flDtglUv2IBtVLk9VrRrSAAJ9Hl9P3inDIrZn8NoBxyICglVtrZSPPv6ypTsFdsz2kI
         Y8/2pC8agBgBEiW8CtOCHh6fxd5h79tKN81crl1zN1nwAWi1R8rBHIyxrGHGBihDCOpn
         /KAw==
X-Forwarded-Encrypted: i=1; AFNElJ8E6BuBfWFE0AxSEAKN06w5wh0lxcM8VwLrxEbS0dC7+HOnxbaZU/4WsbE9plGBN0vHOb2RQ5nozDSH0AbD@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1oe3FC3E0So/ZmPa2mx4uIXatt4uW6pLrxL6MDmG8N9f6moeM
	T+TDdwiNqYtyKDCLTGCaNN3nI3KBPJATKocHVD2kDPZz6Ii0lqakf3HwF9/bId4tcWOUEpnGmKx
	dNV4j5rA0Nfxnl3RaKLmk/xNpDdYpp5EOuHHN4EBuUhWU7y5frzG5GpSeRfz0tpqACIsgmTCRcB
	sEgZKXaCIGjTJeStNSG9uQSMQ1jhDhkQ1T3vy0plj1JsY=
X-Gm-Gg: AeBDiesgnR83SMDruzjEOrZ2b27LSmpEzufBEcQlzCh88W5jSh/WtIfLXJ/AhvHlWw1
	+QMs1ZtzXiQH7LJBfa5ciZEIxBJm+O7OIPw4KTx8LvGBI1rNJ2AxnoZfW5Rce+phs6wluHx09c2
	CXmdHTOr/LXxNe/uvC+lsvXeWccDbe+c0VzQRceh9XrnOb8OOSaCeLczroaUmGCcTq7Us6stkAu
	Pu+p6eiet0zFWT5tTDraP3ze3Z+XldE3x5lxcyMl3zf4AXOrw==
X-Received: by 2002:a05:6214:5294:b0:8a6:1216:fb78 with SMTP id 6a1803df08f44-8b3e31b26bcmr42646846d6.46.1777376475405;
        Tue, 28 Apr 2026 04:41:15 -0700 (PDT)
X-Received: by 2002:a05:6214:5294:b0:8a6:1216:fb78 with SMTP id
 6a1803df08f44-8b3e31b26bcmr42646256d6.46.1777376474849; Tue, 28 Apr 2026
 04:41:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-1-f430e7485009@oss.qualcomm.com> <a6aff52d-6bf1-4f32-8b4f-cfba85b78964@kernel.org>
In-Reply-To: <a6aff52d-6bf1-4f32-8b4f-cfba85b78964@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 13:41:04 +0200
X-Gm-Features: AVHnY4I30PHO3JaiGQw02eVXNc-m3WyF_MeHdddg6z1v0u-m38ixLGWueeKRES0
Message-ID: <CAFEp6-3Cx_6xa0e452220wfvUwcQvwEy6vtnBnwTpqTvC+HptQ@mail.gmail.com>
Subject: Re: [PATCH v2 01/14] media: qcom: camss: Add support to populate sub-devices
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
        laurent.pinchart@ideasonboard.com, kieran.bingham@ideasonboard.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: 9-D8Nu1klsmlE_biHv25KaJc9YIXJGoG
X-Proofpoint-GUID: 9-D8Nu1klsmlE_biHv25KaJc9YIXJGoG
X-Authority-Analysis: v=2.4 cv=cb7iaHDM c=1 sm=1 tr=0 ts=69f09cdc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=Q8RtUPtQJvjqpABxVQUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDEwNyBTYWx0ZWRfX3zJz7UddasQV
 nxWHnQaVBrBwWBIA2h85ssN/FPxlNCn0vYvPvr+lGdH65PABEmUXbFGGRuNzEplTvFuc8ZshhZu
 7U1n/NeOZB3diyWkZJOXch5WnIOtDVZtNmQ5ofNJ9sA4/XjcTaossbYq46DC1oZRwiPmbbHkgYI
 IN7aIM7Q15oPef2YTlY/gybhfTU1zuFQ287lS/zW5iNLkO67WGiXwW150Ft27zjQDdUixiLt1gL
 SZNdBJyZS1ki+gcnX+oxddZjS6+EDz0Bn4R1nYRV49hGumO1y4NZlJKDj1/brjK5zm27rAh7Ce/
 HU/+TQjRdtV/HqEqXlMpfrUYIImk3Jbm/7fWvK99ELrofdf95wFlLK/njyzyMn4u9ROntUBj+AX
 LmU0NTWGLJP2H8CZ0QIWHR5uI+VFjGlwxvqpj2CtQdbH2PMnMgtXF+bV9EWA0Tmvbca3Sct+vMm
 DL2zGrBQOHdliVbJyVQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280107
X-Rspamd-Queue-Id: 6C9F548421A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104978-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,mail.gmail.com:mid,oss.qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:email]

On Tue, Apr 28, 2026 at 8:43=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 27/04/2026 14:43, Loic Poulain wrote:
> > From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> >
> > Use devm_of_platform_populate() to populate subs in the tree.
> >
> > Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> > Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
>
> There are no children in DTS and ABI does not allow them, so this is not
> really correct or you just missed proper order - bindings describing the
> ABI changes should be always before the actual change implementing it.

Right, this is a dependency that I cherry-picked from a previous
Bryan=E2=80=99s series. I will make sure to place it correctly, or explicit=
ly
document the series dependency in the next revision.

