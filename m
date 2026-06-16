Return-Path: <linux-arm-msm+bounces-113383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id b+fvIwoxMWqIdgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113383-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:18:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAB4C68EBB5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 13:18:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Lseo6HLi;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="hDkncOs/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113383-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113383-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9CAEB320AEC2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 11:13:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35436436374;
	Tue, 16 Jun 2026 11:13:41 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BA8436352
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:13:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781608421; cv=none; b=uDvw0T/Z3Gc8THrz9t4X69FYJ1hwBUbfK+H7huqsCCXYdTH9OlE+EDcUVBTI1tWydWegFdLh/25x+FcWIf0Wo9jTrOp/aHDFDOp6vQCqmEHE2r9ZU9F8TuqzPrx77f3Lm9tEkgXpLnr/YdIKKghH24P6yf80PEp1iM65UtUtzOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781608421; c=relaxed/simple;
	bh=55ncl2+pNbNqu+wEL/BWAxYJSg/Eb/jmWeFv/fJjbr8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qgt4Knjho+64EEi8ol+NTBP4Wz1bvVGqKQ4thTQNqHzPABXaMDFaaRB44CqMLL3+NTdhDTGOIIU3QA/8l8imZyeFjI6/IIWzYiD8biTSkKpJzFDIbxJtMddyL8ThPWjtaJVt+EFEWk9neNWqhHA3BbEvQZ21hzaVM9+634j2P4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lseo6HLi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hDkncOs/; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GA9LCq1414438
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iSr8MoasSHBE8JNNqOM36HV9oQteT/dMFprDB+IKzdo=; b=Lseo6HLiLxDnepYo
	dStkJc6pCcLu+CuV9IburIB/oYCviQbeg6XIMCB9Dha/QS2e7h5rFC0Pcf+2S5qk
	nx3SaNtkhNDJOMwygLHnkv6JUqYo0wdYyXWsQ/4pYD/1LupBk5mqVUl/VMcIK8YS
	Ne20mjXBBY4Qbyi02BqJnd281ILMo3q9I54yKddglu8+ad8pSpLKVCQr7iJvttNW
	E1CppnylcPShLDUgnOAQuxJ9QtJB/dyzGhOMJ03YXdFfKEMxt6fGPt1vjcPTf/Uz
	in/LD8J64uyZiKCDAFYM1LJs8lTEh9uohm5XZ+5kIHQkDgKlHmASHq25ImLKS/Cj
	1uxndg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu3ct0j3j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 11:13:39 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5176891d0a9so10852691cf.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 04:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781608418; x=1782213218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iSr8MoasSHBE8JNNqOM36HV9oQteT/dMFprDB+IKzdo=;
        b=hDkncOs//ouCDfkQmpBjeKez7HD+KBqszxB/5Pv1/0QYXBPO0Kws4l805m1XiYeA0S
         XD35WchftmCtjxCGWmeHanVE62+HvdijG35mpVHkLq15r5wF9dqMsemAUd+OVfBN59lx
         exaK1d1SGWE9ZomqNEfxCjhVRtO6s5yrEfOKN58FUNlLuL5bf7DiLXM5ovwv2xJwrJJN
         hkTGAMTZdRcoH4KIg4M9fynGr5ckH6nLyruB3ZryB4kb0xatwiYtvb9kdNMsEnvuYYSK
         5jJYS89+dSauhDm2iR6sm1Tvp77qSvxqaFRllh71WMG3aMHXDonEr06yt9mKo8ZGfs6b
         +6EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781608418; x=1782213218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iSr8MoasSHBE8JNNqOM36HV9oQteT/dMFprDB+IKzdo=;
        b=oPH9eSZuM8ef2iGYC61VTgw3U6xUpcnpq+IKBkv4tM6bhhPbk/Lwtd/PjqGwNGKic2
         k940QhvQqJLbkWMteeKIZDnoFHLk4sB2YqGcmywQOyJc8Vn8KOz5D5q5qUeIpW7hlczE
         4gZKyNYv6kP7KuQ0PzLYRW/rd94TsEMYe20P/ALacBtcC17s/lo7eVoiU+l2QvrOCNch
         yxVzihFgAY5KLm+MyujD5YSfQFyotcZM8DHoqhEuWzyETe5S5nW4YKZY9gTvJI4ixI0k
         VDR4MTjrARwmc2Ze5OI0zbWUO7y4PRkcA5JNaFfS57ZJEvoA8Z6WmxhPyh4ixprVEln9
         QUsA==
X-Gm-Message-State: AOJu0Yxfu+MnKO22gAbB2Dunlov7/OXm9ywanR1t5UC6Kr+r4ymx6hnK
	T3HeGKzqknksJfj6fwlRuqf1zk1E3vKi25c4lYOrfVXbp3b+LxkklUIjbS4N4vx474uiZBEdqGZ
	uYNgqK62KvMCCwxKZ4KTqWz50kcMs0stCB/SHf+d4CUSvpXE4DM7VmpWA7KaoAMjp4vaC
X-Gm-Gg: Acq92OEN62ste95r9n3DNhnNcOTvXqb6L59mWOGZj4s6m85dX/AWLE3kniAmReEqA0B
	rEGUlYknRkIz1Fk94e4kE2CODfejfBxGnzensdU4I4IyGBn3I5BhixdG2u/5Y4Ah8wkP7xkN9Du
	pK4iE9i95zc2VosPr2/dE9XM3IGNaQq/7a4RUOeUnOgHEWRI+NpFA8GWwB/EEfCV2OOxax4R1hj
	U1hsr18w8WhSxCFieHPu8T8GD46saMInVOboATrNmKURsCoQoEoGg967R7MBlO+KgDIiQnkLTwy
	PM/D5H+nbjLzonO8ByUOgsgU9Z03PiqMWJm7xKFi5lbSzn4u5jVGsS+G+KYd7YKlH+zfdFDx+C2
	WpeG+BDO3lrny+DbN0f+T8q21qjYCNNS1lz5mBg6VJVuGAQ==
X-Received: by 2002:a05:620a:458d:b0:915:769d:56e with SMTP id af79cd13be357-9161bab4498mr1747054285a.1.1781608418331;
        Tue, 16 Jun 2026 04:13:38 -0700 (PDT)
X-Received: by 2002:a05:620a:458d:b0:915:769d:56e with SMTP id af79cd13be357-9161bab4498mr1747051785a.1.1781608417897;
        Tue, 16 Jun 2026 04:13:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb7b6dbbcsm648217766b.32.2026.06.16.04.13.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 04:13:36 -0700 (PDT)
Message-ID: <12b8d20e-06a3-45c3-a02f-bde79f31e8ef@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 13:13:34 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: qcom: qcs615-ride: fix sdhc_2 vqmmc-supply
 for UHS-I mode
To: monish.chunara@oss.qualcomm.com, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
        ulf.hansson@linaro.org, nitin.rawat@oss.qualcomm.com,
        pradeep.pragallapati@oss.qualcomm.com, komal.bajaj@oss.qualcomm.com,
        jsodhapa@qti.qualcomm.com
References: <20260522105020.3588377-1-mchunara@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260522105020.3588377-1-mchunara@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SoCgLvO0 c=1 sm=1 tr=0 ts=6a312fe3 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=6BLkkuY0k0j_y3qHMkoA:9 a=QEXdDO2ut3YA:10 a=zgiPjhLxNE0A:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: I36wnMTlWJJIxZTdFhwMrS2TItG0Ka14
X-Proofpoint-ORIG-GUID: I36wnMTlWJJIxZTdFhwMrS2TItG0Ka14
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDExNCBTYWx0ZWRfX282vvkstJKR4
 5emiW3HMn6jRM0w4MWKtcgOTiN+ExfH5hLF0CxbIk8gzz4hbyQoYbj/BquPG0u27PkqBoBa6YM5
 SgaHj51qDCDwixGBJEgBD1BweKRGj+CF4PSaog+hCX6SBzSFjW5ySD5BbhvGBVVoBcan+OimIZT
 ZFQ8Zve5wBNQ3LgHAKctwzGC8GbXEtqdAG/4Iutv5vzqIiHDuiztH79vDgaBe/uiUWXahsNwXTa
 VsFKBrUff9xOEefb/DrNod4z8l8Aq92VoX49EqJSBBpgFwJ0v1iCw8vVuRV2mkXCoosLoI9vNsd
 HT2mUF1KeMxPXuqREpKO6QCzE5jpyn/yIGjZFwOASrDmzd94VrMZpnlxncxB477ra/eRh/aB7hr
 cSRdUluS/+dLB3pc2iEwQm84OfioCU69Y0TncIV8UzwUtV0dARMgbJJ0QI/ZioSXtQZR70mv34o
 cnKOtXTAb+OqaWwOlVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDExNCBTYWx0ZWRfX+EEvYn8f83O6
 SntN6gF6lXrcPgtXqeYLH5uUoPNTWDsd1xyfsgPvqZ3YFtrht0EgsJlfWhYm2NSi0kXQawdRly/
 zLBvhxrj7CVrORjPX6GQZWlisalG1h4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_03,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606040000
 definitions=main-2606160114
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:monish.chunara@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mmc@vger.kernel.org,m:ulf.hansson@linaro.org,m:nitin.rawat@oss.qualcomm.com,m:pradeep.pragallapati@oss.qualcomm.com,m:komal.bajaj@oss.qualcomm.com,m:jsodhapa@qti.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113383-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	RCPT_COUNT_TWELVE(0.00)[15];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: EAB4C68EBB5

On 5/22/26 12:50 PM, monish.chunara@oss.qualcomm.com wrote:
> From: Monish Chunara <monish.chunara@oss.qualcomm.com>
> 
> SD card is detected as SDHS instead of UHS-I because sdhc_2 was
> configured with vreg_s4a as vqmmc-supply, which cannot switch
> between 1.8V and 3.3V.
> 
> Switch vqmmc-supply to vreg_l2a and update its voltage range to
> 1800000-2960000 uV to enable proper UHS-I signaling.

The way the commit message is worded almost makes it sound like
switching the supply in DT rewires the hardware power grid.. 

anyway

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

