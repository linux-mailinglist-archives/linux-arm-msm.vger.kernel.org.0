Return-Path: <linux-arm-msm+bounces-107265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GMU4OtdcBGrbHQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107265-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:13:27 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E9B5531FC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 13:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2AF413019CA4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2026 11:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60FA13FADF8;
	Wed, 13 May 2026 11:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ds76VG+0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PFJYm2y2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1453D34AD
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778670719; cv=none; b=DXcUJ317+O2hw8gXl0jZB4uGo8Q8KKlgIzW/4tq8kPKIo9qUquW7hvt69/V24/5/Fo+uvyTG1pFl66bOeC8b9n1TexTsOgdKxZrr7PyO8tZHTfv4rvotpsWp+r1w9loKCzjZRM1A4znPTshml2OooRAjHUkYoZoKnKuQJn/HUb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778670719; c=relaxed/simple;
	bh=mkrXyw6L2iMl4gNbwkquSUXVnpd902cOpp2y5ekRdnw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUUIB61Goxr7FSjUX4NZX/+tcQXhQgD3u4O6ubpl/+ZyZfoxvZV/CXBCTGx3olG+VhG8WN3ODMVFTFkamCWgK6y3zmJoa6RdDzlWSLh6Msij8FkgDc9HOzHRXnLMfV0KtZwAF9fn0HeJgmRDESSn8bxJTzODmWTpRyljQ3+PEtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ds76VG+0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PFJYm2y2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVI943430126
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:11:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=2NXb5UO5n/Ylg1gWvSiPUzAq
	tabq6k4j1r6q0/IV1rc=; b=ds76VG+0rsW7F6PWsWzLGOfHy0Nssn6NgIuqefj4
	RBaATsdJJcbMUu+UIRBpWIcKep26JPbuf3Zi2eI2/5ziMHtGUISexNll8y7lFhe/
	itYJWRkH3Gv9rEV4LNTDgWigCU3DOUqWeWRE6WRNsCMe84f4T1Ij7Y3/0U+XdRc/
	Y7NaMasVuylKHh6+W3i/mjESa4JH5aPLdKtaUioQXAzkHi7Jfi9P9BXbkVYq4Gk9
	n2GZSzmTw0FcynhjqoseA11M7pbBtT1UcazLeJePHoOUbAx3msoqTmY8Od3ANUE2
	W6WNDPTHOhLqu8JlZPkyhBf82ZT8850PuQbcXeZ1p7RPRg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmcg4ku-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 11:11:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-8b46c014a26so140954906d6.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 May 2026 04:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778670716; x=1779275516; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2NXb5UO5n/Ylg1gWvSiPUzAqtabq6k4j1r6q0/IV1rc=;
        b=PFJYm2y2G4Ym8vjqM4M8gTx5b7pzchHIht4BU1UYz+9JuNJD97ey7Gzss8uypoWC2C
         nB/oINzVzwuWSteUIb7PdUd24fwqzBlxnfTXctazM0DjydILBo6qF7z50Wk+rm3BJDlj
         BHwC00oq5O/5Ng1SUmG0H53WZnjcOcEhv4AYnJ6zdRT9Vi7SIlPBc3iCFy1XBDhmDEao
         IDSOndsHsiaKGFq7HVnVI9z2B5dF33z1ZhvJeEIyexazOYFtOg6wIi72tOfuf/tVvN7T
         TghjZxJyqd7HpBUXzNb+yJ6+YICWyQw4/7Tt3gn2I/XWKcASqoHIxUTyfkT5qoWT1Hho
         StLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778670716; x=1779275516;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2NXb5UO5n/Ylg1gWvSiPUzAqtabq6k4j1r6q0/IV1rc=;
        b=gFzun+5YSGPCohqhHIUhAzUsuHHvfEhVOemwyXtDZIAZul7clBPeQA6yDlgqtTWTfR
         lHjx7WFDxIdyTas5oOA4y+i1gNuCcFLyQGkP1f/anlgKA1p8xbrElP0IDwZmXgQvOisN
         lFU82aQl+nH/ekHwsm3sVuxpOdGrWw+0aUdCsqK5GD+bp7/fsN/2b1Rlmj4E8ey9Jsly
         wtqrwPN5y8T/ewVo2T0reKkyObhlYQ4b8MUVdEQc/HCbEZ+Vmpv3Z+xunJABzn2LAG71
         BocRaYMhxeKmL6gjHvBlg+xokrmbjRpjOC4dytbSanBa4vGcS4SHH+3PnuRfjGJvHU+b
         h/IQ==
X-Forwarded-Encrypted: i=1; AFNElJ+mIcb16fXFGHWHSno5vP2BaDvFpNb4Ep+6oucMmFqRn1L5sM/xr6h7ukrtHOIh540G3qmVAxNezCFRsb47@vger.kernel.org
X-Gm-Message-State: AOJu0YyaeHSUFr5YjK8x7GYboQejcZDHiqZ3nlExTDOTSjxNh+zpr5xr
	GlMah+YvVI1MKpn8RB968y+8HSRS5Z9wRNxhasP5SWUG6UqOXTzijONBDEnr3Jfj82HvHGtN7r0
	JMVuHeB6cc63nR+9aYiSei2evTLt9w9jVOUH+3WZ0JQIA6bkJwYNln1ZhjQmLKiX8eZ8J
X-Gm-Gg: Acq92OFHEs2sc9n0ntfFkG9apu/m20EOoidZxq0iA+145EU7OpLpetsYwoBq78M+++w
	8s9ROZeQVjV/STPCMxb60KqTPG5hTlL7EqfE8pYTbFcq5YKpZzmXcyHo/yCWuk5tY4eCk0lIZyq
	0Kdo9yFfzW08tMxsqKgOtE32Jxrx1Yc8TiQe2jVUjBqImwUqYU5DwyzOr0tpxOus0ODWkozCaP3
	0yfjyfot4/+ijbFN3UnkEZSzcS9wV01MG7wS/YNlB3C+pY01GJ4TTqzHmch3hOiReWB/Js8SKbw
	l72wMVGM2YrVXDX3+Hgw76cdEMjJip0o0RZw91+u/YfoOyt0JvPEEugXpm7RNkETbQlATOkx7Cb
	9A4sOVbjfylEfchIZDTtZ5kRyuO81PUpeD56Sb3ZF1Y57CZT7Li1II8oI2zncdGiDYX/NxXwLIr
	F2wm0j+qbXxQMskl5zAZEDtMnolVxc7qkqmUs=
X-Received: by 2002:a05:622a:1211:b0:50e:5aed:caf3 with SMTP id d75a77b69052e-5162f453c02mr32992321cf.9.1778670716424;
        Wed, 13 May 2026 04:11:56 -0700 (PDT)
X-Received: by 2002:a05:622a:1211:b0:50e:5aed:caf3 with SMTP id d75a77b69052e-5162f453c02mr32991831cf.9.1778670715916;
        Wed, 13 May 2026 04:11:55 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a956642dsm3889984e87.71.2026.05.13.04.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 04:11:54 -0700 (PDT)
Date: Wed, 13 May 2026 14:11:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Wangao Wang <wangao.wang@oss.qualcomm.com>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v7 6/6] media: qcom: iris: Simplify COMV size calculation
Message-ID: <idsqqaol2d6ngqvhl7wcyshvxwnpjzfw4564ffzlqbfkm5n4y4@sa5gy7saa4ry>
References: <20260512-batch2_features-v7-0-4954e3b4df84@oss.qualcomm.com>
 <20260512-batch2_features-v7-6-4954e3b4df84@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-batch2_features-v7-6-4954e3b4df84@oss.qualcomm.com>
X-Proofpoint-GUID: 1spFDpz2Eq5AiNZdikp6jWuAYaRh0o6W
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a045c7d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=d2bW74qClOU-8MBEJaoA:9 a=CjuIK1q_8ugA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDExNyBTYWx0ZWRfX4ohXUfxP1rBF
 /dCMmIOv+ulKtEbMTBe0UsjizY9/nj7MJF9gzPn/dpLKEfEmG71xM1ZuPaSivztC0ZpNdI5uTeI
 plKVOIeUe6EzuHZ84ue8pvsz+3ohGIota5NL6oUhaAdUY1vkFAg14POce6PdgfHL7wDBqJn8RMs
 oRTaqHRn/hNvALXF67aMzw5/AhVIlKh39mtgkIkr3xhwzLJFDXSB8k7hHs6mhYU//VhKYIWP65p
 v4OJ+UJEc4LahwcJik6H/gf3BcV/Q1vMSQclfx8sJwPFSNVR6OZg/Vb65F5ERJH6+SB4gHxiYll
 HX6orfE9P6KvbzU/TE42OkesXkI2X5URwwpq3kuoxNjC8Z38pt4J6YvjTpzi5Vs1D/bQJU04VLA
 glGVGf7kKSdpmKINyV+RkkpkvzaKJPkrktcE19rvKBnbeGIM3BGvRzMJ5qxyMWYMvXJxYyu01WW
 SFaq505Ared2CYC8dHg==
X-Proofpoint-ORIG-GUID: 1spFDpz2Eq5AiNZdikp6jWuAYaRh0o6W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130117
X-Rspamd-Queue-Id: 5E9B5531FC2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-107265-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,linaro.org:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Tue, May 12, 2026 at 04:55:15PM +0800, Wangao Wang wrote:
> Unify AVC/HEVC handling by computing codec and lcu_size upfront.
> 
> Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8650-HDK
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/iris/iris_vpu_buffer.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

