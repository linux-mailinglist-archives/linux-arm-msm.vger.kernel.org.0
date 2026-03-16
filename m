Return-Path: <linux-arm-msm+bounces-97902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QMKZHTbbt2mcWAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:28:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DC6297E88
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 11:28:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9EB783005AC8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Mar 2026 10:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A86138F634;
	Mon, 16 Mar 2026 10:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OZLRcYlB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dArgU9QD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E525B38E5FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773656883; cv=none; b=nOXsnkJ1XFfp3p66/6VXgQDoQ9HPuTAd71E5R4LDNHc98Il2BrVZMF5PI84duGnRx1pIjAsrCvyPKE4VWggKwk45xJwWJESyO2uBxVKtWMHjAjFhlk/asdqeFZXfd56cHjhq8njKZTBWdOqYKaSnWR5ObIgvobjyWAic4U7Z0wI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773656883; c=relaxed/simple;
	bh=Z6sgzCyD/+mTUE+CNMr+vHs1IyCsx2ukxqg8nEJr9/o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ei1ymtUaObrBjRJtTe6hX3H7iFDjEDRH0WlWANvbWD6Jx6c7mxntMfXZoScs9SRZdOowak4VaJ3d5yJc2uBTXXXtMxJfUHGh3CTloJqztWH4BRvk18N7ZwQREGFC3pMfiAVubFA9TLZe0gKUwV3K+WpqzdqTTn/fNJMsjACcaaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OZLRcYlB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dArgU9QD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62G64go91066906
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:28:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xHYSC2Zh2sIK8c1O1PlQgO469KM9EpxGZDFIyRJHXSM=; b=OZLRcYlBurNoiEbw
	0RTpnAqcjdFE2PupVCzw3RdsIsaIy2Or6AeOVmoZ21blvnoJYjuNijvlbWDdljDU
	OnYeKmLcmFl8qpgvU5IQ2fY0jIlC77N0E4/nfBpRfZ1LyrkFN8Tbn0MudeOc5qbh
	NG2yDY6qK8Vsw8YBB4AjApf4h8k066x1wxZvNMF4TvQkmERsbpmzsSJCqsan7n+A
	/aQ+PG+AXHBgo9X1DQBL++/phkxtESaH6FpTCMv+Gs4/rl86vtfBcaFSUOaOyaC5
	iJeDrrQGbkTXuKKbs3TeYMfrb6z2bdIacnQBdAm/JLSfEl1UQZasxAi7rRqNczLv
	htBkyg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw027d96w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 10:28:00 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89c471045c9so12472666d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Mar 2026 03:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773656879; x=1774261679; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xHYSC2Zh2sIK8c1O1PlQgO469KM9EpxGZDFIyRJHXSM=;
        b=dArgU9QDK35kzEjsh0y64CVd8ylfu8hq+UnxGB5TZPmnDXs38mxb9doOytiPi0XBwY
         6potXaBbHPsoYuXLVPCSQHR7zA52TuwFaiY2KCqqcJbmQDLdoQXL1lWGF5lGeNCal5j7
         jhwETBl6JFk948zLJoP2BaSzgMWs9Yt/YkF0W7bak60susNoWkhiT65Of79TiVix+h1I
         J4uydcJMA046RzlPqnb7x52VZ/92eP26Nk1cf7UbV5JmrIUggZMlOo6dmrgGSgdV80/X
         U1qoQFFbQkfzZkI35moMFHqEPWcqr9bm32Hm+YcHW2lu4gmDDJr7ZENJXNH00RtpN+V+
         lJbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773656879; x=1774261679;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xHYSC2Zh2sIK8c1O1PlQgO469KM9EpxGZDFIyRJHXSM=;
        b=nk4kiv6DJpkrx++ufsueQF3PUc+PHxFLHPbFoFIsu1CZ3pG/Vw8+x//JEYKMvsJC4y
         pmy/dnRDNNOVNozrQQYGlPJe59vM2BRkE5k3nLYKaiIbSmd+7NMRn9cMnyDEf9qGxvnW
         zmL9i5uwA5A9ySLkQ5byHTy4qfQQEKkPMdND2y5hsrWF65nh8Rv+ZjExlZ38gIACPKkT
         +CUocxjOV7/tZlLu4yvl0agnYvmm0Fj4stbxodOdlrGWFGr2T8XhWY+QZQjbpS+IAyZs
         W7pYZF1MNJH6vZR7JEWZ6MARPPsMNHmLLoWd/6QL5RH/o0uEvVSugwQQjrSq+p9jZCws
         cKNg==
X-Gm-Message-State: AOJu0YxBn/t/su7jr0fVFlv4TYaGRLQgaFtBTQG3ltGNkT8zUnWIklpw
	8HYFrJOGAHdsC8tb/AZbsiQE6bo7qdtnV4jR70wf9cYgAP+SeUTNNE+OpdJy8ATmxOfAx/Pab86
	eYyxd7o5RICHOKQIcFYHRVS+2Ez/HU61DaIJUL0MhXdOxqtwW+045iI/2WIvPa32Jc68h
X-Gm-Gg: ATEYQzz3eS2xiOjJKOAUh9jwUIWoRhJpZvthuzFu2QpjXuOq5KcvRLY7l/qYKWtcRDo
	70fOCPgZYZ6Bylt9qHdASVZgQsapnznis2uyI3PDxfqgR4e0Srg6EBp988B9dxds9k3//b7ZDcJ
	VjMi1mV61RMaJC/7cwTeOzmf7Dv8hwmnXEcogicC1eu4pKaasrqNIh/ye0Zv7aNRi71NGd58oRe
	bd0UBb3g4pNzakuuJx3R/9gzzNwm/6fOsk3lhRDzReD3f3VQLPY/kBOaQS4IyQDAF51EI2pbg6l
	PJwtgSdTRuDpjIPkqIvXWLsVHyfpK78fhDdgrox+mpS/o2wGnGhYFzGCqe04m0v5hr97e0IWKGr
	AyMtHg+y898N9KfWJzj5h2j3Z5meq+Kqn0IzERB27uRWSXJCTtiOAxSC+hO6psWtxtxJKUJFI6X
	SejHU=
X-Received: by 2002:a05:622a:46:b0:509:2822:66ff with SMTP id d75a77b69052e-50957cdee07mr139541201cf.3.1773656879547;
        Mon, 16 Mar 2026 03:27:59 -0700 (PDT)
X-Received: by 2002:a05:622a:46:b0:509:2822:66ff with SMTP id d75a77b69052e-50957cdee07mr139541001cf.3.1773656879130;
        Mon, 16 Mar 2026 03:27:59 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6639fe6dc9csm4302297a12.17.2026.03.16.03.27.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2026 03:27:58 -0700 (PDT)
Message-ID: <6eb3a173-c364-431f-93e4-7bbb7a32431e@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 11:27:54 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/5] platform: arm64: Add driver for EC found on
 Qualcomm reference devices
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>,
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
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260313-v04-add-driver-for-ec-v4-2-ca9d0efd62aa@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 5I9X5khX_D-VOZKe-5dvq22TIigWnuaF
X-Proofpoint-ORIG-GUID: 5I9X5khX_D-VOZKe-5dvq22TIigWnuaF
X-Authority-Analysis: v=2.4 cv=AqXjHe9P c=1 sm=1 tr=0 ts=69b7db30 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8 a=Hm7G6JvClKosMBX75qIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDA4MCBTYWx0ZWRfX+oUQG/GSFoz/
 3G+AlzTEU44be+kVaIgZ8SVAtDvT3wx/bPWQ8MrIZK9v3xhdI7gJV5Y+RUob2Xj7XULNADGuxFS
 LkaFZ75K8t0K1HXrsnqnE3a0fo4EASQCgd0lP4lx1vUDwrCdl0tHwXo84zPenjRY1uDakVDLDov
 FY8kjSsKBxrAHAOeajxqqvoRGhhBTYe3nTDNDKoSFyWRb6Ui370xJYLnU8G+II6igKvxIXfHUlB
 sH+Bu13FGe/+Ho1oTJaeoK2fJK+9J3Ys4wGBF88E2fKh5dc52cm3oEwWFs1YAPBTODZIHiWUmBV
 iU/HpfJmgywG0DI2Gz64gYjSJUtolwNh9vcKd5sLfUGqokcFCcbxqg2YYXXwvXghRPHkK7t+qV6
 xFkPDOnoFHQ5FRGKYxgq6WIntr1Lm9omn427/zRTeqyHP6qb9uWi2gHTitYQQ5fLGBtyfUwrhD4
 VyC9fb2CtG40v9bE9RA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_04,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 clxscore=1015 phishscore=0
 spamscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603160080
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com];
	TAGGED_FROM(0.00)[bounces-97902-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D8DC6297E88
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/13/26 11:29 AM, Anvesh Jain P wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> 
> Add Embedded controller driver support for Hamoa/Purwa/Glymur qualcomm
> reference boards. It handles fan control, temperature sensors, access
> to EC state changes and supports reporting suspend entry/exit to the
> EC.
> 
> Co-developed-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Maya Matuszczyk <maccraft123mc@gmail.com>
> Signed-off-by: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> Co-developed-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> Signed-off-by: Anvesh Jain P <anvesh.p@oss.qualcomm.com>
> ---

[...]

> + * ------------------------------------------------------------------------------
> + * | Offset		| Name		| Description				|
> + * ------------------------------------------------------------------------------
> + * | 0x00		| Byte count	| Number of bytes in response		|
> + * |			|		| (exluding byte count)			|
> + * ------------------------------------------------------------------------------
> + * | 0x02 (LSB)	| EC Thermal	| Bit 0-1: Number of fans		|
> + * | 0x3		| Capabilities	| Bit 2-4: Type of fan			|
> + * |			|		| Bit 5-6: Reserved			|
> + * |			|		| Bit 7: Data Valid/Invalid		|
> + * |			|		|	 (Valid - 1, Invalid - 0)	|
> + * |			|		| Bit 8-15: Thermistor 0 - 7 presence	|
> + * |			|		|	    (0 present, 1 absent)	|
						     ^ huh??

I see that it's not currently used, but I think flipping these
bits would make it easier to comprehend down the line

[...]

> +	default:
> +		dev_dbg(dev, "Unknown EC event: %d\n", val);

Maybe dev_notice(), this would be good to log

> +		break;
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int qcom_ec_sci_evt_control(struct device *dev, bool enable)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	u8 control = enable ? 1 : 0;
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, control);
> +
> +	return ret;

return i2c_smbus_write_byte_data(client, EC_SCI_EVT_CONTROL_CMD, !!enable);

[...]

> +static int qcom_ec_resume(struct device *dev)
> +{
> +	struct i2c_client *client = to_i2c_client(dev);
> +	int ret;
> +
> +	ret = i2c_smbus_write_byte_data(client, EC_MODERN_STANDBY_CMD, EC_MODERN_STANDBY_ENTER);
> +
> +	return ret;

In a pattern like this, unless you have some error checking/logging to
do, you can just return directly

[...]

> +	ret = qcom_ec_read_fw_version(dev);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to read ec firmware version\n");

"EC"

[...]

> +	for (i = 0; i < ec->thermal_cap.fan_cnt; i++) {
> +		struct qcom_ec_cooling_dev *ec_cdev = &ec->ec_cdev[i];
> +		char name[EC_FAN_NAME_SIZE];
> +
> +		snprintf(name, EC_FAN_NAME_SIZE, "qcom_ec_fan_%d", i);
> +		ec_cdev->fan_id = i + 1;
> +		ec_cdev->parent_dev = dev;
> +
> +		ec_cdev->cdev = thermal_cooling_device_register(name, ec_cdev,
> +								&qcom_ec_thermal_ops);
> +		if (IS_ERR(ec_cdev->cdev)) {
> +			dev_err_probe(dev, PTR_ERR(cdev),
> +				      "Thermal cooling device registration failed\n");
> +			ret = -EINVAL;
> +			goto unroll_cooling_dev;
> +		}
> +	}
> +
> +	return 0;
> +
> +unroll_cooling_dev:

For those cases, one would usually add add a devres-managed version of
the helper (devm_foo_bar()), removing the need to repeat this in the 
driver remove callback as well

Konrad

