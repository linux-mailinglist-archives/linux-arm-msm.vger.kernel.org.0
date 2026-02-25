Return-Path: <linux-arm-msm+bounces-94113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKAWKgLsnmk/XwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94113-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:33:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03863197680
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 13:33:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E218D3013D48
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 12:27:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E79273AE6F9;
	Wed, 25 Feb 2026 12:27:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Tj37xlL/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cPXtrQAq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20B03A1D04
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772022456; cv=none; b=YUF2QILZfmOPrXmWdKwyQ9kyMrNjKjNaE+zcyDR2y4a+o/45L3JTodvmyr9uuAQ8MrYdrUN2DlfYxQyoUfN1Pd7gLHF4yn1H1yzvYmK/1El5juuZ1ytHT5m24EFZsBMvV647dABr6+3o1Y6cnhbRKMvwtQ3gC4dHeP2JxvmJS9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772022456; c=relaxed/simple;
	bh=PXLTDh+maqgCBxe/dNvorJbLsAGIBi8CvjJVHMhJXjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EHJ4AZrzmlZGRZA4ycpOtaWH9RBdtcIwUCm+2v2QHgYXMiio384BC0GTfY1ZmVaNnv76hLYPUnFK8nIWT4JINv6ch0neVPdfTkMxCOPW/heEe7QM/cvElaNCBy0nVXFrwf1+p6ThUYBTBNC7FTyQ9OrbP73eLY5tEYsoqfjjQ1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Tj37xlL/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cPXtrQAq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9SIbl1363561
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBLN8mfloDkKNrXMS2fMdIdaf1c76aXQMPp70m4A16Y=; b=Tj37xlL/UTpuNxcr
	w1ZY3sKTGg5YQTzzjxEgagk+mlA4cJoyDJ2mlIfKaI7aXkqa8NgHyiT6m5UDysbj
	fjK7oF35VVxoD6NawThAOZQFiVjLEZbe22gbn+op0fQiKfM3gLyqVEJdI2KfVj53
	wI8RyK5QZTDeTadbdHAPwOs7ykleDyaaTj0d4PyQWl3gA8U3tNZUG0QAPLcGwsHO
	42J5VZ8gnpkmYOlqztX82pThOEWtVVHvOnHGSnP96dVAM7gGAbkadI+hv6x8sld/
	Eral/OxTTG3uwh4UaQG0O3W2jjhjagNCSgN7UhUBfhZMAYlFHIG3drXU+qoVXT6k
	a/tD+g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chp159xqa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 12:27:34 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb50dfd542so607038285a.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 04:27:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772022454; x=1772627254; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fBLN8mfloDkKNrXMS2fMdIdaf1c76aXQMPp70m4A16Y=;
        b=cPXtrQAqdEQJJ9AUSqDucOg91QH3l5fhjVqJnD2tk76C81UwMJW4muTW2EMDJrRiDF
         taSmYxOoXn96n4XiR5YjOvjrGHYlX5fLgLDLHmLHqpIkh5aRz4z+vmW++zBawgnmnI79
         3CW9okREci3aKJzEYeVtOibldRbFhdQJLM4oUVd3bQD5M0XxcLKnJt2t7+0fwMz+Mk0R
         ifj+i/pDtk7njeLg5zMiSCvxVOY7m6h+JF1JKzn6M9IkhcH1Ezj0XeUyiVEThlJSwWp7
         aEkPyeH36AN+HTbZn1TqQApWregcegQ0ezvdkZSXoFo3TRXMu+67BcQtmD0ciAE35p0x
         kxSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772022454; x=1772627254;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fBLN8mfloDkKNrXMS2fMdIdaf1c76aXQMPp70m4A16Y=;
        b=hPyStvihe4Fk8KN4O++qLagXDsquR2YdK5GSm5hOnwgVR2xovvCoiygYhjD38dWLbs
         LA7ZpReBYV8tiJzPTRaRsowp1zihL774s0AKcIy/N4NoXhXxhyP/ukCVGXPufxc/4CWV
         KVkLpliC/Ugl3y6mAXw/GvExyXgSGmji8turzstMZ3tFI1IcdwDVsGfveQjoqZtCTLw0
         F9nU9ClLRsiMGksCePE7V6n9UvYIB1LA5uIKc4/Hmjak+zeTmQHwgdUPUw5J/wzpuD5Z
         sDGqUWdAUQfZH0q7B5HZ8+KxecGDt+k7h88THMBthW4S6Jw9qDSfbbahCmyoNFc+OPIY
         B+pg==
X-Gm-Message-State: AOJu0Yx95dD7e+6M6fQFFy7KNc4EprGbvGS9m+33A/Kxud2d4Z1HtiZv
	KUTMkk7jsRnBeKdbhMOwybVJuhUYjkvri0r96qtt+URqzQ4wcmim7r4FUG9r2GCuYzw9wgOMBbI
	VBSDxT3aH83+kDDWKqME00ByfGX0mdBcUUQunTU8LYI0QkrOityv8+Zu3g+sm/K2Vx7iB
X-Gm-Gg: ATEYQzw3ZhYBNZzyEpfrcBQiqZBRCD/5Ru4bGXMcQQJLIH75xduYsjNHEKltcct23I5
	Wq7oW2m71oD1jykGFZVjZrV8qgv+FMe0sStWhKrRweBoLngxjFlbBfJGFVjjrrbp5z+X1DGZjXi
	JWqOdLb1qDWc5H9Crve/HY7vbHrxhJsUw4ElafI2bEG1qx46MNSitA7Oo0TB7c91BV9Xc9bTjV2
	/o3PTazGZ5mrFM0paAh2xc/Q7YCIqAPaYc7cF8w2WTXV57BqjGR8hNyxvIiKp7qltmd49KTt3Xe
	sMVvjMI4NEpbne98zDZ0k13B+dh1puY6NPgiVlXmjIBaNdxr9izD7SwRnYSOq5SgTb7eK7f5uV7
	RqDp1t2M0JgR//YycEEAw9/Tylcjdw9RXDOMpQpJeRHB6HZOKBQVUtiuETRUqL+3QTRISOwpgSn
	UD2LQ=
X-Received: by 2002:a05:620a:4628:b0:8c7:1af8:4ea0 with SMTP id af79cd13be357-8cb8ca640e5mr1609795285a.6.1772022453998;
        Wed, 25 Feb 2026 04:27:33 -0800 (PST)
X-Received: by 2002:a05:620a:4628:b0:8c7:1af8:4ea0 with SMTP id af79cd13be357-8cb8ca640e5mr1609791885a.6.1772022453456;
        Wed, 25 Feb 2026 04:27:33 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b934c9a645csm15099666b.34.2026.02.25.04.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Feb 2026 04:27:32 -0800 (PST)
Message-ID: <71addd51-78bd-4e1e-9881-76f0ace0a23c@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 13:27:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10] arm64: dts: qcom: qcs8300-ride: enable WLAN on
 qcs8300-ride
To: Wei Zhang <wei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260225071459.1600394-1-wei.zhang@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260225071459.1600394-1-wei.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDEyMSBTYWx0ZWRfXxkp+VYPVxgZy
 xcZBAbMJQuf1kk9G65mZg6J9qCuph+XD6ol8s0FkU4T2cRYJRP2MhvGbx7Neb7Mo9rkgusA48mv
 kl2QXDsk+103yid1RgXt57vdwCw6WBw9Oe+1G3BOtxMSxs/avvajKKGtzlzVX5iJYFtJdHpfjvs
 PbSr5yPub9/AlpW2aBOdmjIJlRPvUg9uAec8mENUbc51a8Qd8cBqsqT4NsQVJYfzr+SkgFxulag
 NXr4xvd5As6JPAX0h6Rfpn6V+xwKvJPdevidmrTqpJuMZWegq1DFgzYDtnj8mp+Wel4xb/wET+Y
 QRIyNI4x42jKL0FC/fl1vF0lZ37s4YwMSN2vTzD6T47KXbyFTcPQtrohRXrXta9MbjZrU8GuuFB
 q8PALEEmBEq37uEhWWFYm7XWWz1UzAx/ioSNFuBBreDXsyyapIrBlWka6irXQ52jawK1oCwtRbJ
 k/2ELp0zn/4sGdTTX9Q==
X-Proofpoint-GUID: Do_0w5vq6XC_yufHWVN9Q_S1MMRH6hK-
X-Proofpoint-ORIG-GUID: Do_0w5vq6XC_yufHWVN9Q_S1MMRH6hK-
X-Authority-Analysis: v=2.4 cv=etXSD4pX c=1 sm=1 tr=0 ts=699eeab6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=DgEYNLXXC2yaUqHi_YcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250121
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94113-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 03863197680
X-Rspamd-Action: no action

On 2/25/26 8:14 AM, Wei Zhang wrote:
> Enable WLAN on qcs8300-ride by adding a node for the PMU module
> of the WCN6855 and assigning its LDO power outputs to the existing
> WiFi module.
> 
> On the qcs8300-ride platform, the corresponding firmware and BDF
> are QCA6698AQ instead of WCN6855, which have been added in the
> 20250211 release.
> 
> Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

