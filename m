Return-Path: <linux-arm-msm+bounces-94033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6OaaIqOfnmlPWgQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94033-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:07:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B017192F8D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 08:07:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C58E3300AB0B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 25 Feb 2026 07:07:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FFF829DB65;
	Wed, 25 Feb 2026 07:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DUQJ3vmp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RxreKDhU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 436E728B7EA
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772003218; cv=pass; b=c/+NYv/XENzjPRuVfxW6/yVOqKGgSTPQejJQZSP1Fa+OUqujP2UFORhy2KEm0gSyhsa7S42Qq9la8Kbz/X+UiU9ta9RHlWIfe1yY+jIVmSh47awpqHSHgDXkdxzU3JWwuBi5uqUvONOplyfaPFfLlaafd7ewtBs1vxa1whv3YBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772003218; c=relaxed/simple;
	bh=6jedk5b8lwL6ojvkceAkX24NwJEm2kKc92vfb/gSp3o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TL0InN5Hx5eXiAv7z3MjpgRQOy0lp9rL0jzemOfi6Fqm54iILZuSTVQ1QKzgov2mwJiFuZP97OiYWHJfzbAPxxMz4596FWgqv78d96Gg7GQ6bRdXj9aiCP6bZPEQlA8geIBDzHu8OgzaEqMq/7GFMBquPZ7QWkbBd2m7wFK3kTY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DUQJ3vmp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RxreKDhU; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P2HGnq583439
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:06:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6jedk5b8lwL6ojvkceAkX24NwJEm2kKc92vfb/gSp3o=; b=DUQJ3vmp4/U18oMl
	nXQdyKKCK5JLc+aJ2FSTOsDrN6Il2mkszwy6jYmiius8IvyA4Khcf+IBhzfymNEI
	KVo1EVIgFB0Pd35E0+dDaaM89TsZWAJXRKEaH0QQK9keY/Q4zvmQs8y0KqVUENbV
	rWnYpxfWBuO82hVqe19CaeaYkkZLIYVAJnbJlgk8X/AQ/Xrq+980ZucvMZ9S2/58
	9iOvLCI2UR8kYugeiSyYGjvAvq9bgXCs3r3wCe0Pc21pQ2cZR903WNxwmk/CBmUQ
	0VHVRUi9fi6kCKNS5U3CHj2/FNSThyWtzTaBKx2J3VUsa1c/Xk/PpOajXoc7MMcY
	V6JA9A==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chg2gt8qs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Feb 2026 07:06:55 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-8954803bd74so70044596d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Feb 2026 23:06:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772003215; cv=none;
        d=google.com; s=arc-20240605;
        b=HVNUxFzEUd3qIQ30wvFv6pDBCCdy/HhK0G3DCb37Htl/3gKM/8QlMdMytfbsV1a3oF
         h+/6sX5fTw62y9b4hKfvzopg7PLDq6T9W+23aj4xycCl70lM9vPYUVZ0zMcFomG0KMS4
         0RdeeydGeynwWiRd1nrbTeEnei6gAgwUbpncxfJM/YkPoHQEGSpO79eF+woWSvhg4MvV
         Dw8L39MjQLSCvA8IaTQF9tC0H3nZLKUumCCGdVkLnbLuyavX9zaC2buRZ3/TdVdbTa+a
         gr0RQ62P8TJ25R9ZiaUf1huNWr7WPt52xKAn6yGzopDJRh5wZBAphm6go7E7LmCVpY7E
         W9xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6jedk5b8lwL6ojvkceAkX24NwJEm2kKc92vfb/gSp3o=;
        fh=tbKwaPH8N6YgLLYhLEiHZ6/9McEhhnJj4ME0mqT7EbA=;
        b=SeZ31pTnZ83IvGKn/lLkm1lkoYjrl+7UFvyDn10Mb4++6lyeaK/jHeQMhYj9NoV+sd
         fsCK8dVHXotz7PkdZmoZhz9qSL/B0NYg+1f5D2kzVfqVAkiTsz1XZxJp1BrbqshIYSAZ
         H/bKoBuP+M2TVCAjsR1YqXEU1d8OEki1nwKOGFwT1+7sHW4YlyK0X4iDXo4xx+O0o6vp
         WXwbAShwpMYdTzh26VYxeruFd6Xq+Wj5Wkj/x9hJ+YebvuIxfPtfKM8zqEfTvXj8PdoO
         2FlYGiLTCbUpYk5AXPZMkIhouWv/eXSU6D2iIUN52cMK6HlRDEDZNilpPjoqELnJleys
         mBYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772003215; x=1772608015; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6jedk5b8lwL6ojvkceAkX24NwJEm2kKc92vfb/gSp3o=;
        b=RxreKDhUgvO9NQPY/+7EH0asEtepOouMxA/06ymqqGpNQ4lDdDRBfQc5Dtt2L33PJD
         hiWFe+Ryv7MhG+5qDTNNzl7QkgDem9KE8btYZchWb4fzvPRnHijWBy0Tk61vkpcbpwmJ
         i3URyk2tCIntv/0a6ml/ATz2nNMgR+K+egb+N73iy2DEhKP+8NUfDasR8ZnX2NLlI2e0
         nco6SX89SdTY4CEdGkSc5gm8lIXS/JZ1ONeSTfFNvsMU6DRY1B8N1VWGcvrNfRijWZ36
         Ne72IXRLbw0hKyEQiNe6vKMyQ5c4mBY51eK1+ZK1JlN4PLspS1XBz5REhL/sIUsDDcBo
         1WSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772003215; x=1772608015;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6jedk5b8lwL6ojvkceAkX24NwJEm2kKc92vfb/gSp3o=;
        b=WlsYGDAmZCzuWsHclP8ODqckHvQHwpiXJj4quAWhaVEUv00MCzkLuFitazFeMM9Dwy
         4DF9HRcLEo0+paM4+IIT04O/hYUUSUq6lF/tcB6E1nVJjYM5xkHw6B8UKnjGT53Vv0ED
         ZltmruSamfrSN1Hd5P9EDm9XOB/DYmLRgW40hWJn7EcVI5ITppgKsQY57nLVaX5NRyqs
         rQKPo1MNYOknM4GUENHJ1nSR1/qUeY4mZWsgdu20w7z1hdZtjlXPx/o7BRdtrqE6SLN4
         h4u0DvqB423FmKAsHpmQSvw4xFkx7ITLkbiTB4ozlIRFLsKriXtDVOcQn+igGS8m6ek3
         r2Iw==
X-Forwarded-Encrypted: i=1; AJvYcCUaUHabJdaXoBSJ5sJ1e3cqKiqG2/gZBXfGxfRLZ3OQCnetOPqeQMZWzgekIM+sPiwmWIVbdPJbcvPZS4j5@vger.kernel.org
X-Gm-Message-State: AOJu0YxnGTXXjanpjycsZXmRfaIM3OfrRCQr0OJHv2S2QozoKZMZ7iRl
	RgV55cKafEO7hUX+upYB2f1lg2q+5C4JStvwW10CX3HxDViIT2yGkrAqUfINCGWckHuhHZA7QNe
	T8t0hPLHxrW2KwAP6XvWrPZG31oc5oRvDTcVIG5KjWHou0w37xI1zNRbgiWvBWLGFJaOk/a0+hB
	1glURwky4J8aCLH+tQKllhyOVbkue9nwvbx8XRy2k8UlhWGSZ1yFKz1w==
X-Gm-Gg: ATEYQzxL0xH7SZW5LJPRfAQZesI52IhdpZC2s5HLmsYX0O+QIohyTjTE5gXpD5Hjyr2
	wGL9Ybq3x5l638FSI5/GmRUtsKKbcFiTXis4Oxv9icd6rp9zPE+GgtDROIQ9JGCra34+UUQ7/V2
	Sbgw5DYXbHPT4BUvn+RmICzLeOl1NLqqvHdf04kCVyP+9a6+wDCtI6cP8hJMMY6DuACJyFN3+GY
	D8XoFbljKPei3OHYMDPX3fsT0nk2z+h5C9xI/U=
X-Received: by 2002:a05:6214:509e:b0:896:fa50:4c0c with SMTP id 6a1803df08f44-89979d63e82mr227114296d6.53.1772003215234;
        Tue, 24 Feb 2026 23:06:55 -0800 (PST)
X-Received: by 2002:a05:6214:509e:b0:896:fa50:4c0c with SMTP id
 6a1803df08f44-89979d63e82mr227114216d6.53.1772003214811; Tue, 24 Feb 2026
 23:06:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260219152737.728106-1-loic.poulain@oss.qualcomm.com>
 <20260219152737.728106-2-loic.poulain@oss.qualcomm.com> <5d5cf1ab-ba3b-48fc-abc5-5fce86c27c9c@oss.qualcomm.com>
In-Reply-To: <5d5cf1ab-ba3b-48fc-abc5-5fce86c27c9c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 08:06:43 +0100
X-Gm-Features: AaiRm539ntmjMqjEZzvDlOnzaPaPKHMk4zproJmWAUp_2TgLmPBzR-2ZXRNbvWY
Message-ID: <CAFEp6-0etP-e=4UTs6=4kqsrh-0iEY=UQj6H-m9c9Sq8=D6kJA@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: qcom: camss: vfe-340: Proper client handling
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: bryan.odonoghue@linaro.org, rfoss@kernel.org, todor.too@gmail.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        mchehab@kernel.org, vladimir.zapolskiy@linaro.org,
        johannes.goede@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: qafAUSe--ReiflQzqDkhYlYg0EIWpl3o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA2OCBTYWx0ZWRfX5IjpTlzYqf0I
 KhZcLddQP/hiIrnWPiVEoRZNHHoF0Cw/HNS3yCF8wHZCbcasW42fW3j6LCxzRuNPDUnEOBpypTE
 6lsw6bYrE7TTXL9/3BPPd8Bb4+e1yhWln29TnKyPrD68Z+OYhPiHWW5oY/vMdQjUAo/vbOqqvy+
 kYlqIPMpOqJ7menfYDIM583pdaANs9Kwb7/uU70uzSdtzYmt/9eM3lBPaiZPb+Cicjs/fbqZZ/h
 XvmpgKO0eWim4hBrYMAGfV6brizz4A6Zaka/4hk0m5hMvVMz8PTnnkK4gWw1eW9WtPVGbhsbMyH
 bcAyOJoO3F80IswAPBTd8hqami4ralmmwP3i2v4a7wxEQZwMJPkqTVBRHOJKJ1gZP+H8aW6H520
 xnTAHpA7SJH/M5z3su822MF68aSLItbgMl6n1V/elmEoHPDNBkUtyzluqdvNqCS4tkB/M1KVp7J
 hTBynMZJFHiqYzjYwTA==
X-Authority-Analysis: v=2.4 cv=ftHRpV4f c=1 sm=1 tr=0 ts=699e9f90 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=78OocEQVKo9_0ljsv9sA:9
 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: qafAUSe--ReiflQzqDkhYlYg0EIWpl3o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250068
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linaro.org,kernel.org,gmail.com,vger.kernel.org,oss.qualcomm.com];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	TAGGED_FROM(0.00)[bounces-94033-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:dkim]
X-Rspamd-Queue-Id: 2B017192F8D
X-Rspamd-Action: no action

On Thu, Feb 19, 2026 at 4:29=E2=80=AFPM Konrad Dybcio
<konrad.dybcio@oss.qualcomm.com> wrote:
>
> On 2/19/26 4:27 PM, Loic Poulain wrote:
> > We need to properly map camss WM index to our internal WM client
> > instance. Today we're only support RDI interfaces with the RDI_WM
> > macro, introduce a __wm_to_client helper to support any interface.
>
> Do they actually differ between platforms, or can we simply remodel the
> driver defines?

They can differ, yes, not all platforms have the same order and number
of write engines/clients.

Regards,
Loic

