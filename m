Return-Path: <linux-arm-msm+bounces-112088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id zA4pLBrfJ2r+3gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112088-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:38:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 226B565E698
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 11:38:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=iUOmx3Mf;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=gfePEUc2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112088-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112088-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C516B322B0D5
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:25:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A253F5BE5;
	Tue,  9 Jun 2026 09:23:29 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5B23F5BEE
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:23:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780997009; cv=none; b=c3jW31Y4Ztp5+3XqlrrzLdx/hUIwAYNqXoHLHPvxr7+zcwzHQfqfBYkDWswTqcyey+5EPfF4loVV+U3FE+AFbwRdzA3PDnta9+awmjpF3otyvXlQXK4hff4QX3BA3oEk2sqhzl1W6MF3u6MemhDPGzokRdcSV93c0I0Q5WifD50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780997009; c=relaxed/simple;
	bh=lseGHBh0I7O9gxHRu5mCUIVz3TgX9PhEUb+FikegtHc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OpohXOD+IG1/Xx83uKysFbIamDIf3Bqf5nqKdApkejaQ15/qU9UonwDhaZhXU7pmBQPf+qriqfLuNoba/vHEV03Fdx/YNLPODGZjsC+67oMkMPHHw6qDSejDGb+Bkg+UQ+2JjqiM2fGlJqbxmakUi9ceSAARGTKjVp/jQLBMv2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iUOmx3Mf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gfePEUc2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rMQM1584114
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UH8OziGrmCPRRzdpQprXp7LS0fI22I+yAftUFQCLcjA=; b=iUOmx3MfLy4v9y2B
	PvG5FnMs6HfoAyu/J514AcOOSV7m9aM/9ooo5aLru6ZNYbufPyR0bKSCbcdPgsw1
	DJ7Ek0SSy+E3WnWL0ucaQjf517FftxqY/TWcTGbbS1AduFZ62fHL01b1H17ZSKGi
	pS5BZwIf6C0esQ5zPZOd9HKCSgDnKvtiaoRsnEIepYI3nYWnD2Zi3vwd7aS4lETb
	V2XP65HDuTshRvoACeTM8vO/qMhEZDWQ8Pn8looGzx7WEJ+NyZZF+U2/lToFW5xP
	LCAhUshkHXpF6tlSEDVym0PvyOPDzruFEjJAN47c7n4vciXYt9wOqowzG+5QcSF0
	AUx6uQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epdeerrt2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:23:27 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51780e3ca44so10543891cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780997006; x=1781601806; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UH8OziGrmCPRRzdpQprXp7LS0fI22I+yAftUFQCLcjA=;
        b=gfePEUc2vquc4xVHSpoh0gHOMsYq3Gn6oKmnZqtXVSPkV3pKh0w+y8plOfz0NAuyS4
         g9oKclp35VIwDFduQJh3eYO1R1vybCjR8oxKXsU64vv12VMWeCArTGsAjCPz0Glh571D
         vLlAIM5Nii1CYG2RTfQdNOd0GzRCVhgikBP/jh/K1p5Fh6oWs0mJeriRWAa9Kzep/doJ
         sXZQ2ip/T9vmNkzU5zD+AWzFpJOroTL3AJD1Nod98SqtfFLjwrHpjW53PfSuwUxyZQ5R
         UzvL9TzqVhTj4kbelirz6oStyp+yWbqN4UIfI2jIv4KlYquuH1lM/rbKUuzfENC2WOCw
         VruQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780997006; x=1781601806;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UH8OziGrmCPRRzdpQprXp7LS0fI22I+yAftUFQCLcjA=;
        b=X+MvG/A4WcEwhwLyrzTh7QG8Z7w5wRdGyssERPtVNIn8DzRET9nMR+aDS372YXYDSW
         7akwx9ueRwvoXiOdT8IqQcvRQlxZXvJVCejuFJtIMcetrAjAiI9GCEV/KfNiZQ9KZjYe
         /ymm8uVheEqfqG7NcMjKfuF/nMflKjszXMJkn87eTz0tv/968UHpJmN0YbmRZ5C8/9+R
         1FvGRgVusNRoe+8LcNHgkPJduzn6Eer59C+iXV6LpfEJmoxZBwf5ymIH9Nj4jDu4FGmb
         bsosiaNz4TxDVfT3V5JQnnibwn7AzL+em78Y6Xroxi0QmCcyhHCocfU4Lg4Ys10UurT4
         kPDQ==
X-Gm-Message-State: AOJu0YzkzI17Wnc/3qvjo2nAaAF7mHmMEwWQKzheliYF1kWk8aol5sOm
	ICoQjBOhvLNnKx9BVn/6mIUsMcrhDEhCTAIzD16td3+5z3djiTTICVkcdgsq8GHSl2BDt3SgqsZ
	thGRfD1zLNJy2d1liqBV1nXRNugsaEXbEv72J7AFOzKB6ASq/9pQp76Q9Vmr1GJh9cjp3
X-Gm-Gg: Acq92OHA9yJInLsboI/DL8UoVWTqifVTaDs4LOb4LHE/Z9MdOokwEj8kDXOLBRh+9Iz
	qUEbxtx3OhnkL8EeEyRm4Y+tC+ZAZDX2A+W2c3QczFg4FTcsUkFqegYVB49dbJreV5PhzWc1zuF
	Nlv0PNguzWHzqrbrRY+ymboI/cff5kXhvaeSRh2vke5z1As3dscMS+dLlR8DVSKO4lDTPxTIzJY
	RnLtYdB4BkzSC+IYyl8XEK6xskjIr2RN25xI2JWG7X+R1b6vTv/vBpku0S68Nf6tfxzmslXVuOx
	lb04XCf/b7auv5EeB66t0k6YOzBOsJSchoVzyWu8HXt49wFdHzyyxPeRdSHwnycoLONhrUp/5jN
	8qFSWP+ykoyYGdqTDhDrMvMxqIe87tKlmVeZcJ2B58cqsb/MkNgvafKNw
X-Received: by 2002:a05:622a:904:b0:50e:6311:7380 with SMTP id d75a77b69052e-51795c0d8bemr146701761cf.6.1780997006014;
        Tue, 09 Jun 2026 02:23:26 -0700 (PDT)
X-Received: by 2002:a05:622a:904:b0:50e:6311:7380 with SMTP id d75a77b69052e-51795c0d8bemr146701521cf.6.1780997005512;
        Tue, 09 Jun 2026 02:23:25 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0517714c5sm1017739966b.2.2026.06.09.02.23.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:23:24 -0700 (PDT)
Message-ID: <887d4258-3202-448b-afba-7ea864bb48ad@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:23:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/10] arm64: dts: qcom: sc8280xp-arcata: Enable
 backlight
To: jerome.debretagne@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260604-surface-sp9-5g-for-next-v3-0-6aa6f6612c10@gmail.com>
 <20260604-surface-sp9-5g-for-next-v3-1-6aa6f6612c10@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260604-surface-sp9-5g-for-next-v3-1-6aa6f6612c10@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=H+DrBeYi c=1 sm=1 tr=0 ts=6a27db8f cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=0_OxBV2uU7IM-TJZnuwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA4NyBTYWx0ZWRfX/dPnjbtoFyRN
 XjOxWoZ/82kefQKBcCbCUW6mCkJVEGc7ffjZ9YdE0uda2DqfTkSuNZUuPQzSbDiVz0FpqxUiRtM
 xlciadl+5oEPayrxTfp+j+CovQ9O/dpVRfhw0CUt+ZmTODUwbgTptWWre+xNVF2BfT6kd1pw09A
 U7Fa+4Fgk+JVVUcOVc7KS0WkK72YoWIosRVfqIYl1JP4e3fUg/B2APi6E1ly2y66cLDe81nK3VA
 Yi3YOMdNCQ7pZBfaJyv/cY5BH1Bv7r0Po8ZAb5AAkDv3hKSVh8Ul7ZuGBQQBj7qadtdEut0Y/82
 5ljiLy9dv6X58htGKYEw0tdLQQO2Uw9mOpRfbekkiz7QoF/eCe9jHXaqbvnZpdQvs0WpNo3aN6L
 207ZNYW2fvhO4NCGqq8TuipUGcUun22mcwtGioNNMU+JNLEIfqwAcFqSpTQi7L9xdePDschtY3v
 48jcLJ9LD2E/SPcqakg==
X-Proofpoint-ORIG-GUID: YXtFskthokVGHrKIbV3C0fiPmJIOKZBw
X-Proofpoint-GUID: YXtFskthokVGHrKIbV3C0fiPmJIOKZBw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606090087
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.58 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.58)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112088-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jerome.debretagne@gmail.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:johan@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:jeromedebretagne@gmail.com,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 226B565E698

On 6/4/26 6:18 PM, Jérôme de Bretagne via B4 Relay wrote:
> From: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> 
> Add backlight nodes and enable backlight so that it can be controlled
> with the corresponding buttons found on Surface Pro Type Cover keyboards.
> 
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

