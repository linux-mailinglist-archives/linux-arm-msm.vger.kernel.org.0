Return-Path: <linux-arm-msm+bounces-84097-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D84C9BDAF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Dec 2025 15:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 779F34E39E7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Dec 2025 14:51:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F199223ABA0;
	Tue,  2 Dec 2025 14:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IfaqekpY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S2ihvcwl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8625A2222D0
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Dec 2025 14:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764687078; cv=none; b=CIGYAV6JenvZ13DcE2J8OE88lPrioyUwrgK9rFbs1rEAmGmyRF6KazM9HrNHmMBeY49GiIc91g7koV65axqDhHW24XQXtVH7TaVy1f6DfEaYIT8jIf55DE1tXlfLleiCADD6QXCsAkMK7Tc/LgRDq7sLD5aaUleljU821CXHzxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764687078; c=relaxed/simple;
	bh=0Wu1hlJXMplGjb4V1DfSQwdBERruL3aFYVglXRRNC70=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MQjssRYFB4H+l7hrhrCZcv06mDod//GAsWbNyS0lNQaCzAGG22NLZNiM8QegIpw9WJjtpeibZVuiRj7qxnvBistZl4er3B7zK5AK5IT6WOXZP2AuFY8EOa2re67bvpbOCiYUf6AYnAwg7G2zTo+LUVQjLkTJB5x99rzSVoZAnkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IfaqekpY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S2ihvcwl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B2B9oF31591400
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Dec 2025 14:51:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mlB3ElUMOiP1Y89wJW3ezSOCwSwzO8U+WlUCd+axo8Y=; b=IfaqekpY3hCJaLqi
	G4VreCwotTgRM3nhfKBOzjNWfF8om7JGyCu3NiunE7krnrqqyfTkF74UH1dLJm+O
	g3NYNE4o9BBxbDIv86JFiuUiQGPV60YtKqUjzRud1LUBpy1+3ey82x5HMdD+1aQv
	c/913yfyvHqA3Dunoy1QOPjLMiJEfOB242wsHpqsTjbV2NMmls8zEmjVM4/AfR8I
	sDKqevoM4+UOXKbtLwKZkgwzougV5UKnMQM+infbJHASMRMtO6P1c0rI2EF410XG
	DwtyV2ZmtHbEAOSliODB3G/l9x9xtMDMrbvQATO6jywdXNwUyBaNY58kPoLjggd4
	U97t0A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asrvr9vs7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 14:51:16 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4edaa289e0dso23011001cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Dec 2025 06:51:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764687073; x=1765291873; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mlB3ElUMOiP1Y89wJW3ezSOCwSwzO8U+WlUCd+axo8Y=;
        b=S2ihvcwlDuVmV8NAcyzT/TTp7CNpgNNbusup/Hn3mrRCsdDw4KrPzJZ81+ZZ9rvD2m
         LfVk91AWlZpVZla4uwJL9tfVdhZlWRaNkaae+B/X6bNrj6XOAPThoc0SpLT2rcw3xLco
         2EP455kBJis5wBD597ykc5FXNhJy6E9NgCRKXmeDsOaNvXxttBkUQVcVHQa/OhtH/+8e
         2l11XnRKBM/5wJSMkDPXYETOBXAzTvOC2iwg76R0W9Wh4SllsfJF+ccTNdl0DDAbsZ4j
         bPm+SRQAU9dVI5xAgpTUfkntS6+ghwn55Nhvd95GUIZktEOMTV3B1dwD71lUL0vAsGJ6
         1ShQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764687073; x=1765291873;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mlB3ElUMOiP1Y89wJW3ezSOCwSwzO8U+WlUCd+axo8Y=;
        b=qkKsn0RRy0Q0gj9r00IgfrMcM9HHFgOIu/bYM1qB4ifc3AYrFYjA98EvINaCtiBleI
         RaiBWypO77PP1VDPms3vJMNQwulCbye9t53Wux/W2q3PvkIdeXsiugIE0srTDHGBT5fz
         tp+CcfCBwCQoDN3Dv5GNq4lCsxkb/SCrIHM3QCuiqJyKjKDRmzWUv5ogYz0VVRUT/j17
         KcYv/zLhqOzofsThtW5J6QR6PpeIiX04BDpg01ZtEMe9xjmktpnxknbELb6KIYYz858d
         UfD98nGCnoNySV+nFqFvVzjr5UVO71p06ZiaxMTWjTeOUuvijT+0pxP8a94bg3zRHM+G
         HbSg==
X-Gm-Message-State: AOJu0YzL5QORA5pg+v1oRco5BiSPNMJWRe9eZjW4hTfBiufIvMBdas3l
	lRGKU19w8yF5I9r8mmn2KzNbclj0PU1tvaBO5qn03Okd9SFl93gyeZgkfvCclyX6gQJFRzBW4He
	kUaCPJ37fzlmH98bFZaTxbp7Mq0nlMje36hsQcA0uZltgfbCYpy5Ei/PdLU799ePDIvvO
X-Gm-Gg: ASbGncsPs1hPJHBnpRBRK6gfkbbIeaItddQYrxwJrVwRu79064YGl7vKFbFpl4x8jcu
	FQMmZEw+O74xMsDKNYiv825bwVE0eqoGhLSn7dKgbPvTI2zPgNtLA23jZxnPMoxwP88fWDrPDeL
	LvlBc2964ckynPrR7/mvH/U23eOc7YlLZ5URXzH+weJIkgNyJtwBEs/h6eNRAhijbKyD+vLyE5h
	FN4lKpBf6wW3i2JpRrZaj8kGmwb/1dm6lhgTlNBXTp82jOrcZubaTRVS6Srlk4lBCNwbsEvOyt8
	appFteSpfQm4/wjrX3Hh8+3MO/CefcIGxNYX6jOlHjosrLqcOTxh0psBphMCokAbfRelupcoLOm
	n4Dd/Uu8W0qoVwVso9qk5Uqnm32sgfsogw1v29Ro5o5Rv8EbqKep90qcZ1HnX0H9Eig==
X-Received: by 2002:a05:622a:1108:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4ee58850982mr463616801cf.3.1764687072813;
        Tue, 02 Dec 2025 06:51:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEFC1AIkd4sZg5NnRZh2dP3Lx7esOqdHbbwq92ke1aK4UNF1Fc3ewf3Fq7Wqsy4C7ZiuLQy5g==
X-Received: by 2002:a05:622a:1108:b0:4ed:a574:64cb with SMTP id d75a77b69052e-4ee58850982mr463616661cf.3.1764687072416;
        Tue, 02 Dec 2025 06:51:12 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64750a6ea41sm15652189a12.7.2025.12.02.06.51.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Dec 2025 06:51:11 -0800 (PST)
Message-ID: <6d225a32-1846-446f-9c3e-b90f52bc86d7@oss.qualcomm.com>
Date: Tue, 2 Dec 2025 15:51:09 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/11] arm64: dts: qcom: sdm845-lg-common: Change ipa
 gsi-loader to 'self'
To: Paul Sajna <sajattack@postmarketos.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Amir Dahan <system64fumo@protonmail.com>,
        Christopher Brown <crispybrown@gmail.com>
References: <20250928-judyln-dts-v3-0-b14cf9e9a928@postmarketos.org>
 <20250928-judyln-dts-v3-11-b14cf9e9a928@postmarketos.org>
 <68a07e54-9f0e-4938-803b-64d6f0c31e5e@oss.qualcomm.com>
 <c95cc75a560d5773c298537f6078949d32d22007@postmarketos.org>
 <0d98d501-85cd-4647-8d1f-126242c220a5@oss.qualcomm.com>
 <6c96f1ea3e156db82435909992995b424817bc37@postmarketos.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <6c96f1ea3e156db82435909992995b424817bc37@postmarketos.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=D5VK6/Rj c=1 sm=1 tr=0 ts=692efce4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=W-NSXFCFqqVfUt0Lr60A:9
 a=lqcHg5cX4UMA:10 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: 6lICRqbUPZmfyfhQRL57xJjfQc2NBDI_
X-Proofpoint-GUID: 6lICRqbUPZmfyfhQRL57xJjfQc2NBDI_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDExOSBTYWx0ZWRfX3ovutHvcwEwI
 /NZEbVRyuG3rAb/+koqj4kuIz+y9i0/ulxu6kpEVGjXkGpXN3hRRfxCZR1WWO5m6ZbA+urETRao
 NXVDqbldsN62RZPrmkRB4HAbuvN+yE7AQigt1NfvM5FUauAboKSygAdNtNCwDZBzBoBXJ347quh
 8O5fTL/s0sK5QKa4b0ycG4dRMEdYrq/lM0lzxWy8IqP5ENhyTfGBS+KP9AbBhC5gnH9fIV/A0Zf
 ad5Nrr4DIWu3u18sOGK5HGnXgbo4Q+ug26JykwdTfquMkb9UwZFsdz939P0IRwfYfJw1y90LrU/
 aeaImbNLzuDoXMG0N+EZHySOYGu4FCTv6H87uKVM2onJGl/n5DohwhA+hsQJnefRXd8jrD/eg1J
 LqIHPWt01LtJle0vO5W3QjjaQ+79lw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 spamscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020119

On 12/2/25 3:52 AM, Paul Sajna wrote:
> December 1, 2025 at 12:54 PM, "Konrad Dybcio" <konrad.dybcio@oss.qualcomm.com mailto:konrad.dybcio@oss.qualcomm.com?to=%22Konrad%20Dybcio%22%20%3Ckonrad.dybcio%40oss.qualcomm.com%3E > wrote:
> 
>> IDK if it's super related, but some phones have additional mechanisms
>> for detecting (particulary the secondary) SIM - any chance yours is a
>> dual-SIM and you can try using the other slot?
>>
>> Konrad
>>
> 
> No such luck. 
> 
> I think the device might have a second sim slot shared with the sdcard (if I put it sideways in the sdcard tray, there seems to be a bit of a groove there).
> 
> But the sim is detected by qmicli in the main slot I was using before, ModemManager just can't tell if it's locked or not.
> 
> The SIM is not detected at all in the sideways sdcard slot.

I'm afraid I can't help then. The modem is online and probably expects
some different handling from MM and/or vendor specific magic

Konrad

