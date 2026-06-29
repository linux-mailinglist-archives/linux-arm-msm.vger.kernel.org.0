Return-Path: <linux-arm-msm+bounces-114878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LzINMMIpQmq21AkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-114878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:16:02 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 556646D75FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 10:16:02 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=CVVh8lGp;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=eAjaeN2L;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-114878-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-114878-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 682673011345
	for <lists+linux-arm-msm@lfdr.de>; Mon, 29 Jun 2026 08:15:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9827E3ED5DA;
	Mon, 29 Jun 2026 08:15:39 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CCAB3EC2FD
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:15:38 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782720939; cv=pass; b=OR7RaMrXgBljOmIlWcUI0o5pmOEVluKV8PnEVanQMVWa19PK/nvi5tw49NGGB8G6ZpPilYcWWMHO9Owcp7tSLQuPmdjHw9nkTAU+/hgiErIQH0DI/7XpvXUv5j3dcQvE7HBLFZtM40/kNEOk9dyaDasTtN+ssQ9QxKIPZZkWVjQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782720939; c=relaxed/simple;
	bh=IsX4KejISX6gMC5OKUDBMLLuuM6n32TVilbbnMnqYiE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQUlPKktxzDldfkdDWHfYZSNZ6koy0kGddfFUG/ogoJ2stu1ibn3E1ghlSOxihx5NP7zx0OUkgyzCyipVI08tH8KYYp81y5LyPv3rnJQU9HJ71nIFm0WejZxy5hYuVihPubKqgBvyzro5A7s9FP5w/kVzXhlhJOsKKEhTIUy5AM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CVVh8lGp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eAjaeN2L; arc=pass smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6r68O2088874
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n3dfw4QfyyM/PD42nYIn+HTs
	t0pRAT1v/rTCA1w30BY=; b=CVVh8lGpamatYpSe9D+/Tw5vNf0ftBJXlXH5FwCK
	CA2PZtp89fv9MUC5qOJmjoVmNZU6Q2TFA9UI7l04Go1tvhIUFDfy2YCRITw02YNW
	6zZ0xCK8xBDFFTYVrI0QsYhJZxJn02tycXNZXBM6vky6FqVHG/HW10OuKLKcwsax
	h0u5hKzESmXUxEYXU18pAS68jLTBZU16WWPv4IsGEN2YkZic7NttyX9op/AB7jce
	FAsruHH7CfnHESNBaUE/H7azSQ9oibavcBHmIPTFq2YVPYXnBjEyXU5EWTTSvntY
	kq+WECefGMvIA6XZ9ISPa6xkK8Y6+4vvPQcn9xkQdAr4VQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3k7vgn3v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 08:15:37 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-845c605617dso2482962b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 29 Jun 2026 01:15:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782720936; cv=none;
        d=google.com; s=arc-20260327;
        b=sP6xEMUJSEpFfr0MPkYucQhnA7PS6KuHxzOaRHOhdRguifk7LNQ7mz9aenRqKryFC2
         U5731P9rq51DztSUopzTkQtP9UUuUBG1J+Qy1+O+J17YJZjLdfzg+2ZonAKLgKz7s7hp
         hPRRTkRKVco6NKDV/QL2Qgp+r0bePW3RlSzbtuLTvVUi7waOkU16MEguIsWu42YN9Mvg
         O6EvfvfjZK3d6xav43w6nOtfoXCm2rwx2WDeMMv9Qp93ACIR9Tv+0/Q2uUWuA5zCmHbr
         +Qu2IXMC3hnFU9cRYtHOKXEAXcLQGgz/tbuXbsiO/JJoGjDga+4CgZBuToPL0B5hxOPE
         owbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n3dfw4QfyyM/PD42nYIn+HTst0pRAT1v/rTCA1w30BY=;
        fh=qygrP5rftd8NKpEw9faM0NbbHYKP4JOERqfz0XCvGYo=;
        b=aiATdDItL5/IcPlCGpDb+EnByI08HQ62HvYrO4TKLwDsoJpbxIjV/+EY5NQAaw34qa
         79gNr954D5mGqdp++6FTjiG1ro7zc2GHCAJIkK9t1RDd7076Q5bx0UlACgGXGzi30Rc1
         afUN7xczQqkHITotB1T3WA5rg4/RAeE/aiIw6HHKu4MOHWSghYO2SWQ5ozgFe/0lrKcp
         FCIpJBZSeMJMQ8UIQq7gszleioVuy/mcKF/qK/d0wjppBLyPv/9thghXpqH8Pvg84j/i
         c4C0DS1DAFeU1wCB5jw2HHc3fMaOd9eLOX+RLXuOxtp+7TryAmEUIzxtIGunmSb2B+hN
         N4lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782720936; x=1783325736; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n3dfw4QfyyM/PD42nYIn+HTst0pRAT1v/rTCA1w30BY=;
        b=eAjaeN2Lo8hxNu9whdVjcUne/AnnKWpwGK2Rqh31VapYi7FgqAuY+WE/KtMWWhRPV/
         FFkN/2B2R7Ps3dTQGadwU9W/eAQHHlTKZlzohYvLZNc5YD+NtAh/P3Z8s0qoIPwzPiu1
         Apf7kYTm5o8MlzVObs8V0O7fbPRKP5nUmn0IyFcZ6eFjaFhRDVVznEE5hFgPPqFmh39n
         U4zujmLskubxDZqzuQaA3Cyfs6MN9759WJDIlzE59WgetW3qBjvviNyK5xyWYnhP1KCq
         f/HSuwgna9Wo/kGAPfhqhjt3XNvPHHFXAq70f+rTxXP/ArC3gNZ+FZGikO/jTV49D37u
         u0vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782720936; x=1783325736;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3dfw4QfyyM/PD42nYIn+HTst0pRAT1v/rTCA1w30BY=;
        b=ljDr8O4spV14c83mB10/B0l4U1cbqL7ZZy3p17kQQ5qv6cMRR05dgpMgTfZotr6Cq4
         uxz4gYNmzSPl+5Wf9kJ9W5uK7WzPLCKBmbaQJQf52e5WIuj+Gr+5BVGB2nVDW0Uvf3Bj
         sCSuVAgt0XgWCpaOtJgZo3Fm13CaLHbP1bvhbaFNhXxFz4lmifVCCHxVAiJAVn43TGXh
         GexGjZjcSo903AYDLYkhKdZlsf4w7g7WSi6kT1vZ6UXxvFYjmFn3ViQqPfN1CKUbFh39
         YcWkDmiIe1/SyXBD8EkNouEgLnl2Y8wk3OfCH51PP7XzQ1aRfe8UCZkBDa2gylVdRE1s
         iLeQ==
X-Forwarded-Encrypted: i=1; AFNElJ/10BSmMDN+IrQJDOZfu1+RXX7pZd53oMGsZyes0roGc52Vqf8tIdy8YLLI6tohKVCbZjdOhQgUyHUoHL/b@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8O32U8P147an+uYtCKcnwaMhDTQ/YG74NHQgZXYK6jKOwwGdd
	EtxwC1RGodde96twzlVyeaoJCOF97usbkts+S81KmRFRTXdy+8OXy4/ytQ9m6PYf2C/XveFuqc+
	Eap+6ujZNX11rt/HZxhF02azdZX6NmVfRKBLfMpSSy7lDTsm1iMqRWGvWwu5EPEXP71/kTzcwDj
	Yo3ShaZ2CWGDeL+ejtKJktEIRZHfgoFSbyEpncOPtXOnQ=
X-Gm-Gg: AfdE7cl/w9MLq9S+0Bg1DTVzdijtYZIOAUa57DKg0eJZ7U5GIMDbJlDc2l3p7TKYHvb
	zNxcAqvBB4x/Rcg05Lxw2aqhdDYpEwJj1Qq5I1nootoSHtFnsmpNb5Ds2Fod6Eu5ux7symmMwO0
	XRgF7s3sHKim72PkHpPzvrEfeYV8jYSdK1Xmq2M0T4CAUnYd1fr6FFVcZ0c+1ziii2Apj3vn+Sh
	8Rad7ibWNfrH2JLwHTDcpN9tc4ycg==
X-Received: by 2002:a05:6a20:c91c:b0:3b4:8300:7019 with SMTP id adf61e73a8af0-3bd4acad1fcmr16350284637.18.1782720935886;
        Mon, 29 Jun 2026 01:15:35 -0700 (PDT)
X-Received: by 2002:a05:6a20:c91c:b0:3b4:8300:7019 with SMTP id
 adf61e73a8af0-3bd4acad1fcmr16350251637.18.1782720935383; Mon, 29 Jun 2026
 01:15:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260627-shikra-dt-changes-v1-0-449a402673d0@oss.qualcomm.com>
 <20260627-shikra-dt-changes-v1-2-449a402673d0@oss.qualcomm.com>
 <pqhrgjj56nbfsfkzqttlivbxpdsfzn3ifmh5s6fczeiudlr36t@ts26c3u27k6n> <e8563334-e53e-4010-b7f5-9d61ef55bea3@oss.qualcomm.com>
In-Reply-To: <e8563334-e53e-4010-b7f5-9d61ef55bea3@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:15:23 +0300
X-Gm-Features: AVVi8Ce7b0Su9AgAkUGCUSmYUqNZmOrMX94ZjtjracC8pYWTaq4eMVHPsh68k7E
Message-ID: <CAO9ioeXUJhTgYWvqz4xAf_yV3n0uOvcLT8ZMYPG7wo7tq4HabQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] arm64: dts: qcom: shikra-cqm-evk: Enable display and
 add ili7807s panel
To: Nabige Aala <nabige.aala@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arpit.saini@oss.qualcomm.com, mohit.dsor@oss.qualcomm.com
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: BslF_yBW6WXr6reKrVLAtFlLNKBqbWtl
X-Authority-Analysis: v=2.4 cv=CqCPtH4D c=1 sm=1 tr=0 ts=6a4229a9 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=MSO-Kgdoh17wuRcxXK4A:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA2NCBTYWx0ZWRfXz1WJg9uJLakX
 65Wa60du1tzRJbCDCQ0UB0OA7GmgP6suSfszy8T52AsJ0n5HPXNyXWS8rUbZqvMkbnIvzJc7MuR
 vGF9UIUrQQAoiN8vC2xVicbpiv9TJls=
X-Proofpoint-ORIG-GUID: BslF_yBW6WXr6reKrVLAtFlLNKBqbWtl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA2NCBTYWx0ZWRfX6/73TSESYVVL
 3iCx5Bm1625a1dTasWHRWhUWDZGabzLmvQ85z4kmm74SM5IqzTu+JJ5EXDd23M50naMPrYXncZc
 tctznzhrwMIN4ALTzrKKlyw3iZ4CCo1QSzPpKSew5FzeCsdlkW/9XXtzG2oHH/f5S9PLX0ZdTsX
 y/PUhMjqQutpVKQ3QGXj0zibCmUkGi4kYVbOoknwOkAu+ue8+p1UTGGr2epVEUdNS3Z0mfYG3SO
 B+DV58AQcDLqD4WHdwJhW5ZWS9FD+wpw3jIjlzM3aV7lFWlwbCHFL3wOUtQgb5EfmJIb/lQPDOs
 okkklNO8+UvP6iYzFZbBkAKFjcc+N+ZCaYL1knuBUUHSAEEdh03LlMHQJUD6Lw7YP9qZ/1O42qr
 Z2Tg7VBix1F7OO3PL5hrb3ZMdhT0MLUi35M+kZtD4Tw/Zt0Df7BR2PQJNXIGf1MFR1V62BNYpqE
 OMbON5ny5djlgybtHQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290064
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-114878-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nabige.aala@oss.qualcomm.com,m:andersson@kernel.org,m:konradybcio@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:arpit.saini@oss.qualcomm.com,m:mohit.dsor@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[11];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,mail.gmail.com:mid,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 556646D75FB

On Mon, 29 Jun 2026 at 10:22, Nabige Aala <nabige.aala@oss.qualcomm.com> wrote:
>
> Hi Dmitry,
>
> The patches were developed by different team members based on their respective platforms. I have consolidated the patches across all platforms (CQM, CQS, and IQS) and shared them as a single bundle to facilitate easier review for the maintainers.

You didn't answer the question though. 'What is missing?'. You didn't
add the Signed-off-by. Does it state that you don't know if you can
distribute the patch?

See https://docs.kernel.org/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

> On 6/28/2026 6:00 PM, Dmitry Baryshkov wrote:
>
> On Sat, Jun 27, 2026 at 03:31:36PM +0530, Nabige Aala wrote:
>
> From: Arpit Saini <arpit.saini@oss.qualcomm.com>
>
> Enable the Shikra MDSS display subsystem on the Shikra CQM EVK
> board and add the DLC0697 MIPI DSI display panel node.
> Pin pm4125_l5 to 1.232V with regulator-allow-set-load
> for DSI PHY PLL stability.
>
> Signed-off-by: Arpit Saini <arpit.saini@oss.qualcomm.com>
>
> Oh, and I nearly forgot. You are resending a patch written by somebody
> else. What is missing here and why?
>


-- 
With best wishes
Dmitry

