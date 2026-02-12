Return-Path: <linux-arm-msm+bounces-92718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EAKcKZnxjWlw8wAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 16:28:25 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F6112EEBB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 16:28:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F04E73004F6B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 15:26:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 777261EEA5F;
	Thu, 12 Feb 2026 15:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IyLv43u1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BJGsWfmJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A8623EBF30
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 15:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770910008; cv=none; b=jlUBbcYyjbnzWzpQpbYF0qu+1xJGTCTMV9c3Ylp9ea12z+MfJnU9vPAW0cPCZaU13xtY9JTCCsjwCNW4hZoux29YHzb4DZEP+X7Gum+U0qzZqlXLmYK+shFZjFgX+Ts5nyhV8NSry2F6qOwy+cNowND2km6vvwzdqlnBJ+Jhy0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770910008; c=relaxed/simple;
	bh=MAYFwDwv5etUMgHZEXtBP2caSzisQcMR7MufdoM3D2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XkQqsT4QR/dW+0GDYvQNsLmA8UjSd9F1Ay0d7Bq4LT6I/yC+CogXaIzZrMSaJCnZECZ+6VzNWAxgnKMrul3fSKDyMO0IfQ5wmX2nQzsUwP52foYXDtQRBboA8Xhm1/Oa0EafoomltNon0VvXl5DPSkqiQhLVCYCtv0Y2sMrMsC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IyLv43u1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BJGsWfmJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61CDRgSh1580798
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 15:26:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kMkDiJOoPp3W4iqxF1E/zsU0kxM0RCHVC9Du88flgB4=; b=IyLv43u14WJTq5pP
	qClFieurKiS+IISNrkAbO+bW+mcKyM3hXstuhHxdo9xQ05gyhTjmjvYvX6M/mG3y
	00BVoS4+htWRgv9S5goJrMPf5nACQUw9eEV/JKmPfJ418qsjkl2xsxvMyGhyhc5l
	hQwn2fShBUl3WbvGrUAflPsQLTZJEh2Ct2lON72NRCvPuyzLDWMfUinsLT9LqR3p
	yP5ajONrRbXmIG5jT2x1n24b3GknhG9QEzrJRSXxFKDmDbk0nZVimLj0deMOpc3b
	MQm11LV8M2dnWjB/VrI3NEJqkDefsEMBoHnj3dOJHjawoahjW89n9qe5WhsOWFWq
	wvS+1A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y9bugv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 15:26:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6de73fab8so276840685a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 07:26:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770910005; x=1771514805; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kMkDiJOoPp3W4iqxF1E/zsU0kxM0RCHVC9Du88flgB4=;
        b=BJGsWfmJfdgnDcdTnpTtjtxnTgC8mv1t3h1n9d1FPqzhDgYGZBMyqoOKAserIZNsf+
         NTBrsodY5uRqHxmvfHIrHU6GKuerIFsNU3nxMG2Vu8y1KZOf/e56/mIYPuicPzavgen5
         MyEPIgai61R15Osm1bq7gK3Xih9oI7L+xg9wcFeXgJoOztFM6t2mPNxLBP9gAXRn2XUi
         P0zjjvj7vB+Vf5+9mqxRKEqPKFJyq/MmRm7gVSayXnfKzDrhV79DAYJcm/y6HzFthmZu
         7n91f99DDcfP4UMUZjHRdEY/8Q5iR0jF44EKpu+a9UhTFrPmg27AtRvUmI7N5lhjNRb8
         eGQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770910005; x=1771514805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kMkDiJOoPp3W4iqxF1E/zsU0kxM0RCHVC9Du88flgB4=;
        b=CM7A0uMAnl1zGw11rWY1eAhTlFHrh1z1DW42paCIew8QHKbfWEA+aUuim50OYR6rfC
         u2LMyUDRI9kFiT8KtnZuxdAJxvZpBBk8JuK8ZAeZqE5fDrfi+7bq8c6JwrK52cSjYO8y
         Kd7qbO1WvBvTXs1dxZtflA6iDeBKscCMgJD7Zeup9OvYZmIl8NztBFgVdsBXF9i9VoKi
         A5+BGhq+d2tlv/gXfzV67dv6pu4weGoL2pOxM1JSkm+MJkZ+GFfMLJzC4ChLou7JQ4QN
         OXEvIAaOz+B4lr2F1RYdfvVCmwpxe/6NRZ7h8zsUUv/YJNAlkR4BXjOZPC9xy1cu5zFg
         uKRw==
X-Gm-Message-State: AOJu0YzzQ4FKfrR1LeEk9+4/AamvTTScQPVqJTDG/8ZbB08+bjKtp01q
	w2FK45I9Qs1zfPptpPkexsuaFcmEcwXoHssqKw4G3Cu0I7DFg/U2LJhy8MqdD5ARewS6nYrEZAA
	t8oGFCFz0XqxH2uBOOJy4mOjyt2jfVPzRFZl405W9sLh2ZP7WhKD2No2d8F/euB7aitVP
X-Gm-Gg: AZuq6aIsWMLbPvY2gWNWJ7nAskHh4Cz/cDuhgBDZUj/euRFwF87nOavkEZhiVtXUxEU
	cKErPN1JsyyOBHIHnxjPSgrB9lYqGmqLiprBvZ9z+nuDTOVVlEGp1AShAlQ1Vgc+H/Tko/Ipuad
	fcsfFlx2MeWZGTm96twSwLG+1sMLUEmebb0tH/RsB2khQhW4PfxIqXNCw6zrK1ngLJq4ObwtSnb
	2061zijM0wvpIWAwpBnezdCgeaYxbx3uE8IEVOXDZ6NMPotVpmJ4lVMxAsBUbABNJdRulZGB9BI
	kyep9QD/rc8HJ/Ch7FQXBqhR0YmXk9O8FA5tbT53UNhxX1UNUkpN0zMs7wshWUNtLbQZWyOrLOb
	oqUhXCVa4ffAwf+iRJQrvD8CAhOVFnAcRhAmNHG7qDDxZVwDbwlFCI6dqsqTOdyab2B5kzwFwgw
	ZaS6g=
X-Received: by 2002:a05:620a:4486:b0:8be:6733:92b1 with SMTP id af79cd13be357-8cb32f1ec47mr302967985a.0.1770910005553;
        Thu, 12 Feb 2026 07:26:45 -0800 (PST)
X-Received: by 2002:a05:620a:4486:b0:8be:6733:92b1 with SMTP id af79cd13be357-8cb32f1ec47mr302964985a.0.1770910005141;
        Thu, 12 Feb 2026 07:26:45 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cf38c6asm1837726a12.20.2026.02.12.07.26.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 07:26:44 -0800 (PST)
Message-ID: <7126a0c6-891e-47fe-a584-80a0e0bc7538@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 16:26:41 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2] arm64: dts: qcom: arduino-imola: fix faulty spidev
 node
To: Riccardo Mereu <r.mereu.kernel@arduino.cc>, lee@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, sboyd@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, alexey.klimov@linaro.org,
        srinivas.kandagatla@oss.qualcomm.com, m.facchin@arduino.cc,
        akucheri@qti.qualcomm.com, ndechesn@quicinc.com,
        Riccardo Mereu <r.mereu@arduino.cc>
References: <20260212152329.134065-1-r.mereu.kernel@arduino.cc>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260212152329.134065-1-r.mereu.kernel@arduino.cc>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BbPVE7t2 c=1 sm=1 tr=0 ts=698df136 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=3_et9svu4ZaDDkyybMUA:9 a=NqO74GWdXPXpGKcKHaDJD/ajO6k=:19
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: kn5ljnZII6T4j-jaxdVbdsGw8VNl4t0y
X-Proofpoint-ORIG-GUID: kn5ljnZII6T4j-jaxdVbdsGw8VNl4t0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDExOCBTYWx0ZWRfX+KdFyFZBuMFH
 mwzkL3jz7eB84ATNo57GZst7Z1azH7UqLF4JztNfkPnWmvtoheDh3UZzBVh+IgG0Nhch3bJhM35
 FpyoHO9G011/TLb53ecvCpjYgCerrxUS95wiiAvRh1IZtjI2d77NhydIkacC0BDI+VJ5etZ40ll
 HH0heqE4KEPhU5DufEjDVUPbbL5WaAFFkfS/fjTLOwzI0eXLlGHC1AQBM8D2Pyjjp5UApUfFhU1
 CterbXgEVBY18H44a8AvcrblWfop/QYGvkrfVyKVxxf+4r/Pam7s3cpVWcRSeY/jBSsrS8kEguo
 3OtEv5T4wMLRKUbujfyEWhPoln1pEa7hsDAwZ+VhmeaT+IwbPMAh6PQ/R7eLT15YUA3MC6o3Zt2
 ztfByrTx1KuBRxIEVwGuMnQbbYBTw7tI5+kr51zNuI+eABtVYZbR2E6UW5rwGIGq083EKoSvOy4
 9K0SNfzD0QA1O2nwbaA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_04,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120118
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92718-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 03F6112EEBB
X-Rspamd-Action: no action

On 2/12/26 4:23 PM, Riccardo Mereu wrote:
> From: Riccardo Mereu <r.mereu@arduino.cc>
> 
> CS pin added on pinctrl0 property is causing spidev to return -ENODEV
> since that GPIO is already part of spi5 pinmuxing.
> 
> Fixes: 3f745bc0f11f ("arm64: dts: qcom: qrb2210: add dts for Arduino unoq")
> Signed-off-by: Riccardo Mereu <r.mereu@arduino.cc>
> ---

note: usually one would include a short changelog under the --- line,
but here I still remember it was "also remove pinctrl-names override"

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

