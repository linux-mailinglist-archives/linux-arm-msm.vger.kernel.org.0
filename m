Return-Path: <linux-arm-msm+bounces-103079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YNAbGD7/3WkRmAkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:47:58 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57D653F7820
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 10:47:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3DB473009381
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2026 08:47:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D73DB3B3C00;
	Tue, 14 Apr 2026 08:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cTtu98d/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SmJqZkzX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B50539B952
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776156471; cv=none; b=Hhx8gaIbLIl6YH3/E16HONkA2HgizZd5pkGcd7EcKtxzRAxoPo83kK2iLjIW3TzVsceFBhT6fJ7Rm1RMpQfKu0inzOVg2xH+6RrTTPiXWbsrkMPre14LCGLCnkIf1lGPuABcei1KReOXQXjpeh9walRLtl5kx8yYvH1fqrehFxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776156471; c=relaxed/simple;
	bh=zDuF56UTnKqUspicas9JERjPRQ1J93IdhBgV2MtRI2I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YK8lW8JX+UiF0FDNg1E21zOJcyf+5Gm5xDfdfa9MmtoxQsd3w/pxl39dvt/WZHtF3F9G9jnM51F7LimO9uXb2bcdZLThxnfNy/hgAjtCyysJRT8JsaF7TCSt4Winn+xysfKb9o6mZ+LbGl7fqcdzxMta7+Tc71HS9Lo4kD/1LAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cTtu98d/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SmJqZkzX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63E6LHP83682698
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FCoWpZcp6o/MguN+kiEYFFoy3eNjZ/0+2PNOiTa7XBE=; b=cTtu98d/1VuPhWHj
	NC9vr1vhxgbxc5Knw8RjUcY2NOpls1XUHaOLHNWSRwo3nLswKSQzT1il1I/k6bxj
	ehCyYZ52G/jpuNwL17d1QjctfhDg2440BR/yYB/2+i2nPVelMvppYw4f4FhZRj4L
	P2dcChcMoPcPKeMLN5vfj968iDLrWsfN6y0QVAFhg7QJtgSmQzpFkrBAuRSz9F54
	V7yd3IGp9EvocAqygQfKmiR9UixG8pB4hRDXv2eF7heTVxZdEIsmhJUACMaLq5XI
	qDT0xm1MwH17Kpdgaw1yhfxanFxCuKKhb3yEDR4FWikdza+zRnlzdhf3vkAhgwuA
	3Dru/A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh87d1ugy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 08:47:49 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8a18178713cso12200246d6.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Apr 2026 01:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776156469; x=1776761269; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FCoWpZcp6o/MguN+kiEYFFoy3eNjZ/0+2PNOiTa7XBE=;
        b=SmJqZkzXd8tl3BxBn9Ewqplnbv8uiPh3afSS3yRowVsC6fcDHJtBiJ2hHWECtSkIK5
         1PLcdVDxy+WtQRb8/6R77RAIeuuC0OVmxTaltAdRzBVjZpvuyk98ldX8dkIl0ZKNX4Uu
         vZf+59Uqrj2P7v0hcznqkxymH25xArZOqRWh3BcBQvXR3mIehiZPSH68Bne5/lun9LyZ
         X/OKV64Hr80CL8h5qCEf2aJ/qC4S2mSpFrc/O7vm/ygAsVzpZm61tGAvTfugqHwRyHly
         OdxMsXXpwU/9YpTCf0tq5J4UHKjnbt1AaSFJijNclOU9UrOCsW/koOa6tF2KGFQIgzkv
         x9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776156469; x=1776761269;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FCoWpZcp6o/MguN+kiEYFFoy3eNjZ/0+2PNOiTa7XBE=;
        b=GPxZAaG9RUAESSvspW1EKtU1adpkriXsOhAxTulRTuRbj9iVv1a74VCtmK7g1/aTF5
         P/viGhLL3mDOI/CVCZhqqqziZrItMOuTwY7sxGG6yU7TyTJ4+0Mo3kQTHWVNmi1sCBlF
         4D8Wgsrn/dVEBNOPpjFP9J26l1HONz84q0h7MbzjLfU0rkXzicFIzKUbRmO4/yfCXwJ+
         /YjXAmp9fAigaxppPCjaiSnvSE/eqGIG16iKIOh4aI3ZRSLPh3bJtCo6U28INdQpWMTJ
         metB3tm7HDgSMAh+QbBaiKclZXuQ+CKhzfoc/rD5F6fv9FYtGb/9iLehKSOH5SjxKVkM
         lJgw==
X-Forwarded-Encrypted: i=1; AFNElJ87w/92mWbLAuegDPAf+BqZ2mdBVfFN34kPfU7r321jag4ueZhyGKeOan91nNWWVwP5pirwwix1+aDS6t/I@vger.kernel.org
X-Gm-Message-State: AOJu0YxgpSkwMNOJQACpTzH12LeU9n+kiwisnQ9/IrpXCO1N/Dbqy5Jx
	/IAKDSRD4xdBf5wFgMVDTz5YDPlhqynmfLYKg7KSzSvqpQPrdd53qOpz7yQomuujwIqP2vQGoB+
	YO8x/PwpTuCiQ+DnzHODLMZBWNt1TELvO09H/dljsYt3/48xLcaW0ZWezNaeRLgdLxZm2
X-Gm-Gg: AeBDieug0pufEkY3ySoOEKrftRHz2W5GGjYby1S9zS0cGDkwFRNa66JJrP7UMefolFQ
	Vkq8a1gOHYjE6FBItbwMKSvRP9TU23vWCnoJ3vVdTbmtopLRongrawyxXmbjrHmEp5lhh5mMLJ8
	sHjqo9qpXmpq3DDnYtF2WrazvSgoHBjhOle2jBcNzmEK57lbe7ANks1Qk0/GZBXW8kq9B78dAby
	xAYDIe/TH4VYxvX8dYL9PDKZH+LCVXU9GakfWXi9IbGv2ObICTT/H6uphQDl0PnFSwtxfFWu6gS
	kl52DMAK2iThYalBTay1SAJ4v56ftX64sN22w5BGPoUlTUWXlXjSrt5ASwA3oKBHqeo372hqpUA
	r/Syx5V0s99+zHvatJX5NMhSMoLoar8OITC6IOq4SOB/1X4A40jSigUZSbNf9zyODDg4ywhQshh
	gdfGrjSV6ZbRU73w==
X-Received: by 2002:a05:6214:5013:b0:8ac:4fd1:2d5d with SMTP id 6a1803df08f44-8ac86297b62mr187977696d6.5.1776156468979;
        Tue, 14 Apr 2026 01:47:48 -0700 (PDT)
X-Received: by 2002:a05:6214:5013:b0:8ac:4fd1:2d5d with SMTP id 6a1803df08f44-8ac86297b62mr187977466d6.5.1776156468530;
        Tue, 14 Apr 2026 01:47:48 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f1e87sm378834066b.61.2026.04.14.01.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2026 01:47:47 -0700 (PDT)
Message-ID: <07c73c75-5ce8-46f2-bcfb-bb6d7fe0afca@oss.qualcomm.com>
Date: Tue, 14 Apr 2026 10:47:46 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] ASoC: codecs: lpass-wsa-macro: Guard optional NPL
 clock rate programming
To: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com
References: <20260413121824.375473-1-ajay.nandam@oss.qualcomm.com>
 <20260413121824.375473-4-ajay.nandam@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260413121824.375473-4-ajay.nandam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE0MDA4MSBTYWx0ZWRfX3kec1wgodnqp
 jTqqOWao+w6ixfttgSShbt5rl6ABepcrOl5xHv5dh/snxqK2LEQ1+UUVL08jw0LLVgtQInXqgAR
 YmdCjmIqnzApVFm+UzLI4iqbReaJCtfCGDS1OjTjfP4vvyxz6PX0ZZwkxtgoE6woVIr40wiqlvG
 3YbcxvMEXx2GSDrubX7qUkRj5QfjlyajCay0t4a1ow8rhXM37g0Qj2Skx1ZDoeqjRU2u0is9j6F
 5ZyA20w50RLNY0Qisg5DV+lh/Tyi0r9fxh+zKPFHW/gT2WEr/mvp+gzJetOroZvG4KxTJLgoTCM
 EjYzMKxX8ZN1I1+lJxuUTLXhbu33l3oI2FRgAhMSp7ocgMnAXjg91Fho+TE+i5pwES2qnQv9cVW
 41QW3ViI568hK395upvGzxzTTRJvJJr12KRFazQqfIRgDNZHQYErgGk4gY45ySfC0qq6boYTtPm
 dVEbUucElhJGVVWNDOw==
X-Authority-Analysis: v=2.4 cv=N+8Z0W9B c=1 sm=1 tr=0 ts=69ddff35 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=JHmcoMBqjwvyAgHjIWMA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: YGyKoJgajlzU_v45PTAvUNGU8A1PiEly
X-Proofpoint-ORIG-GUID: YGyKoJgajlzU_v45PTAvUNGU8A1PiEly
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_02,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604140081
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-103079-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,perex.cz,suse.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 57D653F7820
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/13/26 2:18 PM, Ajay Kumar Nandam wrote:
> The NPL clock is only present on some platforms.  When it is absent,
> wsa->npl remains NULL, but the driver unconditionally programs its rate.
> 
> Guard clk_set_rate() for the NPL clock so platforms without NPL do not
> attempt to access it.
> 
> No functional change on platforms that provide the NPL clock.
> 
> Signed-off-by: Ajay Kumar Nandam <ajay.nandam@oss.qualcomm.com>
> ---

If you dig into the definition of the function..

--- drivers/clk/clk.c ---

int clk_set_rate(struct clk *clk, unsigned long rate)
{
        int ret;

        if (!clk)
                return 0;

So let's drop this patch

Konrad

