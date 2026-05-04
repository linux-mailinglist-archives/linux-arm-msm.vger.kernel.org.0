Return-Path: <linux-arm-msm+bounces-105754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFcCI+Gn+Gl+xgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105754-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 16:06:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A4E4BE86D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 04 May 2026 16:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3C1903008085
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2026 13:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 675373DEAD6;
	Mon,  4 May 2026 13:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iIyL0FNX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I5O/eWds"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA4F3D6CBE
	for <linux-arm-msm@vger.kernel.org>; Mon,  4 May 2026 13:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777903148; cv=none; b=DZXWajgq+PGEaAT+tiZRUYS3Q/kHGX35Z1BSUSj+6elVgBDRMm4y2WxNHeWmoNox49aWkNRNi3YncygXNN0u5RwdPsbBD3vwzyWteJolEU3Pl886ImK4VyU2KCe/GodMt57HqyuQ31a3BdhvCEESvKkKNulhsJFpwAQ+tpRknZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777903148; c=relaxed/simple;
	bh=y15kLs3sGaEX6SUswDVtuu6Y0cf0YKiM/wbOTXt7rjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oavXL/40NqKVJZf3QhBLPAa0tdTwJho4yuI/RhSBr8JynsVGCsp50FihHQsygsjNNIgMP9gTbdxVYoBNTD8oE0CLO5PJ0iJyVb7rJNlmCNJb9d+Uf3gHvJoL4iIy5LEHQkIxLT+T9sHkWp51okTa37KeANh/3mD0t6ZrXCxzXdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iIyL0FNX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I5O/eWds; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 644B45lp2850301
	for <linux-arm-msm@vger.kernel.org>; Mon, 4 May 2026 13:59:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=aniRG2KoHodHG6kSw+zQ8UoN
	MbU4RgeqkXy4ZEzC3SI=; b=iIyL0FNXbrkth56Tg4Yo1zYS1f8HxB3V5F9us0Gn
	F7/RdQTeRGZNlU0D6GLz1B4yTsaGbb4IDzW7UoSi622aU51hgLbtNpZ2d/19/t9H
	HNoEpYH1kKi6b9r1QQ5V4x08tzOEfQYBq5VpUjC4RaFY/Z7X99xM/q7p0nPKpm9j
	CM9SSEQQ3O0gBMm/+DEdI5W2MeTr0kU2VMHOZkMMOTjcSZ61AZJuWRJfnAcBY1oB
	Jyy5vIf+ocsTw3HO4IwVyZLNBISg/cj1Ypv36EQPbqHL7HwK2kfafPMMX/ven/9x
	Uf4BLJqoWUYmBXrZ3ujG2nPwP331M2pvGdGVBrc9F31mdw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwxk1brx3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 13:59:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50ff051e189so107346571cf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 May 2026 06:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777903145; x=1778507945; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aniRG2KoHodHG6kSw+zQ8UoNMbU4RgeqkXy4ZEzC3SI=;
        b=I5O/eWdsut7pb8VmeJ9o5b8PK0V4gs3YhpYWm0xtZHp5wKdEaZUg+KPCwirQc7nY3d
         iIgkR6b3ogxkW5TtUpIqUcPs8dnKeve3qUYPLdSsPvrfPEyYf99DvRm+BVzwv4SlR23P
         ogmvI80+PH4RLYP8l5G5lZFe9rBU2+BkkQDGG7Ua1MJBBWBnkypEEQrewZQdCiKOE4Sy
         V2/IjwoipfXdHmCYHDZj2LK9SqOa+/1vOMP6ymPpihqCnzNm2R8gwqwYF5nvHHARqSbC
         xndOasUkqjckWXP9Xwk+YFQ2ghOsWUOTFRpkdvnzL6ZToQF5u9QJz9NFr24WZ+1J0TX4
         Vl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777903145; x=1778507945;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aniRG2KoHodHG6kSw+zQ8UoNMbU4RgeqkXy4ZEzC3SI=;
        b=rpFujiZxeYg4bVvNM7CRvGBKkjLbZZP4LLsLk0M9XMLqBLzwz/WAV+PccFdN7J9Mc7
         uJbPX/A0J//FRvGpMsobDVfFRE087D4zSrPuZlKQjumvaJDhPFROp0XE8mI4yXOVX1ch
         t9hxHjoh8x9GJSXM9mU6FoTqwe7tsx5QVrCLBzxxS74JdETPrje8HZdAwxMab6wB7ScX
         ej+LZvhj4ocXujtDDKy4wygU1nwyuRJ4lBw+L0mwH2d1kpKLk09V6l3r+/aK6xA7rpfq
         aW0ZymNEW64z0LgKeZHCzux36DNTEhFH5FOWgGOe+AFiHry8fEzH+e/CurkrkcRcV6mf
         dufg==
X-Forwarded-Encrypted: i=1; AFNElJ9LbSJjyAeQBEzhUInOtY7ggVI/7h7ow7ZZUoFLbKzFXdZwtEQeYJwhY3cw6C6A/REhN72NbcD2NfqtYNVs@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/4WGQB4jhTDN3rK+dPjihQRCZbNQR0T4Jq2TiM9RdWZf3+Mj7
	5w7YJ0di8W0bAR/rnEhs/qDccTTpT0tms1ekcuG+TMsLfEEyGUkXk/ys+Rf4H6lBq/iHQlhrdj6
	geF3x3/MGjWSHRHdjDEzuM+hXRBPHZ1nhNV3F6alGLkAxxvlLD7EzSVQVGGgglajyyveg
X-Gm-Gg: AeBDiesjoJgoGieyA88q6YsXTHkZITeg+hcSAs+g0I3F0aG3Ef0t+8NFwKYE42aO/BK
	144lXPtRh+U4sM9hQX0XNnaEfsUy5Rq7zmDvSTpLZCa8qxTTCibZFxdXFrs0rwlrk2e/bmawVEM
	a3UgMbQXJsbIl9DzA/Dmb6ASa+0Yp39ZJvIeAXMVMV0OEF4IkOpMq5V7YZA6v+st4/3d6mYPK2v
	6x32NWWDYFWgA0iwL6vfdZBBj39htSbXN8FFDZGRaQ3aQjfiWHij4QX/g/iTTYKKTUpuwwA3G5m
	9WpuxlbTLOHfaXFQajYfoqiot2bJHLH4q9fIZLnbN8T46gGprhfysLDDxjNCd5lOEFOvLzimpZw
	HIdaKaEOhweZaUF4yZzldxoitW55+zbv7S5KVcZBH6ObTyawG89zbNLamlbYc0pa+bTTA2026S4
	/fefyvYLj/6p+X/6wnL0H1YZiaZZ83km6XyeJPmNLN7nx1cA==
X-Received: by 2002:a05:622a:514:b0:50d:8905:7cc7 with SMTP id d75a77b69052e-5104bcb8b9bmr138356631cf.0.1777903144987;
        Mon, 04 May 2026 06:59:04 -0700 (PDT)
X-Received: by 2002:a05:622a:514:b0:50d:8905:7cc7 with SMTP id d75a77b69052e-5104bcb8b9bmr138356121cf.0.1777903144486;
        Mon, 04 May 2026 06:59:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a85c230e5asm2994316e87.33.2026.05.04.06.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 06:59:03 -0700 (PDT)
Date: Mon, 4 May 2026 16:59:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/2] interconnect: qcom: add Shikra interconnect
 provider driver
Message-ID: <m6z4ha22u7urf6yd7atkizhii5fbnl7golkdw5v76e4pmfcpvv@r7ppowo3pfcq>
References: <20260504-shikra_icc-v2-0-81076171e010@oss.qualcomm.com>
 <20260504-shikra_icc-v2-2-81076171e010@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260504-shikra_icc-v2-2-81076171e010@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDE0NSBTYWx0ZWRfX/Ym32nofZYlu
 19plQrG+YCRXS938TIOtNp/ZCbKPPTzMQv57jGFwSdPHvMzrwjeL/AchKVb/zl3kW3BJWPHhBzs
 552NkckyHCrI0YPXaescTq4L1mx838Fe5HKxrXFJuYC0xs8hZadBAf3/X4XFgx5auNVO2AKsfwr
 wlFgi4bY8fmhETfBSP8dQgCBHS49V/xcT/SEJT82GV5VLgIcCcws+8FAW+DrKOMZ7nijgLFrPkM
 p0yPA/kYJv7icrwRszhWooD3KWOnrM20mTD+PADzagUX9vPnCheyK7hfSYnD/T9TiR+0ppm1sCA
 3Uw+H833S7hOQ9L0hM6YxtT8V2J5msQli+bNrrSgdOsXOrEf6cXllIrmj50Ztz5yNo5Q1v7R1+q
 bIZ2C2fvVYM9e23pQU1z6V2PJW01IgfSG+HN4sLP5icNbASyYTLoMcg7au3adbV8y1q+FWPzwQ9
 xR5d4s/rWDO/x/NMqjA==
X-Proofpoint-GUID: jgL8n1YJL8qqe8csoaFiaDMAB1f2JvuL
X-Authority-Analysis: v=2.4 cv=bb5bluPB c=1 sm=1 tr=0 ts=69f8a629 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=j7VvbvnbhCrZ_lwJNYUA:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: jgL8n1YJL8qqe8csoaFiaDMAB1f2JvuL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040145
X-Rspamd-Queue-Id: A9A4E4BE86D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-105754-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:dkim,qualcomm.com:email];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]

On Mon, May 04, 2026 at 09:41:14AM +0000, Raviteja Laggyshetty wrote:
> Add driver for the Qualcomm interconnect buses found in Shikra
> based platforms. The topology consists of several NoCs that are
> controlled by a remote processor that collects the aggregated
> bandwidth for each master-slave pairs.
> 
> Co-developed-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Odelu Kukatla <odelu.kukatla@oss.qualcomm.com>
> Signed-off-by: Raviteja Laggyshetty <raviteja.laggyshetty@oss.qualcomm.com>
> ---
>  drivers/interconnect/qcom/Kconfig  |    9 +
>  drivers/interconnect/qcom/Makefile |    2 +
>  drivers/interconnect/qcom/shikra.c | 1837 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 1848 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

