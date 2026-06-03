Return-Path: <linux-arm-msm+bounces-110925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FRR0AJ3+H2rttgAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110925-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 12:14:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CE9636747
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 12:14:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=pqI1t6xh;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=cSD5vERz;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110925-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110925-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E5033305DB75
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2026 10:14:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681B942B751;
	Wed,  3 Jun 2026 10:14:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 304E644BCA1
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jun 2026 10:14:35 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481677; cv=pass; b=CLS30AgjJ3AK7wkCcr2wzJmSbaJvNJm41omD8WuIOFdquwld9Slf9xrfSAUuo3SJ0zv+MJxz1dxaSw0vHQXgZI5Bjr5k19y4UktskBc+ouaNvoquSrsBqA9bSAotUk6UQst+cNbf0F7HRrtgc+LnDmJFXe3hJg1yA9TVIWJmLWk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481677; c=relaxed/simple;
	bh=1IDDVycyuYiAT73daLM5xt6RQklHIkSdwBOUQrAETm4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gGx4aFtX8x+Vk6jawpM9F2uTjydve202mo+bUwwV3p6YOY/ayzRT3SyU8xKsaDIgMpm6+p0HmI9Cv7wX2RSVfrbFV81MAg37PrK8Oqw96q0J5DMkZzQ4L+DMjlQH6bZ16Vfy/a8mafuFl9LxbNBOlPisjwddRzh+j+Mg4Z2mBmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqI1t6xh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cSD5vERz; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65395nGk780663
	for <linux-arm-msm@vger.kernel.org>; Wed, 3 Jun 2026 10:14:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ghCWI4MXSHnJlpFxIlCK4HFx0WZhMo7JQ6tx6m7dWpo=; b=pqI1t6xh57ry99Yi
	cThiawRQKNtYIeJAveL6wcu8o/yZCFQjfVPCD/qlQgzLSxoArBopaIrXVnopnnL4
	6qKw9+jMcOxxG2eWOWObJBh0dQl+R0lvz+GZ+YARVfTs8zE6srmC/ZAbalX2+b/g
	Z55a3X/j86C7J9uoMTRGNORlZ5uWRVh+zw1jJ3/lPr5qIKHHGLnh9BmdUEMkOCtD
	IPAvexghdEf/aU9EbLpOaYLHNM23wBvmUF5UuMSi+iJ14wpbzWAvQQllrUJwThOY
	+3SYv5KOht4hjNpyTW7gbugxnvW0Hho7PYPfJ2qqna/5h3gFHggTW9yv1qcoA46H
	5NtoBg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ejhbb09vq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 10:14:35 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5177bddf6e0so10420881cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jun 2026 03:14:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780481674; cv=none;
        d=google.com; s=arc-20240605;
        b=UW+Q+HEv9WICsq0HAWP2kTxBLJJlW2shV8ysEvDVstR9CymLqBWbKFQ3Wxz5V4BBWL
         9QcZXKIyDw7uT0w+T6rDQI3zyW6RmH58eW/SaaaDHhAolLrmO8GV+mj7hfEXz2XuArPQ
         RY58tGUneRo0FEtsCfI49RaTKrNbZYj+DRVoyEIvqhgr0nIr6BCJeV+B5Vuz03TLTPQe
         36wSQJuBQvV1lAE9ditBjSqpAI84bDwfGWCSqtzso07KE9xpt/W/bHYOA5O0KkTqrsxc
         e8n3MBmpxlFH75z0aWx6WJ39GaciA2SQzbfHSUCKw7g9tndmZUmDqxGWYAA5Zv4zdlnJ
         QIKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ghCWI4MXSHnJlpFxIlCK4HFx0WZhMo7JQ6tx6m7dWpo=;
        fh=Iegt1wmTTsh/xYsWUBiEc+n2CFbXmJyqZXfwQPlbixk=;
        b=UN4DPQOFrx/BpWajxqhQ5wdWVWiDn3VeqQ0fi4p31i+/om1li9b72uL3yxfgzu8lEU
         xGvDM95qMmvZCdNnTQirn2st8ljYl+l4pwApLtPFI7i7eVW1mte9W0cma2DTnZl0rQoe
         pIMd7isrnjM8WzMzLYTks4nMw7VaU417DT/TeZSVL42OpxGYatxSY0Qst8Tji8OZ1pN6
         1gjYgjs302/02j/g6NYoSPLClcK7VDIIMa/ryjnR/epOwvDLFn8p/s7pOdj9nGACtItP
         3uZtYRCCw2/c0Qozmiqn4968AcY1HtVJ8XHNh75hKwz8y6a5N/L4pp212agad1+/strh
         pMPA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780481674; x=1781086474; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ghCWI4MXSHnJlpFxIlCK4HFx0WZhMo7JQ6tx6m7dWpo=;
        b=cSD5vERzOgNmHXbPTlmT4P+1veZFxeKfhC2d1UdUeGVMelE2eTjfwKDH6Um1RB+Mt5
         TBiJ2EmHjY1Sd2WrUgsHMUQVJjPeFDBYmpWSHUKWHDXhvrNiMz1b8zXIxGPXk/eC2Jh3
         4JSVnM7fjTqCWLKPqEKiITAmIU1mZA1L/Nl9z6Ea3AVlC3nMRlwcjkfD70CQffips7Yj
         BDp8ZdchPoCXtvwjGnDK3/zw3OmCDBsAw3MyIWAt5quwheLMFe2vzsglXjysP4fq7tqd
         wWZy0829w26He28DEFwerTslMSG2chmaUREgAeLz6d+xhmdsupCaJXF/hUrNorhmbaZz
         pEdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481674; x=1781086474;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ghCWI4MXSHnJlpFxIlCK4HFx0WZhMo7JQ6tx6m7dWpo=;
        b=ajoBmdiaCj4TfpSf9EOPScpOm8WSgThDGgKFzJgHOJCfJzrILL6HRnuzLuXyFEe/XY
         IJTl4d2YA/5lSHAhEGCgjgMiC0RHbE6O7VIYQ5tRY2HOuFZ/naVEd0XiA6sOIiPHPZgS
         VUm5fXY3Wqjdr2T3IMqqMvLff/Qy6dA8jrlB5lZtKk9UyNhg21GqrB2+y3gUUD8VN8he
         5aJAsIovLbHVSQHa4niHtMvS2nprl4U8MOHvdzFOs7igvNp27BHk9G98YPgVmiIu920k
         qBKv9RM2bGnWOs3V9ca5A5DUEQ0wOasbNxj04jWR3Hh4WHUmmAezMtkUiiLZ2EovYqH5
         /Kww==
X-Forwarded-Encrypted: i=1; AFNElJ8p6VVpS6FW5mX2Vd4b+JkOWduXHS8psH/IOawLRA6NEcoJqhKdLw8Ge/sphqTku/PjwMjgxOlbz6gGF5cK@vger.kernel.org
X-Gm-Message-State: AOJu0YyAfYhhcXg2GRUXDjRN7c6mUZGOtdNs/Mav4xteLpKRgbmcMQLP
	3T3kEu+w4SQ2B1Mky8T0HWaryX7Ptx7EGal08tZaT+lVcdaBppLSQeT/2N7x2dDXLsmwBqLfogh
	Ie7HWWHp9B8g0frwp39GuqBahkEj02OYvyB2tQN2HMGftbje4ej+d6rkAnbyDxUQJrz/2dKpLro
	ZIU4tfk0Vwsn9iGc8AZjfzkjrqVK8H0bhHuqOix1VVT9Y=
X-Gm-Gg: Acq92OGxsKu5jl6F5vZFz7+fdfzrrTsu/GD+IOhd6REQ4gKv4kvu2X0tyqfHtHvTCL9
	sb2HIpN1TP3Hi2cKnc4nh5OIwHZHEBxUANz6xvWQ+A9QXUAxk3BTjttTpRmwuiKhdOYhC/emaKr
	D7dpj53zrRYCrYv2gE9QNrwUDuetr4CahHHE6O2euj5iTa9KoZA/PhBF0R/ietxBGvVO6/QIkNm
	QS+eRRSaKLdqDFq
X-Received: by 2002:a05:622a:4b0f:b0:50d:ea1f:f99f with SMTP id d75a77b69052e-51779828a24mr25487671cf.31.1780481674581;
        Wed, 03 Jun 2026 03:14:34 -0700 (PDT)
X-Received: by 2002:a05:622a:4b0f:b0:50d:ea1f:f99f with SMTP id
 d75a77b69052e-51779828a24mr25487271cf.31.1780481673950; Wed, 03 Jun 2026
 03:14:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422083341.84390-2-krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260422083341.84390-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Wed, 3 Jun 2026 12:14:22 +0200
X-Gm-Features: AVHnY4K9f5e64zUzf2cnhxXXE_-89SpPyP6r7QenYJF8MW9ObIsbNMowlyBMopY
Message-ID: <CAPx+jO-S-quvUj_mc5fTWwF9FiB8ZCed8eMj4hsAfhVp0kAJGA@mail.gmail.com>
Subject: Re: [PATCH] pmdomain: qcom: Unify user-visible "Qualcomm" name
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "=Bjorn Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: _JS9_6_dlmZbmDA1C4qZncc0R9OCNXcN
X-Authority-Analysis: v=2.4 cv=R74z39RX c=1 sm=1 tr=0 ts=6a1ffe8b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=S_mEzXSMrObp8K1ydAIA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: _JS9_6_dlmZbmDA1C4qZncc0R9OCNXcN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAzMDA5NyBTYWx0ZWRfX6QNs84Jm2npY
 30TLKSUvyo/0Nh9iwpRMjbjg4SJFRYFROeNtLL1lR4Bflq3c7ERArOrW8I7CG5lDZQ6fvssSH5H
 utL3E81/EcQD33cyoquE8De7QTXa6np7pWb3pc0xqFcAWY+Qh4m9iobtiOTqNU6hhDUVNAbrbOx
 VKPCXizhDLp9fwv4oiiNzmo0P0zpT9GrzWGqrwoi1g48fadF334ttvKWuZsBESkkVIrAuUh9bRR
 75c9VzDt121jKqMUSonM8dzeuk/rjB1pDCI5vgF1AXflQIjE3yu0qCf1DrDuytUBMpldnflfJ77
 ehjn2wSBbMU6A4dhTyJhfzFXRhtAa+yRJTbc4zEPg9y5mm5BZ8hdbD9oFlWDwEIZyMgyKLRBmsg
 djkk9hpEGybRIXb12aoGh4pL9TSgAL8mZcyAlr4drahO+keuPaH4fRMOv8+W5rp0EtqF4VDHVks
 ZRsccUquALEVbnnseyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-03_03,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606030097
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-110925-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:krzysztof.kozlowski@oss.qualcomm.com,m:ulfh@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-pm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[7];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:from_mime,oss.qualcomm.com:dkim,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 82CE9636747

On Wed, Apr 22, 2026 at 10:33=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@oss.qualcomm.com> wrote:
>
> Various names for Qualcomm as a company are used in user-visible config
> options: QCOM, Qualcomm and Qualcomm Technologies.  Switch to unified
> "Qualcomm" so it will be easier for users to identify the options when
> for example running menuconfig.
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied for next, thanks!

Kind regards
Uffe


>
> ---
>
> And "Qualcomm Technologies" has even variations over the tree:
> Qualcomm Technologies
> Qualcomm Technologies Inc.
> Qualcomm Technologies, Inc.
>
> I am doing this tree wide:
> https://lore.kernel.org/all/?q=3Df%3Akrzysztof+s%3A%22Unify+user-visible%=
22+s%3AQualcomm
> ---
>  drivers/pmdomain/qcom/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/pmdomain/qcom/Kconfig b/drivers/pmdomain/qcom/Kconfi=
g
> index 72cbcfe7a0c9..4abd43a88d08 100644
> --- a/drivers/pmdomain/qcom/Kconfig
> +++ b/drivers/pmdomain/qcom/Kconfig
> @@ -2,7 +2,7 @@
>  menu "Qualcomm PM Domains"
>
>  config QCOM_CPR
> -       tristate "QCOM Core Power Reduction (CPR) support"
> +       tristate "Qualcomm Core Power Reduction (CPR) support"
>         depends on (ARCH_QCOM || COMPILE_TEST) && HAS_IOMEM
>         select PM_OPP
>         select REGMAP
> --
> 2.51.0

