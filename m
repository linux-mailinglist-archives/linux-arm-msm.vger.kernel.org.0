Return-Path: <linux-arm-msm+bounces-117435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id PauuIlWQTWrh2AEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117435-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 01:48:37 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4029F7207D2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Jul 2026 01:48:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=LhUp9gIJ;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dt11S98J;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117435-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117435-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 591003028CB6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 23:48:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3CEA397AEF;
	Tue,  7 Jul 2026 23:48:21 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E90D4C81
	for <linux-arm-msm@vger.kernel.org>; Tue,  7 Jul 2026 23:48:19 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783468101; cv=none; b=h6cpGOWZibb7RMU+0FkEH++p7g0CTf7GiBtyrdsC5Jmb/A4ldfDWY8HQLHCaTzhRkLy/c7ihIhBzGt+P8lsGDuiTl0OOIopce1Gm2fEqf9gGVNLSJryuM7lwKBBguW8i25dZ9iySDwZkvrvBx4Tt0Ib/YFwdA88xzRJbOKx5SRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783468101; c=relaxed/simple;
	bh=Bd+IWsqKnV9mCYORxl3Suup9InkBoPropt9ylUnGm0A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pHqR+/6rxRRClAfOjNWLuvB/23cryUu9WtyMYiBiBKEAtlWWN+DZjStJ5QzhiqBolULJzZDYzZ8xmRdMRgaXk4kaVijgQ0XHpBs+ziIgETvjvEwWJeBW8b7O3LrIUAKLEfMb/UxM61K85+y4bNnT4mn0GNNL0fRO4qLNutzqPp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LhUp9gIJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dt11S98J; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667McufY928023
	for <linux-arm-msm@vger.kernel.org>; Tue, 7 Jul 2026 23:48:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MYUp8bAN3mPOGoNhZ5DE0CtcsoP0jv0JJqKTEO6Uw18=; b=LhUp9gIJtrVmm787
	eSfxk+GWeUoG35Nf2zt/K1ZQH6wQpByNCriuOysIujPU859zpaeONYeRTCbjGwX4
	CCB5G+Nv6dfhhsBshiA6yFOC61nOiUk/PZet7FUwm0OQxilpWmclV2xTFsezatST
	81Mv6V32f0jusHOtD5pG7OSBKbwbU1dvLpjO8vE3fIJ+qEMq6N+cV8kPhxB1pvlY
	2Gkk0d6eYxrjXapOQrhywuZKwtfBjIJ0t/9Sc0sheX4eK0cZGckb1bWNrqrGegNT
	+h2aXN1FSyA4NHY03i4w+icioV0a+kLjULbC3VvPcIZZgYokRM05i0ffDuRDiwov
	fFxppw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f95fd1ph3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 23:48:18 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3855a987c0aso134342a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Jul 2026 16:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783468097; x=1784072897; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MYUp8bAN3mPOGoNhZ5DE0CtcsoP0jv0JJqKTEO6Uw18=;
        b=dt11S98JUNdz3K93s0gGhjbRMLZM1z4flM1doModrttw33foqexFc9ZeI0OGqwPAeO
         qKoC0TD9LKFVCfowxbfROa+0wzuEVxBPeaAUjb0iZKInqo+19tEj4ZH5Ho36Fp28TL3l
         dQ5y+Q5qCJbaJg60zCj4TfhbHypL3o4yYp+v0NEZ/zbw9zaR3rWWI1z+70fxBTa+qZri
         GxbDOD+THrzAqekUbzH1cOmpVDhlRP5NHHWB7bGjXFzeHQPZItghu/lgB8C7SY4f7sp6
         yD1I/aom80dEgiTLc994kj0weMAT8ExSv1zLBtkbonzifQtgkcF7LGwuMhZAW2obrs0D
         hyyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783468097; x=1784072897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MYUp8bAN3mPOGoNhZ5DE0CtcsoP0jv0JJqKTEO6Uw18=;
        b=PlZcVNHiQVas4OIAztePY9oa/ajGhNfo/K3l+waLqsnnR4yX67lEtdGqmDcbi0jzLr
         mx40/eE5BL6GhpXF1oRCgFrOYJQpGJZgywgW+mMPruebfc/AqH2WGx66tYxM2xKLT/Sz
         GdJWjeqmLXowjn+96fVy7iLyE3K2g4786ExQtuMj1ws6FYbvXrOB19mho67PGQfWf1Z+
         31BTVLlCB+b91P7kRX5vz6UDoqgAInWgt2sMURbqnQ74z956hIq2UVfwHEYkrtv/3CeA
         emm7ohDm+Wi3TenmVV4n5dttqRtn1JYOrhlSWMkcoi62hla9QrGaRbxFBPcmKst4ekYN
         1ROw==
X-Forwarded-Encrypted: i=1; AHgh+RpfZRIGlu+ke7dhIWi1fHZbMlYOZIJFSnem+exyXH6T/rwcPzbQUzzAKGc3XcaVhOjPTuofkEPu5Upzxlwn@vger.kernel.org
X-Gm-Message-State: AOJu0YwaBZ5O3cx757326k/oIOa1gwJOhCdL3bN9cAy2zNnnELdFxdgU
	x/52kNw0qz7T34e1nvYxjYkwryVAvyei+clqk5yLnenA+J9HgBoWrgH3/Otcf4W8lzrc6bQkoc7
	dYwABPXw/fSJ3z9pdyCUKkFaJodwPQa1FzYMyeoY5DZODQFEZLLARcIyxWegbDYiFHfjk
X-Gm-Gg: AfdE7clmkwHCocbCmpLSrSXuccNoLIOjG5CA3xOojLPx8XaFQOwbTJyXw01AgdihMvq
	SJtWpesZkJLpE5kpAvm1OFXEO3ZL2elCcpu5mm3aCoubuC3Ci0biFFHcjLOZOH7fxU8skBokS+C
	UelwagMVcDixy2xEmptWajP/i3FBJQLE9ARjxgm80UtJZKY4oHbBbZ3egPW5ZIMpXIbLMdNfTFo
	QX3VZ/2g2uS0ATIGukNyCaak8c396bhGCdjT/1S2YeMBcKjYf9PsNrT1iEDYHzthdk6oMBIQsCo
	raHaoGsqAkPd4LVnAAvPGgsa6zvOYE34uzJqf5NxF0o0p0rIxZ9QYeyci7+0Mg+/dVb5vSXbhsv
	4JLv3RSMqKg5fIqQtR0TCQkDos8U/MFXDDp4AC5U4bkBRBwe/bE8g6vRXsTk2RCFNY1mdP43meW
	d1Mnc=
X-Received: by 2002:a17:90a:e705:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-389426976f8mr41995a91.38.1783468097260;
        Tue, 07 Jul 2026 16:48:17 -0700 (PDT)
X-Received: by 2002:a17:90a:e705:b0:387:e0bb:57ff with SMTP id 98e67ed59e1d1-389426976f8mr41961a91.38.1783468096706;
        Tue, 07 Jul 2026 16:48:16 -0700 (PDT)
Received: from ?IPV6:2603:8001:7f00:fc12:b897:54f3:b10a:6577? ([2603:8001:7f00:fc12:b897:54f3:b10a:6577])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-311747f5975sm12059705eec.4.2026.07.07.16.48.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 16:48:16 -0700 (PDT)
Message-ID: <f33f8d98-1da2-4b5f-84f0-3b7174af8728@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 16:48:14 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/9] usb: misc: qcom_eud: add per-path role switch
 support
To: Peter Chen <peter.chen@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260501170635.2641748-1-elson.serrao@oss.qualcomm.com>
 <20260501170635.2641748-5-elson.serrao@oss.qualcomm.com>
 <akshsA2VuKEoq796@hu-petche-lv.qualcomm.com>
Content-Language: en-US
From: Elson Serrao <elson.serrao@oss.qualcomm.com>
In-Reply-To: <akshsA2VuKEoq796@hu-petche-lv.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIzMyBTYWx0ZWRfX87LpbzwB9mgh
 3mFRQjoT1Xfp7j8eUD1CYuqHpuGJBLcKw80lkNu6bg2LIa6Albae+jwZuBtirA4NJU6WOlus9Ud
 K8wCEAR2+oPiltSYa01Uxg2O6OVeilJD1+X8CfDStMFzeuFC+8cyq/MnPN4aB7G3ICUK2Uxcsv/
 2MOQvxx16Fc+p8UehedxhoJoC3tSDmKvFGQuGkQQC0Wgj3Cg9ZsCp2CwY4UlFtVkPIZGlmgxP5l
 MBGsYmAdSeKGyON527mRIRfc5JJhKMVEWRtZRym++vHpDUAn8expbg04tYwNUzT0ICKRuE+FCy+
 nIazJAuX18wp/Wq4u4Y4kz5TAFBxvaIN2g4ZcDBB9GjtYsP8w3w5GJEHNQbdEo8+0mvIDaVUBVt
 Ikv3Udc4Rkt+/nZnqxRT/4O0QqF12SNNLoLStNM36vzk+6lYjCfHfjAlkzHSy/4YC5YCStbxpoy
 6LitKYIG46A5n0efDRg==
X-Authority-Analysis: v=2.4 cv=VZLH+lp9 c=1 sm=1 tr=0 ts=6a4d9042 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=H_2qtCgBOHeE-je_SbAA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: y-LhkhPglUxA99NN1GipeFta4HyU75bW
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIzMyBTYWx0ZWRfX1wEM1m1WPsws
 JfqnVDsAGuEu2YfxKn7gr8ePz6ql3HFFwaWUZG7RON7K7K/kuRvjcoFLVXyWQ3bgit5lgIum9Al
 IOOhu4q2OjSx4ynGbcYEK6Go/8yauAQ=
X-Proofpoint-GUID: y-LhkhPglUxA99NN1GipeFta4HyU75bW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_06,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607070233
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
	TAGGED_FROM(0.00)[bounces-117435-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	FORGED_SENDER(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_RECIPIENTS(0.00)[m:peter.chen@kernel.org,m:andersson@kernel.org,m:dmitry.baryshkov@oss.qualcomm.com,m:gregkh@linuxfoundation.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:robh@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-usb@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[elson.serrao@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4029F7207D2



On 7/5/2026 8:32 PM, Peter Chen wrote:
> On 26-05-01 10:06:30, Elson Serrao wrote:
>> The EUD hardware can support multiple High-Speed USB paths, each connected
>> to different USB controllers. The current implementation uses a single

[...]

>> +static void eud_path_role_switch_release(void *data)
>> +{
>> +	struct eud_path *path = data;
>> +
>> +	usb_role_switch_unregister(path->eud_sw);
>> +	usb_role_switch_put(path->controller_sw);
>>  }
>>  
>>  static int eud_init_path(struct eud_chip *chip, struct device_node *np)
>>  {
>> +	struct usb_role_switch_desc role_sw_desc;
> 
> Should role_sw_desc be zero-initialized here? Otherwise, some entries
> of path->eud_sw are uncertain after calling usb_role_switch_register?
> 

Thank you for your review, Peter.

I'll zero-initialize role_sw_desc in the next revision to avoid any
uninitialized fields.

Elson

>> +	struct usb_role_switch *sw;
>>  	struct device_node *controller_node;
>>  	struct eud_path *path;
>>  	u32 path_num;
>> @@ -331,11 +358,44 @@ static int eud_init_path(struct eud_chip *chip, struct device_node *np)
>>  				     "failed to get controller node for path %u\n", path_num);
>>  
>>  	path->phy = devm_of_phy_get_by_index(chip->dev, controller_node, 0);
>> -	of_node_put(controller_node);
>> -
>> -	if (IS_ERR(path->phy))
>> +	if (IS_ERR(path->phy)) {
>> +		of_node_put(controller_node);
>>  		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
>>  				     "failed to get PHY for path %d\n", path_num);
>> +	}
>> +
>> +	path->curr_role = USB_ROLE_NONE;
>> +
>> +	/* Fetch controller role switch if it is role switch capable */
>> +	if (of_property_read_bool(controller_node, "usb-role-switch")) {
>> +		sw = usb_role_switch_find_by_fwnode(of_fwnode_handle(controller_node));
>> +		if (!sw) {
>> +			of_node_put(controller_node);
>> +			return dev_err_probe(chip->dev, -EPROBE_DEFER,
>> +					     "Failed to get controller role switch for path %d\n",
>> +					     path_num);
>> +		}
>> +		path->controller_sw = sw;
>> +	}
>> +
>> +	of_node_put(controller_node);
>> +
>> +	role_sw_desc.fwnode = of_fwnode_handle(np);
>> +	role_sw_desc.set = eud_role_switch_set;
>> +	role_sw_desc.driver_data = path;
>> +	snprintf(path->name, sizeof(path->name), "eud-path%u", path_num);
>> +	role_sw_desc.name = path->name;
>> +
>> +	path->eud_sw = usb_role_switch_register(chip->dev, &role_sw_desc);
>> +	if (IS_ERR(path->eud_sw)) {
>> +		usb_role_switch_put(path->controller_sw);
>> +		return dev_err_probe(chip->dev, PTR_ERR(path->eud_sw),
>> +				     "Failed to register EUD role switch for path %d\n", path_num);
>> +	}
>> +
>> +	ret = devm_add_action_or_reset(chip->dev, eud_path_role_switch_release, path);
>> +	if (ret)
>> +		return ret;
>>  
>>  	chip->paths[path_num] = path;
>>  
>> @@ -365,15 +425,6 @@ static int eud_probe(struct platform_device *pdev)
>>  	if (!chip->paths[0])
>>  		return dev_err_probe(chip->dev, -ENODEV, "primary path not found\n");
>>  
>> -	chip->role_sw = usb_role_switch_get(&pdev->dev);
>> -	if (IS_ERR(chip->role_sw))
>> -		return dev_err_probe(chip->dev, PTR_ERR(chip->role_sw),
>> -					"failed to get role switch\n");
>> -
>> -	ret = devm_add_action_or_reset(chip->dev, eud_role_switch_release, chip);
>> -	if (ret)
>> -		return ret;
>> -
>>  	chip->base = devm_platform_ioremap_resource(pdev, 0);
>>  	if (IS_ERR(chip->base))
>>  		return PTR_ERR(chip->base);
>> -- 
>> 2.34.1
>>
>>
> 

