Return-Path: <linux-arm-msm+bounces-111717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Y1WeIWFwJmoUWgIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:33:53 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D78B865391E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 08 Jun 2026 09:33:52 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=DWzxvGnS;
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=ejy+kNBF;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111717-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111717-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3ABAC3026310
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2026 07:30:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFDED38F65B;
	Mon,  8 Jun 2026 07:30:10 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C4538F646
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2026 07:30:09 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780903810; cv=none; b=mstWTGOFgwGxieQ89dGtdY4jzcQDfkcRMNwEXO50XdhDne2oIX34tNlU06ZGLjCD9FxxAYk7HGxDfQQH1EsUy8tZ/SYsrbaGvh/Txp+tmzV0vuEtu42Dhyg3DYjZbx/4dn7crao1nwAmntSJop8+o5OhKQoIrTP87YytlDcEbRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780903810; c=relaxed/simple;
	bh=z3qvRnmiSf2bBBWwHjqp/VcnNYtlWuj3TaFh23cMoVE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eB2bN7vu6uwcf2x40kBaUyVCZqCHK+gSU+yw4xdh1ERvxdHInePyx3TPDDxeAtNuEuCJUN29w/0ji6kSogThMVPmKrI/4UizRqrhh3bPR7uutaqjOLKKwhj+WtSAfC8gOk6p+Ix8ATSEnREOHlEwwgp+OpqSBDBW7DifynFbdxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DWzxvGnS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ejy+kNBF; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6586PjKo2733088
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Jun 2026 07:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=n96Tx26lpUtliljHkLBGB6tR
	wRaJZHoDUKuN3OfDGFg=; b=DWzxvGnSCdqTy4IT9/YfBbmB9j8XX6RaajltFT7T
	Wn3tv+Mgm1CKtlCqr/ESV0htPIMOZ/QM4Av43Dk97Gs9gDYmfanfNFA8ELNKBiDq
	emQsP6Lx4I6qqzmOWV0OorGq+6GqGYCfx+yiJY2kgIboBZ7JXuJKVR6Hwf6OTDfz
	yCpAPhtPRRa82jmWCNCCOm53Z3Wbg6LF3BWkutzXkS2Pp8g3MalvEMnJ4VN1Z263
	0sslV8mMfCPn6Symt8Z7XmgOsHBSngU9yH+NgYi7XFimOnLqs2VIqeoEIIUcefhI
	0xry257QiohKBGBz8H8huDk4R2gTYHmIJHoeWxRsJAoksg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4emavf6n31-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 07:30:08 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517ac42d958so28191911cf.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2026 00:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780903808; x=1781508608; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n96Tx26lpUtliljHkLBGB6tRwRaJZHoDUKuN3OfDGFg=;
        b=ejy+kNBFc1u3qS4sUG1LDuH0p1BFuFIYhis/dZzDX7Jp4ml9PWM0B05nLimnPVwsCS
         e7kjeOZTQhPLsxMANk3j91AUScTeF6tqdxEr9XUL1pTd9yE8dvXCXx51K5gAo1YYy0G/
         abrq+bvTLvvViulBhztOIRa6BDKNMkDvkRhxxh3ReVpUveuXSn4aWHHOUKpMl0GTuqjc
         48fUqHhtJXeUEuthnUaJY+CpsvSCO48y/DJMBLjDd00x6S62U3NAHBg2gM77aYkUsEJf
         8F72bL2T3W6fFlgLW+6iPk6ACAPtlz1Kw0dYzoPTIuGDIuqZ2hjEQ7LlIo4aveYdkfQS
         OxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780903808; x=1781508608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n96Tx26lpUtliljHkLBGB6tRwRaJZHoDUKuN3OfDGFg=;
        b=tM+fOs/1nn2zoiCy72u6C6Q1qi0HbscviBpgs42XYz1kxaPM2vmc9LZUg50LTFqcG2
         UP3On0v9JZtzVyyYQ3uL3QYD2vwmF4fvmhCbiMNpkP8Cfe6ToDT35rk5LGkgdYopenfw
         YNatDWEBxGl/2FXgA50xYfL4bqn7/zYCJon3lPDm8l3e6qYaJDXmAsH4ubFQwEsGBb7N
         ODZqKQJm/dO7SgSHA0LcHqtiLtntSHpDjMOf1B6pexpshAtzp+imEVEF9WvmUJV2V/V4
         b+VriS1lfggWM13NJnYXOmUIgb1YvjtB/8a3+dW8MadQ179XI1ygb/3isOsjrFjoadPU
         DJbA==
X-Forwarded-Encrypted: i=1; AFNElJ9Ep5pmjvpa4bcJrPgR4vE05Zvks7vJgH4Ks3IFvZsURcP2NSv0rG1znWWTG239P1GKsdNHJrCwQIJ5QSmN@vger.kernel.org
X-Gm-Message-State: AOJu0YxyB3n2/+hpVBhx/XMzu96cNjOHv7LwQIzaituSq8uGhF7IIJUL
	855XHXQ5mocq2F83SKcOLRNaQOjdbm5AwZuexuSNsi4wv4gyUALnjxAlnenNQRN70zJ90AInELe
	v6ggucfJGK/1oCe2KuOeKDRmhwy8oCATVWKnNs59RUv/UeflhB/GfeOBmjFDWKC5f/xTt
X-Gm-Gg: Acq92OFUY/5odz9euctaVO82L2LTuxEE75/ICjeErx6OLGzu+DonnDmHqW9OzThI1bg
	Quv+oBoGQ3SqLmhcB4TAqSCBiV6IrSE2yfP9jId66ZvbOrWzURt8RsgWfiPCACZLh7RbxNQViZ6
	+z0so4XszGm9xqgR+yfaToR4/69Cpou9N4h8BZZf4009QFP6nn4sYElept9m/kT8q+jtvhXm5pw
	heG1kj0yWJH+VN4/lR4sZxm3fZhck962PHCqb+2ezaeVIfFA9UEqmF7o0qdbutYOWtt0ZMhiAKp
	3WC/WUKpwcQn0XUVayepQGt9mzRZdYDBBEColtfzsmwitl3bPsc9tqEAzMjXgEZJyypfc3BNf+f
	mCoJWDvewD4N5vHIgBAmL0/2sV3bKS66n0slddbNy5y3tyqY26GH1Mzprt91ruAU/rBKGij7ym6
	Phvj+P8RgcDx7QNZTbq/VAr7Ydsp86VmKftf2zixgUF6PdTA==
X-Received: by 2002:a05:622a:2515:b0:517:859b:b584 with SMTP id d75a77b69052e-51795a0909dmr196942071cf.1.1780903807694;
        Mon, 08 Jun 2026 00:30:07 -0700 (PDT)
X-Received: by 2002:a05:622a:2515:b0:517:859b:b584 with SMTP id d75a77b69052e-51795a0909dmr196941261cf.1.1780903807070;
        Mon, 08 Jun 2026 00:30:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-396ac2d5ea9sm43380831fa.32.2026.06.08.00.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 00:30:05 -0700 (PDT)
Date: Mon, 8 Jun 2026 10:30:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Herman van Hazendonk <github.com@herrie.org>
Cc: sboyd@kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: clk-pll: reject vote enable on orphan parent
Message-ID: <m4o436r34wiqjlgl6vc7aekel4prahjfspnzn5bu663uliqosq@6iogoaznv3tf>
References: <20260602062927.467249-1-github.com@herrie.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260602062927.467249-1-github.com@herrie.org>
X-Authority-Analysis: v=2.4 cv=I4JVgtgg c=1 sm=1 tr=0 ts=6a266f80 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=cTwmTnRGAAAA:8
 a=NErERKXRas0pqSP_P6MA:9 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=GUWCSGlMWfG-xDt5EnV5:22
X-Proofpoint-ORIG-GUID: 8S00pUerpSfY5Tj33dw4hPj-IhXtvqau
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA4MDA2NyBTYWx0ZWRfX7IoifePBP7Yd
 sNBHC97ViZcK7Po+UmP6h4JPLxWYplfW2m5Xd5zIyMdrvGOvvk19g+60lRF4e+CV3n1so+Tgh1Z
 FQQK5OX/7ClrGsoFj8ZgJbKuTxbR8rSg87voRPm3Au/WxKsALRYilytf+V/PCVx8p6V20Le5lTf
 KVN6AwHlv9VTPbLRJuwPulGsjw1GqbHjZYGtWWjW9c8AWfKRxTAYDmm3VQHswcpKf5mPliT/UHM
 E12Ke92Qf9laTF4E0efGiujRCLFqv06ce70TP3ooZ3S7RgiQivbpOt4WE4gpNGV+WHxAjilCZdn
 fAQwPiyDizDiQ1TZlDx03+B7xO3cCDGSHNvzqD59sfkVNWaxiP1RdJ/vv0xnt1t4KCvpak1bZLQ
 0RLqkDmlcMSxa1uIIAGLyQBLyqgYw1KyvjpA+NqSQf9F0yREamdk8JQCbxvLv5k7C1aRcWVIsgq
 LyDu8GnOBE0PfGthsEA==
X-Proofpoint-GUID: 8S00pUerpSfY5Tj33dw4hPj-IhXtvqau
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-08_02,2026-06-05_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 bulkscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606080067
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-111717-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:github.com@herrie.org,m:sboyd@kernel.org,m:andersson@kernel.org,m:mturquette@baylibre.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D78B865391E

On Tue, Jun 02, 2026 at 08:29:27AM +0200, Herman van Hazendonk wrote:
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
> 
> Resolve the parent with clk_hw_get_parent() once, return -ENODEV when
> it is NULL, and only call into wait_for_pll() with a real
> struct clk_pll. The enable-regmap write is also gated behind the
> parent check so a failed enable cannot leave the vote bit asserted
> against a clock the framework has not finished wiring up.
> 
> Signed-off-by: Herman van Hazendonk <github.com@herrie.org>
> ---
>  drivers/clk/qcom/clk-pll.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/clk-pll.c b/drivers/clk/qcom/clk-pll.c
> index 26ba709f43c8..7b26129565fe 100644
> --- a/drivers/clk/qcom/clk-pll.c
> +++ b/drivers/clk/qcom/clk-pll.c
> @@ -199,14 +199,31 @@ static int wait_for_pll(struct clk_pll *pll)
>  
>  static int clk_pll_vote_enable(struct clk_hw *hw)
>  {
> +	struct clk_hw *parent;
>  	int ret;
> -	struct clk_pll *p = to_clk_pll(clk_hw_get_parent(hw));
> +
> +	/*
> +	 * Vote clocks can be registered on one clock controller and have
> +	 * the underlying PLL live on a different one (e.g. PLL4_VOTE in
> +	 * GCC for the LPASS PLL4 owned by LCC on the MSM8x60 / MSM8960 /
> +	 * APQ8064 families). The common clock framework permits enable
> +	 * on an orphan, so clk_hw_get_parent() can legitimately return
> +	 * NULL here while the supplier controller has not finished
> +	 * probing yet. Reject the enable rather than handing a bogus
> +	 * container_of(NULL, struct clk_pll, clkr) pointer to
> +	 * wait_for_pll() - inside wait_for_pll(), clk_hw_get_name()
> +	 * would reverse the offset back to NULL and dereference
> +	 * core->name.
> +	 */

This is a commit message, not a comment. SHorten it or drop completely.

> +	parent = clk_hw_get_parent(hw);
> +	if (!parent)
> +		return -ENODEV;
>  
>  	ret = clk_enable_regmap(hw);
>  	if (ret)
>  		return ret;
>  
> -	return wait_for_pll(p);
> +	return wait_for_pll(to_clk_pll(parent));
>  }
>  
>  const struct clk_ops clk_pll_vote_ops = {
> 
> base-commit: 944125b4c454b58d2fe6e35f1087a932b2050dff
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

