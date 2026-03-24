Return-Path: <linux-arm-msm+bounces-99540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sF0aBekGwmnOYwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99540-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:37:13 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 67350301B99
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 04:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7CB9D30D8CC7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 03:34:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F8F39A07D;
	Tue, 24 Mar 2026 03:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGgpZ7fE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WCwQ1c5v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8086339FCB5
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774323278; cv=none; b=Vm8R9OSEINSmjCe88TJS91fMH+4AFQR+0UDkgr8jE3BsKqj61GbS8v2iHiZ2sF6+6ZMrBueEfnaI9yu3GZ6fUGhBvF3jnBEraOK7xo5nU66E+nfrKkTg6in/4WPc7eUpNbAbvNvzuONVfvOFr5j1QmTmQuzfH4/oOcpCbRxaJ8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774323278; c=relaxed/simple;
	bh=JaEgEOwjmp4nnNNKZw+Gej39KXI5sl7inIVgQtr9HnM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IUmu5iuynN7fNH8oU44ty3LieQCwXljyGRPZrNd9j2MQS0+XqHzTpqumpiRcLzRaXtqntHAbYbRHObdTFO8TBoOoeOLs0fCTUDns/4vQOvRUHhl2vqzwJ04y6iFQJNaaTWTvzCHcOPuijykHSf7FRL3pNQ1B189VEUh8nbZZhgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGgpZ7fE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WCwQ1c5v; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NIYus71909250
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:34:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=whDI1GA1rv1vXsO+5RObRJvS
	XkoZkTiE/QS5vJICZzU=; b=DGgpZ7fEBkrigK8ukyNqmZjHmiTLRoeC4J1qtET8
	rMb+8PpJ8QN/Nq915CwIflEdFRLZf1j4XgRSNrbxJQIvQjAGY7rvNDhp/4VpWHAN
	pbOqpQW+1M020z/B8nIZbQG+UvtX6EPFmtXHL+t40IdXTGWDvcFitSJnxV2KXrnB
	/wRhTaiADe8PrSBQN36tDVIZAX8xCVa/ut6BMYU6nswgHPOgv+bZ2/vT3+9AzwTN
	FSAJfH6CJYj7Ez1OB/BTrUtYcaYky59Td6Qfk2xzQ0cdd6T2jkhDyEcaqyRsJI2K
	ObEsKP0kby9OKSOfEfvCkEw2PYDX4fsDq7Q4L7vwucvsag==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3awyshtn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Mar 2026 03:34:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2bdf6fe90a9so867011eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 20:34:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774323275; x=1774928075; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=whDI1GA1rv1vXsO+5RObRJvSXkoZkTiE/QS5vJICZzU=;
        b=WCwQ1c5v/gHP9uT8q5sYoR1g0JarzpF5o1fmmrIGppOWP/ncAZKQWUMPpZaMycCpsU
         knqh02pLTyPjO+S09djui1kYb5dpgIP6isvHrMN8Y73zKQ75hg5n/FamrMKHnlSQaedN
         +wrbT/eeIuEO+CIyQ5XCr8utqH9RiLvKOuHlctw64BKXbOTlceomWrm1k/mubo937ZB1
         CTP5DoUfEOMWFR+ai8k5NKF5ixYpAtjMHQUO/ungR99CBgYlm2BCj45qHTdyo3fp6P80
         OI+NfB28rNbRcBVZrLs4KA0VVMC3pDGrj3+A/GbVz5T1C3JLcwJzdlgh6uKpgiDuaK/T
         7dLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774323275; x=1774928075;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whDI1GA1rv1vXsO+5RObRJvSXkoZkTiE/QS5vJICZzU=;
        b=fia4URpqrG4BokZ0z+mKfex0/E56k5ISM4c/k0Vh+p3AT3srH4lIBtL1QeD5/Myph6
         i3x9oCnJ2Cv+74NTekQHaOWZxjzF58BmZztYPto0UMjfKRKjsOFrTOPAy7dngvPz7y7J
         z1lycAPZ2ItZO+roZlyGW0IJQT21xv2Frm3rNrQDsPHaoDJ4ClOt3j5EAg9OwJMzPP/q
         KIR29D9T2gVVXgyFZ6vFCa/JByPpUtFOkuswaKC2oHqFpPrLzra8ywPoY8mEffxwqa9E
         xpyyLWU6kZlIHgEJMdtBq82+wlvXTBZr/XCKqVBzplE55bzeoKp1IPuyWpbv1WBDIfkE
         DlWw==
X-Forwarded-Encrypted: i=1; AJvYcCWhbwzSnSldQANhQsrbmjoS/tIBvN8sOklEzSsXVvv+w8wZlDEP9q+Ev1aKWHXEyZvptrbTKsjiG0uVxlOT@vger.kernel.org
X-Gm-Message-State: AOJu0YyxLfGvyH+n0HTahs4ipqe+Tru2QyeP6AIWbhtcbdIpNEI5c+Rc
	WDqbGSQWm4zxjggjVxUNPDaz3GLx5lEv+LV3Up2p2OKDIVwkmhml33SeOe5gvXZul/xquOHCVR7
	hLY+1ZHApF0miPHlO/dYycxF1qkOdlhgQbJk7eYDY+X9YSHgevWp4aqqhM+4LcOYmJlKU
X-Gm-Gg: ATEYQzyh4rORBU1iLndCgnv78VbcU2KosoLzh5EKLGt12+tUvGtKHWIoE2bjE15MxBz
	Me8zld917+S3jYmcbfSDw35dX7gkIP0Vuo642f9unEtj2XgDoCH8cTXpRJD6eUfiaoUeFkO4jsa
	RyTz2cN6fCdexFpS1tINiDF70eZbfBlnt0hcKO+LsLiSNNKwcqdDG5a6zeVLPruz6CaiHaq1Vqp
	wug/CXFIHwHwkPSt/QhNJc6eHR3P6ZLt+1etVp5VQH/6veQom67B2ot84Y21hsAMa6sCLmCTErY
	zV0BlGoTfZ9XjUEHWz19Qc4ucwcVOAuEqKc8D3v2xTBnz0KSq6d637iRalJOLOmlR4uDCOr3PJx
	70H2fGMOJuAdg621ECh4yIQJZsiHN1luyruudoMaCf04Aw4qtpLIbYOhvcI1Yzd2qhVT66gGHJQ
	o=
X-Received: by 2002:a05:7022:ef09:b0:129:fe5:117e with SMTP id a92af1059eb24-12a726a2f31mr6177655c88.26.1774323274678;
        Mon, 23 Mar 2026 20:34:34 -0700 (PDT)
X-Received: by 2002:a05:7022:ef09:b0:129:fe5:117e with SMTP id a92af1059eb24-12a726a2f31mr6177629c88.26.1774323274016;
        Mon, 23 Mar 2026 20:34:34 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733fe80esm13039261c88.7.2026.03.23.20.34.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 20:34:33 -0700 (PDT)
Date: Mon, 23 Mar 2026 20:34:31 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Georgi Djakov <djakov@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 3/5] clk: qcom: gdsc: Support enabling interconnect path
 for power domain
Message-ID: <acIGR7WDjjs0SGF6@hu-mdtipton-lv.qualcomm.com>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-3-400b7fcd156a@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116-milos-camcc-icc-v1-3-400b7fcd156a@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDAyNyBTYWx0ZWRfXzNdS2Z5FIfXw
 N2iWpJQu6FgphRnQ3F1kZsrdWyTZILGGy6ADO+cKVhlD+QCg8LY1K0TLAqZprRLJ6IRBbp76AzK
 yoL/xByT/OKmdSrJIKU9oCVPD1bTsKInB4+ne6Hxong3DPx3XUCeGt6xf9IdeKd3ofqJBl+NY+7
 okqKt4qcYOQwChQUBLCAadvvmdJDjk9PEMCIaDXQS1u0dawp9dEAHNQlGCKctD3NGsMN09E22jw
 cUBEEUI8A7A40FmA6zX9kLUyogTapG+AmPVTjeUHLxdM+k1QzspuQ33LqNgw1oPDb0zZZ75d4b8
 IbxqItaG1118uuaRB+I/Q3295C27ECfpaCotDTAs/SC6HmtrCWDX8yFwhPQR7NGw/E/sY8sctYE
 xa+zT3WsanYAyQqftLw1y7XvxWBCvxfVq1EDq5r1mZM2D0A6Z0+C2/HFhTn/2KBxaLo5+IaSNXG
 bCUKeFev5VTJuvKvBCw==
X-Proofpoint-ORIG-GUID: tPVrm1uNtDo2s10G6YufZw8_tz-xF8if
X-Authority-Analysis: v=2.4 cv=KuhAGGWN c=1 sm=1 tr=0 ts=69c2064b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=6H0WHjuAAAAA:8 a=PAalmAW71AuKxujjx8AA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: tPVrm1uNtDo2s10G6YufZw8_tz-xF8if
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240027
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-99540-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,fairphone.com:email];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 67350301B99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Jan 16, 2026 at 02:17:22PM +0100, Luca Weiss wrote:
> On newer SoCs like Milos the CAMSS_TOP_GDSC power domains requires the
> enablement of the multimedia NoC, otherwise the GDSC will be stuck on
> 'off'.

As mentioned in another email, the dependency should actually be in the
other direction. Where MMNOC gets stuck turning off if CAM_TOP_GDSC is
still on.

> 
> Add support for getting an interconnect path as specified in the SoC
> clock driver, and enabling/disabling that interconnect path when the
> GDSC is being enabled/disabled.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
> icc_enable()/icc_disable() seems like a nice API but doesn't work
> without setting the bandwidth first, so it's not very useful for this
> driver, at least I couldn't figure out how to use it correctly.

Agreed. In cases where a driver only needs simple zero or non-zero
votes, then icc_enable()/icc_disable() don't really help vs. just using
icc_set_bw().

> ---
>  drivers/clk/qcom/gdsc.c | 19 +++++++++++++++++++
>  drivers/clk/qcom/gdsc.h |  5 +++++
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index 7deabf8400cf..ff1acaa3e008 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -7,6 +7,7 @@
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/export.h>
> +#include <linux/interconnect.h>
>  #include <linux/jiffies.h>
>  #include <linux/kernel.h>
>  #include <linux/ktime.h>
> @@ -261,6 +262,8 @@ static int gdsc_enable(struct generic_pm_domain *domain)
>  	struct gdsc *sc = domain_to_gdsc(domain);
>  	int ret;
>  
> +	icc_set_bw(sc->icc_path, 1, 1);

Need to handle the error. If the BW request fails, then we shouldn't
proceed to enable the GDSC.

Additionally, setting BW here doesn't handle the case where the GDSC is
enabled as part of gdsc_init(). If we move the icc_set_bw() calls into
gdsc_toggle_logic(), then we don't have to care about how many places
could ultimately enable or disable it. Since it's a fundamental HW
dependency, then placing the BW votes in the common place where we
actually toggle the GDSC on/off seems to make the most sense.

> +
>  	if (sc->pwrsts == PWRSTS_ON)
>  		return gdsc_deassert_reset(sc);
>  
> @@ -360,6 +363,8 @@ static int gdsc_disable(struct generic_pm_domain *domain)
>  	if (sc->flags & CLAMP_IO)
>  		gdsc_assert_clamp_io(sc);
>  
> +	icc_set_bw(sc->icc_path, 0, 0);

Similar to above -- we should handle the error case and ideally move
into gdsc_toggle_logic().

> +
>  	return 0;
>  }
>  
> @@ -574,6 +579,20 @@ int gdsc_register(struct gdsc_desc *desc,
>  	if (!data->domains)
>  		return -ENOMEM;
>  
> +	for (i = 0; i < num; i++) {
> +		if (!scs[i] || !scs[i]->needs_icc)
> +			continue;
> +
> +		scs[i]->icc_path = devm_of_icc_get_by_index(dev, scs[i]->icc_path_index);

I generally prefer using string-based DT lookups rather than
index-based, i.e. using devm_of_icc_get(). I know our clock drivers have
switched to primarily using index-based lookups, but I still generally
prefer string lookups:

  1. They're self-documenting within DT rather than relying on magic indices.
  2. The property name in the driver being non-NULL can indicate whether a
     handle is expected rather than relying on things like "needs_icc".
  3. Would remove the need of adding the new devm_of_icc_get_by_index() API, in
     this case.

There's nothing fundamentally wrong with this and I won't argue hard against it
especially considering that it's consistent with how our clock handles are being
looked up on more recent targets, but I often find the string lookups to be
cleaner and more robust.

> +		if (IS_ERR(scs[i]->icc_path)) {
> +			ret = PTR_ERR(scs[i]->icc_path);
> +			if (ret != -ENODEV)
> +				return ret;
> +
> +			scs[i]->icc_path = NULL;
> +		}
> +	}
> +
>  	for (i = 0; i < num; i++) {
>  		if (!scs[i] || !scs[i]->supply)
>  			continue;
> diff --git a/drivers/clk/qcom/gdsc.h b/drivers/clk/qcom/gdsc.h
> index dd843e86c05b..92ff6bcce7b1 100644
> --- a/drivers/clk/qcom/gdsc.h
> +++ b/drivers/clk/qcom/gdsc.h
> @@ -9,6 +9,7 @@
>  #include <linux/err.h>
>  #include <linux/pm_domain.h>
>  
> +struct icc_path;
>  struct regmap;
>  struct regulator;
>  struct reset_controller_dev;
> @@ -74,6 +75,10 @@ struct gdsc {
>  
>  	const char 			*supply;
>  	struct regulator		*rsupply;
> +
> +	bool				needs_icc;
> +	unsigned int			icc_path_index;
> +	struct icc_path			*icc_path;
>  };
>  
>  struct gdsc_desc {
> 
> -- 
> 2.52.0
> 
> 

