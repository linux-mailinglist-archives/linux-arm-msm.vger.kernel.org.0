Return-Path: <linux-arm-msm+bounces-117622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qRUCBDBFTmrLJwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:40:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FD77265FF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 14:40:15 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=nO026Yj1;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=c3397cV9;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117622-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117622-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD9F33023DD2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2026 12:33:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91C5843F4A5;
	Wed,  8 Jul 2026 12:33:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B7F43E4BF
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Jul 2026 12:33:48 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783514030; cv=pass; b=sd+2B+IOs6JOlqoWSwIh42e5sHN2qAyQa4e8cmXsjzt6rd/MPIsX3CDvdK9qiGjOXtF0AGTIL3NmqMCiFuR594/0IdyfkenmeMlF5shavi2Gr4OcH3A+pdFCkZUVxkq3E6jTQ5EGB+n3S3mj0nf7mYrmR0ghOtJDYeYQYSlpPks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783514030; c=relaxed/simple;
	bh=H83S0AwhXzq6woEOv+KvSXSUUyNWOFO1aLq4NDVNzbM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mOBe/GGO5UbuUFcSJEjPIhSuqRzPeqMQ4BziJEwcxb/jCw1mZLuyaEHLRY8Deh+KqtR/MSuk3z8QVSJmgsSLCpEUfCAXmDqA/mSaIGV22pVFgzEbPO8g0UCxlL4YKEPtNMONrqTm4lLbiJqM20EiW2aomKMamJI1MsOahwwpf6c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nO026Yj1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c3397cV9; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 668C4Bpg2752259
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Jul 2026 12:33:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nHyUAQeqm2yOLa8817IrC/2YhTUSDHuf7WyHnXyix48=; b=nO026Yj1+2d5lC91
	Mij0+Pis4QhyNC8DCTXVTYIefT/931idEd9hotLnHlC+lXnzXQFQrwKEi62p8AbM
	jimt0KKIxUHFzUobeCXI0fM4qU7kJLXPvvwF18Nyi/A6EA2OMvG5CtB5RUtZVYqc
	NPlcSQ/dCw8Tp54PRuwrRThLKf52WpgxglyklRIjgkRLD0HjySkBjTcquhjtzg/x
	CWvT8ZzjzB02nMFD4gbH9c9jnsU3Si21HEThNesnfLikcMOzxcazYPIW03BW19i9
	Nooaw6EkareqyXhJxOZ4UNosySshMiFJWH6yh1Zf7LUcuopxVQztRw3Rq+Bv4vJm
	o378xA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9csstdsb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 12:33:47 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8ec45d9628aso15151486d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Jul 2026 05:33:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783514027; cv=none;
        d=google.com; s=arc-20260327;
        b=KzUEZMi71HyDtjstHcHI6breSSRRScLOkif+redTeQgS42mHThzEpgHgClFLlDVqkH
         c4ZuaLuCptPTwAL0SXUYumtiCUiTWZHmkXxGdBLqkDBp1ten9fMMCq4EiOmhKJv0KKIk
         i6LtvJ3VXPypsGnfAeYul0MZDbm+b3KLT/euwOxF9R6eO/2Qx2p+CUu7HO5rfjoKl44v
         D8ow+sAo4rc4jAewgB0NdoBIudNbKfPgBgQ+7LGaYA/tDU1Vdiw5GBnCL6FN0fWYpK26
         Ef95iGCJnF1GIQSiGjJSqFt/FaDPNtVxkqsAmkQ77BeL8DlaY+/O4wvB+0ds8tZEH87a
         pZkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nHyUAQeqm2yOLa8817IrC/2YhTUSDHuf7WyHnXyix48=;
        fh=XqAWYQnyJ+Iek7oDkwKgbuhqhemRUxfopf1Pci5qWrE=;
        b=bao9I/i3OtA0KEVOb4vUwNwStw3AKdc2n3Si6smMhAUO+oC6kCCHCW16Fwvu3HFdlD
         Sx5+gg1ed7/EiYghmA1GzQMs7LO11TMf6H1ugrfp6p/ybUSbYObVPiJnwsKqHlL05k9s
         q5g3CUiL8xHRgJnyDJx1nM6jt+wXRjAISxXkOmvw+pAUcih+ADeIRL0AIhEdavpF3Erh
         7PB9vy5Wb9cs42y0M3+D5C8o8XOp297cU2W4kWcTksYDnjD6cEXE2yduUc9+cN3hSSIW
         8n47+fN0lRJUWcEHAOyY/5cUjA3+Bbz+gd3p0cnfDclmWe/lFAweuyk7PjX86QDn44OE
         mjYA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783514027; x=1784118827; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nHyUAQeqm2yOLa8817IrC/2YhTUSDHuf7WyHnXyix48=;
        b=c3397cV9MfZss+gfozt0bTBYRntW+uMaUzz36DneJifbrO5d8x6tVt8Ig8YYOjpcFU
         /fwwxpLu2xBIATPr/PBZBi2f3XcnK970T6r7WiJv+qt9gnO3+f9Fw4TZSBL5UunuPM0C
         NIRTnecH0Dcnm67WYjN1hazwapWaY70m3n6/4eziI4jsnbKuK9PwMitf39UEOUsOJUHd
         L1V9/JBXi1fkXOxMK9Zi1CeJL/8qBDOd0HvYrih1Ebb/AhRgXv6PGQZ/3HbC9+5xPzji
         scpIxdV7ZKnowanRZ16YK6SNKUnW2U42rXuctyix7rU3TJ74fpwk2QXkGxJSGij78CiM
         6UPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783514027; x=1784118827;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nHyUAQeqm2yOLa8817IrC/2YhTUSDHuf7WyHnXyix48=;
        b=CFJe/+1+bwizJHojLYzQJSHodgakwVF7y89r093Ed0N+8lurlWCAUaesE5UrT5bV7/
         DjCwY/b6KI6GaD1wJiTUW+sEd0sROB0yrILYyZD8sBSuA38MkeXpZjzVtIFZCcsVgaRI
         r2uPA2/moGlgYaahV61UrftfLQszPevGVDxXKR+kHdNc5L4aYqwcFjfVA+6T1DZ+SU/X
         oSqVW7nLg6Ji2DR46pxyiK+LwnFq/Qo0+ITgYhpumVehD1GdIyeQu42yGbtKh9uNDRlU
         bbuk87M2oVsLnBnDtYClXQsPzMK86hUQ6TPoQMtTOh/qEAvOqJUsRJ0tJQriWKaa26fm
         9Ocw==
X-Forwarded-Encrypted: i=1; AHgh+RoLM/PA9DyVzdYX5NuHEy0X0Ez3NJOev7meAZ6eOstj5aRMSRsty+BIt7yIQ0evGVw23OHSdlUjijjAn1wZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxJQHvf6G8oKfOpwh5sHoTzxpMBRTJapVOcxMFBOIudBiHMNTfU
	s+lOjCuz32VoGGlFU837izIcZSTfKZ3uk5uyoxdyG4h4oSmKVsYMAxEMV1ClTgU+XvPs8EEgcar
	zGtIPCZnUcNFmL2eFEfV9rhE7VVWkoE6Ew6gKtMWXzxxS0ycSYng3GLxj0LlyCpF8yIn/DWw/Ai
	zH3FRvezfQzg1NJ0+H2OdLERV1Csdh+6V9i34N7to4dh8=
X-Gm-Gg: AfdE7cmt5xqSMO9VA3sSjNkOKkNPYacLzAC6wiZVAhQ8WX7fIYtqOUCQ6t2kiEP4P4p
	lhctp5NiQJiT74Td++e6nlJtiB7hqQx61pEsiMt9hQ7GAqRxJ0lBz3lvGMUpMrxF5CUEk9rQGqA
	gg4vqofdZd+W4S+n62UHtEW6de+DFiggAhMLkaRFZu0juzN7LO9Cw0BObp1DvdS/ga+JMEeR+Sd
	Zl6WbuOQKUnq7HxIl27lBTAHgorJG+q4bzRytuU29lVzbmBMaScg/vUQyk+3p7TsDdmxURR5z1n
	bK5ir7tc
X-Received: by 2002:a05:620a:2b9a:b0:92b:641f:ea5e with SMTP id af79cd13be357-92ecf4e9a7emr214271185a.0.1783514027273;
        Wed, 08 Jul 2026 05:33:47 -0700 (PDT)
X-Received: by 2002:a05:620a:2b9a:b0:92b:641f:ea5e with SMTP id
 af79cd13be357-92ecf4e9a7emr214267885a.0.1783514026767; Wed, 08 Jul 2026
 05:33:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com> <20260707163703.233405-4-srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260707163703.233405-4-srinivas.kandagatla@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 8 Jul 2026 14:33:35 +0200
X-Gm-Features: AVVi8CdcEQxDSYQbGM3A0YJ2FGsOv7iL-bQUXTPLTW45XYvR5BZI2JHmw7675-M
Message-ID: <CAFEp6-1VVmF-hrpPf34bFiYGOaa2HU9Pcvupt14MCjvW2-4VAA@mail.gmail.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add overlay
 for Waveshare WM8960 Audio HAT
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=EtziaycA c=1 sm=1 tr=0 ts=6a4e43ab cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=5sf5Z9IX9qwckH8PYdEA:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA4MDEyMiBTYWx0ZWRfX0/o7thD7NPYn
 N3Urpni+BP1HpQR+ixGrJnFb/6MbKGnyNLQHgvBfg3Dyb9ocj5qvwjobKvAq/zi9+qarGG+1LJR
 9DRpZ3XWlXX9P3u1CxftnqbHda4f1Sr5es1SPkDjciVdteS+K3IR5bjey+1CMNJSQmNH9MpMEWm
 eMECpPLoStQQFnActs6PnlG4zIu4lWbdCiXxUQIBMy5/xNyvokagm6RYOhtbzIDrveE5ncykIpS
 TVNS/vg8Be0tbTfdtG9GTA13K0h4uoQFFc3xKyPIIDL9xs0FMc/7BnhFyt2upnSod/AeLOT6H10
 qhItIdWxg5S13dNY53MA3LA1Fd0djJuiVKglluKcj/BNMuvGgvYjW3NxFEMdLnWi4RKrram1q1p
 kRQyR37luFoI69POYXv+q0jfAr82keRD/SZKEYOILV0WfdVNclY8sXZtX9QJBoe9b0ozrZk9gIU
 1gfCBmA2+QQa6ywt3fw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA4MDEyMiBTYWx0ZWRfX7f6wuJy/EuwR
 BtPtMoOVXDMg+0KxTV5Igl9YzvTcdTW95o1dRrMW2DaKsk/2NLja7fdtIYL20iU4bX8JYAnjzIE
 fwD2b+euzJhEjXAsA7LbyB/0BiGPG2M=
X-Proofpoint-GUID: FH2dBKJCDuQljwgN-vamsdeiip1yaWX1
X-Proofpoint-ORIG-GUID: FH2dBKJCDuQljwgN-vamsdeiip1yaWX1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-08_02,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607080122
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
	TAGGED_FROM(0.00)[bounces-117622-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srinivas.kandagatla@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,mail.gmail.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 50FD77265FF

Hi Srini,

On Tue, Jul 7, 2026 at 6:37=E2=80=AFPM Srinivas Kandagatla
<srinivas.kandagatla@oss.qualcomm.com> wrote:
>
> Add a DT overlay for the Waveshare WM8960 Audio HAT connected to the
> 40-pin JHAT connector. The overlay adds the WM8960 fixed MCLK clock,
> the WM8960 codec on I2C0, and the corresponding I2S1 playback and
> capture DAI links to the sound card.

Looks like this hat also features a button on P11 (gpio85)?
So it would be good to extend gpio-keys in that overlay.
In that context, maybe assigning KEY_NEXTSONG or KEY_PLAYPAUSE?


>
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>  ...uino-monza-waveshare-wm8960-audio-hat.dtso | 100 ++++++++++++++++++
>  2 files changed, 104 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-arduino-monza-wavesha=
re-wm8960-audio-hat.dtso
>
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom=
/Makefile
> index 5a1c56cf98f6..27cce61893ad 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -59,6 +59,10 @@ dtb-$(CONFIG_ARCH_QCOM)      +=3D mahua-crd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D milos-fairphone-fp6.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D milos-nothing-asteroids.dtb
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D monaco-arduino-monza.dtb
> +
> +monaco-arduino-monza-waveshare-wm8960-audio-hat-dtbs   :=3D monaco-ardui=
no-monza.dtb monaco-arduino-monza-waveshare-wm8960-audio-hat.dtbo
> +dtb-$(CONFIG_ARCH_QCOM)        +=3D monaco-arduino-monza-waveshare-wm896=
0-audio-hat.dtb
> +
>  dtb-$(CONFIG_ARCH_QCOM)        +=3D monaco-evk.dtb
>
>  monaco-evk-camera-imx577-dtbs  :=3D monaco-evk.dtb monaco-evk-camera-imx=
577.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm89=
60-audio-hat.dtso b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare=
-wm8960-audio-hat.dtso
> new file mode 100644
> index 000000000000..cf7b6a220bab
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audi=
o-hat.dtso
> @@ -0,0 +1,100 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + *
> + * Device tree overlay for the Waveshare WM8960 Audio HAT connected to t=
he
> + * Arduino Monza 40-pin JHAT connector.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
> +
> +&{/} {
> +       /* on board fixed crystal */
> +       wm8960_mclk: wm8960-mclk {
> +               compatible =3D "fixed-clock";
> +               clock-frequency =3D <12288000>;
> +               #clock-cells =3D <0>;
> +       };
> +};
> +
> +&i2c0 {
> +       clock-frequency =3D <400000>;
> +       #address-cells =3D <1>;
> +       #size-cells =3D <0>;
> +
> +       wm8960: audio-codec@1a {
> +               compatible =3D "wlf,wm8960";
> +               reg =3D <0x1a>;
> +               clocks =3D <&wm8960_mclk>;
> +               clock-names =3D "mclk";
> +               AVDD-supply =3D <&vdc_3v3>;
> +               SPKVDD1-supply =3D <&vdc_5v>;
> +               SPKVDD2-supply =3D <&vdc_5v>;
> +               #sound-dai-cells =3D <0>;
> +       };
> +};
> +
> +&lpass_tlmm {
> +       lpi_i2s1_active: lpi-i2s1-active-state {
> +               clk-pins {
> +                       pins =3D "gpio6";
> +                       function =3D "i2s1_clk";
> +                       drive-strength =3D <8>;
> +                       bias-disable;
> +               };
> +
> +               ws-pins {
> +                       pins =3D "gpio7";
> +                       function =3D "i2s1_ws";
> +                       drive-strength =3D <8>;
> +                       bias-disable;
> +               };
> +
> +               data-pins {
> +                       pins =3D "gpio8", "gpio9";
> +                       function =3D "i2s1_data";
> +                       drive-strength =3D <8>;
> +                       bias-disable;
> +               };
> +       };
> +};
> +
> +&sound {
> +       pinctrl-0 =3D <&quad_mi2s_active>, <&quad_mclk_active>, <&lpi_i2s=
4_active>,
> +                   <&lpi_i2s1_active>;
> +
> +       i2s1-playback-dai-link {
> +               link-name =3D "JHAT Analog Playback";
> +
> +               codec {
> +                       sound-dai =3D <&wm8960>;
> +               };
> +
> +               cpu {
> +                       sound-dai =3D <&q6apmbedai LPI_MI2S_RX_1>;
> +               };
> +
> +               platform {
> +                       sound-dai =3D <&q6apm>;
> +               };
> +       };
> +
> +       i2s1-capture-dai-link {
> +               link-name =3D "JHAT Analog Capture";
> +
> +               codec {
> +                       sound-dai =3D <&wm8960>;
> +               };
> +
> +               cpu {
> +                       sound-dai =3D <&q6apmbedai LPI_MI2S_TX_1>;
> +               };
> +
> +               platform {
> +                       sound-dai =3D <&q6apm>;
> +               };
> +       };
> +};
> --
> 2.53.0
>

