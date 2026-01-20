Return-Path: <linux-arm-msm+bounces-89835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yP3+EhGJcWk1IAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89835-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 03:18:57 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B209260CFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 03:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C2CF6279C9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 12:48:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52CAA4279E0;
	Tue, 20 Jan 2026 12:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="i1eQm3kf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDiyuiY1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2175421A14
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 12:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768913082; cv=none; b=G3JVGoldjVEyQZZM35xTDOGeAkdD3hGWwcR1EEtVRYRrVEpS2W1Smc1Vm2rMa4NFrV+zl1iDexM5iZvyBHlSHFeWAfj14M/KOMWeItACqj07rrO+KNr9R72eRvPrpato1y9WHLN0EKjDGrxqJvWVaCKFT8gDfGsFoUYb+YYf2uE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768913082; c=relaxed/simple;
	bh=ME8GvrRC8iwNVb42xJbWCkNX+iV0lbKNfrPzlHf/Cvc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fNyjG/mO69kgdSDSOPehpXrk+HUKp6eAwc920H31Z9oCWOGr07817MysvzPkmIfIE+RgXoH3zFjDc1MmC7xpRt0/s9tPKLDzTVlX66IKJuaHvVHS7wngfBJsN+Exj/dkMqSMLK65gmRqUQFykzM7Rm0DjLM5V2HzWvGe13kmJ48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=i1eQm3kf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDiyuiY1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K61X7X3772433
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 12:44:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jxu1N1N8fI/Hc1BayD7pfa6htu8sKS9DFKNP8OoW1Ss=; b=i1eQm3kfVljCU9R1
	cBUlnGL7UhPcUqQSzqNxyPs3nOfGRzkG8vPZb5gcBg0nB2XSm+iC/5aLEv8ogqZ4
	f4ggJjX7eK4HbYA3WKNXJ9J3OxrkFup44UpPY0JzLrr89zFQBXzqGb5ocoaaj2yF
	ZqNw0VY/iBm28AJ5vMiBwOpw/nWistM4AdTUZj8WnBfvfW107o4XNIzU4KW9M2XI
	3+Ed+VV1xWFgn2zgHdQmSMjekGDTyniPIewu06A04D2DD70FGCzJ6+Ddpe2QRNDK
	A3bQ7E33Yqk8V2TGdCwSSnnBy5V2Tchiki5tcNmsEbdkNp6j+5xPoJvIdx6iY6qJ
	LC6JFw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bt42ws73g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 12:44:40 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c6b137e066so44959185a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 04:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768913079; x=1769517879; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jxu1N1N8fI/Hc1BayD7pfa6htu8sKS9DFKNP8OoW1Ss=;
        b=DDiyuiY1s678IUMzJWzwFnrDJlevEpCkdJzQoMJi9tnxnbFBwbBngIvXfb2duEe4QA
         3ojQ4XIjzyiEuMqAXj9fZfmnGDyVW1bEZpGT/e/K4PcCV/12qfYYkxP/bxHmJFoHs4Ro
         jVwIG150R4DTiyg51UM1h0V6qrfqduVM2q1CqKRdal9LMSu68KxrsiiljTYPH48h99+o
         0mZfbYSjIjGl6Gxq9uwlsmKjSzoUm5oQtlenScjsqF8pxdzE0x8j/WdAnA8qzwOBQkQX
         P73JS8+enlqxKVNlOvFOhcPRoD0qx5J3VjzmusoNmDvbRu1FPQF+pfj4BojfXiC+1E0J
         8xaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768913079; x=1769517879;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jxu1N1N8fI/Hc1BayD7pfa6htu8sKS9DFKNP8OoW1Ss=;
        b=OmuxXgyQaybFuyuoK0E+Ww07+xuo54HidzkYOhbLZOdkxW2W7GRQjNgiZTmlfAGUR9
         I260QbdjBNBJP8fAu3UjVvteL6be2bVPUmpyxO/iQeS2bsuoLFtx6c+ZzS37FAYoz8u2
         cHsTctXzfWrUIcUZQRnLEnx+s0JB3CA9EkiyMVfURDYGfM3FcMr7Fst7/L0TCRXDu/BC
         Wq0+9y87n7cs2hYNqDqma75pJziyqyoUYB9M/2OC5sL4njjMWIfLU23s3V3hVDug67Sr
         Xib+tByq44LNBgkheacwz2/LnApzP+LZUMLCDFwVr1+kQ0NjfUFJFZJKe0lgkH5xu7gw
         Tuvg==
X-Gm-Message-State: AOJu0YxXACqozGyMpu83R5pKoUAybvetMWOT5uzMAIZwB+USc5YPAP85
	IKL8kIu9jFC13gZBLFE0a3tRavrXzIhU9oe2U2A+pgKAbORKLFUn+prmIFMoE39ym+vnK2gMK5X
	glfXhd/vzwiqp/2fj1QJ5weOi4xwcEK7vIAHxOgLOeQzsemupYp+Mg84qNfyVFo8B/4Qm5rXr27
	oh
X-Gm-Gg: AY/fxX6L8db6mB6O1CyFIZ8Kz8bCRJ0Lftsd+RsRURY8hmc7ELg1VsgASTjsB9myzQb
	Z+Itfelk/j/0Prxb7RtPKjKn/NcCelSC67GLp6ANXWpaMFpSjCvxSZuMLfqeNehNqECEBuDQL8o
	LdVqGBUjKOugkpfES1gAfcr79JONc06gP1RkvRQCDIr1acDd+Ej1ACJNR2nGHDlXtoJuM3p96YO
	55BhfGeCWyH6tJsZotbd6NTXP96kIyR4uUtYykyfpSGUjGPlLMKRRJSTKN/QibhmUJe9TjPlmN+
	UQh24v+/I3O6/XwUPJ+g/3FscUAlpln0K+mvhyTY0Z6edrseh1rTkum98iAQpTw5eXE5AD29w1m
	fIKjwW4dIOPRkJlH7XxUuyDS/FP76xExSO8X0LfoKayW38//46So0C2Lbglvs8Ec29gE=
X-Received: by 2002:a05:620a:3724:b0:8c0:a3d2:1160 with SMTP id af79cd13be357-8c6a67b8760mr1403195485a.9.1768913078850;
        Tue, 20 Jan 2026 04:44:38 -0800 (PST)
X-Received: by 2002:a05:620a:3724:b0:8c0:a3d2:1160 with SMTP id af79cd13be357-8c6a67b8760mr1403192485a.9.1768913078429;
        Tue, 20 Jan 2026 04:44:38 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-654534c8694sm13272592a12.25.2026.01.20.04.44.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 04:44:37 -0800 (PST)
Message-ID: <1946fa99-65d6-456a-bd32-0467d9976016@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 13:44:35 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: qcom: Add PURWA-IOT-SOM platform
To: YijieYang <yijie.yang@oss.qualcomm.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
 <20260116104136.2922032-3-yijie.yang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260116104136.2922032-3-yijie.yang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UiGqh9ZvVpHYWDKOWGiV8qfb7aKMzpww
X-Authority-Analysis: v=2.4 cv=eJMeTXp1 c=1 sm=1 tr=0 ts=696f78b8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=HFdUuuCF8L9kRLeQQEgA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: UiGqh9ZvVpHYWDKOWGiV8qfb7aKMzpww
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDEwNSBTYWx0ZWRfX7wj6l+IcuREr
 zNQDyexDSPunuEV5m0wTzMOGIvMXB/IQ9lCDw0DcDmby3FjfG0we/mmf6bv8R708JGqz3dKtBIs
 7EYvaPrH6NPtfx5gNPivtYfKg8e2eXTyNZbrKQGjNErGcfvBBwy018PAc67S0SHc/J+65NCuubf
 o8yXxFCNkoXekxBE/pj9oWb9ZkwmMylzOFMvfeeWOZ10gTRpfyC6F0V2kO29FsSB4iJtODEBGKs
 No+R9hilgvOddHVjrtCqpp+l3PSqkDvu64oUNucsWqp8Q5w6lXQRrIZu1AJHRMhxCiUWlaSK2oV
 cvlgyryHyVAS6ngY8vIKO1hQth/hY3t3B1R450tShD+DjdnBa+Y6WDHzQd6orGD8nL8N38s/qow
 YH/UTeISZxToJuLVOrckpUoHwxI4RpqBgOvYe9Cii9UasAsnGK63RY86kwbp2ewZfC2QoFSR0al
 /zzF7ZDspPHHkXOXi5A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_03,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0
 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200105
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DATE_IN_PAST(1.00)[37];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-89835-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B209260CFB
X-Rspamd-Action: no action

On 1/16/26 11:41 AM, YijieYang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> The PURWA-IOT-SOM is a compact computing module that integrates a System
> on Chip (SoC) — specifically the x1p42100 — along with essential
> components optimized for IoT applications. It is designed to be mounted on
> carrier boards, enabling the development of complete embedded systems.
> 
> Purwa uses a slightly different Iris HW revision (8.1.2 on Hamoa, 8.1.11 on
> Purwa). Support will be added later.
> 
> Make the following peripherals on the SOM enabled:
> - Regulators on the SOM
> - Reserved memory regions
> - PCIe3, PCIe4, PCIe5, PCIe6a
> - USB0 through USB6 and their PHYs
> - ADSP, CDSP
> - Graphic
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


