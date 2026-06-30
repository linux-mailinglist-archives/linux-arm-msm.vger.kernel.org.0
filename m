Return-Path: <linux-arm-msm+bounces-115392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ZoDcIYGrQ2q8egoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115392-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:41:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDEB6E3BB8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 13:41:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kDIwdl+F;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=D+N53w5e;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115392-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115392-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id AC5B13034235
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B9E4071FC;
	Tue, 30 Jun 2026 11:40:49 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF8A3F39E3
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:40:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782819649; cv=none; b=LxZwa07ArCzIHATe7AR07Is7a6NiyaVxL0F4LR3DdPBG1whg8n0TSdQDlpLHVkanWDczwFG0lSyjrPLfU6d/pJ/163igJchr9DCvjBbAMsOTer2I68fFiQ1DrbXb6dcPvJg+IRByo1ndqhk67Bm/EOzSHTE5n0yrrbarITAHWiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782819649; c=relaxed/simple;
	bh=YiO2VZ1Z4/VqZFRv1Y071DZKVJf3APynuKIljItqCRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eh4kC1DpsCUEGJDSwg3CESsyd8UeIxBxxpxIbhu5737RD1J3Rw53yu5cRhjVxS7IEo/IJp4rc2Ww184Wsit00vCaMXHQ7jElbMPaODHIpN60pnQWyS8goWEMyPa4PfMxVPjMuRgrfEjAAu1f0yxUX2W9osj/7XbDhtU6GLv8RFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kDIwdl+F; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=D+N53w5e; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9nDQL1590648
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Iu/2dveu+R9hFdVPTPFLQKVnjQWaGi/W5/Il6dZxvC8=; b=kDIwdl+FsDNtJWC8
	mA8UYMxOlaR6mQTOQrCTPzzl98NOGJD75VI5r0SGlAtY2XjpWNqVI/pLpdeoTsiL
	hINcd7c1y9xrJ2DVbWTL1f9FkquhGq0XubcoV0upDf/dKwZf90SF3Y2aA3Kn4kHh
	P6c/gx+ca4vdcGlJaQ7Yd+YlmnbvxwuIiVTEK/AHPez4c0wPup+KrC7chfDSssao
	YUddsNS6WWKf9QfjjCi6z2XNdUi0KIDNpKIvAyohaZ9MjM4iAXbtMttvJRwveyIO
	lfZfYreI+fmlswJrKRUisIV8RWKn67roEHK0iVfevsTZI3yrmNnofxCMZ9AcTqMv
	aoRUkg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k3aq8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 11:40:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e5e21552dso32602485a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Jun 2026 04:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782819646; x=1783424446; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Iu/2dveu+R9hFdVPTPFLQKVnjQWaGi/W5/Il6dZxvC8=;
        b=D+N53w5emBfMBr1pMghnbyRSmWpLKn7YjcFxuhACe+u4aIRues5oBAwOkhdWLF8YJ7
         8Tmbmng+cztGVKADlTgFuXeRnCgqcr1qXHT1YtTJJsQOi4NOYLyvsM+ugWMhWIJIGj/G
         tCvCSkVoDmOL+zjxNpIsq/drJC82TQcfkdSZYspzW2FLbBNbST3zgLGazUPiJ7PECDbt
         EXzZe1InQE6BpF9ZQ1tWmeUHrYp+6I2mFTJNbV1YFE/eeo+4d6/gf5MbXkyOI0HGmOFZ
         nCNhkOQwfAYQLSKbWx66KG2VN8Fg5sBOWAf5lJCQ/qvDKiEAZKGJJoCtVSp2l376n+i6
         LXtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782819646; x=1783424446;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Iu/2dveu+R9hFdVPTPFLQKVnjQWaGi/W5/Il6dZxvC8=;
        b=ewsTuAg5rQZnxlby0q5mexYO+ogLoLGXzW0mHfMKANR9tzxo0oy9n52YhoKQ/Mj3I4
         EHvsRpAmAIpdBkCrEgA3lREYICehD+b07NgC9oKE28GvIxckn1QzSG/qCiKSe+IraahG
         twxVzrOzSYD5p6Te1botW253YPKPlq5DkShFzSajB6/Th41MnvZoBxRpNRxFKy2KtkdN
         6G8/HZOUyuS9XGhxrXsI4Tz/LY8QbDGyCRfnT9qVvg0rBPuZ24Vbz3JsWCSYAph6dyyA
         U75BH6tFNHR6L4woSLiNnVl7Yhku2E8/KaMhpFDpsxW4vEHlkTHIv6+N5WAb6CiQ10kM
         l6hg==
X-Forwarded-Encrypted: i=1; AFNElJ/Kn+nLMjqTUWaLQDkQ9BaviUVoAT5PsZ8s0ifn/4Dga3elA4pNFzJnDyqH25wBn9r4AmUSEcONUsHKHKgV@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6iEi26qSS8C5C9lqYDiwZSAR+aI7RVlmaNbxhMgAMFTdemYCd
	DlnCVKL7H/LVNA6Ii3N8bhArzSv8C0Oo6+CSgJNTW93gCAvXtimueaqQTvSoRgKLFpAvw/TXZ54
	9CKF2weUv8jJKQMLy/paxY/UZyaeoiz0Y3+Y7h3fj517LumcinoTphYm4ptkyUKKTC3VJ
X-Gm-Gg: AfdE7ckMv6KYJd8et4nSO+DWY7Z5uNX39Z2LzSuWcFdzKALSq+izM37TdDyR6Xk4ozv
	atI1D8EYVATmagzwG9yfNIzDFnsNKRb6z4Ht3/xEtNb9w9N3FQSXQtCooyGtFGb/YsGkCsLtixS
	anhrs7I/Tdhb3WnckcnYDfO3y4vumieyLwvfj/gM0wQqmVjSOf74KI0aIAL3lYGkwCYUgDRuEYF
	PMP5H3EamkH3ei2c5jgThY4SVhuSBNv63g1rHGL9T1o/n99yJcQunX5r9dNV67cPB2vtsMnFshW
	2feTnvl4yH6xqhNSiSsBhLCgkRkcKI8Vtv6wK39bxfPKrxeoFqLJUBivdbtWl7rh3pCCizHQfhs
	0JNAQXwEqljjCbLR32N783kbM9NfU3LcyzSQ=
X-Received: by 2002:ac8:59d4:0:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c108ea935mr28923541cf.9.1782819646204;
        Tue, 30 Jun 2026 04:40:46 -0700 (PDT)
X-Received: by 2002:ac8:59d4:0:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c108ea935mr28923251cf.9.1782819645781;
        Tue, 30 Jun 2026 04:40:45 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1288f4c3aesm110014466b.47.2026.06.30.04.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 04:40:44 -0700 (PDT)
Message-ID: <f3c79cb4-02eb-4e4b-b5b4-9732876c075c@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 13:40:39 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/6] arm64: dts: qcom: ipq5018: add nodes required for
 Bluetooth support
To: george.moussalem@outlook.com, Jens Axboe <axboe@kernel.dk>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        Saravana Kannan
 <saravanak@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-block@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20260629-ipq5018-bluetooth-v2-0-02770f03b6bb@outlook.com>
 <20260629-ipq5018-bluetooth-v2-5-02770f03b6bb@outlook.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260629-ipq5018-bluetooth-v2-5-02770f03b6bb@outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwNyBTYWx0ZWRfX+CGADaxd98Dz
 ScpuXDGFNww/r6F122VQVvju06sWKRcX9JkMAzBrC706spUzoDCVVJhKJ52s7VnPP20jThugBkt
 SbMbuFL1q6SwktGXFCSwZ7XABnG9b+w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwNyBTYWx0ZWRfX5qic/F9YsGeV
 x4lx5DwuW/a1d9TAcMir3jCbLasZvUp37qUrpcRy0dOIwllFCUXoOALpe+TjziLwDSvoN9ws53m
 ciaknW0VzdnIAgd6jPiauf8hZPdIbo7nnQ/Ed8em+ZUEmLn1B0elb10uONIjzQgc4QkfeV0iCxz
 ZyECf+dX9PPKiuRBHTIF1iM3QkAVfOKRjiIXp5eTuQy10yX0TVE7YPcLalaM9dKIrcTPadhpZfY
 L/xnqD90Rlt1JRVr78lM9k2pDlDcJFJQHDwp7xjv5uVqyIswHqhggBEY7fVPdWrAQlBCIVXDBrD
 A1WY8c4Udb48+5PDa+p/yJ+Px+HB0+5O4pJ6apg9XRUbf1MRlYYvgjLfzvRZjRZVXRhHWkYW0xn
 mQFFARGX7AHeM2ZoM9m8cVnKcTmaXGNZXlYptJiLupQs3A5m8dC6Rk2E8qoQnYrwbASVGk2vcZR
 kDxSaG5WTjBn6AwHPZg==
X-Proofpoint-ORIG-GUID: fiVWDCl8syCCopFNxxgJK9TMvEXFh-rX
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a43ab3e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=UqCG9HQmAAAA:8 a=t82OjkPGvLD1vuDj7LAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: fiVWDCl8syCCopFNxxgJK9TMvEXFh-rX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300107
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-115392-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com,kernel.dk,kernel.org,sipsolutions.net,holtmann.org,gmail.com,quicinc.com,lunn.ch,armlinux.org.uk,davemloft.net,google.com,redhat.com,linaro.org,pengutronix.de];
	FORGED_RECIPIENTS(0.00)[m:george.moussalem@outlook.com,m:axboe@kernel.dk,m:ulfh@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:johannes@sipsolutions.net,m:jjohnson@kernel.org,m:brgl@kernel.org,m:marcel@holtmann.org,m:luiz.dentz@gmail.com,m:quic_bgodavar@quicinc.com,m:quic_rjliao@quicinc.com,m:saravanak@kernel.org,m:andrew@lunn.ch,m:hkallweit1@gmail.com,m:linux@armlinux.org.uk,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:horms@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:mathieu.poirier@linaro.org,m:p.zabel@pengutronix.de,m:linux-block@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-wireless@vger.kernel.org,m:ath10k@lists.infradead.org,m:linux-arm-msm@vger.kernel.org,m:linux-bluetooth@vger.kernel.org,m:netdev@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,m:luizdentz@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,outlook.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1DDEB6E3BB8

On 6/29/26 3:01 PM, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
> 
> Add nodes for the reserved memory carveout and Bluetooth.
> 
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>
> ---
>  arch/arm64/boot/dts/qcom/ipq5018.dtsi | 25 ++++++++++++++++++++++++-
>  1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/ipq5018.dtsi b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> index 6f8004a22a1f..65a47ba7d3a3 100644
> --- a/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> +++ b/arch/arm64/boot/dts/qcom/ipq5018.dtsi
> @@ -17,6 +17,23 @@ / {
>  	#address-cells = <2>;
>  	#size-cells = <2>;
>  
> +	bluetooth: bluetooth {
> +		compatible = "qcom,ipq5018-bt";
> +
> +		firmware-name = "qca/bt_fw_patch.mbn";

Is this fw vendor-signed?

Konrad

