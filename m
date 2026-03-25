Return-Path: <linux-arm-msm+bounces-99963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJHfBhJlxGmBywQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99963-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 23:43:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id A7ECE32D289
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 23:43:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id DE6DE30A945F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Mar 2026 22:40:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F418538A734;
	Wed, 25 Mar 2026 22:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kmro4bmo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="R6G5CCca"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C88F33D505
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:40:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478432; cv=none; b=kqmNqKDsP7pxcmWPyFC7mnrRKSnKPwe+7hqYZy+zRvJQWuQ9ZOe+GuS2euK6Xse1dfUsd9r6CbGCsXp9yJaW/salphAamWwx9w13+9yYrWo0UC0/a7gkDovrV18mkjSA3PtCDTfgFL3gbC5MSeZm6vwudnS6y6+7RupTI8Vu3Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478432; c=relaxed/simple;
	bh=M3wrH4b+LRUZF3FN2M6DKwvla4BfXgDsUeFyx4ljtkk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHRB/Um8UcFirZPc7VxDwDIHj6ykHmqk6ufGeEi/Dk6OHEK388EkVM1qgGEPCsh6KxntzNadQ4a1zbzAN7qzds8pSCtiEUpbCzgTGYGBxuaGgARlH36dieK6k8G0orhXbnuJ8ZFvCrMKMi9hvWKLI6h1r1lp13O2DU1tfQpCTNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kmro4bmo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=R6G5CCca; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PMI9lp3069914
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:40:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RKYqQ0dwW8xuJgMJdvmszTAy
	PcSofCCo8nVIzS48A1k=; b=kmro4bmonc+TqGDtD/9KUXC3tqseV7KpjWqogEj4
	a0QCUv37Nc03txe184DLxG3DcNMAEoMTWEjzHgCSmvePIvgsJHaF8W52m6k3v3Dc
	9/b7KDE/GLX5XqOQpOT3Vbc0zidboUWQg2D4Sw18NjSctgF91TSiOIRzm1XCnGAX
	4lO4YHdu/cCcyynOe5pr0vTJjSakbAKgZJDwQJ1RDaU2wS+qKW8MQtD8ofruTqO1
	FTqxL6x+n2LuTOXcPZ4IWvv7bC8SS6T0Ltp/uUP64z4DrIjp196uQhYvUpN2pkNF
	QY0MgplrkHC0MbmUB7H4FRnX0tT/Q13V5MA22WDY6NzdLg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4rcn01w3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 22:40:30 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5094741c1c1so9574261cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Mar 2026 15:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478430; x=1775083230; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RKYqQ0dwW8xuJgMJdvmszTAyPcSofCCo8nVIzS48A1k=;
        b=R6G5CCcau/Ei7EWBPVn13nr2bAFAaL9Lnje3bLaniCl4dXD/R/cf9sQDkqi7JlBaBX
         /jf+VS5aiZdJOioLxD8Tx+IQEVttNC0bofzg/V8Yi2kwMALFaTmYfRjBU1WSbA4XsFg8
         INSveh9k2z6SBfgRNYiTSkoILXrTnGrRmTZnJRKX0k7BGpB7XkAhREyQPYSWzxBizzdn
         UAMHTlrRjCzq2Gvs1IBsiPHvAdlES2gwQ1BI3ATv3YB8lzhF2TSPvuXHqzU8qzDnG3MM
         nt+crF+lvnM7FZ1wZvmafKF3+tO4Og+qSpUBt3HF9GNPwSBtbEEfWdf9qc3/ISfLa01Z
         a2eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478430; x=1775083230;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RKYqQ0dwW8xuJgMJdvmszTAyPcSofCCo8nVIzS48A1k=;
        b=gAKSr2PGV9xRgjh516yacKUtCknQGNU36zAGCU4UYSqFtSGvnBjLgIDJnk/N0ZlOdI
         +VhnExGLA8VKjeigrgk3tooXss4QgdYJZpDqKLOmEhI3KIq2KFNDYyrURzqkdcIKU4LD
         f07siHTEYw9uW+KUrqg47fZ9kUT3DF4M+OR6libKOjRXmsBCK/iQVRrgTTg0804a2Bcd
         QT6WIgTeoXR4diY2L+XmLgmqBjqFSe7gcbOSlnpEl1JETEdZvqplnIT7PhFAKiFpEagX
         dH0MkvOwBTeQFw6lSsgnw1g90WbBzQw0IZwZiYXGQLaaYbFRQYBBqPzxtv7A1A5xLLdK
         MrDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVke5YpNlVJgrOtFu6zSwpBZjSjH7Aj/NGO/Z264GlmsiUMj/JFi91OuKa7ERS/RjbVw2HK0KpdlsMqUPnE@vger.kernel.org
X-Gm-Message-State: AOJu0YyX6iu8l2ewe5Zg4fevfetCgH5XBsX+7XWdorTVD2veNUl/4uKg
	ITkYXRS8nVMS+olC0u6Jq28YyWXt9lyVNkIsJxRUzot1oH7pyZ1U2CN9rms97dXAIHcbR5tNRvH
	p6iKLpgrkpDUFeiTmFmeErZhnZOFZDxQuc+oHIrm0qwMa8fzUB3n2xfsqiy0it6g5BOwj
X-Gm-Gg: ATEYQzyKlsy4GZp+FXhwgVBxwpb50DDGeKToez49pdMhdbBOt3QfPKj7L6sRrZ1j4FW
	4WT7PB1gOH3MeSY36zE3mnIFxDs+UUZXWfeQn6SX5p75Ctb8pxY7BoOdoiPTOR75HpWQX+P8Sws
	bq1F2CPLQpJQuVyWJc4pKKz9FTNahK3HybMQ8P6UB3eTBRdZR3Y+sOvvbKR0VflamfjWC80FlAK
	aEZg07jXGbYb5EPVBSLfFsMDOJfaFNPtcZBqhsC1nNSeMPIBggKMLjtmMf/8Td5hxmiD8z89qXD
	EEoDI2pz6MLOtpwF9FIVgKfuZlEhUD3sgxRjjImqb+8KmPJ4lds3xj+1zVsetDxUwmI0iHR6EEo
	Epln1+7Zej+r2QX+jeQTzX7L2tD1fAg08she3VuEWaGBSqYKskttkKOg9KO5KHDvqUV74kkU=
X-Received: by 2002:a05:622a:11cc:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50b80cd3515mr82662441cf.4.1774478430163;
        Wed, 25 Mar 2026 15:40:30 -0700 (PDT)
X-Received: by 2002:a05:622a:11cc:b0:50b:532c:2ab0 with SMTP id d75a77b69052e-50b80cd3515mr82662151cf.4.1774478429762;
        Wed, 25 Mar 2026 15:40:29 -0700 (PDT)
Received: from umbar.lan (87-92-245-163.rev.dnainternet.fi. [87.92.245.163])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c52fb15ddsm1810051fa.16.2026.03.25.15.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:40:28 -0700 (PDT)
Date: Thu, 26 Mar 2026 00:40:23 +0200
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
Subject: Re: [PATCH 1/7] arm64: dts: qcom: sm6125-xiaomi-ginkgo: Enable
 vibrator
Message-ID: <67d4gbz5tccughmlb6tkzv5fgduo7ih6ht2avcq5o3deiwjkad@wt72gfijbx3u>
References: <20260325-ginkgo-add-usb-ir-vib-v1-0-446c6e865ad6@gmail.com>
 <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325-ginkgo-add-usb-ir-vib-v1-1-446c6e865ad6@gmail.com>
X-Authority-Analysis: v=2.4 cv=Vdr6/Vp9 c=1 sm=1 tr=0 ts=69c4645e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=vaqIg2kkDvR5jWT7QgcA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: cud6iCt7kht5CdgS7BBRZFZp2UZzyzuW
X-Proofpoint-GUID: cud6iCt7kht5CdgS7BBRZFZp2UZzyzuW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2OCBTYWx0ZWRfX/ritdLafzO6o
 7QDleL4IHIZ76sX/SLcUzgK1qoWoDHSEsXm1JG1LWemHA5xpao5k9Vt5mDx+tSnrH6EqBFSrtSW
 u+jNvoAtqsa+LzczfPa/KKFdpjy2m101wiIqiBfyKyCfIWgkuDu0PE6xH36Mm+xHqediNUwUeaD
 Uspmz437K8dTpj9n3nyYgnJ2O9s402C/AgilqEhAmF8rVj25aWjNBbC0OBO5gcE2AC+RJhhdSzg
 RPqUNE/JWY6RAY9vAkzOc46bUNPCBs3uu3Th6y9g2G2+dqKCsw+Aocmf7OJm+OvrYtaVJIG17sR
 sTEIKuVKVUzYWEC6mO9FTLPchz1zdcIhi0bQ8K6mgygiiHkEnrECi4HkQ9Xx1rAXL/wz1q7CT39
 V0Nv+T4mwhiqxiy0UhoFWAUKzFyMGm7yBehwSr88URa8SmhUgllp+p5agnwGXI/xV7Vu7PM1Z32
 i+A3X7Kbho/PFwu+LtA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 clxscore=1015 adultscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250168
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
	TAGGED_FROM(0.00)[bounces-99963-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,oss.qualcomm.com:dkim,qualcomm.com:dkim,qualcomm.com:email];
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
X-Rspamd-Queue-Id: A7ECE32D289
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 06:07:24PM +0000, Biswapriyo Nath wrote:
> Enable the vibrator on the PMI632 which is used on this phone.
> 
> Signed-off-by: Biswapriyo Nath <nathbappai@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 5 +++++
>  1 file changed, 5 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

