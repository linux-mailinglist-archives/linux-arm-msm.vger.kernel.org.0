Return-Path: <linux-arm-msm+bounces-115727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Oip3DEAeRWpB7QoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115727-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:03:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AA96EE7B4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 01 Jul 2026 16:03:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=ZNtmuHem;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=VaTbgB34;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115727-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115727-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id EF8C4301F49E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jul 2026 14:03:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA7A325A2BB;
	Wed,  1 Jul 2026 14:03:07 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7FCD239E60
	for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jul 2026 14:03:06 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782914587; cv=none; b=kgr6c8mLFHoLb3PNBFy7kCFADLodMFOTpPVrq3/UTVsBTwVld+CKqJXvQPvfSpYjf6gZ3xiC2iBdX48CTLG+obOL/5/WY8EBA1me/tooulfVRmSGJi4QZnjyb0NXxB6yqnJHSsh/lqxD8ZMB2rEhGgLK6Fuowpcx7HX2GjK7HqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782914587; c=relaxed/simple;
	bh=NF44Jcy3ZEM2REPEE9g+v7xbiWG874cAQ/xirLdkdwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aaa5W2QyS9DfUSNu8yNXB2uj7aaQsb2sjxp1CFHR3BuVHMGG/8tNHMQIOE1IqJz0+PlMM9gNAX61C1wM+8gALAOzr7eq7YNDjEyn1Vd4wLP4Ic7om2K8Z1pxEUuODSoxG3TZXpTGNw6HBU07waJ/nmD6Nioj0sguvtAff7Q1o/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZNtmuHem; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VaTbgB34; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 661A8ZKS761867
	for <linux-arm-msm@vger.kernel.org>; Wed, 1 Jul 2026 14:03:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pJFraxmRhYUBByvs8pJiT6kFtV1EB40Zmi27aKul/MU=; b=ZNtmuHemfu5Cs/kF
	KBpVLI2VD1oH2/ZFM4FlLzoVvrc5FK80HTp/P5+avueVq79+tlQ/OUPOEZMd1HBQ
	jzY73OS05wkXE6RgrTHSptEUh2knH9K5V0xLIgkS1sQPCOP4OmZM96RLdP6cWCgQ
	xM1wsz9fMuP9mfBBnIT11fernNxn/bZGQGQkJeshjriR+gA/t6V9s7U4pceiuKlD
	JUk73pdrr4M3EyoEkGZ9jS0VMYPst5hjjQiq4IN5HHKo+TxezXE68assXcDIMhgR
	3V0MDSqbYP78r1zJVVy/n5lk0FDJm3GaHqanFh+xrh0JawKCV/VpCzYYJNM823pp
	zDVRww==
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com [74.125.224.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4kgw4ea6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 14:03:05 +0000 (GMT)
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-6650af85614so1666687d50.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jul 2026 07:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782914585; x=1783519385; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pJFraxmRhYUBByvs8pJiT6kFtV1EB40Zmi27aKul/MU=;
        b=VaTbgB34kNG4g2qY1c6v2FUDnS7uhKRMyAd8eJVM6USnTY58xSzKCM4cDH36AjwLn2
         ExNql1Hp7CJEzjRw42ltapKo4nQoEoCHwrcEzpq77RgRaI4HbKIeQAVInlgdLYfdEpHe
         idI0wQuK9PfNya+ibNba79tgQqM1/yaERrM2e3UnYmtE+Z/pSiqqOUUhkOtYYCruuJYb
         L5aU3CK8VyTMAE+swAG77g7ZUTX6/Y7sqrLwV5P1pAZuX5nIyna27w3O/C1yrP6qIG9e
         +Z4xXK3ddwg9gMcLmeAFAIABXX+RGouQSTak7H8nuGlli5bRY3AC8IjKsAsBxvvJnm8B
         fTTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782914585; x=1783519385;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pJFraxmRhYUBByvs8pJiT6kFtV1EB40Zmi27aKul/MU=;
        b=BMcDncZoF3IrJRzSGBpG+xuFgAh8S+t9rbz/01p8i9St6nKjF5RIgEIGqI7meaqcnL
         YDasXSQhQhTV0NcY30od3alkhzPvuDSbPp+GbEcjVPWHEG7FoUz6FgBDy2phdA7vD10i
         a3aTaNTcAOxQ6iixXoatpc+359RwVahvXqhBPNFlEh3hyHXXFjmRce3ZtIv10ptRviej
         r89ddu9QIvrlmLkaW3/RooMCvo7ByQ4hrv5HnUuM5jWnlU0zGfCX2CRTrfxN7rNcLFMb
         ZofAzc/yquKrKkjNgXVCoMCOQyYEK9LboSlbHcDzJSwxL4u/8vMZtGSnVjfJU++Vjymv
         rOvw==
X-Forwarded-Encrypted: i=1; AHgh+RqX/CXbeDnJz8TRoJX1uFicrIQ0EbKblA0psVe+ecgaWgRfSDaprgDOMBW7sQRu5xqSgdoVwSLcLW0zUbzC@vger.kernel.org
X-Gm-Message-State: AOJu0YzrKrOey2Uh1IPiKX9OeN8KACQRR4UF7JQm8ScCG1dvLrn/+Tvf
	s2Esb2+kWGBfUySMwF7k3IVOgXfqN2QuGFvjfBRwk6VJZbSNA5HIhpYWu7Jg+MLH7kIOf/kYaOu
	wMZRfUkCVZOa+m0Bflk3HFiCwFb5WRGErNE6P9/fUA35mPpUX8xFJQsCFigjhFcPuH/GY
X-Gm-Gg: AfdE7cl4GP434yaDBoMpyedDKJD+gJnMyWdBzehQp+1gHYQtxQlZ3dW2snzo1YpEPps
	nvL+8Cb8uhlSWXuCvljbwJdHSqPSJmmrqULh1TSPBL50J/75JnKyi+zKEcMmXy2h4CCZCATwQUb
	ed4mAMXeyzKKhx6DFrLIfhdd8jQX1hbG5b4MgJsI/ph6giGI3NLD6blLFpCIiaEljvBz1kRUvgx
	LDYIFYscDFJjkbp0qyTEu5BQUp8dN9rILHZpHrRscpgO19nrHj+thVlmD2Y3HgAGGOuI4yjwT8J
	W66errBLfuBDtef4BxWFXAQCnPACf2k02ug2nDy5KW68FtGQQEolO/pA47/KH7C5kvjF3Qrx9Yx
	1lo/nd0PzFGKayTyUk70nkb536ToupNU7NFh55n2SgtpwTge1BZHRCV4VHREcLwwyAsD7mS3pTZ
	bjItz6Fwc=
X-Received: by 2002:a05:690e:441c:b0:664:ae6d:ad2c with SMTP id 956f58d0204a3-66521d0fba4mr1467512d50.70.1782914584570;
        Wed, 01 Jul 2026 07:03:04 -0700 (PDT)
X-Received: by 2002:a05:690e:441c:b0:664:ae6d:ad2c with SMTP id 956f58d0204a3-66521d0fba4mr1467320d50.70.1782914582494;
        Wed, 01 Jul 2026 07:03:02 -0700 (PDT)
Received: from ?IPV6:2401:4900:1cb5:7738:ad40:715c:2410:3e18? ([2401:4900:1cb5:7738:ad40:715c:2410:3e18])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66500677dd8sm2351665d50.7.2026.07.01.07.02.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Jul 2026 07:03:01 -0700 (PDT)
Message-ID: <48a525fe-9cf8-40d2-a712-f3e9db18533a@oss.qualcomm.com>
Date: Wed, 1 Jul 2026 19:32:55 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: spi: geni-qcom: any planned QSPI support?
To: Carter <carterd1016@gmail.com>, praveen.talari@oss.qualcomm.com,
        broonie@kernel.org, andi.shyti@kernel.org
Cc: linux-spi@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <CAJ+nLsRXTc=3LagGVdNiAPttL38tPVub_UOKuqJq91J9U0M+9w@mail.gmail.com>
Content-Language: en-US
From: Mukesh Savaliya <mukesh.savaliya@oss.qualcomm.com>
In-Reply-To: <CAJ+nLsRXTc=3LagGVdNiAPttL38tPVub_UOKuqJq91J9U0M+9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Co2PtH4D c=1 sm=1 tr=0 ts=6a451e19 cx=c_pps
 a=VEzVgl358Dq0xwHDEbsOzA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=cm27Pg_UAAAA:8 a=Bkeujvi26ppXrdUSQWQA:9 a=QEXdDO2ut3YA:10
 a=uujmmnXaIg8lM0-o0HFK:22
X-Proofpoint-ORIG-GUID: 9gxqjgettKsCUB1e0xpVCfAB-A0J_-OV
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAxMDE0NyBTYWx0ZWRfX2LAqE8qQcDBk
 RJLPDxQjDLoVQxxqmpR6tyBemBCBP/G/2mafAEI1j/E7YuZpiVD3axdW9d8B7ZOBgrebcRYFugB
 gaOoi2JEvv/YoHXnrvaj+tBnF30UwUc=
X-Proofpoint-GUID: 9gxqjgettKsCUB1e0xpVCfAB-A0J_-OV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAxMDE0NyBTYWx0ZWRfX4EotmnYCnGcr
 W0CzMSGmnkFDkIJygnKT8zVSolPBdRgdz4Rgild2CkbQw+SIsLvjd10NHG4EcMH60EpJTwKgQz9
 6krmLbzmJ4LitfcK5gi97m/75jVPc4rtFwO8L8TI112XWbYGpEYku1FbuTlKg/n2g1QflOr4n+D
 xlLmhlsaK44p/+4EQcH7AAfMyytRbKw7EePjI4hbaz8rK828+a/7CjDawpovhF5SGr1HXjgV6Vm
 qmOEa+33j2fA/N7lej3kDtRD176/WwexFoGzOiBeOIpAq7/RJ8egdHgnYfq5SuKKTdJR/tIgKl3
 3BG7S7ykKuWyAnPZFWO2xT6Z9/1HczxtF82nXplflRGWrr4zeqPdy431VLTjTDiqNHBpfhJAY+M
 9DXjDosA9xctBj+hMUN7b8soms+ik65GbtEuj9kxRhXj/sHmbZXcMItKerEtvWfARyPsXgHsK3/
 LGdnYGJN43hB2Nb6/zw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-01_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 bulkscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607010147
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	SUBJECT_ENDS_QUESTION(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim];
	TAGGED_FROM(0.00)[bounces-115727-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:carterd1016@gmail.com,m:praveen.talari@oss.qualcomm.com,m:broonie@kernel.org,m:andi.shyti@kernel.org,m:linux-spi@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mukesh.savaliya@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A0AA96EE7B4

Hi Carter,

On 6/5/2026 10:13 AM, Carter wrote:
> I hope I've found myself in the correct location; I haven't ever
> officially participated in kernel shenanigans. I've been working on
> enabling the trackpad on a Surface Laptop 7 (x1e80100, "romulus"). The
> touchpad is an HID-over-SPI device (with a driver patched from
> https://lore.kernel.org/all/20260402-send-upstream-v3-0-6091c458d357@chromium.org/)
> hanging off a GENI QUP serial engine (spi19 / qup2_se3), but it
> requires QSPI transfers - the SE reports protocol 9 which is unknown
> to the mainline spi-geni-qcom driver.
> 
> I did find a patch for this driver online out of the linux-surface
> community which may have even gotten it from another source. The patch
> seems to work, however it is very low quality and I suspect it may
> have been vibe-coded. I wanted to ask: is there any active or planned
> work to add a QSPI mode to qcom,geni-spi controllers? I was unable to
> personally find any related patches or conversations on lore, but I
> may not have been searching in the right places.
> 
> If nothing exists, I'm happy to make an attempt myself. I worry about
> getting in the way of more important matters as this would be my first
> time submitting any patch work and I am bound to make mistakes, but I
> will attempt it where that is welcome.
> 
Thanks Carter ! Yes, we are working on this driver to upstream. It's in 
our plan.
> Thanks for any guidance,
> Carter Davis
> 


