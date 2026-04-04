Return-Path: <linux-arm-msm+bounces-101794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJhTNXtn0WlvIwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:33:15 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEFB39C419
	for <lists+linux-arm-msm@lfdr.de>; Sat, 04 Apr 2026 21:33:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B955D300EFB7
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Apr 2026 19:33:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7001934104E;
	Sat,  4 Apr 2026 19:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k48eJ9qV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gnlKiwVd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400203385B9
	for <linux-arm-msm@vger.kernel.org>; Sat,  4 Apr 2026 19:33:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775331186; cv=none; b=bzRkSKqsyzJ4BL7vDK/Xq4htnSVc4czN8hUo1JakXWYzPufpVSK/00AAycnU5qoaTTwiqp1qbns8wUj5E2yswiiZDOPnWv+9PL1DYgv4DOc2M+rNx/iU07LCAT8vEFaz5QYZ844Adz9vSqk4yHEx6ys8dEQ9cjDCzqfN9lAoBso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775331186; c=relaxed/simple;
	bh=DeRN+dhSPVtH237e2I5oUwOFlcxcTUfyd71zgDaZA50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9dKlnlJx3vwFHYNCN7BIY0j/+VcpUiI3V4YNa5fOdJZNeHUZEksiskZfPo9pHhpRXBnG0nAnWWBroKZ2luw1rn4i17h3xNIo7bfDEVIkmQdfvrrGkPmIS84YVPdWj7OVehZNflGRT6Tq0xPk6Gbwbf35aYhxnatwk2a/G8Ecyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k48eJ9qV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gnlKiwVd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6344eHdi2973615
	for <linux-arm-msm@vger.kernel.org>; Sat, 4 Apr 2026 19:33:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3At1cOoI+/INm38cpRwWB0kP
	WiIwZdHs8XrXBBAl3/4=; b=k48eJ9qVqDmrRHMcPSbiolkDFoagMRqys3cDzr0G
	89qYVJ2cXmysnbOupxxBpppks8HIKZzNkswFYQwuyI2XtJwgHGtmn5qp8XtxJQMT
	+okKBHVySiLTr1g+z8nfl4cpKOsuwaOowvhpxPJiUJVpAGQHkrCb70OGe874fsLV
	G4rGLEOo5qYGV9VrMCSV8VylYI0yZhAJlwwPm9GhXqg7zSRFLrUSQcwOmtCnVsF1
	7uwyHfETK+z/dVBzetwBuefSKZ8+J5ERy6oeuc5GzFq12aRg1m1U2Crja0aX5CGC
	SfY5XrF1i2qNXh11/whjQIdca0d7ufw5gIc6R5NogGrj2w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dauth99af-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 19:33:03 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50917996cfaso92832971cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Apr 2026 12:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775331182; x=1775935982; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3At1cOoI+/INm38cpRwWB0kPWiIwZdHs8XrXBBAl3/4=;
        b=gnlKiwVduy9Jl5+7NATNxcEMzcebTXGoNyWVzcy9GTW7tw/vl+Zw0jacvrRuLr42Vq
         PZGpPiKRgUugOlYYo9i3qMIx/stweT4r/QvrWxRXOvfdXoLUzdzO4iQBVefua49A0GVU
         OYk3TLXdKoqoZRvwtVWT4oNPncEi8eDeT/9CVKvBKaKcAVGPS2aH7PqbZ8WxesOdEgNB
         EaM3SbZSvV6NEBFrXvXzFVJ7v9tw9We+20/ePHrbuSRVceiT3cstC9QKAD65ZQxrX25F
         bEXuuXhowo0BIgUE2FJflczOyq0m2Ci4ZgHCjuHoVbFozj1YANFt8WmlO3eunxY6d8Dz
         JmuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775331182; x=1775935982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3At1cOoI+/INm38cpRwWB0kPWiIwZdHs8XrXBBAl3/4=;
        b=Q790Eaz5Cel4qcdxki2A7RaUpoRJW71xvfU7N5zvGTOHWlb9QxJY+7mNyUvT6mpdlx
         jQcmXUF+M4Vv2hOjurjz2eAMnU9j7yvkkWcZJUYQav1eD2XCpQuYriuPKM/U6l3hxHF+
         lw9Y4Am7IK3jAoQCZliRr/PR3idHUUkROQtxLbJNfjsZ0hAk4f7pX7tlE9hMXWtoeCRJ
         byrlpL+AUBCc6FQi9oVkileEfw8o29XeGItHhgjZMK0AggN8tLoa9VDGPs0rKIp6TA8k
         yEwurQeTYMPRLHJdluWK3ELwc78Az2UbR8WI7UKMr9knp2Zs9TQGSIJS7dreXN4Rrcff
         3o/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWHbU6AQWHHCH4EQD4/VRnHHRsdIWspsg4a0OessZqhVBBVYno/+D8bJJEhTFqp0lNe14gIP/9iizpkJHb9@vger.kernel.org
X-Gm-Message-State: AOJu0YxlQwnHiNGYHpii75FT/Y0A9sGJ+enNrkbreFOGS6Gm3F/kzsGA
	ytzyjmkwHeeif1uZsKAsuvF2jbrlz+FBeoFl6PItb30Q8TZ7ZIrD3dc++3sso8hA2c2Zw118zR9
	FW0ZlTOCGbTgYrTyq9Hxh8b0hpbXwXUEnOF0AJyrT3EHrTg/AfwJ2KGB1cRgdHCd4pOmDsOPtkn
	Ob
X-Gm-Gg: AeBDievUexYgMh5IczlGwmWQBRVP7JmIE3NLAw8guvIFLH9LlrET7apcTtmsXEiwobV
	0cl7sZOkIi//z3IZOtc3CH/8nvvmm6p3mwY3YaqlbwxwiuLFvi1coO7K7NOdtE2DKwYmgqoXkft
	L/t32tpxkXZ2kh7hBxZaseeNWv3/JoOXmM2IaWl2qqZO1HBl92j3JHipX8cxEb9bbfQt1FOSCut
	Y5VyiFVl4f+8e4VL7eJD3D04ZICkw8L9hMRb4VgNZKKL9O5MDn6J8yKQ2aS/f5C9zqtpx9NbFzc
	n4t1F+pF9ilWRlSJ0h5MyPZqnEx40Asnpav5Ep7yBv4lcW9K02FHLthyrEeekgg1Fxkjj2nVJ6d
	Vd5scySF3ftQ0L2Ocz5Kae341+sMhdfNThUTmYyI96NiE2PnYp+9nSyM92RUkxwqYgFgve3awOE
	bT1+f6O9lUfUMY9J5StlLzNncWjgc0ht/3OlE=
X-Received: by 2002:ac8:7d50:0:b0:50b:4ff5:9658 with SMTP id d75a77b69052e-50d62b13664mr110539091cf.55.1775331182392;
        Sat, 04 Apr 2026 12:33:02 -0700 (PDT)
X-Received: by 2002:ac8:7d50:0:b0:50b:4ff5:9658 with SMTP id d75a77b69052e-50d62b13664mr110538641cf.55.1775331181844;
        Sat, 04 Apr 2026 12:33:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd34f0sm2299930e87.76.2026.04.04.12.32.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:32:59 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:32:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aleksandrs Vinarskis <alex@vinarskis.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>,
        Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        laurentiu.tudor1@dell.com, Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Tobias Heider <tobias.heider@canonical.com>,
        Val Packett <val@packett.cool>
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: x1e80100-dell-xps13-9345:
 introduce EC
Message-ID: <suabmy7pom5qc7vv2rrvy64pujnziubghgp55gjvatdmlo4xo6@gial6xwm64dz>
References: <20260404-dell-xps-9345-ec-v2-0-c977c3caa81f@vinarskis.com>
 <20260404-dell-xps-9345-ec-v2-4-c977c3caa81f@vinarskis.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404-dell-xps-9345-ec-v2-4-c977c3caa81f@vinarskis.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4NiBTYWx0ZWRfX7XiAvvAd6DCw
 /RahmV9InD4fVzKToEjx8civf21JA8Mv5DJ+Yn4JGQZHho/eX4kLXEwqZoT3YeFFlupHgvNfgwL
 eHYCS6nVQeIu0Q85uEOItxpETCgorL67SO/+1K+TIrUTKAKRcBwTiI4chRx58PGbAPPGMvuObPY
 D7IThI+VsN3fxlJtGBm8FwAfYZi9/DsDRi3VuKLGPCcclKkX6T/4xkh/e81jDFnX7naktPVI7FY
 2D9i9lfqiSE9jXJjcnRrMCfP2BCIQKYvzsMiI1CRcgDD9SDdpqgmfyTRD7NA6bIMK9ky67oGJzR
 LmFX5QEBWtJScEoFGezDbgfP8KPtuuJn+Xq8DuZL8h0gZouk6aoKM2I+YhOEPLWHdTAidzMidsp
 gsqqzCZPXgCcV53BG8spFxAaD0uB1JUb80ubM1o6pVuGGYrxocNDuzokidUEK04PTQn/vZ6yVgw
 0uVyI2FH5kBjHp+tPQQ==
X-Proofpoint-GUID: dBqP-8xOMmM0zmZlk_eePu0zQR5dXdbK
X-Authority-Analysis: v=2.4 cv=MIptWcZl c=1 sm=1 tr=0 ts=69d1676f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=I76Qk8w-AAAA:8
 a=EUspDBNiAAAA:8 a=BDX-M9UYCxStvK4FQfUA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=vUPM0Wvl0xcrLs4nqPIT:22
X-Proofpoint-ORIG-GUID: dBqP-8xOMmM0zmZlk_eePu0zQR5dXdbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040186
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101794-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:dkim,vinarskis.com:email];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 7BEFB39C419
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Apr 04, 2026 at 02:55:17PM +0200, Aleksandrs Vinarskis wrote:
> Describe embedded controller, its interrupt and required thermal zones.
> Add EC's reset GPIO to reserved range, as triggering it during device
> operation leads to unrecoverable and unusable state.
> 
> Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
> ---
>  .../boot/dts/qcom/x1e80100-dell-xps13-9345.dts     | 94 +++++++++++++++++++++-
>  1 file changed, 92 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry

