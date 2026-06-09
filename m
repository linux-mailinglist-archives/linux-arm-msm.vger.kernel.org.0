Return-Path: <linux-arm-msm+bounces-112003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id P2rrFDalJ2pq0AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112003-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 07:31:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B6B65C71F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 07:31:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=R5g2Zn17;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=N03X6fBy;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112003-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112003-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DFCB2302EE8E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 05:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 936FB3C37A9;
	Tue,  9 Jun 2026 05:31:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B87031328C
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 05:31:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780983082; cv=none; b=LRAmOZOqITSq7bARq/Qhjre6AFYYqdJRGBNzjlTu8vFL9PwMNw63lnj0+6bwfege+gA6R/lKVyBhhMffzTDG3uHUGjTRFfMjM3bfvLmis/+vcxzi/7Dw0CWoGZ5Qxmn+Btthr/0luiyVvykoerzVdpU0xqPs6DpfctEdjxQMM5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780983082; c=relaxed/simple;
	bh=KB/F9zDbox24hmdWEaQuHt/vKthh6m4mspjIl71ZAgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sls7nFW20Zikb0FcCSPgEK4csnXnjcdi7L7PxPfs4+/DsWut7oFzaozK6nzxskVSCrP2rMc64PHaEZvhDpPQy0vQInFMDVCBHVVu0ixQvBMgbEhj5TAba7+MYFUJ8H7sCUyOlbmlpczZJD8/+s5cXY8ncBVaKRcGhq231HaeNMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R5g2Zn17; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N03X6fBy; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wXPi1064824
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 05:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4LF1VQg+B3yECiehrezXZMdAUPZ1sckx1lxRd/0Ktqk=; b=R5g2Zn17BMf/dfCB
	wLNowjpepKdcHO3r78m5TqQ9iysPlXLeqG1KYzJNv/ktzpvQRcfmzZWMhpNALB2O
	/2ugLPdCyxD74AKJIO6gtYmtjQaRboJNXLqYSNRBrVXs3KBdK/3szdfS+bWdchIn
	zQkALgZHiS7a3PBPN0ofQcz7R2UunnbPpc4lsh3Dun7sP9RRjDMCAZBe+VLe6XV/
	l1z0k4KM1VBcm9Hqj3J0nZPeKrSwuzGJK+QVMGmIm7YeBEebWHjA61cT/UiC/cFm
	KcL3Ip50dkvDbaHs96JunqISC0bzbRo3fweNGB2K90Mhe1yAr0MLyEnKoOzxv/Yb
	XNItAA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enw5m455j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 05:31:19 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2bf1845bddfso61675065ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 22:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780983079; x=1781587879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4LF1VQg+B3yECiehrezXZMdAUPZ1sckx1lxRd/0Ktqk=;
        b=N03X6fByVH6nuZuooYC0hIe3m1hSbAUg+RatCqZn8SIU2GeCbzdEHDHh/ESG1CKph4
         DhbhO71T0Wrf3xasUcnJYNXfHj96gyRjD/rPcF55Te9QEHWxDbWZIaWBb96k/4TJ5P50
         oAQjHGnKp3LV6BukXGKLfbDYOVWuyvcQKo5RvMJ9dUu51ZWB1BOOF9i3C7tcxY1hUisj
         QL2vhSgcmoJAnNcdgW/ydPEgGfihc2qpi8F4Sdu/5fnG5diaQ752Dq012BYOSdjgwJ3t
         qkC3dpVhVpgFMz6AA/uaYE+DZpRZ+W+m/mS2kQK8eCR32yFDEpzkzQ2uxhbg7kuvjD0w
         ebTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780983079; x=1781587879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4LF1VQg+B3yECiehrezXZMdAUPZ1sckx1lxRd/0Ktqk=;
        b=JWKHhKCIkF3t4rUFw78N8x4GqXs5sLe452D50YEfcRZKd3xB5wYLTsJKSvarLRXqxJ
         p8TL5OQex6o2ZhuxHqa3xFXe8bQ1bzz7o89gxsyo97SV1eB5f8h9tIHglbh5pF2bI29K
         IDhZPPxZ3HG1hDWmF0Zai3JAkSI7BNcliC5+bn8r4i8f526GRrcYbuYlr6oQdwFRNDre
         kqCzyivqs4ruTF3YgThgrD3eMhpvbz+Z+K24CdkWxhoKQ900HkfSZ4TGQm62ePcOfNJ/
         /GsMNf/I++Pe+FLBsSdSIdrRma5kGtwFii6J8WUdq4cBGH6TeAozOPLa2IcvlkPtT9MZ
         16Kw==
X-Forwarded-Encrypted: i=1; AFNElJ+dyiIAULt361veJQRURR6PneFsLpT2aRioUkceaaHM4eqNoOI0iaxHKvaQqUP61QFepE/wasYlTkrDn73+@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+tZfj1tHjnbwz8JtCwlm++iSweK0qn2Cprw6LKtnCYQBQXXeZ
	RR2QnoQubdXMz1LFqHXs4TRqJlusxNczlIt8ubBuDOeuAX8WYb3I3HhY/vgjBUSs6EWmOSHZCBy
	Y72f6amOS92nZWcTlsTeZyGCPH8llKjY8XlfEwU0pDTSpOlW5aiEWtjNWLIz2iaJptjhD
X-Gm-Gg: Acq92OGOgCnwqVUpJ7r2/acn+d7ZmiqkEh/Cb6Zee99rWU6Z5HnkxdwBixluCxiCztn
	nOmEphfZjWRIRoAr94osvBObLIk3k6bPrcbqx7V3vIisgDTqEFe1thwBzzIY4y3lKlpUeMrwqni
	I7/SWEajds9A+Z/2K01MvOhLKweJWcRSvib82G5zKgYr2XsKHe37t2aXaKgj/PV59+EWxoUj6EM
	4qDaYF5q4qFB/8EqyyjKIiGsGQai5+4omPY0D/0kuZ5vbO2nVO9e+QCUBzpOYh8IPZI+5heq7l9
	KgQxjF5XWKgmG6BCUExW+tseA3FN4OfHeA6yDYr/M+tmDG+spXaSs7UY8oXlWCYqQE8IRBOhTRO
	9jX0bn7YXE6NEovoPmw/i9J2zTVLYoerjeYEuu3x6r5PMlLBFHhVxUrzznMQ5xP29Hz3QmA==
X-Received: by 2002:a05:6a20:94ce:b0:3b2:924f:70af with SMTP id adf61e73a8af0-3b4cd0cf41bmr22219137637.45.1780983078653;
        Mon, 08 Jun 2026 22:31:18 -0700 (PDT)
X-Received: by 2002:a05:6a20:94ce:b0:3b2:924f:70af with SMTP id adf61e73a8af0-3b4cd0cf41bmr22219103637.45.1780983078205;
        Mon, 08 Jun 2026 22:31:18 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0341f6sm17449711a12.7.2026.06.08.22.31.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Jun 2026 22:31:17 -0700 (PDT)
Message-ID: <26deb3c3-0645-4864-bac7-f0d221eeedbd@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:01:12 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for IPQ9650 CDSP remoteproc
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        sumit.garg@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260520-ipq9650-remoteproc-v1-0-542feb6efb2a@oss.qualcomm.com>
 <aieAnN35K_WarmUD@baldur>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <aieAnN35K_WarmUD@baldur>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA0OCBTYWx0ZWRfX1+2cij9g6jGm
 gUMZHCOE8LCfck8lguO8IbOAuWIctBIsMAPQ9ajLKbda7MMcPrvioQ+PT0u3ok77zZA3GTGSmZj
 G+KSW9RGUYGspdowA3o90V0WQsS3FT+B2DKFJ7VMs3plAk2X4MCejxlGQ5oNSCl/c9O4mmrEm96
 nIZUAZhuCKpbF1NGOkYl1XTThgH47F99yElDkkIzmk8SBaXDluPIQqGBETLn3MT5+wd+pjwNl3y
 xl6OvC6CvORYJoBp7GIVh3DEtdYm6BZXVED+PJ8fEbnmJQl+PWiXvDSt5MCaA4W8klf3qDPS+bb
 +Y4l/AT0nGXgDgVqepxttSJb7NJvuU1Os2uOsfrMXRUEmeAGuWzUPyis8uZitVokt9kaNRBWPp7
 17AahSl343CgSH07ruE0iyNx6Kc/e0ysnOhWisWh2RJMnUdKhD33JFT62htwnws4K4ey+zY8p8H
 q8DJhZDw+/fmjNEz7iw==
X-Proofpoint-ORIG-GUID: AyJZ_CLyJXYuq4S_HnyWfz9vvie8rjCg
X-Authority-Analysis: v=2.4 cv=UptT8ewB c=1 sm=1 tr=0 ts=6a27a527 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xB39o6WwYaDxnCAkqHAA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: AyJZ_CLyJXYuq4S_HnyWfz9vvie8rjCg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090048
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	TAGGED_FROM(0.00)[bounces-112003-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:sumit.garg@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32B6B65C71F



On 6/9/2026 8:29 AM, Bjorn Andersson wrote:
> On Wed, May 20, 2026 at 12:56:16AM +0530, Vignesh Viswanathan wrote:
>> Add changes to enable IPQ9650 CDSP. This series adds new Devicetree
>> bindings for IPQ9650 PAS and also adds required changes in qcom_q6v5_pas
>> driver to support IPQ9650 CDSP remoteproc.
>>
>> This series depends on [1], [2] and [3] to functionally bring up the CDSP
>> remoteproc on IPQ9650, but does not contain any compilation dependencies.
>>
>> [1] https://lore.kernel.org/linux-arm-msm/20260518072856.22790-1-sumit.garg@kernel.org/
> 
> I'm not able to determine why this is a dependency from cover letter,
> commit messages, or the patches. If you have a dependency on this series
> this isn't your typical PAS-based subsystem, so describing what it is in
> the cover letter would be wonderful.

Ack, will describe it better in the next version.

> 
>> [2] https://lore.kernel.org/linux-arm-msm/20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com/T/#t
>> [3] https://lore.kernel.org/linux-arm-msm/20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com/T/#t
> 
> #3 is a fundamental part of the addition of this remoteproc driver and
> the solution would be better reviewed as a whole - so you should send
> the two parts in the same series.

Sure, as mentioned in the cdsp power thread, I'll make this a separate 
driver instead of adding it to the standard PAS driver.

> 
> PS. If you run "git log --oneline" you will see that there shouldn't be
> a "drivers:" prefix in your subject.

Ack.

Thanks,
Vignesh
> 
> Regards,
> Bjorn
> 
>>
>> ---
>> Vignesh Viswanathan (2):
>>       dt-bindings: remoteproc: Document IPQ9650 Compute DSP
>>       drivers: remoteproc: qcom_q6v5_pas: Add support for IPQ9650 CDSP
>>
>>  .../bindings/remoteproc/qcom,ipq9650-pas.yaml      | 136 +++++++++++++++++++++
>>  drivers/remoteproc/qcom_q6v5_pas.c                 |  38 +++++-
>>  2 files changed, 172 insertions(+), 2 deletions(-)
>> ---
>> base-commit: 6a50ba100ace43f43c87384367eb2d2605fcc16c
>> change-id: 20260520-ipq9650-remoteproc-9aa8c6d05de3
>>
>> Best regards,
>> -- 
>> Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
>>


