Return-Path: <linux-arm-msm+bounces-91451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4D5sM+1wgGkw8QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91451-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 10:39:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 47611CA31F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 02 Feb 2026 10:39:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22BE430021F4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Feb 2026 09:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 917252D7DC1;
	Mon,  2 Feb 2026 09:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YK/XKpyw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BE0Sy+pc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A92E2D063E
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Feb 2026 09:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770024936; cv=none; b=Wtg7InPq9iq6iH4VBEWfe8d5snUplgo1nNxkg3Yy9e0ILbZpsUPNtUxlZEz+3NUypTk7HKAH+LsB2d+sXrViAkdqnPivDzc8vRXRAd0mADs9OlPevuoZdvCLwQhLsxjlNCyKCVlzT5A6Z/Z0g7CFIYdHs+HmvMOqw6r/XHiXd/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770024936; c=relaxed/simple;
	bh=sfWIGyBwuhfBpP4h1z5zlvbCjqNB0HjmX2htIRl46Pk=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=fEWDSbx5ALhkb8caL/Xx4pU/VeYvf1cBBpgpoACrJDTsyncXs/IrE83G9lURNW1Bqjbd5TCz3l6207oL/WFQIoTZZ2kzhAB0Lai2m8IMullECGb+rDcf4CtqosAWviZkuua20QtoFi9hvo5ra0dBjPnOeg5+M7ooHpnbj/uqW2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YK/XKpyw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BE0Sy+pc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61286SIw580756
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Feb 2026 09:35:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oOX0RQXch0nmlRsVdA8Ov/nUBihECFGPVdg7TP23OHY=; b=YK/XKpywH7OqJ+fS
	xiy/zvTgfz8H8xWIduWfIC8PlMsyB17OWaxTd7fj/MbSUdjMUprV7HURrQ+SDkqv
	cfIwzxOY48feH1Z/nIM4AdikD6TpakgzC9zPTaeeyzNydNdCrI/MGpGAccpTVNfo
	ruEpPC76bzOTdhzCeM/qPSNswvGimraqHadM1AD1cDC7ntFrzVWH2Dkuv/Xdkh7A
	VX38p3V2rH+LW+Qsd9v47aUk7/7ugZn2IaZIbgrFDBkJ2YW7PZ1vjFoj4CeN1w0x
	H4AjHEwv3I2C7t0YC/xATAay+FsuKn79DgVmp60glK5c6WZPMgJp+c67A3q5dvib
	yZPcIg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1arecu59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 09:35:34 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-29f1f69eec6so47002005ad.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Feb 2026 01:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770024933; x=1770629733; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oOX0RQXch0nmlRsVdA8Ov/nUBihECFGPVdg7TP23OHY=;
        b=BE0Sy+pcp83+F19O5BCjZrkyoudBpM0lUY2sJCgaYJRD6IcngFfkRghnuMXvybq/OM
         S/lSTeRWEldawehSUu/wVELXNtCVyC4LYvAMBVypmA5bH7MvohHKx3x4jmBk6GDhLmHa
         ITtAcfPE6ySAXnsanZ8otA3Q9XyU4HNsgWKQXLeGCnMVcgL6z0nj/ApzOS2X6582so8B
         PoTwbkf9t98QWQThcaha1mtxedWdrIr46BfH+ogNcZU+UxaWOP+dBWKCIuBd00FtbaYr
         UpjPQtrFHsXAa4+w51nXg6BLrg/YezY1+uYNYkaOHhsAFig6aIr4ZpD56mUqb6zG3Ntm
         VV0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770024933; x=1770629733;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oOX0RQXch0nmlRsVdA8Ov/nUBihECFGPVdg7TP23OHY=;
        b=j8FvHFq4FhXPF9cjUUXywJfsIEUe0tw98GuPd9aJOKNedB7MwelUPf/rHv3IDjOv3K
         fzUrjrfMbCjxSyan362sqOKvLjLECsfcuSwOc9ysQ5yubyhUiNvdR2VeK/ly6ewW45oO
         fNoEPiHtyS6YA0CkRlL75oWU5xvmCUJMj6HasHZNh2wheVk7c/AKocHj1QjbXEEExQf+
         NA6hIoNgI9NRhmzBCmxEu0EV3Ckz03kNBzIEJPaBtTYDY55gzHRahjqMnIOcbbFF6TkJ
         o62L4jk6b7+LAn/IzpCVEO0VeRYwdAcX2RBnwiRmP4ztvL+6RwnlYgABUy+gmoqkhTmj
         s8lg==
X-Forwarded-Encrypted: i=1; AJvYcCWZJPe26lWLjqaMlRnwsdnstAKl6sIx7QKFXqFOso6CYEPPw6I+1m7vZsn4FSQX7KLi6kXixTmzjVQx9AIE@vger.kernel.org
X-Gm-Message-State: AOJu0YyVH8oVq3GdLawekY1LRWAx/9Ak415hQ83eQGhyj2whrLQKTSpk
	dFsIacJOYiC95G3pPJLwnRPvv4VtCcPYRv1+VeqndjJAMTsH5gRCDwvn47xr407mA4Afc16vLy5
	NEsvlST+xXn3GxNPlGHdWH3UF/AdDLSgFrKaWAQqu8IrrAiEtJY1YigFrNawP/w5q1GMk
X-Gm-Gg: AZuq6aL9MqxR2Vrl5jIWx5s5d4+PeyG/ikDwQgGE/GAoCsedXuv47GKZW0ADIw31nYm
	aRv2wgUgQfP/VGgV6AD2UXFOTm/vsh/bTNTfh7JXZTkpvIIjDnTezxOXB8LHqIb7ufr4YT42uef
	QgBAIfee9NNoz1Yq8gd7wJV8GXthWcpPJvMpwkhANvAi7RxFhqspCQUYDRsddmw8u/nY5Inle2w
	WZHbQYLJy2xj8/QXeEn1qiB2wvKA7r4TV/wXbJiMM6I0qFtLjptr8jrAmKTuaMUQNNPpumVEuED
	JvU99Y83va//B5EYM0U7G3PWsOfPP1QJfWxDikmPgAsKjD416o1r/F28jkpFaEpt7oeaJm02Dyq
	k5ki1AeYy2fiV6bVWPsEIFpJj5F4z34ABteU/pw==
X-Received: by 2002:a17:903:15c7:b0:2a0:b461:c883 with SMTP id d9443c01a7336-2a8d993031bmr111939695ad.45.1770024933082;
        Mon, 02 Feb 2026 01:35:33 -0800 (PST)
X-Received: by 2002:a17:903:15c7:b0:2a0:b461:c883 with SMTP id d9443c01a7336-2a8d993031bmr111939485ad.45.1770024932599;
        Mon, 02 Feb 2026 01:35:32 -0800 (PST)
Received: from [10.217.217.147] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a88b3eec76sm144862435ad.19.2026.02.02.01.35.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 01:35:32 -0800 (PST)
Message-ID: <60c970dc-141c-4a2e-aaee-719786371eee@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 15:05:27 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Questions About SM8550 Support
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Aaron Kling <webgeek1234@gmail.com>, linux-arm-msm@vger.kernel.org,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
References: <CALHNRZ8qSOZKwmBznRqvAAjMcQ265iEdBXEA2RSkSBViKO=uEA@mail.gmail.com>
 <4d73907d-9915-44a7-99c7-2294c4be01b7@oss.qualcomm.com>
Content-Language: en-US
From: Taniya Das <taniya.das@oss.qualcomm.com>
In-Reply-To: <4d73907d-9915-44a7-99c7-2294c4be01b7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=NNfYOk6g c=1 sm=1 tr=0 ts=69806fe6 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6IinWshm-UE-nyPm_oMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: 0XHF7MGNSiFRV4_PUDgSuOUC5BtUKExF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDA4MiBTYWx0ZWRfX83Nttn0c8DhJ
 VDEE1F8NldT6X9aGVnYKZv/4LM7/ehKq8THW6frdkIX2+UU6fTox9SoVGsvqiUojuzg+DDtgfRk
 jepz2HkNU2PYKw3cPsNLUJlCNXgfXJyK/uiNlPljnbK12isspxLO4KHP/q2xLoRt375JDPDEsKt
 jYOP5XChltbduwQvVVd8jFdEN/HKli4/5oo5lfMOpQ8TBWdTsduDXXLd/fUUQp6aSDRFStvOVQw
 WGc7yfbh04SwgM1JM+cbi/T/EHSENOdLlOL3AGeusArvY9Vbjlw4cciqLI8D7bLZ2tZfepi2vug
 l1mV9VFJdWXfdjlbUG+HB8kaSMUDLL1gOK+m2orzVYfsWLw7jkW//sVeW8xMdyguivCoDIMgJ9t
 wleSEPzJZnvt+wzQncL38KkchC1qlyPn04vzf6jtvToUo5polPBsBa6/KeUSNcOHlfHQw2IXE37
 yJk+7Ai6kL047Km3G/Q==
X-Proofpoint-ORIG-GUID: 0XHF7MGNSiFRV4_PUDgSuOUC5BtUKExF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_03,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602020082
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91451-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[taniya.das@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 47611CA31F
X-Rspamd-Action: no action



On 1/28/2026 7:33 PM, Konrad Dybcio wrote:
> On 1/27/26 11:48 PM, Aaron Kling wrote:
>> I am working on the AYN Odin 2 qcs8550 series of devices, specifically
>> for Android, using mainline kernel drivers. I have come across some
>> missing functionality and failures that I would like to inquire about.
> 
> [...]
> 
>> * Some gpu related clocks complain about being stuck off during boot,
>> causing stack traces, but the gpu does work. I tried to do some
>> research into this, but quickly got lost in the weeds and I have no
>> idea where to even look.
>> [    0.367278] gpu_cc_cxo_clk status stuck at 'off'
>> [    0.367962] gpu_cc_hub_cx_int_clk status stuck at 'off'
>> [    0.368595] gpu_cc_cx_gmu_clk status stuck at 'off'
>> [    0.369245] disp_cc_mdss_ahb1_clk status stuck at 'off'
> 

Aaron, if you could share the boot up logs or stack traces it would be
helpful to see what is leading to stuck at 'off'.

-- 
Thanks,
Taniya Das


