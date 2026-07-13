Return-Path: <linux-arm-msm+bounces-118942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PqvTMoLPVWoltwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:56:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2710F75145C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 07:56:18 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=fd3izyV3;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="YsQ13uq/";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118942-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118942-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DF3BB30207E4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jul 2026 05:55:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 799D33CF96B;
	Tue, 14 Jul 2026 05:55:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CA5358367
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:55:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784008546; cv=none; b=ezZ0vYcHXvFdE2N4L6y4CXMC5x9IPx4C4Qa3/WhoOLKQ15LpeGq844f3ZwOpCi0vOKbHHTZ3+8eYEvbUw0RBtLYgoUelID5yM7elOiVJKd8Y6dYZIwFH9DpVgCWFwuhEvakuk2oWbAXiGVqwdFNTekxYzHervmJ2Q6OKJaFnC7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784008546; c=relaxed/simple;
	bh=wUWUcD4R68Lr0rxkifUjlkVJWZqTBScP772FzIxJa6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OFtfCBwtp591Q79Ju3oTs1fOUZanQmn3Uz153c+J6JmD6hM82frJ5KOu7kUw7L5y171aMSD+4WVGjRvIAgg/+PeaEZrUI/g1QaRgss4hjkPXPuMj1Hz9R/GTKVCF6ZXss1ef0W9hzQEHp1ExWheD3wW7X02RCI7uPua3y5Ul59E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fd3izyV3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YsQ13uq/; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66E38Ros3499075
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zgjH+BGbOMEiI1aAjJ2gxRsDYPA25+0SJdQxcLp1ziY=; b=fd3izyV3MWaQQBhT
	Lcu8o+kbIAkT147yLm9nRqx2viGv6ioUc5RR7J7LeOn7zBBsZwixIGapcabi1We5
	5jwG4dKz4BO+KJcPLJcjh+BnsAkatAca3IT8DWH3yS5XG0JdHJN5z7gzdGrh6BWS
	ZWFC7A6zXwA9XWzMI5tFjtzDmkfCRgNk+uHx2S4cyc33olcGcstuLXc4aKitfqMh
	B9ZKB6qXuIiizbuMFo2k0rE/Q1przwTwNMo9BjeoVITkKO4Wj9dtC9Jiy5e7Tboz
	xtkoggd3OvMNZC4ad43srFcUItRb3OMNoAASbE89Xj/hSSIwGr/w9tLw76IMboYR
	G4ZsMg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcwda42a3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 Jul 2026 05:55:43 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-381250979d5so904578a91.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jul 2026 22:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784008543; x=1784613343; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zgjH+BGbOMEiI1aAjJ2gxRsDYPA25+0SJdQxcLp1ziY=;
        b=YsQ13uq/fORK2GITYbavS8riNY9Hps9GN1rbOiFUNj4nJPF5xX6y3h6tlHfBlDs/GR
         f4YpL79HQH8A2upydNWO2T0kMYxVhuvNwDgt+FyWdxwj6YqvuFzjwB6FpyL+EZxCSWgK
         9/vlrSgOmcTgQqSIZmpoBItM79uQoHZSyXoeeWv52YMsWxH+qNJco8C5/q5ZfkSkZGW0
         jWr33+9glMk/zVayAZADsWY3s+FnD3t5pwS+Pmjg1w2D4BdwY1r632ZNvLqK+i/yx1xC
         yo0+ZRseyBjX4OSto2AhGQ/96CzwNgFb+leiUCNqVlaaYYT03ag8vqBnRU8Bn7FXhyu4
         9q3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784008543; x=1784613343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zgjH+BGbOMEiI1aAjJ2gxRsDYPA25+0SJdQxcLp1ziY=;
        b=ihu0txlDTv2yLbBr3AF16FmGcmoCi4M20okhX72pdURyVHZr8aa0oGS1u55P6ss5dr
         kHui7wiU7bsSPwhtCpVJvsvB0Sjjw2PccUWOCUn3V6cPSKJ2k+yZF9p2Gw2FE8xJNYPd
         mHcDBR3BCyWMH88XP0EsPVAIbUDSXpYvq9C24CYSJmlO4lApnNR7tSFWU4ZSvHMJpzMX
         gqubD8ysbGHd/D/SQ6XLzFAkuYiJgxynmQ1Or99zvuVJCCsjMZj6SIhwtWA19deFkwEK
         isg7aHw3SxEJ6aj5U9G2n6Dwc+8dW/puPCaO6vPMU6DyjT/FrybJVvHA+Pj5y/iP2fHW
         8sVQ==
X-Gm-Message-State: AOJu0YwPafz6h2RJgPp8LkH55cCmWAbYJe+1pA+IxoUzJP2YOObBS8mh
	kL+RO3QyAxSKQ7QeD2+kSm1cdGwQgt3fN/pGf1C4FhOGw8sMdJIx7uXU/x8HOVlYXwV1CUa2CvM
	jj6O38UshQiADHAiyn/zZyo2IMpeNGCIqKqpGI+FdcYIwYWQOS0mLpNxR9pbY8OCKn5le
X-Gm-Gg: AfdE7cmEgumnuYffgXyHn3WA9f0Ld70XAjjRw3aS+Ajy6B6yWKdSEnBeuYnMD+Mxu0u
	VJRSxtVInNFUolPpC2eRUvAGfyvXezetfjYRckE7mCAKqhEBJ+ft72p1zKgoCMyLDj9d4w8dzSk
	qmBFzSxhlEwkoSFzpmm37b6TIkQzs7/YUkek+1SpAvQQHnIys72b6uowwSXSU9M3HRFfqu+j6Mu
	UrswDPh8Yx2rDxAhGa5o7HBziotQpaYsmsicyJgBMdmr/MKnhNjdIm9BiiJXZXi5sXowYLRFBGJ
	6DlCLQXqqEwXeEwkHvHFaJe9N7KgYR+eg6rKf5fr4IKQUsox9o16ZnRpHrU/ephv5m8cv7FEgqc
	86nTd1sSELo/d061USqZRvyqV/bHJurRh9ogV
X-Received: by 2002:a17:90b:1cc5:b0:380:925:aa25 with SMTP id 98e67ed59e1d1-38dc782c682mr11086723a91.5.1784008542935;
        Mon, 13 Jul 2026 22:55:42 -0700 (PDT)
X-Received: by 2002:a17:90b:1cc5:b0:380:925:aa25 with SMTP id 98e67ed59e1d1-38dc782c682mr11086694a91.5.1784008542512;
        Mon, 13 Jul 2026 22:55:42 -0700 (PDT)
Received: from [10.233.16.34] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38d11b82d32sm3345725a91.0.2026.07.13.22.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 22:55:42 -0700 (PDT)
Message-ID: <943eac10-45b8-4301-b8af-8ce8d9144372@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:44:57 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Add CCI and CAMSS support for Kaanapali
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260508-knp-camera-v1-0-a18e289163fd@oss.qualcomm.com>
 <178352261637.2235436.16367939885864866010.b4-ty@kernel.org>
Content-Language: en-US
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
In-Reply-To: <178352261637.2235436.16367939885864866010.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDA1OSBTYWx0ZWRfX0sFa7ZS2sIbp
 l83HDpgu3d94zKEQFUmz+rZQJk24bZdXaMbq5GMsKsMl7Cu/hFltWow9innx0o+RQ+bf6Ph5Nmi
 UhLt54kgPudTZTSzy3KHP3qyv6cMhuE=
X-Authority-Analysis: v=2.4 cv=cNbQdFeN c=1 sm=1 tr=0 ts=6a55cf60 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=QiXmUFQ1vzvQmtXJo8UA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: V-86AFleWMgwVolIY4hyesVvAPsKW9aw
X-Proofpoint-ORIG-GUID: V-86AFleWMgwVolIY4hyesVvAPsKW9aw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDA1OSBTYWx0ZWRfX7u1XRN3PDgnl
 7BLiHTLk4cZVktVBC4cPG25HPkQoK/9s0wxJP8wVsXWOT57CvhvoYZqHXCUc4J1b0tBs21hK7lq
 BB1v+DGUSuJrCfGToyONCEh7epjrKvutQxIko7A86AOAW69yjGYQa03fYS6cY77u8CTjeBIXYtG
 7AzdRXXd4Zr+gS3nTMNfJKgaPf40ncI4yH0uhrthduENE+7RxXbBvB4CNDuoz74C3il4Actxth6
 0Yc0KZX4NPbbScszfvl/xMNdszjmuI2EmY1plBL+IWQ29+hrViw7X3J3BkKZTxH1ql5cVbT8nFd
 h4RXqB/a5/8EumGIRWHC7YmjfGKL5/PXibgmmxJGeOpmgd/F89KmTU/3jKVcdziEJ8OhOZvW1sg
 Jc6Mfy5c6qAPYdCeZmcqnMFKSOqXCbUFymc4YmSpsaKNE4zD8OU9nFx+tsFFX64RoiDJjP9wzlf
 c/aiWXrRVr7jfz6Sv3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_01,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 suspectscore=0 impostorscore=0
 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140059
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	DATE_IN_PAST(1.00)[27];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-118942-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hangxiang.ma@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2710F75145C

On 7/8/2026 10:56 PM, Bjorn Andersson wrote:
> 
> On Fri, 08 May 2026 01:36:44 -0700, Hangxiang Ma wrote:
>> This series adds CCI and CAMSS support for Qualcomm Kaanapali SoC.
>>
>> This series has been tested using the following commands with a downstream
>> driver for S5KJN5 sensor.
>> - media-ctl --reset
>> - media-ctl -V '"msm_csiphy2":0[fmt:SGBRG10/4096x3072]'
>> - media-ctl -V '"msm_csid0":0[fmt:SGBRG10/4096x3072]'
>> - media-ctl -V '"msm_vfe0_rdi0":0[fmt:SGBRG10/4096x3072]'
>> - media-ctl -l '"msm_csiphy2":1->"msm_csid0":0[1]'
>> - media-ctl -l '"msm_csid0":1->"msm_vfe0_rdi0":0[1]'
>> - yavta  --capture=20 -I -n 5 -f SGBRG10P -s 4096x3072 -F  /dev/video0
>>
>> [...]
> 
> Applied, thanks!
> 
> [1/3] arm64: dts: qcom: kaanapali: Add camss node
>        commit: 7cc8ca0387f572a4d69941fe380e7a262342491d
> [2/3] arm64: dts: qcom: kaanapali: Add CCI definitions
>        commit: c25b80614c31a30b1b0f44fc5ae260aff90fa4aa
> [3/3] arm64: dts: qcom: kaanapali: Add camera MCLK pinctrl
>        commit: b6f8ecb80c1f894bcd0c612bf0ed4c5fee52d287
> 
> Best regards,

Sorry Bjorn, the camss binding + driver series wasn't merged as 
expected, which would cause dt-binding checker failure. Could you please 
revert this series? Bryan expect us to rebase on his new re-arch camss 
and the binding/dtsi may be changed accordingly. Thanks a lot.

Best regards,
Hangxiang

