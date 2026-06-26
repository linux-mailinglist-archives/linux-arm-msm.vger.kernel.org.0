Return-Path: <linux-arm-msm+bounces-114698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gQjkIKKiPmqnJQkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 18:02:42 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 301606CEBFE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 18:02:42 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KKEuMsf9;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=TfOIbGW4;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114698-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114698-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2F9C330156E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Jun 2026 16:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AC6C3E2AD1;
	Fri, 26 Jun 2026 16:02:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C10B3FB043
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 16:02:24 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782489748; cv=none; b=or0Bf+nstLYaR85eDD9cGtD5SkZ1PLXy/vhP5zxHLxdXPHEnxzlXtoQ5KQkwx5yVlqOb91dNfcs6fiujDObr57ynJYySzlKNmHeEOlUmE2k9ACZcSxy6f4UPGk7vk8IrzqMgeFp6aKu4l0v23vVnaddqtR+YAEBrq+OXX+kh60Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782489748; c=relaxed/simple;
	bh=2BHq0ZpZPgr/aASBBER4Fs0G/mk5+MJZRV/nm6HNQ4Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AqSaKYhNOr2NiFqOun97xwjqJPmpWoYHjRqfaPeUAB+RpO1gqI67EmQ9ivCotH3pklBqoM/83OX8aKLEUrPp24lkaorhlHb/e6K+fAYT6GqCeZjkn4KPnNHKtjDro18Ichq2uZ5PCOExXbHfEyCEgnlI1BNyZ/mxvidTvabeLjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KKEuMsf9; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TfOIbGW4; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QFj2Se1558533
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 16:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CmxH5NbLE/rXyQzlMnYcKPc9Kofnqwuz4x4CSgwry48=; b=KKEuMsf9mVgDGShF
	LUVu8O/VGaujnOGc32HcH9nnIs61S53Z7PnOToPKk8X30DPSphuYHRf9PaSjSau8
	E2B91rapHMtAXsvIKbNseK4SJov3VMPe10BecmHEIFcFsifIEszqPBFVjJAex1sa
	vtwS9G3Uf+fQ59slpixRcWrdlSKMJZcNnHosn5edgMgvdUYtdgNmdNchu9FtQEpE
	gDbrUh/IA2tLgGhky4mQjI7WbXTpRb/ICPLPxGKc187V6C+xksgU5g2cQgjPk4YM
	NGJ1K6gfmDTmoENQg8AURtu3jk+lCLn35b10B0xE1KDzExmXDMFS+2IUEEpZp8CX
	5FCQUA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1eeqbgg1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 16:02:23 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-72845b7072aso52974137.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 26 Jun 2026 09:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782489743; x=1783094543; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CmxH5NbLE/rXyQzlMnYcKPc9Kofnqwuz4x4CSgwry48=;
        b=TfOIbGW4DlSe5v5K4tou6o2kUQMQ+hhV8MIkmwHTXW0Ehn7u75paBIdOtlIYa21CKO
         dXvsahNatyCvUg0+J07I1gPDW3NrHE48kpkLflxz+7cEwt7JqvX6yODEbhhS/6Pr9igJ
         DmLJmJLQZR4/UQVgMbHVH2gvYF6USgeqHlULmzKlVCHGOP2tGKT/jh3AnpT2v5wFIFHv
         KSN8FDPY8b0tC7Dud7ER1NGKTe31Tz0a+FSmmAI16ma28OG+IdrBcKsMl0ZEevJTIVUS
         L9d4hF/iIT64A/f9E3THc0jdo9iSchCP1SxhCt5cc4J4w1gZia2gg4DgDNdF7UtZjKgg
         rU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782489743; x=1783094543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CmxH5NbLE/rXyQzlMnYcKPc9Kofnqwuz4x4CSgwry48=;
        b=LPAqH62YLxMsCGIbJBGFm6cNxnNGeCGszNbT/QGxa+1EiK+yjpq3n/IeqJo9v6UArE
         TfCtN70/hoHUqbbb35MXzYTrpFDLqFk/d+Gru8CjheP/PVrypP7ZeFk7X5/YVK8sR4mx
         lZMGi/17/VPrGl5JUSzmHMc1EDusiPoKLGFNHL6F1FP12X7PvheSNUKjFJSNczatb+aA
         DlKMVI+TzoM04czx8d3P/bU9RiDKSmeJI1OBUlpr2x5ffNw7lqt9EaQN99DVBP31DbKU
         y1G5hXbg84xwBrnXVi4jGzZcOPgnE7ESL6PQk17+lN7O0mJf2IhFkXRPgpjHhDgW1NZR
         vZ3w==
X-Forwarded-Encrypted: i=1; AHgh+Rqp6WHcvtHAv9UbF/djXSEwDpA5MNT4EQfkWnF0w3qAGsdISR039qR9J139boJpa9I8q41fKE6+9Qk7dSVg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz72++aOCAV1ERs9DtwNHiy1Ea3WFBF6HYwTo+bi5AqUdia3+bA
	jMnMajIEGVYIG2oWuJUQS/Z/6or8/ZQUu6bhy/NM9mEyydUp/0KbnxCVQmtc3jhSe3lb4VVY67a
	z9bPIXfqwAB/164DuaH0yyIt/klrF3vIflOWD4n4XgSxQd0f8AmlmbqV7vn+GfRvFHFBT
X-Gm-Gg: AfdE7cmVxSQCmNtVx485sSaJ6tjSr1tubZeu+uq5G9hlyrcdrXopWR6UqVJvX9ooTKL
	r/meZYllyikGSKva1H/2BCojp0xUeJ4qS+wugyKC8vHwT8E7XuuVCi5X3bSx16VCkg7xBxS9nIq
	SbLg8fNUUHCHUw5fmeA5VMkXkk/L7T9trfQ/yoMEwYWekl8hvI5d59QoJldRMEmXSVquuKKtQQr
	dImYnT0uvO3xdTMd2O/ssx762HhutoaIIcHkgauoHHwdwzB4MVt0PSYu5azjW7fR6YAEJYZKXzS
	I56xrSSM/ON6YOa7SkfIdgyIik7fhZsT4/FnDYAMLEMAvTKIvIMsfjFFuo0Jlbg57Z1jBN4fzte
	H9SwStXgNIzuLqARHL3pXXeHjG8elGxMWkRI=
X-Received: by 2002:a05:6102:cc9:b0:71e:1551:183a with SMTP id ada2fe7eead31-7343761785amr1584154137.8.1782489738061;
        Fri, 26 Jun 2026 09:02:18 -0700 (PDT)
X-Received: by 2002:a05:6102:cc9:b0:71e:1551:183a with SMTP id ada2fe7eead31-7343761785amr1584063137.8.1782489737454;
        Fri, 26 Jun 2026 09:02:17 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-697f46e15besm3077659a12.15.2026.06.26.09.02.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 09:02:15 -0700 (PDT)
Message-ID: <d4641613-dcf0-4437-9aaf-dede83afe04b@oss.qualcomm.com>
Date: Fri, 26 Jun 2026 18:02:12 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/3] arm64: dts: qcom: kodiak: Enable 4-lane DP via QMP
 Combo PHY
To: Doug Anderson <dianders@chromium.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mahadevan P <mahap@qti.qualcomm.com>, Stephen Boyd <sboyd@kernel.org>
References: <20260429-kodiak_v2-v2-0-c3a703cc30eb@oss.qualcomm.com>
 <ag_QL5DIo7MxsdYU@baldur>
 <84ed2c32-16d0-4c29-a06a-9242eeb8e86e@oss.qualcomm.com>
 <CAD=FV=XQH3kng7MV=Jr=HmZQc4TEUCq+V3TsLNChr5vUHUtXAg@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAD=FV=XQH3kng7MV=Jr=HmZQc4TEUCq+V3TsLNChr5vUHUtXAg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDEzMiBTYWx0ZWRfX2OsQASgv4Nf/
 sIhYe3jt2a83uZzvmQEG22sPnInHk8JjKSemmoznqItFCcZ5Dw1n37kTkl31SHxzri1OvoFeGx3
 MFsgNt0vnYkJBdJNujoH8GbiWrdxeCP/t6c4PRqVx3nBwvLQHxW5kzqpZdYM/iPPKxhygYSu/HL
 UMVP4+kWMnQW/vlGMgGiQhn/Nia6HL2yO8qydBwxE3IGsIjs8Ictdh3kX45meqjby2erqtiasfH
 9lBMJae4o8RZ2Eq7lVFDgBKnrAl+M6rA8D2fBkpOsfVx03EhgUALMpC4xqln31ZXyF5Q8cJBceJ
 2pnCe6qnYl6w1jPawyNaBh51wPGHQ/TYjkybM2J2szU2uAIWGev0k4DH3UROTrL1JMs+HcCMysg
 R+e9WNgRzqTbTi7Ly76eBxMm3VFFen+vQQaYSnlCdhLQrJUrZE8/jSIN2mhuW2A1hd6Xyg5MhqI
 mcQFXBxv1rKErbeB8OA==
X-Proofpoint-ORIG-GUID: GVWNGaRLZrrcdjLg50qTjJ6tlpgIgTNs
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDEzMiBTYWx0ZWRfX9TI53MoVXlPl
 6unlZT3WRnXgKRm4ITOg0wZ3lMa9F+4DJbMslOyJ6fAJW8qG5hU7Pjk4NF1Xinyg9L1fAT1tNst
 hMXBBcVVtGStcXtv9YpOAk3WqEdIu90=
X-Proofpoint-GUID: GVWNGaRLZrrcdjLg50qTjJ6tlpgIgTNs
X-Authority-Analysis: v=2.4 cv=MLpQXsZl c=1 sm=1 tr=0 ts=6a3ea28f cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=WhMr71GatuKG99ydhcMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_04,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 clxscore=1015 suspectscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260132
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114698-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:dianders@chromium.org,m:andersson@kernel.org,m:mahadevan.p@oss.qualcomm.com,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:mahap@qti.qualcomm.com,m:sboyd@kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 301606CEBFE

On 6/22/26 12:11 AM, Doug Anderson wrote:
> Hi,
> 
> On Fri, Jun 19, 2026 at 8:34 AM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:

[...]


>>>
>>> Are you sure that herobrine has 4 lanes routed on the PCB?
>>
>> +Doug any chance you still have schematics for that old boy?
>>
>> Bjorn, perhaps we could switch to a model where we define the max
>> capabilities (i.e. 4-lane 8.1 GHz link) in the SoC DTs and only limit
>> them as necessary? Not meeting these is borderline a board defect anyway
> 
> Bleh, I'd forgotten what a pain it was to look at herobrine schematics
> with the whole qcard "abstraction".
> 
> My memory and a quick glance at schematics makes me say that herobrine
> only has 2 lanes of DP. The problem is that this SoC really wasn't
> designed with a laptop in mind. I seem to remember there only being
> one USB 3 port and it is muxed with two of the DP lanes (since the SoC
> is designed to drive a single Type-C port). In order to support all of
> the ports that a laptop should have, you pretty much need to feed that
> one USB 3 port into a USB hub and hardcode the DP to always use two
> lanes.
> 
> The two DP lanes then go to a mux where they can be routed either
> towards the left Type C port or the right Type C port.
> 
> In terms of whether we can support the 8.1 GHz link speed, I remember
> much debate during the project, but I don't recall all the details. I
> think the discussion was that we were supposed to support the higher
> speeds, but we had to disable them because they weren't working. From
> my fuzzy memory, it was unclear whether the problem was known to be
> hardware or software related. I can try to dig deeper if it's
> relevant.

If anyone still has herobrine easily accessible, I guess a smoke test
with a high res display and this:

diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
index 5c5e4f1dd221..a39e418fdabb 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine.dtsi
@@ -464,7 +464,7 @@ &mdss_dp {
 
 &mdss_dp_out {
        data-lanes = <0 1>;
-       link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000>;
+       link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
 };
 
 /* NVMe drive, enabled on a per-board basis */

would be the quickest way to confirm that. Although we can just leave
it as-is if it's problematic.. I think you said there's some folks that
still use it a couple years ago

Konrad

