Return-Path: <linux-arm-msm+bounces-110135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPhsMXlaGGrVjQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110135-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:08:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BE775F431D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 17:08:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A828331AAF5B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 15:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B27342E7399;
	Thu, 28 May 2026 15:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j9zBzMtp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EpCneZn+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A041BC2A
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779980503; cv=none; b=SIDXtR0HIsi5CwSKaCv+8kaownl6Mrcnn15kABX3lj8pIJ+stv4APQ69NTm0qWu+FoICkdFSKs3pDxp1krc2I+x4HdCgGVPOhWs/01FnMLlmRkqe1QVTpQ9w60Dx77YiS4qocwcNUWHEeJrrKoR/sRORQPaxpOvH/8Q7kQCkReM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779980503; c=relaxed/simple;
	bh=4GnQVk4uJA7GqOVb6u3PPbujRwmpQUG2pQItHH9GCpI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fZ+Wmdycg0w4T38TRVP8Gvsc54J+5HaKd9w/rVMPF1XmgUKQ3/yKvPLN1NY6kPRPNKFl2i1xReeZW/w9FA8c+GsPv/McVOrWr/iJ8y1b/7KyMh53SC9aPTbf4myDyoDLmwKShYgc0pg7rL+HqwEF/3miwMeddehaKh/dZtDSCcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j9zBzMtp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EpCneZn+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64S8wNWA382552
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:01:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HaNfui2FG1mDwh5+yjz39dTw
	V8xEs4HnIe4IRTWrOCk=; b=j9zBzMtpg2a0zAo1dbjkUAhgcaqPvS3C88TpbmzA
	uVUAYH0iMmGQ2YPZKcK6NJkkZIjOVbedeR6gEZZSwwjlHkq1ghl1aSNlvdRsItcv
	Z2a6ZupDf3940txV56UAhdQDw6duoQNb/cZ0Kke4SaJuG8SVogdSIL+ZAO54JyWi
	7mnGRPt9tize3mouTI+CaCN68ukd/YooOaG8fO+f8chao1xA2WLD/a9ZeB0bHJET
	QmzxRMXmVDVIP3Wp3xJppAfQaM0slC+POgxtkeFkHJGBnt9V42Us9U61IUqLaEMO
	+tZm3Yj5PXxNQpbqphnX1dOsJ6C7eSd3NIVCCGO9Lpd7PA==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7yrk8ju-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 15:01:36 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-63cbb164b37so22560723137.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779980495; x=1780585295; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HaNfui2FG1mDwh5+yjz39dTwV8xEs4HnIe4IRTWrOCk=;
        b=EpCneZn+Qeia6C8temy4Yh9j1Xmuaxzi/2itOlFfmUtPfsO6F2vVLU0o4XnvBlifEC
         T9nQwPBSVYhZvpm/uIPeRdi3Lu/iUrdiWQ4o5Hy5bd7iTfAfG58ow6w407R5CTPWHXcE
         ou54kXe5zAEiE19sGk1DTWYib3ZkWDenYOalqyP/ntNNhWKiLVgM7M1Pq8Yj+lbmL+Uu
         TsUdCxRSYUm+qgUbAmvzPZJpk1c2LyeunBmCyPwERtBwDiCEgaSS1GkD2Ax3XDK/aHhC
         ppVcJAcz7IJXC9/z7aU6Ec0rSIPjbTTAvBet1gypnao7YDADYco9WtZRgeXxh0A0dXhE
         b/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779980495; x=1780585295;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HaNfui2FG1mDwh5+yjz39dTwV8xEs4HnIe4IRTWrOCk=;
        b=eRQhjbpsvw1TzJmjRZRBBw0znK0GI7uL1L/oVFyJaU/dLRHNwgIadjV90ExRl8/ayD
         Wvel2CZI7wegLGJVjk+RhLS6uSiT6sYYLhiHAPxalvBUVYwyC/AWjdWDG684J1stJ5p9
         DWgSGnRCrWGFfEKBcEgetEc/X/C3eQWwankUBfcPSd7Sif14/MzzVyrhpNpLq+9i29d/
         FERO2p9PJwj6UNTknFBbnHGWug3izarMRbFbKFeytP+VDMrbATokthUaB6zybvW/zk0h
         9h/G6UGTT0YGY6uslhusbbCVKIY0zBYc/LftDQIgMiN4ImS3QgpQlxvjPVzm27QBjogx
         ZrWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8P8SLCEhXTj8xzeGsWjFR9CLep6kODqU/OHc9n1s5Z/DVLGtEB8l73rUHjFT/daFg0/a+vhrFOItI0ctHs@vger.kernel.org
X-Gm-Message-State: AOJu0YyUhMfY63eTJvJnhkSIAc4bYnNMRP/MgmpbP9JebYChFopi+T63
	uVvCpHxnZ6A57YbiyU75p3B6Wh982LChk4To7iiPYTcu3qW5djwmjJwin+hDB/htThe9UXKzizZ
	azQr2rUQDxhBG1KerCEBWMR2JEUbRJrlgIyHCjEyv2KrrCI5kT96zcYRbHptnPnxJJeLr
X-Gm-Gg: Acq92OGoRSXxLa+WfwekfuZXs8X25Oq0zh25sI+lE6gl6Q8d67Gv3C4JNDiH/EFN3B7
	a8Ql3i33fDQdVmn16XbGBN2irVnXHJCOmywANRr0XXWhZRaPjTGfW+wqePGNa3VJMGdj5u3hA4p
	nMx/zlEEMm4k8RqQdQR+mSzESM5KJyg/q1ZNi1vRUKYB2f2YVIqmHrK6C8VmLtukviY8ZpeM2om
	k2b2F3VCVneI+r/8ekuMS4ou3j2L5nvW1XqLTknNasP6MAp+MmWvQa6Y84oY1bHd6AftuhNSbms
	3e92W31Q8+qT+HpfZmX3L4dgQN6NnFO1s0d4nfPyrc2xNkQZmRD0yPqNdB1OjzOQyu6crwjNQ0F
	R8PNV5QO5cEfE32+COje63RGqwiUKGOJZaMOBomwFeyjmrRav3pMO6Ou5PT6n9f8y8ufKPCScF+
	7WYm2K8ftmQNG4fNSd+c0Nl53H2cEUCmcPrjsJXM7nFk5Gag==
X-Received: by 2002:a05:6102:6489:20b0:631:6e70:b905 with SMTP id ada2fe7eead31-6b8b027285dmr551995137.12.1779980495061;
        Thu, 28 May 2026 08:01:35 -0700 (PDT)
X-Received: by 2002:a05:6102:6489:20b0:631:6e70:b905 with SMTP id ada2fe7eead31-6b8b027285dmr551891137.12.1779980494380;
        Thu, 28 May 2026 08:01:34 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-395dcc2f502sm39258551fa.35.2026.05.28.08.01.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 08:01:33 -0700 (PDT)
Date: Thu, 28 May 2026 18:01:31 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jie Gan <jie.gan@oss.qualcomm.com>
Cc: Qiang Yu <qiang.yu@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v4 2/7] clk: qcom: Add generic clkref_en support
Message-ID: <ci6qjemmmcrtva2o33mkcv5hu2o3woj7eg5563sursf455mygc@fuigqdocarsz>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
 <332c5b1e-8b70-4902-99f3-536dfe8e32bf@oss.qualcomm.com>
 <ahg9uFs1LqthstWi@hu-qianyu-lv.qualcomm.com>
 <791b1b88-d2d1-41f3-8902-d63dbd524bd7@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <791b1b88-d2d1-41f3-8902-d63dbd524bd7@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE1MSBTYWx0ZWRfX/PXEc4taGZaM
 U80cxaGFGNDu3rsOxImQRap/wraqYO5zjsWf9/Iz4KKFV0I8FcvVPlkqZYAYxv/HOlEEZcVGqxu
 KLj/vlvbQwOZf4mT2S+alwI5i/ENKJpmFSCmy4SG2OjzesiQEgYvN5fTw62p1ugwT0t0KrQYxFI
 lOFpS2YANdNItsXx7LwbY45KBu6YzT++o/ag6AqcP2zBl6v/P+wHfxDKPTFlo7yXgPh9I/XKKzc
 SeNLpinx0FRsFhHucwJWRox58wOiVKJ61NcIxBiuamgGShKiZyxsH0h5Gr7yHpsCUwwIhi0dDWI
 +9Wu9yyW60Kssv3xNTLwOImEtUnOeGq7Zf+uTtseD8q9W7W7X0U9lY/2pseH8CKm74+IvLw+s7h
 2RcHrRGe9+eqFGfhQ5ldO2WYidS25z8Ga88PzRMfiGiHT4NDk+8SWMOu0CKFmVHkynZukSdZDxb
 P7SARDaU8G1RKf6UtdA==
X-Authority-Analysis: v=2.4 cv=PLo/P/qC c=1 sm=1 tr=0 ts=6a1858d0 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=2Qrb-dWxc7tvpDbJBDUA:9
 a=CjuIK1q_8ugA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: ZLvAFgAeuDgwkrumfBmXlrKfermYdIcb
X-Proofpoint-ORIG-GUID: ZLvAFgAeuDgwkrumfBmXlrKfermYdIcb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_04,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2605280151
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
	TAGGED_FROM(0.00)[bounces-110135-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,qualcomm.com:dkim,oss.qualcomm.com:dkim];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 2BE775F431D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 09:46:51PM +0800, Jie Gan wrote:
> 
> 
> On 5/28/2026 9:06 PM, Qiang Yu wrote:
> > On Thu, May 28, 2026 at 11:03:45AM +0800, Jie Gan wrote:
> > > 
> > > 
> > > On 5/28/2026 10:29 AM, Qiang Yu wrote:
> > > > Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> > > > a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> > > > register controls whether refclk is gated through to the PHY side.
> > > > 
> > > > These clkref controls are different from typical GCC branch clocks:
> > > > - only a single enable bit is present, without branch-style config bits
> > > > - regulators must be voted before enable and unvoted after disable
> > > > 
> > > > Model this as a dedicated clk_ref clock type with custom clk_ops instead
> > > > of reusing struct clk_branch semantics.
> > > > 
> > > > Also provide a common registration/probe API so the same clkref model
> > > > can be reused regardless of where clkref_en registers are placed, e.g.
> > > > TCSR on glymur and TLMM on SM8750.
> > > > 
> 
> [...]
> 
> > > > +
> > > > +static int qcom_clk_ref_is_enabled(struct clk_hw *hw)
> > > > +{
> > > > +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> > > > +	u32 val;
> > > > +	int ret;
> > > > +
> > > > +	ret = regmap_read(rclk->regmap, rclk->desc.offset, &val);
> > > > +	if (ret)
> > > > +		return ret;
> > > 
> > > regmap_read returns a negative error code on failure, but the
> > > clk_ops.is_enabled() treats the non-zero value as enabled.
> > > 
> > 
> > A regmap_read failure doesn't mean the clock is disabled.
> 
> Do we have special reason to treat the error number as "true"? Its worthy to
> add a comment to explain why.

to be 'false', the error number must be 0.


-- 
With best wishes
Dmitry

