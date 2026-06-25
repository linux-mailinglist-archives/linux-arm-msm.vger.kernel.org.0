Return-Path: <linux-arm-msm+bounces-114496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VLVWIxj7PGpcvQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114496-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:55:36 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8176C46E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 11:55:35 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=neHH2+Gq;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=K0pGKOf6;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114496-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114496-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3B213302C176
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2026 09:51:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AE6A305676;
	Thu, 25 Jun 2026 09:51:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9A63BED18
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:51:37 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782381099; cv=pass; b=iQ+bXRmaplcebju/68necxWKbJa8lSpsp4B3hcNhE3VUfMenT5KshwSA+XKYUF+I60TrCkC1dWDzQYlJhJRrsS9hJxqzXy2z9GWB0lgePJs8DMZgrARx4VYWEmrQNk9ZlLdIZkuGRhuw/ofGA7UeeKN/jzokDsT1nNsesuG1NQM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782381099; c=relaxed/simple;
	bh=NXKI/X2JdsZ4JImi2yN22pzvK3RGm6LVHH3NHot9Mzs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E8WEmanaVM+hTsxZmOc/Codx8XR+qR9EUKZ3QPi3ixe9VZszpvq6JD/ZERGDNrDnKsqSn3yiEBNwvL+Uuu0asvNK8N6f3kepO7wHO5AzNSp8c80HOseVkOflk2M9Z7jiQyMRRlAwcPlPqnNVC9DuqC22vxb+mU/ygxjWIVYM7hM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=neHH2+Gq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K0pGKOf6; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65P9js342009320
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:51:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	60fAk3AGCUEygd+ffK7iRw0f1YhHwOSSOFfmJ0pJwAg=; b=neHH2+GqkXm4jA5o
	Hz+Z6gpE0mpPMnGoD1cRYZEBD0zDDrM78UsGS5zMUmjxdSfDa/om//rGGk2AVF00
	KU3lOskymWkC09tz0aJzoH+PM1Mql/CGYpyqFH+Q+87js/mRzQk8mvqdgqLoEp3n
	MD3zB1/mJs4HJXdZNDi/MFnQ4EOffoOnsyDxQZ9EL5DuIRijokgAqVUoPAgdBvza
	9R7ikt4oUbrn9/901ZM6n028Prc+F66flYShREXRYk/BgBdW0ZWJlwIWjoxAw8TP
	NB01WgjrLDRTRMVYPwT1ZOdBIFBCvs4P6Xz1hGYZMv4TX75tQshiz/w7pDV4YZ/7
	/Im4Vg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f0uhmhkkn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 09:51:36 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9157de5360fso145460285a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2026 02:51:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782381096; cv=none;
        d=google.com; s=arc-20260327;
        b=ZFth4SCyWJ+zi1n9DvyU4GHybMdtAcUVgon4qzAdIzZ0JgzngOsckf4+oYHWyLmrE0
         NRLplTpJtjCuyK1Gt1dVZKF/rkmOy9Grri26pSSTgGcU1rLTPuSiy/1G+9S4YelD8j6f
         UswCrDJEQiqC3BvWwjtRCpVC8sA44FeU8PeJW7E2L/VtV8aq9lYARms3D3RqiWughArx
         7LNMPhdUz7aJH2z37PWYNeK+/mAcKFrHIFUOCBr0p431VlO+rprspR4pe5xcOjKQFT82
         GHhZTk3klyQcrfd5wWIcfBWXbxXU76WHp/XEC1399XCeasS3Gi4D3xSzKcCepYfN1wNt
         gBAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=60fAk3AGCUEygd+ffK7iRw0f1YhHwOSSOFfmJ0pJwAg=;
        fh=rpdLeb+BlkRZDuC2KU8qZ5u90h957N8o9mNEOZ3mNJc=;
        b=Rh9BFCJoNxGdm0k3iJoVqKn2pv42/vHwAGjVcFQvLp+g/g+0ipE+xOZ4Z1Dnpm9sFu
         s3DzdpUqnOdv5L4GISV7OMauJSTa+TEVfPC++nzQ+PxJZ7KxOn+BZZidBKTfwPq4PPMF
         Dex+ioR4Kh0MApssXgg+a/l5a87hcDnIkZQphut8r9oemuHc/En96G3vhO6D0cY+CFNz
         VM1IFY7JO3R7VXHZN2Ko/loyIRQm1E7iSdboXsg+AP1kc4pN9nCcrVuaoKOkmSU2FYct
         +9SUfgB9jV3xL099JUZF7Lez4k+D2gRm3/TWVUubtiLUG4QrPO4eu1FCHT+84EAXufQ2
         g6lQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782381096; x=1782985896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60fAk3AGCUEygd+ffK7iRw0f1YhHwOSSOFfmJ0pJwAg=;
        b=K0pGKOf6Nj1hOVU7/vPFIagniMTTMIq0LZm6+/1WyaN26YL9c7BXnJoH+EB89i86yB
         oBy2Xg3cPwG/VWkMkFZsYBjGMVkBHlDrotZOG2BHEs39DWhzShKB5YA+Bvt1bxy7dFqu
         W5IJG+8gIQQBQxI4dfQv9dVDOsLhNK//S/UXTV9Kwh58EkmFWbdpNcVKzC3YiBQLb/Kn
         NzoOCabnMpESVBy9rc/0+4NT6W6fXR4xsGzE5E8aCA1pTLdSx3L1u/U3zSpak9rfXG16
         QlbnK3lmMmH2faJimZC4+dXx/EmidBKgkpiM+sNV8X4Sx3cRopYrTmpfWsXrY1+qE6jP
         iUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782381096; x=1782985896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=60fAk3AGCUEygd+ffK7iRw0f1YhHwOSSOFfmJ0pJwAg=;
        b=KgdKyx0snSTFn3/ZmMq2JoBy+W/QgX1tDdlVG+bprYjKQrtorrbTqawc2EVkTcylGG
         bqw/AcbDR1vT9XPwLjQU1qoiUgu0gXiKV3+8Xs40tezDL+FQJdmLHNyOB8cSLsGKGdTg
         uOH+jnPBgzIPb2q2Sl6rAicP6WIfkijLJXSDCw39xZJeecTIr2+A0gTLtuM7KkG9qsvT
         102ViK4kGpJAfA8b68FHgX0Q9B/BOOZ64f0SQPmJfqoGGoh7KvMNHOiVDPx2lth9Kb1T
         kKmYp7gcqs/p0xc6kdA4RSsw+E1AQHSqTWuNNGxlo5WafUpoeP8xNlMJzGjkQpMtyIA2
         ZyfQ==
X-Forwarded-Encrypted: i=1; AFNElJ/EOZsX4Lbt5vPdTpJmar134CwPAfiPabtaljBWdjz2BIPQxI5GGDWhqkHlGJNSIj8oFW2vDZjvox7LMH1J@vger.kernel.org
X-Gm-Message-State: AOJu0YzuaQ2W1IddmEeQ6rKy1aiYdOtbFDq8wAyEO6+7d+dzn7j3fG9P
	grUFjfVpJSRWed15ZqMfGn3ZPKrfGqSfAhwgJWhz7zvlXr/5tjS+qF0SKBP9nj2aewA717SIR/N
	9OeXZtcdFsG8gMdi5hb3WL4sHVTFzBYtKX5UN40l4cZDvLhNjo1mEJzTgnmrE/BNt0gAL4OxzXK
	Y7KafJPGJJoaGoyjhLo42WNsMN10aJsJrlHK1TA1b5iqQ=
X-Gm-Gg: AfdE7cnW7zrUOEOzZEoS9PVyPfKhdatzaIShWJAR4r0lsKTvHtOLWmexjdzzjSYSh6M
	NL625q+XWfTGFijdfOygkIWgGZUxMuxjFAHY+vLt4Soxe1Sov3o0d0a0YPY5QdABibWUN0vj4gf
	OeLi4sMpAtlmsKzUiIjEO/SKG0pWzC88QSyGwz4gLDnhR0yqVOSmuezr6/JXIKPvKiJ3OSz+y/a
	YHUo5DHuaRSgQxMF6Es2C1gD7sORAngBQrVdaBea6uKaAZRbUA1VRmYqP2Y6Zb/zIXkE0vqROs+
	RGsXbvOAZr4=
X-Received: by 2002:a05:620a:269a:b0:915:ab5d:6763 with SMTP id af79cd13be357-926039b4cc5mr908910685a.43.1782381096073;
        Thu, 25 Jun 2026 02:51:36 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:915:ab5d:6763 with SMTP id
 af79cd13be357-926039b4cc5mr908908085a.43.1782381095620; Thu, 25 Jun 2026
 02:51:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260625-cci-v1-1-a100cda673ce@oss.qualcomm.com>
In-Reply-To: <20260625-cci-v1-1-a100cda673ce@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 25 Jun 2026 11:51:24 +0200
X-Gm-Features: AVVi8CfDXACT0qSqvnYo9b7ZgxqbZ1d4WZWiyuwC73lAhja8c1-UXvbxtlfkIMw
Message-ID: <CAFEp6-3AY535E4LzCpH9-8ksiec=qsk+Ayzfti-kAk7p_FxstA@mail.gmail.com>
Subject: Re: [PATCH] i2c: qcom-cci: drop custom suspend/resume and rely on
 runtime PM helpers
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Wolfram Sang <wsa@kernel.org>,
        Todor Tomov <todor.too@gmail.com>, Vinod Koul <vkoul@kernel.org>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=cqerVV4i c=1 sm=1 tr=0 ts=6a3cfa28 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8
 a=lGg1ZlD2jTvwlhVTGJMA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDA4MyBTYWx0ZWRfX1TKIAYM6Xxfv
 QmmaJWa5mWMxYIzJaq/N3CX9TPVo8U4in64QtPC+hLrE16WU19RiBecKfCLtZcrX2ai1WD7A//1
 u2Hvco45t3HcCQHZDyU4cpXMKdBw+6sr/YVHmhWsoqgwzrzEZt12sbnbZiz2ya82UnyfuiUVBD/
 OmfW7bZbcNCfC0HpTHSDYVg3mlcB+zVxeJumJVNa4sasC5RYJShzYj5ltl8ER5halLagEWxKCCP
 NrDtFLf3Odz1bJJ04A/nmPlEwnK4Y/C4oZMF7McPu+zHGa4T2fZkNiAO72xqiNSjaZJCAmtOVXJ
 xarHQbxbTDSjCTwT0qB0G2F87r3ke9qNxFU5kDBLyEsV5kTskUMlq+06zv26mRQnIgTJJm+2UKi
 ZeCJyE+6Y78xeYoJVKCoGBIdsytIRDv21nXEPlB0JVnuDpWRExDT+lpYCX36WG9SoUfCkL5VmoJ
 v1V3i3UWWB4FAjVV7/A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDA4MyBTYWx0ZWRfXyeZ6YW/NvpCX
 XAAC1TrCvOmMAZ4tbZKCkxgqf3q0OdIXLmlpC6r19Pwv+IYtaXbWEtIZYOcktFjios0G0Ze84Rp
 RkGGDA4xGt5IUYvY28haJO93xlAh/5s=
X-Proofpoint-GUID: KkDaOP1UHYEqmvyOgDK0rRNSiq0_0Mai
X-Proofpoint-ORIG-GUID: KkDaOP1UHYEqmvyOgDK0rRNSiq0_0Mai
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_01,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 phishscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114496-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:wenmeng.liu@oss.qualcomm.com,m:rfoss@kernel.org,m:andi.shyti@kernel.org,m:andersson@kernel.org,m:wsa@kernel.org,m:todor.too@gmail.com,m:vkoul@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:stable@vger.kernel.org,m:todortoo@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[loic.poulain@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,mail.gmail.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DC8176C46E3

On Thu, Jun 25, 2026 at 11:42=E2=80=AFAM Wenmeng Liu
<wenmeng.liu@oss.qualcomm.com> wrote:
>
> cci_resume() unconditionally calls cci_resume_runtime() regardless of
> the runtime PM state.
>
> If the device is already runtime-suspended before system suspend,
> the clock is re-enabled while runtime_status remains RPM_SUSPENDED.
> As a result, pm_request_autosuspend() does not arm the timer,
> leaving the clock permanently enabled.
>
> Fixes: e517526195de ("i2c: Add Qualcomm CCI I2C driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/i2c/busses/i2c-qcom-cci.c | 18 +-----------------
>  1 file changed, 1 insertion(+), 17 deletions(-)
>
> diff --git a/drivers/i2c/busses/i2c-qcom-cci.c b/drivers/i2c/busses/i2c-q=
com-cci.c
> index 4d64895a9e9e4e0bd5e0ccb5c3cc04b282b1e4d5..bdeda3979c4814b5cdb463734=
b8361da7fffa879 100644
> --- a/drivers/i2c/busses/i2c-qcom-cci.c
> +++ b/drivers/i2c/busses/i2c-qcom-cci.c
> @@ -492,24 +492,8 @@ static int __maybe_unused cci_resume_runtime(struct =
device *dev)
>         return 0;
>  }
>
> -static int __maybe_unused cci_suspend(struct device *dev)
> -{
> -       if (!pm_runtime_suspended(dev))
> -               return cci_suspend_runtime(dev);
> -
> -       return 0;
> -}
> -
> -static int __maybe_unused cci_resume(struct device *dev)
> -{
> -       cci_resume_runtime(dev);
> -       pm_request_autosuspend(dev);
> -
> -       return 0;
> -}
> -
>  static const struct dev_pm_ops qcom_cci_pm =3D {
> -       SET_SYSTEM_SLEEP_PM_OPS(cci_suspend, cci_resume)
> +       SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_forc=
e_resume)
>         SET_RUNTIME_PM_OPS(cci_suspend_runtime, cci_resume_runtime, NULL)
>  };
>
>
> ---
> base-commit: 4e5dfb7c84012007c3c7061126491bbc92d71bf1
> change-id: 20260625-cci-3eedf766d43b
>
> Best regards,
> --
> Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
>

