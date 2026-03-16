Return-Path: <linux-arm-msm+bounces-97885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sKLCMDzSt2n0VgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97885-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:49:48 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D2DD2975E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:49:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 01CEF301BEF1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 09:43:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 677F837BE6A;
	Mon, 16 Mar 2026 09:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NXgSijOp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R+o6z4Hr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BBB38A286
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773654227; cv=none; b=XPhyr6JbtygcI2PrSfaQNeD2Vz92rAXzpillKpBW9uFdAieCbjYwwfk2Zp5dGo8OZUloeCEJDq0QbQtTnvoVbWz/QG06SbBrm9nmUTY3oyULolyTS5SmOUFV0S836EUH59E3AP85+MLzhfGZsydYvFETJbMpYIpNPJUAfDgB7V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773654227; c=relaxed/simple;
	bh=m3J8Ggq7feejQvUq9IXDmbMXJ1en09zunM2kuDvpUIc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pyKJsXHpHNf/mvQLuVpiabrDVPyB6Fcx1uXrAAQZF+8mL0L/iVTCuT2evCEz+lbAixLcUw4EYYFgBIdkAhOjZP0G1UBfCux/OSksIri1GtbUV9iD7vY0saexcafRWhTcDTAPh3/YcEtOh74gVcQpPrEAZRNwQb6Sg8qqBGlTmNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NXgSijOp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R+o6z4Hr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64dUx3777679
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GzTMin4P82QqW3Y2Ob2ad2lbllt1U3DaWcQWJwydyFg=; b=NXgSijOpgGPKu/eI
	OfjA6pw2Y0M/xoLgOu9UqBiGHYIAm1d88qjUHCRDRUf3MsFMIKJP5S73pOJr3l4C
	dAWFa+Yw0tWNCF3uGbVgQdKTsIyypVJJvLPkE2zp6diNX688jcC1facr89PXRwne
	jV/s1EAZSXjDGwdfi/i4USRUoJf07gMDSksFrU2lUw3IL50gGAGTtp1pMwMpcgn6
	5nuj3B+LRmZ4LNm/vGP4SqikXF38j3CEfzPp46uZq+lgxekB8G9WO8mfMni/x9WO
	lPTMtb3w8SEBomlz7QWgAE7Qq6jNBU0oxdNoIXYfNOwRDzQ4eH2vEhaOBr0JTL1J
	/T6rRw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw0y7vymv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 09:43:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b04db6c138so19340735ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 02:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773654225; x=1774259025; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GzTMin4P82QqW3Y2Ob2ad2lbllt1U3DaWcQWJwydyFg=;
        b=R+o6z4Hr4v5HQQnM67Mq95GmLGwZlFGHU+3Z1s3rA6410IyMsIjxXqfI02U3T5H8nt
         awopZTg3ILEuSa4aYa5A+BtUQWFdytkUejqiCTGFz9Ms/X+bll432GQupewytsYUVSqf
         WIHtuHiv6B5pckkHfgf/bS7h/B2bw8f7dHtwfQuMLr+Vm/tP7sT2ZR39k4ghxiPk9Lo2
         hIl3QQiNDaHIojrAF2iKwJ8KX7bmrR13Dte7HOzj88rpc4+x7UvcGkNBZ7XYqngBE2Ai
         nTy6aAvcSibvPs+XtbFaRo5Bypl5PipzGCnuS4UPfn8SczYaaNJ/fbLS4d1reDzZPebV
         3x1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773654225; x=1774259025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GzTMin4P82QqW3Y2Ob2ad2lbllt1U3DaWcQWJwydyFg=;
        b=ml/+jCNb2v3gsbkLJDXi/ae3TixZYbY6VSv9pUekmWhTEjqJ+zLdI+zW0tmjpiYU+w
         1TNFlOiUbvsck2EYpAwkpBYYJAfYOgPJGb53CQpV/7crnYiPPc9OZaf0FNbplfVLpf4m
         AkJftzoNImgHcOTdlxGcB2jLcPdE+q3/DdaHtJelP4hVoAr3TNLb7g+a2K2A9Xtz3AZf
         8kybPetVV1YCFa1RIPDptDS8F4j7e6MPs2Lk1Be4XITBADzUEBrbSn+NVNZGTrYpwasi
         X85myOv3hABb3wdUOmfJHA3cuO4Y4u5RO+tmo/ggJW1lPV6qT/HFUBZTC/0F3EPwFavf
         3L0g==
X-Gm-Message-State: AOJu0Yz5Sc0B+Vm02tjC7+iK54guEQpLuOqsRckotq91+Wk1BScHPR4U
	FU3WFpJy9vwNH5uFeHdwarF02jU2A/jO1xAJ8stcfh3uAekU23i6rJmPI1qXXxk6E7GN9hzJ8Du
	oDc0sWSfKY/wS0QhG26/YfIA8jNpXaKnL1lOJy9RrMNzR5yKQxrp0Qw9d7NipFajMVcqH
X-Gm-Gg: ATEYQzyac2MOp1a0Rjl0IGfan5rp4sU3H1tQuuNQTcTtfOwyomtCO4KqF9whs+Ds7wW
	qg65LRdyKWsYxFdm1+EqW6E1TbHAxNY5bqdPtGZi2JmQvusnXYE4FNiYoDvHuhOrfwbPYcO9tCO
	/rEai5u0migjTBJbqt/tNM/GVMSeTDBEy9iz8Zb41PiJnL55PPO3U+qAlaB+ZLpQwyfSlQJU8yf
	iL8SKXz9hazGoZfi6WoHjIxAjVv12+1sm2pit665O1/ZAIdTA0ErKy1gHfcITZK0F3aPbMlxAN8
	SeNPCPqaAr+JFGZtuGBNrjjxg9Q5GZluv0c7CWL6h3RsTh+sbqW+8F9x3E9CVtBWeCjMCkhchnn
	oIAVsIRr0Akk+s6M4/i4AngS+NmZXPelti6xL0ElWVWsPojimKF6SAgOIu1uHmX2MckoWzBlc6H
	IYqFtQBtja0aMKxKZ8dJRqPBBzPfXxAzsDfg==
X-Received: by 2002:a17:902:ef07:b0:2ad:e02b:4629 with SMTP id d9443c01a7336-2aecac81c73mr147382555ad.50.1773654224727;
        Mon, 16 Mar 2026 02:43:44 -0700 (PDT)
X-Received: by 2002:a17:902:ef07:b0:2ad:e02b:4629 with SMTP id d9443c01a7336-2aecac81c73mr147382295ad.50.1773654224150;
        Mon, 16 Mar 2026 02:43:44 -0700 (PDT)
Received: from [10.79.197.144] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece62bc32sm105145305ad.36.2026.03.16.02.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 02:43:43 -0700 (PDT)
Message-ID: <b5fd59ef-f293-4086-8200-c3b1c7648841@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 15:13:37 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Maya Matuszczyk <maccraft123mc@gmail.com>
References: <20260313-v04-add-driver-for-ec-v4-0-ca9d0efd62aa@oss.qualcomm.com>
 <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
 <af0aabd3-26cb-4f5e-91ce-d3902b0a7147@kernel.org>
Content-Language: en-US
From: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
In-Reply-To: <af0aabd3-26cb-4f5e-91ce-d3902b0a7147@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: v6_AkP4XknmOMaRAp3SxruYf3qbPnh1_
X-Proofpoint-ORIG-GUID: v6_AkP4XknmOMaRAp3SxruYf3qbPnh1_
X-Authority-Analysis: v=2.4 cv=D9xK6/Rj c=1 sm=1 tr=0 ts=69b7d0d1 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=48movuqWnwKwBUJduE8A:9 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA3NCBTYWx0ZWRfX61rdwhJ8qqum
 2HPaDFbIV77xDIqYzrqux3fXzJdBzpUi1VdqaP9MNzxJir+e2p1pOHx+f5+4S1eS8fVcKTk3ump
 ESx99Wd+1M9aJxdIisWSfKAWV9zEvJcM51XDZjDZ+MnziO4omU1m6QP045Ctnda0gfyllmy28Jt
 KNyPHv2vZ9IfI0dLw4KxwmQFm/9G+Yn9ODg7pL69+ezWqyfdZ6qVnYyflpb6dDV+n+qx2D8bVI8
 QzRnKa+5vbrBdAWQeODTiTzvgBj8X/URtqDt0xgvVwbPykVucQIPZJFjWq5ud/evT4nGZIH5vlR
 nDDt3KpqxbdfiSTomDqlu4UwuF75ql2rge7PV74boqbMweA3Wsp9lvtpCJDFhywxoo0vC4YiO8d
 JUqbHTF6aZ1VvbkqsexfAbPn2k1KfFqzsF2CNcYM4ZsPmSBZgkurxh/Mgr9tJRSPyKN++cKJcGr
 XZXdHAvbbT9Bdf7eEBw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_03,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160074
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97885-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[anvesh.p@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3D2DD2975E2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 3/14/2026 12:35 AM, Krzysztof Kozlowski wrote:
> On 13/03/2026 11:29, Anvesh Jain P wrote:
>> +
>> +static irqreturn_t qcom_ec_irq(int irq, void *data)
>> +{
>> +	struct qcom_ec *ec = data;
>> +	struct device *dev = &ec->client->dev;
>> +	int val;
>> +
>> +	val = i2c_smbus_read_byte_data(ec->client, EC_SCI_EVT_READ_CMD);
>> +	if (val < 0) {
>> +		dev_err(dev, "Failed to read EC SCI Event: %d\n", val);
> 
> ratelimit
> 
>> +		return IRQ_HANDLED;
>> +	}
>> +
>> +	switch (val) {
>> +	case EC_FAN1_STATUS_CHANGE_EVT:
>> +		dev_dbg(dev, "Fan1 status changed\n");
> 
> ratelimit everywhere further. You are in interrupt handler so imagine
> same interrupt keep happening because of constant overheat.
> 

Agreed. I will switch to dev_err_ratelimited() and dev_dbg_ratelimited()
throughout the IRQ handler to prevent log spam during potential
interrupt storms.

>> +		break;
>> +	case EC_FAN2_STATUS_CHANGE_EVT:
>> +		dev_dbg(dev, "Fan2 status changed\n");
>> +		break;
>> +	case EC_FAN1_SPEED_CHANGE_EVT:
>> +		dev_dbg(dev, "Fan1 speed crossed low/high trip point\n");
>> +		break;
>> +	case EC_FAN2_SPEED_CHANGE_EVT:
>> +		dev_dbg(dev, "Fan2 speed crossed low/high trip point\n");
>> +		break;
>> +	case EC_NEW_LUT_SET_EVT:
>> +		dev_dbg(dev, "New LUT set\n");
>> +		break;
>> +	case EC_FAN_PROFILE_SWITCH_EVT:
>> +		dev_dbg(dev, "FAN Profile switched\n");
>> +		break;
>> +	case EC_THERMISTOR_1_THRESHOLD_CROSS_EVT:
>> +		dev_dbg(dev, "Thermistor 1 threshold crossed\n");
>> +		break;
>> +	case EC_THERMISTOR_2_THRESHOLD_CROSS_EVT:
>> +		dev_dbg(dev, "Thermistor 2 threshold crossed\n");
>> +		break;
>> +	case EC_THERMISTOR_3_THRESHOLD_CROSS_EVT:
>> +		dev_dbg(dev, "Thermistor 3 threshold crossed\n");
>> +		break;
>> +	case EC_RECOVERED_FROM_RESET_EVT:
>> +		dev_dbg(dev, "EC recovered from reset\n");
>> +		break;
>> +	default:
>> +		dev_dbg(dev, "Unknown EC event: %d\n", val);
>> +		break;
>> +	}
>> +
> 
> 
> ...
> 
>> +
>> +	ret = devm_request_threaded_irq(dev, client->irq, NULL, qcom_ec_irq,
>> +					IRQF_ONESHOT, "qcom_ec", ec);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to get irq\n");
> 
> No need for message, just return ret.
> 

Will do. I'll drop the message and just return ret.

>> +
>> +	i2c_set_clientdata(client, ec);
>> +
>> +	ret = qcom_ec_read_fw_version(dev);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to read ec firmware version\n");
>> +
>> +	ret = qcom_ec_thermal_capabilities(dev);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to read thermal capabilities\n");
>> +
>> +	ret = qcom_ec_sci_evt_control(dev, true);
>> +	if (ret < 0)
>> +		return dev_err_probe(dev, ret, "Failed to enable SCI events\n");
>> +
>> +	ec->ec_cdev = devm_kcalloc(dev, ec->thermal_cap.fan_cnt, sizeof(*ec->ec_cdev), GFP_KERNEL);
>> +	if (!ec->ec_cdev)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < ec->thermal_cap.fan_cnt; i++) {
>> +		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
>> +		char name[EC_FAN_NAME_SIZE];
>> +
>> +		snprintf(name, EC_FAN_NAME_SIZE, "qcom_ec_fan_%d", i);
>> +		ec_cdev->fan_id = i + 1;
>> +		ec_cdev->parent_dev = dev;
>> +
>> +		ec_cdev->cdev = thermal_cooling_device_register(name, ec_cdev,
>> +								&qcom_ec_thermal_ops);
>> +		if (IS_ERR(ec_cdev->cdev)) {
>> +			dev_err_probe(dev, PTR_ERR(cdev),
>> +				      "Thermal cooling device registration failed\n");
>> +			ret = -EINVAL;
> 
> Why do you override actual return code?
> 

 I'll fix this to propagate the actual error code.

>> +			goto unroll_cooling_dev;
>> +		}
>> +	}
>> +
>> +	return 0;
>> +
>> +unroll_cooling_dev:
>> +	for (i--; i >= 0; i--) {
>> +		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
>> +
>> +		if (ec_cdev->cdev) {
>> +			thermal_cooling_device_unregister(ec_cdev->cdev);
>> +			ec_cdev->cdev = NULL;
>> +		}
>> +	}
>> +
>> +	return ret;
>> +}
> 
> 
> Best regards,
> Krzysztof

Thanks for the review.

-- 
Best Regards,
Anvesh


