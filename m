Return-Path: <linux-arm-msm+bounces-109764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sDzrLLprFWoBVAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109764-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:45:30 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1A05D39C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 11:45:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0FBF63044108
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 09:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0F8223D88E6;
	Tue, 26 May 2026 09:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lLVqS289";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cbQM7Z9Y"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3AAC3D79FF
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 09:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779788347; cv=none; b=pEcL4OoYLyI4eGasNQeBHIBg6J5ccsyGDnih2aQMUIXU/qaUAq9J6vMoq1ABnDrazY6qAfPF7ga3SW5NNPFKot/x2zLTF9Vxat7G+a1Y0jpLjqycTLJny8of8TnU0kbW/bbSMLDRq9+CdoUpM9/Dmg31EJJbtCCeLQqsSp5Jonc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779788347; c=relaxed/simple;
	bh=xGbbke4qs67cQaM7X06MHN9UsL3fDt1K8ypn24U7MH8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nzIIlnJOSgSz04oqIA9ndsTX1mV+8weXtV6wCaP21mfi9w4ANJQn4hzybuhKniVaSUek7hN1TzHxR/AqzT/UsTBH4oNPFHo/e7x7WCw3g38oafUBlG/uQISVhmbE0cVNgTaxczyCh/Yo2ClaqFTw1Sxvq5YbkhCVaU245CzCY+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lLVqS289; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cbQM7Z9Y; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q60j2M1763741
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 09:39:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xUEHZrut4x8hOGmiwUwt+Zp4CsxN2AZtJNhdB6w6WY0=; b=lLVqS289yE9mP6Cq
	27Xl0rqQcHh8cOK01DCylyNL5RzIzjEqcPYKfbgngji/85uQLpq0zgpdiqIjBP/8
	wXElgFfXa1D5wevf7Flg394sypcE0UtT+ABY9g7Bqg9d2ppOaK05B/msiY4NzZQt
	vgfVu2PjtLtP847KckxY/F0hkMskf0pJrvclB/NCN/dQBaBT0xYSY90dQlIcDpNj
	1huCbK7rnmPUk/jGDaTivvcAKGVpOGl++L68H+ygeQZbs8iTAPh3MzS0fP5zCaGD
	293QORNFphaz1CfCzAzaFHTlEltL4mwiwbOhVUFSJzOYlDhowVLGUFdwj65V2TUy
	byXJfQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5vggvhf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 09:39:05 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-367cb6de61aso3573497a91.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 02:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779788344; x=1780393144; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xUEHZrut4x8hOGmiwUwt+Zp4CsxN2AZtJNhdB6w6WY0=;
        b=cbQM7Z9Y/JMSKTD2qE/9/eXVetKjsnmFsAcgJhdxRG3JL5ZhlB38wEXWvi9B2pOl8I
         uxgU93cymOpig4BGE5f/tUypV28jhGGn5LGZpNO/HgK9XS91fpcFr/5LSj21U0za3HZW
         WNGAmo2Pd7kCsSfv4UearNbAQvmfqgY7daE41qaTO71VDTSK2W3B5NZ7XyZriq2oYDOZ
         5AuFLaU/cq6p2VcPrOv4Jcls8F2QuGqtRIN/5SvNTx1Zp0zOPLksaD1NPcqw0ai10C9k
         Me+POorHtnd6ceMEfT8nJGmopWnayh4IULmAPanstb7I3614tG1NmyWwX87iQnGB+cQG
         kc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779788344; x=1780393144;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xUEHZrut4x8hOGmiwUwt+Zp4CsxN2AZtJNhdB6w6WY0=;
        b=XJfe491VfyMkxAMXs/rGmecgHuFQ+3X8qIPIow6Bm7i2bCyylW0WP1s8XhprPCpHxc
         9RkVpOsPVVomK0CnKWKT2pm8VwG/QkEDL86UufW+IfU2gJh0qrASSidZZtA3v9tulU8g
         mBnUI4JYeym3GX/KlhGOlrtKPeL8GtypeCV0m/Y+M8uBZMi/iNwJYK6gIH50Wu3i2S3O
         q5lxmyjutUj+IqqLNpfskhptt/lgNxQKOaDhKbgKR+HffKvLjc+80MeAzkB6B5L0h04n
         IMTk3p6DsyY9FDFDrUv2BGP+E6zPAVJGYpnzHsl4T5oTxWNcgFnRdjOu5eFN7b0E+slT
         oyuQ==
X-Forwarded-Encrypted: i=1; AFNElJ+fEOtBrZYn1Oz3J5ghprRNy6evUkRD23SZV1otYTjmw/9EM6S6n621UGFURzCVTIujp756RbUZ7E2/z7LK@vger.kernel.org
X-Gm-Message-State: AOJu0YxcwfDDvVHHuwkTDzV/WM8I3ptCdzuv6BcG752S5vQ16JuPn33O
	dgclpz15fpi3dI2fjlU88ovfNl6azlvLo2H2FaDZnQ5+akEI5o4jO72rUpcX+29eoAWXtTBfEM5
	MRU/S6547zX5U4sKsZfQ9FVxJdDvTQUj+VbNXdc2P2ExHunZrpGGcW94OdgEAa979JuIS
X-Gm-Gg: Acq92OE2Xrc7QjK/maJkuFbalRTZu9qQYSfJrQwwZr19ai7a5BeY72MA9QHkFZD1zvs
	7Ca21z1Phcu3Qjs8hqJXQQBrH7VoUnFI0y8sNQbfNril8glRkIsnPTvGEFx7MnTNFL9mzTQK8yu
	QqZVbPD/CP9uvm+jgVneyMDSJPsGNy7kB9t+IcaN2hPK9Ix4sKaOpDH6rMObqmLG6zVC7EXIRQn
	Ge5+Wjl/PteZp8yf6Nh0ulJhN2FS9NOh+Mva2dE9qJ6n4ZVIUV7U7g+6KBT5AqcIBtkkm8Gbvzd
	CtBeNqzyrej50Hcd6PPh0wlryLgq/d9Av8LwL/1m6TewCcZlPzK7W2ceePbGeS6TjFdJEs29Zxf
	RAdtln7UJUaLfL+0YNusgnJVsB4egGIArRb0x2qLyrshzxp3K4sKLQkx35cA=
X-Received: by 2002:a17:90b:2b88:b0:367:db13:aca6 with SMTP id 98e67ed59e1d1-36a6785aedcmr18232537a91.26.1779788344393;
        Tue, 26 May 2026 02:39:04 -0700 (PDT)
X-Received: by 2002:a17:90b:2b88:b0:367:db13:aca6 with SMTP id 98e67ed59e1d1-36a6785aedcmr18232491a91.26.1779788343870;
        Tue, 26 May 2026 02:39:03 -0700 (PDT)
Received: from [10.151.36.45] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36af07555edsm1381606a91.5.2026.05.26.02.39.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 02:39:03 -0700 (PDT)
Message-ID: <e438be10-e8b7-4c2f-a0a6-49a61da491e0@oss.qualcomm.com>
Date: Tue, 26 May 2026 15:08:58 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] regulator: mp8899: Add MPS MP8899 PMIC regulator
 driver
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Saravanan Sekar <sravanhome@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Manikanta Mylavarapu <manikanta.mylavarapu@oss.qualcomm.com>
References: <20260519-mp8899-regulator-driver-v1-0-30d14421b7f1@oss.qualcomm.com>
 <20260519-mp8899-regulator-driver-v1-2-30d14421b7f1@oss.qualcomm.com>
 <20260520-luminous-tacky-swallow-a455d3@quoll>
 <0993456c-40ed-4fc2-b9a8-036cca928709@oss.qualcomm.com>
 <a7518314-727e-4932-aa60-844a5ec79ab8@kernel.org>
Content-Language: en-US
From: Vignesh Viswanathan <vignesh.viswanathan@oss.qualcomm.com>
In-Reply-To: <a7518314-727e-4932-aa60-844a5ec79ab8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IrYutr/g c=1 sm=1 tr=0 ts=6a156a39 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=UBsTDkLht3fk7gMvnXgA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: NmwyIHs7TEpzjQz13j8WQka1hxJlMJRC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA4NCBTYWx0ZWRfXyWWiMpWZuYb6
 ECUC2mcitNRYHqp0CEb8i7V9haUwlC5i0qvqpDnl4ZQvPATqOcVaNz/iLHwfXUPUwJfSQze9wz5
 yn4nCYN4ljIP0JbvSPxR/T/xrTRsTnKyt8EvQ8rLAm4GmbmJL1gBSxoAziyzTTYj1DASbmYzWvp
 odLNguYLCNADJzSkMahzXewA0Y9Ctm+tWfWCXELhe0qgz3Xqo7yiPqHRGGahIwElOwHaNowuDmZ
 L8ZE++pebSQY6e55i42cMu+91N3B4SP756Ywotn1yN1WwN6ajc3yywKAHRdhGSKG/s6ai0g2BI4
 6tlHfLJ2CP80FuRrUmlJyDun9sVWi2SxA6yVeMX8tz6V/2tUswihAPAm23Cvg5oDA+TOgThRA5c
 KQucA1pO6wQSxDdUxc/iG7kLB+bKRroFPakxsq/lEhzR9FdpJEga/aATFy3thRMNDlpbi0xoZ6o
 /aneBY+YfsUK9CYrKVQ==
X-Proofpoint-GUID: NmwyIHs7TEpzjQz13j8WQka1hxJlMJRC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260084
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109764-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vignesh.viswanathan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[11];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4D1A05D39C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 5/26/2026 2:58 PM, Krzysztof Kozlowski wrote:
> On 26/05/2026 09:39, Vignesh Viswanathan wrote:
>>>> + */
>>>> +static int mp8899_i2c_probe(struct i2c_client *client)
>>>> +{
>>>> +	struct mp8899_regulator_info *info;
>>>> +	struct regulator_config config = {};
>>>> +	struct device *dev = &client->dev;
>>>> +	struct regulator_dev *rdev;
>>>> +	struct regmap *regmap;
>>>> +	unsigned int vout_select;
>>>> +	int i, ret;
>>>> +
>>>> +	info = devm_kzalloc(dev, sizeof(struct mp8899_regulator_info), GFP_KERNEL);
>>>
>>> This is some very old code. If you were working on upstream, you would
>>> notice that syntax is sizeof(*). But NOW the syntax is even simpler: kzalloc_obj().
>>
>> Ack, will fix this.
> 
> I might be wrong about second part - it seems there is no
> devm_kzalloc_obj, so devm_kzalloc is correct. But anyway please use
> sizeof(*) style.

Sure Krzysztof, Will do.

Thanks,
Vignesh
> 
> Best regards,
> Krzysztof


