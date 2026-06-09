Return-Path: <linux-arm-msm+bounces-112112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8cToDUPkJ2q+4AIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112112-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:00:35 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id BF23C65EA6A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 09 Jun 2026 12:00:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=VM8EQ3op;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=KdVwK2Qu;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112112-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112112-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 63C8A3085184
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2026 09:52:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58E243F4DF7;
	Tue,  9 Jun 2026 09:51:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E3FA3F4DEE
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jun 2026 09:51:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780998700; cv=none; b=tOWJ4kMKJtmwIgl7VuluEx1fQB2b4hA9g13DLBs+gNH1k8i1BT/4BpHxhNNgOEPEtSZ1/3uYZtVp4iJ8hvYlnoz5qaDa3OkYYmn++b+ByVT9k1pChi53/+guioZ0PWLuZETsuxLzdaAuKcq2PYfjwH08HRL0mdXHd3+UuXz1OqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780998700; c=relaxed/simple;
	bh=b5VhZRQ1H4enimio9Hvo/aY7mF3WXu++dkABtvifNiI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Hqk/o0e8imFAtnfluOMsJlEbx/tyr0VEP0oYd1M7aTsnSDyU5OiRQSlxb3r27dHCBgD1xFMZr3vqvlQRGU16ibHPhkFmHS5dkKJeYlMSNi54RYgdhzS3HndYfrRZvycapbPEmccoa157PvB5G6faPxzApEmqxDERnqX7X0uC/WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VM8EQ3op; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=KdVwK2Qu; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6597rqcQ2001516
	for <linux-arm-msm@vger.kernel.org>; Tue, 9 Jun 2026 09:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T/5igrIchRaX2k+2S5t3W5WH9OMGQcxOjMYuGe0pBpM=; b=VM8EQ3op3pxApUG6
	wAMAB64562Of2VAQXPl68sw19gvk4b+7z0KA2Je5YXo8u6xwQ95dmAApvDRTT9kp
	Dxl+sEinzYz7asITH9/KVJlzcRkmUbW7nTnAGzuIal+PGYa05VonWI6rfLq40xg2
	6VyroGw4Rq9k7uU4RJt0X65tmhebRXaDOvspUZsXUMFRNAnWm+llyj+uI4Viu76O
	uVB3FOB8xFSPukohQRO+NmgiDpFcOJdk2LH7v03IhAxIPy3baCSsMbJBZL7Bm66w
	yVjYcjurKhEk6cjAfmJi3wCVviIMpTBW1NL4V7+WtSMBH+in3HwdBSBL4GVBLKsW
	xA786w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epe25rpse-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 09:51:37 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51759082206so15918501cf.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jun 2026 02:51:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780998697; x=1781603497; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T/5igrIchRaX2k+2S5t3W5WH9OMGQcxOjMYuGe0pBpM=;
        b=KdVwK2Qu/kEjvP+YZry3vTO4Ew9h+wpMa5tgjYx2+8nPhwolFxZooCrCTnamOFEuCK
         7qjwj8ah89//LtHuYgPRrXuczFd/y5O8LD3gEpbJ4nQqnD5whKExcsSi1C+Dm3TRBKQl
         j44ihNyUE2je1keS4H+avM1eYDSEQ9DJkKsMFEWCQmgpm+Tv3lkk+dBIQCR8Xs7uk++6
         YTEGrUsdbXPWidz5HbhXlHO1r9eOaYA7QbbUsraRA/Fld0h1HFQiqvbiFInAnK4YJ6ua
         tv72NqbzTkwlhch/x8j1Qc+YnxVrsOrLcuNxPTjnJRAc1VNTVyyjqTIQLbqLFACMmVel
         bqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780998697; x=1781603497;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T/5igrIchRaX2k+2S5t3W5WH9OMGQcxOjMYuGe0pBpM=;
        b=tSUl17ujJSxTqzoIHqbLSS6oNDuX66Y5o7i5dY1gGnwgRQCtPyScjBPzP19K5Qs/uK
         7traGIkEXw75yyWv4in83AaCjAhGWF7IhALxvXS8RrCPBn+pNYTa9VVBTjzvV9trn+2h
         5+aWil8qUax7xFDxUFVp+tppHnPvKyTD9FdUxOFvWCWjwcSdxIOCcKxD992yRAwp/vOI
         /4E0g5NF9knYla1GRuWwlDhJX3JziP4nbE3q+YnQKKpxA+0Ef6WrAu0ZBs+wjLt4NP0g
         igWqBQOnlhsxMUhRz5O1hbp8YTvQQxe4NfpSv+5kZtfbFGq29TpCCXMK5OZc8VkxNKBr
         XJRw==
X-Forwarded-Encrypted: i=1; AFNElJ8WXj5nA5mwPxpyPz0afm6Qrka866/y1DieL1Svn+tbvxMwIM5SPCXUE0yMWSx5A7h5rfHamBVA7CZivhqE@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1F/E/BWu/1j/jscT4muQpoOe/ICEZaMZkQrqq7NFpCn5JmJZl
	eok2M8XONfTNhE7V9cXZeM6EBffXRx0zr+8v4SGE2CWZTc9lFEQbjxSTUpkLcqAICzEsFWZCwAQ
	cpO1WTcWknjYgwDk+Z+WfD7JM5L2oUb+M5tPS3Ug+XUa/TVrm+j9d6t2UHSdl0+tGQgur
X-Gm-Gg: Acq92OFMZVEUP3KbhYU6uHs3jsb9ooJMhYfLvxJhxulfy6f6XB9odcUhh1NgDxejVLa
	eWBqp1igXfY0Mfd8iHjlMP2RDr2Ozo+2ql2/keWB5TZJvPRgvKRuTBuuWfoddmVEC8GwJyszL1+
	BqMGyy3TTRTkRVdNSPOAbp4afyxTq0lbgeKZ7agfKEtZ+FHuD8ndaZFLOEgUsuRwkugIhygLFxU
	PHlLtUY9kb+aNWgdX1uj6KsC2YRrTbN8tqlOY75hDEvls6lbtZEWNd4qYzoyCS39Ky6XIlDNyCd
	mW1nKWiMHjLbTGK9nUx2ekhIsORWbdiNXGOlkkVRkIMPfj2mA/f79jr5sT/xdXpChJH9Tj6FtVM
	tU9Px5CJY/jp1VMAf6euOsXQQ15cASuxD0YiXtx3jekdy8APxJuJD2iAJ
X-Received: by 2002:a05:622a:4c06:b0:517:5af6:77f9 with SMTP id d75a77b69052e-51795b3af28mr168054001cf.3.1780998697201;
        Tue, 09 Jun 2026 02:51:37 -0700 (PDT)
X-Received: by 2002:a05:622a:4c06:b0:517:5af6:77f9 with SMTP id d75a77b69052e-51795b3af28mr168053881cf.3.1780998696650;
        Tue, 09 Jun 2026 02:51:36 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bf0559f35c2sm1023106466b.61.2026.06.09.02.51.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 02:51:35 -0700 (PDT)
Message-ID: <1d26aa46-fa37-4969-aca4-aadde6ad9303@oss.qualcomm.com>
Date: Tue, 9 Jun 2026 11:51:33 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: qcom: clk-pll: reject vote enable on orphan parent
To: Herman van Hazendonk <github.com@herrie.org>, sboyd@kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260602062927.467249-1-github.com@herrie.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260602062927.467249-1-github.com@herrie.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w_HGaV_wxx6-i9XhvEIuJiSFYXlhFWse
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA5MCBTYWx0ZWRfXzc2gnxOk7qBr
 zFgjClACPYFfzal4qmy6jG1VDJaFUfmo7VaKr6mBSIdV7+5w56UhDoISvIBeVD+4bHdRgig+PrM
 zPhRLYB6jWj2tZ9FAlUTTV3ibnhpoeYGsSHmv6KLXABJwA53W3tT6mvYsYNsExcIskl5enqdPaI
 9BTvTH9m5euHt2UOiuEexD87Dd4eIvB3O5s0g3g+WXyjWplU90RaEBMfjJwCRSLHCF8O/R42wIs
 MCCyOIcxVgwLuLd53boiAbQkIBLAufhJ5DAu/YvjbUEuC/gXuUNo9fQWCTYIzpJDbAhyeK3JuCH
 /Lg3wT3YVe76narSNXYdVoqJ/+Yh1Xvl6dsmpo15KFwqcgeie+GaFVxrh6EDVTXJ9HqybCGFrcI
 7k8cvXTc39leWCj35IUYs7q1FRvs47s4jRtTryVfoFTtFTS0cPvuUAptRz5pUQorDWL8YnK3MwZ
 a7RXrhFdq6k56Ylte/g==
X-Proofpoint-GUID: w_HGaV_wxx6-i9XhvEIuJiSFYXlhFWse
X-Authority-Analysis: v=2.4 cv=LoqiDHdc c=1 sm=1 tr=0 ts=6a27e229 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=Yo3Wi9bsOxpmy9sskUYA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_02,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090090
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112112-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[konrad.dybcio@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BF23C65EA6A

On 6/2/26 8:29 AM, Herman van Hazendonk wrote:
> clk_pll_vote_enable() unconditionally feeds the result of
> clk_hw_get_parent(hw) through to_clk_pll() and on to wait_for_pll().
> The common clock framework permits clk_enable() on an orphan clock
> (supplier not bound yet), in which case clk_hw_get_parent() returns
> NULL. to_clk_pll(NULL) then yields container_of(NULL, struct clk_pll,
> clkr) -- a non-NULL bogus pointer pointing into the negative offset
> of struct clk_pll.
> 
> wait_for_pll() reaches for the parent's name via
> clk_hw_get_name(&pll->clkr.hw). Because clkr sits at a fixed offset
> inside struct clk_pll, &pll->clkr.hw cancels the to_clk_pll offset
> exactly back to NULL and clk_hw_get_name() then dereferences
> core->name on a NULL clk_hw, panicking the kernel.
> 
> This is reachable today: gcc-msm8960.c and gcc-apq8064.c register a
> pll4_vote whose parent (pll4) lives in lcc-msm8960.c, and the future
> gcc-msm8660 pll4_vote does the same. If anything calls clk_enable()
> on pll4_vote between gcc probe and the LCC clock controller binding,
> the system panics. The exposure widens as more SoCs adopt the same
> cross-controller voter pattern.

Hm, I think this is a side-effect of the olden global clock by-name
lookup (i.e. parent_data.name). Nowadays this shouldn't be much of
an issue because of fw_devlink ensuring correct ordering.

There is already a reference in the dts, since about 2022:

80787e417f30 ("ARM: dts: qcom: msm8960: add clocks to the GCC device node")

Are there any other cross-dependencies between GCC and LCC?

Anyway, for this patch:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

