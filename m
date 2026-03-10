Return-Path: <linux-arm-msm+bounces-96673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2OB/MAItsGlHgwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96673-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:38:58 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D31022522FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 15:38:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1903B33E8E3F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:33:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEF09366823;
	Tue, 10 Mar 2026 13:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NZsN9zYB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hXoXl8cA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 857B331A046
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773149188; cv=none; b=rydmaEBCRsniCaHeDh14NYcqrL3q1ISROvt2a8fSQOSA0EKZmkLyeywUqZx85rN+v1R5MQp1AIlEr/rNStjPnJWUD0MqZMAStcTyi7D0QnuMuaWrH2NQEXBE0OSkGqe4NQsMbg+4IgoOT8aF1b+3tC0xWunkV/9V/jy9FIKZ1Ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773149188; c=relaxed/simple;
	bh=U+HgIi4bJzREOY5i1XwMWYogQDNt8n9oOlbmK5Ejb+s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I96169BnVe0eO5Ek/4GQ6fyTkevA1ZXE9x74x7kTsqTHb+xOqdZqP5Uy6Jy8zJSvxexZ38bwSbWZSF8I+KLdcahDqqyWK9zx+XLRR3iELD3r06kvO4yTzT9p2fEZmlXk7pqVUMLW9IZgKf3f6WLWNDQVDV5n0sthOaf4g7smj2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NZsN9zYB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hXoXl8cA; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaVf13295792
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fOq2Sthvh4Jkm+waeh6Yl1P98rOJ8ij0I8Bo+iSm8iM=; b=NZsN9zYBKfmBq6k0
	3e4yIzAYCoQJK9NRoN4/f6hpQVMIOyW9zUsz1bxf9r1hhghdEIU9Cbeyseo6RVx9
	U1Z7KpiOtZKg8px/sDrqkbBTrCmDxaaqNoUlD6ZVw7bG1yXx9QwXbN9Ra7PF4KGg
	mzxc3O6+6sND8uCtubLmoHgNtXlxlx2yajoYa70yFXhGgyMi5XNqcWn6iKFVtcMW
	p4oTG/QoXlrAplSXlfy2hGi2ekcjz85UTIrx4b0UJV6Z4qwFGO0O/7fA22hAxwsp
	6PdKXQUvL6u84lrl3G3ULp7uW9srLfHQgSWM77atv1mMlqQhD6ZEyEruyaV+i8kQ
	EhymXg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1ms1tk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:26:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cd8198fe16so182084985a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773149186; x=1773753986; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fOq2Sthvh4Jkm+waeh6Yl1P98rOJ8ij0I8Bo+iSm8iM=;
        b=hXoXl8cA1uNx3ank/bG2jzzRRl1nZa3fPtJwMGtDIvsOXg2vUMtMCgEwQ00HKuYd2Q
         VU1OCKG0nEv8w+1nd2kIYbaDvhiL0WQmO4rQSNovAKUSNjDSv8Ec4lEQmwSzRPVyw7ik
         i16OFDLQh4VKJFiU3llk4dM0ZZI5lTPVOJeNwklBlgunIHk1M48+zkxyajSVVjtLRLly
         HKpUN2y9pGc7h2sTStWIICllK582MhM4Xr/HzD8XV4bnTnQRsH7pLRNTHJuA3XKiVC6E
         d3PUjzBDgQorRwgu3vfBNq16Ahnox3ek9msO9BNix7/mw4OmeW+DsKf9aOzRB4wR4Rx4
         ZYnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773149186; x=1773753986;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fOq2Sthvh4Jkm+waeh6Yl1P98rOJ8ij0I8Bo+iSm8iM=;
        b=Kutwz7MjEZc/QLkEPDv7tH3YKWeSaSZrLdqY3I4VFNgfPSbBo+ttNrPVLv+/HTHqoN
         86nEFQiXxajUqtgZoRPXJo8pX9NCGZO6hHp1q/CDGOKAAR0mDZBQ0Owp2jlS4ZG+pr3b
         DjvXM+i+VuFjY8cZYR5YBEg587f/k7cZHtWanbyvimVFJIrTbujYEH0qwuCvKiVlkS8U
         nZrYJM6kX4S1WtePyUV+4xNlwLjbi2fp/BTb1nUBoCY9CQB+yRdvdsvE+7Roj4yKDdjW
         fzlmklLB/puP65F0JGgOh1kbL36ssbqzyJHv4Sn5VXDJZrcQoMHW5+YJK9D5cZ64vwJf
         2/hQ==
X-Gm-Message-State: AOJu0YwXCrDjD9FqG5WDM+a1yCc0FHN3wUvafE4Qr9gXYEdITdUAt1qN
	WjlxZBdCNe491IlIEjPzUjFj9O0bglYhAfPS1N4NwmUNkTHEdKLelnTqFYq2MomsTae9xhVie8U
	Ny+IeK9lZjC5QpClQFBpkYEcKi+JE2ZxjMeEuGKoJM5S44tXrTKxaLr6GhFKfgrr9hrmtZgFA/c
	L6
X-Gm-Gg: ATEYQzxV8L+GwzUDV98lWokgZxUwO5xTwQtoqNMZx9qVedyr0jhO7CobsdOywaPGL65
	Gd3bZgBfTV5N0Ev5qfdfdSzp2hbktIXG7zko97emUNCpwk5RSOhXKi3aztHgy2FkBh8Zr0ODRYL
	x4P/vqbApPQg4QzMGdh/vlNnMOdL+l+C1td/Zg8nZjItdnKOMbq4YIbvfhl0bCd0ctvMpJ1SezF
	CoJ/4IDizbrs3yhEBSmHsmv+3ieOv3Nv44qpra2hngmvzrb7fY2tUm3kc9JDKUCmEkBQYxDPJyM
	JqWv85xgGNHPrD3Gq7vurjwSeHMnfqf4Ml8aqK/0UvYR8kCrqdOyfuQJLwzMNikNQU4r3RJOtiL
	Q1TDz+TlGjCFy0dXSJ8qIdxshcXqJKbvN9KbhB2aG3ujABjkZvGQqQSJHE6vTDlVw1D7jN/J4Iz
	Z2ljc=
X-Received: by 2002:a05:620a:2955:b0:8cd:8411:a5cb with SMTP id af79cd13be357-8cd8411a9c3mr799715485a.3.1773149185718;
        Tue, 10 Mar 2026 06:26:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2955:b0:8cd:8411:a5cb with SMTP id af79cd13be357-8cd8411a9c3mr799710685a.3.1773149185155;
        Tue, 10 Mar 2026 06:26:25 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-661a3f5ed41sm4208787a12.14.2026.03.10.06.26.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:26:23 -0700 (PDT)
Message-ID: <d6609992-e319-4758-a24b-688259b473b4@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:26:20 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] clk: qcom: rpmh: Add support for Fillmore rpmh clocks
To: Aelin Reidel <aelin@mainlining.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@mainlining.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20260308-fillmore-clks-v1-0-976d9a6bebe7@mainlining.org>
 <20260308-fillmore-clks-v1-4-976d9a6bebe7@mainlining.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260308-fillmore-clks-v1-4-976d9a6bebe7@mainlining.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b01c02 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=OuZLqq7tAAAA:8 a=EUspDBNiAAAA:8 a=PNJmjveSQSdRINGQNJ8A:9 a=QEXdDO2ut3YA:10
 a=KpimXkPlJ-4A:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=AKGiAy9iJ-JzxKVHQNES:22
X-Proofpoint-ORIG-GUID: UVzsWXQJok-r0-uh150y0ShUOofg29ae
X-Proofpoint-GUID: UVzsWXQJok-r0-uh150y0ShUOofg29ae
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNyBTYWx0ZWRfX1b+oaCiDhKtf
 SmMFpL77MCvUCo3J4pPwQA4k9qF6/PWdqmsVyrluuPDJ6gT9JhzR4tcvQkTP7RvoFbudHyXlqUj
 V8Rze6uyZwan9//UgeL1fRyjXJwiokmPWsy5Lz0b+/mf34Sx6djEw1WP3VnFF2jMgpuXp7g4Og5
 gCQ1yM0uFRXF2aYfphI6OmVr5aeO9Dk8O/n+k3QNh4HSP+80y/29u/r8qbo98cLeMr4i1wmQhIw
 zlZmg3XfSJu+frAGBI1Sj9c3oN5TVtUAaB9yQDMnA9grm0DUWIsQ3I8TOLKxyWKZrlV6XQbIDQy
 Wp0rMpePj7lCTqNzOiAAOGbvFM3HcJgLLgjL8N3PRMDbi4ZBAo2JWQPevnPQ3LV0ZWMAjfYL/yH
 35opiL8yP7VJ4G+CAooC8oShEpHDV6eWRfqesLpFH8iqzaiMo9/TNcEJ3GYUgIIfGkggUEA3VVz
 M2dFjc9kmYRYS9BztAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100117
X-Rspamd-Queue-Id: D31022522FE
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-96673-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,mainlining.org:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On 3/8/26 1:39 AM, Aelin Reidel wrote:
> Add RPMH clock support for the Fillmore SoC to allow enabling/disabling of
> clocks.
> 
> Signed-off-by: Aelin Reidel <aelin@mainlining.org>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

