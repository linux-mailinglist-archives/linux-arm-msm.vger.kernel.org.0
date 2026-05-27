Return-Path: <linux-arm-msm+bounces-109936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPyaFmGZFmq1ngcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109936-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:12:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3045E046C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 09:12:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C43B4300B194
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 07:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAA5B3B9942;
	Wed, 27 May 2026 07:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kdjzTCAj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BZxkWs1D"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0C23ACEFB
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 07:12:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779865950; cv=none; b=X0pfHDmNbT6ySLxR34efiRtjFMn8ylStAC+Qu301w7/uzBojXUHOtforKPTr9g7b2Rfe2jKpQWc6/ClmqY9KgS1enNLzYTLfX2uYUgd2k0spL0wl+gSOaHKoaXc3aTZbnEy9MlRyFARCIsC0S5qLnUbl+DTwtOWFhTcrj6sK41E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779865950; c=relaxed/simple;
	bh=9UBpA1DlKaw0Ic22nYrKTCD1TparHCSI0WO2XRA1lYE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ROSy3PW5J3Dh0wjBoeNwWf7mpzAzhUeaG075izpUvf0FaaPM0ZAhdMm7YCKZ666yfu4ZKsDo5NMMINYY5Cf4dteO8g1iXgNi1Qm8uhVUdoVe0WzjDq8FLB/9qZqDDjIKg0dw9uTYYCNmjXpnxHjfQEdB1aP1x1lQcGAlG3jZAmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kdjzTCAj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BZxkWs1D; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R2X6Zh504992
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 07:12:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sFqDIrJjKC2IJFbPzvKdfW/q7cLOEJE24hhamOrvPj0=; b=kdjzTCAj4p7g6NBv
	6dhNZ8mo6TNx4IxOtjBmPyr6UHpoXl3t9pwDzBtzVU8abDJDEQZvPQlNRaixvcqW
	NNMW9hZDVWlIpipChxJkLQyakIJbm4BJsEJK4cZoQpCsFHHqhO8BHiHGBP+bkUgo
	jsFF39Q9Rg8msD3ACKNWkeNfEFwgqgBiA7Oq6TD9MQ59pl1cR3K1trjNTaoKbRvY
	tw4y5S+R7pdibCy+25RinBAJcR+/BLgmsAQN7ywDPFS9Bkq5MpJ87qxc57KCJ1uI
	GJWeRs3jl4aLOL23fJwvgoqqLnYS+jsIoI8h/N6dPZx6kH+/2YDekOKh8NR3tvYN
	XMK7CQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edentjtyp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 07:12:28 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2baf7748d0aso116724675ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 May 2026 00:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779865947; x=1780470747; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sFqDIrJjKC2IJFbPzvKdfW/q7cLOEJE24hhamOrvPj0=;
        b=BZxkWs1DM64B0VnenPPV7IOQxIdnjTl6wlWMtKmDvug09FW/8mSxkJZJpCblOc5/ij
         EF0ygFhhK/hUzkEpFRgl0QusPvgwGU0lF0MKD+jeuTodJyeP+JrMdrP6m9G1ggzZjwm5
         PQw/OUXejOXkk7XNiKDsrN6UH0HnSf7FEXFUjybfj/Ds8j5GfOBBRqlnDos9Pg8KbipR
         f0VeF5xuv8ovU2pjPRvRJKUYmx7g/wX4UdtrnhEWKgpEOS7hgzBUDntsVbqefALYfajK
         boxKsgAJadtxEk2vAye7XGvb4OdlPT8+B4iXVKXK3zgtiSDi274IlnPO3mJQEZmm2Dxc
         nG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779865947; x=1780470747;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFqDIrJjKC2IJFbPzvKdfW/q7cLOEJE24hhamOrvPj0=;
        b=oLd9hVbjhs6EVK9vAw2FQPtFZ7MaJFNVIfxsdrM0tLqQb4pM9ORBKwwK+nNX9tuh2J
         MKYotoaaQ0OBta+pI/JSkOQDy9A0K9gEDKxPXi4J+tKtvbP2oHbmvX7a+NkgqWD9cZ7j
         +9392ITMeSaEZMJtd+RnhYgqiW8rAyE98ZsKkPR18bcV9vCfehp2TsiPMdH8ka84fHQE
         P9WzBwNIQK1n7Y6hQmyI3TCWj5RM0YWqdWtzL7sr0mC5AXBdHr1s5N2LHIIWyxU+vT6Y
         ryZJymCx9r9ZjyjG9zWFIqiEwm1RLsAyH5/ddVczBNYOIYu6QdJauEsB/nHcrW5Ro6Ng
         84gQ==
X-Forwarded-Encrypted: i=1; AFNElJ+jewlKsG5YNqfpMlMvx/OGop2TtSzlPpes7jb+h6OzUah2mEflThAfCw/3N1LJcuQjggSycx3SRfa9Qg8b@vger.kernel.org
X-Gm-Message-State: AOJu0YwX/DyNkHG5w9DHp4N+hE0xT9mgzrOQRs42adn9cmpFR28o6IvH
	bYE0kFYABj6yYQtDewNdDGkru54ALkI/gEHl46BbP3LT8GMMNQ6XLUeYSU/6xifJxkemvqTuBc4
	w3TYy/vEeAf2X0Zjf4MRM+TT+ffhIMbTO9nMD6FQa2vmGl8MEgWmjKeA3Pd+Fw6XNbkPW
X-Gm-Gg: Acq92OFiqxxf6uUoZ15uQ465Y/un1afPw1XSFFvl+d5kTOByik2j3YQ4+kme0SeiI9V
	68VrsO48uU9gjdBNAG68S1Z/UA7dVkKMIMPHae+oeC0aZ1GshAz3iBztJHq/q0l2KcSjljkal+2
	1FLt8o+elib72lsMEbd9MoJD52I252Zm/OyyWHn3sq0IRJg027Sr3vQWm0JHJSEVbYg37s77RIE
	4NkXrJRGFmTpQIzpA+mlo5queniO1KzNZw2JARK8Vacmi6lz9ATc+p4eo1prveHIbzkiqvc2STM
	IdXDFpGlchPbXiPKOU/aQIdC1pr7q/0qGbA+WX77N/SeBP6y9yysWhNT1notRbR5suhgs4tJMlo
	5svWtrylbspAQiK9ndKhX44/VFk3PwePP4Lo/Sr2GoyWrwRap
X-Received: by 2002:a17:902:ceca:b0:2b4:604c:ec6f with SMTP id d9443c01a7336-2beb069853bmr239368675ad.32.1779865947229;
        Wed, 27 May 2026 00:12:27 -0700 (PDT)
X-Received: by 2002:a17:902:ceca:b0:2b4:604c:ec6f with SMTP id d9443c01a7336-2beb069853bmr239368465ad.32.1779865946736;
        Wed, 27 May 2026 00:12:26 -0700 (PDT)
Received: from [10.219.57.29] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb56ce4easm134672025ad.30.2026.05.27.00.12.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 May 2026 00:12:26 -0700 (PDT)
Message-ID: <951c9b8f-4513-47ca-afb6-481dedd3eff9@oss.qualcomm.com>
Date: Wed, 27 May 2026 12:42:20 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] dt-bindings: arm: qcom: Document Shikra and its
 EVK boards
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>, Ulf Hansson <ulfh@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-mmc@vger.kernel.org, monish.chunara@oss.qualcomm.com
References: <20260522-shikra-dt-v3-0-80ffde8a3dc4@oss.qualcomm.com>
 <20260522-shikra-dt-v3-1-80ffde8a3dc4@oss.qualcomm.com>
 <20260526-quantum-funny-gorilla-cfc983@quoll>
Content-Language: en-US
From: Komal Bajaj <komal.bajaj@oss.qualcomm.com>
In-Reply-To: <20260526-quantum-funny-gorilla-cfc983@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Ja+Ma0KV c=1 sm=1 tr=0 ts=6a16995c cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=kjqM9UcslzgJvOEO4JEA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: suV3_29neYe2tMMaD0qcDPsHb-bahVsl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA2OCBTYWx0ZWRfXxk/dqVHc/Nz7
 WJwgTJRhyJFImswjHo4TLHYmGtzOyW/gR6jtk/Or0PnaLJC+FJ+N4dhCiDwGi2gBGacyrkDz9sK
 3s5Yhba4kQxsFfsAKiust4cPTzNhI03uzGCNE8++vQEfS2p9amQsz4Ld+dbp+womEWqBM1UkDiV
 zuouvI7iw33RvNRp3Wcu0KHGxRv2ZCLAtDtwueC5XZzZUygXGFCvegfIKTRMZ0c/f+4YVkKPcf8
 /dKngcWDTe6qwKiQtLpCqV8yQAjrhOXk0BFWkBmGj4r9xj0DCspZ4izJtstPRNss8jdvYi6SAUy
 4JR7eu61967pI4vU3noMdM3uNGF3zrizKJhHpdYOjCVEPqiseQ1q+Nihk5Ne34nWJR6mI16Xe4Z
 Hm8gMiu4IS49U+DLbtZICGMe5/4rkFvLQo6lCJKX7aP250rB08qxzFa9jzyzre8CS7HM7yscwjJ
 OMcmy/OmZplpda0Wo6w==
X-Proofpoint-GUID: suV3_29neYe2tMMaD0qcDPsHb-bahVsl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605270068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109936-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[komal.bajaj@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: EB3045E046C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/26/2026 9:15 PM, Krzysztof Kozlowski wrote:
> On Fri, May 22, 2026 at 11:32:24PM +0530, Komal Bajaj wrote:
>> Shikra is a Qualcomm IoT SoC available in a System-on-Module (SoM)
>> form factor. The SoM integrates the Shikra SoC, PMICs, and essential
>> passives, and is designed to be mounted on carrier boards.
>>
>> Three eSoM variant are introduced:
>>    - CQM: retail variant with integrated modem
>>    - CQS: retail variant without modem
>>    - IQS: industrial-grade variant without modem
> Industrial/consumer variants differ often only with thermal, so how is
> it here? Thermal difference does not make them incompatible. Honestly,
> usually industrial one does not even receive dedicated compatibles.

The IQS variant uses a PM8150 PMIC, while CQS/CQM use PM4125 + PM8005. 
These have different regulator topologies and RPM regulator bindings, 
making the DTBs genuinely incompatible, IQS SoM cannot boot with CQS 
DTB. Thus, a separate compatible is required and not merely a thermal 
distinction.

Thanks
Komal

> Best regards,
> Krzysztof
>


