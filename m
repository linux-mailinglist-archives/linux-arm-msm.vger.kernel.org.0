Return-Path: <linux-arm-msm+bounces-94800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJ6AJAFMpWmt8AUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:36:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D1C21D4B0A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 09:36:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 052CB301474A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 08:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D2D938734A;
	Mon,  2 Mar 2026 08:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BlTOmEth";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZRic95TA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7793377018
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 08:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772440573; cv=none; b=Jo6KJhLNHRzJbNitMXkNvTU7Tm92Wr1RzxdEVFPFeFkpacQRmkQX/MZBEYRcbQLkBlUthVPk9UAknCxSiGwzr84jMCb+tutDen0h71V/0kvQior8q8f1hb5TCScedbpLWc8wjuCf7SUvfLurbtrwdARaV+pBY/2RoCX7Yz85ArQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772440573; c=relaxed/simple;
	bh=ggVY9gQwb1pP8rGEZBQk10I5aptVA3Wj0nOFd2MKBNU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k3g6EP86P45QhV8M3tyq/875k8Hc7EPkiHApJKyAyYk7jdP5LEOtHJimBdpaytcDiwdABpOsb4uagi3bHFxMmEOCeWttd+PMUEnAmQSOnXkpiE/25Hmlaz6BWC1g3wzzKiZuX5MnDuZFm4uteiXIWMQ0uV+pkx51uuWjoP0sXYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BlTOmEth; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZRic95TA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62285Y4p662225
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 08:36:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8dFOeVIxat+blul/Mwn+SDuNqbfDaRRvU9J92gKowqk=; b=BlTOmEthli+6TXZE
	mIqhDjGdubk5skAx6/Ve28p2NaQQY0XNkCr+DaPphL7+sMmUKUK6YwDOxO52wu28
	PioLN9DzwAQTTKRDVggo2eFxbdYxMHdM9ugn7kbggM12U1I0K24A9/gL0fk4ZuWj
	Hd0uR+h+tmM2ct35NVXXFBk/d6KDH7GfWRmGR4lmN4t46BDeAn3pU84BphuyE3Of
	Ghk2qeLNO6xtoca3j/JLVhOnwKAX17Syt+DxrrmkWJwlFuSUwIoRBeKHvxdw1NUS
	WrL2t72atGHSga7+NTvXD+SQyFrGUeGhgw/5T6Sl8wIWn1yHluC2nEi95x2J7xPj
	BMYC1w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cn6r2r4fy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 08:36:10 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35978cbc54aso1176191a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 00:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772440570; x=1773045370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8dFOeVIxat+blul/Mwn+SDuNqbfDaRRvU9J92gKowqk=;
        b=ZRic95TA06W0/+AP1uImsc5OyICc/5k7KN0SjiI4qHpi5SDYoR0v2Cg8Ai3CIHZ3Po
         A5hh/HpnPL7ErTKQpRr5u4jwPHEMAx10tvpli5A5bEI0+/+RmoGGECLLuRvWV/l1GAzn
         8W+2y3aqbPHxJ+Y0ZXoCtshPloXrck88s05xOO7jxOnUId/oTyoCREEqR6Nhwdnt8AIn
         zj+oB7Zp12nClMG4zmnniaF/bZA5RtkSh1XAp8FjUOFX5ZRAeN6+ucMEl8EpSlFSrOvr
         iuGSG+B1aVweSYyt1dFENYNqTGfh35fVqxpDYsxro3TSAVPsoMbHEPQWwo9zwc9Obnem
         coSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772440570; x=1773045370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8dFOeVIxat+blul/Mwn+SDuNqbfDaRRvU9J92gKowqk=;
        b=eBbbSJSbkuH/083++/zzKea0EzvBUl9qyqK6c8UaNSnI47ezZo7pfZRopsonhCfIH4
         nlb2+lw0lRFl4HocNMDNJY+39TyrxGZVor1gNWMId2PSFh9jQ+nW7wE/0sh34vJ+s/Sw
         f1RRfnleL5oqPx+BqNVz8mYLLBw4sFPdNBAqBEDAWrV66ihKYpnPUHyzJMx1B1SSEre5
         8cpcReLlqmGDuyD1Na6ePDXKu9oP2PDDU34R6krH7oCRSc2Itb+3Z28JWTEpJqJbg/gy
         GOFza1pdFsj4WH5ztll7r0mQ/xrQtbHbnCAJxqYAI0Eo8FQHPr1v0zyjsOz/gZF5TwxG
         M4EA==
X-Forwarded-Encrypted: i=1; AJvYcCW5kxqdHnSIkB5Vwntejwg1OeI8cHaddBKZug9l6/ezaiQ0ENfh46LtUgs1atByVsu0ijpi8Ae61cqWMBGY@vger.kernel.org
X-Gm-Message-State: AOJu0YxoS+FYprIEZnmG7fzK9WheDiYOk85jmRBOkrMPSmr3BQxrdtoS
	SbNxK7UtyryL8bESuhelxdt4fZam7Nj+39A1YHogQB39RsB07xq4eOxTUPzS5CVuq2aRF4ViSW7
	+kVicP8yQsqALEC+jUOiMzDthYSIxQabhR4ideiOr2A7Yv2s6GGpfUUoPV8H3pGgJaF8W
X-Gm-Gg: ATEYQzyQwq+Zs/3obRVuz3ontU8VQ5VzHLsvUOkog5gX5libsSQF56TqjuWr5FFlRKx
	N90qI/+RNUd88uXTQ1Rkfld0ANA9edAB9gso5xFdSuw6VEfdbfwXtUFdDS1otR1zGOQSSMccAKM
	UPr1MNP58ipercrLwYrR0vAnLpFHAxcpCwitGhykw1FU8P0DO2/lqgjeQN3oPOSpkQn3/yomLJZ
	1nR4ob19TYtp7TkYLVAftzJOWUMul+280hr+B9toJrWJpCxLkBf9EoiAnI9X4F+u8uSfjJiHs81
	GiZ4kAXAj2HfBcGFG1rHFX4k01E4pgFq9qDo+NmGHGrIXYNjgv1qcflSmrnQE74S4Detmt2AkDp
	DiEb+8QErGw5QFiCPvzsveom9AMq1DDdDJP/CLjL5vjusjmekvQ==
X-Received: by 2002:a17:90a:da85:b0:358:ed1d:2834 with SMTP id 98e67ed59e1d1-35968faa663mr9193273a91.6.1772440570035;
        Mon, 02 Mar 2026 00:36:10 -0800 (PST)
X-Received: by 2002:a17:90a:da85:b0:358:ed1d:2834 with SMTP id 98e67ed59e1d1-35968faa663mr9193247a91.6.1772440569507;
        Mon, 02 Mar 2026 00:36:09 -0800 (PST)
Received: from [10.206.99.28] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359034bd11fsm16177216a91.9.2026.03.02.00.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 00:36:08 -0800 (PST)
Message-ID: <3540a60d-f9a1-463f-aca2-54ccd484b5c6@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 14:06:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 08/18] accel/qda: Add per-file DRM context and
 open/close handling
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        iommu@lists.linux.dev, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Bharath Kumar <quic_bkumar@quicinc.com>,
        Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-8-fe46a9c1a046@oss.qualcomm.com>
 <rnhqwqtd66fmvmyobhrodzoa7x2etzjjh7xhqrn5hkmibms5cd@ucggzznrx7j6>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <rnhqwqtd66fmvmyobhrodzoa7x2etzjjh7xhqrn5hkmibms5cd@ucggzznrx7j6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 52p9k1NptuiUWyv4UkdVNCT3Eq6YAHpA
X-Proofpoint-ORIG-GUID: 52p9k1NptuiUWyv4UkdVNCT3Eq6YAHpA
X-Authority-Analysis: v=2.4 cv=Hpp72kTS c=1 sm=1 tr=0 ts=69a54bfa cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=e0RItjUwLU8XcxGzZmsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDA3NSBTYWx0ZWRfXwunoiqL8Bib6
 CqQ3FhIfgHrYKxM17cWMw/C3oKrVSA1YCK91KslzUKwUBcRmlS+XgxhAnwGsfvoNWJbhheqJosa
 V0AzPC+vNiLlCBEcaHmhewiq7euznpVfjR3jHZIa6gA7VoHMHpWASxF2rs7GWK7Lu5gwV3PSOQ4
 AhdU99Yr8QK6nCEL+yLVeHuR/irxmgGo2sS2TaEfpRMStPqI0Tr9b//eBYI9zjfZg9I9TOf+4fH
 HZf6/hGxYM5HG5/5UtjyWsfTm1Dg+1OVuQfE1jp6YcKoYGFWSV84ucTtiV/ErAeMOTCgWkfsZQm
 Y196kRp4EAM0pNPgSHQVk97X1lZ2U4m7zT/6qd4VUx0sKtZrgzXuibsSyFPi1bTG2u/TAR2d3rh
 UgrmmYCFHqPYmOoiyHpg1BVLiLH7NWG3J8XVuVorsGxqsLtOiEjzQdF/tcvqtEgrXThuiMKl6AY
 o6l2WpmqVc7qWyowseQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_02,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603020075
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_CC(0.00)[kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,lists.linaro.org,oss.qualcomm.com,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-94800-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0D1C21D4B0A
X-Rspamd-Action: no action



On 2/24/2026 3:50 AM, Dmitry Baryshkov wrote:
> On Tue, Feb 24, 2026 at 12:39:02AM +0530, Ekansh Gupta wrote:
>> Introduce per-file and per-user context for the QDA DRM accelerator
>> driver. A new qda_file_priv structure is stored in file->driver_priv
>> for each open file descriptor, and a qda_user object is allocated per
>> client with a unique client_id generated from an atomic counter in
>> qda_dev.
>>
>> The DRM driver now provides qda_open() and qda_postclose() callbacks.
>> qda_open() resolves the qda_dev from the drm_device, allocates the
>> qda_file_priv and qda_user structures, and attaches them to the DRM
>> file. qda_postclose() tears down the per-file context and frees the
>> qda_user object when the file is closed.
>>
>> This prepares the QDA driver to track per-process state for future
>> features such as per-client memory mappings, job submission contexts,
>> and access control over DSP compute resources.
> Start by describing the problem instead of stuffing it to the end. Can
> we use something better suited for this task, like IDR?
ack, same comment for IDR here also, sticking with xarray everywhere for QDA for
uniformity and to avoid checkpatch warnings.
>
>> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
>> ---
>>  drivers/accel/qda/qda_drv.c | 117 ++++++++++++++++++++++++++++++++++++++++++++
>>  drivers/accel/qda/qda_drv.h |  30 ++++++++++++
>>  2 files changed, 147 insertions(+)
>>
>> diff --git a/drivers/accel/qda/qda_drv.c b/drivers/accel/qda/qda_drv.c
>> index a9113ec78fa2..bf95fc782cf8 100644
>> --- a/drivers/accel/qda/qda_drv.c
>> +++ b/drivers/accel/qda/qda_drv.c
>> @@ -12,11 +12,127 @@
>>  #include "qda_drv.h"
>>  #include "qda_rpmsg.h"
>>  
>> +static struct qda_drm_priv *get_drm_priv_from_device(struct drm_device *dev)
>> +{
>> +	if (!dev)
>> +		return NULL;
>> +
>> +	return (struct qda_drm_priv *)dev->dev_private;
>> +}
>> +
>> +static struct qda_dev *get_qdev_from_drm_device(struct drm_device *dev)
>> +{
>> +	struct qda_drm_priv *drm_priv;
>> +
>> +	if (!dev) {
>> +		qda_dbg(NULL, "Invalid drm_device\n");
>> +		return NULL;
>> +	}
>> +
>> +	drm_priv = get_drm_priv_from_device(dev);
>> +	if (!drm_priv) {
>> +		qda_dbg(NULL, "No drm_priv in dev_private\n");
>> +		return NULL;
>> +	}
>> +
>> +	return drm_priv->qdev;
>> +}
>> +
>> +static struct qda_user *alloc_qda_user(struct qda_dev *qdev)
>> +{
>> +	struct qda_user *qda_user;
>> +
>> +	qda_user = kzalloc_obj(*qda_user, GFP_KERNEL);
>> +	if (!qda_user)
>> +		return NULL;
>> +
>> +	qda_user->client_id = atomic_inc_return(&qdev->client_id_counter);
>> +	qda_user->qda_dev = qdev;
>> +
>> +	qda_dbg(qdev, "Allocated qda_user with client_id=%u\n", qda_user->client_id);
>> +	return qda_user;
>> +}
>> +
>> +static void free_qda_user(struct qda_user *qda_user)
>> +{
>> +	if (!qda_user)
>> +		return;
>> +
>> +	qda_dbg(qda_user->qda_dev, "Freeing qda_user client_id=%u\n", qda_user->client_id);
>> +
>> +	kfree(qda_user);
>> +}
>> +
>> +static int qda_open(struct drm_device *dev, struct drm_file *file)
>> +{
>> +	struct qda_user *qda_user;
>> +	struct qda_file_priv *qda_file_priv;
>> +	struct qda_dev *qdev;
>> +
>> +	if (!file) {
>> +		qda_dbg(NULL, "Invalid file pointer\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	qdev = get_qdev_from_drm_device(dev);
>> +	if (!qdev) {
>> +		qda_dbg(NULL, "Failed to get qdev from drm_device\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	qda_file_priv = kzalloc(sizeof(*qda_file_priv), GFP_KERNEL);
>> +	if (!qda_file_priv)
>> +		return -ENOMEM;
>> +
>> +	qda_file_priv->pid = current->pid;
>> +
>> +	qda_user = alloc_qda_user(qdev);
>> +	if (!qda_user) {
>> +		qda_dbg(qdev, "Failed to allocate qda_user\n");
>> +		kfree(qda_file_priv);
>> +		return -ENOMEM;
>> +	}
>> +
>> +	file->driver_priv = qda_file_priv;
>> +	qda_file_priv->qda_user = qda_user;
>> +
>> +	qda_dbg(qdev, "Device opened successfully for PID %d\n", current->pid);
>> +
>> +	return 0;
>> +}
>> +
>> +static void qda_postclose(struct drm_device *dev, struct drm_file *file)
>> +{
>> +	struct qda_dev *qdev;
>> +	struct qda_file_priv *qda_file_priv;
>> +	struct qda_user *qda_user;
>> +
>> +	qdev = get_qdev_from_drm_device(dev);
>> +	if (!qdev || atomic_read(&qdev->removing)) {
>> +		qda_dbg(NULL, "Device unavailable or removing\n");
>> +		return;
> Even if it is being removed, no need to free the memory?
Right, It should still be freed.
>
>> +	}
>> +
>> +	qda_file_priv = (struct qda_file_priv *)file->driver_priv;
>> +	if (qda_file_priv) {
>> +		qda_user = qda_file_priv->qda_user;
>> +		if (qda_user)
>> +			free_qda_user(qda_user);
>> +
>> +		kfree(qda_file_priv);
>> +		file->driver_priv = NULL;
>> +	}
>> +
>> +	qda_dbg(qdev, "Device closed for PID %d\n", current->pid);
>> +}
>> +
>>  DEFINE_DRM_ACCEL_FOPS(qda_accel_fops);
>>  
>>  static struct drm_driver qda_drm_driver = {
>>  	.driver_features = DRIVER_COMPUTE_ACCEL,
>>  	.fops			= &qda_accel_fops,
>> +	.open			= qda_open,
>> +	.postclose		= qda_postclose,
>>  	.name = DRIVER_NAME,
>>  	.desc = "Qualcomm DSP Accelerator Driver",
>>  };
>> @@ -58,6 +174,7 @@ static void init_device_resources(struct qda_dev *qdev)
>>  
>>  	mutex_init(&qdev->lock);
>>  	atomic_set(&qdev->removing, 0);
>> +	atomic_set(&qdev->client_id_counter, 0);
>>  }
>>  
>>  static int init_memory_manager(struct qda_dev *qdev)
>> diff --git a/drivers/accel/qda/qda_drv.h b/drivers/accel/qda/qda_drv.h
>> index 2b80401a3741..e0ba37702a86 100644
>> --- a/drivers/accel/qda/qda_drv.h
>> +++ b/drivers/accel/qda/qda_drv.h
>> @@ -10,6 +10,7 @@
>>  #include <linux/list.h>
>>  #include <linux/mutex.h>
>>  #include <linux/rpmsg.h>
>> +#include <linux/types.h>
>>  #include <linux/xarray.h>
>>  #include <drm/drm_drv.h>
>>  #include <drm/drm_file.h>
>> @@ -20,6 +21,33 @@
>>  /* Driver identification */
>>  #define DRIVER_NAME "qda"
>>  
>> +/**
>> + * struct qda_file_priv - Per-process private data for DRM file
>> + *
>> + * This structure tracks per-process state for each open file descriptor.
>> + * It maintains the IOMMU device assignment and links to the legacy qda_user
>> + * structure for compatibility with existing code.
>> + */
>> +struct qda_file_priv {
>> +	/* Process ID for tracking */
>> +	pid_t pid;
>> +	/* Pointer to qda_user structure for backward compatibility */
>> +	struct qda_user *qda_user;
>> +};
>> +
>> +/**
>> + * struct qda_user - Per-user context for remote processor interaction
>> + *
>> + * This structure maintains per-user state for interactions with the
>> + * remote processor, including memory mappings and pending operations.
>> + */
>> +struct qda_user {
>> +	/* Unique client identifier */
>> +	u32 client_id;
>> +	/* Back-pointer to device structure */
>> +	struct qda_dev *qda_dev;
>> +};
>> +
>>  /**
>>   * struct qda_drm_priv - DRM device private data for QDA device
>>   *
>> @@ -52,6 +80,8 @@ struct qda_dev {
>>  	struct qda_drm_priv *drm_priv;
>>  	/* Flag indicating device removal in progress */
>>  	atomic_t removing;
>> +	/* Atomic counter for generating unique client IDs */
>> +	atomic_t client_id_counter;
>>  	/* Name of the DSP (e.g., "cdsp", "adsp") */
>>  	char dsp_name[16];
>>  	/* Compute context-bank (CB) child devices */
>>
>> -- 
>> 2.34.1
>>


