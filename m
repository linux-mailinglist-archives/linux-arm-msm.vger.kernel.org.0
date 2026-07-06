Return-Path: <linux-arm-msm+bounces-116622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LlnCK3c1S2qXNgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116622-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 06:56:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 329EB70C7FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 06:56:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BtuYZphI;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Z3Jr5zap;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116622-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116622-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B77DF30137AB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 04:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F6463BBA05;
	Mon,  6 Jul 2026 04:56:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0723AFB01
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 04:55:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783313760; cv=none; b=OF+F2U0cpp2rkJ9o8cjxnqmIfxyTaU62zcs9/I3Uud8ujnty8oQEsNPzktCpUwn436C3voNH1SnKcwW/sS1Ge+TzdW18TNO/reVYFQEFHJVSuMo91m3NnwgEN3+mhjgFnHPLo06yjTOTg2Co6VW9s7LET5QjEhZJ695r+fBx43c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783313760; c=relaxed/simple;
	bh=YmgsfoXmP3wicea3p38VOglMuty4QAN7Ko28KEOX1Hc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AoEyRWl3rrL2Jt8ApxbIE71BtFW3i7NFNvOgErUJ21Rzh6eXqQwa1igojY/PfwfMc/Oc8rtBqoOMO8TgHlF+ZCXAtJFp/MaoHkie7R3gFDIYD+RtfR66CO/oaaUTLap+ya816GFDS0fhD5/Rv8RDjpChDyyLgMAXpIuIGhdpdvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BtuYZphI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z3Jr5zap; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666422iS3586380
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 04:55:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=; b=BtuYZphIK7UnAPPa
	qYGHPuM+VD3C6WvezTLdqIjiYVGHLzNLv6RSapQqEJ2excDEyUkD/0AEcWQjp5ej
	4HI3bMiV8UCRYHw/YXMP72BUtTB2CANb5/xl2wJKaV5lc87Ax6wEFDsEhbUsTXur
	RNx2Hm91I1sPL4Fp17l4JFxQuB37ZPnouzzUHhLqbWpMJkm6xOuGNEQuSB8vkr4v
	iHs+mInjL3lcrCXDe3aaUW3MnfspbyT4APEA3ecMXRsbeK03HAVvm7fbyNR3ckpu
	4lDTqZIfECL8APV6bvyHqU87nPrqklBdw7zS2B0zT/os5ltI50S9QbhC5yDZwUWY
	z7D7UA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6t8umdmg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 04:55:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-37e5ef8299fso2307731a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 05 Jul 2026 21:55:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783313756; x=1783918556; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
        b=Z3Jr5zap9lUWE5NcKmoo9cq4VyYd8OfMJGVQ6b4AKiCEBOMaj87jG60tHh+PoJe8zn
         Nx8ZhE9BKLjIcVtnjd3NzKx5w1mutKKi3zTqyOYyg8ICK2g1jmoefVbycgr3tmk9H52N
         kXxEAYauB1ur/Gpn1QujPW4nmKf8HSlqLi2eYH0Gypm76IOueG94Oj57ecdMJqSBmwjO
         qx3Kf+rydvZdq4PIXZqotXQc7paiAki1F1wUbnFuaUEYZS5b6RS5letdZKyVFgu5RA9Y
         FV8jSmCzURwxVusAJCv4/HNWsKhhgQjNktQG3QrTiH0PV1JuPBsAg8/ZazyRiFkh9NoQ
         dAYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783313756; x=1783918556;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JvLKKEyLLlv8tWw8qJtzyelBHieDthun419uycWn1Dc=;
        b=XjB1T2FLMFkhrDLivt8+H9GMzAZ1WveaCRyIne57o4t3i/6Xmiy2WX+pkQg3pNTPe5
         UR0oF0eP1ikdpURtwlChxc/6eHHTOO5hbNxIXJRCwQ/gHqir58nkK2nR6F9IoupO/zzc
         K7ex5szj0j1t6O3Nj66bYOCkF+M7bYMe5kHfgvbL5UjllJ6T2MNCpMRVkOqZzVsJyrlv
         apHpfb8Y2aUcaQFCzOr78h0+OXYj3yoX1JbjrWqndvX1LY5vOKjr0gCfjhD3sHlUIx+x
         5GMMscno/N18o9cInkpn+2j3FWzghqU/NjKboqZxzx4Z0IieFbVE6mzHDIoYWRwVjEHy
         ZHVQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr8Hf6aUIjKoSilTuhViIga2csfTVhNx6ChsxyD9uwBSkexMpFO1/cz29tuMk9dKaIRXtdViRNTN5+cF45p@vger.kernel.org
X-Gm-Message-State: AOJu0YwZg/x3VHmFul66HAvSzeg8WGSOSqur3MHVZ+jR62jUqjMDojSm
	BYKZO1SNDAoX2SMQdbtIVWuFzeQ+mHanUSpqqq9AO3nt69Shcp6nz/ZgTT94MQFjUBqtxVDi+pi
	r0aAyu/mOg6Z4lwyvcnZCrcyhgdNjo7j8muullMOHrV/ZnEkxZfDcphmKu3RMQoVimcOb
X-Gm-Gg: AfdE7cnfo/jlS0USvG2/0UYyHJaG6ejEkxjCmsYA0YEOOeJzGR8QntTKrFSvzRSV1K+
	sjfwpKBZKDL0K2j1vf9r77PE+ZnCIoyMaszSHNGwyJ2AFswj6Cc61dZ0leloqNU7Prkdwx32IMV
	Xfz4GisfQ6AQ/KMdi2feB/yMQI4lRcE4aDyubuPH0mM25+RUXqrwgEONLVbs9Jqo1X91GhDBkkS
	c0mabZTnaWmuAcyHNKXPd9GY2rfyvNkW5B+07uKnaHH+wCl4mPlselxHkUJcwfDWfIigl6CmHug
	rIMfTWVDzLrWkJLqG2AaUr+TIAbYUs+HIVntJ/RSVysCWfuADH6Ce8QK6/p6WjDx8fogOqkXV7g
	Z0uML+KVmYCN/PMkpdpI80OjknFYNeL+sXqPAyIUV
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr8328707a91.4.1783313756483;
        Sun, 05 Jul 2026 21:55:56 -0700 (PDT)
X-Received: by 2002:a17:90b:35cf:b0:381:9b7b:35e5 with SMTP id 98e67ed59e1d1-382800d1a6emr8328696a91.4.1783313755987;
        Sun, 05 Jul 2026 21:55:55 -0700 (PDT)
Received: from [10.204.78.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3114fe08b1bsm12946548eec.26.2026.07.05.21.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jul 2026 21:55:55 -0700 (PDT)
Message-ID: <95e8281c-91e9-4444-8b83-ea87243122c9@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 10:25:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 40/42] misc: fastrpc: Use
 devm_of_reserved_mem_device_init()
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-mmc@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-sound@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org,
        sound-open-firmware@alsa-project.org,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
References: <20260703193855.110619-1-mukesh.ojha@oss.qualcomm.com>
 <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
In-Reply-To: <20260705194019.2565498-8-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4hQdghvh0j5yWDOBnq_rI_pHYUlVbB5I
X-Proofpoint-GUID: 4hQdghvh0j5yWDOBnq_rI_pHYUlVbB5I
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfXziFboEhS0Z0Q
 2HvsxSUXaKBFK1G5+s8ZjlkCa6KizL+fX2C9CHP9wPdOaIpNP+RztmTzdvu9uKq9rgJ6OUQ9WsX
 eG3xnBlmWgaThSk3MPXnHWd1AqDC9oI=
X-Authority-Analysis: v=2.4 cv=MZxcfZ/f c=1 sm=1 tr=0 ts=6a4b355d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=ee02QKOXNWxg8IJ2rEsA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDA0NSBTYWx0ZWRfX6/+SkdC7HGHO
 iUo6c/3/imFq3FtdKBQVOKl+6jaVwFPMwnSVk8fOFU4WGE5uENELw6fsZQG6fVNnV//zjoY34ty
 I2ckEqRkfKbuqAbCBfChIUXmJRSpnwN7PkF5KbaWQQlF/T5LwK3EXnGQRbWiD7AtBlVsN81mk4w
 4LQgosHcNHi33UZyajRG6hytzTFyaNaq1LrENQyiT8j22kbAtl4SUrUEdiaIJQ1XL/YSdXkvXI2
 EJNK6CabMfuuXd1YBHfxsiBH+bppVZzxaxz7BxippWuSplrm34yG+nVnEGw6Mz2CCvP790N4uN4
 9IG4mX6SMzbnQsdjgcRwQuESNL8Xb7MHGmX05fOqxHLrHSudP0Kkb61ngg7F0hAj4sPj+zR/CBo
 /h80TVTkr8lnyaSJtGT9lRqMxfbPDvoHfBUM2EuitHycLq+21dL8H1SH+uG4oZTR/ZUYTu6i4ad
 7xixot+MzZ5QmkkM0Nw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-05_02,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060045
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116622-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:devicetree@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-aspeed@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:linux-mediatek@lists.infradead.org,m:linux-mmc@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-sunxi@lists.linux.dev,m:linux-tegra@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:openbmc@lists.ozlabs.org,m:sound-open-firmware@alsa-project.org,m:srini@kernel.org,m:konradybcio@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ekansh.gupta@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 329EB70C7FB

On 06-07-2026 01:10, Mukesh Ojha wrote:
> Use the devres-managed devm_of_reserved_mem_device_init() to ensure
> the reserved memory region is released on device removal, fixing a
> missing of_reserved_mem_device_release() in fastrpc_rpmsg_remove().
nit: I see this change is also fixing fastrpc_rpmsg_probe() early
failure leaks as well as -EPROBE_DEFER retry paths which could be added
to the commit message.

Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index d86e79134c68..c4e05b0db527 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -2396,7 +2396,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  		return -EINVAL;
>  	}
>  
> -	if (of_reserved_mem_device_init_by_idx(rdev, rdev->of_node, 0))
> +	if (devm_of_reserved_mem_device_init(rdev))
>  		dev_info(rdev, "no reserved DMA memory for FASTRPC\n");
>  
>  	vmcount = of_property_read_variable_u32_array(rdev->of_node,


