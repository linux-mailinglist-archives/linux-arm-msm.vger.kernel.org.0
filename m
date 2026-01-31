Return-Path: <linux-arm-msm+bounces-91365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OL14D6TafWlrUAIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-91365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 11:34:12 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E293C196E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 11:34:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 32CF8300916E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 31 Jan 2026 10:34:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ADC62DA768;
	Sat, 31 Jan 2026 10:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qfkc4lyM";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DbYqOcTU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A46FBA34
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 10:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769855647; cv=none; b=G44fIKOy8sGOimIZia4E/XQz1kRjIdvAw38MDWa5limlYx5dkUJROpgFfpW6ACyGn55zQP3ZbWLANQQu50xsdIcVPKJVgu/N4I/eVxn5zUzouqTUxue//qZu57xXHhuf75LQ6mP/14Tp/qKw1gfj+l/yB6xT9OzRVXhVYh0sWZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769855647; c=relaxed/simple;
	bh=iKf/pUj7Dj6P60TsQaCaSkK27jTV8DaqbVPEG1naEjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R/6ruNBh7Zba/Pyoeeqf9vUYOC74eKIPSnLDq4IEQWBYADpbItQtVkB1QHZnW788zH1qOAZyGDMbJpDSgfdPmitLxnwdooJ9hXHBlyKjvQUC2o9iWq/7RvlgSISlGHnN3/QNZJqzIoqEXatCR4vDWo2lFb3T6rQAQuvxz3/Rx6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qfkc4lyM; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DbYqOcTU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60V4ZCVL658945
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 10:34:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0WReQ3ea6bm+XxaXA+me3HZxBztgzIHWPdwYg39RO+g=; b=Qfkc4lyMslsbtJF4
	S1xvUaxDb0t5INtoCQ+aO8cRbnwjGOeERB0U1NZMTud7HXelfb+zdHKhC6JXMar/
	x9IGofanEVdAVDHgWQghSJz6yHBIZsMuZz01bF6W4rqCuuWADTnBdQhR7hZ0LgJJ
	55bkOPcBPGRbkNJgEd6inKJZsplyk0iyE9Oax/j8Z3tc6EMClsRGvPH1VP+ln79b
	Sw7BRg6jXhAQyZySDbgNpG6UrEaT3rsqDzmzg00IpIcDpQ+SML66nWiNPcmKIXAo
	GpwoLWIWcwKcEyZ3p5CezFao7rL6C3ZQDVRByVtqo+yWFYmO6gW1K9nDsMYR05dY
	hZ7EMw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c1au2gkur-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 10:34:05 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70ed6c849so690755885a.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 31 Jan 2026 02:34:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769855644; x=1770460444; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0WReQ3ea6bm+XxaXA+me3HZxBztgzIHWPdwYg39RO+g=;
        b=DbYqOcTUgfr+x2W+BARRR0DDaE3FtDlpILoXW5j3w9Y99pkhXKbACQ0W3MqA6dJBaU
         CudB7MOzXDw6ywXS20Jq+qL8rClM8ZCh83/IRoHKMUSTmWbMp+Fv0Ik9f1wct4ujLNSd
         masgGfHDIJ2c98ltNQ/Pv4JBuLiGPuyo4m7SZcgx5Bi1qTiSezTuiuRppcy62QJs40IL
         7vL1YJcM7iAkM9wKSZ+KSPDA5QQ6GKlh7ouPxwXeA6knaBlxmKVz7ruASuz3LIvGXmQY
         An+N/7mE8fFh0uJVvrQo8UR2Yzo7DWFgG/CMFBE0gMFPc2MPt3Zcqn1HDo/XW3Kwyz+C
         wLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769855644; x=1770460444;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0WReQ3ea6bm+XxaXA+me3HZxBztgzIHWPdwYg39RO+g=;
        b=tF3R88gC6OadCw2E/aYzZxCzr1Eo/oCBCLIrda7f4f1cYFfZGJvwax1KCiEohlN4aq
         GRByeAytTvZkNwP356fBK03WJ0vqSzS6vbJe63Ho8Oun0xo/wPSfkcptCcN9z3rwaHW0
         tCBYeDv1lf56di0oDCypjDhvXuY7ceZBfmxyzJNQ8M0P/yy9AWkpasiOvcEs2+oy9YpY
         WrL8mODpk5wSPhC0FevYeMPRCoyovbYie406b/VoIsrrorjBcPR6hYum9HmpLGBCdvnS
         IH4CeOkfkWYe8OUX8fB3UHtkSCXMgzFjXHIYBRYpmwr0OnNpF2NJqoPYK8O+zR6yy1Gp
         u3LQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/86L4R1bK391DeDlkHgwqeJ1nSXiVHoTUJHA+cP0cbRXpsigYFcWjSt/uROkTvxy3xfXe5aILbWyXao87@vger.kernel.org
X-Gm-Message-State: AOJu0YztAthHwM5cP1QHUirIlFTNbdm9U6Glc3165WLb0EgZBSL+XOy6
	jNpUNJUX1AD9YQxjZwT5tIn2//Hm0XYXTq+xY4bJ61puRM6p3J2Kk3uKIXIZYSUMdoMya+VNdC6
	4B7HnrGewvvi6eMjQR4r2FZvEjSSMPGHquRWr8TF3fuztvmgBd8lcMhHPuwMo5gfBF1bV
X-Gm-Gg: AZuq6aLLxfaJ/x4mBMnXepqEb0XYJpPtQ3U8h1GfbpWInRHZHMhUFMvuLec0GGe2Ho/
	myAi0p5GbyGDfi5yLsMo6/2m7xT4nxvQSQLLNh8S/oTkiB5hDakKGuiguaONP4G/m2964QoXVgA
	noqh+ybj3FfzR/onTs0H3KrR34otKxEVulSmXJB4PQR0T46ED8wlm8AMQtAuBSuPw2gIQ+MA4KN
	FX16hPfmT8j10FaQMXXthdA1e8+OdvtNkBmrvcmSlIM0sACPo6T1BR4z1kr0A4iL7+eBWR70twJ
	5qLAIfKcfJOSXqMPAEaM7o55FV9+GGmFw2Emm3QH8WPxioMgJKaPS1ZZBe86qYMt6TeGYr8/68x
	iFNh1x9PY/6Tl3whFTSi8VIsc1ETLFak837vAht45KP7jOjk6oFXeLlpDfX0m1kL5jLujLuF27r
	HIf1kq2gGAijsPkMT8uOEecDg=
X-Received: by 2002:a05:620a:28c3:b0:8c7:768:3b0b with SMTP id af79cd13be357-8c9eb30e513mr624072085a.65.1769855644070;
        Sat, 31 Jan 2026 02:34:04 -0800 (PST)
X-Received: by 2002:a05:620a:28c3:b0:8c7:768:3b0b with SMTP id af79cd13be357-8c9eb30e513mr624071285a.65.1769855643469;
        Sat, 31 Jan 2026 02:34:03 -0800 (PST)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38625fb314dsm21233301fa.40.2026.01.31.02.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 02:34:01 -0800 (PST)
Date: Sat, 31 Jan 2026 12:33:59 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Aaron Kling <webgeek1234@gmail.com>,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kumar Sharma <quic_vksharma@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8550: Fix DTBO boot failure
Message-ID: <osqwux5xkf4337gahljlkdvoeek6sudxcee3xqb5kp2ngqhwzj@6tz6xjj3cozl>
References: <20260129-sm8550-abl-dtbo-v1-0-abca3be14024@gmail.com>
 <20260129-sm8550-abl-dtbo-v1-3-abca3be14024@gmail.com>
 <7d473eubnez5gcbou6mguomeetpotp73q7cjol3kfjlg7pz5r3@yjsh4rd4mwbv>
 <CALHNRZ80+KAfm2YHEoodBv_7jDZPZjtr-koo7q_N+aX+i1OfnA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALHNRZ80+KAfm2YHEoodBv_7jDZPZjtr-koo7q_N+aX+i1OfnA@mail.gmail.com>
X-Proofpoint-ORIG-GUID: exD8KRPq2cF1mwEOkPjeG9LxxiOOAvnn
X-Authority-Analysis: v=2.4 cv=TtfrRTXh c=1 sm=1 tr=0 ts=697dda9d cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=3oC4OS_a_1vn86-RbbwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: exD8KRPq2cF1mwEOkPjeG9LxxiOOAvnn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMxMDA4NyBTYWx0ZWRfX2g7XqYtBvNt3
 FYFhdvBIPtXjVxpc2poyxGvEe1jCEcDCOz0NSnHr+4ixKdoV4OzYJypZO6TodGaFHRCnW8IC2t9
 +aa9ds/JbqSWjmyo9RUVlmv6cXFY6rS/91KqUceUuMBatR20J+zmDKToy2K/qiBrpIc1YAP5woz
 VumK/dqplnSfEjlTAtyO70HVIW5e/61daYJ+SOvOk0W1+iiSHr6zxcNdlrdGJKLI51NhCGMWiAI
 ImvhBzCECD31IcPUR2arRwmkSIqyBfv5A+nE4jPOXxYU/9sfbM6gZYgO5WECbzm6z+8JCv2TKWk
 94LjDdNYlQCZZgJTfRvHy5ux8Rp/ny1vg58Xk2K5o+cCOoquwHFgbPx9SmVq3EsMPRif7N0k+dG
 a4rB4eevN4D/cjwRGvxlMHPVt35NIsOiDX0r/mpoC9LWVLnsAz2O+FoPW7/ug8zvVAx1IJbYmw5
 X9BRWamLXmlvu5Kg94A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-31_01,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601310087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-91365-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,oss.qualcomm.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,oss.qualcomm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 8E293C196E
X-Rspamd-Action: no action

On Sat, Jan 31, 2026 at 03:09:12AM -0600, Aaron Kling wrote:
> On Sat, Jan 31, 2026 at 1:47 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
> >
> > On Thu, Jan 29, 2026 at 01:46:32AM -0600, Aaron Kling via B4 Relay wrote:
> > > From: Pavan Kondeti <pavan.kondeti@oss.qualcomm.com>
> > >
> > > ABL requires certain things in the base dtb to apply a dtbo. Namely:
> > >
> > > * The scm node must be named qcom_scm
> > > * The timer node must have a label named arch_timer
> > >
> > > This aligns the sm8550 soc dtsi with those requirements. Without these
> > > in the base dtb, when ABL attempts to apply any dtbo, it will fail to
> > > the bootloader menu.
> > >
> > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> >
> > Did Pavan provide an SoB to the patch?
> 
> No. The change comes from the gunyah watchdog discussion here [0].

Pavan, can we please get your SoB?

> 
> >
> > > ---
> > >  arch/arm64/boot/dts/qcom/sm8550.dtsi | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > index 740e3c238e8ed0f162dd168291f6e307ace66e80..d7cc20e1931904e7c603b800089f00955ecec3b7 100644
> > > --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> > > @@ -329,7 +329,7 @@ cluster_sleep_1: cluster-sleep-1 {
> > >       };
> > >
> > >       firmware {
> > > -             scm: scm {
> > > +             scm: qcom_scm {
> >
> > This one is a definite no-go. Device nodes can't use underscores in
> > names. It has been told to Qualcomm for ages. If we didn't comply, it
> > doesn't give us a permission to break the rules.
> 
> I have not been able to make ABL load a dtbo without this change so
> far, though I have had a suggestion from off list that I may need to
> try a different method of flashing changes. I have not yet had time to
> do so yet, however. Given this list came from a Qualcomm employee and
> worked as advertised, my tendency is to believe that it is the minimal
> required.

I understand your point. But I'd really not encourage my colleagues into
thinking that it is okay (oh, it was landed for sm8550, so it's fine to
do it in future). And I can foresee this pattern to continue, because
even the latest downstream DTs I can see the qcom_scm node.

> The devices I am working on are not fused and thus I do have the
> capability to use a custom ABL with fixes. However, doing so would
> make the user transition from the stock os to a custom one more
> complicated. Plus this affects many devices that are fused and thus do
> not have such an option.

I understand this intention (and the pain of fused devices).

> 
> In the likely case that the bootloader dtbo functionality does indeed
> require this change, and the mainline kernel cannot accept it, then
> what are the options? My use case involves using out of tree dtbs that
> include the mainline dtsi's. I could do a delete-node on scm and add
> it back as qcom_scm, but I would very highly prefer not to. The less
> downstream changes I have to carry, the less work I need to do to keep
> up to date. And on the other side, getting android vendors to update
> their ABL seems extremely unlikely.

If you have an out-of-tree dts/dtb, then the easiest way might be to
have #define scm qcom_scm in your file. Sorry about it :-(

> > >                       compatible = "qcom,scm-sm8550", "qcom,scm";
> > >                       qcom,dload-mode = <&tcsr 0x19000>;
> > >                       interconnects = <&aggre2_noc MASTER_CRYPTO QCOM_ICC_TAG_ALWAYS
> > > @@ -6764,7 +6764,7 @@ trip-point2 {
> > >               };
> > >       };
> > >
> > > -     timer {
> > > +     arch_timer: timer {
> >
> > Please add a comment, otherwise somebody might decide to drop the unused
> > label.
> 
> Ack.
> 
> Aaron
> 
> [0] https://lore.kernel.org/all/91002189-9d9e-48a2-8424-c42705fed3f8@quicinc.com/

-- 
With best wishes
Dmitry

