Return-Path: <linux-arm-msm+bounces-112720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id T70CK4CWKmpDtAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:05:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA4A671236
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 13:05:36 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=I2xWBKdv;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=FFavymKI;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112720-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112720-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 861E430087D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Jun 2026 11:05:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC903DC4B8;
	Thu, 11 Jun 2026 11:05:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3173D9670
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:05:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781175933; cv=none; b=Nf2YKJU9EPv4VaXKWw6n7unPRF5ilA9aaoanSVP8/CUCsDnNX1SdDyuZcGGmRyqIJGVxM4NeHEUVmwVCjRxZl6wvjgtAbMk/jepmsWGeUoUfC5bZ8xTBfcULKoAMKI/IecipT7SDesYkHKe5YWmxloHYmdl8Z+fQ7kmztMBJwno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781175933; c=relaxed/simple;
	bh=/wxQSaRakumNKYB4vqjOTBgyQzqMLc8DAYpMLHYYAXA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pGVUXkfmCJWwfFXNr8ZaUsT2l0OwFFfskNEvh/UQhIRvxHu30bGVtOPqgw+U17n9Br+EX6XX9SPj+U6vVsc8JnaXw7LaPLV7J1sWlgW+OhrCcJa4YrBxbY267z2UYHakKhPWf6/w9EhqRj8cV8LFFKOI+Es41YJrp3fb6BzT9As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I2xWBKdv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FFavymKI; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65B9xBpW242641
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MaD+SVyMDIg2d/edNc/15/ePklSjOmExxWuDVzVekf4=; b=I2xWBKdvhWa3HVSh
	QJ+IsVIexhJqMUy6ElBfAfFWdp5vQS6zDAdb3s4+Ud8avq+JzY8O82W9FJRW540n
	wZoMLSObdhjjI70P2oXAaSOzmoMiXI1PcIodMEIWmbRRGv/V9fmPGtKGEzj7/SgH
	lfAO37K6fhVHofZ02qqIjv51qiaCx0Ex9rO95EFp87SYQDR1Zzr3sMl9JZYM5WdP
	5bvYjISYlxNGSnvggUKGLw4PPNgLNyFknKDLP9NiAPWMdCDDeGteGa05jUx0p9bl
	OE0itsiGObG3+PJlmSsZeTRgYRRFQnEmY2CPM3dlNFY3UdtY+/bOW98xzpv4gM/Z
	DNY4zg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eqe7033n7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 11:05:32 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8ccee12a34dso16346946d6.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 11 Jun 2026 04:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781175931; x=1781780731; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MaD+SVyMDIg2d/edNc/15/ePklSjOmExxWuDVzVekf4=;
        b=FFavymKIHYJJwHUugIKrhSGRBc3MhFprYBZw6k2R3A+Ie1UtCG1nNgHJttQqmWKKPb
         EaBLaQsD8HOieM1VsI7XoJx3qn9F6zk7wzr5wZSWZsl4yIgM1T+1oNiPJDYY7McLmzOB
         MJrK3vmdeYRM+jmcRw1mKdphVEqyfNBWj6NF/brR4nnItcmc1Jml7d95x+x11GydSS3w
         8GZAX5QS/OFXpej36PfiUb1RkPCB22+zwizBnkr8KUMb0mgzBB96RhQitxkiWyRVXkN0
         I5tvVdLXRA0gW4QRpVdWsnP1QgmLO/tyQmzVGW1NWQ1H1ZI+bZY6JENvFkKa2oHbgUqq
         S4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781175931; x=1781780731;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MaD+SVyMDIg2d/edNc/15/ePklSjOmExxWuDVzVekf4=;
        b=o4yskR9ghJNXIRsuqW6W1reVFRKTgqwqF/yBQG7sV6iBZMojefIt4fC54RRmcgwxPf
         eVUGwEPvQb9q9M0O9A1GqK11difbRuBCDL1WjixQtxA+tAxTAXKJJ9bZchEQ9dSjnG13
         mQRTdhQ12jK7JsEsmqcxubR6O6in0IPIKbKrspBSGTmxBePvO1E273UateSP51Iwzwbw
         b42kiazjayLTv3LUiUjrNK5e88g0KEP6jNFOqvbCV5mAobryxCqJJSO+5FmmsnDbyp6u
         H/COe2X5eoxuggTcILkbSfFc7wTiRncUcR+/NXdX7+9dyLZa3a6dmwrDUdrIC46WZoRX
         ka+Q==
X-Gm-Message-State: AOJu0Yy7kdaqtVJLvKiwfVnttdW/O8TWaR545fFTe+k490hP0LvzKWDT
	QP4TF95OnDg/7xGET7HROEOOlLg3FAcJaSN3xfvDWeV97AiFE6U+AeexePWK9ZfH0/LZjBxnRUp
	/7OY+is7JZJQ4bqIMCEqmOFgcxDqH7aKqEdA+I+86+pNZfTQaaW7FsTEPmV1vYOVV8jQ4
X-Gm-Gg: Acq92OHHCqXpN1KKldTXZyqc+oLc3cwPukG7VO1jnYqxsvUDTLHaeWnPv4hrHi38SHq
	N2hhFOgxPyAzBA1qXV84WuMac+/JwYCgIN7ivA1nI/ubu+g4wsrj4nsGx/SDj8qWUeW6dv2vPaU
	iQkQlVUQgU0wHEDPT9xil98m7V+Tm2z+jDW1Cx9ShR2EdkprlX/FQQPI9jsknoVlXoeRcflTUF9
	cJ2VRZNK/q3qRm49jU2z8mFn8WyldOr4WdE2sc+aVlo2dXOL9DL0SuOc0qj9ngkNvDLWBrt02UN
	ZsXOH0IrW2i1vowFEZv10g50/1uo4GQ54csZn+jRm/U1znoshbdfuUmYsU1JyK7TLdd1UmuTECa
	FdPWTP8ylJdQspTooP0gIoFeLUqA4yQAfu9BgqaO/vaD9hUVrJ3vAi39e
X-Received: by 2002:a05:620a:1713:b0:902:daaf:22cd with SMTP id af79cd13be357-9160a4f660cmr192689485a.0.1781175931056;
        Thu, 11 Jun 2026 04:05:31 -0700 (PDT)
X-Received: by 2002:a05:620a:1713:b0:902:daaf:22cd with SMTP id af79cd13be357-9160a4f660cmr192684285a.0.1781175930499;
        Thu, 11 Jun 2026 04:05:30 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68e65867e7dsm10880036a12.20.2026.06.11.04.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jun 2026 04:05:29 -0700 (PDT)
Message-ID: <73f700f2-7cba-4832-bd06-e82a7fd51a7a@oss.qualcomm.com>
Date: Thu, 11 Jun 2026 13:05:26 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/8] irqchip/qcom-pdc: Configure PDC to pass through
 mode
To: Maulik Shah <maulik.shah@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Sneh Mankad <sneh.mankad@oss.qualcomm.com>
References: <20260526-hamoa_pdc-v2-0-f6857af1ce91@oss.qualcomm.com>
 <20260526-hamoa_pdc-v2-5-f6857af1ce91@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260526-hamoa_pdc-v2-5-f6857af1ce91@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjExMDExMSBTYWx0ZWRfX1+pxIwPhiQxo
 t8+2h1lK95iEWVBrkUvXKT6M4PcLrikLg4DuWqvKETUz0aXA9WR4LPnO5ZSJqOCdr0YsA9MkdTH
 J/lRGdHoSPA2h5dfB0Icqwg5Bb/W0vn14f7r5zQsdnI0HDny9ASrScuKZZtLIyUqmw2a5LW8v7T
 bHTJy0VNoPFeIFepDGmepv5NPvibWR3Dlmh/QSQxvyesK4g8tc0tt3Iw/lTCjr61BVJZY9LKbbB
 AHoVMDZoq0RPkGzUJEM3pKIbgovmIj99h+vdFGSNuQfJOCPl2Zk//rPwVMOQpB2L+1KCaJUxvYR
 3zWFsydsRbv2qX8rmRawWNCaOcF40uRWvVD21+6uLHBMvAk+FM1V0PwKIxbU1SJjuhLzXp+p0Qs
 /f/mW2ruNaGQ/JWGzIecmF41acfZei/rwxtqRIjualYttTZcvXRarsqxw1gwW17TKHpzhhkgoSw
 7W6MUAnj9HSo+Fsr56g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjExMDExMSBTYWx0ZWRfX1sMRHwcK0e19
 CN64WbVvZMV0ujFa4iNyxrSL5p3D2L4GKVgX3VSoq/8Moy5y+eXAovpHtnV/6/AnLhyxklk89h1
 g8S6ckCYyCheyTjC38lXzVlz7L/HOts=
X-Proofpoint-GUID: DxcNHflZac6XALAqpklvEIiatelElp4y
X-Proofpoint-ORIG-GUID: DxcNHflZac6XALAqpklvEIiatelElp4y
X-Authority-Analysis: v=2.4 cv=Z5Tc2nRA c=1 sm=1 tr=0 ts=6a2a967c cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=avOr_zNKPfybmo9zg3EA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-11_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606110111
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-112720-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:maulik.shah@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:tglx@kernel.org,m:linusw@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-gpio@vger.kernel.org,m:sneh.mankad@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4AA4A671236

On 5/26/26 12:54 PM, Maulik Shah wrote:
> All PDC irqchip supports pass through mode in which both Direct SPIs and
> GPIO IRQs (as SPIs) are sent to GIC without latching at PDC.
> 
> Newer PDCs (v3.0 onwards) also support additional secondary controller mode
> where PDC latches GPIO IRQs and sends to GIC as level type IRQ. Direct SPIs
> still works same as pass through mode without latching at PDC even in
> secondary controller mode.
> 
> All the SoCs so far default uses pass through mode with the exception of
> x1e. x1e PDC may be set to secondary controller mode for builds on CRD
> boards whereas it may be set to pass through mode for IoT-EVK boards.
> The mode configuration is done in firmware and initially shipped windows
> firmware did not have SCM interface to read or modify the PDC mode.
> Later only write access is opened up for non secure world.
> 
> Using the write access available add changes to modify the PDC mode to
> pass through mode via SCM write. When the write fails (on older firmware)
> assume to work in secondary mode.
> 
> Co-developed-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Sneh Mankad <sneh.mankad@oss.qualcomm.com>
> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> ---

[...]

> +static inline bool pdc_pin_uses_seconary_mode(int pin_out)

Please add a comment somewhere near here, repeating what you said in
the previous commit message (about the SPIs being mapped first, followed
by GPIO-as-SPIs)

Konrad

