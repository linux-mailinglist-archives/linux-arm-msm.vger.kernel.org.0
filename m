Return-Path: <linux-arm-msm+bounces-102880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDrhB/mV3GnVTgkAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102880-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:06:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C12A3E8117
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 09:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1D76A300D95A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2026 07:06:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3C383815C7;
	Mon, 13 Apr 2026 07:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dnee/Qit";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CokkenFR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B77139183A
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 07:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776063987; cv=none; b=U105Pv6Pyfkt8WMn8hQ5abBj/PF9lgsSzEtoSgtr2aWjOezvCjrCVGIzG15EOvZL1c6iXNVVH8dbj22KjvfuHpn+48JsEzGHmptZw4naMOqi+nM1oy9r1tQ1GzvnTbi7wfBNgRx2WZpCtSpnDNW/BS0HivGbipsw6YZPp3O55sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776063987; c=relaxed/simple;
	bh=Sj+L99sUSwTEyMi23gHzi6pYkjLLtkY9+6dqcHgqsMs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GXvoQgsm3vdWXWQJ9nRBXLUbsNiFqQFUPYFDIkbhVCD52dlkHGBDgKuFDTbtee07VEP6s74VNL4fdllxxmOz+CNhbXU9og06q75mlO7MRFdhUH/D+HzYL6zOJ6v8HK3uYHzE/WQ2r8BUh9DRZx+eJunUITY9LcL4xwecofXuhes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dnee/Qit; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CokkenFR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63D5F7PO3561252
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 07:06:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3jjK8Nih47sl0WG6XxQVBWS89giyS6q5zzggrvFy6EA=; b=dnee/QitXFCu8iSV
	8ZIwzexSidJDDc7RR5nYRwt3cJ02aEDKOgvCukDvI9lDWnnulYnRpo7Ko0Iehr0h
	nwoEti2OKCuuDHpshj6L5W4b5zmrGh7OhONTTM9FJK3XKrUCxpvKsKQvWpHnJjZz
	PS7hnanBFa3dVdzoHKtbVJY9Gd6EaadHTUfgBT15xTD4gcwmSXiJUHa5NRNYtK5W
	vt0mD3HX6aTtzq0wdLI9lpfuGhpeq9uplsBzFu5ve5sorrJJg2L9E9vlpPE6E0Ko
	/C0wUJsP9dJbZRiO/jpCl1v/dDqrIxwcEvtacY9Y4CIR1QzViFQURJlhD1kBFrld
	FruzVg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dffb0m57q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 07:06:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2d443c3b094so9045375eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2026 00:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776063985; x=1776668785; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3jjK8Nih47sl0WG6XxQVBWS89giyS6q5zzggrvFy6EA=;
        b=CokkenFRW5BPVYu6/fchoCNZ9SvEUvLVd6MbDW6dSgjbO4pUNJm4V854Bo+tLiLEL1
         Z9RyBl00J3XAzvrTO3aGw15m1TEhcBmc+KtEfvf/EztzijwH3rwQ8+MUqZ0PmLrpISTn
         1L0p/270Y2547rX+7dko8Uc2MHSVkWcyrxCwvPI1gUvdpVa7TzTepST2RqdYm7d79ceF
         XvO5oj4MajkYpuNYSLQ9SZ+BIxDQmnRd2OLu2kfkFJL8x8ZV2nI4okNK0+VyodWNcEH6
         rzkIhE3jTPMaBCszzQEeVdsQjQAIzz4+/rH0ko2X3cvryc7jSQyIu3z7A0uaMGWafecX
         Um8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776063985; x=1776668785;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3jjK8Nih47sl0WG6XxQVBWS89giyS6q5zzggrvFy6EA=;
        b=Unj7+13EEia+aUyqSuBNS9Yo2me1wA3Kd1uL/woxpLET3cTgqv0aNwbCIsmnLopWB4
         2OOy7jk0nvcna6PiDpqktMq4RORsLWmwtr64cGwk9k3JK5/4KwrI9KJZMbW0BWq3n6AT
         GlyMmUivgLU7X9zh22TaRAUKe+HItDfyQe+K1rzXrLtahKNitsqYPPFfs/hdurxw3O6r
         QfrwTUgcGdewj684IuuN95Y6V/zwamMq6kV8WFx+iE+ptCTkmx9iEUSf0p8Wu77nKNAN
         lCOq2LENXljMFCWa0Eme2KtQMR18xAsZgi9vZF9t8afjPhW7P3syvweyEWI4fRs02Q3k
         HsNQ==
X-Forwarded-Encrypted: i=1; AFNElJ9FuXAXxYEon5NovEs/HMyZC7CjAqCR/kwc2z9GXc8Tq901JKTkpcha065FzIkobB0XwMYeWIIPsEHKHfMY@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+XjeZyVW/Lg8VyOQU2Mh7dgy4DCIfIO1ExS+7DF+XROmLTlWL
	oyloFKqnXmPj8G1FuQA0dOPZUtWtpg1LjlJljDyWKjWLMqSZA6kdu4TvRLbfpKxTyT5esBdCKzH
	5lha1nILlfpwPbp08+sCIv/qGLpwE+4CQUQiyUnY375ejX3gsxJUuseOTFgIUPFd4LL/z
X-Gm-Gg: AeBDieu1tEQLg6GrNgYKytJSXPM4Z5Q4QADefqoQSq6Gu4Z9wjU/rZRJAf+lK0TbOBg
	o0VE56aCU5f7Lt5GFfVRZh0bEJk6/q8v7hR8nq6bp2x1A2hfSPGWsyRbY7QijQPeBJaQ3f/xYuz
	inxdyo1XlwUo1Yi3HgvKnAWj+XXB125rte0hQxwqjpDo+cxl4VvlNZfA93OdoKTCTmMpGddM9/d
	TJ3R+OiFAxiYQjxxDImYC7FgcTOAq2VA3LzQubWI+ojCcBFQCEOkGyZhmLlFolSszg0YxyI05iO
	KUK060gE7OpaqTdeuvpNjK3NzSIShjRoUzNOv/e6ZtkyvBMOPjhmAXUmY7ZGpJzyKkUOhhhF4Vb
	eT6uvTQyPKrANv0NVtHRT4W1SqnlzcX3NYdg1GXx9//ECkFfmn/3VS6+Ze2apbn/m3A7l
X-Received: by 2002:a05:7300:269a:b0:2d9:6373:ad11 with SMTP id 5a478bee46e88-2d96373b109mr957559eec.28.1776063984904;
        Mon, 13 Apr 2026 00:06:24 -0700 (PDT)
X-Received: by 2002:a05:7300:269a:b0:2d9:6373:ad11 with SMTP id 5a478bee46e88-2d96373b109mr957547eec.28.1776063984308;
        Mon, 13 Apr 2026 00:06:24 -0700 (PDT)
Received: from hu-qianyu-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa5257sm15438521eec.9.2026.04.13.00.06.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:06:23 -0700 (PDT)
Date: Mon, 13 Apr 2026 00:06:22 -0700
From: Qiang Yu <qiang.yu@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Taniya Das <taniya.das@oss.qualcomm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, johan@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 3/4] clk: qcom: tcsrcc-glymur: Migrate
 tcsr_pcie_N_clkref_en to clk_ref common helper
Message-ID: <adyV7qKQL+SJ6TxL@hu-qianyu-lv.qualcomm.com>
References: <20260331-qref_vote-v1-0-3fd7fbf87864@oss.qualcomm.com>
 <20260331-qref_vote-v1-3-3fd7fbf87864@oss.qualcomm.com>
 <ebce5979-0ab5-47ff-963e-68e27216821d@oss.qualcomm.com>
 <ac306hTHe3qVORk2@hu-qianyu-lv.qualcomm.com>
 <adem2WKh2B-Leivq@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <adem2WKh2B-Leivq@baldur>
X-Authority-Analysis: v=2.4 cv=YfmNIQRf c=1 sm=1 tr=0 ts=69dc95f1 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=P9E2af56O7jvyERa8gIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDA2NyBTYWx0ZWRfXxnpeIziWQioR
 44/Azwf/4IpRGUbvXvsm7TYXmfbVBbSrOtoTRtowA3nSWYEPdfG/dxGdcErwO1vIREuh3VQNi1O
 7KvkVeXToyKExAatUPIpYqHsMQGOU71qMEds1sfwErRISO9sCcrr+VW4+1Z3MW6hNWifPiHLuG3
 g/n7MYXzXCzQcbMB+NMd8rcF6bd4iUKZjUbBbRqt2spwdDKnwuqsjKFWtMOjZ1rtX8+cyM3C+kQ
 3MbJ8vOHrp6EdzougGwExdWz+h6nAHp50e8weeRIrBSlKpOFgbE80If91bQlCkSSXkH2kCB1q+K
 O9ye2qiWqpMqdXEiZOMzMnLgR46GRt/Ew9qbTCMto5Hk6g64nh/i5KmzuyDlA8D9kb+hxLgoPxo
 te3U6ENSTUL1OCQKnH/LiDaZYbiaOMy8oPtbKfyOCJcR/8r8X6wPXdL73l5jGxs7nzZ0YEP3KMu
 Ct0e1U1C0OeSjaWaZvg==
X-Proofpoint-ORIG-GUID: N0YX32IhKu99xL44o91fVlhVAHwjfUdm
X-Proofpoint-GUID: N0YX32IhKu99xL44o91fVlhVAHwjfUdm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_02,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130067
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-102880-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,hu-qianyu-lv.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
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
X-Rspamd-Queue-Id: 8C12A3E8117
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 09, 2026 at 08:19:41AM -0500, Bjorn Andersson wrote:
> On Wed, Apr 01, 2026 at 09:47:38PM -0700, Qiang Yu wrote:
> > On Wed, Apr 01, 2026 at 10:05:12PM +0530, Taniya Das wrote:
> > > On 4/1/2026 12:05 PM, Qiang Yu wrote:
> > > > diff --git a/drivers/clk/qcom/tcsrcc-glymur.c b/drivers/clk/qcom/tcsrcc-glymur.c
> [..]
> > > > +static const char * const tcsr_pcie_4_regulators[] = {
> > > > +	"vdda-refgen-0p9",
> > > > +	"vdda-refgen-1p2",
> > > > +	"vdda-qreftx1-0p9",
> > > > +	"vdda-qrefrpt0-0p9",
> > > > +	"vdda-qrefrpt1-0p9",
> > > > +	"vdda-qrefrpt2-0p9",
> > > > +	"vdda-qrefrx2-0p9",
> > > > +};
> > > > +
> > > 
> > > TCSR clock refs are just not for PCIe alone, they would have supplies
> > > for all the ref clocks. These supplies can also be shared across other
> > > clock refs. I think it is not the correct way to handle the supplies, as
> > > TCSR does not have the complete supplies map.
> > >
> > We have complete supplies map. You can get it on ipcatlog. Here is example
> > for other instances eg USB and EDP:
> > - Glymur (eDP): CXO PAD -> TX0 -> RPT0 -> RX0 -> eDP
> > - Glymur (USB4_2): CXO PAD -> TX0 -> RPT0 -> RPT1 -> RX1 -> USB4_2
> > - Glymur (USB3): CXO PAD -> TX0 -> RPT3 -> RPT4 -> RX4 -> USB3_SS3
> > 
> > I only add supplies for PCIe in this series because USB and EDP vote these
> > LDO in their PHY driver. They can remove them in PHY dts node and add same
> > regulator list here.
> > 
> 
> The regulators are reference counted. Can't we add the USB and eDP
> handling here as well now, and then after they are voted here we remove
> them from the PHY?
>

For USB, I’m not yet sure which tcsr_*_clkref_en each USB instance in the
QREF diagram is tied to. I need to confirm that mapping first, I'm
checking with Wesley Cheng.

For eDP, there is only one instance, so I can add it.

- Qiang Yu
> Regards,
> Bjorn
> 
> > - Qiang Yu
> > > 
> > > > +static const struct qcom_clk_ref_desc tcsr_cc_glymur_clk_descs[] = {
> > > > +	[TCSR_EDP_CLKREF_EN] = {
> > > > +		.name = "tcsr_edp_clkref_en",
> > > > +		.offset = 0x60,
> > > >  	},
> > > > -};
> > > >
> > > 
> > > 
> > > -- 
> > > Thanks,
> > > Taniya Das
> > > 

