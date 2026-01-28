Return-Path: <linux-arm-msm+bounces-90915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPAeK/LIeWkezgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90915-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:29:38 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 276769E336
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 09:29:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 7FB50300681B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jan 2026 08:29:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C47DFEAE7;
	Wed, 28 Jan 2026 08:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UQghn5Kc";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="iTc8GnZ1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0712206A7
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769588975; cv=none; b=AsSPm+kgab6kWFcsog031Ka0l/RaWbHLMHYh/JsHqlkxy9w/emfLXSFZbpkUtenYamuIqhCvhhK770p/eZU4cisgcMdfUVzGGryhNjwRHzp44a7tK8xZHDE6SbEZqHeYV7R0MwtA4o2toUMmqH2GEv9GZQyqSUSuiHoegp4nos0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769588975; c=relaxed/simple;
	bh=4p/hKhz5U7iPSe6tDtHBzA/xodo+dBWc6UoWMKa/C2A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IwTwozHVICEGwscAyNA5ZOgBqNBrWn4hdn3PIeKEfBJDA1fKHI02zw9jGEHeuG4DJ+tZtrBtYkncgAAV87C0Qh9Pht1gHgCneS7o8eLTh5fopVYQZAwbln34NTgnLaJGZ2nDaIfXc4svF44FVkEdg9WaORyEZdZR0Tdrh0RJQTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UQghn5Kc; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=iTc8GnZ1; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60S6TosD2953452
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:29:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=IkZs7tyPEWNnrup4YxmquY4F
	dN1R7M9CfDJtzN3kWCs=; b=UQghn5KcljioxLmSw5iJdcxRr13qRO/pVtJb57se
	iqvDoRqxQLdrO6gfCB6pPeP/1p2utQ2aF7wkRlm1mJsfEzHKMhQQvMqxR4dSima1
	aQ+3ChtRxrEl/1YNly0R1XaZdCvfT0vhxjc/k52sJAqc2cPKiARKhwka+HjMremM
	QUV7Rv9bEf118b5ULTXe1WGoSypmQKZPd24MGQbTRadgpivwd4+0PKreZAFoXo4z
	l9/jd7ilW1sOWu3lHlIifDH5m/qhBZAovJ9hoxhOuBsqgmJoLG0EakrJVHQlLpb6
	cKL6SUxWQgLM7seBrMFmDVOHIWbq9n0JrlrzbZAuq1espQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4by4sjsved-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 08:29:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70ef98116so254950785a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Jan 2026 00:29:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769588973; x=1770193773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IkZs7tyPEWNnrup4YxmquY4FdN1R7M9CfDJtzN3kWCs=;
        b=iTc8GnZ1Hq6YI1CjfZvy2R26nujQNg1/8r+M00v8fsIaOvKgMSqRjSbO/H+ltItA1E
         ABkOMMVYuL7PU9DWt7RkFmtV4VxZiAYWQfhNWpXund4LshZqpPeqaonudNfzeOzmAxtj
         F7GqAlfxJ7ZLRIfQiJgUKI48aSvD9IRN+1owUgMXTQ7OtmBdsNvKqxoRF0LTz1TCdQ/Y
         LffyEOq2kuz54azpuEbEojPUkm0dKT3/M5RJ5XaYUdtiJ71LBVGz5CojnelqMkzuTQ36
         3uSCntRYU85vmgE0HuS4yFmCtd4qPZqxiHDSDhtUF/x7iiEMGf+QTVqLP3V0KD8p5c0Q
         SLFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769588973; x=1770193773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IkZs7tyPEWNnrup4YxmquY4FdN1R7M9CfDJtzN3kWCs=;
        b=KXfDUuiDgYvKpO1Wq8r+Sjp71or7y4pPCoFYKypeavCWOARcpMeSg7s+2DfE/eqkI0
         PjRWj/uBQh5mxO3bqYOjwJ56ucatqAeIAIzgTUP3Bmaucwx5VDZ3OWNRTSsaH2tB30Lo
         Inbnsse989QGYLz5r8lAci0lOWsClhuHSDJEPuRuh5nAFMLVn/b/rUVEybmWDnFkQPSf
         gyJvp2YRq01gVLOXxj8q0VxkK7PAbHq4g7BAjxPgjVw9eWXcbb05MXr7joRTf579g3rU
         WK6ySvlxKEaOQcxXG6w8XVXAt6JutTiZ7hF7NgjZoWDSUfhEdllkkHajx98EG1zPMA3V
         QXrw==
X-Forwarded-Encrypted: i=1; AJvYcCWxHkX8tza0lxUpWXbzVd1N84hyZPuHaDgfdutRnhtfhj3wLDECNXJMh883tLqWGqDHURriGRn8+EJ0fvA0@vger.kernel.org
X-Gm-Message-State: AOJu0YzudP3nzp5VWi0XpUE3S+d/s75JhpIt3k69OV8qWk8tGavmpl3O
	tjwPXC4mEwWxOUhnZeKJIZVSjAabKkvoqBhECwA8dUFwegtQRjxDEIDcdQRjBSYnwGBZockk3OK
	Fv0nBRJJmViTuWpC744hUYWMurVmOWLior5cOtGSFKJOc5RaT0iuVGsdMDQ1/xolh760J
X-Gm-Gg: AZuq6aJVVYYzBr1/ET7OoMjhUnGnVIVhJ9XKr1udy1+Eixv1ADsAZTyThk7wL2hKJv8
	BYJ5sa9hs+j4n65u6xya+MledKNDltOljQz0ou+WIhtkrEsdDNeWBrma5kXUcZfDN235QRTJMSz
	Nk6Q36fIJKtHw4YDI+UNU2mLSUIfx5uFBA43IiWYN/ysylZfN3PrJu+Vbl3/dDEnLtW/zHGoSrn
	8HvwrNJ73K6HVJHMdgvw+61oasQU//AtqqBuEROS2xDgHSuT+SNfysv8uW1sHVYivlLn1jHWyLH
	kiFmywoJ/QdYBs/cK9ecO3vWUepoL4D8hZcMAlIT6XwURVkkqmepV2Gy5uLRMJRwCyQsFoAl1vs
	jAwifnTMkeDlz9xexXvAxkxjE
X-Received: by 2002:a05:620a:c47:b0:89e:99b3:2eaa with SMTP id af79cd13be357-8c70b84ced7mr643825885a.8.1769588972770;
        Wed, 28 Jan 2026 00:29:32 -0800 (PST)
X-Received: by 2002:a05:620a:c47:b0:89e:99b3:2eaa with SMTP id af79cd13be357-8c70b84ced7mr643822585a.8.1769588972283;
        Wed, 28 Jan 2026 00:29:32 -0800 (PST)
Received: from oss.qualcomm.com ([86.121.162.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48066c428basm119939545e9.12.2026.01.28.00.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 00:29:31 -0800 (PST)
Date: Wed, 28 Jan 2026 10:29:30 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, aiqun.yu@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com, trilok.soni@oss.qualcomm.com,
        yijie.yang@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        20260114-knp-remoteproc-v4-0-fcf0b04d01af@oss.qualcomm.com,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 06/10] arm64: dts: qcom: kaanapali-mtp: Enable ADSP
 and CDSP
Message-ID: <dpqpsvqhkx7fp5iigm4vcemtwfpevxhsmtnyvtwlns4lu4cur5@y4qn5gnfpsb6>
References: <20260127-knp-dts-misc-v4-0-02723207a450@oss.qualcomm.com>
 <20260127-knp-dts-misc-v4-6-02723207a450@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127-knp-dts-misc-v4-6-02723207a450@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI4MDA2OCBTYWx0ZWRfXwPJ/8HO4joHF
 7dVVXbJfDLH3Piv3sj/ma3u44bZir0pcSomKzP3S1Ws9+npfifw2LN9/pw6oibpBmLb/Ykw4ot3
 kxuvRLEJUUrlp3IyQMWPzfAE4wCuWL3wPog0k09pcSBhx5Esp+bUeLcvnaTmrhcEoJt5NED6F8v
 E1AEPr8Y+AkeH1yVJy1ooHEc8N+uZIxQs9mc8g77b4XptAX7kKnnP0OqU/YwUHXAsGT1BXGzRfx
 4HVCdGe9C9C/v+Y3aWCMHR1zKB4R1QO2b+BiOqfQ7EE+lzTj1DocZnl360VJE5jdH4jxffdNtIh
 TXKMUmZ0HD2vO6fiaxEW3b/DRIJkBTNM0ecRmD1kHBIXgT0NYmVCdaiCwZ3AJQos653TP9y8CVy
 4anpIEJxAo3OMOx7XvJAPGpLUcVFFUTSKIhOJjp5zpbDNVey+bjn8tsuf+6tXuppZw/Z/qz2bla
 s5HI+9E5+2SOlV+Pndw==
X-Proofpoint-ORIG-GUID: mUB8YaXmNK7NRLCh5CPs3UqgRvPP07Ja
X-Authority-Analysis: v=2.4 cv=KezfcAYD c=1 sm=1 tr=0 ts=6979c8ed cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=oauzzCmhM186DRC0Y2yWPg==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=6vzHqKrWbn1YThyMYpYA:9
 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: mUB8YaXmNK7NRLCh5CPs3UqgRvPP07Ja
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-28_01,2026-01-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601280068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-90915-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[abel.vesa@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 276769E336
X-Rspamd-Action: no action

On 26-01-27 00:34:03, Jingyi Wang wrote:
> Enable ADSP and CDSP on Kaanapali MTP board.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

