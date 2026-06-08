Return-Path: <linux-arm-msm+bounces-111979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OJIDDok7J2rftgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 00:00:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id BA58465AD81
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 00:00:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LcYyTOLv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gXEUvnBM;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111979-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111979-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2F601305540C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 21:55:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8BD03A0E85;
	Mon,  8 Jun 2026 21:55:09 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE763A382F
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 21:55:08 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780955709; cv=none; b=fZrfDB57Ntymm+ZaaanCZCVMnv4ZMCbheJOy6BvPW6W3ahUkEHnpdm9eUV3dn7ndsQvdkXpriCgYMzjPay770TgKb/FBhk4fe27YV6zFXSUxVcIdYHCCpQgA8V099TnySf52FWBiPHMlvMQu73VHn/IyRYpweFxDucDTdVauUAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780955709; c=relaxed/simple;
	bh=+O0W78cQQHfEjuTIzl29RwfqrNfbPlIQn6/qqdVdDPM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IFswoH0m/SxTbLiapSjLZzC2HlPbzbVeBV7k3PsPHKgaf/vCJKiFI/JEHenjtN0QpHUMSD9N3/UOG2621lr5bvICLK8DQ4hru3iZWjdTjaDO3j621wO3fv6d/na5vGkWWbmTeXfJhQxlfHcMfAXvJt7iXIpnvCbHer2vcxGs3w8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcYyTOLv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gXEUvnBM; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 658IvEdb4090825
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 21:55:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lq5r65cI4cvQDT8K/mXYMGb5P7nfGwEpZycTXrCr7oE=; b=LcYyTOLv9hMZW+nS
	IwDQmHUcI9lm2Oo8B1hzhHrTzaWPS2lBKmVKRjW01jVpoR2AmjcZJamP6TbmfCDp
	4r/v82hcPSZok8By1k6PiQo8CbR7+suLiV/a75NNRFbWW6op2S7WFOVBFhIP831I
	c8wjPwyGObREczr3oDQOzr2ngspZb9NItDIV2HzkP1f6uqB/hybkDjGoy3qJ13+j
	MxfILZ76gxH8dkiVIyxXGU1n6cKyFkrrYhIe1sKoD9DtKpYD9QYUYFfHfeE3n23I
	YK1SpHtd68kKNfxzM6/l15iJvjmNcftHrUQYcQakzVIVU/K0m80GovqA9ByufzGm
	vG7QEQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4envajav77-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 21:55:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-842446a3851so2293682b3a.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 14:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780955707; x=1781560507; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lq5r65cI4cvQDT8K/mXYMGb5P7nfGwEpZycTXrCr7oE=;
        b=gXEUvnBMdpSTmbC3hfwjgavokJnmhRTjebw3l4F6kbcJuT3CxSX0QVtVO/fBiGWOes
         uJmUF/tN1wC2FmlHzajBJtXeL2SfLNkCk7GZHpirUC24qVBk6Vs0fGS1HtmuWagkR3AH
         6hJPxJ0JlQtTFW901yPHXqZKO4+An+KDHbhqyWab7ueeKOnBvohqGHX04TGCRYCy8Skv
         /Gz2CnmTp3U4P9e+xxtQAEa9nN1LePl2i5/dn42gf9/Bn/j5t09avgsZKqd90Qd8sllQ
         ZtW+OqnyCK8ySyg0NecVqYkEPRMdOYPxuqTmgNBHVdBXZ7w6MLdmgD/lnbesu3xSC6t2
         wkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780955707; x=1781560507;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lq5r65cI4cvQDT8K/mXYMGb5P7nfGwEpZycTXrCr7oE=;
        b=HZlx1sVXfiAYl+wEc4QKrSYAuT6hlgXNN9vH2KRavbhL4lnwv6Y1bdCNHX5YSvuFN9
         RvEqBx34mEL0RgDq/0VumVfstqQA41P4Z6SnZLRGD6iztEZ2mTqElaNBQ9T9C7mr51MS
         6U17/gI9i9olswfxp7H6lCiV4WCvHJN+yAmvMvwmDN24tiXEDFslmlnGWbM8tCDojkM6
         mUtAganRl4ATdD9KWzz63si82O7UnFUPnMkWeFXuR5lB8CthmCN2QSWvQyp/MgmrwNYp
         pSS6YX1N0c31Uo+GB7wrgVZzGKt1NLIXgbpJM09PJaLlayLbfOc9kuRnU8Jvh58Mx7Uz
         Dj+g==
X-Forwarded-Encrypted: i=1; AFNElJ+vg+edPUbmRMWFSndzrDtt9iXdwpiqdbfchmQSyRF9v/mOfJx1o4j8TbXbcYe+VhMfYs22NDpY/r3o4YW3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz2kWLfy2ZOedNDiI2DxP8FL3rtX99XUP6tRjMJUQENduMolA/
	+AlNg2QxyiVJ0Gu1oro3TxRC8GSx8bjh/YCPNoyq0plvT5L9slY4AxtKlzL/8D4h2pkvNKdw4MF
	6y2d/5HXN0/3IViwGsdUoPp5zDq1O4KZrwjvxsBNzTf37hNUdsobiadjBq5Rq7jhOgwiP
X-Gm-Gg: Acq92OGv8e174Ufo0JYtnhCqzL/fC+JxSopVL7ECtuQHWY3huSzHFQnNopFIRAQdUNx
	7rGXD9tKUIfMq2JnaF4YlVE75W3bSrT/pORtkpDnfJrMy0o7TI1LkJkL0eyCxLndUu3UAxRb1X/
	zqFGVbE4Lx1BtC3LeAD+Aizk54w4usDjpqQ1gOOID1W5ARx7XODWhSWa5EOFaf8FWwVehtxXo2A
	0wyIqR5HPzBl5936xcvAOjpRxHblV5uKg61cGMfCq4sCaFLbbGGOVjLLPbdvA6y2tZ9qBD9eOMc
	uYXnw7IVhu5iJWypTJMFWxocxPu+DnWIgpGVW+aDreyw9ggCip4774Seg8Fh3CwEWgiNUPKIVVO
	zuZL5ulI9seVI8STBANLGgswb1KFq6YTVM0jOyhuldJGIuOdr4WBo0DlK
X-Received: by 2002:a05:6a00:844:b0:835:405a:7e6d with SMTP id d2e1a72fcca58-842b0ea14f4mr17787865b3a.21.1780955707062;
        Mon, 08 Jun 2026 14:55:07 -0700 (PDT)
X-Received: by 2002:a05:6a00:844:b0:835:405a:7e6d with SMTP id d2e1a72fcca58-842b0ea14f4mr17787832b3a.21.1780955706571;
        Mon, 08 Jun 2026 14:55:06 -0700 (PDT)
Received: from [192.168.1.7] ([106.222.228.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282221470sm20386450b3a.6.2026.06.08.14.55.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 14:55:06 -0700 (PDT)
Message-ID: <49b8530f-24d3-4201-b22c-0f8eaea9f4e0@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 03:24:59 +0530
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
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CACSVV01dbQcjE+nTic+9R4VfCtNGvpwODH8BMZi8B7LFtcCCfQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uAzqzXUdRQXz4s_iVq-nXPvJEDG-lHDU
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a273a3b cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Q2jhz0oZVy1Wt6PcVz7aQg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=WJmIXLFun9vGvqKifugA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-ORIG-GUID: uAzqzXUdRQXz4s_iVq-nXPvJEDG-lHDU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDIwMCBTYWx0ZWRfX++0r+kWvsicH
 KiBgiE0d2bjzGgnV1uxuMiRLQ4sisoPDe0GTIZeWyMPpuMAxzuBvWsh1KhKd1gJ1oxVzqJJAiLM
 +NxgOYyJQwGwN8A83U2T8lOYZ3APeOGBnKWoL5Cn3ne9pRsIhcr1JwrJ0A//IJOskpL9fYAm6/a
 35yxNeLSYd+iw+Da+6d5Ht3HafdZEWurhEcTBsHOqXPBOFPqXzdZcz4NhyAdRqS0v7SVe5gdUUD
 FXqOTbAytyzApZrrss3U4KF4H1xNyO3fgmDhbrQI4Ne4UnxGjFQlW9HVRW60oPm2zwM+qsQfNbH
 Gr1z4PpPMWxr3LnThMiZythig92wvUYm6B7v10YS0cJzdhrYcnj3yDpEqAvUsiUCKnyMektKabL
 MV0N91VsufShyWRlRgtNxHgwQXvX6b5nmvgYhAPfOnQ9anGWCZuneKYdxJJ5pmRYs+izSVeLG7o
 s7Szdt6eBQOwYoOmucg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_05,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080200
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-111979-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,quicinc.com,igalia.com,vger.kernel.org,lists.freedesktop.org,oss.qualcomm.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: BA58465AD81

On 6/5/2026 12:20 PM, Rob Clark wrote:
> On Thu, Jun 4, 2026 at 1:10 PM Akhil P Oommen <akhilpo@oss.qualcomm.com> wrote:
>>
>> From: Jie Zhang <jie.zhang@oss.qualcomm.com>
>>
>> Once a hang is triggered by the msm_recovery test, the gpu error irq
>> remains asserted and triggers an interrupt storm. In the worst case,
>> this IRQ storm lands on the CPU core where the hangcheck timer is
>> scheduled, blocking it from running. This eventually leads to CPU
>> watchdog timeouts.
>>
>> To fix this, mask the gpu error irqs during msm_recovery test and
>> enable them back during the recovery.
>>
>> Fixes: 5edf2750d998 ("drm/msm: Add debugfs to disable hw err handling")
>> Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 5 +++++
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++++-
>>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c | 5 ++++-
>>  drivers/gpu/drm/msm/msm_gpu.c         | 2 ++
>>  4 files changed, 15 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> index 2c0bbac43c52..f1df2514c613 100644
>> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
>> @@ -1275,6 +1275,11 @@ static irqreturn_t a5xx_irq(struct msm_gpu *gpu)
>>                 status & ~A5XX_RBBM_INT_0_MASK_RBBM_AHB_ERROR);
>>
>>         if (priv->disable_err_irq) {
>> +               /* Turn off interrupts to avoid interrupt storm */
>> +               gpu_write(gpu, REG_A5XX_RBBM_INT_0_MASK,
>> +                              A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS |
>> +                              A5XX_RBBM_INT_0_MASK_CP_SW);
>> +
>>                 status &= A5XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS |
>>                           A5XX_RBBM_INT_0_MASK_CP_SW;
>>         }
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index 8b3bb2fd433b..9a4f9d0e1780 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -1911,8 +1911,11 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>>
>>         gpu_write(gpu, REG_A6XX_RBBM_INT_CLEAR_CMD, status);
>>
>> -       if (priv->disable_err_irq)
>> +       if (priv->disable_err_irq) {
>> +               /* Turn off interrupts to avoid interrupt storm */
>> +               gpu_write(gpu, REG_A6XX_RBBM_INT_0_MASK, A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS);
>>                 status &= A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS;
>> +       }
>>
>>         if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
>>                 a6xx_fault_detect_irq(gpu);
>> diff --git a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> index 9e44fd1ae634..0f6fd35bd587 100644
>> --- a/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a8xx_gpu.c
>> @@ -1211,8 +1211,11 @@ irqreturn_t a8xx_irq(struct msm_gpu *gpu)
>>
>>         gpu_write(gpu, REG_A8XX_RBBM_INT_CLEAR_CMD, status);
>>
>> -       if (priv->disable_err_irq)
>> +       if (priv->disable_err_irq) {
>> +               /* Turn off interrupts to avoid interrupt storm */
>> +               gpu_write(gpu, REG_A8XX_RBBM_INT_0_MASK, A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS);
>>                 status &= A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS;
>> +       }
>>
>>         if (status & A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT)
>>                 a8xx_fault_detect_irq(gpu);
>> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
>> index 9ac7740a87f0..48ac51f4119b 100644
>> --- a/drivers/gpu/drm/msm/msm_gpu.c
>> +++ b/drivers/gpu/drm/msm/msm_gpu.c
>> @@ -552,6 +552,8 @@ static void recover_worker(struct kthread_work *work)
>>                 msm_update_fence(ring->fctx, fence);
>>         }
>>
>> +       priv->disable_err_irq = false;
> 
> Ok, so we rely on recovery to re-enable the error irqs..  that is
> probably ok, given the intended purpose of the debugfs file.  And,
> well, it is debugfs.  But why do we clear disable_err_irq here?

Now that we are updating the IRQ mask register which won't reset until
there is a gpu suspend, its side effect will be felt even after
userspace deasserts the debugfs knob, potentially into the next
testcase. This is different from the older behavior. So, I felt it would
be better to reset this flag during the recovery, considering
msm_recovery is the only user of this knob, afaiu.

I should have explicitly called out this new behavior of disable_err_irq
in the commit text, but I forgot.

-Akhil.

> 
> BR,
> -R
> 
>> +
>>         gpu->funcs->recover(gpu);
>>
>>         /* retire completed submits, plus the one that hung: */
>>
>> --
>> 2.51.0
>>


