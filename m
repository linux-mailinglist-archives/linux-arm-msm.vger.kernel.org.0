Return-Path: <linux-arm-msm+bounces-94915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MDt0EfSGpWkeDAYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:47:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A17AF1D9075
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Mar 2026 13:47:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2757F303EC32
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2026 12:42:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2491374730;
	Mon,  2 Mar 2026 12:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jCWUvjnN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kj5bXwMJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A70C9375AA9
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Mar 2026 12:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772455324; cv=none; b=Rx5U5ecDB4GgZfHUaz3cJcfg6SIx2EilXfTwwS23YBEhiUg66VT63050Psibh0xo/zDv7nvd2sNyLbymlIgajQcQq82PpttFDfRdNz0HabNZltb+X5k/aXjGNa6r9tC/aAWgfyhbbKxDiZK12pbfVsJsn7nGGiWFmPzSbrsbuu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772455324; c=relaxed/simple;
	bh=ie5EnBWr7bMeAiWqY2lxn0rZNQt8qHlQPi31wYLpdmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pm4k3Hz4lB5yG/65cVPylCgE5jJch1Y7vgEUoQi0x7I0tk8c/lBbYhRXaZCm3TrumEk2Li6iBqh/KkL6zu2aVeO+bILJUIoOinwH3Bz18HNd4Y5TcXOVmc2xsj0cRh56nGYrsYbNUC4H3TRVwde9a1JNJiyAg4ZHUx+CiW3KIt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jCWUvjnN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kj5bXwMJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6227JGX72358125
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Mar 2026 12:42:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0TwXGsbXnf1mwta9roKukARuNf4bIgiX9Ha2j3oj6v8=; b=jCWUvjnNbVAQqVUW
	EfzMfNrWNT7zRacazyuGZu/NuOb1JvvT4UijK4TMDpxE7s6KsI7MpGjJ1dhjk1+J
	/7/R5z2CaWkvnaZSMIw6xHAYNWMCaI/j5B502358eOK23oZsL61VL/S0ttKQm8k3
	lgP8lxMGl3yjTxANglUfs7mucbZ+Ev6C4cyeZc4PFd+uZzzMlabiI+x1T3Zw0VGt
	NblgQYhM9IvFEKWqhVvdJncOWQYB7/lEmHAkJrX88ph+ps43F7buXHTd+vJOlx2k
	i7udYL56BKna+r1VeM3JhxeeaCsBAHmPty/cq6SkleadrKwbjQ4SnoC+YAgF3WF0
	Tg7Bvg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cmgbauc7k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 12:42:02 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb456d53a5so430283885a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Mar 2026 04:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772455322; x=1773060122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0TwXGsbXnf1mwta9roKukARuNf4bIgiX9Ha2j3oj6v8=;
        b=kj5bXwMJZXVUsTW1yWTATOd/CuCqq/5acMzoyfx73Ml7tB/Q6fLkT/Tjhu+4+3urI2
         aih27H7f5XdTWEBdXEpvLpmMLq1IuUwT9EWQidehEgUlzKax7xD7Hj9oZOgHgvyTDDkl
         PFUJsvN58d6RKsLKSfKhrjgcY0Z4g4bgGyqQMEyNqlAGVc9aVMPxQHSrmXNCJZZzYU0J
         VCYooN8IhwvuD2xi1s1YuBMSuD4laim7N2FFjEQFVePWvjtyNfGaVTBhihEH2F0oEj2+
         oXTuqAy0NPBArfOcOSv4YfIiW4var0tWbAVURzvNwp7KX8bcyHHYP+kBWUPPSC8Ku/7k
         5qTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772455322; x=1773060122;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0TwXGsbXnf1mwta9roKukARuNf4bIgiX9Ha2j3oj6v8=;
        b=kWWDiNZEZ/BS8Rs6LAHii4qTUn3NVqYHhW8Xv8nIc+bptyXU6e9i7B3Zn6CCPJ/N9G
         QBKHLvd+NYPAQdyNv+ufVg+j/sJ30ylJMAjq08PmS21KJeKRRU43Bqu6/jJAtOy2TcDJ
         47Uhm7lwjCin7AEufYlkyfbDX82r3sc77LA7r+rN4V7F2KaaQpkXBnO3XoNwau1q/nzS
         5EeHrNjGB7KsyH4Ty6kE5zsGNtYcbVRHUtcbuzMWRwxMjH21Lncub/7sxLjK1BUbQVBp
         QFrO2/3LTwI6psfCq0SBzHurkU7gs4mpkls4Ld495NXJCHH4xsiht9ELb6AKSqE56RXl
         1vZA==
X-Gm-Message-State: AOJu0YxBJJTPeN5livknJvGvMJZH/7rtSThUvx1/aZkbaofyI7u6vOqH
	/34E//YH1NeXy5Qq0NGatdKOQOshrjNvsX6OSRy78h06ksjH89xrduIBFjT4k0L7oHTd9gMDnNb
	HsakkZ8wLB58SBeW1ESeB5aoOpz+gh4LNbCwWqKFxT5skfUn6imqDBT6bFFstuczYE5oe
X-Gm-Gg: ATEYQzyRiMdvUCQj0zcH/ptMCdHY1LQrvIwfgwzg+Jrayq77830J9yQkbN5iGWMCSib
	u0WlpprQiLuBg4FJj/nAjpivFlsrTR5QlsOcjqUc7qvxHOJX35gjZZbzwgPBlIqRn0oAv7lyhW1
	5wzcblEqlf0KMSKCIFDlxQmYhXazH5hVYnOAoV7NG7OrL6e2G+U4UNlDncpFR0LWjLCF+qZz+xQ
	LHUmgQ/JRueNc6Zjvc2KcTNMnPbzKmX/F73sfluCEYBt9G10jiiabZahuXAfXnPwX4OZBRZgjp9
	h38Xij6u0uW82CS0EHaKlFVJm9miGcLDz9xP6TNKyfp3tLOvhmsu3dxmLEARqGwc4ywIbziHRZ3
	bXJivTTPJeHjhxe7BPSMakHvai1GOYAJGOqIZfan00n5jXTaxRFzhKCllL+kIqvGvB+8Ld6QOml
	F+KQw=
X-Received: by 2002:a05:620a:1a1f:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cbc8f3bc1dmr1129518485a.8.1772455321850;
        Mon, 02 Mar 2026 04:42:01 -0800 (PST)
X-Received: by 2002:a05:620a:1a1f:b0:8cb:4059:a90c with SMTP id af79cd13be357-8cbc8f3bc1dmr1129515385a.8.1772455321392;
        Mon, 02 Mar 2026 04:42:01 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65fabd467d1sm3438066a12.10.2026.03.02.04.41.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 04:42:00 -0800 (PST)
Message-ID: <0b1dba75-b701-4966-b39f-ff62d3400b66@oss.qualcomm.com>
Date: Mon, 2 Mar 2026 13:41:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] drm/msm/dpu: drop VBIF id, base and name from the
 catalog
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov
 <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260227-drop-vbif-nrt-v1-0-2b97d0438182@oss.qualcomm.com>
 <20260227-drop-vbif-nrt-v1-4-2b97d0438182@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260227-drop-vbif-nrt-v1-4-2b97d0438182@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAyMDEwNiBTYWx0ZWRfXxTC1MFJB7fa7
 VSs79DKP/7w7/r/MZaRvPnNBe+rK84GCF9qCWhY2o0UDY1Yqr/dSbg9fvgQ8V1Z4C8B5xNhAcI8
 kddDH7pePKGetpLAkz+A3+tFNexBRuPK38bTvG7cNGwQ5BaIGIrMAqcBe6XOUUKB0gDqS72smRE
 CTBL8izftWQipsspFabkP/orGnaR75Po5WhxS6dGqH0r04AzSZjO4agpwixdS+vkUVJADhgaWbp
 cy3D0p4l5ISLr7xtBcxPDwW0BsJoGMCE697LjPvIzjRNSbJA6sGza8PwINcHTg4cVcH8fRNgUnP
 b4cYdr73ExveBid43DRpXruac7QgfLHww9Zrohu3GsksVQRkRGM3raARzDSFn4radtk8a36bPc5
 N+7qYK91TEeLFnhmViiIrcmiHfoSBFTh5QW/2uun4dG4jzhqqKQ43FEMYx8L+ezVwpWVockl0fk
 kJENqWwDFIQxjBSWrbQ==
X-Authority-Analysis: v=2.4 cv=QfVrf8bv c=1 sm=1 tr=0 ts=69a5859a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=-mdkBzqSqWWIJJC9AIcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: MiTXiLdtAMlve9Jf_IG5O94YYqih_-wE
X-Proofpoint-GUID: MiTXiLdtAMlve9Jf_IG5O94YYqih_-wE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_03,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015
 adultscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603020106
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-94915-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A17AF1D9075
X-Rspamd-Action: no action

On 2/27/26 7:36 PM, Dmitry Baryshkov wrote:
> For all the platforms VBIF id is VBIF_RT, the name and base are also
> fixed. Drop those fields from the catalog.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

