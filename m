Return-Path: <linux-arm-msm+bounces-115881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id G+uwIoMyRmppLgsAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115881-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:42:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 357676F566F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Jul 2026 11:42:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=OvvrtzPw;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=DviE7OQ5;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115881-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115881-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 04B913064EE7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jul 2026 09:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC17D47DD40;
	Thu,  2 Jul 2026 09:34:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85EAC47D93E
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Jul 2026 09:34:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782984865; cv=none; b=Z50fP33tAEjDC1stjDBMa89u1B7Fp4c02iqoADm9ldQHydSVNuF7gdPKNV7hrqZWLtRBpS1wkEiyl352F1pY352iwSm8HyU7OPN12nim1j8tLwsDQKP0AvBEimdh+kOaqKjoz0fdc75SVYTKZ+92NcaH//VtxsFPpB6n8gn51Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782984865; c=relaxed/simple;
	bh=kraOZFk3YHZlO6Splr614QYZL7yC+MizHPp7gvrHipE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EnemZZZZlMUdjn9Q6ccRwHvpzi+Yl0rblU/Ob2c1f/aFS3YFuR96CRxJVFgHitfJ0ZunWroOrOh+zle8H5oe2gl2BZSFKQX8xNEpqUF0aC+Jw+b5QQ1UCw7xUAfUNNxR+/TjyOxUSenqigu+CVTXcaFxXfpKoXA4tYTTAOK7tKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OvvrtzPw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DviE7OQ5; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6624iLW03591734
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Jul 2026 09:34:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rl9G1jeSjXcgJJCCIYloi7taZPF3m2xjegg3sFRk3iM=; b=OvvrtzPwBiioFcq8
	kz8GUqP0iZytKz+MNHA2bXOTKCDHpRHZGMZ21NQKXOeOFQamPoLO+Z+RcK0NfViw
	+vcAJOi7vabrMyRZ3JVvtQsM7HQ0xiF6roadm2nNEeebjGXILq480HoB3i4GZtaq
	a8Rn16SLqKpsZE7s0ueILBvNtd/dUka+bo6k8ocppY8Qz2n3/cbO4fuobhz+uJyJ
	DxC43mrikqxCMFpeudCV1HWjk7nxDlABUsbLM4KlQoeDKeFFTtCcXLtuH0yf5SG1
	+7219rurtN7lajg1sZTOjwlbU8k/mmqODv4lVDAandk3Wy95I2eKUTx/NCMuLCBX
	JscFsQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f5h7n9296-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 09:34:23 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c15c77619so3238391cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 02 Jul 2026 02:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782984863; x=1783589663; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rl9G1jeSjXcgJJCCIYloi7taZPF3m2xjegg3sFRk3iM=;
        b=DviE7OQ5Cc1hIFLCYX7DZJ5xrsMPGxjzclmraDsZhNjiXRldVRoFimYTEJOxa0cJjS
         HYx3HtGcvixi+zBLSkMlMRkg29xxQadwbGdTl/+R1AH6VCbDmIdkvdXmZmy3BJRsCwjg
         w9P0qmXE3+jiM9MZEZfQVRVOC4EfjrEfEP9egthVOeSyMKLGwKACU0KRS4+45LQIxxej
         YsDdA3wIkz455/Lb5e5Bo0stjJtBM09B03wq1ZSrRXNeXZ6Hce0qfGY8vNHAqdXgYsAN
         YNJzTtOqtzDgwnMHuV1fI9ejrpSfdfk2gikKFKUiDjmHgsWVqhb+4rktuTV2AwFYj1hO
         dzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782984863; x=1783589663;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rl9G1jeSjXcgJJCCIYloi7taZPF3m2xjegg3sFRk3iM=;
        b=U+0UQlq3QxLXSzvh9muYi62w/w3jU57DPYC5Lwpj+agOtdjl1u3MEr/oHaobHE4SXt
         R5ctfYvnabtPldvCnv0hAL8uAKSYTA9KaBiHerdHbN2jokJwf9o7S6d/hzUA1M5eQTyT
         dknGK+aMomzD6EZ0SGtlWEHE7CWAukT7/WSNz3Mtz/3smKo3tFmdtd9+fQeP+PcEFAKm
         Nzx7trO02pylRj7Idw8+nLk5TVFs2oOOFMI/BaVMaKGY+2lk1f0bcATm3oSysHx6ioWK
         2nu/wG3ELL0f6gvC6/ZYPJ1CsXjWat7AJnBhhnSe3V7DlYXuTsU2YcjdcGGHDqQjj6Hg
         8xeg==
X-Forwarded-Encrypted: i=1; AFNElJ+iwgVwBEXpjpsI9Y7pTzR3FfF9SZBW72SVN3rS6gOCzAn/f4F5hr9aoyZnTZ5KKj0GC62tWA/Lmtrpp2oM@vger.kernel.org
X-Gm-Message-State: AOJu0YxmavpUydnBUiAnWondBca8mjnvGclAtgOrat/uYxdW/UIiSJbU
	FxYGQft/WOSStUEfbbKoFsH0YUvWbE23aMl7Yj6bFXna/r+JouY0t7QGzoLf9fYs9Gi7xe7SRXG
	r7doS4q7DwplXvOYVpP8UpRZEEvbCjkOdsDqnp8aIlAjtlFglIsAhOVqaOxdIAxGc/xyo
X-Gm-Gg: AfdE7cnCkwmMbRSxFhb/15DLdIG1oSCAJLTrdchs0HrbX5c6piDTuc6iIH+BOuHLA11
	KDktmesCbmtnNykmtdp3JuaMLauV1lNJMglwLdIVVSaavBmLh2U6V9eO9gBojB0WVAYKp51ELIu
	OzJJGQikjNBPLnLSf8o6mOJCjVCTiCGIzTcT5SnhF4b4Lz5LfqydVLKhjd0+1Yxcekah0ViCUaC
	ZjlS/qQYZdW4UiOBPFHqM7BDli8duK1zvN7uAQqxnq7SnMh06/luqQdsP6jZc72OoZy0W/z8n3g
	nldDeJ57hPbuzw+dsIKXBkKOdQaYqXfG7k2hY4ohtDWuicpe4kMC45HH5txPbf1dQrNTEutaWRV
	MvarGVC621XaUqZNDithjcYP0httIj0p3jHU=
X-Received: by 2002:a05:622a:1812:b0:50e:6311:7380 with SMTP id d75a77b69052e-51c26b119a1mr54070771cf.6.1782984862730;
        Thu, 02 Jul 2026 02:34:22 -0700 (PDT)
X-Received: by 2002:a05:622a:1812:b0:50e:6311:7380 with SMTP id d75a77b69052e-51c26b119a1mr54070621cf.6.1782984862217;
        Thu, 02 Jul 2026 02:34:22 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c12b62c552esm97219366b.49.2026.07.02.02.34.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jul 2026 02:34:21 -0700 (PDT)
Message-ID: <472aa507-b6dc-4917-ae66-ee723e655484@oss.qualcomm.com>
Date: Thu, 2 Jul 2026 11:34:19 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/3] ASoC: qcom: lpass: Switch VA/WSA macros to PM
 clock framework
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-xo-sd-codec-v7-b4-v8-0-d39d0fdb7859@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX8ho95IfT4wWm
 6dhWKoYfkqQ+WZMlFv4TCk6AxxvwW2zVob+m9UukJR5xIv1zxHxdvF8Jd7V5t2mzjVMChz5cLgg
 nON1PzBk9uru5oTAR+HeoTITxGog5oHxdmPSpos7UvcxbBYfarBY1jb13MhP0nP8FdyP/YNANDV
 w7ha/gac0EyWDlEfOF0W+jyMkb9zXHdXAggU18J6sb+XkW+sbskMYtATQR9D+vNcHcFWyUlxPUK
 JAJICnJOx/ZJTwVPa1LUyJO2sR8WEZSmqUyBJJsk3jQVBNvoCzY/r6gNOnvmykuMGlg9hF4yma5
 DuNbMPw0IURggpCOLEAQbfUQi0lOVutqyiwh3wB3A0MT9LnKqXVydq0vHFrYchz0olcY5775Hm1
 dmrQ4ggztLZdwu/BFCnjhYU/NdIs2FLAMntc44sK6n67ZQG4ieMr5SbZbVrsPiK6DP/q3o9SmaQ
 jorGQDPlLh3fQSzEnNg==
X-Proofpoint-ORIG-GUID: Velzxaxz757cTxOJI_dLkumaK2JhSk9f
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA5OCBTYWx0ZWRfX6llx3MZPPG+T
 c54FcGLOWfHGtAr827P2xmebTNFlptofJAWLYgSnURgTi9BEeKl1RWWmFYx8nzG5fdBZLwSZ9Ke
 Eo7OmalOYCcRt/slDqFBWnBzk7K1s0A=
X-Proofpoint-GUID: Velzxaxz757cTxOJI_dLkumaK2JhSk9f
X-Authority-Analysis: v=2.4 cv=WMBPmHsR c=1 sm=1 tr=0 ts=6a46309f cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=qMpE583nMN1t2QvFoBQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020098
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-115881-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ajay.nandam@oss.qualcomm.com,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-sound@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 357676F566F

On 7/1/26 8:44 PM, Ajay Kumar Nandam wrote:
> Hi,
> 
> This series converts the LPASS WSA and VA macro codec drivers to the
> PM clock framework for runtime PM clock handling.
> 
> The runtime clock enable/disable sequencing is moved to PM clock helpers
> for clocks described in device tree, while regcache state handling remains
> in the codec runtime PM callbacks. This keeps register cache synchronization
> explicit in the driver and lets runtime PM drop codec clock votes when the
> macros are idle.
> 
> The series also keeps WSA MCLK-output clock registration resource-managed
> by switching it to devm_clk_hw_register(), which allows the empty WSA remove
> callback to be dropped.
> 
> Changes since v7:
>   - Dropped va_macro_setup_pm_clocks() helper in the VA patch and inlined
>     devm_pm_clk_create() + of_pm_clk_add_clks() directly in probe, matching
>     the WSA pattern for consistency.

b4 adds this section automatically for you (see the 'EDITME' below)

Please also run `b4 trailers -u` before `b4 send` - you didn't pull
the tag I gave you on v7 (please don't resend just to fix that, I'll
simply reply once again)

Konrad

