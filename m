Return-Path: <linux-arm-msm+bounces-117895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RMQ7A0pXT2oLewIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117895-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:09:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6845C72E123
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:09:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=G4nFeJco;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=BKall1Iu;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117895-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117895-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D2FCB30427D1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:03:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CF583E44E3;
	Thu,  9 Jul 2026 08:03:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 137223D890C
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:03:28 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584210; cv=pass; b=ZPjQZ5LUn3qaLJkK5j7zSosM8IepqoARnmZ54JpsXF1ncadPij6ef6Wq6554jkdNTKTEbvGdIEMtY7wbzOlClKFvWPQlMaoVeO/5BaEpIHy63EOvNYX8Ujqq47jmmnM8LzdJf/S16CcHkq0Ktf4GUsuKk0GIRjt367eIPXtUj3U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584210; c=relaxed/simple;
	bh=xPU00qGmkekBWOv7JAHrek89qumcbSYzEdT9g4KfceA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZAeK5NPvOULLfxiJynY2I84DR2J29TiRULwmClFuaInWDmuLYo6HhZdMaheL1GfqHUnoah2cyCTAroTt13D7pEwv2q4ZKGD3/LkGoeyTb7FjMhiN6PYV7nTsZdbk0v/UppB+7aggH0cc+3M2MTcReSPoT4uCakgoBHUgybIQRN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G4nFeJco; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BKall1Iu; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960G3w887939
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ny0lUMasGBKz/MofrxgPCGbXZ9Lc7jZtKzpy+Td+EMM=; b=G4nFeJcoTtXyscNT
	CBJ/T3LKpoOLtVro2SUW0PrZz/wwmoGoPJiba3kAu23TZdLZt6YCj0XDwuUpwkir
	XurLxHyptvxynyFpdL9IzqwlwQ4H6VFYMW4BCNoT1dRT003R1Ds7+f1ckGLKt8wV
	8hiWTlP58ThmtEEDF5+LUiR4WrJyv7oH+hlHgEqEQxZs8r2h15TqH/cRIg4UcHAx
	ilP/WwFp1aiohQFd4DakFpG09mR1svcCNjMBYHUTfF+Z0v91/5RBJXj8QZ7gbLyF
	1+pdmuU0e/imysE8gPoeW6EzDEMCaYkEeBZ7C0NrH/KS+X7BxI6z+78EjjP2jsIQ
	J1GS+A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq33ena-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:03:28 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8f0867a75ecso15079566d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:03:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783584207; cv=none;
        d=google.com; s=arc-20260327;
        b=kkwT98YXvKTPP4IgbhEu8NfHkuiZ4n/ykGawDyxU7SR0dAie/6ktFDUXwP7pjsL04E
         eOtpvc3z185+NTulYdbYxgrC8M+iBELhe7znubWunt4HkzYSO6TPRxX0G+YDN6+Y71gG
         lcPsPl1KilxpXdAmTDwuolly09NN5dBTWuZXuYS4uPT0r4D02M3bW/dK0vPkLt/l9okK
         kxPZs5J4omairDzvlYi+1pg6lZvXAjfpM2nWiEzuaDAowa8TK9Lo3eDsWlksz0kJviiz
         L9xpXIatYXB9yz5CK1bNW2u6vCygXTMG9GW1AJHl+I2zqchEGIQCrCI9GAPFj8T42iDd
         HS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ny0lUMasGBKz/MofrxgPCGbXZ9Lc7jZtKzpy+Td+EMM=;
        fh=qOmkHDUZf81NqIK8Uj+SC8izxh+a5TaVdtp7pwlK1cQ=;
        b=Xm4EdjGOuizghev+fejxtI16w/RTw7WSiHU25rL7wsrvKNaasijQj/C9tVnyX1THc3
         0i5gD3M4DdeTdNbvm2VgnaJtqZn1X/dKXBKlusMKof7ABPvtdumN0w/n32PfBfNbp6Ut
         VGFRTXsMBC6S74bBq4KQokrfVTMNZ/luxrQ4YJ/VfT5VzMGz3ipbUO8VChnXtni7Ibtx
         W8QCWWcysmdCJ4Cr/VOJXwyXvPmoSU3a/0pKbna/Qte5QvomtPcN8s/T1hNUUo3g64VB
         PiQswp//LdNy4H4GLO/gVtEZMtY01rk5ZzPAXXsqZoq7mwjxgrcf6C0rht0DdeLf+3Tc
         k1hg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783584207; x=1784189007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ny0lUMasGBKz/MofrxgPCGbXZ9Lc7jZtKzpy+Td+EMM=;
        b=BKall1Iu8lVsZCvhOv855wvxxfm9ES896wDAZm0hzXglPpOKBZw8+AZxjVhKJcF2CU
         6oOd9ppDr7WAb7XWbQyEr+k28PWUs59uDR+94C1x4dB0P4EzPsFH6avtNsPmPbp6VWJ6
         aU4Z7zEYIpxBsThKn74FwRwb1kTz6yRziqxqHMj4Fp8ZHE/nAN5KYJ+h0ujwjqjWCJBi
         DoN+dfA3aloXKp0ANmASiRH46PV70DXHxO23BSLU2/LeVXSc925iabVcZZnzYUoAPzIn
         bLWu8I2VXJkcEmonkTQjGXzYRDkG50mWuGvtI/ZGBoNX3C7R4/ml61TKza4Y1XFWVUV6
         7WlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584207; x=1784189007;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ny0lUMasGBKz/MofrxgPCGbXZ9Lc7jZtKzpy+Td+EMM=;
        b=M/cp6LlseMeH+JjkBqPAMhXkFHsobIRCb6UeLMORMgwzJyUTVl7llC278r0pmFnnwn
         UvI/vb14W7O5l4VTOAr807GHnzb5PLX3fAGqSLXl9fiapKP+f/04E4H/wxBLENK/lMjW
         YJcVR8FxuDQR9m42VFMqpPs6f/1lbffTjjwz1vSVxt0Y+q9vf3GR73n5QtKwFIPqfdx4
         /LpfG6ZjkwIOfA/nsUu8g3d4/OAqViGa1XH13ULh4gbIUCbjPE6o76R63RrvfQJeghCf
         OOyydcHNCskYF5okV3e/nAGFmuyb+MXA9wE0vRGP6Ti5ArUgkz8Hf5b/FVM+Lss5aQiz
         QbGg==
X-Forwarded-Encrypted: i=1; AHgh+RrcWfyahXNFFXW5huGL88vTHAHWnpldlUtD+mTQ6paE0S86esehytGOpeg48RLnGWLuQnHJiRqr+iXSh2Nm@vger.kernel.org
X-Gm-Message-State: AOJu0YyJ444N6Tpeg9SERZdvwYyVoTPlaTylZE0bJ0yjMJxoEeB/k5e5
	Qlp/oHjdRqaRLFRuvQ3d27sJRg5m7jq8qdZkglMZyQk7fgftPOu6z06KIXMRJPBdDa7dqiOEnrS
	EDamaHVxEBG9bDc/cxqPVxZddtdVgDl0xp50Ubc+Ow7hmkU8JLBkeyQd3KLDXTE4Zabj3tpOQ/x
	dt04mNq5A52OKhdVs7DWlhgGaAGuXASf/2JAcWnzX+4rc=
X-Gm-Gg: AfdE7clHyr3QvTaV44p50y16HRp8jjfKWAWoBXAgJERh9yleemPHZk5940KY6DMoeJU
	fAtqo1rS+FTZZ7qaDc9jSetasATjb81sHDfIwjjZgwNA5qYTfGbCFID4k9Km6lehv80m37uTgcV
	RcUjo2IGIiC8Eno8N/GZcycE7T8WeB2ON01Q6HKdFyIcJifeMktm3vH3R4R4lpTtNv2znToCxxY
	7IfoJ8FzePWze0xTmIwjQQRvFittHujoq0dwaZyBr42X/R42vMss92z3povIUJ+17r6lPte1zJP
	6ckr9mnpRQ==
X-Received: by 2002:a05:6214:5b06:b0:8fd:6e22:c7ed with SMTP id 6a1803df08f44-8fec3a00590mr64055546d6.62.1783584207527;
        Thu, 09 Jul 2026 01:03:27 -0700 (PDT)
X-Received: by 2002:a05:6214:5b06:b0:8fd:6e22:c7ed with SMTP id
 6a1803df08f44-8fec3a00590mr64055106d6.62.1783584207066; Thu, 09 Jul 2026
 01:03:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260708-buttons-ios-v1-1-f19feca52b60@oss.qualcomm.com> <2buu6nb2oxk5r3okzc53yyu6f5que5mqjbwiwxctypwzrpqmma@q65jf2hzr4bn>
In-Reply-To: <2buu6nb2oxk5r3okzc53yyu6f5que5mqjbwiwxctypwzrpqmma@q65jf2hzr4bn>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 10:03:15 +0200
X-Gm-Features: AVVi8CeKsKTVfOVvU6CclYadIUA3_4HiioMsx5UJodvbTbzgMTxGqjSZrB3G8g0
Message-ID: <CAFEp6-09qcruk8QkB7dyaW1+Fc_FPPeD-WOTZYHe0Er2acPC-g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: qcom: monaco-arduino-monza: Add sleep button
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: q6r1Is_oKvAZgyrHKJq54HIcC_U6e4nC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NSBTYWx0ZWRfX69yMrdzdU2Sx
 P8RsmMfs+ZRHS7KwIDwhooFYTCBAsBIv2ttMQs8MjblaOpoAXzZOw8J3ZBzgve7I+qaPYTi30Jy
 6bYpEe64/u6Ps6HMfw+itPJo3I7KxkF1SRt30ayO+K5btICMYGjVOG8gQpdxjTeoGR9hEle15ad
 GgD1KIw3yi6CpjJEe3/jovLKUyN2cTlFWGyUS/gr77C176/1WhFF8IcQd+8/+dWx9DzZk9LrHaF
 Gy5/I+Vy/u6if5N8HCmPzooLdyff7T653iPFZLcbSaFbTm/eMmL9d/4TN2YW3xJz+MFeInci2f0
 mEbX15I7Ljna6eg5aLjz8WjZxa2r5fnRdp7meaorz9BS6VUaIIe6PEtzDapSgJnivDUb2Pnhwlx
 r82NQoJA3vLocNzL4SxebBtnI5Z2N5YQiEO2zrwecbHhdf4ueHCJX+BJPOc6dq3UXatNuzqGUNP
 HIsaCi686nfqAj9ONkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NSBTYWx0ZWRfX7uTBB+T+U4yC
 n+1F7Qk5sThqbCw0DyClhHUUO18dRUnijxm49Ov+rURcckq/J7qBwTYleN2SRZQtm5tvyoWCbL2
 W5djrEfQFiDmCXgEoEuKViTZiUR1Klw=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f55d0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=oKb6TeXHuGpcAoJgDn4A:9
 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: q6r1Is_oKvAZgyrHKJq54HIcC_U6e4nC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090075
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-117895-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6845C72E123

Hi Dmitry,

On Wed, Jul 8, 2026 at 5:48=E2=80=AFPM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> On Wed, Jul 08, 2026 at 05:30:13PM +0200, Loic Poulain wrote:
> > Add the board's horizontal button connected to GPIO69 as a gpio-keys in=
put.
>
> What is horizontal button?

Two buttons are present on the board. The first is mounted vertically
on the board edge, and the second is mounted horizontally on the PCB.
Their associated signal lines are respectively labeled VERTICAL and
HORIZONTAL in the schematics.

>
> > The button generates KEY_SLEEP events and is configured as a wakeup sou=
rce.
> >
> > Note: The button is actually connected to the onboard MCU, and forwarde=
d
> > to the SoC via an active-high GPIO.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/monaco-arduino-monza.dts | 22 +++++++++++++++=
++++---
> >  1 file changed, 19 insertions(+), 3 deletions(-)
> >
>
> --
> With best wishes
> Dmitry

