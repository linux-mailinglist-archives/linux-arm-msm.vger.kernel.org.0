Return-Path: <linux-arm-msm+bounces-103599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eEFMLAWu42lTJwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103599-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 18:15:01 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DD74218C6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 18:15:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66D1B301014D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 18 Apr 2026 16:14:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337352F49FD;
	Sat, 18 Apr 2026 16:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R0WPyK36";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f9tXxjN5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F174F2DE709
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 16:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776528898; cv=none; b=QwjKp/SzJLIDbkHLqjWNL8zt67mlLYMHxD3Xacmh62Yz5qMgO7+KV++TEcr1fN2Ptq7IlI+/zmTkyy7Yj9dd9MT8Fc7J9+uIdcDD9/W6d8ZpJ+4CunqCrUfuWubLNiMhdmvVOPn09GCWqHcxJiGYJD1Dphz/u2WawLxmuY2kiLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776528898; c=relaxed/simple;
	bh=RXY6uhn1PhkRtSRQHLs4Vhi5olIFFSfIcU9r56yxy+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r0swVu617kzwP8kNjc+5y4te6yjtpfMIeSOrk/bBx6oRvgqfXYa2idkK7Sx9NlbJtUpwYxpO6EdZJ/G98UBCytICdc+q86wLhpkQf8ZMrnEGM7w1IEBwkudkMiSXACUG1cNyCbHVs0lfAMMCDZO6WQJq0Ao6zACvPEolxaICqug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R0WPyK36; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f9tXxjN5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63I4dsLx326469
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 16:14:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T4OL9g+C1Omw9ZPu5lOcBJPG
	k0Adx5HH6jKI0OnxRy0=; b=R0WPyK36njYCeJ8yFG4SfwOmrz7OME4IcGaXU3gO
	WH8BYU2f6cX1k4gMxGmb6N5BQgg9XqkMKtSzrpLzu3cCZCRA7ojE3Te7sSXjImQS
	K9OxccmJaCV5YcXVRTndUnXmLsxiHiRWQCb+/o8S2NEtYEpOTLOhpUEe8XbKxm3B
	a00eYBtsq2qgMG8sF23hlVLvlmy5l+bMNv4cCbxjjB1Zqj23icbrobaZvxbQYqTv
	DzfkBCvzuVmab7gQd+IjQFdenEcAeozf3SSK1Jl0EBYP+JFJ5qmIcqJwEDlNftB1
	Wxle0VIwpGv9l73nyhQ4J4ZB1OnBfdocdE5zIdR86aNtOQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dm34h91e4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 16:14:56 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8acadca1ac4so52802946d6.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Apr 2026 09:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776528895; x=1777133695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=T4OL9g+C1Omw9ZPu5lOcBJPGk0Adx5HH6jKI0OnxRy0=;
        b=f9tXxjN5PrI5EUP/7zghmr5yk1mPctwzjRAURrq/AKxDMHcb6ugjBL3eaZA9uMoWkR
         9qHkyc+tOZRAnT+q8o7pJ0f7nWqdcPY150thNvyuPZK1iLjfnrjfVeul2ZAnp/CyKciP
         Aelmmoo9SUTj3OQd2D4E7RCj/BrChgJYIfBulizUFR4DeFTa1Q+Z/xzjJbxUd4N9yIj6
         vSfzb2bg9SYqWXqbEOM83GQHwXZTuU9YDZo9VUWaXVyHaQvdEo3Ey1qWxXMQLjyhWep2
         n0XtgXw5d9J6KkNP5rS4ny9RdTWcaWmC0spO15Um4tDwQHhqpLVHUiGKVBUtA0LJOeRq
         zBYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776528895; x=1777133695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T4OL9g+C1Omw9ZPu5lOcBJPGk0Adx5HH6jKI0OnxRy0=;
        b=iwdABmsZtEZ7yMZFnbLJMQpAFNCktyADjKhDhAtOoDmLw6nwkZ33HWiAO4kF7u3p9c
         f+UV0ar6fd/eplFRermEAql3Vjy/imuidsnHL9TzII4O6f5cV4InZ/awkvZ2nYta655A
         /6/N7GTbzWdVQZnN2ujSHFr7jGuayIblxcP8c4PVvGn1zTg556DNGQllfDu81FUyxT6X
         03WoCMea5/i0x7uGQXOd0BYz2btH3L3DxULjnfpp+MPMxh9jaCxVftm+CogjbGBHi8tZ
         icMWVS7Z8jFqlvtXjXLKTUmCuqupfMp5vhNrRUL0QqLCWmOExwsSKOdsLdB5/6AnhW0j
         nclw==
X-Forwarded-Encrypted: i=1; AFNElJ/EuoY9ZczOoykqtt9l4hZVFAgKErDp3UI4LSQmknwjwzPvtcvVf7hHjXmZnAqjw9VaqDTS//FTRX50Ukrp@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg8NfWlVwvBvvcs80ePgag0M01dqCxGXb0hpsIW23xaOnPsAci
	x3Wv9/RTsNZjJNebMBNpyh6o5KPHqZal90rgQLBt3MnhD3nlDhZYNncKshLukfd2s1wtq6l8rgp
	r/IU7Zd+8fOuan3lPbh7czirB06aEikuO6lMXjoSM4K7bnFV4EF3oQmgz4cJiTtRHsKOQ
X-Gm-Gg: AeBDietVmIPv+b4iirY1iU/42Q+ZeoSjHMAo+0UkCcLqldBI5RKprM+6Q8UvwENRs81
	ScecuEsRggGp5Jrtc31bSgziTptRWkZ6Os3AEfkcgpPLIbPsNhUID/bRXliH0csAb57xvE6DhvA
	VVJEZ1SDfUGAcmg4y+k77L/oQozn3jT5pc36a+CXfl5VwElbY5eNStHYmOohvMWwmJYb/aoTIPZ
	sEKRj4NsE2yPLqDg5u2b8q4gtv/NsaxArAMgPJzAhX6RxY0soh8Xrwu1L+9jC0VHpleburg66Om
	PIJYO2jBqKvI1rVO5rjSMBQr2iJoNyje6E3fWEa4ABb/y2n1tF/0BZi9Iu1jhjKWTnyas8ZOw2S
	iQ6pxSchPYSeHKMRRk5btAtfn74hz0O5Zc3WXCkJGWkQNwYpjSgwqpHPhx8IyWHhf9hoUW2Nw82
	hA6GXLD2VJ0+LLToW+pt14ueaNNxxLrskHfP5a52PG4MjurA==
X-Received: by 2002:a05:6214:4e08:b0:89c:d886:c022 with SMTP id 6a1803df08f44-8b027ff9304mr101769306d6.1.1776528895273;
        Sat, 18 Apr 2026 09:14:55 -0700 (PDT)
X-Received: by 2002:a05:6214:4e08:b0:89c:d886:c022 with SMTP id 6a1803df08f44-8b027ff9304mr101768646d6.1.1776528894785;
        Sat, 18 Apr 2026 09:14:54 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4187e7d80sm1424400e87.68.2026.04.18.09.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 09:14:53 -0700 (PDT)
Date: Sat, 18 Apr 2026 19:14:51 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: linux@smankusors.com
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        Rudraksha Gupta <guptarud@gmail.com>
Subject: Re: [PATCH 03/10] mfd: qcom_rpm: add msm8960 QDSS clock resource
Message-ID: <wmmqnkq4btllqnp3zyto4pqtregvfzxv2ix5consrcbejozbvi@kxheanez7ovb>
References: <20260414-msm8960-wifi-v1-0-007fda9d6134@smankusors.com>
 <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414-msm8960-wifi-v1-3-007fda9d6134@smankusors.com>
X-Authority-Analysis: v=2.4 cv=J46aKgnS c=1 sm=1 tr=0 ts=69e3ae00 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=wxLWbCv9AAAA:8
 a=pGLkceISAAAA:8 a=dr5hlnbD9tG76DwkopAA:9 a=CjuIK1q_8ugA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-GUID: EenKMtBoSoj8EhYJN5xsQWKwluTLjgMt
X-Proofpoint-ORIG-GUID: EenKMtBoSoj8EhYJN5xsQWKwluTLjgMt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDE4MDE2MSBTYWx0ZWRfX5+uzRLxt0vgf
 3e1Cm9PN9A28jP75Oo9rmqRBSV0/NAoX2qrEdwby4v1exmZOw2IuPorhFPH180YW9bhfL6czNuk
 +DPTQyxt2U8gaFQwTh1KKuo+Cns4Wjz9sj90i2FUO6kEbJ9zrj+xRum8wh4o3+WX/3nk+aZbC48
 K4dYmZ9oAuIhkjMStjeAIXF8lZkVimMBdEqLrqUBsxKOm/uY13o/VuuAu5uDGF1kQbWuDTcaiKg
 kV3nDMUG9KrEu6/kI6y+BxsX5QdKXPkEBwgUTp0yus9Yg7s4S324T8Fs8Q5ifRT60lV+TcySq+s
 lap+D+19oYk7hJ2MRjnJK4CPxsMy2xpZDVtq7TNFFlKDWG1V9/TIoxZxkqWON7j1DxWEpb+DAe+
 KLNuZKNHQl5Frf5sYOQutnT9zqHDRdk4nGzXqBmdfL4tU0tbTFa1vQDf9SopoSdn54/jyz0UR5t
 DgQlHJXakAu4w1FVDAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-18_04,2026-04-17_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604070000
 definitions=main-2604180161
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-103599-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,vger.kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smankusors.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: D6DD74218C6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Apr 14, 2026 at 01:55:30AM +0700, Antony Kurniawan Soemardi via B4 Relay wrote:
> From: Antony Kurniawan Soemardi <linux@smankusors.com>
> 
> msm8960 uses the same clock descriptor as apq8064 but lacked the
> corresponding QDSS resource definition in its resource table. Add
> resource ID 209 to msm8960_rpm_resource_table to match apq8064's
> implementation.

I'd rather drop APQ8064 mentions from the commit message and just state
that you are adding the QDSS clock to match msm-3.0 code.

> 
> Without this entry, RPM clock initialization fails on msm8960,
> preventing Bluetooth/Wi-Fi/USB from being enabled.
> 
> Tested-by: Rudraksha Gupta <guptarud@gmail.com>
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/mfd/qcom_rpm.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mfd/qcom_rpm.c b/drivers/mfd/qcom_rpm.c
> index 27446f43e3f3..0defb3279af1 100644
> --- a/drivers/mfd/qcom_rpm.c
> +++ b/drivers/mfd/qcom_rpm.c
> @@ -324,6 +324,7 @@ static const struct qcom_rpm_resource msm8960_rpm_resource_table[] = {
>  	[QCOM_RPM_USB_OTG_SWITCH] =		{ 205, 119, 82, 1 },
>  	[QCOM_RPM_HDMI_SWITCH] =		{ 206, 120, 83, 1 },
>  	[QCOM_RPM_DDR_DMM] =			{ 207, 121, 84, 2 },
> +	[QCOM_RPM_QDSS_CLK] =			{ 209, ~0, 7, 1 },
>  };
>  
>  static const struct qcom_rpm_data msm8960_template = {
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry

