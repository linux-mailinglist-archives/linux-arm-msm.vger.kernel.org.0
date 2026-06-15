Return-Path: <linux-arm-msm+bounces-113136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ht/pAqG/L2rqFgUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-113136-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:02:25 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED78684D68
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 11:02:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="ASkc/cyF";
	dkim=pass header.d=oss.qualcomm.com header.s=google header.b=OO0msEGs;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-113136-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-113136-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D8E86303D09E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jun 2026 08:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC2513BED7A;
	Mon, 15 Jun 2026 08:56:40 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 744F03AC0FB
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:56:39 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781513800; cv=none; b=JgOO8FwyLICEw14rzh8tNJJK2bBrqr3X06lGBrowoMqf8lTZw0+f0iltXfZgEdv3CemQ9Orffc8hn6BDWQ8QaR6ipbJhViEVvNoIoUWgxG5KQ66QouysItCkRyI1IVyNKSUkCNjXDHNBoc3NMTN1yQHuijhSAxy+7Tw3pMKkYOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781513800; c=relaxed/simple;
	bh=XWgT1kGNO6ECwHI7KeVtDswPKVdOpecFG5b1u3WSEYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pe7bgyqz85ZJ0Bls5w5eEJEkGcHOFmmPpcGWSY4GryK33OFy601zg64Hyi4TIk7KRgHBK2tF/TqrpGqJwhsuWzKAiLRIOsfMdaqICIaC2MAo2SA5MrG7/66JCLSSI9m8Y/CwJ5QYYcX/u5p4mcgPUnfuL45eN+VCZsu3iUzKe90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ASkc/cyF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OO0msEGs; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65F7TtJn4091187
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FjpsFq93269SiO0nGjpKMG6V
	iOATVyX6+3QFq3t9WRc=; b=ASkc/cyFDpKDrVkO+Tmz64F/qqU2RFu/uczWRDEM
	37lMnAraBttpL+PaLdh7FJa+NJtqL/VnfaSuxfPQPVJVgF8nrzVwgWauRj+8hLLc
	qxUkro3SCgwLbqeW9h0NP7L515YeVVCLzD9QQVR3WB9lJU0a66W6qs4Tr5bsFroE
	pkLfOSqDAEb8sD921A6CpHPDjyfKp1j7vH5zaxsdVjSVqcme3JUsynqZbCJxcAId
	fT+2a9Ovl3ZInD8/kf6KedQtHgMXpBI9LtUtJ5JxbaswHIdFCgojYJYib9QpxWSA
	gHTfSzp6/YaSJNFivDJPpzog9qkBT0FfW/4Irw/1BmXg+w==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etd2c8bf2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 08:56:38 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30762d67a64so4406091eec.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 15 Jun 2026 01:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781513797; x=1782118597; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FjpsFq93269SiO0nGjpKMG6ViOATVyX6+3QFq3t9WRc=;
        b=OO0msEGsYEVStz7XtdQSTvbIkkrTKe3fteygDAYCImRSVf+npPEHng5ntTenjP67ts
         jHvAHHk8mLMg5TmkLcptbPGISeJ65Vs5mHPxYYKkVmy0TpzMPsEUUDDtpcvsq/eEgFiW
         UU1lRqLyRVdP93GGWIj4H1OH3UbeGxvTZNQXQgUhZYhKOqjjnyPO72qp5SHH0yd57uD/
         4krm43BU4u91MCZB3apgVLgFhdJYwuqMn+RsIFZlvjdXTNregJS6CKjLzaDYyEnuWpp8
         1ljAyM+jA0SoB31iPVE4ROAMf8eHbTfKl34LtcMtv5pr45lfy05v28cXcqZSK/t2rAQn
         pdzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781513797; x=1782118597;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjpsFq93269SiO0nGjpKMG6ViOATVyX6+3QFq3t9WRc=;
        b=IPcBxCIgJ5LSeAPhGJqbeYGvMyjm5H5R73M5F2jDMSfTUhvBDXILIe4JtDi0FC8KWZ
         6ZLeJAN5ox3zL6RQC6eDbUUrpAQWSLYKDodgoK7sWvG88571hvFIqD+aYQSFKsCHWnB5
         /KxdEMqgmqhkDAJ8qlPn+1+pODgUT5ChZkDMxVwskTwjnXYwM88ATDeqGa8hm1TVfl4F
         9o8igdfprOKSL5HT5zzKN+26KrlU9z6Xnvgm24g+al0+704FcfvmgB/ViSYtWJvwaPzZ
         nSYJb2mOqxHMe/hZelZrxFWkfmKRmZIb8DaTDK8QEtNx9SM2RP1MTN0Dvsp8rt7XWxZw
         YR+A==
X-Forwarded-Encrypted: i=1; AFNElJ/88PDlJO7RjWqRNgqpqRx08QY3FxeS0BV+JB1cRuqlYsar40QoYYdrJa6+MXMW3qOzeRwU+EgqVl+D4gLK@vger.kernel.org
X-Gm-Message-State: AOJu0YxmIObuYtnM98SkwhPzApTpbIhzWAZ5iMQMQIkD16KZw3pDF8ZL
	gP3LiaUZDoEQkqz1wtkIV7i3u+YFZhGxpjfu5dBqzAVRMPksZY7J+SfPRgAlxc2iAFvceOgKk0w
	lBcRT2eQkBPd2IKLfMkjRlOMJteCRoryC2tzo3mqinIA6eK0b+tcbRUoIm9MDaGzxv4Ey
X-Gm-Gg: Acq92OGTZaxwUtGRH9rMr2VXCBjtT2UnLnXk/KemIkpwrfr02YlXjX7y5qBgcC7tIqW
	Vrfsm9DiGVVWl1QMBdT6N/QcItnJX8WWaenCLG/uVEj9vucJegddp8IEvhKVklXDiVRAcILqwNd
	x6GgGZsH+jvz7epTav2E++HX0yuEmTB9v8p87EBIlu93d+9mZ/Sds5V6+g2HIZJ1OrmjWBJj/bQ
	75YSsVOljlCljQ/wUE5Jds15w6UtDWPMEi+vEUGkB4hi73yj7BMhdIZUSSe8go8cZYIKqqlPSjb
	K752S2NB+CkkTS6aAY7uZ6g34h+Kp7RfbhsGBmmmCNDgFrC+6/7phfHr0UStBrxiPVowDgx2bs4
	y3hkL+D8GHJBu2l6CyD+VtoHYmsLoNMfYwFdzMsj3Uiw+oLQPVmOLPCSOl/KAI0Olbl0h
X-Received: by 2002:a05:7300:8188:b0:2f3:3daf:3496 with SMTP id 5a478bee46e88-30820098dd8mr7313136eec.26.1781513797275;
        Mon, 15 Jun 2026 01:56:37 -0700 (PDT)
X-Received: by 2002:a05:7300:8188:b0:2f3:3daf:3496 with SMTP id 5a478bee46e88-30820098dd8mr7313118eec.26.1781513796733;
        Mon, 15 Jun 2026 01:56:36 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95342sm14150909eec.29.2026.06.15.01.56.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 01:56:35 -0700 (PDT)
Date: Mon, 15 Jun 2026 01:56:29 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Stephen Boyd <sboyd@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        krishna.chundru@oss.qualcomm.com
Subject: Re: [PATCH v5 2/7] clk: qcom: Add generic clkref_en support
Message-ID: <ai++PWgSGZnD4Haq@hu-qianyu-lv.qualcomm.com>
References: <20260602-tcsr_qref_0527-v5-0-8ea174a59d7e@oss.qualcomm.com>
 <20260602-tcsr_qref_0527-v5-2-8ea174a59d7e@oss.qualcomm.com>
 <178139077723.819343.8364833855890359860@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178139077723.819343.8364833855890359860@localhost.localdomain>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDA5MyBTYWx0ZWRfXx6sc1gyygqQA
 zfSDnCqLlbEjpGQ9E9qCmMDXt6NHB3B+WB01p1LjTkG1PXl2fv2495LzmboUGmPaCN4A80kdxjS
 3d3AJhDX3lM/1LGcbcRq7OEOpuFJ6wGqerFxlsj33ezdj82XZsdGCxEZRhW2hkBohMfrD09gU8z
 RgpmHY0+DUKdIrnxwL6F7ZvGVrl6qrQYzUYbjXiYKlVIDqCvGx7NT2NP0u3LAjFGQzppbiHpLcv
 t4syhgualK6/4x6j4OI6+e398iOQt6SVb/nlCYqN7xQN2oi1wmapfASYd7ux52uUzGjZRlng2V3
 0oQJ1P2mAm+bxROlPaoOT0JY3Sb5GQt+RWtPOUEMXZ2px78yDft0psBPV8iQF5Jc2XXgR9bEs/d
 A4gepIf6N1GaPglJVIMbF0VN3gijk4MLEm7+m9dSr8PdBqVGVyikEUlyLMPrGpfC3kx48jSm8ZO
 9KF/QGgaB2SRo9RzIxg==
X-Proofpoint-ORIG-GUID: 3gMIf2tMFIkwV8rbocY1Ql5PgIkKhhV2
X-Proofpoint-GUID: 3gMIf2tMFIkwV8rbocY1Ql5PgIkKhhV2
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDA5MyBTYWx0ZWRfX+OFbGtgZSElK
 IDYC7vaHq1TOfFaKSxEOJWfLVM/IoM3zmcuIKzK1JmgvC05773Cydlk+mZPH9dIeofkRWwm+r/q
 J/o8mkGUPzSf7HTs7FDawDlCDQJ8mHw=
X-Authority-Analysis: v=2.4 cv=MsRiLWae c=1 sm=1 tr=0 ts=6a2fbe46 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=jYBClPptyWQWpWkDfbYA:9 a=CjuIK1q_8ugA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_02,2026-06-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150093
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-113136-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[hu-qianyu-lv.qualcomm.com:mid,qualcomm.com:dkim,qualcomm.com:email,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp,oss.qualcomm.com:dkim,oss.qualcomm.com:from_mime];
	FORGED_SENDER(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_RECIPIENTS(0.00)[m:sboyd@kernel.org,m:andersson@kernel.org,m:bmasney@redhat.com,m:conor+dt@kernel.org,m:konradybcio@kernel.org,m:krzk+dt@kernel.org,m:mturquette@baylibre.com,m:robh@kernel.org,m:taniya.das@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:linux-clk@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krishna.chundru@oss.qualcomm.com,m:conor@kernel.org,m:krzk@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qiang.yu@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9ED78684D68

On Sat, Jun 13, 2026 at 03:46:17PM -0700, Stephen Boyd wrote:
> Quoting Qiang Yu (2026-06-02 01:02:18)
> > Before XO refclk is distributed to PCIe/USB/eDP PHYs, it passes through
> > a QREF block. QREF is powered by dedicated LDO rails, and the clkref_en
> > register controls whether refclk is gated through to the PHY side.
> > 
> > These clkref controls are different from typical GCC branch clocks:
> > - only a single enable bit is present, without branch-style config bits
> > - regulators must be voted before enable and unvoted after disable
> > 
> > Model this as a dedicated clk_ref clock type with custom clk_ops instead
> > of reusing struct clk_branch semantics.
> > 
> > Also provide a common registration/probe API so the same clkref model
> > can be reused regardless of where clkref_en registers are placed, e.g.
> > TCSR on glymur and TLMM on SM8750.
> > 
> > Signed-off-by: Qiang Yu <qiang.yu@oss.qualcomm.com>
> > ---
> [...]
> > diff --git a/include/linux/clk/qcom.h b/include/linux/clk/qcom.h
> > new file mode 100644
> > index 000000000000..09e2e3178cfb
> > --- /dev/null
> > +++ b/include/linux/clk/qcom.h
> 
> Why are we making this file in linux/clk when only drivers/clk/qcom/ is
> going to use it? We can have some qref.h header in the qcom clk driver
> area.

The header is placed under include/linux/clk/ intentionally for reuse
across different drivers. On glymur the clkref_en registers are in TCSR,
but on SM8750 they are in TLMM, so the registration API needs to be
accessible from outside drivers/clk/qcom/. Keeping it under
include/linux/clk/ allows the TLMM driver to call qcom_clk_ref_probe().

See this earlier attempt for context:
https://lore.kernel.org/linux-arm-msm/20260202-topic-8750_tcsr-v1-4-cd7e6648c64f@oss.qualcomm.com/

- Qiang Yu

