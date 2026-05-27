Return-Path: <linux-arm-msm+bounces-109989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gKI1JevRFmowsgcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 13:13:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C785E3378
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 13:13:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7D5FB3016C6B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:12:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95B093F0774;
	Wed, 27 May 2026 11:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iu20u3Cm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DQhKP1A8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEFB3EAC82
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 11:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779880343; cv=pass; b=Kwb3yckaeXm+vpu6sRmbwoDCm88vyhJXGKLS+O8fNtaz41T5Ik2wUPXLVyi9WCK05VrjUWcH69L3REIV5Dnrt8pDxN7z56K+2sqsS9qzlHtuUIU6c2So/xvhquxWar9jgCD5i7YPlbbfDS5afBHGMeKbaAoQGikog1pfz/RET+o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779880343; c=relaxed/simple;
	bh=HTceJQna5R3QW3WJqxkF236wdYrDkM0RWh/xFCEyxIY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dW6SbNukge311KeLLLuJ4VUizdx5knpf3XAmw2ZJ2y2r8tF+YAUI2dq9bIXj3P9078rVE8FNgMdqSXVkXGUBSlLmXwpvZvKeSkBU4CN00Bp4Ztc4wuKV4JLSLBvLwqKydr7dqr6AiB6xIM1uoYtWhuUHMvIJMhMTjr1QiIPcAlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iu20u3Cm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DQhKP1A8; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R8mWII1040821
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 11:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cwRzmP75XJs3nF9sZpC7Cjqku07sxaiJ9gxjgau2Vvo=; b=iu20u3CmaeBbyCKD
	WmeGg4dZg2KuyOUguEha2GyUNyXtt3wEepOGGB9icWJ7cEG2hwGDP1bWW/Zp2qGO
	0BCceIjqSn32veNGB6+7ma1Fgi6PS48U93k8Zkp8u49YtxDso/Bv0d9Irvd6WV78
	cS95eS7bLEWv+vqm/1tNq+2dPruW3g+miIY8Etk1K3v7MzbJixa1uxKG/AxD+YxK
	6inKRD5xv2hJCBh73sUGXj3XCMRPuaoYDcJN4gJ6O9BzqdFhuGyEoTHVxZt+NbVo
	wMFYmqF/nfZI7kePbd2wivV4zyGGfYIY7YkW/1BS4SipfSlN2LCmtIG+XgodsOi0
	FqbkWg==
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com [209.85.128.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edh17b1q6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 11:12:20 +0000 (GMT)
Received: by mail-yw1-f197.google.com with SMTP id 00721157ae682-7cff695e4a3so146017677b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 04:12:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779880340; cv=none;
        d=google.com; s=arc-20240605;
        b=Uv+fLciCeAY/vUDVcD0UBq6Etmqete7mClaVmDVWF9hpxscjKNM/hmvhfsATjZupQI
         0lYYrkEzxA4Q1AJu3RZOicsisKFIrKoc0J2BCNxS0QIvVh2LgmCbvCD4A80nosSnLNFz
         XoOh99vDG+fD+UYCWoEj0OLKpeq4fjTzPalTN8nxYveoQOp9xY1UP35S3zGHDmTe3Ezi
         nxr9UnoW92pa4IEhDC8ZFsIoNk4rPlA8SE8ucz1ht5gPkfRFZhMqnzQqmkVdkfVY2qEx
         RSItE2upegRTe/HA57zpxAoEosZCcRbesZDW6wIDK89OJIv0FNUcX0kptaygmr4mIluu
         sS2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cwRzmP75XJs3nF9sZpC7Cjqku07sxaiJ9gxjgau2Vvo=;
        fh=5UMnc6fgudJtFKnmemnqP0YyMM2xwxRyYsWW/BIYrpM=;
        b=IOrcP1Hxtvjd08jGM/8w8p8AS4Dt5+TI5wg6vCQlTry1UWiLkVth8rFjAxmczliIkt
         8cPLTJofD14c52U9k/X52U7FUv0/DGxBytsrgMAtdHh5e2H6zVwQhUH/tVy/VgdkZTl3
         mjm8e9wUIblsIUoRuSNFnUnlmTiwAt1XrnGC8FVAcziSzldS5glZbkGCsk6viYw1I011
         rFCVYsSYaG6RkXscIhXXT72UywVfOXwTNlR8OjbiJfaLK0LjpNpA08cSbMhyx8DSji/G
         8I0Wf+Z8F9X9StsDKY2Qol+tCCnVhvE80tcJ0hD84TSKz6BBehyW6MvYxwnSpigLpaI6
         X+1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779880340; x=1780485140; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cwRzmP75XJs3nF9sZpC7Cjqku07sxaiJ9gxjgau2Vvo=;
        b=DQhKP1A8gV5NVdAHhj7mwAu68RdJ/a1WMDFLMT+bFMBYJlXZ7Cswxv7Ju5BpsABrnX
         lnki8s52NBYDiqD7EQ/G7wMKeM9a8JFb0gHNpLcCY+KE+SH6WXwNCxK6ABgNMNeta+g1
         M8kdKMBxtrsotsBY5sj1YpMyuBkCCMibdFqP5jw8IdSs2YiEH4WkOVVok3LB2kGuHsa8
         KjJqIjj6pUYBC5KQVZgEGD+AF4tCGtqBIxJGHnRWO5Foitd+AqvVtGs2/GS4B+d2MHBl
         PU2SPUtp8vrmfCDKSr9bU00gCJm8twM/kww2m3kHa91eghJ1a3TC4+VJgm2ph4kJ32L4
         YraA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779880340; x=1780485140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cwRzmP75XJs3nF9sZpC7Cjqku07sxaiJ9gxjgau2Vvo=;
        b=fe3XMJ5hr9L8b0DoUcxUXh9mOd5wJ31dB4aCw8lt75arorb8w73HVe2mb5vSy+1Med
         YVEj+QBfdp4Ts8qsFvURktso2zjxttdu6psbv+DGx+p2GqCnQm9BYPuSpBvqbDVsy3JB
         C6jt05DzS5W9YLkKN8qTzBDBZ7X1jrYjdDA/w8zgoXwd+vY0t9FP4dpNzg9Fm+4JzwWq
         QTYmU0meGo2PC2ELv48Nwfl/lU4cQ8Dmasb+QYO+os/uVkiE5VdHrSPmxT5vBJmcBvqC
         2t8jtRw6SNTDP/OkFFnSYuN9NdpB4WVonSkkDezm6/WvfHHH4fv5byGlbipVa2qGTgqA
         fYfw==
X-Forwarded-Encrypted: i=1; AFNElJ8rk9j9XVA+KwAAFlDwHCLro4GFJkVK2CgyOAwP0q3yKPzh2asT0u24mgLA6aUYzJYZ/qhH8V+32cqN+8Mv@vger.kernel.org
X-Gm-Message-State: AOJu0YxXRlXuh7kjW/oi5dosuXDCT4DPjyn8CJKaLb9ti+KEp/LEH7PY
	8RDXznJGStkN477qxDicoTSE3QN7iEVhOSjqa0CpUHqFyUNhTPilADL7LrkbIADCQgSBVy0JTY4
	kBMsqo6YMPFCxqzV7Ic6KGlMxFJNK2OX2yErw6AOAx/1r+c0Nx+FJ0YAXWXP7tFpNzwqR0+Ly1s
	JLMmPKXzRf0WMgvdQm6/dUCXgY5c4ayhF+QOE2qLUfyADMHsOJilY5EA==
X-Gm-Gg: Acq92OHI7DObLItu44YfzXY0Xp8WMcQF2JVrld7DcumlUKhM+Oe8BblPEP4Moqb8ZST
	RQxPSsS9e36pjE46Sw2tPU5XSCZl0Wk9MLRj/iehaEZFHHdwDbFa4SZ44wJoQfYvA4/rfKbFt8r
	lsfhty4sTdEbpZbFlniJvfZr7RHHVnoTklT/v45sXUVeGeOIL4qDWDHZMtiumQXDSolv53kl3Jk
	QcYhGaDGze/tE8QGA==
X-Received: by 2002:a05:690c:968c:b0:7bd:5d03:dc18 with SMTP id 00721157ae682-7d3356de607mr235106207b3.29.1779880340475;
        Wed, 27 May 2026 04:12:20 -0700 (PDT)
X-Received: by 2002:a05:690c:968c:b0:7bd:5d03:dc18 with SMTP id
 00721157ae682-7d3356de607mr235105977b3.29.1779880340058; Wed, 27 May 2026
 04:12:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511-linux-next-v3-1-3e22737e71eb@oss.qualcomm.com>
 <920223a6-4e4a-4ebc-8a1c-c37d0923a470@oss.qualcomm.com> <a79100cd-0e33-4eb6-9452-c4458ea40bc0@oss.qualcomm.com>
 <b71f7653-78bb-49eb-b4c4-3fa8bca3e705@oss.qualcomm.com> <CALC2J1PqdKGozWX-WapCZSkjGZcM_JjOX29HQ8r7ghKyaBXj_A@mail.gmail.com>
 <6bad01bc-3329-4a8c-a812-a6d058e15efa@oss.qualcomm.com>
In-Reply-To: <6bad01bc-3329-4a8c-a812-a6d058e15efa@oss.qualcomm.com>
From: Qian Zhang <qian.zhang@oss.qualcomm.com>
Date: Wed, 27 May 2026 19:11:43 +0800
X-Gm-Features: AVHnY4Jb9evRIHABNlMMFY1oDShTMB9ty8jTUMmcbx16UVg2dcBWzM-LB1-fM_U
Message-ID: <CALC2J1MKV1D+9kzux_wu4S6Z5WKMOBw+n3+1PTk1fRJn8KaBAA@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: qcom: arduino-monza: add WLAN enable and
 rfkill GPIO
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: xE1Qcg-ZVv2Yuv00RYUcVToBTC1H_msn
X-Proofpoint-GUID: xE1Qcg-ZVv2Yuv00RYUcVToBTC1H_msn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDEwOSBTYWx0ZWRfX0v+uMmsYvJuA
 SO7nHqI+74IsS4vO+dq5q/IJlyeS94oLeX0Rf/kXUdlWKT+rJPTgf4a8HoM+zHSYeveKoe6T3Ho
 CwJ3I4pn1oLvkTZFHohWF9SdEtNvTwjja1HGCaJt2X11fAp9fobZLJFGt5swVz2OVDA16qA+c6c
 0knEJ6e/KC99pHmq1FjiENoxf18SCWnpso4SkVGsgsMIquoD0kc4n0UI0GCKII8rpfliSplCtPl
 CQDh6k6L7AhJ3NtzoVpqANLZYv8pyMF7yg7d/Lj6elB0TbhMV8YUTNqKPmoG82YMFNfsO728Vr6
 W0SpCa3xn/jD6inoT77SUZVPXnF2rCfftO+16V5NgTsBIPJElnxKzum/nQjDjyYwIT7FXJxAoQC
 IWWQLBfEOmb4SBt2CGX+kSospBEhkrxgWcZBrxmXo1lRhWeosK0qUWGtCQj+In+ISSqHDTUiNA6
 6hGJv5QgtUba8GTLVKw==
X-Authority-Analysis: v=2.4 cv=Gc0nWwXL c=1 sm=1 tr=0 ts=6a16d194 cx=c_pps
 a=0mLRTIufkjop4KoA/9S1MA==:117 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=l703-9IPqgHXV7_gOVUA:9 a=QEXdDO2ut3YA:10 a=O8hF6Hzn-FEA:10
 a=WgItmB6HBUc_1uVUp3mg:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-27_01,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270109
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109989-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qian.zhang@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 37C785E3378
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 6:47=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 5/19/26 4:58 AM, Qian Zhang wrote:
> > You're right that GPIO 56 (wlan_en) is consumed by pwrseq-qcom-wcn
> > through the wcn6855-pmu node =E2=80=94 apologies for the confusion in m=
y
> > earlier reply.
> > Let me explain the hardware on this board, because it
> > differs slightly from the typical WCN6855 reference design and is the
> > source of a problem we're now stuck on.
>
> The wording, structure and magic characters within your reply make
> me think you're using a LLM to respond to me. I will not entertain
> this conversation further if that's the case.
>
> > Hardware
> >
> > The WLAN module fitted on Monaco-Monza is not a bare WCN6855 =E2=80=94 =
it
> > contains an additional, module-internal PMU (PMCA6850) that gates
> > power to the WCN6855 die. So the signal chain is:
> >
> > SoC TLMM gpio56 (wlan_en) =E2=94=80=E2=94=80=E2=96=BA PMCA6850 EN =E2=
=94=80=E2=94=80=E2=96=BA WCN6855 rails =E2=94=80=E2=94=80=E2=96=BA PCIe lin=
k up
> >
> > wlan_en is therefore the enable pin of PMCA6850, not of the
> > WCN6855 itself. From the host's point of view, asserting wlan_en
> > brings the module out of reset; the WCN6855 only becomes visible on
> > PCIe after PMCA6850 has finished its own ramp-up.
>
> The powerseq driver for WCN PMUs exists precisely to handle this setup.
>
> > Initially we reused the qcom,wcn6855-pmu compatible so that
> > pwrseq-qcom-wcn would drive wlan_en for us. But we hit a
> > resource-allocation issue this hardware behavior creates.
> >
> > The problem
> >
> > Because PMCA6850's enable is driven by pwrseq (which runs after the
> > PCI host bridge has scanned the bus), WCN6855 only appears on the bus
> >  ~10 s after PCIe enumeration has already finished, with no resources
> > reserved for it.
> >
> > Topology =E2=80=94 WCN6855 sits behind a Pericom PI7C9X2G304 switch alo=
ngside
> >   a TI USB controller:
> >
> > pcie0 RC =E2=94=80=E2=94=80 00:00.0 =E2=94=80=E2=94=80 01:00.0 (switch =
UP)
> >                        =E2=94=9C=E2=94=80=E2=94=80 02:01.0 (DN) =E2=94=
=80=E2=94=80 03:00.0  WCN6855  (BAR0 =3D 2
> > MB, appears late)
> >                        =E2=94=94=E2=94=80=E2=94=80 02:02.0 (DN) =E2=94=
=80=E2=94=80 04:00.0  TUSB7340 (BAR0 =3D
> > 64K, BAR2 =3D 8K, present at boot)
> >
> > dmesg (kernel 6.8.0-1071-qcom):
> > [    5.545559] qcom-pcie 1c00000.pci: PCIe Gen.2 x1 link up
> > [    5.882178] pci 0000:00:00.0: bridge window [mem
> > 0x40400000-0x404fffff]: assigned
> > [    5.912197] pci 0000:02:01.0: PCI bridge to [bus 03]
> > [    5.917368] pci 0000:04:00.0: BAR 0 [mem 0x40400000-0x4040ffff
> > 64bit]: assigned
> > [    5.924919] pci 0000:04:00.0: BAR 2 [mem 0x40410000-0x40411fff
> > 64bit]: assigned
> > [   16.476921] pci 0000:03:00.0: [17cb:1103] type 00 class 0x028000
> > PCIe Endpoint
> > [   16.477176] pci 0000:03:00.0: BAR 0 [mem 0x00000000-0x001fffff 64bit=
]
> > [   16.516689] pcieport 0000:02:01.0: bridge window [mem size
> > 0x00200000]: can't assign; no space
> > [   16.516704] pcieport 0000:02:01.0: bridge window [mem size
> > 0x00200000]: failed to assign
> > [   16.516713] pci 0000:03:00.0: BAR 0 [mem size 0x00200000 64bit]:
> > can't assign; no space
> > [   16.516720] pci 0000:03:00.0: BAR 0 [mem size 0x00200000 64bit]:
> > failed to assign
> > [   18.093137] ath11k_pci 0000:03:00.0: Adding to iommu group 24
> > [   18.101694] ath11k_pci 0000:03:00.0: BAR 0 [??? 0x00000000 flags
> > 0x20000000]: can't assign; bogus alignment
> > [   18.101724] ath11k_pci 0000:03:00.0: failed to assign pci resource: =
-22
> > [   18.108613] ath11k_pci 0000:03:00.0: failed to claim device: -22
> > [   18.115481] ath11k_pci: probe of 0000:03:00.0 failed with error -22
> >
> > At the initial scan the PCI core sizes the root-port window to 1 MB
> > based only on the TI USB endpoint that is currently visible, and
> > gives the 02:01.0 downstream port no MMIO window at all. When
> > WCN6855 appears later it requires a 2 MB BAR0 and there is nowhere
> > to put it.
>
> This is a separate issue that needs fixing. I see Mani is already
> part of the thread, maybe he can take a peek
>
> Konrad


The PCI issue has been fixed by this patch,
https://lore.kernel.org/linux-pci/20260116192921.GA958817@bhelgaas/

I will revert to the powerseq approach.

Qian

