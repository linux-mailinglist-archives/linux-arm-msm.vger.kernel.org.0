Return-Path: <linux-arm-msm+bounces-112146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 35/kIqb1J2pn6QIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112146-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 13:14:46 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4491665F620
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 13:14:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=gEOHiqKK;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=NoW6rB67;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112146-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112146-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D680130DC7D8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 11:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 955F93FC5AD;
	Tue,  9 Jun 2026 11:05:25 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B9A3FBEC3
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 11:05:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003125; cv=none; b=ZbeNHnkHB32O4i3tNqmczHbz8tPftSvHZc2p0QGA2Lahof3d69V34I1d2lTjVUMIVMEPMo0iToAZGyHw4cO91rAcZp0CulEHOwe0Der4hmM6yHIny05y0ZgT8WzKE2+tG5ZSHAiCDvFqs5Woyv4wtacPmPqHE4v3B3G4GqIuqto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003125; c=relaxed/simple;
	bh=sdfJoX3weu/5bb4kZAE6iE0eMYM9msScYhHFBxigZbg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c8R8a+MWSNd9IgjpYnvuCrVg283/ht55u6jvzCT5LoH5XnsulwVNs4I1iXTXoPwoAKsIg7A6AY2mdLJRqAwdli6L3zT2ppFi47ltW7CVgxO2ZkEemdj2Fq4qrD8GCwZlXGggW1f8a/RWJlkjlYQHu8ReJzcCkS2pTwR/LXr2NgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gEOHiqKK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NoW6rB67; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6599wnDq2311307
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 11:05:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rx28RGAmnnvmqWkKqwEakAwX
	zmzhLrzlkZYWSnJi9t8=; b=gEOHiqKKDVWAY2aHe/EcQnF4WPWtVZMw52z1/r0q
	kI7EJIsgunUKy8/08l4rWR4bSeFImrMm2cZM590FsuTIbEI1c3zVt8WYnTwfYvu7
	IPtDSVLWM6/p4NKvhqKUFKH1GgfI3xsMTb9p8QEY4ZLZRNxsEYQqyM4mk92CYIhC
	nU8+JPr19/wF7QENwWL8lqzl5WwRHat5satyF6T+pwrfQrfcDT5Aif9j1lHU7ryk
	gghfTJ2aDKHUxa0FeqtoSO5SGfBqvKJ3JU8baAnXhFDpEs3/QV3jPOunEKcOMPWF
	Nzuhfxgi6iBwBVBMAhEcr5+X1+TJFsnmAdfc5SrSLRn4eg==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epg3v0c97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 11:05:22 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-963aef8141bso1685728241.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 04:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781003122; x=1781607922; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rx28RGAmnnvmqWkKqwEakAwXzmzhLrzlkZYWSnJi9t8=;
        b=NoW6rB67iEhKaQj/Qi7ICcmw7ChM6QZOaiafk8XQBq7CQwJW4/ABkBmgqiZYhG+R0q
         laD9PATUo2H9fetJnHvDdR//Go7uOW/Kr8jv1elMmmh8UqRUPjbIxaMtMR/JkcP8nU00
         kjJ5R/zzl1R+c3z3v6RkFA+yz6x5Uqk6Q6ziT5rl/hG6jrTl4j+roejBltZ3yvBG3+ew
         rUIy0VVAAGU7eCxgjheTQvn463iflBfXmIiF+xGRc7PQB+gaxZ5YOeyk+NQ8jxcpEfRi
         MmM/lC7uujlvBEPUyLAhFzTg+1WOA28ODCyhWIoM329jaqyBQXpunv8virWfTjZpkUnF
         EPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781003122; x=1781607922;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rx28RGAmnnvmqWkKqwEakAwXzmzhLrzlkZYWSnJi9t8=;
        b=RK5ahgxPH75aqIkLBNPrBIdoMRrglPMzu7a6hFTqPUbwynu0PgBXSLz8VACMZvI6j3
         rD44lmPpJehFPZtWYGEOTVIo3AcJyqcYFYnPvhQyM9zjzes+gSgblmim0pnfcTYgY8gK
         4z6XnTHWZxGSu6tx4XZhixOvt0Ltw71mhSzGOI+eydluC0ZMHDedYe5UC3jkQTV7NMeO
         VBqF2vPhhWK6NJiGHFKau7zhqHR5s4lspbgI3kvD7VOfVu+EpvPQKbBM5vZ67Q4wvFeP
         3/t/9EOzyz1Nl91NN6cxSq4IK/FAfvQAwU/UooRfHdsvfI+qYPDBkt6Labs/hVv6Kk8o
         2AZw==
X-Forwarded-Encrypted: i=1; AFNElJ9MXh9trHJ/Sb75WlZ07VioopF0DQ646UFaak+sJduO8g3RDcsEJLC216WNSCSOzx2/22LX+D+XvgmRXNbV@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2/2/QfnGYdKQ8V5VgtuZtN6uXxEV0bpG73QDTqgqRNsu4ozIu
	16J0h7sDDSeba0b+oczHg02pGWkAAyj+q73rZUfq+k/X2wRvb3r5iVQTN5C2l/XciaThu049cN6
	wnBsJh6t9c7MbsmTo4mM5p52+HF7WDraJ+AxBA5dPUM5iJGW19UfAFxEzq+2g1GIGJxfB
X-Gm-Gg: Acq92OHTlmwfIJBU1cNtjdGdv1RZZ7glkU3WSnwDc+Ym49w2e0MAVOW+ueoV6hiWV15
	poSh5c7/fGXjkcPizm6F+Ip7VDcDx2XoMEDFoiaT+I4QhtLh/Y4ZVUm0AuYpG6bC70pPMTdyTgR
	3glwzU2HVK1O5Z0444d5egBOSPsik2yLII8u/s05j8mNXCJe6qNJ02Y9jhW8tVElfgztNz9yUzS
	t72Mu/7+YgyWKvieBFlVpVcRq8td6uqiw4Bp+CYYoMM0ZFrwUSB2celFif5ZKT9LcoPMv89q30c
	ovg7s+w0/acLKewJBc7I/RfMr4+4U/L0B/TP5HQNqzw/hFIJU4Mjxai/UJleY3TAD6rE2fouOTf
	NEFMdV9vLMKKWVntPqyRtorBtpZgZoSOd937UOEb3pyyLuNrf10OQVZgLNDXMdHywJY5BHEOyJN
	EC6JF94iYdRGP/d6wH498EM/4jtpud1wtrwXzFeEqbgfEWkg==
X-Received: by 2002:a05:6102:848b:10b0:62f:406b:1baf with SMTP id ada2fe7eead31-719367e1560mr450041137.20.1781003122156;
        Tue, 09 Jun 2026 04:05:22 -0700 (PDT)
X-Received: by 2002:a05:6102:848b:10b0:62f:406b:1baf with SMTP id ada2fe7eead31-719367e1560mr450006137.20.1781003121692;
        Tue, 09 Jun 2026 04:05:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa7b8ed901sm4515726e87.10.2026.06.09.04.05.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 04:05:20 -0700 (PDT)
Date: Tue, 9 Jun 2026 14:05:19 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Subject: Re: [PATCH v3 3/8] remoteproc: qcom: pas: register TMD thermal
 cooling devices
Message-ID: <h6cat45sxkn3l5ispdtuf6dd5co5t335sp57ry4cbarwwzms6w@whokz3vvm5ap>
References: <20260609-qmi-tmd-v3-0-291a2ff4c634@oss.qualcomm.com>
 <20260609-qmi-tmd-v3-3-291a2ff4c634@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260609-qmi-tmd-v3-3-291a2ff4c634@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=St6gLvO0 c=1 sm=1 tr=0 ts=6a27f372 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=MAJYu3_Ptnbw-qWrP8kA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: bOrL48w9eAOm2jcCHOQqehkLq4I80mgE
X-Proofpoint-GUID: bOrL48w9eAOm2jcCHOQqehkLq4I80mgE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDEwNCBTYWx0ZWRfX0stCZ4RrAkwE
 5fK9iqAuDzsBFi6bvhxV8TZS2OnLudckaUx0y9/UBiB0+GvakgcAIbejAQbtVz/bZLoH/a3NM0h
 jVW7rx0n5EkKEwlEVsG00zSJMqa3N5VVrBliZN8JGofjG7Yl53/fdmvPxzPnLzurXk0/w42xLtG
 LGW+Ch29144s+nfMw9dR9Ej/peS4LOq0b3R440GTtFF9CSKO3RWv740/7Wx6EWtqMXuBBOCgFlV
 11dnXon8O+I7/pWq25z2LxqMKUjSI5xpS/zXSx1wswrQcfS8d+cw+yqE9ciaEhIiLpJhSO41oLL
 SnTOnDJYKZZaWp7eos0C89OIYvv0BgJLDVAywpYUuKdf5oI3U0wX1ohE2fRIfbR2VsmkpTTY0Oe
 w8ogsT57ghK7PnwXmY64RVlZ8ad5dHp5cW15qgR6jOrv6eLUm0PKuxoTwNOmieC4nW6Cu8Sxo+t
 zE0Z5zDcJvxblcNozRA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090104
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112146-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gaurav.kohli@oss.qualcomm.com,m:andersson@kernel.org,m:mathieu.poirier@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:daniel.lezcano@oss.qualcomm.com,m:amit.kucheria@oss.qualcomm.com,m:mani@kernel.org,m:konradybcio@kernel.org,m:kees@kernel.org,m:gustavoars@kernel.org,m:cros-qcom-dts-watchers@chromium.org,m:linux-arm-msm@vger.kernel.org,m:linux-remoteproc@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-hardening@vger.kernel.org,m:manaf.pallikunhi@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4491665F620

On Tue, Jun 09, 2026 at 03:52:58PM +0530, Gaurav Kohli wrote:
> Add support for Thermal Mitigation Devices (TMDs) to enable
> thermal throttling of remote processors through QMI.
> 
> This enables the thermal framework to request mitigation when remote
> subsystems (modem, CDSP) contribute to thermal issues.
> 
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

Wrong SoB chain. Yours should be the last one.

> ---
>  drivers/remoteproc/Kconfig         |  1 +
>  drivers/remoteproc/qcom_q6v5_pas.c | 61 +++++++++++++++++++++++++++++++++++++-
>  2 files changed, 61 insertions(+), 1 deletion(-)
> 
> @@ -733,6 +737,49 @@ static void qcom_pas_unassign_memory_region(struct qcom_pas *pas)
>  	}
>  }
>  
> +static int qcom_pas_setup_tmd(struct qcom_pas *pas)
> +{
> +	struct device *dev = pas->dev;
> +	struct device_node *np = dev->of_node;
> +	const char **tmd_names;
> +	int num_tmds, ret, i;
> +
> +	if (!of_find_property(np, "tmd-names", NULL))
> +		return 0;
> +
> +	/* Get the TMD names array */
> +	num_tmds = of_property_count_strings(np, "tmd-names");
> +	if (num_tmds <= 0)
> +		return 0;

Propagate the error?

> +
> +	tmd_names = devm_kcalloc(dev, num_tmds, sizeof(*tmd_names), GFP_KERNEL);
> +	if (!tmd_names)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < num_tmds; i++) {
> +		ret = of_property_read_string_index(np, "tmd-names", i,
> +						    &tmd_names[i]);
> +		if (ret) {
> +			dev_err(dev, "Failed to read tmd-names[%d]: %d\n", i, ret);
> +			return ret;
> +		}
> +	}
> +
> +	pas->tmd_inst = qmi_tmd_init(dev, pas->info_name, tmd_names, num_tmds);
> +	if (IS_ERR(pas->tmd_inst)) {
> +		dev_err(dev, "Failed to register '%s'\n", pas->info_name);
> +
> +		ret = PTR_ERR(pas->tmd_inst);
> +		if (ret == -ENODEV) {
> +			pas->tmd_inst = NULL;
> +			return 0;
> +		}
> +		return ret;
> +	}

Assing to a temporal variable, check the result, assign afterwards.
Saves you from the nested ifs.

> +
> +	return 0;
> +}
> +
>  static int qcom_pas_probe(struct platform_device *pdev)
>  {
>  	const struct qcom_pas_data *desc;

-- 
With best wishes
Dmitry

