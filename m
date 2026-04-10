Return-Path: <linux-arm-msm+bounces-102670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aNZqBujN2GngiQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102670-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:16:08 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id B9DE93D587A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 12:16:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 24B0D300C03C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Apr 2026 10:15:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 182CF15E8B;
	Fri, 10 Apr 2026 10:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M7Y330Oh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XSUab+LQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D59318ED6
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775816148; cv=none; b=J6jB60UxtVqz9hzS6uurfAD57vC0CoAmy1s0wBa7reQItrTUf/8mlTlN638Nz8ArWzaafnZ0CR+RYf7vkKkXXM4WndIond8mKuE5S8JkiSfPVgLXqf2B3MbFc+bAjvnZJ3AF+UQDCOBOvKBxLpv+a9sJ8n2k2uMncafrjukr/88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775816148; c=relaxed/simple;
	bh=acKCtBBY5beJJNJxkoJd+8Z4H/GcU/gRY0KIHaFXnmU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ijjr0u7hDpRkQwZmbqs9ut04uYX/a6zuh12zX9FIQrLAHmTAJWXb1W6x98c8blfkb4NACzjW23xazeCftQT5jM5ctAregt/ZTzanlGsYDNfIE7UwTHaMZkNys5a0vMfywuaFjubyDS1UAbbaDiTzbbmQjs1EmQSTVN2sailrIcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M7Y330Oh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XSUab+LQ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AA62gR017421
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:15:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xnUoPeyCpQ8Rchdbsf90x2AVJoXX8svgOzQ8+c1SLPk=; b=M7Y330OhOedqkhkf
	VeFi11Ur0gycO8qw/fbCJ41a1u/eULKUBLQ+NOeyG+350lApkNfXxqTecd1ndsJe
	OuVdFlAA+tEdfsPohYTxLtC29QBhHCuCCorLJWce2lXGxHtqru7ULFPDl3PhHCPa
	KnSxEzV+3Bt0W+1cx6a175NHg9B6nTtjdGV84sCcI1Nfr58qn+pFRaX39HU+To5u
	vjbFCo9l5/N8C/nJMtCsNs8kYKwjUmpZZ5KYBda7UdI1pye8KIsEvkWk2TdPjINi
	MCmCot49Gy+hVP6rDIPRrXwVwVaod8ilBrqYHsLU5B/mvAJ8r3C32IiDlZawh4Db
	+q+zAA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5j01ky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 10:15:45 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8954b9b5da7so5948956d6.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Apr 2026 03:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775816145; x=1776420945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xnUoPeyCpQ8Rchdbsf90x2AVJoXX8svgOzQ8+c1SLPk=;
        b=XSUab+LQvNjixZcUvnHwykHjqQuASHx6bDSY4B5KfPW9m1fflZC3ZofBsYwhv58Chh
         fv6Zg5+NPYBlfWGMk9Q48QDiI+pvQmUhtet5nPjpVwwC1+Z6sMcv1npVElxSFhN6aMXe
         8Oo+eTyirimlTm/fApz76Fag/Y9iqP5seQTTjVAWZdAMeCEgOrlMQskwuR8MSX5SkNfD
         zl/yL2pL/GZC1wmA1dNqXF+1zFv4mwC82E4bQVFeEyhMa5Qunwj84aua1b/x/JVjmfY3
         PxA7H547xwYCTgPJtMNA9eCLsAK1TRS84P4evilrSdqiRXw8qsoUK+syTewRE5B2E3Il
         mcxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775816145; x=1776420945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xnUoPeyCpQ8Rchdbsf90x2AVJoXX8svgOzQ8+c1SLPk=;
        b=JZDriqq3P9W6lWJs1pHK7jvw9clHf0TpB9IkKa2l3sWxc5pP/agOoQYwYmXNyPUGkF
         bhq6oQ85+7KaTAKtV3HdssyBJpYjCezOxAq0X1FaTh3SPtzwMGGOJ4qXIGaLgYyJOMFZ
         5UnCdg+FlVqhQoL1cICNYp3paWhdc55WBmHY2zFV29iZuQ0zXY4VVwDXUSxwM2GLg/5s
         cECfmjT8admLjFyz7bBiIMHlR81euFvaRkEgiexoaOap1zO+cuD2Ut00zhRV0FxNbh4S
         PbHJyp6tFvZSjndiF17Ixmy3SKj58KQjRrzsU6wIzzcs+wuoZxcMwjAq9PQf/xIzmX10
         x1qw==
X-Forwarded-Encrypted: i=1; AJvYcCXhXKA66Co42T9n4eAL8/O5ygK5XFITGMfUEexWKuuzjsewipDlQT6KTVVjhd3X3QhsqWP09oEBaAEwiT5j@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9tFqtN4OSd/zoBlGL8erOZINC7UZ2vcDcmHte/5XAUrjM4F3u
	Pwc4DntTjBJi8nOhpQrmmQgBLQufSztBghtstOFb6sk/oVjRMlAJ3KRYZMS1W1474IhHShEJ12V
	jsTJ5XOjtlTCJL//HLV2vM/3ZpWDT03n93561b20DbEdujd+q3h1P1Yqn8WfyST/b0ZY8
X-Gm-Gg: AeBDieuoa7dOoSnRH2dtFOdIglAjI6x4xzo9VE4zCiWmPBTEHG+OmcHFsul5hnEogMY
	H1xlbRFhuk5DV7mLcuGuz23VtzYQ1NXjDpXKmx1y1SD2nQEdIZRB/OaYF2SY7b5r9b9UTjTJg4E
	CbGlwWa7qnDC0Kv/ms5CjPVfpqyoi6MsPysCDCfcpDTVGZYw1X5bWThEW0Lx8J5Xn0WkCH79/pZ
	bg+FYyjXu7fMh60tbHdEkmjPZcTnzFB9xgEsk7ap3Fgn3+je2gogeXP56/etJn+/GAXIbk6tmoO
	ogAxNmjZ7rXDZUSuUXhY09Svfbc2PR4tLjVsR+1vcd++/xfL70EiVbo78RMGcsfHdXEfITFWnbU
	9k8v5vjdGRohoCjWf1EKqbGXkJnTwCE+uC72iXqn3KVGNWyN77nhcT7/lYy5XP0PxglQafgcysK
	vaDww=
X-Received: by 2002:ad4:5d64:0:b0:89a:564f:bbab with SMTP id 6a1803df08f44-8ac8746608amr21609516d6.3.1775816145146;
        Fri, 10 Apr 2026 03:15:45 -0700 (PDT)
X-Received: by 2002:ad4:5d64:0:b0:89a:564f:bbab with SMTP id 6a1803df08f44-8ac8746608amr21609116d6.3.1775816144641;
        Fri, 10 Apr 2026 03:15:44 -0700 (PDT)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f188fsm66430466b.59.2026.04.10.03.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 03:15:43 -0700 (PDT)
Message-ID: <69fbeffe-1a8a-441e-a4c2-a1fcd3d41421@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 12:15:41 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] iio: adc: qcom-spmi-adc5-gen3: Fix off by one in
 adc5_gen3_get_fw_channel_data()
To: Dan Carpenter <error27@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
        David Lechner
 <dlechner@baylibre.com>,
        =?UTF-8?Q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel-janitors@vger.kernel.org
References: <adjM_ZXs9IoIYjyN@stanley.mountain>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <adjM_ZXs9IoIYjyN@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: c9WctZkpMElFSsOHzlt8att-sKL_CFJl
X-Authority-Analysis: v=2.4 cv=b9aCJNGx c=1 sm=1 tr=0 ts=69d8cdd1 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=0Kc_pid0jmsIozq9se4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: c9WctZkpMElFSsOHzlt8att-sKL_CFJl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDA5NSBTYWx0ZWRfX91xa03fiWTk5
 tQt6XuNtC7lKg7izxCORcwlTHhbWiVg0+ol7gepAsCzMGKKmqAwVhiFkjM7Ntt3/6TwQcyNrRdv
 D+gxyDhdDnBWkSeLBFocCyYXhtWOmcifsaG5yv1uyV0F9TZOZmIS5gMtkL0mTd8QGCKN+GdUhlN
 KdDkClzMkrbW4RgORK1YdRtqgiEl0ypQVqX6/p0gQEqsTjLN1A6l3au9RfuwVUMviWvJNCaqNSc
 pGk1wuM8tfbe3/a6/uv1LVQgBTLhDSjWGUjSvHuC8/tQgjeZbPda11oBYj3ki97RqOQT0pkXSk1
 PpjqfbkSLXCpqjONsLeFQO86F/Xd/fiT7LDiyhQJo1TZoytrllTmHZ3yVYfpUqZZPpQR53k9u5E
 1G7xnLv5se5hR0yAjYMprtAGcON+Ty6AByM/ZLF+lzDlrErOqzI2n+DmuLPdEJN5WOBHYfPCVx1
 P1WNzoO3qW+zmDv0LTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100095
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-102670-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B9DE93D587A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/10/26 12:12 PM, Dan Carpenter wrote:
> The > in "if (chan > ADC5_MAX_CHANNEL)" should be >= to prevent an out
> of bound read of the adc->data->adc_chans[] array.
> 
> Fixes: baff45179e90 ("iio: adc: Add support for QCOM PMIC5 Gen3 ADC")
> Signed-off-by: Dan Carpenter <error27@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

