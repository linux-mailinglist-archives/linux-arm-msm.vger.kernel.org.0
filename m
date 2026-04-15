Return-Path: <linux-arm-msm+bounces-103268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJq7Oaxg32k0SQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103268-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:55:56 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCB4402F67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:55:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 81CF431133DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:49:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ED1733E368;
	Wed, 15 Apr 2026 09:49:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aCenT5RS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P4c7U1Qo"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6BFA33D6E1
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246562; cv=none; b=uLgSuZ+Ao5x4xkVwc0EulXww4uvroqn8XnPKTxT5/0szKdo9SQWp6IUCWb6xkdIZdFCoLuJp3wOMrZkF3Ljq7Nc6xFo4QdpbmrG+5uGQW3jKV23JPWRrgt3WBBPpNS7QlHGTd8hbjAnalV02fD5JD1X94t2oIWd3/Q3NN8nfAiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246562; c=relaxed/simple;
	bh=VjI90jTJy7c24pG9mgRV72x07WaVDTTHNH8S60OnBmM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GLz1SEne5RSVefa+eqWns2479VGmrfNOmbkq3uxTn2RYVB+YtWjAncyGWLKCQbqgVCjg9ZtdSGP1eTfgkdjzvb6hdGRSG++v+WBPJODgDbVRhCsvx4UNd9fWza2xMo2f4flECz27hgIeGhpm84EyMlT5L3XhBhzqNoJREAIVmzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aCenT5RS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P4c7U1Qo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F7tZIB764370
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:49:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZYt2Uabi9jAwssBsgdcXl+OwB3F3m9yhbypqelBA+YA=; b=aCenT5RSm5G1gWWo
	0CuexFXnlNyy7IALcMQ7AACcCOb1bz2z5HEvXu3q419Ez3l+RJOLQdaKlSeHoZNT
	Y7Y1nuQg4oqSGatmzZD1b4F8/DmD5vcsQWiPJeunsNECPWEiZXwY/UAW+4BoKfrk
	dsoupuKyIbvpqLzGvKxhbFUkoF+j6aQiCpJxFlnSyEpzt/dWYKxcnkh5getc18H4
	fwEpyIdWpCxWgcLbhj7TmyBCIjSIZWvUzqMfYfX+uK555ffiovV97GuC7/8TaxCh
	RgBDORtn42hZVM+OWgKkOah2TAqJdJj1YD1A9pJ/OKnWFT0lzH3pzwihR44VIM5M
	nmoTSA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dj6q7rfce-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:49:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8aca2eeac85so14371076d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776246559; x=1776851359; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZYt2Uabi9jAwssBsgdcXl+OwB3F3m9yhbypqelBA+YA=;
        b=P4c7U1QolsO//ma1athwmhe6WsaGUzR1BHUubZS1rikp61YTfHjnRjyx6WqwUtGIBb
         AvRQeFkvgwkRu6s8P5YhV7oZfkuHbswn2YoXD1v4eRh9D8ng/e1lHmC9eKKSYY5tb4m/
         bfmOLMzemeTElT9SW20Q5gDvKdv0DFFvTcHAiUkZ+gu82ULCWivZjBO+6CQSOE+LA9pa
         kK+w/ZW9BURQZkKdYwpydpxVyrUA4JxnNu7bin+H/Sfe8l78fLCMJT8hOZd4jke3kd9Q
         YWGBTofW+gqnrVTZxJcAHVDXrPnnEXTc23Qhrr4W7At7utJMY8PScEtPae2ar/zUmQpQ
         qqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246559; x=1776851359;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZYt2Uabi9jAwssBsgdcXl+OwB3F3m9yhbypqelBA+YA=;
        b=Os4xZmULrbh0K4/3Zb8xbSB4fxS4N/TMWNzl/hPULyjwTQoASPdzat6tqi4hsRoXey
         y94O7x+bgajLka909UQN1NL8S6IENOLeu70qABUp73P4RfAxaDHZ7QFNxU4h2SmUkM0l
         5cQXfcTjn8R0zsCZ3H1Av0JuznuRlsqh2xz54h8LdntMygdvYTHb0p71nek+xsOEbffG
         vSZUwr5u35WPue/eP556lyzFVxENPG47WnwbV4gN0KENChc+0xcbtAe2DuTaace3EN2n
         pQcgsGeCK/SGIH9wc3utZ5w/1pT4Irqw9u1fIsf3ag+204pTynT8EKcUrepi51lDZb3x
         nljg==
X-Gm-Message-State: AOJu0YydHiJHGMWm6HwEkTvljhls5dFLnTGag1bv0e51Wmee6cLKKHNS
	S206eYd5IptkrhyHQ80BnImqlSoWFrdKi8VzQyY5Qaa+Yca9yDZF8jUNw13MU8RQvzTCU5Sj97u
	RqSKbA8oPpnoEr7PqNOGb2rm/c2bCdc/iaXSCZc3tVRkhgDMwukFHowvoLu3qEiNxJwig
X-Gm-Gg: AeBDieuo3oDZ+TbmxUuI1GSPBw7213MEhYBhc/h97o+hAn7Q99q5iSW/ZwdUa8aG1RC
	SaudHU4OfZxI4ByyeCyJ6qHmVYDFbzl0tg45oVr89xb+LFU2NokXe2agnqpULQuGVfaWGMTO87r
	7Yl+QzrAujsJvmEx4JyRUKYiSnRIqQyrd/3GzA1OdhGIcO9ppx4qYTiwkMKbcswdCeNADqEBxE4
	pLEniOkWqIAbMjkdSVNskKQjj1FCpcWDV/qcisQuHF4zhOseQvzRcRcuxCNK6aWG4EF5MIOAb93
	bsNcZbVD4iUIckLaEE2ZBZ5moEN/AwQAksUrQ3WdUMC5EyIoA1IdXhwB+duGBIie8h4eoMP9T3K
	A1//a0u6lmjOC7CQvjAxO2DuHfpTQdz2OS/dnb9Fd8qzjKmes9i8BpYeb3ie0auVYZ3cmJtw/0q
	pbSmNZSRCXMgGUpg==
X-Received: by 2002:a05:622a:24c:b0:50d:aae1:7078 with SMTP id d75a77b69052e-50e1a5dbbd6mr15378481cf.1.1776246559002;
        Wed, 15 Apr 2026 02:49:19 -0700 (PDT)
X-Received: by 2002:a05:622a:24c:b0:50d:aae1:7078 with SMTP id d75a77b69052e-50e1a5dbbd6mr15378361cf.1.1776246558476;
        Wed, 15 Apr 2026 02:49:18 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-67237d79258sm283300a12.4.2026.04.15.02.49.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:49:17 -0700 (PDT)
Message-ID: <dbe4a4d8-4a3a-4e69-843c-ea0b55a4ef1b@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:49:15 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] arm64: dts: qcom: qcs615-ride: enable QSPI and NOR
 flash
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
 <20260414-spi-nor-v2-5-bcca40de4b5f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-spi-nor-v2-5-bcca40de4b5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=AvHeGu9P c=1 sm=1 tr=0 ts=69df5f20 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=WZ9FainDxlOnS1l-YVMA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: Zmz1pnlp3K-E2Oyowsklu3lV7RNZdJsA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4OSBTYWx0ZWRfX9TV2EK5jt8d5
 lcIbhgbm+o6GnvdBrtuPAXRX/WPmbkruzgm37DcQBKZI5UJcHnxgayH/FTEdTg1NJZoabj9x7xH
 8dQh0yd3lZ3pTdcAdMpSYzNu9IRb4mjbANFA8EHrZx0k8vO2JefAGaA3lSlpgcAs+gtkC6bWupP
 vJoL4db4Zpi2c9TaoxMXHWaRDLzvyRB1Ur0WMV5IkPWnwsm2mMjaBLOr80CGrayS5NOVEkw1UKD
 6CcpToYo7OzysW8SogC3e9jhU+VAKzHa17lJ8XjByu0EoI3xSjB3swRv3KIDBG59PewMVQoXLNq
 ClMZ0HnossGvUP7GfOd9G5ODZ+zoanIYwI5b2RxcBngf0hq1x49ENMuNW6T/UFmPx2/1xeHh84y
 ICK9COdXekHppunBpMrc/cnoDmKKuhZLYE2o7e2fcSLhdybIKzO/G3ONAoJRBk9B2hRb6uTwGCU
 bjHoUnphPWjldrxoFgQ==
X-Proofpoint-ORIG-GUID: Zmz1pnlp3K-E2Oyowsklu3lV7RNZdJsA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604150089
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-103268-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4FCB4402F67
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 7:08 PM, Viken Dadhaniya wrote:
> The QCS615 Ride board has a SPI-NOR flash connected to the QSPI controller
> on CS0. Enable the QSPI controller and add the corresponding SPI-NOR flash
> node to allow the system to access it.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

