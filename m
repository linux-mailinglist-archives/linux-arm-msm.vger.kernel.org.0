Return-Path: <linux-arm-msm+bounces-103536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CCXUEmE24mm13QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:32:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1386B41BAC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 15:32:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C285630270A6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Apr 2026 13:32:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 150D52DC78C;
	Fri, 17 Apr 2026 13:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d37InmBs";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E603tFxi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E72701E5B70
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776432731; cv=none; b=J0pj5PmFQqr3ClYop2P3AD8WJhnhz1yeC7ObIeBQpc65rTr7woZNR7AxcRzIdlxNeR4GhcIH3cgrf7G8o0fjg7TMXq6/nOVcKciZdMo/Q36jEHzJPsRfsLJvMX9GzvqKrYRaRtkpp/63xYM3yMLHVk2Mx1rrjk9iqDfkRMDkIqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776432731; c=relaxed/simple;
	bh=RFvWEcHs09Ac7BQ/P1ahsX/rY3bcE0CJB0jwJ6qDepU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fK7GHVO7Jh6C3V51RNk8nTNgRdBtK/yOTmMJ0f/fdhJQjHQ5Ef42mpbleqeS9i//iAS0pCcTFaNYhQL7tMJHYw0QJ8fzBBGwNqPAY0QoJGWUZgxCbX9BBvSN7UVx0cYbxkztF/A3virJUAhM3TYANQxFR4TBztKUUW032TfJrSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d37InmBs; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E603tFxi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63H7hskG1981958
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/evtMQvA7PUd4sSb8YH73FDCN+57LuBUVGM3HCz06NI=; b=d37InmBsPomDCzSM
	ZYZXfMvHTOTytDN1t+lwSMuU99e3aSTq1U7Ay0qJETDRPlEZXEhivd9f05Bflkn9
	EotbJBH60D7i6u+VIoWu/404y7iDQLdR+KKoEu62CDw2XwKdVE1lKC3anMlSsY16
	D8gy+UJwaTRNAzss0UdEg3zYdKIUuY1vP9Dqyisiiuc1xt0LJD866Y5eQtWPFiFC
	RNcDJiw7Y321zOTskc9TukPKqRCIbEzrA0yewDLqp14ADJfdlsUYHjajXIKXlWfk
	gJjw5pYRemmKQ2dAjJ6HOm+ERi7TkkOlfxKMWRfYyyAMpE4IT+T4bLx4ooPofYy9
	pP7Y5w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dk52jkh1h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 13:32:08 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82ce34a78edso833039b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Apr 2026 06:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776432728; x=1777037528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/evtMQvA7PUd4sSb8YH73FDCN+57LuBUVGM3HCz06NI=;
        b=E603tFxikMSp9hnNnl5YMGR1ua428BD3FQM7M9J292C6jp68jlx9JoRG8uPcffR1Pz
         UizhG/HVoyBU+tmGzjs1OGp5v8h9+WMoMucL225R8vbu0LAj9Y4YGT8Pr0IqBw1ZoKYE
         XznV/CGRmsS6dM4MXQTNxMVVeLb+W2fxMt1P8IgCPqqQj8BVgpQNii0tzXotz1nwtLja
         dZcrVzKCAwoxwAeZcBHhPvbkvjuy2vbyjlFdDVzFQVUyeEkw7lP3zMaDDZ0UmW5p1y2h
         JsgcNBAvMutVrpxP2iMD0pUEUOH24sL5CYE/gHVLymKb22SgAA2YZRqsDXBYxXgM4yT9
         cg/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776432728; x=1777037528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/evtMQvA7PUd4sSb8YH73FDCN+57LuBUVGM3HCz06NI=;
        b=M3qXKpORuDSfeCJqU5lF1ynCiR+QmfaJu9cIDx8luRqS8YcfzNrHybUxit2M1wt14k
         BXHS/sUVtvHj3udMoitLgQREIuyriEOEG5JrbntWfFqeXjP89pr2AU3WeGLHnbd4Wauz
         BeYL8flNHPSeW3cxYo2XoYvnFp+cxM8BjmH9sMIuOUzFUP6Ca4P6ZvdpY/xFIKTbDbFZ
         BDWeUbiwHD4dh1PlPHHsPd148RDkV8ns6bg4KHpCcnDkrn1W28LjzVTpz9eogKUvApeU
         EGAKW8jfW6Ovdx7uzHDXQsJTxwdL7yKEe6+kVbgEnmjsS7jT6Fg4yi1C6S/4nhY/O37Q
         4+wA==
X-Gm-Message-State: AOJu0YwxBcu8i3WmL8CyNZIJlgLFW2t8lqJVOvHWl9Y4Rs2iUgGnIvqq
	HU3U0/nKEBnV2DVUv8wj3ugJMi6l4UR/g27yZT4CZiR2rRWalJ1xFpjo4hQ/44kIu5hsnLEdlQs
	/T8N3hDAC1Drn/PcxTjxK/sAjZKyGp+z+MeBBk+dAwXxbm7I5rU3gPO1GFb7Dinl81zkk
X-Gm-Gg: AeBDiesmnTLD60JBSwFRlSxVOmw8TH61yv/LWY1YVp6UDu6m/uR5C2A135JFzRMp/ad
	dPr2UROEgUov4uc0uOVWMuYX1LJEuErfKp8B/KTmVLQfaImhE/JJogRqNVVtb+3GtDbJsiLnsGf
	0UbLwxGK36PoOX5Ia0uw5+YNlvzw/FHorlYTAd1aMzjrEkQc30zhq/+nbU7txTH4kDvZ4gYb/FO
	RILcJMyGvQ/6A2LPPo9Z+UdM5xSgrzGcGNToiZD/3eU9iS/S9H1ppBeFkHWpMzWOyOil4+TT4xA
	D4RSw14gm0Id3AgIOVDquMxgVRX3hAh3ymzhlaTV/V6hgif4AJ2XAnNBCH1BICfrB5y7Vd3BKeH
	42puJj5U2GI+9/JdLCn6MgKKReKcxJ53JQf9ek4+c4CKDZANdTwyz31P4G4H/sA==
X-Received: by 2002:a05:6a00:3498:b0:82c:20be:57e6 with SMTP id d2e1a72fcca58-82f8c81273emr3064755b3a.11.1776432728129;
        Fri, 17 Apr 2026 06:32:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:3498:b0:82c:20be:57e6 with SMTP id d2e1a72fcca58-82f8c81273emr3064679b3a.11.1776432727437;
        Fri, 17 Apr 2026 06:32:07 -0700 (PDT)
Received: from [10.217.223.121] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e984f20sm2306640b3a.8.2026.04.17.06.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2026 06:32:06 -0700 (PDT)
Message-ID: <a2f1112b-86c3-46ac-9520-bf49a399a98c@oss.qualcomm.com>
Date: Fri, 17 Apr 2026 19:02:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/5] ufs: host: Add ICE clock scaling during UFS clock
 changes
To: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson
 <ulf.hansson@linaro.org>,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Rob Herring
 <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-scsi@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260409-enable-ice-clock-scaling-v8-0-ca1129798606@oss.qualcomm.com>
 <20260409-enable-ice-clock-scaling-v8-2-ca1129798606@oss.qualcomm.com>
Content-Language: en-US
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
In-Reply-To: <20260409-enable-ice-clock-scaling-v8-2-ca1129798606@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=buR8wkai c=1 sm=1 tr=0 ts=69e23658 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=moC-RjrLiBHrLYWkWSAA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: LdCjsIHadwBPPLV7kJN2NdZ6Bs2JynwT
X-Proofpoint-ORIG-GUID: LdCjsIHadwBPPLV7kJN2NdZ6Bs2JynwT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE3MDEzNiBTYWx0ZWRfX06POkLrH0vW7
 vY2s2kLE/lyfN8dHuL2eRG09ZVKn35v/E9RwCeQqsM0abRtCU6G0UN6ZujWg/pRF7plZTVzQzc1
 IL81sM6j5LRYm02hJArCoVBdok1GsYqli+/+iQj8DsiLBnDjnO3dDUJDVfBotiraqTmLxy4gftY
 g7afjMuzpKsLDhsm8LefTZDoEq/4ulqdveS+baP1/CLsRuIh2U+L+TPWCqzdjEJKltIOKJ6JGWt
 DAGA9b5WplajXF0GDaRQq0fs9tOkopbejT42Oid5WSdEp+YuJxW/xvb49OlZ6S61UZaakNj9rN4
 zUnkdwb5DQIFbaNYiauLb/FHdKCl4mMSiYKqA794C06ifa7A2KTgxY/w2giYhhL49hKyzGxUpvg
 EU2Vt8IKxT+JRpZdhW5PHWUDB2N3NRpde/r1Yuuc+NwV9puvW1qjbdbwTXBbrHBhM8F1Cg1wOzL
 1kxvfMadQ5WmzM48LgQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-17_01,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604170136
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103536-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harshal.dev@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 1386B41BAC4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 4/9/2026 5:14 PM, Abhinaba Rakshit wrote:
> Implement ICE (Inline Crypto Engine) clock scaling in sync with
> UFS controller clock scaling. This ensures that the ICE operates at
> an appropriate frequency when the UFS clocks are scaled up or down,
> improving performance and maintaining stability for crypto operations.
> 
> For scale_up operation ensure to pass ~round_ceil (round_floor)
> and vice-versa for scale_down operations.
> 
> Incase of OPP scaling is not supported by ICE, ensure to not prevent
> devfreq for UFS, as ICE OPP-table is optional.
> 
> Acked-by: Manivannan Sadhasivam <mani@kernel.org>
> Signed-off-by: Abhinaba Rakshit <abhinaba.rakshit@oss.qualcomm.com>
> ---
Whoops, I mistakenly replied to v7 of this patch with a Reviewed-by, please
ignore that one.

Reviewed-by: Harshal Dev <harshal.dev@oss.qualcomm.com>

Regards,
Harshal

