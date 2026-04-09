Return-Path: <linux-arm-msm+bounces-102489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCtAFXSe12kUQQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 14:41:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E8CF23CA87D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Apr 2026 14:41:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DADD530151FB
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Apr 2026 12:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54C1E3CCFC1;
	Thu,  9 Apr 2026 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mEHu/BVJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="agSbRofz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1B63BED6A
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Apr 2026 12:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775738479; cv=none; b=fdzVmVIf5krA9NITJHlr/M7Yzt5SQIl3yGKqXygYGwB7nyPNfuAWoCqjGZYL6EENvwdXH5beIcnG1xn38GNoKDcToFcfNuDgJDRtbuPu1xIxSpAXNMWsk9rnWUVce/ABZ9UyOdL/BvkbjUPNmRsSnQlMIuNLFz9h+a3iA2v7apg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775738479; c=relaxed/simple;
	bh=jIcG6VH2f3X5MPNz+mmqq26iaNfbbftnboMVLVcU6Mw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i0Y+vIEz6G0Car9S5OPidvvpF1c6p4Qtj4L+6cMDTPHxK72M4SbWznKZOnHRnUmV32Q10u9nGxSuccDw6uBELjnWY8ISkMTSwSeUs9tKGt4fTjJbV8ZygzkC4dlZagfkVKf+74kFST/4nDxq/JHrfxQY4jwUKGcZqg5crGXroZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mEHu/BVJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=agSbRofz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6399urDc3326005
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Apr 2026 12:41:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+5arrzvnS3rtZCFNC1+2oTuK6mQoxDzomGnG3jOxXM=; b=mEHu/BVJg+KXny1x
	vPSRoyrKYI5XXWJTlHc/O9kjFj+/Hu0dyjfU1Hnn/tkvEJ3bCOzJ1AS4c2iqiork
	Z7c4Yp99uj47pPtZQJVWt/FAB4VoumofVxyzgUNe29EWZQPJ914iCp1ziVskOKL2
	QD6lWoJ621QS4rL0SAqiljpNY335Z1DlkB+q3UHaKOj5S6f+e/FnMnxPKGDZ94QU
	fcU13AqDxnqxvW+AW2eykVp11cepSzc9Y1sAHT/SaMwuenN+tNoc2FMojBCOU+nT
	bZgLk3kZdYA0N8xyEDjkFF/5WcqqGxox89+FAjgnwr5O5sakONNyMvTA/Ki5Mq44
	6QR7Kw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ddw9mu7dc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 12:41:17 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cfd003bfe2so12376385a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Apr 2026 05:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775738476; x=1776343276; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n+5arrzvnS3rtZCFNC1+2oTuK6mQoxDzomGnG3jOxXM=;
        b=agSbRofzQBzhalyx4zmqwcqUizqtfu+8dGtapH9Mqno9BYbIEZY7erAVJhRdGT6m74
         7rkhnqbV+y3GrfEz9X7qbDCQc8/SOXyLweZKRqPAqy/mPLqDMHgB9ZChLcbg1vsBePa1
         7gPWBoh12pCcCI+uHVtuNtIK9DxPAkoWieLHyBt9jN2nS8GmouwDZaicAklJ1MJSoI5h
         UJFj9aFFqEZSluwP6SO8KgpSxIgbivole6ujLniXeNCT0i22ohvVR/AMaiBc4LPIzHAH
         /euzSC9RPSNLNL61epmn7764Gi6KmFcIbDNY53iVzJJ6V40mL3/VOb8ATmaXLX4qDAxw
         J28Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775738476; x=1776343276;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+5arrzvnS3rtZCFNC1+2oTuK6mQoxDzomGnG3jOxXM=;
        b=B40DFGHeD+SV3hvgGcZKy//p3m5juAAi+valDLnm+sLS0IABXsPUQkFvCFwQ2+jvk6
         +GW61AWdEhjK8uwimLnE8onyOg7kfle5kJKiYpRZGH6vdUXY2DwvgezFKlq9Lwn25FlF
         QKVCAZJ/j2X2rW307D8NaBZcH2sLx8MsNFePCQjpLnlFfT8zaL4E1mPHDV8pUQHhHax2
         lI/D14JnvNaVbiYtJ8dK+U/hC06SmFGJvl/iQ/bg7wnhFhpoeg0crtAmARftkG5YUpno
         YSPZherJrx17se9s7F+oXmn8+VqUs90HbBn9BMm1tR4YYfRwueE8rrOwbYjezaGfrCXv
         RugQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEhSGpkhJqYO44gOgHklDal+h5ueTSqv946D/78R2BGAtOrm5ETPfVDUkup3q5TkDJM48ikAS/A5aMCcZd@vger.kernel.org
X-Gm-Message-State: AOJu0Yyf2R1ph4xWXHpbnY+oMi8uvW344vkpUN690Zxd9qop40EP9dm4
	655ieP+pIDsl/xDkwwd644qusG/+nAl0UuUskPJAaEJMX10m27sgYFQXD8l5Gap5rvMwTCkHEP9
	euVaCQ5R4DNWlw88nBtqzrL0nbhCNg3etpw/uGTskzBqycfqMQlJDNxRRAGAaxOQVmEL4
X-Gm-Gg: AeBDietRGxnR1dTWYEcT4M1S9e7Jkm33EFf11lCzFzWs/ig0ZmwZNJRse3lykS0+Esu
	1Li1nKJO1A6kLTGzBddmxK0NNSYvN3dMLDD501gNKvgFjSzJv5SVaYcjwCdd683FNWAk1dJtu6s
	U55mqExBTTXlCxSEBTYute3/vCWl086086iPm6hml/212T3DSrLsmHziUI1sl3szSZ9PUE6quSw
	KWN+LZWwtNFn3TLa+MviuWmJod6pTDT9hyGf40DuEJPjpdMaZ345GtvLbtUvST3ZW5lYMe2JKTR
	RZw6Lv7U2Vhg5bcUbLmOwJ+nmBukwYlMvU3Rx6nHJtTMIghxNBGBmElUXFvbVItpca5xlXMlXyb
	kCDz8idSNaP4OkxGxVPAbHz+FkykN5nGX4rTOL+4CGzw/QkCtfKGYmVaD2Dqan493St80AMdEBJ
	vm7uQ=
X-Received: by 2002:a05:620a:2682:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8dae2489c96mr821419385a.6.1775738475994;
        Thu, 09 Apr 2026 05:41:15 -0700 (PDT)
X-Received: by 2002:a05:620a:2682:b0:8cf:d2be:5796 with SMTP id af79cd13be357-8dae2489c96mr821414985a.6.1775738475540;
        Thu, 09 Apr 2026 05:41:15 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66e033a74e8sm5705345a12.16.2026.04.09.05.41.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 05:41:13 -0700 (PDT)
Message-ID: <80067706-1857-46a0-a281-7f4ff3937468@oss.qualcomm.com>
Date: Thu, 9 Apr 2026 14:41:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-oneplus: Update compatible
 to include model
To: david@ixit.cz, Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
        Vincent Huang <vincent.huang@tw.synaptics.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        phone-devel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260408-synaptics-rmi4-dt-v1-0-2d32bacce673@ixit.cz>
 <20260408-synaptics-rmi4-dt-v1-2-2d32bacce673@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260408-synaptics-rmi4-dt-v1-2-2d32bacce673@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cfPiaHDM c=1 sm=1 tr=0 ts=69d79e6d cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=hp0kwjZ9wkirG6XhGIUA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: swKtYxjUFxwRHHsYoiuC54yXudKsUcs-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDExNSBTYWx0ZWRfX+ickxyqqZWLl
 MtuYmDZqm5+81WIu3f0cMQ+MZuyWUdBHkWzzlHAcOgbDI5EyETGWyCWLfhp8tAYm5FymvletoE5
 wfMQHjynL7TwP1pn+aBq0EnLgktKZu7lnjFmGotLY8nkTyXST9aIzjeiUSC0hCLaR0oMTZwuMoI
 JX3lVE2yoBFOe2s5uvKj1TJSMGv1poX5jSJUiuVOOStuWphVE/dAVBkf2M9g3Ah7F3GpsDhD1Jo
 VaZyiziIujNEZH/ZsggfiyVA66PCq5FDePZNuFtrRcU19F0mp+ywRyslNDb/p6KFSjXCYkOhlVr
 lzL17IBkimkH1yAJlvTyMt/sHu96ynzKFw38UDtaZFdSMwip3KhP4rotEbp9FsImLwvlShsYefL
 U8NK1FOxxJiTxsf4lAsw7O3IhA3vohOBrWE7izeuzun6/pVC0CstdFaFGsqDqKsk85l9EtQFX3V
 KBTrJ/ADLCwKGck9kow==
X-Proofpoint-GUID: swKtYxjUFxwRHHsYoiuC54yXudKsUcs-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 impostorscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090115
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102489-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,ixit.cz:email];
	FREEMAIL_TO(0.00)[ixit.cz,gmail.com,kernel.org,zx2c4.com,ew.tq-group.com,tw.synaptics.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
X-Rspamd-Queue-Id: E8CF23CA87D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/8/26 7:34 PM, David Heidelberg via B4 Relay wrote:
> From: David Heidelberg <david@ixit.cz>
> 
> We know the driver is reporting s3706b, introduce the compatible so we

via Google search AI summary:
"Bon Chef S3706B is a black dinner fork (Roman Euro Dinner Fork)" - the
more you know!

> can more easily introduce quirks for weird touchscreen replacements in
> followup series.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

