Return-Path: <linux-arm-msm+bounces-94134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WP0bEdULn2lVYwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94134-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:48:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 018A6198F1E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 15:48:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0089C3037F39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 14:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DADAC3D3D05;
	Wed, 25 Feb 2026 14:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dDvQRzLK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Rf1vJgqd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A08D3203A0
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 14:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772030905; cv=none; b=oLmzu91g2IIHRJ5+3jnbLh5ULU5deze5NsvgqYEZ9eGqc8TwiUxXyj1yz5TDeJzMyoxXDmoSVe0SbpepLqxjUy1P9Pr7SO+ystNKH8mmeUzhy/tUdmcxauLvxDLmptZTO+eaNhBq3qXY99ssFKem0IugABlswwxeqxBa/p6LP/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772030905; c=relaxed/simple;
	bh=xidOB+jX+4w0CUBEqt1PtSU26kes9riZzE4qVFrxmzQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=encQ3dPGYSNn3O4aVN1xRD61V2dCtpuYOzhBaBwjqFA/ESdYEXtizSlbS6YhF+/OaQPogr0OOh+HSbs/JlA37Ek4o+RC9G3CDUNc1cmH22smfDrgig4JfFesg3Nc9Zb7HWMFxlkimbYMums99S9skeJm4EvkFXDOLFI/W1oL8Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dDvQRzLK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Rf1vJgqd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SI0F1363608
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 14:48:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5zADAch3Mm7UabY4EXg2OfU3UoQHMHTE2nopv33diB8=; b=dDvQRzLKfxytsAk4
	rGwK/IKh4wwSCLTn3WsclgXdAEXAramwI9zp/UugBclvjd+EOxqAJr8v9nsIVFyo
	nhMZjkEDGhqwfGAAVY45bs19sjPt9JBcX4xluYPkgdJXfEktQbczH9X9nwHPuTwS
	zjuRKM3hApk/AfkEoEV0AUP9Gx5nAKy4Xu8HHNkIIrtGKBKQGCD18g/4JlR0b/Ty
	+vLN+YqNfOj1PkXnAgS0CvP5lHAdt3EfYSPK9ik3smCGkhofjEjH5ltGGvED4UFN
	OvrxufYjWb7di4S2J6wqzRvdVlKpT8YveKYzX4TaOhMaO4e1Ui8Ztu9o91X9SqQN
	wd8+QQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chp15aau9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 14:48:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-899c3641fedso570476d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 06:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772030903; x=1772635703; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5zADAch3Mm7UabY4EXg2OfU3UoQHMHTE2nopv33diB8=;
        b=Rf1vJgqdBLXpNCBOW4FrTh2TkjXynJ/uewdemoM1Gviq6RSy9k+70mJRrM1uoLNNZ+
         0Tu6WJZBmCZnTRFa9/sqcG4v2aTgb4XdUc4zVOe0ttwRTVEj2CvuIc5dJFCkWrUv8bsz
         wsB84U4ho+dojr3/6TBs0Gi5cfdHjeGLvMLnXIwos1HFjxtlzdL2pp42nMv6OYA7SIR4
         pNW6jDa3LTHw7kXS7owdnYLOzBjLrQyunI3Aab+XiCLr8HLIjU8Cp5Cv14wa2QhQGqLy
         x6wDASCWpNJSOVS3O8S8iu7gdIZdcd7yYnFAqpYE+Faaalwc1oxJ2FCjB6m+Pj0MBK/P
         6nRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772030903; x=1772635703;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5zADAch3Mm7UabY4EXg2OfU3UoQHMHTE2nopv33diB8=;
        b=BgUOZNJ6OnCmYEwKZ5RDWmpyBPNvRTroJm+QkmhdKWCqe81zx74/Or9Hw1a/ZwJ5y4
         zDEeeNmwVJfWKxTVS5tQmSUrYNlSP6XFakoduRrSci4jor9TFBwmf3LxI8r6q1hEJcG8
         3QIjK4sulWnzhX3tKONxq+NczRUc7qpoekJ8WlMPlLuGorCs1nAcvffWQ2OWRE9guOeG
         Ww/xCxQYqnvf+ELIgdWFRvFP5Fb6Bn7/VU+WqXpWrcDRe7k/VrS9G6KbVrTpRHe1DlDk
         oq9vapid0Jb0oNZ9yTe96ix2rPUQqK4i8NihxMrdAG5RobJ6JJ/YSNZTZadfLsfVlIdR
         yN4w==
X-Gm-Message-State: AOJu0YyVz2qwXd1k3kMeMR54CJNbyqUU+9yFlIG2Gvzy8wK9EqGUI5sH
	i37wlFfZDoG3521lHUbbkuSHsvnkSDmb1s9JOcE2bTg3o7XA63PQ0Y3A+Ni4KitqUAAunwQ9ECy
	cKiLVadHzJcECJpXVfpLy3chp0uO1cMi72Y89rBAolkUlLNPl+bB3P3FrwwiP+2yQvChb
X-Gm-Gg: ATEYQzyI2mEUkATcKGzz7M5V4P/7PeqTksGWauKBM8wdPK2mx6UVjINqodMmyrP4VPu
	ary3KXp40R9n4eBzjG1MtSZfMgEFSGFUw3uOEsPDxkdXZIK/kVqoxz9Py04GmMN60vq2tACUE52
	k1yeKFAvuTuuo3eiWvEKh6XhUSzA45vOlyFGf94tJSy43B04t0S41bmH8RqSD1SdU3v53HfEngp
	xo1dhQCO/s24M3nCMGm0Wv/u4z0i+UblBxnZ68TRTtGK6RUKluQbu6vxsTvIGjojFCPWAQNgE+2
	jyyR7MrCS6LF7mPxbn+1fGH5FClMrpfTlxc7rUhzKrtfObQZayUPP5oFepz4RjoucuuKsumpvvh
	FI5KGId9/eQaZT68wprok2LnzfQNVwyWzNFabuVN3bZ6RzecS7aRmsezIdVEi29l5DpF5vKL4eB
	bIbRw=
X-Received: by 2002:a05:6214:4f04:b0:896:fd66:a084 with SMTP id 6a1803df08f44-89979e1ebe5mr155965826d6.8.1772030902752;
        Wed, 25 Feb 2026 06:48:22 -0800 (PST)
X-Received: by 2002:a05:6214:4f04:b0:896:fd66:a084 with SMTP id 6a1803df08f44-89979e1ebe5mr155965386d6.8.1772030902230;
        Wed, 25 Feb 2026 06:48:22 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9084f191b9sm509759166b.67.2026.02.25.06.48.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 06:48:21 -0800 (PST)
Message-ID: <6e525b57-bab8-4549-8d33-bcdb1a474fea@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 15:48:19 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: msm8939-asus-z00t: add ambient light
 and proximity sensor
To: Erikas Bitovtas <xerikasxx@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20260225-z00t-capella-sensor-v1-1-99f767bc326a@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225-z00t-capella-sensor-v1-1-99f767bc326a@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDE0MSBTYWx0ZWRfX2ko4eyJSmqwE
 0TDRYpCqbJUmRaBX0QGKrKtvjnWdThTmlKELvifcZ2wW+oTTkS2uQC7KmzsmGjaQqANexQN2R7a
 ee1fCkGKsavGAIIdaFEQUOmj3yr4qnE3RlqT9b478XjpV/AZPlXYbbCFoYWmLBjTIQYgVep2Y94
 ImsK2gC/vvGYucm0flpKq0ACcb/jeXmNvqDXVRbsJY/ClzkUg0LBSMaJfRMOVODkIr5s22eo8Hp
 6uBz4keh+mx5DxguWDoLZOSk2xY68w4BF34KN0spgih/pa7bmcZB6mTm5cWmlFVFuiBFptbyL0w
 m4UvtmgUzUCrH0mmHlR6JmIGHcgNoy+NzAEOc/dSgg6rqhCAAF/gXY6+Tc5aZ96H4PnjP5wXlKS
 OhlBBF9+8b+NGK73QS2ch+wjV4MhAeoD5c34hsote7jLOHe8KQlklL8q4rAznMmiBqZOPXj+Fv7
 Si67jbsCERlNAxTT1bw==
X-Proofpoint-GUID: Bn3iBiR2OItNMh_6TXAP5npHYAafDcU4
X-Proofpoint-ORIG-GUID: Bn3iBiR2OItNMh_6TXAP5npHYAafDcU4
X-Authority-Analysis: v=2.4 cv=etXSD4pX c=1 sm=1 tr=0 ts=699f0bb7 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=DldKRDGfgS33INwkZP4A:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_01,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250141
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-94134-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 018A6198F1E
X-Rspamd-Action: no action

On 2/25/26 3:43 PM, Erikas Bitovtas wrote:
> This device uses Capella CM36686 as its ambient light and proximity
> sensor. It is fully compatible with Vishay VCNL4040. Downstream device
> tree reports Capella CM36283, but upon probe, a device ID for CM36686 is
> actually found. This commit adds support for Capella CM36686 ambient
> light and proximity sensor.
> 
> Signed-off-by: Erikas Bitovtas <xerikasxx@gmail.com>
> ---
> arm64: dts: qcom: msm8939-asus-z00t: add ambient light and proximity
> sensor
> 
> This device uses Capella CM36686 as its ambient light and proximity
> sensor. Downstream device tree uses the compatible of CM36283, but upon
> probe, we can see that a device ID of CM36686 is actually read. Possibly
> a driver for CM36283 was adapted to be used on CM36686.
> This patch enables Capella CM36686 ambient light and proximity sensor on
> Asus ZenFone 2 Laser/Selfie.

Downstream using vaguely-related compatibles is ""standard practice"",
many vendor drivers don't really care about semantic correctness,
as you were able to find out via the chip ID register

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

