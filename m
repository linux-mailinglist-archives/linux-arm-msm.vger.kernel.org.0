Return-Path: <linux-arm-msm+bounces-92685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENEFMsG9jWnL6QAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92685-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:47:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD6A12D234
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 12:47:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F4140303B144
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Feb 2026 11:47:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8619E350A39;
	Thu, 12 Feb 2026 11:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mUzsZQaU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YbuWK9k6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABE33502BD
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770896829; cv=none; b=WG6e4YCKN3IDQz2+nQqtQBDsezBwNJ5VVAoOIEs8WiPvH2OMiFhATciUFSzazEPZBmIuM0rZAIS+q9DUvstAAyiEcwIesIFqFYeLJSAF+eW+Z9tMMLHEdBnZqG+ejXPzU7NVrjzDT6bQSEsYpmkvYWogUufiq66Z4qogoVjBaTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770896829; c=relaxed/simple;
	bh=d7PdfllRYXKCySoyFpT71xIMtjCqZOzUugc8gEXS71U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=defbWANesd18gXnh3HAA5A/CWPPsbB1j8UZpUp4yTTjvhnqe5hb6+TS7gQgPgTHJzfHIyVa39qiyZI1E90kXJMmXChEHkq0DVSSw4YbehYr6jJwTjqvRhZJSBE3qBd6t5qLK8vXqc9OlSlCNZjBtdbYbe4PMXOV3hMU+R9qS/mI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mUzsZQaU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YbuWK9k6; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C9xqqM271946
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BZu7py3oZxkvM93xUSUx1EBYsa0WCEZcReaMr3Zm3Oo=; b=mUzsZQaU79sevzfC
	xVD36GKuNBlnKjzjXMGes8U38o1LCvoL2r3buko5ukeR2nDI5PNjBJgG9ZOTocWE
	/uQpW3a7AsWslzbwgyicSeC5TeX2YQr1hk6snwBiifxm+QBv7RUxSmSccVKHfvkq
	hutcdZ9261ABsL7fU5snxFUUmTpUZm35MQcQ5l4YyX7H/bA4mqG5VobV6uBHrkde
	Th5j1T9vIJCq44mV+Amt496r20qQMiEypaO3dtgdV0MDB7Hfwf8PmpT8XMSATCDH
	o2zqsPMr7sGnJhqWQ/IPYqF2gqFc5Devz+IUA8sh9I3INV/uxchEYpkJV5gw5X3n
	5iMASg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c8y9btt8k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 11:47:05 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c710279d57so266270185a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Feb 2026 03:47:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770896825; x=1771501625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BZu7py3oZxkvM93xUSUx1EBYsa0WCEZcReaMr3Zm3Oo=;
        b=YbuWK9k6mIZsZ5knmG90tEh8nkpOVPhke25ibsPoQ4WRWVCfCITyhfLEdtWQ03Ph2p
         mXbLtP77Ver4md7szEde1EnNdBf4QMJ2nrje+ciLRvVNQKLRurdHelN2/VoG9/z4Ayq4
         AaXd2Tf1naeC47nz9VHU5ornsImfC5CJ5j6d+eJL5qJiRBov9r3/yhjykzII6lRiimnX
         LGEtLCNGP/kJkapDyqKn5UGJR6tSi1r6tVTM/i2ikNR+N00gdX1REaKA6VUgyy9aYXds
         mWXl4RFLmEoso7cONbVkhe+DnfxkGE8jJRkbvZjrEvR6qaS4wtLPwV7y+HTeGOsaeDa1
         APIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770896825; x=1771501625;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BZu7py3oZxkvM93xUSUx1EBYsa0WCEZcReaMr3Zm3Oo=;
        b=PMT5adbcJv12uXOyFOK++J2w9NUtbo+bU8EE7XKrtzACclZntf2ReGu1liIcJAvgkP
         1P+oo7TQHSn6l5OzVv9fQideyUq6qUdda+FseAGbNb7EDdOHpD4po8MooK0PGKyOieVK
         LO/Hg+FgLYosDyvFk1vxAhatzqNVL8TFPIcq734TsvZq79H7HHmFcXmIBG4FUoHda5fD
         myUL9/KlVIYfKL0crFhRH7bjxsD/DpacLNe6t9RIH3CpUjsGWpYbGrT1slx/OLGCKomb
         YXYQ5DysWrahka0VX6ABN0novAkX0OoTUdi8W2oCBZeQ+Y1ZCHZ6kWmypis8BAluKpY4
         GrGg==
X-Gm-Message-State: AOJu0YzVhRIwYBIbHnABQblUL3qk9OW84zhWkkPTqQrsszyjOjLZQQ7t
	BCw1n4FVarz0fURcawM1qNxbbyo5O8Qh5IBagyVgTQVWb24Vg85Kgq+981hYtRP1m1S9tX/GqaK
	omRZdXx1tgFdKqoeX0/ZssKco/JpbtR05TyQOXE+fVsiPYKvFfRcOpOqXkQxr5b6TaGT8
X-Gm-Gg: AZuq6aKvd2cm2MgzblFculYP+50r7W2YTgP+MIHOM2kwTJ7U1SYukNF799blzFQ2aSu
	XPSjAsq8wY8rWbTE6pAq+GgjX7OAD4q6FdZtofnjE3iAmk3pIR3AvkrbAb3kadzsmMYt5NEZUXz
	6GLU04NJgu6VDoL/6CIN58JJqHgdIpo7B/dIPSQlWfA6NCS3c6R6vUYQhjGZ2k2YnujmUK5mxYV
	mAR5joLJYsEbFYh8OVfRPG046CUolKIftK7bv3IT/fffUIJYBHsGSSmmbVR18EuR3/rmNeR+v0j
	nQVlf1wyIX8/jZZvhqCY7NQFlzdl2KFvfgiODaG0tjw31C4Lrd/AX8W6laJ1MujQ6YDwGXbOwL1
	mECxe0b3WzUTS3NfOL1u323ZdbyS+CjjZYSQf0iUR2Nbk8xABpCYPuYXj6b2vdMkJlBpFhyTZLW
	Qeb68=
X-Received: by 2002:a05:620a:2806:b0:8c0:cec5:148c with SMTP id af79cd13be357-8cb3319d1acmr218800885a.11.1770896824697;
        Thu, 12 Feb 2026 03:47:04 -0800 (PST)
X-Received: by 2002:a05:620a:2806:b0:8c0:cec5:148c with SMTP id af79cd13be357-8cb3319d1acmr218798585a.11.1770896824244;
        Thu, 12 Feb 2026 03:47:04 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65a3cf4ccd0sm1632462a12.27.2026.02.12.03.47.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Feb 2026 03:47:02 -0800 (PST)
Message-ID: <9ddb0246-1cbb-48ea-b62f-48bb627d665e@oss.qualcomm.com>
Date: Thu, 12 Feb 2026 12:47:01 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom:
 qcs6490-rb3gen2-industrial-mezzanine: Add TC9563 PCIe switch node for PCIe0
To: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
References: <20260212-industrial-mezzanine-pcie-v3-0-1e152937a76a@oss.qualcomm.com>
 <20260212-industrial-mezzanine-pcie-v3-1-1e152937a76a@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260212-industrial-mezzanine-pcie-v3-1-1e152937a76a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BbPVE7t2 c=1 sm=1 tr=0 ts=698dbdb9 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=qSWERiRezZrDuvaUYp0A:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: l6J1o-ddQ4JTgTN2jmDt3LjZlFkwoL_0
X-Proofpoint-ORIG-GUID: l6J1o-ddQ4JTgTN2jmDt3LjZlFkwoL_0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA4OCBTYWx0ZWRfX7eQ26A8lncJ1
 AK5swJGCeF3wujBFUH3yYx2zuAC2KXObo3INzLu0za8MAS0z8qST2MzW5pS2I1E+fH7JpGWdviu
 8XiV3+h7VqUeQMgrnT7wr0U2VCu6Fag58tnCGB1BqTq3s3l47MD6p/Vgc2xmxIGVJmxNkdfWTNt
 4wguedU4TZqAZF9b0CbupXUoLnqpxBI41Q0ISEn5xzP0adO1V9XufrkmGo+FmWlJWP0/GP+apWD
 952shOhKp/goliiTZ2CZAR+H+NppcOjMdNOFFqWH/8Qe1owO4UDqCU130tHpFGKGjHhA0bVvao3
 IpVxXT8nDMaGOZoFmJTQu9wlEZuPUgbPrwLmEBeANAfvc9u0Vmx15eoW7YPRtvqV8iWoSbJiNpR
 17lxf3tdj56P/UpXRGZsCI99gbOVomOat5o/TC4QFM6625arXZClx8JJJM3ACVz8zxn4351tcJI
 npGbmzchhSfP//vyjCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602120088
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-92685-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2CD6A12D234
X-Rspamd-Action: no action

On 2/12/26 11:44 AM, Sushrut Shree Trivedi wrote:
> Add a node for the TC9563 PCIe switch connected to PCIe0. The switch
> has three downstream ports.Two embedded Ethernet devices are present
> on one of the downstream ports. All the ports present in the
> node represent the downstream ports and embedded endpoints.
> 
> Power to the TC9563 is supplied through two LDO regulators, which
> are on by default and are added as fixed regulators. TC9563 can be
> configured through I2C.
> 
> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
> ---

[...]

> +
> +&tlmm {
> +	pcie0_tc9563_resx_n: pcie0-tc9563-resx-state {
> +		pins = "gpio78";
> +		function = "gpio";
> +
> +		bias-disable;

In case you're going to respin, please drop the blank line in both patches

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

