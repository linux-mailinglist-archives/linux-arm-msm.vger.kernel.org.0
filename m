Return-Path: <linux-arm-msm+bounces-102796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +OBWOUhn2mnK2AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102796-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 17:22:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA353E0A07
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 17:22:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B5869300D354
	for <lists+linux-arm-msm@lfdr.de>; Sat, 11 Apr 2026 15:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFE68242D6A;
	Sat, 11 Apr 2026 15:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1ZS4E7j";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gtduXwcj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9EEA38758A
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 15:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775920965; cv=pass; b=o7UHzUKDT01w79uoSJcd97g15qhjg7Yg6rTxwC6ytACtZjYZcp7xipalJit87G7Y78dr+AVQuT0Y+Kau77FOCORrmC9yf2zsF13V0hOsxUdVXFMlZ6UNnNxZU0MguiLoeqO+Eqg+l9z4edogh/Qjq4DSTt3IL5bPWkWDzyCjBs8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775920965; c=relaxed/simple;
	bh=P1JeP+rz34qPruI/FE7AKSR5hi/zqp2FUF9xQZMzyUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Lmb/bV+jhjdTbKH3QKb4ppYdBF/w3eAS1AV82i7iuQGaLeeCjL50ZLmcPhNA5QhEZQGENNn+NYyu3lpcG4ebVd9qQDni1YPGJIOhBV7GOFRyz8NWc/zlsjU5+hFmZ21Q16w0IgWy/KXqZakbDEkIR2dpXKsiWXsjuluPalPiMkU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=I1ZS4E7j; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gtduXwcj; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63B4UQ0s3680968
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 15:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=vKvdTnORaHFuK/1CL2XcGIMBxSPWOIyal4x5nux2nvw=; b=I1
	ZS4E7jy6AppONFbfFvty63VQDI4VlIKcvxz++6CxuFSOTITFqKTPW6knS4immDtk
	asWOnOIE/da4BYIJwGFgAFNw0JJWfNbw3iGhic3c7KkTGJbhY1gub5ay6CGCAG80
	HenB+z8swXy2jpKibHh4AzqpjJkpWp1g4BfNsWQxHkkSwvvNLYz9wBV1kd+6O3m1
	T2ZANyQS1aZH0LDyOQSMrTuS+6k0N5DFCugx0sAJF5tHCMNCm4QyntRPVoKeP5C6
	HsVq31BS7mP1zdBr4d5REmzifKmsLm9f8MTXqqMyoNSavdO2lDSzm2MARkMdNi1V
	YZwivvKw0fZr6abQSRJg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0gvyy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 15:22:43 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-46ebf50edc8so3818392b6e.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 08:22:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775920963; cv=none;
        d=google.com; s=arc-20240605;
        b=Z1QXR5sDYZPkf4x8nleX21R1bvGhYkAuKkiVJ7nrQSWBW7gxUT/l+i+kQzQccHK+c5
         4u9acJOy8XZKNHOiFd8jC+9Ur+Qclqc2hrvIGymT5yqvdwUWKam2+POUlDaAELIq8dzU
         uC9DELd26fK0gy7ivOuknmQ3na75mRfRZoueXMjZlTHXB/j1XNmWW5SBb2mth7k6cGkq
         si1HE+ViOxVIEulkMHh2N0ElDBtd5ORhdWF0AGO0O3QTNPYSSFdJXpznW4ETr6pS7kfa
         OnCsX+KD96vHm6QSb2tvnvPzcyuHXQadLm7xb2Mb73U1ZZzyP5bh+hc9kwpxGMisNEOL
         i0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=vKvdTnORaHFuK/1CL2XcGIMBxSPWOIyal4x5nux2nvw=;
        fh=Thv4B+FPR5ukdJ9VaSxd7iBLbKCdnmV8DdMFD3O+wgE=;
        b=fgI2yAPdkA+9z+fMwhVHKvRbn93Mo0mBmSNjDAH+TeiLS1LKBnDxIwlXDIzMwIy9it
         4y9HLguiQR9JPxA+ebYn2HIuP1RtaR01FPGzoj657qus3hfnulcgxHMCjo83IugKKuFi
         VRtAC7kdlwh6FCFSfLrzMrGFLSImb3HNWRcuF1yZbhsV1ATWu7xhgwZqDm1g7Aclp4K5
         WGm0aQZZWwMtvNj3hiKz38LZM32AS6sRjO44+/Ph/KhFTdj9FhgJl47uFAjKIVaUplJc
         jEzhaZraD2Cnxx09jsfmoPCRi+uz6O2bpbQ9T6wYN84GS5qt8Ak93J2U8L8vZzuhh8TL
         Nm5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775920963; x=1776525763; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vKvdTnORaHFuK/1CL2XcGIMBxSPWOIyal4x5nux2nvw=;
        b=gtduXwcj4A2M2Bnt/2ejyoOMgQlFARovuZ6Y44ip5mBtOvhLC2v4AzubwOOHnBl+lf
         w/d1TRBB6hF1YCNJybgMkNUe/bCTO0JwYQTSggJ8rhmtl9coDVBYcSQaDmWet4XKSEmP
         pCTfOTPXVh0DX+1qVw++X3jdZiKwb9f41FScz5kzGqAIflpIJHKPsItPTG2OJHBr8jFP
         En37edXT7u+hhFlAO9xem3iiGuby6IQ203teDGnZ4VSwNUIqln4GdnHRmD4orA5ut35P
         9x30/iAaHyOpTmtpCtZf7o/DFCHhjnW9bTWSDCc7PSTdf2jWINMRqKYoxL1LzS+fWYKw
         SQQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775920963; x=1776525763;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vKvdTnORaHFuK/1CL2XcGIMBxSPWOIyal4x5nux2nvw=;
        b=EvuSct9StNuA5+la1ydwYZA9idS0OcfYltq+Z1sB+IFH8oZb2rXGtKrmWOEaptD+7I
         ny1CIJXupos44BC/poGag1VYcq0GQOcXLyEwylcCukQON9bodE5sJhaEWnHlygPCOnMJ
         cF3/t2JNysnS6EHurCVyMkhourCSAeOToRRoBBiADKQgtXsem9YqvFn2UXdIw8YcY5xE
         +WPCz9u36kJsh3LuTWmtmzoDj18dwXo6PpKpyOQM9AVTJtj1rZ7fUIpmrBaPdnOlXZP6
         Jgmj1F3ekMEew2fQ5ybu6ORhoSXkmZwSk3GojeLRPD5JSU94qCbJ24F00yMv7IO5OMoT
         n8/w==
X-Forwarded-Encrypted: i=1; AJvYcCUxtnZ9V5NOmdEJEkXTHhZpjkvzz8SlERxoO6Bc26hsxyGUgM2BqONiAQcSoWo1i4tQmE/y/XpLK2RasQoa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd6s8S69Lf+80jRmE7XFtlsfwEZihBjR8cjqnRg9D32GDiai9f
	BB2PfhwezjlVNAcEV4XstHP1hygTPPB9JGL4jVNAMyTMPZ8/TVFa05yv7teWSWetyPJVkHR6Ytz
	CrXcQWEl/wVFttRjc6J8COb0bBk6cb1bu0lgz7Qb8mzvB0T2/rLSlg1NvuC3rOouCHzYppHIq3h
	aO3GSXgjN/fbXw/EOjcGqV6t8//9MIqjd/5TeXG5Jf7sQ=
X-Gm-Gg: AeBDievyti1xkedYBRbs7F11zUN1rwSm8hJXKQ3dS1Xe9cQSHfR1WA4TIK3Tuqv+WLQ
	EICnpytgRGOXy48oKN8DToEHPwBR1xQLezQKhKCz7GZ4yThJWnhfHcNNK1k/V2IqBEoTn2jnv1N
	gMgzT8QyjJPUPv0/lejdyWObiaSvGsqfYU4s81EklkzP5MDN9B4QdrT1g4TXSdvlRtbkbSpwLIA
	j4QFzSgfRDZqbKeVk92EPuh+Qkr+gxKmfC7eA==
X-Received: by 2002:a05:6808:30a8:b0:450:32f0:4887 with SMTP id 5614622812f47-4789f9ff626mr3831295b6e.31.1775920963036;
        Sat, 11 Apr 2026 08:22:43 -0700 (PDT)
X-Received: by 2002:a05:6808:30a8:b0:450:32f0:4887 with SMTP id
 5614622812f47-4789f9ff626mr3831289b6e.31.1775920962630; Sat, 11 Apr 2026
 08:22:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260411-adreno-fix-ubwc-v3-1-4983156f3f80@oss.qualcomm.com>
In-Reply-To: <20260411-adreno-fix-ubwc-v3-1-4983156f3f80@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Sat, 11 Apr 2026 08:22:31 -0700
X-Gm-Features: AQROBzAkCg2ixkfheB1sFv6waLyf2e4IBAvktrAUcduCO6-KjO2YWa3wU7mSwEE
Message-ID: <CACSVV01cT0kQa_iY2se05MXae4nBGvfHiL4K5m8SFQBkWFi4yQ@mail.gmail.com>
Subject: Re: [PATCH v3] drm/msm/adreno: fix userspace-triggered crash on a2xx-a4xx
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69da6743 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8
 a=dQ27rmbLVP968nd230MA:9 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDExMDEzMyBTYWx0ZWRfX/keyBjThPUXL
 n1H0jjqc1foq1BOuUA5R3WDui5Mr61W3onWzTiFltqOH3//jmjB++Kz3HxgnQXKQm3MsAL1ju58
 KuUDdIMdoeAyxe09JvRi846MjAKAB2AAf/Nocg/4ymx1xlLr+cDDQyBs0tbAmDhgdoCrGLB1TV6
 pkB4M8SFyUiZUrpiEfy1VF6Ata//RY67RD9SUp5Y7W3fl/3600QBTVC1HTRqqj+U5h+t2OuTbLV
 wCvti3kmLh2myESRral8UcZY7KlxYJmWIFZGCNTExCFdFs004hA2bIedlhVdutuJrtGV+qn8mWQ
 B5w8Q44zTUPVfsFmfwU0QOhqsbtfuSxrx5ZR3Z3fRDyur+FCsu4mUMobcxDN2vSTk1ptFw7b9RJ
 Od+O+Hb1UslCvE0U4V9h7kOeGRicl8dOm2VcwlrsksMPWolLJk8WzaJoohGwDoUnME9izhxZRN1
 7aOCUIHu8RwxXxCr4wA==
X-Proofpoint-ORIG-GUID: ImE5yzmKYhXBcwEjxRFsszwrKNSqjGZt
X-Proofpoint-GUID: ImE5yzmKYhXBcwEjxRFsszwrKNSqjGZt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604110133
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102796-lists,linux-arm-msm=lfdr.de];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[poorly.run,kernel.org,oss.qualcomm.com,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[rob.clark@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	NEURAL_HAM(-0.00)[-1.000];
	HAS_REPLYTO(0.00)[rob.clark@oss.qualcomm.com];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,msgid.link:url,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:replyto]
X-Rspamd-Queue-Id: 8CA353E0A07
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 11, 2026 at 7:59=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> Before a5xx Adreno driver will not try fetching UBWC params (because
> those generations didn't support UBWC anyway), however it's still
> possible to query UBWC-related params from the userspace, triggering
> possible NULL pointer dereference. Check for UBWC config in
> adreno_get_param() and return sane defaults if there is none.
>
> Fixes: a452510aad53 ("drm/msm/adreno: Switch to the common UBWC config st=
ruct")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

> ---
> Changes in v3:
> - Switched to UERR (Rob)
> - Link to v2: https://patch.msgid.link/20260407-adreno-fix-ubwc-v2-1-7ff7=
3624635e@oss.qualcomm.com
>
> Changes in v2:
> - Changed adreno_get_param() return -ENOENT for affected params (Rob)
> - Link to v1: https://patch.msgid.link/20260407-adreno-fix-ubwc-v1-1-bb2b=
09450b87@oss.qualcomm.com
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/ms=
m/adreno/adreno_gpu.c
> index 66f80f2d12f9..02f60b33ea1d 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -424,15 +424,21 @@ int adreno_get_param(struct msm_gpu *gpu, struct ms=
m_context *ctx,
>                 *value =3D vm->mm_range;
>                 return 0;
>         case MSM_PARAM_HIGHEST_BANK_BIT:
> +               if (!adreno_gpu->ubwc_config)
> +                       return UERR(ENOENT, drm, "no UBWC on this platfor=
m");
>                 *value =3D adreno_gpu->ubwc_config->highest_bank_bit;
>                 return 0;
>         case MSM_PARAM_RAYTRACING:
>                 *value =3D adreno_gpu->has_ray_tracing;
>                 return 0;
>         case MSM_PARAM_UBWC_SWIZZLE:
> +               if (!adreno_gpu->ubwc_config)
> +                       return UERR(ENOENT, drm, "no UBWC on this platfor=
m");
>                 *value =3D adreno_gpu->ubwc_config->ubwc_swizzle;
>                 return 0;
>         case MSM_PARAM_MACROTILE_MODE:
> +               if (!adreno_gpu->ubwc_config)
> +                       return UERR(ENOENT, drm, "no UBWC on this platfor=
m");
>                 *value =3D adreno_gpu->ubwc_config->macrotile_mode;
>                 return 0;
>         case MSM_PARAM_UCHE_TRAP_BASE:
>
> ---
> base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
> change-id: 20260407-adreno-fix-ubwc-6a2564710e21
>
> Best regards,
> --
> With best wishes
> Dmitry
>

