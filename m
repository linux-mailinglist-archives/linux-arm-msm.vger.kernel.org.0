Return-Path: <linux-arm-msm+bounces-102314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SL2ALiwp1mnqBQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102314-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 12:08:44 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 40FC13BA555
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Apr 2026 12:08:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 635BD304C138
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2026 10:05:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF8833AC0FF;
	Wed,  8 Apr 2026 10:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fxOrdk9N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cErzpo2x"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F59D213E89
	for <linux-arm-msm@vger.kernel.org>; Wed,  8 Apr 2026 10:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775642715; cv=none; b=h+YCMwW3yNS73Re3rx/zW+E+06+yDOckhjPqZVLr4BerjfSrlZFe32rzrco+kGiiXbpww0wsJ/11Yz2/xbOtZLP8KEAHsnWiaUG51jBSzdeL8EsVqC/fvp4m8oNMTBE7lMZrVK74y9ct9UdXhNqX8cBijfUvYunVgMJr8a/aOjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775642715; c=relaxed/simple;
	bh=KaKYz3pNj1hGcCi7X+D72zEK2m8mNY9N43dNxg9MM8Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HGvIN360xQgnTA9UTRMYFm+GdfzQ75iowG2j28uczLXzcyLdbd3H/II5ti/LUFnWYACq82BSr+45Hc0VKJ4HYhT5Gj2G2LdMmUNdWW7m6wyt6S/m/yaECFFOZ0UQ+2Bfxs+TiVfINbRRFUr+D+KJphTLICvABNSyWoIbpfg5EZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fxOrdk9N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cErzpo2x; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385VGXJ1005866
	for <linux-arm-msm@vger.kernel.org>; Wed, 8 Apr 2026 10:05:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iLq37WPfEGP6RO1vipA4QOAdYaXzJ/quNzFvXtrwp1k=; b=fxOrdk9Ny0cJFTZX
	//sHaqK4VxOLIR/hr0UU5UBu0yLFrY4aA6iHQXSBxL2YbuG72GiqX6xDmew3dlM3
	n0fBuDj3HrnYpv8H8umlianSW/2ijrjx92TFx1Txfqzj3EZV94Y8icjtLAxE7+Kd
	s2z/lr/G9U/myFRRYz1ST/zvzdA5cyEdPm3pavbmy1mBdOuVN1kzrYgWqNwhvzyd
	ETD26Y3LM7WzDaPECq4+ipua4MXSkjskEinAv+kjz3DWSN/nRmVrJ+Q7cMltKBpd
	URXhulAxa3FSKaJkNUEa+O2HuGOE0sHM8I06vEGVwie7UiM49r8B1/bZOZiyDVl6
	P6xsfw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7tpaqjr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 10:05:10 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89e9d327913so23911396d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Apr 2026 03:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775642709; x=1776247509; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iLq37WPfEGP6RO1vipA4QOAdYaXzJ/quNzFvXtrwp1k=;
        b=cErzpo2xoj0H/Dc5+ocILwvSCEGDjYUw+hXmOoINOuK/3DDMcwMKITtBoBm42JhNyX
         mij7/1HD0CKTlLUYwg7rdAK4b+4Ag/HaK1iVOD9GqZAJMMV//LRa4ZVGDHHPzfj7lIIs
         jRblT32gWHFax7OFe51syhKTwqUByq2kcBk5Du3lIUodUldBRS76VMmd7hR3mmcB44AT
         ykbwLO61d4mGGOjpiuXo0+h3qsPjR9x9LynkZt4ityo5s5aj4r7AZBIkTXmdbRnYSBCx
         gk9ozXm2KTDz1rlyjRtmw0CzoVmE7FvO+hsO4qMkaPuwlwiUW9My/WdztpT3rV75nezj
         A2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775642709; x=1776247509;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iLq37WPfEGP6RO1vipA4QOAdYaXzJ/quNzFvXtrwp1k=;
        b=VsUvQxpIp7Z8T/rbb39pCSZmh50A838wMfSuFJOl3Cey+gOUhSKTi15SbjZ4UWbNa/
         OGRRumPcUkGRzaSfnFOBDG3UB8RuWWjUdhTcUHRA5UOsPR4wv8uyuycyvFmeBzXCWdIU
         rnIeKwpg6bkwniS17YSoeaPFhLdhmCOiOZNpqVYEWQfl96HHn4moIa8Dt/jib1HK0LMM
         ZTPKTmMtoO/rEDmIfnW8vvluMl4+A04AC+zvN+AQZ8g2WcJj4rtGSafl8k0AhxeUiEJ7
         Ito+c/MjOzbLQl9xRE2qd9Qyo3DuHjr5griEP0TM5EbpO/QKMuNJhHTQ+dZhEwIdLO66
         iqsA==
X-Forwarded-Encrypted: i=1; AJvYcCUCSVWfXUFo6VP+gXCE5gWTKeTYJChlWixst6RxrCyzpaU1mnV/7Fb4UILtaMCEhFEjsNYpb8qCIDxnfike@vger.kernel.org
X-Gm-Message-State: AOJu0YwmOZbvOjKQGABN7F2XPUWEA7T7/7BeDrwzGimF46lgZ7H5hIPy
	Xz61vuxzlc6+sV+u7nJa7kAumT1oitJpWydCqELVANxvvANzW3BGeAcneVnxQCZ+rIehHLgjVH/
	me5nUz5kR8Ua7IxS86+fSbfW+E+9/OgfGAampuvJBUvR558UNMpQAriJMlsGkJLw60h9l
X-Gm-Gg: AeBDietX2wY5XDiCiSQc+dBe4VFw9p0yaDq8u5t9+QS6oWr1V8TaIgYjcNwS61a+ObU
	2PUAwvD41AMab3bt0fmip5jEQrVefURei6xd08ROWzydBaKCxV8K4iZ5Y58mLAEhNWY6npw0rtm
	ae1jCH+qSyv74kJm/6ccVCMEd54dSAkCRWeGCvPG3meswiok3uVYU6hBJIWUT2IxjNFp4ZaSoTw
	q/MsaoltMtZUoQ7EUPYlejlgeF+Dlw186HWrXEURUWzSFOxJCa9lLix4dw5HxyTkjCu23+bUowh
	4IhNlPm8OpyoWd9QJyuGJHeq94ulJVrpHZZpsLTInHR2cWlloAaEpSFiDZtDJDaZcRyD9Lsb4v2
	X/dSimcA073WkMvQMc+vPqatJFxKdTXe7F21TGIazrPMCQUP1idZEdA2MtNepFDHkFLnOIItfJF
	hPVVI=
X-Received: by 2002:a05:6214:da2:b0:8a4:c5:1b23 with SMTP id 6a1803df08f44-8a704f9ebafmr238113836d6.5.1775642709582;
        Wed, 08 Apr 2026 03:05:09 -0700 (PDT)
X-Received: by 2002:a05:6214:da2:b0:8a4:c5:1b23 with SMTP id 6a1803df08f44-8a704f9ebafmr238113386d6.5.1775642709106;
        Wed, 08 Apr 2026 03:05:09 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d3a6a493dsm11087066b.62.2026.04.08.03.05.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 03:05:08 -0700 (PDT)
Message-ID: <b9b71f7a-ca8f-47ea-899e-61e1f431b246@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 12:05:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: milos: Add QCrypto nodes
To: Alexander Koskovich <akoskovich@pm.me>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260405-milos-qce-v1-0-6996fb0b8a9c@pm.me>
 <20260405-milos-qce-v1-2-6996fb0b8a9c@pm.me>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260405-milos-qce-v1-2-6996fb0b8a9c@pm.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: bXmBxS11mifoLoazQ-NSiHLj4EX9uMVy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA5MSBTYWx0ZWRfX6JoeH7Ad+HSk
 FZ4qL0I4qjFd+08/ZQEzvcfZp7djKC0jLsIMJq+CPqpcFvUFOlNF7eFPzBdM+NGNEBVykjWSmoo
 DrTXN7WndCN00Lu2gb4iCQFRR0JchFR9eLd+HaZRMZzCraZ3hruLZqRmUAgjTd88dbVgth1QWAC
 u2xVJK4OD8/biB3o9LdLfQucBvGrBvt5r4BJeB9EOn5P5erSE5B7XdlDVNyfuMJsPHMoqeuhuGd
 CpCxdVfijBjLf6ccL2MF6X17Tl38QEiobjCl9Z+1sTmhyPgfp6lj6AMFxcsd2mzcQuZxClBtYyz
 zi/7QxpkNdEukk61OMeUrQYnzdRXYPFcf+Q5vrYgaPWRT4B+47ZWanQPDaAZssI4CcqaOK10RqK
 QadhU6LQhcbpTZY1X0qvYzZzeTHyxWKYpO8hrUHo8jr7iDXjCZf7m6VYm1joE69JX+1UFGVvJ8l
 V/43GlL2e8+PI1AH7nA==
X-Proofpoint-ORIG-GUID: bXmBxS11mifoLoazQ-NSiHLj4EX9uMVy
X-Authority-Analysis: v=2.4 cv=DNS/JSNb c=1 sm=1 tr=0 ts=69d62856 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=TCpjqbDHjloqY1tG7BYA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_03,2026-04-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604080091
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102314-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[pm.me:email,qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[pm.me,gmail.com,gondor.apana.org.au,davemloft.net,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 40FC13BA555
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/6/26 4:10 AM, Alexander Koskovich wrote:
> Add the QCE and Crypto BAM DMA nodes.
> 
> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

