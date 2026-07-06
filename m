Return-Path: <linux-arm-msm+bounces-116824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VZsnCOGmS2qnXwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116824-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:00:17 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A764710EC3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 15:00:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gj3meI7C;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=fdXiIOxb;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116824-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116824-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 0628130099AA
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 12:55:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3838C436BC3;
	Mon,  6 Jul 2026 12:47:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E0E43635E
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Jul 2026 12:47:46 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342068; cv=none; b=e5Xbx/PIeFx8XD3VvWJLmNTQ4sFcZwTfhb7RBEk+5wPNSIx0dtEKDqAGXcNnbvswT/zGHz4AkpOBkrlEbGXSu4X1wMPAJoQzz+sCwzfDU7vWkGaaz0PCILg4GIT/QsCT6n1MaWEjRXTueZFqUXgmie0WDWFyeo+3/8n4gefjBiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342068; c=relaxed/simple;
	bh=g5qJX4JNhZI0DmdycjroFtWKDRd43g5/AYwv9oxJ7n4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pF2PrhqYZkq9kzPO9tcIzMMuJpfb0gO3KsINExaFCDAvbZwsfzSgb6snL/ITbpUvllQ2KYCRdct/htPLLn9TGeQuBj+f8/vAhydueThSdQbOPQdKHhmzpfmlCfHam2xV0PpkVU4Bh0SvnBBVqu8MzvejZhHqDbvUPYEFToLx4A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gj3meI7C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fdXiIOxb; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxOOp245767
	for <linux-arm-msm@vger.kernel.org>; Mon, 6 Jul 2026 12:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vc9IKcO6PVsTBKODmX8h5MGQwlBH71smxCZ6u3DmRtU=; b=gj3meI7CUFmhcY9d
	VMkA39A5BOqrTPZsaEHVCSuV9K8ovqGknxgYPlmWb4ntP6T6r02rpI8Z/ngeHAnE
	gEpmeFyEBwya+qsLLQiILM9Oz6ssZae/Qlg+iUK0PJhnt+DdLgrF8eKqLwBIMCLj
	oiZtKrdFJsywQgPv9N8LyvO/ot1DoARK61f3hRfirxmv1wgOcCR3CnNbyxVmiHWk
	6HrJpwjpp7pkBnG++9HHJmioryZSpyb+zK+lryLiKcYyQp3CD1i6RAcrIdZgZ3Y8
	szZJaQ635plv1551L9tiuAC0EgMqhamKcwwlQIgA+1R0WFRISyjAUbRYTFu+qX/l
	vytjpQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a98gjyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 12:47:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c07313be5so3500121cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jul 2026 05:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342065; x=1783946865; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vc9IKcO6PVsTBKODmX8h5MGQwlBH71smxCZ6u3DmRtU=;
        b=fdXiIOxbfrIyfWWY+xBpi3ztbJ3UNpP0V2ARASTk13+ZbtrsQP8MMHFRgSjXv6Z+1Y
         3N3r90zz1a6Zmvd3fwMyFCNy/iQGVjUW8DDkRrU6CiCo8FA8KA/ZCjgOAdfTt3BfgC4m
         lt8LFQjLm+nn5DitH0BwcUR4SG6L5PVWCBdX+xrEspjX33uo5zqPytbKINYzRG3aOxhp
         io3YHhq/itUDUwuRlXmBQHQal+n17ZJs+LqCH7IqXps1gCKPSaGrWN4U4lGCWNH+Pi5m
         er2VDOxlg+n78Ly75GXKnQbTsge5nSs1TH8kQyZEP4HU4ibvMaaNeQ3xl5A0x/JwYu4A
         p9zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342065; x=1783946865;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vc9IKcO6PVsTBKODmX8h5MGQwlBH71smxCZ6u3DmRtU=;
        b=LyL9tDo/H11GuXLiS21owrU0GcT8v1LvfHp7ypZcSG0PHlhKfEngPPv5cys/LugqmE
         M2HQU5XOfG4rwshN1R+liLvo+PrkXL1Kgq1rHfWuVEavhhrwRkfr9slxoBKsQts1pvOC
         C/sAfRgS4JVCa91gBPUyTH7mndUFJ+LnxLyE7lpZTXx3NYKlH+wC4CUg4a+6+F4dxl4B
         mAvkQIAlKB6pGbRns6OqfbNXA2slLJ38SAA50+sZLv7s7oHGbGRt4ANFwf8tNDmOMU/s
         ktK/vVctryXSz0OaVkKfZxEfnWNrADRQe416oyxO2l2B7rlhp9HZg4Y3lUhr39D75FDE
         0zRw==
X-Gm-Message-State: AOJu0Ywzph81jjqdT0n3g78TNv+QgiRv7U/QHCwcttLVaPWENI8uNs0A
	V4oaVc5LtmairWzZAgRFSCaHpR6xc4UI0Z62XFjKvraBCF+UPeeS4gFP5P4VstLXe9yGG8jHsgn
	ErWOFeULyw6xmkRBY5x1j5oztRvVakLWZH4sA0Ut0o2JZ6FV70gUJgOwmf7bcKBAevQw2
X-Gm-Gg: AfdE7cn8OQhEgwONt67IX7dza3rtyENwkZ3Hl+/hADvBSElMNBY+wbY2x5ppMEHIAys
	dHrhDiBEVRSdCO1mwgllKlFBS5JfG+UbnEZRdXP6HTIndD+pNKk2T3QdtmMnYRvKlFMilOrgcSh
	quwzbUcUUlpVo975/3aiUVAVzpwZ8FUjz1d/0iXlTa9MjSARmrjugY6DzIj3Q+yr5KOph7z1c/H
	r2tmKT1n8UqNeDtbNN5CyMPSVRX1HwwwFiFXODwWhFvkIzRbToxJ5ioioDF7h6qSOb5RQoucLnP
	jNWxA88ef+CgbR1wBB4AqztQqn916WB+FCgj3SxwC55tVzVZCY8808F/y0/ZZa43vuzCz5wKQBV
	qNXLpd5xCSxa3drmbcLDJu4nvHZKlWyfYNRE=
X-Received: by 2002:a05:622a:1650:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c4bf02ba1mr87025951cf.9.1783342064973;
        Mon, 06 Jul 2026 05:47:44 -0700 (PDT)
X-Received: by 2002:a05:622a:1650:b0:51c:8fb:fa46 with SMTP id d75a77b69052e-51c4bf02ba1mr87025641cf.9.1783342064340;
        Mon, 06 Jul 2026 05:47:44 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69a19dbedf4sm4083379a12.29.2026.07.06.05.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jul 2026 05:47:43 -0700 (PDT)
Message-ID: <4bf121e6-ff38-4acd-8fe9-11489b54bf55@oss.qualcomm.com>
Date: Mon, 6 Jul 2026 14:47:40 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/7] clk: qcom: tcsrcc-glymur: Add Mahua QREF regulator
 support
To: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das
 <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
References: <20260702-tcsr_qref_0702-v7-0-776f2811b7af@oss.qualcomm.com>
 <20260702-tcsr_qref_0702-v7-5-776f2811b7af@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260702-tcsr_qref_0702-v7-5-776f2811b7af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=SpigLvO0 c=1 sm=1 tr=0 ts=6a4ba3f2 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=NBHrBlfBUiTlkn9WGu4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX3JpLlaiPPx2D
 WqRtpyxDPjOxXBRncxJE+pHky3HE9cqPwNaVtq5Dduku8KjOVohQ1ixugx0BMTYUVDLqEe7JYZn
 iWSAyVGXh9g+S2pCk4xpQPSoas7sA1wIhfTL/Wz5ySzbTbtqZaV9rdUC0uNBGSZyx4jehu6Um4P
 YOvyfxpnZQIaXWeJCOtBsI5ieV1V5Yb98lZLsaUaR1uLv/X4ATbb6Hx/DoEYG4etgpij7xPj/nN
 HQm1AlcZgs55SWyELy3uTaHWWnlU7qrQ2PkYqKembxSK43aZnw6U3EwSIG8Uz0h/6hWonNJ2tF4
 143D9FIlfrYwoxhFpEy6Q0KcTNChvwbRMEPqk7/DnUgn4SbG0He/Lm3aH4+YGtx9dbK2ePJH9S7
 DBDXNPjrGksa7oAK1wzKCKTkmnUldaXvPRPjNiGxwPA6I9FP4DYYegQahrF34R7/bEryfhS0wFX
 cPH2PqrMFe+1B6HL7BQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX8e/yIweV4G1U
 M8DT8KLA4KgRu8Yq6YzIsI7XzZv/f7mmu9GkqwjGY7uvEI2CGUXlbcR3oqvuEun129x/QLsnhrF
 GTukwhRPhQxRN3ltdaRQt4ekasgb9nI=
X-Proofpoint-GUID: 4CWkYT_AikQjuvSgt9kql5XqskEsVDdF
X-Proofpoint-ORIG-GUID: 4CWkYT_AikQjuvSgt9kql5XqskEsVDdF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116824-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:andersson@kernel.org,m:mturquette@baylibre.com,m:sboyd@kernel.org,m:bmasney@redhat.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:taniya.das@oss.qualcomm.com,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A764710EC3

On 7/2/26 9:36 AM, Qiang Yu wrote:
> Mahua is based on Glymur but uses a different QREF topology, requiring
> distinct regulator lists and clock descriptors for its PCIe clock
> references.
> 
> Add mahua-specific regulator arrays and clk descriptor table, and use
> match_data to select the correct descriptor table per compatible string at
> probe time.
> 
> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> ---

[...]

> +static const struct qcom_clk_ref_desc * const tcsr_cc_mahua_clk_descs[] = {
> +	[TCSR_EDP_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

OK

> +		.name = "tcsr_edp_clkref_en",
> +		.offset = 0x60,
> +		.regulator_names = mahua_tcsr_tx1_rpt0_rx0_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt0_rx0_regulators),
> +	},
> +	[TCSR_PCIE_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(PCIe4) OK

> +		.name = "tcsr_pcie_2_clkref_en",
> +		.offset = 0x4c,
> +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
> +	},
> +	[TCSR_PCIE_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(PCIe3) OK

> +		.name = "tcsr_pcie_3_clkref_en",
> +		.offset = 0x54,
> +		.regulator_names = mahua_tcsr_tx1_rpt012_rx2_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt012_rx2_regulators),
> +	},
> +	[TCSR_PCIE_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

[!] (PCIe6) This needs +RPT2 +RX2 -RX1

> +		.name = "tcsr_pcie_4_clkref_en",
> +		.offset = 0x58,
> +		.regulator_names = mahua_tcsr_tx1_rpt01_rx1_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt01_rx1_regulators),
> +	},
> +	[TCSR_USB2_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(USB_HS) OK

> +		.name = "tcsr_usb2_1_clkref_en",
> +		.offset = 0x6c,
> +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> +	},
> +	[TCSR_USB2_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(MP0_HS) OK

> +		.name = "tcsr_usb2_2_clkref_en",
> +		.offset = 0x70,
> +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> +	},
> +	[TCSR_USB2_3_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(MP1_HS) OK

> +		.name = "tcsr_usb2_3_clkref_en",
> +		.offset = 0x74,
> +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> +	},
> +	[TCSR_USB2_4_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

("USB2_2") OK> +		.name = "tcsr_usb2_4_clkref_en",
> +		.offset = 0x88,
> +		.regulator_names = mahua_tcsr_tx1_rpt0_rx0_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt0_rx0_regulators),
> +	},
> +	[TCSR_USB3_0_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(MP0_SS) OK> +		.name = "tcsr_usb3_0_clkref_en",
> +		.offset = 0x64,
> +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> +	},
> +	[TCSR_USB3_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

(MP1_SS) OK

> +		.name = "tcsr_usb3_1_clkref_en",
> +		.offset = 0x68,
> +		.regulator_names = mahua_tcsr_tx1_rpt345_rx3_regulators,
> +		.num_regulators = ARRAY_SIZE(mahua_tcsr_tx1_rpt345_rx3_regulators),
> +	},
> +	[TCSR_USB4_1_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

OK

> +		.name = "tcsr_usb4_1_clkref_en",
> +		.offset = 0x44,
> +	},
> +	[TCSR_USB4_2_CLKREF_EN] = &(const struct qcom_clk_ref_desc) {

OK

Konrad

