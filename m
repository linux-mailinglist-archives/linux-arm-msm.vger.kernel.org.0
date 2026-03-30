Return-Path: <linux-arm-msm+bounces-100665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WEp9F+sKymmL4gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100665-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 07:32:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AA18935592F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 07:32:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 46CA930137AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 05:31:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8402736C9CD;
	Mon, 30 Mar 2026 05:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OH8638Y5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYJAxYUm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584908462
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 05:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774848713; cv=none; b=gT6ZMvQKuSevFTO5HlePUzfGnj5yS0iPR/GZINA7sYjPqhmaSpzj+rqEJyfDxbLSmwAyQ/yAUdZ5kp2XcBmha/b8w2XCBY6I1w2nUzwB5qQdrZK7TzvIjm0gIuBaASXnsbiCZIj58L1YrFHOFNatUDpBRr9I5Vhi+HP2ufPOBAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774848713; c=relaxed/simple;
	bh=YAvMqsLOEoWoguh5Ey0hOxWmgZ9/1mN/OsIr8xnCnq8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=me8AJ52tCwNJRdarFNO9OzLCMYj9SX1oPhK7kAtdfJUjxCsOiEFLjC9+NoP8xxga6IEAgR8hyZqhPQYp4va6VV+K91sxSexgcFk32H6D15mICkOLzdhL7zak3D6usjyOyJvp3Zt6Bam1EANVgbZD3jXVXOYDCKmZR5SToeP6pvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OH8638Y5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYJAxYUm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62U455rb581066
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 05:31:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	foOsuNB5DUtxFKfyTgqO4ub9us6BpqOMMltVaNK5Gds=; b=OH8638Y5Wqg5Q9gL
	4MT7nH5F+Ffk9jw1gpRpl6U4oppStdJp/Aail19nfsYwkXhinsljY7oYuc9Y+e/7
	f82YSPLW4dq9o7D/cNWwvYpF3mK1EjG+PLFj7Lvtq4AqD0JnfVLL4phSPHmsspxP
	boSEp5i2KuFCFeHNCdQVXZ5Cbhh8ghd0B/LaDj97CLsRtSbVVz5Crjhpp1URf7Gt
	1pXBVom/WHWQY59vdV8fyJnANWabcRuN/XhIe1U8mK52m6Bxrnmj6UPBQSZ/hMdg
	0GqHiJlM54PYMR0sLngjmO+Bumcs55CAoccltoZaqvC5Kl3igjOdrVCxMd4knCE4
	l+/xlQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d65xqmpt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 30 Mar 2026 05:31:51 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82ca8323edbso3057369b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 29 Mar 2026 22:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774848711; x=1775453511; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=foOsuNB5DUtxFKfyTgqO4ub9us6BpqOMMltVaNK5Gds=;
        b=YYJAxYUmV4mMfR6lMPdTQ9oPGc5TleauB/EERcpZdDBT0o0N/ijPegO/YGwg0bs55V
         zI3tWPJ08tiN1B3/wEoquF0ARLonwTN/79Sk5jSyOp1G3ZOaGdyCqzt7pS9NV+eaTzbD
         SbRCvNoAjeIGEz4CkrUtZmlzo0HcjaFXTc8VgL3TIWw9t1TdmtUG20sLcaePdXsFvlZk
         2eHRa4baM7SGsADKaZEavqnBkrsk7LxopwF5fruao4J42OOtWa8bNBQ2fTAnsVv7DVpl
         kBjNEQtlk3jR670ExnxgbX/DVu0C2VOUOv+XWMp7qirHxrMpDjWdVmRmWdafWKhP/61Y
         rq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774848711; x=1775453511;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=foOsuNB5DUtxFKfyTgqO4ub9us6BpqOMMltVaNK5Gds=;
        b=TH/4fb8S3cMKSwOTrF7NFYJIiBD+lcf6P1IiF/VaM2XqnANGOSN09FwzaUveVOWng1
         LES84KKMao4kzxEU/jh0iZPtXam8sri1AtTIxeYkMJWL+NXUXWVFYv4thGn1ERA0qVKU
         AI+g4lBALUJEMq3NmY4LlFScpKtlYmWbZXoJnaE/FBjPZLcKidHK9/wn3dXcthOESpLz
         kSoLKrerwCApf0euUzPqZYj8JTB4+lokHWjdwoeFddU6Q7CWU0EY+KX0poROhnfd41eo
         FZUz0oKdmkBaCoSLhvS8GwlXjfNd8//D7EikN07TxSHSlA85JxwjHA8glvNJ7HQBhePy
         hOOg==
X-Forwarded-Encrypted: i=1; AJvYcCWlT90HDdGQSm2T4fZh60M1wWBqbnRFebRvLGT8F3XKHzcvJlaPYH2SmhLGP3PYZlOQqCKbW1QB6lgrRqDp@vger.kernel.org
X-Gm-Message-State: AOJu0YxZlzX4mPzf85qPvQ478tWJPZKBjnw4RT2XlkOqS5n9oOX+Njz7
	GvdCTf11iMOYky5TP1VzOHduqwGNfImiY5/l0MVYZfZd+SWgpsCD/3WLHrX/m8PzEvuRBoqXFYX
	YoaOsqTaoVLzUFioEbeqfknkrHjZ+btVs/m2txMSkn7JdWvNjU2VC2nCmg0y0Sm8mUQDW
X-Gm-Gg: ATEYQzzdLW+SNK5vYxJV8Azgx3IdCNCpsz0O12vOOvzxivrFxjqKFz3hXcadvHh/yR4
	yW4fk9fgcBSrzdZ38ohbEjBm+XUoMpF8vzM5EW7o9JwRnYz0Ak92+Mlr3bsziAs8XSNefwYz6yb
	sot4x6o6+K41xuacbwgyG0mWdT9uj2Df+U1lO2CVGvyxB/YLntNbajttl0iBlbuNbMCvvqVyocW
	1wxNv/Mmi4jSP9AYeHpVd1KvmQk0vWhdwBYCoP/DoAHcfIE0XJ7w9xXhUQ2u+64LcVdSe2pAJBg
	Lf/2dcgTwaXb2Z6JJfFvd35i9bPfTuCpjJ5QrQTEF8QlRnSOCO4QQTkEVOKoJVKjROTwF818mVz
	eIpvB/o3XMjjhVeuwOxEXtie5fPvp5sI3pO2SEMHcnYCP
X-Received: by 2002:a05:6a00:2d9c:b0:823:1252:9428 with SMTP id d2e1a72fcca58-82c95c199bfmr11169616b3a.9.1774848710896;
        Sun, 29 Mar 2026 22:31:50 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d9c:b0:823:1252:9428 with SMTP id d2e1a72fcca58-82c95c199bfmr11169584b3a.9.1774848710384;
        Sun, 29 Mar 2026 22:31:50 -0700 (PDT)
Received: from [10.216.1.96] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca86286dbsm6043459b3a.56.2026.03.29.22.31.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Mar 2026 22:31:49 -0700 (PDT)
Message-ID: <92bbc947-4212-4608-aeda-927cbc476e69@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 13:31:42 +0800
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] arm64: dts: qcom: hamoa-iot-som: Add firmware-name to
 QUPv3 nodes
To: Abel Vesa <abel.vesa@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260327085318.2771771-1-xueyao.an@oss.qualcomm.com>
 <p5soauqkqe46zt3ejtpxckvqrfymudvl7kpbjrh6mlmvkrbahm@she7lps7mlfi>
From: Xueyao An <xueyao.an@oss.qualcomm.com>
In-Reply-To: <p5soauqkqe46zt3ejtpxckvqrfymudvl7kpbjrh6mlmvkrbahm@she7lps7mlfi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 0rZBj07X8Vah6ZRb3aKno7HTPFFPJoki
X-Proofpoint-GUID: 0rZBj07X8Vah6ZRb3aKno7HTPFFPJoki
X-Authority-Analysis: v=2.4 cv=evLSD4pX c=1 sm=1 tr=0 ts=69ca0ac7 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=KbYPcWELwFK7O2jxHYoA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA0MCBTYWx0ZWRfX2haO5DTsmpLY
 CgjdUcnawOGt8U+SF0ebpR7AhARK7IvpGS4t3Mhn0lSz9H9K4eSM0bbUj23NF0RYDSNVWzGWMOB
 Te6KvWpSlGThOF9bACPePti7wrngHwyweYx4vBWnUFarx3bUhBjvLY8BdTnG5H487tYDeKgd/ZR
 tzhxpl0V8yZ3cv/tX7C5TTRmdt+0oIcPOpsje9JtNyraQJL2murrWPXguvDnPWfjNRWVM2jRPPM
 Qvu3XZ1Yzw2bgQLCdvSEZgQPvDL/v+8HmkHUZ4R+E1rVS+bU7DG4cG+ct5GarGV2Rd5dipUErl3
 oWv9eh/Or+qSLUSvExaING4t7H4tqD3KYkr+MgoB7eZLn6lei61mfOZBs1g69msw1pK2DXu6+Sn
 uAOgQBsnVQt2ynuPeQlO//q3AP/PjowfDJey3pxiat9lDiQGqa3lAGkB2wAgyUx4zuerOhOcvnV
 MC47tM/vbz3gyCmtZtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300040
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-100665-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xueyao.an@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: AA18935592F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

I sincerely apologize for the confusion and any inconvenience caused.
This patch has already been upstreamed, so please kindly ignore it.
Thank you very much for your understanding, and sorry again for the 
oversight.

在 2026/3/27 23:21, Abel Vesa 写道:
> On 26-03-27 16:53:17, Xueyao An wrote:
>> Traditionally, firmware loading for Serial Engines (SE) in the QUP hardware
>> of Qualcomm SoCs has been managed by TrustZone (TZ). While this approach
>> ensures secure SE assignment and access control, it limits flexibility for
>> developers who need to enable various protocols on different SEs.
>>
>> Add the firmware-name property to QUPv3 nodes in the device tree to enable
>> firmware loading from the Linux environment. Handle SE assignments and
>> access control permissions directly within Linux, removing the dependency
>> on TrustZone.
>>
>> Signed-off-by: Xueyao An <xueyao.an@oss.qualcomm.com>
> Hopefully, there is a DT binding schema update that goes with this...
>
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

