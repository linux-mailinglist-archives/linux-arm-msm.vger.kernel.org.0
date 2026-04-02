Return-Path: <linux-arm-msm+bounces-101416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CNTqBpLezWlVigYAu9opvQ
	(envelope-from <linux-arm-msm+bounces-101416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 05:12:18 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 177EB38300D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Apr 2026 05:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 30DB53011D42
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2026 03:10:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020D2359A7B;
	Thu,  2 Apr 2026 03:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hsjpl2Ho";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GodQb+Yj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBF23537F0
	for <linux-arm-msm@vger.kernel.org>; Thu,  2 Apr 2026 03:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775099436; cv=none; b=Bbdi6EAWayjY+ht2cmFtOWoe0NYyqxz0EZEtKReI4LPpcng2Q4dMJY0EOViV1RkqnE8KOOc83gAaHGxm6C+2fSFLQSA+jiL87n+ys1NEn4GQGrPQh/B8KIcjnV/tC1EJ3qQSA2odbnawXtV/m30K/zbaDCBbYFqjPKYJzbPlqlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775099436; c=relaxed/simple;
	bh=i2IPgYVR6Ld9n24vmKw7wlfB6C16UoQiG5rHqnU45Ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZIY/dUHwH/4LyMvA8Q5Qhw/kyLXQekqVTEev9GVsPh+86xIYDENbZ/Cv3XQIbFvZEJC6FmMWBJCPukCHiHUJEhpza2k3893fzjy3jGRki7POb9/nRbGqCc6sqvKpecN7NO+XXP7LEVnrEnfvn7/x4OKQ7ZwZ8rcPsAJ7IgFICX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hsjpl2Ho; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GodQb+Yj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 631M4B8r3746217
	for <linux-arm-msm@vger.kernel.org>; Thu, 2 Apr 2026 03:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SUF9Sm+/aFQ9Q9LGQgA6Lail
	S0HG4qty4JdVJILkImE=; b=Hsjpl2Ho3osr8/sN2dRPsX9eMk9P3nnUcSo+13Pt
	03bHApFgztTc4OIESBavEzBCixwkLfghlJarPFGwp6QGGBHhIxpaI9dKLGbAsELm
	pEN4LJcNKoD6jlTxC4vLFIHcZdBO0jNZlZfKIdSmEX4uIxB6pbvHA2/aIrQf0mob
	VHafumbC+G/GpXNAr6vEZkZmab3QDdoNsmD2hKFp+TspI6t+1gNv9EK96SF9SDnE
	d8cqbxiDaOrJ+yyjTaIsX6PKKDafLXbXQBLv1VdxEzXB7cwXHa9ZdS1vZrK5PBY7
	ov0KKrrGgQapDV09Ohgx4k5sFTjlpQgK05xX/IjircUkhA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9324k45e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 02 Apr 2026 03:10:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-2c895e7de52so2520992eec.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2026 20:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775099434; x=1775704234; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SUF9Sm+/aFQ9Q9LGQgA6LailS0HG4qty4JdVJILkImE=;
        b=GodQb+YjBe4KjD742Wcq8sZn377SF9R5oN7/fQOjO8jJnAS570OE+sFVYBbwyRIScg
         o6U/ueZFrVISjDCoDD9ySqTHcPjvPNoaHtbzh3OqtwBwfCEfxlueEvTnFIdnTET8QIxL
         f6LZBnnLnn/9uppSbm8V+OZz8M7U/jjC4N5ziTiRWuPfpNaNq3zdLQVu5WhXM2yPq85N
         y0rjKxDcCtHb4hNVN16s+1VG1whl+YZ2nZtQXiY0KBQn3D2WnYKIKST4Mh86nq0/Huee
         GuubPo337HJL4gKmZBDCy8+Mgoq67HDmFGy3LDBGDutTGSu4Hc2kyx2EuE35zNObmSSx
         JOgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775099434; x=1775704234;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SUF9Sm+/aFQ9Q9LGQgA6LailS0HG4qty4JdVJILkImE=;
        b=r5koC+aMaBicPxGaeh8kV1WM6Zp7shHFMLoONF4ep396S4WCEvGJ3GILb+8qARJH46
         gH3mVVwLyUJ1zFpv8BGTx58/sCogojG63r6EBVKrqmFF8Wpcbt0U/oGTUBFAkFBc+KF7
         LqFAIGNCl2pC03YwDN1XdWNgq9UfFl1YyPyDRh2a1bkLMmgLP5N85c5ikzmqyw45ExoH
         pc+2UFHJmDDMECLb3iS0RsdQpIOAVbeeF3+NPr+13ASuK3uR2gQUIhwl6VoXqxTGQ5Cp
         2w4XQdYyBo0sW2OTJrEOmNpY5vDJzEY25CgSUDR6oOMnxXVP4ByjRONNnwj6d2F2rhYY
         BkTg==
X-Forwarded-Encrypted: i=1; AJvYcCVpGd4CNXVZWPbdng1lBKmnmu6IONo952j9pELRa8C/NGgJNTsgVBm00k2Ugc61VO18a5jBUhsiMwneihFc@vger.kernel.org
X-Gm-Message-State: AOJu0YyoMKkAA1tLyBlQIibgq9L6EF5oDOmq3406KNHo2jnu+uGVyHNl
	TLVmSn+t8UnNjMMZLqHaCFAE3MxgGziv1ZSirc8EPZ6kvMA3wqB6vkzCdvyzqtoL50jCOfWpys1
	xvfp5PFsi75H6kd9T21atiZOOoNgsOSwEDZTAK+GLRiPkz+jdELhLNI1QJRsg2vUqpvqy
X-Gm-Gg: ATEYQzzfMLwj9lCi1YXsPoeokI1v0yYWMjBT8nwKJ5ob2UMAGaQrftqFT8RSaO9M489
	YTod1cccvSUNyW5oaf3HgOKblWqNLK16UaH8K41a8P8Z9UN5qtFZbrew5ixfuVOK4aQDF98BukC
	qtvzeK99y7Tw1xO5FwWdJAOBA0yRitAfgD7iBO19kA0v1otKZSOFaiThIP2oEfT8DD0WmYRzI9p
	MEp1PWmbgP75VmOEQ1xYPshrUnvCLrQLTodQ9YkuNo4VVQUtMZqaJlXtbwEVcELb7u1jile0ykD
	fTeEr/wmx33wq7VWwckizaRUb0xYjHZZZL5Me0y121hcePp//tOTtbrHp73ScDS2d3oHob0xbKe
	n/w7yyh/MOAWx3zvKmeXK7SOphOaqdU1mcDXo0JMdnqXhpj3mdetladEs0OnHOw9KRTdoAzO6Ce
	w=
X-Received: by 2002:a05:7300:2213:b0:2c0:becb:7640 with SMTP id 5a478bee46e88-2c931276dd6mr3580624eec.12.1775099434051;
        Wed, 01 Apr 2026 20:10:34 -0700 (PDT)
X-Received: by 2002:a05:7300:2213:b0:2c0:becb:7640 with SMTP id 5a478bee46e88-2c931276dd6mr3580610eec.12.1775099433506;
        Wed, 01 Apr 2026 20:10:33 -0700 (PDT)
Received: from hu-mdtipton-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2cafd073194sm283615eec.28.2026.04.01.20.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 20:10:33 -0700 (PDT)
Date: Wed, 1 Apr 2026 20:10:31 -0700
From: Mike Tipton <mike.tipton@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/5] dt-bindings: clock: qcom,milos-camcc: Document
 interconnect path
Message-ID: <ac3eJ7lGevZwElfk@hu-mdtipton-lv.qualcomm.com>
References: <20260116-milos-camcc-icc-v1-0-400b7fcd156a@fairphone.com>
 <20260116-milos-camcc-icc-v1-2-400b7fcd156a@fairphone.com>
 <20260117-efficient-fractal-sloth-aaf7c2@quoll>
 <59d9f7ff-4111-4304-a76c-40f4000545f5@oss.qualcomm.com>
 <9f8619d4-43ac-4bc0-9598-c498d59a27b8@oss.qualcomm.com>
 <acH7aEBvSbiNwhBz@hu-mdtipton-lv.qualcomm.com>
 <DHG7CMLREKDF.2L5V5VQCEYDKH@fairphone.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DHG7CMLREKDF.2L5V5VQCEYDKH@fairphone.com>
X-Proofpoint-GUID: dEVy7QzVPS_cS6_kwfC5kZhctLUVypLN
X-Authority-Analysis: v=2.4 cv=TKBIilla c=1 sm=1 tr=0 ts=69cdde2a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=W6naqKN7AAAA:8 a=hMnAP9elBZEPa_KQw-IA:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=Xp8b5NkTPdl8jt_qJiRs:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDAyNyBTYWx0ZWRfX0wzmgZNEoNB0
 45OjUw2crlrKJ2Q6kNza7ohLqQjidnfQ7fGL+EOn8CojxboekWedG2sALVkh3npilyMHnsuqkst
 LmysaM3d2pkUsu8NGwcCuApRm6nu+9XaihCyaitv4pQWPQWy3qy/KXk2JU2kYrzPTGFpO+758He
 hLQN2ZLKZGVb+AMHlWPfi4xU5HDQIFJVEc6z9MNmFpmXAtS1uUSI348QzKCz2TgEFG1X5OPReri
 lA1HHyeTkQoM/nCthIWBG3nWp3Qz15BPVUwyq5tEAEnfHr6fqPts+4noWetXK6LzhB+76+bkf2Y
 8OKgH0PLGAfYwfcdMxuKsScF2ZehFFG6Se8D/qKd9Ne90gnG57qx8ZV/xV84mZoAimBJBbuMWZq
 Ogub8ikUOfZhjfVQnLUfKDRHg9FM4a1o4inSPHLSFa5mx4GmRbCQ7a3OnsAQM+419QKa7Sx3vJy
 jwL36gAiLTLo0kdX3TA==
X-Proofpoint-ORIG-GUID: dEVy7QzVPS_cS6_kwfC5kZhctLUVypLN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-01_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020027
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-101416-lists,linux-arm-msm=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,fairphone.software:url,oss.qualcomm.com:dkim,qualcomm.com:dkim,hu-mdtipton-lv.qualcomm.com:mid];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mike.tipton@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 177EB38300D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Luca,

On Mon, Mar 30, 2026 at 04:55:40PM +0200, Luca Weiss wrote:
> Hi Mike,
> 
> On Tue Mar 24, 2026 at 3:48 AM CET, Mike Tipton wrote:
> > On Mon, Jan 19, 2026 at 11:28:07AM +0100, Konrad Dybcio wrote:
> >> 
> >> 
> >> On 1/19/26 11:20 AM, Konrad Dybcio wrote:
> >> > On 1/17/26 12:46 PM, Krzysztof Kozlowski wrote:
> >> >> On Fri, Jan 16, 2026 at 02:17:21PM +0100, Luca Weiss wrote:
> >> >>> Document an interconnect path for camcc that's required to enable
> >> >>> the CAMSS_TOP_GDSC power domain.
> >> >>
> >> >> I find it confusing. Enabling GDSC power domains is done via power
> >> >> domains, not via interconnects. Do not represent power domains as
> >> >> interconnects, it's something completely different.
> >> > 
> >> > The name of the power domains is CAMSS_TOP_GDSC (seems you misread)
> >> > 
> >> > For the power domain to successfully turn on, the MNoC needs to be
> >> > turned on (empirical evidence). The way to do it is to request a
> >> > nonzero vote on this interconnect path
> >> > 
> >> > (presumably because the GDSC or its invisible providers require
> >> > something connected over that bus to carry out their enable sequences).
> >
> > The GDSC itself shouldn't depend on MMNOC in order to turn on properly.
> > It should turn on just fine without it. There *is* a dependency between
> > CAM_TOP_GDSC and MMNOC, but it's in the opposite direction.
> 
> I can personally just write from practical experience, as Qualcomm
> doesn't share any relevant documentation with OEMs.
> 
> Without this patch the GDSC refuses to turn on.
> 
> [  291.055839] ------------[ cut here ]------------
> [  291.055860] cam_cc_camss_top_gdsc status stuck at 'off'
> [  291.055878] WARNING: drivers/clk/qcom/gdsc.c:178 at gdsc_toggle_logic+0x138/0x144, CPU#4: hexdump/1995
> 
> With the patch it turns on just fine, no issues seen.

I haven't observed that behavior, and I just reconfirmed on a more
recent chip. I explicitly toggled this GDSC on/off while MMNOC is
collapsed and it turns on fine. And if I disable MMNOC while the GDSC is
still on, then MMNOC gets stuck entering collapse. But I haven't tried
on Milos, specifically. It's possible there's some behavior unique to it
that I'm not aware of.

Regardless, the correct solution for both issues (MMNOC getting stuck
turning off or the GDSC getting stuck turning on) is the same. Which is
to vote for MMNOC on behalf of the GDSC as your patch does. And is also
what we've done downstream.

> 
> As Konrad has written, originally I didn't see any issue because that
> interconnect was being kept alive by simple-framebuffer where I've added
> 'interconnects' to keep the framebuffer alive. However when testing
> without this, the GDSC would refuse to turn on, which led me to this
> patch series.
> 
> Additionally you can see in downstream devicetree you can also see an
> interconnect defined for the "cam_cc_camss_top_gdsc" node:
> 
> https://gerrit-public.fairphone.software/plugins/gitiles/platform/vendor/qcom/proprietary/devicetree/+/refs/heads/odm/rc/target/15/fp6/fps_overlay/volcano.dtsi#2943

Right, this logic was originally added to prevent MMNOC from getting
stuck in collapse, rather than to prevent the GDSC from getting stuck
turning on.

Mike

> 
> Regards
> Luca

