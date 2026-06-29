Return-Path: <linux-arm-msm+bounces-114903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id UfMlCy81Qmpd1wkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114903-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:04:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 138776D7D8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 11:04:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=moYsVQWO;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=YNrwbIrm;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114903-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114903-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id E7B653022979
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 09:01:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC8A3F871E;
	Mon, 29 Jun 2026 09:01:33 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0CA3CB90A
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:01:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782723693; cv=none; b=gpYNCOLigNpteliwlibeGfd24Qlg8eqSS1PCnrkVVJ92sLmIVuRKbAVKd0p9cGiBJcQnqtcSrnSgGLTu7ZZ3bKB7KgxEvmp0miAATFf4LFRzhFKai4a3AyaWgHqPuOWPVxhIpPpkpwNS1kqms0xgtVS+GOesAKf7/vSRP1XuW+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782723693; c=relaxed/simple;
	bh=iQaW9efmJxsFty8KriV+Rc8XYb9AyVC9D15vgPxxi8c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FJK+Zn0MFiOR4G45yKWoNXGaAF6KSEdRoQDsCpyLOLCSDA8HS74+/CJVjxqVu0bjlvawlWYb9PLeSGBdzHN7+23L9FJASGHGBrSrAtXCorMHCfod+QZyZE1NlUaDmpltQFBfpRj+1zMzVMUvI3pw//0Ps4X8tKMf2XjCJigRVS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=moYsVQWO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YNrwbIrm; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T7Dqng2188734
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:01:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZR0HEeEszfHRexJKI3MVdAYdLZ6rfFh6jHay7D8y83Y=; b=moYsVQWO5O1l0wv/
	YpX5akfMpl7u7eibf5fssfB8G6AnwviprmB9g+k5x1dS7m4D6eLdErKTvadUsF7u
	1S3ekDL1gn6A0f7JZfK0wjMZdXv7McSJBisLiXKmk2tsdU/l3hHjOIzoOzzCutLl
	wXGaU3ce2FX0jPF1SglaBQWWf/RJ7atTwq7PW3rP1FxyuWHzN0aOUvfDNmg6S7/k
	nHKCF4vUUzesmHi+Kk5m2wmdBc1xrqTSREEAJh/HLp1xz12+uodsZsc60V1H5ofm
	iyUn9pvdfIdwZl9eRtPOoa4PesxlxfcSq5eynqY03zmCcOrnWXJuqdlYG4aAhJyX
	8qfqLw==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3m4treh9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 09:01:30 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7392d893428so17590137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 02:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782723689; x=1783328489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZR0HEeEszfHRexJKI3MVdAYdLZ6rfFh6jHay7D8y83Y=;
        b=YNrwbIrmDcM21NwxvBlwRMWfbYNNb17OmwxzKqZe2uIW47QABOrLCznOkcZo7hyQRI
         XP5wDBkh2g0rdlo4KCzFxHVv3mT0FNCGrehNL8zzcHFHm0d8tHLxGnBb0Zgl5xjqB/yF
         CFgl4V3tuByl5CcxSAJ4ZJrn9XzURPasSDE28t8Ugw4dTyLklOrszWOLCdyXe3x8lpoZ
         Fq0KzO1KV+lGc1gE1iNNgQQaqDbXu1D0Yidn7Wtk5NQefiu87iNS52jBCszsmSn/+/Hi
         qw8ZnbhLDSCh40hMXEjCgTlDZ4kRnQD6s5OFA1LW0WssvHWCupDHzgwlqVexNH/lLUCm
         KfDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782723689; x=1783328489;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZR0HEeEszfHRexJKI3MVdAYdLZ6rfFh6jHay7D8y83Y=;
        b=YVAkZwtPXT2NdyX/aVuMMpMPz6Al1sOcbwXsz7hccFVq+cpdEPGEZPkuOlEHT+9SYS
         A9eARN/ETheMDKtmBUkdIAK/lE1qC2WRCgQOVZZoLuanYC3ON+hIyt+esbE10FHO6RXJ
         jy0mEJ18onMyxsuINRAJpwvbaovqxvG5YlPMUzuiQrNEBDwWsPpVBO9jV3/pyQPKcila
         luCuaCYFpduaCzt72zfzGrPqMJz03dj9yT7q4+1y4pWEFv7uzHHD2V62XXB537MLBXV1
         m2G0aA3G/+G59/2Q9HHVHfA8B2v95oqVmjO0UaDuSQWrQHFOFkRfGk6oGCr3EiHlvBII
         /7cQ==
X-Gm-Message-State: AOJu0Yx/xBf2OGcK/cX79FWyTy/WwpW4fsXTpmS3+l7W/k3P/4M+DasG
	sKVSgPP4OspOCyeTonD/nCqVj6+2mc0hD5t6EyqWZBiQvfDiNZ7PABd6s1Q6jdS0wM9Ves4Iycp
	Jb0/j62u9FeOLR2vJBjs3YQT18egYdzsPSiiK6y0oQrNNhV+q1uPGIs+M5FvdrF+0vNMo
X-Gm-Gg: AfdE7cmqaUlVbj7qkH+d4oXU5rp1bvPDnap6NkdIz5LoMuJnBniY8BTREfGgbuGiXdU
	RtTKvozxIWTmkQef1WaL+lXufqr24mxFULBnlUe9R1RBjrpE6DUIzDlr7f5y4WwQL7mRgN+C1Th
	ir5NoGKf+qla6UgW6uq4VY4v+JJNX1L7B6WkrCT29W07KJL5SeQYS9h4GEMZ44KZ5Bf2wlCJvs/
	FKvBxXxLD+GcaDtSlo7+hPqYTvbVaKYwJXmkqbsk8bs+urnWXSQe14zpq4n8UXI+0SW8W72aOuk
	PVt3IGEoVdT9DeDiIp+gcVg74y8dB2+c5rti+WbmkjjUJjo+49p1HfFSmS1jrizlSVHeEmsZFAj
	+Us28UvdRUAGFxnft1UlApG25CNw1kQ9Lo2Q=
X-Received: by 2002:a05:6102:3ec2:b0:62f:46c:40bb with SMTP id ada2fe7eead31-734362a802emr2519615137.5.1782723689320;
        Mon, 29 Jun 2026 02:01:29 -0700 (PDT)
X-Received: by 2002:a05:6102:3ec2:b0:62f:46c:40bb with SMTP id ada2fe7eead31-734362a802emr2519606137.5.1782723688556;
        Mon, 29 Jun 2026 02:01:28 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c124d96a2f5sm245939066b.42.2026.06.29.02.01.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 02:01:27 -0700 (PDT)
Message-ID: <94cee60d-c942-437d-9136-af0e83728966@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:01:25 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm64: dts: qcom: Shikra LT9611UXD support
To: Nabige Aala <nabige.aala@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, arpit.saini@oss.qualcomm.com,
        mohit.dsor@oss.qualcomm.com
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-5-449a402673d0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260627-shikra-dt-changes-v1-5-449a402673d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfXzmcRJaHd+cwR
 UBuudYK8j65wti+E4JGMZjbE+12zjtQJ/rKYTKJIt8dF6Gbgj5wgilQSE5NoZQZR/RBl4AMs3Lb
 d2YKnyeeVOtyoxfayqKaDiuKl1JQCZcaorfooOrYdpOJ8L0A5nP1MYhwByO90xlP65OEcOv7m3o
 c4UhcZcHe1aOkgXjZKlxDaBrNTPPvMME7fxLD2WboE72BJ4CI+lOkQfiphev1s0szffJXUquLZ4
 GuoHRhZoXui865d2u3wXXNaYGMjN2uQyPG13+rvZihnyuhN4iH+fKCZkE2fd+6ilWhez41q+jGa
 MzEZLSXw5tuvZTW/ByZKCa9OKWhUdn9HwXVigUK+2ScNde1JGE2RfvPYpaGXHn+NYMG1GQkGM55
 8l6s8Y/EBGeS4m2JPGwTo/fTYMQAVPeQXWMOWhhNGlj+G+xY6Es3adpBEpsf6T4Vbn/ocaUypzf
 3MiaCMSTJkNmYP5jvYg==
X-Authority-Analysis: v=2.4 cv=R58z39RX c=1 sm=1 tr=0 ts=6a42346a cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ApXU7MVGkJ7Y0BAxnKQA:9 a=QEXdDO2ut3YA:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3MSBTYWx0ZWRfX8sjzeWTgmga+
 mpwEwcclj8SFbLilU3prST1GZfopfQq7fxp3eXOuLCWH5g664j/TRufl+dBnFgWZBLynH40cHe/
 19cwR+SMoXin7bD9EdaGYueF9ExiPXU=
X-Proofpoint-ORIG-GUID: zG36M8wcjXYI-jmEQlB8Kfo2LmdAmHhR
X-Proofpoint-GUID: zG36M8wcjXYI-jmEQlB8Kfo2LmdAmHhR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 phishscore=0 clxscore=1015
 adultscore=0 malwarescore=0 priorityscore=1501 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290071
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-114903-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arpit.saini@oss.qualcomm.com,m:mohit.dsor@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 138776D7D8B

On 6/27/26 12:01 PM, Nabige Aala wrote:
> From: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> 
> Device tree changes to support lt9611uxd hdmi-dsi driver.
> 
> Signed-off-by: Mohit Dsor <mohit.dsor@oss.qualcomm.com>
> ---

[...]

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;

property-n
property-names

in this order, file-wide, please

[...]

> +&mdss_dsi0 {
> +	vdda-supply = <&pm8150_l11>;
> +	status = "okay";

Let's keep a \n before 'status' uniformly as well

> +
> +};

Stray \n above.

[...]

> +&tlmm {
> +	lt9611_irq_pin: lt9611-irq-state {
> +		pins = "gpio85";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-up;
> +	};
> +
> +	lt9611_rst_pin: lt9611-rst-state {
> +		pins = "gpio76";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		output-high;

The driver already takes care of de/asserting this pin

Konrad

