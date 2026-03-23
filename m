Return-Path: <linux-arm-msm+bounces-99175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2Em6GZsOwWk7QQQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99175-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:57:47 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 756492EF81B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 10:57:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 121A0301080F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 09:56:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 29DEC29BDBB;
	Mon, 23 Mar 2026 09:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YX9t1XUJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="KP692iWY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C936538643C
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774259783; cv=none; b=pkHc1/8tXqaVjv/ZlCBEErS5f3cwbSeDRP0hXUHOTlr6i7/JeOgB3j7Lx+P/+p3Vmvhhga0Zo7F/vOSSFOxunK5OdM6lcfFJI6DTZGobG+AKkrREX1vOcxXaBrGv8scwQwn4fbjy6H30sPB+BYJZ4jifudxVKrbs7kS5BhOjvMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774259783; c=relaxed/simple;
	bh=oYni9gC47PxHkEwCBV+JakQe0K5hugq6gJXxrC0XwSk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=b5A116PLhiF2OYWYFtBfty9xctFwYw97AWmppoc27cWzDrDpUYmxDPuDnlfIgPNBxmNVn29+xCqVZ+ylOU5scJIhFJ+NO2WvrIUij/YE1fIyTEYIkTLL+r7drx+Bg1heQP3zRRL+U9jda43iritpleXW8dJQm+6XKS+CHuwKbW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YX9t1XUJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KP692iWY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62N72gAO4091856
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:56:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HoflNgTVKSfI0dPp31WVy8FDZ/fE5rLcUkjCFZcfKHA=; b=YX9t1XUJhm0n4Mxb
	G3XgkgHzTVjxIg1TRbOaiK6Vzup6u5FwedFP6vuMuM/7VFHIo5BW3JglpmFfb1jF
	opKCpyQMsIPs5WW3+yCXU1dD/AmWqC+reIZiEU3ApECnHtgDKWit5WXrtF35E+fW
	ZSvLn0Vp2Pt36GV40xsccfM7gvlg3uWu5sh5ZVPdf5RIzJTrYOU0XSavPtSzg7m6
	GuvYKw0c7cnhKqwalanAPwQOYAZJ/dIb3YpaScOh55AyekpPtybgDOM6KesF2j2C
	31b1D0bxbgAc8wfZ9caM2DNDpXrHTu2TPTmtIoBH3WZt+T8ClBWq0AtxObfT4Yy0
	59i7cA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d1h1e4y5t-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 09:56:21 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b2d5e61f6so25918021cf.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 02:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774259780; x=1774864580; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HoflNgTVKSfI0dPp31WVy8FDZ/fE5rLcUkjCFZcfKHA=;
        b=KP692iWYQMXhJq1KmcAXmxPmy9P1gszN6npJ6VX/7qEQ1oZP5OXJMGdXD3ccZ5KPz8
         5d4Q6ZWlMaC/BmJIT6Ixi+hoQ64YbQBgU2qreTT2uRfqhC138Nk1nOWc/Z2NmtUM4oK6
         Gy/QC/yF762OLNq6EK8EESI7CRBgB/NXpYJmpEMQYtUBcn0SNBEE6qAe+1URrOVwwLxo
         WIPeDh98UholpTKG1aAE92hPXs+ATiYU4Ux6mhYf3x4lMrGxs2rRZA5Z28e3wA4v2RwG
         vhsSrq0zu8/DhPFIIa+urkG/B0Pbo38erq4m78Fl+8WjLOVKZqfDOy06V1XyS45Gob1O
         0TDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774259780; x=1774864580;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HoflNgTVKSfI0dPp31WVy8FDZ/fE5rLcUkjCFZcfKHA=;
        b=erA27sZcbOZt2ipESTy0DZ+gf4Dk6twYuXOLl5FX6CT55DUnHCmZsrB9t4rj9F6cBg
         EDQXfnVTPreeDsB6wNCQxu8S5+m7QBn9I8bTdYno0sr5e6OKpu0iwKJtxUkg9TMKUd+5
         RRN7fJLfOlNxZ+8ONfNF9U5EFlo0CAN8O0TlL8Uw1YukokLQKETHVQgzPVP6LTs9XyOo
         mXxmFvYYlGRr9FsJuzGYDO59Q/Rd119KbsoqpUYPaTPdH5F7pBvdma0Msw24EFkz6Hgx
         IEPtR4ZtWXcccrQq4JyY1wNrsoTt+oxgoXIwE6IEfIWVgwUtxxXSMVsQ1hY5TeWIeKME
         iurw==
X-Gm-Message-State: AOJu0YyZJyjoWLrzJp/XvHK9kovFPzeQpQEAh6UV46q+MiYeuOWTujZt
	2ZUu+ee+67P5yVpoDUES//qLo41naVRIZSvUqyAcvHfeCmc/czvhdkZaOefBx4BDZ+TCqng7d2q
	QMvF54+gAhWbPA9K4KfdK1QLOuEoTj3FAgau5BPFlzgqTY2nEb5XI3TcCl9qN5qHNr7NJ
X-Gm-Gg: ATEYQzyO0ytysvnqANAojGJvW1UZdVzk98s/YAeuPb7WXjY5Ig1V9XqG+ioYaw6l8wH
	fPcf8k5iOML2KR5VtEFQvo7nmlNu34S09Vpw+dvUmwoc1iuuFcxeWmE8QPFOogi0j4N9Um3Vy3m
	ST9sn9ov4MmUPLCe+ms9s5UW5nFjFOI25xvUrC6YCphWKWFNkw/Lz6MuH6pvkZrIUAv9TFQm2gZ
	oISC+dMMlSMPUJ+WOConp/SlNtrZndtQoOqyOF1QGbBsHPpLgvSKHAa4D9/ikPF7GofEpW7ES0c
	I4oSOWWfxGSpnHeKrgVyQcgiERsGifswwtx0SwGvtn3tM9NL4gWSAG0A5a/eRq1fm67QFT7C1uv
	v6gfvMXbx6OdOYeLvzPDmbvdcbxVpjZvqLXz8eHE0TnqXsQh2BBIHQ3BYes4n60EcUQeaM9Nj+I
	G7zJc=
X-Received: by 2002:ac8:424d:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-50b52870762mr43885361cf.6.1774259780178;
        Mon, 23 Mar 2026 02:56:20 -0700 (PDT)
X-Received: by 2002:ac8:424d:0:b0:50b:5286:f756 with SMTP id d75a77b69052e-50b52870762mr43885241cf.6.1774259779795;
        Mon, 23 Mar 2026 02:56:19 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192dbfsm2448274e87.1.2026.03.23.02.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 02:56:17 -0700 (PDT)
Message-ID: <182a6226-bb23-4ad6-b454-4913ab461264@oss.qualcomm.com>
Date: Mon, 23 Mar 2026 10:56:15 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: sdm845-shift-axolotl: Set higher
 touchscreen i2c clock
To: david@ixit.cz, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Dylan Van Assche <me@dylanvanassche.be>
Cc: linux-arm-msm@vger.kernel.org, Petr Hodina <phodina@protonmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org,
        Casey Connolly <casey.connolly@linaro.org>
References: <20260320-axolotl-misc-p1-v1-0-89c9b5ecb26e@ixit.cz>
 <20260320-axolotl-misc-p1-v1-2-89c9b5ecb26e@ixit.cz>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260320-axolotl-misc-p1-v1-2-89c9b5ecb26e@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 6Qt9hSxaju130m5bFLPBq3oFZ0pKoePm
X-Authority-Analysis: v=2.4 cv=epXSD4pX c=1 sm=1 tr=0 ts=69c10e45 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=KKAkSRfTAAAA:8 a=JQuORDkdG-Em1TT35vkA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA3NiBTYWx0ZWRfX4nLhGPwTI3qz
 gPstbAQ3mppDaZbolbcpwVvGxAaMsojtvQcgP0xmE58cir7MjpbS7btjQE/a6v237u5i6gymUi3
 Oxfd0Z186WmYno5XGvf079Xs0sJGjRhIpEOU68mH8UlBpRdX+FNVChAn6EM4k/hv33ZV1mgasGH
 hxVL8opkW7xwOiRnCUwUQp7lJubtWvsMggdPonw8wfzjTbOI/T8zJ2nkkLad54MujrNxKc7E7xB
 Mac3h2AE7QZsRbxTnTjCcbpCUf1e+IQk1FIUYjPin/4D/VKD/CDDi8rlNZM2A/LDCkGRS5WJw5e
 21VONfpNMqrJpM/arSrEt/o40v0DgKGFaXdFoFikQDrfUan+OsKBo/oumYYPFdFPNGBJnXoBYqi
 /Mn4xQx4BTB5YOGOfjQFOjQfrN6L/sYRIPXjTbkqkGEnT6/nhDaGdDfVvH6jZ3S92GG5WuyTerq
 SXsyt0DmEGzZY+uEQVA==
X-Proofpoint-GUID: 6Qt9hSxaju130m5bFLPBq3oFZ0pKoePm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230076
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,protonmail.com,linaro.org];
	TAGGED_FROM(0.00)[bounces-99175-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,ixit.cz:email];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
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
X-Rspamd-Queue-Id: 756492EF81B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/20/26 5:29 PM, David Heidelberg via B4 Relay wrote:
> From: Casey Connolly <casey.connolly@linaro.org>
> 
> Sets a higher rate than the default for good responsiveness of
> touchscreen.
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---

I assume this is in line with downstream (i.e. you're not trying to make
the panel IC work too hard?)

Konrad

