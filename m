Return-Path: <linux-arm-msm+bounces-112171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1rchBVYSKGrh9QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112171-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:17:10 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD8B66072D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 15:17:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VrhJ5WOH;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=XdQJh2k6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112171-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112171-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 82ED1301017D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 13:09:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 176F940E8D4;
	Tue,  9 Jun 2026 13:09:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E71371D1D
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 13:09:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781010544; cv=none; b=NoNq4MfgeZlor16afg5B5bzsuTuu+GrqylSUYdgeifwNxKduSF7S7Iyg5H0CmxBmewV5tAZfKcUyztV7y9UdQgog2yZRzV7+QjPuTiCoKWZSqVO7H/arF5gh2Cbc1gFo6bR2z1vWVXtk4d5iPI3iBZWmlGJLdMdpFeyWrO/kuMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781010544; c=relaxed/simple;
	bh=PganO0t4nr3RBkSrFF2tieW8TwptOKUasia8wbjux3c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JbazQhoae8ZtSjdeAz2SYm4MOnjfFSR0rHfVoJg00TiQeV8jktuhbgDxwZY9qAIpkIl2Q7l1jfu5kPuwaAc6959kLPvx9jYCgh1WvadVjyUMIDC6bgEuPJrbzrIOg3HbCCvjBwFI0afzvzgOzoNEKtokufoAYadPcKOGmYSgung=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VrhJ5WOH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XdQJh2k6; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 659Clagv2247947
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 13:09:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HuwQP9SK5OUHdHSWZrC9uShH+8zqF8fHSldRJ1oXwnQ=; b=VrhJ5WOH8XwEK97T
	Q9wvwMaNd/7C3qdcy2nShlYYSMgDcvfea3NIMwH/vZe5Pj3dOmNjVZtM295uweOi
	6ynE2tM8LdufNz4DTU2i8Iwbql8QPFHCVCG+g0CwZ0HjYwlbdYO5lXh6xGHrP3Ho
	/F66nTw2THsss4/jLnJwh9jNeUmXUWxDVGrKBN9HNCxi3Bn1eiwYHhcd3vf3KxSO
	c4of+wqVHsglHbb6ucSSe598Mua39IGBoG+IBVsmtOujoWQe4JPnMfhvy4GPG9nY
	pvQc9vsIAQP9SadjCBf+dvsE9h/sVvzm99YZyH8zfx/s4JvlcfijCYM8O32oMva9
	YSqLkQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeesq8e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 13:09:01 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-36d982d932aso6935900a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 06:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781010541; x=1781615341; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HuwQP9SK5OUHdHSWZrC9uShH+8zqF8fHSldRJ1oXwnQ=;
        b=XdQJh2k6de9KHRXWYJ91lj1J1iLVN57oFwrjVX12ofSu7UUUlxdcarFnARoRb2Si4u
         VZ5yCLFr5P2utfKqA0xWxfc5XaaajU4EgLmfgDQG680w1sgmxVTuMf5FDebQph73hHXf
         1YzfBKBkXVbiSDD8feQou9O4SjJbOySklLWsUxp3MxI5NkTiY2c7NR0Mp3bB7S9+ZCtv
         Ybro5OpoSAOqhzSWqF8rSk6n1+Rb4zn/FuyaSeNlHnD1yQRmV7bEzXJD3qPR3genVJSH
         UHMuUVOFep7NK0WIXpftXPCxHBFKeCN5ZoGtLhVXSX5gE9FoKGRrnJZwhyDjJTgI9ojQ
         wMxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781010541; x=1781615341;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HuwQP9SK5OUHdHSWZrC9uShH+8zqF8fHSldRJ1oXwnQ=;
        b=JY59959IZMrkhezsE0II4Az8KmWO7cnonxyrH9x2Mmui7YmLNyiTgJnMwB4TOdwxcq
         +is6K6yKYFdopKU8pMs6s2CSUVbpkbYMh2RYo/QCL9BUQRfl7jYshUuFAvameElUte8O
         Jz3dXvwlp+3GcKPABi2hi9Y/Chjf4pRVzFGJA6pYmG7NKbKPcxprbPKyY90SvmjNUrJZ
         /+6ZPHj7F/A94+07tvjWTwDDffYNPl6nyX+Eksi/NLJNOXvoQsf7rdcBmHok3U4yztHX
         4w2rDiwbhWnNZU+2OLLaR39Gl1WnJ+3JKG2IOaz/IoM016P4rvWm26tvshUy4xoh8RCq
         APMA==
X-Forwarded-Encrypted: i=1; AFNElJ/4CurmX6J0gm+VJ3VSuHsa3Owv6bgOFsFLVe21RHojrelNHtfSOAXwqCoHMPVLp/nkHTLLHMzIey3o8Ebb@vger.kernel.org
X-Gm-Message-State: AOJu0YzOUPvQ5esMnZssmTbiP0T3LwiLw6syPT/ltGa1yQkRf9L0jwQq
	sy0GZUKvpj1Nk9EWwcsA/JxrifxQgzB+bAU1VRqpWKaUSvP2u0wTyyQG+nXJcUTroCsyv9oYCPK
	y2Q5QCtGQLx75vbBAoUcNqpV+XjK6x9KbI4eTAjzMnzXJm/NtfyOWg4nztSYWLHl96WW4
X-Gm-Gg: Acq92OG+9AwZroN7e5cL9XRpNgAiDWnLzfeHW968OnHtN2VYxEqJaOSvicvNw9jG8j+
	VOe475PYc6v/uIOmFCOcCAuoTg5I4xPRkVwZzzk/vSiderAD1DOW+PZN8UaYldPv2epmtZMyhL2
	T5yNgzCmEXb6gFubMAzHv2kxzMUmAX62j+V9C1w0S/zPEQbLDAcnj3SNhl7dE2ZME3pzj6DJ8v1
	N2az5qvanIXQB6nCTcNHv9i2lpod85EmlLbrILfnqGTn/SlslJEM/fS+WcB9F8x6UGPG8GLq+8d
	vd+ufqcDKZsaUS2DDyH0PB+4R/vYO5fWnmBM3mHxkk0m0DfQux+pHPhOscvoaIaIyQLdwSu48SY
	HHh7eaMUjYEGe/jQq6symuBiyluUDzt/x0aS27X/EONUqQBy3JRqdEiQo
X-Received: by 2002:a17:90b:4fd1:b0:366:5c38:fd61 with SMTP id 98e67ed59e1d1-370ef2f077cmr23445442a91.12.1781010541212;
        Tue, 09 Jun 2026 06:09:01 -0700 (PDT)
X-Received: by 2002:a17:90b:4fd1:b0:366:5c38:fd61 with SMTP id 98e67ed59e1d1-370ef2f077cmr23445385a91.12.1781010540672;
        Tue, 09 Jun 2026 06:09:00 -0700 (PDT)
Received: from [192.168.1.7] ([106.222.228.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3712ef0add7sm13353137a91.0.2026.06.09.06.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 06:08:59 -0700 (PDT)
Message-ID: <d153235f-ffec-4fee-87b2-6008f26d7014@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 18:38:52 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] drm/msm/a6xx: Fix IRQ storm during msm_recovery test
To: rob.clark@oss.qualcomm.com
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar
 <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Puranam V G Tejaswi <quic_pvgtejas@quicinc.com>,
        Jie Zhang <quic_jiezh@quicinc.com>,
        =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20260605-assorted-fixes-june-v1-0-2caa04f7287c@oss.qualcomm.com>
 <20260605-assorted-fixes-june-v1-5-2caa04f7287c@oss.qualcomm.com>
 <CACSVV01dbQcjE+nTic+9R4VfCtNGvpwODH8BMZi8B7LFtcCCfQ@mail.gmail.com>
 <49b8530f-24d3-4201-b22c-0f8eaea9f4e0@oss.qualcomm.com>
 <CACSVV00vFNZDCN24wSdffZFRWpijb53qbX_-3b09ny4noa7-Mw@mail.gmail.com>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV00vFNZDCN24wSdffZFRWpijb53qbX_-3b09ny4noa7-Mw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a28106d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Q2jhz0oZVy1Wt6PcVz7aQg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=FicKLmBmdwvNS0eY_b8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEyNSBTYWx0ZWRfXyL5r2p3HJJ7Y
 ghGlPEC3QRifezwNjmlSkREe3sGnzLTvaFX7aKWTNTCdM2wX4jUOWaTU4mMo0skFpRtdRr6QYLS
 HZf8ElVWHkWdeT9052x2UloPBOF4S0uQnlT2m+eVCP7YrMbwyQsCjyAkj0VSEhboQLjC1FjZS//
 K78A1DKMAfHL9JT1ehwxgR3U6aVZu+IpXdsl3mx2RBg27unf0ANP62oBsDsrLbnXdWxu0KD8rCf
 CoTJhWwtbgH2/MJ8FNsCYVPYaQvHWo//t0N+HgcOa8bQYf5QmP2W95BCxKoex2Wk6yAhHvYFucY
 lB4VHmC56WbMHLsBKE6KwYsWSzKH7Dw5VMpHWtJFW7eztlu58ywl9N0N4EobcglHfTQ+Je+v5gw
 LvxhXe8BEq2N4cqQnTRCoFJG77klxMdrEun6dmePS83wnuBbFs+n+Qa1yWQdND59GNwABM28S0h
 EKaKVdF08kAx79T5sCA==
X-Proofpoint-ORIG-GUID: 173IqQrhppuSaKiMCYdfLkvMVCpfRxL0
X-Proofpoint-GUID: 173IqQrhppuSaKiMCYdfLkvMVCpfRxL0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090125
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112171-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,quicinc.com,igalia.com,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_SENDER(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:rob.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_pvgtejas@quicinc.com,m:quic_jiezh@quicinc.com,m:mcanal@igalia.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:freedreno@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jie.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[akhilpo@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5CD8B66072D

On 6/9/2026 5:50 AM, Rob Clark wrote:
> On Mon, Jun 8, 2026 at 2:55 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> On 6/5/2026 12:20 PM, Rob Clark wrote:
>>> On Thu, Jun 4, 2026 at 1:10 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>>>
>>>> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
>>>>
>>>> Once a hang is triggered by the msm_recovery test, the gpu error irq
>>>> remains asserted and triggers an interrupt storm. In the worst case,
>>>> this IRQ storm lands on the CPU core where the hangcheck timer is
>>>> scheduled, blocking it from running. This eventually leads to CPU
>>>> watchdog timeouts.
>>>>
>>>> To fix this, mask the gpu error irqs during msm_recovery test and
>>>> enable them back during the recovery.
>>>>
>>>> Fixes: 5edf2750d998 ("drm/msm: Add debugfs to disable hw err handling")
>>>> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
>>>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>>>> ---
>>>>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 5 +++++
>>>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++++-
>>>>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 5 ++++-
>>>>  drivers/gpu/drm/msm/msm_gpu.c         | 2 ++
>>>>  4 files changed, 15 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>>>> index 2c0bbac43c52..f1df2514c613 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>>>> @@ -1275,6 +1275,11 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
>>>>                 status & ~A5XX_RBBM_INT_0_MASK_RBBM_AHB_ERROR);
>>>>
>>>>         if (priv->disable_err_irq) {
>>>> +               /* Turn off interrupts to avoid interrupt storm */
>>>> +               gpu_write(gpu, REG_A5XX_RBBM_INT_0_MASK,
>>>> +                              A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS |
>>>> +                              A5XX_RBBM_INT_0_MASK_CP_SW);
>>>> +
>>>>                 status &= A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS |
>>>>                           A5XX_RBBM_INT_0_MASK_CP_SW;
>>>>         }
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> index 8b3bb2fd433b..9a4f9d0e1780 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>>> @@ -1911,8 +1911,11 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>>>>
>>>>         gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
>>>>
>>>> -       if (priv->disable_err_irq)
>>>> +       if (priv->disable_err_irq) {
>>>> +               /* Turn off interrupts to avoid interrupt storm */
>>>> +               gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS);
>>>>                 status &= A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS;
>>>> +       }
>>>>
>>>>         if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
>>>>                 a6xx_fault_detect_irq(gpu);
>>>> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>>>> index 9e44fd1ae634..0f6fd35bd587 100644
>>>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>>>> @@ -1211,8 +1211,11 @@ irqreturn_t a8xx_irq(struct msm_gpu *gpu)
>>>>
>>>>         gpu_write(gpu, REG_A8XX_RBBM_INT_CLEAR_CMD, status);
>>>>
>>>> -       if (priv->disable_err_irq)
>>>> +       if (priv->disable_err_irq) {
>>>> +               /* Turn off interrupts to avoid interrupt storm */
>>>> +               gpu_write(gpu, REG_A8XX_RBBM_INT_0_MASK, A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS);
>>>>                 status &= A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS;
>>>> +       }
>>>>
>>>>         if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
>>>>                 a8xx_fault_detect_irq(gpu);
>>>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>>>> index 9ac7740a87f0..48ac51f4119b 100644
>>>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>>>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>>>> @@ -552,6 +552,8 @@ static void recover_worker(struct kthread_work *work)
>>>>                 msm_update_fence(ring->fctx, fence);
>>>>         }
>>>>
>>>> +       priv->disable_err_irq = false;
>>>
>>> Ok, so we rely on recovery to re-enable the error irqs..  that is
>>> probably ok, given the intended purpose of the debugfs file.  And,
>>> well, it is debugfs.  But why do we clear disable_err_irq here?
>>
>> Now that we are updating the IRQ mask register which won't reset until
>> there is a gpu suspend, its side effect will be felt even after
>> userspace deasserts the debugfs knob, potentially into the next
>> testcase. This is different from the older behavior. So, I felt it would
>> be better to reset this flag during the recovery, considering
>> msm_recovery is the only user of this knob, afaiu.
> 
> Hmm... maybe debugfs writes should just immediately update the irq
> mask (if the gpu is powered)?

That needs some plumbing in adreno func table to program the register.
We can do that if you prefer that, but is it an overkill for this usecase?

-Akhil

> 
> BR,
> -R
> 
>> I should have explicitly called out this new behavior of disable_err_irq
>> in the commit text, but I forgot.
>>
>> -Akhil.
>>
>>>
>>> BR,
>>> -R
>>>
>>>> +
>>>>         gpu->funcs->recover(gpu);
>>>>
>>>>         /* retire completed submits, plus the one that hung: */
>>>>
>>>> --
>>>> 2.51.0
>>>>
>>


