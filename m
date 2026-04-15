Return-Path: <linux-arm-msm+bounces-103266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL3jLthf32k0SQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103266-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:52:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4435C402E79
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 11:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C15CE30E87AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Apr 2026 09:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 336DF33DED1;
	Wed, 15 Apr 2026 09:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HtScilSw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YYVTDygA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BAE2EC0AE
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776246381; cv=none; b=T5hnVEsCSCjiVITPkz2OQxn56uyaN3tpwANM6P7jyB2O4kRkj1E2uEARl6vUiNwNobZJ9Z/jIcoVAn1a6Ja6ilOARvsWYy8+lE/LtjhEL2Zx6rNuC9PJAoJYKisP26Zsseaz0yMuW00ZYCbuFt4Qk/ID15MPb0wRThkQSvWczcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776246381; c=relaxed/simple;
	bh=c1MflrFeD5+n6mMO7gCo+moEzz1iszLgws2k7cI6kzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FIVr/8JrTH+JqVcsKC6s8SXPLLfJnjkU0uuz7iFAe9xPZ5bXyqbXO/uASmci5pgjzCJoFP7feDRS7AKb0mQZr4cSiuKUKvJ9ZRtmopRORO2A3eCCiIdBM2pCM7HLSuz7mp4gChLGoF/k2pRg6dJ1IsFXvtpq916MG/9HMgoU6fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HtScilSw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YYVTDygA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63F9PanC1778960
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v78e2uOfVUD/HRkOWd5/vidxUP+SE5hsufWwy8VQQAY=; b=HtScilSwhJX676xc
	/n/A5kt9foi60TuCnYLh4Wg8ER5+i5Meftx8IwufrgCZ4fi1hoSISZtLd5kpPLQD
	6GRwznk1q6Gys96RFBo80hbbtLx5qYTIFFR5pAFpdvL2BgAZcngJ3z5OYkPJguHQ
	K7rWYZ+264TTmSO2MDWdOKDhAZYefcCzjSZKGbVInCQcnl71UzfMvVCc1qJByVPf
	O8zhFmNAIOwykWgU+bc7sDOxzPLM14GGNyGhF3UBvpL4OIpVMqULrYDl7Fqu+voS
	PW+QpcB67sYxTLZ1lecu9yPBa6yOF5GPEzkmqHeneIplF1rAE5shTDpzZIpV6Z+9
	VAFDsQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dhrw031xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 09:46:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8acb4b340f4so8724706d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Apr 2026 02:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776246378; x=1776851178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v78e2uOfVUD/HRkOWd5/vidxUP+SE5hsufWwy8VQQAY=;
        b=YYVTDygAb7lmwufPzrEGHgZ+ghGBFbcLmKNBdEgafQEXbx02BLAzmDRi4ZSQFHrpnU
         UBPnLspzw6VOU9W4Er9Qd+Q8Wj/nhKipHGfcZaI2nUISGEPOjw8oSyFz2R78MxtLDLmX
         S0l0PndPHn4rCUrGILzKjtEKbdIq2d3Q3NQ5CPjVqhG32yaNtx21Q8FMye8l6+ztnhBI
         DXHa9Uj2vgwaxN3BB0WlfyseGYGd0g3FKCLzaW+4olX9bPKySAyrH//9496VS6eRXNlo
         U2dYbZVHYiGE1aNm92uL3nPg1hSullO/bFzEeVjDNSP2Sz50kms7TwDRqnL3stTpiKo7
         Qt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776246378; x=1776851178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v78e2uOfVUD/HRkOWd5/vidxUP+SE5hsufWwy8VQQAY=;
        b=aL0gUzCJNDvN+cYdbfEjadIBxMz34zet93nlJvqK/KwSUYgrWae08eVlweVEmCslNk
         9xXh4HRlR5RK85WDJVgoVFTQjB1G31KnJXRxYoLd5g/s4CB0K4FUKLZfzMv1e9tVG3UF
         sUVrkeF8IX3bMU8e3VDGISKYCS6uPnhuVlqnFP60AMyYNt3ORz1hYohwsTLmGttK3PBC
         btdPjmpSh60lAQRsrjOQErYa0SjyVcGKJrNyhwBYc/Ez6lx6bmVR+LQ82BKSuoWCTFX4
         6aLm06DDrLr+gKML3Eilc4aAaan7w6NiaoDDzP9Ct/+x2FhNcxL2OppDdPF4RYG3KJOV
         5jtg==
X-Gm-Message-State: AOJu0YzvWRrTjIDcEQmZuhUT/A54zL/DsqJ+zs+6UdKasW0yEWyftNa7
	xO2VjEr1vNLCaVRpTjxXkRoohwDte8XlY2WcsPaJLOlUtUEUCpGPDxal1ii7e93mzJNBximhl5o
	k5nZsBw8osV2MMFOr1KnmoQZv+3ZJtBOMfz5oo1ZCtS64WCgp1ezPtvYGQeMxFNg6pJvW
X-Gm-Gg: AeBDieuTkmycAZ6FBWIRy1I4ph0Qf8mQjpDjYmlVW/jYZ94DwfEk7Yi1W5znfvnEoWa
	mKGmZR/gKjWc1WOfC03Fx4PO5qwyKOmeBvkbVXRRONHWAOzQqXOY0PDv/QIaVNDMSwzcTE5tvJC
	8vKkjMu1zZOTtG6chKClY8qds6TqP3ylZ2sXKWr1RhUZxvay+imSMzQvAi82JEDCF/TUWBdu46K
	lKjVzPdNIgfIrM7hDzg42FLZyRaGUL4aqL5FtUJV6tZpTtmCzMQ9QXjq42fuB4VlVyoi2Tb2Mto
	+dMWfUgglnPY9bXOxUeodFi1D0VdL5Ad7sWVYIGor0M9gGXcYNKfEVwOYhlDsxAB5w16xJWh1Ol
	6MeZkUkIP7mDJMJjkBGFKOVoNJ3u1MDak2jiLRlnAwRKLCcV7SXusrPhxUrRcQEin5f85XXauZX
	Guo2CP3WTEZubVMw==
X-Received: by 2002:a05:6214:27ce:b0:89c:d639:e7be with SMTP id 6a1803df08f44-8ae6a92307dmr17279706d6.5.1776246377565;
        Wed, 15 Apr 2026 02:46:17 -0700 (PDT)
X-Received: by 2002:a05:6214:27ce:b0:89c:d639:e7be with SMTP id 6a1803df08f44-8ae6a92307dmr17279476d6.5.1776246377082;
        Wed, 15 Apr 2026 02:46:17 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba17392e952sm39513466b.15.2026.04.15.02.46.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Apr 2026 02:46:16 -0700 (PDT)
Message-ID: <fe30cca9-c348-4ab2-b190-33016242aa64@oss.qualcomm.com>
Date: Wed, 15 Apr 2026 11:46:13 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/7] spi: qcom-qspi: Fix incomplete error handling in
 runtime PM
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc: linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260414-spi-nor-v2-0-bcca40de4b5f@oss.qualcomm.com>
 <20260414-spi-nor-v2-2-bcca40de4b5f@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260414-spi-nor-v2-2-bcca40de4b5f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Uc38jmxUo9rygaNRLXvU39eZEypY3KW3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE1MDA4OSBTYWx0ZWRfX1w91QPVu4FYR
 dmQl6oyifoEPe9+buZNKddi5JkQ3qgopJye4lh1Xq5qgW2fD6adEE2kvDASkpPTsaW/NqxNV4CB
 DtaKvjlDq3mZxlW4s0Xiw0HljgHKhHBQlrOIIx8GAYLeNJOOvXXpwE2jveCCBvsphtTusT/aMoH
 A35oclZyXwfrskUJ5OQ5xKMN3rXuJVEidSMU9N2tQG9VSS6itApcmvrFLr02yyliJMS3QlDKuIK
 4J6xgYlvcYunD6KcNVidDth4b99WOayeiTN95PvXek3X6b7uOnIIPNpLHsivfN3ftwSukkxgbOu
 3Cj9t1JweNo/w3mK9Dj4bcMDW8YNO/N03aIUy4YnCxpUgvx2Ev0dz6+cxdd8ncFui5sUQp6BsTa
 nTlIBfG4OPcwkqkA4m3othvT2EmrDd8tJiCygWIZGP8p9zsvgj0CQJUgmjUw0C1tK0TEEoVylfW
 F1z+7pTAL3G/TLjPSpQ==
X-Proofpoint-ORIG-GUID: Uc38jmxUo9rygaNRLXvU39eZEypY3KW3
X-Authority-Analysis: v=2.4 cv=YMGvDxGx c=1 sm=1 tr=0 ts=69df5e6a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=3Z6IiVtUJ8LA7v5DzrMA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-14_04,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604070000 definitions=main-2604150089
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103266-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 4435C402E79
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/14/26 7:08 PM, Viken Dadhaniya wrote:
> The runtime PM functions had incomplete error handling that could leave the
> system in an inconsistent state. If any operation failed midway through
> suspend or resume, some resources would be left in the wrong state while
> others were already changed, leading to potential clock/power imbalances.
> 
> Fix by adding proper error checking for all operations and using goto-based
> cleanup to ensure all successfully acquired resources are properly released
> on any error.
> 
> Signed-off-by: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
> ---
>  drivers/spi/spi-qcom-qspi.c | 40 +++++++++++++++++++++++++++++++++-------
>  1 file changed, 33 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/spi/spi-qcom-qspi.c b/drivers/spi/spi-qcom-qspi.c
> index 7e39038160e0..38af859713a7 100644
> --- a/drivers/spi/spi-qcom-qspi.c
> +++ b/drivers/spi/spi-qcom-qspi.c
> @@ -819,19 +819,31 @@ static int __maybe_unused qcom_qspi_runtime_suspend(struct device *dev)
>  	int ret;
>  
>  	/* Drop the performance state vote */
> -	dev_pm_opp_set_rate(dev, 0);
> +	ret = dev_pm_opp_set_rate(dev, 0);
> +	if (ret)
> +		return ret;
> +
>  	clk_bulk_disable_unprepare(QSPI_NUM_CLKS, ctrl->clks);

You first need to disable the clocks and only then potentially reduce the
performance state, otherwise there's a brief period of brownout risk

[...]

>  static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
> @@ -840,20 +852,34 @@ static int __maybe_unused qcom_qspi_runtime_resume(struct device *dev)
>  	struct qcom_qspi *ctrl = spi_controller_get_devdata(host);
>  	int ret;
>  
> -	pinctrl_pm_select_default_state(dev);
> +	ret = pinctrl_pm_select_default_state(dev);
> +	if (ret)
> +		return ret;
>  
>  	ret = icc_enable(ctrl->icc_path_cpu_to_qspi);
>  	if (ret) {
>  		dev_err_ratelimited(ctrl->dev, "%s: ICC enable failed for cpu: %d\n",
>  			__func__, ret);
> -		return ret;
> +		goto err_select_sleep_state;
>  	}
>  
>  	ret = clk_bulk_prepare_enable(QSPI_NUM_CLKS, ctrl->clks);
>  	if (ret)
> -		return ret;
> +		goto err_disable_icc;
>  
> -	return dev_pm_opp_set_rate(dev, ctrl->last_speed * 4);
> +	ret = dev_pm_opp_set_rate(dev, ctrl->last_speed * 4);
> +	if (ret)
> +		goto err_disable_clk;

similarly here, the OPP state is only altered after the clocks are
running (potentially at a high speed because the rate is cached)

Konrad

