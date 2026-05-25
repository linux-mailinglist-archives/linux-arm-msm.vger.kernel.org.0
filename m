Return-Path: <linux-arm-msm+bounces-109694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKyFNoWhFGpdPAcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109694-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 21:22:45 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4AC5CE002
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 21:22:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 319AA3007BA1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2026 19:22:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B9743806B3;
	Mon, 25 May 2026 19:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L50HHqsS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HdAdkPmL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBD437CD25
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 19:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779736960; cv=none; b=ZyLbLHrP43J+RIbmqzNChJtZSCUmXXT/LAz6sI5LCtp6mL/Q2IqKhmMQjDn8o5oSNshKn7daoxwZhI9EUXO18akcD6a0wwIacSsHHA118nKFr/7EZCzbN0QJ4dP1snOi9zWx0a9WjsZQTn13/9iSwaIttoAi6kLSmKsJhidpFBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779736960; c=relaxed/simple;
	bh=K8ekZJA7THTLn3ZUpFVlilgkwvxw/Mw6zqNNZdgLBb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AE6Rl0PlXD8kzUjlZRqDkPXkLi7NwQxTcwNw/7lt76t9WUVHB3kCeYBVSMEcJTd+8qcZ3WU6xRz5jWSsjL+jlezW4j6GMcBM5HDiQUFmNs6oYRUjcAiqL59gQIWZjJaOGo4osn+a4lYnATm4Kp4zTPAOh/r1502k4H4oB7N6uO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L50HHqsS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HdAdkPmL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PE9LGW3796510
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 19:22:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=itmu+XDGDMrVTyuklbP8cmHl
	NlCmn3eMyCh8ieSAYyg=; b=L50HHqsSg9ui0E/noT2ysx1/uqFXvF+x4DPLIobx
	U5FYqYbntnQjCjtsyQbbmdP1URdr9fn0iST52nG51iDqQ2kAhf65YmI2RUnow8Y4
	jx8/LCY7aARy7aSjILqU9JuD+dIJjb6PNfaCFfe9FT8LZdl/IzDnqqzmoP7+/TFB
	Rba8uo9B+Mr2GZSXdrZNkR/UKNCxoGDdNMlJ8/g8jEzqalyy0s5vig22dfVGza0u
	UXu7lSigF1bruV+C4Akn6fnmmqez3sJeplmRvV/Dtev+0nFBRkezk98o8hjvpFx0
	uj2C1KvFq4k1SE1g8splFvw9ocffA7kKXocOi7ZLkTiwNA==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecqx88vs1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 19:22:37 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-95cf2f6a8d6so13925200241.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 12:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779736957; x=1780341757; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=itmu+XDGDMrVTyuklbP8cmHlNlCmn3eMyCh8ieSAYyg=;
        b=HdAdkPmL/McT/VNkYysgFKuZUiWPOCJX2J6l5FEhDVJKngo13pkeAfljPUs8gaVblJ
         R9qqzAmadzIQ2XRnyX87gPlWW/9t5XT8dWGe9JWH+wBqw7sSYsSWWLf0KP96bDiO1bAz
         Jr5DgH+8D5ntbGgt5++Z8avOWL+8vPr7jrMSr+R8wrzIV2n1dIhMl6PMoKMxhPbNRNwj
         bwYcSXSTSav4KmO6xKfj5t8gMnNPUjK6D6J4OOlU6V8unMGzbgFY+rRq1v91eolONZw/
         3xL7KBAsT0lq9MFnM/x35i9+/8/GZdDYbRRjJg7MlqTavgRAOFLoIoMNFhtUfb6x2o1F
         9y9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779736957; x=1780341757;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itmu+XDGDMrVTyuklbP8cmHlNlCmn3eMyCh8ieSAYyg=;
        b=UAhD2XaIAVyL6ZP/ji3FR/o3ttcHNLEtE4qAohswmvtOQ19ijCKCHmr1nkpir7AYZX
         aB48g6pk0S4ZzZQrZ7ChwmtGPO5qDDVQQGdD5SFNB9LU7cPm4Yyz+6lzS1sRSlXO1XhA
         cuvpIRkd/iME8x9O2gLcUOqS0xLESH5Ke2dO84V/3N5+txe8hXw6T9wdyg4O10N9exT3
         giylzMClOZRPUXaDEyUHJf9MvL/RVZ+ZLMbBSWb1Fx8iqZRbZEJ8lTsW/WQa49HUaNoA
         YIFDlLJmeoHNRhjGgdNqyo/+odnpmqbeZaZ1gUGNskyjhovJ9fseL84chFvUgYblFsb+
         EP7g==
X-Forwarded-Encrypted: i=1; AFNElJ9sBQsO69JpjAgULDoA/sIk6cHguvLiw6SMIcMWsAtJbffNK3foLGQVnsm+qXdx5cP4IckViTST/qrGpCDO@vger.kernel.org
X-Gm-Message-State: AOJu0YzllmCfcScLmiwCyhL67K2xxP1Df1GX4Jc/07yZ5YoUCX+0S87h
	c5gx0JsUgrJ/PdOfHa/vcO+gy8BlPY5kvaTl51gjHJrQQUPG/12WfCPji4XFwKgQGUtfZ+bS+9l
	+FINu+rEE1Wun269teY2KHe7Q60gPfAbUGG6XSzWDMxtOVQXhooF55BZz1k0Yy5+Nfggf
X-Gm-Gg: Acq92OG/5Vn26HNKjwUw00A/7vVTj2A/8+lOlzc+VKKdU+d6ZyDflxHy+j3XIw7hd+h
	hcU5Nh1lPsKLx/wfKYnzP4OYjUOAVcg3RuiToxdHJXL8wppbPh3J5CXYFE8aw48biUX+x+VKnfv
	sLh+fbP/lG6b58aJhu26Akmq3lWHq2/tHzS/coHZ04Bx/d75S0czwM2csfKHXpHS8EHwx5W0rqm
	c3w8Og1KPMKKBFWQUBXbbwd1d1qwvlS2dnePGPkHGe3Xv99PCCANY4IyP0gk0bSYONcpyYal83y
	RhVvXujLSqRujX6FsnDUkw+gdT3ZtcCsI9wS9ulOb6WOtAbggHBrTUaIF78xcrdrbOvPVqpwlED
	wIF6l1TrMzKzt6Sng3rLiCwF9MagUB2UKCgIO3o/8YniyxlIimKXqoQRqfJm3ReuXt0/Ev5GgV2
	dfkwttKJU0BQYHb9s5VNwuTPxOQT2BPze1hUM=
X-Received: by 2002:a05:6102:2a4c:b0:631:44d9:2ca9 with SMTP id ada2fe7eead31-673cbd0a917mr6095689137.13.1779736957315;
        Mon, 25 May 2026 12:22:37 -0700 (PDT)
X-Received: by 2002:a05:6102:2a4c:b0:631:44d9:2ca9 with SMTP id ada2fe7eead31-673cbd0a917mr6095671137.13.1779736956860;
        Mon, 25 May 2026 12:22:36 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cb367esm2908378e87.7.2026.05.25.12.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 12:22:35 -0700 (PDT)
Date: Mon, 25 May 2026 22:22:32 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Benjamin Tissoires <bentiss@kernel.org>,
        Jiri Kosina <jikos@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-input@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260519-glymur-mahua-common-nodes-v2-1-9f1b89a3f398@oss.qualcomm.com
Subject: Re: [PATCH v2 1/2] dt-bindings: input: hid-over-i2c: Add reset-gpios
 property
Message-ID: <bz6imhhfysbdqfushdcpmejyskkefcmeed3lqcugz5ajyteubz@dpwum3jv245j>
References: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-0-5c333051e5bb@oss.qualcomm.com>
 <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-1-5c333051e5bb@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260523-arm64-dts-glymur-crd-add-reset-gpio-to-touchscreen-v2-1-5c333051e5bb@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=HITz0Itv c=1 sm=1 tr=0 ts=6a14a17d cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=tnEVqwXQghL7X4JZ1RUA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-GUID: RvmJQR_nhqtU7CesCGsbt1scQ8aAFWaj
X-Proofpoint-ORIG-GUID: RvmJQR_nhqtU7CesCGsbt1scQ8aAFWaj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI1MDE5MiBTYWx0ZWRfX0E7MiZgXtgpa
 8ycYoYnnyygpAnsJsXkRlsE6ci6lcJbk1xVEzw09LAwDK8M0Wfj5jv3EqRL4iV2Hc23nMnx/g5n
 2wCcBUVJEFoRUMFdc4yK8uBPZBpEAWdK88E5pBtR+J5VkGd/FNVvvqS7tQO/ODWjZagLeA3+YXl
 wGsr92W8ovcfMbAXAZIniqQMtgVomAEZdi5gehA+g52C7uvDsY4Z1TeTQfMo2Xn5ffQ2FAyRUAT
 Oh5HOF1FfB/U3SScMcPfgo4BojiI5jQMjm2lJv5Z+9VmUpoujimqQE/HSrFBA3iTRLfS1D+l5GH
 ZCOq87CJ8uh+0+cEF7xPsgTiGhzWIqqQ/ZbQrwFfBvZhowwUvRR7cg83AilnEFi9FqCQpJgIp0Y
 XFpC1tPMhwbrMVBdJG/744Y/rz13wMqgAxZhxGDioO0dtypTF8FKvZ/jq9eCsrWgRZMLJsc7mat
 N82uZHursINgWOeO25w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-25_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 spamscore=0 adultscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605250192
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-109694-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B4AC5CE002
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, May 23, 2026 at 01:25:37AM +0530, Pradyot Kumar Nayak wrote:
> Document reset-gpios property for devices that explicitly require
> the reset line to be de-asserted during power up.
> 
> Signed-off-by: Pradyot Kumar Nayak <pradyot.nayak@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/input/hid-over-i2c.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml b/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
> index 138caad96a29..fe0ec4fce673 100644
> --- a/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
> +++ b/Documentation/devicetree/bindings/input/hid-over-i2c.yaml
> @@ -50,6 +50,10 @@ properties:
>      description: Time required by the device after enabling its regulators
>        or powering it on, before it is ready for communication.
>  
> +  reset-gpios:
> +    maxItems: 1
> +    description: GPIO line used to reset the device.
> +

If you are extending the schema, where are the driver changes?

>    touchscreen-inverted-x: true
>  
>    touchscreen-inverted-y: true
> 
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

