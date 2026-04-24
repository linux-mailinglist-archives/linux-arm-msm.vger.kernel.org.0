Return-Path: <linux-arm-msm+bounces-104393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NOQI9Ql62kwJAAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-104393-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:12:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4BFC45B3E8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 10:12:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C34423003639
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Apr 2026 08:12:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E7183659F6;
	Fri, 24 Apr 2026 08:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HcoHrkbm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PpTeX9s2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0914733065D
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:12:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777018322; cv=pass; b=u+uXm0OxIq/PqUFCnlB9zPejwU/UQ5AdfH1DM6bqUEHZb3OXvL0kSqiXdHy7ijBV/EAdn7reabFJycF9pHUdqBUSfiocAckFDP85/Bsc2qznK/iG4FY3JonldBI75DI/HTX3VnxTH7NXz2M5dY3U9PBWL205KQpCdlPRHyfQMYs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777018322; c=relaxed/simple;
	bh=SGL0pCpZK6Pfvd4uNaD+N2++Ls13Hydf5sLgF6XCReQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mCqJ1v4VngpnXTIMnhi8ZbOeIwPe/a+D40hbR/0Ou1E9gUJQ5ZX47/A/wV8Tyod42T2s7b8Wu6bIvkfc3b8pQTS1cWWI+FYL/7tZYZ836ElAVKt7ENVdZozBDV3Hi4FWlz6KR/+TZzi9reESZKE5g072e/GdSuEqdj95IkhctQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HcoHrkbm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PpTeX9s2; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63O5Ag2x010534
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b8V8+Pp3Xf3VXRBvVG1dZjQZ
	LaEv2BKEa4qb+SaTnZs=; b=HcoHrkbmrqFHaM4dHqBPMlXIzNqcj9upCD9lJH/U
	B6UR7hYCcun/ELeQspk1PJ2a6MJE0RCnhaPGogdHPMUzlFRd4/qggAMNJwSbAwIn
	GJwV7xVDwUhfi7zcKrcOh5Iq+4nvX0TuUCojOhTsifUrdaLYGZPc9Sy9wDW8MPfA
	7fw1lkn/NN/UDw7yJpusFvyMcCHDLIw0rApG7Dtu5okEEDCvgLRaKlc0We3tUP4n
	bf8FImO+o49MO7QPk085mq2Zla5YapjUK8O665+hJMYweFC+FzftEZaUrSpMm1aQ
	icdxDczDf4DYQUj3edR2unkxAWtuxt0n5CYDeIoGVvfcRQ==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqk17ca61-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 08:11:59 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c7985752be1so2886665a12.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Apr 2026 01:11:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777018318; cv=none;
        d=google.com; s=arc-20240605;
        b=Kzv4jynlVuf0zuHFNu+uDnHEnrR1iiy0LoqXqxPj6THg2mtKsKObR7wpF55HPWJWoB
         UA8cR0YTSVnGQfsj9WCf9qvQMC5rrYSw7O4pmiUDL7diXk0Ri9yzOQ2LiPVRSCkXreiy
         K1cCae8MGiWpsTW1YPvGK9ARHk4lVk+IIPcSs5isXD5gwS+2sKiur8vNdqY1JNHMbDzO
         WsnCwhPJGPPTuY33xCS/2MvAsT5dRvMlzxpVSz7ZUyonpvvrhBcXktyP85xVKN4CcdH2
         Ga626nphNDif0g3PT2mXquEpc6gNb3zcEA1gzN78f5vuDRQAesMbHibfXlk6nDaJdRoW
         ojaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=b8V8+Pp3Xf3VXRBvVG1dZjQZLaEv2BKEa4qb+SaTnZs=;
        fh=g61MPclRfe7vO8C9DfYIH58aXGj0Kdt5o3GNLDZ9Ixw=;
        b=MtTxhMm7/nrX6yNeS6ySHwvqRDb5IVueIZo4oX/aIsrNxSybEnNcM8Ow0I7oPVRGea
         szUqObc1/t11fQivJ0VbszB02TO7ouGbU68ryXjtBTRO+O2/b3e4xU3Yi3sGDgCmmSKS
         LS2zaHlm907x98cbU3G/R04X8q7eJ7UpJoPSUTRBOPlL70jQcgdV7NL+e4aCeY7FNk6y
         1HlYqHvQ2G+moQfU7xTQMRUo8ophqkm8QsB05cs21wuKgJwHPv+HgLqTVh9jW147cMLC
         rwxOMeycZnh61/2ifZ/b6o+R6fGedFt0rL19GdCeyU6b5+07ZKLcI4zbp1kRKrNmUvPD
         wbyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777018318; x=1777623118; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=b8V8+Pp3Xf3VXRBvVG1dZjQZLaEv2BKEa4qb+SaTnZs=;
        b=PpTeX9s2Nhgcu+kjWJ26lryq6E/5BIm6rDC1EIQFd8tm4SE6XLYU9Sa3EU1RmQ791x
         BzBj3DRiaOrOPHYd9JsoVJl24xH6nuBqxyAA299VtqQmFp72NQLL87HP4bF22FBGm4nS
         p3WXcLkChbP6TXNALNYL/2PJtpUbQSaWzAKb0D3lUOB8cBEM6JdKgEeyyCBWjxDBoIvM
         RBzd5XfBcZiGWrZ0HqpKCQVqn/Z6D7nAv9uVv8belUHsh2BCz7YvQ0JvefZ8l/fbK5d1
         buflodzVUTYA/eEii4NxRVhdYjudOlpnfm8NS1hM1jrbMl/tKbrO2WiCmaX40KpnhdIf
         1w4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777018318; x=1777623118;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8V8+Pp3Xf3VXRBvVG1dZjQZLaEv2BKEa4qb+SaTnZs=;
        b=WvenbA06fk4Qq2GpaUXh2nwcaQAcmOlfHm6TVRq2GsTtzdi+7aG38PyHHEdwlFgIrY
         DMnrv9pfa9FzzT1z0AuQiz7NwnEgxUKzixeXqRiMS9/+yxcxeVWL+T9+RoiiPlFoSO/q
         KoDj/H5WZGqx0bVuX45x1a7kS/EWiSjcvwZ2OedaM/nl7FrQQJOkutVYZHa1sblzrmIh
         GXhIBaY7Tqc+rVVEjDmXXWi/WrY3iOymogEdhM/2KHCfjpduPV8ooP3WHA8UP1p7uGfw
         p3kbMUmT4+KOxKeuIGAzseRpHWrLf9mFNF1jIp8kNv+GLBzEmpmLyth+HEoT++w5sGC1
         gdFg==
X-Forwarded-Encrypted: i=1; AFNElJ8Owr2IvwvDcWF7e4CA9Um6QDapdeWmyZAkuPAh8ca9Z0VRKjw9qpE58/L+NsPxDfZlQyi07tnIwEaOfQQq@vger.kernel.org
X-Gm-Message-State: AOJu0YwoUyF8kCyzoS4ItFpXB9qsgKPKHf5xizLHbjbcKSH0gZRFlrYh
	b4ZKkWSAMG85dke9OdsVP3mLAOpE3oBjFleGO/ZKYFdR/YPbD75ZNQ0hQdWj2zQ8ewbbe1/tFE+
	7Dq5VHUxnBstjA6F6uASqEuYxKJcA3PVH3u3ByhuMz1TJ9svqNgOI9V00uAVSgEk4vK356TrF+O
	XU3BWFOXC9JxfawRrixrIhbZr9YjIc5m7Kft8gPTHcMf5qh1JpH7NS5w==
X-Gm-Gg: AeBDievhGlUhkvIikpYJKw3enwABncIm8FT8DLqezZ0mOigGJloEPZ4+9tc28LfdBMb
	OyRygOx5t+7iwENa+TszQReS2A/OANa/CNZBgtDhiyNoxtXMLaISFSD9Gi+SHQMpG4GQk5CBtDH
	IzIB9SFdwuWX7Y8VSPEHHj7vxa1MEwKAJuKnL9NUHkv8q/mTxXOKxYyM1cgyISCi2oKQTByfnDs
	eWsk/GtXekBdDLl
X-Received: by 2002:a05:6a00:1749:b0:82f:2d48:f906 with SMTP id d2e1a72fcca58-82f8c81a841mr33602234b3a.12.1777018318248;
        Fri, 24 Apr 2026 01:11:58 -0700 (PDT)
X-Received: by 2002:a05:6a00:1749:b0:82f:2d48:f906 with SMTP id
 d2e1a72fcca58-82f8c81a841mr33602195b3a.12.1777018317680; Fri, 24 Apr 2026
 01:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260423-sm8150_gpio-v1-1-e418613a1f48@oss.qualcomm.com>
 <gayeixwyvv4qjtpc6gz5ljrtpmb4ckm4up7gdxutpbatbxny74@kazqjbepwb46> <d20e8ced-9454-4924-9042-2f725de6d332@oss.qualcomm.com>
In-Reply-To: <d20e8ced-9454-4924-9042-2f725de6d332@oss.qualcomm.com>
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 24 Apr 2026 11:11:46 +0300
X-Gm-Features: AQROBzCdFZJEnfpj0Cu05ik0dBy07qx3mOtMVi78OBeLP8l05QA0xeQ2ojnJMFg
Message-ID: <CAO9ioeUfwHGDYv3TNuvoe1BP1xrPo42Pf=7FJPrA1zvmPkPNfQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: Fix wakeirq map by removing disconnected
 irqs for sm8150
To: Navya Malempati <navya.malempati@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bhupesh Sharma <bhupesh.sharma@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Maulik Shah <maulik.shah@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-Proofpoint-GUID: TGwn9WptBiElfaQty37MSZJoUSiww-4n
X-Authority-Analysis: v=2.4 cv=R98z39RX c=1 sm=1 tr=0 ts=69eb25cf cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=SVcxLTZJ4bZ9FMW-31wA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI0MDA3NSBTYWx0ZWRfX77a6/sbfFLtA
 vlidEDdbvXZcKGcogkbE4X+VSG/TiLU7VmvF3/FuBRlcALppDYGuaxWoPV2pv6HpcJWbyVzJe2Y
 HiqWVghMB091PDlyAbKWUvqcziFjGZGKcehAi3ZVQs7Cb0Uw4a7Z8qjgqv76fcwYqihB8FCkKBU
 4FtMD0VfJkkxwH4Ur8RMEj4P2A1pLrI35ORtnWeL0pbqsj0WAsjwtqyUlhUqNXwRd9pU5QiySnt
 BcA5+zjNgP+az/n6Y6R0Aws6NOWjuz5bj6S6o5zpxml7r8dB05q2LiCSiU3NwB7tKFOC2CofNzz
 ca057B+fugYdlCxLmh3w+D2whDsIrrCZ2XR0epcqo5HsEJsYHYHUhBhrH/pdoLYOgSMM9c4/SCa
 KrW903DB9T+3J/zLgPvBIcMLVOLosueDCQ0visb6GPZtKOPfhuTbm8Ixax/HumWU/8SUHpnCPUw
 ZdOm5L6J72e6F94qlAw==
X-Proofpoint-ORIG-GUID: TGwn9WptBiElfaQty37MSZJoUSiww-4n
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604240075
X-Rspamd-Queue-Id: E4BFC45B3E8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-104393-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[9];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,mail.gmail.com:mid,qualcomm.com:dkim,qualcomm.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]

On Fri, 24 Apr 2026 at 09:28, Navya Malempati
<navya.malempati@oss.qualcomm.com> wrote:
>
>
>
> On 4/23/2026 6:09 PM, Dmitry Baryshkov wrote:
> > On Thu, Apr 23, 2026 at 05:21:01PM +0530, Navya Malempati wrote:
> >> From: Maulik Shah <maulik.shah@oss.qualcomm.com>
> >>
> >> PDC interrupts 122-125 were meant for ibi_i3c wakeup but sm8150 do not
> >> support i3c. GPIOs 39,51,88 and 144 are also connected to different PDC
> >> pin and already reflected in the wake irq map.
> >>
> >> Remove the unsupported wakeup interrupts from the map.
> >>
> >> Fixes: 90337380c809 ("pinctrl: qcom: sm8150: Specify PDC map")
> >> Signed-off-by: Maulik Shah <maulik.shah@oss.qualcomm.com>
> >> Signed-off-by: Navya Malempati <navya.malempati@oss.qualcomm.com>
> >> ---
> >>   drivers/pinctrl/qcom/pinctrl-sm8150.c | 23 +++++++++++------------
> >>   1 file changed, 11 insertions(+), 12 deletions(-)
> >>
> >> diff --git a/drivers/pinctrl/qcom/pinctrl-sm8150.c b/drivers/pinctrl/qcom/pinctrl-sm8150.c
> >> index 0767261f5149..81c08b18ac71 100644
> >> --- a/drivers/pinctrl/qcom/pinctrl-sm8150.c
> >> +++ b/drivers/pinctrl/qcom/pinctrl-sm8150.c
> >> @@ -1493,18 +1493,17 @@ static const struct msm_gpio_wakeirq_map sm8150_pdc_map[] = {
> >>      { 3, 31 }, { 5, 32 }, { 8, 33 }, { 9, 34 }, { 10, 100 },
> >>      { 12, 104 }, { 24, 37 }, { 26, 38 }, { 27, 41 }, { 28, 42 },
> >>      { 30, 39 }, { 36, 43 }, { 37, 44 }, { 38, 30 }, { 39, 118 },
> >> -    { 39, 125 }, { 41, 47 }, { 42, 48 }, { 46, 50 }, { 47, 49 },
> >> -    { 48, 51 }, { 49, 53 }, { 50, 52 }, { 51, 116 }, { 51, 123 },
> >> -    { 53, 54 }, { 54, 55 }, { 55, 56 }, { 56, 57 }, { 58, 58 },
> >> -    { 60, 60 }, { 61, 61 }, { 68, 62 }, { 70, 63 }, { 76, 71 },
> >> -    { 77, 66 }, { 81, 64 }, { 83, 65 }, { 86, 67 }, { 87, 84 },
> >> -    { 88, 117 }, { 88, 124 }, { 90, 69 }, { 91, 70 }, { 93, 75 },
> >> -    { 95, 72 }, { 96, 73 }, { 97, 74 }, { 101, 40 }, { 103, 77 },
> >> -    { 104, 78 }, { 108, 79 }, { 112, 80 }, { 113, 81 }, { 114, 82 },
> >> -    { 117, 85 }, { 118, 101 }, { 119, 87 }, { 120, 88 }, { 121, 89 },
> >> -    { 122, 90 }, { 123, 91 }, { 124, 92 }, { 125, 93 }, { 129, 94 },
> >> -    { 132, 105 }, { 133, 83 }, { 134, 36 }, { 136, 97 }, { 142, 103 },
> >> -    { 144, 115 }, { 144, 122 }, { 147, 102 }, { 150, 107 },
> >> +    { 41, 47 }, { 42, 48 }, { 46, 50 }, { 47, 49 }, { 48, 51 },
> >> +    { 49, 53 }, { 50, 52 }, { 51, 116 }, { 53, 54 }, { 54, 55 },
> >> +    { 55, 56 }, { 56, 57 }, { 58, 58 }, { 60, 60 }, { 61, 61 },
> >> +    { 68, 62 }, { 70, 63 }, { 76, 71 }, { 77, 66 }, { 81, 64 },
> >> +    { 83, 65 }, { 86, 67 }, { 87, 84 }, { 88, 117 }, { 90, 69 },
> >> +    { 91, 70 }, { 93, 75 }, { 95, 72 }, { 96, 73 }, { 97, 74 },
> >> +    { 101, 40 }, { 103, 77 }, { 104, 78 }, { 108, 79 }, { 112, 80 },
> >> +    { 113, 81 }, { 114, 82 }, { 117, 85 }, { 118, 101 }, { 119, 87 },
> >> +    { 120, 88 }, { 121, 89 }, { 122, 90 }, { 123, 91 }, { 124, 92 },
> >> +    { 125, 93 }, { 129, 94 }, { 132, 105 }, { 133, 83 }, { 134, 36 },
> >> +    { 136, 97 }, { 142, 103 }, { 144, 115 }, { 147, 102 }, { 150, 107 },
> >
> > Is there a chance of mimimising the diff here? It is harder to read than
> > your v1.
> >
>
> This is v1.
>
> True, it is little difficult to read since multiple lines have been
> changed to re-adjust fitting of 5 entries in single line, otherwise it
> may look non uniform across lines.

Please keep them non-uniform if that makes the patch easier to review.

-- 
With best wishes
Dmitry

