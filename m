Return-Path: <linux-arm-msm+bounces-89810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SM+DLTZ/cWk1IAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89810-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 02:36:54 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0926065E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Jan 2026 02:36:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 079CF7E463E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 11:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD1B62F6905;
	Tue, 20 Jan 2026 11:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SBCdgDDR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BOLNDHGT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1201E3D5258
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 11:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768906847; cv=none; b=eh6ycwsbLq8wbeA/tW5DN8+rrxiWoM2+4DpHmtJEw7jNFMFb8PPClgZ6tybsZC63n8DPOrhlud8zGePZZpw5NGiDwi1Q8H7TlBk80APZ/mXJ9ZEmzbYaZ+/DAec/kRwS1Gn3T+YcKxcw+A3PxWpEQj+2Dsm+MgAS6r3rQ8cr9l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768906847; c=relaxed/simple;
	bh=O46rSJlea/SajDU0CJ0HrX7k9pM7TZlXxm7PxEt0hAk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PlTjmIQbNPf6j8ph3evDDb6iVK5Fi4iuAI6FcLNFy3vqFvmXiUHH4Kw0+dGRRcbGTi9spc1z6yqZ1IDkNrRJd9RRAj/f9iZ3rR3nIKueGSsBzPaisgm8brnrsFG5svsR8axCh+vwqk8icehfuYwUkfV4WrynCe7xlcr00PlwDtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SBCdgDDR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BOLNDHGT; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60K6MIev1661133
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 11:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uckr27RLbm3h8w/yqL5p6ZXMdJeaPZyAz9adDw0oykc=; b=SBCdgDDRB7ddlvY9
	R1a0+xdtP5OD2wPh6jVv8cHBQqhKdjp2Q7CgdLd2vA90FnlyZ+DpBablDPU7Ykma
	fP/VHhPzcQqeQYHOCjsxpylok0iEbxQ2J/0h/EwNjoxTFOSAQsCo8eWrJlrcpY5B
	nU533isvtDc37zJcCCNJSuVTRNju3+0CGCYEP3Fith6zyLroY+x/nw81tZdobOit
	23qW5EV3UvH7iOqSNusRExhhjiAlEWqjbaMo1ySeg9l/cHNyQ8ms8veAdlVtEG/i
	Az2385lYgPa+o52q2oCngr3i6sz8ixTCz1377k5Dn2OZ9W+nXMDywNH2ZpCQrFoj
	raYAQA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bsjvduju2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 11:00:44 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c533f07450so115348585a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 03:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768906844; x=1769511644; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uckr27RLbm3h8w/yqL5p6ZXMdJeaPZyAz9adDw0oykc=;
        b=BOLNDHGT/oeNo40b07d5HdY+TYQhdqvVgMahw9T1OOQ8GJwn1pLfPkykp2H/IiHDTw
         INjiPWLzzFUFDG6kYc2WjdynBAArhDLQUKVNL9rFfbGufam5BXwrHF2rCh/c0W/6MiKu
         +DhhPXvQ/07wnllXNqpoDJL01mu7T0F62J8+lnW92FjOJI8q1uwSr2fR9d7rJAQbaXgy
         EPjNO2vXohzhpTv49FEQv/sR0NLCt+naUPxodNuHlp8BZGIxB5tGGyMguP8nZjVhV/Qc
         AOqI3tX0iSCpxIglUmqf6WIhfSOlt2/PZzt8cSWgM9KV6kNaLdNqFYgFRcnRPa1T9Wp/
         fdKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768906844; x=1769511644;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uckr27RLbm3h8w/yqL5p6ZXMdJeaPZyAz9adDw0oykc=;
        b=vMg/ki6lPFFbVja/z2Mbb6+DM79QSqFYj+mYuISTXLXrEgYId0YuPLfuyOGsUqkjWz
         mmM9xFdiLpgYORPrwQWwy6oLtjDkqnclgxUNlGxpKbA3Wa6BjfeY5L/6Dt8t4b3kl9w0
         wqX21Yh7h2BKJ5ZPe7+wHiy1w22U1YW9VP9v+KJLeTMNvN/xKNWMiEUM+zvmedHqLOYe
         keX+peAUYIfS91GHVi9w4Utt6mIJSCYwwlOgY/ZuaLJX0uFMXS7jhqH9xNI7nMNyvhjL
         EKyfd9TW6fHRmnEKstZqiCtLTBo05FBv6hYHb1B1bXJvZJqF4S2eyiG85rBxFmAwN2dx
         TgDA==
X-Forwarded-Encrypted: i=1; AJvYcCUsMBPkT12Fvmol3LfXhAWFh+a1pFWEYZdIhU2AvR8QvZrasFkHdwNvSgcpm9WsgOiH8RhdUkvviaq1zMEY@vger.kernel.org
X-Gm-Message-State: AOJu0YxoON4IlFdp0QizsDI87x7YfGidKslKYa3GLTjkA9D9xodEqhDm
	IIr8ZLVCRkgNRpMRpXUuEJmKHagJUuKxDEkngVWqvkpCBmdPoqAS9jeudaG3rJMQ7GAUcmwbO5Y
	xBOpmjFYI1wRfrt/eJ/Y12mO0l8Mu5VW27ccSUtkJyD5eNDY9DXiqTXz4hwq/+1uiSodV
X-Gm-Gg: AY/fxX7OyFpL2UOD/DKlqd4JYAVsItRaMis88J4yteeqUh6Nkh9aCNV9tqLEcHdX32L
	hfmKSne67KEUb4c+ANy1Ai4B908Ge3m22AQtbQdbpfYF/62sjqvFCPbTILBYQejJyWmoHnePedM
	qwHSiqmb12c+DWB2SjNrjXNG/bBLt/Zy9feTMfD7t2YPIrOof5U1ldt7ilzBeUU1YhRa2wlSfYK
	Z24LGcHfTdMhCY7A2aTJGFt7OJPmleSzr4HNvdnlhHdBt2ZQklz+LsZk5YbZAAROgJP9oG/Z7c+
	svH2mXgzkMvIpzlbc1QfnEArNE79uXcFP71ygZ1hoRmmpIxACOH2vTi3YfC7BSvc2kw/BzQuIRK
	ij75Hnf2zUiwaFHL5wiHwgvKXL33NcAbbooBeinMnioi8e34Vd+U5TPSWWoMfmMvLraE=
X-Received: by 2002:a05:620a:1911:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c6a6716bedmr1505529585a.5.1768906843284;
        Tue, 20 Jan 2026 03:00:43 -0800 (PST)
X-Received: by 2002:a05:620a:1911:b0:8a3:d644:6930 with SMTP id af79cd13be357-8c6a6716bedmr1505522385a.5.1768906842492;
        Tue, 20 Jan 2026 03:00:42 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8795a2f1a3sm1348490166b.62.2026.01.20.03.00.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 03:00:42 -0800 (PST)
Message-ID: <c37e9121-31df-4934-9568-9f7e9c9698f3@oss.qualcomm.com>
Date: Tue, 20 Jan 2026 12:00:39 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/5] arm64: dts: qcom: sdm670-google-sargo: add imx355
 front camera
To: Richard Acayan <mailingradian@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Robert Mader <robert.mader@collabora.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        David Heidelberg <david@ixit.cz>, phone-devel@vger.kernel.org
References: <20260117040657.27043-1-mailingradian@gmail.com>
 <20260117040657.27043-6-mailingradian@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260117040657.27043-6-mailingradian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: gHgDFib5elXFbfNJs_YSUrU1iEN8fs6d
X-Authority-Analysis: v=2.4 cv=U92fzOru c=1 sm=1 tr=0 ts=696f605c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=QX4gbG5DAAAA:8 a=pGLkceISAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=He3dl_zFzQSlanp4l3sA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=AbAUZ8qAyYyZVLSsDulk:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: gHgDFib5elXFbfNJs_YSUrU1iEN8fs6d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIwMDA5MSBTYWx0ZWRfX3/4DAKxOs/Ea
 pZMZG/3+rt+iuz9SIYeTiowSiLX3Wokcl1p4EUNGZNrBJVNg3meVeTIq9JiPy6bznkf4GEsulBI
 ChsxgIXA9Llr2YOLyi6d3mCmY/bW33ScXtycGE2XXLXHuXaYm6dz+ThTW82+UuYj5BrtShdSpu7
 dPNV0+hdBIGW6AZL/2pUh64PO/h5hpx5w/zBl4rTR3y/tg1hh0o1sdytC2e78YNuGoLEZJH9art
 cw5EpeV+eq8RzYEECFhzIVaS8SRM8+WQmzI5BRO27AsnXvMfgKrhdRjUjVl072xQrBiTnKr1P+3
 t2jFl11g5S9VgcdQMQGp2iPFwqKPzMvqTZMKJ1SE/BNPPOJgdomRjse8xtJ17ZSnk3G6C5ta/ur
 XFkTgGOZHmLfp/RefD+IeOeJcYGdk/jXfI9ijn3MQvhBc60Dez5KLaE3Fo2G5I6/RdX6N8IZ7cS
 H6ZX7LZP/cOAE15eMhA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-20_02,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601200091
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DATE_IN_PAST(1.00)[38];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[qualcomm.com,reject];
	RCPT_COUNT_TWELVE(0.00)[17];
	TAGGED_FROM(0.00)[bounces-89810-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,linux.intel.com,intel.com,vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,linaro.org:email,dfw.mirrors.kernel.org:helo,dfw.mirrors.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,collabora.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0E0926065E
X-Rspamd-Action: no action

On 1/17/26 5:06 AM, Richard Acayan wrote:
> The Sony IMX355 is the front camera on the Pixel 3a, mounted in portrait
> mode. It is connected to CSIPHY1 and CCI I2C1, and uses MCLK2. Add
> support for it.
> 
> Co-developed-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Robert Mader <robert.mader@collabora.com>
> Signed-off-by: Richard Acayan <mailingradian@gmail.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---

[...]

> +&cci_i2c1 {
> +	camera@1a {
> +		compatible = "sony,imx355";
> +		reg = <0x1a>;
> +
> +		clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +
> +		assigned-clocks = <&camcc CAM_CC_MCLK2_CLK>;
> +		assigned-clock-rates = <19200000>;
> +
> +		reset-gpios = <&tlmm 9 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&cam_front_ldo>;
> +		dvdd-supply = <&cam_front_ldo>;
> +		dovdd-supply = <&cam_vio_ldo>;
> +
> +		pinctrl-0 = <&cam_mclk2_default>;

Ideally the reset GPIO could have its config defined too

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


