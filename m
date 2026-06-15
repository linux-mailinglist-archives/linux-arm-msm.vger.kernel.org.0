Return-Path: <linux-arm-msm+bounces-113074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id HBUhArWNL2pFCQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113074-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:29:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C32168376E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 07:29:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=miUBOYQM;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=j8rEvVUp;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113074-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113074-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA176302C6D5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 05:26:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B63430C161;
	Mon, 15 Jun 2026 05:26:12 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB6730BB8D
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:26:11 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781501172; cv=none; b=LmRp+oo9rDeBcW72iwDyFkbUCUr1acwkfljRBia/wUHm+ZWAnpKzAmAAigQXYfnQO0n1zYR5iPKGLRZxaT1rRPSBcjiLoJsWuKO38cYBfdidTvIoqCYjCV3cyG8Ig3PGMRbk0nLLojZCwpyMUOssRNX6tk3wyHkiMCgdpbvTBvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781501172; c=relaxed/simple;
	bh=YV7/jO8AWy/iVCyJPFG78t7NVdl+EeHWvWjZzeolsUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MmanQMqgx5mJgBTUJ833ZUeHzZH4DloUucTUMqZ5w3VfVluRdOeApriBbe9KgBUFkG9jAtAC+KkWqSarlgOyPuC4ccpyf3FWq1uLBNECYQTs10j/0xIzCu5EZ1qC9z07VcKRnwyuI+071LYbZCcTMnA9Bn/1whkxXIxfVNuBt5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=miUBOYQM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=j8rEvVUp; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F1k3Lm3286262
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:26:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RdwfuxyCAi0gPj2XDmK6neTTdKwFGwO7R13mBBgx9og=; b=miUBOYQMN0YjV6pt
	1swg2BiWxYIXVQTR4hDwb692llrx/97lR3lVKysN1dS8HVP5JWdhMZ6+8u7KfPeF
	0GBRbPWT2jRnb0FDTjzBMBf1ja37Y0ysunqBt2TcZ73Qf+Wle9R8IMYafMc8TxXc
	R3oBTO9S/Uu+UT/Cpqkrnw8bBhLmhCcMrDofq4rMTQLWTSlJQ/dcJVV5VuqE5aBd
	/iL7PkNx4tFqyHmFKLEZWPs2PGE8dwxW0Cp7xDdPULZzO0JfGTyvraDcdm+pgpOm
	BQPuZEAnRy1d+WkM6JvrPG1+r1wbcLAEi/p953Jx1/Uv1n11gP2xK1fonUfWBeCn
	3vfHHw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ery8wwp1e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 05:26:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-36d98b76d12so1975694a91.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 14 Jun 2026 22:26:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781501169; x=1782105969; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RdwfuxyCAi0gPj2XDmK6neTTdKwFGwO7R13mBBgx9og=;
        b=j8rEvVUpHEG/GWUMm5okVwo8VWxuYAT+MuoGWosyszmxUpSreAP3QSSdwh1ShcLFBU
         H6+WHcoVUYDtDVtnMgdjOrA7GS5EW+k0q1jhaD7JPWNdB/rDtCYODA49LlegY2OS6aab
         F0nU4CI3k1plP+o476SpMl4ba7/xntnXyigsfTQu5VXppUQ4C1zOP5BmWKDZ8kucDlWH
         h3sPtfgWDt33lI2xDi5yc2BnikU3b7T63GdAz8GYRk6jMuqtZtfPmn49Cd7cHwyiBjTv
         S1BLUpqvIN0bpeaI4DOppB3i2UozFFOOwWbHcWPnMwB7WZFv60kcj3MZV0S7kl45sHah
         vN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781501169; x=1782105969;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RdwfuxyCAi0gPj2XDmK6neTTdKwFGwO7R13mBBgx9og=;
        b=DTSKUOhdfRunkN5mCK5yryrMVbJAz0akkbxAfYnEDIvmNREc9gcoq0YhAOpQdtCp1+
         xfSK0E6Lm0GIgePPLwmlxkEXz9TsKHAT5fVSKo6fyV1I/tmALyRnpmwNBU3zHJUu4cG5
         83dugCkBbv6UaRmsEXojOlq/GL8/1gTQ3drFctIEHUB6g87Wp+7OsQjl/kthRuQI8pTJ
         GS1z+/NY8LRIOzHMc0tm5JXNDBV1ieDPY7SDngV9hHusfjzBrP5JLJ4e6u8bsjwG7QGC
         CwmeDVmtUdLgNpjEfKi5bMVRcQG4B+ZOwo8FyOPggS7KgAaaUHbXj/G89ZApQugqTVhv
         Z0ig==
X-Gm-Message-State: AOJu0YxFGflszn3jfQaK8FKgkUGhOubr9f4+fl1PpGDAB8n9XyIHtAzx
	H7Un9RGtMJ8dtvz4ehIdX2GBk4xqE35t0M8P5zvss/kMoW4IEfiYso0QXV6JoHGEhLsy/BlQJ3f
	LtEHvpOBE7sVKf9Q2n3VlqE86zAEAZhGBTew/siiWs8jM8aKL9pnSsm7JD6pgwKyOoObE
X-Gm-Gg: Acq92OHGDeByl4Mg4PV1bPVM38ulRZ0gJ11yf/ibGwLh8BiIDCr5U3yWe3zJ8wnjx7O
	8rXIfiXKiqMG8jIJ133Cs3e8LnjoTAra3e1g8MJFUt0bl2xEzJUMUK1qUrlf/SvwhMS03T5zjYZ
	/UiVi+jt8rqiEpTKgxUYY8qLBJUEybdFEmr8B4dWeby9F8p7AtjLPhvm4H7u42AfsTPXiHnBCV3
	o1Z+oODcyDSlZPLEwEtvyZ2IEnXfWBrf9+zm73Utv6DtqGAVthZZbff6xQ/a0CmkmelmUyJGP1A
	UHfQfMZuiNvngHS59a+XqYba0HQl+aY9qm4Uzv2E9EpYvPZuwaP3DxEKgLsqAAZ7vglmNJ5Ft2g
	XV0Ffd051cbMUxGOFo/UNuaf3FMgKu0Jsi8+o8sS/DxMEZaVHyXQ=
X-Received: by 2002:a17:902:c404:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c412c30b6amr142075865ad.27.1781501169144;
        Sun, 14 Jun 2026 22:26:09 -0700 (PDT)
X-Received: by 2002:a17:902:c404:b0:2c2:245a:3366 with SMTP id d9443c01a7336-2c412c30b6amr142075585ad.27.1781501168704;
        Sun, 14 Jun 2026 22:26:08 -0700 (PDT)
Received: from [10.217.198.242] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f2e59e1sm87808245ad.17.2026.06.14.22.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jun 2026 22:26:08 -0700 (PDT)
Message-ID: <94b8d0e4-1f9a-4905-b26e-1db10a07f271@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 10:56:02 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/8] x1e80100: Enable PDC wake GPIOs and deepest idle
 state
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <37390682-ca24-402c-bf45-7f6bfb87f4a8@oss.qualcomm.com>
Content-Language: en-US
From: "Maulik Shah (mkshah)" <maulik.shah@oss.qualcomm.com>
In-Reply-To: <37390682-ca24-402c-bf45-7f6bfb87f4a8@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: FdkD1ZMUUo31lJda5gHzt1dR7mWGNI6G
X-Proofpoint-GUID: FdkD1ZMUUo31lJda5gHzt1dR7mWGNI6G
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA1NCBTYWx0ZWRfX4AHKamDdp85Y
 VVZ6iAYoCuB2m7Vlw/e8hSkBwj+ShVNA8DVkN14V1aggH2WMCCgSKmWzbPOoOmBwvS03UlW6BS1
 c3BuXS6pu8CqRHMaxdIYH2zoXfZLVZI=
X-Authority-Analysis: v=2.4 cv=IqAutr/g c=1 sm=1 tr=0 ts=6a2f8cf2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vVwBTKN7el7THSwTgNcA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA1NCBTYWx0ZWRfX6CWkCGa/JEYx
 9yseSZST4Rjurs9cAfU3bwBpbzyRcoGSWTvcbQ4Jr3akvybe4c+FikceHujq0jHYBMoWMeY+cQO
 +y1Z8S7FNtOOODrarSpr5dip0hcUwb3jlJUy7+xd3c+l/ZS1K6Pby5RccZ0kbZXKvrKiT5XT9Zk
 wq86bDKxtM999KTe78LPqqoyt2AQdFWyJAL9DcvzELNznaPMLT56OE/T5MLGx/r0pxB44fcQlS7
 R/8YYTo6KWNXQuiTOehYPhnOg/RLtRLFW7BHbsIr5F+WBLY0lvXiECliczgFXOBtkTSncIr26YB
 vo0TPJ8LTz+ssPal8/ISwTXcPSXob5LRMF4uf6jxMVjnAb3/IeNH9JGAuysSDW5/MpEOLHSep02
 sMkw677p3/0U9EmD80X/eFGfQiIVREZMA3VgP1Ty7uqpqM21njOKbHKcRHE+0HYECEymm4DuoDC
 VokESd/CWHsvylE3vnQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_01,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150054
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113074-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:konrad.dybcio@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:stephan.gerhold@linaro.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maulik.shah@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9C32168376E



On 6/11/2026 4:11 PM, Konrad Dybcio wrote:
> On 5/26/26 12:54 PM, Maulik Shah wrote:
>> There are two modes PDC irqchip can work in
>>         - pass through mode
>>         - secondary controller mode
>>
>> Secondary mode is supported depending on SoC using PDC HW Version v3.0
>> or higher.
> 
> [...]
> 
>> base-commit: 550604d6c9b9efc8d068aff94dc301694a7afdee
>> change-id: 20260522-hamoa_pdc-1517acc2dcd4
>> prerequisite-message-id: <20260410184124.1068210-1-mukesh.ojha@oss.qualcomm.com>
>> prerequisite-patch-id: 152df6e30f70eb1b45909ce2793bc4277554b7ff
>> prerequisite-patch-id: 118bd4216e0386e7214133f53153684947fa8dd3
>> prerequisite-patch-id: 1f2f272d8ad1f7930d462e6349bc49de815e1ba1
>> prerequisite-patch-id: 3754ffdf536206353f74953fd6d39804ff7787d4
> 
> This does depend on the changes you made on the driver, but not on
> the 30 bundled DT changes - let's just point to the actual dependencies
> 
> Konrad

Yes, i let b4 handle it and it added all 30 changes since the dependent series had both both driver / DT changes.
Will remove this dependency as driver part of the dependency series is already merged in.

Thanks,
Maulik


