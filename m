Return-Path: <linux-arm-msm+bounces-91807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WkPbJGlIg2m0kwMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91807-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 14:23:53 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CCC9CE65D4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Feb 2026 14:23:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7AA83303747A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Feb 2026 13:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF1393EDAA6;
	Wed,  4 Feb 2026 13:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="drrZ2Qrd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B2GAcTFi"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CE03D7D99
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Feb 2026 13:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211317; cv=none; b=hQRWaYv7zjq0E7pe7pbtFdG6ctmgvE5GkUoPwC24S7Ceq4xstnbnhcJWPRq7vThNpNWvvChgQ6C0su4iPZC5kDSPfBWBsRdjLsiK6yBhV79kMHdnWom8RIp/FSmWghos7uhonsRs/D58HTiRe4q3sk2OG6NXFvDH4Rj8hsDrNJk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211317; c=relaxed/simple;
	bh=ejIe9K8TRFAnJxwfJZad45jmqCxHzaXJ8oFdYngj8a0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lOLns3ey4PuWvu9ezQySXFqubQH4ywpj6LWpvN2DXZtF2ZY+8Il9MBXvJCXrTgtPPpO7oqotJAORC7oDv86s547VQkdyOsNTL42LnPSYDu5CpErAKlqLN/IuV/ZD7vkBvOkPxTuT0AIvjpuhXKnQsmeu8FO8jUGhNZlXfG4pFkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=drrZ2Qrd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B2GAcTFi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 614CIOT1787280
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Feb 2026 13:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aLmS86Gu8Sr2rHXE8XBrADnektSAaASrFSh03li0xM8=; b=drrZ2QrdQlukp5EO
	8vrrMfmsonosRnfcPLEY+4IvClY2KDH3mOpfMH2E2YrnVVSEkB7gYLU9qPHWkV97
	vBN2yo+TkjWcWyet3bQeO17nFskwud+Iz7GEkF+Nda0hAJB+PunKNvFxQjO4G0IS
	saPcC3VYZS4wILsRjUYzJwvFfO31KdmPVMIlVt6X5jA67DUraMoiPZM+cu+CcUMd
	6wXZQ3aA6/FJ9Df3FcgMiDqGKmOEtGvnRL68N5nUjbra1x89jeDH4rVnDNdMO+Mj
	J+xE2Ozp+ghOcSaPsxL5wk4w+sOG65/lTaXCpxHMvIaTYgUN5SqGCj7s46AGDKme
	u9Gv2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c43uxgkq1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 13:21:56 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c6de73fab8so204086585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Feb 2026 05:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770211316; x=1770816116; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aLmS86Gu8Sr2rHXE8XBrADnektSAaASrFSh03li0xM8=;
        b=B2GAcTFiNdLsEsaidXhD7XI/4mL3+EBnwuyWQgUFogPwoQS07reqBPb9VjyrL1LY4m
         wKrruSn1GC/w0QzRW9nEJO6M0+bvpjeFSRAfSAp26VViW1f4CybmHys+OzPz9WOnoQt2
         0qj/rWl462F2R1ZmIPEH2pXonqR15CVk2V3OGhwdPvJpIJbENMImp6rgryywLt72psQ1
         LQlQ3EK1mt20DdoWT9doD8tOSoMs6l3z+GQKbVrno7a6vQVtz6XywZwezqa4LOBC4h1/
         AHjUFpu8JLfSn7a0Cayn7xlSz3QQ4sCuhMy5py6+q5aihrsZIHXx52TaBfVNBwY4MxBh
         5ONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770211316; x=1770816116;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLmS86Gu8Sr2rHXE8XBrADnektSAaASrFSh03li0xM8=;
        b=fuRgyYzqkTzLzMC9I47bWk/LhzVbqNUlENlrj8FA1ppHbV7B9kU2UwKvImBjZ9LVir
         hH6nr2dhWM+mmrdG210LPxoEQXOtblZ22/YIUysx4fcFGcrvkugCHLZ9MZDjq5NTnjRC
         dLeDV5ZGQclIKMrvxaHZSLR8OL1GkOxSEiuMkjonpFOMKoiLK2w5KChuEqXYC+eCcvSa
         FOC3AyxcmQk6EA4MMs3W2VFV5PRxvO6yUWdRpv6EIvC1uVZnG2IJV3LLSw2Yb+2wUSjY
         LTpLQOdlpZMWWfU8u8MXPstodUszuD5gU0+GWLzknnSJxvanTb8M4lyf2N4EhyUvtTa2
         u9sQ==
X-Gm-Message-State: AOJu0Yxab9lzRPgCCDL+DqUjZNCt4GnG1WLnyGDLYMcaMDmPBCwy7Hd1
	OR0C+LTi6ECDSeyBLZPRtfAKi6yYwug6aw3a0yF7TgRdtgOkJz+vx758NQjnmzylb0meK1TADYU
	kp+Wqikf16NYn/9Xo+QWTgfg64gtqYGZdoeiifHGGKtJNCvX4DjJkCv+Pe0yW4spSQVN0
X-Gm-Gg: AZuq6aLkOCiyzuymrgQylgskD2DWjp/c0IofNfpHvNSpew8ltI+w3jVg7ARUMtu5Gh7
	zYN8q7R5beh33l0IK6XVMmWqFrjwyg4Z/lMZkedNPsaJPAUoZ3wQXpMl9EyZ/C6vc6lkAK/LNDg
	NfTuWQA3CyS3wV3j5cObuhGTiDYe8TfgpLTiNWKvMCx4GZCJXwwQ3ZwjjPod/CW90utFAPZVlod
	qA02knBHocD5ja/HeY+/9RHTMKDlg+ef6QxlRDTP20SkdPtfnRveAN07EvXQBcASiwXEiw/rK+G
	ElfJDAyDPVKzuJhk0I8poN2FQAI95XK3X22I9Pk0kXNnvap2cFxUAp9kFFYakVtmTg5Tn7B8l3L
	jObr1mHDz/SAHJiuLT0dUQTca6K4EZ4K99SYVmEzv+uZwEjE90RPG2mMhLkqUqNgnPn4=
X-Received: by 2002:a05:620a:2903:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8ca2fa05f05mr300553685a.9.1770211315830;
        Wed, 04 Feb 2026 05:21:55 -0800 (PST)
X-Received: by 2002:a05:620a:2903:b0:8b2:e19c:67cd with SMTP id af79cd13be357-8ca2fa05f05mr300549385a.9.1770211315277;
        Wed, 04 Feb 2026 05:21:55 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8e9fd3d72fsm130989566b.26.2026.02.04.05.21.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Feb 2026 05:21:54 -0800 (PST)
Message-ID: <9f81c07a-c1c6-4888-975d-528a6181caea@oss.qualcomm.com>
Date: Wed, 4 Feb 2026 14:21:52 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/9] usb: misc: qcom_eud: add per-path High-Speed PHY
 control
To: Elson Serrao <elson.serrao@oss.qualcomm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Souradeep Chowdhury <quic_schowdhu@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260126233830.2193816-1-elson.serrao@oss.qualcomm.com>
 <20260126233830.2193816-4-elson.serrao@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260126233830.2193816-4-elson.serrao@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=StqdKfO0 c=1 sm=1 tr=0 ts=698347f4 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=eJaOKka8i50yBWU_CzgA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: f1jTv3t-hp512iWCAMY8jyHewHodnMCO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA0MDEwMSBTYWx0ZWRfX999huT6rOkQG
 egxZ7li9+/Y5z0kzcMmAQf/o5BG/Mh3CW6WwClDs8QjCMnqJ1k5wYTaT3zXrXKk95+cCNjs28YP
 ZQSsWw1Sd3nnzKYUJrMUSfzv8w6UxRhRonirBQq7o/q6khfBEF/PlyB8E4SMNHVXwAVGRZx7Fgv
 8e+fNFT7tC3xwXwbzXDos/TW7BR1ZReT+71aVz6roEKszDYheqfj3je933xAnPfzkxkhWPGverV
 /STTozkm+WVvq/5mi0XpOnMHw36IwLLnVS10WAZN7pxMrTDZjlwSvUuBdcsRRrfk3a3jj1ctYo+
 qAbKn37Jj3L/NFU6Yc7M3ss/3EIs1n4H7PPoBNsHXZfx2tf1nSNKllTWRQwZWnui0K49aiVhyLR
 dS6y29RVnW1ywt7Kg69T+zsiiFXjhfpkD7ZoEuUtdtqX181wyYK9lZuQUohdmNtDz7tT75miEaC
 sRpIqameNBgkOo9+pXQ==
X-Proofpoint-ORIG-GUID: f1jTv3t-hp512iWCAMY8jyHewHodnMCO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-04_04,2026-02-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602040101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91807-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CCC9CE65D4
X-Rspamd-Action: no action

On 1/27/26 12:38 AM, Elson Serrao wrote:
> EUD hardware can support multiple High-Speed USB paths, each routed
> through its own PHY. The active path is selected in hardware via the
> EUD_PORT_SEL register. As a High-Speed hub, EUD requires access to the
> High-Speed PHY associated with the active UTMI path. To support this
> multi-path capability, the driver must manage PHY resources on a per-path
> basis, ensuring that the PHY for the currently selected path is properly
> initialized and powered.
> 
> This patch restructures the driver to implement per-path PHY management.
> The driver now powers the appropriate PHY based on the selected and
> enabled UTMI path, ensuring correct operation when EUD is enabled.
> 
> Supporting this requires describing the available UTMI paths and their
> corresponding PHYs in Device Tree. This updates DT requirements and is
> not backward compatible with older DTs that lacked this description.
> Historically, EUD appeared to work on single-path systems because the
> USB controller kept the PHY initialized. However, EUD is designed to
> operate independently of the USB controller and therefore requires
> explicit PHY control.
> 
> Signed-off-by: Elson Serrao <elson.serrao@oss.qualcomm.com>
> ---

[...]

> +static int eud_phy_enable(struct eud_chip *chip)
> +{
> +	struct eud_path *path;
> +	struct phy *phy;
> +	int ret;
> +
> +	if (chip->phy_enabled)
> +		return 0;
> +
> +	path = chip->paths[chip->port_idx];
> +	if (!path || !path->phy) {

I think neither are possible - path is != NULL since we can't enter into
this function without failing the check in _store and !path->phy would error
out in probe()->eud_init_path()

[...]

> +static void eud_phy_disable(struct eud_chip *chip)
> +{
> +	struct eud_path *path;
> +	struct phy *phy;
> +
> +	if (!chip->phy_enabled)
> +		return;
> +
> +	path = chip->paths[chip->port_idx];
> +	if (!path || !path->phy)

Likewise

[...]

> +static int eud_init_path(struct eud_chip *chip, struct device_node *np)
> +{
> +	struct eud_path *path;
> +	u32 path_num;
> +	int ret;
> +
> +	ret = of_property_read_u32(np, "reg", &path_num);
> +	if (ret) {
> +		dev_err(chip->dev, "Missing 'reg' property in path node\n");
> +		return ret;

You can use return dev_err_probe like you did a little below

> +	}
> +
> +	if (path_num >= EUD_MAX_PORTS) {
> +		dev_err(chip->dev, "Invalid path number: %u (max %d)\n",
> +			path_num, EUD_MAX_PORTS - 1);
> +		return -EINVAL;
> +	}
> +
> +	path = devm_kzalloc(chip->dev, sizeof(*path), GFP_KERNEL);
> +	if (!path)
> +		return -ENOMEM;
> +
> +	path->chip = chip;
> +	path->num = path_num;
> +
> +	path->phy = devm_of_phy_get(chip->dev, np, NULL);
> +	if (IS_ERR(path->phy))
> +		return dev_err_probe(chip->dev, PTR_ERR(path->phy),
> +				     "Failed to get PHY for path %d\n", path_num);
> +
> +	chip->paths[path_num] = path;
> +
> +	return 0;
> +}
> +
>  static int eud_probe(struct platform_device *pdev)
>  {
> +	struct device_node *np = pdev->dev.of_node;
> +	struct device_node *child;
>  	struct eud_chip *chip;
>  	struct resource *res;
>  	int ret;
> @@ -252,6 +368,18 @@ static int eud_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>  
> +	for_each_child_of_node(np, child) {

With for_each_child_of_node_scoped(), you can dispose of the manual
_put()

> +		ret = eud_init_path(chip, child);
> +		if (ret) {
> +			of_node_put(child);
> +			return ret;
> +		}
> +	}
> +
> +	/* Primary path is mandatory. Secondary is optional */
> +	if (!chip->paths[0])
> +		return -ENODEV;

I'm going to assume we don't have any funny chips that violate this :)

Konrad

