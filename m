Return-Path: <linux-arm-msm+bounces-102844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGSBDxrr2mlb7AgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-102844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:45:14 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FD903E2388
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 02:45:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id DF36B300EB67
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2026 00:44:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E871286D5D;
	Sun, 12 Apr 2026 00:44:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NsuTBRmr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gqFnklMU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4883129BD82
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775954695; cv=none; b=AVS38INQOip+dvrPyhGGBsn0V81on5eZbO/BPjFI2QstEb9VGu41gSgkL25vTHe7F/svMF2i+GROakF/Eo7KktidX39kij8KS38bi9LIf6xuq0ezZRRUw8pwffsMFdEjZj5tmd7ND8G+7zUjTtP4AEdiPB+8Hjnl5MUa5P5b8hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775954695; c=relaxed/simple;
	bh=RDVh9PIeAylDCFuWCEN/oxPmv4xqct5eN5G7ipxHmMI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M+iH3LUI8QyoLt9Ul1K4TchoE6MuidupV74fi6lVZodoM9CDaYFYw0FaXrYWdd87JTuZ0O5/VHuz5p+iG1e9LUkGTmh1iM4RsHbYMok/sQyqhCgKt/r93XWelxuNF2n6328qLy45uMy2NMQmsWEOuh5moPOg8UlDzXKMCfHAbHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NsuTBRmr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gqFnklMU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63BNquCT2920051
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m2BSr0ke7ufsCqobd+cUwij1SYoUONE5PYIHSWMnblk=; b=NsuTBRmrnqwT1kD8
	30UVCRQsbr+lldJ7lkXHpcHo55DRn9bAZkp3UOfpJ9gJfLEH6a4tBWgRxHJhRyV3
	dbwshixdGjszmxcA7IvhDBrad1kWD9wglf4ByL/g1gvpMIH/E71o9W5hIrjBGbi4
	xtedusbE4e0vgRi3Bf2IdVGnbTcn/I2FZVHyrnKclwdQipVoPGtf/+DjL8WA4HBM
	dSMkJMzc/KGbEIFPA1XvMJh2fyXcfWaAuToFpJodaof+0njo1l0V4DdXirvo8o0U
	R5bXCwhV/kyrvOIFmrOWlz5jDcSHSzHp/YFYk1X4fcEMVJf+bCtereSQYmyPfKMJ
	/6Jb9g==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dfevthkef-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 12 Apr 2026 00:44:51 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50b4661881eso36486361cf.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 11 Apr 2026 17:44:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775954691; x=1776559491; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=m2BSr0ke7ufsCqobd+cUwij1SYoUONE5PYIHSWMnblk=;
        b=gqFnklMUqIFcbHHHRxyV83sUPgZuUt8IfGIX3vnxQUOEifi8+ibwPTD8oycJTAcdDl
         MtVA0Vg7wRweEGgv0chGNodhysM7o7ba8YQQKMIH12WPnxR9Unni3axrQgGCyE2ff4Iv
         1j/5ft0QebIJU79DYhqJbW1r7yqsYyIRyt7kxZriDQc16tuEo02ZOZ/E3VcljYSZcmNu
         e9di4PxHzFJACbV7TNexn0Jy7yNlT3AQ1O5I/rEGw/Ag0VQIpv9uwlAua8XJNh+uhCI9
         XC15owmC5k2SaYxB81YjHoIdQ0beeSQIM1tHO/j4i+9DMCAjGj3Wi3aaohF8OQUe2KwO
         ZSXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775954691; x=1776559491;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m2BSr0ke7ufsCqobd+cUwij1SYoUONE5PYIHSWMnblk=;
        b=ZHRAUCJQPhGwqqTZ5A7PYcL+7tlrir/+KyA5MtOX/Y//Tzo/G1mjSSXmLh0j79XPMs
         XuIVUOUfSm+sYhdrKkeY5M9jcg12KxDn5cj7v7HsdRKotON89n/OEu85asDFKgFbXarb
         rntW/Nl8Fi0awzLr9FzRsKFl6wlFlhD2YbI7ZEFRMbHCZGIopXaIt8T7xQWQOXCmUDLW
         WSpJ25oY92NOIz9IzoAxsnbaWv5BlfHDNYedThIofS0OHJmRiMKd9m3JDYMdRu8X5YV0
         m+qaYrIGjBwqXzZfAXTDkreaujE7xM9+XajvcxharvBwPIVO4l1+Tvr0CZt4Fhp8B/zj
         rS7g==
X-Forwarded-Encrypted: i=1; AJvYcCU7lBflz6ZkJyn5pmqbxGAI1RqSgO3XuuD/rA7nCsniETLW+MqpWpjHaX50aONkQDgXsFpFk3/ovZ9HjnjD@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5jkUWKi5ZEiMKYuKAw99aC2m2Ch2uqb0hzFMmoTx3mM4m7OQY
	24qBauIdbmRkQBKdsK1BaLPzZwcrPDPpJJ5mf0IrkKcOhpI7jEITm2EmXFcUCaFGB6BGTCoG6aG
	YOFMcOwShTUqqMW61ntsShbV3WiaOKqTmlkBIeK33zvXflMWVOYHLBKRuF4LYHbd+E5GW
X-Gm-Gg: AeBDietQggM9QiL4KmeUPaKI/NkUYKf4Rj6XKRrkFM45pojFol9bOAH/46DRuBKcTLC
	/WaI8BnQbYLjzgidTjr5fYEBUAFYQL91kz45Blj3pVpb2g5V5WoG5eavCFCtTuEwwckp5TeCzTB
	nE26JjfdZ+VPpoFVmWtGhYjwBk1W3NisSh1NVVG5ta3XKhG2MdZ/x/0l8AOnxmOViYtaCWQ0EBf
	h1eQZ6DbkbUq27yq391uFcWSbXN3b+Z7kRdKojfl2JIVLm+0Zbpw7PpRZ06VyUuyTISuY/iMjdi
	4inZ+JmZfmfdx5FaupilFy22J5pr0X/0bN4q37ALDw7yYXAyaSNerFEwrECZ2eYY4+tcu5vdLUT
	YIWLLYW3ufGpdSSCee8mqSXCjgfcpVYWiqu5KHLjGKYP81IzcVutnOvDmDGf/naxYcxknn9ULAN
	7u1lgPPYFOjIa0kcYMVPZ0o5/P8C/i+rH+6vI=
X-Received: by 2002:a05:622a:6105:b0:50d:a8aa:8087 with SMTP id d75a77b69052e-50dd5b9abf8mr118060451cf.38.1775954691284;
        Sat, 11 Apr 2026 17:44:51 -0700 (PDT)
X-Received: by 2002:a05:622a:6105:b0:50d:a8aa:8087 with SMTP id d75a77b69052e-50dd5b9abf8mr118060301cf.38.1775954690785;
        Sat, 11 Apr 2026 17:44:50 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a3eeee08d1sm1662965e87.42.2026.04.11.17.44.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2026 17:44:49 -0700 (PDT)
Date: Sun, 12 Apr 2026 03:44:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod.linux@nxsw.ie>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: camcc: Make Titan GDSC a power domain of
 clock controller
Message-ID: <nr6ziek4s2mulvnxyvy2v67zniy7ftyuwwgbqgpuqiyc67arg5@756dyguscmjp>
References: <20260331140142.892579-1-vladimir.zapolskiy@linaro.org>
 <20260331140142.892579-3-vladimir.zapolskiy@linaro.org>
 <70042f4f-c4ef-4185-b0c6-397d27164a32@nxsw.ie>
 <2dfa4af5-d3c4-41ac-9762-0a9101f436ee@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2dfa4af5-d3c4-41ac-9762-0a9101f436ee@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RYWgzVtv c=1 sm=1 tr=0 ts=69daeb03 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EXdUGPv1Imsk7kOzH7UA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: Pudp81Ziz3BGu_rBV7_wvTyvfgwMEjP8
X-Proofpoint-ORIG-GUID: Pudp81Ziz3BGu_rBV7_wvTyvfgwMEjP8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEyMDAwMyBTYWx0ZWRfX8uLz6vfjXnjC
 droq3Xh3Xbaw339+9nNjAc/nr9MLiVyuJgg1k0ivDiBZ5ss8wpU8/CkJWllKQyAZX8M1hUmH6BS
 /JjXpvaEqv3HVggxYi297f1Ypp4LSrfpGfaMy36o5KlXLl3ZR7KVf5NYgA0kMuOUz8LrYxHkXzN
 TDfKWyVGebyIlddbeLFanWW9vUE9I5gD8z/4uYu0E51y3PAIFyakwrWHzZqCozw0n8htQcMUYKM
 guZWlrFT0k+Y25B+4pCzQugOPa21j4qM+btYt5bxAf1UKKPe8C5Qgn/L4ks7017KpIHUnR3A2GZ
 1tK8XKE7mQiZQEMu+x6zvl9mhrEizjn07hvN7Pa3FB8ZA85io6+j0EYWkvVa/8n1Uz8/yYes2ey
 CONNaz1H8DUpg5R1Nf57j1kuwe3Qwp4ogZsJhdnz2bpZGGJVh7TgimGFx3orOmJzjw0g+UR0X8c
 LOQqH0Hrts7ygxPjH/g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-11_07,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604120003
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-102844-lists,linux-arm-msm=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,oss.qualcomm.com:dkim];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 3FD903E2388
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Apr 10, 2026 at 10:22:04AM +0530, Jagadeesh Kona wrote:
> 
> 
> On 4/10/2026 12:03 AM, Bryan O'Donoghue wrote:
> > On 31/03/2026 15:01, Vladimir Zapolskiy wrote:
> >> +	.cc_gdsc = &cam_cc_titan_top_gdsc,
> > 
> > So.
> > 
> > You can represent this in one of two ways.
> > 
> > - By making the GDSC a depends of the sensor
> >    Obviously a PITA to keep doing.
> > 
> > - By making the link from CAMCC to the GDSC
> >    The question is, is it valid for CAMCC or indeed
> >    any clock controller to be both a provider and
> >    a consumer of the same power-domain.
> > 
> > The other question I have is; in this setup you have
> > does the GDSC you've made a link to switch on/off as
> > it should ? Have you checked ?
> > 
> > I think you can make the argument both ways.
> > 
> > - The sensor should consume the PD provided by the
> >    controller - like CAMSS and CCI does.
> > 
> > or
> > 
> > - Lets optimise the representation of the dependencies
> >    so that the consumers don't need to know about it.
> > 
> > The self-referential nature of the change seems a bit odd to me but, at 
> > the same time, I find the over-representation of power dependencies like 
> > pointless spinning of wheels too...
> > 
> > ---
> > bod
> > 
> 
> Since sensor driver is a consumer of camcc clocks, the associated power‑domain
> for those camcc clocks also must be voted from the sensor(consumer) side,
> rather than by marking camcc device as a consumer of its own GDSC. This also
> ensures all sensor dependencies are accurately captured in sensor DT node & voted
> from sensor driver.
> 
> The approach in this series also doesn't work on chipsets where use_rpm is not
> set for camcc or for split camcc as mentioned in cover letter. So if sensor
> driver is common across the chipsets, it would still require to vote on titan
> top PD on chipsets where camcc is split or use_rpm is not set, so it is better
> to vote titan top PD from sensor driver only across all the chipsets.

Well, the sensor is not consuming the Titan top PD. It is not wired to
the sensors in tha hardware. Instead, a proper fix would be to make all
camcc / mmss drivers inherently set use_rpm = true.

-- 
With best wishes
Dmitry

