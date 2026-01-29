Return-Path: <linux-arm-msm+bounces-91143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kK3uAD81e2mGCQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91143-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:23:59 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 52EB8AE974
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 11:23:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7883E303BB1A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jan 2026 10:18:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08CB9337BAA;
	Thu, 29 Jan 2026 10:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e5RX6ENu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZ+SGb6C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DA7280327
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769681893; cv=none; b=Ximc0tPt4Ox7OZbaUt3zLzpLxHLlDvKInowtWpX4YQnYDAOjJNuE14jsQ9rYgYPyFMX/U+oL4wWphn1+mT8kiaCwgtYvu+SCpcpAuT5ZOdfbt/qadVmt2ieHIjS3mqi5BP0cqrWWZTQqZi0px3VzaxjQqOdL33ndSsB54caw/78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769681893; c=relaxed/simple;
	bh=fmVB8nuKTZoNDXcyCXt/SFOizDb1FQ0xC37rvDu4MXQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rj7pm0jzEMX1p/Cli+iuIvD7JPaR/EO90NnSdDEIJbjEU6zOh8KT0Vmuysr3XBxwumxE9QJlBOzUseZHFfrwDD1IQ01c25FaIPjQZR4Y7aNnd9yoFPgBnY8RbJljSlYtlwRKD5c4W0s5kFiwU/vPxWdOf4uA0+iOCDTy+KjImOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e5RX6ENu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZ+SGb6C; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60T2oqHe2583474
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:18:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HCEYa7cgOuBIBFytHhgw3xduRbCl0l0EjHqLpkKY/JI=; b=e5RX6ENux33VEhaS
	UQ2VIpSmQrjokykE5eQNpFpmYjRlmbPezJS30LjtW2EUdlZNodiNYMjNjxCgeetO
	0bCoEt8YJJ7H2O4/8aHhU38Orey99XFU8yiC8h3LJT3+Jgb0zpG2YInWpZdMkT6R
	CPtG1wqL31pt4Mkr9GP5My5yPFwvT6cgIgNP7k5rOeoANr6nmJIsj5+GtB/1dEbt
	+h2sHYDgdWzIwkQ4TGxco80ezNioFpq4GeQff/rLlRNgFo37Q6mWQfL2oe0KSt5W
	9KSopcEB+cQfu/qZadPpPAMFSWPR89g61edhf3K4qp+YzCIkzXrLuYaLOaHhs4sT
	vDVj1Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bype8u0nt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 10:18:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8946586903dso2564116d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Jan 2026 02:18:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769681891; x=1770286691; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HCEYa7cgOuBIBFytHhgw3xduRbCl0l0EjHqLpkKY/JI=;
        b=HZ+SGb6CLny2kMWx7rwvL6Sn94UMilueQ3yW4D6qFgJ7fAcPBVBmmyYdgXd15bjxuZ
         vW1Nu2pDMqObseLRfkwE4te/ltkpRP/6Wvw37ykdJhDrGTjQFdXu7PZI1PydIO7taqys
         bY5UY6AWaxGHSTPEOdomzkKixdh+TMeqY24ZItCb9iCOXDN3X795hItSikcuzLTZscFU
         OvJOXFZw7+3qCS6WLPIvxDGTupHkJ9EXJzJef9WBBAvRryqiQsTLPP291RRKrpYfZ+9F
         UsUI7XPaAaY/v6eYtS/oo/haalBQ8xaonWuVlcoIV1pKNie+B4JHtLSQRyX6gvnsjQpp
         6sxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681891; x=1770286691;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HCEYa7cgOuBIBFytHhgw3xduRbCl0l0EjHqLpkKY/JI=;
        b=pEdQl24PePviZuZfVfaNDfbXwvDa0ERmy5FWPcAdMrZv/JbzZI8XhZRotp+DXDe9Rx
         Bje6jqS/lLAvTw4PBmMvixaync9gPvxyPA+TNRYRCOFzXZBW64AVIFnA/2NGDaDm9NsD
         Bet4uiOpReLfpK68kkYLYAg/wpZj7ncLb5Rw/gUsSsMrln9cdzGB+IduVOFIePlFmsvT
         vEAtk7D/fh9/PTLz3QCksEGMmO8tGbFKc9x/HXdjYjE9maF6Y/sHjEZWYJiVWE63XIAf
         UJnr9n6PUOfGM2kD6LGbmNb55f5NxgkuzkkqJaunOzBhyQz6pIdrXROpLjBDjH+FB1Ik
         PieQ==
X-Forwarded-Encrypted: i=1; AJvYcCUuly1nqa7SkrmoVX+DVwxTonv5Y2ur6hBJds7WASSKiZAm0cfioSact8+1o6mm7bCpdFDsSRdN8bQJYMXS@vger.kernel.org
X-Gm-Message-State: AOJu0YwHkb0wxBqCUeRBe41+fkEX6jnPhuxyWALND70LYxbLPiYei9x5
	lQXp8cMEdyBTzZwlY52saMngIOIZRns+8Hy679yAt6A6DSuOKYeFWQX+BfZzwNbnRXCTPDShPMm
	m7lqxsl8pzEcopU1IZhliC3ER1OfZE8acMPF5oOW9xrpc36NQpdJmOXmfqZ3tj1SlywlX
X-Gm-Gg: AZuq6aJ6HwiR7zyRLAE2B8+GJKUs4hzOijoep9cRv7IMm/+Rt57Vg51aYkhvzPqKm0Q
	fvd2nohhTR74UqfUbHrjWfLG2lRSBoqMTZFwE0TjaIkv89jDF9sVcHWQK0cpbTaQO6/n3sroNj0
	xylf05+oSkjIVTm3TKBWfSUtSyuNOyaOvCnQQlP/06jgy131GIQnFjZqtgM9M10sRGMtLr1YACi
	a4tgXosJZbFA1v3RZ+f2Bi9vjkwyDKmLrSLFo+Un97tVmX9fmXFzmJwLJMBZu0Hs1VKTLz5T/oK
	RcvnNWxVXzJe5EA/wizSk5djalPztv2ZD842IN8dFcE5vIgJIsUGD18UnspqBbLfVrWGlg/i2LM
	+tKJkYh7NVlE4xxrJLy1mO7ihmN5WE6psQ6hnI+UmI8gWNGbfbmo51Z8yHjgGAI/PGGc=
X-Received: by 2002:a05:6214:6015:b0:894:9ac1:8be0 with SMTP id 6a1803df08f44-894dccabccfmr38221056d6.3.1769681890867;
        Thu, 29 Jan 2026 02:18:10 -0800 (PST)
X-Received: by 2002:a05:6214:6015:b0:894:9ac1:8be0 with SMTP id 6a1803df08f44-894dccabccfmr38220876d6.3.1769681890476;
        Thu, 29 Jan 2026 02:18:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-658b4256a35sm2707274a12.1.2026.01.29.02.18.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 02:18:09 -0800 (PST)
Message-ID: <7c3646e4-48d3-4b32-93e4-69e7ce439e94@oss.qualcomm.com>
Date: Thu, 29 Jan 2026 11:18:07 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: milos-fairphone-fp6: Add
 vibrator support
To: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-input@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20260128-aw86938-driver-v2-0-b51ee086aaf5@fairphone.com>
 <20260128-aw86938-driver-v2-3-b51ee086aaf5@fairphone.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260128-aw86938-driver-v2-3-b51ee086aaf5@fairphone.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: NQ7IzbPDdE9cCf2Ke5pEOJVkGfmwfvRZ
X-Authority-Analysis: v=2.4 cv=C5fkCAP+ c=1 sm=1 tr=0 ts=697b33e3 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=kndQm4PL0qyBTY2Ci5cA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI5MDA2NyBTYWx0ZWRfX8QjT2yngM5rD
 OBEpzdw+32HZ2zTAgenODWmkXc3hAWUMefx/09kES6w0XKO65yFCoUgFV/+aOGHUUnVab3cYsI/
 9zbX439B60jGDyoWozb1HLaEvoWoMyQUEjdRYS3u2fJ8e1WbkwQjavUcgL/dyxyU7lF/Czeehtj
 Ra2zruJhDFSYTL7wfImo/38tMBuV8SmVfnOQim5IxI7+lAfTIPZsbbm4GkCnsgtT8+ioqmKDRyn
 jrzaAcTDZ5O1BmHjh6zGFO8AnT1S1EX7SGg2BMH8DhrP4xEyA/dkjUCSS+zhMEAwKaCl7sCZ09b
 kYwnX0mpAtwSQIPP+BD7ecZJQlX3oGrc9nfN2kv9R6xmyskagrda0oUdpJndl0dEP7bhJ8fQtab
 xEhOAOcy0e8Ha0h8ovxyXN/Sjjl3qItg+2y3LC1a+MRjVGWnWEW3/ucJC3LgXUU7jwbc2LDucNN
 45cBsm0H+VBiOdecE/w==
X-Proofpoint-GUID: NQ7IzbPDdE9cCf2Ke5pEOJVkGfmwfvRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_02,2026-01-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601290067
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-91143-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[fairphone.com,gmail.com,kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,oss.qualcomm.com:dkim,5a:email,fairphone.com:email];
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
X-Rspamd-Queue-Id: 52EB8AE974
X-Rspamd-Action: no action

On 1/28/26 4:51 PM, Griffin Kroah-Hartman wrote:
> Add the required node for haptic playback (Awinic AW86938)
> 
> Signed-off-by: Griffin Kroah-Hartman <griffin.kroah@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts | 19 ++++++++++++++++++-
>  1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> index 52895dd9e4fa117aef6822df230ebf644e5f02ba..881239d22fa97685206d1fa3a70723c5b77a339c 100644
> --- a/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> +++ b/arch/arm64/boot/dts/qcom/milos-fairphone-fp6.dts
> @@ -625,7 +625,17 @@ vreg_l7p: ldo7 {
>  	};
>  
>  	/* VL53L3 ToF @ 0x29 */
> -	/* AW86938FCR vibrator @ 0x5a */
> +
> +	vibrator@5a {
> +		compatible = "awinic,aw86938";
> +		reg = <0x5a>;
> +
> +		interrupts-extended = <&tlmm 80 IRQ_TYPE_EDGE_FALLING>;
> +		reset-gpios = <&tlmm 78 GPIO_ACTIVE_LOW>;
> +
> +		pinctrl-0 = <&aw86938_int_default>;

Ideally there'd also be a config for the reset GPIO, but otherwise

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad


