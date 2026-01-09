Return-Path: <linux-arm-msm+bounces-88278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 712E4D0A50F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 09 Jan 2026 14:15:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C71113075CAC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jan 2026 12:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AEB150094A;
	Fri,  9 Jan 2026 12:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hs3WjwQD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TJ3frleJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ABE633C1A3
	for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jan 2026 12:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767963340; cv=none; b=gfHZD003jOvqG04cr/OFkPlZZhp8E69xNK6fNJemcTdYURKmLD1BUkYwaoXS4JXnpimLpZw7Z9FPgbimfW0fTEs/IrGpu1mp/pFKzM3zfNKuSa+dlCb8ctKZKRkPpTzIXLKoCfQFVH4E/ywclVDpM7kMiUnMLfjAGVbB2RqeWNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767963340; c=relaxed/simple;
	bh=GXK3Yi+79fY/od/iRzzjT1D7nCK46JvzfmF7WguCvec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skaZm0uIrPvKDzF3rJYevRV80QclgAuf9MyBAfoojE8g0JtAZ/Yn2w3hgv4Nfd3ThYui8Mk83PiIP+7W/Ob8s8gimTUsMqU9jmW4xPOp8FQB7s0juxHQ9W57HVc8qgVfHpdVuj+CieSLVc6TFTOzre83/3EMU1IX7uEPCPLV+Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hs3WjwQD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TJ3frleJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60982WW02183970
	for <linux-arm-msm@vger.kernel.org>; Fri, 9 Jan 2026 12:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=0fB162TNQjWLSpLCtoIj0fch
	gaNtZtYhwwygswlguGo=; b=hs3WjwQDr6+0Al5O+2nYdF94UO7mBaCf+EgXDvvp
	mlXfMHwKu+8VoerItqkJInjS1Zaq9wlV8nc2EWZJQgOOAIpCA+bihQPkj7c9Te1P
	VXjUDNKgGSNrcFfC/6DkzSzQ+IId4K1fuwnYfr77SJAjl74RWhrCZJBY5m86Lb8u
	GdYdC3FxJvS7Eh7eXgzKeYPJiUTcjihBaecAwsQQ6NknkWDCirVQd+6FP9GceYr0
	KP6tOj52D3RcchRV3awJnleJuCZpa9jr0in11MhXQlKBbZmq+OOEnu3Db0PurSlY
	5EWHTAOJj5nod1q4rji+ZPEGwhFIMnkX+3FgsbKNSBnLWg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bjwtn8vpk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 12:55:38 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8b2de6600c0so1071041085a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jan 2026 04:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1767963337; x=1768568137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0fB162TNQjWLSpLCtoIj0fchgaNtZtYhwwygswlguGo=;
        b=TJ3frleJfonHOeSfCaOPagvWQ4Pz5BB+5qxpFtNpNzth1U2DlSl5X0Y9O8AmV2S0aK
         MpzN3N2n5UKoxzV6+JKbJzde5AGmpqwDpIYSovbuyvkR8GnVseGOjJubV/M185BDuBco
         dUCN61YodplrSDwqw6UVEnLwwsNzG3o+csg3A1GEX3C3gGxx/Q3z/SA1AAhQz4VszR6l
         OB/ghNYL5uBn7tpsSwJpFlWCPj5cmDaxmjFKvEBK1EFx1pbV2wcHGBzKDtvylNENKBaa
         PPJHpwQ4IjqwZAIsyXs/WoiuEEpHRSo42Pa6VpD5sRD4bn23a//sQMBqojdxI9F9ZN0U
         4Mvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767963337; x=1768568137;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0fB162TNQjWLSpLCtoIj0fchgaNtZtYhwwygswlguGo=;
        b=BcXIlNPKQq4ff9QzKlt6h+pecOKjysI0PHj1Ld2PqAavIGmoLee/T5/42xz76aGspX
         Eq6V4zfmtsHClWKZOuu0XMAPcoKUz+W1axmGK/kmAJRQ3bFdNw3FuR7xfen9E3DVIFZQ
         dVUqEYyvzWLXAcdHV8rkGxYIeQ3H0hBHqr1F+KgAgVWMLdwMAllJxKQ/sfNyfVeqh/rE
         t8h0+eOc78jId7A2Jeoplm70Epl9kpboGf2rQGIKkvwDOPAibGprscorI9AxL17UR4+w
         Rh8STdFd270J0b8phJsf7tunkmZdVYMdaTazL0KRoaqKwsloNYrfXoUCwr7zLVU1WuC0
         uDcA==
X-Forwarded-Encrypted: i=1; AJvYcCVwuGhk0UPp5NNejJWLZjJAYr5lw33AqNT/esNMcya+ipFidypaMvTO6FCPqdIksPzikSTVBAF6pzX+Afiw@vger.kernel.org
X-Gm-Message-State: AOJu0Yxp/4rxYrOTr5ADIsYkdzV+T42oaqMpkLQ7zHhj+FMKNE93pOMh
	h3gFZcRQoSOvxHsxojZ+vbxn4W+qOf/EQc9hndu7gJF26Js+DcxZPYaMjkbiIaTeBmXOp8t3IOX
	UqkU9DcnPy4kA5wGmjhJC/mU8o2C0BKPfQmyJ0bIxOSbrf2yaB0N+/gB9ZL250MIooPGe
X-Gm-Gg: AY/fxX7YhC5/h+T6HdPVuCL0tVBfiM7oy0LXV8t7HaWelQbGIbDqCjN//LHbV3ulU8l
	Es0L5cIqCkw7PJg/9RwYQ5XgQbj640f2h4dtXJhP+RA/WTaRVMpn4fzMGqFh++5W7S9yBq99Cx8
	Ss/tppdbnoSRNt5P4C4fhLTnGEh/aorsaeNTfHvgWf8hMSoND0OnBxumMzagIfV18M07MMcauYi
	OSxwcdg+PTC9h594iXyQwFk4Ppu3CZT7lT/XAZ4XpVdX+vZ1H/iI/UWH1euGrXIqIcLk2ywbW77
	k01pgKXoPJQEDnLmHghNd1kZ7jwAkFrrJ1+OS9yDm3kFuwupy+bY/I0gjVi53AQ/6/+oReuuotX
	B2WKeHiduloX2d2ulysr1RgrXOVxcN3cydXhMXjFsdgryfmuqAsDkbWZpQG2jt8Zchp5QtlPwnH
	2BNma8qiObLv31FZ9Q+vHEBcc=
X-Received: by 2002:a05:620a:3f85:b0:89e:67a9:fced with SMTP id af79cd13be357-8c38940306fmr1325551485a.66.1767963337188;
        Fri, 09 Jan 2026 04:55:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFREPXA6y8YHpViRPCU0cnyOo0eKpEeGWsHbdHR3Laa0JjVGjp/T0YQVCsSbFQaOq/LXUHtAg==
X-Received: by 2002:a05:620a:3f85:b0:89e:67a9:fced with SMTP id af79cd13be357-8c38940306fmr1325548085a.66.1767963336711;
        Fri, 09 Jan 2026 04:55:36 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59b65d6792csm2836474e87.68.2026.01.09.04.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 04:55:36 -0800 (PST)
Date: Fri, 9 Jan 2026 14:55:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: vkoul@kernel.org, kishon@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, neil.armstrong@linaro.org
Subject: Re: [PATCH 4/4] phy: qcom: snps-femto-v2: Fix possible NULL-deref on
 early runtime suspend
Message-ID: <ruatckeymsjdwf3hphhp34rzsdakq3okqq5lg2ifadrm3qis3j@xxozqcxseykv>
References: <20260108154944.211886-1-loic.poulain@oss.qualcomm.com>
 <20260108154944.211886-5-loic.poulain@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108154944.211886-5-loic.poulain@oss.qualcomm.com>
X-Proofpoint-GUID: dIr0PN3Ytyf_F15gdjRhIyiwYQIjzhmk
X-Proofpoint-ORIG-GUID: dIr0PN3Ytyf_F15gdjRhIyiwYQIjzhmk
X-Authority-Analysis: v=2.4 cv=Uohu9uwB c=1 sm=1 tr=0 ts=6960faca cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=JrZo24E52nylh-zEmEsA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA5NSBTYWx0ZWRfX6br2FVqleur/
 FWmWWjZYOLx/Sy54YTxxhlt5YZU4d2lc3GPN7sNeKuaitmMFksL8ng9sAw/y4DD8Pqek7liaXrW
 OlTVFEjpFXfpRJR/q7FNlxkEPQZs5FuwyNHIW8GrVZjHHdfMSvmVAijr946LXGvziOOy6F92sYG
 Ba1txBB/HiiFvtEX2g5nPieateniF2bCx8Ibtp86tsQUEk/TAeSuSNanuNXCBQeTcHZ8tD95SKJ
 IXrPltpHdNnNJrTBZ9QHQphQMdCUDk07KWq9yazUB1W1GEhDVFSH8Hi6So4jmu3ClZQj9FoV+6R
 ryda8gMafImBqOcPp2yV0adThzr1jPi/nJcQQ55+STQ947GOaL2VASqUlfECkil6jou5CPWQCvo
 OsuTq+E6QiJ8GchpozfspRBuNEYCSI0NFZtkqy+oiXbZ5bDEnWCQztBQutjcFl4DrwLKIpz2vyo
 WGmqimSK2ZHRM47FXnw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_04,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090095

On Thu, Jan 08, 2026 at 04:49:44PM +0100, Loic Poulain wrote:
> Enabling runtime PM before attaching the hsphy instance as driver data
> can lead to a NULL pointer dereference in runtime PM callbacks that
> expect valid driver data. There is a small window where the suspend
> callback may run after PM runtime enabling and before runtime forbid.
> 
> Attach the hsphy instance as driver data before enabling runtime PM to
> prevent NULL pointer dereference in runtime PM callbacks.
> 
> Reorder pm_runtime_enable() and pm_runtime_forbid() to prevent a
> short window where an unnecessary runtime suspend can occur.
> 
> Use the devres-managed version to ensure PM runtime is symmetrically
> disabled during driver removal for proper cleanup.
> 
> Fixes: 0d75f508a9d5 ("phy: qcom-snps: Add runtime suspend and resume handlers")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>  drivers/phy/qualcomm/phy-qcom-snps-femto-v2.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry

