Return-Path: <linux-arm-msm+bounces-100357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +KyDLG+hxmnrMQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100357-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:25:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 22556346B37
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 16:25:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EE07E30781B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 15:23:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 282A52DF155;
	Fri, 27 Mar 2026 15:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pC4a0ohF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRXR4d+4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AE63016E0
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:23:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774625013; cv=none; b=it6jgZAKZ0L+/ff7Voc6jJ/OMaqmfVRagwb0dpqeTbr6flFvtF95Ycar/dgwmuMJ2NkwFzhSSI4NMv0cVssiLf297zv8yPBJi0ARJvaLx0gsnTdiOArlFvF+38ElFHAqH3ss64cuFX8eS3X3GWWIhCl0BQz6k137pmVy1+/Rijo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774625013; c=relaxed/simple;
	bh=5dw1GNGE9jZm3a9sG92/kuYpuhNgkwUikv+53nOSVVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kGjHDY9qhAZBsaCgMeD54JPBO6VVoKtpb9oOxzQsk7O9o8Bdx7wKjuH+goyvln1JyJ29kARMnCalHiSdH9RyFu6AMZTPBD7ZlRgx5wWsFqD3yICa6C8IOD5GR/SPvvH8TcRXGwTubOD/rD4TFvpMiM59GXBlU91GB+OciTYmPgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pC4a0ohF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fRXR4d+4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RF28Lh3630886
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:23:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zHwjKUgdMjJel/RbPhL6jSPLQTm69YaGVpLak6EQCCc=; b=pC4a0ohFk5mx9TuB
	fbsObHshI7Lu6E9Z5+kNICa+Mm+AmfFdkgVWNurb5MOWwK22aqPC7fUbD4zoIRu/
	EhvKsiLXkuvF2tMKmyUEy+F7/JdXknX3tHtj9K0TFQQliyRTXToHfeUwRB893ZZ9
	pFezooCLsV5SkcFcJ1+nJCcmFK5GMhRzuV3j2MBBcKOQEGFEgXwEx14Hgd/OqxT/
	7ObK3C0VCoOesB3lGGZCNQPydqqpLcmpm5CJ7moTHkEocxMJLWxDNxJ5pbzKW8N1
	ORCnlhV/Rmi5xNixcY9REVvOOUxT6N4aoN8Ifu9hY+1OtWgghEaufIJNcgkptH9/
	S0JRRA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5v6b02b5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 15:23:31 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3594620fe97so8169679a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 08:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774625011; x=1775229811; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zHwjKUgdMjJel/RbPhL6jSPLQTm69YaGVpLak6EQCCc=;
        b=fRXR4d+4mPtJ3uoHRnO1ZVPr3xyfpeteW7KoMTzGfRLitCeQmPPsnUZbew7Bgkk/6c
         TiNCuAe7y4pKTH+oBm/+E024zKjMDSZv6e1nPo9IKQTaE1pCzkAE912jFeboQFZcfPlm
         2gD4GzXrp5/Ihh2xrAEW8vlKHGbCYdz8EMA/o13iuaI8Ot3mv9A2EgpmFyt1n3FeTw9a
         ZZ8SEMppEbOhGQU7WaG3+Bu6rUEJgbI6N8ZqNk1yPkVwhlUft8rDzzr5xDQJjaY6LQrP
         HRO+QwJrBk8yLxON/G+bAjG04DqYNxNcyADqNchUYZVxwgtbKs+tDRG6xrLk+vJAF7AU
         M8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774625011; x=1775229811;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zHwjKUgdMjJel/RbPhL6jSPLQTm69YaGVpLak6EQCCc=;
        b=CBD5kyXR/kKiP5Bez4DFqC7mEhb9OHD4Ra8MKK63lgKhk2ZFKMDInQszPfrdwRqvgl
         FDlPgd1oXceTf4x11CzO/LFpmxQKx6zC9q2YGFztk/tagXboo1dj4aZ3yYgkuP6No66A
         qIcVey6fJK4ANHzRM5mnzdTixqSr26rLO5i6hm3m5l2zXl+tLdpeIz48K1qcF26C9rzM
         v2UxtAMXT12VuACGn+1KhkN2UiblogYBGiXs8bejql9cW7DxGEMc1XIeDtyr0lS1EvaG
         x3F9wQ1/gc7JUF16dUQJKxKONAQm1cpblB31iSF2f3wtbaN09+SO9HHERVC7pqrDwo49
         V6Pg==
X-Forwarded-Encrypted: i=1; AJvYcCUbhPIDIYgzbtpOOz0DaXsTULUSUtE4cjYvhRjssWmxJHCg4uTjkopGg5x0VdR7faDm64YoNZRRgHz0m9bz@vger.kernel.org
X-Gm-Message-State: AOJu0Yytls+XqYF53lfVXi8l+7bzyReYfP+Rj8uZgVOh2G54mnPPFlAG
	sMZU/00x9Bxj0uzxszgw8q0bX01zAe1LjrXVirCTTN2YROkkflsCL1IbfH2PtzILMC1h56mc49N
	5b1pNpFVgqggoZH895M327udFDbdQ4S5S2NHMT5kcaxWam0Dl8uqeaMa7uHpflONYcUYy
X-Gm-Gg: ATEYQzyvQrx1MjWDB/vt6ed0vhS5O/0ubiYON9xHV0oHR3wIO+Oot0u+WL/CuEz9Nve
	M9/fud952CVPbeLs2I3txHSMNUWmXDcL8Clnf7Ai2TgdD9H7M8iwxeuPEZTqJU95IqGETamkZuD
	Qg/OuWgYHOWD2AHwoxIbWuRMWr4Zw2AOwHCjembn9+UUdol71srZ+KJzyzAae5t33WMh3I/spiZ
	f49LhFQk4RczJXUO5+zhjEVWcKn8J6nAox/IznAkfOLr4rvDicxrPmRN1u7mSm0xcZz679QEEOC
	fNB4YemOv601PHGyYx3HgaD3FfQCrjx8/t9wRCoPqW2PVhydZ/B7hb6dTJg0pC9GJD+X7BUSSkW
	tM2iST6hURqk+wsrK6+T7+D4A3ZFQkjCqUbJ/KdtLqCC/8DIxQH1ZtQ==
X-Received: by 2002:a17:90b:3144:b0:35b:e4f8:78e1 with SMTP id 98e67ed59e1d1-35c30008d96mr3044236a91.11.1774625010539;
        Fri, 27 Mar 2026 08:23:30 -0700 (PDT)
X-Received: by 2002:a17:90b:3144:b0:35b:e4f8:78e1 with SMTP id 98e67ed59e1d1-35c30008d96mr3044186a91.11.1774625009436;
        Fri, 27 Mar 2026 08:23:29 -0700 (PDT)
Received: from [10.0.0.3] ([106.222.229.231])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7673978676sm4720603a12.25.2026.03.27.08.23.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Mar 2026 08:23:29 -0700 (PDT)
Message-ID: <9cee6835-b076-45db-c22d-572f91ddbf09@oss.qualcomm.com>
Date: Fri, 27 Mar 2026 20:53:24 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v9 08/11] media: qcom: iris: split firmware_data from raw
 platform data
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260320-iris-platform-data-v9-0-3939967f4752@oss.qualcomm.com>
 <20260320-iris-platform-data-v9-8-3939967f4752@oss.qualcomm.com>
From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
In-Reply-To: <20260320-iris-platform-data-v9-8-3939967f4752@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: U109fo2J5jHYVVgHkZBqDL5LYTARXzD5
X-Proofpoint-ORIG-GUID: U109fo2J5jHYVVgHkZBqDL5LYTARXzD5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEwNiBTYWx0ZWRfXw0yIvL/8fHGJ
 2QYxTJ7qKVekU3bAZxuTOcG0fVIl4F8/7FIMaXG6vk6XEWbI3WkZ56fm++lY+8TxJHYJCiG1Q7v
 vr+9YrRXMQ+fTaHFF6F65hPVaHXTPkFJR+ISMS7d4fqOQ/dIKv+C2ls3+vYnb50+nMET1Anvl71
 zKbmF6Um/OXwrfzwHX0ntaQIOPUftv4iy92Bfy1Q2TE6OpHVOaNngViqYQzMgKnCg01LW2gTSjw
 JCyY4PXfUB8xUa4TKMGm5YxbqzL9vcE+UoxUtvC7n1CsaqWFn0a1vtN4OTZ/iyAd1wkDSbikoaU
 DjKuo4UOXHd9C2hy60nhIHpalimUXnrkhxNmuWLZIY8yFSwlg/UGQSeUKswClBWfeU1FhDpHkWx
 /raI3alJVBWy9EnoCw45b6UbN2L0dKs54Qg+hR97o+/8yeaajyQBMwG8KALKCNoy/cc2dWIWwtW
 0eJNuJPPqPiGRe7ALGA==
X-Authority-Analysis: v=2.4 cv=JLs2csKb c=1 sm=1 tr=0 ts=69c6a0f3 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=n9i7a1ABM4vdrNuulSdbnA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ATcjf3gZzKgDnsL-OLQA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_04,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270106
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100357-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[dikshita.agarwal@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 22556346B37
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/20/2026 7:24 AM, Dmitry Baryshkov wrote:
> Having firmware-related fields in platform data results in the tying
> platform data to the HFI firmware data rather than the actual hardware.
> For example, SM8450 uses Gen2 firmware, so currently its platform data
> should be placed next to the other gen2 platforms, although it has the
> VPU2.0 core, similar to the one found on SM8250 and SC7280 and so the
> hardware-specific platform data is also close to those devices.
> 
> Split firmware data to a separate struct, separating hardware-related
> data from the firmware interfaces.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Thanks,
Dikshita

