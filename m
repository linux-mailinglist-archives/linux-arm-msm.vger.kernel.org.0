Return-Path: <linux-arm-msm+bounces-117900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id m4kcGr1YT2qXewIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117900-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:15:57 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C58272E239
	for <lists+linux-arm-msm@lfdr.de>; Thu, 09 Jul 2026 10:15:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=kmDwH4F5;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b="Gz9kw/M1";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117900-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117900-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B6C0A3000890
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2026 08:13:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 568983B9D9E;
	Thu,  9 Jul 2026 08:13:46 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FF423D5647
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jul 2026 08:13:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584826; cv=none; b=c9wRYWqNhkGzZxYRVcDy8l0bXFRYA+vXBLk3C9hxPVbUwWWkL2hVQ4IH6I/DL9IKK1IZPHJOK2D5W8vW+KXcY+f1Fvl4FcI4pw/wX1Hgqa6auo/lqyGkahzMijgrLdvuvUFaOwDgGIkHD1KLOzczGBwqy6zml1ldzZn8V6HeGEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584826; c=relaxed/simple;
	bh=9/WUWgdh3PDVlVDre2TUuajRrGAsJgm7LeGNzpx2VIg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JPrZ66hUA0vkFZEAQ8JKU3ffQGZSaT37zvEspEAEAg5f/9V/Xg2eeX0w6h3I7QvaEiudcEPfiCPcztMUVbIi2QUiOZWGOK2KYRrd9Kc3vJq3PIRPN/OM4UjI4ztkHyXzG8g+ZqMpXG1cVUjcBbq4A6Ll8FKjzwwcg5YkbZQfNfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmDwH4F5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gz9kw/M1; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960GSM887925
	for <linux-arm-msm@vger.kernel.org>; Thu, 9 Jul 2026 08:13:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s9q9J4qXMFiZ/ZPLYqKi9AFHblEBcuFUAYAJ6Fh6AC0=; b=kmDwH4F52D77XGIs
	zjpium6op2JzSAwo0yBl4Esk9iyeD02LiEpY6+AcI+YUWyiy9fpDH/xOVilj6Y/e
	FXrlloZD1HK5iCDri/SRZTKmn7B/kOKscLc4tB81eGqVC85rqvwxh8RkiD6e0Jn8
	zRsrHaARZ7wVtvNHo5zQ1qfEdsOzyQ9c9dGU5aV4iKJTCqhjtdAj3HpAytGvDU0Y
	W0t59pFXueW29ylZOqhAn+Dg+B1LcIDvJEeynvtanOQY++Hj4ChtNupWSCte5Heb
	ylueQOuZE8SuhNV+bxze47lIDbOV76j05WCvIW5qByKM0M7DQRhOw+/LLYWNJs/I
	n5q0Fw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq33g4x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 08:13:43 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ca0481106cso22380155ad.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jul 2026 01:13:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783584823; x=1784189623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s9q9J4qXMFiZ/ZPLYqKi9AFHblEBcuFUAYAJ6Fh6AC0=;
        b=Gz9kw/M1Ch2iyBxnK49+PIETG8gNizR9qEa0LUohorzADtB6k8cZkNsRY/yWdfqjaz
         nO591wuip5g9c9eBrtnmK9PKv2HYJYxAXn5rus+YvrELrxo78hYLHJQcF0ljjRbZ5yG1
         PfkQM1/5sajhpzdAvILGfxjit1UdiyQRck6wnMiZy/svvu+15+TRBWlIGw1KWbPsCNvq
         I//Q3S0zropHhezwc1Z6UOtZgCSWIHWcEZps4T/+NUCQZwOEQDYucGEL4p9zWR4XrOBX
         qvPnGNq43zKtxDtFrxVmXDax8ihTFE+ttYNHOhh+mYkZG91owte4yLqi7KNtpSwqPf0i
         IZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584823; x=1784189623;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s9q9J4qXMFiZ/ZPLYqKi9AFHblEBcuFUAYAJ6Fh6AC0=;
        b=Iual+BKsBwzxxMLVVMun7dLGV/Ixjnuy6tEyA8w9hR/dwHILCtu29tetfYXGkvRU5O
         sK4K53IHPv0DQubPQwxh/XLBrt9uee2nLkrHwVfiBpvdOyrGSoBqGQVvhwY+CeID1Pm3
         /Dw16W5lpVyHKmLRq14zfwnslyxUVVOCXfpGZ6v5SoD0uOEQwX6upqzCZSOnoHUV6gWJ
         AR3pB66BpBIXUwFQzNH1jUxZWmztZfhSBs3XX56amdX7l3xD8c1sIKuGY1/tWn8cN4NL
         5Z6D2Xbzs5Uvc6x+lNo4Ja40hHnsq7r281ozl7uwOyZqn7BMQozVCdSWERb3hEefvBuC
         pqFQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSMIjy5XtF94nqxLL+2q3v52Yify0PNXBacoApu4PjWuJJbhd/toJa5ULBOCTrMxDAbUM94yL6vJqMI+6Y@vger.kernel.org
X-Gm-Message-State: AOJu0YxIAzDQQRlVn+W0Yf4TcTVGmHryFWerlOIpC3K0u9Hi9H4v+WPD
	lkkG15ROQRbeILxyNbqSj2Svwkje4vZLj4j6G1NRqZ12d4NWftyb0VQe4EpJRUSKmaSvVZoLC2S
	HQR8KwI5+zYylFuqFij2WnDoeWRPhF3Pxw7NJXLRlFifptMXwM/H+yf2vrhPGwLzll+Xv
X-Gm-Gg: AfdE7cllLPowA/DjCxR+2rX3/D/0j6ldAhVgHGpcsVaN0LdAJk8TqWOvmQMEWbX4t4c
	PCA9KRti2ShuVHkjCkt+c+4tAUuUziJH6E6c+mXwsVRc4ZWzkzsFy1KEcn+tDPWuc/MMNZk/Fur
	Zno77JFFKduzpjQCTYpfLwnDOHcM2RJ0RrfRS8vCR6GNZTd2z7DKB+Y8ObJJ2m3pIpa0Hl3MAIH
	xAVkC7iGLoYjLU7FsPWS6MhW1ZHIxAlaFx58CZadce2I9uuoAEwJK8XYVrIw/q5pzNGs9qpCuLo
	TXrlhz65g1IraqYKL6f2b1xknXmyHutQpNvPeRQ0QZv9MG9SwWThH+de1eLWjcyUhCWHycoi4Nh
	5b7wG3yS/yFknm6rNykOm+KASpxafXgam0l13c9tRVzSlsZkofw==
X-Received: by 2002:a17:903:3250:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2ccea371b35mr61446575ad.5.1783584822632;
        Thu, 09 Jul 2026 01:13:42 -0700 (PDT)
X-Received: by 2002:a17:903:3250:b0:2ca:2079:91cc with SMTP id d9443c01a7336-2ccea371b35mr61446215ad.5.1783584822124;
        Thu, 09 Jul 2026 01:13:42 -0700 (PDT)
Received: from [192.168.31.103] ([152.58.31.181])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9c100adsm39213395ad.32.2026.07.09.01.13.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2026 01:13:41 -0700 (PDT)
Message-ID: <b7404cdb-7c67-40b0-8124-d4977a8ed3cf@oss.qualcomm.com>
Date: Thu, 9 Jul 2026 13:43:36 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6] i2c: i2c-qcom-geni: serve transfers during early
 resume
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        andi.shyti@kernel.org, viken.dadhaniya@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org, Bjorande@oss.qualcomm.com
Cc: konrad.dybcio@oss.qualcomm.com
References: <20260629134140.755193-1-mukesh.savaliya@oss.qualcomm.com>
Content-Language: en-US
From: Aniket RANDIVE <aniket.randive@oss.qualcomm.com>
In-Reply-To: <20260629134140.755193-1-mukesh.savaliya@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: iw2_mICF3N-UqSfvWgLQDQsAhHSYCJxp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NyBTYWx0ZWRfX4T4O7ZAcVUyA
 oXKr0PB/3LkCNq1+EMTJ6eEMyfd13RwvfvFNkcI2Z5ol9ME4ANEJIyb07HS0VP4voKOwaOQhlFB
 IjrJneRGsClM6cZVV8Ecn/hyAbDtpQNBylWaAzL9aR5vn/NWsS+0agTQ1Lk4XaEZsF4GHjlH7e5
 FTTmnm6Ov4tLMQ+PcNrpZX5n4KwmLGIbh9acZfvAOg5LJSL1UBnLLODncd/4aCGMxx2OHMrqSej
 2vg5saoar+O8byKfGfeRORvIha+TgYrMHBvVJV9qpvASvsU9/t3lFhIcMjCu5v4b1GJkfJ11hnC
 FFvdPN+msZaeoYHPUl5jfpxsrR6IpP/UaTxC+9bq8TKd165N/xml5CoLVbMMzAn3lI4KN89MnWd
 R0nc9RAIE469KBk0fFI+5pVo8VKB9fRDsGZOHm6b1SESciu3si4KRMuDww6ykT6gzMyzzcImc60
 glj/fqGPB2dgWvORpGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NyBTYWx0ZWRfX0ZcmwhGog5LH
 KoDcgtSSbwHl3GJucgnG1KE115n18YBaCdxQbG/E/+ezYySHmE41QdDMfmyYk2D+cb/sPaE7tqN
 pWuBIHAMNE/YBsfjxkbFeA6byN3hdPo=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f5837 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=9AXozQ6IwN0d4JI31gUtBA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=55kWd-6b5CD8CZZ_UxgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: iw2_mICF3N-UqSfvWgLQDQsAhHSYCJxp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090077
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-117900-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mukesh.savaliya@oss.qualcomm.com,m:andi.shyti@kernel.org,m:viken.dadhaniya@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:Bjorande@oss.qualcomm.com,m:konrad.dybcio@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[aniket.randive@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5C58272E239



On 6/29/2026 7:11 PM, Mukesh Kumar Savaliya wrote:
> I2C transfers issued during the resume_noirq phase can fail on GENI I2C
> controllers.
> 
> Some devices require I2C communication before their resume sequence can
> complete. One example is a USB Ethernet device attached through PCIe,
> where device configuration must be restored over I2C before PCIe link
> initialization can proceed. Since such accesses occur during
> resume_noirq(), the underlying I2C controller must be able to service
> transfers at that stage.
> 
> However, GENI I2C transfers rely on interrupts for command completion,
> while IRQ handling is still suspended during early resume. Additionally,
> runtime PM may remain disabled until later in the resume sequence, causing
> pm_runtime_get_sync() to return -EACCES and preventing controller
> resources from being enabled.
> 
> Allow the controller to operate during early resume by requesting the IRQ
> with IRQF_NO_SUSPEND and IRQF_EARLY_RESUME so completion interrupts can be
> delivered during the noirq phase. Also restore runtime PM from
> resume_noirq() when it is disabled and tolerate transient -EACCES failures
> from pm_runtime_get_sync() during the PM state transition.
> 
> This enables GENI I2C transfers to complete successfully during the
> resume_noirq phase and allows dependent devices to finish their resume
> sequence.
> 
> Co-developed-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Signed-off-by: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
> ---
> v5->v6 :
> - Modified commit log to start with problem description as suggested by Bjorn.
> - Moved to new implementation of the logic while earlier replied to comments on
>    older design and considers latest fix added recently.
> - Made change generic to I2C including GPI mode transfer, this was not done earlier.
> - Changed email address to oss.qualcomm.com domain.
> Link to V5: https://lore.kernel.org/lkml/20241227130236.755794-1-quic_msavaliy@quicinc.com/
> 
> ---
> v4->v5:
> - Commit log enhanced considering Bjorn's comments by explaining PCIe usecase.
> - Enhanced comment with reason when using pm_runtime_force_resume().
> - Corrected IS_ENABLED(CONFIG_PM) condition inside geni_i2c_xfer().
> - Improved debug log as per Bjorn's suggestions during suspend, resume.
> - Reverted back comment before devm_request_irq().
> Link to V4: https://lore.kernel.org/lkml/bd699719-4958-445a-a685-4b5f6a8ad81f@quicinc.com/
> 
> ---
> v3->v4 :
>   - Enhanced commit log by explaining client usecase scenario during early resume.
>   - Covered 'usage_count' of 'struct dev_pm_info' under CONFIG_PM to compile non PM CONFIG.
> Link to V3: https://lore.kernel.org/all/20241119143031.3331753-1-quic_msavaliy@quicinc.com/T/
> 
> ---
> v2 -> v3:
>   - Updated exact usecase and scenario in the commit log description.
>   - Removed bulleted points from technical description, added details in free flow.
>   - Used pm_runtime_force_resume/suspend() instead customized local implementation.
>   - Added debug log after pm_runtime_force_suspend().
> Link to V2: https://lore.kernel.org/lkml/202410132233.P25W2vKq-lkp@intel.com/T/
> 
> ---
> v1 -> v2:
>   - Changed gi2c->se.dev to dev during dev_dbg() calls.
>   - Addressed review comments from Andi and Bjorn.
>   - Returned 0 instead garbage inside geni_i2c_force_resume().
>   - Added comments explaining forced resume transfer when runtime PM
>     remains disabled.
> Link to V1: https://patches.linaro.org/project/linux-i2c/patch/20240328123743.1713696-1-quic_msavaliy@quicinc.com/
> ---
> ---
>   drivers/dma/qcom/gpi.c             |  3 ++-
>   drivers/i2c/busses/i2c-qcom-geni.c | 12 +++++++++++-
>   2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index c9a6f610ffd9..332f3aa40628 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -615,7 +615,8 @@ static int gpi_config_interrupts(struct gpii *gpii, enum gpii_irq_settings setti
>   
>   	if (!gpii->configured_irq) {
>   		ret = devm_request_irq(gpii->gpi_dev->dev, gpii->irq,
> -				       gpi_handle_irq, IRQF_TRIGGER_HIGH,
> +				       gpi_handle_irq,
> +				       IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND | IRQF_EARLY_RESUME,
>   				       "gpi-dma", gpii);
>   		if (ret < 0) {
>   			dev_err(gpii->gpi_dev->dev, "error request irq:%d ret:%d\n",
> diff --git a/drivers/i2c/busses/i2c-qcom-geni.c b/drivers/i2c/busses/i2c-qcom-geni.c
> index d2f5055b0b10..d56b36bd1d26 100644
> --- a/drivers/i2c/busses/i2c-qcom-geni.c
> +++ b/drivers/i2c/busses/i2c-qcom-geni.c
> @@ -913,6 +913,10 @@ static int geni_i2c_xfer(struct i2c_adapter *adap,
>   	gi2c->err = 0;
>   	reinit_completion(&gi2c->done);
>   	ret = pm_runtime_get_sync(gi2c->se.dev);
> +	if (ret == -EACCES) {
> +		dev_warn(gi2c->se.dev, "Runtime PM is disabled:%d\n", ret);
> +		ret = 0;
> +	}
>   	if (ret < 0) {
>   		dev_err(gi2c->se.dev, "error turning SE resources:%d\n", ret);
>   		pm_runtime_put_noidle(gi2c->se.dev);
> @@ -1045,7 +1049,8 @@ static int geni_i2c_probe(struct platform_device *pdev)
>   	platform_set_drvdata(pdev, gi2c);
>   
>   	/* Keep interrupts disabled initially to allow for low-power modes */
> -	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq, IRQF_NO_AUTOEN,
> +	ret = devm_request_irq(dev, gi2c->irq, geni_i2c_irq,
> +			       IRQF_NO_AUTOEN | IRQF_NO_SUSPEND | IRQF_EARLY_RESUME,
>   			       dev_name(dev), gi2c);
>   	if (ret)
>   		return dev_err_probe(dev, ret,
> @@ -1257,7 +1262,12 @@ static int __maybe_unused geni_i2c_resume_noirq(struct device *dev)
>   	if (ret)
>   		return ret;
>   
> +	/* Enforced disable_depth = 0 to actually enable runtime PM during noirq phase */
> +	if (!pm_runtime_enabled(dev))
> +		pm_runtime_enable(dev);
> +
>   	i2c_mark_adapter_resumed(&gi2c->adap);
> +
>   	return 0;
>   }
>   

Acked-by: Aniket Randive <aniketrandive@oss.qualcomm.com>


