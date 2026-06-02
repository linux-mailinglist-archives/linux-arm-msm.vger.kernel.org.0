Return-Path: <linux-arm-msm+bounces-110699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id M0peK19dHmpHiwkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110699-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 06:34:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EFC8628182
	for <lists+linux-arm-msm@lfdr.de>; Tue, 02 Jun 2026 06:34:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 78433300D74E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 04:34:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BA6225B093;
	Tue,  2 Jun 2026 04:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FV6dGG8I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aRspB8lT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 096991A681B
	for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2026 04:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780374871; cv=none; b=n0JNNZyWCFsFMNpDU1cwhYeIXDJPvGpYWBVRB4Q7GEPD/ob5VkK9mRjSA0r8yg6moBaipCqP9x9BTvpt4HCrKXYfDLxH6Wwl96IVuH47H546h6CsLJtvhAFUV04xZsEdlD9ZUgoJGNFmOx64jRU/31LNk6RP/azyMhhFF5HCpu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780374871; c=relaxed/simple;
	bh=ty+HAAsHAxkUJXff9F+TEX/K6iMhWXyTR1OBcpL/1fE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N1D4XnJmqTBwekuOK+my6X88WqEhYjiwa0Yz6sKsRmZPfSDUJb9lxb100Cfcr09FsHIIK7neKvQlTdP9jB4tNDtYuEg416nd9++qUBBroNuuqY2OSp5JbFY32uCA8/+1LuOatzFFI4Gu8fay+lKJNiEUut5ew7Cq76TLt1f9I5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FV6dGG8I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=aRspB8lT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65218wVv3430710
	for <linux-arm-msm@vger.kernel.org>; Tue, 2 Jun 2026 04:34:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ehXOCZHzAdL2E3/HvP4lXm7p39a6i3gpcELOmcTa4Lg=; b=FV6dGG8IuMFpF+pS
	MumxC+FMJW4eQmnrKCs7cfPWR2FwYBp7kggCWgcpjN7UBoj/MLhh8lOhXLSO0N6d
	I2FU02qo5iFX0hbGjnl+YmRVX5vFjhNAcqhR2fIsCoiSick4eSoy90zdTFaKlf++
	ZA5XcPfaqcmZXklbpoXpXBe4ZKoa3zaUMvlcwG+Di+dAO/ddgwpeVhfJI825Vk/+
	o2q25duMRUNhOlT7/BmxpOHYCoa1QW0lKSEc1DCg0qpScEK7OhbCrfhbAKSr6Bpn
	7X6EnO9GcQWeSzlraltJNCAPRP0QEL87RGiiK9P5RpZEfDh5DrXhDX46tyYhOYPd
	iFhS+A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehn8mgmd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2026 04:34:29 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-36d99181eaaso2934673a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Jun 2026 21:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780374869; x=1780979669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ehXOCZHzAdL2E3/HvP4lXm7p39a6i3gpcELOmcTa4Lg=;
        b=aRspB8lTqRjj+xQJMBkLdc0usKolUlmxrQ6QpkShpmElPuRFQKHFd9PRWtuFn5uByu
         X6wWNfwrfVtRclIWk2MldAe9oPtqSSC5JO0CKmLjFPXoAFZByvbadQNpKDIr+DmZaP8+
         H8B3CJXJBHI/kzlp/L95HqhX02UWddg9TP5SdDuqftwTF20Bu3Mot56/G9XexAhRhtM0
         809On6yg1F5PRVhMlaeLN46ozjntuHhmC/QhXCLmDDMUcLk82Dqc14DAgLHIGoOCEdAi
         tuNv81YJQfUV0Y2+MwcZuHPA+z3l+9n6uaPAAELnq7HmKdkTCwXyhbFoonUknjKriybh
         9+PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780374869; x=1780979669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehXOCZHzAdL2E3/HvP4lXm7p39a6i3gpcELOmcTa4Lg=;
        b=jH+iBFdJl1leAKf6HM3yb+CSTANnQnC4RA0xju1wLOFrgDb+yS7Li6dpnmTmJsk0GR
         pcRTQDCmVirZHcLCwo7tdhGDiHDcsOArNqvXcf6WbSXm8OdnY65bzfiSqz/gkFm6VUeh
         gbfOovcdmr3OxxgVAKr1LEUrO8G3zjRFtPpSIniGVUVNpjuIPL+2RJ4wd3CKOvfRFWu6
         tEWYcGL7qlFouvbzF4IWf1XDlJykk744RmHi1KrvptxcyaBkOuUZ13/iX0my9D77Zes6
         4quddMyxFYCwBhUxdroWDNxmNky1tfhNizLbrt82y4a8iOIjb4jDzALTZ5f4ARkNkbUN
         dzMQ==
X-Forwarded-Encrypted: i=1; AFNElJ++jknJrc3UrowVOIF6RdZxKEH8g4xM/TsHr+Y9RrVFnPBfKvD1Lml5fCAOZy4FggPXSLjOiVoS7gyhhy78@vger.kernel.org
X-Gm-Message-State: AOJu0YzmCHHG1AbajyWpirZMLvXfzk9LjzLTdltaYqMXRhXqQTtwayxg
	NLJRuC6vkPD5ppcJF7hY7hI6Iyi859HyOyRpzBx8uSUHZ8PQnZgAtkK6a/aLbbwsLqXqcpGYp/w
	b5mu6r4moZCQFIfxG6UJk4bnwT/BOKUlnd7RJkq3GEkzEt3ua+eHsMVeaouIeP1GWGR3S
X-Gm-Gg: Acq92OGNnaKA4Wnx6HHhAkALmiGG2W+82U/vJ0IzUZJV24Kq0VsFDK1nAWh8Xt2TFzq
	f35wCYnsC7po15QN/KGUh1ExJKxLIU3yqDOMws90iM1einh0ukbm7jmDSMcmHq3G2SHcL/5h5i/
	BeTmY2IdG1CzstG+LOrbMbJq7vjAsspk3e6LdLN82kqOEQZQPZZLzzdVVt+xhcKOr5US8drT9+Y
	5leLvwzCY9+vGvmhoNuneRy01wgPS9TH9Utf7JnBY7RJhnqv/eFBnIW5k0Yj2GdBMsz5acCnZxu
	2iFeqOlSNq1Wfzb1YhRcWiOsaCCa6TgJ2iJGZuDYYKihCy71PmkaJ6Pmo1s+c4eqyZyqZlQWQoS
	xEsZTVOBoH6zEO8ODtfpl62A4ns0L9WXE9pIm0FmkewNpJbmXcSwiMAlzqvZU4X4/XeuSM9GSVZ
	xv
X-Received: by 2002:a05:6a21:a34c:b0:3b2:b1ed:d1df with SMTP id adf61e73a8af0-3b427f2cff8mr16397480637.29.1780374868612;
        Mon, 01 Jun 2026 21:34:28 -0700 (PDT)
X-Received: by 2002:a05:6a21:a34c:b0:3b2:b1ed:d1df with SMTP id adf61e73a8af0-3b427f2cff8mr16397437637.29.1780374868135;
        Mon, 01 Jun 2026 21:34:28 -0700 (PDT)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842222e2394sm9874515b3a.2.2026.06.01.21.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 21:34:27 -0700 (PDT)
Message-ID: <0bd70e70-68fe-436b-8366-8a497861e21d@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 10:04:22 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] PCI: qcom: Handle mixed PERST#/PHY DT configuration
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Qiang Yu <qiang.yu@oss.qualcomm.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        linux-arm-msm@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
References: <20260508-mix_perst_phy_dts-v1-1-9eff6ee9b51a@oss.qualcomm.com>
 <gieaybsg2ckxpctvqj77nlwu7utama2yeyvebkonmexsxrra3v@v3fobqasxnmy>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <gieaybsg2ckxpctvqj77nlwu7utama2yeyvebkonmexsxrra3v@v3fobqasxnmy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDAzOCBTYWx0ZWRfXyjWD4A2WQx/8
 Qx84TIJI3X/+t1JlB5fPeeMDiV8EWBHz2ImmY79s5adYkBlijE0Zt9ofbm/7nuOuNo0MM2uw1FJ
 UdqNExA4Blq+Nc7eqlVgus81QpCN2uAVk04zUrhCNk7TEXIWwkiRt3qb3a/YBDBnN4+oaGHb6LF
 nSQAgl2cMP7JAQ8Tlak2EXKxYD53fM2DjMkLrIZDmAQgH0vl+rN6Lor5J/07YeMuE8vCOlT7JsZ
 tDBcRUo53HiwqY/596JlZkY4u/eyEawQmT4UYwLYdZ4ofZdC4cafA5joHQeVBJzM4Vetf6YpuAp
 1CacmBdEH2p4Z1BzWOfI1z0KjWkV/hxagi2zywPRt3NnLD+LzsGVvn7XLGM/bOgmFKK9BDlzaI8
 zCfUYZsiSCuhEc10HTGQ1GLZM5bMjx/YZRNkC4wnGyYT+DlUYMRiPePlaYPjjRKStFs6XS0RZ5k
 9cfpGRPB7+TyL+gNeKg==
X-Authority-Analysis: v=2.4 cv=d5nFDxjE c=1 sm=1 tr=0 ts=6a1e5d55 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=YW_819I0oaYKz_JYO2kA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: bh_ptwTarZvzxDR3iiCQtQOzaPI5tjwz
X-Proofpoint-GUID: bh_ptwTarZvzxDR3iiCQtQOzaPI5tjwz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-01_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020038
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110699-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FROM_NEQ_ENVFROM(0.00)[kathiravan.thirumoorthy@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8EFC8628182
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


On 5/31/2026 4:37 PM, Dmitry Baryshkov wrote:
> On Fri, May 08, 2026 at 02:54:19AM -0700, Qiang Yu wrote:
>> The driver currently supports two PERST# and PHY DT configuration. In one
>> case, PHY, PERST#, are described in the RC node. In the other case, they
>> are described in the RP node.
>>
>> A mixed setup is not supported. One common example is PHY on the RP node
>> while PERST# remains on the RC node. In that case the driver goes through
>> the RP parse path, does not find PERST# on RP, and does not report an
>> error because PERST# is optional. Probe can then succeed silently while
>> PERST# is left uncontrolled, and PCIe endpoints fails to work later. This
>> silent probe success makes debugging difficult.
>>
>> Handle this mixed case in the RP parse path by checking whether PERST# is
>> present on RC and, if so, using the RC PERST# GPIO for RP ports while
>> keeping RP parsing for PHY. Emit a warning to indicate mixed DT content so
>> it can be fixed.
>>
>> This keeps mixed systems functional and makes the configuration issue
>> visible instead of failing later at endpoint bring-up.
>>
>> Suggested-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
>> Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
>> ---
>>   drivers/pci/controller/dwc/pcie-qcom.c | 15 +++++++++++++++
>>   1 file changed, 15 insertions(+)
>>
>> @@ -1778,6 +1785,14 @@ static int qcom_pcie_parse_ports(struct qcom_pcie *pcie)
>>   	struct device *dev = pcie->pci->dev;
>>   	int ret = -ENODEV;
>>   
>> +	if (of_find_property(dev->of_node, "perst-gpios", NULL)) {
>> +		pcie->reset = devm_gpiod_get_optional(dev, "perst", GPIOD_OUT_HIGH);
>> +		if (IS_ERR(pcie->reset))
>> +			return PTR_ERR(pcie->reset);
>> +
>> +		dev_warn(dev, "Reusing PERST# from Root Complex node. DT needs to be fixed!\n");
> This patch breaks legacy DTs (I stumbled on it on SM8350 HDK), because
> now devm_gpiod_get_optional() in qcom_pcie_parse_legacy_binding()
> returns -EBUSY (as the GPIO is already requested here). I'll send a
> patch fixing the issue, but it's sad to see existing platforms being
> broken for the sake of undeclared "mixed" case.

Dmitry,

I have sent[1] fix for this issue and it is squashed with the offending 
commit itself[2] and part of controller/dwc-qcom in the PCI tree.

[1] 
https://lore.kernel.org/linux-arm-msm/20260526-fix_perst_gpio_handling-v1-1-9170507bb4e9@oss.qualcomm.com/T/#u

[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=controller/dwc-qcom&id=1a23bcb452d95f099e530414504c0d99ee076b3f


