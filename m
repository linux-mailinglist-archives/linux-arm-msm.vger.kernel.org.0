Return-Path: <linux-arm-msm+bounces-110217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id Ly5sMqQ1GWrzswgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 08:43:48 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 097685FE138
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 08:43:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id C1D903045057
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2026 06:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAD863A1CEA;
	Fri, 29 May 2026 06:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NNGr0gXz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="F7yRwNUn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E278341068
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 06:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780037020; cv=none; b=Xc6CNN56wOZL8MLQSQkOX2V+VdlTow8xhxivaBFFQvMX3HzwcnlJKFDauiUuiDbI7cIE9U++MmArQMSZ91ZA1+bon+vd9ZHKXp6Hy029PZbwXprHqbH3OgoaKAnSO9bPJtgjJKPH0QW9OYUMzu0xPDyx/mqDOyNVtUejs9rdhGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780037020; c=relaxed/simple;
	bh=gv0wWw3TiHbT8WEvl/ZzkrTszY8D8t99Bqb6KerS/Zs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGtqeR09+vQlD8cbmV7EWcTlglGbFk2npUKztSBTVubBLYZKMwR4BlokIZMKNiud98YNcQI29KkkUzmEqqbfKS/bzTtb7+80dmFTbrrwODkK2YBLvwkVrH5Jw/R42fN+f2FbqlyqdoLHJakhnoDRr3psPj2Eu5WfdhAl8I1DJ+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NNGr0gXz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=F7yRwNUn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64T5KO1s1248248
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 06:43:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SRP7k9W4N5TAXp03B/Rp6JeL
	JFS9nVJ2O02UPWSLMlM=; b=NNGr0gXzKp8qiOhPUESo5T3RwOznKmjTx2OMLGof
	PPtL1XXbRPyGAMHrMc+xnNYqQvoqmrYk5Z2FhrAMa+LGEtQsbE+n5L703ZC+XCH0
	TtTgFPl/bD/m9PbBITVsDqhB+oqfarh5cauSvcct1kAJPV9VHMf51DYswd6TPbCA
	7IdzOWSfUinSlhMA1tbnJWHFrLxmoGBG/HFnOfO9Z0X/yP178vnf/M9IKNU/yPp/
	H5Wwv1XjHkOh+cUMYuh1a/6tMo8CpxTl6lGzGBHH17IDUwIF09vmO8N2Jm18Ltqj
	mp3D9rK0lvCjnqc6XfC/5ivHu6e1olhdouJfYS+SvI9F2Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ef4jj0aj6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 29 May 2026 06:43:38 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-304df51ff3eso1269621eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 23:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780037018; x=1780641818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SRP7k9W4N5TAXp03B/Rp6JeLJFS9nVJ2O02UPWSLMlM=;
        b=F7yRwNUnoFs8mEtrGq0d4z2JOY/0o0yF5slN7KLZ7CzhJazbb0xXZCHZ0wfDNDh71t
         hXMOL6Z4dAijyAXzlgUwaPVAEHyQ4HmP1xL2N4BzHf5N508GyxU9YPRpGC74ZD8fa/rr
         GiS9zhVij82lo+028ShDmnqg6LrxpZO2+pLh/wtqmZ0KgRMDmgoEoic4Ik831eXATI6Q
         jHcj/9ROxCBJYhKlreEhriMvm30ADGhT5smFHd2dXJ778WA4QW+5+ZFahi7hluSyTpH/
         3GAdhi6M8XG8DdGH8XMxzacvYZHVbQM/erxDYUIxqTUFMoE2Wcy+uBdKYZS9nzaUS3ka
         eXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780037018; x=1780641818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRP7k9W4N5TAXp03B/Rp6JeLJFS9nVJ2O02UPWSLMlM=;
        b=j35/EYiZDqZnK5bLx6ddTdUX7fk0O1mR5CqgWLlbBp5R/uqAgXAyoB/OUkF++NcVHP
         yRS6OHhNfVLp0CmEOjh0QLh+jHc/hU/JLcYO5o8zT5PeEcx4JSaRtxGrApfbfz7PNIxI
         h0Ln1otN8sunlUwDakY4K7cieR+D1RRanLxifp91CAh/N/rcUs1TtGzqQWN3nX9YdgRr
         A5+Vn2rQIACCXtJaCiE0vSTmgo4uZpxioAIfIndQbTjFYmKtGm5Q6T19v2Z9m0f7AyAc
         Nyy/IgtHLcRJJdd2yyUgbsOsoWYxnNj6Cvco1kSEG/MFO/K3vDvfnSWfXYYv4uDBC6ly
         m3/w==
X-Forwarded-Encrypted: i=1; AFNElJ+zSqAm2H9aPte5iOZCZQGfgFW8NnWLf7neGFm+1m445/gcu6sWWlaGgOoPFvJS5lmbFDSCwbzLLcYoH0iA@vger.kernel.org
X-Gm-Message-State: AOJu0Yy27TrIde2qnXs+GwIJem0sZQMLKiB6kUaNHPbvwr43Yv54C5Hn
	J0dYPpA0Ji8DLxqG0OWiyfWF8luScWlazxr6BL90uvbH4BCO3u076xFyOF5tTLkrEOiyA5Rkqro
	3+dsoSzcjpX3ISuRpplLDIT6I+z6MiESI14V8ZIDS9jDISaavFk1MHOFn4Jko04xBRKth
X-Gm-Gg: Acq92OHAwUY7EYiSE8CWzx1149nSoeE37FhpuKZLy7MUJT0kdWZ5OgP3t7ev/OoLzAU
	Y2pkJ+XuO4n3DDJk/3ZOuFIL1sKjmApVssFPAjW7S/sRdzq3KdA+9lc3pMk7AT7pcEKCi6g3Dpi
	yhnt0NpivWMUEEr6d1rdrfAxis0drfDTyOehrsh8OQcr/fP2WWPHCnmsUIRCDDr3NHI/glJIeYM
	TN/Aa8cq5bG1LNRzvh3Z4DbdFRJe5391BX3Vwe1UjK/fqMCPlfEJVqeh3nydIAp6mXw3TSWgDOE
	yWlKq1+a7M+mbGJx78qqRMMkH6m95BDD9XS6Rq6vwBf5fCjJcwbs3rzoPmYNUq84XKoKLBYajfP
	MwFlL+KGpg7pkpaXzhJAcI7UIsQjTosSOgHNP5l4HWotiDqiJWFDtp3aRfIcz7UoOBiDkirgSRV
	93FE4=
X-Received: by 2002:a05:7300:bc86:b0:2f2:5c68:5074 with SMTP id 5a478bee46e88-304eae36928mr677186eec.13.1780037017610;
        Thu, 28 May 2026 23:43:37 -0700 (PDT)
X-Received: by 2002:a05:7300:bc86:b0:2f2:5c68:5074 with SMTP id 5a478bee46e88-304eae36928mr677166eec.13.1780037016527;
        Thu, 28 May 2026 23:43:36 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed2c120csm742456eec.4.2026.05.28.23.43.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 23:43:35 -0700 (PDT)
Date: Thu, 28 May 2026 23:43:33 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Jie Gan <jie.gan@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>,
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
Message-ID: <ahk1lUKZZRnRBDM2@hu-qianyu-lv.qualcomm.com>
References: <20260527-tcsr_qref_0527-v4-0-ded83866c9d9@oss.qualcomm.com>
 <20260527-tcsr_qref_0527-v4-2-ded83866c9d9@oss.qualcomm.com>
 <332c5b1e-8b70-4902-99f3-536dfe8e32bf@oss.qualcomm.com>
 <ahg9uFs1LqthstWi@hu-qianyu-lv.qualcomm.com>
 <791b1b88-d2d1-41f3-8902-d63dbd524bd7@oss.qualcomm.com>
 <ci6qjemmmcrtva2o33mkcv5hu2o3woj7eg5563sursf455mygc@fuigqdocarsz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ci6qjemmmcrtva2o33mkcv5hu2o3woj7eg5563sursf455mygc@fuigqdocarsz>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI5MDA2MyBTYWx0ZWRfX4d0JiCQIAAIJ
 fc8pFqC0gbeme4cwLkCSmt/PjAbgmRWn2eKgAuYKgPcLHf3xREPS92JjGsAfzN1iN7SzpIWelcU
 gVtu/uXlN91moji5pt9RnSmjhmfRNbKS2wJo8kme37Bwzzuy6Qg2nIU2r2ssVyJT/+tQaKUjNYp
 BpoM+FkxDXUHyHQpSNHQw0TPKr0ga9zSDmxUcEKWJlEMN0vXTaD/XvxOUhwdFFa8uteCn+EGWtc
 0PKm413DvFOGw3tkvB1K80xAnJON4xwBfWXiPm9V2YGL8/Kgzkj5B9jRoh3THJ52xBOoAOuHJfg
 gIoG2pFMgUvkjE0wGmlWpv/6sDLjxiysmDh8Omn621AkMoBXRJ570+hCSGrAwfbvkx0OyYhAiTV
 yUsKHd6StI39ysSnCSNMMrXf959+x8fhG1IVLXVx5obenG3pDF+msAt08M8OSiotEPj2s+ALjbR
 CISI2i3Wfj2B0mN9dHw==
X-Proofpoint-ORIG-GUID: lXaXmTyiiz8J3hNN8evxWQrb2WuPkvji
X-Authority-Analysis: v=2.4 cv=Tt7WQjXh c=1 sm=1 tr=0 ts=6a19359a cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=ZygxbtBykRKHyXjXJgYA:9 a=CjuIK1q_8ugA:10 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: lXaXmTyiiz8J3hNN8evxWQrb2WuPkvji
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-29_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605290063
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110217-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,qualcomm.com:dkim];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 097685FE138
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, May 28, 2026 at 06:01:31PM +0300, Dmitry Baryshkov wrote:
> On Thu, May 28, 2026 at 09:46:51PM +0800, Jie Gan wrote:
> > 
> > 
> > On 5/28/2026 9:06 PM, Qiang Yu wrote:
> > > On Thu, May 28, 2026 at 11:03:45AM +0800, Jie Gan wrote:
> > > > 
> > > > 
> > > > On 5/28/2026 10:29 AM, Qiang Yu wrote:
> > > > > Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> > > > > a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> > > > > register controls whether refclk is gated through to the PHY side.
> > > > > 
> > > > > These clkref controls are different from typical GCC branch clocks:
> > > > > - only a single enable bit is present, without branch-style config bits
> > > > > - regulators must be voted before enable and unvoted after disable
> > > > > 
> > > > > Model this as a dedicated clk_ref clock type with custom clk_ops instead
> > > > > of reusing struct clk_branch semantics.
> > > > > 
> > > > > Also provide a common registration/probe API so the same clkref model
> > > > > can be reused regardless of where clkref_en registers are placed, e.g.
> > > > > TCSR on glymur and TLMM on SM8750.
> > > > > 
> > 
> > [...]
> > 
> > > > > +
> > > > > +static int qcom_clk_ref_is_enabled(struct clk_hw *hw)
> > > > > +{
> > > > > +	struct qcom_clk_ref *rclk = to_qcom_clk_ref(hw);
> > > > > +	u32 val;
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = regmap_read(rclk->regmap, rclk->desc.offset, &val);
> > > > > +	if (ret)
> > > > > +		return ret;
> > > > 
> > > > regmap_read returns a negative error code on failure, but the
> > > > clk_ops.is_enabled() treats the non-zero value as enabled.
> > > > 
> > > 
> > > A regmap_read failure doesn't mean the clock is disabled.
> > 
> > Do we have special reason to treat the error number as "true"? Its worthy to
> > add a comment to explain why.
> 
> to be 'false', the error number must be 0.
>

Okay, will change it in next version.

- Qiang Yu
> 
> -- 
> With best wishes
> Dmitry

