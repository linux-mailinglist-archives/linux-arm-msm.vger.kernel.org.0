Return-Path: <linux-arm-msm+bounces-92762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIUFHVn9jmmOGwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92762-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:30:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 10571135196
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 11:30:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F2CA33046008
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 10:30:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 599501E5714;
	Fri, 13 Feb 2026 10:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XKqripXH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C5oSPnE6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34299276049
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 10:30:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770978639; cv=pass; b=WJzz6OJ6ebsrJC6qd2LWciJHOfLk7pYJbLJC4CbenV7P+oMXCo8mlH6xwqQPR5LeN3GDSZ6K0waGef8xFI1c95c1PI21CDMI8lY9bWBJDbZLU9wN59qqWgXGeoHWHNU6/kMsHpUh5ro7DD/FHsZph7MV7ipYFB6ajHwCg4evsYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770978639; c=relaxed/simple;
	bh=tU6fLyEcqX+datU4ysa7F5DDXFbUrr7gNIzDynYgdP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RXy9mHPTZvM8YQSm0aAHz8GSqyykkHiIvUAexEOnSMpkPPmxScI1fowZCZvJ2R8T+GRnktY1PoiQjXbbV8SDB3RUZn8sQLNmi0omrJJCVKNZH9bsl9w7Ji9q+33qQRMtxnWqj3IRV0lEscPNMs+HFMa05EiiU2Y3Cu3mmzXN28k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XKqripXH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C5oSPnE6; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D7TGVU3046895
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 10:30:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tU6fLyEcqX+datU4ysa7F5DDXFbUrr7gNIzDynYgdP8=; b=XKqripXH+uwuyyrA
	FZnjFg2mBDE6U4LVFC3Z3JzLQnGZLxGUKFsg7MVtnPHm7dckfFYQIxyZo5hjLGhN
	uF/wb281HNUkjE0J0dJNMbu7VZSd6e2OGqUEfCbsMKxXqxg3CuBI6XYpY7JfGd1g
	qGEiJGSfYUYPB+TxHzldP6evEX0bHZAvL3alBKyfEb1N2sJzddSezUznBRy9xO9N
	qZWc6+nmbnnrq3bIFvAXpc/hz5VIA9RAkQLcAha8wbM0vPuZBq+aMEoTNEcyWpJx
	6rLOB5XYWZqnZbkjCyqp9DFKqwsJM8m1WSNtxqXwhJYdxLkMmebkwBLGA0R95IZB
	RUM4xA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ps2tfut-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 10:30:37 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8954ac30d79so33909656d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 02:30:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770978636; cv=none;
        d=google.com; s=arc-20240605;
        b=DHv+FT+idpIBmQQZHU1DExrnJWFRJS0dOb8MaaStdfTRHO5fQYRNLum0f8koMUUCod
         HiPhPgOf/z1Uqh3dvq/rJT/8m9zjr9jn3EWMjJhN9I2/e+X90TbD2XwF1gwakjYqSA97
         az6I9zA+nzp6jufKyyJ24qUAqzy2ml1drfRUgrKf+Q726Xna9CaP0eXTxYLOM3PKMGH6
         9fx04Gw85roJq1d+3lpn0KIXOMvCBCiLuqzpgREILqUW8w1Z2VLqKDXIiPvQWmLb+oA9
         WImxXsoBZuknvIewHewOZBMUJZYEiPLJgcZDZ9TD6sHYPtw411ZX+PTkDuKo5Ue3nnO6
         eyMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tU6fLyEcqX+datU4ysa7F5DDXFbUrr7gNIzDynYgdP8=;
        fh=obQZxFP/mg/qWzDLowJ9qE3WJGPRCMYvLk2w5Fg0Zfo=;
        b=NwvWaQN7ANF0u57IERXhHzomQaRLRJeCQm1rSM0TWqaHA8fpSbN444vvFpK0gj028l
         DmATHDCPaOmIPydktgt5DZNHnRseBmAbN8R+joAnJzTFKX7MsbuOGqG0/6NE1Ksc0Rj4
         MDjrYWvMx/fR4/V06knRxQMOKKEWJdGN9hYS1YNHNIRzUcXOCsWwsFy4AVyIwdzyaJIF
         AjPG9l14DqxTElSS7LGvUgtIr5ai1RUaouKG1dlrcNQ94xym2RAFg3J1ABCRQNDP/P5B
         t6BbQZfxsnce+pswtf5g+MP2HIXS5h8ebR02aXww48hBRUxAiASV/m1IgIya1Bpkxjh+
         Mh1Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770978636; x=1771583436; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tU6fLyEcqX+datU4ysa7F5DDXFbUrr7gNIzDynYgdP8=;
        b=C5oSPnE62xkT8jQEkDRghTT9ybZ3NwCj/TxllaGad3sYrCVoyLikhRzXSlvjv0QBXX
         yRkc6GATNFNZZa1WrYANCiPfZIVYI0/xUKZ8WPxwvMq4w/Fko6SRRaXP9DfDNN1cgXEP
         ikpXzfPsVJk68/TuEl77qlcUanzY0xs4Pz2T8SqfwFopMWgJyGfCCVna4PPHRSoujrDS
         fIikoH9TyaePdXPrzYLwILO59aphDzOwdEZm5/hbml5swasQzRYz4Y3l07C42Lpdt6eI
         bk0OF7z2Wh4q8dLMtwBpGS3zKkHV+kd4VuI0WmJUfWNzX/yygV6OnQdsejBeaeqnT8Tt
         eurA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770978636; x=1771583436;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tU6fLyEcqX+datU4ysa7F5DDXFbUrr7gNIzDynYgdP8=;
        b=WjDGCnxlqncrLl35w7JFcIRRVfCB0phPu+IrQKNjqYx8de9QsDZy+Qgt636Poq8afK
         Vf6cx+SUzxd4O256QgavqLJ2aDPmD7ovMJ3RbMHokjv4FlhE3FOUkmIog3emI7vKqida
         B/fMPrtL1ZPgBlf2FAUj+1IVWO4aq4A3Yyp3sEIzYH+DO+7yrv8B8mgr/LJsbp/jsTmv
         Tov1SSkrbz3zIWsmzcGaKhKr9b3KUIPoGfOYk2aKYVWLKwEpPEfTYDXkjPVsHZKw6V7f
         eXwOTwFW50Q0Vvt91aqkxEHdCHOYd5LD4o2Jg87lOU6FvRcZdvEU5xVrl8nIh39AtOP3
         ZwTw==
X-Forwarded-Encrypted: i=1; AJvYcCWDMsMix6BULVHal6be1ZBtaFw8V+spPfimvgxMhx0kfkcp6ziapgaE2cof/ehqLAuVDZLLWu3qyFkXmlOs@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2zXJi2/Axq7Xz1O+A22jGl+RYWwTuVdKOCgANYmjjChLHJV7W
	rdDNyBBGnQD/QjVpE9s5mwXl+Ii9zXSQxtVyrcv+JxrVcJAuW8OvtZ8CZJODgnDSnDGVhZp+nSH
	4cR7L5ar06ch1xISWTKwhrhY7VLjdy6sYnWq8MDYlmDTCqq+9XP8CVXUXBTLhBb4YgscMwUaU5w
	uEpzCnLcrcsxzDM/7V4ZDnrNAxgH8HOmxrS7qtg5uz4Dg=
X-Gm-Gg: AZuq6aJ/sxRprAPohjxLO/pvx5HJbjhF2QLT6igRllm9J95rIw4hhz02zdo9B/gxTBa
	HWCMpqk+DDROCVDQA08/5SlK3K0h2UP9mmszfcDmnPnCeItiUDplZM+IULfWlf++yu0QBCLEYmc
	F1KK/1K4jNFy4yzZkQAXdW81iGD0OckYhVb++ZE6hILVEF868hl2u1Y2HfjPxYykbbuwSXaV7Ou
	cYu8dwG9Azp1iDxSt9kphJel00KzCKBxyK9lgXA
X-Received: by 2002:a05:6214:268a:b0:888:586a:cd89 with SMTP id 6a1803df08f44-897361a908dmr15469186d6.34.1770978636358;
        Fri, 13 Feb 2026 02:30:36 -0800 (PST)
X-Received: by 2002:a05:6214:268a:b0:888:586a:cd89 with SMTP id
 6a1803df08f44-897361a908dmr15468626d6.34.1770978635842; Fri, 13 Feb 2026
 02:30:35 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260210152548.769951-1-loic.poulain@oss.qualcomm.com> <d7a6c220-a6ff-4cf3-8c05-762785a7f21e@oss.qualcomm.com>
In-Reply-To: <d7a6c220-a6ff-4cf3-8c05-762785a7f21e@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 11:30:24 +0100
X-Gm-Features: AZwV_QgO5p-q9i2Q9woX-iJHlywyjt9udqKLNHbhQMWQOQROX90lNnBIkrX9EmE
Message-ID: <CAFEp6-0hq2tnYG4xaZ_EBFBBk3Vdp+Er5nCn7HY0F4v3yGumLw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: monaco-evk: Configure USB1 as
 peripheral and USB0 as host
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, swati.agarwal@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: DJoVkiEyVdxje9CsH2_7Qe7ljqZtmtlG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA4MCBTYWx0ZWRfX2/IibMmdt9Hl
 N4RSIfsy8cfuF/bPoYbqrkpw0FTrZHVGJU1R0l674KTTOmfiEEe7lq65PdZuuWoLaVr5t5RZZ3/
 5fhmFIviDiMhwNwRa9EIuVMGlFQjv96D1SlMSjjhz1ldDaQTtk4e1YfAVXFa1weoMlMvToC3OnH
 CWCkMuCtBrpWUwKTXfqNzLN/6t9NCrmGY7Rk8+3Qn4M+c2SOn+7S6CRMnO+k+mGpFtsz9L6q2/q
 S+9TqG8/tGbLmIRPI0Ufu5Dh42HlbgSfHpfGpd5SSZsShNL7Cmzzn2E5rlK0MOzl/mGxogw6W49
 rix5jbgFdP4ChBwd3/3HYP1bIogSyJ9WDe6Z2rvQRdU52kzV2FOvDC0zqi3HArlO3dUnT5bh7Vt
 LJirceS1yZeVw/qEebOkp3DeYaYGSzByPhOe+28c1gGMbLWCvb115skzE9CPdXoG6tjawAGjxge
 3J+DdkD668evULJAiSQ==
X-Authority-Analysis: v=2.4 cv=LoOfC3dc c=1 sm=1 tr=0 ts=698efd4d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=b8aqBZLh7fHaDGu1GnUA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: DJoVkiEyVdxje9CsH2_7Qe7ljqZtmtlG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_01,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130080
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-92762-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[6];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+]
X-Rspamd-Queue-Id: 10571135196
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 3:01=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Tue, Feb 10, 2026 at 04:25:48PM +0100, Loic Poulain wrote:
> > On the monaco=E2=80=91evk, USB1/HS is routed to the micro=E2=80=91USB c=
onnector labeled
> > ADB/JUSB2. Enables that port and configures it in peripheral mode, as
> > expected for ADB/debug usage.
> >
> > USB0/SS+HS is also repurposed into Host mode so that external periphera=
ls
> > can be connected to the monaco=E2=80=91evk, allowing it to function as =
a proper
> > SBC (e.g with USB/HID devices connected).
>
> How are they repurposed? Is there a DIP switch?

I meant that in this case the port is configured in Host mode rather
than Peripheral mode, so it's =E2=80=9Crepurposed=E2=80=9D in the logical/f=
unctional
sense.

> On 2/10/26 4:25 PM, Loic Poulain wrote:
> > On the monaco=E2=80=91evk, USB1/HS is routed to the micro=E2=80=91USB c=
onnector labeled
> > ADB/JUSB2. Enables that port and configures it in peripheral mode, as
> > expected for ADB/debug usage.
>
> Is there no OTG pin routed from that connector?

There is indeed OTG support, and Swati actually sent a patch adding OTG
functionality:
https://lore.kernel.org/linux-arm-msm/20260210155329.3044455-1-swati.agarwa=
l@oss.qualcomm.com

> > USB0/SS+HS is also repurposed into Host mode so that external periphera=
ls
> > can be connected to the monaco=E2=80=91evk, allowing it to function as =
a proper
> > SBC (e.g with USB/HID devices connected).
>
> What is it routed to? The DT lacks any topology description

It is connected to a USB switch, which by default routes to a USB
type-C connector.
In the alternate switch configurations, lines are routed to internal HUB.
I guess it would be ok to describe the default config with Type-C connector=
.

Regards,
Loic

