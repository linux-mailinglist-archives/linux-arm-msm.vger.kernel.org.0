Return-Path: <linux-arm-msm+bounces-108671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8Lw/BPOGDWp4ygUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-108671-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:03:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E70ED58B4A3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 12:03:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DC981300463E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 May 2026 09:59:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0F403CFF66;
	Wed, 20 May 2026 09:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="F04FTaOU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="N2edcI3M"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CED03AF667
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779271156; cv=none; b=EJJV6W/PIWQ24vbHF0g1+BKuZYC0Ypug5PtRHakmRyRNv55HQav52THPoQtM0S9W2Hn3ClshZunDDZarkUhVbm35Py8/M9/JOiLMkpDv4dy9ExCS8maAN/9Cm2zO5/HyYLWh7WDl6pn0YVP+tJUhjhAXgOevrQ5sFe7w/fxnmqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779271156; c=relaxed/simple;
	bh=l9HvU/DVijk97NHpwl1aTz9bBNRUApT99CO5CbwcKEk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LlYbM2GphOX0ZtppWVWNv5Bcs3I/IJJhtMvRDEyTQEukzRkfk9I6/z7BEfA9Y/ChDxIvHRXIR/GCTROJCzLIdsm1h+MrqGUs3AQiayiBrBzOrRIgGL36izJ75DjE70koVDJInAYfHpjnYEVQUL9bQ9iAcka168wFSmsIE8sKCEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=F04FTaOU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=N2edcI3M; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64K76OoI1636927
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:59:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f36z/IBn3RKMlhcSXkpC7uKq90SQCuiNVyuOJltpb2E=; b=F04FTaOU0agfylrK
	lIW2hpN+9kQ8w4zIusw41jMTU8qAX4dNXmYoqHMmhVE0f1U5azTNpBFHiWf7Tog2
	64es+wbmVNKvYEw5Xc6XUKX6nMUty40Xs/AUTIDzo7zsIeUSHLCRSbp1/6hLOPZw
	i5FOp6FCAhoOmOYAAFChD+4GBopMMQsGMOszrBvc2cLwxCR0cO/XxWwsUZFBaks0
	//j3Oe59CJ898iOagZxKFVuGTgBOmXFO8PDliGXH5qrYumzpdotvX5XbNV6KoAgC
	BcET1m0eovAWpmqcvI0QR5Xam+mkrL1YNbFugIaPDaBJRxfK0QOiVWGK0jp2l0IY
	GrB31A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3sc1p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 09:59:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d8c183c2eso26538851cf.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 20 May 2026 02:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779271153; x=1779875953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f36z/IBn3RKMlhcSXkpC7uKq90SQCuiNVyuOJltpb2E=;
        b=N2edcI3MJ7C9mbRIjatfUdAlxLrarVQH86oxzgh73Yfr0vdJSC0zy5v6Wk9v8MpK2e
         Q4Tyq3yqqP2tVWBnLt+M7zbd0tlqweQKmZVFkQ0oxcBnrw304eUtyZ1BZ3ohybNCGDUH
         SdMExqhGFsFzQLz+5AJbAM+rbwoEokTpSWf3XKIkmx00bWEHaUip7N1j382J3WnoKCRU
         Uv8n/leJ2rELWCkXaMMznnGxufUiAFn5r0HUeNwsOVFVeDugAEh5c6wFVxmZ57tmQNL9
         9cGbY8A7djCc3PPhvxH8gKVXvWloPkmwOm8hdKdGXjkaV/SDwQF0kioH6lUTRJ83sptW
         wxsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779271153; x=1779875953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f36z/IBn3RKMlhcSXkpC7uKq90SQCuiNVyuOJltpb2E=;
        b=kL21JBq2gb/b97WH8hPQgQsV/b1SE07guVtdVwpRwTFTwOZuUYdq2UGRUUymR9ZlVu
         gVm9dFUNYDQ2jbtY07W/MDPWXVY4LYmFWRlkTXRx5Xko82NLv6CKm7E2W3yG4JOVt6ip
         gNn1Za4A7qBZ3FtE0ZwhCxdMzVn/udnxaXXDW+/Nwakqxqy9WzHWrdc1hzLI1x64hKiH
         PuN3tcEvpFWTmDl+pQH1gx6YxHWtULXRyVEC/DMGW6kN7XH4x54UYbAdjKb5mHLD41Kg
         j2KCgyBmFD2rrKiGYM5KNH9npCuuLmSZ9t7NvD4+2GOR/XAljWS3c5Cx9GFI/hAtm4fe
         nqSA==
X-Gm-Message-State: AOJu0Yy9dDD6stvIzpk1EDn0Wba5IVAvfTPOgTAmGL/FV0eciA9IiGTS
	tUh+T2BAZ8L77NFixrvf4hSS7Xt810BlTCVarZZps/HaN+I2ROTGneOdJMlF4f52XH8O7DkEfiS
	izD98Ugbh6DprI+VcYmLcs95GVFLYBV8wJ144HdqxWgzIWgaaXw7mcBQyfWnGLf4wGHOs
X-Gm-Gg: Acq92OFXW0AjR8BtbAbH50A9hoaMh6u45T8eQbHH7yHC9p8kJmp3L4LeFOKbZv3VRxD
	hLx4KQTo67pf9OuF0BAbdRlAphWEKfCcCQpvRSt7QLU6uRzDxfyW3vzS+X2FC8vSW2sahtwellG
	Et1Ov61+M5fmfnZaDKKmtoEfEdDCpZo1mX5Et8InpsxP7ddNO+p4IMe08/WZVQAsceY6VL67n7m
	7qMgusKrdCDbZU+hQqGbXS4enQAWFm+z4PlYQmVi+w9YRvHCPc7Gchhk4KtPFKesWAWiW7eedO6
	JZt8M9uzd/+F25P0m59q59H5c7tK30IVF4SQ2agouDO7+qOa9Db4KWxUTR+bZoOriqjypw286r6
	QpuD/e8tGyPesGO6EbKem0SqKafhn/nwx75LWUa354SGwunKwpPQcA0ruMbTsus4bw7/k8lABe8
	Q4zZs=
X-Received: by 2002:a05:622a:1313:b0:501:4767:a6f with SMTP id d75a77b69052e-5165a1ddf59mr223272901cf.3.1779271153564;
        Wed, 20 May 2026 02:59:13 -0700 (PDT)
X-Received: by 2002:a05:622a:1313:b0:501:4767:a6f with SMTP id d75a77b69052e-5165a1ddf59mr223272671cf.3.1779271153029;
        Wed, 20 May 2026 02:59:13 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-68310d58df1sm7847371a12.13.2026.05.20.02.59.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 May 2026 02:59:11 -0700 (PDT)
Message-ID: <da2443f4-b80e-4ba5-8f83-4a4e893dd51b@oss.qualcomm.com>
Date: Wed, 20 May 2026 11:59:09 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: soc: qcom: Document CDSP Power
 Management
To: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260520-cdsp-power-v1-0-85eb9501a1cd@oss.qualcomm.com>
 <20260520-cdsp-power-v1-1-85eb9501a1cd@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260520-cdsp-power-v1-1-85eb9501a1cd@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIwMDA5NSBTYWx0ZWRfXztDOFvjhH6xs
 1FK/2AXpYSXgfewwHPezK2vruXiCT0LLmR3ii46e8lX2b5MGBdz5oiMwNjAmwRzLxLMVr9eSU2l
 FvjDvkvDJF3CB5jCbq8lMDjLYCNv/Ooc8S4sF6jvUzBerS1ET86REAnL5cjyW4Dw0oEDwAffDIv
 ozwz/WZ8ecZSTgER1HGR+28wIc+JuPcZn1GAYST6mXon/7oNsglzszmFU6+swTrvDAViw62eUkL
 8xgQtvbUmr/EW1I57jgcY/Td3AbFC581zkbIhbr3JUsYerqiiJwtM3R+jSS6bZcIEsiwQGa4xTN
 Y54G9oCXKDkhD4LnJu+7DblT70fnd04BBWXcW61ie4+uubHn8XnKL+EPrtGczN7cDJYRaYssE+a
 02jXTKp1S8KHhE+yDtBuRQqmv3/2k1nwYIV9W+QtNjtWT1nG8WUamLEydj6jwR1W+Kt5cHvaHZo
 v47l2VebdPZFL61Y7BQ==
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6a0d85f2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=b5dwZOq_2XybwdJL-ncA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: TnnH2ZbjEbjkTkb6HyGTfr1hJRAfElYS
X-Proofpoint-ORIG-GUID: TnnH2ZbjEbjkTkb6HyGTfr1hJRAfElYS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-20_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605200095
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-108671-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,4ae000:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: E70ED58B4A3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 9:05 PM, Vignesh Viswanathan wrote:
> Add documentation for the CDSP Power Management driver, which handles
> Dynamic Clock and Voltage Scaling (DCVS) requests via SMEM, manages Low
> Power Mode (LPM) transitions via MPM handshake, and provides virtual
> regulators for the remoteproc driver to control CDSP power rails.
> 
> Signed-off-by: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> ---

[...]

> +maintainers:
> +  - Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
> +
> +description:
> +  The CDSP Power Management driver provides power management services for the
> +  Qualcomm Compute DSP (CDSP) subsystem. It handles Dynamic Clock and Voltage
> +  Scaling (DCVS) requests via SMEM, manages Low Power Mode (LPM) transitions
> +  via MPM handshake, and provides virtual regulators that are consumed by the
> +  CDSP remoteproc driver.
> +
> +properties:
> +  compatible:
> +    const: qcom,cdsp-power

This really needs to be SoC-specific

> +
> +  reg:
> +    items:
> +      - description: MPM (Modem Power Manager) register region
> +      - description: RSCC (RSC Configuration) register region

I was under the impression that these two belong to separate
universes..

> +  vdd-cx-supply:
> +    description:
> +      Phandle to the CX voltage regulator. This is the actual hardware regulator
> +      (e.g., from MP8899 PMIC) that supplies power to the CDSP CX rail.

I believe the second sentence is wholly redundant

[...]

> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/mailbox/qcom-ipcc.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        cdsp_power: cdsp-power@4ae000 {
> +            compatible = "qcom,cdsp-power";
> +            reg = <0x0 0x004ae000 0x0 0x1000>,

MPM is a top-level peripheral, but this is a slice dedicated to the
CDSP so maybe it'd pass, but..

> +                  <0x0 0x26018018 0x0 0x4>;

This is a single random register within the CDSP's register space, so
we should definitely be able to describe this better..

Konrad

