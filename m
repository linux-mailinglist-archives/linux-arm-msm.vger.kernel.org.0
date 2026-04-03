Return-Path: <linux-arm-msm+bounces-101741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLLDKd030GmP4wYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101741-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 23:57:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 9506E39895E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 03 Apr 2026 23:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B52F1300989D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  3 Apr 2026 21:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 425E53644BE;
	Fri,  3 Apr 2026 21:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e25j4y5y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JKPWr358"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA7E330B10
	for <linux-arm-msm@vger.kernel.org>; Fri,  3 Apr 2026 21:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775253467; cv=none; b=T3VZ2eHQZxLFRocGBSg3pzWTTce8Njm3o+Ry241CBZmgHNGJGFyIeY+QqjgTCzZJ6RQM+5WTbLMUVCbpuE5V77VFUmBOmVxbmVtb6e5uXi4G5obqX6SJFKVCwzz5mFRAgNQ8Pu7uiCwoWwAT4wfZirElb6wpAvUJOxOJK3e8uOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775253467; c=relaxed/simple;
	bh=DWUQGfY+cMmSq5aGAa4CP2kn/TKjl6cto19/qpaK/dI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A5+sdbXJSbSuZxoLADRHDwXMs50KACCNPF7OwUSiIvXXMSLX7n07KCChcAf8+IlnNYd8+mfaJDaoR8Khnn0ycHLTOJtlOvG2vCCfrNt/e85v388xQrMPPil33cVBagsnheDQAtQ0hOHcgFo6ys5jc8W6vIbuO5TTbXgdk7Xb5OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e25j4y5y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JKPWr358; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633FgY0H948829
	for <linux-arm-msm@vger.kernel.org>; Fri, 3 Apr 2026 21:57:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Jdw4BMkuoysn1cjVxg2If+mk
	C6tX7NFjU3rzvor305s=; b=e25j4y5yP2KtCztyw/34lb/jeqSPu0VPVKkb1yw/
	eGc47dXqRUJhfbbse9rovqfxXHsQY2uCD13SxC5W/aV6oyoA0DfXw+3HphsXOah4
	TSaNj6/F5J5ydKOIxzldsnFM1zGmUYOpIUS0R7UDe2dzDaWr1n5swUuGTA6pNsUd
	6IEfE/LeeupyArgL2/nHxREhLPD3C/NTxeL88+qgq+R4WuGdbT+yasUugHNgTrBf
	KU6W7wg0Ve2LdpvWvU1XRtLEhOEqie0MeIFW0Ulo9m6nLcnSkadNbZfLTruaRO8S
	rSN264jMK0jsOJ4tlo7XmX2eppaaruQjKKCSdcsqHIP9Dg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9xwfm168-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 21:57:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d6bf346adso18983061cf.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 03 Apr 2026 14:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775253463; x=1775858263; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jdw4BMkuoysn1cjVxg2If+mkC6tX7NFjU3rzvor305s=;
        b=JKPWr3589yuAycLWOiIK/AerTi3g2PGzg4JO/N4CNWxzmqXH/Oqa+MfWUiMia1urzI
         XoL2L6uB9vLIkIuA6hR2krBnJvfO9PHhR7/t7KcSy5KgfoWGQmdG4455iHjtRd3s/58e
         K2juRQtMIVmp68GNie2JvwT83bDDdauhYE+DKnByxpcFfu38onud+wIliDtFoz0A89wf
         1goHh6mo3tyf3OYJ3ph9xY4DLsLiJtgmsnEn+rKHtq1SgP1iAnl9R/sLCqapQEqblHif
         tUw4dazBp1PAryX0CvwcpkdqA/7a3fbAgfUD6C4ZXPv9n1qUt/PeyOmubOtmaRV0edvL
         YObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775253463; x=1775858263;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jdw4BMkuoysn1cjVxg2If+mkC6tX7NFjU3rzvor305s=;
        b=I3KQ2d5t7Xy49KezQ6q8fkwCi402+9cGdCXGqrFFQ4frFVJCYIcjBR93HXeLEkx5S/
         MqFT1rSoaiDg+MN+CTISLirKaTAtmx9mSF+JT5k4De4WhKyd2tMg0zj/yAOMjt/5iQbq
         nFyJx/sQLyCrXyncmuLmTPcN25Ybz3QLcuVw0C4S4MVeTChfLo8HS0iRQ/9ieeLTx8vR
         SGF22zeStveRGiG9Ic4+aPCEUAlura2qZRZHRpjtih4tYX+n0VwxrU1c4RSTjRm8yoQx
         5xbQe8AzXgAycu7Yn2/dCIXeZd8R2gfIZboyIqTbzUP+XzFgB4NE7GSA1SIGdYPsmi/0
         H8GA==
X-Forwarded-Encrypted: i=1; AJvYcCW4OfhVWVfdRPwqbXD4bHvZrpCL26VSsLi3BBGxZoP8SLGCkVUgKvjddc52QnYi5ThyRbvbx3PkJbg24ifs@vger.kernel.org
X-Gm-Message-State: AOJu0YyBda2Mao5+99RwWhAvhdyFYfi43gqU36ELHwBkGdkmb8zQdfZQ
	r5RQxkv1BB8thxr/XeMqLkG8FfLpSs6jNpydguYPlhxSOjnKmP73YJkF0Xax4Fz5YszT9fovM7I
	KqTsQ+XnSQK/9ozKb4UiVmlBwfyXrIA9xmmzCBHLf3ZepJ3CLScvS6ZX1ZDlouwjREb1s
X-Gm-Gg: ATEYQzwvLz7MiAFSES+D5ROL5S+9YSXK4jN8nXVWXFiMrkgZweLhTh5HOR0Rc2wIyLO
	W+KIHOpmSx2N547xdluvxV63TzJqqoGRIcUZ2rBlExVEXlO+Vbt++w3AjAHWMCJfpcqaXujcKCR
	bsEA9QMIYGcnxun5Yelb71eJJvLc1ynM7X422mI5SxbLTuNlpNgchH8lbt0OYBQLZKkh0udRTW9
	gIMW/RuytAKfwqAevy26nh7pPmFZOB6r80UOYDaI4xHZjvnvDRj7oZLzNChWF/dmWoMEX9Mgca/
	Rr3oEzsqbHWLd3QVkRD+CfskfHQoS1N7AoPXnlNZkwKrLoHuyLwif6JAdndRllOGuxLc1j9fAAo
	bzXwl+nAQKTSETtfk6aPE0XNJMNIN9VSdFfk6jjjfdOJO9MUv71MNRHsbDDcPjHEAxUPtLxf+Xp
	NeeoZWpaaxpaCkDDH4pWYWjokrdngSvzHsclI=
X-Received: by 2002:a05:622a:5810:b0:50d:5d96:568a with SMTP id d75a77b69052e-50d629be2ddmr70828601cf.27.1775253463253;
        Fri, 03 Apr 2026 14:57:43 -0700 (PDT)
X-Received: by 2002:a05:622a:5810:b0:50d:5d96:568a with SMTP id d75a77b69052e-50d629be2ddmr70828281cf.27.1775253462713;
        Fri, 03 Apr 2026 14:57:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cccbecsm1677937e87.62.2026.04.03.14.57.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 14:57:41 -0700 (PDT)
Date: Sat, 4 Apr 2026 00:57:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Antony Kurniawan Soemardi <linux@smankusors.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        David Lechner <dlechner@baylibre.com>,
        Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>,
        Andy Shevchenko <andy@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-iio@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] iio: adc: qcom-pm8xxx-xoadc: add support for
 reading channel labels
Message-ID: <ahm3fz6j6kbmqe3p4c5e4szkbhcihtgxaj2z6k46kiiit3qrik@wvmbg4dt4l36>
References: <20260403-pm8xxx-xoadc-label-v2-0-29b50bf821e6@smankusors.com>
 <20260403-pm8xxx-xoadc-label-v2-3-29b50bf821e6@smankusors.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-pm8xxx-xoadc-label-v2-3-29b50bf821e6@smankusors.com>
X-Proofpoint-GUID: 5b4lDvFOGdtGNiRk2kabHoS4gndN7mUM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE5NiBTYWx0ZWRfXzoWXp+PmsM5u
 4Y2vhXvTkPuuunpa3Tb4mGCE83ILAqGP2X78fMldNs/ENbDy+2VHcHpaGvi51L5SzFc0EBqT7cg
 8DZn6t09blICDVGc/tjRBYQFQFbUXiywx2whrqM8TgM6Yi4ngVRnn3YVY2lkxtipTn9twIlYK9m
 4yR8oIaOLKSGi+3YcpnU+XZ0y3A/PThZVkIweyBqpp4v3mkUd1yuvMqB+tHdxeiSB156RieLmqn
 CRGZw+8EqOmV/E7f61ttsFWgumoaGCFHMmMjXFehYgIFdqA03A9YDKn3MspAhkmU9ScybH4+lbH
 0u9oEJghl/p2ZYVY1RUaqhRpmqdqIJkZYcXiiQoHEJWnlYGMCCoQiED4PXltr/ktG1/C5+A0vSA
 ijlPmPGoQCf4QVV34VozdLlTNKiP99G8ESHOxRa25sQBIM8+nA6FBWtHkBEgjznQHFQqkEli986
 mhuRckrMBl9l5vh5apA==
X-Proofpoint-ORIG-GUID: 5b4lDvFOGdtGNiRk2kabHoS4gndN7mUM
X-Authority-Analysis: v=2.4 cv=fOo0HJae c=1 sm=1 tr=0 ts=69d037d8 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=wxLWbCv9AAAA:8
 a=EUspDBNiAAAA:8 a=I-nygmCkc1d6-4TqzFwA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=QJY96suAAestDpCc5Gi9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_06,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604030196
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101741-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,smankusors.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 9506E39895E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 03, 2026 at 09:23:21AM +0000, Antony Kurniawan Soemardi wrote:
> Implement the .read_label callback to allow userspace to identify ADC
> channels via the "label" property in the device tree. The name field in
> pm8xxx_chan_info is renamed to label to better reflect its purpose. If
> no label is provided in the device tree, it defaults to the hardware
> datasheet name.
> 
> The change has been tested on Sony Xperia SP (PM8921).
> 
> Signed-off-by: Antony Kurniawan Soemardi <linux@smankusors.com>
> ---
>  drivers/iio/adc/qcom-pm8xxx-xoadc.c | 24 +++++++++++++++++++-----
>  1 file changed, 19 insertions(+), 5 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

