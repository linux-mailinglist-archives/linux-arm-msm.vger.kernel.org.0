Return-Path: <linux-arm-msm+bounces-91768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MNAQIdrTgml5cQMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 06:06:34 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B424E1AA1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 06:06:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 56AAB3001FD6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 05:06:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49438352F87;
	Wed,  4 Feb 2026 05:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hEhmAJTt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KUXonyIV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17165352C48
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 05:06:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770181589; cv=none; b=OVxQgKCe23v7Mja4KPQaUjwha5S4yy87zD9amTcISLtX0IvhtvgvC1wB+fhLjQafMmF4l5FiJ6/fYwTo7HhSEfuQTbvADObvn/rdf1rHRqASeJJlrGPKN5X+ZO74LY7EZXznE1bBNdj2NEkvXDT2sp6m1sLWDcLuED4hfRQR2HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770181589; c=relaxed/simple;
	bh=v0Nc2YH5z1X149t1QdEpqLjxkN1uvo/AhimP14jLGsU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rNUCZh1H/Twqf/VKvNL4A6EyRwC4yE/adToZ09CRJa45DQdlvKwciS3UvFIFs2bA119OIAK0hh3s3rmCiesLMqPosyH4sovxMXqOt6z21FnomzGT1dK47ibRrZLEvYUFDJu7URp2HW9fvRlPs9rcqgQwpxXs1Zii2pD1bTXadT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hEhmAJTt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KUXonyIV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613LK0ej3515406
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 05:06:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vaoYfgH1dPngMdoHN9hAnw+piYMLJCeQPOePWMinXqo=; b=hEhmAJTtPtKG2uOO
	fHDqNTClz4IT4m+FJPVWlkG5b+TT36V/KhM1CKk92wb6dGBSX3ViIEXg6RNvZcXz
	PLbb+dKu6xvWuZItTlXVdP9aoHypluZTlfcsh1Yi3b4nErw4FguXverwERvbckft
	2tizu3baEwjB0sLD3jMeFRhY0zNRLspR09ahM7o972xdZ52eVU1ziwzzfPgXkuvu
	m5a3tIzNuI/+Zikn10Fs23TgzOpQCqFszNwapVITtSqGAHAu+VDX3WslHPaRWksi
	VbFWEpnW9FxNzOPNbsORWPkQ0psNqdE71s7h8LlxMlfbKQFchSRCenKDgWPNM/Vg
	e7UCBA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c3ru996k5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 05:06:28 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82181ef69ceso3188349b3a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 21:06:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770181588; x=1770786388; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vaoYfgH1dPngMdoHN9hAnw+piYMLJCeQPOePWMinXqo=;
        b=KUXonyIV61yspXE5sk/39///V95AFAcf6kwWAxfZc+gZ5MlSHe4yuD1i0/13b0W7e0
         b0lgKpVCDLvW8B0UJl4yHrvMEBmX+Bgnmd3ih0aN4GwPnCwTKS/pmFRmqDqVGyQkCERx
         ConN4+ZS/4tnhPstCRgK0ADwrUXe1BX4vQB0MeXuNAMmLewqP7EKAVgIJ43xaa7WkNJ4
         8l5Bpa3MB4Y7O5B/wZzJ6v1PT0aG3zqjWFOp5CSg2N3xbb8XqU9a2XplLdvCikl4lr2e
         vXxFaNcvhSwQbaXdGirFzCT2kd8svJ74+47C87d08UUFaIgMPYMNWbzAkNqzN/3lQc/T
         Ja/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770181588; x=1770786388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaoYfgH1dPngMdoHN9hAnw+piYMLJCeQPOePWMinXqo=;
        b=gJc1UxIxNUmtsa5oLfOkYj9GbeaJ3Q11jFy3aVcu7cvCJNbZQ2csEoi7pBflywOedy
         hWeZuZoIYC9SX/1W2tko1YbZebkqaJroxz5Sx9CtbTgtS9MhFjhZe46EDDZ/A94kHQTn
         9gs5Q+O1kNtaZGbrXW60fA4zfJY58VADoO+6p0Rg/O2Ig/HbnT47nM/31LjPGUuJLKhW
         IMim1eIwyGsuCO+SmtNT97bdMaS2U8tvTgY6sS3eEhWPPNhxkKPGqxs3/ieSEdPs9SFW
         pcvF/+tcoP2hBEKeyjSIwajxZZIszbOQ/qbTzx1IqkIbmeJMFdNPh1HmoJ5zRcOQKvsS
         dziw==
X-Forwarded-Encrypted: i=1; AJvYcCXLN2isZAoMqIxATjjwENzyre/VO+czBxmR14bIymy44/KeWISDLzjURd71jcY7AYlvSNsn8caC6Icj03Tb@vger.kernel.org
X-Gm-Message-State: AOJu0YyY68rx5PJcjOnJ/4J8prChYIxmQwTIm7nn7hwFbNw0yQjxYTcZ
	BkCnLkSAFY6kXgXti6Z0Zil3JQouw2Zk+KfSidl38yF40B62kQyHe0TKIs0VOUSWqNqAuEXe2lM
	yQqqLIyrzv+OUXwH6sLee2IZQQaqrDvjf222wXZv50ZAoEScNac4wrSlg/q2A/5xju/M5
X-Gm-Gg: AZuq6aInWE1yKtP6kMLZcXdhll9uY8iruwQGqicEQzebNT1nrfzDs8uEgMLBivFuM4t
	fJxlKt9VOQvcq8RJTw580Z0sdzNgGpHq4IoGlUSXAgMIzqrxpDrf/JcBtMEtrfORuL6CB5flB8l
	4HwHs7zgAk1Gl//5QfSUdmB0uh2rWfoCsgKlvdH2vZwPOy25mbmsqI6tEGnHxYYC0TZ9fSwmNve
	mYZyZmNYzRkfweF90VPcde0aHIEMLRvZrnGBCQU71dowqO2dO1iposxcxopPBa//y4EO5rJwqdi
	szms824quKyaPwWVGz3BpQWhwqdmopkC5pfDK6VIufd4LsYCH55tNEBO5q3jzAJdCGc0s8Yjef4
	m8cpmKfSX1UvjMfc75NUFGITHXHjoy8rhQSuas5frHQ==
X-Received: by 2002:a05:6a00:9290:b0:823:12cb:f5d1 with SMTP id d2e1a72fcca58-8241c1973b4mr1811716b3a.6.1770181587686;
        Tue, 03 Feb 2026 21:06:27 -0800 (PST)
X-Received: by 2002:a05:6a00:9290:b0:823:12cb:f5d1 with SMTP id d2e1a72fcca58-8241c1973b4mr1811676b3a.6.1770181587115;
        Tue, 03 Feb 2026 21:06:27 -0800 (PST)
Received: from [10.218.32.171] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8241d45b996sm995034b3a.45.2026.02.03.21.06.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 21:06:26 -0800 (PST)
Message-ID: <3466212b-802c-4ea3-8661-794da34c6c3e@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 10:36:19 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 11/13] i2c: qcom-geni: Use resources helper APIs in
 runtime PM functions
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, bjorn.andersson@oss.qualcomm.com,
        dmitry.baryshkov@oss.qualcomm.com
Cc: prasad.sodagudi@oss.qualcomm.com, quic_vtanuku@quicinc.com,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com
References: <20260202180922.1692428-1-praveen.talari@oss.qualcomm.com>
 <20260202180922.1692428-12-praveen.talari@oss.qualcomm.com>
 <7733eac7-8158-40f8-8887-44e458d33e9b@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <7733eac7-8158-40f8-8887-44e458d33e9b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDAzNCBTYWx0ZWRfXy610JJ/havy+
 fQTITSgaIF+ywYzeWB7iJDLIWxLJRemT1/Uve8sNLiSjcS8FFI6i1gbLsY9jsVxrpftOUAimp03
 vjpbm4rBaOgqaEr+1mOJC9Vl5BOXupNHjzm9YzSQFq2KKBHK5W7ObKijwhLNomNs/dtcUWdUe6n
 IR219zUJzhNG01W14qE6Nndps2M6OiVpfKlEc0pczOWU2TyUL/SNqRkwdJeG4T99YpHWkw5CeAe
 SiuYYN2kbx5DtqhXguVsI5/NCbMkQN19nupt5izZJDeZgfUDtMMbgH9K4V0gkMVgK645NlONk2D
 tQAg9lQ5GjLnqj28FTBAcLg8QtiZq151E8Vg2mCdIn5i/nKCP+qdvyfU9B8KAepk0o9l0lM0dJz
 f9iSYJMJCCNUwYW0yhFR2PHaO0bJFcxw/S/5ymi1ZpOyVo6hiwXo/9VhISl/TAYXJ48hoRgcYys
 ZS9bVO4z3r0B533FNaA==
X-Authority-Analysis: v=2.4 cv=IJoPywvG c=1 sm=1 tr=0 ts=6982d3d4 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=7loHADMVyoySppEGI2kA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: MpdaiF5KWj0XAe9F7mPod_hNTidRqIkd
X-Proofpoint-ORIG-GUID: MpdaiF5KWj0XAe9F7mPod_hNTidRqIkd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_07,2026-02-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040034
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-91768-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2B424E1AA1
X-Rspamd-Action: no action

Hi Konrad,

On 2/3/2026 6:18 PM, Konrad Dybcio wrote:
> On 2/2/26 7:09 PM, Praveen Talari wrote:
>> To manage GENI serial engine resources during runtime power management,
>> drivers currently need to call functions for ICC, clock, and
>> SE resource operations in both suspend and resume paths, resulting in
>> code duplication across drivers.
>>
>> The new geni_se_resources_activate() and geni_se_resources_deactivate()
>> helper APIs addresses this issue by providing a streamlined method to
>> enable or disable all resources based, thereby eliminating redundancy
>> across drivers.
>>
>> Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> 
> [...]
> 
> 
>>   	disable_irq(gi2c->irq);
>> -	ret = geni_se_resources_off(&gi2c->se);
>> +
>> +	ret = geni_se_resources_deactivate(&gi2c->se);
>>   	if (ret) {
>>   		enable_irq(gi2c->irq);
>>   		return ret;
>> -
>> -	} else {
>> -		gi2c->suspended = 1;
>>   	}
>>   
>> -	clk_disable_unprepare(gi2c->core_clk);
> 
> I believe you can give gi2c->core_clk and desc->has_core_clk the boot
> with this patch since they're no longer referenced anywhere

Sorry i didn't get you. Please share more on this.

Thanks,
Praveen Talari
> 
> Konrad


