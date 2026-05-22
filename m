Return-Path: <linux-arm-msm+bounces-109323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WB8dAphcEGrEWgYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:39:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0C65B5522
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 15:39:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 01D6E30A59DF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 May 2026 13:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7BD03AEF2E;
	Fri, 22 May 2026 13:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIp5WXRC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J0Kfy05u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7E83BE62B
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779456329; cv=none; b=EQEkcseSSWK0kId9h7bVK6Ig5wG2ai4Ww2IMLPPgKT1PLQr8qsVEYj1e++IfWGzoRmytnnJE6+3UFsXsq+X26EXUm0oBOgih9iIQV5lpI5W+ubufFljOUt0zjnpEvA38fET+n2r8yBmimU1i/0Gbu4cnmdUlhS2HTN5ZRdUXFHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779456329; c=relaxed/simple;
	bh=y6oQHJn/KR6BxGOLf1FiFdBougOCwECGoDPfiREwbO8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TUQ3G2eeP9YdAxMVVQli5CJIZWhw3jKSRUvC9DUd0JyF+eD0zimmBOmPbspdW9gzSMru4xzlxbo6yC5qoYhawG8O/RgeDiqbTkwVhwjJvTdyWv+bcPjkh+MLfW+sFhpjk1jDN/7+qBCCbHRQCbvHL5HE11uARzdV4AAZoIS0OCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIp5WXRC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J0Kfy05u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64MA1n5E312832
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:25:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kD2WrEV70MyDhtBtLo1wFd6PHoOvrRSdsTfZ//BkSBE=; b=LIp5WXRCwBHwVWX2
	Lr26Q1YZvP5DIZ89Uqh1tC4eG0haeQ5P4exYD+xI/i88in7G0xhja7V2EslHHXdV
	PRyfnFdi7YWG6plKGRavK1KMzmz6gA5NzKKGHUCtTg0ePSlbuaCX7pCYmMNFTiOi
	n4TFYahwanIxi7CL+F27F4dzjtQsih4rWBmL9A2guMys8AyQyJU1A1mwMQJ1D/f3
	bvLIzHbwFFOB/6NhgRv/WVDcd+RGxrxYNThwQlapKyGmfqEXI0/ZTA0Ezjx27oGJ
	0vv1hdFCPIfHoHjEe2/ghRBqeNlqZYS1a7X2yV4w9ab+W5MgHoYvbge330xe5Zfa
	x8eigg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ea8833yad-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 13:25:25 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5755f6c9bf5so463124e0c.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 22 May 2026 06:25:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779456325; x=1780061125; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kD2WrEV70MyDhtBtLo1wFd6PHoOvrRSdsTfZ//BkSBE=;
        b=J0Kfy05ubNJ7BNrt6GHdoFdYKsaICX/iSr4ozyVItMMcWsROjNq9m8/sgnM9RrtTzE
         7PCJZLAOM3isuayV5oyeFrfFzwA/nni8PCo1YS6WbaR3iQErY1wdUs1gtUJgP+R6W0L4
         zL9XOuzbA5oYCBZAOT47L0UH7p4dN2q2OOpdGrcZpPrh0srN9C6JBJqnhnPuMeDQ5jQN
         hGzzncXayzPNI8BozgfzLt/2QViHP7wL558HHfr5WG7LbgVkAywtT8HtO8N0LmM4Vo+j
         6QmNmc9RqE4I5W9fmcXAn/6cU21oAkyNf3KLwtuWzHts+uUgVdUniUlmJ5LOfV1ftYF4
         z15g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779456325; x=1780061125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kD2WrEV70MyDhtBtLo1wFd6PHoOvrRSdsTfZ//BkSBE=;
        b=gLPOacP1u7LMz4TRrPe2I/eYj2gKrm8G2aFuEttDSE247anlJc66RbMdBIcRIFJ3zn
         t93aHcR7w0PKaqGRYDU6fHY5Y8+exuVQ0RUhtV6s9qCyBBAMjPXzeFUBMAS1lbxfyt9D
         KHyw/E7/NThe1TUnNBpwR7OR20nAmAo6q3DnTJBaoj9NS4kBMOPyHEUR+mFE251BySZ6
         iggKrC/Gyg3/b4rcchBr3+cNoZPhhKYpHxFxMXmfI3EkkTuA2Z/zbcQa8keRRHrt7NfR
         2iO4PR1ybSD9DhYhK0n5uM9szWAnzw8d/B58p4ETZKRzxrLQUYtt2OfFUQi0Y0a34qms
         AjYw==
X-Forwarded-Encrypted: i=1; AFNElJ8JxcpuydD1o9kqCM0NXn8J7hYMO7K5UW7hqZRoStmwmHYPy6bPB+mEnLwC05vqJb0kLQTq0cum8fRibkPF@vger.kernel.org
X-Gm-Message-State: AOJu0YymcB4R6d5phrGjMLmGBmyNIgpJ34kQLPDxfAOIJT1m+tC2ryMh
	n/+CdtygeqZMIsd/o2/LHK7JOHeb6mvAkqu4H4zr2K9udMEPD9L3C5IyZdAdNhsx/JY97k2bxdI
	jnNz795MbnDAf1ENwLsw+t1HRMTb82azzJ47NmpsfqOzrYQzAAunwOcPtBSGcrwGI6PTL
X-Gm-Gg: Acq92OFDSyoHDukjiiVZrbytf9SKBjGQxXXbzdUinfbDJQpSQoxjwBMQDf/z5zG3Jfn
	anJtupC3lj5hoxRIzD2/0JXlzE+yWkRVlKnQoetJXObPx/dZTbBmwSgFdvbv7hOfp9qlvoAf+U9
	pcZPHfPY3jwQUXxn9GVsBG0wxenYXkhJKKNcgIUq9angJC0xWmumM16uPzGOTqNRqgn0UJ8ueeI
	hzDpFuapk7XYpJ//48uSK3AKEgpkl96DOaXLRO+hATr6aUYguBDibRq34btZgy5ePlAbj4vj96M
	z9tXf2BhLlXH6qd77RN63VQWoE747lcqDhroChaAXWYTRIK11NZbgu044gVnWGRC40x1JMIdDji
	pMuyZkm4IBVBY1vkVL6UzlbXbw/YM6BZyWVOOj95Cj39z0Ry6HjrjBajV
X-Received: by 2002:a67:e3a1:0:b0:633:13a:6e31 with SMTP id ada2fe7eead31-67c8529284bmr476480137.8.1779456324790;
        Fri, 22 May 2026 06:25:24 -0700 (PDT)
X-Received: by 2002:a67:e3a1:0:b0:633:13a:6e31 with SMTP id ada2fe7eead31-67c8529284bmr476469137.8.1779456324197;
        Fri, 22 May 2026 06:25:24 -0700 (PDT)
Received: from [192.168.119.254] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-688b9b6d334sm679898a12.2.2026.05.22.06.25.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 06:25:22 -0700 (PDT)
Message-ID: <9e8c0351-0168-4d94-8610-cf2cc2f030f0@oss.qualcomm.com>
Date: Fri, 22 May 2026 15:25:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] ASoC: codecs: lpass-wsa-macro: Switch to PM clock
 framework for runtime PM
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mohammad.rafi.shaik@oss.qualcomm.com
References: <20260522073324.e18bb240b6f6@oss.qualcomm.com>
 <20260522130459.3411038-1-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522130459.3411038-1-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDEzMyBTYWx0ZWRfX2sejZBYJ+BNA
 /ZxAY7KeWkaiuxxaghfDIfgcNrMPdYImPwQsrPUi2OQzLmOMpZI1KpZ/UVchMhp9o14qfUCRWZ0
 d3Y29b1s38y+6L/7s/0YA76l2BFUx6cxUtEqC9X8mIsbtLVlw4B5cyk816c1QG0Ql7IPpxFzPt8
 B/dd9B5GZL50FvUhxX5N9tXWtX3JfILKgXMYt5VDNO2nQg+lhx4He+/URyWX8w4oCJEkZbVVFAp
 v75ZXYw7QXLNYovobLeGwZtV4qemtgUyQHBKa58gjdJ3XKmnKHzlpf2397UzpZbyXyT9+ELaEDl
 ltc0sGeZooWT08cIlYeUjn1EXm1tBaeKZrw+jgGMyUgVfdFj7G5iJF9WNhJ9wF8XPJlFuOhriXt
 XLfAoOCRmB3rk0FE3BiGRp916dtHUjTeFMYA8jquv5+s/o8CO9hGwFdKMMFbvHaIDB4TjZcRnNL
 x3myWDbp4pA/dWX1Nyw==
X-Proofpoint-GUID: MlSdOm2bbTBDZpdBinWHTw1b7BfOkYCc
X-Proofpoint-ORIG-GUID: MlSdOm2bbTBDZpdBinWHTw1b7BfOkYCc
X-Authority-Analysis: v=2.4 cv=LsSiDHdc c=1 sm=1 tr=0 ts=6a105945 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=weikHDwYOGaAN1ZrU1wA:9 a=QEXdDO2ut3YA:10
 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605220133
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109323-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,perex.cz,suse.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9C0C65B5522
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/22/26 3:04 PM, Ajay Kumar Nandam wrote:
> Convert the LPASS WSA macro codec driver to use the PM clock framework
> for runtime power management.
> 
> The driver now relies on pm_clk helpers and runtime PM instead of
> manually enabling and disabling macro, dcodec, mclk, npl, and fsgen
> clocks. Runtime suspend and resume handling is delegated to the PM
> core via pm_clk_suspend() and pm_clk_resume(), while existing runtime
> PM callbacks continue to manage regcache state.
> 
> This ensures clocks are enabled only when the WSA macro is active,
> improves power efficiency on LPASS platforms supporting LPI/island
> modes, and aligns the driver with common ASoC runtime PM patterns used
> across Qualcomm LPASS codec drivers.
> 
> Keep the SWR gate runtime-PM reference from SWR clock enable until
> disable so autosuspend does not gate clocks while SWR is prepared.
> 
> Add a PM dependency for SND_SOC_LPASS_WSA_MACRO so PM clock helpers are
> available when this driver is built.
> 
> Suggested-by: Mark Brown <broonie@kernel.org>

You added this tag, but was the entire content of this patch sparked
by Mark's suggestion?

Konrad

