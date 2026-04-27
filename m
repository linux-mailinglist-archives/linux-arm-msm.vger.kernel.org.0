Return-Path: <linux-arm-msm+bounces-104712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oJUeGjhR72kLAQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104712-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:06:16 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC71F472406
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 14:06:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2258E3013D5C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Apr 2026 12:06:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDCAC3B6BE4;
	Mon, 27 Apr 2026 12:06:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AM7uF6/V";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V325ap2Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A363B4E9C
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777291572; cv=none; b=YGfrlFQ5bxvsk4wumTQ7ng3cDyKlKMRlqirFkSnhMiBaP0UWtK/NGMzJx14VK1ql7smqwhmyrwioOa0weXY0n5dT1zW29fdi7PDXvXQA89+mrwjoUQCMhcUf1uA9ucEeG6FXGb5FnCTK5ihI2sK8hWsoJJ8km6/YeA0ahdLxHlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777291572; c=relaxed/simple;
	bh=F6MsY6q4bSeme9jrlCkMC7+dXwQzMH5QgSd0FEaplVw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nY/R+SerRlq6y1Iod2Z4TkdNbR/KyJuPx4BllfKa+efCQIru4VSsYB/YG/GaKsZFifTWXWv37xoW/ot5roElTeJJbnLpoqz3TEJnZMmexucJf6weqSsWP0LVBrfxj6FcxqB2HWkWWMfbiHqC1YoZVtQYeHvd8Z5hZMIJnMr289E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AM7uF6/V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V325ap2Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RA3nfn3123502
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:06:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TsESwDIwA8Eq86xNAI5r6tmdBS46YOMoxxD+xO9ArOU=; b=AM7uF6/V6eslYfVE
	Zkep01HRb86Ernt5r8jwNmosJ6H6oNeDk6SPF5SLidbxQP1pWXQblU+PMV/JMHTN
	ZwQTDRySJ7+TWzd+RyS745BSl5isj27ifZYpAaEq3Lvw/5jAK6MLNGjOCtSlSi0K
	3wiD0nEQVcVHD/pSA+AYH4YtzRcAzqWCsy15OqjkJsedehViNyE8+TMw7AVx1HgT
	mYpDoNfKKZBeI1t8UHv9iButu1sKucLJNSHjdkjAk0Xm7/xcAEg3OqcSGC/hcHUV
	balKGGQ+dUIW66KfqOtBJNBGK0QVY4NiVnM/rAgledVe052TBMJdlO2zvuGbXvA9
	/K6deg==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt5qggdas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 12:06:08 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6948d83a5c0so19309604eaf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Apr 2026 05:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777291568; x=1777896368; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TsESwDIwA8Eq86xNAI5r6tmdBS46YOMoxxD+xO9ArOU=;
        b=V325ap2QHdHt8DOfagjGBgjOs6YvisqITJk8XVr+jq/gkZUWIoywl15jNHUMR3KKc0
         n+qUWFkX+iNcSssUpswUSnwQqaOgbDjUb1y0KXgda6llQG6ZcokztebOktp9kQbdanXp
         Z162Mu4ldpY6LfIDf8eswgdqpc+RMzfcDhFj6KEtW3r/M7nX9bKhDuUECF2EJ2hNlIwE
         BuBPbq6OC9gD38Pi+1Kfu8NtrPU/xdDI84BZGW0z+gguDmgf57SWLp6PGNu74R9NY9bF
         PWg49PpTXx5TJPOurhoNUD0yNlHf6BAKW4Vv59Iz/qXh4Wvc2k9J84224onHtk0XKw+E
         lVKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777291568; x=1777896368;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsESwDIwA8Eq86xNAI5r6tmdBS46YOMoxxD+xO9ArOU=;
        b=TFMFe9F4+8zSWJ5qJNPINoZvKbRWuniuTmKu9xtdScvL+OwZRWv1hCqIsiLvj2D413
         p5xf0X7AOqaK+Pj7WlcxkX0ZqQEYSNSUvqVWqeWVm0KKipq0jNQh+YFbNTYY4/lDI4+y
         oBVOpJRSXLWXKtpo5UOmlxLvxw3HJpo4d4hnpLmTlMS3ZcQkgXfaOwFuohaeDSlO9KCQ
         TmzH1aJ0N6x8gf3JAH7eXw+oVVZs345356RrvrI4JcZsOv1PW5KHzwOynQYe0ZJ+6zFR
         tbbgJebkukehgjw9JjBpak3Z2IKbf7s20pyN4RB7PUK5feb0dFE3t3IEYeiKdfTC0H5d
         PtwQ==
X-Forwarded-Encrypted: i=1; AFNElJ98gwr+4w2mx/qvpE1TkdrGU1gdMV9Ky/id6ppGlmAl0wcDATkY7ODI5inx36NMMuSkizQ1fx2gbug5lmcI@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2v3A7qIOiW7cOhvEzaibQ1ErvGTr6cARojsuIaYNrPGjVEWxG
	P2hy2RrIqYwiIlh8vwpWYD8aZiFSH61TlG2L7xV+um3xSoviV8KLCGlkJXQRd2i+m+NqeGfep7i
	va1J452fmipnQRO4j7ZkHK/i0M80GdHkgSNSCYJHo3lBtqPkKLMjF+0Gted72YFNZYlUr
X-Gm-Gg: AeBDiesYgmX1uzBqXYjc4mc/csnbScHLQc8hRoU2mG+YDtwEWhtAuMLlwzmPCuewmqG
	pOgiPoNXtaQXSCmBGc9KgOomRm7lqLQmrq/N13JWDDJY83jC1RFwgOGU+vmbHYwLQ+qU5qaVeLR
	weVJ/uE7VZHfigMDNITyHxsAENK3ylzSW5W8kCYTVd8QJBtjy81hQOdCj07CuuIIGt1ndxLLGET
	4K0VPJ75nQtrteNESBQK0ATXD+Jn8a27lKQ1D6G1zSTA6zo+NUzQ0Ony/kfZ/z4Y2FjWNCE+XDl
	1/uv5HesHPO2MzxjLot2lLT9t2XjYnhi2rCc2bDRh/e2GL2YaXJbf640F8LBJHuU6ccz9HP15uz
	5BTevz99ppCVU5v4Tm+5NlIjKq9DUPNEyJDPo0UE2mHdwQiWU/jgj7lEKNqA=
X-Received: by 2002:a05:6820:1627:b0:696:4874:2dcf with SMTP id 006d021491bc7-696487430cemr2020531eaf.23.1777291567974;
        Mon, 27 Apr 2026 05:06:07 -0700 (PDT)
X-Received: by 2002:a05:6820:1627:b0:696:4874:2dcf with SMTP id 006d021491bc7-696487430cemr2020512eaf.23.1777291567329;
        Mon, 27 Apr 2026 05:06:07 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43fe4cb11b4sm81262966f8f.2.2026.04.27.05.06.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 05:06:06 -0700 (PDT)
Message-ID: <47f72fe9-886b-4837-9612-2b2d3e5b5da5@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:06:05 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] ASoC: qcom: qdsp6: q6afe: fix clk vote response type
 mismatch
To: Val Packett <val@packett.cool>, Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: Bhushan Shah <bhushan.shah@machinesoul.in>,
        Luca Weiss <luca.weiss@fairphone.com>,
        Antoine Bernard <zalnir@proton.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260423050801.210840-2-val@packett.cool>
 <20260423050801.210840-3-val@packett.cool>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260423050801.210840-3-val@packett.cool>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEyOSBTYWx0ZWRfX7y8Ncn5d8E4c
 ptZhTRWvATjBrovHgDe4dErCR/m5sIEzemec16zo4jdeOrvs4ZsrLgTFr0M+M2di4NnlgWSlyhj
 SWG2Xo/Afaogs003yDaw5PmFmOjG7i7BBzt6mVRE5+7rXhDva1KbIhVScmECgV0UWJEqkCnXVG9
 rnYRnPDHN41qVIw0j2MlgwPAmDx2IQL1bcTTIZlM1xnU0YgvbBFH9pfVvPuN1ErbyD3orPggAko
 QnT4FGoRlcMgyhz5j2uWrChWducejbaNV3FU9vKoPlntlBkHNfj60kzEvucbtVoqTOCrMnpXKPx
 pCXC4/H8Buw384igVZrRzdnXWvgx7P8xJ64HsO3bqz8tFpGCryNxgFc2zaoemfx3y8Offkze3zn
 yCzsnwa498Zyr0KoT0CH3wnK+rha4458btJWiedwYdWGw6SlLIsRAzJNQvdpKConbpFyoq2hesF
 5HJAp9ILAi35ujDbTCg==
X-Authority-Analysis: v=2.4 cv=V69NF+ni c=1 sm=1 tr=0 ts=69ef5130 cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=VIjOQ41OAAAA:20 a=EUspDBNiAAAA:8 a=L06xKFqT_MmC7owT6poA:9
 a=QEXdDO2ut3YA:10 a=k4UEASGLJojhI9HsvVT1:22 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-GUID: gV2mVKkQ1jrTuoNTDTx-UsVW0yrA4a7Z
X-Proofpoint-ORIG-GUID: gV2mVKkQ1jrTuoNTDTx-UsVW0yrA4a7Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604270129
X-Rspamd-Queue-Id: BC71F472406
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104712-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[packett.cool,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,packett.cool:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]



On 4/23/26 4:41 AM, Val Packett wrote:
> The response sent by the firmware when requesting a clock vote (opcode
> AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST) does not actually have
> the same opcode + status payload as APR_BASIC_RSP_RESULT. Rather, it
> returns one single u32 which is the client_handle that must be used in
> future unvote requests for the same clock.
> 
> As a result of this type confusion, the status returned by the callback
> to q6afe_vote_lpass_core_hw was actually an out-of-bounds read. It was
> only interpreted as success (0) most of the time due to luck, but there
> are reports of random ("more likely on cold boot", "depending on hacks
> made in other drivers") errors such as:
> 
> [   20.961100] qcom-q6afe aprsvc:service:4:4: AFE failed to vote (3)
> [   20.961131] Failed to prepare clk 'core': -110
> 
> Fix by correctly interpreting the response as a single u32, and actually
> store it as the client_handle to ensure unvote would work correctly.
> 
> Link: https://lore.kernel.org/all/5976946.DvuYhMxLoT@antlia/
> Signed-off-by: Val Packett <val@packett.cool>

Fixes and Stable tag is missing.


otherwise lgtm.


Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

--srini
> ---
> 
> Found by reading and comparing with downstream:
> https://github.com/YumeMichi/kernel_xiaomi_pipa/blob/27190355fb31284988ddf505cb7cfba5128104cf/techpack/audio/dsp/q6afe.c#L1261-L1263
> 
> What's really bizzare though is that some of the logs go:
> 
> [ 10.827469] qcom-q6afe aprsvc:service:4:4: cmd = 0x100f4 returned error 
> = 0x16
> [ 10.827512] qcom-q6afe aprsvc:service:4:4: Unknown cmd 0x100f4
> [ 14.052896] qcom-q6afe aprsvc:service:4:4: AFE failed to vote (3)
> 
> ..where the "returned error =" message is something that can only be
> printed by the callback if it goes into the **other** switch() branch,
> i.e. when hdr->opcode == APR_BASIC_RSP_RESULT. How reading out-of-bounds
> only in the AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST branch would
> cause that to happen (even on a subsequent vote after the first one to
> perform the read) is beyond me.
> 
> Still, the person that reported this heisenbug told me that this has
> actually completely fixed it.
> 
> ---
>  sound/soc/qcom/qdsp6/q6afe.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/sound/soc/qcom/qdsp6/q6afe.c b/sound/soc/qcom/qdsp6/q6afe.c
> index 40237267fda0..28b5b6b91897 100644
> --- a/sound/soc/qcom/qdsp6/q6afe.c
> +++ b/sound/soc/qcom/qdsp6/q6afe.c
> @@ -379,6 +379,7 @@ struct q6afe {
>  	struct q6core_svc_api_info ainfo;
>  	struct mutex lock;
>  	struct aprv2_ibasic_rsp_result_t result;
> +	uint32_t vote_result;
>  	wait_queue_head_t wait;
>  	struct list_head port_list;
>  	spinlock_t port_list_lock;
> @@ -968,13 +969,14 @@ static int q6afe_callback(struct apr_device *adev, const struct apr_resp_pkt *da
>  	const struct aprv2_ibasic_rsp_result_t *res;
>  	const struct apr_hdr *hdr = &data->hdr;
>  	struct q6afe_port *port;
> +	uint32_t *vote_res;
>  
>  	if (!data->payload_size)
>  		return 0;
>  
> -	res = data->payload;
>  	switch (hdr->opcode) {
>  	case APR_BASIC_RSP_RESULT: {
> +		res = data->payload;
>  		if (res->status) {
>  			dev_err(afe->dev, "cmd = 0x%x returned error = 0x%x\n",
>  				res->opcode, res->status);
> @@ -1001,8 +1003,10 @@ static int q6afe_callback(struct apr_device *adev, const struct apr_resp_pkt *da
>  	}
>  		break;
>  	case AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST:
> +		vote_res = data->payload;
>  		afe->result.opcode = hdr->opcode;
> -		afe->result.status = res->status;
> +		afe->result.status = 0;
> +		afe->vote_result = *vote_res;
>  		wake_up(&afe->wait);
>  		break;
>  	default:
> @@ -1899,6 +1903,8 @@ int q6afe_vote_lpass_core_hw(struct device *dev, uint32_t hw_block_id,
>  			       AFE_CMD_RSP_REMOTE_LPASS_CORE_HW_VOTE_REQUEST);
>  	if (ret)
>  		dev_err(afe->dev, "AFE failed to vote (%d)\n", hw_block_id);
> +	else
> +		*client_handle = afe->vote_result;
>  
>  	return ret;
>  }


