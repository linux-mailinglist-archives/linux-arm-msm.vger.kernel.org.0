Return-Path: <linux-arm-msm+bounces-114929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 0YMwJ6c5Qmra2AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:23:51 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 006AD6D81D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:23:50 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=KWVUTR5j;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=Nv+xrp5z;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114929-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114929-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3C3303037EDE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:23:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90F763F0A92;
	Mon, 29 Jun 2026 09:20:14 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564B331A813
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:20:13 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724814; cv=none; b=mJUnt0/VilSHTfqE2wi+7BuyHnNjY+/b3RCNGVcN/fuYyArWvkSM3s4L1aRMesZ6A05iA8IawdOHJLpCyJMAlNi/F1/xSwwNrTgTTgf7Dmj9cxVgtrGGMkuHvZ6riqHFq+9q9ENytaCBKc3xiLQuiK+jQUljZLthluWRrRc76+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724814; c=relaxed/simple;
	bh=aeaG/C3wVAYl9nGzGVoXMOYhDZ0xv8ELPVWjCtzQ9Gc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TZBJzTohRvuuarmyZjDODfipfUOQco4D6VG6uLDr63+4dCP841PJ+5+bz5XbQtyYJsC2x4K2TNt8dwP+paz/fk3f921H9zo/lKCPTx3cuT8DN3I0LevGd2LstoFpIC9hKNYU37zLj30Rc00F0H5xo/5FfDlEaos/rGtI1YYGyPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KWVUTR5j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Nv+xrp5z; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T91QXf2400938
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:20:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lx5ClSQCx2d7oD0iKrRpdI3v2HOgXCbOYzofJpTEngs=; b=KWVUTR5j8fqWNzfC
	Dux3lXOXIOoYhOAOzal0/KsJ/tCmP0uxuABO8Yc+qAUlZQm39q1NZznBuH/M6QRF
	mRIYXZ1eFXsnOy7ofXt5IaF3dZvj0Rpsv2edaBqGTzkZX4wALsFEvz7ytuSrzEmT
	VT6AjYycmvwFwm7eK2s+NT9EI1L+W0PaRradhrHvgKS3l7CoozxBnE9DU2w+1GwY
	fsSzRcoXfGJQqGkL7aakidDDMPi56PDHczXO66I5m6JcKIp7/SMCZQWI3JL4zXNz
	00z03GEps6Rgz3neW/zEKJlGFbiFCz0hLkO8T+qRqQHfYAs6BP1KPK3/l/Lg/8PN
	gk5ulw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nq882vs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:20:12 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b79cc1f21so72155985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724811; x=1783329611; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lx5ClSQCx2d7oD0iKrRpdI3v2HOgXCbOYzofJpTEngs=;
        b=Nv+xrp5zh84To4tRSvJT5HUNXc4rzQ7lXkOAh5I4MEyDDod0FTAm2I1Pe26cjx1Mk9
         V8ZQSKVTjoBh35eC3UBnr++C2X7Er52FBcWOOY8ojARlCfZS3z2gLMJ4c5bPQcAEzSW4
         o9pJQKpbp/j8/K61yrGHG4g6vjZSvclWwkPmudtD/BRQjo3x4m9IysHr1r7QCRQIzjug
         A+oa/epDc9kh3mlKha+g1NIWxbdU4oL9VQnKg99X0CU6tjs1FafuyTlgPW58CnKHt0B1
         hEi2vWWzgGHAQ8WbWm1DCw2XrZ4ALfwPHehq1J+E+vIg5qYRRMG9CRgsVS2PJo5W+bO2
         1qYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724811; x=1783329611;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lx5ClSQCx2d7oD0iKrRpdI3v2HOgXCbOYzofJpTEngs=;
        b=Eq/0ZRo/rUeS+bNW8j+R4xtlentLFAg2Ju7a31at6QBV7NTLcwNMHRZT36dP/JvSCk
         Rj6G3Gb6OYsPfwkcMozX8JVcAYjctTTxw1JkampeAj4PbAN8VGTMALlsmP2Lu0xq0Wdo
         l32zqwpUUM1yzRRhhEnBbMtRDiol3obalPdXwrNqpHiW6PCpcL4PcndhG152eZKdRayH
         0LWjUV8UjZ1/ofkx9qmSRyO4DdA26+l/M9m2EZoRUoikvNgP2czU69xHbTGDsrgCFh2V
         OOnTEQcx1Hx0ZCimAB1tnuRkMfyK3TrcQA1l+yV17pZ890kfBy/JnB+Gpivt6QVbwAJ+
         AGiQ==
X-Forwarded-Encrypted: i=1; AFNElJ++zYK3/8Hj6hK5r7j6HB/H4URVCBvPZb5tc+ycq+vou07DKzuYn3jpBpausxKQ2a62biR7w9WIZx9sATyt@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+VUpj7MJ4PPyWk/Ivl5yX71/Jzw3zNz8XnIVJ+Dp6ZAXbvrx4
	MK97mTxIc22tutG+tHLkv05larDf3jlzZw4vX9ENSC7/cQl+0cxZQfqCx7zQ/LnwQD2RGO/ioE0
	StWt1nlEkLnZzuPBtX/vdjoV+Wq+OayhRpJzoWG7qQ6XfD950wETEW4buptQntQl93CiP
X-Gm-Gg: AfdE7cm7dt0LhXqj4pt4ljqrPQec3wczPYjBhsKKPgQjIcotWp+WfFL3LJNC7bK7ICZ
	ADrJsZ7fS2leYWwQTD7So8eV6tXvC5NmA9vBBgEcpzK+8iTGWSf6dCUaJpkXGhoZjWIP/qSlLQX
	eYasWSU9R6edibF5F+nJCs+fySj+GfzOR01YIzuS7ZldasGbhMnIpY3WhnLMP5ztOnM9lI50Tw5
	c95dTcIJSU2mMVORTlsDSvMrfRZQO3FF8scgyKd7+AaPIChgCUuz9BSMCtvRjM2USRvmx4sBW3x
	d2FlObDEzEL/e2c+PQ4JoGn+zagksiYNg8GR6iwO9xQWhjOOO/woYJxVYrqrEhML879ofNu1fGH
	q4e/7xyhAuDtxLbLxmpU2so4E0uAAKMS/DM4=
X-Received: by 2002:a05:620a:2684:b0:90d:11b2:80f3 with SMTP id af79cd13be357-9293ccd5b89mr1496331185a.7.1782724811483;
        Mon, 29 Jun 2026 02:20:11 -0700 (PDT)
X-Received: by 2002:a05:620a:2684:b0:90d:11b2:80f3 with SMTP id af79cd13be357-9293ccd5b89mr1496327785a.7.1782724810965;
        Mon, 29 Jun 2026 02:20:10 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1276ec6c96sm49387366b.43.2026.06.29.02.20.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:20:10 -0700 (PDT)
Message-ID: <ae2e1bdd-59b0-4ff7-bd6f-ddd57267c2d9@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:20:07 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v4 9/9] arm64: dts: qcom: glymur: Wire PCIe3a/3b to
 shared Gen5x8 PHY
To: Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260518-link_mode_0519-v4-0-269cd73cc5d1@oss.qualcomm.com>
 <20260518-link_mode_0519-v4-9-269cd73cc5d1@oss.qualcomm.com>
 <ab21f1c7-f861-4961-9287-84cae280d8c1@oss.qualcomm.com>
 <akH9LKxqhciznM2x@hu-qianyu-lv.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <akH9LKxqhciznM2x@hu-qianyu-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: T4mYfTm20Nefh6ytIea85e4Omd4oNjDH
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX99tG2/TrhDRz
 9X1DwYEFdbYE3LFPK3ye0Ir8rZPod9VqarxRF3wfHXPV4HJMA6cu0iaU4MCMIfM0AigWKV/difq
 li6rZATIqCD+cpIAdnkj2qh10NJzfF4=
X-Proofpoint-ORIG-GUID: T4mYfTm20Nefh6ytIea85e4Omd4oNjDH
X-Authority-Analysis: v=2.4 cv=PqSjqQM3 c=1 sm=1 tr=0 ts=6a4238cc cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=zBfHOgCXiaqlRJpMRBUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX6wDCS/F1CX0o
 NJ5uE0ts4UyLV/PWlxx7p+sB518rg+OdtcgjGekROkVhHfdteovVdjc1cwmx+R5EFYaFtWEjyWH
 NjxltC7eXyHtcgVX0NfZVgSYR5S4wb4J9U6VuvSzyEQ2vT4cBQEaWON1qVQQaLpyg7ermmy5pjU
 TI+Ksd7uoff8/9u1E7ropGJheD4k19d9zB7IS2WotW3Ild5Dg2ONZgN6eGz3pOfK5Wy0ShfzSpW
 nGXuB+GXQdWc5cq9obZk1W0So4klubcXnasAdwdh8R8tRX4ty4jYsgufENeAaYFOVIyRzWL4M/B
 M9OXIKlqsGiHECv/W0E4vN/ivnqCLxJ/jjEwA0oMRiCOuieoqcMrY4BtBuNHlCkoc6Fy9PimQ2R
 721CIt667puStvEGIGF0xI4WMscP0PBZJtXa5+EDM+uJ7bMBNZHYRUAVPZP3H4qDGpMgIb4o6XK
 V5Qu3QW2kj1W8yWzIWQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290074
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-114929-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:qiang.yu@oss.qualcomm.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:p.zabel@pengutronix.de,m:andersson@kernel.org,m:konradybcio@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-phy@lists.infradead.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
X-Rspamd-Queue-Id: 006AD6D81D4

On 6/29/26 7:05 AM, Qiang Yu wrote:
> On Wed, Jun 17, 2026 at 01:19:49PM +0200, Konrad Dybcio wrote:
>> On 5/19/26 7:47 AM, Qiang Yu wrote:
>>> Glymur PCIe3 uses a single shared Gen5x8 QMP PHY block. Model PCIe3a and
>>> PCIe3b as consumers of that shared PHY provider instead of separate PHY
>>> nodes.
>>>
>>> Update the DTS wiring to:
>>> - point GCC PCIe3A/3B pipe parents to the shared PHY clock outputs
>>> - add PCIe3a controller node and route PCIe3a/PCIe3b port phys to
>>>   &pcie3_phy using two-cell PHY arguments
>>> - configure the shared PHY node with link-mode and dual pipe outputs
>>>
>>> Use QMP_PCIE_GLYMUR_MODE_* dt-binding macros for mode selection.
>>>
>>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>>> ---
>>
>> [...]
>>
>>> +		pcie3a: pci@1c10000 {
>>> +			device_type = "pci";
>>> +			compatible = "qcom,glymur-pcie", "qcom,pcie-x1e80100";
>>> +			reg = <0x0 0x01c10000 0x0 0x3000>,
>>> +			      <0x0 0x70000000 0x0 0xf20>,
>>> +			      <0x0 0x70000f40 0x0 0xa8>,
>>> +			      <0x0 0x70001000 0x0 0x4000>,
>>> +			      <0x0 0x70100000 0x0 0x100000>,
>>> +			      <0x0 0x01c13000 0x0 0x1000>;
>>> +			reg-names = "parf",
>>> +				    "dbi",
>>> +				    "elbi",
>>> +				    "atu",
>>> +				    "config",
>>> +				    "mhi";
>>> +			#address-cells = <3>;
>>> +			#size-cells = <2>;
>>> +			ranges = <0x01000000 0x0 0x00000000 0x0 0x70200000 0x0 0x100000>,
>>> +				 <0x02000000 0x0 0x70000000 0x0 0x70300000 0x0 0x3d00000>,
>>> +				 <0x03000000 0x7 0x00000000 0x7 0x00000000 0x0 0x40000000>,
>>> +				 <0x43000000 0x70 0x00000000 0x70 0x00000000 0x10 0x00000000>;
>>> +
>>> +			bus-range = <0 0xff>;
>>> +
>>> +			dma-coherent;
>>> +
>>> +			linux,pci-domain = <3>;
>>> +			num-lanes = <8>;
>>
>> Is it fine to keep num-lanes 8 here even for configurations with
>> bifurcated PHY?
>>
>> I would assume so, given essentially this is a x8 host, whose 4
>> lanes may simply be effectively NC 
>>
> Actually, on existing platforms, the PCIe3a and PCIe3b controllers are
> never enabled at the same time. When PCIe3a is exposed, it is always in an
> x8 slot. But if we have a x4+x4 platform in future, we can simply override
> num-lanes to 4 in the board.dts.

My question is whether that will be necessary - if yes, sure, we
can do it, but if not, we can conclude on this early and not have
to fight over it in a couple months

Konrad

