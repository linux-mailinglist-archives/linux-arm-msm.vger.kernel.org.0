Return-Path: <linux-arm-msm+bounces-107962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHdQA99eB2pa0QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107962-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 19:58:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BEB9555C12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 19:58:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 51118301B1F8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 17:38:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3ED3305678;
	Fri, 15 May 2026 17:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W67+M+7y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jQbkJLMW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7482331B837
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 17:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778866686; cv=none; b=a30nI0TfTrzlTJSYaRO2JjLMhDoeFpUykw3gAb0PRks9AwpHYkVTsV94fZhYBGw4ZvIa1Ac8VxSG49IMqpCMVGjs6AzwYVwskSmUan+u9GEIwskIpvDkNjudBVk8aPdW+hq76FG0SjmFbyuU5U+R8kpuEO4SWFOxAAyEP5qJq5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778866686; c=relaxed/simple;
	bh=W8+Ig53lVpXsjPq/DGx3IqIz3WpimTkvM1JWwQQWFUY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=nVAEDMY7Rmxh7NxZRQot/VtleEGnqVavRB2F9O7KmGScTYFWC4Hu5wrcfhSLY8Ys9KyFlVODAdyU/oeVZyTIZT4gEjT3PCxmWR2IWoZN3iI+RYy1S4wOdD5UAJOBXteNY3uaX5TZRcpad4o8vIrWI2twJkNl90yX7iEBRvqKKvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W67+M+7y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jQbkJLMW; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FB3u9v3197593
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 17:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u1p71XwV9G4stoeAHVhM1++Uu6Qtd34Vo3RUYJGOTL4=; b=W67+M+7ygw9oZQmf
	NU9l4bIgR95RlgqgI2TUwEfO0ZnM+hRIxe1G9Bahp+lbKa/sJnuwRhiHZWcYm/bK
	GukzqldGA3NBPKtUlDWlEIiBWEv3BmpYXo8536BodWPqVXj7xJhMMJxLzQ6sU0j3
	Meo/MW1jo9yrg9PdJTac7CiHUFPTv6BMiDs6Caiz7pbq1/pfR++FFBvv8dUpCVW3
	IxIlVcJy+xNNaByBTHR8W5bnL8jV0qzkuPg35Zco+tf3Zf2k3sVR8kNlZBcsDq3c
	i6z1HrLS1iZDx1a9fPUuFFx1HzJ8HgvxeQmZzCE5TVtNBtd1jAKo/QCtpkgA+SaX
	MNVu5w==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1qc8kp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 17:38:04 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50f13da9684so1427371cf.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 10:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778866684; x=1779471484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u1p71XwV9G4stoeAHVhM1++Uu6Qtd34Vo3RUYJGOTL4=;
        b=jQbkJLMWGTXe2oSF7qrko3jL/5q3wDsE+1aIwxuegmDLMduLJJefh4MP0DdOP8Bf60
         HGjjJ6hCFUpnGCWD0yaUapXfBUfEQlvnbPkikd3EoE0F2/9i90dA6TgneFDGiyTEbxKl
         79D9/KGP2Ezhbo9Faj0osEoOqleI4D07Rt4wwcvcybC8qF7cIjCGbQvg1lkKJPnW39X6
         2zCY0Bf528v46tnaoNStwOUyTHB4k3hOKVMkn0v+Uz4cHoyGOvqYK3WOY9fWLrPVgMW0
         IePp/SoN+0dvzRRj+8nCzHglViHKppFBUcyETiZMkUCjmtU9RnlUIoZl8DA+fvh6RUum
         s6lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778866684; x=1779471484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u1p71XwV9G4stoeAHVhM1++Uu6Qtd34Vo3RUYJGOTL4=;
        b=ord1XJIn41pPP15r8f3kC2HT1dGv7jmDbluZxPoRe1SyVE2YRfRS7s+9OIprfGTzwF
         /RhddZTP4L8ScViiALYyUyuBRolxwazAOqLEHCMVviQHvhHM3YWY1P6OF1exTfb76YdH
         4wmlpvjvrno/1rnknBsxRHHAlZ8uaIIt1fnXssyz7duv67tUrBXONeYd+nB/kLhycR2B
         NRyjYz8oMy+up9ATrn78IXs9RuSRtVAh50xkImLO7Rx08dLfbv9WSBunhSEqz6uoUIXM
         +irmmSmlPlYjby2BDmJkMMakZrYXB82y9tLaJoqq3xdQ/v0to+k9xZkvQfR3NJaR2VzN
         Mb7g==
X-Forwarded-Encrypted: i=1; AFNElJ/6qOTlGk52geLHX6Z3uqZ8nbBmOCDecXD+0irZiH7h84jsahyowNFNEDRH0BzoEiL+ZVXVw7U+Odlbozl6@vger.kernel.org
X-Gm-Message-State: AOJu0YzERNo3jToUW5vPez9FXhH92kC4/uRf8SPdwNAsoRtDgLzXuI40
	ymR+uPfMTHsGEMn7rkI2xmpSq9BkDvh8uVMqxc1VxBVusDbzU1xL0c9c86OtilClPry1J5hEPyE
	b47jSPnMu2Ggy25sMpGqiqPS/dMSFIqY8UHteWWkjKbyDve38bwq1a1UCy+9xzYqnN2sT
X-Gm-Gg: Acq92OHpx6C2A13/HeY9rVoZ/TYo/Up+KqEzE+pf2FF0UuXP7x54HWVIagSrALX4nKj
	ApvM81hOpmF2cLfkKCQbWqjX+LAEmXGIKlKETgqSAHk/cvREry4OW3YDleBKlOCH0hcKb9w/Zoy
	XZVxlYSEZn0HyzjTiQrZ1YHsx4efr3KKoq+nP9Vt/KrJTclXyFBAcA9UKFymj0El6NRFgybIvQa
	CT4x690TvR/1ALGwB2/arNgfZjzE+/CZ1s+wplei7omjgIhMcqUuGG1/rP4MSzQCwDkFOys+M75
	lyib1XaNzv/rR6x2Ow8ELAloBMHnXgtBZxzSd4UT9Lvuonoqiuhjzp9n+syrfbbWaqboHqOLH0T
	pdwjoj2kGpdYip9BXNhFBTZ97ZvRmG9T+OZUpP93Wt/lbSBNB
X-Received: by 2002:a05:622a:59cc:b0:50d:7406:8f05 with SMTP id d75a77b69052e-5165a0010a3mr65671731cf.9.1778866683606;
        Fri, 15 May 2026 10:38:03 -0700 (PDT)
X-Received: by 2002:a05:622a:59cc:b0:50d:7406:8f05 with SMTP id d75a77b69052e-5165a0010a3mr65671171cf.9.1778866683113;
        Fri, 15 May 2026 10:38:03 -0700 (PDT)
Received: from [192.168.68.112] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-45d9e767d0bsm14967386f8f.3.2026.05.15.10.38.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 May 2026 10:38:02 -0700 (PDT)
Message-ID: <a5b81f6e-3d2a-46de-a8dd-bf3d6c33b768@oss.qualcomm.com>
Date: Fri, 15 May 2026 17:38:01 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ASoC q6asm race condition when stopping and preparing the stream
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Richard Acayan <mailingradian@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kees Cook
 <kees@kernel.org>, Joris Verhaegen <verhaegen@google.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <afS7rTHdc9TyIeLx@rdacayan>
 <DI7G2SF71B39.22LPDZWBG87O9@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <DI7G2SF71B39.22LPDZWBG87O9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: BcitpJt_rucE3Fo_1Mwn9qYGJPxkTsyb
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a0759fc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=LyhoXnAi2jyefnR3urYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE4MCBTYWx0ZWRfX2Da/XOy8P8YO
 DOs1+H0bY5QDAsbH2v0edh/KZ8HBNpwE6uZKTr9KRFry/TjbBOTYfNohXm9sx76u4FbJ1Ft9zPT
 0Tg2qNthbtaF5O/xS6JFa4iDeJmjOGzHAAy9xwKupjgseDp/ykHt1hkhXy01kxVJsxjm1hOHKUR
 Y/jlR0J18zv56E4BIUqr5Ats9CDd60WRZXo9tNg/5RSzGQ18C/DpTHkbnxU18LWRriutoYNNY2/
 EfMjy7SoKjq0/fZbWYdzl3asfrYeIVsz8DOmI+0xnh4vDv7Pxcu3nMPL8d2cF+2pMYoLGX6I0IJ
 qGthPN570F91biWGnmS/RJD2B/UNcvVfwFEFH9IZIubg5M8w9pYu/bNA4BWJGLLsT74qNliwRnj
 VByzuwGjMCVgTrWjiuCkRCmYhsFIumy6XItBaG82hzCuEGNRvlUDrsK4dL9yDj+EsrqqH4RLNFG
 LmVVqrkWI3PdfB0KqXg==
X-Proofpoint-ORIG-GUID: BcitpJt_rucE3Fo_1Mwn9qYGJPxkTsyb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_04,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150180
X-Rspamd-Queue-Id: 1BEB9555C12
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107962-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,gmail.com,kernel.org,perex.cz,suse.com,linuxfoundation.org,google.com,renesas.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action



On 5/1/26 3:27 PM, Alexey Klimov wrote:
> On Fri May 1, 2026 at 3:41 PM BST, Richard Acayan wrote:
>> Hi,
>>
>> There seems to be a race condition in q6asm when stopping the stream
>> (with uncompressed PCM). When receiving SNDRV_PCM_TRIGGER_STOP, the
>> driver sets the state to Q6ASM_STREAM_STOPPED and sends CMD_EOS to the
>> ADSP. If userspace decides to prepare the stream again in
>> q6asm_dai_prepare before receiving ASM_CLIENT_EVENT_CMD_EOS_DONE, the
>> memory-mapped region appears to still be in use and fails to map again.
>>
>> I believe this race was observed since commit 81c53b52de21 ("ASoC: qcom:
>> qdsp6: q6asm-dai: set 10 ms period and buffer alignment."), but would
>> need to verify. On sdm670, we are coping downstream by keeping the state
>> as Q6ASM_STREAM_RUNNING until receiving CMD_EOS_DONE.
> 
> Do you have a reproducer or specific steps to test/reproduce the issue?
> 

Manage to reproduce this on my UNO -Q device, will update you once I
have a fix.

--srini
> 
>> Can the ADSP emit DATA_WRITE_DONE or DATA_READ_DONE before CMD_EOS_DONE?
>> We might need an extra stopping state between CMD_EOS and CMD_EOS_DONE
>> so the driver doesn't request more data transfers.
> 
> Thanks,
> Alexey


