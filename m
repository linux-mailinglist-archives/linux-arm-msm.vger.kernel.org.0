Return-Path: <linux-arm-msm+bounces-91677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IP0BNq/vgWlAMwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91677-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:53:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C46D962A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 03 Feb 2026 13:53:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 517C830CBBC3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Feb 2026 12:46:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82B88346A04;
	Tue,  3 Feb 2026 12:46:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UXmVbJsG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W4jnP9y4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DF1346774
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Feb 2026 12:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770122767; cv=none; b=T4BWYPLbx+6TPcpdb3hI7BCzlyAosJ8+DXfym6uOfpd4S4VNd+opZUEne3b4CO66oTf7esxZEXenWtDxnQkblRiif0T3xx/XWvMjfv+/KKPu7SxeNBEIPleDjr1Dj1rJJQ2Dl6uOurJiPUF/XYFzDfSG9RlV7ZGNpJKB9pIzu9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770122767; c=relaxed/simple;
	bh=Amt4X3KSlJX678bBl9A+eSsRqBFfHPh2lmxoRfYMDKs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m1cuNfqMLtri0G4rMSx2olGNP2IfqimpMVkqOnhompdinyU5oWHlpHRKRRT2HfNrvXHh9XoF3a/RviJtTJTProTo/0a4a/2oVHpZrD4onB8dV+2EAJXxIxRtxWSr03UVh20dwOD9lNa0wc1Jv4iAJ2KnCvUUWGhwj+uBckvRYC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UXmVbJsG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W4jnP9y4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 613AJIEK930936
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Feb 2026 12:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FBvhKZkKdw5hN7UDdsLxHbqK1hX81+Qqdtt60bvn9tA=; b=UXmVbJsG8lh2lcEZ
	fzLYxShXvgSZtc28blNMIHWg8BhbPJqO8AeevkQbci6oEOvm4OYyyvFdbU6i/wzf
	cZeFmZZPQgYUw6oFQt4Ll7SfnWekmg8KDWGliNBclBiQ2LhEnFgKFvF+vJEOklmB
	ChHvccGu208DIPM398dWSJfS+msOzxsSC1Ao8m0kPUUIJ1j+fQq6lvreJ6iMczsH
	S8QjGpizXbsI811ny9/hnZL2nlI6UEaDNDoOqabGoDWy+uwhqJyBT3SdgftK7CUU
	Y+76h/7S6P1knbxOEXCl5MsGUJ3yaW5tK44JQRyfak+yW7D6opCU7vlv0p/qBbLS
	ApIK6w==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c38yu1mbw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 12:46:05 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6b48c08deso111785985a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Feb 2026 04:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770122764; x=1770727564; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FBvhKZkKdw5hN7UDdsLxHbqK1hX81+Qqdtt60bvn9tA=;
        b=W4jnP9y4+gDw9VrpV8pF+fq0/g9TRiEi+V205LzKK0SVYYddtq6JsHXb9bTt6/QOXa
         AQ82Vc2gZ7DhbG0xq2CHY0USTf0KwLP97NxuOOho2vvx65AdlGpn/p5OlQ+1TpQkFSHW
         qJybJPiuZ6Q5M/fwwL90EGYuqmFM8+gDYk0fe3e0y5HSGuzF1vr+mx1gjzN53YBYGkFV
         d5r0BedCAl5zTJpeAEY2lNccMS/8PxjUk/YAhqLFRgGd8iS+w6FX3cX0qh26e1PhRHQw
         goNT1RD0FJ1LNQRx5z87tYwMD3NrM/Tm4EEPDQkmz0o7C4d/mGLfy1UeXl6iJCeYuSke
         Ln6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770122764; x=1770727564;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBvhKZkKdw5hN7UDdsLxHbqK1hX81+Qqdtt60bvn9tA=;
        b=RLlz+edwaA6Mip5Kumkuo292pUNO2Y3IHcoi+KfkO61HQdJRkD3oM/HN9HRiydeFZ7
         6/KMRB+qKbxe9leBMnTEo4MJHuLUnMLKChg2p89CFXS7tPLhIxT6Ta28ayZ2mggqwgMl
         DtRi9WNeDrAx0RjKPU6bdZ7JlEP5vyS6eyg6l3bcfKPrPCtULXRGrKMpF3DJOjDMW3vo
         Pw7RiYYk3LjP4XKvRd3Ae6+WUv9/Dmn7PXtMnujQEE5+QKNDj333HXy5ZmRodvft5Zf9
         QMyEjeFZwQ9evE9YRyNuSff2ZG0ylKLZKivk4ppYflMrXUAS+FFfixyJfS8lfJwubLNh
         UA4g==
X-Forwarded-Encrypted: i=1; AJvYcCW4m9jJlNdXNCJ124BRqaqfpfkF0ErWsZmqTZoImFAo6aVoxyFuABh1mnl1SwWF++vP9vyUyN0mKK9mo6Qq@vger.kernel.org
X-Gm-Message-State: AOJu0YxvxA1yFFCwoTzsVdosfMq/FzYVfcEHrGcRug8KNx2177VDKzQ5
	exAAtxB2CMGYDbzl6rp8IT96xo02BNip7GV+UQPu1kpGf/wu3o7ovutfDlDqCPTBDHDr77rD2h5
	XMc4H8zH/6a7rJSKiTSPpzALAux1vjZFy+jUGmXUdNT09KiNTEzoHI8N2lFd5fYxXiqxF
X-Gm-Gg: AZuq6aK9Y+DTpIjJbgnjLMYgdyAPbdKXZzRwouQpfMXzyUKXaQ4CAybVzBJ8BguSbL7
	dEMtJQGmj7cKVRUooHC1/PVZiOPWHMD59gKRk1CTGAI9GwXz9rwL2H01qCzAgjicye+Kd6dGQm+
	8jsbLMY0T2GiQmDQdWlyv0twXbQizKFga+g0UsQzjZN8uV6cDDtV2ciTIUAzrubVM3smVqGSmJl
	J/HYDrHhZ/TN8pZzPZpujGrdyZ3UaXAh7J977UPU5jGSptJO0VUgwIGJxH7FVkMcy3N5VXwdSL4
	5zhhUgbz4ukEKG7e5ZLblTld/7HRtZwVM89AXvux14SaXyWc236qRXsPWAoyIlrZFwk5JGcu+ko
	UbT6r+UjLoR8YjpUF8AfACA5zAZ+pXiSDzfvl9RZYRt8+MYeRmigZnjSTGY59JWGJbQY=
X-Received: by 2002:ae9:e710:0:b0:8c9:eb7f:b6d with SMTP id af79cd13be357-8c9eb7f16d1mr1175878685a.4.1770122764236;
        Tue, 03 Feb 2026 04:46:04 -0800 (PST)
X-Received: by 2002:ae9:e710:0:b0:8c9:eb7f:b6d with SMTP id af79cd13be357-8c9eb7f16d1mr1175875585a.4.1770122763860;
        Tue, 03 Feb 2026 04:46:03 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4691db4sm9081780a12.22.2026.02.03.04.46.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Feb 2026 04:46:03 -0800 (PST)
Message-ID: <d7855286-e4d7-4418-a92a-0ed71ab72d7e@oss.qualcomm.com>
Date: Tue, 3 Feb 2026 13:46:00 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/13] i2c: qcom-geni: Move resource initialization to
 separate function
To: Praveen Talari <praveen.talari@oss.qualcomm.com>,
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
 <20260202180922.1692428-11-praveen.talari@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260202180922.1692428-11-praveen.talari@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAzMDEwMiBTYWx0ZWRfXwNKpawe58jYo
 ZNV3HFoMOUyrTcv6NWCBlt/pmHZTTYeeqBqIuczX0C8I10lsbF2FsvOd742DlA8IAIsLTOiZOtR
 YiyzFG8BMMydqUkt6pMVOU24XjvBWVZ/P2lq4DVYpRj0G1lQddhifQY5S/bnwQm1P+aHpvBWTos
 3woofXman1r6e3xIIbP21iX9QNlNpcjq6PnXa0192LL0kwgzE78TM2gVZ2BdrLkFubojPEy1pqq
 u9lt90qizeqNBn5lKm14ftyGcZVYxMwlFit1eIany3q4YsjQBko1Bl0jsRtWirHJCOQbH4d/nlL
 DVu1bTYaN7/fnPAPC9rwOP8nuMnw4QnyPHS4twNhfFN8VqmFAMfi2T/Me8JfIp+bTt58JYQLnF3
 dHCkQFkoNgsqlhTvIZhNC2Thz9bVUuu6bOhKvVZjs7eDaGdZVjYpIhA3APAbAjHkaDd9Y/tkheI
 uxhgkNVMI5WKKYlqrmg==
X-Proofpoint-ORIG-GUID: IvpmpYP3SA95toqDn2iNUQADBheWboG7
X-Proofpoint-GUID: IvpmpYP3SA95toqDn2iNUQADBheWboG7
X-Authority-Analysis: v=2.4 cv=UKTQ3Sfy c=1 sm=1 tr=0 ts=6981ee0d cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=z1U-K7oe7a0A7by5uvYA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-03_04,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602030102
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
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-91677-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 68C46D962A
X-Rspamd-Action: no action

On 2/2/26 7:09 PM, Praveen Talari wrote:
> Refactor the resource initialization in geni_i2c_probe() by introducing
> a new geni_i2c_resources_init() function and utilizing the common
> geni_se_resources_init() framework and clock frequency mapping, making the
> probe function cleaner.
> 
> Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

