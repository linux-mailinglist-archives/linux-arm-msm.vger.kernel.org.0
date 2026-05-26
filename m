Return-Path: <linux-arm-msm+bounces-109725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJkLN8U3FWoDTwcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 08:03:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7B85D10C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 08:03:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C4B603027693
	for <lists+linux-arm-msm@lfdr.de>; Tue, 26 May 2026 06:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A25D3BFE50;
	Tue, 26 May 2026 06:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Meq+sh5/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NLcmYQnQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA623AB28F
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779775252; cv=none; b=kZmenmPV07XWZ361jmy0GSjJXMIH0xxRhd9WiqQmyqpmNS9PXuKQ7k3bce11uGSxhvS71AuwppEfbXySYlHHjK8DsFXNsXQv+aTvB5QNzkpJz0bOG7h0Vh2K6uBWIME9gnMtigkTpkKgrw4CTbRU/gkp5Xkeoy3xLRfQpWoCmL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779775252; c=relaxed/simple;
	bh=qWKEGMsRAygprv1qNcmSHZbG3rTbI37GY6knmYEGeU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mEZ3n/h2SVN9pLp8TzjxbAdCPzfmFYSBC09Ol0F2XHM+SbyPeOpyQz1wanCyO138mes8XeOMnCHWSbqXZvDEWuasKowrwjazCEDQnXokmtx6APm/qMw//WWcSgxVWDKzZTF+QOG/cqlXBQyP0sNMDATh//aH/8B8eA/T2/ipuN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Meq+sh5/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NLcmYQnQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64PJHOpU2146247
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=+snBfc2EP8BesCpZmCLz6ucu
	mRMXFltIhUtiZuC9Q9Q=; b=Meq+sh5/iF2mzbUpaTFOxLidIsO4eUDGB+mmWx1n
	8JwmMIEaNMW7qm4yWzOulUULcewGt3mJ+5u3Snfq0myDP+LCLCTTYZvJyoihmn58
	Mm5wnj9PPkDJaEGgaaFMrmSM4Ecb6BKLKNMytPGCPbIbe1aCwex4C8p0Z6ggOakR
	prPk5qa0/1h/+QOm9RvI0NQAV9PfPefINRoZFMY3CnnPdX8v+I2l9oZ5rCge4seC
	8wXte4SKJq8XDIMT1XTuUbS6OPN1iNBbBZ0AIJCB8Cm7XXbWNizguZbmITmsiyUH
	h9kCXfGeAk7Qv1ZV9ABkLKkqSX6UqxfYrFCFXJlAwOQw2g==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ecmbv346w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2026 06:00:50 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-6313cb80e7eso12628072137.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2026 23:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779775249; x=1780380049; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+snBfc2EP8BesCpZmCLz6ucumRMXFltIhUtiZuC9Q9Q=;
        b=NLcmYQnQBg5LVX08V9/rMVwvmCu1TB/ec/Ak0C1+GB0IKiue5yISEei9EuOhHo5LNo
         /P2gIaBedJEG3Zn0QnZAVVb48HP4U5R5bZCWHtTBmjZFhXVLWvf1uF7L5HEE95n7z1lL
         R4Rz+530odW8jUhJBxFb9uQJ5Vum1D/QQlHsdEzJtNYaWn9DFjDvdZzWEaU4IMDlFvxD
         56nU7XfGlLxrjS+ivQUyKU6BhxJbkIM82dlVhL7IsP0ZWpOt4TqsyTvR5xNdICPcajH2
         LYBLhfIDW7nMmeQBeBY6FV5OiMnHLw8zvOrjUv1nBZ1+82+cbxtAcXym3iis2KS745EO
         o+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779775249; x=1780380049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+snBfc2EP8BesCpZmCLz6ucumRMXFltIhUtiZuC9Q9Q=;
        b=q5GIfQVbY7idkBxTWY/xv+GbVgBEQRfDlVw77SZYuy0cbHGo727iyKJiKGCri1M70z
         MTOHWqEg+nYNz+5a6safbaZy1K84a3G9w+7zcewzf0Wn9CJCuWwmC6VXpw+rbNcX581G
         ulmKAX9QZOvQggjYcNt146easHOwQ49H6rh90CkIasSVk8FdQGs53n+HeStKFFNKdrII
         b/UzEDdii8i3P5e+4knLfiQsIHqlPLfJM64g5OtSU4CEipJMywdd4kiHe4YtDD4+8x21
         jphkLwsalRJTlbHe78phbmewy5a0VOFIL/ItXRVnn8UB/AlZZdwSoxpb4EpQk2YiSFm5
         FzZA==
X-Forwarded-Encrypted: i=1; AFNElJ+PmkFvhlJ1Zhabqn7VSuqMvsFe9XWaR0bCSaoghy6SqlwFz2yIYP/nJJ5pGzsSqnoi1hf+GjMeKdrPjWwl@vger.kernel.org
X-Gm-Message-State: AOJu0YzMMOktqK4SZTiWmpCPXp2t0tYTKypd8oxY/fexG4a/E8nbx/Cq
	QdvIfM+i6nLKzmoyVtfJkUS4o8ttk23vhAhwr8//9aRIsLFXByR2EUPkT5Fgj1AEP7Nst1rYJC8
	+viQwnqqe+Q1ykE3plvOxGa5sGPNl7S965zCDkpq8mQFRmCfOpXB3Rm+B+lKRxT2iT0Mw
X-Gm-Gg: Acq92OEIP8ESTtjtflkhiE6yRdZ/J7AXC/y9rHeaDwJhgeb1LbwrjEAkHdfqNcXBzm0
	fNiNX/XE2NY/KtXaXsIWA4OMiVe53jr4KxXn1+dEZlVxJhg5I0G6VvxyQ9JaiWFzEGXyqS8HFXw
	h1V9eDaV1uZ4LLKgA4oP1WDlgRMQF2JB0KHKgut/NVRkd8setD2j7yQECLhPD7pkMj2DFKR3Ve9
	rbW171w9UpBNmJGRuCSSTKRQd9Xsjpo2/afAeb8rgHdyvuGHtFqJEbx2lwPLn60NPnR564ZH+v1
	m8FNzbO3y0GmfZFH2lMvyzfgJdQu1PddGQV0bNpide7MpL6Ns59tUomHgynhSYuGal3G6wFByKm
	XQxcuq2mJ/39uwxo/2e8ekbyYhAho7BRwMaXOTpiaLjeR1pj2cm8HYVD9M2uvdkDwf61RX86FF1
	QKThIKDg0XAUxTqTiMVVbItFfOeiJ1/2hG3w8=
X-Received: by 2002:a05:6102:508b:b0:607:95f4:53b5 with SMTP id ada2fe7eead31-67c6f741653mr8573239137.4.1779775249061;
        Mon, 25 May 2026 23:00:49 -0700 (PDT)
X-Received: by 2002:a05:6102:508b:b0:607:95f4:53b5 with SMTP id ada2fe7eead31-67c6f741653mr8573225137.4.1779775248578;
        Mon, 25 May 2026 23:00:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4634d550sm207734e87.81.2026.05.25.23.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 23:00:47 -0700 (PDT)
Date: Tue, 26 May 2026 09:00:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Taniya Das <taniya.das@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 4/4] arm64: dts: qcom: glymur: Add EVA clock controller
 node
Message-ID: <snnl3y2ekgosvrtwmbjbk6izxpyoeiicw3sffqqmhontaroy5c@rcee4gk3dkux>
References: <20260526-evacc_glymur-v1-0-b61c7755c403@oss.qualcomm.com>
 <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-evacc_glymur-v1-4-b61c7755c403@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA0OSBTYWx0ZWRfXz6+wz5fji9mO
 Kvyj9V8+i0daWZfHL8egRneMw0vWvcT1jK679NN6V5cI65UNKyXx2Gx/KbZ4hbmB2BCHGQRkEDZ
 1YbmH8ahkLZ4NeqGrliEZrbccZj62alP87CVLI07oJPt4QsaaYBx5IkMdmilGMfAIPKD82wK5rs
 qOGxUVtb/t0MVr/Tio80TBGY0fvs6bnfhTUX5f3iCX24bPbK9NuDchqyZa6aSklAWcV6HanBT5m
 V0lOrQr8TdSmzcWpl0WtSmRMipdJzQa47eSOQZyRZOejM4VfNi98nBIAS4YDMqzUJBPNMcripHJ
 vBVxX3rO1f4Y1UtrR0iWNRs+LYkmegwtAVYGgul6gNeftWAfgFqAzRWgCwk2uf9E37cP/fwQIcd
 6Rzgzb4oAiH/EO3biH0mm5/1QKd4iXoZaEiAaGzoOsSIoUou+gHmCqgCzEP3dPhOvLzl0TRS6SY
 Hw6H6Q8qT6fFwOYtCOA==
X-Proofpoint-GUID: mCSiqZ-3BJ9yW_syuu9Y_V-_2d6tczP7
X-Proofpoint-ORIG-GUID: mCSiqZ-3BJ9yW_syuu9Y_V-_2d6tczP7
X-Authority-Analysis: v=2.4 cv=XqTK/1F9 c=1 sm=1 tr=0 ts=6a153712 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=TVveIvzGzKhwGn6Bp88A:9 a=CjuIK1q_8ugA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260049
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109725-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:email,qualcomm.com:dkim];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8A7B85D10C3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 26, 2026 at 10:59:47AM +0530, Taniya Das wrote:
> Add the device node for the EVA clock controller (evacc) for Qualcomm
> Glymur SoC. The EVACC provides clocks and resets to the EVA hardware block.

Nit: evacc vs EVACC. Maybe it's better to write 'This controller
provides ...'.

> 
> Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/glymur.dtsi | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 

-- 
With best wishes
Dmitry

