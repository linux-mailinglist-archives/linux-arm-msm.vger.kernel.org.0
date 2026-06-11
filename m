Return-Path: <linux-arm-msm+bounces-112730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MRZqI6abKmoRtgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112730-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:27:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D670671509
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:27:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="Sg/dl8Cf";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Ob+zodsg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112730-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112730-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id CC49F3009F5A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:27:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07BE83E023A;
	Thu, 11 Jun 2026 11:27:31 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D809E3DA7EC
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:27:29 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781177250; cv=none; b=O/SOeBhFOzi/kBs0ZY748D/0wWgApIyBOs6KcOLPj/mBucUyQu7ocQ3rV0VIy6DlF7lbrbDVF/Tlf9rEp8O9SBaYZEQj4LxCl6QK7ym1H1d10oojk+Q2wAB2W9oTm+JbJgKPyVCUn0jLyCOUh/KPCatj9viPhL/YmtzTvDjYv7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781177250; c=relaxed/simple;
	bh=D1vttMUOCxgS8k3W32i9Sy4wDCvNW5OarMF4qqZbhLM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cD3ms/cPGeG1SvleroEN7N/nMvt/d/CvbzpoA+33ESlJA7DS3T7edNePtY7cqk3HHpwdsKMaiP71QKFBymwNtnI7/CB4L2WXOXQDhm8RJhIT93WF791KRa1t7DP+6JcZh/m3e7JEiuFrFmkxfL9pn2Eg0Afq3wC0VVJZxgyE1Oc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sg/dl8Cf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ob+zodsg; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xOAA2890798
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:27:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v0xd9hfOGsaWtfUYWuk6OyywseKClLK713g5AG71WD0=; b=Sg/dl8CfWRHzEir6
	Y10RSfzRycsFABVnelDS+RhEAQICmo3HJEHuldz+Kr8uYkUWpXULpF3JAgWnbpIY
	W/3e/w6HOwFufeX3dNMRfXJY1i3qFs27VAi+6I6/pHmGOCLHY0QJNM7PPPY5PwGA
	nUik2Mizf4WCinriED39TvF+oW2VdAxQLHKD/TJox32eHOHNw3adKv7biPm6BXSx
	VCURM3tpA1Zxkul6JoqzHeTRTzbcYYhk3d0GqzIR6ynPm5vBMamn5MM8Hq1KZlae
	Pm5BALXcQklWg+kkHboNCxYxXAa2mzQLwRZdl/KJ+xIzq3NZqoXo9kzwBBZ2Sk+q
	ydJwsQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe79k3q8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:27:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-517741bcc53so21211471cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:27:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781177248; x=1781782048; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v0xd9hfOGsaWtfUYWuk6OyywseKClLK713g5AG71WD0=;
        b=Ob+zodsgDcsgxGgDbJZoH9Vl37Tkjvs6hsj2hMyTn+jgPF2KJe5n7fbc224jMU9Oez
         XVPSsoRhOFe/rHFNwirYJ0AMyA0xXTkSpEkLZDl2ExQHlpUHRKHTVPpbJqqDsGExmJfO
         EFWGLmikll97du2D/TJyBII5SolnEmoIAtN7G3LK1mFbwxvZoHjgrEfJbaonh1eQHFFs
         oKFCOJIQ1FW/V6ZIdYPX3ScPrwZG/v1+ddtD1zdulKCLf9KD3y4M1uQJx5Why/dybRNd
         Lls9M8JXcIp1xWic5jHH5lVcuy67nEUjkhG9nL2J+ZrohcvKI85EwpHo0x7bSJYOkkHz
         eJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781177248; x=1781782048;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0xd9hfOGsaWtfUYWuk6OyywseKClLK713g5AG71WD0=;
        b=e+7EG6yFS9omeWOXWvx608Bm5gRqzPV71AePma/ABnkTkTgWLVIEMqhg4L+8vzwTvI
         92cjh5BF0mBd4emik33auW5M0DyM4k/MdJDtweyMe7fS+Tb9sW+PXjBG+1Cp8E/Q4UyS
         OyQ2W9R6qzw39tZt8C2nfpVt/XBpTlSYSGG6JamUQ5OfcGmosu+kgLcrT7lxm+5asmF9
         V7+PZ8IeTyt4bgvA55bjVtXPM1S0lOntRozkpAbzja97CAwCU9U6Pqo4C3NJ1VMx+QMi
         XaKzE92WFeZf5KYm8PvDMGbcjBdhbI3gK4Q6PcdM1mmt33Mrdz/nuVOw7af1tkKz/L7x
         rUWg==
X-Forwarded-Encrypted: i=1; AFNElJ8VU0EL9SOEGcykZuTWm6PO5pMQ97ipemE61//2fol3CmXSPcnMD8yX4FFx8UwyxWJclOZVBAjGMWc9W/zd@vger.kernel.org
X-Gm-Message-State: AOJu0YyRJp+q18dTf8CkcO+EpPd3s6F6n96saauUceu60quhyAImBNiV
	QtzulEPKwsXG9nTrQDatmFTA+yvaddsfxMvM3KjyTOJz8isHK6tooJnTqPTmtFu5FuVY7m48NsA
	RMxmRFY7XfR55aCigjBW6duii1FTIwtqq1mndRosz5eyT4AAyJaVAjbtNI8ctK1EfKfYk
X-Gm-Gg: Acq92OFTj96qRfYgxPIDq7xm4Q/N4KJKGhufa4oTCMBe3IeHGIUWJ7I1UBjfkxuN11h
	PL53x5U2l3IHFhm3P+VPJQFUwDANnYzK80aAu45GvB8L0cdUJFEORS2eaWyFMbZQ3dxjDmS+4hQ
	EnlyB+HRcyRdUgOMJhi9Ham7jW+TL9sl91OHU8zqjFBzrG39HhLi+1iPa4hKt9yTKgpUraj0zSZ
	kDj2Sn/pqk78vb3sJ5HDNnQ+9v+oXnavci1RvZ9mAGX/qS/HXvynZO05lSuWhwQ0UQQbg2ash0x
	rsH7l+wkYpNC7AT/KaqyZbIrPTmoQSeZI091pYafoSydlkfKwUQZMkinAgSCPCvEFGiq2F5qBuJ
	eca/nPwwAlqtosUenym41W7XX51bZDRE8wisPt8KadpG+7H5GklzUQ2fK
X-Received: by 2002:ac8:7f42:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-517ee2161c0mr24244731cf.5.1781177248088;
        Thu, 11 Jun 2026 04:27:28 -0700 (PDT)
X-Received: by 2002:ac8:7f42:0:b0:517:5d21:9899 with SMTP id d75a77b69052e-517ee2161c0mr24244311cf.5.1781177247470;
        Thu, 11 Jun 2026 04:27:27 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfd4024058dsm7715966b.38.2026.06.11.04.27.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:27:26 -0700 (PDT)
Message-ID: <191c4b05-7d66-4338-8321-ebc593379f73@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:27:23 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] clk: qcom: Add Audio Core clock controller support on
 Qualcomm Shikra SoC
To: Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260605-shikra-audiocorecc-v1-0-7ee6b5f2d928@oss.qualcomm.com>
 <20260605-shikra-audiocorecc-v1-3-7ee6b5f2d928@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260605-shikra-audiocorecc-v1-3-7ee6b5f2d928@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _tvuHYaIniRxlfWU25JD1-1ZaFadj9Cz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExNCBTYWx0ZWRfX/FQlrS3MS0Vr
 RO6k/sYn1FmszXtcFHAbzryy0RDqobX7jzeY4pThDALrETtFabLz4mVHZ+4q0hapU8oM6Val1nT
 6k8nhNcnAzm9GKZldZTeM6E6igRhyG9Qhiv3LnDmV2Mxk3HO0O7xhywEehnVQlMZdEViOOzO6SC
 iZyJggiO8x5srRTQMday2c72dmZSN71atZQqYd1AIh1a10d/MPifo9Xk+PBa9AhA6ZBRaTY2CfT
 2AGApk1O1Q0y2t6m1vB6YSrQH8r2KbLeEEULIIdLXfdg9HD+DaNM0NWqz8QKnnTkNxZwNxWMK/L
 62wCaEjm0jhL+ttsc9APAfZIbKoksUGDcvKDJKHn6Xtck1cxxsXXnjDg5vPz2CuSMDzRoTMUBrG
 SisiKiesEskmh+oqhQ7rsvr6742kbsZBn4GeLNOUKj6irWC3gsNOeGxufSbuGv0xFISAgwvJbk2
 F8qEnLX+wO3gzEv8vSg==
X-Proofpoint-GUID: _tvuHYaIniRxlfWU25JD1-1ZaFadj9Cz
X-Authority-Analysis: v=2.4 cv=fbydDUQF c=1 sm=1 tr=0 ts=6a2a9ba1 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3t_MHGgHUfuoA-dEAxsA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExNCBTYWx0ZWRfX3DaZ8OLoGKnu
 i70QDPBOc12MZAo4pBEqp8ygvGfg7aJ2T5RjCS36OAht543s50YKJtAzGiIK3Kv7XUKB8C25IwF
 +rm8G1otfruWSEQCnc2ROBEEh45Kj88=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606110114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112730-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS(0.00)[m:imran.shaik@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:p.zabel@pengutronix.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:ajit.pandey@oss.qualcomm.com,m:taniya.das@oss.qualcomm.com,m:jagadeesh.kona@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
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
X-Rspamd-Queue-Id: 5D670671509

On 6/5/26 1:26 PM, Imran Shaik wrote:
> Add support for Audio Core Clock Controller (AUDIOCORECC) on Qualcomm
> Shikra SoC. The  AUDIOCORECC clocks and resets support differs based on
> Audio subsystem enablement. In the CQM variant, both clocks and resets
> are required as Audio is on APPS, while in the CQS variant only reset
> control is required since Audio is handled on Modem. Handle these
> requirements using variant specific compatibles.
> 
> Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
> ---

[...]

> +static const struct qcom_reset_map audio_core_cc_shikra_resets[] = {
> +	[AUDIO_CORE_CSR_RX_SWR_CGCR] = { 0x1c },
> +	[AUDIO_CORE_CSR_TX_SWR_CGCR] = { 0x30 },

So these are not "real resets", but for the sake of existing art, we
can keep pretending they are

bit 1 is HW_CTL (1->hw controlled) and bit 0 is taken into account only
if 1 is cleared

existing drivers toggle the HW_CTRL bit (meaning it's an
maybe-on/surely-on switch rather than off/on).. do we need to rectify
that somehow?

Konrad

