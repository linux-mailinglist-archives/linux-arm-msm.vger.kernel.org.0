Return-Path: <linux-arm-msm+bounces-118288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o7pNArXtUGqJ8gIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-118288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:03:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF1073B092
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 15:03:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=YtS8wmN0;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=dnbWgqr2;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-118288-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-118288-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 072FE301344A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2026 13:03:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BACB742B745;
	Fri, 10 Jul 2026 13:03:45 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E8342B335
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:03:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783688625; cv=none; b=OnFN1gYYWR9P1U/vT0sE+OYW8EGio3JpV9gZDW/UxAEIZlMDbqaAYlUowJ2eYFlyYLUbRJ+o2PT7GfNJBdAfzsk/PJ+HEgw9KR7kbUPgTrGcSG58BIxH7SMIcglZWnLAEcqH7bNvtXghEJ157uLpHfdiMx7uKEXAZP016yTeI/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783688625; c=relaxed/simple;
	bh=YamR9oqNlWWWno0Tn6QJ4b9+RoZA1dn7WMh0CvPPxrA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MzJ8fvhfVcK2+o5Gp5pvqNJuiks5efqvFWpjRxpS1GVbZT6WCzOTkAdaScwm9cpG194adsuPZ/xV8VBChR1hQb7+CFccDd1mU5CS6jSXK/pa9HGsJ1lbrrWI2FDUeXeFaCIf7K6AIEqKt1rR6lsYB/oIO4yr1aBnORg66gNQvts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YtS8wmN0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dnbWgqr2; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AAnXji571220
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:03:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rr4xiuhS7FLv+r+GhP7nNQYp+W0EhuOVs9L971OfFDg=; b=YtS8wmN0NnnHqnU4
	b7kNfYw2IAYA6jymBvG/Wwscu8B9i1IukVQUY2N+TLgqnhWQv/ihi77mwDavC0eY
	nYc0kny2+2s9PZkFmg39wDDN6tS+Ly/9tb0PfcidtdpmCTLekWiZTHeRH2kSp2Xx
	L37Y41sUyLsgpeewQRUAk3u20GlZcUJCskB2kJpNtGwVXIPkxJICjVntMsb9kSnl
	Rn0KwnNjfVrgj7BlIPY+tSR7TkxqBdDkO0oYElY7F7JozxHqQAkXJxx+X67xIcFC
	WNjLVDuVmaB95MoPqBIVq7cjhOoEGMELe+nAwge13deUeyWSHevzpsG9Er49zt6w
	ITDXfA==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faxyg8h5h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 13:03:43 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e9f6384168so221358a34.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2026 06:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783688622; x=1784293422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rr4xiuhS7FLv+r+GhP7nNQYp+W0EhuOVs9L971OfFDg=;
        b=dnbWgqr29ygNne+Shu1YsyOeiFy1WE/oPi2JeScaN6RiL3ecaOzZL7pVkqPU6ZVbwO
         I/3MavO2BpVYRv5Gh35ubnV4FPbhG5gDPQszWXubGAkOJJO3tq4Qxa6XJZex6gLv7NnN
         UKbMZ/uqsEpm7/OIhtpkfOBmfT4WanpY3//nPGGTi5VTB7sODoN5GyOCsBhBZ7B2ez3y
         zR0Dd/J33Xn6AGPm4OpkBlVJhhRSs6wJtt/oU0CdaQ7v4dhWEyvrSLigABICfyuSJgUz
         EMJfq8yfoI7F+f/73ouGZzM2T8Sq8d8uwpuyncolfOITV+t05DaU3UVRTNu0m4znG3Wr
         YxgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783688622; x=1784293422;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rr4xiuhS7FLv+r+GhP7nNQYp+W0EhuOVs9L971OfFDg=;
        b=WzNfNVzUkQd4p+1KqOEsQz6IwuZsDMtKKDzudarM5FI8zUerc2B9HYB2N4mif6Kf0H
         n/F095TYBoboAUfc8Lsde793NLx7ln2u2u4kBUwLT5t+4bpL3VbqOay985kK/ac5p8pX
         zpTqDafZeLRsOdkrIayEhSCwCk9bnQ0omMYy/MqFIlXFrlGFgHqo4SaHEt4z9TWgtojQ
         dyqRQ9wRg6hxI+0aYoRg9hQPoMUkCoMak2xn0oontdV+zaQvagI4kqGZaoQPy/2YgQ/x
         rj3c0GnenJr77JANneU8fsW/3tEFqUNC0iWg1/U+VtIQuZoovsIqRbqBqHrPlFNQ5BSo
         Xn9g==
X-Gm-Message-State: AOJu0Yw/rXmynMEzksGiLgWJgzT23nciuuIEqVfNJxIoTw4xMKolS88y
	x75hp6PQOLgn4/SE14SGT53Obf/ug2trt/ICjIydv1ZaSUX/cg1nDCmwvjKZTWYfrhJJczkoH0M
	Wl1q5vR012YCk4BeATmXRIRAmA2iPdreltxXvuLVUn+pO3YeQ+vopeaGePCP5HiWqtTe6
X-Gm-Gg: AfdE7ckM9doisv4rTWQIkjBJr+K3qRtuGJ5fnFJCQGOLutE9n/x4frMvS1px13i57Wi
	TPfFxBLo6AFQuCMYJ4jbNIp0M7WXenRo50StQN3xLEyCVmbzQNDsunhxw+DniKLgw+GuKJ68xVM
	3QhzENbsMa9ZLwCGmklIOam0m2SEyZDYm9cDik5Yd8s5XXDXh9fbHSAZTlpnKex/U6sP5DNiTLK
	EXzChfhPWnl66QZmE+nAwEldZsCiiJ83uuKaF6ELTBz/whFdkzp2XpVHbiXRnJI/9XhZXLsyoxF
	jVDcDbE4ZwrFcXXwHWC/ltOv3RmVDJKuolafK67MfjeVa3Rc/3vEfGWO3Tu/1Jq+iLwbw7Fbr/I
	08++WKDP9VQQEmKvNR32GrQhSQjQ7E+DxLpE=
X-Received: by 2002:a05:6820:179:b0:6a1:818c:ade with SMTP id 006d021491bc7-6a3790ebc63mr2866978eaf.0.1783688622364;
        Fri, 10 Jul 2026 06:03:42 -0700 (PDT)
X-Received: by 2002:a05:6820:179:b0:6a1:818c:ade with SMTP id 006d021491bc7-6a3790ebc63mr2866947eaf.0.1783688621765;
        Fri, 10 Jul 2026 06:03:41 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c15c63c04fbsm450890566b.23.2026.07.10.06.03.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 06:03:40 -0700 (PDT)
Message-ID: <52d5bb82-dd01-434c-9a63-319694e28c15@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:03:38 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add PMIC thermal support for
 Shikra IQ2390S SoM platform
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>
References: <20260710-shikra_adc_support-v3-0-ddc840fca0a0@oss.qualcomm.com>
 <20260710-shikra_adc_support-v3-4-ddc840fca0a0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260710-shikra_adc_support-v3-4-ddc840fca0a0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Xa7ceU96Se0FD9DeUWfmP63Ecz9CWIYx
X-Authority-Analysis: v=2.4 cv=PLg/P/qC c=1 sm=1 tr=0 ts=6a50edaf cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=RXrNB5dDG2c-zWUEkKQA:9 a=QEXdDO2ut3YA:10
 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEyOSBTYWx0ZWRfX51gM3o5EEQYz
 4B4q5VhaWKUH5htTZUBgsmT9zSHx7QcBC4mBT9ovENedZhkCU5MkqFmG3tCEOzaWYAjeTMVEzKR
 YRpmKDyM0dWbdcPH0eJcpqcWw2I3ziE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEyOSBTYWx0ZWRfX5hkx0EO17kRY
 5ZlHpzZZ+aKZMeOWbn9W5UyQRB9qxCFJGz8xK3ragbt2WAlW+YOpZMlZBAaFxt0nqL8mUVf5CEK
 2WShBXCfLsTh8vxhbvgbG11dTNvVj4CWRfPgo6V7m/XQU8zS0InksIfaBNV4xa9k7Jy9hZ6WGJ2
 RdSMwAPHPoSMy4+X5LQdU9vhHVqeqFYCrBwjtkNpEGgS0ooiOcFB1WeymzntTE+8UmpPvsUEE9I
 rHoBua02qxhPwNEeYnJtP0B3sF3LaVll5Ga9puqKVWTvY0SY+SzgaLwm7lcgc40BkkdevstM2MG
 0RXlV4gzbtjzXqxFFF4GgjEHu3NXLgbW0Wc86kYXZCGuAY3EYvWWsDFiB3gP6QNpTU/3j13jqXu
 f4t+7rHnwNwkkSXs4XWL3aqnQ0+TaQqO3XIsMLzkrjjDNlOuiLST8zSsKrcQSKvBBm1bcU1MjOb
 7fE21sq+vn2gWMqOkqQ==
X-Proofpoint-GUID: Xa7ceU96Se0FD9DeUWfmP63Ecz9CWIYx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-09_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 adultscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607100129
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-118288-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:rakesh.kota@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8DF1073B092

On 7/10/26 8:52 AM, Jishnu Prakash wrote:
> Add ADC channels for system thermistors, used for thermal mitigation.
> Add ADC_TM nodes for pa/quiet/msm thermistors and also thermal zones
> for them.
> 
> Co-developed-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

