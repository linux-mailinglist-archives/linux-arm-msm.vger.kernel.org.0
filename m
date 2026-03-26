Return-Path: <linux-arm-msm+bounces-100113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OO2HIIU0xWlS8AQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 14:28:37 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E9092335F49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 14:28:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2332E314404C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 13:19:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBF5237B016;
	Thu, 26 Mar 2026 13:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IL6WnSxm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FxDwy5wq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A729355049
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 13:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774531093; cv=none; b=djAw43pLy3j2ZiBcCg8aPqTbAq3KeCvJ1z79Ol3yWCNuKjHhteYJyqvsqPplQFs0UUs3eGtR7hdfsBEMQZS0loaeIFykNPMP9F3Mo0rXLggh3DczFr3XY+U0iGdVhRBjMUKR60NJp8EkOpxcFFVnmIkotShXFUvfc2ZCUnOV21Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774531093; c=relaxed/simple;
	bh=GVrAs+mbWwhG4Yrs5Y37N0As20DHfpTYfrsSSzI6gEY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EJx3jBkDW+PsIAmMVTtFwWacJEjKLB/jfzPHRTYh91fgwauc6BYDYygBNMKm0Dd+w/Dm2fphhPkF47jAmv29gfzwmfojg+rb2NF30Y6/gOGADDSmztORyZh8mn/t1ShuwcVOpGylWfZmQUo4hYfZq68OdaDKQZgRZ3QDhStG4Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IL6WnSxm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FxDwy5wq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8Rtct3957917
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 13:18:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JtXH9taf87WO8xzgXDDb3Zjy+pCG7JpfvAodNb6v2H8=; b=IL6WnSxmED1MJgzW
	FQdMf4e4RFz+MLIT5qffNSmweyniSM119ealASPQveXSxxrybWuzhHqQH75rWiPE
	caP0QVufVW2HuV02FFHZUkqzZQXU419yuqZC2OvkUF7V7D6LVbpSjKI31Y+WSemy
	d/5Zutv9AJ4GI5gSEofpZPq2W+A4HzH6hog6OuJlDVuDuUb6FHd/azNb1EVxWBbl
	m/Hscc3w1Vj4t8at3kGkLh15lrbhojLdWVoSPeOx6AE8P9UJrm1X0xmjk/IJ6kQV
	ElprTywd98aD3Ing/iCdMvtXvAKzXIkwKn7pL973AV1CTeZaiIeoq5Bj5arESaut
	nwQfTQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tjaj9yg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 13:18:11 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5094ba09affso26398561cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 06:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774531091; x=1775135891; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JtXH9taf87WO8xzgXDDb3Zjy+pCG7JpfvAodNb6v2H8=;
        b=FxDwy5wqJrjju6HRLxvH82RwrCZIC4KcTYDa009t6nbXSPHTrEdNSibWY5MZL3m2mj
         X4gtX2xxeTTFiSAMaInPyldPD+HiB8EBz52JReMUuG6ImcjHEs6nPSfZxXs2HflG7JRO
         uFkMI+BUXJ4jvle1o41i0Hdx5xVmTozCXxVugb5OllskTaG+qWVh4YUzYwns8fKL37gq
         qCtrIqYrJObfqyiDlrlun/46ycWDNv6oe/A5AGCc3kmmCWaGnAj0PNWtyuRpGUhJxWjA
         S7mcEhhXDI6EpBzV6UbHWRcQeDsbSqgfF4CJ2ygPAkbhfotIzUq+tfZXC3DaSMBMkqJO
         0zOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774531091; x=1775135891;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JtXH9taf87WO8xzgXDDb3Zjy+pCG7JpfvAodNb6v2H8=;
        b=MgPjvxZ9TzU/O7/gku1LYlla0qgPuVC4Ym7McpXfPp2HqYGED6aY1kvghehTDNE7MV
         +/941y2wfZNcQTjCksovBQOiX3Cah40by11jVh1Vf5mfOn+PQYjqF3L66hgsEa9SHq03
         r11qJdYnG42NQ0IkQhc8rW1ETApAJXRDfj+iuDvMBIUnOncgkSZ8pVWNwOzazKyIADON
         /3jeHK3vEOdEZ1iNcoRWNQ2nviH0kxzBr7P1V0TCMayNFVPQgarNhZCvUC0OrlfkRVpu
         llIzHRKe2uVAlcitT2/D5qO3vec5QapzjzRutGkEek6k8VFHWzbJQtj/VPZB05fgAxP3
         hfIA==
X-Forwarded-Encrypted: i=1; AJvYcCWxe4WLTI+B01lgsofcMNiIar1PbDRaOQNo+b/jBsZHoetJcHi0r+WHhhB227BTWFFeb0pUyuL9ICXGCvzy@vger.kernel.org
X-Gm-Message-State: AOJu0YzgzkeEGIXgu62Oxsqyt13WEeVx8258BM6dkSQ2lGqu5atPODF2
	+ZLKMGMruSZOB+yc2J8pEkA4QwH5C11aXl+BlCb3TbaNW2/zAU/x4fJfQGUQ4HYt5plV1bsNwaL
	A6wADarvcYZ0MkiIPsdjGMtILSedSfc6W1x3DYLy+9HAwcPH6/drCcIsK6VhHnP03Tbc0
X-Gm-Gg: ATEYQzyC9udPy1e2eVVCm5NCFRBJvlIf+W4VJ1s2UNEghqgW/FytmXGeuCAjMA8Bpno
	GjGz0LLn9fFn++PcDCeY+Px94jp16nINxru4BeQcCCaalnmbBOMYs5aDcVrl+ZkqgDZgAaj/X0f
	yCL1KHD48EZ5lnh6moFYfZSl/372p3P8t4KpGzc/I/UmiLjugW8+rwW1mUQ/GsSQ1YdrqEe4Kin
	t06lfY6kDuWbCOcWTAouTjxT9PKkFHtFlP/w2cEuPhojn3tvO628SOtWd2cuBJUDep9V/Vd57VX
	rcC9nqT9I7mZGLzGLqc+ydojDpoGsqyy3rFchGTbSPL9J3sDoHHeRFqbLZoBZhG4w4HF9upu0v9
	ORWLsqh3SH72Tx0ESIT9t4bO/8uZFE5QP7qdY5j+oXPR4AD+p
X-Received: by 2002:ac8:754e:0:b0:50b:69c2:b86 with SMTP id d75a77b69052e-50b80d73a8bmr73580161cf.27.1774531090864;
        Thu, 26 Mar 2026 06:18:10 -0700 (PDT)
X-Received: by 2002:ac8:754e:0:b0:50b:69c2:b86 with SMTP id d75a77b69052e-50b80d73a8bmr73579871cf.27.1774531090274;
        Thu, 26 Mar 2026 06:18:10 -0700 (PDT)
Received: from [192.168.68.114] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-43b919e7372sm9397537f8f.34.2026.03.26.06.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 06:18:09 -0700 (PDT)
Message-ID: <6f70ee7e-78bf-4f45-8fb7-00db13c5e9f7@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 13:18:08 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ASoC: qcom: audioreach: explicitly enable speaker
 protection modules
To: Ravi Hothi <ravi.hothi@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
References: <20260326113531.3144998-1-ravi.hothi@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260326113531.3144998-1-ravi.hothi@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: x4XquYwBQhcO0GJFuyPZISGh687rFZMT
X-Authority-Analysis: v=2.4 cv=Nr3cssdJ c=1 sm=1 tr=0 ts=69c53213 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ynJt5whLjcjaSQVNdSsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: x4XquYwBQhcO0GJFuyPZISGh687rFZMT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA5MyBTYWx0ZWRfX360FZbNL0VTU
 XBjgqjhROM43ZHtaAMq7/trwDz4Ekc4Oj7grDj9caCdV2PLkhJ0h/e6Owo5yl+3WI8HvzqXmFNl
 AapL4DomZJqBTGaVIFpgwogDh9KSndufqGuKkdXSCSw+NE9BwYxl3e3bhZUhHZG1HZOAhaf7zd1
 29HxVvWzaNuuWWc5QSi0H+L4KC4A7Zsd+GZMCp8N8bCu1owAlCn/IPFW/irNBfxsWwlJosgRonu
 irT5mpkdP5PfTloRAk6lwFILuWB8FAWKaWwvSTY6MvBDYw6OtYaHcKJXhn5I32e5BRbi3pBpGVl
 aVgmTDeU/nFCb6aP8pd6BvGsn5Vp43JineNwqXXohVsxEcutotzdkKs31hT72NK7lrRKY3ESkhQ
 ugRF8ZW0QfSz4KLhxONrbhFbKU6PFafI1IHGFdfPcL0hyb+xtipM1/JZvOykPq0jeDhwvgzRpyM
 NbaYQuH7pbZqAuZLSbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260093
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100113-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E9092335F49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/26/26 11:35 AM, Ravi Hothi wrote:
> Speaker protection and VI feedback modules are disabled by default.
> Explicitly enable them when configuring speaker protection.
> 
> Fixes: 3e43a8c033c3 ("ASoC: qcom: audioreach: Add support for VI Sense module")
> Fixes: 0db76f5b2235 ("ASoC: qcom: audioreach: Add support for Speaker Protection module")
> Signed-off-by: Ravi Hothi <ravi.hothi@oss.qualcomm.com>
> ---

lgtm,

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>


> Changes in v2:
>         - Added fixes tag suggested by Dmitry.
>         - Link to v1: https://lore.kernel.org/all/20260325054408.1994556-1-ravi.hothi@oss.qualcomm.com/
> ---
>  sound/soc/qcom/qdsp6/audioreach.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
> index 241c3b4479c6..ff8cd55b0d89 100644
> --- a/sound/soc/qcom/qdsp6/audioreach.c
> +++ b/sound/soc/qcom/qdsp6/audioreach.c
> @@ -1365,9 +1365,14 @@ int audioreach_set_media_format(struct q6apm_graph *graph,
>  	case MODULE_ID_SPEAKER_PROTECTION:
>  		rc = audioreach_speaker_protection(graph, module,
>  						   PARAM_ID_SP_OP_MODE_NORMAL);
> +		if (!rc)
> +			rc = audioreach_module_enable(graph, module, true);
> +
>  		break;
>  	case MODULE_ID_SPEAKER_PROTECTION_VI:
>  		rc = audioreach_speaker_protection_vi(graph, module, cfg);
> +		if (!rc)
> +			rc = audioreach_module_enable(graph, module, true);
>  		break;
>  
>  	default:


