Return-Path: <linux-arm-msm+bounces-107948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oDJKC+tAB2oCvAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-107948-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 17:51:07 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A4308552682
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 17:51:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 45CBB300D4FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 May 2026 15:45:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 38DD23F58DD;
	Fri, 15 May 2026 15:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VIadg89s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XI/ZNVF8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D1E83F44EC
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 15:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778859693; cv=none; b=a1ANqcjYPjp1LkO5rzY2WrHvWho0gRo5l7m0qQIhKC345CJxW8Yvx07jkR07G6ylaC92HHFoP8Idm+zhdXfqZ+04j3YARDz2GXJ+4avMvPvb5+Whgx92vNoD2hQn5w19ibJPpQ5LBw8vYN5+8QtacBmPl6+7LMXOz68qbTecEY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778859693; c=relaxed/simple;
	bh=Pc3MpCtVK8p6OudMDqnhjwapWxM0T8CO+YFnhbV1T6I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rrnOY1Qb6VGzGKRy1SFduPeD1Bf545ddqs7W2MNG1GDJa70eqYNykU2yvWfe8yzGea4/GNCTI3qhSFwwlzg4Vz06sHNyoEYRvqTB+gf5g8AzEJUdUKheNOpYmehTukvyojdvIUwBMhtNq21J/UT6tvjngv7zDA9ZvE7ZZiBzHzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VIadg89s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XI/ZNVF8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAsq1g4008602
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 15:41:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=48QgJCSDGrxZEEMu60fAJNCo
	YBZQJr3kDDsz/0EEYCc=; b=VIadg89sDaZvWClueo52v1sDS1B/qTeTPu3I8+xq
	+s/bqhRXAb5w1C4wkhNEn34mfKed25guHcntxkeO0pduG/MoaWA9I9x/7l8jDC0k
	vU5XBfJI9CZPjB1EuDsWhcNxP/XQI7IYGiKe/QaqhVmcFBJ7aqtWAhrfmoPV0Hl3
	5HDE9Z8kdazyRMV11Ifumjyr9HYYY90gm9y/jdFI97gDG8QA8HW2x04tityde85h
	CYqSpRrNz8qWSf4aV7MO2MXW+mQrKQwW/Pt9/0xU5DNzh3MZFKm25+2atgUNyev/
	HnQB3ojb0tOelxpO5NgTLLoksTYR42yIGmqxkFK3CcZnyw==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1suvxh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 15:41:28 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-82fa7c6699fso12148822b3a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 May 2026 08:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778859688; x=1779464488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=48QgJCSDGrxZEEMu60fAJNCoYBZQJr3kDDsz/0EEYCc=;
        b=XI/ZNVF84nrZAKcRgX8L0pw/ZhBrb9nZQW2EQJb9/YeXNbu1asTxQ+W0m/ZWOow+tX
         hj1bCTApP7OWJ8iAEmUNs+4sPeFug9/98ORqW9d56sK8FM0Nmm8GeccSHhIW+LpzsCM5
         EjTlLG/HwLGFUQCpQ/8/gcFGdYLzPNVQm3QkBzpWgtBI7C0QTah6DJoCFiQ6/+yRb/p6
         OK2qfIMvYk414Gb6sUwVKOAsKrQ8d6GpjORw/qofvkL5m7k0c7WzFoc1IWbdYnlHxsTv
         S5xpjtnW8Kzhe/DBTni+8MWwtkOQ/9F405Ob8jpniZIVs80ywcij9mKTkmzirDWWyjY9
         jUyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778859688; x=1779464488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=48QgJCSDGrxZEEMu60fAJNCoYBZQJr3kDDsz/0EEYCc=;
        b=UTt+MREtpXjjxNIGz6h/suxLUNPhpJn9VJ4ixKVKcrxiG0QjWblBGCv7elm+tcHJWX
         +L/0ANMBvVoyQ+yau7RDqMFMh9vEuI6feMl7PIJGv14bRdDX/JtRPakmU0jGkx+lwlQ1
         hExDryvyqKWztAetySLlOkq7srStcTQbaK4mH1wJW4CGMNUOI7iy1XEkEM2XwRaRPTdC
         3Ffd8zviupXd7Vl8uX6ZA0RsUFOduXocL3+ezC/WfaO3kcyPDxIS2EOcLGX7REjU7P1v
         p+y06tQoLmJ8DTA6y0R8oknQCnZhJ56CIsIuBasszO5YtldD6EyV5pYJuBlTQo2MfpOX
         fvfg==
X-Forwarded-Encrypted: i=1; AFNElJ+GO2IDLe8mnZpYSub3ZIZYkGtG2q175dOqser8AUJfd1N0U5KbKVwlM3lLEgoSshbs76H8LALMKQYgBZiB@vger.kernel.org
X-Gm-Message-State: AOJu0YxOs1saHH2FUEe2a6UI8buTD4Whr4053vBCs+wJACZQgpfmMpPn
	sGB/Js1BB3oWuigJSK7CXvLga9/6t/OlICJXQCtZsBub3+1lLkZltXyX8g3MTzCIa97CQ4/JCHk
	BmEf7N0OsZZKyQZCqwWojcGf4/wMXQ1CC62azKZ46R4X/VQMRdGQUDAKYdiynk4VM12o+
X-Gm-Gg: Acq92OHFJemWJardny2nI6SFl3Ll30D5+9t4zlixoX0mNZSlEbvq7M5/xUVILq1l8i8
	hKP3SKx29bIZFmqgPGx8UmoqdI1mf6B+qk3zAcPj1pgNdTwOlIGigdSqShzeLXxlhuK/KxnTtz+
	CarswR7SsS2cz4QO1T0Q/j/oaXfxFbctMdBCTaQ868XgoWVBPg7SwxU2bJ0Kxrwdc/Rrj/pvHEv
	hh0ava0IJBYIoBKkjS1MdWyIZaaqXwAXdstf7Yi1mbkYCU/w6J6LRtmd2kxISqZZV81E3FB7c2L
	1sQRfGN6peeHSjNO7+25XwZniDe6D4j0OnR3t8C9EqUofDhap6ChsbUvMLOwBT+Ss4etCxhaqDL
	YeBn8h3RsatOmxel2lTs+8HnitOO9paZG62IRNUuwj/Zyc72TU7qpt2+SJsWDLtW0YBtq0092m6
	HPoUVVHCbccNIWvAcgrTouAH93xPp9FwgG3b7yiJUJwcjUNs0vwmU=
X-Received: by 2002:a05:6a00:3e22:b0:839:dd77:3501 with SMTP id d2e1a72fcca58-83f33c33546mr4982599b3a.1.1778859687717;
        Fri, 15 May 2026 08:41:27 -0700 (PDT)
X-Received: by 2002:a05:6a00:3e22:b0:839:dd77:3501 with SMTP id d2e1a72fcca58-83f33c33546mr4982557b3a.1.1778859687257;
        Fri, 15 May 2026 08:41:27 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5c39esm7532977b3a.36.2026.05.15.08.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 08:41:26 -0700 (PDT)
Date: Fri, 15 May 2026 21:11:19 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/3] clk: qcom: ipq5210: Use icc-clk for enabling NoC
 related clocks
Message-ID: <agc+n28PfkrxwpuJ@hu-varada-blr.qualcomm.com>
References: <20260514-icc-ipq5210-v1-0-b5070dfbe460@oss.qualcomm.com>
 <20260514-icc-ipq5210-v1-2-b5070dfbe460@oss.qualcomm.com>
 <5zdmbj56ndi7nrvdqadinrf3sneywft3uaplnoxugp5zetsfbj@5hazmuzyfz7u>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5zdmbj56ndi7nrvdqadinrf3sneywft3uaplnoxugp5zetsfbj@5hazmuzyfz7u>
X-Proofpoint-ORIG-GUID: ZwkmDLk-x9Yd7NF7jXNEDxSkl_q63NSV
X-Proofpoint-GUID: ZwkmDLk-x9Yd7NF7jXNEDxSkl_q63NSV
X-Authority-Analysis: v=2.4 cv=cZPiaHDM c=1 sm=1 tr=0 ts=6a073ea8 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=jBAFZfc0v9Tf_D0DgaEA:9 a=CjuIK1q_8ugA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDE2MCBTYWx0ZWRfXz1hwmLt1gQOz
 ABswqVAmDUlmZJSckeu/QAvZRxPUiDtzvDfsX13SWl9vnVRN2YOLh2t7DuWPhC9KSOBPaVZHCnl
 yK4lXQkXjeAv8XQxy8eMNon6N9Ugf89WpYZBD0TxJeu8MWPSVSb7Qr1ILumgHRZVW5vMcukElG/
 4RnHwBrR51iSsDlXQCwxd3vUopChz2xwCisIBNTJFoIvwYU8CNSTHzOxWl+xRZYVA6VOVIenf5A
 WL0ugwG0qBIAHAljm6hjXvWMq0wbau3tKkqaRN+liLKVAIlZjRFSrdOdQyrh+UZLA4LXdhIeJ23
 8MYXibZz3Im1fN2EtZnfpKqNxv0SJc4BJeccHkQBgv8jhzIESXO95r3BQrMIjpLPQmytBwRNMes
 wgRKGsP4uKbmZrCMiW6i5u4F4INIsl/OkiONuiVUtn8R+T3WqN6HmrnJQplv0sHmYHydM4LsEKM
 swV+e7KBbbKQ909iBZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605150160
X-Rspamd-Queue-Id: A4308552682
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-107948-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[varadarajan.narayanan@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

On Fri, May 15, 2026 at 04:31:42PM +0300, Dmitry Baryshkov wrote:
> On Thu, May 14, 2026 at 09:35:36AM +0530, Varadarajan Narayanan wrote:
> > Use the icc-clk framework to enable few clocks to be able to
> > create paths and use the peripherals connected on those NoCs.
> >
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> >  drivers/clk/qcom/gcc-ipq5210.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > @@ -2642,6 +2657,7 @@ static struct platform_driver gcc_ipq5210_driver = {
> >  	.driver = {
> >  		.name   = "qcom,gcc-ipq5210",
> >  		.of_match_table = gcc_ipq5210_match_table,
> > +		.sync_state = icc_sync_state,
>
> in Kconfig:
>
> select INTERCONNECT
>
> OR
>
> depends on INTERCONNECT

In drivers/clk/qcom/Kconfig, IPQ_GCC_5210 can be selected only if
COMMON_CLK_QCOM is enabled. COMMON_CLK_QCOM selects both
INTERCONNECT and INTERCONNECT_CLK.

Is select (or) depends INTERCONNECT still needed for IPQ_GCC_5210.
Please let me know.

Thanks
Varada

