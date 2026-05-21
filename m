Return-Path: <linux-arm-msm+bounces-109026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4I04NiPsDmoFDQYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109026-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:27:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 328865A4012
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 13:27:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7B9E63020038
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 May 2026 11:16:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B0003BAD95;
	Thu, 21 May 2026 11:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NKOhzjZj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOAGWd2u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D880435677A
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779362184; cv=none; b=noxoePkj9H1oNSMs8Ix5r1dw77dfao+b4NkcozWU4QHMc2otABPAUPyHJo0tG+B3KUGB4yRKVgIP2aRV0j+DzAEfbOoqFJIbNLvWLqRKQt15Jmf0RukPJvCnopC3an8DE9YdNkHMb6DsMAwhfMv4JiMEYYMEkv/Mmg7CWhTYOuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779362184; c=relaxed/simple;
	bh=VqS+MmMkt0nnuZK1oTuFUfQCyaQWJ2P/ng5uGmC6tzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lSXJWKE8/W4mtXbB65P40QOvhoGfImKSQpP1RaTh0FfqVrsbWIqd+UqU75NzIaJZ1ADKzxOXe/M1c/KfetYcA7eGnxSofhjM3uE6mG5DuWU37mIRTW09hWsvIcxYbufO9f7uXz7IS7nmrF5dIlPp/Wt5iyO1//mqyCvSX1a7R3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NKOhzjZj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOAGWd2u; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L99j0T3527287
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4g/Ih03nz0JfyJaaDPDrFXF4/nl9W1h0BCYiGYmduFo=; b=NKOhzjZjyuo+LjGl
	qBRn899jTmASxrs/A/sM8akkTl6EMd7HFrYF0xVbaDfC0RxFUx72f3+DLdLwZWPl
	sR5Ad2Vro6L6ZoNnN/vSMv1ilRP6zAjZMjT9Et6fTgjrzFBrekV7VqOiBg8czCk/
	yaayehjzfHCV3Mnf9v3crRmZoWX2QscU8OFXUqr+h0rrnhTmm8KtcN2zEQt/SAv6
	2qzLyfC5cVEH/jgecMWkUQEByFkd+EANEL/+4g4gUl1RcpMSAAsnF+V+TbxZ6pd0
	EqEX5DhhPGdqZq2y8P0vv3zJeQ9eyIGKx7PhR5XxuFWHNKBZpEpIr/8RHDOUsXCk
	95X5Zw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9vhbh9p0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 11:16:21 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-63132c52758so374273137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 May 2026 04:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779362181; x=1779966981; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4g/Ih03nz0JfyJaaDPDrFXF4/nl9W1h0BCYiGYmduFo=;
        b=bOAGWd2uJ4csfd3Rb9F6adhOGDVj0XjoGJirpBx/q8aOmKoIr50hRVG7HFvYfxJyIf
         +vLWsuGAept1gvhVVmf1DpoxRB5WZZTA2M1OfiGfmuFvr1dvxe1r+01GmRcFMLh1wM21
         O5SAqLGKzn3I7VBQ74CcMUECu9EALniUhKMooaRVQeJC3VqxRqhcb/EVDUxBXdqIXYlD
         lhEUMsuO771+/h8z/wrVPa3KkKehWIt+lzfBAdnQeYlD9y1KTdWAOiZhPaLIJSQE0DY0
         kcGPWZqemk/BJPXXLOoQgID9MxUEVMIoJhSi9GIdzEKVZ1TDbbwXcRnsUcI/GAYwI0ih
         hUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779362181; x=1779966981;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4g/Ih03nz0JfyJaaDPDrFXF4/nl9W1h0BCYiGYmduFo=;
        b=cpSOkEetoAk5JyVrLYGfFNmI0AQfotW7ojgwB4QB/YThfm5J2Q3aE0UwUphvQmdpmD
         3aVNq5fuOX3Ko/kQ09lDB0lLg9ws30yD4G3ZkWe7XicruO5/gqUeM4SRSRBpjzu93/VJ
         9vRMtTet210Y/KrzHnOzfZFMKSqmJg6sSEq71lur0RvNVHyGfgR9Fhs8hQ0BMtFXPh7Z
         +wlyGd1ONDo+QnSQ1fizRQh8Sa/Xhjqyky975me2mg0GkRFJ1oFikmzPU/AI9TJPklAG
         MVs9rX4EWj9TxI06N3iBGqcX23BVYTfNjWoy/6xBYVmVXQPxvy3cFgloLBGxzpZhxxEZ
         E6MQ==
X-Gm-Message-State: AOJu0Ywv9JkfzL0Q66yGRKJ+bvO6tD1r1e4gZJkE5lcqFYCDu9mR3SFq
	v9RGzX0i90GA3OHKTtn8XENtSZNyGXGh20uA5hVSB6Ks5cU/KDWfQgV7/XnefMwiwLBPzHodwbZ
	08SObtN5/abfkmyjOLBKJpD4/aFEAzsHPhYp+8NqSYTPNUi02pQbscKe+k3MVWgKNE/H31a9H64
	Fp
X-Gm-Gg: Acq92OGmI3mMU18hTjVBS7fiCMlNlsV2Gx6S4FpDyOrqpoJBDIQ6afakjqWUksTzHdA
	1+eQkc7asCaAnM3biauL3L2LRtFEc3b5nbQDrNVCIcLlFAuLsXLD4orMEsLtY0ZsxnQV3hlgfCZ
	n8Ont1ZUOC2zkJtZcedoeLnF+hEyhLo2MHgM05nOkgWJ2kLqqHPcksYhVMqL/1qx4YX8VnrhsIl
	S3nXXMB7hovf8HDcouTXT1bJ/HlL1gRhSVxRARt/hCsx9gIRjK9J93wvt+K3BCfctvnaUIjElRW
	NTPz7hKLv9YmroaEHUQXLifs6v4syPvo32TqTbFHyiHVbqNMhLGYDUzjshva6r1KYW8J4o4kSlh
	UbIInJZKZ+G0wIomWgek/okS/XUfA0zT0pZ53suqp9SV5XjJVseVaysL/5FdllToeHGXAcC7J2Q
	d5sf8TBrSG1251Mg==
X-Received: by 2002:a67:e886:0:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-6739dc9a040mr354053137.5.1779362181132;
        Thu, 21 May 2026 04:16:21 -0700 (PDT)
X-Received: by 2002:a67:e886:0:b0:631:25ab:8bbe with SMTP id ada2fe7eead31-6739dc9a040mr354039137.5.1779362180695;
        Thu, 21 May 2026 04:16:20 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bdc87890b46sm33705866b.13.2026.05.21.04.16.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 04:16:19 -0700 (PDT)
Message-ID: <7ea2f2cc-ef11-4727-810c-e32e815bd973@oss.qualcomm.com>
Date: Thu, 21 May 2026 13:16:17 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powercap: qcom: Add SPEL powercap driver
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
References: <20260519-qcom_spel_driver_upstream-v1-0-75356d1b7f94@oss.qualcomm.com>
 <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260519-qcom_spel_driver_upstream-v1-2-75356d1b7f94@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDExMiBTYWx0ZWRfX39FVKn5yE1jE
 vHDK7k3zKVIt7/jiS4F4L5YHBrqeHCsyh2AdTm0jzDyZVXk24bMmNcA+SMAioc1fKG9DPES5KuF
 3YOhQgZhHlWQxselAjwU9cDFdoQhEBBabe3E96HlosvfcIIHYbEmNfTtvLdH3M7G0aBdW9gw+XK
 NPYNagOnS+GAgNvrV0aa4dzmLHCp2attRCPULduqMiPLfY5yadGZ4t9cgjiwhC6LxTsjW1Ofej8
 yqXsNielshC7vHvHNfs5N8S+Yl6f6Yxz+TJjU9wneOgVN5dJAxIgPKPq965GZtzD1DCfDP5UV5c
 jvC33+9100tbVJ9BQTyS766RA292e4MLJOOECXYhRDN+sWhechAAbcX1cupplMRmEEq1+fAIaR5
 RM2alcGb393hQY9XlK4PZwT119fDtHPsuJxTgIHlJTDYUqkeLjcoVBCds94zzqsSeePvv6sWQU7
 5zLlBJgRYpdN1VwV0wg==
X-Authority-Analysis: v=2.4 cv=GYAnWwXL c=1 sm=1 tr=0 ts=6a0ee985 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=8bRiB-4Q7LyQZs0zT0oA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-GUID: 67PqBVbfcjdwzhGnilWdXFTh7SMRC45M
X-Proofpoint-ORIG-GUID: 67PqBVbfcjdwzhGnilWdXFTh7SMRC45M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210112
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	TAGGED_FROM(0.00)[bounces-109026-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 328865A4012
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 5/19/26 12:49 PM, Manaf Meethalavalappu Pallikunhi wrote:
> The Qualcomm SoC Power and Electrical Limits (SPEL) provides hardware
> based power monitoring and limiting capabilities for various power
> domains including System, SoC, CPU clusters, GPU, and various other
> subsystems.
> 
> The driver integrates with the Linux powercap framework, exposing SPEL
> capabilities through powercap sysfs interfaces.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---

[...]

> +/* SPEL register bitmasks */
> +#define ENERGY_STATUS_MASK		0xFFFFFFFF

GENMASK(m, n), across the other defines too, please

Then, you can drop the _OFFSET defines as FIELD_PREP/GET/MODIFY
accessors will derive them from the mask

Please also use lowercase hex, file-wide

[...]

> +/* Constraint configuration */
> +static struct spel_constraint_info constraints[] = {
> +	/* SYS domain constraints */
> +	{ 0x10, 0x70, BIT(0), SPEL_DOMAIN_SYS, POWER_LIMIT1 },
> +	{ 0x14, 0x74, BIT(1), SPEL_DOMAIN_SYS, POWER_LIMIT2 },
> +	{ 0x18, 0x78, BIT(2), SPEL_DOMAIN_SYS, POWER_LIMIT3 },
> +	{ 0x1C, 0x7C, BIT(3), SPEL_DOMAIN_SYS, POWER_LIMIT4 },
> +	/* SOC domain constraints */

"SoC"


> +/* Helper functions */
> +static bool is_pl_valid(struct spel_domain *sd, int pl)
> +{
> +	if (pl < POWER_LIMIT1 || pl >= NR_POWER_LIMITS)
> +		return false;
> +	return sd->pl_name[pl] ? true : false;

return !!sd->pl_name[pl]

[...]

> +static u64 spel_unit_xlate(struct spel_domain *sd, enum unit_type type,
> +			   u64 value, int to_raw)
> +{
> +	struct spel_system *sp = sd->sp;
> +	u64 units = 1;
> +	u64 scale = 1;
> +
> +	switch (type) {
> +	case POWER_UNIT:
> +		units = sp->power_unit;
> +		break;
> +	case ENERGY_UNIT:
> +		scale = ENERGY_UNIT_SCALE;
> +		units = sp->energy_unit;
> +		break;
> +	case TIME_UNIT:
> +		units = sp->time_unit;
> +		break;
> +	default:
> +		return value;

nit: maybe setting units and scale explicitly in each entry could
be better for maintainability, but potayto/potahto


> +static int spel_register_powercap(struct spel_system *sp)
> +{
> +	struct spel_domain *sd;
> +	struct powercap_zone *power_zone = NULL;
> +	int nr_pl, ret, i;
> +
> +	/* Register SYS domain as parent zone */
> +	for (sd = sp->domains; sd < sp->domains + SPEL_DOMAIN_MAX; sd++) {
> +		if (sd->id == SPEL_DOMAIN_SYS) {
> +			nr_pl = spel_find_nr_power_limit(sd);
> +
> +			power_zone = powercap_register_zone(&sd->power_zone,
> +							    sp->control_type, sd->name,
> +					NULL, &zone_ops, nr_pl,
> +					&constraint_ops);
> +			if (IS_ERR(power_zone)) {
> +				dev_err(sp->dev, "Failed to register power zone %s\n",
> +					sd->name);
> +				return PTR_ERR(power_zone);
> +			}
> +			sp->power_zone = power_zone;
> +			break;
> +		}
> +	}
> +
> +	if (!power_zone) {

I believe this is only possible if ARRAY_SIZE(sp->domains) == 0,
but it's not obivous that it's to protect it from that specifically

[...]

> +	/* Map spel domain registers (energy counters) */
> +	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "nodes");
> +	if (!res) {
> +		dev_err(dev, "Failed to get nodes resource\n");
> +		return -EINVAL;
> +	}
> +	sp->node_base = devm_ioremap_resource(dev, res);
> +	if (IS_ERR(sp->node_base))
> +		return PTR_ERR(sp->node_base);

devm_platform_get_and_ioremap_resource()

[...]

> +static void spel_remove(struct platform_device *pdev)
> +{
> +	struct spel_system *sp = platform_get_drvdata(pdev);
> +	int i;
> +
> +	if (!sp)
> +		return;
> +
> +	/* Unregister in reverse order: children first, then SOC, then SYS */
> +	for (i = SPEL_DOMAIN_MAX - 1; i >= 0; i--)
> +		powercap_unregister_zone(sp->control_type, &sp->domains[i].power_zone);

Could you try adding a devm_ variant of these register functions?

[...]
> +static const struct of_device_id spel_of_match[] = {
> +	{ .compatible = "qcom,spel" },

The compatible must contain a SoC name

Konrad

