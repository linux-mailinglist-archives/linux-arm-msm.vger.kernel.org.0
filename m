Return-Path: <linux-arm-msm+bounces-112743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HF+iDw2eKmrqtgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112743-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:37:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6ED671691
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:37:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=jO0st+7V;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=L180neu2;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112743-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112743-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8282730234C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306EC3E7BCB;
	Thu, 11 Jun 2026 11:37:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D028A3E8326
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177832; cv=none; b=hf6w/BLACqTXgvwJ/pav/E43x0bdtz9yypOaa8wsJH7W+RGQxVfm0j/OmGpZYVCkx5PKcETkMCkRvDw6mXo3WMfkUaJOP5F2vBUDEgN2VHHR88jM9tL8K3rbUzTVhwZuqi2oZcqKIvfnSHcHmsURkQzlcHFTxzxggNMRN8qWe+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177832; c=relaxed/simple;
	bh=6U2EpQbl70iTBwLkHktdUzi2+kfxjlaFpz2VtqrjLCo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rEpA7lno7hUxrvHaVYjDzWri5iqIGmmcTEMxQBliNXmnLc30uQlrbNoqcBStxLyF9eJC+3zyvVwtVfhSH6/k5NgdBmGW/QDvyCXdgOnWmSGXB41wkDixsd4uqcIYE5OVpnjUMwGWYZUsZDpsMv22NLS5HBQhZs/RFpIVBo655kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jO0st+7V; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=L180neu2; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xMDI2890717
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=; b=jO0st+7Vc4YI9sfN
	l2yHJPsrjU9runL9De3EMKIR4UX21YwYJxfwDUhAZZxB4DCoh8TeICLRdaC0gZid
	xytGd7vHlq2shgW0YV2jT7CtbFXpIEcBGhCCuqmamAA2LIzWAQ3wrrEGDZrk9+q0
	aA0gZsW5DU4jmkx76675O5c1y9Iau9lzZ9Qj0llM/6+WGdjVwltjpPYBcnLr1hUT
	E05jqNboHBOYSpEMEga0hlyyfnYXM+sFnUztQc9Kfhp+CgFOcYo+xcNudIF+hMoM
	mflFKDvHs/ILvRI/ImrW1h7AaEcljbiqM+zcSEuZzBngFW9owbXPwsovr2wX2xQ8
	B1LAOw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79k4wj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:37:09 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5176891d0a9so20045661cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177828; x=1781782628; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=L180neu2fsY407trZ99u2hbOSOqCKu98XL6RyqIb8BnAVCPt1tyVjtSn5PD+6x7rNh
         kWH/bwhpxQBbqXROxbBVsxmY1+duzl+NqT7Rk285iZLep/adU6z6gqKoYaMnJqM/BV99
         ThH2BJtKW0QJUwvHxhInnKysUQiaXiCYBy1rom9aKN3Si0AlKI9cE9F2D+0oGdr8o8GG
         6oEnZN52/Wh9WCV6Oe4vRwWWkyDBtdHeTNZ/EZoOfJNrN8Z3p9PDCg5JfUz3XswgGK5r
         vP2S8oWgsr+/pg6l+FISMlpkPxSQtRi+nfIlieoHoZvrZ57H/C7XMFvkijGGgeM0yZ8C
         uAfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177828; x=1781782628;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qoo66iTrH2qXAXuURRiKTypPfoX3zlqywZjiMI3hGVE=;
        b=KSDPX+d2ZNC4eOVpual6iODkDPzpIszprcBm93/5QAmZgp3yolnTlUREhF3P8VriUe
         JhgUj6G6nVsi/rNc0kJk4Tk0BnlzcJ+LP/F6u+v7ZfG0HxUSGdoTQyV50bV1+9RaMUpi
         CzbGIZXHq7dd1fyfjXC3AEY6n+Ias3907kt/aKazaIXNMZBt4uUAaq9qoP3FV3M2uzpu
         oMwEORqY2L0MVvqF0unKIBDXAMJe6UVsg8Na4agUDx0NvAOpswgihsYllSPPSghdcgoh
         tUlTF+Nr/zPfvlgXiCJaIPeTL3ZDDF4sytnbxOXbc9lXrvP63+eSd4R1tE/wyBVDnbv8
         bp8w==
X-Forwarded-Encrypted: i=1; AFNElJ+4qQpyNyEtcJFZPIAcRyeXJOgd/JKb965AUvt/DfLX4g3eLG1jk3JJW/Hi6Dx20VceeCTkCQhwbLXrszZu@vger.kernel.org
X-Gm-Message-State: AOJu0YxBeLXEJwFoFaTC5gmqeZCpzaGMEtazB6xvKw3RuDiGE+6Y2wWP
	oFZgOOpVgQKZgos75TrxRN1hj/mwD5IcBGwROAtGRfsrXvHqmOdEM3daZiL8Liq+xIKOLp0usa7
	CyaWN+TAJmgB+0uOT0bDDYU6CIk51ks8OjiDIbpQpApMflHwaU97JfFIYYgJEmu/jbw7I
X-Gm-Gg: Acq92OFcXNapUC8U6UDNC6H6f2+U1j9IofAhv4uGFo26jTa4H90GUuqEeSr+UK3ZfFr
	FC40bNsjDzxglw4VPc4MBfKPf9fjorDqBfzc34KMs4IuRMpGuqjPlQ7fbaAyqLCl0pJwXpdprWT
	obXqdqhPqWOtPZwjUyZhjpXZQOwBynj2Ta3khy6YzW+1FJkDQ5D4iruCLm6Dixu/3vMZ3dr1h5N
	WfLGnw7JJc2lu9br0xuF+ACCU/azuiGpsGLlutduz3mJ2BHymG6C++Ya83aaGOsAHBHZ+PZ5zkP
	tn0zVuF2VF3Qj4DM1pLSMA8nlMNgaIUhOs1MTrv44Z1n/CD9WEDAGS7pF0vzKGNdOh85SflMfau
	eGKYmnJw55dNNcI7ioPhWfA3ulVoMVIm+LKYUxzQMvcJNTiImIXAoaw8S
X-Received: by 2002:ac8:5a16:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-517ee22d93dmr23080251cf.6.1781177828048;
        Thu, 11 Jun 2026 04:37:08 -0700 (PDT)
X-Received: by 2002:ac8:5a16:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-517ee22d93dmr23079821cf.6.1781177827462;
        Thu, 11 Jun 2026 04:37:07 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfcb0f147e2sm53745066b.7.2026.06.11.04.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:37:06 -0700 (PDT)
Message-ID: <f721f84c-03f1-460e-9137-9373ecaacce9@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:37:05 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 10/18] arm64: dts: qcom: sm8550: Add minidump SRAM
 config to SCM node
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522195009.2961022-1-mukesh.ojha@oss.qualcomm.com>
 <20260522195009.2961022-11-mukesh.ojha@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522195009.2961022-11-mukesh.ojha@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RGtRFkU2e3sPGFOIQgS6T9KQ_tzmFiyR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX6Rup4kfEmJLu
 jvOc1b97jnG1eYCMpglN8cgiDmNRpuhOFWCABxIqJx7m6B9+kpQ8Cx2imxu1gKCxPL3BlcxXLHA
 3aqWKUpTMmdlx0A9N7w02GnyBBfRwohWxx7/n7ummWBs2NNiW2ThilVn3qDboPbjKyceqFD08fw
 m39GKDLTSyCbcP1Gp0LrmU+5BtnIWHuIrQjWbYZ5vrYamINUUhn/1kg9QPpYW4OHdBT5jwTUAPq
 hVLq6TeqKjN6ml8X/cP64ErXeoS1G9PaHOZOIhWPvTzVZxOARhxS4iLfqrLdsN4gNLFsawwAWvD
 pwKpBQvRGsbcSd63GJBkfQqYFuB1CNcR7YA4OW2E7IsfcXVThgCcp8N5SYvmj78+8ujzjTm1K4P
 p9n3AAE5LheTCTSDtN57dQ7MKsU/+NPhRHDwDuTL4+argW5ZEveDfGyNdjwTvXgB+gK/VB+uxrD
 IbOVNUl+f0ymmfYucPw==
X-Proofpoint-GUID: RGtRFkU2e3sPGFOIQgS6T9KQ_tzmFiyR
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a9de5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ZpVAhvDm8T4WZmbhYYoA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNiBTYWx0ZWRfX0vqZJxqxqkxG
 nIQtBp/bADht0sNdD98Xi+DlGeGDr2Oyq6Qo8hWLDzHKpmRP7FbZBR8OObxOI0VSP8JqpCjecnr
 RMdABEM7Fq6UsAkCMAic7fc7hlpS/FE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110116
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112743-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:mukesh.ojha@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:robimarko@gmail.com,m:linux@gurudas.dev,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com,gurudas.dev];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CA6ED671691

On 5/22/26 9:50 PM, Mukesh Ojha wrote:
> Point the SCM node at the minidump config slot in the always-on SRAM.
> Boot firmware reads this word before DDR is initialised on a warm reset
> to decide where to deliver the minidump.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

