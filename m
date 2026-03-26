Return-Path: <linux-arm-msm+bounces-100072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GKLWMj3/xGny5QQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:41:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 856D733279F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 10:41:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 416D23065474
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2026 09:40:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE0BF348866;
	Thu, 26 Mar 2026 09:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PBtpIHcz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="V/Y5cSgz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE7F7349AEA
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517998; cv=none; b=AGVxbZeWTDFP16jqDQxn+cnkW1bWyE7yL+SA/PkRUNQ7Y7RhrO63RyuepJ85s/aUNYteEAHuY6UyTfdAeqRbwqrrCBnr9q66RyCMaHqOhvAWTTFxaj9nX+OtS/za8PlONbJqxeCZOJkmg2f12Pgjc0LUgSV+/tkS4Ae5+803OZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517998; c=relaxed/simple;
	bh=X0urmZHdfzvXbY8NoOrHIuzCFP2iZaoFZvgdfLjlu1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eN8NKHhhHm7cyREK1ZFVs83WjwlhNr8TaRjU9Tt130n6jooRRSRFP0K1ZE+Hfa+3WmC4rTfSJRb3H35/vCmY4FsYHANiO8CowCeVGpcHCc0YNJQkI0Ra9MaPU8AIrc61XFQCtRA3rPAxWUGPYBLW682/P0RfsQ6Ss4vh+pcjVRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PBtpIHcz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=V/Y5cSgz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62Q8Ac171811320
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:39:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mR8ASKRWnoz1OPhG3zfVHMmRoxmkWULo04LqB45vlsc=; b=PBtpIHczdyrevmQl
	BeL9I8yTP0fa/ArJfwHQ+AnONo4FydKH1//vkEq2e4qY4CrJWTKcLPFrbZwVr07K
	9vhvDgZZd/Ol4u+H/bbv3irdDXyLbrpMnPuGJDJblSqZpY1Z7Hto0pPlj2S/Wo1x
	4Sh6WiQJtnIsd9j7aNuUWFTMIEZt7Um6T6vhwclUfDWZG2xrAcT8LBVg57MuKUsg
	XrfO2Wjasn4xR8GgSLo+EH1xFRD+4q50LStqGMRKrApnkNo4vn+We6wgZInY2I2X
	gifpAueI/+YHKpslK6QX/QZaU1Mo5TMPQfz4+AJ9hxpBU97rs5uYA/fq4tYnOdmS
	S/knZQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4tkn1mdf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 09:39:55 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cfd003bfe2so26535185a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 26 Mar 2026 02:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774517995; x=1775122795; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mR8ASKRWnoz1OPhG3zfVHMmRoxmkWULo04LqB45vlsc=;
        b=V/Y5cSgz1b+arjKTut5rr41OZ/XYglUY3XymGErlrWyg5B5gIYYsVLetXOrrFHiMGZ
         7yw1KTibAnhnJI4juhswn4A0HOHItYRVs+ckx8aeK+NL9IMBcvEeWnAa75S/pPp73v+z
         ElgJX6/fOB/HJBbRkkvicnaWLENu8wFoNlLl3LRIYmtVklwdzqKOUzvM6atN2l8CY+Lx
         DnIlVGRB3bHbIW5IEn66QVnjWwipyUiI4wTytG9K8hLPys5dl02uD01URBiECRl51qvT
         UCuaEOuftr07H4gOfd5T8xI5KdhlBIp4rviafJmSl9HHUsLQTyJBMasc1lNS3EDZghrO
         5QJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517995; x=1775122795;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mR8ASKRWnoz1OPhG3zfVHMmRoxmkWULo04LqB45vlsc=;
        b=D4j2sH0aD/XTSk21y+HcLERJxDKIwAaEJ5n8NE6R3VjISVU3F/m09ZHCpBzTrpsUSZ
         UgP4+CFCgjxaOiVGwrv06SkA58539/VRFLBZEZ5yLoB7iBkGR5Tdxjp9j6JPeEMQqas1
         I6JlHeLxL92xJNAcudiqEgj9l30rcQyG432c/eOs0brzLIXjXstckyc5It4xL0Z7DTon
         FxmQpzXbud4ftkLegMi10VBq9FHTIhvRAIaIqUI/000SZFsgJkKziV2Z3Ml4+FOuyCqS
         7l+iZb7r4dc+xXEGBKS1XPLQug3HNNMg3MlVXnOUIb3zGOAxh7fp8A/UtvUeHe1RjcKH
         pP/Q==
X-Gm-Message-State: AOJu0YxavogMHLPeGrzUf7lpM01cxoIRQJPmiI1GEFEsuvLCneE67k/l
	NR0/ZWkpx/rCUBOJbLBdBpUFBf04A2J+UNh8Vz/5qNE4MZADNje2CedobRUcSnJoNkBE62C69ce
	whJxe2EsaZ6CWRsLePB4bCwqUoLm8C9NjG25dAbZzmJZ2GfPYnVtjRv+U5CA47gugw3rI
X-Gm-Gg: ATEYQzxxE4Hu9t24QzANlbkNu+TXr3sNgWcmedDPfzftDiV+tmnvX5CbC9t0hcLGLUn
	i3M/y6KiAV3aCh/n7AlNG7+q3k1yaJ5pRzKkZmeJ6211XP8NdRDJu3AqdQ0idMhMexMTNon0OV9
	+xIfai7uNMqAS/Ptz9JP82tGlE432waf0mEprV8azq/HUeIcSoKH6POs9XP2+FYfNP41/aeTZ/f
	2Q6uzTrRX9x4amXthLgtwYgzYkwv+RvbC1TuYjgqIIcWDjuA0dTncp79Im/AGDlXTeGlH9rFdM7
	zznDvQHV4GBIY1msoiTgq1PJbFDbxbd5ROcwkTVUk++o7J/94yX1Dr7G9XcQq6/bA1pBEoH5VF+
	iqWdqJEGfMiGtVAAywRZXpDFRRUKw3AIk8ZIpcwHeJFI9uBaqg7H8YNGVlQTTFRVvSxBiTrusYR
	fRv8M=
X-Received: by 2002:a05:620a:1a22:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8d000f37c32mr648083585a.3.1774517994911;
        Thu, 26 Mar 2026 02:39:54 -0700 (PDT)
X-Received: by 2002:a05:620a:1a22:b0:8cd:b2cd:ed4 with SMTP id af79cd13be357-8d000f37c32mr648080285a.3.1774517994404;
        Thu, 26 Mar 2026 02:39:54 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-66ad6a6041esm837284a12.28.2026.03.26.02.39.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Mar 2026 02:39:53 -0700 (PDT)
Message-ID: <9a61ad79-b787-4b83-b7dd-2ea36e7cea81@oss.qualcomm.com>
Date: Thu, 26 Mar 2026 10:39:50 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] Add vibrator, IR transmitter and USB-C handling in
 xiaomi-ginkgo
To: Biswapriyo Nath <nathbappai@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDA2OCBTYWx0ZWRfX1k5bShhSxp+u
 +0n5p5ZNsXzZtPDPu1hEtR+OJ8qs4AXjlzBQiV/OpripRgcPYC6kiRbOv+BzSAllJphJiGbtIOh
 v6jh1v0PX+h2T/mOWam+RBT7Ort3/PPCqx/bkLIa6okAoPxhQQMiTjFeapezLhl4xBEpPiQwFsp
 g5KLAMOWIsoShuO08Vvs0UpafhsUMERMN61ONS1JRwiY6fSq+oX/xVlZOmcK2X9cBIazwT0OXI/
 3xfzLAY4IHDUM1kGwsxpb9Y2WvvPd0BT5EMYd4Lf1nueqkb5P4VJ75rup9Fd9WnMGp1eCPynNWb
 a/exNag3vj0/Q7iG02GK18tyyMebKquYH2Y9xexogbXc4v5SlUV6J6AX0nh+4KxEGvn+6D5xdXw
 ODxZ10YK5XFxT9/qETt3gy70Jh/ugyDCmlVit6+vDDIA83bHmSnvzjxTW0wktf+pzxUKUvidiGv
 /pNgnBXx58epIrFC3NQ==
X-Authority-Analysis: v=2.4 cv=It8Tsb/g c=1 sm=1 tr=0 ts=69c4feeb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=2_2y1rQ6RNr2V2Z6SLcA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: ANTCKClmJ9N-kO1UoZDVDB2EksejJDbi
X-Proofpoint-ORIG-GUID: ANTCKClmJ9N-kO1UoZDVDB2EksejJDbi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_02,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603260068
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100072-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,mess.org,baylibre.com,somainline.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
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
X-Rspamd-Queue-Id: 856D733279F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/25/26 7:07 PM, Biswapriyo Nath wrote:
> This patch series add support for various components in Xiaomi Redmi
> Note 8.
> 
> Most notably:
> - IR transmitter
> - USB-C OTG
> - Vibrator
> 
> Also, fix some bindings warning as reported due to previous commits.
> These are tested with linux-next tag next-20260320.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
> Biswapriyo Nath (7):
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable vibrator
>       arm64: dts: qcom: sm6125: Enable USB-C port handling
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add PMI632 Type-C property
>       dt-bindings: leds: irled: ir-spi-led: Add new duty-cycle value
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Add IR transmitter
>       arm64: dts: qcom: sm6125: Use 64 bit addressing
>       dt-bindings: clock: qcom, dispcc-sm6125: Add #reset-cells property
> 
>  .../bindings/clock/qcom,dispcc-sm6125.yaml         |   3 +
>  .../devicetree/bindings/leds/irled/ir-spi-led.yaml |   2 +-
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi |  56 +++++++

I'm assuming all of these changes apply to both ginkgo and willow,
which both include ginkgo-common?

Konrad

