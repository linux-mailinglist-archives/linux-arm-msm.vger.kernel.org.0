Return-Path: <linux-arm-msm+bounces-118985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id qtIvOUfuVWoIwQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118985-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:07:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5567B7522E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 10:07:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=P938Z9IV;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=jIFzCccv;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118985-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118985-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8BF513003BC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 08:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 362C33F5BDB;
	Tue, 14 Jul 2026 08:07:30 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96533F4822
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:07:28 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784016450; cv=none; b=ic9OczG6hShyuAbTd+9pczGVs9lNW/Et5r8iAF0NEMBuzbBwv7PNH2qJS0acMbsxuZCBKHLnykY34UGSvHQLau83GhW+lf2x5tM5Y8SLCPzCF+xqyFrN5a/OXJevtaMw9ikd0yoNaRF1edY2erywTyW3oMlQQTP8gWAodmshrEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784016450; c=relaxed/simple;
	bh=chPrR3yvSSLbL3nbc1J4St17+dIVVN6Px6STN6fIB6Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KIeZdIS8RFLF1qNmNH5kc5D0dm6pcQDzkkurh8IKdZ2XVGHrD1PyU4UP8jGrZJx9eDi8JvrwViHAEvZqgpJv328xvuT0cmKiC/rXW0r/JdjDnTCZp0B6qhV6KYvKvWUe0el7w1HqdCzLyEPgp8SoluwzJ9aqqH5pAc4IQ9ay0OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P938Z9IV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jIFzCccv; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E6SLMc3912628
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PGw4sWaMKDTzSJPFnL+q7if3PMk6fCh3Zk7dNYZW40I=; b=P938Z9IVDEs6r7UJ
	ru54N4j4Ibb5GMoVKokzQZVMLXHNXAgZmnqAPqXzatK5W6g7+2i6fwCTDIBFChQU
	DXDkiiL2qPdEhYyQbR9NBZtjdQ/NuEpI57gM2Or4popy9dFfDVJjbr4Wad94vMBP
	6LYHpTZArC0A7K67gZY6aVcKwDa7P8bWDmt3y4ANHxQIbjxdOMqKW+9g4XC5ZCxB
	PXWNv7fDCCCeruYiN2sc6sok/T7Weo3VwwzuMmlXdW0CDRCMtij88FAy1ky7pmHS
	ETSsglJcSpHbS0HTReep0Gj9iRrjnyIo4ohGhOisRY/X+5S09TxEPr6m8C0vg66H
	a1M3dA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdeu4gnyw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 08:07:27 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51a8b0a08d2so52319041cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 01:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784016447; x=1784621247; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGw4sWaMKDTzSJPFnL+q7if3PMk6fCh3Zk7dNYZW40I=;
        b=jIFzCccvjI+1jIL8j735fkJ25jwxKfQPNeaQI2hXOm1M1s9J7tjJWugWEVwAdjbi0a
         X15TJTOlNrlNwnN7alCCnC/IMzLKchYiWYzHUntf6FJJpsJyArBxK7VSv/7mmiOMKIgv
         R0937AkYd/DhnUKgWgbEhmoeEA9b5Td+tC8po8lF9oyOrabi/pBQ6kqHvA4NW8aY6ySn
         g15eaeHFbH8PURVG5ld3zU4qEgxgmpti/C/+ya+P67B5vpl7jYT/jgGywr2QqeNblQJI
         XZwAbfKGIzSmLnS/uySCehIZ8LlQIMQIOmqqlHxK1Ua1ubBnFRznvB/Z1cRct+K90mxy
         TOFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784016447; x=1784621247;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PGw4sWaMKDTzSJPFnL+q7if3PMk6fCh3Zk7dNYZW40I=;
        b=I1nRMxMkz+gmMmXrbAAsd+DNaPi0lMKe1ycvwOSEp+i8AFxxAzY3u17DlzVFrSwjFN
         bXB1iHatiTSjJZQ2/tr/dxcXwn9G0/XIfku9Hs9QrDSeLzWMi+X8IWiW/bqJZhmXtw2v
         fXC4fUX/sxOXyVvJ7I9furqrouy7oAZ78H1o7Gmr3g/e9zE9BK0+pMVu9Gnu6FXhcUyh
         Hxp+gU6Dzg2j74VvzeEUGGUfugG9qu6Si11/F44s5AV/quSSX0XoXRmpgciyMnsWBp+w
         pCN10VkCmuFQNZbDCj+U6KKS3yD604twVNDzH+3X+7KiMYyJdsUV84xHGNZDuflc3Gtn
         NL5Q==
X-Forwarded-Encrypted: i=1; AHgh+RrgTCDtcZCGqEvidSBYw9OimQpi+/ZB/Zt6PvcBpCgbn6Ipv2DH3Q5Olj7lKRlr2yuErpiKkZeHEodXg8nP@vger.kernel.org
X-Gm-Message-State: AOJu0YwlKZFfHH6MvdlHpMCRAO+ppdzYUb+jublsdT9TUp/D0/R5mgKE
	NrRvVstSIitbD8gWLNR5I+64cqgDcodtWijnjKR251wp2Y6OGLXoDBl5lRFoHHSh+1Xkh65ts1x
	nmRggbLyUUvZBsaaBaV2cZp59vi6dqJaAecSwpifB+eTibeU7Z6tAoOj7BSLNrlQLoa8f
X-Gm-Gg: AfdE7ckJsK+hmjwx/nv8N23i0wvi0/IV7mQTcXhJfWC7l1kHG8PdhK5nIsMOJ+OdvT1
	TiMYxgJl4sUx8AM7tnQfVJfIOzpbOAxRxqWVvEkmir1ayfTg7Kg2hUY67x2SinwVlbz79schOA0
	JsHOLY9WP4HXY5LbEg1U339/rxmCGWLtdDPNdeNk6wlG+WWWzZNRbrsvRtFAWz5hBU9EhcVT6Xb
	SMjLcmI0XslgD71OVvNM2mtD8ubWrWMMVV+osebtJ5m46egFQ8SVaYk1QEX0RTTSmSZERZwU2Hs
	PVCQzBjn0NKfVHBLHOrh3dTXxnxhuSN+gEruToRv0oYXLOys8K60N4MLYLsi/ucWaBp8L6vdW08
	dWW3r+2NTP0+rSUpUvFZe0Kg/dhmC0avdhuBrpA==
X-Received: by 2002:ac8:7dca:0:b0:51c:7b13:62f3 with SMTP id d75a77b69052e-51e3c33c1c7mr27597661cf.73.1784016446876;
        Tue, 14 Jul 2026 01:07:26 -0700 (PDT)
X-Received: by 2002:ac8:7dca:0:b0:51c:7b13:62f3 with SMTP id d75a77b69052e-51e3c33c1c7mr27597361cf.73.1784016446415;
        Tue, 14 Jul 2026 01:07:26 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-69cd2936143sm955958a12.25.2026.07.14.01.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 01:07:25 -0700 (PDT)
Message-ID: <63e5dfd7-b0e6-4dbb-b67a-79a33b0a6477@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 09:07:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: qcom,lpass-va-csr: Add HeartBeat
 pulse clock
To: sarath.ganapathiraju@oss.qualcomm.com,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        prasad.kumpatla@oss.qualcomm.com
References: <20260714-master-v1-0-1ebe5993225e@oss.qualcomm.com>
 <20260714-master-v1-1-1ebe5993225e@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260714-master-v1-1-1ebe5993225e@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 35CThfxNJLdYVy-8WtabGX3y2UIgkOr1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA4MiBTYWx0ZWRfX+khbeBF+kiw4
 G8VGo4Kv8v1hZkCj2aEqJoR/n09dZho/bwognupboQQRocyzlTflu97/nAMBynz1/4waGw5/D4M
 MZpTYvO3OjbPAaHwFUb3WxjfzF3TgMOVSiK9HTp1mH9eL5C8Be/Ccsh830omwKWrP2LdiZtlRqa
 ONcClaYpHgsZEaAP11XhoFwXKzG+wVJBo5HYvuE1b1RcZ0Swy49LKStpuiiKiTWr/PVCuyEyzHN
 5oAtDQHfmICA9kPvXJhh/POyd4AU+qdh3u1ncco26781gCRnMO/1gnaWFDoEYbXxwCTJA9XXKma
 5x4c7u0zqrGX1diUp4BG26iChGdA6VUsfWA7ieBLTiqzig1LIF42OEGzc9FuNGKgQfGnsgZzcSq
 YB12E+D7dYO0usjPBkGc4pIZNOfiuHmnU3fLop8+QlV11nQBSRaUnF9pL9ofMHzQ3O5dNx9GneN
 A3TOgnAjYUi7KVz71IQ==
X-Proofpoint-GUID: 35CThfxNJLdYVy-8WtabGX3y2UIgkOr1
X-Authority-Analysis: v=2.4 cv=cN3QdFeN c=1 sm=1 tr=0 ts=6a55ee3f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=q3g3-CpzSg7zKoWD_TMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA4MiBTYWx0ZWRfX29rrDFM8erhl
 6r+/CuDhSTeF+8vhn4dnFHb4nZQFn3tvq1I7VP494CWg62DoAClhc4bSz4OCN4hd+q4D3xmTvkb
 tZVSsGjqnjP0s/COo5zWaUkB33/+pJE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140082
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-118985-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_RECIPIENTS(0.00)[m:sarath.ganapathiraju@oss.qualcomm.com,m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srinivas.kandagatla@oss.qualcomm.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5567B7522E1



On 7/13/26 9:05 PM, Sarath Ganapathiraju via B4 Relay wrote:
> From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> 
> Add Qualcomm LPASS VA CSR rate generator node that exposes
> the lpass_heartbeat_pulse clock on hawi. Also extend the
> qcom,lpass-va-macro binding to add qcom,hawi-lpass-va-macro with
> its four-clock constraint (mclk, macro, dcodec, heartbeatpulse).
> 
> The HeartBeat Pulse (also known as RateGen Pulse) synchronizes the
> start of the DMAs and Codec Interfaces for the audio usecase
> and can serve as a periodic wakeup source for the DSP.
> 
> Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> ---
>  .../bindings/sound/qcom,lpass-va-csr.yaml          | 47 ++++++++++++++++++++++
>  .../bindings/sound/qcom,lpass-va-macro.yaml        | 18 +++++++++

Please split these into two patches, as you are adding two things in here.


--srini
>  2 files changed, 65 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.yaml
> new file mode 100644
> index 000000000..794da92ad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-csr.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/qcom,lpass-va-csr.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm LPASS VA CSR heartbeat pulse clock provider
> +
> +maintainers:
> +  - Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> +  - Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
> +
> +description:
> +  The LPASS VA CSR block contains the rate generator hardware which
> +  produces the heartbeatpulse consumed by the Bolero codec macros
> +  (rx, tx, wsa, va). It is modelled as a clock provider
> +  so consumers can reference it by name in their clocks list.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - qcom,hawi-lpass-va-csr
> +
> +  reg:
> +    maxItems: 1
> +    description: Must cover the full VA CSR block (base 0x7EE0000, size 0xE000).
> +
> +  "#clock-cells":
> +    const: 0
> +    description:
> +      Single clock output "lpass_heartbeat_pulse". Consumers reference
> +      it by clock-name "heartbeatpulse" in their clocks list.
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    va-csr@7ee0000 {
> +      compatible = "qcom,hawi-lpass-va-csr";
> +      reg = <0x0 0x07ee0000 0x0 0xe000>;
> +      #clock-cells = <0>;
> +    };
> diff --git a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> index aea31fbda..ae4df8967 100644
> --- a/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> +++ b/Documentation/devicetree/bindings/sound/qcom,lpass-va-macro.yaml
> @@ -19,6 +19,7 @@ properties:
>            - qcom,sm8450-lpass-va-macro
>            - qcom,sm8550-lpass-va-macro
>            - qcom,sc8280xp-lpass-va-macro
> +          - qcom,hawi-lpass-va-macro
>        - items:
>            - enum:
>                - qcom,eliza-lpass-va-macro
> @@ -168,6 +169,23 @@ allOf:
>              - const: macro
>              - const: dcodec
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: qcom,hawi-lpass-va-macro
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 4
> +          maxItems: 4
> +        clock-names:
> +          items:
> +            - const: mclk
> +            - const: macro
> +            - const: dcodec
> +            - const: heartbeatpulse
> +
>  unevaluatedProperties: false
>  
>  examples:
> 


