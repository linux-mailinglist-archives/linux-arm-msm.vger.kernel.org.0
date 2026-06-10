Return-Path: <linux-arm-msm+bounces-112467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yKdRB9VjKWp1WAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112467-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:17:09 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2054A669A4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:17:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="d/kx6CLg";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Z145d8NS;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112467-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112467-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 262CB3008D00
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 13:13:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AA5F408029;
	Wed, 10 Jun 2026 13:13:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61548405C41
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:13:07 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781097188; cv=none; b=H2hpJdb5UI7jWs/3mfupudkR+Za4NZxcfbS5am50luYSVWMraAOEMYdsHEm25TY4cBLCjZPTdppW0UlUD0CsqK/oxsTDyVoa6m42q1xf9HRlQf6uO/6CCv2YFwNZ84+tOVujVzkRGKB9qiEWXopXzfRIeHpf+N26AAoh76w60y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781097188; c=relaxed/simple;
	bh=bsr7pJ5YEZy946+9gdtl1hv8ZREddttX2UY5gd/ijJ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FxL7CBjvlFi9E+kq0m68d4j68BCd0PLim9OImucvTxLf0/7ubD0KpFiF3A0GCXsyYsmfq/K8pjQ40vNVe9nzd2rBFaJWFElhfEkQnypXnw5UwNkuzSpsEwnblBPS8tfrcVP+qOkQPe5/Afvp8rci/0x76MiQZTUGAzZ/h5d3E3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/kx6CLg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z145d8NS; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBdOS3763309
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:13:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qaSgPTMhlo8CQK8cSLxNg0Oqjf6PBr9dF4U4OY2jF/U=; b=d/kx6CLgd6zQUrwP
	hhmIoyfQN/yAa2wZXHYVkz/3dhUpgTCsVM+nQKg1IPOs5JJJH8oTtfO7k5PnRorA
	5yCO8l1VyXHXODD2wT/S+AwqJB/BT2lKltdKCr/wHTEZfvD1FQpmGRoIhXoRAiPy
	kHXlzJEUqdDpt12JphD5zOB6gleeQghxeC/XDQrKGMR8GrDDanDlC6650ZrKhkrd
	VTUg8HdWVQ1OqNWtHFAnc/eMOI+JnvtmpAi/mIw12441z6PrXOSpuetNP5nLcerX
	hcFniXgNBUzZXF2F3HfiWq1V6yk4T1H5ByQjyU/gdEVpdy8sMeKAKth6zloxMMZ/
	tbC2Rg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnetk0k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 13:13:06 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6c4271166f3so302196137.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 06:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781097186; x=1781701986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qaSgPTMhlo8CQK8cSLxNg0Oqjf6PBr9dF4U4OY2jF/U=;
        b=Z145d8NSdErqQr1e08mcoeJPFi1slbIDCLcxCwsSkw04GLrpe9NoAeiWtpb7wWs+uh
         0J4sPBBKxExbkORkCnc6rvJ+usSGnMtHzJT512GdRuub8jyX+xQ+aWqsVcfPBYBYrj/u
         W8qMRI85rE41hI7dLuBH+3EBspbvfa3sIz4E5bz7G07soYZP5ff9/JPQ+RbV2FknncFV
         gE1Wp6cqkgbm29mMoA8LwF/V7RE/kVJSkh64u/g+/uTCSLZvrLN8QsotQ+saAHl8jcP8
         TLYn4o88QEpJWz48GBi/Uokxc9sUnbo7+LfIzxoEQNh64BI5AGNZc6UgMnFmVg/j7iQG
         9VUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781097186; x=1781701986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qaSgPTMhlo8CQK8cSLxNg0Oqjf6PBr9dF4U4OY2jF/U=;
        b=dJ7To6pTrIPQnPbZPg+MP+alvDGdsv4WYUrL+8aJxs7I5qv3RNOn2kmkTJ2i5vlr/Z
         gq/fmpqbmiNDNOHkMhqrXNwBerPhIdrX6WMUYnkzdH/MoamPTUT7b1H5CQC5ryM5VDbx
         RF3W5tr2shoJ1Oo/qcGskYM2EAh2WkmUlUSXAbU3rQ032VUB1l6DqdPAfVShaW4RCogh
         XDl5SZ8T368vI0xYA1HYnYDZfdJ6vE74VQK1vnm6akp3XrlBdu9Kj035rCHAhGPGU+Ln
         re4s4f0zNeZ5JHsTKvFrJox5EkHn3kbaw13ttvGzfYqgKwtLZNfgln6gpnFh2xTecfny
         KV0g==
X-Forwarded-Encrypted: i=1; AFNElJ/6Qw5HaMY/cku6zElaraiaY+t2f8TGXNG7Ho1+NXE6Fd8zYz/iJYlGqHdD8QyM6YjLQSzKKHjJtu/VCd+0@vger.kernel.org
X-Gm-Message-State: AOJu0YzNzUYhwvTbp22Ghd5SJv0kLZnbPxuVj8A3DrCn05vOtxKTRCv7
	/fOemNtlS59FN666wTM2arUU/23LRRweGnMpUdF8EWTE+1xbt0YHnIrU9xY9+ajtwDW32u/O3sj
	8l14Jb/iVCHqTQN17r4KBkzqLojHiwrFrPb1DpAiPSYIOf5YCDKvVD9KCEWJro3wrBB6O
X-Gm-Gg: Acq92OHoomQvRHZkIrvDfWhg4YdmigyrGmOFlU0rfJJ434NMnGwH1brb/1ux6SPo3Zc
	TtiibDYK2l3PJXokCmPEkQtF3H1qX/wh0g6fVPirWtVPCh2eMGC7fW++jORSJJifdFflH8PBPxB
	dHSIoklEGWePCvt/bqk3J+7EU1e02zwfjF1idjAkwLnNaXyoghd8Zys3Qe8YdKUnd4PsRttl0Xz
	+7asfqxYByBYv18hPLybkPiLcQXyAFcIrSgNGimz6rDCp9RXmHzDiXo5F7yxa0PCksX+3enW9Z6
	PuXVKy26jLfRL/r3LoN0fir6GdQD0UT4VfwM7USfteT6mCu5QS8aY6vaVO1bOqA30LDBWy/rK9G
	cLoCdunVeLW5uBC4X6IIMTxfzjswjocnxG+yHXkNQn06ARtTEYO2F84fJ
X-Received: by 2002:a05:6102:f07:b0:632:8717:e553 with SMTP id ada2fe7eead31-6feff065149mr3913056137.7.1781097185740;
        Wed, 10 Jun 2026 06:13:05 -0700 (PDT)
X-Received: by 2002:a05:6102:f07:b0:632:8717:e553 with SMTP id ada2fe7eead31-6feff065149mr3913032137.7.1781097185087;
        Wed, 10 Jun 2026 06:13:05 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf2f2da4447sm912289566b.10.2026.06.10.06.13.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2026 06:13:04 -0700 (PDT)
Message-ID: <852caded-eacf-4ac1-8fe5-83dd9285ef11@oss.qualcomm.com>
Date: Wed, 10 Jun 2026 15:13:01 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Fix up QUSB2 PHY description for MSM8996/SM61[12]5
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Iskren Chernev <me@iskren.info>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260610-topic-8996_61x5_qusb2phy-v1-0-d7135980e78f@oss.qualcomm.com>
 <b05e860e-ace5-4399-bbd9-493f7bbfe74d@oss.qualcomm.com>
 <cnyhnyoce6v4d5roijrceuzd3ujvvw7ozklulaxkibptvjancm@cqbqu2aa7bz6>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <cnyhnyoce6v4d5roijrceuzd3ujvvw7ozklulaxkibptvjancm@cqbqu2aa7bz6>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 9ZvoaofyxbBH4cIIc4HbQ7EGAaAW352m
X-Authority-Analysis: v=2.4 cv=ebYNubEH c=1 sm=1 tr=0 ts=6a2962e2 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=nlUS1CZQJJjccDyTXbgA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: 9ZvoaofyxbBH4cIIc4HbQ7EGAaAW352m
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDEyNiBTYWx0ZWRfXyyPBizNSqtPq
 dFopBMM55Foja4RZkMfCNlFUO0lAu0HTH098zTUuTI865OrU2wm2Qx5iTbZWNpU7gzlNtRq5TRM
 ZQjYPLglexoWZlWN9OR/rndd7/n/Yuz99hvZTUXBnWau5Y+ns2oYAhs8IkKg1vy4+B43J55wl/p
 jiglNfQrMXv4ATM9L2O5S75VlDKwRYrbvdDjhV68hRqjaHu9SLLi6xZAcMrwJlJe6UoISRY73ow
 67dVZA/S5B7TF0kHu3k/3OBE/OpiZiZLc2HEUk+nV19VZUahTETGb+jIYHdyeepFYEakWotxQ7n
 AiI5DSiCvSpZjBTTrPtVA5HpRjcsikynPhxYLEC86mntv8phcT3nrjpuMBlrXZX2rVnwbGA2seG
 BECbYJUzrBSvUpsSUO3xJji9V5816MVwXJRp8zEUusBzaweDC2tdJPID8aaEmawMxE6ECv/XdWd
 jUdPUKLSlIG6ragrGDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606100126
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112467-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:dmitry.baryshkov@oss.qualcomm.com,m:konradybcio@kernel.org,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:quic_wcheng@quicinc.com,m:me@iskren.info,m:gregkh@linuxfoundation.org,m:andersson@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2054A669A4B

On 6/10/26 3:03 PM, Dmitry Baryshkov wrote:
> On Wed, Jun 10, 2026 at 02:49:31PM +0200, Konrad Dybcio wrote:
>> On 6/10/26 2:04 PM, Konrad Dybcio wrote:
>>> The MSM8996 QUSB2PHY was not being guaranteed a power source.
>>> The SM6125's QUSB2PHY was believed to be idential as the 96 one. It
>>> wasn't. This series tackles that, freeing us of some dt checker
>>> errors about vdd-supply not found on MSM8996 boards.
>>>
>>> Compile-tested only, but docs confirm my findings..
>>>
>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>> ---
>>> Konrad Dybcio (4):
>>>       dt-bindings: phy: qcom,qusb2: Straighten out SM6125 and MSM8996
>>>       phy: qcom-qusb2: Fix SM6115 init sequence
>>>       arm64: dts: qcom: msm8996: Add VDD_MX to QUSB2 PHYs
>>>       arm64: dts: qcom: sm6125: Fix QUSB2 compatible
>>>
>>>  .../devicetree/bindings/phy/qcom,qusb2-phy.yaml    | 31 ++++++++++++++++++++--
>>>  arch/arm64/boot/dts/qcom/msm8996.dtsi              | 10 +++++++
>>>  arch/arm64/boot/dts/qcom/sm6125.dtsi               |  3 ++-
>>>  drivers/phy/qualcomm/phy-qcom-qusb2.c              |  4 +--
>>>  4 files changed, 43 insertions(+), 5 deletions(-)
>>> ---
>>
>> Note that msm8996pro may need even more looking into, but that's a
>> story for another day
> 
> JFYI, MSM8996 Pro is being used in the DRM / Mesa CI. If there is an
> important difference, it would be nice to get it sorted out too.

reg   96   pro
0x80 0xF8  0xD0 [!] QUSB2PHY_PORT_TUNE1
0x84 0xB3  0xB3
0x88 0x83  0x83
0x8C 0xC0  0xC0
0x90 none  0x02 [!] QUSB2PHY_PORT_TUNE5
0x08 0x30  0x30
0x0C 0x79  0x79
0x10 0x21  0x21
0x9C 0x14  0x14
0x1C 0x9F  0x9F
0x18 0x00  0x00

apparently this is indeed SoC-specific (via docs) but also apparently
may not be very important (although should be fixed regardless as
some designs may rely on this)

Konrad

