Return-Path: <linux-arm-msm+bounces-118217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yEeZI2PAUGox4gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:50:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B4373942D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 11:50:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=EzljRyu9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=SFJNpLHB;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118217-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118217-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E4863301EB5D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 09:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FDCC3F823E;
	Fri, 10 Jul 2026 09:50:00 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5D63D7D66
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:49:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783677000; cv=none; b=RwXK9qzC8qVte+c/5S89BDfG9QxfpkhD3WkVhy1t6GLtZaUst71WyYF2EL5jZYKVXar09//Cs5SjRNT4Gw3rE4doNFYXQTU9naReX9v0t+v64V6SBcDMfRr2Z6jSZJjk8W3AyjVqNBBk6nmAmDGUDkH8uMlrG6MRytmMZhGhLgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783677000; c=relaxed/simple;
	bh=RhxJbcpXgBSaUpK/h1HSni04pNwZDP8EkgCuXeGlEIo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LMG24e8raKPev2B46/PT5tHzoztGeiU0gGUMXbOdfwGNOmua1I1S9SxRIDyHR+rUZUW+Cx0/RPVnAckEHlY2Q36s37RbyWky7Va9mS+FAI0+2L6Y4xm3cyTkZMwyv07yy26vLA+dHFvTaKfhxEWT3yP4oichf2rHjpfiMN0HOPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EzljRyu9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SFJNpLHB; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66A7dLM8172311
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:49:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ACdAIoPvTw7MJeEGWQ5gQrAGBBm4PKCR94WLrVheI3E=; b=EzljRyu9CKZgoWSZ
	9zKxxekBkvBCOONa3+P1NI0uyR8++doKqAeNC5kNco7k9ru0twSsNkhxUf2bjcKx
	zkJrdfwnuzvJEUxjnqRg+40VsEOMTJ5fbkGcba6Hxmv/4z8k9/iGxV18bZhuvh8X
	AfAiFcxzZZxG/QroPJPIgERYD4Pp2WR2fAIlr0iyEbu7SQaYdma3RxJWyV6CASfj
	9SH50yrTlETaFgnrz8fKsWbhO72bdBclhUWk4nijCHdMyMj1pagwu+42CsfO4hWl
	VXK/oBhAthqIRb8bjKO1it9KBfxtawLUD9ImCEjIbvWV1ywseMqi+YSicvvx3+FB
	/ihVUg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fanwe9wbd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 09:49:58 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-903694fd3bfso405906d6.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 02:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783676997; x=1784281797; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACdAIoPvTw7MJeEGWQ5gQrAGBBm4PKCR94WLrVheI3E=;
        b=SFJNpLHBMiig3eTZxuZ4TqkX1WAEkkthXAGzDFMjpaKUCxvm3gYauF2wa+DK3HFYPr
         DDN7KzxcsxR/TQ2IolKiUGwu187rwtPObXEfG3KXSC4k2avXkjFktmIr0ng88KsIeIIn
         qAywFRT317M6f4ko0ZzfnQiTd1zntDJufgp+KRewhxr3NmGoW0RcgdJwuo7eRhnYhaVp
         C8LVey+1UJWvaxgNNHyZ1GbOwdFJc7z91qfB2Ugq0cCIYsz1gQNUJhESnXOrvy24HkPF
         ii7xB2yNap9RynjW+NrCF+rPiDHo6ekGw7MO+Sk0c++SWE+xJFModAaVrOTNHfaZk8lc
         PqZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783676997; x=1784281797;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ACdAIoPvTw7MJeEGWQ5gQrAGBBm4PKCR94WLrVheI3E=;
        b=nf2TCOx2aBygysTcZ85fqyhElb3s92kBdBQxt8KpVpKx7r/viSEbYd2rbi2Szer4V1
         vCCU0L1mEaBJi0EySw6hITzLRWYgRZnVJmE2Fa0eVTvKk4+VMv73DuF7Swhpx89eGpyn
         Vs/oSAVa3QwB74dTM6E3oky7kreE4MAwGTuXcoQbDjidSyGpgx1zUkSl6rUOLs8qXser
         R8stppHUutnnFoeCKE/ovz+g46Ck6CbIKzl7kYO/xYfJw0AhUnkH0N2HyB/eNPt5pEA2
         63AI5F8HpU+DYzq46Mydl2r1To279z7uwwjuAozZy09zuwnYTKx2eigVay+6Ri8ykNuR
         sCEQ==
X-Gm-Message-State: AOJu0YxjjXTyBr3YelxilzO/T9f2sZGGmWcjtNenUNdoQnZEM7+ZKWo3
	Th8xKK+52jb5PAm4TZA/aRvF5F90QKOlayRpM5JLqP/y6Zf6doXLTe5Ha38OFvnB9hUN4YQf4HV
	66HiYwHoL3hc4Itct6f0USXTNnaWcitI7oWZbTYbgr7uHxRczy8nZZzXxMSFtum2j1cgm
X-Gm-Gg: AfdE7cmDEuWruOxdGxOaGauJkDKiCxtK//0iZQWjJumAJpL2TgmGhGvxm1bEkT5Ig8R
	v2rFPNQ3MvyTBO6dD4B/he/sCZxGZ8hFGC/U+cRe2//b0UnqdLcGeBW3AvQXCZFsqTRaQV9xoNJ
	FQku+N0zLAK+PAgOAtrQJt5lbfARvkXASbegcglw7lEY5QOGYNmVzkeWxJjJK9M3fOQZdzL3Ztp
	NLsw6K+7uO9fBCchIorpbfxZ+OLoMkxO4Z/iiwzm9oQgdC0wvaDcagNUiF9ctKBEjf5SVxSQRjj
	oxf+Le3eKjwCotenEzszJQCyXIiw9+t2Gcic0yN8Gxp1g53vuivf6z2kf8IdCSLbOAI+ilBlbi8
	/z7lHfWxlS8V3vX8aRYfPlQFWHbUiP91qlZI=
X-Received: by 2002:a05:6214:27c6:b0:8fd:c3a0:3276 with SMTP id 6a1803df08f44-8fec8afd64bmr91167696d6.10.1783676997303;
        Fri, 10 Jul 2026 02:49:57 -0700 (PDT)
X-Received: by 2002:a05:6214:27c6:b0:8fd:c3a0:3276 with SMTP id 6a1803df08f44-8fec8afd64bmr91167556d6.10.1783676996924;
        Fri, 10 Jul 2026 02:49:56 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19ce4b4fsm10518512a12.10.2026.07.10.02.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 02:49:55 -0700 (PDT)
Message-ID: <298bd947-6957-4a04-afb3-a6394f05a506@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 11:49:52 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/5] arm64: dts: qcom: kaanapali: bind traceNoC on the
 platform bus
To: Jie Gan <jie.gan@oss.qualcomm.com>,
        Bjorn Andersson
 <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>,
        Leo Yan <leo.yan@arm.com>,
        Yuanfang Zhang <yuanfang.zhang@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
References: <20260710-fix-tracenoc-probe-issue-v6-0-41eb36fef8d9@oss.qualcomm.com>
 <20260710-fix-tracenoc-probe-issue-v6-3-41eb36fef8d9@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-fix-tracenoc-probe-issue-v6-3-41eb36fef8d9@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=LbIMLDfi c=1 sm=1 tr=0 ts=6a50c046 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=gkVCdKvAZl3yu2NoW_gA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDA5NiBTYWx0ZWRfXwdtnJJp9RV/k
 Jc8p8GSGGbzlSgv6J7MXj7XQWb/rANfHKW5fHZcmvWtDb7VPq7qLT29KF2CR3FpfKDVDS7mghp/
 fKYR3Bl9BMA6qgpaJBecwvQuAWp76DYtAZrLaKU0GytA+qPjMeH2IRO8U+4FjZH9a+z9UtlLgeV
 A8DsirlcXcPgdtDcLcINZW06mdMjOXnkUl1SSBTvrVN0qv5RSZojMAKe7nBverMkpOk/zGiJuWS
 kUeamZ7ROV27ZDNb6coAY5eNCF2GNKW3B5dVQ3ukTi3ika7YkIJE6OB5nx+6JJrIcBgz5zHHlRw
 btnePm0oejymDgUt+VP5lcOJZfXcffTRev1n06VZpr+eUDLkQqML4u/9jwTrJt+xA0yZlDS60dh
 RANDrmmqhnI70Z8/L92oTXoo5VEnx4tVoykxnnNMx1FknHvF4AavWS8PgJO59qNgTsRx/iBylUR
 pK84TOJyOg478LG6rJA==
X-Proofpoint-ORIG-GUID: _1eLZug0nBnByjWT6p_iSa4t8UtgVoJB
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDA5NiBTYWx0ZWRfX0vkSiwSOYnrH
 UGuKM+DS8g3d8TzbSwvvtsf65A7rnWhGAdb9/5aZ1yZ2mhsqePTXEYld/TezNGwpUKFiysSdaFy
 swP6WbOPV5blRPBCqVgATU3n5/hBvhc=
X-Proofpoint-GUID: _1eLZug0nBnByjWT6p_iSa4t8UtgVoJB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_02,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100096
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-118217-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_RECIPIENTS(0.00)[m:jie.gan@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tingwei.zhang@oss.qualcomm.com,m:jingyi.wang@oss.qualcomm.com,m:abel.vesa@oss.qualcomm.com,m:suzuki.poulose@arm.com,m:mike.leach@arm.com,m:james.clark@linaro.org,m:leo.yan@arm.com,m:yuanfang.zhang@oss.qualcomm.com,m:abelvesa@kernel.org,m:alexander.shishkin@linux.intel.com,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:coresight@lists.linaro.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
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
X-Rspamd-Queue-Id: 01B4373942D

On 7/10/26 4:39 AM, Jie Gan wrote:
> The traceNoC node used the "qcom,coresight-tnoc", "arm,primecell"
> compatible, which places the device on the AMBA bus. To bind an AMBA
> device, the bus reads the peripheral and component ID registers (PID/CID)
> at the top of the device's register block and matches them against the
> primecell ID. The traceNoC exposes the CID registers, but the Component ID
> value returned by the hardware is 0x00000000 instead of a valid AMBA
> Component ID, so the match never succeeds, the AMBA probe fails, and the
> device is left stuck in deferred probe indefinitely.
> 
> Drop the "arm,primecell" entry and use the standalone "qcom,coresight-tnoc"
> compatible, which binds via the platform driver by compatible string and
> does not rely on the component ID register at all. This lets the device
> probe on hardware that does not return a valid CID, while remaining an
> Aggregator TNOC that retains ATID functionality.
> 
> Fixes: f73959d86c15 ("arm64: dts: qcom: kaanapali: add coresight nodes")
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

