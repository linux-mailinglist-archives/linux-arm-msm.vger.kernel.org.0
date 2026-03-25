Return-Path: <linux-arm-msm+bounces-99941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mG3hIr5AxGlHxwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 21:08:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0921232B990
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 21:08:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7C283303DF70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 20:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0C2B35FF6B;
	Wed, 25 Mar 2026 20:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QKSJO4vx";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XhjRPYSy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85D9269D18
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 20:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774469304; cv=none; b=WzW2c23ggZZUBDJFTFt8E7JDMsgLGbEXqzxBlSyRn8wVIxveS0VjMeH5Swg0LXol9pGLWBOZuWZqfN8oIAzM2/IQIAqFZlvmodRQ8Vurpf1u1XLMCo5lLYVrzWfDsi1wbXkox3UhXRNFWljp7fAAoE+IMVcOAkpW5q33FW0vYQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774469304; c=relaxed/simple;
	bh=lD2t1AMxlzRcnXK8iTU1zKwGBKi3PFz6qWPKGrIlIDo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K0LVqaol8XaF545eQ2WzYTFpqHfqHPtEFQ5FsyG+pS0Uc+IONXeR+BHsqnc1ZpnfMlBSqfkkd1Jdxsg0u/6BZqrY0SN8Dnn7SphY19/lRc93Y1V6LoE263t4eBZPkHYAoYKcdHROPQeHvCg+q+r3498XfYEZIFzajzWYyDFCZQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QKSJO4vx; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XhjRPYSy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFRKWA1432152
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 20:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d/+7PKEkluk0xu811L4V4ceE
	Km1CSLIwU5nrjfkgJ4U=; b=QKSJO4vx7rXJhpV2pKIpBT8E1U1AfJ1BdUCegOnR
	kOkQbT4y9o2wrx4FQodSthzyrWATXm79MDb7loobcCIVGnsnTVQu96+8mSUX6C0Q
	iS2r0qMVyUMejqNqpDXpfpWKfgm1sHk90MCs/aUQDw76bsPkG/SIcYAkrHwgcVrO
	kmQcjyRD0rIpcHr59OVFqheVtyiA6PiG8giPbV2bIVGMvD8ebMcQFGXBieUAKJhj
	hnDTDBE+xUX6UOcgn3tVeVPYcfgoHMGtXfNER+RiSY7O6aYWbnr4RryqDGtxZRUZ
	Z6ozCgdxPQ5MD/edpSFOxt5yINstAXrTn34oRbBvntYEvA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4jc511f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 20:08:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5094ba09affso6737711cf.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 13:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774469302; x=1775074102; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d/+7PKEkluk0xu811L4V4ceEKm1CSLIwU5nrjfkgJ4U=;
        b=XhjRPYSynxRZYwbCWm77DykOxkbu/u2faJJM7VfyuswVI2m6zD6gsFxpxcbM0dkBsR
         u6HvMOgV+fm+0QnXom1VzZjrbSU8lF4DoncgMTenvPacpHZqAj+zsJKd9g61FPAgtCk3
         mvR8+6DhqhYI4DgVlvzz3dSi2gWgZamQ1h8m+shjWFfTWzAwuhi0DdDpZtd+4SHHdM7a
         bUVK5qVG4L9xqdKTQHdWW6mHBVGp/+IvOwdSbhkle7DAQqwF+zPUrCp5LBpEUxvq5Mfm
         6tM4Mk3g/L4Du9wMA7300NvzDsMVHHb0d2cF0dATXaf7EArNfVlqmF0wdQtcfq+Sma+A
         6Ewg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774469302; x=1775074102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d/+7PKEkluk0xu811L4V4ceEKm1CSLIwU5nrjfkgJ4U=;
        b=l6jWoY2BvVAWGbtZd20pDF5HAAOXbQFXAB4ePmTjlWbGpjCyABxAm4Lqbv6IrLDlSl
         ARtJL0EwtuhJvSaXuM0+6VZb2KpLGLWPktnCmTselmYZrDGh5XUMe9lxSDevE2jI5CBi
         uVncqOHoXFZbB/m9eqGQ6GxWaps4eZjvb4SsmUT00H1fliXi7XQ3xf3leEDLfHIICg0w
         nDk55siHUH9OPS5Y8VteNaIwQdatIeCaaVznKisyo3wgti4o99gikPGEWS2jv66uh6cW
         5swoLevC1V4zmePYNVnFXpVNOwxHLrPLKLqvSHrEh8nvKw8UfXUFnQprkGI2TQONDTYe
         hh8w==
X-Forwarded-Encrypted: i=1; AJvYcCUBQkQXKv1U4LlrBZRaTcaCiI4iC15uBDE9LgInUBs8W0H6Ur+bZJgI4d11mXpkxI+6bj+LlQxr20UHLgij@vger.kernel.org
X-Gm-Message-State: AOJu0YyAeBvkDvyD7jpqW8UlmmfbUuc4fqK78bp7u4O039ZC+rMopTto
	896wePbmvJotk2zw4/hQWlhmgQcE/Jaie8UhmgHhfFwx+KDREPYerSywGl6MBn1vZe7j+ZnK/pF
	UWHttpP+KnzZYUOL5vKLNTzvNRnVmWqY3cSDyiZ7+a9/1aE1YJUrXFB+C7Lx75/o39x9P
X-Gm-Gg: ATEYQzz3+p0cYlSLGtd5BDhy0c+iRbiNG+ui9gp91V1Rnyk/VCUTsohuSHN7as4gY5S
	6XZbT44NllXVvc0dnrvxnYvquuEuyh3zoAveX0MV/8Y94aURxEfpzzbgr7qJsilONU1bBIwvpj2
	QwCE5rEs3phZDCjNiM5UvX/77/zDlZVyS5MiHLhVRWxFOnEiHKZEGSIwkXrzNDxlyQW5aMdLN3z
	CtI1SxuDjn7fpLW3xi62AnB6fNblQcxLoi3ngHEq1m4c26tMIObQ/SEfVkWK/8nfGAxFRMTwGJX
	kY/S3dSrsIz3uf/Ly3ckQSOZYjwn2UqPIZeX66lWC4pUeEFNrCRImMqZu8Y6JnxpoCBid95kB5V
	IyGTL/05fTpON5xHdX90cBTJQSsNg3HbH7MHDS6a+fZJlnXSJGEnqgPt7lAtkYRCObwd5GwhlY5
	z61diOVXRHFDml4F9YckHfYn1qtp8F3Awx56I=
X-Received: by 2002:ac8:5a8f:0:b0:508:faa5:451a with SMTP id d75a77b69052e-50b80cd3400mr69468891cf.13.1774469302073;
        Wed, 25 Mar 2026 13:08:22 -0700 (PDT)
X-Received: by 2002:ac8:5a8f:0:b0:508:faa5:451a with SMTP id d75a77b69052e-50b80cd3400mr69468391cf.13.1774469301627;
        Wed, 25 Mar 2026 13:08:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c5332d99dsm1145711fa.39.2026.03.25.13.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 13:08:19 -0700 (PDT)
Date: Wed, 25 Mar 2026 22:08:17 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Biswapriyo Nath <nathbappai@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Sean Young <sean@mess.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Botka <martin.botka@somainline.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-clk@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
Subject: Re: [PATCH 2/7] arm64: dts: qcom: sm6125: Enable USB-C port handling
Message-ID: <kirmecnwddfikawqulzwgkdple3jq7euvl45meevjmak654mse@e4wiaodqodah>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-2-446c6e865ad6@gmail.com>
X-Proofpoint-GUID: fud__RW1dHEi8UcP7nee-6k-UINa8doq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE0OCBTYWx0ZWRfX7BjlklwIrwwI
 cWuTbt3xKEJ1+mLXVSTBkkmxiL+lMBB8G68FS92JM7xmpC3GEpwciP+M4vzRgSvKyv0hV22R/4c
 aXbNoSOv3oyerFyCMnJGk1CQ+aGvYjwr/6TxC0WTLPHlgLRJ0VT01bllBGNMjO/XZ8K7k9BhnGR
 VfkRtbFLKP2SVnnTofNIPwV7PAbn4Zysdj3b/QOXjohY14lqxdUkZ82ZmTdAhB3fMQOc82svZ/z
 ALLMWs3yqtRteDWRORy8KGcqTYxFpmqqCeOfHbG8POd5dOxqFY5/ib5GV3O9a0SJzzmHoMFW5G/
 795yasplsGxmuOLJRXDaj4IcwFmpjd4gWzNPisD3DmXk0FcUMqVB+OJI40rMSqJtNrpRas1jhFm
 5+4k2VKRvYIlC7eNB5tQx6FzccpAtzluUEYrW2j5iZ3lZdIqHV1PQ3l8CJD5wnYyxBWaDYhaIbM
 wRvl07SaUVNua/sEzeA==
X-Proofpoint-ORIG-GUID: fud__RW1dHEi8UcP7nee-6k-UINa8doq
X-Authority-Analysis: v=2.4 cv=KaLfcAYD c=1 sm=1 tr=0 ts=69c440b6 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=H_3iQ2LuRKvP6GoHn7UA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_05,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250148
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99941-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim];
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
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 0921232B990
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 06:07:25PM +0000, Biswapriyo Nath wrote:
> Plug in USB-C related bits and pieces to enable USB role switching.
> Also, remove dr_mode to enable OTG capability.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125.dtsi | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 

-- 
With best wishes
Dmitry

