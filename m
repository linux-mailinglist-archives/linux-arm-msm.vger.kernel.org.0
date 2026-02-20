Return-Path: <linux-arm-msm+bounces-93491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHSQJTA+mGneDwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93491-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 11:57:52 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F3616716F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 11:57:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 493AD306C506
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Feb 2026 10:55:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E747A33F392;
	Fri, 20 Feb 2026 10:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UH0OrIss";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="STQuzBL2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD78C33F8A2
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771584930; cv=none; b=fWCPZ32Q1VRNFr3Lc0yfZByV9Ur74dfu1/+ozsBo+2fVPp4iKM/Gf8EEHCEWOJYOKo/xa69N01vlWi8ZsDdCokOx9M59vaZpsxE+ZbOIaXRHSQEyC93VZPTI11/dW7UwzoQEScp+9kxXvGhbUtqs2NnLHuV/PN87s00RLvg/RSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771584930; c=relaxed/simple;
	bh=hXF+x1JktK+yexS5usTlTihc1s5axR4AJo0jbLjdnvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KP1S2xBOnaxAMwadi4jJ9I7Xt/kAVrg4fNnCfpVpghD2zIMu/DbtYvhy0l3kn9wrCXnHQikaEtn2bXqUROGaeWVW1TP4C3KtDVYCfPa846lQcWtCHwYQlnDyWGoxOHTAplkDXiEHY/LcD0OmiTTXsxBX1rkMLVVBdx3nxYdMjh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UH0OrIss; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=STQuzBL2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61K5RpP73034308
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:55:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3kSV0AQLn3tRu3E+qS36x6LCMF/WGHUdPt9CYSzJgAQ=; b=UH0OrIssX1+BKFYH
	Z3reK32zCd5+zmpso9pCOymzerk2fCoqt3zDU9AcQNsbFPfjLHyXnZz+xpMNRAWS
	2NPCYomkvdI/9AoyyZyOorUBMXxvcbKSUlkGUnum4nw2eDcPfFrnkubh4AclNknQ
	h8KPUW2D1yq9YCZwj8rJn5pv9nNohN+G9epjXr6aSzghFIneG8XSo19No6dyvXR9
	vTgzC01FOU+Rpj4JLtX23OhziZfa+zv1QXrneDtYkiLSyGYsmVUkbkvS680hGKJU
	Y1Zs+SdnLdyKAPq9VdMtm9AcWrRuV0/Ky6yXf8AJJ2p8sUf6hr8YMaS6b26Mf3jJ
	/CbhHA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce6k02k6e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 10:55:29 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb456d53a5so192773685a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 Feb 2026 02:55:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771584928; x=1772189728; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3kSV0AQLn3tRu3E+qS36x6LCMF/WGHUdPt9CYSzJgAQ=;
        b=STQuzBL2XdQlOGknIQXJjmewL3sNGjHSSiEPUGiXaKhzVXK2uvWMcfbCY+DcJGXO9R
         K7X6x3hVJCbwN2Qrr6BojJ19XIEONXRMrmdee8A6PCZ1wMhFQVNX9h9gCrAFUX8D+Gll
         twgQ5ciTAdo1wj0MMpOwdcUZ/UMdOsPiDURjHSPuFKOO08GnWgDbiLeToC7qZHZ2lHvz
         l9E801/OpdNf1/HAJu1syC5o+KKWErg+K2NawHcsjVxNZaA47dBmfVz1NE20TuEs2Cby
         pAYmPdkQGuhGKuhcjJ6pV+BAj4HF5fRxZucmkGPP7VTh5Bbum294JccpwxtpCk1kBzIg
         Su7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771584928; x=1772189728;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kSV0AQLn3tRu3E+qS36x6LCMF/WGHUdPt9CYSzJgAQ=;
        b=Hts97Z7agXs3xqVj+mnKhypj0qTKuxbXa/7BZs5Qf9uSFq+meprD5H+W46OXkn55Yy
         iBBarPlAT3CnMxbvl51uHG0XdBgjmj6X0tcbPQUeqBK6+ZjIauqfWXm1sCWrZ/aswowB
         p993qXhR0r0d0BgOulVj4SFDmWYYWHwE/z8UTAb83H995jFPrYP9B4fWk3TurRDlZX3s
         rqR4MFR7VJiUOjFXmDxGauChpx//5MnIMdS5tzKKR6ARF8El82JJ05KnZgifDFpBJDZX
         9K7Ex4F4vnUlw8KC8sDLkVwGnC8RDDQXQO5C+NBG79aLpO9x/hkbdVD8V6PUCicgaO5L
         SnVg==
X-Forwarded-Encrypted: i=1; AJvYcCWJODAhfER9iSawnw0BhOavhO71pPFLyNUgoyTSqriPLOi6LLQo3v02NVFU3uFSaA55G6R6GLOyrQpvcNaS@vger.kernel.org
X-Gm-Message-State: AOJu0YxYPBCiXCXKoM/+r9guO8sdf6ajxD4AvpjPvPf0Fk6YkKusPYaW
	4oxYW4TaA6OdvMcTwtOZCKO1+A6/ymYXSOf+qyWZAanxKVdK9k2ZLGRKqA76Bn9TQa7nOTCbpO0
	lmS2ZSuCWYxHNpt1O6m7Fdh7OQRHMME3uhjtNvyLtYBAFVs6R/oCw7Zp5nThBAcCZApsO
X-Gm-Gg: AZuq6aJiyio9iw+4gIqXf6S+W7sD1T1ZmuNu/YA04QBokYUG+0nOU6rzXZN3SwKqBnI
	Nh1z7vdVrwkbFDkqQBxraBWUIFegQyex+BP4MLYB8ngRo724LUT1UkNjb3FwTnVkZgtAVrc3BYx
	5liONaPT+Rpno6NbME+6+hoLoLDzdwXap0FKoU2pPv3XnUjkPzD9dDLVVZOi2mUAjQLELwsX3IN
	3A6X+016+/PBJD3dsd73Oml/XEzyMGYu3AntjYuQGhjXIKSkxKboYByVZMMyZ7T8GbhENK/5uuq
	Quf9/jM24sRbK9gbLq02NyOr0SlItEGmQbHMbH81PkoFG+YugI8U3KI7Km2XPizFx5T3ydOuQoc
	hgjbbFfcQFMFK2ON4dCw+a5jz4fPD+pEo4/lUK6xtoQ7+VbGS38EPY3BR8M+uS9eunPQ/3DoZgX
	lqLBM=
X-Received: by 2002:a05:620a:1925:b0:8c6:f7ad:49b with SMTP id af79cd13be357-8cb408839bcmr2377651585a.5.1771584928183;
        Fri, 20 Feb 2026 02:55:28 -0800 (PST)
X-Received: by 2002:a05:620a:1925:b0:8c6:f7ad:49b with SMTP id af79cd13be357-8cb408839bcmr2377649585a.5.1771584927756;
        Fri, 20 Feb 2026 02:55:27 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad3e38f5sm4675458a12.19.2026.02.20.02.55.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Feb 2026 02:55:26 -0800 (PST)
Message-ID: <13553877-a4d0-47ad-88ce-3d4d5b353101@oss.qualcomm.com>
Date: Fri, 20 Feb 2026 11:55:24 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: sm8750: Add camera clock controller
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
References: <20260220-sm8750_camcc_dt-v2-1-e4b7faf35854@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260220-sm8750_camcc_dt-v2-1-e4b7faf35854@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIwMDA5NCBTYWx0ZWRfXw4tnZWr7nW+8
 T3aAOZ3kHyKMp79sESDQUO3rbelGDGRLEJCpK+YJMmbxRubL2WLlBJxUcwv/GgY2CaCPP3MxyhT
 zlCIANCm9PV3q2saoRcuRl1buPBfafoMzOJjZS9Eun3h2Yk9N4UdZjCSstnLBWxYRAzFsbJzcdN
 2WLESMldxmOym5ya8RfrxTrKTm5HYDWxxWN6vt4swYx7SBlmAawR8fBP1d/98jMISM0s3UTcspL
 PgdirFoyAkT517XxiR7ZSafsrp3frFqHJCByV2G60jdE8Y2SYOqFRjwxnpY98BKKWIFSQwlpq2e
 NxpKt1nXo2X/tPBBfLanoSChF9FjZ1IywTt+qhrjRsGkWwzv6fWqN8rfNHXrnLBy0X7Gtn6CoWC
 MNmlT4NtCQFsIwrace4UCdVRujcV5crwak6sL3ENj60qFJv9rd5oLnpj9HdkDVtObOf9fjLOu0O
 g16ecmGDEhJghZYH0Sg==
X-Proofpoint-ORIG-GUID: ZKOEj0J4usUNC4F2fCUhbjFQkz3rsq8z
X-Authority-Analysis: v=2.4 cv=K6Ev3iWI c=1 sm=1 tr=0 ts=69983da1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=ETP-j5Bw7z56Rp2nCt8A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: ZKOEj0J4usUNC4F2fCUhbjFQkz3rsq8z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-20_01,2026-02-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602200094
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-93491-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E3F3616716F
X-Rspamd-Action: no action

On 2/20/26 11:28 AM, Taniya Das wrote:
> The camera clock controller is split into cambistmclk and camcc. The
> cambist clock controller handles the mclks and the rest of the clocks of
> camera are part of the camcc clock controller.
> Add the camcc clock controller device node for SM8750 SoC.
> 
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
> Changes in v2:
> - Update the MxC phandle to use MX for camcc node.

My point was that both MXC and MXA are used

(I see MXA particularly near CSI[24]PHY, but it may be a fluke, please
take a look)

Konrad

