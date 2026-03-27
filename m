Return-Path: <linux-arm-msm+bounces-100427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id INn1OKrVxmmtPAUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100427-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:08:26 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 86345349D7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 20:08:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 23A23306BD19
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Mar 2026 19:00:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A385E2D879E;
	Fri, 27 Mar 2026 19:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nggtBcar";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OjjvlRos"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685E02D8798
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774638052; cv=none; b=gUQQ+jFlssiiqkfDQEUKJS22E/1BpnKtb8KBL6+9986I6/M09PIFZkjQdAesLbzlN6uCErWBSJ4m+cv/SESylm1kVq8VmfDGVBcRsJCH3oLb3MjnOttg/enC8aZyjBAyHmsAYYZyUNTaosB+YknADDR51qp3/UK1/AiMmikjYnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774638052; c=relaxed/simple;
	bh=goHJ5Wk0OKXUZ48cCDhsqVe+PUtCgRNzbp5dbziuFgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LZ/qwHE2N3oxOnxWt0OntGCGJ2SLt5udoKTtiBvS/o5wuTfDmJN6GjEn/Gk1vxxcvTbd+4uK+pd9Ot232y7GwKiug9RvW6cN4JtHRTDTiaUi6DCNxA4pOxTGBAtlk/VXVAGqA7e/SdUY0a3ICT5VR+e1UIhuL8ryjQPJrtqtooU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nggtBcar; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OjjvlRos; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62RI2QJ5133510
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:00:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4naHBC7JiAJ57JHk6oRYyA6ZTJaKGS/F14nGRxMoT40=; b=nggtBcarMbcfEOMY
	OXZba4AcH6TVA3XA0Y5iiGD4065H46n94pQ3010dGiBG5RtvbRpWatTgvnn8TA6b
	/LqpNNi107laLiAiBNA6T9UmgMTaEzOoD/jDwyC+hYw7Yxif8ecNaObO4+7H2ebp
	DCGe01gMxoQcIZogNKR9AlPJ4gic66/gRcgGUkqDO6y7v7FPbiyX59D5+JqALSq7
	t3pl7u6II2m5qYuecdKjTpoY7SBMgE5bappJHIntCuY86AmIgexUge+0XUbtRmJP
	+T5NJZX+DcErDxtAb4ExK9p+DonyNywXRbFnL4tONfJp7ndm1IOXcvk26j7CnLMg
	8JLOSw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d5sxhhbj3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 19:00:50 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093787e2fdso114093651cf.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Mar 2026 12:00:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774638049; x=1775242849; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4naHBC7JiAJ57JHk6oRYyA6ZTJaKGS/F14nGRxMoT40=;
        b=OjjvlRosVpZuAnt1luaFPwlMrh18nmkO2HmVRAUV9ChxpwGRAGliGYIgX7JjTBkmlL
         SyGHwBY8CxVAcFCuPYScLt9L6MW35EBbffr7PpZOGhwUZz47yV3INE2oZHhq/T+uiYl1
         sWxJA9G5t7bJsp5m3BEMHLQqQhDAz5zLwNO222MwXKhAJIrn2ykTWloytuHBE8QMya3y
         nreq+epRylQ7wfI5bMlg0kFXSOxmaaLUJLxByhS90ofwnzcrMmZfnw5v0g9laf992Ay7
         1gPgusIjIZUCbdc24ZOPVJiSnwq40Dfjr70j4ULhYxChgO7FPsHQ5FesA+SPdBiBMCMp
         mWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774638049; x=1775242849;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4naHBC7JiAJ57JHk6oRYyA6ZTJaKGS/F14nGRxMoT40=;
        b=Pz994HTLRrgotmlY9/9x1EupU0N39PV1tRpLo+bxOU0kz/nSGUI3wrVa0hEaHk2eO8
         GkVUEKeu5ML1nvovc8vMt4uAfOJ7QcyiUmIrd52qlauZ8QjT+SVTiIz+iqYYCSWlAGn+
         +ECxwJQ2qsPrJMWe8aKqnOhpATVgkh6dRgyK1jJoptzzkWQ59ZZtWIAIm1h5oRIWZyhg
         taCY5ycTon/gmbWSc409HnjHIDY6O6/TZy8aUCxUSrpIhkqfHoP0J09S6Dm9XnZ2yk2W
         N3UwOKrdUtjCE6Gxs2CQq8SWpAlrhnCSoKcUE3ru0a3xTdTUPHDdSXN2Ynck57hbCAKQ
         yYYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUN/aQzfg700rrVOZ5LmevL93ysV1KSPvAfPrUWSSAmOpU4hvti4aEiymePQJp1m62HmUXYCVSjQ5bOkacw@vger.kernel.org
X-Gm-Message-State: AOJu0YzY2GkbkDbXa5gM2vSFNXQgsPyHR5NKjYoXZ+EEtezfvUH/HH4G
	uGH6Npl38FVZXyCIRcOhGQ+sC4pq1K7ClqHB7Ox5cdU4NsR2/KUYnw5RS0w9YAHAOxAbky9k2gc
	aOwHv9TbsD5JRax57udCnrtdVXYVUyfuTCgSv5lAiKJoQaoTqzOLVyeKIX+n7tMXcer40
X-Gm-Gg: ATEYQzzPjLtdCjNp+ARTGbgiozuXP8rozx20gNFWP8DcJ8d20ewJVYN/TfjR3amvSvL
	tdwFVyyS9TkqRtdmxZYSFClnBWLvVqBCGRu5RgyevpTZei5pHPzvy9x3f0YFcnPbKzWWNQIakoR
	o2zzdO8hcmrdeEPSZftL7TJSgWk+8YSiGjGVjsb12LzZxpS7dJ7TRIjgCddTHjE1qXu5y71Lf2d
	1mJUzOxvSVnTRbtq5wrOmw17JIr/+3oUL6rx2LEByhMMRJU5zp2fcKQ3RO9nWz7bZGxLepFaSBF
	794AAukLsNDRzl8jKe/2Ndi4CMkta0mJnx9ABiA+WvRbRcITJXDSIAp67+UyO+gJ/Vte6xWpGb6
	3eAgygN1qhoPA65oEmItfSXZp+UbonoHBUyWCQlp/L0wTqiukGuBBi07IRPTMC1qa4/3Hw/MjWP
	AUPOXPfO/6ZSuRfiiOxDqizZYWtdkdEoaJBvM=
X-Received: by 2002:a05:622a:1828:b0:50b:4ad3:a32f with SMTP id d75a77b69052e-50ba393e076mr51030901cf.61.1774638049300;
        Fri, 27 Mar 2026 12:00:49 -0700 (PDT)
X-Received: by 2002:a05:622a:1828:b0:50b:4ad3:a32f with SMTP id d75a77b69052e-50ba393e076mr51029741cf.61.1774638048498;
        Fri, 27 Mar 2026 12:00:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c838931acsm68991fa.19.2026.03.27.12.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 12:00:46 -0700 (PDT)
Date: Fri, 27 Mar 2026 21:00:34 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: qcs6490-rb3gen2: Enable uPD720201
 and GL3590
Message-ID: <xnkfbhfm3p7zjriu6qcdxo2ka6h4kvxvqx7tyhljcrkbqf2zl2@x2aquwtxpub7>
References: <20260323-rb3gen2-upd-gl3590-v2-1-073514bf9ed5@oss.qualcomm.com>
 <hrebrfsc4lcsrpk7thg72f7gdmi3btuiphdwh2ft7algej72xz@cijypbournvw>
 <acSZ8AqKC3hdaz2A@baldur>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <acSZ8AqKC3hdaz2A@baldur>
X-Authority-Analysis: v=2.4 cv=QZVrf8bv c=1 sm=1 tr=0 ts=69c6d3e2 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=2pzT6keT4olQg285jPIA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: Q4mS6hwpVI4FkA7De3ZFHJlzOUuOOU5X
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI3MDEzMiBTYWx0ZWRfX/agrkB7gZe2a
 JTpqt2ZJxTjMyJ+J3N2tYyDvZhcUHxu9PXth2Nw9IHyPVz7uxXhQLTnV2WeHb5JRToQm+kdEWDB
 vR9xwYOOmAssF1oeu9DpRz0POAJG+RFS+z5KvZr26Fpl2xdF2zPtpnAdw8rCAUKATIPzGkk9CnP
 UGKJtuuSUzV1ARkDv2uepA0RnMhvS0p+v8zMjUxtZbJlg2javeXC7Q34hONT9CpqcmZNdJrgLUd
 qInLM95mJmSwQH+eUkWa6M/z8153aQUH+MA4t2smgV+OR46HyYWmh7ineQN6QpIX/0wbrXjxTKl
 lO/+KBrP/5dXJOTV2L5TwL/cvxet+oLjLFdy0EF/NJpqqgUyOmDkaPYYuTcE9kUanfezlGA88gF
 LztJH4yrNfLrh/O4NNiBW25eseTNcRmiOT/wiUguaCa+1/gD8MChNeTV5TW4wyl0COJ4RRu8OsT
 f6eqox58aXl3U85GvnA==
X-Proofpoint-GUID: Q4mS6hwpVI4FkA7De3ZFHJlzOUuOOU5X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-27_01,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603270132
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-100427-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 86345349D7B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 25, 2026 at 09:40:58PM -0500, Bjorn Andersson wrote:
> On Wed, Mar 25, 2026 at 01:35:46AM +0200, Dmitry Baryshkov wrote:
> > On Mon, Mar 23, 2026 at 09:32:39PM -0500, Bjorn Andersson wrote:
> > > The QCS6490 Rb3Gen2 has a Renesas μPD720201 XHCI controller hanging off
> > > the TC9563 PCIe switch, on this a Genesys Logic GL3590 USB hub provides
> > > two USB Type-A ports and an ASIX AX88179 USB 3.0 Gigabit Ethernet
> > > interface.
> > > 
> > > The Renesas chip is powered by two regulators controlled through PM7250B
> > > GPIOs 1 and 4, and the power/reset pin is pulled down by PM8350C GPIO 4.
> > > The Genesys chip power is always-on, but the reset pin is controlled
> > > through TLMM GPIO 162.
> > > 
> > > Describe the Renesas chip on the PCIe bus, with supplies and reset, to
> > > allow it to be brought out of reset and discovered. Then describe the
> > > two peers of the USB hub, with its reset GPIO, to allow this to be
> > > brought out of reset.
> > > 
> > > The USB Type-A connectors are not described, as they are in no regard
> > > controlled by the operating system.
> > > 
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > ---
> > > Dependencies has now landed, so this provides USB Type-A and Ethernet
> > > support (when renesas_usb_fw.mem) is present.
> > 
> > Note, I initially applied the patch to the bit old -next (20260317) and
> > I ended up with no PCIe host at all (bare -next would still show the
> > PCIe host and the TC9563 bridge).
> > 
> 
> Applied the patch to next-20260323 and tested again.
> 
> > 
> > ANyway, does this actually work for you?
> 
> Yes, I booted with pcie_aspm=off I have functional ethernet and I can
> plug/unplug a USB storage device and access the content on this.
> 
> > The hub is detected, but the USB bus is empty.
> 
> I've disconnected the USB stick again, so here's the output when only
> ethernet is present.
> 
> /:  Bus 001.Port 001: Dev 001, Class=root_hub, Driver=xhci-pci-renesas/4p, 480M
>     |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/4p, 480M
> /:  Bus 002.Port 001: Dev 001, Class=root_hub, Driver=xhci-pci-renesas/4p, 5000M
>     |__ Port 001: Dev 002, If 0, Class=Hub, Driver=hub/4p, 5000M
>         |__ Port 001: Dev 003, If 0, Class=Vendor Specific Class, Driver=ax88179_178a, 5000M
> 
> > I tried plugging in several devices (includin the
> > powered USB hub) and they were completely ignored by the hub.
> > 
> 
> The USB stick above was powered by the device, so that part is tested as
> well. (And schematics shows VBUS is always present on the Type-A ports).
> 

This makes me wander, what is wrong with the device of mine. I will run
more checks later. Let's not stall the patch though. In the end, I also
can see the hub registered and working with the driver.


-- 
With best wishes
Dmitry

