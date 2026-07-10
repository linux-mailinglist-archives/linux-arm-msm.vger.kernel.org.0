Return-Path: <linux-arm-msm+bounces-118303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RTZ8GqT3UGq09AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118303-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:46:12 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id F194473B623
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:46:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DY5Nmv4+;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=PLKAPKU8;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118303-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118303-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A82AA30277AB
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:45:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 35A9B245008;
	Fri, 10 Jul 2026 13:45:38 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69FA923E342
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:45:36 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691138; cv=none; b=ZIFbpRFZ3hsc7pgvFfo3V7F7zLaPL7S08A/duSmxf5DJVpL+kcHl1Wi3K1u0eFDj3MFsCp1pU3x5fSUKxwqJ8v2SibUMzKZjDdISrOg41HC0f/KswR6ujcR1/TrwceNAHBAnifaq6CnkHqmhOVzrdRmxAb5Dgc5hszgMW4b5eVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691138; c=relaxed/simple;
	bh=249hh1NXnkkrZXHaprMDjBSQruPO7owm+3gJ+27AxHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N401SLoc+tb/stwBzJRVZvMXAGTt9EMDHK7BEzmd7PJhjLf+b/nohyGtT3jeBxS+ztWhXsX9MtzkgILPE6buqcywVnU+vGicz6RfMQvXDldpXxJqR83uYWflWnKujtJxlqL2SEE3XolKI6ZVW6oWAjKOINP5aKi5elmA9cA53L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DY5Nmv4+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PLKAPKU8; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6Z7U700696
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3//0QFRPIjtK8tbhBTvpIX1B2oEir1n7dydnERdcIQo=; b=DY5Nmv4+aciJFDO0
	DRLw3Kei39IgnoFL57xzIiXIPXSDL+q/NJEkoPKnfodvN4aQb0hPY7h0Ix6vT1JY
	CNGTyrE5UI+aqRvTtK9XmtoPzv03Hr9nwGWfWenxzKCrhiAg2KVRHFCKY9QJZTuF
	uqnLFJAxd3+OwTvurAzsMawJ2rG5YxLH43hvbabD4od4r45qXcHfWw/5NeijJlH/
	nh2dpwasTrx5B/cWdyzmSteW5cGEXBLXlE+l8pJ3fOqhbpceZtoDnAMn2djvIhzq
	6qxSmmYtZp6MtVzCRUezk/jxsiT/1chCB4LV/mPoZYGo0utBtm+lkf1LWWILc8qS
	mLppLQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fahv8kjdj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:45:35 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e6cb57d25so29913385a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691135; x=1784295935; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3//0QFRPIjtK8tbhBTvpIX1B2oEir1n7dydnERdcIQo=;
        b=PLKAPKU8znZVZnyOH1i4zARQSuHjg5uwBf71TalAkzx9b3AAkrm3Wpa8wPAHk0oBeA
         WC+/F1IJv0D7WQ5+xBQ6rCAZpkMHfenuDvNfuWV9wEtXTd6wye5jGsw/lIToHSI1Tf0N
         +ZchtlNJP85O7fg6vre8BMnQnwny58KTwLqWdY2Z6Ni7YQj6Z/KUw8caLpstJL+rM5j5
         9ZzlWRg+cdIhDCFyZlX9quTszr89s9yttnz9YjIsx6tKU/jtA4S6xjQmJK5w2glV7x6a
         J4Bdja7q1FlhEqs/+AbQZP1P0pcScN+IonUzawH1v44jN61OlR1hBV4oyZgpPx09bzkI
         QY/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691135; x=1784295935;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3//0QFRPIjtK8tbhBTvpIX1B2oEir1n7dydnERdcIQo=;
        b=f4N7GzmHtV8ED1cZ9t1HBLeCjevFM8HcjmWvJlAfrzrFdk4m/1uyzQfoNvByANwp7f
         hdx6uRQR+/v2Pdr7/K8JIXmm8DXTT4UC4nOVbbhc2DBSM14RRyDxzvMe6Y1Iy8AeJoHs
         AAL0vE3wFHSQjXTYh0ebtxDTkJv84vT4SonPrcibBCmU7hKM/5Hz8e/+O3LBNHL6WbXY
         1kDZV9fOAJ0FfqNWd+PlnodEQavqeExfpeAoYLLSba/bCgHB4clFCZBp4TsIaGP7FVk+
         arhjG+gvFJ14jvHvn0Cpqee4AQXAV/vL6HdSNOK9YUNoY+pJ2W+RKdIsWRSN9Sj0B6it
         27Vw==
X-Forwarded-Encrypted: i=1; AHgh+Rrv2vUBl5N+QclkNKkwmSBuBkYzkbzSHQgHlb5Z/vpdsvHF+WPQpeG2W+8zWVYs/I1yWDto6LD5QtzQNMM8@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3kuhQRtR3EExfFGHRmWL94h36jWmgdLSJU5dYlObg9NEO4Axe
	UneHHik78IgdKt2Z2Xi4Myo72CR3LZdM8whNhi7Sa8wwm7OUP3sa7pA3alSpk/uOt6NQ8zfjF/Z
	hqf9TMG7IfVssEhIK5YIJiJs3wpPmz3JPbW/SYBcHEFaGo7Ki28fasBy1h4gSlHlDBNs+5d3iKI
	YB
X-Gm-Gg: AfdE7cnueOR4AYvtZKDGtLNfz6YeX/HS+qJxgZAh4Z416jwL34taOLjZpPgMUvEppUG
	eNP8V6Un6Su8zEH3Dg8wmNx/c+62I4SLryuz9Ns9HseXvfrTlk8SGsTVRDQNAVzI2mbLOlEyQJq
	jRF+1wXlBoTV/ghKnxSoKHepuHtPtwmSfPZ6VIAX7k4h7lz5hDcOs8ZYgjhrbpSwptE0KALDg1X
	e8UpvM/MYHU+lywU7dUN1IZdsxRSpCjsbW6jcFsz60q50ylAWwzC+gsBaJtr+7EA0HVOqkMd8Wk
	bqzZg742dzT1pgOGF8FZCAKUzngKsefxQeCEeThdaUXqTC1RFVxd6p62zGqhnsdmkhVpy/HhfDV
	TAXB4kAQoir3T/ztAto0qNCG/nLKe6AYu6D0=
X-Received: by 2002:a05:620a:2b8c:b0:92a:d10e:bde3 with SMTP id af79cd13be357-92ed79e2ba1mr693513585a.3.1783691134718;
        Fri, 10 Jul 2026 06:45:34 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8c:b0:92a:d10e:bde3 with SMTP id af79cd13be357-92ed79e2ba1mr693509685a.3.1783691134272;
        Fri, 10 Jul 2026 06:45:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15cfac0f76sm429862766b.33.2026.07.10.06.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:45:33 -0700 (PDT)
Message-ID: <05aedb9f-c57d-424b-8cc6-19c3af768459@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:45:30 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: milos: add CPU OPP table with DDR &
 L3 bandwidths
To: Luca Weiss <luca.weiss@fairphone.com>, Georgi Djakov <djakov@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260710-milos-cpu-opp-v1-0-ae7f4b09bc77@fairphone.com>
 <20260710-milos-cpu-opp-v1-4-ae7f4b09bc77@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-milos-cpu-opp-v1-4-ae7f4b09bc77@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: INiL7f-4ptM9-s9umF-BG4x-YYoNaMi_
X-Proofpoint-ORIG-GUID: INiL7f-4ptM9-s9umF-BG4x-YYoNaMi_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX8CTg1Bopv6kJ
 l4eS6Y53JUOz9cbpXE7qq8oq3U8dBdP4/hhvsmCPuEYoYazNhbSdN7b9qhKuttawCTPLFyiweV5
 G2X/FTfv2v+qux1ZSD2AcQr4B9vSVUE=
X-Authority-Analysis: v=2.4 cv=funsol4f c=1 sm=1 tr=0 ts=6a50f77f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=3I2yIiQ9ViMUFdqIhFsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfXwvVUgwUImctK
 ANnHOhVIQj9+4eN5CtXab8mvrCKbwUxgtuPLYkjQDd0jX7oLgCUo1J0x/G5YODN3wljR1KM5yvK
 idPfQiUwb0xlU43NznrOeMSCPJGl+z6C2/a70Kv4od7uChJOd+5WCJSInggSL0zKnCSItpd26VY
 0pWL+5ZMfHQPQceCFsn/JTLFl8MnkR0/MvR4pL4rJ5lvxFs0POlWudvKYGNtRJjUOVlUaq7FQyq
 SKKpApyD0VjBd/DIOVUyYHoNhlHJbpM4kE7xihNg6YdcSmyINtUQfQY8dPVZrxNgIrlACdq4bU+
 KZESq3IgK6xdc+Qxgp+/AiKAGQUjVlwu6HAWhxzpoLqJmmtv63sawBdYIM1O8BkL+1AoEA4e6ZR
 fkAwJWs9CUob7ccdX3EGaKQfsBWrjZn/JJjk6lfaR/6AoUXegL9MDgDwcYz16CYHSIyIeFw20d6
 82jNDKqMAa6Yk4jl/6A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100136
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
	TAGGED_FROM(0.00)[bounces-118303-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,fairphone.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:luca.weiss@fairphone.com,m:djakov@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:sibi.sankar@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:akoskovich@pm.me,m:~postmarketos/upstreaming@lists.sr.ht,m:phone-devel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
X-Rspamd-Queue-Id: F194473B623

On 7/10/26 11:22 AM, Luca Weiss wrote:
> Add the OPP tables for each CPU clusters (cpu0-3, cpu4-6 & cpu7) to
> permit scaling the DDR and L3 cache frequency by aggregating bandwidth
> requests of all CPU core with reference to the current OPP they are
> configured in by the LMH/EPSS hardware.
> 
> The effect is a proper caches & DDR frequency scaling when CPU cores
> change frequency.
> 
> The OPP tables were built using the downstream memlat ddr & l3 tables
> for each cluster type with the actual EPSS cpufreq LUT tables from
> running devices. Note, that higher frequencies than SM7635 are available
> on QCS6690, those have been added here as far as possible but may not be
> fully complete. Additional OPPs may need to be added for that SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


