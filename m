Return-Path: <linux-arm-msm+bounces-93411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +J2iCL8il2lAvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93411-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:48:31 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D580015FBEA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 15:48:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DD6B8301C137
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Feb 2026 14:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 41FBD2C21C4;
	Thu, 19 Feb 2026 14:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N3btbEW+";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X+zjEEkd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F220C33F8C1
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771512401; cv=none; b=fekWb+lm4zdVEg+uS6mO75fYU0wccmngZBBC2oRawpX8JeVyCh2UUwyrLSMjqVnRuq/TpMoRreBORpTmwXPjDvRMucfxQ3FYytrgdIy/0KpHCTEmUEns21Q29gYyfGrjcTfh3eZk8D08+yqsOMRimr0HTM1Cml57dcCnvUFK5AQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771512401; c=relaxed/simple;
	bh=vNW766IFB2+DzF8pp6Pv6LonUz6vSFc3tsbmLtLXQ6k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nC/YHhfTzRfY7bBPURbvC5TQlBh+J8C6sGIKQKHss8LnAzIaVLST09d6IeECa65+Hxh7SytikKelYc5ZBmkBN90Rzfevzzy0wysd+PfIbvbSgJd/Ncl1Ri6DSHK5sbwG+2gE1azNrMD4KzuecwmW1at73GR4rIEq9WoL2E/Mhzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N3btbEW+; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X+zjEEkd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JC5XwV2883973
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:46:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yvBjsS8dM/m2taoBUTBY+/d+yJGb/O9XoBnXPJK6BXI=; b=N3btbEW+NNZnFii+
	1uWI90VEzMgkCX4UAN75fDIpRegoZ94H4jHGDd2E1qLacqacrMPRYC26PrrRm9t/
	rcyiiYIYNceNi6DkYHu9rsOcwGuMzIoGsJpyD9o1PpckYyZlrxAs7YG7nPmNMXUe
	eIpG/hi/U26AssqNL2Nf4y+FOvApf1sw+cpPz78nIlDeCCoCdsH3RnsNX2e7/CqY
	m6fO83abjUrtU7wmx/Srcv48pAlN+Zo88NO+oIrQd0VxoIst7mxqRa3cTXEb+SNb
	DgWFqm2QRRn4BB6lz5xxaT08gs0+3mTjF2LZ4OBThNqKa0hwzJPfmW9nM0YEj98M
	b8Fxyw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdqfg9xbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 14:46:32 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-354c0234c1fso985022a91.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 19 Feb 2026 06:46:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771512392; x=1772117192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yvBjsS8dM/m2taoBUTBY+/d+yJGb/O9XoBnXPJK6BXI=;
        b=X+zjEEkdNvcxc/xbH5qcVJ7iQIAp+twEnN09yIJs8lXtULJfRgztbWX06VLLESTITc
         z3B3I5PCDSbyXuzhyNxqoGA45+9hPeMbYq9nHJZVTELKfHj1D2Yb0uuRc7v1yBFqEiSP
         IOMilo5Z5BNYeqLl1scHM9R9jabUXt+n1ExnBs5lKluSrYE3MXUMXZA7Zp6ka9b4P65/
         0FB3kEkMcXs6P31Vl+G9Uw0raGF293PBGJ3Lja/InvCvFmPV65hjeLKF1IB40HdpOLLo
         fkMzhb5iZ7jwY5tHWglrxwzEbVB5N58CHFSY1xSqZA1lG8NsVDBD4WIxm0xtIaSK9Hfs
         asWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771512392; x=1772117192;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yvBjsS8dM/m2taoBUTBY+/d+yJGb/O9XoBnXPJK6BXI=;
        b=H6A7gHogz5G64C0G7kd73Hz5SAnhAl0ihmYpEYX56v4qvCJjcltpy8RhYo9S9rcYxC
         elihidyesoQx5hdfmeEog/VAX9n1XtgQJzd3aICCadk0u2tBnqj3V8eqJLgtbQZbtq0E
         pLN9YOYldPxPjYciwTrHR4Nt0jIuJsw1L+NjvOu81L/aw6WOG9sVf4WNDv5Oe/G8px6L
         Rs/XSP7xG1iBWPSWUTyW4StmR/ThvVYO3cyXBwcm/+KwY36uPUnCFYsK+UZZp5Msm70I
         1t9LLThK1uDcIoIUVx6yjqQzflLcSuu8WjcUhRobJzC/+Rys80SnKi8Qyz6+fVA3w8dE
         WwtA==
X-Forwarded-Encrypted: i=1; AJvYcCVyEiPBgdTONbJMAlpEuu5YKaQOHUESoDFRTmPKOlxsy3f1tTcHLZid8rzqG9qiT/4ULjTEwaFs+KkY8boa@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7iw1b5xljCi7qYvbVEf0pzP7ag/A9vWkHy8Adu0TV79Eh5Rhm
	0s6O8ozc1PTtoWRLeS4oIzD6l3e7q32oTy4COMBGgmgcwwYHraPhqxViTbrmkDBzdGB0FvRje18
	geffuvbzEcxHQlv2/i+sM/rPVyW/usvG7NewQmWfHDLbFsNUzU33/Thi+P03CZ2haAmxY
X-Gm-Gg: AZuq6aJ/kfQEU3M3/2Z+PQ+306SoJCaS8/0VJLt/DdZ74AqSo9KwG1iMVsQUQNNzCuJ
	TMDwZpFx8Q84r0AdN41iDGMaO6z/EP2zbyHHJM/QhXhIsG1+e4/kvZIHHwSnEwD/1yQhpoO4tjF
	t3MBOsKisU1fw7w7oxMDNcn1sKtZXYtZJvI/pix23MkmogFt4W9xeUHQIj4NhcEcVHpH0TqOZBG
	ftFOenlDAWRBhxFhyYWt6xtBHsNpE58VTvQQ95+3b3pRYoqSs5N8NcmKiKOq5YNHPPji+RvooN4
	FdNUnJdwyR1Zz8pfcgsknqgq8jyQyniniq2Ty6Ki0wIt91BSFxuIiU62NTKggcziD3bi/f42CfN
	qlFk+oq1bIc50e4dXQzppjZ6ZqYeP6JHGuWjfmvDERvcuRJZx8Avayg==
X-Received: by 2002:a17:90b:530c:b0:340:25f0:a9b with SMTP id 98e67ed59e1d1-358450eca59mr17324770a91.33.1771512391838;
        Thu, 19 Feb 2026 06:46:31 -0800 (PST)
X-Received: by 2002:a17:90b:530c:b0:340:25f0:a9b with SMTP id 98e67ed59e1d1-358450eca59mr17324750a91.33.1771512391299;
        Thu, 19 Feb 2026 06:46:31 -0800 (PST)
Received: from [192.168.1.6] ([49.204.108.219])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35894b32cbesm1520691a91.0.2026.02.19.06.46.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 06:46:30 -0800 (PST)
Message-ID: <12063990-70fe-4faf-89fa-c74c7bd97f42@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 20:16:21 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/13] i2c: qcom-geni: Enable I2C on SA8255p Qualcomm
 platforms
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
        jyothi.seerapu@oss.qualcomm.com, chiluka.harish@oss.qualcomm.com
References: <20260206174112.4149893-1-praveen.talari@oss.qualcomm.com>
 <20260206174112.4149893-14-praveen.talari@oss.qualcomm.com>
 <389dc762-bd20-44e5-a3fc-256b42f3c82a@oss.qualcomm.com>
Content-Language: en-US
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
In-Reply-To: <389dc762-bd20-44e5-a3fc-256b42f3c82a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: ieBExlfLhNwVk8B5zCicBcZdHfAj6F-4
X-Proofpoint-ORIG-GUID: ieBExlfLhNwVk8B5zCicBcZdHfAj6F-4
X-Authority-Analysis: v=2.4 cv=A6hh/qWG c=1 sm=1 tr=0 ts=69972248 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=SEi2w9hYDuVaAARFuk79KQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=0Va3wKG2juJEggPPLkUA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDEzNSBTYWx0ZWRfXyfTp7lBVDQ32
 wctGRAUbDfQ9dhRpEAVQCtl3Q8ViFK3f+aR0n4A8rsgW+NiBM42OTpPtEosZuSWwONMXX4WM2O4
 iQhdO8hBEtK3GFhJ2DjAvVSbCXb5HwuIPaCW82/ysJW2EdqxZC3pab3SoawM7vpBa/0KMO274S/
 4rva79jcOb/lwOwz97TdOOVa5tsppOeaPi88gOxXU9mZ/kCIMKMj9NFQfeYk9zX/8NrlsM9w8Hf
 00jaMbqSYDWbWOeZ9InDN5vP0Z7wC1EgZUsPksCL9Kne7amIR5DtZL3nlYiSywmtNG3MN/WSti1
 K2dhxJBWqxPZVAO2uhGkZ8ia+OaovAKYP2CBIyGXJVlRP8+JlU+U5XAUe1W80OliKO0IW6E4o6T
 kXgmEiA8/bW1jZoY+S6pDbf6t1U+VIolmFRH5Oj4d0F36MsEF/IaByvLSFexJeEYLdlu87eatsO
 65GCZjXEuidcRhCjWzg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 adultscore=0 impostorscore=0 suspectscore=0
 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190135
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	TAGGED_FROM(0.00)[bounces-93411-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[praveen.talari@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D580015FBEA
X-Rspamd-Action: no action

Hi

On 2/17/2026 5:20 PM, Konrad Dybcio wrote:
> On 2/6/26 6:41 PM, Praveen Talari wrote:
>> The Qualcomm automotive SA8255p SoC relies on firmware to configure
>> platform resources, including clocks, interconnects and TLMM.
>> The driver requests resources operations over SCMI using power
>> and performance protocols.
>>
>> The SCMI power protocol enables or disables resources like clocks,
>> interconnect paths, and TLMM (GPIOs) using runtime PM framework APIs,
>> such as resume/suspend, to control power on/off.
>>
>> The SCMI performance protocol manages I2C frequency, with each
>> frequency rate represented by a performance level. The driver uses
>> geni_se_set_perf_opp() API to request the desired frequency rate..
>>
>> As part of geni_se_set_perf_opp(), the OPP for the requested frequency
>> is obtained using dev_pm_opp_find_freq_floor() and the performance
>> level is set using dev_pm_opp_set_opp().
>>
>> Acked-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
>> Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
>> ---
> 
> [...]
> 
>> @@ -215,6 +220,7 @@ static void qcom_geni_i2c_conf(struct geni_i2c_dev *gi2c)
>>   	val |= itr->t_low_cnt << LOW_COUNTER_SHFT;
>>   	val |= itr->t_cycle_cnt;
>>   	writel_relaxed(val, gi2c->se.base + SE_I2C_SCL_COUNTERS);
>> +	return 0;
> 
> ultra nit: a \n before return statements is preferred

Sure, will do it in next patch

> 
> [...]
> 
>>   static const struct geni_i2c_desc i2c_master_hub = {
>>   	.no_dma_support = true,
>>   	.tx_fifo_depth = 16,
>> +	.resources_init = geni_i2c_resources_init,
>> +	.set_rate = qcom_geni_i2c_conf,
>> +	.power_on = geni_se_resources_activate,
>> +	.power_off = geni_se_resources_deactivate,
>> +};
>> +
>> +static const struct geni_i2c_desc sa8255p_geni_i2c = {
>> +	.resources_init = geni_se_domain_attach,
>> +	.set_rate = geni_se_set_perf_opp,
> 
> I noticed that because this lacks .power_on/off, the
> pinctrl_pm_select_xxx_state() functions are never called. Are the GPIOs
> managed through the power/perf domains of the QUP devices too? (I would

Yes, GPIOs are managed by Firmware, not by Linux.

> assume not since there's a TLMM node in [0])

I don't know the exact reason for this node in DT.

Thanks,
Praveen Talari
> 
> Konrad
> 
> [0] https://lore.kernel.org/linux-arm-msm/20250422231249.871995-1-quic_djaggi@quicinc.com/


