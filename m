Return-Path: <linux-arm-msm+bounces-113473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lUadDQuyMWoFpQUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113473-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:28:59 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D2669536A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 22:28:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CCkVj51h;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=QNiXLPAZ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113473-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113473-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5A1C83096904
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jun 2026 20:28:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E321938F658;
	Tue, 16 Jun 2026 20:28:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA81738C427
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:28:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781641736; cv=none; b=K7XG8q0SDtEcXNWq8Ufv9DUp5SkzpZTV61hcB/rRaOM+GdSiM5HIuy7NrP/uhkYLtGZpAhgB2LnFa6FF4qu9tWLgm5N4dvGLWUUdJIis+jz/N0BYfOLDs05c8is38G7dYEkTF1goxvmJ+1gxEbiAW52cai1ZOIoYVHGiaBKVGu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781641736; c=relaxed/simple;
	bh=9WJ50u4QzMs2SwyAxYq9+frDRhcZg12tcQlATK9iiAo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=njFLKP38dK3Ux/y9SPMesv+J4PQvjWNR9COVfJTI/1FvbnJ44sei2jRIbJ7IQJ+SbgDNFDAmOWzZYgc90g613uLP/LFUrOT9lWtdSaym38sjTpakhQukFcVny01ENLJkMpePNpY5kx/AajAzgtlIBJRJsfHcH9btMvIW3TxTboA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CCkVj51h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QNiXLPAZ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65GIOrRS1378054
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mIGnsKTjN4ABQBgkJt+01XV05mC3MHNIgAGAmhxucYY=; b=CCkVj51hq8h0BES0
	qHbUb2VtyK5Z5Izkplu83U9nF9Bc0DeIeqQqhQ/b/b6VyFo4jVnWdcCByS/9KcAZ
	LZjjPFhBSi625BMWWJ2enSm3EsB98dSmMTls5G7rFjnRneWwBVr455fd34ZA5ruB
	68Xh9U1vfc+VsQPkNM+ApWrs+CU8IyLs+UHefYCZlHZY8u4QUX0RajZ1WsZFiDbi
	C+KuxJ/uyyWwxAxzyLDIE2UAkfq/h+sFth0LFBiJBtODWjKVXmmM+MMQ5HONrfbd
	v3t23Nk56MuFknV6jqL9X1VhsBiOCJnDQK+IH9FPRkzY79mpL6EH9C5g2X70+IqJ
	0aMYMw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eu2xsbc3b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 20:28:54 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-9157d38ab37so498658085a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 16 Jun 2026 13:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781641734; x=1782246534; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mIGnsKTjN4ABQBgkJt+01XV05mC3MHNIgAGAmhxucYY=;
        b=QNiXLPAZo4UqRWn6JiOxqPKSyeqwyHBOaXBcNDSnTpl9ZyyOFRQppeYkWEnoE0jhaE
         3sFrZpwCcGR7VjOGhOf1bMc6jIQFzF6Jb2jmc9jqFn0T21gzsR6uySzQN3xxmk5kfslJ
         02aBex/YjkY27bKOLyivWHWvL8DX2eUPXAA2ztb+0/lY4K/4XqrUqn6m5VyTrCV9hrnE
         U1D25ozuZzKoy0p+2c0rqx+un9D6OUKBsfYXubv1CLYnzCehYTGdvmijG9/gYFvhBwi+
         pDvyjj3CsZtWFievw8650NoICfB0FHQN6qgmMI0Wy8mt2eVjHaa8XfUUjfOqbKy5htHp
         GL3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781641734; x=1782246534;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mIGnsKTjN4ABQBgkJt+01XV05mC3MHNIgAGAmhxucYY=;
        b=sXq7Rddo91bjCXJpKOhw2DYq2uVdhecibo5hq42rpxq2c741XjV+f3Fc7ogbVCpKE+
         o+3honVoS8cFFimTyogGnHttPwseQn3k70DBAqV8VmOCODdOt9RMqgo8Q7dV3l1LxH1R
         M+V2WYO2J6A1J9jE3RFlnhAIIs0x2GR5d7hvO4LoiYnPHRJTQkQta7nFsbM9qf3hnAWT
         dynnubhVa5VqvQ2SSiDaKdvGGGkcTY9j+DugzZ3uQ7X24tPznt4uF6s2M1FU4rN/GPej
         CIUa4n3BVFzk+SfEROb6Dlk59qEDxbr9e2sbO2OmDHJxesk1X49HABOgFIoD2xgJ/XNp
         3gYg==
X-Forwarded-Encrypted: i=1; AFNElJ/rcvD3vG9wcDwjfOUATDM8DNmyIN6PnyGsvvbThmvhT5O+F/q1BBC/jc/NfQVWCQCeWjI1queeCrxYhhwj@vger.kernel.org
X-Gm-Message-State: AOJu0YxPFLSnOHm1CWUWZyTkcYQ9hF03rqPbAct6jJDWYOMSdSft9gVu
	0HfJwFmisenUHpw0r7XYsDlOjrQdZIb8ZX3DoydUFkS+m7GTNF4xr/A36fxMCJhey58ZmHdBLT4
	I+QSAxyM66O453CuoiZukS71N1txxxAwVROGKE/+eoLK3P3V/np0jSouHumk31nANdRTg
X-Gm-Gg: Acq92OEXE0wrGYJDuclcjxfZ03NgHAnxCRZdD4sH45QYIDm0HdceUlseVJFT1RpZyTX
	H9vYlaR+2zyuQWYYocKcvLY62pr9X4jigMTnw2gpCe6eGu/hRh23Nz4OFDLnB0PsRgfGRjk55wZ
	XRCBVaL4o6Is1n8ml7DImCkBKXfGx7M1GCal9618Jbqn35VHmTAqL8aMQJuInw02ITtckErSqrV
	E1r5Vw/USsIwRA3IgQOjPYfgK2OaofIV9s/jWP5SZJ76/QWtv1WSVMz+rDA9fTipftDRdTfXb6P
	kzHflavJmfrnW3g9Mj01St7SHRn97Fe7ogA5p7Mj/ICH8R5ywSZ37m/x57xHNnYUX/WcnRg91TP
	9WyrwaXdJu2mtbgi0PFVI0XnKM7hSom0yymBAjy9j9IYPWE6Q
X-Received: by 2002:a05:620a:1a1c:b0:915:6437:bbb7 with SMTP id af79cd13be357-91d8afc9d5fmr205226385a.14.1781641733972;
        Tue, 16 Jun 2026 13:28:53 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1c:b0:915:6437:bbb7 with SMTP id af79cd13be357-91d8afc9d5fmr205222185a.14.1781641733464;
        Tue, 16 Jun 2026 13:28:53 -0700 (PDT)
Received: from [192.168.68.125] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4922fa47da9sm128000175e9.5.2026.06.16.13.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Jun 2026 13:28:52 -0700 (PDT)
Message-ID: <5d57d386-011d-4d5a-8f14-901019f3f961@oss.qualcomm.com>
Date: Tue, 16 Jun 2026 21:28:51 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/13] ASoC: qcom: Add QAIF shared data structures and
 variant interface
To: Harendra Gautam <harendra.gautam@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
 <20260605103739.3557573-6-harendra.gautam@oss.qualcomm.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20260605103739.3557573-6-harendra.gautam@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: yd-U-MgIgdFyAhQYYkVqNnNM6W9ZrB_s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE2MDIwOCBTYWx0ZWRfX2Ca8qJL6RHOI
 xHF/vKzBEOd5a3LSUUOX/FTV4fJ+aVmLBnjXFyr6eESIJo8c4jQO1WkIHIorj92pK5hDCjnAxgv
 BjHNfrRbqpxe1OhZoIdbHJLgetDMsp4R+QQ6Z6yvV+irBwslG8KaWMBEh7Q1BtptKvbLNf+2x93
 6QNw2u0+nd7O+BjnCiOXrimwrv/jA2nnLNr6aT8KgBXjvohYwWMd3wR3Qitmz84LCm6iNnnuS6t
 DgpOXn4NP5K46mxdr/XizmtmWZZzSzI4IK4G6YPS1LRwj2T/9zpOpH5k9W0fqYaFEjVnEF4wEfI
 8ZtVZqrnuCLI017QsjRTkPoPcnrBxHBLTWeUiX4lJ9CNdUeyTkgdjjJWPCaTBkzKkRBe09LykUc
 1jQSvi76hvyf5YOPDZdnJjTeD0GFk1EQ413DivVXsSCybRvh6b3OOWaVF3bDOYNF5nck9GUfbb6
 GMuVxcmmmcM/KvEMXvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE2MDIwOCBTYWx0ZWRfXylw2YI7KiEmg
 X1FMBYjKswMh/4eNjzi6Apz+K+fJNANAH3SVXsDBdVpKeWKtwLTtoOTsVCqo80gG3+8RTk4/z0l
 81ua+cHj+8acIZMhX5nSR3vlWB7w88c=
X-Authority-Analysis: v=2.4 cv=MdJcfZ/f c=1 sm=1 tr=0 ts=6a31b206 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=GhtPtFKKuhF9vAp-TgIA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: yd-U-MgIgdFyAhQYYkVqNnNM6W9ZrB_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-16_05,2026-06-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606160208
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
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-113473-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:harendra.gautam@oss.qualcomm.com,m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 88D2669536A



On 6/5/26 11:37 AM, Harendra Gautam wrote:
> 
> + struct reg_field cif_rddma_shram_wm;
> + struct reg_field cif_rddma_active_ch_en;
> + struct reg_field cif_rddma_fs_sel;
> + struct reg_field cif_rddma_fs_delay;
> + struct reg_field cif_rddma_fs_out_gate;
> + struct reg_field cif_rddma_intf_dyncclk;
> + struct reg_field cif_rddma_en_16bit_unpack;
> +
Why do we need to use reg_field?, currently this patchset only supports
one SoC. reg_field makes sense only when there is change in bit
positions across SoCs and if we want to leverage from existing driver.

--srini


