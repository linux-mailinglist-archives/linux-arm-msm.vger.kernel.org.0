Return-Path: <linux-arm-msm+bounces-104165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G0sBokQ6WmiTwIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:16:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id CD16A449A30
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 20:16:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2CF66307D4D3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Apr 2026 18:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 950CA3BED76;
	Wed, 22 Apr 2026 18:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SZcT7tZv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BCE5m+Na"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0AA938AC72
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776881683; cv=none; b=SjF0W7/C4Hlkn/wjoaEkXc34fXOctS9hK61F3WShEL279ELNaG5ZEcGIjYqJioRiDzm+dX0JTrtm/L7XTDkVJionFC/JnjYIrbsnitgL4a3QEpAtKKVw+FvX1bu8BCdgvSqdOAuIDy8afX6/B8qtqinvG5L0Zl+icQGsLzgLuTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776881683; c=relaxed/simple;
	bh=CPa238Lhw3/i1jFwoxM2dK/g6KW16pMfFU0UbW1SSHk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N0sq6YijEtTOpehVRoo5ewvOHeThJ4cbj2NGPdmPnTI0FnSIkdZYVod8GxWW1S9p7h7opqQqqM4B4XfmnGO8eAsEvkIn5VTYIfbtmt2jQkkXPX04cI+6XcYdXrZktp2mKLddKwZKyPQXEvlxv/Kjrh/TyU8L/Oo4c/iK8kT3UBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SZcT7tZv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BCE5m+Na; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63MG447L122921
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:14:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hPhGIxQkpXBRdqEVws8/Zb/E
	OCuJXIDXaw83aUIc/Oo=; b=SZcT7tZvXJjR7rM7QEPakNpS2k/kQ6kkFlrHC6dn
	9FkNeOGhbf6k8zd4T2Mw8GbN9A7eRG6/dPrfTF1wEtdBjA55ElICDq/crQmzx1mH
	FQBDByC82ZJtJybTi2hmxDMiGB88OKWo8e6+onssvtzVEraCrs6ri8KpFhzGb2sh
	3R8YKYEdzjvpGp6xkXksIxSnJ6iZR0fNw20nvTusBhhq5lQl3w5N9PKknVObV0ky
	4MOdBXwiP0QniaVKyFP+/OiKt9AbJ+HS8fd3H+YKMvKCqS7HToFwuuXFbMFUKT3B
	3BtmKhUIL649qslNHQzNypD82Fc2k1qKCPb8ywvIq6XQ1w==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq1h80eeq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 18:14:40 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-6056898a01dso7735872137.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 22 Apr 2026 11:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776881679; x=1777486479; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hPhGIxQkpXBRdqEVws8/Zb/EOCuJXIDXaw83aUIc/Oo=;
        b=BCE5m+NaGh1orlsNyStsSA2IhjUJP66dEYwHdqCYC4Oh7lM0KM2And62EvGl9fcfBK
         DXnJl5e0hqVW9D4tukF2YHuKa6F7AzVgsbQ4kpPR2LT2z+nT4a/beJLcKnhs09aHxdjF
         7ztcy74fxnnTwEyk8sEmRzjfwz4mVBW0jeT6+b6V9djK9xSBZXJhrngHcAoIFDy4gb/4
         pS1gJm+3p9YhIcPzMiJB6LPiYi95zpxOJ6FCDOlW694qELrWnfRcmH31QcsdDUE9dogP
         tcKQuJFo14KyEDQ4eFFijADzm59ZDDyuP8WjXZwO95lpywY4NTIOrfP2H3HXYojMn/GS
         EPMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776881679; x=1777486479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPhGIxQkpXBRdqEVws8/Zb/EOCuJXIDXaw83aUIc/Oo=;
        b=UGr3UYkSArTYKN/V0uYQqvR33Ux9RM4/jGN4CQjt5YZ2s0SQYOUVx1zuB/IBkgaor5
         DVQkAIInMk4wTzOm58tg6ow7VHbzHYb9MDUzl8CTjR7p4SKGNIIJ3Qgc02FbuyVvCaCC
         rUHSSJ1BhF+fmW3O79Blty89cfitW56wmSsWlgorSzRWEkODidFEMzeREk7otDt0x9m8
         6YcqXEsZenRmr1ahSPJq8EYsc3G3A2duvUUUyOTd4K1kXuKEj1wyllNsjIicuRJZUsee
         FzUT02tIgsb0jnkm2/2Rm0pQLY8G5+0GsFCun8vbglhO2uiOmFc+J7NNjxcpDmav39an
         mjwA==
X-Forwarded-Encrypted: i=1; AFNElJ85IcUhRChNk9LWEcAY5JUCLxMbSRFf/seVQvRVGkBaPEppen0i18wVLTRwmaI0mC6ObsG3FWwdOCKWjCck@vger.kernel.org
X-Gm-Message-State: AOJu0YxiyoS3dvhFr2fLg0qaqwA3ihDMKjyqyUS3hziV/9py28QWYupm
	fGP1d8AwzMme+NnHBIWeOmcO+dPI0Y8x2bnI2ODSH3YdLlTDGuH0jKGewzTGfKgJUvJkeEPf/YG
	gRIUBOKbyr+1M1LcDCH5SlLWpq6E5JvmxXrbFAV5rJc10ZSNfmwm2jaDUhjXI6QWtIfcu
X-Gm-Gg: AeBDietLW1oNvZaUBQ7MqztC0isxRqB45IgaRfhUfx12busIQ7k1teEjf90Fv/C4LTl
	MF4BvduZv3tWlCvgMl76ZOAsKn+Yl8M8mjffekqjVrC5z7Ulle3FnlI0t2KkYWxX65ez1ga/QPL
	UBQQt3YTErJDhX5jDulT/HbmP4Cw4AF4Z3+VERaEAlDCIrwBADLRi42F64UEiQlSOr5DucI4M/N
	fqFphjZ29ddTCGH5cAL5dgKTyMzJqfQhLn/uX/HnTioiMgkRO32zsfLp22iIKL1AE7PnR0qBdMw
	NBlbPYtF6qC7kgQVA8iWBBBT6E7HWXl++kFIC3lMDJ93cXsnD3BKYCACKMyIHerrxwJ3Mjey7cH
	Bey6VmGXwSCwBUO1q1mfDAvXIPxQ+QFT/BiQOO7f5THIhh8EZoq9YjlFgyIoiVoTK7JCWQ+ucUA
	QDsbLjmQdpOpUdXtqKXqpMfkOnc+v7UBEUPpN/jnQGP7e3Ww==
X-Received: by 2002:a05:6102:204f:b0:618:3503:5659 with SMTP id ada2fe7eead31-61835036f21mr7881985137.14.1776881679220;
        Wed, 22 Apr 2026 11:14:39 -0700 (PDT)
X-Received: by 2002:a05:6102:204f:b0:618:3503:5659 with SMTP id ada2fe7eead31-61835036f21mr7881956137.14.1776881678794;
        Wed, 22 Apr 2026 11:14:38 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad143sm4650753e87.7.2026.04.22.11.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:14:37 -0700 (PDT)
Date: Wed, 22 Apr 2026 21:14:36 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bartosz Golaszewski <brgl@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Shuai Zhang <quic_shuaz@quicinc.com>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        Wei Deng <wei.deng@oss.qualcomm.com>,
        Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH 09/12] Bluetooth: hci_qca: Add M.2 Bluetooth device
 support using pwrseq
Message-ID: <odwnlr3nyootxsdstjptmh5rsyms5fb3a2347y2oen4vsv7uhn@26afv3khjb5w>
References: <20260422-pwrseq-m2-bt-v1-0-720d02545a64@oss.qualcomm.com>
 <20260422-pwrseq-m2-bt-v1-9-720d02545a64@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-pwrseq-m2-bt-v1-9-720d02545a64@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIyMDE3NiBTYWx0ZWRfXzgKJNuRW0UIG
 kIuKoNGa8unBuWRdOlm9Yp0ibz9MnoxofDmvZ8DdfwoGlRbJ6pSuEoz9iD0XPngqejId2Fzj37r
 bqXNZecV49qXCvEvq4jF0WLSaeWRaO0CFUNWsasCHE4J1RIFHB0b4krKhcHqVICv4YQ5QRUDnqS
 YAZdwXSmW++4+y+ESv6PoBkNqx3siD6W/+reagD/cPenx1U8l5NmSwiS6UENwedKxF+jqdOklfK
 yPwrOtSWDqpnASxujBoZCJ4KTFCrLweV4y7WDfL/IwvEfXTo+D5uXQSjpUs6C+G5AgqW1U/iwah
 c7MSZnBEwNy6Fq5B2uK4zWdSW6051Gd+ZnsgF66rCkZ9j4ZQx+WJwaiPzw0PViewCy4aId3dPEy
 kN+X7j0tBJ5fgGaRtUNDw16xdGxD8sXMDRoMT6SM8GWV/eYDk6Re3CSs5EiR//AsFYTlI4ho/o1
 0xbNqmRhX3K2AS/twhg==
X-Proofpoint-GUID: dBc06Xu_mc6VpPaOZgh3Zlsm_fQ_Gkg6
X-Authority-Analysis: v=2.4 cv=RaKgzVtv c=1 sm=1 tr=0 ts=69e91010 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=ZFRR4UPfCyPuBq0k6oAA:9 a=CjuIK1q_8ugA:10 a=zgiPjhLxNE0A:10
 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-ORIG-GUID: dBc06Xu_mc6VpPaOZgh3Zlsm_fQ_Gkg6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-22_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604220176
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-104165-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,holtmann.org,gmail.com,quicinc.com,vger.kernel.org,oss.qualcomm.com,intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: CD16A449A30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Apr 22, 2026 at 04:54:50PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> 
> Power supply to the M.2 Bluetooth device attached to the host using M.2
> connector is controlled using the 'uart' pwrseq device. So add support for
> getting the pwrseq device if the OF graph link is present. Once obtained,
> the existing pwrseq APIs can be used to control the power supplies of the
> M.2 card.
> 
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
> ---
>  drivers/bluetooth/hci_qca.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

