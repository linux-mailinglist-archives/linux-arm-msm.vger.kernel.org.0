Return-Path: <linux-arm-msm+bounces-96656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KrVJBQsesGlagAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:35:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD6E250724
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 14:35:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 521E432B0CF6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2026 13:21:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A11636606C;
	Tue, 10 Mar 2026 13:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TkRo8HVJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d/fzimb0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172333BF68B
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773148128; cv=none; b=D2+ywW2cya9TaHEW0gpmBNHWBPE+90cBXuEHIH0B/4Wpwv4ekcbffCQ5lkhim9wV3vCT/Jj3sp89XBEx+mZ4IW2leO5//royCIoCorBCZL7UJ6wLm9JOT82WICMlAzdsJnk9Izc4dsu4at0TgSFiOTm8KMBMYW/s1vJDJkBQWuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773148128; c=relaxed/simple;
	bh=stHxacrGV9KcZ4zqvwZhJDnTd1vC4ABYqp/A+JKkwRI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PE2i3FPOeRCD9x8EC+MjJhUKE6+BINupa4a6sTmakC+PjVtWKJhbyrQDFrWhymljff7LHFue0VB+0jRpnNCx7pvjC2S12CjcMTKahnPZNJrsNOaR0n1UFcVLNC466oe0A0xVVhWrNZ9RtobLcFJz82UMwyrhmarX4vbk9r4kC1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TkRo8HVJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d/fzimb0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62ACaZl63295899
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:08:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8L7QotNediNGV0w65apbqeaG9lSdLcK+7UQkqiJf0ZQ=; b=TkRo8HVJ/OdwumuV
	b7NJ0vZ1WRCQVVOlOk5E9TNZIsr6cMmBG0uKzqGarvC44Xb3qIULBifw6c/WuZ+W
	HsSjggXpd5Dwjqr/1qcgO3e9wMmWQRyBvoSqYpHgqKtNFBmxps6ZrHIZpXtIk+ZA
	xmCCL7aR39KxPJ+l4xHRqFJTItMuTRdiCdfbqBogBmUM6Mq2rPDUHd6CJDv07Z3Z
	ArD1jeAdHfS/GWyMEmO+QIqtLpHUTOshxOLUfs7sIWRL7XoErPy7+UftOu1i52hj
	wwN7+W2DHY4nm0zG98aIyh+luKMaCfzpkcgHEm5s/a6kEzrvTgsumUWX6pDUfnX5
	Vf9rEw==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctg1mryk3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 13:08:46 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-94de248f59eso1180140241.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Mar 2026 06:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773148125; x=1773752925; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8L7QotNediNGV0w65apbqeaG9lSdLcK+7UQkqiJf0ZQ=;
        b=d/fzimb0aJMQBXdxafcsrZXwJsGOn00vdWpNaHZx7sg0k+5M2h36hSCbspwr0Q+PsN
         2WR3lBmpEg+4Kj7PlYxhiD/azVfBY6Jfr4RIgTAi5A9ueZvecTLOQ7eeilJOk3ojoRxz
         SR5UBwA//LmP+2hRrZVaseRtajVu88XdVcWGVtI5SA0aYIwQDPdvpWQVZ58K3k2bp8zX
         UPdWHi3SSGHtjVV6wYpJYo+/2yQ3LNGkSuH7Vg0nc/yZsNQNHjy/KutW4bxtkKHJYvor
         dTabqnJefUN5g4PfQsOA8YMap68UohlSpNfxzN4VvtZVifeXJtDJMgO8lZY/OPzEko/x
         B1+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773148125; x=1773752925;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8L7QotNediNGV0w65apbqeaG9lSdLcK+7UQkqiJf0ZQ=;
        b=GXrCAGiyeidHz39zZKt9pN1YNYL7FcCTeKjz0bn+p1e32q+cDOWyIH2phmwsWCfT4N
         RH0/idH20wkyRQkgZ/sl+ixQUajlNyBcdyUo5ftec6lvtghZ/ZORBTwFNDsek559n6Fo
         tUziqEeov7PJy2bp9UL6mv6npg861JEUGH2zpvBD8IpnvsZq2oOVEfjoQ3iYdcwkOw67
         2Z2yLjTIDBv1u35Ll/8Ecas+A6RYVLNKvQJCZkc8dJkPdoJIHok7CRuoa2V8/j3ZH9BM
         qVXADu1P4h9YFz3nBQ1lvEI3SYw8MnjgckU5R9ifXue6GRUBPqNR68GNTC+sWsmTtKqw
         xGTw==
X-Forwarded-Encrypted: i=1; AJvYcCVNPygQM6T2snBaW/9b5IyzdYoFaVyRY+jXyh0P/03eCt8JEFsnQsw9EpOcqMeALLjsjc4yVTff7gY+Dq9/@vger.kernel.org
X-Gm-Message-State: AOJu0YxTEMb0FI5xPaKa3bHXH6N74u325snIRNVARna0iYbWJ2qAgWXL
	Trx3V/V5aPL7he2VKKrKrWG5gOZniqLR+2jMdsLHflnDc6OItVnu7bjZyqHfIG0v0LZzlB427Ve
	IQ9MiXksGFVG2uv0WfNdyYixcaHutNwVLv/nkJG6N0e1g8dLJE8soLNJ1LktPmIiYFnJb
X-Gm-Gg: ATEYQzy0NYt0QYUKV07hjtBEw8SxG9/kDR4MeE0yus+RuTOkU6Z6WtNLMF+hPsMnzil
	SitFAZgP87THRuHYKKNmmgWAjg/QzV7CQEVnHjse7nlxx3KhWPMqj3Guu3jNrJQ40QCJoszpLtt
	1KrLPBYRf3x7QozEUIoq4Dg0N0JjXo8zIEay9eLR2XBVFaY/ADb8B0RPq+pVWmIyT3n7FnX4N+x
	QrmSMvBqa8g42KxV4eF9iLg/tWrJwbKu9WFY3L4sA9JquLfNtN6djGok9Nxv37YapAkfpk2IE0E
	bzB2T3TAp1a7nLB5vvUZm3rZ/O28YM5sCXzORs/bn8n0T0imjkbC+ayC032cKXDdpFiS+GxuFXz
	OTSgbm4NH80AnYDyGYeeqIIAmnWJASTre9WCk9DbEvqmkOQanTsvxwKJ97TbdBXpntLY8wgCI0V
	J0TBE=
X-Received: by 2002:a05:6102:50a6:b0:5ff:d7be:fdeb with SMTP id ada2fe7eead31-5ffe6391715mr2638049137.7.1773148125403;
        Tue, 10 Mar 2026 06:08:45 -0700 (PDT)
X-Received: by 2002:a05:6102:50a6:b0:5ff:d7be:fdeb with SMTP id ada2fe7eead31-5ffe6391715mr2638044137.7.1773148124886;
        Tue, 10 Mar 2026 06:08:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b942f139e24sm488542566b.38.2026.03.10.06.08.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 06:08:43 -0700 (PDT)
Message-ID: <f6029a8f-07d7-4872-813a-ff98fd11b5af@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 14:08:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/6] arm64: dts: qcom: msm8953-flipkart-rimob: Enable
 touchscreen
To: cristian_ci@protonmail.com, Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org
References: <20260308-rimob-new-features-v1-0-aa2c330572c0@protonmail.com>
 <20260308-rimob-new-features-v1-5-aa2c330572c0@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260308-rimob-new-features-v1-5-aa2c330572c0@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=YOeSCBGx c=1 sm=1 tr=0 ts=69b017de cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=sfOm8-O8AAAA:8 a=SwJZ1EMs1T1tlsjO-F8A:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: NdNRk0CNtJe_gXbZW88e2NQckxPczbQL
X-Proofpoint-GUID: NdNRk0CNtJe_gXbZW88e2NQckxPczbQL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDExNCBTYWx0ZWRfXwqWMSHroTHwc
 HCYVrqU7sUqvGkmvvAN5fGLji2QTs4uZptdsiSySqs/2R+a5iz0es6Kq7kDKIiMczL9RQQ8vSmo
 GnE8J97gtuDwGqIbevjswdIQWoRJ3E9o3Uop9igq8jJMlM/EzPe2ytEywxzD4BdkXqaTDXAFJyB
 PQAanmaw282lYTnU3P182Pn4VYxS5aJphWHml8bGl0fIBNxWS5uBM2eQdCgKcxOM/ndE7SHkcqf
 aTzN/h/urtUi3/3OOem8mNz2gyloeofsSWqvDthZY23yDrjFyY1hwmMMM7TwORu+h8dEY17oEdW
 OzGx6FZct88vulaQufoVgqOLZLAoGqODciN7vG1+F6j2+LAA8fGX6D6ctlCJ+AkmdWlOo28mDmf
 AGbvxMTeOIH3zpyU6Zet0vkeFDbvlumGq5hLu2kKsZWEKeWUhPehJAgsfrdT+ypuu67Z6/mvOoM
 tYPVRDuFZg23AqRwVrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_02,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603100114
X-Rspamd-Queue-Id: ABD6E250724
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96656-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,protonmail.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	FREEMAIL_TO(0.00)[protonmail.com,linaro.org,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
X-Rspamd-Action: no action

On 3/8/26 4:52 PM, Cristian Cozzolino via B4 Relay wrote:
> From: Cristian Cozzolino <cristian_ci@protonmail.com>
> 
> This device uses a Goodix GT5688 touch controller, connected to i2c_3.
> Add it to the device tree.
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 32 ++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> index 7b2849405462..709ea6fc9fbb 100644
> --- a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> +++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
> @@ -94,6 +94,31 @@ &hsusb_phy {
>  	status = "okay";
>  };
>  
> +&i2c_3 {
> +	status = "okay";
> +
> +	touchscreen@5d {
> +		compatible = "goodix,gt5688";
> +		reg = <0x5d>;
> +
> +		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;

interrupts *and* irq-gpios sounds wrong.. and I think the driver doesn't
even consume the former. Trying to read through some of that, I think
it's on purpose since the IRQ GPIO is repurposed for setting the I2C addr
(which nota bene doesn't match between the comment in that driver and this
submission - perhaps that's just a SKU difference) during the reset
sequence

i.e., does the touch work any different if you drop the above?
does /proc/interrupts differ?

Konrad

